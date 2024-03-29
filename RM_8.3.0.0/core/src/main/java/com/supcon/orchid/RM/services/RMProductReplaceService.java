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
/* CUSTOM CODE START(service,import,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface RMProductReplaceService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 物料替换 对象
	 * @param id
	 * @return
	 */
	RMProductReplace getProductReplace(long id);

	/**
	 * 根据ID，获取 物料替换 对象
	 * @param id
	 * @return
	 */
	RMProductReplace getProductReplace(long id, String viewCode);

	/**
	 * 根据ID，获取 物料替换 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getProductReplaceAsJSON(long id, String include);

	/**
	 * 删除  物料替换 对象
	 * @param productReplace 物料替换
	 */
	void deleteProductReplace(RMProductReplace productReplace);

		
	/**
	 * 根据ID，删除  物料替换 对象
	 * @param id
	 */
	void deleteProductReplace(long productReplaceId, int productReplaceVersion);

	/**
	 * 根据ID，删除  物料替换 对象
	 * @param id
	 */
	void deleteProductReplace(long productReplaceId, int productReplaceVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  物料替换 对象
	 * @param productReplaceIds
	 */
	void deleteProductReplace(String productReplaceIds);

	/**
	 * 根据ID串，删除多个  物料替换 对象
	 * @param productReplaceIds
	 */
	void deleteProductReplace(String productReplaceIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  物料替换 对象
	 * @param productReplaceIds
	 */
	void deleteProductReplace(List<Long> productReplaceIds);
	
	/**
	 * 根据ID，删除多个  物料替换 对象
	 * @param productReplaceIds
	 */
	void deleteProductReplace(List<Long> productReplaceIds, String eventTopic);

	/**
	 * 根据ID，还原  物料替换 对象
	 * @param productReplaceId
	 */
	void restoreProductReplace(String productReplaceIds);
	/**
	 * 根据ID，还原  物料替换 对象
	 * @param productReplaceId
	 */
	void restoreProductReplace(long productReplaceId);
	
	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProductReplace(RMProductReplace productReplace, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseProductReplace(List<RMProductReplace>  productReplaces);
	
	void excelBatchImportBaseProductReplace(List<RMProductReplace>  productReplaces);
	
	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProductReplace(RMProductReplace productReplace, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProductReplace(RMProductReplace productReplace,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProductReplace(RMProductReplace productReplace,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveProductReplace(RMProductReplace productReplace, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeProductReplace(RMProductReplace productReplace, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 物料替换 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<RMProductReplace> findProductReplaces(Page<RMProductReplace> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 物料替换 集合
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
	void findProductReplaces(Page<RMProductReplace> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 物料替换 集合
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
	void findProductReplaces(Page<RMProductReplace> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 物料替换 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findProductReplaces(Page<RMProductReplace> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	
	List<RMProductReplace> getProductReplaces(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<RMProductReplace> findProductReplacesBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<RMProductReplace> findProductReplacesByHql(String hql, Object... objects);
	
	RMProductReplace loadProductReplaceByBussinessKey(RMProductReplace productReplace);
	
	Page<RMProductReplace> getProductReplaces(Page<RMProductReplace> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportProductReplace(List<RMProductReplace> productReplaces, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportProductReplace(List<RMProductReplace> productReplaces);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportProductReplace(List<RMProductReplace> productReplaces, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportProductReplace(List<RMProductReplace> productReplaces);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportProductReplace(List<RMProductReplace> insertObjs, List<RMProductReplace> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportProductReplace(List<RMProductReplace> insertObjs, List<RMProductReplace> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public RMProductReplace loadProductReplaceByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<RMProductReplace> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public RMProductReplace findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchProductReplace(List<RMProductReplace> insertObjs, 
			List<RMProductReplace> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * 批量导入excel数据(表单辅模型)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchProductReplace(List<RMProductReplace> insertObjs, 
			List<RMProductReplace> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<RMProductReplace> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model,Map excelParamsMap);
	
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
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dataGridService DataGridService对象
	 */
	void saveProductReplace(RMProductReplace productReplace, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dataGridService DataGridService对象
	 */
	void saveProductReplace(RMProductReplace productReplace, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dataGridService DataGridService对象
	 */
	void saveProductReplace(RMProductReplace productReplace, DataGridService dataGridService);

	/**
	 * 导入保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> productReplaceDataGridImport(RMProductReplace productReplace, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveProductReplace(RMProductReplace productReplace, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  物料替换 对象
	 * @param productReplace  物料替换
	 * @param dataGridService DataGridService对象
	 */
	void mergeProductReplace(RMProductReplace productReplace, DataGridService dataGridService);
	
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
	Page<RMProductReplace> getByPage(Page<RMProductReplace> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long productReplaceId);
	
	void generateProductReplaceCodes(RMProductReplace productReplace) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProductReplaceCodes(RMProductReplace productReplace, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProductReplaceSummarys(RMProductReplace productReplace) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProductReplaceSummarys(RMProductReplace productReplace, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<RMProductReplace> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(RMProductReplace productReplace);
	
	void dealDatagridsSave(RMProductReplace productReplace,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) */
// 自定义代码
	public List<RMProductReplace> resetFormulaCode(List<RMProductReplace> productReplaceList);
/* CUSTOM CODE END */
}
