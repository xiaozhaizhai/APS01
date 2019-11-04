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

import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfoDealInfo;
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
/* CUSTOM CODE START(service,import,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface X6BasicTeamInfoService extends IBusinessKeyService {
	
	/**
	 * 获取父节点对象
	*/
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam);
	
	/**
	 * 根据ID，获取 班组 对象
	 * @param id
	 * @return
	 */
	X6BasicTeamInfo getTeamInfo(long id);

	/**
	 * 根据ID，获取 班组 对象
	 * @param id
	 * @return
	 */
	X6BasicTeamInfo getTeamInfo(long id, String viewCode);

	/**
	 * 根据ID，获取 班组 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getTeamInfoAsJSON(long id, String include);

	/**
	 * 删除  班组 对象
	 * @param teamInfo 班组
	 */
	void deleteTeamInfo(X6BasicTeamInfo teamInfo);

		
	/**
	 * 根据ID，删除  班组 对象
	 * @param id
	 */
	void deleteTeamInfo(long teamInfoId, int teamInfoVersion);

	/**
	 * 根据ID，删除  班组 对象
	 * @param id
	 */
	void deleteTeamInfo(long teamInfoId, int teamInfoVersion,SignatureLog signatureLog);

	/**
	 * 根据ID串，删除多个  班组 对象
	 * @param teamInfoIds
	 */
	void deleteTeamInfo(String teamInfoIds);

	/**
	 * 根据ID串，删除多个  班组 对象
	 * @param teamInfoIds
	 */
	void deleteTeamInfo(String teamInfoIds,SignatureLog signatureLog);

	/**
	 * 根据ID，删除多个  班组 对象
	 * @param teamInfoIds
	 */
	void deleteTeamInfo(List<Long> teamInfoIds);
	
	/**
	 * 根据ID，删除多个  班组 对象
	 * @param teamInfoIds
	 */
	void deleteTeamInfo(List<Long> teamInfoIds, String eventTopic);

	/**
	 * 根据ID，还原  班组 对象
	 * @param teamInfoId
	 */
	void restoreTeamInfo(String teamInfoIds);
	/**
	 * 根据ID，还原  班组 对象
	 * @param teamInfoId
	 */
	void restoreTeamInfo(long teamInfoId);
	
	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseTeamInfo(List<X6BasicTeamInfo>  teamInfos);
	
	void excelBatchImportBaseTeamInfo(List<X6BasicTeamInfo>  teamInfos);
	
	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dataGridService DataGridService对象
	 * 电子签名接口
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog,boolean... isImport);
	
	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeTeamInfo(X6BasicTeamInfo teamInfo, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 班组 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<X6BasicTeamInfo> findTeamInfos(Page<X6BasicTeamInfo> page,Criterion...criterions);
	
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
	 * @param TeamInfoDealInfo 班组DealInfo
	 * @return
	 */
	void saveDealInfo(X6BasicTeamInfoDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 班组 集合
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
	void findTeamInfos(Page<X6BasicTeamInfo> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap);

	/**
	 * 根据条件(多条件)获取指定页码的 班组 集合
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
	void findTeamInfos(Page<X6BasicTeamInfo> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 班组 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findTeamInfos(Page<X6BasicTeamInfo> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, Map exportMap, List<Param> params);
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
	
	List<X6BasicTeamInfo> getTeamInfos(String sql , List<Object> params);
	
	/**
	 * 通过sql获取实体list
	 * @param sql
	 * @param params
	 */
	public List<X6BasicTeamInfo> findTeamInfosBySql(String sql, List<Object> params);
	
	/**
	 * 通过hql获取实体list
	 * @param hql
	 * @param Object...
	 */
	public List<X6BasicTeamInfo> findTeamInfosByHql(String hql, Object... objects);
	
	X6BasicTeamInfo loadTeamInfoByBussinessKey(X6BasicTeamInfo teamInfo);
	
	Page<X6BasicTeamInfo> getTeamInfos(Page<X6BasicTeamInfo> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportTeamInfo(List<X6BasicTeamInfo> teamInfos, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportTeamInfo(List<X6BasicTeamInfo> teamInfos);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportTeamInfo(List<X6BasicTeamInfo> teamInfos, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportTeamInfo(List<X6BasicTeamInfo> teamInfos);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportTeamInfo(List<X6BasicTeamInfo> insertObjs, List<X6BasicTeamInfo> updateObjs, 
		List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportTeamInfo(List<X6BasicTeamInfo> insertObjs, List<X6BasicTeamInfo> updateObjs, 
		List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public X6BasicTeamInfo loadTeamInfoByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<X6BasicTeamInfo> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public X6BasicTeamInfo findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchTeamInfo(List<X6BasicTeamInfo> insertObjs, List<X6BasicTeamInfo> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo);
	
	/**
	 * 批量导入excel数据(表单)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchTeamInfo(List<X6BasicTeamInfo> insertObjs, List<X6BasicTeamInfo> updateObjs, List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog);
	
	
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
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dataGridService DataGridService对象
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dataGridService DataGridService对象
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dataGridService DataGridService对象
	 */
	void saveTeamInfo(X6BasicTeamInfo teamInfo, DataGridService dataGridService);

	/**
	 * 导入保存  班组 对象
	 * @param teamInfo  班组
	 * @param dataGridService DataGridService对象
	 */
	Map<Object, Object> teamInfoDataGridImport(X6BasicTeamInfo teamInfo, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport);
	
	public void batchSaveTeamInfo(X6BasicTeamInfo teamInfo, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  班组 对象
	 * @param teamInfo  班组
	 * @param dataGridService DataGridService对象
	 */
	void mergeTeamInfo(X6BasicTeamInfo teamInfo, DataGridService dataGridService);
	
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
	Page<X6BasicTeamInfo> getByPage(Page<X6BasicTeamInfo> page,
			DetachedCriteria detachedCriteria);
	
	
	
	
	void findBusinessKeyUsed(long teamInfoId);
	
	void generateTeamInfoCodes(X6BasicTeamInfo teamInfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateTeamInfoCodes(X6BasicTeamInfo teamInfo, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateTeamInfoSummarys(X6BasicTeamInfo teamInfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	void generateTeamInfoSummarys(X6BasicTeamInfo teamInfo, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	String generateCustomPropertySql(String viewCode, String sql);
	
	void commonQuery(Page<X6BasicTeamInfo> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects);
			
	String fLTL(String str);
	
	String fLTU(String str);
	
	void checkUniqueConstraint(X6BasicTeamInfo teamInfo);
	
	void dealDatagridsSave(X6BasicTeamInfo teamInfo,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);
	
	String generateTableNo();
	
	/* CUSTOM CODE START(service,functions,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) */
// 自定义代码
	List<X6BasicTeamInfo> findByHql(String hql, Object... objects);
	X6BasicTeamInfo findEntityByHql(String hql, Object... objects);
/* CUSTOM CODE END */
}
