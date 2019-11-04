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
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMMaterialBatchNums;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMTaskActivePending;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
/* CUSTOM CODE START(service,import,WOM_7.5.0.0_produceTask_TaskActivePending,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface WOMTaskActivePendingService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 活动执行待办表 对象
	 * @param id
	 * @return
	 */
	WOMTaskActivePending getTaskActivePending(long id);

	/**
	 * 根据ID，获取 活动执行待办表 对象
	 * @param id
	 * @return
	 */
	WOMTaskActivePending getTaskActivePending(long id, String viewCode);

	/**
	 * 根据ID，获取 活动执行待办表 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getTaskActivePendingAsJSON(long id, String include);

	/**
	 * 删除  活动执行待办表 对象
	 * @param taskActivePending 活动执行待办表
	 */
	void deleteTaskActivePending(WOMTaskActivePending taskActivePending);

	/**
	 * 根据ID，删除  活动执行待办表 对象
	 * @param id
	 */
	void deleteTaskActivePending(long taskActivePendingId, int taskActivePendingVersion);

	/**
	 * 根据ID串，删除多个  活动执行待办表 对象
	 * @param taskActivePendingIds
	 */
	void deleteTaskActivePending(String taskActivePendingIds);

	/**
	 * 根据ID，删除多个  活动执行待办表 对象
	 * @param taskActivePendingIds
	 */
	void deleteTaskActivePending(List<Long> taskActivePendingIds);
	
	/**
	 * 根据ID，删除多个  活动执行待办表 对象
	 * @param taskActivePendingIds
	 */
	void deleteTaskActivePending(List<Long> taskActivePendingIds, String eventTopic);

	/**
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTaskActivePending(WOMTaskActivePending taskActivePending, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseTaskActivePending(List<WOMTaskActivePending>  taskActivePendings);
	
	void excelBatchImportBaseTaskActivePending(List<WOMTaskActivePending>  taskActivePendings);
	
	/**
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTaskActivePending(WOMTaskActivePending taskActivePending, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);


	/**
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveTaskActivePending(WOMTaskActivePending taskActivePending,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeTaskActivePending(WOMTaskActivePending taskActivePending, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 活动执行待办表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<WOMTaskActivePending> findTaskActivePendings(Page<WOMTaskActivePending> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 活动执行待办表 集合
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
	void findTaskActivePendings(Page<WOMTaskActivePending> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql);

	/**
	 * 根据条件(多条件)获取指定页码的 活动执行待办表 集合
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
	void findTaskActivePendings(Page<WOMTaskActivePending> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 活动执行待办表 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findTaskActivePendings(Page<WOMTaskActivePending> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, List<Param> params);
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
	
	List<WOMTaskActivePending> getTaskActivePendings(String sql , List<Object> params);
	
	WOMTaskActivePending loadTaskActivePendingByBussinessKey(WOMTaskActivePending taskActivePending);
	
	Page<WOMTaskActivePending> getTaskActivePendings(Page<WOMTaskActivePending> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportTaskActivePending(List<WOMTaskActivePending> taskActivePendings, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportTaskActivePending(List<WOMTaskActivePending> taskActivePendings);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportTaskActivePending(List<WOMTaskActivePending> taskActivePendings, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportTaskActivePending(List<WOMTaskActivePending> taskActivePendings);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportTaskActivePending(List<WOMTaskActivePending> insertObjs, List<WOMTaskActivePending> updateObjs, List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportTaskActivePending(List<WOMTaskActivePending> insertObjs, List<WOMTaskActivePending> updateObjs, List<Map<String,String>> columnInfo);

	/* CUSTOM CODE START(service,functions,WOM_7.5.0.0_produceTask_TaskActivePending,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	
	
	void deleteTaskActivePendingByProdTaskProcExelog(List<Long> prodTaskProcExelogIds);
	void deleteTaskActivePendingByProduceTaskActive(List<Long> produceTaskActiveIds);
	void deleteTaskActivePendingByProduceTaskProcess(List<Long> produceTaskProcessIds);
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public WOMTaskActivePending loadTaskActivePendingByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<WOMTaskActivePending> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public WOMTaskActivePending findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchTaskActivePending(List<WOMTaskActivePending> insertObjs, 
			List<WOMTaskActivePending> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<WOMTaskActivePending> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model);
	
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
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dataGridService DataGridService对象
	 */
	void saveTaskActivePending(WOMTaskActivePending taskActivePending, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dataGridService DataGridService对象
	 */
	void saveTaskActivePending(WOMTaskActivePending taskActivePending, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dataGridService DataGridService对象
	 */
	void saveTaskActivePending(WOMTaskActivePending taskActivePending, DataGridService dataGridService);

	public void batchSaveTaskActivePending(WOMTaskActivePending taskActivePending, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  活动执行待办表 对象
	 * @param taskActivePending  活动执行待办表
	 * @param dataGridService DataGridService对象
	 */
	void mergeTaskActivePending(WOMTaskActivePending taskActivePending, DataGridService dataGridService);
	
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