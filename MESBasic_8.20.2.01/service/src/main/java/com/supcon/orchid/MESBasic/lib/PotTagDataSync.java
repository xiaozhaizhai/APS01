package com.supcon.orchid.MESBasic.lib;

import com.supcon.mlp.lib.math.Calculator;
import com.supcon.mlp.lib.math.MathUtil;
import com.supcon.mlp.lib.util.DateTime;
import com.supcon.mlp.lib.util.StringUtil;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.services.MESBasicItemSetupService;
import com.supcon.orchid.MESBasic.services.MESBasicPotDataService;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.*;

/**
 * @author xiejing
 * @version 2016-01-22
 * updated by ww 2019-05-31
 */
public class PotTagDataSync {

    private final Logger log = LoggerFactory.getLogger(getClass());

    private MESBasicPotDataService potDataService;
    private MESBasicItemSetupService itemSetupService;

    public MESBasicPotDataService getDataTransService() {
        return potDataService;
    }

    public void setDataTransService(MESBasicPotDataService potDataService) {
        this.potDataService = potDataService;
    }

    public MESBasicItemSetupService getItemSetupService() {
        return itemSetupService;
    }

    public void setItemSetupService(MESBasicItemSetupService itemSetupService) {
        this.itemSetupService = itemSetupService;
    }

    /**
     * 开关量，对于开关量，PIMS插入0时，表示关闭，插入非0值，表示开启
     */
    private final String SWITCHER = "TAG_TYPE/2";
    /**
     * 虚拟位号的计算公式中，涉及到其他的位号，每一个位号使用'[',']'包裹，例如计算公式位：[a]+[b]
     */
    private char LEFT_BRACE = '[';
    private char RIGHT_BRACE = ']';

    private final int MAX_DATA_SIZE = 500;

    public PotTagDataSync(MESBasicPotDataService potDataService,
                          MESBasicItemSetupService itemSetupService) {
        this.potDataService = potDataService;
        this.itemSetupService = itemSetupService;
    }

    /**
     * save latest processed tag value from interface table, every tag will be
     * process only once
     */
    private Hashtable<String, MESBasicPotData> processedTag;

    public void dataSync() {
        SyncDirectTag();
        SyncVirtualTag();
    }

    private Hashtable<String, MESBasicItemSetup> virtualTagTable;

    /**
     * 同步虚拟位号的数据，虚拟位号的数据是通过计算公式计算得到的。
     */
    private void SyncVirtualTag() {
        /**
         * getFactors把所有的虚拟位号先全部载入内存
         */
        virtualTagTable = new Hashtable<>();
        // [虚拟位号] + [valid] + [启用]
        String hql = "from MESBasicItemSetup where virtualTag=true and valid=true and active=true";

        Query query = itemSetupService.createQuery(hql);
        List virtualTagList = query.list();
        for (Object obj : virtualTagList) {
            MESBasicItemSetup vtag = (MESBasicItemSetup) obj;
            if (!virtualTagTable.containsKey(vtag.getCode())) {
                virtualTagTable.put(vtag.getCode(), vtag);
            }
        }

        /**
         * 遍历所有虚拟位号，并计算位号值保存到数据库
         */
        Enumeration<String> vtags = virtualTagTable.keys();
        while (vtags.hasMoreElements()) {
            String tag = vtags.nextElement();
            MESBasicItemSetup vtag = virtualTagTable.get(tag);

            TagValue vtagValue = CalculateVTagValue(vtag);
            vtag.setCrtValue(MathUtil.round(vtagValue.value, 4));
            vtag.setUpdatTime(vtagValue.datetime);

            if (!processedTag.containsKey(vtag.getCode())) {
                // 将虚拟位号的值转换成接口表格式，并放入内存，为后续的计算提供数据基础
                processedTag.put(vtag.getCode(), transfor(vtag));
            }
            itemSetupService.save(vtag);
        }

    }

    private MESBasicPotData transfor(MESBasicItemSetup vtag) {
        MESBasicPotData temp = new MESBasicPotData();
        temp.setTag(vtag.getItemNumber());
        temp.setDataTime(vtag.getUpdatTime());
        temp.setTvalue(vtag.getCrtValue());
        return temp;
    }

    /**
     * 辅助结构体
     */
    class TagValue {
        /**
         * 位号
         */
        public String tag;
        /**
         * 值
         */
        public BigDecimal value;
        /**
         * 更新时间
         */
        public Date datetime;
        /**
         * 虚拟位号对应的计算公式，这个计算公式已经是基于物理位号了
         */
        public String exprssion;
    }

    /**
     * 根据从接口表中获取到的数据，计算虚拟测点的值
     *
     * @param vtag
     * @return
     */
    private TagValue CalculateVTagValue(MESBasicItemSetup vtag) {
        String expression = vtag.getFormula();

        /**
         * 若计算公式为null, 则根据表体关联的其他直接采集到的测点, 进一步推算出虚拟测点的值
         */
        if (StringUtils.isBlank(expression) && vtag.getManuallySet()) {
            // 时间间隔
            BigDecimal compareTime = vtag.getCompareTime();
            // 比较数值
            BigDecimal compareNumber = vtag.getCompareNumber();
            return getItemSetupValueByCompareTime(vtag, compareTime, compareNumber);
        }

        List<String> factors = new ArrayList<String>();

        String baseExpression = chageToBaseTag(expression, factors);
        TagValue mathExpression = formatExpression(baseExpression, factors, vtag.getDelay());

        Calculator calc = new Calculator();
        Double result = calc.calculate(mathExpression.exprssion);
        TagValue tv = new TagValue();
        tv.tag = vtag.getCode();
        tv.value = BigDecimal.valueOf(result);
        tv.datetime = mathExpression.datetime;

        return tv;
    }

    /**
     * 将虚拟位号的计算公式转换成只有真实位号的表达式，例如虚拟位号a的计算公式是[b]+[c],其中
     * b也是虚拟位号，它的计算公式是[e]+[f],则最终对a来说，它被转换后的计算公式是([e]+[f])+[c]
     *
     * @param expression 虚拟位号的计算公式
     * @param factors    虚拟位号的计算公式被转换成由真实位号计算得到，factors就是这些真实位号的列表
     * @return
     */
    private String chageToBaseTag(String expression, List<String> factors) {
        String baseTagExpression = expression;
        int preRightBrace = 0;
        int preLeftBrace = -1;
        while ((preLeftBrace = expression.indexOf(LEFT_BRACE, preRightBrace)) != -1) {
            preRightBrace = expression.indexOf(RIGHT_BRACE, preLeftBrace);
            String factor = expression.substring(preLeftBrace + 1,
                    preRightBrace);

            if (virtualTagTable.containsKey(factor)) {
                MESBasicItemSetup tempVTag = virtualTagTable.get(factor);
                if (tempVTag != null) {
                    if (!processedTag.containsKey(factor)) {
                        // 如果公式中的计算因数是一个虚拟位号而且这个虚拟位号已经被计算过了，则不进行位号替换之后计算的时候，从内存中直接读取这个值
                        String temp = chageToBaseTag(tempVTag.getFormula(), factors);
                        baseTagExpression = baseTagExpression.replace("[" + factor + "]", "(" + temp + ")");
                    }
                }

            } else {
                if (!factors.contains(factor)) {
                    // 不是虚拟位号，则直接加入到位号列表
                    factors.add(factor);
                }
            }
        }
        return baseTagExpression;
    }

    /**
     * 将一个由位号组成的表达式，转换成真正的数学表达式，其中expression是由位号组成的表达式，
     * 这些位号的值，由SyncDirectTag()读取，存到了processedTag中
     *
     * @param expression
     * @param factorList
     * @param delay      允许时间差位delay秒的值相加
     * @return
     */
    private TagValue formatExpression(String expression, List<String> factorList, int delay) {
        int preRightBrace = 0;
        int preLeftBrace = -1;
        Date baseTime = null;

        TagValue tv = new TagValue();

        /**
         * 找到计算公式中第一个已采集到的数据，并以这个数据的时间作为基准时间，
         * 在这个时间的前后delay秒内采集到的数据为有效数据，可以在一次计算中计算
         */
        while ((preLeftBrace = expression.indexOf(LEFT_BRACE, preRightBrace)) != -1) {
            preRightBrace = expression.indexOf(RIGHT_BRACE, preLeftBrace);
            String factor = expression.substring(preLeftBrace + 1, preRightBrace);
            if (processedTag.get(factor) != null) {
                MESBasicPotData dataTrans = (MESBasicPotData) processedTag.get(factor);
                baseTime = dataTrans.getDataTime();
                break;
            }
        }
        if (baseTime == null) {
            // 如果基准时间为空，则说明改虚拟位号涉及到的真实位号都没有被采集，则返回0
            tv.exprssion = "0";
            return tv;
        }
        Date stime = DateTime.AddSecond(baseTime, -delay);
        Date etime = DateTime.AddSecond(baseTime, delay);
        for (String f : factorList) {
            MESBasicPotData dataTrans = processedTag.get(f);
            String targetValue = "0";
            if (dataTrans != null && DateTime.Between(dataTrans.getDataTime(), stime, etime)) {
                targetValue = dataTrans.getTvalue() + "";
            }
            expression = expression.replace("[" + f + "]", targetValue);
        }
        tv.datetime = baseTime;
        tv.exprssion = expression;
        return tv;
    }

    /**
     * 同步直接采集到的数据
     */
    private void SyncDirectTag() {
        if (processedTag == null) {
            processedTag = new Hashtable<>();
        } else {
            processedTag.clear();
        }

        //Date minDate = potDataService.getMinUnprocessedTime();
        String minDate = potDataService.getMinUnprocessedTimeString();
        if (minDate == null) {
            return;
        }
        // 同一分钟插入的所有数据, 在下一分钟均被识别 modified by ww 2019-04-19
        String hql = "from MESBasicPotData where valid=1 and dataTimeStr=? and (processed=false or processed=null) and (businessType.id=? or businessType=null) order by dataTimeStr asc";
        // 仅处理由PIMS直接插入的数据
        Query query = potDataService.createQuery(hql, minDate, "Business_Type/0");
        query.setMaxResults(MAX_DATA_SIZE);

        /**
         * 把最近的一批插入的数据缓存到内存，以位号-对象对存储
         */
        List rawData = query.list();
        for (Object d : rawData) {
            MESBasicPotData dataTrans = (MESBasicPotData) d;

            if (processedTag.containsKey(dataTrans.getTag())) {
                continue;
            }

            dataTrans.setProcessed(true);
            // 直接采集的数据使用tag作为key的原因是，为了允许多个测点使用同一个位号
            processedTag.put(dataTrans.getTag(), dataTrans);
            potDataService.merge(dataTrans);
            //dataTransService.saveDataTrans(dataTrans, null);
        }

        /* 查询到与采集到的数据相关的测点，并设置测点最新的采集值 */
        StringBuffer sb = new StringBuffer();
        sb.append("from MESBasicItemSetup where valid=1 and itemNumber in('-1'");
        Iterator<String> it = processedTag.keySet().iterator();
        while (it.hasNext()) {
            sb.append(",'" + it.next() + "'");
        }

        sb.append(")");

        hql = sb.toString();
        query = itemSetupService.createQuery(hql);
        List tagList = query.list();
        for (Object tag : tagList) {
            MESBasicItemSetup tagProperty = (MESBasicItemSetup) tag;
            // 位号
            String tagCode = tagProperty.getItemNumber();
            MESBasicPotData pData = processedTag.get(tagCode);
            BigDecimal value = pData.getTvalue();
            if (StringUtil.isNotEmptyOrNull(tagProperty.getFactor())) {
                String factor = tagProperty.getFactor();
                Calculator calculator = new Calculator();
                double calcResult = calculator.calculate(factor, new String[]{"n"}, new String[]{value.doubleValue() + ""});
                value = new BigDecimal(calcResult);
            }
            if (pData != null) {
                tagProperty.setCrtValue(MathUtil.round(value, 4));
                tagProperty.setUpdatTime(pData.getDataTime());
            }
            /*
             * 将数值按照测点编码-数值对形势存入内存，后续的虚拟位号的计算功能是基于编码，不是基于位号的
             */
            if (!processedTag.containsKey(tagProperty.getCode())) {
                processedTag.put(tagProperty.getCode(), pData);
            }
            itemSetupService.save(tagProperty);
        }
    }

    /**
     * 根据测点编码和时间获取测点值
     *
     * @param itemSetup 测点编码
     * @param interval  比较时间
     * @param comparing 比较数值
     * @return java.math.BigDecimal
     * @author wangwei
     * @date 2019/5/9 14:05
     */
    private TagValue getItemSetupValueByCompareTime(MESBasicItemSetup itemSetup, BigDecimal interval, BigDecimal comparing) {
        // 根据测点表头ID获取相关测点
        List<MESBasicItemPart> relatedItemSetups = itemSetupService.getRelatedItemSetups(itemSetup.getId());

        /**
         * itemA[nowValue, beforeValue, levelStatus]
         * 分别对应: 当前值, n分钟前的值  , 测点状态值
         */
        List<BigDecimal> itemA = new ArrayList<>();
        List<BigDecimal> itemB = new ArrayList<>();
        // 计数器
        int count = 0;

        Date dateTime = null;

        for (MESBasicItemPart relatedItemSetup : relatedItemSetups) {
            if (relatedItemSetup.getItemView() == null) {
                continue;
            }
            if (relatedItemSetup.getItemStatus() == null) {
                continue;
            }

            // 根据测点ID重新查一遍 - added by ww 2019-05-31
            MESBasicItemSetup item = itemSetupService.getItemSetup(relatedItemSetup.getItemView().getId());
            // 修正公式
            String factor = item.getFactor();
            // 状态(上升/下降)
            String itemStatus = relatedItemSetup.getItemStatus().getId();
            // 关联测点的生产位号
            String itemNumber = item.getItemNumber();
            // 关联测点的更新时间
            Date updatTime = item.getUpdatTime();
            dateTime = updatTime;
            // 当前值
            BigDecimal nowValue = item.getCrtValue();
            // n分钟前的值
            BigDecimal beforeValue = potDataService.getTagValueByUpdateTime(itemNumber, updatTime, interval, factor);

            log.info("[getItemSetupValueByCompareTime]生产位号:" + itemNumber + ", 当前值:" + nowValue);
            log.info("[getItemSetupValueByCompareTime]生产位号:" + itemNumber + ", " + interval + "分钟前的值:" + beforeValue);

            if (count == 0) {
                if (nowValue != null) {
                    itemA.add(nowValue);
                }
                if (beforeValue != null) {
                    itemA.add(beforeValue);
                }

                if ("MESBasic_referPointStatus/levelUp".equals(itemStatus)) {
                    itemA.add(BigDecimal.ONE);
                } else {
                    itemA.add(new BigDecimal("-1"));
                }

            } else {
                if (nowValue != null) {
                    itemB.add(nowValue);
                }
                if (beforeValue != null) {
                    itemB.add(beforeValue);
                }

                if ("MESBasic_referPointStatus/levelUp".equals(itemStatus)) {
                    itemB.add(BigDecimal.ONE);
                } else {
                    itemB.add(new BigDecimal("-1"));
                }

            }

            count++;
        }

        // 计算虚拟测点的值
        BigDecimal result = getItemSetupValueByCompareLevel(itemA, itemB, comparing);
        TagValue tv = new TagValue();
        tv.tag = itemSetup.getCode();
        tv.value = result;
        if (dateTime == null) {
            tv.datetime = new Date();
        }
        tv.datetime = dateTime;

        return tv;
    }

    /**
     * 根据测点编码和上升下降数值判断开关测点值
     *
     * @param itemA     测点A的当前值、n分钟前的值和测点状态
     * @param itemB     测点B的当前值、n分钟前的值和测点状态
     * @param comparing 比较数值
     * @return java.math.BigDecimal
     * @author wangwei
     * @date 2019/5/9 14:05
     */
    private BigDecimal getItemSetupValueByCompareLevel(List<BigDecimal> itemA, List<BigDecimal> itemB, BigDecimal comparing) {
        log.info("[getItemSetupValueByCompareLevel]comparing=" + comparing + ",itemA.size()=" + itemA.size() + ",itemB.size()=" + itemB.size());

        /**
         * 含有两个关联测点的情况
         */
        if (itemA.size() == 3 && itemB.size() == 3) {

            // A测点的当前值、n分钟前的值、测点状态
            BigDecimal a_now = itemA.get(0);
            BigDecimal a_before = itemA.get(1);
            BigDecimal a_status = itemA.get(2);

            // B测点的当前值、n分钟前的值、测点状态
            BigDecimal b_now = itemB.get(0);
            BigDecimal b_before = itemB.get(1);
            BigDecimal b_status = itemB.get(2);

            log.info("[getItemSetupValueByCompareLevel]含有两个关联测点: a_now=" + a_now + ",a_before=" + a_before + ";b_now=" + b_now + ",b_before=" + b_before);

            boolean a_flag = false;
            boolean b_flag = false;
            if (comparing != null) {
                // a液位当前值与之前值的差
                BigDecimal a_differ = a_now.subtract(a_before);
                if (a_status.intValue() == 1) {
                    // a状态为上升并且当前液位值大于n分钟前的液位值
                    if (a_differ.compareTo(BigDecimal.ZERO) == 1) {
                        a_flag = a_differ.compareTo(comparing) == -1 ? false : true;
                    }

                } else {
                    // a状态为下降并且当前液位值小于n分钟前的液位值
                    if (a_differ.compareTo(BigDecimal.ZERO) == -1) {
                        a_flag = a_differ.abs().compareTo(comparing) == -1 ? false : true;
                    }

                }

                // b液位当前值与之前值的差
                BigDecimal b_differ = b_now.subtract(b_before);
                if (b_status.intValue() == 1) {
                    // b状态为上升并且当前液位值大于n分钟前的液位值
                    if (b_differ.compareTo(BigDecimal.ZERO) == 1) {
                        b_flag = b_differ.compareTo(comparing) == -1 ? false : true;
                    }

                } else {
                    // b状态为下降并且当前液位值小于n分钟前的液位值
                    if (b_differ.compareTo(BigDecimal.ZERO) == -1) {
                        b_flag = b_differ.abs().compareTo(comparing) == -1 ? false : true;
                    }

                }

                // a、b两个液位同时满足配置的条件时, 返回1; 否则返回0
                if (a_flag && b_flag) {
                    return BigDecimal.ONE;
                } else {
                    return BigDecimal.ZERO;
                }
            }
        }

        /**
         * 含有一个关联测点的情况
         */
        if (itemA.size() == 3 && itemB.size() == 0) {
            // 当前值
            BigDecimal now = itemA.get(0);
            // n分钟前的值
            BigDecimal before = itemA.get(1);
            // 测点状态
            BigDecimal status = itemA.get(2);

            log.info("[getItemSetupValueByCompareLevel]仅含有一个关联测点: a_now=" + now);

            if (comparing != null) {

                BigDecimal differ = now.subtract(before);

                if (status.intValue() == 1) {
                    // 状态为上升并且当前液位值大于n分钟前的液位值
                    if (differ.compareTo(BigDecimal.ZERO) == 1) {
                        /**
                         * 当前液位值与之前液位值的差小于比较数值, 返回0;
                         * 当前液位值与之前液位值的差大于等于比较数值, 返回1
                         */
                        return differ.compareTo(comparing) == -1 ? BigDecimal.ZERO : BigDecimal.ONE;
                    }

                } else {
                    // 状态为下降并且当前液位值小于n分钟前的液位值
                    if (differ.compareTo(BigDecimal.ZERO) == -1) {
                        /**
                         * 当前液位值与之前液位值的差小于比较数值, 返回0;
                         * 当前液位值与之前液位值的差大于等于比较数值, 返回1
                         */
                        return differ.abs().compareTo(comparing) == -1 ? BigDecimal.ZERO : BigDecimal.ONE;
                    }

                }
            }
        }
        return null;
    }


}
