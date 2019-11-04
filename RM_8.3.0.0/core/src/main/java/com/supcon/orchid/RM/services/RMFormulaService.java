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

import com.supcon.orchid.RM.entities.RMFormulaDealInfo;
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
/* CUSTOM CODE START(service,import,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
import java.math.BigDecimal;
/* CUSTOM CODE END */
public interface RMFormulaService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 配方表 对象
	 * @param id
	 * @return
	 */
	RMFormula getFormula(long id);

	/**
	 * 根据ID，获取 配方表 对象
	 * @param id
	 * @return
	 */
	RMFormula getFormula(long id, String viewCode);

	/**
	 * 根据ID，获取 配方表 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getFormulaAsJSON(long id, String include);

	/**
	 * 删除  配方表 对象
	 * @param formula 配方表
	 */
	void deleteFormula(RMFormula formula);

		
	/**
	 * 根据ID，删除  配方表 对象
	 * @param id
	 */
	void deleteFormula(long formulaId, int formulaVersion);

	/**
	 * 根据ID，删除  配方表 对象
	 * @param id
	 */
	void deleteFormula(long formulaId, int formulaVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  配方表 对象
	 * @param formulaIds
	 */
	void deleteFormula(String formulaIds);

	/**
	 * 根据ID串，删除多个  配方表 对象
	 * @param formulaIds
	 */
	void deleteFormula(String formulaIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  配方表 对象
	 * @param formulaIds
	 */
	void deleteFormula(List<Long> formulaIds);
	
	/**
	 * 根据ID，删除多个  配方表 对象
	 * @param formulaIds
	 */
	void deleteFormula(List<Long> formulaIds, String eventTopic);

	/**
	 * 根据ID，还原  配方表 对象
	 * @param formulaId
	 */
	void restoreFormula(String formulaIds);
	/**
	 * 根据ID，还原  配方表 对象
	 * @param formulaId
	 */
	void restoreFormula(long formulaId);
	
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormula(RMFormula formula, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseFormula(List<RMFormula>  formulas);
	
	void excelBatchImportBaseFormula(List<RMFormula>  formulas);
	
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormula(RMFormula formula, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormula(RMFormula formula,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormula(RMFormula formula,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveFormula(RMFormula formula, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeFormula(RMFormula formula, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 配方表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<RMFormula> findFormulas(Page<RMFormula> page,Criterion...criterions);
	
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
	 * @param FormulaDealInfo 配方表DealInfo
	 * @return
	 */
	void saveDealInfo(RMFormulaDealInfo dealInfo);

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
	 * 保存超级编辑的 配方表对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditFormula(RMFormula formula, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,boolean... isImport);
	
	/**
	 * 保存超级编辑的 配方表对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditFormula(RMFormula formula, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog,boolean... isImport);
	
	
	void importFormulaWorkFlow(RMFormula formula, String viewCode);
	
		
	public void batchImportFormulaWorkFlow(List<RMFormula>  formulas, View  view);
	
	
	public void batchSaveSuperEditFormula(List<RMFormula>  formulas, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport);
	
	
	public void batchSaveFormula(RMFormula formula, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view,List<Event>  events, String eventTopic, boolean... isImport);
	

	/**
	 * 保存  配方表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  配方表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  配方表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	/**
	 * 保存  配方表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog);
	
	/**
	 * 保存  配方表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
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
	 * 根据条件(多条件)获取指定页码的 配方表 集合
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
	void findFormulas(Page<RMFormula> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 配方表 集合
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
	void findFormulas(Page<RMFormula> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 配方表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findFormulas(Page<RMFormula> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	 * @param formula  配方表
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(RMFormula formula, Long tableInfoId,String scriptCode);
	
	/**
	 * 弃审生效单据
	 * 
	 * @param formula  配方表
	 * @param tableInfoId
	 * @param scriptCode 弃审运行的脚本编码
	 */
	public void retrialThisTable(RMFormula formula, Long tableInfoId,String scriptCode,SignatureLog signatureLog);
	
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
	
	List<RMFormula> getFormulas(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<RMFormula> findFormulasBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<RMFormula> findFormulasByHql(String hql, Object... objects);
	
	RMFormula loadFormulaByBussinessKey(RMFormula formula);
	
	Page<RMFormula> getFormulas(Page<RMFormula> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportFormula(List<RMFormula> formulas, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportFormula(List<RMFormula> formulas);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportFormula(List<RMFormula> formulas, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportFormula(List<RMFormula> formulas);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportFormula(List<RMFormula> insertObjs, List<RMFormula> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportFormula(List<RMFormula> insertObjs, List<RMFormula> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * 获取单据状态
	 * @param tableInfoIds
	 */
	public List<RMFormula> getTableInfoStatus(List<RMFormula> models, boolean isPendingQuery, Long ... deploymentId);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public RMFormula loadFormulaByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<RMFormula> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public RMFormula findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchFormulaWorkFlow(List<RMFormula> insertObjs, List<RMFormula> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(基础)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchFormulaWorkFlow(List<RMFormula> insertObjs, List<RMFormula> updateObjs, List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	
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
	 * 根据条件(多条件)获取指定页码的 生产线-配方表 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1540451901057Page(Page<RMForLineFormula> dg1540451901057Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 工序-工作单元表 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1540451909387Page(Page<RMForProcessUnit> dg1540451909387Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 检验部门 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1497589621829Page(Page<RMCheckDepartmentSet> dg1497589621829Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 物品清单 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1491547759425Page(Page<RMFormulaBom> dg1491547759425Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 物品清单 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1491548186600Page(Page<RMFormulaBom> dg1491548186600Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1487242802285Page(Page<RMFormulaProcess> dg1487242802285Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 物品清单 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1503551511011Page(Page<RMFormulaBom> dg1503551511011Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1503642053482Page(Page<RMFormulaProcess> dg1503642053482Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 物品清单 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1503642053729Page(Page<RMFormulaBom> dg1503642053729Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 工序 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1488969463663Page(Page<RMFormulaProcess> dg1488969463663Page,RMFormula formula, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 物品清单 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param formula  配方表
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1504485505216Page(Page<RMFormulaBom> dg1504485505216Page,RMFormula formula, String condition, List<Object> params);
	 
	 
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void saveFormula(RMFormula formula, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void saveFormula(RMFormula formula, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void saveFormula(RMFormula formula, DataGridService dataGridService);

	/**
	 * 导入保存  配方表 对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> formulaDataGridImport(RMFormula formula, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveFormula(RMFormula formula, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  配方表 对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void mergeFormula(RMFormula formula, DataGridService dataGridService);
	
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
	Page<RMFormula> getByPage(Page<RMFormula> page,
			DetachedCriteria detachedCriteria);
	
	/**
	 * 获取检验部门列表
	 */
	public List<RMCheckDepartmentSet> getCheckDepartmentSetList(RMFormula formula);
	
		/**
	 * 保存超级编辑的 配方表对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditFormula(RMFormula formula, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode,boolean... isImport);
	
	public void batchSaveSuperEditFormula(List<RMFormula>  formulas, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport);
	
	
	/**
	 * 保存  配方表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配方表 对象，对应页面上的"保存"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void save(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);

	/**
	 * 保存  配方表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配方表 对象，对应页面上的"提交"操作（仅工作流）
	 * 
	 * @param tableInfoId
	 * @return
	 */
	void submit(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService);
	
	
	void findBusinessKeyUsed(long formulaId);
	
	void generateFormulaCodes(RMFormula formula) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateFormulaCodes(RMFormula formula, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateFormulaSummarys(RMFormula formula) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateFormulaSummarys(RMFormula formula, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String getWorkFlowVarStatus(WorkFlowVar workFlowVar);
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<RMFormula> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(RMFormula formula);
	
	void dealDatagridsSave(RMFormula formula,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
   /**
	 * 设置启用停用
	 * @param ids 配方表的id
	 * @param state 配方表
	 */
	public void updateFomulaState(String ids,String state);
  
   /**
	 * 设置默认
	 * @param fid 配方表id
	 * @param isDefault 配方默认
	 */
	public void updateDefault(Long id,Boolean isDefault);
   /**
	 * 更新变更用途
	 * @param id 配方表id
	 * @param usedForid 用于
	 * @param isForPro 生产性质
	 */
	public void updateUseChange(Long id,String usedForid,Boolean isForPro);
   /**
	 * 查找有默认的配方并且设置为false
	 * @param productId
	 * @return
	 */
	public void selectIsDefault(Long productId);
	/**
	 * 返回配方标识
	 * @param productId
	 * @return
	 */
	public String fomulaName(Long productId);
   
  //删除工序时，将所对应的活动、工艺指标进行删除
	
		public Boolean processDelete(Long processId);
  
 	/**
	 * 升版
	 * @param formulaName 编码
	 * @param formulaCode 标示
	 * @param id 配方表id
	 * @param usedForid 用于
	 * @param isForPro 生产性质
	 */
	public void upFormulaVersion(Long formulaId,String editionName,Long deployId, String formulaCode, String formulaName);
	
	/**
	 * 复制
	 * @param formulaName 编码
	 * @param formulaCode 标示
	 * @param id 配方表id
	 * @param usedForid 用于
	 * @param isForPro 生产性质
	 */
	public void copyFormula(Long formulaId,String editionName,Long deployId, String formulaCode, String formulaName);
  
	boolean checkFormulaType(Long processTypeId);
	
	/**
	 * 验证配方是否已存在
	 * @param code 编码
	 * @param name 标识
	 * @param edition 版本
	 * @return
	 */
	public boolean isExists(String code,String name, String edition);
	
	/**
	 * 复制配方活动
	 * @param processId 原工序id
	 * @param refProcessId 参照的工序id
	 * @return 参照成功与否
	 */
	String copyFormulaProcessActivity(String processId, String refProcessId);
	
	/**
	 * 物料替换列表查询接口
	 * @param productId 物料id
	 * @return 配方列表
	 */
	public List<RMFormula> getProduceReplaceList(List<Param> params, int pageNo,int pageSize);

	public int getProduceReplaceListCount(List<Param> params, int pageNo, int pageSize);
	
	/**
	 * 保存超级编辑的 配方表对象
	 * @param formula  配方表
	 * @param dataGridService DataGridService对象
	 */
	void saveSuperEditFormulaCustom(RMFormula formula, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	//获取生产线配方表的nextId
	public long getForLineFormulaNextId();
  
    /**
     * 获取指定物品对应的配方最大版本号
     * @param productId
     * @return
     */
    BigDecimal getLatestFormulaEdition(Long productId);
  /***
	 * 根据工序id和formuid保存执行顺序
	 * @param processId
	 * @param formulaId
	 * @param procSort
	 */
	public void saveProcSort(Long processId,Long formulaId,String procSort);
/* CUSTOM CODE END */
}
