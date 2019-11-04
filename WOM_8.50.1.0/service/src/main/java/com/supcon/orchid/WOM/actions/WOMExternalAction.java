package com.supcon.orchid.WOM.actions;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.Preparable;
import com.supcon.orchid.container.mvc.struts2.results.BAPEntityTransformer;
import com.supcon.orchid.container.mvc.struts2.support.BAPEntityConfGenericActionSupport;
import com.supcon.orchid.ec.utils.JSONUtil;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.orm.entities.CodeEntity;
import com.supcon.orchid.orm.entities.IEcCodeEntity;
import com.supcon.orchid.orm.entities.IdEntity;
import com.supcon.orchid.orm.entities.UUIDEntity;
import com.supcon.orchid.publicSet.exterEntity.BeforeMix;
import com.supcon.orchid.WOM.services.WOMExternalService;
import com.supcon.orchid.utils.JSONPlainSerializer;

import flexjson.transformer.Transformer;
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class WOMExternalAction extends BAPEntityConfGenericActionSupport implements Preparable {

	protected Map<String, Object> responseMap = new HashMap<String, Object>();// 业务处理返回信息
	String batchNum;//批号
	String productID;//物料id
	String type;//上级或下级
	String startTime;//开始时间
	String endTime;//结束时间
	String ProduceTaskID;//指令单id
	String isProduct;


	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getIsProduct() {
		return isProduct;
	}

	public void setIsProduct(String isProduct) {
		this.isProduct = isProduct;
	}
	@Resource 
	private WOMExternalService externalService;
	
	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getBatchNum() {
		return batchNum;
	}

	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}
	
	public Map<String, Object> getResponseMap() {
		return responseMap;
	}

	public void setResponseMap(Map<String, Object> responseMap) {
		this.responseMap = responseMap;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int findFieldPermission(String model, String propertyKey) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 产品批次查询，查询工单的基础信息
	 * @author yj
	 * @param productID 产品ID
	 * @param batchNum 批次号
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param ProduceTaskID 生产工单ID
	 * @return json
			productID：产品id
			productName：产品名称
			productBatchNum:生产批号
			produceTaskID：工单ID
			produceTaskTime：生产日期
			workShop：车间（分公司）
			factoryId：生产线
			amount：数量
			productBaseUnit：单位id
			Process：工序属性
	 */
	@Action(value = "/WOM/external/getProBatch",
			results = {@Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag,proBatch" })})
	public String getProBatch() throws Exception{
		String proBatch = externalService.getProBatch(productID,batchNum,startTime,endTime,ProduceTaskID,isProduct);
		responseMap.put("proBatch", proBatch);
		return SUCCESS;
	}
	
	/**
	 * 产品批次查询，得到原料与产品的数据
	 * @author yj
	 * @param batchNum 批次号
	 * @return json
			productID：产品id
			productName：产品名称
			productBatchNum:生产批号
			produceTaskID：工单ID
			produceTaskTime：生产日期
			workShop：车间（分公司）
			factoryId：生产线
			amount：数量
			productBaseUnit：单位id
			process:工序
	 */
	@Action(value = "/WOM/external/getData",
			results = {@Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag,data" })})
	public String getData() throws Exception{
		String data = externalService.getData(batchNum,type);
		responseMap.put("data", data);
		return SUCCESS;
	}
	
	//工单信息查询，工单详细信息参照页面的url
	@Action(value = "/WOM/external/getProduceTaskPartUrl",
			results = {@Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag,produceTaskPartUrl" })})
	public String getProduceTaskPartUrl() throws Exception{
		String produceTaskPartUrl = externalService.getProduceTaskPartUrl(batchNum);
		responseMap.put("produceTaskPartUrl", produceTaskPartUrl);
		return SUCCESS;
	}
	
	/**
	 * 获取关键工艺参数，批号对应的所有工艺参数
	 * @author yj
	 * @param batchNum 批号
	 * @return json
			eactiveId：工序活动id
			quota：指标
			stValue:标准值
			overrunFlag：统计超限
			limitInter：扫描间隔（超限）
			upperLimit：上限
			maxLimit：上上限
			lowerLimit：下限
			loweMxLimit：下下限
			fluctuateFlag：统计波动
			flucInter：波动扫描间隔(秒)
			flucUpperLimit：波动上限
			flucLowerLimit：波动下限
	 */
	@Action(value = "/WOM/external/getPrecessStandards",
			results = {@Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag,precessStandards" })})
	public String getMixedAfter() throws Exception{
		String precessStandards = externalService.getPrecessStandards(batchNum);
		responseMap.put("precessStandards", precessStandards);
		return SUCCESS;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 工单接口 
	String startTaskJson;//指令单开始Json
	String endTaskJson;//指令单结束Json
	String startTaskProcessJson;//工序开始Json
	String endTaskProcessJson;//工序结束Json
	String startActiveJson;//活动开始Json
	String adjustStartActiveJson;//机动活动开始Json
	String endActiveJson;//活动结束Json
	String adjustEndActiveJson;//机动活动结束Json
	String addTaskReportJson;//报工单Json
	String addPutInRecordJson;//投料单Json
	String addInspectJson;//请检单Json
	String addwaitPutInRecordJson;//待投料Json
	
	
	public String getAdjustStartActiveJson() {
		return adjustStartActiveJson;
	}

	public void setAdjustStartActiveJson(String adjustStartActiveJson) {
		this.adjustStartActiveJson = adjustStartActiveJson;
	}

	public String getAddwaitPutInRecordJson() {
		return addwaitPutInRecordJson;
	}

	public void setAddwaitPutInRecordJson(String addwaitPutInRecordJson) {
		this.addwaitPutInRecordJson = addwaitPutInRecordJson;
	}

	public String getAddPutInRecordJson() {
		return addPutInRecordJson;
	}

	public void setAddPutInRecordJson(String addPutInRecordJson) {
		this.addPutInRecordJson = addPutInRecordJson;
	}

	public String getAddInspectJson() {
		return addInspectJson;
	}

	public void setAddInspectJson(String addInspectJson) {
		this.addInspectJson = addInspectJson;
	}

	public String getAddTaskReportJson() {
		return addTaskReportJson;
	}

	public void setAddTaskReportJson(String addTaskReportJson) {
		this.addTaskReportJson = addTaskReportJson;
	}

	public String getEndTaskProcessJson() {
		return endTaskProcessJson;
	}

	public void setEndTaskProcessJson(String endTaskProcessJson) {
		this.endTaskProcessJson = endTaskProcessJson;
	}

	public String getEndActiveJson() {
		return endActiveJson;
	}

	public void setEndActiveJson(String endActiveJson) {
		this.endActiveJson = endActiveJson;
	}

	public String getStartActiveJson() {
		return startActiveJson;
	}

	public void setStartActiveJson(String startActiveJson) {
		this.startActiveJson = startActiveJson;
	}

	public String getStartTaskProcessJson() {
		return startTaskProcessJson;
	}

	public void setStartTaskProcessJson(String startTaskProcessJson) {
		this.startTaskProcessJson = startTaskProcessJson;
	}

	public String getStartTaskJson() {
		return startTaskJson;
	}

	public void setStartTaskJson(String startTaskJson) {
		this.startTaskJson = startTaskJson;
	}

	public String getEndTaskJson() {
		return endTaskJson;
	}

	public void setEndTaskJson(String endTaskJson) {
		this.endTaskJson = endTaskJson;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * 活动开始
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/startActive",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String startActive() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(startActiveJson);
		Map<String, Object> resultMap= externalService.startActive(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	
	/**
	 * 机动活动开始
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/adjustStartActive",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String adjustStartActive() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(adjustStartActiveJson);
		Map<String, Object> resultMap= externalService.adjustStartActive(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 活动结束
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/endActive",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String endActive() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(endActiveJson);
		Map<String, Object> resultMap= externalService.endActive(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	
	/**
	 * 机动活动结束
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/adjustEndActive",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String adjustEndActive() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(adjustEndActiveJson);
		Map<String, Object> resultMap= externalService.adjustEndActive(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 工序开始
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/startProcess",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String startProcess() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(startTaskProcessJson);
		Map<String, Object> resultMap= externalService.startProcess(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 工序结束
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/endProcess",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String endProcess() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(endTaskProcessJson);
		Map<String, Object> resultMap= externalService.endProcess(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 指令单开始
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/startTask",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String startTask() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(startTaskJson);
		Map<String, Object> resultMap= externalService.startTask(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 指令单结束
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/endTask",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String endTask() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(endTaskJson);
		Map<String, Object> resultMap= externalService.endTask(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 下推请检单
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/addInspect",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String addInspect() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(addInspectJson);
		Map<String, Object> resultMap= externalService.addInspect(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 下推待投料记录
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/addwaitPutInRecord",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String addwaitPutInRecord() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(addwaitPutInRecordJson);
		Map<String, Object> resultMap= externalService.addwaitPutInRecord(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}

	/**
	 * 生成报工单
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/addTaskReport",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String addTaskReport() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(addTaskReportJson);
		Map<String, Object> resultMap= externalService.addTaskReport(map);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}
	
	/**
	 * 生成投料单
	 * @author hyc
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/addPutInRecord",results = {@Result(name = SUCCESS, type = JSON, params = {"root", "responseMap"})})
	public String addPutInRecord() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(addPutInRecordJson);
		List<Map<String, Object>> mapList = (List<Map<String, Object>>)map.get("materials");		
		Map<String, Object> resultMap= externalService.addPutInRecord(map,mapList);
		for(String key: resultMap.keySet()){
			responseMap.put(key, resultMap.get(key));
		}
		return SUCCESS;
	}

}
