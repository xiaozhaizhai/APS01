package com.supcon.orchid.MESBasic.services;
import java.io.Serializable;
import java.util.Map;
import java.util.Date;
import org.hibernate.criterion.Criterion;
import java.util.List;
import com.supcon.orchid.services.IBusinessKeyService;
import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
/* CUSTOM CODE START(service,import,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
public interface MESBasicBaseCustClassService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 客户类型 对象
	 * @param id
	 * @return
	 */
	MESBasicBaseCustClass getBaseCustClass(long id);

	/**
	 * 根据ID，获取 客户类型 对象
	 * @param id
	 * @return
	 */
	MESBasicBaseCustClass getBaseCustClass(long id, String viewCode);

	/**
	 * 根据ID，获取 客户类型 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getBaseCustClassAsJSON(long id, String include);

	/**
	 * 删除  客户类型 对象
	 * @param baseCustClass 客户类型
	 */
	void deleteBaseCustClass(MESBasicBaseCustClass baseCustClass);

	/**
	 * 根据ID，删除  客户类型 对象
	 * @param id
	 */
	void deleteBaseCustClass(long baseCustClassId, int baseCustClassVersion);

	/**
	 * 根据ID串，删除多个  客户类型 对象
	 * @param baseCustClassIds
	 */
	void deleteBaseCustClass(String baseCustClassIds);

	/**
	 * 根据ID，删除多个  客户类型 对象
	 * @param baseCustClassIds
	 */
	void deleteBaseCustClass(List<Long> baseCustClassIds);
	
	/**
	 * 根据ID，删除多个  客户类型 对象
	 * @param baseCustClassIds
	 */
	void deleteBaseCustClass(List<Long> baseCustClassIds, String eventTopic);

	/**
	 * 保存  客户类型 对象
	 * @param baseCustClass  客户类型
	 * @param dataGridService DataGridService对象
	 */
	void saveBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  客户类型 对象
	 * @param baseCustClass  客户类型
	 * @param dataGridService DataGridService对象
	 */
	void saveBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService, String viewCode, String eventTopic);
	
	/**
	 * 保存  客户类型 对象
	 * @param baseCustClass  客户类型
	 * @param dataGridService DataGridService对象
	 */
	void saveBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService);

	/**
	 * 保存  客户类型 对象
	 * @param baseCustClass  客户类型
	 * @param dataGridService DataGridService对象
	 */
	void mergeBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 客户类型 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicBaseCustClass> findBaseCustClasss(Page<MESBasicBaseCustClass> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 客户类型 集合
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
	void findBaseCustClasss(Page<MESBasicBaseCustClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode);

	/**
	 * 根据条件(多条件)获取指定页码的 客户类型 集合
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
	void findBaseCustClasss(Page<MESBasicBaseCustClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 客户类型 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findBaseCustClasss(Page<MESBasicBaseCustClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params);
	
	List<MESBasicBaseCustClass> getBaseCustClasss(String sql , List<Object> params);
	
	MESBasicBaseCustClass loadBaseCustClassByBussinessKey(MESBasicBaseCustClass baseCustClass);
	
	Page<MESBasicBaseCustClass> getBaseCustClasss(Page<MESBasicBaseCustClass> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportBaseCustClass(List<MESBasicBaseCustClass> baseCustClasss, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportBaseCustClass(List<MESBasicBaseCustClass> baseCustClasss);

	/* CUSTOM CODE START(service,functions,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public MESBasicBaseCustClass loadBaseCustClassByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<MESBasicBaseCustClass> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public MESBasicBaseCustClass findEntityByProperty(String propertyName, Object object);
	
	/**
	 * 根据业务主键删除对象 以逗号分隔
	 * @param bussinessKey
	 */
	public void deleteByBussinessKeys(String bussinessKeys);
}