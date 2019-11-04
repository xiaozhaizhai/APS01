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
import com.supcon.orchid.ec.entities.Event;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSetDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
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
/* CUSTOM CODE START(service,import,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
public interface MESBasicTestMappingSetService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 检验项映射 对象
	 * @param id
	 * @return
	 */
	MESBasicTestMappingSet getTestMappingSet(long id);

	/**
	 * 根据ID，获取 检验项映射 对象
	 * @param id
	 * @return
	 */
	MESBasicTestMappingSet getTestMappingSet(long id, String viewCode);

	/**
	 * 根据ID，获取 检验项映射 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getTestMappingSetAsJSON(long id, String include);

	/**
	 * 删除  检验项映射 对象
	 * @param testMappingSet 检验项映射
	 */
	void deleteTestMappingSet(MESBasicTestMappingSet testMappingSet);

	/**
	 * 根据ID，删除  检验项映射 对象
	 * @param id
	 */
	void deleteTestMappingSet(long testMappingSetId, int testMappingSetVersion);

	/**
	 * 根据ID串，删除多个  检验项映射 对象
	 * @param testMappingSetIds
	 */
	void deleteTestMappingSet(String testMappingSetIds);

	/**
	 * 根据ID，删除多个  检验项映射 对象
	 * @param testMappingSetIds
	 */
	void deleteTestMappingSet(List<Long> testMappingSetIds);
	
	/**
	 * 根据ID，删除多个  检验项映射 对象
	 * @param testMappingSetIds
	 */
	void deleteTestMappingSet(List<Long> testMappingSetIds, String eventTopic);

	/**
	 * 保存  检验项映射 对象
	 * @param testMappingSet  检验项映射
	 * @param dataGridService DataGridService对象
	 */
	void saveTestMappingSet(MESBasicTestMappingSet testMappingSet, DataGridService dataGridService, String viewCode);
	
	void batchImportBaseTestMappingSet(List<MESBasicTestMappingSet>  testMappingSets);
	
	
	/**
	 * 保存  检验项映射 对象
	 * @param testMappingSet  检验项映射
	 * @param dataGridService DataGridService对象
	 */
	void saveTestMappingSet(MESBasicTestMappingSet testMappingSet, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  检验项映射 对象
	 * @param testMappingSet  检验项映射
	 * @param dataGridService DataGridService对象
	 */
	void saveTestMappingSet(MESBasicTestMappingSet testMappingSet, DataGridService dataGridService);

	/**
	 * 保存  检验项映射 对象
	 * @param testMappingSet  检验项映射
	 * @param dataGridService DataGridService对象
	 */
	void mergeTestMappingSet(MESBasicTestMappingSet testMappingSet, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 检验项映射 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicTestMappingSet> findTestMappingSets(Page<MESBasicTestMappingSet> page,Criterion...criterions);

	/**
	 * 保存处理意见
	 * 
	 * @param TestMappingSetDealInfo 检验项映射DealInfo
	 * @return
	 */
	void saveDealInfo(MESBasicTestMappingSetDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 检验项映射 集合
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
	void findTestMappingSets(Page<MESBasicTestMappingSet> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql);

	/**
	 * 根据条件(多条件)获取指定页码的 检验项映射 集合
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
	void findTestMappingSets(Page<MESBasicTestMappingSet> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 检验项映射 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findTestMappingSets(Page<MESBasicTestMappingSet> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params,String  refViewCode,String currentViewCode,String sqlType,String realPermissionCode);
	
	List<MESBasicTestMappingSet> getTestMappingSets(String sql , List<Object> params);
	
	MESBasicTestMappingSet loadTestMappingSetByBussinessKey(MESBasicTestMappingSet testMappingSet);
	
	Page<MESBasicTestMappingSet> getTestMappingSets(Page<MESBasicTestMappingSet> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportTestMappingSet(List<MESBasicTestMappingSet> testMappingSets, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportTestMappingSet(List<MESBasicTestMappingSet> testMappingSets);

	/* CUSTOM CODE START(service,functions,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
	
	public  MESBasicTestMappingSet getMappingSetByGood(MESBasicProduct  product);
/* CUSTOM CODE END */
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public MESBasicTestMappingSet loadTestMappingSetByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<MESBasicTestMappingSet> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public MESBasicTestMappingSet findEntityByProperty(String propertyName, Object object);
	
	/**
	 * 根据业务主键删除对象 以逗号分隔
	 * @param bussinessKey
	 */
	public void deleteByBussinessKeys(String bussinessKeys);
}