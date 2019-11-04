package com.supcon.orchid.MESBasic.services;
import java.util.Map;
import java.util.Date;
import org.hibernate.criterion.Criterion;
import java.util.List;
import com.supcon.orchid.services.IBusinessKeyService;
import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicTagPropertyDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicTagProperty;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
/* CUSTOM CODE START(service,import,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
public interface MESBasicTagPropertyService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 位号配置 对象
	 * @param id
	 * @return
	 */
	MESBasicTagProperty getTagProperty(long id);

	/**
	 * 根据ID，获取 位号配置 对象
	 * @param id
	 * @return
	 */
	MESBasicTagProperty getTagProperty(long id, String viewCode);

	/**
	 * 根据ID，获取 位号配置 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getTagPropertyAsJSON(long id, String include);

	/**
	 * 删除  位号配置 对象
	 * @param tagProperty 位号配置
	 */
	void deleteTagProperty(MESBasicTagProperty tagProperty);

	/**
	 * 根据ID，删除  位号配置 对象
	 * @param id
	 */
	void deleteTagProperty(long tagPropertyId, int tagPropertyVersion);

	/**
	 * 根据ID串，删除多个  位号配置 对象
	 * @param tagPropertyIds
	 */
	void deleteTagProperty(String tagPropertyIds);

	/**
	 * 根据ID，删除多个  位号配置 对象
	 * @param tagPropertyIds
	 */
	void deleteTagProperty(List<Long> tagPropertyIds);
	
	/**
	 * 根据ID，删除多个  位号配置 对象
	 * @param tagPropertyIds
	 */
	void deleteTagProperty(List<Long> tagPropertyIds, String eventTopic);

	/**
	 * 保存  位号配置 对象
	 * @param tagProperty  位号配置
	 * @param dataGridService DataGridService对象
	 */
	void saveTagProperty(MESBasicTagProperty tagProperty, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  位号配置 对象
	 * @param tagProperty  位号配置
	 * @param dataGridService DataGridService对象
	 */
	void saveTagProperty(MESBasicTagProperty tagProperty, DataGridService dataGridService, String viewCode, String eventTopic);
	
	/**
	 * 保存  位号配置 对象
	 * @param tagProperty  位号配置
	 * @param dataGridService DataGridService对象
	 */
	void saveTagProperty(MESBasicTagProperty tagProperty, DataGridService dataGridService);

	/**
	 * 保存  位号配置 对象
	 * @param tagProperty  位号配置
	 * @param dataGridService DataGridService对象
	 */
	void mergeTagProperty(MESBasicTagProperty tagProperty, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 位号配置 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicTagProperty> findTagPropertys(Page<MESBasicTagProperty> page,Criterion...criterions);

	/**
	 * 保存处理意见
	 * 
	 * @param TagPropertyDealInfo 位号配置DealInfo
	 * @return
	 */
	void saveDealInfo(MESBasicTagPropertyDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 位号配置 集合
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
	void findTagPropertys(Page<MESBasicTagProperty> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode);

	/**
	 * 根据条件(多条件)获取指定页码的 位号配置 集合
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
	void findTagPropertys(Page<MESBasicTagProperty> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 位号配置 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findTagPropertys(Page<MESBasicTagProperty> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params);
	
	List<MESBasicTagProperty> getTagPropertys(String sql , List<Object> params);
	
	MESBasicTagProperty loadTagPropertyByBussinessKey(MESBasicTagProperty tagProperty);
	
	Page<MESBasicTagProperty> getTagPropertys(Page<MESBasicTagProperty> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportTagProperty(List<MESBasicTagProperty> tagPropertys, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportTagProperty(List<MESBasicTagProperty> tagPropertys);

	/* CUSTOM CODE START(service,functions,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
	
	
/* CUSTOM CODE END */
	
	
}