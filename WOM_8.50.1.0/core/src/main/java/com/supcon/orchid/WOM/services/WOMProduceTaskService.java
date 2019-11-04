package com.supcon.orchid.WOM.services;
import java.lang.reflect.InvocationTargetException;
import java.io.Serializable;
import java.util.Map;
import java.util.Date;
import org.hibernate.criterion.Criterion;
import java.util.List;
import com.supcon.orchid.services.IBusinessKeyService;
import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.ec.entities.Event;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.ec.entities.DataGrid;
import com.supcon.orchid.ec.entities.Model;
import com.supcon.orchid.ec.entities.Property;
import org.hibernate.criterion.DetachedCriteria;
import com.supcon.orchid.audit.entities.SignatureLog;

import com.supcon.orchid.WOM.entities.WOMProduceTaskDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.WOM.entities.WOMQualityInspect;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.entities.WOMBatchCharge;
import com.supcon.orchid.WOM.entities.WOMCraftRecords;
import com.supcon.orchid.WOM.entities.WOMCraftStandards;
import com.supcon.orchid.WOM.entities.WOMProcFeedbackHead;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.WOM.entities.WOMMaterialsOutput;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchingRejectParts;
import com.supcon.orchid.WOM.entities.WOMRejectReason;
import com.supcon.orchid.WOM.entities.WOMBatchTrace;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempHead;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempRecords;
import com.supcon.orchid.WOM.entities.WOMBatchChargeDetails;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMProductNumIndex;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMManulOrderMain;
import com.supcon.orchid.WOM.entities.WOMManulOrderMaterial;
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.entities.WOMInventoryDetail;
import com.supcon.orchid.WOM.entities.WOMInventoryRecord;
/* CUSTOM CODE START(service,import,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
import com.supcon.orchid.WOM.entities.ProcessStep;
import com.supcon.orchid.WOM.entities.WOMResult;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.foundation.entities.SystemCode;
import java.math.BigDecimal;
import com.supcon.orchid.WOM.entities.BatchAnalyze;
/* CUSTOM CODE END */
public interface WOMProduceTaskService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 生产指令单 对象
	 * @param id
	 * @return
	 */
	WOMProduceTask getProduceTask(long id);

	/**
	 * 根据ID，获取 生产指令单 对象
	 * @param id
	 * @return
	 */
	WOMProduceTask getProduceTask(long id, String viewCode);

	/**
	 * 根据ID，获取 生产指令单 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getProduceTaskAsJSON(long id, String include);

	/**
	 * 删除  生产指令单 对象
	 * @param produceTask 生产指令单
	 */
	void deleteProduceTask(WOMProduceTask produceTask);

		
	/**
	 * 根据ID，删除  生产指令单 对象
	 * @param id
	 */
	void deleteProduceTask(long produceTaskId, int produceTaskVersion);

	/**
	 * 根据ID，删除  生产指令单 对象
	 * @param id
	 */
	void deleteProduceTask(long produceTaskId, int produceTaskVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  生产指令单 对象
	 * @param produceTaskIds
	 */
	void deleteProduceTask(String produceTaskIds);

	/**
	 * 根据ID串，删除多个  生产指令单 对象
	 * @param produceTaskIds
	 */
	void deleteProduceTask(String produceTaskIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  生产指令单 对象
	 * @param produceTaskIds
	 */
	void deleteProduceTask(List<Long> produceTaskIds);
	
	/**
	 * 根据ID，删除多个  生产指令单 对象
	 * @param produceTaskIds
	 */
	void deleteProduceTask(List<Long> produceTaskIds, String eventTopic);

	/**
	 * 根据ID，还原  生产指令单 对象
	 * @param produceTaskId
	 */
	void restoreProduceTask(String produceTaskIds);
	/**
	 * 根据ID，还原  生产指令单 对象
	 * @param produceTaskId
	 */
	void restoreProduceTask(long produceTaskId);
	
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProduceTask(WOMProduceTask produceTask, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseProduceTask(List<WOMProduceTask>  produceTasks);
	
	void excelBatchImportBaseProduceTask(List<WOMProduceTask>  produceTasks);
	
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProduceTask(WOMProduceTask produceTask, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProduceTask(WOMProduceTask produceTask,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProduceTask(WOMProduceTask produceTask,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeProduceTask(WOMProduceTask produceTask, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 生产指令单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<WOMProduceTask> findProduceTasks(Page<WOMProduceTask> page,Criterion...criterions);
	
	/*
	 * 解析主模型的过滤条件
	 *
	 */
	public List<Object> generateParamExcelSql(List<Param> params, Integer type, String viewCode);
	
	/**
	 * 根据模型名称获得视图名称
	 * @param modelCode
	 * @return
	 */
	public String getViewName(String modelCode);
	
	/**
	 * 保存处理意见
	 * 
	 * @param ProduceTaskDealInfo 生产指令单DealInfo
	 * @return
	 */
	void saveDealInfo(WOMProduceTaskDealInfo dealInfo);

	/**
	 * 根据 tableInfoId 获取处理意见
	 * 
	 * @param tableInfoId
	 * @return
	 */
	int getDealInfoCount(Long tableInfoId);

	/**
	 * 根据 tableInfoId 获取处理意见
	 * 
	 * @param tableInfoId
	 * @param expandFlag 是否展现没有详细描述的处理意见
	 * @return
	 */
	List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag);
	
	/**
	 * @param tableInfoId
	 * @param expandFlag
	 * @return
	 */
	Map<String, List<Object[]>> findDealInfosGroup(Long tableInfoId, boolean expandFlag);
	boolean isRecallAble(Long tableInfoId);
	Pending recall(long tableInfoId);
	/**
	 * 根据 tableInfoId 与 staffId 获取督办信息
	 * 
	 * @param tableInfoId
	 * @param staffId
	 * @return
	 */
	boolean existsSupervision(Long tableInfoId, Long staffId);
	
	/**
	 * 保存超级编辑的 生产指令单对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,boolean... isImport);
	
	/**
	 * 保存超级编辑的 生产指令单对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog,boolean... isImport);
	
	
	void importProduceTaskWorkFlow(WOMProduceTask produceTask, String viewCode);
	
		
	public void batchImportProduceTaskWorkFlow(List<WOMProduceTask>  produceTasks, View  view);
	
	
	public void batchSaveSuperEditProduceTask(List<WOMProduceTask>  produceTasks, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport);
	
	
	public void batchSaveProduceTask(WOMProduceTask produceTask, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view,List<Event>  events, String eventTopic, boolean... isImport);
	

	/**
	 * 保存  生产指令单 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  生产指令单 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  生产指令单 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  生产指令单 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog);
	
	/**
	 * 保存  生产指令单 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	/**
	 * 获取活动最后一条处理意见时间
	 * @param tableInfoId
	 * @param activityName
	 * @return
	 */
	Date findLastDealInfo(Long tableInfoId, String activityName);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 生产指令单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @param permissionCode 权限code
	 * @return
	 */
	void findProduceTasks(Page<WOMProduceTask> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 生产指令单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @param permissionCode 权限code
	 * @param objects
	 * @return
	 */
	void findProduceTasks(Page<WOMProduceTask> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 生产指令单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findProduceTasks(Page<WOMProduceTask> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
	/**
	 * 根据条件(多条件)获取指定页码的数据集合(针对编辑页面datagrid)
	 * 
	 * @param dg
	 * @param dgClass
	 * @param page
	 * @param orgObj
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	void findDataGridPage(DataGrid dg,Class dgClass,Page dgPage,Object orgObj, String condition, List<Object> params);

	
	/**
	 * 弃审生效单据
	 * 
	 * @param produceTask  生产指令单
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(WOMProduceTask produceTask, Long tableInfoId,String scriptCode);
	
	/**
	 * 弃审生效单据
	 * 
	 * @param produceTask  生产指令单
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(WOMProduceTask produceTask, Long tableInfoId,String scriptCode,SignatureLog signatureLog);
	
	/**
	 * 批量审批单据
	 * 
	 * @param ids  实体ids，逗号隔开
	 * @param deploymentIds 流程ids 逗号隔开
	 * @param pendingIds 待办ids 逗号隔开
	 * @param outcomeStr 路由信息
	 * 格式：outcomeString格式：activeType（活动类型），outcome（路由code），dec（路由描述），assignUser（指定人员的用户ids）;activeType，outcome，dec，assignUser||activeType，outcome，dec，assignUser;activeType，outcome，dec，assignUser
	 */
	public void bulkSubmit(String ids,Long deploymentId,String pendingIds,String outcomeStr);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params,String  refViewCode,String currentViewCode,String sqlType,String realPermissionCode);
	
	List<WOMProduceTask> getProduceTasks(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<WOMProduceTask> findProduceTasksBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<WOMProduceTask> findProduceTasksByHql(String hql, Object... objects);
	
	WOMProduceTask loadProduceTaskByBussinessKey(WOMProduceTask produceTask);
	
	Page<WOMProduceTask> getProduceTasks(Page<WOMProduceTask> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportProduceTask(List<WOMProduceTask> produceTasks, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportProduceTask(List<WOMProduceTask> produceTasks);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportProduceTask(List<WOMProduceTask> produceTasks, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportProduceTask(List<WOMProduceTask> produceTasks);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportProduceTask(List<WOMProduceTask> insertObjs, List<WOMProduceTask> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportProduceTask(List<WOMProduceTask> insertObjs, List<WOMProduceTask> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * 获取单据状态
	 * @param tableInfoIds
	 */
	public List<WOMProduceTask> getTableInfoStatus(List<WOMProduceTask> models, boolean isPendingQuery, Long ... deploymentId);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public WOMProduceTask loadProduceTaskByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<WOMProduceTask> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public WOMProduceTask findEntityByProperty(String propertyName, Object object);
	
	/**
	 * 根据业务主键删除对象 以逗号分隔
	 * @param bussinessKey
	 */
	public void deleteByBussinessKeys(String bussinessKeys);
	
	/**
	 * 动态查询bap_validate_datagrids变量
	 */
	public String findValidateDatagrids(Map<String,Class> dgclass,String viewCode);
	
	public String findValidateDatagrids(Map<String,Class> dgclass);
	
	/**
	 * 动态查询MainViewPath变量
	 */
	public String findMainViewPath();
	
	/**
	 * 动态查询datagrids
	 */
	public List<DataGrid> findDatagrids();
	
		/**
	 * 根据业务主键名称获取所有有效的业务主键数据
	 * @param bussinessKeyName
	 */
	public List<Object> getBusinessKeyData(String businessKeyName);
	
	/**
	 * 根据业务主键名称获取所有业务主键数据
	 * @param bussinessKeyName
	 */
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName);
	
	/**
	 * 根据字段名获取该字段在表中数据数
	 * @param propertyName
	 */
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey);
	
	/**
	 * 表单类型更具id获取tableNo
	 * 
	 */
	public String getTableNoById(Long id);
	
	/**
	 * 表单类型获取tableNo
	 * 
	 */
	public List<String> getTableNoData();
	/**
	 * 批量导入excel数据(基础)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchProduceTaskWorkFlow(List<WOMProduceTask> insertObjs, List<WOMProduceTask> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(基础)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchProduceTaskWorkFlow(List<WOMProduceTask> insertObjs, List<WOMProduceTask> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable mainBusName, List<Serializable> mainDisplayKeys);
	
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode);
	
	/**
	 * 获取已启用的自定义字段对象.
	 * 
	 * @param entityCode 模型code
	 * @return Property Code
	 */
	List<String> getRunningCustomProperties(String entityCode);
	
	/**
	 * 根据模型字段名称获取引用的字段
	 * @param propertyCode
	 * @return
	 */
	public String getAssProperty(String propertyCode);
	
	/**
	 * 根据字段code获取模型code 
	 * @param propertyCode
	 * @return
	 */
	public String getPropertyModelCode(String propertyCode);

	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	 
	/**
	 * 根据条件(多条件)获取指定页码的 活动处理表 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1542100691662Page(Page<WOMAdjustOrTempHead> dg1542100691662Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 活动处理记录表 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1542100698339Page(Page<WOMAdjustOrTempRecords> dg1542100698339Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505983091921Page(Page<WOMProduceTaskActive> dg1505983091921Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505983091997Page(Page<WOMProduceMaterialSum> dg1505983091997Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1506060049547Page(Page<WOMProduceTaskActive> dg1506060049547Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1506060049644Page(Page<WOMProduceMaterialSum> dg1506060049644Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1506306746525Page(Page<WOMProduceTaskActive> dg1506306746525Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1506306746606Page(Page<WOMProduceMaterialSum> dg1506306746606Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 工序执行记录 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1498733248586Page(Page<WOMProdTaskProcExelog> dg1498733248586Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 活动执行记录 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1498733279732Page(Page<WOMProdTaskActiExelog> dg1498733279732Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1489730796226Page(Page<WOMProduceTaskActive> dg1489730796226Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 指令单工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1489731937175Page(Page<WOMProduceTaskProcess> dg1489731937175Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1489732429091Page(Page<WOMProduceMaterialSum> dg1489732429091Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1489736028416Page(Page<WOMProduceTaskActive> dg1489736028416Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1572513055658Page(Page<WOMProduceTaskActive> dg1572513055658Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 指令单工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1572513055772Page(Page<WOMProduceTaskProcess> dg1572513055772Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1572513055825Page(Page<WOMProduceMaterialSum> dg1572513055825Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1572513055910Page(Page<WOMProduceTaskActive> dg1572513055910Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1540191119508Page(Page<WOMProduceTaskActive> dg1540191119508Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1540191119680Page(Page<WOMProduceMaterialSum> dg1540191119680Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1540191119773Page(Page<WOMProduceTaskActive> dg1540191119773Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 指令单工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1540191119898Page(Page<WOMProduceTaskProcess> dg1540191119898Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1490749384698Page(Page<WOMProduceTaskActive> dg1490749384698Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1490749384787Page(Page<WOMProduceMaterialSum> dg1490749384787Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1490749384886Page(Page<WOMProduceTaskActive> dg1490749384886Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 指令单工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1490749384962Page(Page<WOMProduceTaskProcess> dg1490749384962Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505802969630Page(Page<WOMProduceTaskActive> dg1505802969630Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505802969738Page(Page<WOMProduceMaterialSum> dg1505802969738Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505804201833Page(Page<WOMProduceTaskActive> dg1505804201833Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505804201918Page(Page<WOMProduceMaterialSum> dg1505804201918Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1495850751698Page(Page<WOMProduceTaskActive> dg1495850751698Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1495850751757Page(Page<WOMProduceMaterialSum> dg1495850751757Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1495850751807Page(Page<WOMProduceTaskActive> dg1495850751807Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 指令单工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1495850751863Page(Page<WOMProduceTaskProcess> dg1495850751863Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1496389818499Page(Page<WOMProduceTaskActive> dg1496389818499Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1496389818610Page(Page<WOMProduceMaterialSum> dg1496389818610Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1496389818686Page(Page<WOMProduceTaskActive> dg1496389818686Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 指令单工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1496389818751Page(Page<WOMProduceTaskProcess> dg1496389818751Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505285519431Page(Page<WOMProduceMaterialSum> dg1505285519431Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505285519610Page(Page<WOMProduceTaskActive> dg1505285519610Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505456701981Page(Page<WOMProduceTaskActive> dg1505456701981Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505456702135Page(Page<WOMProduceMaterialSum> dg1505456702135Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505974050406Page(Page<WOMProduceTaskActive> dg1505974050406Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505983284775Page(Page<WOMProduceMaterialSum> dg1505983284775Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505975951232Page(Page<WOMProduceTaskActive> dg1505975951232Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505983664771Page(Page<WOMProduceMaterialSum> dg1505983664771Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1504926238926Page(Page<WOMProduceTaskActive> dg1504926238926Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505176886273Page(Page<WOMProduceMaterialSum> dg1505176886273Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料活动 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505100155794Page(Page<WOMProduceTaskActive> dg1505100155794Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 用料汇总 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1505178110802Page(Page<WOMProduceMaterialSum> dg1505178110802Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 工序执行记录 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1495780442464Page(Page<WOMProdTaskProcExelog> dg1495780442464Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 活动执行记录 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1495781791731Page(Page<WOMProdTaskActiExelog> dg1495781791731Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 活动处理表 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1542351151648Page(Page<WOMAdjustOrTempHead> dg1542351151648Page,WOMProduceTask produceTask, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 活动处理记录表 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param produceTask  生产指令单
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1542351151777Page(Page<WOMAdjustOrTempRecords> dg1542351151777Page,WOMProduceTask produceTask, String condition, List<Object> params);
	 
	 
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService);

	/**
	 * 导入保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> produceTaskDataGridImport(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  生产指令单 对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	void mergeProduceTask(WOMProduceTask produceTask, DataGridService dataGridService);
	
	/**
	 * Excel导出 
	 */
	void excelExport();
	
	/**
	 * 页面打印 
	 */
	void print(int printType);
	
	public  Object generateObjectFromJson(String jsonStr, Class clazz);
	
	/**
	 * 获取分页
	 */
	Page<WOMProduceTask> getByPage(Page<WOMProduceTask> page,
			DetachedCriteria detachedCriteria);
	
	/**
	 * 获取phase执行记录列表
	 */
	public List<WOMBatchPhaseExelog> getBatchPhaseExelogList(WOMProduceTask produceTask);
	/**
	 * 获取活动执行记录列表
	 */
	public List<WOMProdTaskActiExelog> getProdTaskActiExelogList(WOMProduceTask produceTask);
	/**
	 * 获取工序执行记录列表
	 */
	public List<WOMProdTaskProcExelog> getProdTaskProcExelogList(WOMProduceTask produceTask);
	/**
	 * 获取用料汇总列表
	 */
	public List<WOMProduceMaterialSum> getProduceMaterialSumList(WOMProduceTask produceTask);
	/**
	 * 获取用料活动列表
	 */
	public List<WOMProduceTaskActive> getProduceTaskActiveList(WOMProduceTask produceTask);
	/**
	 * 获取指令单工序列表
	 */
	public List<WOMProduceTaskProcess> getProduceTaskProcessList(WOMProduceTask produceTask);
	
		/**
	 * 保存超级编辑的 生产指令单对象
	 * @param produceTask  生产指令单
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode,boolean... isImport);
	
	public void batchSaveSuperEditProduceTask(List<WOMProduceTask>  produceTasks, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport);
	
	
	/**
	 * 保存  生产指令单 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  生产指令单 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);

	/**
	 * 保存  生产指令单 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  生产指令单 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);
	
	
	void findBusinessKeyUsed(long produceTaskId);
	
	void generateProduceTaskCodes(WOMProduceTask produceTask) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProduceTaskCodes(WOMProduceTask produceTask, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProduceTaskSummarys(WOMProduceTask produceTask) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProduceTaskSummarys(WOMProduceTask produceTask, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String getWorkFlowVarStatus(WorkFlowVar workFlowVar);
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<WOMProduceTask> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(WOMProduceTask produceTask);
	
	void dealDatagridsSave(WOMProduceTask produceTask,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
  	WOMResult getAutoFinishReporting(Long forluma, Long factoryLineId);
  	
  	BatchAnalyze getBatchInfo(String batchNum);
  
  	List<Map<String,Object>> getInspectDetails(Long activeId, String activeType);
    /**  
	 * 根据产品ID获取默认配方
	 * @param 
	 */
  	public RMFormula getDefaultFormular(Long productID, String taskType);
	/**
	 * 根据车间计划生成生产指令
	 * @param 
	 */
    public void makeProduceOrder(Long exeOrderStaff, Long batchPlanId, String remark);
    
    /**
	 * 根据批量明细生成生产指令
	 * @param 
	 */
    public void makeProduceOrderByBatchTask(WOMBatchProdTaskPart batchTask);
  
  	/**
	 * 生成批次信息
	 * @param produceTask 指令单
	 */
	void setBatch(WOMProduceTask produceTask);
  
	/**
	 * 删除批次信息,处理记录
	 * @param productBatchNum 批号
	 */
  	void delBatchNum(String productBatchNum);
  
	/**
	 * 判断是否弃审 已经历弃审返回false
	 * produceTask 指令单
	 */
	boolean checkRecall(WOMProduceTask produceTask);
  
	/**
	 * 生成批次处理信息
	 * produceTask 指令单
     * tableState 单据状态
     * remark 描述
	 */
	void addDealBatch(WOMProduceTask produceTask, SystemCode tableState, String remark);
  
	/**
	 * 更新批次信息
	 * produceTask 指令单
	 */
	void updateBatch(WOMProduceTask produceTask);
  
  	/**
	 * 删除批次信息
	 * @param productBatchNum 批号
	 */
	void delBatch(String productBatchNum);
  
  	WOMProduceTask reloadProduceTask(Long id);
  	
  	public WOMProduceTask getProduceTaskByBatchID(Long batchId);
  
  	  	/**
	 * 新增工单的时候向批控同步控制配方头
	 */
  	public boolean addProduceTaskSync(String ids,String logids);
  	
  	/**
	 * 修改工单的时候向批控同步控制配方头
	 */
  	public boolean updateProdTaskSync(String ids,String logids,int opStat);
  
  	/**
	 * 修改工单的时候向批控同步控制配方头
	 */
  	public boolean deleteProdTaskSync(String ids,String logids);
  	
  	/**
	 * 处理mq消息
	 */
  	public void dealMQDate();
  
  	/**
	 * 处理mq消息
	 */
  	public boolean stopPhaseSync(String ids, String logids);
  	
  	/*
  	 * pda结束phase
  	 * */
  	public Boolean endPhaseActive(String phaseID, Boolean dealError);
  	
  	/**
	 * 处理mq batch消息
	 */
  	public Boolean dealMqBatchDate(RMMQDealinfo di, Boolean dealError);
  	
  	/**
	 * 处理mq unit消息
	 */
  	public Boolean dealMqUnitDate(RMMQDealinfo di, Boolean dealError);
  	
  	/**
	 * 处理mq operation消息
	 */
  	public Boolean dealMqOperationDate(RMMQDealinfo di, Boolean dealError);
  	
  	/**
	 * 处理mq phase执行消息
	 */
  	public Boolean dealMqPhaseDate(RMMQDealinfo di, Boolean dealError);
  	
  	/**
	 * 处理mq phase修改消息
	 */
  	public Boolean dealMqPhaseDateChange(RMMQDealinfo di, Boolean dealError);
    /**
  	 * 根据批号查找指令单
  	 * @param batchNum
  	 * @return
  	 */
	public WOMProduceTask getBybatchNum(String batchNum);
  
  	/**
	 * 根据返工前批号查找最新检验报告单
	 * @param srcID
	 * @return
	 */
	public String findManuCheckBybatchNum(String batchNum);
  
  	void batchNumCodes(WOMProduceTask produceTask);
  
  	Long toProcFeedbackPage(Long activeId);
  
  	Long searchProcFeedbackPage(Long activeId, String activeType);
  
  	List<ProcessStep> getProcessesData(Long produceTaskId);
  
  	Long searchAdjustPage(Long activeId, String processId);
  	List<WOMBatchChargeDetails> getBatchingRecordByProcessAndActive(Long activeId, String processId);
    List<Map<String,Object>> getBatchingRecordByProduceTaskId(Long produceTaskId);
  	List<WOMBatchChargeDetails> getBatchingRecordByActive(Long activeId);
      //////////////////////////////////////////////////////////MES向批控同步接口
  	/**
	 * 启动工单
	 */
  	public Map startBatchSync(String productBatchNum, String logids);
  	
  	/**
	 * 结束工单
	 */
  	public Map stopBatchSync(String productBatchNum, String logids);
  	
  	/**
	 * 暂停工单
	 */
  	public Map pauseBatchSync(String productBatchNum, String logids);
  	
  	/**
	 * 恢复工单
	 */
  	public Map resumeBatchSync(String productBatchNum, String logids);
  	
  	/**
	 * 废除工单
	 */
  	public Map abortBatchSync(String productBatchNum, String logids);
 
	/**
	 * 通过配方编码获取配方
	 * @param formulaCode
	 * @return
	 */
	List getFormulaIdByformulaCode( String formulaCode);
/* CUSTOM CODE END */
}
