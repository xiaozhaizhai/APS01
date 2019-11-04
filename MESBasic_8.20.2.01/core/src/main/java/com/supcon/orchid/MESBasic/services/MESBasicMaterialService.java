package com.supcon.orchid.MESBasic.services;
import java.util.Map;
import java.util.Date;
import org.hibernate.criterion.Criterion;
import java.util.List;
import com.supcon.orchid.services.IBusinessKeyService;
import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicMaterialDealInfo;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
/* CUSTOM CODE START(service,import,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
public interface MESBasicMaterialService extends IBusinessKeyService {

	/**
	 * 根据ID，获取 物料 对象
	 * @param id
	 * @return
	 */
	MESBasicMaterial getMaterial(long id);

	/**
	 * 根据ID，获取 物料 对象
	 * @param id
	 * @return
	 */
	MESBasicMaterial getMaterial(long id, String viewCode);

	/**
	 * 根据ID，获取 物料 对象 并转化为JSON
	 * @param id
	 * @return
	 */
	String getMaterialAsJSON(long id, String include);

	/**
	 * 删除  物料 对象
	 * @param material 物料
	 */
	void deleteMaterial(MESBasicMaterial material);

	/**
	 * 根据ID，删除  物料 对象
	 * @param id
	 */
	void deleteMaterial(long materialId, int materialVersion);

	/**
	 * 根据ID串，删除多个  物料 对象
	 * @param materialIds
	 */
	void deleteMaterial(String materialIds);

	/**
	 * 根据ID，删除多个  物料 对象
	 * @param materialIds
	 */
	void deleteMaterial(List<Long> materialIds);
	
	/**
	 * 根据ID，删除多个  物料 对象
	 * @param materialIds
	 */
	void deleteMaterial(List<Long> materialIds, String eventTopic);

	/**
	 * 保存  物料 对象
	 * @param material  物料
	 * @param dataGridService DataGridService对象
	 */
	void saveMaterial(MESBasicMaterial material, DataGridService dataGridService, String viewCode);
	
	/**
	 * 保存  物料 对象
	 * @param material  物料
	 * @param dataGridService DataGridService对象
	 */
	void saveMaterial(MESBasicMaterial material, DataGridService dataGridService, String viewCode, String eventTopic);
	
	/**
	 * 保存  物料 对象
	 * @param material  物料
	 * @param dataGridService DataGridService对象
	 */
	void saveMaterial(MESBasicMaterial material, DataGridService dataGridService);

	/**
	 * 保存  物料 对象
	 * @param material  物料
	 * @param dataGridService DataGridService对象
	 */
	void mergeMaterial(MESBasicMaterial material, DataGridService dataGridService);

	/**
	 * 根据条件(多条件)获取指定页码的 物料 集合
	 * 
	 * @param page
	 * @param criterions
	 * @return
	 */
	Page<MESBasicMaterial> findMaterials(Page<MESBasicMaterial> page,Criterion...criterions);

	/**
	 * 保存处理意见
	 * 
	 * @param MaterialDealInfo 物料DealInfo
	 * @return
	 */
	void saveDealInfo(MESBasicMaterialDealInfo dealInfo);

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
	 * 根据条件(多条件)获取指定页码的 物料 集合
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
	void findMaterials(Page<MESBasicMaterial> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode);

	/**
	 * 根据条件(多条件)获取指定页码的 物料 集合
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
	void findMaterials(Page<MESBasicMaterial> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects);

	/**
	 * 根据条件(多条件)获取指定页码的 物料 集合
	 * 
	 * @param page
	 * @param criterions
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param params 条件参数信息
	 * @return
	 */
	void findMaterials(Page<MESBasicMaterial> page, String viewCode, int type,String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params);
	/**
	 * 助记码查找
	 * 
	 * @param viewCode
	 * @param params 查询条件
	 * @param showNumber 显示记录数
	 * @param condition 配置时配置的自定义SQL
	 */
	List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross,List<Param> params);
	
	List<MESBasicMaterial> getMaterials(String sql , List<Object> params);
	
	MESBasicMaterial loadMaterialByBussinessKey(MESBasicMaterial material);
	
	Page<MESBasicMaterial> getMaterials(Page<MESBasicMaterial> page, String sql , List<Object> params, String sort);
	//==============DataGrid多选控件使用 start================
	
	/**
	 * Excel 导入前
	 * @param testPTs
	 */
	public void beforeExcelImportMaterial(List<MESBasicMaterial> materials, Map<Integer, Map<Integer, String>> errors);
	/**
	 * Excel 导入后
	 * @param testPTs
	 */
	public void afterExcelImportMaterial(List<MESBasicMaterial> materials);

	/* CUSTOM CODE START(service,functions,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	
	
}