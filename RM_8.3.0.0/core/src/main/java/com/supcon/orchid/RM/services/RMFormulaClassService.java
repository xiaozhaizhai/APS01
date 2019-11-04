package com.supcon.orchid.RM.services;
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
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormulaClass;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMTestProj;
/* CUSTOM CODE START(service,import,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
public interface RMFormulaClassService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 配方类 对象
	 * @param id
	 * @return
	 */
	RMFormulaClass getFormulaClass(long id);

	/**
	 * 根据ID，获取 配方类 对象
	 * @param id
	 * @return
	 */
	RMFormulaClass getFormulaClass(long id, String viewCode);

	/**
	 * 根据ID，获取 配方类 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getFormulaClassAsJSON(long id, String include);

	/**
	 * 删除  配方类 对象
	 * @param formulaClass 配方类
	 */
	void deleteFormulaClass(RMFormulaClass formulaClass);

	/**
	 * 根据ID，删除  配方类 对象
	 * @param id
	 */
	void deleteFormulaClass(long formulaClassId, int formulaClassVersion);

	/**
	 * 根据ID串，删除多个  配方类 对象
	 * @param formulaClassIds
	 */
	void deleteFormulaClass(String formulaClassIds);

	/**
	 * 根据ID，删除多个  配方类 对象
	 * @param formulaClassIds
	 */
	void deleteFormulaClass(List<Long> formulaClassIds);
	
	/**
	 * 根据ID，删除多个  配方类 对象
	 * @param formulaClassIds
	 */
	void deleteFormulaClass(List<Long> formulaClassIds, String eventTopic);

	/**
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormulaClass(RMFormulaClass formulaClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode);
	
	void batchImportBaseFormulaClass(List<RMFormulaClass>  formulaClasss);
	
	void excelBatchImportBaseFormulaClass(List<RMFormulaClass>  formulaClasss);
	
	/**
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormulaClass(RMFormulaClass formulaClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);


	/**
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void saveFormulaClass(RMFormulaClass formulaClass,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dgLists DataGrid对象集合
	 * @param dgDeleteIDs DataGrid对象删除ID集合
	 * @param assFileUploads DataGrid关联附件集合
	 */
	void mergeFormulaClass(RMFormulaClass formulaClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads);

	/**
	 * 根据条件(多条件)获取指定页码的 配方类 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<RMFormulaClass> findFormulaClasss(Page<RMFormulaClass> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 配方类 集合
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
	void findFormulaClasss(Page<RMFormulaClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql);

	/**
	 * 根据条件(多条件)获取指定页码的 配方类 集合
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
	void findFormulaClasss(Page<RMFormulaClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 配方类 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findFormulaClasss(Page<RMFormulaClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, List<Param> params);
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
	
	List<RMFormulaClass> getFormulaClasss(String sql , List<Object> params);
	
	RMFormulaClass loadFormulaClassByBussinessKey(RMFormulaClass formulaClass);
	
	Page<RMFormulaClass> getFormulaClasss(Page<RMFormulaClass> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportFormulaClass(List<RMFormulaClass> formulaClasss, Map<String, Map<Integer, Map<Integer, String>>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportFormulaClass(List<RMFormulaClass> formulaClasss);
	
	/**
	 * Excel 批量导入前
	 * @param testPTs
	 */
	public void beforeExcelBatchImportFormulaClass(List<RMFormulaClass> formulaClasss, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 批量导入后
	 * @param testPTs
	 */
	public void afterExcelBatchImportFormulaClass(List<RMFormulaClass> formulaClasss);
	
	/**
	 * Excel 主辅模型导入前
	 * @param testPTs
	 */
	public void beforeImportFormulaClass(List<RMFormulaClass> insertObjs, List<RMFormulaClass> updateObjs, List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet);
	/**
	 * Excel 主辅模型导入后
	 * @param testPTs
	 */
	public void afterImportFormulaClass(List<RMFormulaClass> insertObjs, List<RMFormulaClass> updateObjs, List<Map<String,String>> columnInfo);

	/* CUSTOM CODE START(service,functions,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public RMFormulaClass loadFormulaClassByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<RMFormulaClass> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public RMFormulaClass findEntityByProperty(String propertyName, Object object);
	
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
	public Map<Object, Long> importBatchFormulaClass(List<RMFormulaClass> insertObjs, 
			List<RMFormulaClass> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds);
	
	//excel辅模型查询
	public void excelAuxModelQuery(Page<RMFormulaClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model);
	
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
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dataGridService DataGridService对象
	 */
	void saveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dataGridService DataGridService对象
	 */
	void saveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dataGridService DataGridService对象
	 */
	void saveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService);

	public void batchSaveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService, View view,List<Event>  events, String eventTopic, boolean... isImport);

	/**
	 * 保存  配方类 对象
	 * @param formulaClass  配方类
	 * @param dataGridService DataGridService对象
	 */
	void mergeFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService);
	
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