package com.supcon.orchid.WOM.services.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.osgi.framework.BundleContext;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.MESBasic.services.MESBasicFacWareMaterialService;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.services.MESBasicStoreSetService;
import com.supcon.orchid.MESBasic.services.MESBasicWareService;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetService;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.WOM.daos.WOMBatchPhaseExelogDao;
import com.supcon.orchid.WOM.daos.WOMProdTaskActiExelogDao;
import com.supcon.orchid.WOM.daos.WOMProdTaskProcExelogDao;
import com.supcon.orchid.WOM.daos.WOMProduceTaskDao;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialDao;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialPartDao;
import com.supcon.orchid.WOM.entities.WOMMaterialBatchNums;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.WOM.exterEntity.Materials;
import com.supcon.orchid.WOM.exterEntity.Produce;
import com.supcon.orchid.WOM.exterEntity.ProduceTask;
import com.supcon.orchid.WOM.exterEntity.Recipe;
import com.supcon.orchid.WOM.exterEntity.WorkCenter;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;
import com.supcon.orchid.WOM.services.WOMEBRService;
import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveService;
import com.supcon.orchid.WOM.services.WOMProduceTaskProcessService;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.services.WOMStandingcropRefService;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartService;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.foundation.services.RoleService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.orm.entities.IRole;
import com.supcon.orchid.orm.entities.IStaff;
import com.supcon.orchid.publicSet.services.PublicSetBatchRelateService;
import com.supcon.orchid.publicSet.services.WOMInterfaceService;
import com.supcon.orchid.security.OrchidAuthenticationToken;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.services.ConsulService;
import com.supcon.orchid.utils.JSONPlainSerializer;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.services.IScriptService;
import com.supcon.orchid.workflow.engine.services.ProcessService;

@Service("wom_eBRService")
@Transactional
public class WOMEBRServiceImpl extends BaseServiceImpl implements
IScriptService, WOMEBRService, InitializingBean, DisposableBean{
	
	WOMTaskReporting report;
	private List<WOMTaskReportingPart> reportParts;
	@Resource
	private WOMTaskReportingService taskReportingService;
	@Resource
	private WOMTaskReportingPartService taskReportingPartService;
	@Resource
	private WOMProduceTaskService produceTaskService;
	@Resource
	private MESBasicFacWareMaterialService facWareMaterialService;
	@Resource
	private WOMPutInMaterialPartService putInMaterialPartService;
	@Resource
	private WOMPutInMaterialService putInMaterialService;
	@Autowired
	private BundleContext bundleContext;
  	@Resource
	private WOMBatchingMaterialPartService  batchingMaterialPartService ;
	@Autowired
	private UserService userService;
	@Resource
	private RMCheckDepartmentSetService checkDepartmentSetService;
	@Autowired
	private UserService userServcie;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserDetailsService userDetailsService;
	@Resource
	private WOMProdTaskActiExelogService prodTaskActiExelogService;
	@Resource
	private WOMWaitPutinRecordsService waitPutinRecordsService;
    @Resource
    private WOMWaitPutinRecordsService waitPutinService;
	@Resource
	private WOMBatchPhaseExelogService batchPhaseExelogService;
	@Autowired
	private WOMBatchPhaseExelogDao batchPhaseExelogDao;
	@Autowired
	private WOMProdTaskProcExelogDao prodTaskProcExelogDao;
	@Autowired
	private WOMProduceTaskDao produceTaskDao;
	@Autowired
	private ProcessService processService;
	@Autowired
	private WOMPutInMaterialDao putInMaterialDao;
	@Autowired
	private WOMPutInMaterialPartDao putInMaterialPartDao;
	@Autowired
	private WOMProdTaskActiExelogDao prodTaskActiExelogDao;
	@Autowired
	private WOMProduceTaskActiveService produceTaskActiveService;
	@Autowired
	private PublicSetBatchRelateService batchRelateService;
	@Autowired
	private MESBasicFactoryModelService factoryModelService;
	@Autowired
	private StaffService staffService;
	@Autowired
	private MESBasicWareService wareService;
	@Autowired
	private MESBasicStoreSetService storeSetService;
	@Autowired
	private MESBasicProductService productService;
	@Resource
	private ConsulService consulService;
	@Autowired
	private WOMProduceTaskProcessService produceTaskProcessService;
	@Autowired
	private RMFormulaService formulaService;
	@Autowired
	private WOMStandingcropRefService standingcropRefService;
	@Autowired
	private WOMInterfaceService interfaceService;
	WOMPutInMaterial putInMaterial;
	List<WOMPutInMaterialPart> putInMaterialParts;
	@Override
	public void addputinMaterialDatas(Map<String, Object> map,
			List<Map<String, Object>> mapList) {

		putInMaterial = new WOMPutInMaterial();

		//根据生产批号找到生产工单
		if(map.get("batchNum")!=null && !map.get("batchNum").toString().equals("")){
			String hqlChar = "from WOMProduceTask where valid = ? and status = 99 and productBatchNum = ?";
			List<WOMProduceTask> produceTasks = produceTaskDao.findByHql(hqlChar,true,map.get("batchNum").toString());
			if(produceTasks!=null && produceTasks.size()>0){
				putInMaterial.setTaskID(produceTasks.get(0));
			}else{
				throw new BAPException("不存在对应的生产工单");
			}
		}else{
			throw new BAPException("批号不允许为空");
		}
		Long cId = getCurrentCompanyId();
		putInMaterial.setCid(1000L);

		Staff putinStaffs = null;
		//表头投料人
		try {
			if(mapList.get(0).get("staffID")!=null && !mapList.get(0).get("staffID").toString().equals("")){
				putinStaffs = staffService.get(Long.parseLong(mapList.get(0).get("staffID").toString()));
				putInMaterial.setPutinStaff(putinStaffs);
			}
		} catch (Exception e) {
			throw new BAPException("找不到对应投料人");
		}
		
		//模拟登陆
		User u=putinStaffs.getUser();
		if(u!=null){
			String companyCode=u.getStaff().getMainPosition().getCompany().getCode();
			setSession(u.getName(),companyCode);
		}else{
			throw new BAPException("用户登陆失败，不能生成投料记录");
		}
		
		
		putInMaterialParts = new ArrayList<WOMPutInMaterialPart>();
		for (Map<String, Object> mapDetail : mapList) {
			WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
			//****物料
			try {
				if(mapDetail.get("materialID")!=null && !mapDetail.get("materialID").toString().equals("")){
					String hqlChart="from "+MESBasicProduct.JPA_NAME+" where valid = ? and productCode=?";
					List<MESBasicProduct> pros=produceTaskDao.findByHql(hqlChart,true,mapDetail.get("materialID").toString());
					if(pros!=null && pros.size()>0)
					putInMaterialPart.setProductId(pros.get(0));
				}else{
					throw new BAPException("物料不允许为空");
				}
			} catch (Exception e) {
				throw new BAPException("找不到对应物料");
			}

			//****物料批号
			//是否启用MES物料管理
			Boolean isProBatch=consulService.getValueAsBoolean("platform/bap/WOM/WOM.mesProBatch");
			//启用
			if(isProBatch){
				try {
					if(mapDetail.get("materialNum")!=null && !mapDetail.get("materialNum").toString().equals("")){
						//根据生产批号找到生产工单
						String hql = "from WOMStandingcropRef where valid = ? and batchText = ?";
						List<WOMStandingcropRef> standingcropRefs = produceTaskDao.findByHql(hql,true,mapDetail.get("materialNum").toString());
						if(standingcropRefs!=null && standingcropRefs.size()>0){
							putInMaterialPart.setProBatch(standingcropRefs.get(0));
							if(putInMaterialPart.getStoreID()!=null && putInMaterialPart.getStoreID().getId()!=null){
								MESBasicStoreSet store = storeSetService.getStoreSet(putInMaterialPart.getStoreID().getId());
								putInMaterialPart.setStoreID(store);
							}
							if(putInMaterialPart.getWareID()!=null && putInMaterialPart.getWareID().getId()!=null){
								MESBasicWare ware = wareService.getWare(putInMaterialPart.getWareID().getId());
								putInMaterialPart.setWareID(ware);
							}
						}else{
							throw new BAPException("找不到对应物料批号");
						}
						putInMaterialPart.setBatchNum(mapDetail.get("materialNum").toString());
					}else{
						throw new BAPException("物料批号为空，请查验");
					}
				} catch (Exception e) {
					throw new BAPException("找不到对应物料批号");
				}
			}else{
				//未启用
				if(mapDetail.get("materialID")!=null && !mapDetail.get("materialID").toString().equals("")){
					putInMaterialPart.setBatchNum(mapDetail.get("materialNum").toString());
				}else{
					throw new BAPException("物料不存在，请查验");
				}
			}

			//****投料数量
			try {
				if(mapDetail.get("useNum")!=null && !mapDetail.get("useNum").toString().equals("")){
					BigDecimal useNum = new BigDecimal(mapDetail.get("useNum").toString());
					putInMaterialPart.setUseNum(useNum);
				}else{
					throw new BAPException("投料数量不允许为空");
				}
			} catch (Exception e) {
				throw new BAPException("投料数量异常");
			}

			//****损耗数量
			try {
				if(mapDetail.get("loseNum")!=null && !mapDetail.get("loseNum").toString().equals("")){
					BigDecimal loseNum = new BigDecimal(mapDetail.get("loseNum").toString());
					putInMaterialPart.setLossNum(loseNum);
				}
			} catch (Exception e) {
				throw new BAPException("损耗数量异常");
			}

			//****工序id
			try {
				if(mapDetail.get("processID")!=null && !mapDetail.get("processID").toString().equals("")){
					WOMProduceTaskProcess produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(Long.parseLong(mapDetail.get("processID").toString()));
					putInMaterialPart.setTaskProcessId(produceTaskProcess);
				}
			} catch (Exception e) {
				throw new BAPException("找不到对应工序");
			}

			//****活动id
			try {
				if(mapDetail.get("activceID")!=null && !mapDetail.get("activceID").toString().equals("")){
					WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(Long.parseLong(mapDetail.get("activceID").toString()));
					putInMaterialPart.setTaskActiveId(produceTaskActive);
				}
			} catch (Exception e) {
				throw new BAPException("找不到对应活动");
			}

			//****工作单元ID
			try {
				if(mapDetail.get("factoryID")!=null && !mapDetail.get("factoryID").toString().equals("")){
					MESBasicFactoryModel factoryModel = factoryModelService.getFactoryModel(Long.parseLong(mapDetail.get("factoryID").toString()));
					putInMaterialPart.setFactoryId(factoryModel);
				}
			} catch (Exception e) {
				throw new BAPException("找不到对应工作单元");
			}

			//****投料时间
			try {
				if(mapDetail.get("putDate")!=null && !mapDetail.get("putDate").toString().equals("")){
					SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
					Date putDate = sdf.parse(mapDetail.get("putDate").toString());
					putInMaterialPart.setPutinDate(putDate);
				}
			} catch (Exception e) {
				throw new BAPException("投料时间格式有误");
			}

			//****投料人
			try {
				if(mapDetail.get("staffID")!=null && !mapDetail.get("staffID").toString().equals("")){
					Staff putinStaff = staffService.get(Long.parseLong(mapDetail.get("staffID").toString()));
					putInMaterialPart.setPutinStaff(putinStaff);
				}
			} catch (Exception e) {
				throw new BAPException("找不到对应投料人");
			}

			//****仓库
          
          /**
			try {
				if(mapDetail.get("wareID")!=null && !mapDetail.get("wareID").toString().equals("")){
					MESBasicWare ware = wareService.getWare(Long.parseLong(mapDetail.get("wareID").toString()));
					putInMaterialPart.setWareID(ware);
					if("storageState/storageState1".equals(ware.getCargoStatue().getId())){
						//****货位
						try {
							if(mapDetail.get("storeID")!=null && !mapDetail.get("storeID").toString().equals("")){
								MESBasicStoreSet store = storeSetService.getStoreSet(Long.parseLong(mapDetail.get("storeID").toString()));
								putInMaterialPart.setStoreID(store);
							}else{
								throw new BAPException("仓库启用货位时，货位不允许为空");
							}
						} catch (Exception e) {
							throw new BAPException("找不到对应货位");
						}
					}
				}else{
					throw new BAPException("仓库不允许为空");
				}
			} catch (Exception e) {
				throw new BAPException("找不到对应仓库");
			}
            */
			putInMaterialParts.add(putInMaterialPart);
		}
		DataGridService dataGridService = new DataGridService() {
			@Override
			public void execute() {
				if (putInMaterialParts != null && !putInMaterialParts.isEmpty()) {
					for (WOMPutInMaterialPart item : putInMaterialParts) {
						item.setHeadId(putInMaterial);
						item.setTableInfoId(putInMaterial.getTableInfoId());
						putInMaterialPartService.savePutInMaterialPart(item, null, "WOM_7.5.0.0_putInMaterial_putinView","noEvent");
					}
				}
			}
		};
		// 将新生成的表单变为生效状态
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setOperateType("submit");
		// 生效
		//putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, workFlowVar, dataGridService, null, false);
		putInMaterialService.saveByInterface(putInMaterial, workFlowVar, dataGridService, null, false);
	}
  
	public void addTaskReportinglDatas(Map<String, Object> map) {
		long taskID ;
		//根据生产批号找到生产工单
		if(map.get("batchNum")!=null && !map.get("batchNum").toString().equals("")){
			String hqlChar = "from WOMProduceTask where valid = ? and status = 99 and productBatchNum = ?";
			List<WOMProduceTask> produceTasks = produceTaskDao.findByHql(hqlChar,true,map.get("batchNum").toString());
			if(produceTasks!=null && produceTasks.size()>0){
				taskID = produceTasks.get(0).getId();
			}else{
				throw new BAPException("不存在对应的生产工单");
			}
		}else{
			throw new BAPException("批号不允许为空");
		}
		
		//****报工数量
		BigDecimal reportNum = null;
		try {
			if(map.get("reportNum")!=null && !map.get("reportNum").toString().equals("")){
				reportNum = new BigDecimal(map.get("reportNum").toString());
			}
		} catch (Exception e) {
			throw new BAPException("报工数量异常");
		}
		
		//****报工人
		Staff staff = null;
		try {
			if(map.get("staffID")!=null && !map.get("staffID").toString().equals("")){
				staff = staffService.get(Long.parseLong(map.get("staffID").toString()));
			}
		} catch (Exception e) {
			throw new BAPException("找不到对应报工人");
		}
		
		interfaceService.addTaskReportingTable(taskID, map.get("batchNum").toString(), reportNum, staff);
	}
	@Override
	public String getDetail(String produceTaskId) {
		try {
			long ptaskId = Long.parseLong(produceTaskId);
			// 獲得 工單 
			String hql = "from WOMProduceTask where valid = 1 and status = 99 and id = ? ";
			List<WOMProduceTask> produceTasks = produceTaskDao.findByHql(hql,ptaskId);
			
			if(produceTasks!=null && produceTasks.size()>0){
				
				ProduceTask pTask = new ProduceTask();
				
				WOMProduceTask produceTask = produceTasks.get(0);
				//工单Id
				pTask.setOrderId(produceTask.getId());
				//批次号
				pTask.setBatchCode(produceTask.getProductBatchNum());
				//详述
				pTask.setSpecification(produceTask.getRemark());
				//产品
				if(produceTask.getProductId()!=null && produceTask.getProductId().getId()!=null){
					MESBasicProduct mesProduct = productService.getProduct(produceTask.getProductId().getId());
					Produce produce = new Produce();
					produce.setId(mesProduct.getId());
					produce.setCode(mesProduct.getProductCode());
					produce.setName(mesProduct.getProductName());
					if(mesProduct.getProductBaseUnit()!=null){
						produce.setUnitCode(mesProduct.getProductBaseUnit().getCode());
						produce.setUnitName(mesProduct.getProductBaseUnit().getName());
					}
					
					pTask.setProduct(produce);
				}
				//配方
				if(produceTask.getFormularId()!=null && produceTask.getFormularId().getId()!=null){
					RMFormula formular = formulaService.getFormula(produceTask.getFormularId().getId());
					Recipe recipe = new Recipe();
					recipe.setName(formular.getName());
					recipe.setCode(formular.getCode());
					recipe.setVersion(formular.getEdition().toString());
					
					pTask.setRecipe(recipe);
				}
				//工作中心
				if(produceTask.getFactoryId()!=null && produceTask.getFactoryId().getId()!=null){
					MESBasicFactoryModel factoryModel = factoryModelService.getFactoryModel(produceTask.getFactoryId().getId());
					WorkCenter workCenter = new WorkCenter();
					workCenter.setId(factoryModel.getId());
					workCenter.setName(factoryModel.getName());
					workCenter.setCode(factoryModel.getCode());
					
					pTask.setWorkCenter(workCenter);
				}
				//生效人
				if(produceTask.getEffectStaffId()!=null){
					Staff staff = staffService.get(produceTask.getEffectStaffId());
					pTask.setApprover(staff.getName());
				}
				//生效时间
				if(produceTask.getEffectTime()!=null){
					pTask.setApprovalTime(produceTask.getEffectTime().getTime());
				}
				//物料
				String hqlChar = "from WOMProduceTaskActive where headID.id = ? and valid = 1) ";
				List<WOMProduceTaskActive> produceTaskActives = produceTaskDao.findByHql(hqlChar,ptaskId);
				List<Materials> materialsList = new ArrayList<Materials>();
				if(produceTaskActives!=null && produceTaskActives.size()>0){
					for (WOMProduceTaskActive produceTaskActive : produceTaskActives) {
						Materials materials = new Materials();
						if(produceTaskActive.getBatchNumObj()!=null && produceTaskActive.getBatchNumObj().getId()!=null){
							WOMStandingcropRef standingcropRef = standingcropRefService.getStandingcropRef(produceTaskActive.getBatchNumObj().getId());
							materials.setBatchCode(standingcropRef.getBatchText());
						}
						if(produceTaskActive.getProductId()!=null && produceTaskActive.getProductId().getId()!=null){
							MESBasicProduct mesProduct = productService.getProduct(produceTaskActive.getProductId().getId());
							materials.setId(mesProduct.getId());
							materials.setCode(mesProduct.getProductCode());
							materials.setName(mesProduct.getProductName());
							if(mesProduct.getProductBaseUnit()!=null)
								materials.setUnit(mesProduct.getProductBaseUnit().getName());
						}
						if(produceTaskActive.getPlanNum()!=null)
							materials.setAmount(produceTaskActive.getPlanNum());//理论用量
						if(produceTaskActive.getPhase()!=null)
							materials.setPhase(produceTaskActive.getPhase());//阶段
						if(produceTaskActive.getSequence()!=null)
							materials.setSequence(produceTaskActive.getSequence());//次序号
						if(produceTaskActive.getNeedWeigh()!=null)
							materials.setNeedWeigh(produceTaskActive.getNeedWeigh());//需要称重
						if(produceTaskActive.getMaxQuality()!=null)
							materials.setUpTolerate(produceTaskActive.getMaxQuality());//上限
						if(produceTaskActive.getMinQuality()!=null)
							materials.setLowTolerate(produceTaskActive.getMinQuality());;//下限
                      
						materialsList.add(materials);
					}
				}
				pTask.setMaterials(materialsList);
				
				String resultString = JSONPlainSerializer.serializeAsJSON(pTask, "orderId,batchCode,specification,product.id,product.code,product.name,product.unitName,product.unitCode,recipe.code,recipe.name,recipe.version,workCenter.id,workCenter.name,workCenter.code,materials.id,materials.name,materials.code,materials.amount,materials.batchCode,materials.unit,materials.sequence,materials.phase,materials.upTolerate,materials.lowTolerate,materials.needWeigh,materials.purity,approver,approvalTime");
				return resultString;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return null;
	}
	//后台模拟登录，会创建session
	private void setSession(String username,String companyCode){
		Authentication authentication = null;
		UserDetails details = null;
		Company company = companyService.getCompanyByCode(companyCode);
		details = userDetailsService.loadUserByUsername(username +"$$"+company.getId());
		authentication = new UsernamePasswordAuthenticationToken(details, details.getPassword(), details.getAuthorities());

		User user = (User) authentication.getPrincipal();
		IStaff staff = user.getStaff();
		List<com.supcon.orchid.foundation.entities.Role> rolelist = roleService.getRoles(user, company);
		List<IRole> roles = new ArrayList<IRole>();
		for(com.supcon.orchid.foundation.entities.Role role : rolelist){
			roles.add((IRole)role);
		}
		authentication = new OrchidAuthenticationToken(authentication.getPrincipal(), authentication.getCredentials(),
				authentication.getDetails(), company, staff, (Collection)roles, user.getAuthorities());

		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
	}
		
	
	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFLowScript(String arg0, Map<String, Object> arg1) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void syncEntity(Long arg0, String arg1) {
		// TODO Auto-generated method stub
		
	}
}
