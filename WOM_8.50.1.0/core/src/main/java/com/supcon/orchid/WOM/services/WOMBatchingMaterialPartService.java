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
/* CUSTOM CODE START(service,import,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface WOMBatchingMaterialPartService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 配料记录 对象
	 * @param id
	 * @return
	 */
	WOMBatchingMaterialPart getBatchingMaterialPart(long id);

	/**
	 * 根据ID，获取 配料记录 对象
	 * @param id
	 * @return
	 */
	WOMBatchingMaterialPart getBatchingMaterialPart(long id, String viewCode);

	/**
	 * 根据ID，获取 配料记录 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getBatchingMaterialPartAsJSON(long id, String include);

	/**
	 * 删除  配料记录 对象
	 * @param batchingMaterialPart 配料记录
	 */
	void deleteBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart);

		
	/**
	 * 根据ID，删除  配料记录 对象
	 * @param id
	 */
	void deleteBatchingMaterialPart(long batchingMaterialPartId, int batchingMaterialPartVersion);

	/**
	 * 根据ID，删除  配料记录 对象
	 * @param id
	 */
	void deleteBatchingMaterialPart(long batchingMaterialPartId, int batchingMaterialPartVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  配料记录 对象
	 * @param batchingMaterialPartIds
	 */
	void deleteBatchingMaterialPart(String batchingMaterialPartIds);

	/**
	 * 根据ID串，删除多个  配料记录 对象
	 * @param batchingMaterialPartIds
	 */
	void deleteBatchingMaterialPart(String batchingMaterialPartIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  配料记录 对象
	 * @param batchingMaterialPartIds
	 */
	void deleteBatchingMaterialPart(List<Long> batchingMaterialPartIds);
	
	/**
	 * 根据ID，删除多个  配料记录 对象
	 * @param batchingMaterialPartIds
	 */
	void deleteBatchingMaterialPart(List<Long> batchingMaterialPartIds, String eventTopic);

	/**
	 * 根据ID，还原  配料记录 对象
	 * @param batchingMaterialPartId
	 */
	void restoreBatchingMaterialPart(String batchingMaterialPartIds);
	/**
	 * 根据ID，还原  配料记录 对象
	 * @param batchingMaterialPartId
	 */
	void restoreBatchingMaterialPart(long batchingMaterialPartId);
	
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseBatchingMaterialPart(List<WOMBatchingMaterialPart>  batchingMaterialParts);
	
	void excelBatchImportBaseBatchingMaterialPart(List<WOMBatchingMaterialPart>  batchingMaterialParts);
	
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 配料记录 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<WOMBatchingMaterialPart> findBatchingMaterialParts(Page<WOMBatchingMaterialPart> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 配料记录 集合
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
	void findBatchingMaterialParts(Page<WOMBatchingMaterialPart> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 配料记录 集合
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
	void findBatchingMaterialParts(Page<WOMBatchingMaterialPart> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 配料记录 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findBatchingMaterialParts(Page<WOMBatchingMaterialPart> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	
	List<WOMBatchingMaterialPart> getBatchingMaterialParts(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<WOMBatchingMaterialPart> findBatchingMaterialPartsBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<WOMBatchingMaterialPart> findBatchingMaterialPartsByHql(String hql, Object... objects);
	
	WOMBatchingMaterialPart loadBatchingMaterialPartByBussinessKey(WOMBatchingMaterialPart batchingMaterialPart);
	
	Page<WOMBatchingMaterialPart> getBatchingMaterialParts(Page<WOMBatchingMaterialPart> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	//===================树形PT=======================
	List<WOMBatchingMaterialPart> findByTreeDataGridBatchingMaterial(List<WOMBatchingMaterialPart> treeList);
	//=======================普通PT==================================
	void findByNormalDataGridBatchingMaterial(Page<WOMBatchingMaterialPart> dgPage);
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportBatchingMaterialPart(List<WOMBatchingMaterialPart> batchingMaterialParts, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportBatchingMaterialPart(List<WOMBatchingMaterialPart> batchingMaterialParts);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportBatchingMaterialPart(List<WOMBatchingMaterialPart> batchingMaterialParts, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportBatchingMaterialPart(List<WOMBatchingMaterialPart> batchingMaterialParts);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportBatchingMaterialPart(List<WOMBatchingMaterialPart> insertObjs, List<WOMBatchingMaterialPart> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportBatchingMaterialPart(List<WOMBatchingMaterialPart> insertObjs, List<WOMBatchingMaterialPart> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public WOMBatchingMaterialPart loadBatchingMaterialPartByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<WOMBatchingMaterialPart> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public WOMBatchingMaterialPart findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchBatchingMaterialPart(List<WOMBatchingMaterialPart> insertObjs, 
			List<WOMBatchingMaterialPart> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * 批量导入excel数据(表单辅模型)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchBatchingMaterialPart(List<WOMBatchingMaterialPart> insertObjs, 
			List<WOMBatchingMaterialPart> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<WOMBatchingMaterialPart> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model,Map excelParamsMap);
	
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
	 * 根据条件(多条件)获取指定页码的 退料记录 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param batchingMaterialPart  配料记录
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1543461038761Page(Page<WOMBatchingRejectParts> dg1543461038761Page,WOMBatchingMaterialPart batchingMaterialPart, String condition, List<Object> params);
	/**
	 * 根据条件(多条件)获取指定页码的 退料记录 集合(针对编辑页面datagrid)
	 * 
	 * @param page
	 * @param batchingMaterialPart  配料记录
	 * @param condition 配置datagrid时配置的自定义SQL
	 */
	 void findDg1543470616564Page(Page<WOMBatchingRejectParts> dg1543470616564Page,WOMBatchingMaterialPart batchingMaterialPart, String condition, List<Object> params);
	 
	 
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dataGridService DataGridService对象
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dataGridService DataGridService对象
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dataGridService DataGridService对象
	 */
	void saveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, DataGridService dataGridService);

	/**
	 * 导入保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> batchingMaterialPartDataGridImport(WOMBatchingMaterialPart batchingMaterialPart, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  配料记录 对象
	 * @param batchingMaterialPart  配料记录
	 * @param dataGridService DataGridService对象
	 */
	void mergeBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart, DataGridService dataGridService);
	
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
	Page<WOMBatchingMaterialPart> getByPage(Page<WOMBatchingMaterialPart> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long batchingMaterialPartId);
	
	void generateBatchingMaterialPartCodes(WOMBatchingMaterialPart batchingMaterialPart) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateBatchingMaterialPartCodes(WOMBatchingMaterialPart batchingMaterialPart, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateBatchingMaterialPartSummarys(WOMBatchingMaterialPart batchingMaterialPart) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateBatchingMaterialPartSummarys(WOMBatchingMaterialPart batchingMaterialPart, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<WOMBatchingMaterialPart> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(WOMBatchingMaterialPart batchingMaterialPart);
	
	void dealDatagridsSave(WOMBatchingMaterialPart batchingMaterialPart,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码
	 /**
	 * 根基partid更改状态为已配送
	 * @return
	 * @throws Exception
	 */
	public boolean batch(String partIds);
  	/**
	 * 将配料数量累加到表体批送数量
	 * @return
	 * @throws Exception
	 */
  	public void addDownNum(WOMBatchingMaterialPart batchingMaterialPart);
  
  	
	/**
  	 * PDA获取配料分组列表
  	 * @param factoryCode
  	 * @return
  	 */
  	public List<Map<String, Object>> getBatchMaterialWorkunitBatch(String factoryCode);

  	/**
  	 * PDA获取配料明细列表
  	 * @param factoryID
  	 * @param taskBatch
  	 * @return
  	 */
  	public List<Map<String, Object>> getBatchMaterialDetail(String factoryID,
			String taskBatch);

  	/**
  	 * PDA更改配料状态回填配料接收人接收时间
  	 * @param batchMaterialDetailID
  	 * @param userName
  	 * @return
  	 */
  	public void updateBatchMaterialDetail(String batchMaterialDetailID,
			String userName);
  
  
  	/**
	 * 将配料记录的状态改为已投料
	 */
	public void updateBatchMaterialState(WOMBatchingMaterialPart part);
  
  	/**
	 * 将批量配料的datagrid的json转成对象保存
	 */
	public void saveJsonPart(String dglist);
  	
  	/**
	 * 打印后，相应数据打印次数+1
	 */
	public void addPrintCount(String printDataIds);
  
  	/**
	 * 检查是否编辑
	 */
	public boolean checkEdit(Map<String, String> params);
  
  	/**
	 * 检查是否编辑
	 */
	public void arrayDelete(List<Long> batchingMaterialPartIds);
	
	//退料记录批量保存
	public void saveBatchingMaterialPartCustom(WOMBatchingMaterialPart batchingMaterialPart,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport);

  	//配料记录状态查询
	public String checkHasWaitPutinRecord(String batchingMaterialPartIds);
  
  	/*
	 * 获取打印参数
	 */
	public Map getPrintParam();
/* CUSTOM CODE END */
}
