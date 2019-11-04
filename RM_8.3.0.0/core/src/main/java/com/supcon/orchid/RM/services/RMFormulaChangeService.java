package com.supcon.orchid.RM.services;
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

import com.supcon.orchid.RM.entities.RMFormulaChangeDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMCheckDetail;
import com.supcon.orchid.RM.entities.RMCheckDetailItemSetups;
import com.supcon.orchid.RM.entities.RMForLineFormula;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMForProcessUnit;
import com.supcon.orchid.RM.entities.RMForProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMProductReplace;
import com.supcon.orchid.RM.entities.RMReplaceFormula;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMBatchFactory;
import com.supcon.orchid.RM.entities.RMBatchFormulaMain;
import com.supcon.orchid.RM.entities.RMSynchroLog;
import com.supcon.orchid.RM.entities.RMTestProj;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMProductMapOther;
import com.supcon.orchid.RM.entities.RMFormulaBomMain;
import com.supcon.orchid.RM.entities.RMFormulaBomMaterial;
import com.supcon.orchid.RM.entities.RMFormulaChange;
/* CUSTOM CODE START(service,import,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface RMFormulaChangeService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 配方变更表 对象
	 * @param id
	 * @return
	 */
	RMFormulaChange getFormulaChange(long id);

	/**
	 * 根据ID，获取 配方变更表 对象
	 * @param id
	 * @return
	 */
	RMFormulaChange getFormulaChange(long id, String viewCode);

	/**
	 * 根据ID，获取 配方变更表 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getFormulaChangeAsJSON(long id, String include);

	/**
	 * 删除  配方变更表 对象
	 * @param formulaChange 配方变更表
	 */
	void deleteFormulaChange(RMFormulaChange formulaChange);

		
	/**
	 * 根据ID，删除  配方变更表 对象
	 * @param id
	 */
	void deleteFormulaChange(long formulaChangeId, int formulaChangeVersion);

	/**
	 * 根据ID，删除  配方变更表 对象
	 * @param id
	 */
	void deleteFormulaChange(long formulaChangeId, int formulaChangeVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  配方变更表 对象
	 * @param formulaChangeIds
	 */
	void deleteFormulaChange(String formulaChangeIds);

	/**
	 * 根据ID串，删除多个  配方变更表 对象
	 * @param formulaChangeIds
	 */
	void deleteFormulaChange(String formulaChangeIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  配方变更表 对象
	 * @param formulaChangeIds
	 */
	void deleteFormulaChange(List<Long> formulaChangeIds);
	
	/**
	 * 根据ID，删除多个  配方变更表 对象
	 * @param formulaChangeIds
	 */
	void deleteFormulaChange(List<Long> formulaChangeIds, String eventTopic);

	/**
	 * 根据ID，还原  配方变更表 对象
	 * @param formulaChangeId
	 */
	void restoreFormulaChange(String formulaChangeIds);
	/**
	 * 根据ID，还原  配方变更表 对象
	 * @param formulaChangeId
	 */
	void restoreFormulaChange(long formulaChangeId);
	
	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormulaChange(RMFormulaChange formulaChange, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseFormulaChange(List<RMFormulaChange>  formulaChanges);
	
	void excelBatchImportBaseFormulaChange(List<RMFormulaChange>  formulaChanges);
	
	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormulaChange(RMFormulaChange formulaChange, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormulaChange(RMFormulaChange formulaChange,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormulaChange(RMFormulaChange formulaChange,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveFormulaChange(RMFormulaChange formulaChange, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeFormulaChange(RMFormulaChange formulaChange, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 配方变更表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<RMFormulaChange> findFormulaChanges(Page<RMFormulaChange> page,Criterion...criterions);
	
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
	 * @param FormulaChangeDealInfo 配方变更表DealInfo
	 * @return
	 */
	void saveDealInfo(RMFormulaChangeDealInfo dealInfo);

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
	 * 保存超级编辑的 配方变更表对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditFormulaChange(RMFormulaChange formulaChange, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,boolean... isImport);
	
	/**
	 * 保存超级编辑的 配方变更表对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditFormulaChange(RMFormulaChange formulaChange, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog,boolean... isImport);
	
	
	void importFormulaChangeWorkFlow(RMFormulaChange formulaChange, String viewCode);
	
		
	public void batchImportFormulaChangeWorkFlow(List<RMFormulaChange>  formulaChanges, View  view);
	
	
	public void batchSaveSuperEditFormulaChange(List<RMFormulaChange>  formulaChanges, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport);
	
	
	public void batchSaveFormulaChange(RMFormulaChange formulaChange, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view,List<Event>  events, String eventTopic, boolean... isImport);
	

	/**
	 * 保存  配方变更表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  配方变更表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  配方变更表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  配方变更表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog);
	
	/**
	 * 保存  配方变更表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
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
	 * 根据条件(多条件)获取指定页码的 配方变更表 集合
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
	void findFormulaChanges(Page<RMFormulaChange> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 配方变更表 集合
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
	void findFormulaChanges(Page<RMFormulaChange> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 配方变更表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findFormulaChanges(Page<RMFormulaChange> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	 * @param formulaChange  配方变更表
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(RMFormulaChange formulaChange, Long tableInfoId,String scriptCode);
	
	/**
	 * 弃审生效单据
	 * 
	 * @param formulaChange  配方变更表
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(RMFormulaChange formulaChange, Long tableInfoId,String scriptCode,SignatureLog signatureLog);
	
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
	
	List<RMFormulaChange> getFormulaChanges(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<RMFormulaChange> findFormulaChangesBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<RMFormulaChange> findFormulaChangesByHql(String hql, Object... objects);
	
	RMFormulaChange loadFormulaChangeByBussinessKey(RMFormulaChange formulaChange);
	
	Page<RMFormulaChange> getFormulaChanges(Page<RMFormulaChange> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportFormulaChange(List<RMFormulaChange> formulaChanges, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportFormulaChange(List<RMFormulaChange> formulaChanges);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportFormulaChange(List<RMFormulaChange> formulaChanges, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportFormulaChange(List<RMFormulaChange> formulaChanges);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportFormulaChange(List<RMFormulaChange> insertObjs, List<RMFormulaChange> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportFormulaChange(List<RMFormulaChange> insertObjs, List<RMFormulaChange> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * 获取单据状态
	 * @param tableInfoIds
	 */
	public List<RMFormulaChange> getTableInfoStatus(List<RMFormulaChange> models, boolean isPendingQuery, Long ... deploymentId);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public RMFormulaChange loadFormulaChangeByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<RMFormulaChange> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public RMFormulaChange findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchFormulaChangeWorkFlow(List<RMFormulaChange> insertObjs, List<RMFormulaChange> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(基础)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchFormulaChangeWorkFlow(List<RMFormulaChange> insertObjs, List<RMFormulaChange> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	
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
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	void saveFormulaChange(RMFormulaChange formulaChange, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	void saveFormulaChange(RMFormulaChange formulaChange, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	void saveFormulaChange(RMFormulaChange formulaChange, DataGridService dataGridService);

	/**
	 * 导入保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> formulaChangeDataGridImport(RMFormulaChange formulaChange, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveFormulaChange(RMFormulaChange formulaChange, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  配方变更表 对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	void mergeFormulaChange(RMFormulaChange formulaChange, DataGridService dataGridService);
	
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
	Page<RMFormulaChange> getByPage(Page<RMFormulaChange> page,
			DetachedCriteria detachedCriteria);
	
	
		/**
	 * 保存超级编辑的 配方变更表对象
	 * @param formulaChange  配方变更表
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditFormulaChange(RMFormulaChange formulaChange, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode,boolean... isImport);
	
	public void batchSaveSuperEditFormulaChange(List<RMFormulaChange>  formulaChanges, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport);
	
	
	/**
	 * 保存  配方变更表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配方变更表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);

	/**
	 * 保存  配方变更表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配方变更表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormulaChange formulaChange,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);
	
	
	void findBusinessKeyUsed(long formulaChangeId);
	
	void generateFormulaChangeCodes(RMFormulaChange formulaChange) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateFormulaChangeCodes(RMFormulaChange formulaChange, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateFormulaChangeSummarys(RMFormulaChange formulaChange) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateFormulaChangeSummarys(RMFormulaChange formulaChange, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String getWorkFlowVarStatus(WorkFlowVar workFlowVar);
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<RMFormulaChange> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(RMFormulaChange formulaChange);
	
	void dealDatagridsSave(RMFormulaChange formulaChange,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码
    /**
	 * 获取配方表是否生效或者废除
	 * @param formulaId
	 * @return
	 */
	public Integer selectFormula(Long formulaId);
/* CUSTOM CODE END */
}
