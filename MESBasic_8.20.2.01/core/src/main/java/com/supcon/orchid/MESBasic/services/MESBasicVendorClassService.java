package com.supcon.orchid.MESBasic.services;
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
import com.supcon.orchid.MESBasic.entities.MESBasicVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
/* CUSTOM CODE START(service,import,MESBasic_1_baseVendor_VendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
public interface MESBasicVendorClassService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 供应商类型 对象
	 * @param id
	 * @return
	 */
	MESBasicVendorClass getVendorClass(long id);

	/**
	 * 根据ID，获取 供应商类型 对象
	 * @param id
	 * @return
	 */
	MESBasicVendorClass getVendorClass(long id, String viewCode);

	/**
	 * 根据ID，获取 供应商类型 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getVendorClassAsJSON(long id, String include);

	/**
	 * 删除  供应商类型 对象
	 * @param vendorClass 供应商类型
	 */
	void deleteVendorClass(MESBasicVendorClass vendorClass);

	/**
	 * 根据ID，删除  供应商类型 对象
	 * @param id
	 */
	void deleteVendorClass(long vendorClassId, int vendorClassVersion);

	/**
	 * 根据ID串，删除多个  供应商类型 对象
	 * @param vendorClassIds
	 */
	void deleteVendorClass(String vendorClassIds);

	/**
	 * 根据ID，删除多个  供应商类型 对象
	 * @param vendorClassIds
	 */
	void deleteVendorClass(List<Long> vendorClassIds);
	
	/**
	 * 根据ID，删除多个  供应商类型 对象
	 * @param vendorClassIds
	 */
	void deleteVendorClass(List<Long> vendorClassIds, String eventTopic);

	/**
	 * 保存  供应商类型 对象
	 * @param vendorClass  供应商类型
	 * @param dataGridService DataGridService对象
	 */
	void saveVendorClass(MESBasicVendorClass vendorClass, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  供应商类型 对象
	 * @param vendorClass  供应商类型
	 * @param dataGridService DataGridService对象
	 */
	void saveVendorClass(MESBasicVendorClass vendorClass, DataGridService dataGridService, String viewCode, String eventTopic);
	
	/**
	 * 保存  供应商类型 对象
	 * @param vendorClass  供应商类型
	 * @param dataGridService DataGridService对象
	 */
	void saveVendorClass(MESBasicVendorClass vendorClass, DataGridService dataGridService);

	/**
	 * 保存  供应商类型 对象
	 * @param vendorClass  供应商类型
	 * @param dataGridService DataGridService对象
	 */
	void mergeVendorClass(MESBasicVendorClass vendorClass, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 供应商类型 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicVendorClass> findVendorClasss(Page<MESBasicVendorClass> page,Criterion...criterions);

	/**
	 * 根据菜单编码获取菜单对应的工作流的processKey（仅工作流）
	 * 
	 * @param menuCode 菜单编码
	 * @return
	 */
	public String getWorkFlowInfo(String menuCode);
	
	/**
	 * 根据条件(多条件)获取指定页码的 供应商类型 集合
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
	void findVendorClasss(Page<MESBasicVendorClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode);

	/**
	 * 根据条件(多条件)获取指定页码的 供应商类型 集合
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
	void findVendorClasss(Page<MESBasicVendorClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 供应商类型 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findVendorClasss(Page<MESBasicVendorClass> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params);
	
	List<MESBasicVendorClass> getVendorClasss(String sql , List<Object> params);
	
	MESBasicVendorClass loadVendorClassByBussinessKey(MESBasicVendorClass vendorClass);
	
	Page<MESBasicVendorClass> getVendorClasss(Page<MESBasicVendorClass> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportVendorClass(List<MESBasicVendorClass> vendorClasss, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportVendorClass(List<MESBasicVendorClass> vendorClasss);

	/* CUSTOM CODE START(service,functions,MESBasic_1_baseVendor_VendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	
	
}