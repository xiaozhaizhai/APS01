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

import com.supcon.orchid.utils.Param;
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
/* CUSTOM CODE START(service,import,WOM_7.5.0.0_taskReporting_TaskReportingPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface WOMTaskReportingPartService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 生产报工明细 对象
	 * @param id
	 * @return
	 */
	WOMTaskReportingPart getTaskReportingPart(long id);

	/**
	 * 根据ID，获取 生产报工明细 对象
	 * @param id
	 * @return
	 */
	WOMTaskReportingPart getTaskReportingPart(long id, String viewCode);

	/**
	 * 根据ID，获取 生产报工明细 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getTaskReportingPartAsJSON(long id, String include);

	/**
	 * 删除  生产报工明细 对象
	 * @param taskReportingPart 生产报工明细
	 */
	void deleteTaskReportingPart(WOMTaskReportingPart taskReportingPart);

		
	/**
	 * 根据ID，删除  生产报工明细 对象
	 * @param id
	 */
	void deleteTaskReportingPart(long taskReportingPartId, int taskReportingPartVersion);

	/**
	 * 根据ID，删除  生产报工明细 对象
	 * @param id
	 */
	void deleteTaskReportingPart(long taskReportingPartId, int taskReportingPartVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  生产报工明细 对象
	 * @param taskReportingPartIds
	 */
	void deleteTaskReportingPart(String taskReportingPartIds);

	/**
	 * 根据ID串，删除多个  生产报工明细 对象
	 * @param taskReportingPartIds
	 */
	void deleteTaskReportingPart(String taskReportingPartIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  生产报工明细 对象
	 * @param taskReportingPartIds
	 */
	void deleteTaskReportingPart(List<Long> taskReportingPartIds);
	
	/**
	 * 根据ID，删除多个  生产报工明细 对象
	 * @param taskReportingPartIds
	 */
	void deleteTaskReportingPart(List<Long> taskReportingPartIds, String eventTopic);

	/**
	 * 根据ID，还原  生产报工明细 对象
	 * @param taskReportingPartId
	 */
	void restoreTaskReportingPart(String taskReportingPartIds);
	/**
	 * 根据ID，还原  生产报工明细 对象
	 * @param taskReportingPartId
	 */
	void restoreTaskReportingPart(long taskReportingPartId);
	
	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseTaskReportingPart(List<WOMTaskReportingPart>  taskReportingParts);
	
	void excelBatchImportBaseTaskReportingPart(List<WOMTaskReportingPart>  taskReportingParts);
	
	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeTaskReportingPart(WOMTaskReportingPart taskReportingPart, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 生产报工明细 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<WOMTaskReportingPart> findTaskReportingParts(Page<WOMTaskReportingPart> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 生产报工明细 集合
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
	void findTaskReportingParts(Page<WOMTaskReportingPart> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 生产报工明细 集合
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
	void findTaskReportingParts(Page<WOMTaskReportingPart> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 生产报工明细 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findTaskReportingParts(Page<WOMTaskReportingPart> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params,String  refViewCode,String currentViewCode,String sqlType,String realPermissionCode);
	
	List<WOMTaskReportingPart> getTaskReportingParts(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<WOMTaskReportingPart> findTaskReportingPartsBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<WOMTaskReportingPart> findTaskReportingPartsByHql(String hql, Object... objects);
	
	WOMTaskReportingPart loadTaskReportingPartByBussinessKey(WOMTaskReportingPart taskReportingPart);
	
	Page<WOMTaskReportingPart> getTaskReportingParts(Page<WOMTaskReportingPart> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	//===================树形PT=======================
	List<WOMTaskReportingPart> findByTreeDataGridTaskReporting(List<WOMTaskReportingPart> treeList);
	//=======================普通PT==================================
	void findByNormalDataGridTaskReporting(Page<WOMTaskReportingPart> dgPage);
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportTaskReportingPart(List<WOMTaskReportingPart> taskReportingParts, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportTaskReportingPart(List<WOMTaskReportingPart> taskReportingParts);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportTaskReportingPart(List<WOMTaskReportingPart> taskReportingParts, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportTaskReportingPart(List<WOMTaskReportingPart> taskReportingParts);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportTaskReportingPart(List<WOMTaskReportingPart> insertObjs, List<WOMTaskReportingPart> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportTaskReportingPart(List<WOMTaskReportingPart> insertObjs, List<WOMTaskReportingPart> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public WOMTaskReportingPart loadTaskReportingPartByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<WOMTaskReportingPart> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public WOMTaskReportingPart findEntityByProperty(String propertyName, Object object);
	
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
	 * 批量导入excel数据(表单辅模型)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchTaskReportingPart(List<WOMTaskReportingPart> insertObjs, 
			List<WOMTaskReportingPart> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * 批量导入excel数据(表单辅模型)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchTaskReportingPart(List<WOMTaskReportingPart> insertObjs, 
			List<WOMTaskReportingPart> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<WOMTaskReportingPart> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model,Map excelParamsMap);
	
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
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dataGridService DataGridService对象
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dataGridService DataGridService对象
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dataGridService DataGridService对象
	 */
	void saveTaskReportingPart(WOMTaskReportingPart taskReportingPart, DataGridService dataGridService);

	/**
	 * 导入保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> taskReportingPartDataGridImport(WOMTaskReportingPart taskReportingPart, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveTaskReportingPart(WOMTaskReportingPart taskReportingPart, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  生产报工明细 对象
	 * @param taskReportingPart  生产报工明细
	 * @param dataGridService DataGridService对象
	 */
	void mergeTaskReportingPart(WOMTaskReportingPart taskReportingPart, DataGridService dataGridService);
	
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
	Page<WOMTaskReportingPart> getByPage(Page<WOMTaskReportingPart> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long taskReportingPartId);
	
	void generateTaskReportingPartCodes(WOMTaskReportingPart taskReportingPart) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateTaskReportingPartCodes(WOMTaskReportingPart taskReportingPart, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateTaskReportingPartSummarys(WOMTaskReportingPart taskReportingPart) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateTaskReportingPartSummarys(WOMTaskReportingPart taskReportingPart, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<WOMTaskReportingPart> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(WOMTaskReportingPart taskReportingPart);
	
	void dealDatagridsSave(WOMTaskReportingPart taskReportingPart,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,WOM_7.5.0.0_taskReporting_TaskReportingPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
