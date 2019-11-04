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

import com.supcon.orchid.utils.Param;
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
/* CUSTOM CODE START(service,import,RM_7.5.0.0_suitedLine_ProcessUnitChoice,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface RMProcessUnitChoiceService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 工作单元多选表 对象
	 * @param id
	 * @return
	 */
	RMProcessUnitChoice getProcessUnitChoice(long id);

	/**
	 * 根据ID，获取 工作单元多选表 对象
	 * @param id
	 * @return
	 */
	RMProcessUnitChoice getProcessUnitChoice(long id, String viewCode);

	/**
	 * 根据ID，获取 工作单元多选表 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getProcessUnitChoiceAsJSON(long id, String include);

	/**
	 * 删除  工作单元多选表 对象
	 * @param processUnitChoice 工作单元多选表
	 */
	void deleteProcessUnitChoice(RMProcessUnitChoice processUnitChoice);

		
	/**
	 * 根据ID，删除  工作单元多选表 对象
	 * @param id
	 */
	void deleteProcessUnitChoice(long processUnitChoiceId, int processUnitChoiceVersion);

	/**
	 * 根据ID，删除  工作单元多选表 对象
	 * @param id
	 */
	void deleteProcessUnitChoice(long processUnitChoiceId, int processUnitChoiceVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  工作单元多选表 对象
	 * @param processUnitChoiceIds
	 */
	void deleteProcessUnitChoice(String processUnitChoiceIds);

	/**
	 * 根据ID串，删除多个  工作单元多选表 对象
	 * @param processUnitChoiceIds
	 */
	void deleteProcessUnitChoice(String processUnitChoiceIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  工作单元多选表 对象
	 * @param processUnitChoiceIds
	 */
	void deleteProcessUnitChoice(List<Long> processUnitChoiceIds);
	
	/**
	 * 根据ID，删除多个  工作单元多选表 对象
	 * @param processUnitChoiceIds
	 */
	void deleteProcessUnitChoice(List<Long> processUnitChoiceIds, String eventTopic);

	/**
	 * 根据ID，还原  工作单元多选表 对象
	 * @param processUnitChoiceId
	 */
	void restoreProcessUnitChoice(String processUnitChoiceIds);
	/**
	 * 根据ID，还原  工作单元多选表 对象
	 * @param processUnitChoiceId
	 */
	void restoreProcessUnitChoice(long processUnitChoiceId);
	
	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseProcessUnitChoice(List<RMProcessUnitChoice>  processUnitChoices);
	
	void excelBatchImportBaseProcessUnitChoice(List<RMProcessUnitChoice>  processUnitChoices);
	
	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeProcessUnitChoice(RMProcessUnitChoice processUnitChoice, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 工作单元多选表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<RMProcessUnitChoice> findProcessUnitChoices(Page<RMProcessUnitChoice> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 工作单元多选表 集合
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
	void findProcessUnitChoices(Page<RMProcessUnitChoice> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 工作单元多选表 集合
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
	void findProcessUnitChoices(Page<RMProcessUnitChoice> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 工作单元多选表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findProcessUnitChoices(Page<RMProcessUnitChoice> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	
	List<RMProcessUnitChoice> getProcessUnitChoices(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<RMProcessUnitChoice> findProcessUnitChoicesBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<RMProcessUnitChoice> findProcessUnitChoicesByHql(String hql, Object... objects);
	
	RMProcessUnitChoice loadProcessUnitChoiceByBussinessKey(RMProcessUnitChoice processUnitChoice);
	
	Page<RMProcessUnitChoice> getProcessUnitChoices(Page<RMProcessUnitChoice> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportProcessUnitChoice(List<RMProcessUnitChoice> processUnitChoices, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportProcessUnitChoice(List<RMProcessUnitChoice> processUnitChoices);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportProcessUnitChoice(List<RMProcessUnitChoice> processUnitChoices, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportProcessUnitChoice(List<RMProcessUnitChoice> processUnitChoices);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportProcessUnitChoice(List<RMProcessUnitChoice> insertObjs, List<RMProcessUnitChoice> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportProcessUnitChoice(List<RMProcessUnitChoice> insertObjs, List<RMProcessUnitChoice> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	void deleteProcessUnitChoiceByProcessUnit(List<Long> processUnitIds);
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public RMProcessUnitChoice loadProcessUnitChoiceByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<RMProcessUnitChoice> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public RMProcessUnitChoice findEntityByProperty(String propertyName, Object object);
	
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
	 * 批量导入excel数据(表单)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchProcessUnitChoice(List<RMProcessUnitChoice> insertObjs, List<RMProcessUnitChoice> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(表单)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchProcessUnitChoice(List<RMProcessUnitChoice> insertObjs, List<RMProcessUnitChoice> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<RMProcessUnitChoice> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model,Map excelParamsMap);
	
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
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dataGridService DataGridService对象
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dataGridService DataGridService对象
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dataGridService DataGridService对象
	 */
	void saveProcessUnitChoice(RMProcessUnitChoice processUnitChoice, DataGridService dataGridService);

	/**
	 * 导入保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> processUnitChoiceDataGridImport(RMProcessUnitChoice processUnitChoice, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveProcessUnitChoice(RMProcessUnitChoice processUnitChoice, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  工作单元多选表 对象
	 * @param processUnitChoice  工作单元多选表
	 * @param dataGridService DataGridService对象
	 */
	void mergeProcessUnitChoice(RMProcessUnitChoice processUnitChoice, DataGridService dataGridService);
	
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
	Page<RMProcessUnitChoice> getByPage(Page<RMProcessUnitChoice> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long processUnitChoiceId);
	
	void generateProcessUnitChoiceCodes(RMProcessUnitChoice processUnitChoice) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProcessUnitChoiceCodes(RMProcessUnitChoice processUnitChoice, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProcessUnitChoiceSummarys(RMProcessUnitChoice processUnitChoice) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProcessUnitChoiceSummarys(RMProcessUnitChoice processUnitChoice, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<RMProcessUnitChoice> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(RMProcessUnitChoice processUnitChoice);
	
	void dealDatagridsSave(RMProcessUnitChoice processUnitChoice,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,RM_7.5.0.0_suitedLine_ProcessUnitChoice,RM_7.5.0.0) */
// 自定义代码
	/**
	 * Excel 使用产线批量编辑，校验工作单元
	 * @param importPropInfo
	 */
	public String chcekProcessUnits(String bottomPtProcessUnitIDUnitIds, String processNames);
/* CUSTOM CODE END */
}
