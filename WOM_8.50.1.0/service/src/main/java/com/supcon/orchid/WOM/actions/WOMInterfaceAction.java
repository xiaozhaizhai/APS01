package com.supcon.orchid.WOM.actions;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.Preparable;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialPartDao;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService;
import com.supcon.orchid.WOM.services.WOMInterfaceSelfService;
import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;
import com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;
import com.supcon.orchid.container.mvc.struts2.results.BAPEntityTransformer;
import com.supcon.orchid.container.mvc.struts2.support.BAPEntityConfGenericActionSupport;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.orm.entities.CodeEntity;
import com.supcon.orchid.orm.entities.IEcCodeEntity;
import com.supcon.orchid.orm.entities.IdEntity;
import com.supcon.orchid.orm.entities.UUIDEntity;
import com.supcon.orchid.utils.JSONPlainSerializer;

import flexjson.transformer.Transformer;
//*****************SAP start**************************
import com.supcon.orchid.services.ConsulService;
import com.supcon.orchid.WOM.services.WsSyncWOMMaterAllotService;
//*****************SAP end****************************

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class WOMInterfaceAction extends BAPEntityConfGenericActionSupport implements Preparable {
	
	private Long waitPutinRecordID;
	private String phaseID;
    //工作单元ID
    private String factoryID;
    //PDA单次手工投料数量
    private Double currentNum;
    //工作单元编码
    private String factoryCode;
    //生产批次
    private String taskBatch;
    //PDA手工投料-物料批次
    private String productNum;
    //PDA手工投料-物料代码
    private String productModel;
    //PDA手工投料-物料编码
    private String productCode;
    //PDA手工投料-确认事件区分标记
    private Boolean confirmFlag;
    //回掺料，指令单工序ID
    private  Long taskProcessID;
  	//返回json
	private String resultJson;
  
  	private String includes;
  	
 	private List<Map<String, Object>> resultList;
  
  	//是否待投料
	private String isFinish;
  
    //配料记录明细ID
    private String batchMaterialDetailID;
    
    //登录用户名
    private String userName;
    //配方工序ID
    private Long formulaProcessID;
    //不良品处理单ID
    private Long rejectsDealID;
    //配方工序活动ID
    private Long formulaProcActiID;
  
    //活动执行记录ID
   	private Long activeExeID;
    
    //工序执行记录ID
   	private Long procExeLogID;
  
    public Long getProcExeLogID() {
		return procExeLogID;
	}

	public void setProcExeLogID(Long procExeLogID) {
		this.procExeLogID = procExeLogID;
	}
  
    public Long getActiveExeID() {
		return activeExeID;
	}

	public void setActiveExeID(Long activeExeID) {
		this.activeExeID = activeExeID;
	}
    
    public Long getFormulaProcActiID() {
		return formulaProcActiID;
	}

	public void setFormulaProcActiID(Long formulaProcActiID) {
		this.formulaProcActiID = formulaProcActiID;
	}
  
    public Long getRejectsDealID() {
		return rejectsDealID;
	}

	public void setRejectsDealID(Long rejectsDealID) {
		this.rejectsDealID = rejectsDealID;
	}

	public Long getFormulaProcessID() {
		return formulaProcessID;
	}

	public void setFormulaProcessID(Long formulaProcessID) {
		this.formulaProcessID = formulaProcessID;
	}
  
    public Long getTaskProcessID() {
        return taskProcessID;
	}

	public void setTaskProcessID(Long taskProcessID) {
		this.taskProcessID = taskProcessID;
	}
    public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
  
    public Boolean getConfirmFlag() {
		return confirmFlag;
	}

	public void setConfirmFlag(Boolean confirmFlag) {
		this.confirmFlag = confirmFlag;
	}
  
    public String getProductModel() {
		return productModel;
	}

	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}
  
    public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
  
    public Double getCurrentNum() {
		return currentNum;
	}

	public void setCurrentNum(Double currentNum) {
		this.currentNum = currentNum;
	}
  
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBatchMaterialDetailID() {
		return batchMaterialDetailID;
	}

	public void setBatchMaterialDetailID(String batchMaterialDetailID) {
		this.batchMaterialDetailID = batchMaterialDetailID;
	}

	public String getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(String isFinish) {
		this.isFinish = isFinish;
	}
	
	public List<Map<String, Object>> getResultList() {
		return resultList;
	}

	public void setResultList(List<Map<String, Object>> resultList) {
		this.resultList = resultList;
	}
	
	public String getIncludes() {
		return includes;
	}

	public void setIncludes(String includes) {
		this.includes = includes;
	}

	      
	public String getResultJson() {
		return resultJson;
	}

	public void setResultJson(String resultJson) {
		this.resultJson = resultJson;
	}
  
   public String getFactoryCode() {
		return factoryCode;
	}

	public void setFactoryCode(String factoryCode) {
		this.factoryCode = factoryCode;
	}
	
	public String getTaskBatch() {
		return taskBatch;
	}

	public void setTaskBatch(String taskBatch) {
		this.taskBatch = taskBatch;
	}

	public String getFactoryID() {
		return factoryID;
	}

	public void setFactoryID(String factoryID) {
		this.factoryID = factoryID;
	}
	
	public Long getWaitPutinRecordID() {
		return waitPutinRecordID;
	}

	public void setWaitPutinRecordID(Long waitPutinRecordID) {
		this.waitPutinRecordID = waitPutinRecordID;
	}

	public String getPhaseID() {
		return phaseID;
	}

	public void setPhaseID(String phaseID) {
		this.phaseID = phaseID;
	}

	@Override
	public int findFieldPermission(String arg0, String arg1) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Resource
	private WOMWaitPutinRecordsService waitPutinRecordsService;
    @Resource
    private WOMWaitPutinRecordsService waitPutinService;
	@Resource
	private WOMBatchPhaseExelogService phaseService;
	@Resource
	private  WOMBatchingMaterialPartService batchingMaterialPartService;
	@Resource
	private WOMBatchPhaseExelogService batchPhaseExelogService;
	@Resource
	private WOMProduceTaskService  produceTaskService;
	@Resource
	private WOMProdTaskActiExelogService prodTaskActiExelogService;
	@Resource
	private WOMInterfaceSelfService interfaceSelfService;
    @Resource
    private RMFormulaProcessActiveService rMFormulaProcessActiveService;
    //*****************SAP start**************************
	@Resource
	private WsSyncWOMMaterAllotService wsSyncWOMMaterAllotService;
	@Resource
	private ConsulService consulService;
	//*****************SAP end****************************
  
	
	/**
	 * PDA扫码投料完成时，调用此方法，在MES中生成投料记录，生成活动执行记录，将配料记录的状态改为已投料，将待投料记录修改为已执行
	 */
    @Action(value = "/public/produceTask/waitPutinRecords/addRecordsAndUpdateState", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
    public String addPutinMaterialRecord() {
    	Boolean flag = false;
    	if(waitPutinRecordID!=null && !waitPutinRecordID.equals("") && userName!=null && !"".equals(userName)){
    		try {
        		interfaceSelfService.addRecordsAndUpdateState(waitPutinRecordID, userName);
        		flag = true;
    		} catch (Exception e) {
    			log.error(e.getMessage(), e);
    		}
    	}
    	responseMap.put("dealSuccessFlag", flag);
		return SUCCESS;
    }
     
	/**
	 * 根据phaseID,将批控的phaseID状态结束
	 */
    @Action(value = "/public/produceTask/batchPhaseExelog/updatePhaseState", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
    public String updatePhaseState() {
    	Boolean flag=false;
		if (phaseID != null && !phaseID.equals("")) {
			try {
				interfaceSelfService.endPhaseActive(phaseID);
				flag=true;
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}
		responseMap.put("dealSuccessFlag", flag);
		return SUCCESS;
    }
    

	/**
	 * 查询PDA接收的所有工作单元 
	 */
    @Action(value = "/public/produceTask/batchPhaseExelog/getBatchPhase", results = { @Result(type = JSON_PLAIN, params = { "root", "resultJson"}) })
    public String getBatchPhase() {
    	if (null != factoryCode && !("").equals(factoryCode)) {
    		resultList = phaseService.getSpecificBatchExelog(factoryCode);
    		resultJson = serializeObjAsJSON(resultList, new BAPEntityTransformer());
		}
    	return SUCCESS;
    }
    
    /**
     * 根据phaseID查找所有的改phaseID下所有的投料明细
     */
    @Action(value = "/public/produceTask/waitPutinRecords/getWaitPutinRecords", results = { @Result(type = JSON_PLAIN, params = { "root", "resultJson" }) })
    public String getWaitPutinRecords() {
	   if (null != phaseID && !("").equals(phaseID) && null != isFinish && !("").equals(isFinish))  {
		   	resultList = waitPutinService.getWaitPutinRecords(phaseID,isFinish);
		   	resultJson = serializeObjAsJSON(resultList, new BAPEntityTransformer());
	   }
    	return SUCCESS;
    }
        
	/**
     * 配料签收   根据参数工作单元编码获取工作单元/生产批次列表
     * @return
     */
     @Action(value = "/public/batchingMaterial/BatchingMaterialPart/getBatchMaterialList", results = { @Result(type = JSON_PLAIN, params = { "root", "resultJson","excludes", "*", "includes","resultList" }) })
    public String getBatchMaterialList(){
    	if(factoryCode != null && !factoryCode.equals("") ){
    		resultList = batchingMaterialPartService.getBatchMaterialWorkunitBatch(factoryCode);
    		resultJson = serializeObjAsJSON(resultList, new BAPEntityTransformer());
    	}
    	return SUCCESS;
    }
     /**
      * 配料签收   根据参数工作单元ID和生产批次获取明细列表
      * @return
      */
     @Action(value = "/public/batchingMaterial/BatchingMaterialPart/getBatchMaterialDetailList", results = { @Result(type = JSON_PLAIN, params = { "root", "resultJson","excludes", "*", "includes","resultList" }) })
     public String getBatchMaterialDetailList(){
     	if(factoryID != null && !factoryID.equals("") && taskBatch != null && !taskBatch.equals("") ){
     		resultList = batchingMaterialPartService.getBatchMaterialDetail(factoryID, taskBatch);
     		resultJson = serializeObjAsJSON(resultList, new BAPEntityTransformer());
     	}
     	return SUCCESS;
     }
     

      /**
      * 配料签收之后的逻辑处理：SAP相关逻辑   回填配料状态
      * @return
      */
     @Action(value = "/public/batchingMaterial/BatchingMaterialPart/dealBatchMaterialCallBack", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
     public String dealBatchMaterialCallBack() {
    	 //回填配料状态
    	 boolean flag = false;
    	 try {
    		 if(batchMaterialDetailID!=null && batchMaterialDetailID.length()>0 && userName !=null && !userName.equals("") ){
        		 batchingMaterialPartService.updateBatchMaterialDetail(batchMaterialDetailID, userName);
        		 flag = true;
         	}
        	//*****************SAP start**************************
      		if(consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynSAP")){
      		     if(flag==true){
              		for(int i=0;i<batchMaterialDetailID.split(",").length;i++){
              			String id=batchMaterialDetailID.split(",")[i];
              			 wsSyncWOMMaterAllotService.sendSAP(Long.parseLong(id));;
              		}
               }
     		}
         	 //*****************SAP end****************************
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
    	responseMap.put("dealSuccessFlag", flag);
    	return SUCCESS;
     }
     
     /**
      * PDA判断工作单元是否存在
      * @return
      */
     @Action(value = "/public/factoryModel/FactoryModel/checkFactoryCode", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","result" }) })
     public String checkFactoryCode() {
    	 String factoryCodeStr = "";
    	 if(factoryCode != null && !factoryCode.equals("") ){
    		 factoryCodeStr = interfaceSelfService.checkFactoryCode(factoryCode);
     	}
    	responseMap.put("result", factoryCodeStr);
    	return SUCCESS;
     }
     
     /**
 	 * PDA手工投料：根据待投料记录ID获取计划投料数量和实际投料数量,物品
 	 */
     @Action(value = "/public/produceTask/waitPutinRecords/getWaitPutinRecordsMaterialNumAndActualNum", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*",
             "includes","result,result.materialNum,result.actualNum,result.productNum,result.productID.productName,result.productID.productCode,result.productID.productModel" }) })
     public String getWaitPutinRecordsMaterialNumAndAcutalNum() {
     	if (null != waitPutinRecordID && !("").equals(waitPutinRecordID)) {
     		WOMWaitPutinRecords waitPutinRecords = waitPutinRecordsService.getWaitPutinRecords(waitPutinRecordID);
     		responseMap.put("result", waitPutinRecords);
 		}
     	return SUCCESS;
     }

     /**
      * PDA手工投料 根据物品编码判断物品是否存在
      * @return
      */
     @Action(value = "/public/product/Product/checkProduct", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","result,result.id,result.productCode,result.productModel,result.productName" }) })
     public String checkProduct() {
    	 List<MESBasicProduct> productList = new ArrayList<MESBasicProduct>();
    	 if(productCode != null && !productCode.equals("") ){
    		 productList = interfaceSelfService.checkProduct(productCode,"code");
     	}else if(productModel!= null && !productModel.equals("")){
     		productList = interfaceSelfService.checkProduct(productModel,"model");
     	}
    	responseMap.put("result", productList);
    	return SUCCESS;
     }
   
    /**
 	 * PDA手工投料确认：根据待投料记录ID,更新待投料记录的实际投料数量、物料编码、物料批号、投料人，且在MES中生成投料记录
 	 */
     @Action(value = "/public/produceTask/waitPutinRecords/addPutinRecordsAndUpdateActualNum", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
     public String addPutinRecordsAndUpdateActualNum() {
     	Boolean flag = false;
     	try {
     		if (waitPutinRecordID != null && currentNum != null && !currentNum.equals("") && confirmFlag != null 
     				&& productCode != null && !productCode.equals("")	&& productNum != null && !productNum.equals("")	&& userName != null && !userName.equals("")) {
     			interfaceSelfService.addPutinRecordsAndUpdateActualNum(confirmFlag,waitPutinRecordID,currentNum,productCode,productNum,userName,"code");
     			flag = true;
     		}else if(waitPutinRecordID != null && currentNum != null && !currentNum.equals("") && confirmFlag != null 
     				&& productModel != null && !productModel.equals("")	&& productNum != null && !productNum.equals("")	&& userName != null && !userName.equals("")){
     			interfaceSelfService.addPutinRecordsAndUpdateActualNum(confirmFlag,waitPutinRecordID,currentNum,productModel,productNum,userName,"model");
     			flag = true;
     		}
     		
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
 		responseMap.put("dealSuccessFlag", flag);
 		return SUCCESS;
     }
     
     /**
  	 * PDA手工投料结束：根据待投料记录ID,结束待投料记录
  	 */
      @Action(value = "/public/produceTask/waitPutinRecords/endWaitPutinRecords", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
      public String endWaitPutinRecords() {
      	Boolean flag = false;
  		if (waitPutinRecordID != null && !waitPutinRecordID.equals("") && userName != null && !userName.equals("")) {
  			try {
  				interfaceSelfService.endWaitPutinRecords(waitPutinRecordID,userName);
  	  			flag = true;
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
  		}
  		responseMap.put("dealSuccessFlag", flag);
  		return SUCCESS;
      }
      
      /**
 	  * PDA掺料处理，根据工作单元编码查询有执行中的工序的工作单元
 	  * @param factoryCode
 	  * @return
 	  */
      @Action(value = "/public/produceTask/ProdTaskProcExelog/getProcessingFacList", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*",
    		  "includes","result,result.factoryName,result.productBatchNum,result.taskProcessID,result.id"})})
      public String getProcessingFacList(){
    	  List<Map<String, Object>> procExelogList = new ArrayList<Map<String, Object>>();
    	  if (factoryCode != null && !"".equals(factoryCode)) {
    		  procExelogList = interfaceSelfService.getProcessingFacList(factoryCode);
		}
    	  responseMap.put("result", procExelogList);
    	  return SUCCESS;
      }
      
      /**
  	  * PDA掺料处理，根据指令单工序ID获取回掺料活动
  	  * @param taskProcessID
  	  * @return
  	  */
       @Action(value = "/public/produceTask/waitPutinRecords/getAdmixtureActiveList", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*",
     		  "includes","result,result.id,result.taskActiveID.name,result.materialNum,result.actualNum,result.activeSource.id,result.productID.productModel,result.productID.productCode"})})
       public String getAdmixtureActiveList(){
     	  List<WOMWaitPutinRecords> waitPutinAdmixtureList = new ArrayList<WOMWaitPutinRecords>();
     	  if (taskProcessID != null) {
//     		 prodTaskActiveList = produceTaskActiveService.findByProperty("orderProcessId", taskProcessID);
     		 waitPutinAdmixtureList = waitPutinRecordsService.getWaitPutinAdmixtureList(taskProcessID);
 		}
     	  responseMap.put("result", waitPutinAdmixtureList);
     	  return SUCCESS;
       }
       
       /**
        * PDA调整处理，根据工作单元编码 查询 活动与批状态为“调整”的、工序为执行中的 活动执行记录的工作单元
 	    * @param factoryCode
        * @return
        */
       @Action(value = "/public/produceTask/ProdTaskActiExelog/getAdjustFacList", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
    		   "result,result.id,result.factoryID.name,result.taskProcessID.formularProcess.id,result.batchNum,result.startTime,result.rejectsDealID"})})
       public String getAdjustFacList() {
    	   List<WOMProdTaskActiExelog> prodTaskActilogList = new ArrayList<WOMProdTaskActiExelog>();
    	   if (factoryCode != null && !"".equals(factoryCode)) {
    		   prodTaskActilogList = prodTaskActiExelogService.getProdTaskActiExelogsList(factoryCode);
		}
    	   responseMap.put("result", prodTaskActilogList);
    	   return SUCCESS;
	}
    
       /**
        * PDA调整处理，根据不良品处理单ID、配方工序ID查询配方工序活动（调整措施）
 	    * @param formulaProcessID
        * @return
        */
       @Action(value = "/public/formula/FormulaProcessActive/getAdjustMeasList", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
    		   "result,result.id,result.formulaProcActiID,result.formulaProcActiName,result.formulaProcActiType,result.productName,,result.productCode,result.productModel,"
    		   + "result.count,result.startEndText,result.time,result.isFinish"})})
       public String getAdjustMeasList() {
    	   List<Map<String, Object>> rMFormulaprocessActiList = new ArrayList<Map<String, Object>>();
    	   if (formulaProcessID != null && rejectsDealID != null) {
    		   rMFormulaprocessActiList = interfaceSelfService.getFormulaProcessActives(rejectsDealID,formulaProcessID,null);
		}
    	   responseMap.put("result", rMFormulaprocessActiList);
    	   return SUCCESS;
	}
       
       /**
        * PDA调整处理，常规类（升降温、搅拌等）点击开始生成活动执行记录
        * @return
        */
       @Action(value = "/public/produceTask/ProdTaskActiExelog/addActiExeLog", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
    		   "result"})})
       public String addActiExeLog() {
    	   Boolean flag = false;
    	   if (formulaProcActiID != null && activeExeID != null && userName != null && !"".equals(userName)) {
    		   try {
    			   prodTaskActiExelogService.insertActiExeLog(formulaProcActiID,activeExeID,userName);
    			   flag = true;
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}
    	   responseMap.put("result", flag);
    	   return SUCCESS;
	}
       
       /**
        * PDA调整处理，常规类（升降温、搅拌等）结束 由开始生成活动执行记录
        * @return
        */
       @Action(value = "/public/produceTask/ProdTaskActiExelog/updateActiExeLog", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
    		   "result"})})
       public String updateActiExeLog() {
    	   Boolean flag = false;
    	   if (activeExeID != null ) {
    		   try {
    			   prodTaskActiExelogService.updateActiExeLog(activeExeID);
    			   flag = true;
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}
    	   responseMap.put("result", flag);
    	   return SUCCESS;
	}
    
    /**
    	 * PDA调整处理，投料确认：根据配方工序活动ID,活动执行记录ID,物品编码/代码,投料数量,用户名,在MES中生成活动执行记录、投料记录
    	 */
        @Action(value = "/public/produceTask/ProdTaskActiExelog/addActiExeLogAndPutInRecord", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","result" }) })
        public String addActiExeLogAndPutInRecord() {
        	Boolean flag = false;
        	try {
        		if (formulaProcActiID != null && currentNum != null && activeExeID != null && productCode != null && !productCode.equals("") 
        				&& productNum != null && !productNum.equals("")	&& userName != null && !userName.equals("")) {
        			interfaceSelfService.addExeLogAndPutinRecords(activeExeID,null,formulaProcActiID,currentNum,productCode,productNum,userName,"code");
        			flag = true;
        		}else if(formulaProcActiID != null && currentNum != null && activeExeID != null && productModel != null 
        				&& !productModel.equals("")	&& productNum != null && !productNum.equals("")	&& userName != null && !userName.equals("")){
        			interfaceSelfService.addExeLogAndPutinRecords(activeExeID,null,formulaProcActiID,currentNum,productModel,productNum,userName,"model");
        			flag = true;
        		}
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
    		
    		responseMap.put("result", flag);
    		return SUCCESS;
        }
        
        /**
         * PDA机动处理，根据工作单元编码 在工序执行记录表中查询存在执行中的工序且由该工序中存在“可机动执行”的配方工序活动(由配方工序查询)
  	     * @param factoryCode
         * @return
         */
        @Action(value = "/public/produceTask/ProdTaskProcExelog/getmaneuverFacList", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
     		   "result,result.id,result.taskProcessID.id,result.factoryID.name,result.formularProcess.id,result.batchNum,result.startTime"})})
        public String getmaneuverFacList() {
        	List<WOMProdTaskProcExelog> maneuverProcExelogList = new ArrayList<WOMProdTaskProcExelog>();
      	  if (factoryCode != null && !"".equals(factoryCode)) {
      		maneuverProcExelogList = interfaceSelfService.getmaneuverFacList(factoryCode);
  		}
      	  responseMap.put("result", maneuverProcExelogList);
     	   return SUCCESS;
 	}
    
        /**
         * PDA机动处理，根据指令单工序ID、配方工序ID查询配方工序活动（调整措施）
  	     * @param formulaProcessID
         * @return
         */
        @Action(value = "/public/formula/FormulaProcessActive/getManeuverMeasList", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
     		   "result,result.id,result.formulaProcActiID,result.formulaProcActiName,result.formulaProcActiType,result.productName,,result.productCode,result.productModel,"
     		   + "result.count,result.startEndText,result.time,result.isFinish"})})
        public String getManeuverMeasList() {
     	   List<Map<String, Object>> rMFormulaprocessActiList = new ArrayList<Map<String, Object>>();
     	   if (formulaProcessID != null && taskProcessID != null) {
     		   rMFormulaprocessActiList = interfaceSelfService.getFormulaProcessActives(null,formulaProcessID,taskProcessID);
 		}
     	   responseMap.put("result", rMFormulaprocessActiList);
     	   return SUCCESS;
 	}
    
    /**
         * PDA机动处理，常规类（升降温、搅拌等）点击开始生成活动执行记录
         * @return
         */
        @Action(value = "/public/produceTask/ProdTaskActiExelog/addActiExeLogByManeuver", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
     		   "result"})})
        public String addActiExeLogByManeuver() {
     	   Boolean flag = false;
     	   if (formulaProcActiID != null && procExeLogID != null && userName != null && !"".equals(userName)) {
     		   try {
     			   prodTaskActiExelogService.insertActiExeLogByManeuver(formulaProcActiID,procExeLogID,userName);
     			   flag = true;
 			} catch (Exception e) {
 				log.error(e.getMessage(), e);
 			}
 		}
     	   responseMap.put("result", flag);
     	   return SUCCESS;
 	}
        
        /**
    	 * PDA机动处理，投料确认：根据配方工序活动ID,工序执行记录ID,物品编码/代码,投料数量,用户名,在MES中生成活动执行记录、投料记录
    	 */
        @Action(value = "/public/produceTask/ProdTaskActiExelog/addActiExeLogAndPutInRecByManeuver", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","result" }) })
        public String addActiExeLogAndPutInRecByManeuver() {
        	Boolean flag = false;
        	try {
        		if (formulaProcActiID != null && currentNum != null && procExeLogID != null && productCode != null && !productCode.equals("") 
        				&& productNum != null && !productNum.equals("")	&& userName != null && !userName.equals("")) {
        			interfaceSelfService.addExeLogAndPutinRecords(null,procExeLogID,formulaProcActiID,currentNum,productCode,productNum,userName,"code");
        			flag = true;
        		}else if(formulaProcActiID != null && currentNum != null && procExeLogID != null && productModel != null 
        				&& !productModel.equals("")	&& productNum != null && !productNum.equals("")	&& userName != null && !userName.equals("")){
        			interfaceSelfService.addExeLogAndPutinRecords(null,procExeLogID,formulaProcActiID,currentNum,productModel,productNum,userName,"model");
        			flag = true;
        		}
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
    		
    		responseMap.put("result", flag);
    		return SUCCESS;
        }
        
        /**
         * PDA机动处理，普通检验类点击检验生成活动执行记录、发起请检
         * @return
         */
        @Action(value = "/public/produceTask/ProdTaskActiExelog/inspectByManeuver", results = {@Result(type = JSON, params = {"root","responseMap","excludes","*","includes",
     		   "result"})})
        public String inspectByManeuver() {
     	   Boolean flag = false;
     	   if (formulaProcActiID != null && procExeLogID != null && userName != null && !"".equals(userName)) {
     		   try {
     			  interfaceSelfService.inspectByManeuver(formulaProcActiID,procExeLogID,userName);
     			   flag = true;
 			} catch (Exception e) {
 				log.error(e.getMessage(), e);
 			}
 		}
     	   responseMap.put("result", flag);
     	   return SUCCESS;
 	}

            
    /**
     * @description 对象序列化json工具方法
     * @param target 要序列化的对象
     * @param transformer
     * @return 序列化之后的json字符串
     */
    public String serializeObjAsJSON(Object target, Transformer transformer){
    	if (target == null) {
			return null;
		}
		JSONPlainSerializer serializer = new JSONPlainSerializer();
		serializer.transform(transformer, IdEntity.class, IEcCodeEntity.class, CodeEntity.class, UUIDEntity.class);
		return serializer.serialize(target);
    }


    private Long facID;
    private Long proID;
    
    
    public Long getFacID() {
		return facID;
	}

	public void setFacID(Long facID) {
		this.facID = facID;
	}

	public Long getProID() {
		return proID;
	}

	public void setProID(Long proID) {
		this.proID = proID;
	}
	
	 @Autowired
	 private MESBasicFactoryModelService factoryModelService;
	 @Autowired
	 private MESBasicProductService productService;
	 
	 

	/*
     
    @Action(value = "/public/produceTask/getMaterialingStoreAndWareByFac", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
    public String getMaterialingStoreAndWareByFac() {
    	
    	MESBasicObjWareStore wareStore=interfaceSelfService.getObjWareStoreByfp(factoryModelService.getFactoryModel(facID), productService.getProduct(proID));
    	if(wareStore!=null){
    		String storeName=wareStore.getStore()==null?"":wareStore.getStore().getPlaceSetName();
    		String wareName=wareStore.getWare()==null?"":wareStore.getWare().getWareName();
    		responseMap.put("dealSuccessFlag", "storeName:"+storeName+"---wareName:"+wareName);
    	}else{
    		responseMap.put("dealSuccessFlag", "nothing");
    	}
		return "sucess";
    }
	 
	 
    @Action(value = "/public/produceTask/getPutinStoreAndWareByFac", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
    public String getPutinStoreAndWareByFac() {
    	
    	MESBasicFacWareMaterial fwm=interfaceSelfService.getFacWareMaterialByfp(factoryModelService.getFactoryModel(facID), productService.getProduct(proID));
    	if(fwm!=null){
    		String storeName=fwm.getStoreId()==null?"":fwm.getStoreId().getPlaceSetName();
    		String wareName=fwm.getWareId()==null?"":fwm.getWareId().getWareName();
    		responseMap.put("dealSuccessFlag", "storeName:"+storeName+"---wareName:"+wareName);
    	}else{
    		responseMap.put("dealSuccessFlag", "nothing");
    	}
		return "sucess";
    }
    
   */

    /**
	 * PDA进行调整处理，调整结束之后，点击【请检】按钮，调用此方法，然后重新发起请检
	 */
	@Action(value = "/public/produceTask/batchPhaseExelog/applyCheckByPDA", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" }) })
	public String applyCheckByPDA() {
	    Boolean flag=interfaceSelfService.applyCheckByPDA(activeExeID);
	    responseMap.put("dealSuccessFlag", flag);
		return SUCCESS;
	}
    
    public String postParams;
    
    public String getPostParams() {
		return postParams;
	}

	public void setPostParams(String postParams) {
		this.postParams = postParams;
	}


	/**
     * 退料签收
     */
    @Action(value = "/public/rejectRecord/reviceRejectRecord", results = { @Result(type = JSON_PLAIN, params = { "root", "resultJson" })})
    public String reviceRejectRecord() {
        String returnMessage = interfaceSelfService.recivedRejectReocrd(postParams);
          
        if(returnMessage.length() > 0){
        	resultJson = "{\"message\":\"" + returnMessage + "\",\"flag\":false}";
        }else{
        	resultJson = "{\"message\":\"签收成功\",\"flag\":true}";
        }
          
        return SUCCESS;
    }
	
	//配料记录id
	private String batchingMaterialPartIds;
	
	public String getBatchingMaterialPartIds() {
		return batchingMaterialPartIds;
	}

	public void setBatchingMaterialPartIds(String batchingMaterialPartIds) {
		this.batchingMaterialPartIds = batchingMaterialPartIds;
	}

	@Action(value = "/public/batchingMaterial/batchingMaterialPart/rejectRecordEdit/checkHasWaitPutinRecord", results = { @Result(type = JSON_PLAIN, params = { "root", "resultJson" })})
	public String checkHasWaitPutinRecord() throws Exception{
		String returnMessage = batchingMaterialPartService.checkHasWaitPutinRecord(batchingMaterialPartIds);
        
        if(returnMessage.length() > 0){
        	resultJson = "{\"message\":\"" + returnMessage + "\",\"flag\":false}";
        }else{
        	resultJson = "{\"message\":\"无记录\",\"flag\":true}";
        }
          
        return SUCCESS;
	}
	private String tag;
	private String startTime;
	private String endTime;
	private Integer interval;
	private Integer pageNo;
	private Integer pageSize;
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Integer getInterval() {
		return interval;
	}
	public void setInterval(Integer interval) {
		this.interval = interval;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	//pims接口测试
	@Action(value = "/public/produceTask/produceTask/getPimsRealValue", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","returnMessage" }) })
	public String getPimsRealValue() {
		String returnStr = interfaceSelfService.getPimsRealValue(tag);
		responseMap.put("returnMessage", returnStr.toString());
		return SUCCESS;
	}

	//pims接口测试
	@Action(value = "/public/produceTask/produceTask/getPimsHistoryValue", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","returnMessage" }) })
	public String getPimsHistoryValue() {
		String returnStr = interfaceSelfService.getPimsHistoryValue(tag,startTime,endTime,interval,pageNo,pageSize);
		responseMap.put("returnMessage", returnStr.toString());
		return SUCCESS;
	}

}