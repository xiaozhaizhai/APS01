package com.supcon.orchid.X6Basic.services;
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
import com.supcon.orchid.X6Basic.entities.X6BasicTestDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.X6Basic.entities.X6BasicAbook;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.X6Basic.entities.ProductManage;
import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.X6Basic.entities.SignetSetting;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;
import com.supcon.orchid.X6Basic.entities.X6BasicTest;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
/* CUSTOM CODE START(service,import,X6Basic_1.0_test_Test,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
public interface X6BasicTestService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 测试 对象
	 * @param id
	 * @return
	 */
	X6BasicTest getTest(long id);

	/**
	 * 根据ID，获取 测试 对象
	 * @param id
	 * @return
	 */
	X6BasicTest getTest(long id, String viewCode);

	/**
	 * 根据ID，获取 测试 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getTestAsJSON(long id, String include);

	/**
	 * 删除  测试 对象
	 * @param test 测试
	 */
	void deleteTest(X6BasicTest test);

	/**
	 * 根据ID，删除  测试 对象
	 * @param id
	 */
	void deleteTest(long testId, int testVersion);

	/**
	 * 根据ID串，删除多个  测试 对象
	 * @param testIds
	 */
	void deleteTest(String testIds);

	/**
	 * 根据ID，删除多个  测试 对象
	 * @param testIds
	 */
	void deleteTest(List<Long> testIds);
	
	/**
	 * 根据ID，删除多个  测试 对象
	 * @param testIds
	 */
	void deleteTest(List<Long> testIds, String eventTopic);

	/**
	 * 保存  测试 对象
	 * @param test  测试
	 * @param dataGridService DataGridService对象
	 */
	void saveTest(X6BasicTest test, DataGridService dataGridService, String viewCode);
	
	void batchImportBaseTest(List<X6BasicTest>  tests);
	
	
	/**
	 * 保存  测试 对象
	 * @param test  测试
	 * @param dataGridService DataGridService对象
	 */
	void saveTest(X6BasicTest test, DataGridService dataGridService, String viewCode, String eventTopic,boolean... isImport);
	
	/**
	 * 保存  测试 对象
	 * @param test  测试
	 * @param dataGridService DataGridService对象
	 */
	void saveTest(X6BasicTest test, DataGridService dataGridService);

	/**
	 * 保存  测试 对象
	 * @param test  测试
	 * @param dataGridService DataGridService对象
	 */
	void mergeTest(X6BasicTest test, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 测试 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<X6BasicTest> findTests(Page<X6BasicTest> page,Criterion...criterions);

	/**
	 * 保存处理意见
	 * 
	 * @param TestDealInfo 测试DealInfo
	 * @return
	 */
	void saveDealInfo(X6BasicTestDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 测试 集合
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
	void findTests(Page<X6BasicTest> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql);

	/**
	 * 根据条件(多条件)获取指定页码的 测试 集合
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
	void findTests(Page<X6BasicTest> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 测试 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findTests(Page<X6BasicTest> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag, String exportSql, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params,String  refViewCode,String currentViewCode,String sqlType,String realPermissionCode);
	
	List<X6BasicTest> getTests(String sql , List<Object> params);
	
	X6BasicTest loadTestByBussinessKey(X6BasicTest test);
	
	Page<X6BasicTest> getTests(Page<X6BasicTest> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportTest(List<X6BasicTest> tests, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportTest(List<X6BasicTest> tests);

	/* CUSTOM CODE START(service,functions,X6Basic_1.0_test_Test,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public X6BasicTest loadTestByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<X6BasicTest> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public X6BasicTest findEntityByProperty(String propertyName, Object object);
	
	/**
	 * 根据业务主键删除对象 以逗号分隔
	 * @param bussinessKey
	 */
	public void deleteByBussinessKeys(String bussinessKeys);
}