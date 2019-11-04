package com.supcon.orchid.WOM.services.impl;

import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.services.MESBasicWareService;
import com.supcon.orchid.WOM.entities.*;
import com.supcon.orchid.WOM.sapWs.ZFGMMNSHMES;
import com.supcon.orchid.WOM.services.*;
import com.supcon.orchid.WOM.POJO.*;
import com.supcon.orchid.WOM.services.impl.utils.*;
import com.supcon.orchid.services.ConsulService;
import org.apache.commons.lang3.StringUtils;
import org.apache.cxf.binding.soap.SoapMessage;
import org.apache.cxf.binding.soap.interceptor.AbstractSoapInterceptor;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.frontend.ClientProxy;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.cxf.message.Message;

import org.apache.cxf.interceptor.Fault;
import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 调用SAP系统
 */
@Service("womMesToSapService")
@Transactional
public class WomMesToSapServiceImpl implements WomMesToSapService {
    private static final Logger logger = LoggerFactory.getLogger(WomMesToSapServiceImpl.class);
    private static final String DATETIME_PATTERN = "yyyyMMdd";
    private static final String WS_URL = "/sap/bc/srt/rfc/sap/zfg_mm_nshmes/300/zfg_mm_nshmes/zfg_mm_nshmes?sap-language=ZH";
    private static final long TIMEOUT_MINS = 10000L; // ws过期时间
    private static final String FLAG = "flag";
    private static final String MES = "mes";
    private static final String DOCUMENT = "DOCUMENT";
    private static final String ROOT = "ROOT";
    private static final String TYPE_SUCCESS = "S";

    @Autowired
    private WOMTaskReportingService womTaskReportingService;

    @Autowired
    private WOMTaskReportingPartService womTaskReportingPartService;

    @Autowired
    private WOMPutInMaterialPartService womPutInMaterialPartService;

    @Autowired
    private WOMPrepareMaterialService womPrepareMaterialService;

    @Autowired
    private WOMPrepareMaterialPartService womPrepareMaterialPartService;

    @Autowired
    private MESBasicWareService mesBasicWareService;

    @Autowired
    private MESBasicProductService mesBasicProductService;

    @Resource
    private ConsulService consulService;

    @Override
    public List<WOMStandingcropRef> getStockInfo(String materialCode, String wareCode, String batchNum) {
        logger.info("getStockInfo -start");
        // 封装请求参数
        StockInfo stockInfo = convertStockInfo(materialCode, wareCode, batchNum);
        String requestBody = XmlMapUtil.convertListToXml(Arrays.asList(stockInfo), DOCUMENT, ROOT);
        logger.info("requestBody: {}", requestBody);
        // 请求ws，获取库存信息
        String response;
        try {
            response = getClient().zfmMMNSHMES001(requestBody);
            logger.info("response: {}", response);
        } catch (Exception e) {
            logger.error("getStockInfo - error", e);
            response = "";
        }
        if (StringUtils.isBlank(response)) {
            return new ArrayList<>();
        }
        // 将xml转换为对象
        List<WOMStandingcropRef> parts = new ArrayList<>();
        try {
            List<StockInfo> stockInfos = XmlMapUtil.convertXmlToList(response, StockInfo.class, DOCUMENT, ROOT);
            for (StockInfo info : stockInfos) {
                WOMStandingcropRef womStandingcropRef = new WOMStandingcropRef();
                List<MESBasicProduct> products = mesBasicProductService.findProductsByHql("from " + MESBasicProduct.JPA_NAME + " where productCode = ?", info.getMATNR());
                if (products.size() == 1) {
                    womStandingcropRef.setGood(products.get(0));
                } else {
                    MESBasicProduct product = new MESBasicProduct();
                    product.setProductCode(info.getMATNR());
                    product.setId(0L);
                    womStandingcropRef.setGood(product);
                }
                List<MESBasicWare> wares = mesBasicWareService.findWaresByHql("from " + MESBasicWare.JPA_NAME + " where wareCode = ?", info.getLGORT());
                if (wares.size() == 1) {
                    womStandingcropRef.setWareID(wares.get(0));
                }
                womStandingcropRef.setAvailiQuantity(BigDecimal.valueOf(Double.parseDouble(info.getLABST())));
                womStandingcropRef.setBatchText(info.getCHARG());
                parts.add(womStandingcropRef);
            }
        } catch (Exception e) {
            logger.error("getStockInfo - error", e);
            return new ArrayList<>();
        }
        logger.info("getStockInfo -end");
        return parts;
    }

    @Override
    public Map<String, String> prepareMaterialOutgo(String id) {
        logger.info("prepareMaterialOutgo -start");
        HashMap<String, String> resultMap = new HashMap<>(2);
        // 根据备料单id获取备料单与备料明细
        List<WOMPrepareMaterial> womPrepareMaterials = womPrepareMaterialService.findPrepareMaterialsByHql("from " + WOMPrepareMaterial.JPA_NAME + " where id = ?", Long.valueOf(id));
        if (womPrepareMaterials.size() == 0) {
            logger.error("prepareMaterialOutgo - 配料单不存在,id={}", id);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "配料单不存在");
            return resultMap;
        }
        // 会筛去数量为0的物料
        WOMPrepareMaterial womPrepareMaterial = womPrepareMaterials.get(0);
        List<WOMPrepareMaterialPart> womPrepareMaterialParts = womPrepareMaterialPartService.findPrepareMaterialPartsByHql("from " + WOMPrepareMaterialPart.JPA_NAME + " where formulaId = ? and useNum != 0 and valid = true", womPrepareMaterial);
        if (womPrepareMaterialParts.size() == 0) {
            logger.error("prepareMaterialOutgo - 配料单明细不存在,id={}", id);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "配料单明细不存在");
            return resultMap;
        }
        if (womPrepareMaterial.getBackFlag() == null || !womPrepareMaterial.getBackFlag()) {
            // 如果是领料，判断物料是否满足SAP现存量
            for (WOMPrepareMaterialPart womPrepareMaterialPart : womPrepareMaterialParts) {
                String productCode = womPrepareMaterialPart.getProductId().getProductCode();
                List<WOMStandingcropRef> standingcropRefs = getStockInfo(productCode, null, null);
                if (standingcropRefs == null || standingcropRefs.size() == 0) {
                    logger.error("prepareMaterialOutgo - 物料编号[" + productCode + "]在SAP的现存量不足");
                    resultMap.put(FLAG, "false");
                    resultMap.put(MES, "物料编号[" + productCode + "]在SAP库的现存量不足");
                    return resultMap;
                }
                boolean isSatisfied = false;
                for (WOMStandingcropRef standingcropRef : standingcropRefs) {
                    if (standingcropRef.getAvailiQuantity().compareTo(womPrepareMaterialPart.getUseNum()) >= 0) {
                        isSatisfied = true;
                        break;
                    }
                }
                if (!isSatisfied) {
                    logger.error("prepareMaterialOutgo - 物料编号[" + productCode + "]在SAP的现存量不足");
                    resultMap.put(FLAG, "false");
                    resultMap.put(MES, "物料编号[" + productCode + "]在SAP库的现存量不足");
                    return resultMap;
                }
            }
        }
        // 封装成所需对象
        List<SAPMaterial> sapMaterials = convertMaterial(womPrepareMaterial, womPrepareMaterialParts);
        logger.info("sapMaterials: {}", sapMaterials);
        String xml = XmlMapUtil.convertListToXml(sapMaterials, DOCUMENT, ROOT);
        logger.info("prepareMaterialOutgo - requestBody :{}", xml);
        try {
            String response = getClient().zfmMMNSHMES003(xml);
            logger.info("prepareMaterialOutgo - response: {}", response);
            List<SAPResponse> list = XmlMapUtil.convertXmlToList(response, SAPResponse.class, DOCUMENT, ROOT);
            if (list.size() == 0){
                resultMap.put(FLAG, "false");
                resultMap.put(MES, "调用SAP外部接口失败");
                return resultMap;
            }
            if (!TYPE_SUCCESS.equals(list.get(0).getTYPE())) {
                resultMap.put(FLAG, "false");
                resultMap.put(MES, list.get(0).getMESSAGE());
                return resultMap;
            }
        } catch (Exception e) {
            logger.error("prepareMaterialOutgo - error", e);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "调用SAP外部接口失败");
            return resultMap;
        }
        resultMap.put(FLAG, "true");
        resultMap.put(MES, "sap领料成功");
        logger.info("prepareMaterialOutgo -end");
        return resultMap;
    }


    @Override
    public void scheduleInventory() {
        logger.info("scheduleInventory -start");
        // 获取上月开始时间
        Calendar start = Calendar.getInstance();
        start.add(Calendar.MONTH, -1);
        start.set(Calendar.DAY_OF_MONTH, 1);
        start.set(Calendar.HOUR_OF_DAY, 00);
        start.set(Calendar.MINUTE, 00);
        start.set(Calendar.SECOND, 00);

        // 获取上月结束时间
        Calendar end = Calendar.getInstance();
        end.set(Calendar.DAY_OF_MONTH, 1);
        end.add(Calendar.DATE, -1);
        start.set(Calendar.HOUR_OF_DAY, 23);
        start.set(Calendar.MINUTE, 59);
        start.set(Calendar.SECOND, 59);

        // 平账列表
        List<SAPMaterial> sapMaterials = new ArrayList<>();

        // 获取上月创建的生效的备料明细
        List<WOMPrepareMaterialPart> prepareMaterialPart = womPrepareMaterialPartService.findPrepareMaterialPartsByHql("from " + WOMPrepareMaterialPart.JPA_NAME + " where createTime >= ? and createTime <= ?", start.getTime(), end.getTime());

        List<WOMPrepareMaterialPart> prepareMaterialParts = new ArrayList<>();
        // 跳过未生效的，或者物料批号重复的
        for (int i = 0; i < prepareMaterialPart.size(); i++) {
            if (prepareMaterialPart.get(i).getFormulaId().getStatus() != 99) {
                continue;
            }
            boolean flag = true;
            for (int j = 0; j < prepareMaterialParts.size(); j++) {
                if (prepareMaterialPart.get(i).getBatchNum().equals(prepareMaterialParts.get(j).getBatchNum())) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                prepareMaterialParts.add(prepareMaterialPart.get(i));
            }
        }

        for (int i = 0; i < prepareMaterialParts.size(); i++) {
            // 根据物料批号获取上月已投量
            List<WOMPutInMaterialPart> putInMaterialParts = womPutInMaterialPartService.findPutInMaterialPartsByHql("from " + WOMPutInMaterialPart.JPA_NAME + " where createTime >= ? and createTime <= ? and batchNum = ?", start.getTime(), end.getTime(), prepareMaterialParts.get(i).getBatchNum());
            BigDecimal sum = new BigDecimal("0");
            for (int j = 0; j < putInMaterialParts.size(); j++) {
                // 跳过未生效的
                if (putInMaterialParts.get(j).getHeadId().getStatus() != 99) {
                    continue;
                }
                // 将使用量相加
                sum = sum.add(putInMaterialParts.get(j).getUseNum());
            }
            // 判断sum是否小于备料的，如果是，则加入平账列表
            if (sum.compareTo(prepareMaterialParts.get(i).getUseNum()) < 0) {
                prepareMaterialParts.get(i).setUseNum(sum.subtract(prepareMaterialParts.get(i).getUseNum()));
                prepareMaterialParts.get(i).getProductId().setUnit(prepareMaterialParts.get(i).getProductId().getProductBaseUnit().getCode());
                sapMaterials.addAll(convertMaterial(prepareMaterialParts.get(i).getFormulaId(), Collections.singletonList(prepareMaterialParts.get(i))));
            }
        }
        if (sapMaterials.size() == 0) {
            logger.info("prepareMaterialOutgo -end");
            return;
        }

        String xml = XmlMapUtil.convertListToXml(sapMaterials, DOCUMENT, ROOT);
        logger.info("scheduleInventory - requestBody: {}", xml);
        try {
            String response = getClient().zfmMMNSHMES003(xml);
            logger.info("prepareMaterialOutgo - response: {}", response);
            List<SAPResponse> list = XmlMapUtil.convertXmlToList(response, SAPResponse.class, DOCUMENT, ROOT);
            if (list.size() == 0){
                logger.error("prepareMaterialOutgo - error {}", "调用SAP外部接口失败");
            } else if (!TYPE_SUCCESS.equals(list.get(0).getTYPE())) {
                logger.error("prepareMaterialOutgo - error {}", list.get(0).getMESSAGE());
            }
        } catch (Exception e) {
            logger.error("prepareMaterialOutgo - error", e);
        }
        logger.info("prepareMaterialOutgo -end");
    }

    @Override
    public Map<String, String> flat(String xml) {
        logger.info("flat -start");
        logger.info("flat - requestBody :{}", xml);
        Map<String, String> result = new HashMap<>();
        try {
            String response = getClient().zfmMMNSHMES003(xml);
            logger.info("flat - response: {}", response);
            List<SAPResponse> list = XmlMapUtil.convertXmlToList(response, SAPResponse.class, DOCUMENT, ROOT);
            if (list.size() == 0){
                logger.error("flat - 调用SAP外部接口失败");
                result.put("flag", "false");
                result.put("data", response);
                result.put("message", "调用SAP外部接口失败");
                return result;
            }
            if (!TYPE_SUCCESS.equals(list.get(0).getTYPE())) {
                logger.error("flat - 调用SAP外部接口失败：" + list.get(0).getMESSAGE());
                result.put("flag", "false");
                result.put("data", response);
                result.put("message", "调用SAP外部接口失败：" + list.get(0).getMESSAGE());
                return result;
            }
        } catch (Exception e) {
            logger.error("flat - 调用SAP外部接口失败", e);
            result.put("flag", "false");
            result.put("message", "调用SAP外部接口失败：" + e.getMessage());
            return result;
        }
        logger.info("flat - 领料成功 - end");
        result.put("flag", "true");
        return result;
    }

    @Override
    public Map<String, String> writeOff(String id) {
        logger.info("writeOff -start");
        HashMap<String, String> resultMap = new HashMap<>(2);
        // 根据报工单id获取报工单
        List<WOMTaskReporting> taskReports = womTaskReportingService.findTaskReportingsByHql("from " + WOMTaskReporting.JPA_NAME + " where id = ? ", Long.valueOf(id));
        if (taskReports == null || taskReports.size() != 1) {
            logger.error("saveProduct - 报工单不存在,id={}", id);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "报工单不存在");
            return resultMap;
        }
        // 判断报工单是否已经入库
        WOMTaskReporting womTaskReporting = taskReports.get(0);
        if (womTaskReporting.getProof() == null) {
            logger.error("saveProduct - 报工单未入库，无法冲销,id={}", id);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "报工单未入库，无法冲销");
            return resultMap;
        }
        // 封装成所需对象
        List<SAPWriteOff> sapWriteOffs = new ArrayList<>(1);
        sapWriteOffs.add(new SAPWriteOff(womTaskReporting.getProof(), womTaskReporting.getProofNum()));
        logger.info("sapWriteOffs: {}", sapWriteOffs);
        // 将所需对象转换为一个xml
        String xml = XmlMapUtil.convertListToXml(sapWriteOffs, DOCUMENT, ROOT);
        // 调用ws，将物料发送给SAP
        logger.info("sapWriteOffs - requestBody: {}", xml);
        try {
            String response = getClient().zfmMMNSHMES005(xml);
            logger.info("sapWriteOffs - response: {}", response);
            List<SAPResponse> list = XmlMapUtil.convertXmlToList(response, SAPResponse.class, DOCUMENT, ROOT);

            if (list.size() == 0){
                resultMap.put(FLAG, "false");
                resultMap.put(MES, "调用SAP外部接口失败");
                return resultMap;
            }
            SAPResponse sapResponse = list.get(0);
            if (sapResponse.getMBLNR() == null) {
                resultMap.put(FLAG, "false");
                resultMap.put(MES, sapResponse.getMESSAGE());
                return resultMap;
            }

            if (!TYPE_SUCCESS.equals(sapResponse.getTYPE())) {
                resultMap.put(FLAG, "false");
                resultMap.put(MES, sapResponse.getMESSAGE());
                return resultMap;
            }
        } catch (Exception e) {
            logger.error("sapWriteOffs - error", e);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "调用SAP外部接口失败");
            return resultMap;
        }
        resultMap.put(FLAG, "true");
        resultMap.put(MES, "冲销成功");
        logger.info("writeOff -end");
        return resultMap;
    }

    @Override
    public Map<String, String> saveProduct(String id) {
        logger.info("saveProduct -start");
        HashMap<String, String> resultMap = new HashMap<>(2);

        // 根据报工单id获取报工单
        List<WOMTaskReporting> taskReports = womTaskReportingService.findTaskReportingsByHql("from " + WOMTaskReporting.JPA_NAME + " where id = ? ", Long.valueOf(id));
        if (taskReports == null || taskReports.size() != 1) {
            logger.error("saveProduct - 报工单不存在,id={}", id);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "报工单不存在");
            return resultMap;
        }
        Boolean backFlag = taskReports.get(0).getBackFlag();
        // 获取报工单明细
        WOMTaskReporting taskReporting = taskReports.get(0);
        List<WOMTaskReportingPart> parts = womTaskReportingPartService.findTaskReportingPartsByHql("from " + WOMTaskReportingPart.JPA_NAME + " where headId = ? ", taskReporting);
        if (parts.size() == 0) {
            logger.error("saveProduct - 报工明细不存在,id={}", id);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "报工明细不存在");
            return resultMap;
        }
        // 封装成所需对象
        List<SAPProduct> sapProducts = convertProduct(parts,backFlag);
        logger.info("sapProducts: {}", sapProducts);
        // 将所需对象转换为一个xml
        String xml = XmlMapUtil.convertListToXml(sapProducts, DOCUMENT, ROOT);
        // 调用ws，将物料发送给SAP
        logger.info("saveProduct - requestBody: {}", xml);
        try {
            String response = getClient().zfmMMNSHMES004(xml);
            logger.info("saveProduct - response: {}", response);
            List<SAPResponse> list = XmlMapUtil.convertXmlToList(response, SAPResponse.class, DOCUMENT, ROOT);
            if (list.size() == 0){
                resultMap.put(FLAG, "false");
                resultMap.put(MES, "调用SAP外部接口失败");
                return resultMap;
            }
            SAPResponse sapResponse = list.get(0);
            if (!TYPE_SUCCESS.equals(sapResponse.getTYPE())) {
                resultMap.put(FLAG, "false");
                resultMap.put(MES, sapResponse.getMESSAGE());
                return resultMap;
            }
            // 将凭证与凭证编号保存到报工单中
            taskReporting.setProof(sapResponse.getMBLNR());
            taskReporting.setProofNum(sapResponse.getZEILE());
            womTaskReportingService.saveTaskReporting(taskReporting, null);
        } catch (Exception e) {
            logger.error("saveProduct - error", e);
            resultMap.put(FLAG, "false");
            resultMap.put(MES, "调用SAP外部接口失败");
            return resultMap;
        }
        resultMap.put(FLAG, "true");
        resultMap.put(MES, "生产订单收货上传成功");
        logger.info("saveProduct -end");
        return resultMap;
    }

    /**
     * 将备料单封装成SAP所需格式
     * @param material 备料单
     * @param parts 备料单内物料列表
     * @return SAP领料单列表
     */
    private List<SAPMaterial> convertMaterial(WOMPrepareMaterial material, List<WOMPrepareMaterialPart> parts) {
        List<SAPMaterial> sapMaterials = new ArrayList<>(parts.size());
        SimpleDateFormat sdf = new SimpleDateFormat(DATETIME_PATTERN);
        String now = sdf.format(new Date());
        for (WOMPrepareMaterialPart part : parts) {
            SAPMaterial temp = new SAPMaterial();
            temp.setBUDAT(now);
            temp.setBLDAT(now);
            temp.setMATNR(part.getProductId().getProductCode());
            if (part.getWare() != null) {
                temp.setLGORT(part.getWare().getWareCode());
            }
            temp.setCHARG(part.getBatchNum());
            // 判断是否是退料
            temp.setMENGE((material.getBackFlag() != null && material.getBackFlag()) ? part.getUseNum().negate().toString() : part.getUseNum().toString());
            temp.setMEINS(part.getProductId().getProductBaseUnit().getCode());
            temp.setAUFNR(material.getManulOrderMain().getManulOrderNum());
            temp.setSOBKZ(part.getEdition());
            temp.setZNBBH(material.getIncode());
            temp.setZCKDH(material.getOutCode());
            temp.setZLYRY(material.getCreateStaff().getName());
            sapMaterials.add(temp);
        }
        return sapMaterials;
    }

    /**
     * 将报工单封装成SAP所需格式
     * @param parts 报工单明细
     * @return SAP报工单列表
     */
    private List<SAPProduct> convertProduct(List<WOMTaskReportingPart> parts,Boolean backFlag) {
        List<SAPProduct> products = new ArrayList<>(parts.size());
        SimpleDateFormat sdf = new SimpleDateFormat(DATETIME_PATTERN);
        String now = sdf.format(new Date());
        for (WOMTaskReportingPart part : parts) {
            SAPProduct temp = new SAPProduct();
            temp.setBUDAT(now);
            temp.setBLDAT(now);
            temp.setMATNR(part.getProductID().getProductCode());
            temp.setLGORT(part.getHeadId().getWareID().getWareCode());
            temp.setCHARG(part.getBatchNum());
            if (backFlag!=null && backFlag){
                temp.setMENGE(part.getReportNum().negate().toString());
            }else {
                temp.setMENGE(part.getReportNum().toString());
            }
            temp.setMEINS(part.getTaskID().getManuOrderMain().getUnit() != null ? part.getTaskID().getManuOrderMain().getUnit().getCode() : part.getTaskID().getManuOrderMain().getProduct().getProductBaseUnit().getCode());
            temp.setAUFNR(part.getTaskID().getManuOrderMain().getManulOrderNum());
            temp.setKDAUF(part.getTaskID().getManuOrderMain().getSaleOrderNum());
            temp.setKDPOS(part.getTaskID().getManuOrderMain().getSaleOrderProject());
            temp.setZHL(part.getContent().toString());
            temp.setZNBBH(part.getHeadId().getInCode());
            temp.setZRKDH(part.getHeadId().getInputCode());
            temp.setZRKRY(part.getReportStaff().getCode());
            products.add(temp);
        }
        return products;
    }

    /**
     * 将库存量请求数据封装成SAP所需格式
     */
    private StockInfo convertStockInfo(String materialCode, String wareCode, String batchNum) {
        StockInfo stockInfo = new StockInfo();
        stockInfo.setMATNR(materialCode);
        stockInfo.setLGORT(wareCode);
        stockInfo.setCHARG(batchNum);
        return stockInfo;
    }

    private ZFGMMNSHMES getClient() {
        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
        factory.setAddress(consulService.getValueAsString("platform/bap/WOM/WOM.sapAddress") + WS_URL);
        factory.setServiceClass(ZFGMMNSHMES.class);
        ZFGMMNSHMES zfgmmnshmes = (ZFGMMNSHMES) factory.create();
        Client proxy = ClientProxy.getClient(zfgmmnshmes);
        proxy.getOutFaultInterceptors().add(new AbstractSoapInterceptor() {
            @Override
            public void handleMessage(SoapMessage message) throws Fault {
                TreeMap<String, ArrayList<String>> map = (TreeMap<String, ArrayList<String>>)message.get(Message.PROTOCOL_HEADERS);
                ArrayList<String> languages = new ArrayList<>();
                languages.add("zh");
                map.put("sap-language", languages);
            }
        });
        HTTPConduit conduit = (HTTPConduit) proxy.getConduit();
        HTTPClientPolicy policy = new HTTPClientPolicy();
        policy.setConnectionTimeout(TIMEOUT_MINS);
        policy.setReceiveTimeout(TIMEOUT_MINS);
        conduit.setClient(policy);
        return zfgmmnshmes;
    }

}