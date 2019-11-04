package com.supcon.orchid.MESBasic.services;
import java.util.Map;
import java.util.Date;
import org.hibernate.criterion.Criterion;
import java.util.List;
import com.supcon.orchid.services.IBusinessKeyService;
import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdtypeDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicProdtype;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
/* CUSTOM CODE START(service,import,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
public interface MESBasicProdtypeService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 物料类别 对象
	 * @param id
	 * @return
	 */
	MESBasicProdtype getProdtype(long id);

	/**
	 * 根据ID，获取 物料类别 对象
	 * @param id
	 * @return
	 */
	MESBasicProdtype getProdtype(long id, String viewCode);

	/**
	 * 根据ID，获取 物料类别 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getProdtypeAsJSON(long id, String include);

	/**
	 * 删除  物料类别 对象
	 * @param prodtype 物料类别
	 */
	void deleteProdtype(MESBasicProdtype prodtype);

	/**
	 * 根据ID，删除  物料类别 对象
	 * @param id
	 */
	void deleteProdtype(long prodtypeId, int prodtypeVersion);

	/**
	 * 根据ID串，删除多个  物料类别 对象
	 * @param prodtypeIds
	 */
	void deleteProdtype(String prodtypeIds);

	/**
	 * 根据ID，删除多个  物料类别 对象
	 * @param prodtypeIds
	 */
	void deleteProdtype(List<Long> prodtypeIds);
	
	/**
	 * 根据ID，删除多个  物料类别 对象
	 * @param prodtypeIds
	 */
	void deleteProdtype(List<Long> prodtypeIds, String eventTopic);

	/**
	 * 保存  物料类别 对象
	 * @param prodtype  物料类别
	 * @param dataGridService DataGridService对象
	 */
	void saveProdtype(MESBasicProdtype prodtype, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  物料类别 对象
	 * @param prodtype  物料类别
	 * @param dataGridService DataGridService对象
	 */
	void saveProdtype(MESBasicProdtype prodtype, DataGridService dataGridService, String viewCode, String eventTopic);
	
	/**
	 * 保存  物料类别 对象
	 * @param prodtype  物料类别
	 * @param dataGridService DataGridService对象
	 */
	void saveProdtype(MESBasicProdtype prodtype, DataGridService dataGridService);

	/**
	 * 保存  物料类别 对象
	 * @param prodtype  物料类别
	 * @param dataGridService DataGridService对象
	 */
	void mergeProdtype(MESBasicProdtype prodtype, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 物料类别 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicProdtype> findProdtypes(Page<MESBasicProdtype> page,Criterion...criterions);

	/**
	 * 保存处理意见
	 * 
	 * @param ProdtypeDealInfo 物料类别DealInfo
	 * @return
	 */
	void saveDealInfo(MESBasicProdtypeDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 物料类别 集合
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
	void findProdtypes(Page<MESBasicProdtype> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode);

	/**
	 * 根据条件(多条件)获取指定页码的 物料类别 集合
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
	void findProdtypes(Page<MESBasicProdtype> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 物料类别 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findProdtypes(Page<MESBasicProdtype> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params);
	
	List<MESBasicProdtype> getProdtypes(String sql , List<Object> params);
	
	MESBasicProdtype loadProdtypeByBussinessKey(MESBasicProdtype prodtype);
	
	Page<MESBasicProdtype> getProdtypes(Page<MESBasicProdtype> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportProdtype(List<MESBasicProdtype> prodtypes, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportProdtype(List<MESBasicProdtype> prodtypes);

	/* CUSTOM CODE START(service,functions,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	
	
}