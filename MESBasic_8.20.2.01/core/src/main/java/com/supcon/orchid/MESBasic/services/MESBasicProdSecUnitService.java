package com.supcon.orchid.MESBasic.services;
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
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicCommDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;
import com.supcon.orchid.MESBasic.entities.MESBasicProdDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicProdLevel;
import com.supcon.orchid.MESBasic.entities.MESBasicProdResetDaily;
import com.supcon.orchid.MESBasic.entities.MESBasicProdSecUnit;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicProductCost;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchInformation;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchRelationship;
import com.supcon.orchid.MESBasic.entities.MESBasicClearSinget;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceSyncLog;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicObjBatContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicObjEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicObjPostion;
import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicObjTeam;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicPositionDeal;
import com.supcon.orchid.MESBasic.entities.MESBasicDepartmentWare;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;
import com.supcon.orchid.MESBasic.entities.MESBasicCustomerMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicContainerExp;
import com.supcon.orchid.MESBasic.entities.MESBasicFlowRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicFunctionInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicMaintainLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.entities.MESBasicArea;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClass;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicProdattrel;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroup;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroupMember;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndex;
import com.supcon.orchid.MESBasic.entities.MESBasicOriginalSignal;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicEamType;
/* CUSTOM CODE START(service,import,MESBasic_1_product_ProdSecUnit,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
public interface MESBasicProdSecUnitService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 物品辅单位表 对象
	 * @param id
	 * @return
	 */
	MESBasicProdSecUnit getProdSecUnit(long id);

	/**
	 * 根据ID，获取 物品辅单位表 对象
	 * @param id
	 * @return
	 */
	MESBasicProdSecUnit getProdSecUnit(long id, String viewCode);

	/**
	 * 根据ID，获取 物品辅单位表 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getProdSecUnitAsJSON(long id, String include);

	/**
	 * 删除  物品辅单位表 对象
	 * @param prodSecUnit 物品辅单位表
	 */
	void deleteProdSecUnit(MESBasicProdSecUnit prodSecUnit);

		
	/**
	 * 根据ID，删除  物品辅单位表 对象
	 * @param id
	 */
	void deleteProdSecUnit(long prodSecUnitId, int prodSecUnitVersion);

	/**
	 * 根据ID，删除  物品辅单位表 对象
	 * @param id
	 */
	void deleteProdSecUnit(long prodSecUnitId, int prodSecUnitVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  物品辅单位表 对象
	 * @param prodSecUnitIds
	 */
	void deleteProdSecUnit(String prodSecUnitIds);

	/**
	 * 根据ID串，删除多个  物品辅单位表 对象
	 * @param prodSecUnitIds
	 */
	void deleteProdSecUnit(String prodSecUnitIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  物品辅单位表 对象
	 * @param prodSecUnitIds
	 */
	void deleteProdSecUnit(List<Long> prodSecUnitIds);
	
	/**
	 * 根据ID，删除多个  物品辅单位表 对象
	 * @param prodSecUnitIds
	 */
	void deleteProdSecUnit(List<Long> prodSecUnitIds, String eventTopic);

	/**
	 * 根据ID，还原  物品辅单位表 对象
	 * @param prodSecUnitId
	 */
	void restoreProdSecUnit(String prodSecUnitIds);
	/**
	 * 根据ID，还原  物品辅单位表 对象
	 * @param prodSecUnitId
	 */
	void restoreProdSecUnit(long prodSecUnitId);
	
	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseProdSecUnit(List<MESBasicProdSecUnit>  prodSecUnits);
	
	void excelBatchImportBaseProdSecUnit(List<MESBasicProdSecUnit>  prodSecUnits);
	
	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeProdSecUnit(MESBasicProdSecUnit prodSecUnit, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 物品辅单位表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicProdSecUnit> findProdSecUnits(Page<MESBasicProdSecUnit> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 物品辅单位表 集合
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
	void findProdSecUnits(Page<MESBasicProdSecUnit> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 物品辅单位表 集合
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
	void findProdSecUnits(Page<MESBasicProdSecUnit> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 物品辅单位表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findProdSecUnits(Page<MESBasicProdSecUnit> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	
	List<MESBasicProdSecUnit> getProdSecUnits(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<MESBasicProdSecUnit> findProdSecUnitsBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<MESBasicProdSecUnit> findProdSecUnitsByHql(String hql, Object... objects);
	
	MESBasicProdSecUnit loadProdSecUnitByBussinessKey(MESBasicProdSecUnit prodSecUnit);
	
	Page<MESBasicProdSecUnit> getProdSecUnits(Page<MESBasicProdSecUnit> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	//===================树形PT=======================
	List<MESBasicProdSecUnit> findByTreeDataGridProduct(List<MESBasicProdSecUnit> treeList);
	//=======================普通PT==================================
	void findByNormalDataGridProduct(Page<MESBasicProdSecUnit> dgPage);
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportProdSecUnit(List<MESBasicProdSecUnit> prodSecUnits, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportProdSecUnit(List<MESBasicProdSecUnit> prodSecUnits);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportProdSecUnit(List<MESBasicProdSecUnit> prodSecUnits, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportProdSecUnit(List<MESBasicProdSecUnit> prodSecUnits);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportProdSecUnit(List<MESBasicProdSecUnit> insertObjs, List<MESBasicProdSecUnit> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportProdSecUnit(List<MESBasicProdSecUnit> insertObjs, List<MESBasicProdSecUnit> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public MESBasicProdSecUnit loadProdSecUnitByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<MESBasicProdSecUnit> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public MESBasicProdSecUnit findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchProdSecUnit(List<MESBasicProdSecUnit> insertObjs, List<MESBasicProdSecUnit> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(表单)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchProdSecUnit(List<MESBasicProdSecUnit> insertObjs, List<MESBasicProdSecUnit> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<MESBasicProdSecUnit> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model,Map excelParamsMap);
	
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
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dataGridService DataGridService对象
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dataGridService DataGridService对象
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dataGridService DataGridService对象
	 */
	void saveProdSecUnit(MESBasicProdSecUnit prodSecUnit, DataGridService dataGridService);

	/**
	 * 导入保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> prodSecUnitDataGridImport(MESBasicProdSecUnit prodSecUnit, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveProdSecUnit(MESBasicProdSecUnit prodSecUnit, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  物品辅单位表 对象
	 * @param prodSecUnit  物品辅单位表
	 * @param dataGridService DataGridService对象
	 */
	void mergeProdSecUnit(MESBasicProdSecUnit prodSecUnit, DataGridService dataGridService);
	
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
	Page<MESBasicProdSecUnit> getByPage(Page<MESBasicProdSecUnit> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long prodSecUnitId);
	
	void generateProdSecUnitCodes(MESBasicProdSecUnit prodSecUnit) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProdSecUnitCodes(MESBasicProdSecUnit prodSecUnit, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProdSecUnitSummarys(MESBasicProdSecUnit prodSecUnit) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateProdSecUnitSummarys(MESBasicProdSecUnit prodSecUnit, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<MESBasicProdSecUnit> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(MESBasicProdSecUnit prodSecUnit);
	
	void dealDatagridsSave(MESBasicProdSecUnit prodSecUnit,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,MESBasic_1_product_ProdSecUnit,MESBasic_1) */
// 自定义代码
  
  	/**
	 * 获取辅单位
	 * @param goodCode
	 * @return
	 */
	public List<MESBasicProdSecUnit> getProdUnit(String goodCode );
/* CUSTOM CODE END */
}
