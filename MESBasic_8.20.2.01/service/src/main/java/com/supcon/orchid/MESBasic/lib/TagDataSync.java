package com.supcon.orchid.MESBasic.lib;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;

import com.supcon.mlp.lib.util.DateTime;
import com.supcon.mlp.lib.util.StringUtil;
import com.supcon.orchid.MESBasic.daos.MESBasicDataTransDao;
import com.supcon.orchid.MESBasic.daos.MESBasicItemSetupDao;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.services.MESBasicDataTransService;
import com.supcon.orchid.MESBasic.services.MESBasicItemSetupService;
import com.supcon.mlp.lib.math.Calculator;
import com.supcon.mlp.lib.math.MathUtil;
/**
 * 
 * @author malipeng
 * @version 2014-11-07
 */
public class TagDataSync {

	private MESBasicDataTransService dataTransService;
	private MESBasicItemSetupService itemSetupService;

	/**
	 * 开关量，对于开关量，PIMS插入0时，表示关闭，插入非0值，表示开启
	 */
	private final String SWITCHER = "TAG_TYPE/2";
	/*
	 * 虚拟位号的计算公式中，涉及到其他的位号，每一个位号使用'[',']'包裹，例如计算公式位：[a]+[b]
	 */
	private char LEFT_BRACE = '[';
	private char RIGHT_BRACE = ']';

	private final int MAX_DATA_SIZE = 500;
	public TagDataSync(MESBasicDataTransService dataTransService,
			MESBasicItemSetupService itemSetupService) {
		this.dataTransService = dataTransService;
		this.itemSetupService = itemSetupService;
	}

	/**
	 * save latest processed tag value from interface table, every tag will be
	 * process only once
	 */
	private Hashtable<String, MESBasicDataTrans> processedTag;

	public void dataSync() {
		SyncDirectTag();
		SyncVirtualTag();
	}

	private Hashtable<String, MESBasicItemSetup> virtualTagTable;

	/*
	 * 同步虚拟位号的数据，虚拟位号的数据是通过计算公式计算得到的。
	 */
	private void SyncVirtualTag() {
		/*
		 * getFactors把所有的虚拟位号先全部载入内存
		 */
		virtualTagTable = new Hashtable<String, MESBasicItemSetup>();
		String hql = "from MESBasicItemSetup where virtualTag=true";
		
		Query query = itemSetupService.createQuery(hql);
		List virtualTagList = query.list();
		for (Object obj : virtualTagList) {
			MESBasicItemSetup vtag = (MESBasicItemSetup) obj;
			if (!virtualTagTable.containsKey(vtag.getCode())) {
				virtualTagTable.put(vtag.getCode(), vtag);
			}
		}

		/*
		 * 遍历所有虚拟位号，并计算位号值保存到数据库
		 */
		Enumeration<String> vtags = virtualTagTable.keys();
		while (vtags.hasMoreElements()) {
			String tag = vtags.nextElement();
			MESBasicItemSetup vtag = virtualTagTable.get(tag);

			TagValue vtagValue = CalculateVTagValue(vtag);
			vtag.setCrtValue(MathUtil.round(vtagValue.value, 4));
			vtag.setUpdatTime(vtagValue.datetime);

			if(!processedTag.containsKey(vtag.getCode())){				
				processedTag.put(vtag.getCode(), transfor(vtag));//将虚拟位号的值转换成接口表格式，并放入内存，为后续的计算提供数据基础
			}
			itemSetupService.save(vtag);
		}

	}

	private MESBasicDataTrans transfor(MESBasicItemSetup vtag) {
		MESBasicDataTrans temp = new MESBasicDataTrans();
		temp.setTag(vtag.getItemNumber());
		temp.setDataTime(vtag.getUpdatTime());
		temp.setTvalue(vtag.getCrtValue());
		return temp;
	}

	/*
	 * 辅助结构体，
	 */
	class TagValue {
		public String tag;// 位号
		public BigDecimal value;// 值
		public Date datetime;// 更新时间
		public String exprssion;//虚拟位号对应的计算公式，这个计算公式已经是基于物理位号了
	}

	/*
	 * 根据从接口表中获取到的数据，计算虚拟测点的值
	 */
	private TagValue CalculateVTagValue(MESBasicItemSetup vtag) {
		String expression = vtag.getFormula();
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
	 * @param expression
	 *            虚拟位号的计算公式
	 * @param factors
	 *            虚拟位号的计算公式被转换成由真实位号计算得到，factors就是这些真实位号的列表
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
					if(!processedTag.containsKey(factor)){//如果公式中的计算因数是一个虚拟位号而且这个虚拟位号已经被计算过了，则不进行位号替换之后计算的时候，从内存中直接读取这个值
						String temp = chageToBaseTag(tempVTag.getFormula(), factors);
						baseTagExpression = baseTagExpression.replace("[" + factor+ "]", "(" + temp + ")");
					}
				}

			} else {
				if (!factors.contains(factor)) {
					factors.add(factor);// 不是虚拟位号，则直接加入到位号列表
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
	 * @param delay
	 *            允许时间差位delay秒的值相加
	 * @return
	 */
	private TagValue formatExpression(String expression, List<String> factorList, int delay) {
		int preRightBrace = 0;
		int preLeftBrace = -1;
		Date baseTime = null;
		
		TagValue tv = new TagValue();
		
		/*
		 * 找到计算公式中第一个已采集到的数据，并以这个数据的时间作为基准时间，在这个时间的前后delay秒内采集到的
		 * 数据为有效数据，可以在一次计算中计算
		 */
		while ((preLeftBrace = expression.indexOf(LEFT_BRACE, preRightBrace)) != -1) {
			preRightBrace = expression.indexOf(RIGHT_BRACE, preLeftBrace);
			String factor = expression.substring(preLeftBrace + 1, preRightBrace);
			if (processedTag.get(factor) != null) {
				MESBasicDataTrans dataTrans = (MESBasicDataTrans) processedTag.get(factor);
				baseTime = dataTrans.getDataTime();
				break;
			}
		}
		if (baseTime == null) {// 如果基准时间为空，则说明改虚拟位号涉及到的真实位号都没有被采集，则返回0
			tv.exprssion = "0";
			return tv;
		}
		Date stime = DateTime.AddSecond(baseTime, -delay);
		Date etime = DateTime.AddSecond(baseTime, delay);
		for (String f : factorList) {
			MESBasicDataTrans dataTrans = (MESBasicDataTrans) processedTag.get(f);
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

	/*
	 * 直接采集到的数据
	 */
	private void SyncDirectTag() {
		if (processedTag == null) {
			processedTag = new Hashtable<String, MESBasicDataTrans>();
		} else {
			processedTag.clear();
		}
		
	Date minDate = dataTransService.getMinUnprocessedTime();
		
		String hql = "from MESBasicDataTrans where valid=1 and dataTime=? and (processed=false or processed=null) and (businessType.id=? or businessType=null) order by dataTime asc";
		// 仅处理由PIMS直接插入的数据
	    Query query = dataTransService.createQuery(hql,minDate, "Business_Type/0");
		query.setMaxResults(MAX_DATA_SIZE);
		/*
		 * 把最近的一批插入的数据缓存到内存，以位号-对象对存储
		 */
		List rawData = query.list();
		for (Object d : rawData) {
			MESBasicDataTrans dataTrans = (MESBasicDataTrans) d;
			
			if (processedTag.containsKey(dataTrans.getTag())) {
				continue;
			}
			
			dataTrans.setProcessed(true);
			processedTag.put(dataTrans.getTag(), dataTrans);//直接采集的数据使用tag作为key的原因是，为了允许多个测点使用同一个位号
			dataTransService.merge(dataTrans);
			//dataTransService.saveDataTrans(dataTrans, null);
		}

		/*
		 * 查询到与采集到的数据相关的测点，并设置测点最新的采集值
		 */
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
			String tagCode = tagProperty.getItemNumber();// 位号
			MESBasicDataTrans pData = processedTag.get(tagCode);
			BigDecimal value = pData.getTvalue();
			if(StringUtil.isNotEmptyOrNull(tagProperty.getFactor())){
				String factor = tagProperty.getFactor();
				Calculator calculator = new Calculator();
				double calcResult = calculator.calculate(factor, new String[]{"n"}, new String[]{value.doubleValue()+""});
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

	public MESBasicDataTransService getDataTransService() {
		return dataTransService;
	}

	public void setDataTransService(MESBasicDataTransService dataTransService) {
		this.dataTransService = dataTransService;
	}

	public MESBasicItemSetupService getItemSetupService() {
		return itemSetupService;
	}

	public void setItemSetupService(MESBasicItemSetupService itemSetupService) {
		this.itemSetupService = itemSetupService;
	}
}
