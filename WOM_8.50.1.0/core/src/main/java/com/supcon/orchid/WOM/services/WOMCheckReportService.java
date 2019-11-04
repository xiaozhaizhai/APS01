package com.supcon.orchid.WOM.services;
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
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.entities.WOMCheckReport;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMMaterialBatchNums;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
/* CUSTOM CODE START(service,import,WOM_7.5.0.0_generalManage_CheckReport,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface WOMCheckReportService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 检验报告单 对象
	 * @param id
	 * @return
	 */
	WOMCheckReport getCheckReport(long id);

	/**
	 * 根据ID，获取 检验报告单 对象
	 * @param id
	 * @return
	 */
	WOMCheckReport getCheckReport(long id, String viewCode);

	/**
	 * 根据ID，获取 检验报告单 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getCheckReportAsJSON(long id, String include);

	/**
	 * 删除  检验报告单 对象
	 * @param checkReport 检验报告单
	 */
	void deleteCheckReport(WOMCheckReport checkReport);

	/**
	 * 根据ID，删除  检验报告单 对象
	 * @param id
	 */
	void deleteCheckReport(long checkReportId, int checkReportVersion);

	/**
	 * 根据ID串，删除多个  检验报告单 对象
	 * @param checkReportIds
	 */
	void deleteCheckReport(String checkReportIds);

	/**
	 * 根据ID，删除多个  检验报告单 对象
	 * @param checkReportIds
	 */
	void deleteCheckReport(List<Long> checkReportIds);
	
	/**
	 * 根据ID，删除多个  检验报告单 对象
	 * @param checkReportIds
	 */
	void deleteCheckReport(List<Long> checkReportIds, String eventTopic);

	/**
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveCheckReport(WOMCheckReport checkReport, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseCheckReport(List<WOMCheckReport>  checkReports);
	
	void excelBatchImportBaseCheckReport(List<WOMCheckReport>  checkReports);
	
	/**
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveCheckReport(WOMCheckReport checkReport, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);


	/**
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveCheckReport(WOMCheckReport checkReport,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeCheckReport(WOMCheckReport checkReport, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 检验报告单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<WOMCheckReport> findCheckReports(Page<WOMCheckReport> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 检验报告单 集合
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
	void findCheckReports(Page<WOMCheckReport> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql);

	/**
	 * 根据条件(多条件)获取指定页码的 检验报告单 集合
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
	void findCheckReports(Page<WOMCheckReport> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 检验报告单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findCheckReports(Page<WOMCheckReport> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, List<Param> params);
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
	
	List<WOMCheckReport> getCheckReports(String sql , List<Object> params);
	
	WOMCheckReport loadCheckReportByBussinessKey(WOMCheckReport checkReport);
	
	Page<WOMCheckReport> getCheckReports(Page<WOMCheckReport> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportCheckReport(List<WOMCheckReport> checkReports, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportCheckReport(List<WOMCheckReport> checkReports);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportCheckReport(List<WOMCheckReport> checkReports, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportCheckReport(List<WOMCheckReport> checkReports);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportCheckReport(List<WOMCheckReport> insertObjs, List<WOMCheckReport> updateObjs, List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportCheckReport(List<WOMCheckReport> insertObjs, List<WOMCheckReport> updateObjs, List<Map<String,String>> columnInfo);

	/* CUSTOM CODE START(service,functions,WOM_7.5.0.0_generalManage_CheckReport,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public WOMCheckReport loadCheckReportByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<WOMCheckReport> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public WOMCheckReport findEntityByProperty(String propertyName, Object object);
	
	/**
	 * 根据业务主键删除对象 以逗号分隔
	 * @param bussinessKey
	 */
	public void deleteByBussinessKeys(String bussinessKeys);
	
	/**
	 * 动态查询bap_validate_datagrids变量
	 */
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
	 * 根据业务主键名称获取所有业务主键数据
	 * @param bussinessKeyName
	 */
	public List<String> getBusinessKeyData(String businessKeyName);
	
	
	/**
	 * 批量导入excel数据(表单)
	 * @param insertObjs 新增数据
	 * @param updateObjs 修改数据
	 * @param columnInfo excel中的列信息
	 */
	public Map<Object, Long> importBatchCheckReport(List<WOMCheckReport> insertObjs, List<WOMCheckReport> updateObjs, List<Map<String,String>> columnInfo);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<WOMCheckReport> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model);
	
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
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dataGridService DataGridService对象
	 */
	void saveCheckReport(WOMCheckReport checkReport, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dataGridService DataGridService对象
	 */
	void saveCheckReport(WOMCheckReport checkReport, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dataGridService DataGridService对象
	 */
	void saveCheckReport(WOMCheckReport checkReport, DataGridService dataGridService);

	public void batchSaveCheckReport(WOMCheckReport checkReport, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  检验报告单 对象
	 * @param checkReport  检验报告单
	 * @param dataGridService DataGridService对象
	 */
	void mergeCheckReport(WOMCheckReport checkReport, DataGridService dataGridService);
	
	/**
	 * Excel导出 
	 */
	void excelExport();
	
	/**
	 * 页面打印 
	 */
	void print(int printType);
	
	public  Object generateObjectFromJson(String jsonStr, Class clazz);
	
}