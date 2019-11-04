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

import com.supcon.orchid.WOM.entities.WOMActiveExelogDealInfo;
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
/* CUSTOM CODE START(service,import,WOM_7.5.0.0_activeExelog_ActiveExelog,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface WOMActiveExelogService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 指令单活动执行记录 对象
	 * @param id
	 * @return
	 */
	WOMActiveExelog getActiveExelog(long id);

	/**
	 * 根据ID，获取 指令单活动执行记录 对象
	 * @param id
	 * @return
	 */
	WOMActiveExelog getActiveExelog(long id, String viewCode);

	/**
	 * 根据ID，获取 指令单活动执行记录 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getActiveExelogAsJSON(long id, String include);

	/**
	 * 删除  指令单活动执行记录 对象
	 * @param activeExelog 指令单活动执行记录
	 */
	void deleteActiveExelog(WOMActiveExelog activeExelog);

		
	/**
	 * 根据ID，删除  指令单活动执行记录 对象
	 * @param id
	 */
	void deleteActiveExelog(long activeExelogId, int activeExelogVersion);

	/**
	 * 根据ID，删除  指令单活动执行记录 对象
	 * @param id
	 */
	void deleteActiveExelog(long activeExelogId, int activeExelogVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  指令单活动执行记录 对象
	 * @param activeExelogIds
	 */
	void deleteActiveExelog(String activeExelogIds);

	/**
	 * 根据ID串，删除多个  指令单活动执行记录 对象
	 * @param activeExelogIds
	 */
	void deleteActiveExelog(String activeExelogIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  指令单活动执行记录 对象
	 * @param activeExelogIds
	 */
	void deleteActiveExelog(List<Long> activeExelogIds);
	
	/**
	 * 根据ID，删除多个  指令单活动执行记录 对象
	 * @param activeExelogIds
	 */
	void deleteActiveExelog(List<Long> activeExelogIds, String eventTopic);

	/**
	 * 根据ID，还原  指令单活动执行记录 对象
	 * @param activeExelogId
	 */
	void restoreActiveExelog(String activeExelogIds);
	/**
	 * 根据ID，还原  指令单活动执行记录 对象
	 * @param activeExelogId
	 */
	void restoreActiveExelog(long activeExelogId);
	
	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseActiveExelog(List<WOMActiveExelog>  activeExelogs);
	
	void excelBatchImportBaseActiveExelog(List<WOMActiveExelog>  activeExelogs);
	
	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeActiveExelog(WOMActiveExelog activeExelog, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 指令单活动执行记录 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<WOMActiveExelog> findActiveExelogs(Page<WOMActiveExelog> page,Criterion...criterions);
	
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
	 * @param ActiveExelogDealInfo 指令单活动执行记录DealInfo
	 * @return
	 */
	void saveDealInfo(WOMActiveExelogDealInfo dealInfo);

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
	 * 保存超级编辑的 指令单活动执行记录对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditActiveExelog(WOMActiveExelog activeExelog, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,boolean... isImport);
	
	/**
	 * 保存超级编辑的 指令单活动执行记录对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditActiveExelog(WOMActiveExelog activeExelog, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog,boolean... isImport);
	
	
	void importActiveExelogWorkFlow(WOMActiveExelog activeExelog, String viewCode);
	
		
	public void batchImportActiveExelogWorkFlow(List<WOMActiveExelog>  activeExelogs, View  view);
	
	
	public void batchSaveSuperEditActiveExelog(List<WOMActiveExelog>  activeExelogs, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport);
	
	
	public void batchSaveActiveExelog(WOMActiveExelog activeExelog, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view,List<Event>  events, String eventTopic, boolean... isImport);
	

	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog);
	
	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
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
	 * 根据条件(多条件)获取指定页码的 指令单活动执行记录 集合
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
	void findActiveExelogs(Page<WOMActiveExelog> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 指令单活动执行记录 集合
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
	void findActiveExelogs(Page<WOMActiveExelog> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 指令单活动执行记录 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findActiveExelogs(Page<WOMActiveExelog> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	 * @param activeExelog  指令单活动执行记录
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(WOMActiveExelog activeExelog, Long tableInfoId,String scriptCode);
	
	/**
	 * 弃审生效单据
	 * 
	 * @param activeExelog  指令单活动执行记录
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(WOMActiveExelog activeExelog, Long tableInfoId,String scriptCode,SignatureLog signatureLog);
	
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
	
	List<WOMActiveExelog> getActiveExelogs(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<WOMActiveExelog> findActiveExelogsBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<WOMActiveExelog> findActiveExelogsByHql(String hql, Object... objects);
	
	WOMActiveExelog loadActiveExelogByBussinessKey(WOMActiveExelog activeExelog);
	
	Page<WOMActiveExelog> getActiveExelogs(Page<WOMActiveExelog> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportActiveExelog(List<WOMActiveExelog> activeExelogs, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportActiveExelog(List<WOMActiveExelog> activeExelogs);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportActiveExelog(List<WOMActiveExelog> activeExelogs, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportActiveExelog(List<WOMActiveExelog> activeExelogs);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportActiveExelog(List<WOMActiveExelog> insertObjs, List<WOMActiveExelog> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportActiveExelog(List<WOMActiveExelog> insertObjs, List<WOMActiveExelog> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * 获取单据状态
	 * @param tableInfoIds
	 */
	public List<WOMActiveExelog> getTableInfoStatus(List<WOMActiveExelog> models, boolean isPendingQuery, Long ... deploymentId);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public WOMActiveExelog loadActiveExelogByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<WOMActiveExelog> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public WOMActiveExelog findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchActiveExelogWorkFlow(List<WOMActiveExelog> insertObjs, List<WOMActiveExelog> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(基础)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchActiveExelogWorkFlow(List<WOMActiveExelog> insertObjs, List<WOMActiveExelog> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	
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
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	void saveActiveExelog(WOMActiveExelog activeExelog, DataGridService dataGridService);

	/**
	 * 导入保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> activeExelogDataGridImport(WOMActiveExelog activeExelog, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveActiveExelog(WOMActiveExelog activeExelog, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  指令单活动执行记录 对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	void mergeActiveExelog(WOMActiveExelog activeExelog, DataGridService dataGridService);
	
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
	Page<WOMActiveExelog> getByPage(Page<WOMActiveExelog> page,
			DetachedCriteria detachedCriteria);
	
	
		/**
	 * 保存超级编辑的 指令单活动执行记录对象
	 * @param activeExelog  指令单活动执行记录
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditActiveExelog(WOMActiveExelog activeExelog, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode,boolean... isImport);
	
	public void batchSaveSuperEditActiveExelog(List<WOMActiveExelog>  activeExelogs, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport);
	
	
	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);

	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  指令单活动执行记录 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(WOMActiveExelog activeExelog,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);
	
	
	void findBusinessKeyUsed(long activeExelogId);
	
	void generateActiveExelogCodes(WOMActiveExelog activeExelog) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateActiveExelogCodes(WOMActiveExelog activeExelog, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateActiveExelogSummarys(WOMActiveExelog activeExelog) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateActiveExelogSummarys(WOMActiveExelog activeExelog, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String getWorkFlowVarStatus(WorkFlowVar workFlowVar);
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<WOMActiveExelog> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(WOMActiveExelog activeExelog);
	
	void dealDatagridsSave(WOMActiveExelog activeExelog,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,WOM_7.5.0.0_activeExelog_ActiveExelog,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
