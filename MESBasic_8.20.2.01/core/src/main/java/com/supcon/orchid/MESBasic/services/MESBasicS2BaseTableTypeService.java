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
import com.supcon.orchid.MESBasic.entities.MESBasicS2BaseTableTypeDealInfo;
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
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicS2BaseTableType;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
/* CUSTOM CODE START(service,import,MESBasic_1_tableType_S2BaseTableType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
public interface MESBasicS2BaseTableTypeService extends IBusinessKeyService, IModelTreeLayRecService {

	/**
	 * 根据ID，获取 业务表单 对象
	 * @param id
	 * @return
	 */
	MESBasicS2BaseTableType getS2BaseTableType(long id);

	/**
	 * 根据ID，获取 业务表单 对象
	 * @param id
	 * @return
	 */
	MESBasicS2BaseTableType getS2BaseTableType(long id, String viewCode);

	/**
	 * 根据ID，获取 业务表单 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getS2BaseTableTypeAsJSON(long id, String include);

	/**
	 * 删除  业务表单 对象
	 * @param s2BaseTableType 业务表单
	 */
	void deleteS2BaseTableType(MESBasicS2BaseTableType s2BaseTableType);

	/**
	 * 根据ID，删除  业务表单 对象
	 * @param id
	 */
	void deleteS2BaseTableType(long s2BaseTableTypeId, int s2BaseTableTypeVersion);

	/**
	 * 根据ID串，删除多个  业务表单 对象
	 * @param s2BaseTableTypeIds
	 */
	void deleteS2BaseTableType(String s2BaseTableTypeIds);

	/**
	 * 根据ID，删除多个  业务表单 对象
	 * @param s2BaseTableTypeIds
	 */
	void deleteS2BaseTableType(List<Long> s2BaseTableTypeIds);
	
	/**
	 * 根据ID，删除多个  业务表单 对象
	 * @param s2BaseTableTypeIds
	 */
	void deleteS2BaseTableType(List<Long> s2BaseTableTypeIds, String eventTopic);

	/**
	 * 保存  业务表单 对象
	 * @param s2BaseTableType  业务表单
	 * @param dataGridService DataGridService对象
	 */
	void saveS2BaseTableType(MESBasicS2BaseTableType s2BaseTableType, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  业务表单 对象
	 * @param s2BaseTableType  业务表单
	 * @param dataGridService DataGridService对象
	 */
	void saveS2BaseTableType(MESBasicS2BaseTableType s2BaseTableType, DataGridService dataGridService, String viewCode, String eventTopic);
	
	/**
	 * 保存  业务表单 对象
	 * @param s2BaseTableType  业务表单
	 * @param dataGridService DataGridService对象
	 */
	void saveS2BaseTableType(MESBasicS2BaseTableType s2BaseTableType, DataGridService dataGridService);

	/**
	 * 保存  业务表单 对象
	 * @param s2BaseTableType  业务表单
	 * @param dataGridService DataGridService对象
	 */
	void mergeS2BaseTableType(MESBasicS2BaseTableType s2BaseTableType, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 业务表单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicS2BaseTableType> findS2BaseTableTypes(Page<MESBasicS2BaseTableType> page,Criterion...criterions);

	/**
	 * 保存处理意见
	 * 
	 * @param S2BaseTableTypeDealInfo 业务表单DealInfo
	 * @return
	 */
	void saveDealInfo(MESBasicS2BaseTableTypeDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 业务表单 集合
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
	void findS2BaseTableTypes(Page<MESBasicS2BaseTableType> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode);

	/**
	 * 根据条件(多条件)获取指定页码的 业务表单 集合
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
	void findS2BaseTableTypes(Page<MESBasicS2BaseTableType> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 业务表单 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findS2BaseTableTypes(Page<MESBasicS2BaseTableType> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params);

	/**
	 * 获取树的直接子节点（仅树形模型）
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<MESBasicS2BaseTableType> getTreeChildren(Long parentId, String cond, Object... params);
	
	/**
	 * 获取树节点(by id and layRec)
	 *
	 * @param treeInfo
	 * @param condition
	 * @param params
	 */
	List<MESBasicS2BaseTableType> getTreeInfo(Map<Long, String> treeInfo, String condition, List<Object> params);
	
	
	List<MESBasicS2BaseTableType> getS2BaseTableTypes(String sql , List<Object> params);
	
	MESBasicS2BaseTableType loadS2BaseTableTypeByBussinessKey(MESBasicS2BaseTableType s2BaseTableType);
	
	Page<MESBasicS2BaseTableType> getS2BaseTableTypes(Page<MESBasicS2BaseTableType> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportS2BaseTableType(List<MESBasicS2BaseTableType> s2BaseTableTypes, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportS2BaseTableType(List<MESBasicS2BaseTableType> s2BaseTableTypes);

	/* CUSTOM CODE START(service,functions,MESBasic_1_tableType_S2BaseTableType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	
	/**
	 * 处理节点leaf属性
	 * @param s2BaseTableTypeIds 需要处理的id
	 */
	void dealS2BaseTableTypeLeaf(List<Long> s2BaseTableTypeIds);
	/**
	 * 树拖动节点
	 * @param source
	 * @param target
	 */
	void drag(long dragSource, long dragTarget, long sort);
	
	List<MESBasicS2BaseTableType> convertTree(List<MESBasicS2BaseTableType> s2BaseTableTypes);
	
	
	/**
	 * 根据业务主键查询对象
	 * @param bussinessKey
	 */
	public MESBasicS2BaseTableType loadS2BaseTableTypeByBussinessKey(Serializable bussinessKey);
	
	/**
	 * 根据字段查询对象列表
	 * @param propertyName
	 * @param object
	 */
	public List<MESBasicS2BaseTableType> findByProperty(String propertyName, Object object);
	/**
	 * 根据字段查询唯一对象
	 * @param propertyName
	 * @param object
	 */
	public MESBasicS2BaseTableType findEntityByProperty(String propertyName, Object object);
	
	/**
	 * 根据业务主键删除对象 以逗号分隔
	 * @param bussinessKey
	 */
	public void deleteByBussinessKeys(String bussinessKeys);
}