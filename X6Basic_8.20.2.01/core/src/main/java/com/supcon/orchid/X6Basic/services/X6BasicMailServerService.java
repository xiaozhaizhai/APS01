package com.supcon.orchid.X6Basic.services;
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

import com.supcon.orchid.X6Basic.entities.X6BasicMailServerDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.entities.ProductManage;
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;
import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.X6Basic.entities.SignetSetting;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.X6Basic.entities.X6BasicAbook;
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;
/* CUSTOM CODE START(service,import,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface X6BasicMailServerService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 邮件服务器 对象
	 * @param id
	 * @return
	 */
	X6BasicMailServer getMailServer(long id);

	/**
	 * 根据ID，获取 邮件服务器 对象
	 * @param id
	 * @return
	 */
	X6BasicMailServer getMailServer(long id, String viewCode);

	/**
	 * 根据ID，获取 邮件服务器 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getMailServerAsJSON(long id, String include);

	/**
	 * 删除  邮件服务器 对象
	 * @param mailServer 邮件服务器
	 */
	void deleteMailServer(X6BasicMailServer mailServer);

		
	/**
	 * 根据ID，删除  邮件服务器 对象
	 * @param id
	 */
	void deleteMailServer(long mailServerId, int mailServerVersion);

	/**
	 * 根据ID，删除  邮件服务器 对象
	 * @param id
	 */
	void deleteMailServer(long mailServerId, int mailServerVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  邮件服务器 对象
	 * @param mailServerIds
	 */
	void deleteMailServer(String mailServerIds);

	/**
	 * 根据ID串，删除多个  邮件服务器 对象
	 * @param mailServerIds
	 */
	void deleteMailServer(String mailServerIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  邮件服务器 对象
	 * @param mailServerIds
	 */
	void deleteMailServer(List<Long> mailServerIds);
	
	/**
	 * 根据ID，删除多个  邮件服务器 对象
	 * @param mailServerIds
	 */
	void deleteMailServer(List<Long> mailServerIds, String eventTopic);

	/**
	 * 根据ID，还原  邮件服务器 对象
	 * @param mailServerId
	 */
	void restoreMailServer(String mailServerIds);
	/**
	 * 根据ID，还原  邮件服务器 对象
	 * @param mailServerId
	 */
	void restoreMailServer(long mailServerId);
	
	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveMailServer(X6BasicMailServer mailServer, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseMailServer(List<X6BasicMailServer>  mailServers);
	
	void excelBatchImportBaseMailServer(List<X6BasicMailServer>  mailServers);
	
	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveMailServer(X6BasicMailServer mailServer, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveMailServer(X6BasicMailServer mailServer,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveMailServer(X6BasicMailServer mailServer,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveMailServer(X6BasicMailServer mailServer, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeMailServer(X6BasicMailServer mailServer, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 邮件服务器 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<X6BasicMailServer> findMailServers(Page<X6BasicMailServer> page,Criterion...criterions);
	
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
	 * @param MailServerDealInfo 邮件服务器DealInfo
	 * @return
	 */
	void saveDealInfo(X6BasicMailServerDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 邮件服务器 集合
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
	void findMailServers(Page<X6BasicMailServer> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 邮件服务器 集合
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
	void findMailServers(Page<X6BasicMailServer> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 邮件服务器 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findMailServers(Page<X6BasicMailServer> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	
	List<X6BasicMailServer> getMailServers(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<X6BasicMailServer> findMailServersBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<X6BasicMailServer> findMailServersByHql(String hql, Object... objects);
	
	X6BasicMailServer loadMailServerByBussinessKey(X6BasicMailServer mailServer);
	
	Page<X6BasicMailServer> getMailServers(Page<X6BasicMailServer> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportMailServer(List<X6BasicMailServer> mailServers, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportMailServer(List<X6BasicMailServer> mailServers);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportMailServer(List<X6BasicMailServer> mailServers, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportMailServer(List<X6BasicMailServer> mailServers);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportMailServer(List<X6BasicMailServer> insertObjs, List<X6BasicMailServer> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportMailServer(List<X6BasicMailServer> insertObjs, List<X6BasicMailServer> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public X6BasicMailServer loadMailServerByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<X6BasicMailServer> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public X6BasicMailServer findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchMailServer(List<X6BasicMailServer> insertObjs, List<X6BasicMailServer> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(表单)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchMailServer(List<X6BasicMailServer> insertObjs, List<X6BasicMailServer> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	
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
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dataGridService DataGridService对象
	 */
	void saveMailServer(X6BasicMailServer mailServer, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dataGridService DataGridService对象
	 */
	void saveMailServer(X6BasicMailServer mailServer, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dataGridService DataGridService对象
	 */
	void saveMailServer(X6BasicMailServer mailServer, DataGridService dataGridService);

	/**
	 * 导入保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> mailServerDataGridImport(X6BasicMailServer mailServer, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveMailServer(X6BasicMailServer mailServer, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  邮件服务器 对象
	 * @param mailServer  邮件服务器
	 * @param dataGridService DataGridService对象
	 */
	void mergeMailServer(X6BasicMailServer mailServer, DataGridService dataGridService);
	
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
	Page<X6BasicMailServer> getByPage(Page<X6BasicMailServer> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long mailServerId);
	
	void generateMailServerCodes(X6BasicMailServer mailServer) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateMailServerCodes(X6BasicMailServer mailServer, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateMailServerSummarys(X6BasicMailServer mailServer) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateMailServerSummarys(X6BasicMailServer mailServer, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<X6BasicMailServer> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(X6BasicMailServer mailServer);
	
	void dealDatagridsSave(X6BasicMailServer mailServer,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
