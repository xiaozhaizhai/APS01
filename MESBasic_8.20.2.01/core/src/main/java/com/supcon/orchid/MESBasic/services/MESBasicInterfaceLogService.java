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

import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLogDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.ec.entities.EntityTableInfo;
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
/* CUSTOM CODE START(service,import,MESBasic_1_pimsInterface_InterfaceLog,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
public interface MESBasicInterfaceLogService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 调度日志 对象
	 * @param id
	 * @return
	 */
	MESBasicInterfaceLog getInterfaceLog(long id);

	/**
	 * 根据ID，获取 调度日志 对象
	 * @param id
	 * @return
	 */
	MESBasicInterfaceLog getInterfaceLog(long id, String viewCode);

	/**
	 * 根据ID，获取 调度日志 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getInterfaceLogAsJSON(long id, String include);

	/**
	 * 删除  调度日志 对象
	 * @param interfaceLog 调度日志
	 */
	void deleteInterfaceLog(MESBasicInterfaceLog interfaceLog);

		
	/**
	 * 根据ID，删除  调度日志 对象
	 * @param id
	 */
	void deleteInterfaceLog(long interfaceLogId, int interfaceLogVersion);

	/**
	 * 根据ID，删除  调度日志 对象
	 * @param id
	 */
	void deleteInterfaceLog(long interfaceLogId, int interfaceLogVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  调度日志 对象
	 * @param interfaceLogIds
	 */
	void deleteInterfaceLog(String interfaceLogIds);

	/**
	 * 根据ID串，删除多个  调度日志 对象
	 * @param interfaceLogIds
	 */
	void deleteInterfaceLog(String interfaceLogIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  调度日志 对象
	 * @param interfaceLogIds
	 */
	void deleteInterfaceLog(List<Long> interfaceLogIds);
	
	/**
	 * 根据ID，删除多个  调度日志 对象
	 * @param interfaceLogIds
	 */
	void deleteInterfaceLog(List<Long> interfaceLogIds, String eventTopic);

	/**
	 * 根据ID，还原  调度日志 对象
	 * @param interfaceLogId
	 */
	void restoreInterfaceLog(String interfaceLogIds);
	/**
	 * 根据ID，还原  调度日志 对象
	 * @param interfaceLogId
	 */
	void restoreInterfaceLog(long interfaceLogId);
	
	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseInterfaceLog(List<MESBasicInterfaceLog>  interfaceLogs);
	
	void excelBatchImportBaseInterfaceLog(List<MESBasicInterfaceLog>  interfaceLogs);
	
	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeInterfaceLog(MESBasicInterfaceLog interfaceLog, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 调度日志 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicInterfaceLog> findInterfaceLogs(Page<MESBasicInterfaceLog> page,Criterion...criterions);
	
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
	 * @param InterfaceLogDealInfo 调度日志DealInfo
	 * @return
	 */
	void saveDealInfo(MESBasicInterfaceLogDealInfo dealInfo);

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

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 调度日志 集合
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
	void findInterfaceLogs(Page<MESBasicInterfaceLog> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 调度日志 集合
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
	void findInterfaceLogs(Page<MESBasicInterfaceLog> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 调度日志 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findInterfaceLogs(Page<MESBasicInterfaceLog> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	
	List<MESBasicInterfaceLog> getInterfaceLogs(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<MESBasicInterfaceLog> findInterfaceLogsBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<MESBasicInterfaceLog> findInterfaceLogsByHql(String hql, Object... objects);
	
	MESBasicInterfaceLog loadInterfaceLogByBussinessKey(MESBasicInterfaceLog interfaceLog);
	
	Page<MESBasicInterfaceLog> getInterfaceLogs(Page<MESBasicInterfaceLog> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportInterfaceLog(List<MESBasicInterfaceLog> interfaceLogs, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportInterfaceLog(List<MESBasicInterfaceLog> interfaceLogs);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportInterfaceLog(List<MESBasicInterfaceLog> interfaceLogs, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportInterfaceLog(List<MESBasicInterfaceLog> interfaceLogs);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportInterfaceLog(List<MESBasicInterfaceLog> insertObjs, List<MESBasicInterfaceLog> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportInterfaceLog(List<MESBasicInterfaceLog> insertObjs, List<MESBasicInterfaceLog> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public MESBasicInterfaceLog loadInterfaceLogByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<MESBasicInterfaceLog> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public MESBasicInterfaceLog findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchInterfaceLog(List<MESBasicInterfaceLog> insertObjs, List<MESBasicInterfaceLog> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(表单)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchInterfaceLog(List<MESBasicInterfaceLog> insertObjs, List<MESBasicInterfaceLog> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	
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
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dataGridService DataGridService对象
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dataGridService DataGridService对象
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dataGridService DataGridService对象
	 */
	void saveInterfaceLog(MESBasicInterfaceLog interfaceLog, DataGridService dataGridService);

	/**
	 * 导入保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> interfaceLogDataGridImport(MESBasicInterfaceLog interfaceLog, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveInterfaceLog(MESBasicInterfaceLog interfaceLog, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  调度日志 对象
	 * @param interfaceLog  调度日志
	 * @param dataGridService DataGridService对象
	 */
	void mergeInterfaceLog(MESBasicInterfaceLog interfaceLog, DataGridService dataGridService);
	
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
	Page<MESBasicInterfaceLog> getByPage(Page<MESBasicInterfaceLog> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long interfaceLogId);
	
	void generateInterfaceLogCodes(MESBasicInterfaceLog interfaceLog) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateInterfaceLogCodes(MESBasicInterfaceLog interfaceLog, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateInterfaceLogSummarys(MESBasicInterfaceLog interfaceLog) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateInterfaceLogSummarys(MESBasicInterfaceLog interfaceLog, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<MESBasicInterfaceLog> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(MESBasicInterfaceLog interfaceLog);
	
	void dealDatagridsSave(MESBasicInterfaceLog interfaceLog,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,MESBasic_1_pimsInterface_InterfaceLog,MESBasic_1) */
// 自定义代码
 
	/**
	 * 通过PIMS提供的web api，向PIMS查询指定的位号的实时值
	 * @param tags 位号，多个位号使用‘,’隔开
	 * @return
	 * 位号的实时值
	 */
	public String getTagRealValue(String tags);
	
	/**
	 * 通过PIMS提供的web api，向PIMS查询指定的位号的实时值
	 * @param tags tags 位号，多个位号使用‘,’隔开
	 * @param startTime 查询的开始时间
	 * @param endTime 查询的结束时间
	 * @param interval 时间间隔，单位秒。默认1秒，如果需要使用默认值，请传入-1
	 * @param pageNo 页码.取值范围:大于零的整数; 默认值:1,即返回第一页数据，如果需要使用默认值，请传入-1
	 * @param pageSize 每页条数.取值范围:大于零的整数;最大值:1000;默认值:100，如果需要使用默认值，请传入-1
	 * @return
	 */
	public String getTagHistoryValue(String tags, Date startTime, Date endTime, int interval, int pageNo, int pageSize);
/* CUSTOM CODE END */
}
