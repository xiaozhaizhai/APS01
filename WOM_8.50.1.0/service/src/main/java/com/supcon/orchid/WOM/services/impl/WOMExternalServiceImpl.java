package com.supcon.orchid.WOM.services.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supcon.orchid.MESBasic.daos.impl.MESBasicBaseCustClassDaoImpl;
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
import com.supcon.orchid.MESBasic.services.MaterialService;
import com.supcon.orchid.MESBasic.services.QCSService;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetService;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogService;
import com.supcon.orchid.RM.services.RMMQDealinfoService;
import com.supcon.orchid.WOM.daos.WOMAdjustOrTempHeadDao;
import com.supcon.orchid.WOM.daos.WOMAdjustOrTempRecordsDao;
import com.supcon.orchid.WOM.daos.WOMBatchPhaseExelogDao;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialDao;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialNeedDao;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialPartDao;
import com.supcon.orchid.WOM.daos.WOMMaterialsOutputDao;
import com.supcon.orchid.WOM.daos.WOMProcFeedbackHeadDao;
import com.supcon.orchid.WOM.daos.WOMProdTaskActiExelogDao;
import com.supcon.orchid.WOM.daos.WOMProdTaskProcExelogDao;
import com.supcon.orchid.WOM.daos.WOMProduceMaterialSumDao;
import com.supcon.orchid.WOM.daos.WOMProduceTaskActiveDao;
import com.supcon.orchid.WOM.daos.WOMProduceTaskDao;
import com.supcon.orchid.WOM.daos.WOMProduceTaskProcessDao;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialDao;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialPartDao;
import com.supcon.orchid.WOM.daos.WOMQualityInspectDao;
import com.supcon.orchid.WOM.daos.WOMWaitPutinRecordsDao;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempHead;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempRecords;
import com.supcon.orchid.WOM.entities.WOMBatchCharge;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMaterialsOutput;
import com.supcon.orchid.WOM.entities.WOMProcFeedbackHead;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMQualityInspect;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.services.WOMBatchChargeService;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialService;
import com.supcon.orchid.WOM.services.WOMInterfaceSelfService;
import com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService;
import com.supcon.orchid.WOM.services.WOMProduceMaterialSumService;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveService;
import com.supcon.orchid.WOM.services.WOMProduceTaskProcessService;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartService;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.publicSet.entities.PublicSetBatchDeal;
import com.supcon.orchid.publicSet.entities.PublicSetBatchInfo;
import com.supcon.orchid.publicSet.entities.PublicSetBatchRelate;
import com.supcon.orchid.WOM.services.WOMExternalService;
import com.supcon.orchid.publicSet.services.PublicSetActBatStateService;
import com.supcon.orchid.publicSet.services.PublicSetBatchInfoService;
import com.supcon.orchid.publicSet.services.WOMInterfaceService;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.workflow.engine.entities.Deployment;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.services.IScriptService;
import com.supcon.orchid.workflow.engine.services.ProcessService;
import com.supcon.orchid.workflow.engine.services.TaskService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.exterEntity.ProBatch;
import com.supcon.orchid.WOM.exterEntity.ProcessData;
import com.supcon.orchid.WOM.exterEntity.PrecessStandardsData;
import com.supcon.orchid.WOM.exterEntity.TaskPartUrl;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.supcon.orchid.security.OrchidAuthenticationToken;
import com.supcon.orchid.utils.DateUtils;
import com.supcon.orchid.utils.JSONPlainSerializer;

import java.util.Collection;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.orm.entities.IStaff;
import com.supcon.orchid.orm.entities.IRole;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.foundation.services.DataPermissionService;
import com.supcon.orchid.foundation.services.RoleService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.i18n.InternationalResource;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.codehaus.jettison.json.JSONObject;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;

import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;


@Service("wom_externalService")
@Transactional
public class WOMExternalServiceImpl extends BaseServiceImpl implements
IScriptService, WOMExternalService, InitializingBean, DisposableBean{
	
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
	@Autowired
	private WOMProdTaskProcExelogService prodTaskProcExelogService;
	@Resource
	private WOMWaitPutinRecordsService waitPutinRecordsService;
    @Resource
    private WOMWaitPutinRecordsService waitPutinService;
	@Resource
	private WOMBatchPhaseExelogService batchPhaseExelogService;
	@Resource
	private WOMInterfaceSelfService interfaceSelfService;
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
	private MESBasicProductService productService;
	@Autowired
	private MESBasicFactoryModelService factoryModelService;
	@Autowired
	private WOMProduceTaskProcessService produceTaskProcessService;
	@Autowired
	private WOMProduceTaskActiveDao produceTaskActiveDao;
	@Autowired
	private WOMProduceTaskProcessDao produceTaskProcessDao;
	@Autowired
	private RMFormulaService formulaService;
	@Resource
	protected SystemCodeService systemCodeService;
    @Autowired
    private StaffService staffServcie;
	@Autowired
	private WOMMaterialsOutputDao materialsOutputDao;
	@Autowired
	private WOMAdjustOrTempRecordsDao adjustOrTempRecordsDao;
	@Autowired
	private WOMQualityInspectDao qualityInspectDao;
	@Autowired
	private MESBasicProductService basicProductService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private DataPermissionService dataPermissionService;
	@Autowired
	private WOMBatchChargeService batchChargeService;
	@Autowired
	private WOMBatchingMaterialNeedDao batchingMaterialNeedDao;
	@Autowired
	private WOMBatchingMaterialPartDao batchingMaterialPartDao;
	@Autowired
	private WOMWaitPutinRecordsDao waitPutinRecordsDao;
	@Autowired
	private MESBasicWareService wareService;
	@Autowired
	private MESBasicStoreSetService storeSetService;
	@Autowired
	private WOMAdjustOrTempHeadDao adjustOrTempHeadDao;
	@Autowired
	private WOMProcFeedbackHeadDao procFeedbackHeadDao;
	////批控同步MES
	@Autowired
    private RMMQDealinfoService rMMQDealinfoService;
    @Resource
    private WOMInterfaceService interfaceService;
    @Autowired
    private RMInterfaceSyncLogService rmInterFaceSyncLogService;
    @Autowired
    private PublicSetBatchInfoService batchInfoService;
    @Autowired
    private StaffService staffService;
	@Autowired
	private WOMBatchingMaterialService batchingMaterialService;
	@Autowired
	private WOMBatchingMaterialDao batchingMaterialDao;
    @Autowired
    private PublicSetActBatStateService actBatStateService;
	@Autowired
	private WOMProduceMaterialSumService produceMaterialSumService;
	@Autowired
	private WOMProduceMaterialSumDao produceMaterialSumDao;
	////

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
	/**
	 * 产品批次查询，查询工单的基础信息
	 * @author yj
	 * @param productID 产品ID
	 * @param batchNum 批次号
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param ProduceTaskID 生产工单ID
	 * @return json
			productID：产品id
			productName：产品名称
			productBatchNum:生产批号
			produceTaskID：工单ID
			produceTaskTime：生产日期
			workShop：车间（分公司）
			factoryId：生产线
			amount：数量
			productBaseUnit：单位id
			Process：工序属性
	 */
	@Override
	public String getProBatch(String productID, String batchNum,
			String startTime, String endTime, String ProduceTaskID, String isProduct) {
		
		StringBuilder hql = new StringBuilder();
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		
		//编辑查询条件
		hql.append("from WOMProduceTask where valid = 1 and status = 99 ");
		if(productID!=null && !"".equals(productID)){
			hql.append("and productId.id = :productID ");
			map.put("productID", Long.parseLong(productID));
		}
		if(batchNum!=null && !"".equals(batchNum)){
			hql.append("and productBatchNum = :batchNum ");
			map.put("batchNum", batchNum);
		}
		if(startTime!=null && !"".equals(startTime)){
			hql.append("and createTime >= :startTime ");
			Date startdateDate = null;
			try {
				startdateDate = sdf.parse(startTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("startTime", startdateDate);
		}
		if(endTime!=null && !"".equals(endTime)){
			hql.append("and createTime <= :endTime ");
			Date enddateDate = null;
			try {
				enddateDate = sdf.parse(endTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("endTime", enddateDate);
		}
		if(ProduceTaskID!=null && !"".equals(ProduceTaskID)){
			hql.append("and id = :ProduceTaskID ");
			map.put("ProduceTaskID", Long.parseLong(ProduceTaskID));
		}
		if("1".equals(isProduct)){
			hql.append("and productId.id in (select productid from MESBasicCprodAtt where prodAttrId = 1 and valid = 1) ");//产品
		}else if("2".equals(isProduct)){
			hql.append("and productId.id in (select productid from MESBasicCprodAtt where prodAttrId = 2 and valid = 1) ");//半成品
		}
		
		//查询符合条件的工单
		List<WOMProduceTask> produceTaskList = produceTaskDao.findByHql(hql.toString(),map);
		
		//将工单讯息赋值到 ProBatch
		List<ProBatch> pBatch = new ArrayList<ProBatch>();
		for (WOMProduceTask produceTask : produceTaskList) {
			
			ProBatch proBatch = new ProBatch();
			
			//产品id,产品名称,单位id
			if(produceTask.getProductId()!=null && produceTask.getProductId().getId()!=null){
				proBatch.setProductID(produceTask.getProductId().getId());
				proBatch.setProductName(productService.getProduct(produceTask.getProductId().getId()).getProductName());
				proBatch.setProductBaseUnit(productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit().getId());
			}
			//生产批号
			proBatch.setProductBatchNum(produceTask.getProductBatchNum());
			//工单ID
			proBatch.setProduceTaskID(produceTask.getId());
			//生产线,车间（分公司）
			if(produceTask.getFactoryId()!=null && produceTask.getFactoryId().getId()!=null && produceTask.getFactoryId().getId()!=-1){
				proBatch.setFactoryId(produceTask.getFactoryId().getId());
				proBatch.setWorkShop(factoryModelService.getFactoryModel(produceTask.getFactoryId().getId()).getParentId());
			}
			//数量
			proBatch.setAmount(produceTask.getProductNum());
			//工序属性
			String hqlChart = "from WOMProduceTaskProcess where valid = 1 and headId = ? ";
			List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskDao.findByHql(hqlChart,produceTask);
			for (WOMProduceTaskProcess produceTaskProcess : produceTaskProcessList) {
				if(produceTaskProcess.getFormularProcess()!=null && produceTaskProcess.getFormularProcess().getId()!=null){
					ProcessData process = new ProcessData();
					process.setProcessId(produceTaskProcess.getFormularProcess().getId());
					if(productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit()!=null && productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit().getId()!=null){
                    	proBatch.setProductBaseUnit(productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit().getId());
                	}
				}
			}
			//生产日期
			String hql_date = "from PublicSetBatchInfo where valid = 1 and batchNum = ? ";
			List<PublicSetBatchInfo> batchInfo = produceTaskDao.findByHql(hql_date,produceTask.getProductBatchNum());
			if(batchInfo!=null && batchInfo.size()>0 &&batchInfo.get(0)!=null && batchInfo.get(0).getProductionDate()!=null){
				proBatch.setProduceTaskTime(DateUtils.format(batchInfo.get(0).getProductionDate(), "yyyy-MM-dd HH:mm:ss"));
			}
			pBatch.add(proBatch);
		}
		
		//返回json
		return JSONPlainSerializer.serializeAsJSON(pBatch, "productID,productName,productBatchNum,produceTaskID,produceTaskTime,workShop,factoryId,amount,productBaseUnit,processList.processId,processList.processName");
	}
	
	/**
	 * 产品批次查询，得到原料与产品的数据
	 * @author yj
	 * @param batchNum 批次号
	 * @return json
			productID：产品id
			productName：产品名称
			productBatchNum:生产批号
			produceTaskID：工单ID
			produceTaskTime：生产日期
			workShop：车间（分公司）
			factoryId：生产线
			amount：数量
			productBaseUnit：单位id
			process:工序
	 */
	@Override
	public String getAllData(String batchNum) {
		return batchNum;
	}

	@Override
	public String getData(String batchNum,String type) {
		//将工单讯息赋值到 ProBatch
		List<ProBatch> pBatch = new ArrayList<ProBatch>();

		//物料 追溯 产品
		if("product".equals(type)){
			//获得批号关系表数据
			String hql = "from PublicSetBatchRelate where valid = ? and partBatch = ? and batchType.id = ?";
			List<PublicSetBatchRelate> batchRelateList = produceTaskDao.findByHql(hql,true,batchNum,"publicSetBatchType/01");
			if(batchRelateList!=null && batchRelateList.size()>0){
				for (PublicSetBatchRelate batchRelate : batchRelateList) {
					//获得主产品
					String mainBatch = batchRelate.getMainBatch();
					//获得工单 数据
					String hqlChar = "from WOMProduceTask where valid = 1 and status = 99 and productBatchNum = ?";
					List<WOMProduceTask> produceTaskList = produceTaskDao.findByHql(hqlChar,mainBatch);
					
					if(produceTaskList!=null && produceTaskList.size()>0){
						WOMProduceTask produceTask = produceTaskList.get(0);
						
						ProBatch proBatch = new ProBatch();
						
						//产品id,产品名称,单位id
						if(produceTask.getProductId()!=null && produceTask.getProductId().getId()!=null){
							proBatch.setProductID(produceTask.getProductId().getId());
							proBatch.setProductName(productService.getProduct(produceTask.getProductId().getId()).getProductName());
							proBatch.setProductBaseUnit(productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit().getId());
						}
						//生产批号
						proBatch.setProductBatchNum(produceTask.getProductBatchNum());
						//工单ID
						proBatch.setProduceTaskID(produceTask.getId());
						//生产线,车间（分公司）
						if(produceTask.getFactoryId()!=null && produceTask.getFactoryId().getId()!=null){
							proBatch.setFactoryId(produceTask.getFactoryId().getId());
							proBatch.setWorkShop(factoryModelService.getFactoryModel(produceTask.getFactoryId().getId()).getParentId());
						}
						//数量
						proBatch.setAmount(produceTask.getProductNum());
						//工序属性
						String hqlChart = "from WOMProduceTaskProcess where valid = 1 and headId = ? ";
						List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskDao.findByHql(hqlChart,produceTask);
						for (WOMProduceTaskProcess produceTaskProcess : produceTaskProcessList) {
							if(produceTaskProcess.getFormularProcess()!=null && produceTaskProcess.getFormularProcess().getId()!=null){
								ProcessData process = new ProcessData();
								process.setProcessId(produceTaskProcess.getFormularProcess().getId());
								if(productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit()!=null && productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit().getId()!=null){
			                    	proBatch.setProductBaseUnit(productService.getProduct(produceTask.getProductId().getId()).getProductBaseUnit().getId());
			                	}
							}
						}
						//生产日期
						String hql_date = "from PublicSetBatchInfo where valid = 1 and batchNum = ? ";
						List<PublicSetBatchInfo> batchInfo = produceTaskDao.findByHql(hql_date,produceTask.getProductBatchNum());
						if(batchInfo!=null && batchInfo.size()>0 &&batchInfo.get(0)!=null && batchInfo.get(0).getProductionDate()!=null){
							proBatch.setProduceTaskTime(DateUtils.format(batchInfo.get(0).getProductionDate(), "yyyy-MM-dd HH:mm:ss"));
						}
						pBatch.add(proBatch);
					}
				}
			}
		}
		
		//产品 追溯 物品
		if("material".equals(type)){
			//获得批号关系表数据
			String hql = "from PublicSetBatchRelate where valid = ? and mainBatch = ? and batchType.id = ?";
			List<PublicSetBatchRelate> batchRelateList = produceTaskDao.findByHql(hql,true,batchNum,"publicSetBatchType/01");
			if(batchRelateList!=null && batchRelateList.size()>0){
				for (PublicSetBatchRelate batchRelate : batchRelateList) {
					//获得源产品
					String partBatch = batchRelate.getPartBatch();
					//获得批号关系表数据
					String hqlChar = "from PublicSetBatchDeal where valid = ? and sourceBatchNum = ? and batchNum = ? and tableState.id = ? and dealType.id = ? ";
					List<PublicSetBatchDeal> batchDealList = produceTaskDao.findByHql(hqlChar,true,batchNum,partBatch,"publicSetTableState/02","publicSetDealWay/putInMaterial");
					
					ProBatch proBatch = new ProBatch();
					
					//产品id,产品名称,单位id
					if(batchRelate.getPartProduct()!=null && batchRelate.getPartProduct().getId()!=null){
						proBatch.setProductID(batchRelate.getPartProduct().getId());
						proBatch.setProductName(productService.getProduct(batchRelate.getPartProduct().getId()).getProductName());
						proBatch.setProductBaseUnit(productService.getProduct(batchRelate.getPartProduct().getId()).getProductBaseUnit().getId());
					}
					//生产批号
					proBatch.setProductBatchNum(partBatch);
					//数量
					if(batchDealList!=null && batchDealList.size()>0){
						BigDecimal sum = new BigDecimal(0);
						for (PublicSetBatchDeal batchDeal : batchDealList) {
							sum = sum.add(batchDeal.getAmount());
						}
						proBatch.setAmount(sum);
					}
					pBatch.add(proBatch);
				}
			}
		}
		
		//返回json
		return JSONPlainSerializer.serializeAsJSON(pBatch, "productID,productName,productBatchNum,produceTaskID,produceTaskTime,workShop,factoryId,amount,productBaseUnit,processList.processId,processList.processName");
	}


	@Override
    //工单信息查询，工单详细信息参照页面的url
	public String getProduceTaskPartUrl(String batchNum) {
		//"select URL,CODE,ENTITY_CODE from EC_VIEW where CODE=? and TYPE = ?";
		String sql="select URL from EC_VIEW where CODE=? and TYPE=?";
		List<Object> query = produceTaskDao.createNativeQuery(sql,"WOM_7.5.0.0_produceTask_taskRef","REFERENCE").list();
		TaskPartUrl taskUrl=new TaskPartUrl();
		taskUrl.setTaskURL(query.get(0).toString());
		//返回json
		return JSONPlainSerializer.serializeAsJSON(taskUrl, "taskURL");
	}
	/**
	 * 获取关键工艺参数，批号对应的所有工艺参数
	 * @author yj
	 * @param batchNum 批号
	 * @return json
			eactiveId：工序活动id
			quota：指标
			stValue:标准值
			overrunFlag：统计超限
			limitInter：扫描间隔（超限）
			upperLimit：上限
			maxLimit：上上限
			lowerLimit：下限
			loweMxLimit：下下限
			fluctuateFlag：统计波动
			flucInter：波动扫描间隔(秒)
			flucUpperLimit：波动上限
			flucLowerLimit：波动下限
	 */
	@Override
	public String getPrecessStandards(String batchNum) {
		// 獲得 工單 
		String hql = "from WOMProduceTask where valid = 1 and status = 99 and productBatchNum = ? ";
		List<WOMProduceTask> produceTask = produceTaskDao.findByHql(hql,batchNum);
		//获得配方
		RMFormula formula = null;
		if(produceTask!=null && produceTask.size()>0 && produceTask.get(0).getFormularId()!=null && produceTask.get(0).getFormularId().getId()!=null){
			formula = formulaService.getFormula(produceTask.get(0).getFormularId().getId());
		}
		//获得工序
		List<RMFormulaProcess> formulaProcessList = null;
		if(formula!=null){
			String hqlChart = "from RMFormulaProcess where valid = 1 and formulaId = ? ";
			formulaProcessList = produceTaskDao.findByHql(hqlChart,formula);
		}
		//获得工艺参数
		List<PrecessStandardsData> precessStandardsDataList = new ArrayList<PrecessStandardsData>();
		if(formulaProcessList!=null){
			for (RMFormulaProcess formulaProcess : formulaProcessList) {
				String hqlChart = "from RMPrecessStandards where valid = 1 and processId = ? ";
				List<RMPrecessStandards> precessStandardsList = produceTaskDao.findByHql(hqlChart,formulaProcess);
				if(precessStandardsList!=null && precessStandardsList.size()>0){
					for (RMPrecessStandards precessStandards : precessStandardsList) {
						
						PrecessStandardsData precessStandardsData = new PrecessStandardsData();
						//工序活动id
						if(precessStandards.getId()!=null){
							precessStandardsData.setEactiveId(precessStandards.getId());
						}
						//指标
						if(precessStandards.getQuota()!=null){
							precessStandardsData.setQuota(precessStandards.getQuota());
						}
						//标准值
						if(precessStandards.getStValue()!=null){
							precessStandardsData.setStValue(precessStandards.getStValue());
						}
						//统计超限
						if(precessStandards.getOverrunFlag()!=null){
							precessStandardsData.setOverrunFlag(precessStandards.getOverrunFlag());
						}
						//扫描间隔（超限）
						if(precessStandards.getLimitInter()!=null){
							precessStandardsData.setLimitInter(precessStandards.getLimitInter());
						}
						//上限
						if(precessStandards.getUpperLimit()!=null){
							precessStandardsData.setUpperLimit(precessStandards.getUpperLimit());
						}
						//上上限
						if(precessStandards.getMaxLimit()!=null){
							precessStandardsData.setMaxLimit(precessStandards.getMaxLimit());
						}
						//下限
						if(precessStandards.getLowerLimit()!=null){
							precessStandardsData.setLowerLimit(precessStandards.getLowerLimit());
						}
						//下下限
						if(precessStandards.getLoweMxLimit()!=null){
							precessStandardsData.setLoweMxLimit(precessStandards.getLoweMxLimit());
						}
						//统计波动
						if(precessStandards.getFluctuateFlag()!=null){
							precessStandardsData.setFluctuateFlag(precessStandards.getFluctuateFlag());
						}
						//波动扫描间隔(秒)
						if(precessStandards.getFlucInter()!=null){
							precessStandardsData.setFlucInter(precessStandards.getFlucInter());
						}
						//波动上限
						if(precessStandards.getFlucUpperLimit()!=null){
							precessStandardsData.setFlucUpperLimit(precessStandards.getFlucUpperLimit());
						}
						//波动下限
						if(precessStandards.getFlucLowerLimit()!=null){
							precessStandardsData.setFlucLowerLimit(precessStandards.getFlucLowerLimit());
						}
						
						precessStandardsDataList.add(precessStandardsData);
					}
				}
			}
		}
		
		//返回json
		return JSONPlainSerializer.serializeAsJSON(precessStandardsDataList, "eactiveId,quota,stValue,overrunFlag,limitInter,upperLimit,maxLimit,lowerLimit,loweMxLimit,fluctuateFlag,flucInter,flucUpperLimit,flucLowerLimit");
	}

///////////////////////////////////////////////////////////////工单模块接口
	/**
	 * 工序执行状态
	 * 01待执行
	 * 02执行中
	 * 03已完成
	 */
    public static final String PROCESS_STATE_TODO = "processState/state01";
    public static final String PROCESS_STATE_DOING = "processState/state02";
    public static final String PROCESS_STATE_DONE = "processState/state03";
	/**
     * 常规
     */
    public static final String ACTIVE_TYPE_COMMON = "activeType/activeType1";
    /**
     * 检验
     */
    public static final String ACTIVE_TYPE_INSPECT = "activeType/activeType5";
    /**
     * 产出
     */
    public static final String ACTIVE_TYPE_OUTPUT = "activeType/activeType6";
    /**
     * 投配料
     */
    public static final String ACTIVE_TYPE_BATCHING = "activeType/activeType4";
    /**
     * 配料
     */
    public static final String ACTIVE_TYPE_BATCHES = "activeType/activeType2";
    /**
     * 投料
     */
    public static final String ACTIVE_TYPE_CHARGE = "activeType/activeType3";
    /**
     * 生产报工单表头
     */
    private WOMTaskReporting taskReporting = null;
    /**
     * 生产报工单表体
     */
    private List<WOMTaskReportingPart> taskReportingParts = null;   
    
    /**
     * 投料单表头
     */
    private WOMPutInMaterial putInMaterial=null;
    /**
     * 投料单表体
     */
    private  List<WOMPutInMaterialPart> putInMaterialParts=null;
    
    
    
    /**
     *判断字符能否转数字
     * @param str
     * @return
     * by hyc
     */
    public static boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("-?[0-9]+\\.?[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }
    
	/**
	 * 设置错误信息
	 * @param resultMap
	 * @param errorMessage
	 * @return
	 */
	private Map<String, Object> setErrorMessage(Map<String, Object> resultMap, String errorMessage){
		resultMap.put("resultCode", -1);
		resultMap.put("resultMsg", errorMessage);
		if(resultMap.containsKey("result"))
			resultMap.remove("result");
		return resultMap;
	}
	/**
	 * 开始活动比较活动顺序
	 * @param errorMsg
	 * @param produceTaskProcess
	 * @param produceTaskActive
	 * @param produceTask
	 * @return
	 */
    private String startActiveCompareParent(StringBuilder errorMsg, WOMProduceTaskProcess produceTaskProcess, WOMProduceTaskActive produceTaskActive, WOMProduceTask produceTask) {
        List<WOMProduceTaskActive> parentsProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and parentActive=1 and sort < ?", produceTaskProcess,produceTask,produceTaskActive.getSort());
        for (WOMProduceTaskActive taskActive : parentsProduceTaskActives) {
            if (!StringUtils.equals(taskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(taskActive.getActiveState().getId(),PROCESS_STATE_DOING)) {
                return errorMsg.append("活动 [" + taskActive.getName() + "] 还未完成,按照顺序限定不能开始当前活动！").toString();
            }else if(!StringUtils.equals(taskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(taskActive.getActiveState().getId(),PROCESS_STATE_TODO)){
                return errorMsg.append("活动 [" + taskActive.getName() + "] 还未执行,按照顺序限定不能开始当前活动！").toString();
            }
        }
        return null;
    }
	/**
	 * 比较父节点顺序
	 * @param errorMsg
	 * @param produceTask
	 * @param produceTaskProcess
	 * @param produceTaskActive
	 * @return
	 */
	private boolean compareParentsSort(StringBuilder errorMsg, WOMProduceTask produceTask, WOMProduceTaskProcess produceTaskProcess, WOMProduceTaskActive produceTaskActive) {
        List<WOMProduceTaskActive> parentsProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and parentActive=1 and sort < ?", produceTaskProcess,produceTask,produceTaskActive.getSort());
        for (WOMProduceTaskActive taskActive : parentsProduceTaskActives) {
            if (!StringUtils.equals(taskActive.getExecSort(),produceTaskActive.getExecSort()) && !StringUtils.equals(taskActive.getActiveState().getId(),PROCESS_STATE_DONE)) {
                errorMsg.append("活动 [" + taskActive.getName() + "] 还未完成,按照顺序限定不能结束当前活动！");
                return true;
            }
        }
        return false;
    }
	
    //后台模拟登录，会创建session
    private void setSession(String username,String companyCode){
        Authentication authentication = null;
        UserDetails details = null;
        Company company = companyService.getCompanyByCode(companyCode);
        // details = userDetailsService.loadUserByUsername(username +"$$"+company.getId());
        details= userService.loadUserWithNoPermission(username +"$$"+company.getId());
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
    
	/**
	 * 活动开始
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> startActive(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		StringBuilder errorMsg = new StringBuilder();
		//StringBuffer resultMsg=new StringBuffer();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		WOMProduceTaskActive produceTaskActive=null;
		WOMProduceTaskProcess produceTaskProcess=null; 
		Date startTime=null;
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}		
		//开始时间
		if(map.get("startTime")!=null && !map.get("startTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                startTime = sdf.parse(map.get("startTime").toString());
            } catch (Exception e) { 
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			startTime=new Date();
		}
		
		//活动id//工序//指令单 
		if(map.get("activeId")!=null && !map.get("activeId").toString().equals("")){
			Long activeId=Long.valueOf(map.get("activeId").toString());
            produceTaskActive = produceTaskActiveService.getProduceTaskActive(activeId);
            if(produceTaskActive!=null){
                produceTaskProcess=produceTaskActive.getOrderProcessId();
                produceTask=produceTaskActive.getHeadID();
            }else{
                return setErrorMessage(resultMap,"找不到对应的活动！");
            }
		}else{
            return setErrorMessage(resultMap,"活动id不能为空！");
		}	
		
        if(StringUtils.equals(PROCESS_STATE_DONE,produceTaskProcess.getProcessState().getId())){
            return setErrorMessage(resultMap,"当前工序已经结束！");
        }
        
        //判断当前工序是否在可执行的顺序内
        List<WOMProduceTaskProcess> produceTaskProcesses = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and exeOrder<? and processState.id!=?", produceTask,produceTaskProcess.getExeOrder(),PROCESS_STATE_DONE);
        if (produceTaskProcesses.size() > 0) {
            return setErrorMessage(resultMap,"请按照工序顺序开始活动！");
        }
        
        //大工序顺序比较完成之后 需要再比较每个活动
        //如果活动不是"投配料"活动，并且是父活动，只需要对比当前所有父节点的顺序即可
        if (produceTaskActive.getParentActive() && !StringUtils.equals(ACTIVE_TYPE_BATCHING,produceTaskActive.getActiveType().getId())) {
            String error = startActiveCompareParent(errorMsg, produceTaskProcess, produceTaskActive, produceTask);
            if (error != null) {
                return setErrorMessage(resultMap,error);
            }
        }else if(produceTaskActive.getParentActive() && StringUtils.equals(ACTIVE_TYPE_BATCHING,produceTaskActive.getActiveType().getId())){
        	 return setErrorMessage(resultMap,"该活动为投配料活动，请开始执行投配料活动中次序靠前的子活动！");
        }else {
            //如果当前活动是子活动，需要首先找到父节点，然后对比当前父节点的顺序，然后对比当前父节点下的所有子节点的顺序
            WOMProduceTaskActive parentProduceTaskActive = produceTaskActiveService.getProduceTaskActive(produceTaskActive.getParentActiveId());
            String error = startActiveCompareParent(errorMsg, produceTaskProcess, parentProduceTaskActive, produceTask);
            if (error != null){
                return setErrorMessage(resultMap,error);
            } 
            //接着比较所有子节点
            List<WOMProduceTaskActive> childrenProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and parentActiveId=? and sort < ?", parentProduceTaskActive.getId(),produceTaskActive.getSort());
            for (WOMProduceTaskActive childrenProduceTaskActive : childrenProduceTaskActives) {
                if (!StringUtils.equals(childrenProduceTaskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(childrenProduceTaskActive.getActiveState().getId(),PROCESS_STATE_DOING)) {
                    errorMsg.append("活动 [" + childrenProduceTaskActive.getName() + "] 还未完成,按照顺序限定不能开始当前活动！");
                   // return setErrorMessage(resultMap,errorMsg);
                    return setErrorMessage(resultMap,errorMsg.toString());
                }else if (!StringUtils.equals(childrenProduceTaskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(childrenProduceTaskActive.getActiveState().getId(),PROCESS_STATE_TODO)) {
                    errorMsg.append("活动 [" + childrenProduceTaskActive.getName() + "] 还未开始,按照顺序限定不能开始当前活动！");
                    return setErrorMessage(resultMap,errorMsg.toString());
                }
            }
        }
        
        //生成活动执行记录  如果没有执行记录 需要新插入
        if (((BigDecimal)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PROD_TASK_ACTI_EXELOGS WHERE TASKID=? AND VALID = 1 AND TASK_ACTIVEID=?", produceTask.getId(),produceTaskActive.getId()).uniqueResult()).intValue() == 0) {    //如果当前指令单的执行记录找不到条目，新插入
            WOMProdTaskActiExelog prodTaskActiExelog = new WOMProdTaskActiExelog();
			prodTaskActiExelog.setTaskProcessID(produceTaskProcess);
            prodTaskActiExelog.setTaskActiveID(produceTaskActive);
          	prodTaskActiExelog.setTableInfoId(produceTask.getTableInfoId());
            prodTaskActiExelog.setActiveName(produceTaskActive.getName());
            prodTaskActiExelog.setActiveType(produceTaskActive.getActiveType());
            prodTaskActiExelog.setActiveSource(produceTaskActive.getActiveSource());
            prodTaskActiExelog.setProductID(produceTaskActive.getProductId());
            prodTaskActiExelog.setFinalInspection(produceTaskActive.getFinalInspection());
            prodTaskActiExelog.setPlanNum(produceTaskActive.getPlanNum());
            prodTaskActiExelog.setRemark(produceTaskActive.getRemark());
          	prodTaskActiExelog.setFormularActice(produceTaskActive.getActiveId());
          	prodTaskActiExelog.setIsPassCheck(produceTaskActive.getActiveId().getIsPassCheck());
            prodTaskActiExelog.setTaskID(produceTask);
            prodTaskActiExelog.setStartTime(startTime);
            prodTaskActiExelog.setCid(1000L);
            prodTaskActiExelog.setCreateTime(new Date());
            //操作人 
          	prodTaskActiExelog.setCreateStaff(staff);
            if (produceTaskActive.getFinalInspection()) {
                prodTaskActiExelog.setBatchNum(produceTask.getProductBatchNum());
            }
            prodTaskActiExelogDao.save(prodTaskActiExelog);
          	prodTaskActiExelogDao.flush();
            prodTaskActiExelogDao.clear();
        }
        //活动类型为产出生成物料产出表记录
        if(StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_OUTPUT)){
            WOMMaterialsOutput output = new WOMMaterialsOutput();
            output.setActiveID(produceTaskActive);
            output.setOperateStaffID(staff);
          	output.setCid(1000L);
            materialsOutputDao.save(output);
        }
        SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode("processState/state02");
        //如果是非主活动，需要把主活动也要变更状态
        if (!produceTaskActive.getParentActive()) {
            if (produceTaskActive.getParentActiveId() != null) {
                WOMProduceTaskActive parentActive = produceTaskActiveService.getProduceTaskActive(produceTaskActive.getParentActiveId());
                parentActive.setActiveState(sc_executory);
              	parentActive.setStartTime(startTime);
                produceTaskActiveDao.save(parentActive);
            }

        }
		
        //更改工序活动 状态
        produceTaskActive.setActiveState(sc_executory);
        produceTaskActive.setStartTime(startTime);
        produceTaskActiveDao.save(produceTaskActive);
		resultMap.put("resultCode", 0);//回填返回信息
		resultMap.put("activeId", produceTaskActive.getId());//活动id
		resultMap.put("activeType", produceTaskActive.getActiveType().getId());//活动类型
		return resultMap;
	}
	
	/**
	 * 机动活动开始
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> adjustStartActive(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		Staff staff = null;
		WOMProduceTask task = null;
		WOMProduceTaskProcess taskProcess = null;
		// 活动处理表
		WOMAdjustOrTempHead adjustOrTempHead = null;
		Date startTime = null;
		// 操作人
		if (map.get("staffId") != null && !map.get("staffId").toString().equals("")) {
			Long staffId = Long.valueOf(map.get("staffId").toString());
			staff = staffServcie.load(staffId);
			if (staff == null) {
				return setErrorMessage(resultMap, "未找到对应人员！");
			}
		}
		// 开始时间
		if (map.get("startTime") != null
				&& !map.get("startTime").toString().equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				startTime = sdf.parse(map.get("startTime").toString());
			} catch (Exception e) {
				return setErrorMessage(resultMap, "日期格式有误！");
			}
		} else {
			startTime = new Date();
		}
		// 活动处理单id
		if (map.get("dealId") != null
				&& !map.get("dealId").toString().equals("")) {
			Long dealId = Long.valueOf(map.get("dealId").toString());
			adjustOrTempHead = adjustOrTempHeadDao.get(dealId);
			if (adjustOrTempHead != null) {
				taskProcess = adjustOrTempHead.getProcessId();
				task = adjustOrTempHead.getAdjustHeadID();
			}
		} else {
			return setErrorMessage(resultMap, "活动处理单id不能为空！");
		}

		// 开始活动，创建新的调整执行记录
		WOMAdjustOrTempRecords records = new WOMAdjustOrTempRecords();
		records.setActiceName(adjustOrTempHead.getActiveName());
		records.setActiveType(adjustOrTempHead.getActiveType());
		records.setRecordIsAdjust(adjustOrTempHead.getIsAgile());
		records.setRecordDataSource(adjustOrTempHead.getDataSource());
		if (!adjustOrTempHead.getIsAgile()) {
			// 不是灵活投料就肯定会有物料的
			records.setRecordProduct(adjustOrTempHead.getProduct());
		}
		// 判断当前工序是否在可执行的顺序内
		List<WOMProduceTaskProcess> produceTaskProcesses = produceTaskProcessDao.findByHql(
						" from WOMProduceTaskProcess where valid = 1 and headId=? and exeOrder<? and processState.id!=?",
						task, taskProcess.getExeOrder(), "processState/state03");
		if (produceTaskProcesses.size() > 0) {
			return setErrorMessage(resultMap, "请按照工序顺序开始活动!");
		}
		if (StringUtils.equals(taskProcess.getHeadId().getTaskState().getId(),"womTaskState/03")) {
			return setErrorMessage(resultMap, "指令单已经结束，不能开始活动!");
		} else if (StringUtils.equals(taskProcess.getHeadId().getTaskState().getId(), "womTaskState/04")) {
			return setErrorMessage(resultMap, "指令单已经终止，不能开始活动!");
		}
		if (StringUtils.equals(taskProcess.getProcessState().getId(),"processState/state03")) {
			return setErrorMessage(resultMap, "工序已经结束，不能开始活动!");
		}
		if (taskProcess != null) {
			records.setActiveRecordState((SystemCode) systemCodeService.getSystemCode("processState/state02"));
			records.setHeaderID(taskProcess.getHeadId());//指令单
			records.setTableInfoId(taskProcess.getHeadId().getTableInfoId());//指令单tableInfo
		}
		records.setStartTime(startTime);
		records.setProcessID(taskProcess.getId());
		records.setProcessName(taskProcess.getName());
		records.setFormularActive(adjustOrTempHead.getFormulaProcessActive());
		adjustOrTempRecordsDao.save(records);
		// 创建工序报工页面单据
		/*
		 * WOMProcFeedbackHead womProcFeedbackHead = new WOMProcFeedbackHead();
		 * if (records.getRecordProduct() != null) {
		 * womProcFeedbackHead.setProduct(records.getRecordProduct()); }
		 * womProcFeedbackHead.setAdjustDealRecord(records);
		 * womProcFeedbackHead.setTaskId(records.getHeaderID());
		 * womProcFeedbackHead.setIsAgile(adjustOrTempHead.getIsAgile());
		 * procFeedbackHeadDao.save(womProcFeedbackHead);
		 */
		// 生成活动执行记录
		// 生成活动执行记录 如果没有执行记录 需要新插入
		if (((BigDecimal) produceTaskProcessDao.createNativeQuery(
				"SELECT COUNT(ID) FROM WOM_PROD_TASK_ACTI_EXELOGS WHERE TASKID=? AND VALID = 1 AND ADJUST_RECORDID=?",
			records.getHeaderID().getId(), records.getId()).uniqueResult()).intValue() == 0) {
			// 如果当前指令单的执行记录找不到条目，新插入
			WOMProdTaskActiExelog prodTaskActiExelog = new WOMProdTaskActiExelog();
			prodTaskActiExelog.setTaskProcessID(taskProcess);
			prodTaskActiExelog.setAdjustRecordID(records.getId());
			prodTaskActiExelog.setIsAdjust(true);
			prodTaskActiExelog.setTableInfoId(records.getHeaderID().getTableInfoId());
			prodTaskActiExelog.setActiveName(records.getActiceName());
			prodTaskActiExelog.setFormularActice(records.getFormularActive());
			prodTaskActiExelog.setActiveType(records.getActiveType());
			prodTaskActiExelog.setIsPassCheck(true);
			prodTaskActiExelog.setStaffID(staff);
			prodTaskActiExelog.setProductID(records.getRecordProduct());
			prodTaskActiExelog.setTaskID(records.getHeaderID());
			prodTaskActiExelog.setActiveSource(records.getRecordDataSource());
			prodTaskActiExelog.setStartTime(startTime);
			if (records.getFinalInspection()) {
				prodTaskActiExelog.setBatchNum(records.getHeaderID().getProductBatchNum());
			}
			prodTaskActiExelogDao.save(prodTaskActiExelog);
			prodTaskActiExelogDao.flush();
			prodTaskActiExelogDao.clear();
	       if (StringUtils.equals(taskProcess.getProcessState().getId(),"processState/state01")) {
	            //如果工序未开始，则将状态更新
	            taskProcess.setStartTime(startTime);
	            taskProcess.setProcessState((SystemCode) systemCodeService.getSystemCode("processState/state02"));
	            produceTaskProcessDao.save(taskProcess);
	        }
	        if (StringUtils.equals(taskProcess.getHeadId().getTaskState().getId(),"womTaskState/01")) {
	            //如果指令单未开始，则将状态更新
	            task.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/02"));
	            task.setActStartTime(startTime);
	            produceTaskDao.save(task);
	        }			
		}
		resultMap.put("resultCode", 0);// 回填返回信息
		resultMap.put("dealId",map.get("dealId").toString() );// 活动id
		resultMap.put("activeType", records.getActiveType());// 活动类型
		resultMap.put("adjustRecordid", records.getId());//活动处理记录表id
		return resultMap;
	}
	/**
	 * 活动结束
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> endActive(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		StringBuilder errorMsg = new StringBuilder();
		//StringBuffer resultMsg=new StringBuffer();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		WOMProduceTaskActive produceTaskActive=null;
        //父节点-活动
        WOMProduceTaskActive parentProduceTaskActive = null;
		WOMProduceTaskProcess produceTaskProcess=null; 
        WOMProdTaskActiExelog actiExelog=null;
		Date endTime=null;
		String isAuto="";
		BigDecimal putInNum;
		BigDecimal outComeNum;
		if((map.get("actiExelogId")==null || map.get("actiExelogId").toString().equals("")) && (map.get("activeId")==null || map.get("activeId").toString().equals(""))){
            return setErrorMessage(resultMap,"活动id，活动执行记录id不能同时为空！");
		}
		//活动执行记录id
		if(map.get("actiExelogId")!=null && !map.get("actiExelogId").toString().equals("")){
			//活动执行记录id
			Long actiExelogId=Long.valueOf(map.get("actiExelogId").toString());
             actiExelog = prodTaskActiExelogDao.get(actiExelogId);
            if(actiExelog!=null){
                produceTaskProcess=actiExelog.getTaskProcessID();
                produceTask=actiExelog.getTaskID();
              	produceTaskActive=actiExelog.getTaskActiveID();
            }else{
                return setErrorMessage(resultMap,"找不到对应的活动执行记录！");
            }
		}else if(map.get("activeId")!=null && !map.get("activeId").toString().equals("")){
			//活动id//工序//指令单 
			Long activeId=Long.valueOf(map.get("activeId").toString());
            produceTaskActive = produceTaskActiveService.getProduceTaskActive(activeId);
            if(produceTaskActive!=null){
                produceTaskProcess=produceTaskActive.getOrderProcessId();
                produceTask=produceTaskActive.getHeadID();
                //根据活动id找到活动执行记录
/*                List<WOMProdTaskActiExelog> actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and taskActiveID=?",produceTaskActive);
                if(!actiExelogs.isEmpty()){
                	actiExelog=actiExelogs.get(0);
                }*/
            }else{
                return setErrorMessage(resultMap,"找不到对应的活动！");
            }
		}
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}		
		//结束时间
		if(map.get("endTime")!=null && !map.get("endTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
            	endTime = sdf.parse(map.get("endTime").toString());
            } catch (Exception e) { 
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			endTime=new Date();
		}
		if(map.get("isAuto")==null || map.get("isAuto").toString().equals("")){
        	return setErrorMessage(resultMap,"是否手动结束活动不能为空！");
		}
        String sql = "SELECT COUNT(ID) FROM WOM_BATCHING_MATERIAL_NEEDS WHERE TASK_ACTIVE = ? AND VALID = 1 AND STATE = ?";

        if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_BATCHES) &&  ((Number)produceTaskProcessDao.createNativeQuery(sql, produceTaskActive.getId(),"womNeedState/04").uniqueResult()).intValue() == 0){
        	return setErrorMessage(resultMap,"配料需求未完成！");
        }
        if(StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_INSPECT) && "0".equals(isAuto)){
        	return setErrorMessage(resultMap,"暂不允许手动结束检验活动！");
        }
        //结束活动判断是否工序报工
/*        List<WOMProdTaskActiExelog> activeExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and taskActiveID=?",produceTaskActive);
        BigDecimal actualNum = null;
        if (!activeExelogs.isEmpty()) {
            for (WOMProdTaskActiExelog activeExelog : activeExelogs) {
                //结束活动前必须保证已经创建了报工任务单
                actualNum = toProcfeedback(errorMsg,actiExelog, produceTaskActive,endTime);
            }
        }else {
        	return setErrorMessage(resultMap,"当前活动生成活动记录单失败，请联系管理员！");
        }

        if (errorMsg.length() > 0) {
        	return setErrorMessage(resultMap,errorMsg.toString());
        }
        produceTaskActiveDao.flush();
        produceTaskActiveDao.clear();*/
             
        if (StringUtils.equals(produceTaskActive.getActiveState().getId(),PROCESS_STATE_DONE)) {
        	return setErrorMessage(resultMap,"当前活动已完成！");
        }
        if (StringUtils.equals(produceTaskActive.getActiveState().getId(),PROCESS_STATE_TODO)) {
        	return setErrorMessage(resultMap,"当前活动还未进行，请执行本活动！");
        }  
        //顺序比较
        //当前选中的活动的大工序
        WOMProduceTaskProcess selectedActiveProcess = produceTaskActive.getOrderProcessId();
        List<WOMProduceTaskProcess> produceTaskProcesses = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=?", produceTask);
        for (WOMProduceTaskProcess taskProcess : produceTaskProcesses) {
            //如果顺序比当前活动的大工序小,并且状态不为已完成
            if (taskProcess.getExeOrder() < selectedActiveProcess.getExeOrder() && !StringUtils.equals(taskProcess.getProcessState().getId(),PROCESS_STATE_DONE)) {
                errorMsg.append("大工序 [" + taskProcess.getName() + "] 还未完成,按照顺序限定不能结束当前活动！");
            	return setErrorMessage(resultMap,errorMsg.toString());
            }
        }              
        //如果当前活动为"父节点",只需要比较所有同为"父节点"的工序的顺序即可
        if (produceTaskActive.getParentActive()) {
            if (compareParentsSort(errorMsg, produceTask, produceTaskProcess, produceTaskActive))
            	return setErrorMessage(resultMap,errorMsg.toString());
        }else {
            //如果当前活动不是父节点,则需要先找到其父节点，比较父节点顺序，再比较当前节点下的所有子节点
            parentProduceTaskActive = produceTaskActiveService.getProduceTaskActive(produceTaskActive.getParentActiveId());
            if (compareParentsSort(errorMsg, produceTask, produceTaskProcess, parentProduceTaskActive))
            	return setErrorMessage(resultMap,errorMsg.toString());
            //接着比较所有子节点
            List<WOMProduceTaskActive> childrenProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and parentActiveId=? and sort < ?", parentProduceTaskActive.getId(),produceTaskActive.getSort());
            for (WOMProduceTaskActive childrenProduceTaskActive : childrenProduceTaskActives) {
                if (!StringUtils.equals(childrenProduceTaskActive.getExecSort(),produceTaskActive.getExecSort()) && !StringUtils.equals(childrenProduceTaskActive.getActiveState().getId(),PROCESS_STATE_DONE)) {
                    errorMsg.append("活动 [" + childrenProduceTaskActive.getName() + "] 还未完成,按照顺序限定不能结束当前活动！");
                	return setErrorMessage(resultMap,errorMsg.toString());
                }
            }
        }    
        
        SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode("processState/state03");

        //如果是非主活动，需要判断当前活动的之前的所有活动都是否已经结束了，如果都结束物料，需要把主活动也要结束掉
        if (!produceTaskActive.getParentActive()) {
            if (parentProduceTaskActive != null) {
                List<WOMProduceTaskActive> childrenProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and parentActiveId=? and id!=? and activeState.id!=?", parentProduceTaskActive.getId(),produceTaskActive.getId(),"processState/state03");
                if(childrenProduceTaskActives.isEmpty()){
                    parentProduceTaskActive.setActiveState(sc_executory);
                    parentProduceTaskActive.setEndTime(endTime);
                    produceTaskActiveDao.save(parentProduceTaskActive);
                }
            }
        }     

		//更改用料活动数量    投配料更改投入量//产出更改产出量
		if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_BATCHES)) {
			if (map.get("putInNum") != null && !map.get("putInNum").toString().equals("") && isNumeric(map.get("putInNum").toString())) {
				putInNum = new BigDecimal(map.get("putInNum").toString());
				produceTaskActive.setActualNum(putInNum);
			}else{
            	return setErrorMessage(resultMap,"投入数量不能为空！");
			}
		} else if (StringUtils.equals(produceTaskActive.getActiveType().getId(), ACTIVE_TYPE_OUTPUT)) {
			if (map.get("outComeNum") != null && !"".equals(map.get("outComeNum").toString())&& isNumeric(map.get("outComeNum").toString())) {
				outComeNum = new BigDecimal(map.get("outComeNum").toString());
				produceTaskActive.setOutputNum(outComeNum);
			}else{
            	return setErrorMessage(resultMap,"产出数量不能为空！");
			}		
		}          
        produceTaskActive.setActiveState(sc_executory);
        produceTaskActive.setEndTime(endTime);
        produceTaskActive.setModifyStaff(staff);
        produceTaskActiveDao.save(produceTaskActive);
        produceTaskActiveDao.flush();
        produceTaskActiveDao.clear();   
        Number result = (Number) adjustOrTempRecordsDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_ADJUST_OR_TEMP_RECORDS WHERE VALID = 1 AND PROCESSID=? AND ACTIVE_RECORD_STATE=?", produceTaskProcess.getId(),"processState/state02").uniqueResult();
        //活动结束之后，需要再判断当前大工序的所有活动是否已经全部结束
        List<WOMProduceTaskActive> taskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and activeState.id!=?", produceTaskProcess,produceTask,"processState/state03");
        if (taskActives.isEmpty()) {
            //查看的当前工序的机动活动、调整活动是否都已经结束
            if (result.intValue() == 0) {
                List<WOMProdTaskProcExelog> exelogs = prodTaskProcExelogDao.findByHql(" from WOMProdTaskProcExelog where valid = 1 and taskProcessID=?", produceTaskProcess);
                for (WOMProdTaskProcExelog exelog : exelogs) {
                    exelog.setEndTime(endTime);
                    exelog.setModifyStaff(staff);
                    prodTaskProcExelogDao.save(exelog);
                }
                produceTaskProcessDao.flush();
                produceTaskProcessDao.clear();
                //更改指令单工序 状态
                produceTaskProcess.setEndTime(endTime);
                produceTaskProcess.setModifyStaff(staff);
                produceTaskProcess.setProcessState(sc_executory);
                produceTaskProcessDao.save(produceTaskProcess);
              	produceTaskProcessDao.flush();
                produceTaskProcessDao.clear();
            }
        }
        //活动执行记录
        actiExelog.setEndTime(endTime);
      	actiExelog.setIsFinish(true);
        prodTaskActiExelogDao.merge(actiExelog);
		if("0".equals(map.get("isAuto").toString())){
        	resultMap.put("isAuto","0");//回填返回信息
		}
		if("1".equals(map.get("isAuto").toString())){
        	resultMap.put("isAuto","1");//回填返回信息
		}    
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}
	
	/**
	 * 机动活动结束
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> adjustEndActive(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		StringBuilder errorMsg = new StringBuilder();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		WOMProduceTaskActive produceTaskActive=null;
        //父节点-活动
        WOMProduceTaskActive parentProduceTaskActive = null;
		WOMProduceTaskProcess produceTaskProcess=null; 
        WOMProdTaskActiExelog actiExelog=null;
        WOMAdjustOrTempRecords record=null;
        Date endTime=null;
		String isAuto="";
		BigDecimal putInNum=null;
//		BigDecimal outComeNum;
		
		if((map.get("actiExelogId")==null || map.get("actiExelogId").toString().equals("")) && (map.get("adjustRecordId")==null || map.get("adjustRecordId").toString().equals(""))){
            return setErrorMessage(resultMap,"活动id，活动处理记录id不能同时为空！");
		}
		//活动执行记录id
		if(map.get("actiExelogId")!=null && !map.get("actiExelogId").toString().equals("")){
			//活动执行记录id
			Long actiExelogId=Long.valueOf(map.get("actiExelogId").toString());
            actiExelog = prodTaskActiExelogDao.get(actiExelogId);
            if(actiExelog!=null){
                produceTaskProcess=actiExelog.getTaskProcessID();
                produceTask=actiExelog.getTaskID();
                produceTaskActive=actiExelog.getTaskActiveID();
                Long adjustRecordID=actiExelog.getAdjustRecordID();
                record = adjustOrTempRecordsDao.get(adjustRecordID);
    	        if(record!=null){
    		        produceTaskProcess=produceTaskProcessDao.get(record.getProcessID());
    		        produceTask = produceTaskProcess.getHeadId(); 
    		        List<WOMProdTaskActiExelog> actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and adjustRecordID=?",record.getId());
    		        if(actiExelogs.size() > 0){
    		        	actiExelog = actiExelogs.get(0);
    		        	produceTaskActive=actiExelog.getTaskActiveID();
    		        }
    		        //投料获取投料量
    		        if(StringUtils.equals(record.getActiveType().getId(), "activeType/activeType3")){
    		    		if (map.get("putInNum") != null && !map.get("putInNum").toString().equals("") && isNumeric(map.get("putInNum").toString())) {
    						putInNum = new BigDecimal(map.get("putInNum").toString());
    					}else{
    		            	return setErrorMessage(resultMap,"投入数量不能为空！");
    					}
    		        } 
    	        }else{
    	        	 return setErrorMessage(resultMap,"找不到对应的活动处理记录！");
    	        }
            }else{
                return setErrorMessage(resultMap,"找不到对应的活动执行记录！");
            }
		}else if(map.get("adjustRecordId")!=null && !map.get("adjustRecordId").toString().equals("")){
			//活动id//工序//指令单 
			Long adjustRecordId=Long.valueOf(map.get("adjustRecordId").toString());
	        record = adjustOrTempRecordsDao.get(adjustRecordId);
	        if(record!=null){
		        produceTaskProcess=produceTaskProcessDao.get(record.getProcessID());
		        produceTask = produceTaskProcess.getHeadId(); 
		        List<WOMProdTaskActiExelog> actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and adjustRecordID=?",record.getId());
		        if(actiExelogs.size() > 0){
		        	actiExelog = actiExelogs.get(0);
		        	produceTaskActive=actiExelog.getTaskActiveID();
		        }
		        //投料获取投料量
		        if(StringUtils.equals(record.getActiveType().getId(), "activeType/activeType3")){
		    		if (map.get("putInNum") != null && !map.get("putInNum").toString().equals("") && isNumeric(map.get("putInNum").toString())) {
						putInNum = new BigDecimal(map.get("putInNum").toString());
					}else{
		            	return setErrorMessage(resultMap,"投入数量不能为空！");
					}
		        } 
	        }else{
	        	 return setErrorMessage(resultMap,"找不到对应的活动处理记录！");
	        }
		}
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}		
		//结束时间
		if(map.get("endTime")!=null && !map.get("endTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
            	endTime = sdf.parse(map.get("endTime").toString());
            } catch (Exception e) { 
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			endTime=new Date();
		}
		
		if(map.get("isAuto")==null || map.get("isAuto").toString().equals("")){
        	return setErrorMessage(resultMap,"是否手动结束活动不能为空！");
		}else if("0".equals(map.get("isAuto").toString()) || "1".equals(map.get("isAuto").toString())){
			isAuto=map.get("isAuto").toString();
		}else{
			return setErrorMessage(resultMap,"是否手动活动：1：手动0：自动");	
		}
		
        if (StringUtils.equals(record.getActiveRecordState().getId(),"processState/state03")) {
        	return setErrorMessage(resultMap,"活动已经结束，请选择执行中的活动！");
        }else if(StringUtils.equals(record.getActiveType().getId(), "activeType/activeType5")){ 
        	//质检
            if (StringUtils.equals(isAuto,"1")) {
            	return setErrorMessage(resultMap,"暂不支持手动结束质检活动！");
            }
        }
        actiExelog.setActualNum(putInNum);
        actiExelog.setEndTime(endTime);
        actiExelog.setIsFinish(true);
        prodTaskActiExelogDao.save(actiExelog);
        prodTaskActiExelogDao.flush();
        prodTaskActiExelogDao.clear();
        record.setRejectsDeal(actiExelog.getRejectsDealID());
        record.setInspectRecordId(actiExelog.getCheckResultID());
        record.setInspectResult(actiExelog.getCheckResult());
        record.setActiveRecordState((SystemCode) systemCodeService.getSystemCode("processState/state03"));
        record.setEndTime(endTime);
        record.setActualUse(putInNum);
        adjustOrTempRecordsDao.save(record);
      	adjustOrTempRecordsDao.flush();
        adjustOrTempRecordsDao.clear();

        SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode("processState/state03");		
        //活动结束之后，需要再判断当前大工序的所有活动是否已经全部结束
        List<WOMProduceTaskActive> taskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and activeState.id!=?", produceTaskProcess,produceTaskProcess.getHeadId(),"processState/state03");
        if (taskActives.isEmpty()) {
            //查看的当前工序的机动活动、调整活动是否都已经结束
            Number result1 = (Number) adjustOrTempRecordsDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_ADJUST_OR_TEMP_RECORDS WHERE VALID = 1 AND PROCESSID=? AND ACTIVE_RECORD_STATE=?", produceTaskProcess.getId(),"processState/state02").uniqueResult();
            if (result1.intValue() == 0) {
                List<WOMProdTaskProcExelog> exelogs = prodTaskProcExelogDao.findByHql(" from WOMProdTaskProcExelog where valid = 1 and taskProcessID=?", produceTaskProcess);
                for (WOMProdTaskProcExelog exelog : exelogs) {
                    exelog.setEndTime(endTime);
                    prodTaskProcExelogDao.merge(exelog);
                }
                produceTaskProcessDao.flush();
                produceTaskProcessDao.clear();
                //更改指令单工序 状态
                produceTaskProcess.setEndTime(endTime);
                produceTaskProcess.setProcessState(sc_executory);
                produceTaskProcess.setModifyStaff(staff);
                produceTaskProcessDao.save(produceTaskProcess);
            }
        }		
		
        if (produceTask.getTaskState() != null && produceTask.getTaskState().equals(new SystemCode("womTaskState/02"))) {
            List<WOMProduceTaskProcess> processe_done = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and processState.id!=?", produceTask,"processState/state03");
            if (processe_done.isEmpty()){
                //更改指令单 状态
                produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/03"));
                produceTask.setActEndTime(endTime);
                produceTask.setModifyStaff(staff);
                produceTaskDao.merge(produceTask);	
            }
        }	
        //活动执行记录
        actiExelog.setEndTime(endTime);
      	actiExelog.setIsFinish(true);
        prodTaskActiExelogDao.merge(actiExelog);
		if("0".equals(map.get("isAuto").toString())){
        	resultMap.put("isAuto","0");//回填返回信息
		}
		if("1".equals(map.get("isAuto").toString())){
        	resultMap.put("isAuto","1");//回填返回信息
		}    
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}

	
	/**
	 * 工序开始
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> startProcess(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		//StringBuffer resultMsg=new StringBuffer();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		WOMProduceTaskProcess process=null;
		Date startTime=null;
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}		
		//开始时间
		if(map.get("startTime")!=null && !map.get("startTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                startTime = sdf.parse(map.get("startTime").toString());
            } catch (Exception e) { 
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			startTime=new Date();
		}
		//工序id
		if(map.get("processId")!=null && !map.get("processId").toString().equals("")){
			Long processId=Long.valueOf(map.get("processId").toString());
			process = produceTaskProcessService.getProduceTaskProcess(processId);
			if(process==null){
            	return setErrorMessage(resultMap,"未找到对应的工序！");	
			}else{
				produceTask=process.getHeadId();
			}
            if(StringUtils.equals(PROCESS_STATE_DONE,process.getProcessState().getId())){
            	return setErrorMessage(resultMap,"当前工序已经结束！");	            
            }
		}		
        //判断当前工序是否在可执行的顺序内
        List<WOMProduceTaskProcess> produceTaskProcesses = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and exeOrder<? and processState.id!=?", produceTask,process.getExeOrder(),PROCESS_STATE_DONE);
        if (produceTaskProcesses.size() > 0) {
        	return setErrorMessage(resultMap,"请按照工序顺序开始活动！");	            
        }
        
        
      	//生成工序执行记录  如果没有执行记录 需要新插入
        if (((BigDecimal)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PROD_TASK_PROC_EXELOGS WHERE TASKID=? AND VALID = 1 AND TASK_PROCESSID=?", produceTask.getId(),process.getId()).uniqueResult()).intValue() == 0) {    //如果当前指令单的执行记录找不到条目，新插入
            WOMProdTaskProcExelog prodTaskProcExelog = new WOMProdTaskProcExelog();
            prodTaskProcExelog.setTaskProcessID(process);
            prodTaskProcExelog.setTaskID(produceTask);
            prodTaskProcExelog.setStartTime(startTime);
            prodTaskProcExelog.setCreateStaff(staff);
            //prodTaskProcExelogService.saveProdTaskProcExelog(prodTaskProcExelog, null);
            prodTaskProcExelogDao.save(prodTaskProcExelog);
          	prodTaskProcExelogDao.flush();
            prodTaskProcExelogDao.clear();
        }
        
        //修改指令单状态为执行中
        if (((BigDecimal)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PRODUCE_TASK_PROCESSES WHERE HEAD_ID=? AND VALID = 1 AND EXE_ORDER<?", produceTask.getId(),process.getExeOrder()).uniqueResult()).intValue() == 0) {
            /*
                womTaskState/01     待执行
                womTaskState/02     执行中
                womTaskState/03     已完成
                womTaskState/04     终止
             */
            if (produceTask.getTaskState() != null && produceTask.getTaskState().equals(new SystemCode("womTaskState/01"))) {

                //更改指令单 状态
                produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/02"));
              	produceTask.setActStartTime(startTime);
                produceTaskDao.merge(produceTask);

            }
        }
        //更改指令单工序 状态为执行中
        SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode("processState/state02");
        if (process.getStartTime() == null) {
            //更改指令单工序 状态
        	process.setStartTime(startTime);
        	process.setProcessState(sc_executory);
            produceTaskProcessDao.save(process);
        }
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}

	/**
	 * 工序结束
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> endProcess(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		//StringBuffer resultMsg=new StringBuffer();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		WOMProduceTaskProcess produceTaskProcess=null;
		WOMProdTaskProcExelog prodTaskProcExelog=null;
		Date endTime=null;
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}		
		//开始时间
		if(map.get("endTime")!=null && !map.get("endTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
            	endTime = sdf.parse(map.get("endTime").toString());
            } catch (Exception e) { 
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			endTime=new Date();
		}
		
		if((map.get("processExelogId")==null || map.get("processExelogId").toString().equals("")) && (map.get("processId")==null || map.get("processId").toString().equals(""))){
            return setErrorMessage(resultMap,"工序id，工序执行记录id不能同时为空！");
		}
		//工序执行记录id
		if(map.get("processExelogId")!=null && !map.get("processExelogId").toString().equals("")){
			//活动执行记录id
			Long processExelogId=Long.valueOf(map.get("processExelogId").toString());
			prodTaskProcExelog = prodTaskProcExelogDao.get(processExelogId);
            if(processExelogId!=null){
            	produceTaskProcess=prodTaskProcExelog.getTaskProcessID();
                produceTask=prodTaskProcExelog.getTaskID();
            }else{
                return setErrorMessage(resultMap,"找不到对应的工序执行记录！");
            }
		}else if(map.get("processId")!=null && !map.get("processId").toString().equals("")){
			Long processId=Long.valueOf(map.get("processId").toString());
			produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(processId);
			if(produceTaskProcess==null){
            	return setErrorMessage(resultMap,"未找到对应的工序！");	
			}else{
				produceTask=produceTaskProcess.getHeadId();
			}
		}		
        
        if(StringUtils.equals(PROCESS_STATE_DONE,produceTaskProcess.getProcessState().getId())){
        	return setErrorMessage(resultMap,"当前工序已经结束！");	            
        }
        //查看工序所在的活动是否都已完成若完成将工序状态改为已完成，修改工序之状态
        SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode("processState/state03");

        Number result = (Number) adjustOrTempRecordsDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_ADJUST_OR_TEMP_RECORDS WHERE VALID = 1 AND PROCESSID=? AND ACTIVE_RECORD_STATE=?", produceTaskProcess.getId(),"processState/state02").uniqueResult();
        //活动结束之后，需要再判断当前大工序的所有活动是否已经全部结束
        List<WOMProduceTaskActive> taskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and activeState.id!=?", produceTaskProcess,produceTask,"processState/state03");
        if (taskActives.isEmpty()) {
            //查看的当前工序的机动活动、调整活动是否都已经结束
            if (result.intValue() == 0) {
                List<WOMProdTaskProcExelog> exelogs = prodTaskProcExelogDao.findByHql(" from WOMProdTaskProcExelog where valid = 1 and taskProcessID=?", produceTaskProcess);
                for (WOMProdTaskProcExelog exelog : exelogs) {
                    exelog.setEndTime(endTime);
                    exelog.setState(sc_executory);
                    prodTaskProcExelogDao.save(exelog);
                }
                produceTaskProcessDao.flush();
                produceTaskProcessDao.clear();
                //更改指令单工序 状态
                produceTaskProcess.setEndTime(endTime);
                produceTaskProcess.setProcessState(sc_executory);
                produceTaskProcessDao.save(produceTaskProcess);
              	produceTaskProcessDao.flush();
                produceTaskProcessDao.clear();
            }
        }else{
        	return setErrorMessage(resultMap,"存在活动未完成");
        }
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;	
	}

	/**
	 * 指令单开始
	 * @param map
	 * taskId: 指令单id,
 	 * staffCode: 操作人,
 	 * startTime:开始时间,
	 * @return
	 */
	@Override
	public Map<String, Object> startTask(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		Date startTime=null;
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
            	return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}
		//指令单id
		if(map.get("taskId")!=null && !map.get("taskId").toString().equals("")){
			Long taskId=Long.valueOf(map.get("taskId").toString());
			produceTask = produceTaskDao.load(taskId);
			if(produceTask==null){
            	return setErrorMessage(resultMap,"未找到对应的指令单！");
			}
		}
		//开始时间
		if(map.get("startTime")!=null && !map.get("startTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                startTime = sdf.parse(map.get("startTime").toString());
            } catch (Exception e) {   
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			startTime=new Date();
		}
		if(produceTask.getTaskState() != null && produceTask.getTaskState().equals(new SystemCode("womTaskState/01"))){
			//执行中
			produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/02"));	
			produceTask.setActStartTime(startTime);
			produceTask.setModifyStaff(staff);
		}else{
        	return setErrorMessage(resultMap,"指令单状态不为待执行！");
		}
        produceTaskDao.merge(produceTask);
		resultMap.put("resultCode", 0);//回填返回信息
        return resultMap;
	}

	/**
	 * 指令单结束
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> endTask(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		Date endTime=null;
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
            	return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}
		//指令单id
		if(map.get("taskId")!=null && !map.get("taskId").toString().equals("")){
			Long taskId=Long.valueOf(map.get("taskId").toString());
			produceTask = produceTaskDao.load(taskId);
			if(produceTask==null){
            	return setErrorMessage(resultMap,"未找到对应的指令单！");	
			}
		}
		//结束时间
		if(map.get("endTime")!=null && !map.get("endTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
            	endTime = sdf.parse(map.get("endTime").toString());
            } catch (Exception e) {    
            	e.printStackTrace();
            }
		}else{
			endTime=new Date();
		}
		//回填 完成数量 
		BigDecimal finishNum;
		if(map.get("finishNum")!=null && !map.get("finishNum").toString().equals("") && isNumeric(map.get("finishNum").toString())){
			finishNum=new BigDecimal(map.get("finishNum").toString());
			produceTask.setFinishNum(finishNum);
		}else{
        	return setErrorMessage(resultMap,"完成数量有误！");	
		}
		//修改指令单状态和结束时间
		if(produceTask.getTaskState() != null && produceTask.getTaskState().equals(new SystemCode("womTaskState/02"))){
            Number result = (Number) adjustOrTempRecordsDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_ADJUST_OR_TEMP_RECORDS WHERE VALID = 1 AND HEADERID=? AND ACTIVE_RECORD_STATE=?", produceTask.getId(),"processState/state02").uniqueResult();
			List<WOMProduceTaskProcess> processe_done = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and processState.id!=?", produceTask,"processState/state03");
            if (processe_done.isEmpty() && result.intValue() == 0) {
    			//已完成
    			produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/03"));	
    			produceTask.setActEndTime(endTime);
    			produceTask.setModifyStaff(staff);
            }else{
            	return setErrorMessage(resultMap,"还有未结束的工序！");		
            }
		}else{
        	return setErrorMessage(resultMap,"指令单状态不为执行中！");		
		}	
        produceTaskDao.merge(produceTask);
        if(map.get("isReport")!=null && map.get("isReport").toString()!=""){
    		if("0".equals(map.get("isReport").toString())){
            	resultMap.put("isReport","0");//回填返回信息
    		}
    		if("1".equals(map.get("isReport").toString())){
            	resultMap.put("isReport","1");//回填返回信息
    		}
        }
        //返回信息
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}

	/**
	 * 下推待投料记录
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> addwaitPutInRecord(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		StringBuilder errorMsg = new StringBuilder();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		WOMProduceTaskActive produceTaskActive=null;
        WOMProdTaskActiExelog actiExelog=null;
		WOMProduceTaskProcess produceTaskProcess=null;
        Date actTime=null;
        String phaseId="";
		//活动执行记录id
		if(map.get("actiExelogId")!=null && !map.get("actiExelogId").toString().equals("")){
			//活动执行记录id
			Long actiExelogId=Long.valueOf(map.get("actiExelogId").toString());
             actiExelog = prodTaskActiExelogDao.get(actiExelogId);
            if(actiExelog!=null){
            	produceTaskActive=actiExelog.getTaskActiveID();
            	produceTask=actiExelog.getTaskID();    
            	produceTaskProcess=actiExelog.getTaskProcessID();
            }else{
                return setErrorMessage(resultMap,"找不到对应的活动执行记录！");
            }
		}else{
            return setErrorMessage(resultMap,"活动执行记录id不能为空！");
		}    
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}
		//actTime
		//开始时间
		if(map.get("actTime")!=null && !map.get("actTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
            	actTime = sdf.parse(map.get("actTime").toString());
            } catch (Exception e) {   
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			actTime=new Date();
		}
		if(map.get("phaseId")!=null && !map.get("phaseId").toString().equals("")){
			phaseId=map.get("phaseId").toString();
		}else{
        	return setErrorMessage(resultMap,"phaseId不能为空！");
		}		
		//投配料查找配料记录//投料查找指令单活动
		if(produceTaskActive.getActiveType().getId().equals("activeType/activeType4")){
			//通过活动id和指令单id查找配料记录
			List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),
					Restrictions.eq("taskID", produceTask),Restrictions.eq("taskActiveId",produceTaskActive),Restrictions.eq("phaseID",phaseId));
			if(batchingMaterialPartList!=null && batchingMaterialPartList.size()>0 ){

				for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList){//有几条配料指令明细就查几条待投料记录
					WOMWaitPutinRecords waitPutinRecords = new WOMWaitPutinRecords();
					waitPutinRecords.setActOrder(batchingMaterialPart.getActOrder());//投料顺序
					
					waitPutinRecords.setActTime(actTime);//操作时间
					waitPutinRecords.setActiveType(produceTaskActive.getActiveType());//活动类型
					waitPutinRecords.setBatchMaterialID(batchingMaterialPart);//配料明细
					waitPutinRecords.setBatchNum(produceTask.getProductBatchNum());//生产批号
					waitPutinRecords.setIsFinish(false);//是否结束
					//waitPutinRecords.setLableCode(null);//标号标签
					waitPutinRecords.setLableCode(batchingMaterialPart.getLableCode());
					waitPutinRecords.setMaterialNum(batchingMaterialPart.getDoneNum());//物料数量
					waitPutinRecords.setProductID(batchingMaterialPart.getProductId());//物料
					waitPutinRecords.setPhaseID(phaseId);//phaseId
					waitPutinRecords.setProductNum(batchingMaterialPart.getBatchNum());//物料批号
					//waitPutinRecords.setRemark("");//备注
					//waitPutinRecords.setScanMaterial(null);//扫码投料
					waitPutinRecords.setStaffID(staff);//操作人
					waitPutinRecords.setTaskActiveID(produceTaskActive);
					waitPutinRecords.setTaskID(produceTask);
					waitPutinRecords.setTaskProcessID(produceTaskProcess);
					waitPutinRecords.setActiveSource(produceTaskActive.getActiveSource());//来源
					waitPutinRecords.setCid(getCurrentCompany() != null ?getCurrentCompany().getId():produceTask.getCid());
					waitPutinRecords.setTableInfoId(produceTask!=null?produceTask.getTableInfoId():null);
					waitPutinRecordsDao.save(waitPutinRecords);
				}
			}else{
               return setErrorMessage(resultMap,"找不到对应的配料记录！");
			}
		}else if(produceTaskActive.getActiveType().getId().equals("activeType/activeType3")){
			List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("headID", produceTask),
			Restrictions.eq("batchPhaseID",phaseId));//通过phsae查询工单工序活动	
			if(produceTaskActiveList != null && produceTaskActiveList.size() > 0){
				for(WOMProduceTaskActive active : produceTaskActiveList){
					if(active.getActiveType().getId().equals("activeType/activeType3")){
						WOMWaitPutinRecords waitPutinRecords = new WOMWaitPutinRecords();
						waitPutinRecords.setActOrder(active.getActOrder());//投料顺序
						waitPutinRecords.setActTime(actTime);//操作时间
						waitPutinRecords.setActiveType(produceTaskActive.getActiveType());//活动类型
						waitPutinRecords.setBatchNum(produceTask.getProductBatchNum());//生产批号
						waitPutinRecords.setIsFinish(false);//是否结束
						//waitPutinRecords.setLableCode(null);//标号标签
						waitPutinRecords.setLableCode(active.getId().toString());//标号标签
						waitPutinRecords.setMaterialNum(active.getPlanNum());//物料数量
						waitPutinRecords.setProductID(active.getProductId());//物料
						waitPutinRecords.setPhaseID(phaseId);//phaseId
						waitPutinRecords.setStaffID(staff);//操作人
						waitPutinRecords.setTaskActiveID(active);
						waitPutinRecords.setTaskID(produceTask);
						waitPutinRecords.setTaskProcessID(produceTaskProcess);
						waitPutinRecords.setActiveSource(produceTaskActive.getActiveSource());//来源
						waitPutinRecords.setCid(getCurrentCompany() != null ?getCurrentCompany().getId():produceTask.getCid());
						waitPutinRecords.setTableInfoId(produceTask!=null?produceTask.getTableInfoId():null);
						waitPutinRecordsDao.save(waitPutinRecords);
					}
				}
			}else{
	               return setErrorMessage(resultMap,"找不到对应的活动记录！");
			}
		}
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}

	/**
	 * 下推请检单
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> addInspect(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		StringBuilder errorMsg = new StringBuilder();
		Staff staff=null;
		WOMProduceTask produceTask=null;
		WOMProduceTaskActive produceTaskActive=null;
		WOMProduceTaskProcess produceTaskProcess=null; 
        WOMProdTaskActiExelog actiExelog=null;
        BigDecimal quantity;
		//活动执行记录id
		if(map.get("actiExelogId")!=null && !map.get("actiExelogId").toString().equals("")){
			//活动执行记录id
			Long actiExelogId=Long.valueOf(map.get("actiExelogId").toString());
             actiExelog = prodTaskActiExelogDao.get(actiExelogId);
            if(actiExelog!=null){
                produceTaskProcess=actiExelog.getTaskProcessID();
                produceTask=actiExelog.getTaskID();
              	produceTaskActive=actiExelog.getTaskActiveID();
            }else{
                return setErrorMessage(resultMap,"找不到对应的活动执行记录！");
            }
		}else{
            return setErrorMessage(resultMap,"活动执行记录id不能为空！");
		}
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}		
		//样品数量
		if(map.get("quantity")!=null && !map.get("quantity").toString().equals("") && isNumeric(map.get("quantity").toString())){
			quantity=new BigDecimal(map.get("quantity").toString());
		}
      	//如果当前活动是检验，需要发起请检
        if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_INSPECT)) {
            interfaceSelfService.addApplyCheckByActiveExelog(actiExelog);
            WOMQualityInspect inspect = new WOMQualityInspect();
            inspect.setActiveID(produceTaskActive);
            inspect.setOperateStaffID(staff);
            qualityInspectDao.save(inspect);
        } 
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}

	/**
	 * 生成报工单
	 * (过程报工，完成报工)
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> addTaskReport(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		Staff staff=null;
		WOMProduceTask produceTask=null;
        WOMProdTaskActiExelog actiExelog=null;
		MESBasicWare ware=null;
		MESBasicStoreSet store=null;
		MESBasicProduct product=null;
        //是否启用货位
        boolean usePlaceSet = false;
        String reportType="";
        String batchNum="";
        BigDecimal reportNum=null;
        Date reportTime=null;
        String remark="";
		//活动执行记录id
		if(map.get("actiExelogId")!=null && !map.get("actiExelogId").toString().equals("")){
			Long actiExelogId=Long.valueOf(map.get("actiExelogId").toString());
            actiExelog = prodTaskActiExelogDao.get(actiExelogId);
           if(actiExelog!=null){
               produceTask=actiExelog.getTaskID();
           }else{
               return setErrorMessage(resultMap,"找不到对应的活动执行记录！");
           }
		}else{
        	return setErrorMessage(resultMap,"活动执行记录id不能为空！");	
		}
		if(map.get("reportType")==null || map.get("reportType").toString().equals("")){
            return setErrorMessage(resultMap,"报工类型不能为空！");
		}else{
			//"womReportType/02":完成报工  03：过程报工
			reportType=map.get("reportType").toString();
			if(!"womReportType/02".equals(reportType) && ! "womReportType/03".equals(reportType)){
	            return setErrorMessage(resultMap,"报工类型为完成报工或者过程报工！");
			}
		}
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}
        //模拟登陆
		String companyCode =staff.getMainPosition().getCompany().getCode();
		setSession(staff.getUser().getName(), companyCode);
		
		if(map.get("wareId")!=null && !map.get("wareId").toString().equals("")  ){
			Long wareId=Long.valueOf(map.get("wareId").toString());
			ware=wareService.getWare(wareId);
			if(ware!=null){
				//是否启用货位
                usePlaceSet = ware.getIsCargo();
			}else{
	            return setErrorMessage(resultMap,"未能找到对应仓库！");
			}
		}else if("womReportType/03".equals(reportType)){
            return setErrorMessage(resultMap,"仓库id不能为空！");
		}
		if((map.get("storeId")==null || map.get("storeId").toString().equals("")) && usePlaceSet && "womReportType/03".equals(reportType)){
            return setErrorMessage(resultMap,"仓库 ["+ware.getWareName()+"]已经启用了货位，货位不能为空");
		}
		if(map.get("storeId")!=null || !map.get("storeId").toString().equals("")){
			Long storeId=Long.valueOf(map.get("storeId").toString());
			store=storeSetService.getStoreSet(storeId);
			if(store==null){
	            return setErrorMessage(resultMap,"未能找到对应货位！");
			}
		}
		if (map.get("reportNum") != null && !map.get("reportNum").toString().equals("") && isNumeric(map.get("reportNum").toString())) {
			reportNum = new BigDecimal(map.get("reportNum").toString());
		}else if("womReportType/03".equals(reportType)){
        	return setErrorMessage(resultMap," 报工数量不能为空！");
		}
		if(map.get("productId")!=null || !map.get("productId").toString().equals("")){
			Long productId=Long.valueOf(map.get("productId").toString());
			product=basicProductService.getProduct(productId);
			if(product!=null){
				if(product.getBatch()!=null && StringUtils.equals(product.getBatch().getId(),"batch/batch01") ){
					if(map.get("batchNum")!=null || !map.get("batchNum").toString().equals("")){
						batchNum=map.get("batchNum").toString();
					}else{
			            return setErrorMessage(resultMap,"物品已经启用批次，批号不能为空！");	
					}
				}
			}else{
	            return setErrorMessage(resultMap,"未能找到对应物品！");
			}
		}else{
            return setErrorMessage(resultMap,"物品id不能为空！");
		}
		if(map.get("reportTime")!=null || !map.get("reportTime").toString().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
            	reportTime = sdf.parse(map.get("reportTime").toString());
            } catch (Exception e) { 
            	return setErrorMessage(resultMap,"日期格式有误！");
            }
		}else{
			reportTime=new Date();
		}
		if(map.get("remark")!=null && !map.get("remark").toString().equals("")){
			remark=map.get("remark").toString();
		}
		taskReporting = new WOMTaskReporting();
        taskReporting.setTaskID(produceTask);
        taskReporting.setProductID(product);		
        taskReporting.setReportDate(reportTime);
        
        Long positionId = staff.getMainPosition().getId();
        taskReporting.setCreateStaff(staff);
        taskReporting.setCreatePositionId(positionId);
        taskReporting.setCreateDepartmentId(staff.getMainPosition().getDepartment().getId());
        taskReporting.setOwnerDepartmentId(staff.getMainPosition().getDepartment().getId());
        taskReporting.setOwnerPositionId(positionId);
        taskReporting.setOwnerStaffId(staff.getId());
        //报工人
        taskReporting.setReportStaff(staff);
        
        //仓库
        taskReporting.setWareID(ware);
        //报工类型：过程报工/完成报工
        taskReporting.setReportType((SystemCode) systemCodeService.getSystemCodeByID(reportType));

        //报工单表体
        taskReportingParts= new ArrayList<WOMTaskReportingPart>();
        WOMTaskReportingPart taskReportingPart = new WOMTaskReportingPart();
        taskReportingPart.setStoreID(store);
        taskReportingPart.setReportNum(reportNum);
        taskReportingPart.setBatchNum(batchNum);
        taskReportingPart.setRemark(remark);
        taskReportingParts.add(taskReportingPart);
        //表体方法
        DataGridService dataGridService = new DataGridService() {
            @Override
            public void execute() {
                if (taskReportingParts != null && !taskReportingParts.isEmpty()) {
                    for (WOMTaskReportingPart part: taskReportingParts) {
                      	part.setTableInfoId(taskReporting.getTableInfoId());
                        part.setHeadId(taskReporting);
                        taskReportingPartService.saveTaskReportingPart(part, null, "taskReportingView");
                    }
                }
            }
        };
        //完成报工02编辑状态，过程报工03生效状态
        if("womReportType/02".equals(reportType)){
        	//更改指令单状态
        	produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/03"));
        	produceTask.setActEndTime(reportTime);
        	taskReporting.setBatchNum(produceTask.getProductBatchNum());
        	//完成报工
            taskReporting.setStatus(88);	
            WorkFlowVar workFlowVar = new WorkFlowVar();
            Deployment taskReportingFlow = taskService.getCurrentDeployment("taskReportingFlow");
            Long deploymentId = taskReportingFlow.getId();
            String editActivityName = processService.findStartTransitions(deploymentId).getDestination().getName();
            Long staffId = ((User) getCurrentUser()).getStaff().getId();
            List<Long> workflowStaff = dataPermissionService.getPowerUserList(staffId, editActivityName, "taskReportingFlow", taskReportingFlow.getVersion() + "", positionId, null, false);
            workFlowVar.setOperateType("save");
            Set<Long> ids = new HashSet<>();
            ids.addAll(workflowStaff);
            workFlowVar.setAdditionalUsers(ids);
            List<Map<String, ?>> outcomeList = new ArrayList<Map<String, ?>>();
            for (Iterator scheduleStaff = ids.iterator(); scheduleStaff.hasNext(); ){
                Map<String, String> outcomeMap = new HashMap<String, String>();
                outcomeMap.put("dec", "保存");
                outcomeMap.put("type", "normal");
                outcomeMap.put("assignUser", scheduleStaff.next().toString());
                outcomeMap.put("outcome", processService.findStartTransitions(deploymentId).getName());
                outcomeList.add(outcomeMap);
            }
            workFlowVar.setOutcome(processService.findStartTransitions(deploymentId).getName());
            workFlowVar.setOutcomeMap(outcomeList);
            taskReportingService.save(taskReporting, deploymentId, null, workFlowVar, dataGridService,"WOM_7.5.0.0_taskReporting_taskReportingEdit");	
        }else if("womReportType/03".equals(reportType)){
        	//过程报工
            taskReporting.setStatus(99);		
            WorkFlowVar workFlowVar1 = new WorkFlowVar();
            workFlowVar1.setOperateType("submit");
            // 生效
            taskReportingService.saveSuperEditTaskReporting(taskReporting, workFlowVar1, dataGridService, "WOM_7.5.0.WOM_7.5.0.0_taskReporting_taskReportingView", false);
            actiExelog.setBatchNum(batchNum);
        }
        resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}
	

	/**
	 * 生成投料单
	 * @param map
	 * @param mapList
	 * @return
	 */
	@Override
	public Map<String, Object> addPutInRecord(Map<String, Object> map,List<Map<String, Object>> mapList) {
		Map<String, Object> resultMap = new HashMap<>();
		Staff staff=null;
		WOMProduceTask produceTask=null;
        WOMProdTaskActiExelog actiExelog=null;
        WOMProduceTaskActive produceTaskActive=null;
		MESBasicWare ware=null;
		MESBasicStoreSet store=null;
		MESBasicProduct product=null;
        BigDecimal actualNum = new BigDecimal("0");
		//是否启用货位
        boolean usePlaceSet = false;
        //是否启用货位
		//活动执行记录id
		if(map.get("actiExelogId")!=null && !map.get("actiExelogId").toString().equals("")){
			Long actiExelogId=Long.valueOf(map.get("actiExelogId").toString());
            actiExelog = prodTaskActiExelogDao.get(actiExelogId);
            if(actiExelog!=null){
               produceTask=actiExelog.getTaskID();
               produceTaskActive=actiExelog.getTaskActiveID();
           }else{
               return setErrorMessage(resultMap,"找不到对应的活动执行记录！");
           }
		}else{
        	return setErrorMessage(resultMap,"活动执行记录id不能为空！");	
		}
		//操作人
		if(map.get("staffId")!=null && !map.get("staffId").toString().equals("")){
			Long staffId=Long.valueOf(map.get("staffId").toString());
			staff=staffServcie.load(staffId);
			if(staff==null){
               return setErrorMessage(resultMap,"未找到对应人员！");
			}
		}
        //模拟登陆
		String companyCode =staff.getMainPosition().getCompany().getCode();
		setSession(staff.getUser().getName(), companyCode);
        putInMaterial = new WOMPutInMaterial();  
		putInMaterial.setTaskID(produceTask);
        putInMaterial.setPutinStaff(staff);
        putInMaterial.setStatus(99);
        putInMaterialParts = new ArrayList<>();
        for (Map<String, Object> mapDetail : mapList){ 
        	String productBatchNum="";
        	BigDecimal putInNum=null;
        	Date startTime=null;
        	Date endTime=null;
        	String remark="";
            WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
    		if(mapDetail.get("productId")!=null || !mapDetail.get("productId").toString().equals("")){
    			Long productId=Long.valueOf(mapDetail.get("productId").toString());
    			product=basicProductService.getProduct(productId);
    			if(product!=null){
    				if(product.getBatch()!=null && StringUtils.equals(product.getBatch().getId(),"batch/batch01") ){
    					if(mapDetail.get("batchNum")!=null || !mapDetail.get("batchNum").toString().equals("")){
    						productBatchNum=mapDetail.get("batchNum").toString();
    					}else{
    			            return setErrorMessage(resultMap,"物品已经启用批次，批号不能为空！");	
    					}
    				}
    			}else{
    	            return setErrorMessage(resultMap,"未能找到对应物品！");
    			}
    		}else{
                return setErrorMessage(resultMap,"物品id不能为空！");
    		}
        	//
    		if(mapDetail.get("wareId")!=null && !mapDetail.get("wareId").toString().equals("")  ){
    			Long wareId=Long.valueOf(mapDetail.get("wareId").toString());
    			ware=wareService.getWare(wareId);
    			if(ware!=null){
    				//是否启用货位
                    usePlaceSet = ware.getIsCargo();
    			}else{
    	            return setErrorMessage(resultMap,"未能找到对应仓库！");
    			}
    		}else {
                return setErrorMessage(resultMap,"仓库id不能为空！");
    		}
    		if((mapDetail.get("storeId")==null || mapDetail.get("storeId").toString().equals("")) && usePlaceSet){
                return setErrorMessage(resultMap,"仓库 ["+ware.getWareName()+"]已经启用了货位，货位不能为空");
    		}
    		if(mapDetail.get("storeId")!=null || !mapDetail.get("storeId").toString().equals("")){
    			Long storeId=Long.valueOf(mapDetail.get("storeId").toString());
    			store=storeSetService.getStoreSet(storeId);
    			if(store==null){
    	            return setErrorMessage(resultMap,"未能找到对应货位！");
    			}
    		}
    		if (mapDetail.get("putInNum") != null && !mapDetail.get("putInNum").toString().equals("") && isNumeric(mapDetail.get("putInNum").toString())) {
    			putInNum = new BigDecimal(mapDetail.get("putInNum").toString());
    		}else {
            	return setErrorMessage(resultMap," 投料数量不能为空！");
    		}
			//开始时间
    		if(mapDetail.get("startTime")!=null && !mapDetail.get("startTime").toString().equals("")){
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            try {
	            	startTime = sdf.parse(mapDetail.get("startTime").toString());
	            } catch (Exception e) { 
	            	return setErrorMessage(resultMap,"日期格式有误！");
	            }
    		}
			//结束时间
    		if(mapDetail.get("endTime")!=null && !mapDetail.get("endTime").toString().equals("")){
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            try {
	            	endTime = sdf.parse(mapDetail.get("endTime").toString());
	            } catch (Exception e) { 
	            	return setErrorMessage(resultMap,"日期格式有误！");
	            }
    		}
    		if(mapDetail.get("remark")!=null && !mapDetail.get("remark").toString().equals("")){
    			remark=mapDetail.get("remark").toString();
    		}
            //生产批次
            putInMaterialPart.setBatchNum(productBatchNum);
            //投入的物品
            putInMaterialPart.setProductId(product);    		
            //活动
          	putInMaterialPart.setFormluActive(produceTaskActive.getActiveId());
            putInMaterialPart.setTaskActiveId(produceTaskActive);   		
            //投入量
            putInMaterialPart.setUseNum(putInNum);    		
            actualNum = actualNum.add(putInNum);	
            //仓库
            putInMaterialPart.setWareID(ware);
            //货位
            putInMaterialPart.setStoreID(store);
            //投料时间
            putInMaterialPart.setPutinDate(startTime);
            //投料结束时间
            putInMaterialPart.setPutinEndDate(endTime);
            //工作单元
            putInMaterialPart.setFactoryId(produceTask.getFactoryId());
            //工序
            putInMaterialPart.setTaskProcessId(produceTaskActive.getOrderProcessId());
            //备注
            putInMaterialPart.setRemark(remark);
            putInMaterialParts.add(putInMaterialPart);  
        }
        //表体方法
        DataGridService dataGridService = new DataGridService() {
            @Override
            public void execute() {
                if (putInMaterialParts != null && !putInMaterialParts.isEmpty()) {
                    for (WOMPutInMaterialPart part: putInMaterialParts) {
                      	part.setTableInfoId(putInMaterial.getTableInfoId());
                        part.setHeadId(putInMaterial);
                        putInMaterialPartService.savePutInMaterialPart(part, null, "putinView");
                    }
                }
            }
        };

        WorkFlowVar workFlowVar1 = new WorkFlowVar();
        workFlowVar1.setOperateType("submit");
        // 生效
        putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, workFlowVar1, dataGridService, "WOM_7.5.0.0_putInMaterial_putinView", false);  
        //真实投料量
        actiExelog.setActualNum(actualNum);
		resultMap.put("resultCode", 0);//回填返回信息
		return resultMap;
	}


//////////////////////////////////////////////////////////////批控同步MES


    /**
	 * 批控开始指令单
	 * @return
	 */
	@Override
	public Boolean mqStartTask(RMMQDealinfo di, Boolean dealError,WOMProduceTask prodTask, JSONObject batch,List<Map<String, String>> logMap) {
		Boolean result = true;
		String data = di.getMqValue();
		// 启用工单  10:恢复中  7：已暂停
		if (prodTask.getBatchTaskState() != null&& ("womBatchTaskState/10".equals(prodTask.getBatchTaskState().getId()) || ("womBatchTaskState/07".equals(prodTask.getBatchTaskState().getId())))) {		
			// 恢复运行中，或已暂停的工单恢复运行
			prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/02"));
			prodTask.setTaskState(new SystemCode("womTaskState/02"));//先修改工单状态为执行中
			produceTaskDao.save(prodTask);
			logMap = setWorkOrderMqLogMap(true, null, "工单执行状态修改成功","batchStatus", di.getId().toString(), "false",prodTask.getProductBatchNum());
			insertLog(logMap, false);
		} else {
			// 工单生效
			try {
				Long startTimeLong;
				startTimeLong = batch.getLong("StartTime");
				Date startTime = Filetime2Date(startTimeLong);
				if(prodTask.getTaskState() != null && prodTask.getTaskState().getId().toString().equals("womTaskState/01")){//工单待执行，正常启动工单
					prodTask.setTaskState(new SystemCode("womTaskState/02"));//先修改工单状态为执行中
                  	prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/02"));//修改工单批控状态为执行
                    prodTask.setActStartTime(startTime);//修改工单开始执行时间
					produceTaskDao.save(prodTask);
					logMap = setWorkOrderMqLogMap(true,null,"工单执行状态修改成功","batchStatus",di.getId().toString(),"false", prodTask.getProductBatchNum());
					insertLog(logMap, dealError);
				}else if(prodTask.getTaskState() != null && prodTask.getTaskState().getId().toString().equals("womTaskState/02")){//工单状态为执行中，认为信号滞后（由Unit启动信号或Phase启动信号激活），修改开始时间
					prodTask.setActStartTime(startTime);//修改工单开始执行时间
					produceTaskDao.save(prodTask);
					logMap = setWorkOrderMqLogMap(true,null,"工单执行状态修改成功","batchStatus",di.getId().toString(),"false", prodTask.getProductBatchNum());
					insertLog(logMap, dealError);
				}else{
					logMap = setWorkOrderMqLogMap(false,null,"工单："+ prodTask.getProductBatchNum() + "执行状态异常，不能开始工单,jsonData:"+data,"batchStatus",di.getId().toString(),"false", prodTask.getProductBatchNum());
					insertLog(logMap, dealError);
					result = false;
				}
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 批控里的开始执行时间
		}
		return result;
	}

	/**
	 * 批控结束指令单
	 * @return
	 */
	@Override
	public Boolean mqEndTask(RMMQDealinfo di, Boolean dealError,WOMProduceTask prodTask, JSONObject batch,List<Map<String, String>> logMap) {
		Boolean result = true;
		String data = di.getMqValue();
		try {					
			// 结束工单(目前状态为已结束8)
			// 工单批控执行状态为执行中02或停止中05或已暂停07
			if (prodTask.getBatchTaskState() != null && (prodTask.getBatchTaskState().getId().toString().equals("womBatchTaskState/02") || prodTask.getBatchTaskState().getId().toString().equals("womBatchTaskState/05") || prodTask.getBatchTaskState().getId().toString().equals("womBatchTaskState/07"))) {
				boolean hasYeild = true;// 是否有实际产量
				String factYield;
				factYield = batch.getString("FactYield");// 批控中的实际产量
				BigDecimal factYieldBd = null;
				if (factYield != null && factYield.length() > 0 && isNumeric(factYield)) {
					factYieldBd = new BigDecimal(factYield);
					if (factYieldBd.equals(BigDecimal.ZERO)) {
						hasYeild = false;
					}
					// 批控默认单位为kg，华科制造数量分为kg、吨两个字段储存,产品包只存一个字段
					prodTask.setBatchProduceNum(factYieldBd);
					// prodTask.setBatchProduceNumKg(factYieldBd);
				} else {
					hasYeild = false;
				}				
				boolean batchComplate = false;// 指令完成 = 批控结束＋批控结束即完成＋非提前放料（批有结论）
				// 判断是否有提前放料活动
				boolean advanceCharge = false;    													
				List<PublicSetBatchInfo> batchInfos = batchInfoService.getBatchInfos("valid = true and advanceCharge = true and batchNum = '" + prodTask.getProductBatchNum() + "'", null);
                if (batchInfos != null && batchInfos.size() > 0) {
                    advanceCharge = true;
                }
                
                /***edited by oneway 20180710**///先只考虑批控结束即完成
                if (advanceCharge && prodTask.getFormularId().getBatchOverOnFinish()) { // 提前放料 + 批控结束即完成
                    Long endTimeLong = batch.getLong("EndTime");
                    Date endTime = Filetime2Date(endTimeLong);
                    prodTask.setActEndTime(endTime);//修改工单结束执行时间
                    if (prodTask.getTaskState() != null && prodTask.getTaskState().getId().toString().equals("womTaskState/02")) {//如果指令单执行状态为执行中，修改成已完成
                        prodTask.setTaskState(new SystemCode("womTaskState/03"));//修改工单状态为结束
                    }
                    if (factYieldBd != null && !factYieldBd.equals(BigDecimal.ZERO)) {
                    	//批控默认单位为kg
                        prodTask.setFinishNum(factYieldBd);//TODO
                    }
                    batchComplate = true;
                    prodTask.setAdvanceCharge(false);//取消提前放料标志
                }

                Long endTimeLong = batch.getLong("EndTime");
                if (!advanceCharge && prodTask.getFormularId().getBatchOverOnFinish()) { // 非提前放料 + 批控结束即完成
                    Date endTime = Filetime2Date(endTimeLong);
                    prodTask.setActEndTime(endTime);//修改工单结束执行时间
                    if (prodTask.getTaskState() != null && prodTask.getTaskState().getId().toString().equals("womTaskState/02")) {//如果指令单执行状态为执行中，修改成已完成
                        prodTask.setTaskState(new SystemCode("womTaskState/03"));//修改工单状态为结束
                    }
                    if (factYieldBd != null && !factYieldBd.equals(BigDecimal.ZERO)) {
                    	prodTask.setFinishNum(factYieldBd);
                    }
                    batchComplate = true;
                }
                prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/03"));//修改工单批控状态为结束
                produceTaskDao.save(prodTask);
                produceTaskDao.flush();
				produceTaskDao.clear();

                // 指令完成＋自动报工＋有制造数量＝自动报工  02:报工但不提交 03:报工并提交
                /*              
				if (batchComplate && prodTask.getAutoReportOnFinish() != null && hasYeild  
                		&& ("autoReportOnFinish/03".equals(prodTask.getAutoReportOnFinish().getId()) || "autoReportOnFinish/02".equals(prodTask.getAutoReportOnFinish().getId()))) {
                    // 生成报工单
                    // 需要传staff
                    Long staffId = prodTask.getOwnerStaffId();
                    Staff staff = null;
                    if (staffId != null) {
                        staff = staffService.get(staffId);
                    }
                    String reportState = prodTask.getAutoReportOnFinish().getId();
                    //调用报工接口
                    interfaceSelfService.addTaskReportingTable(prodTask.getId().toString(), staff, reportState, factYieldBd.toString());
                    //interfaceService.addTaskReportingTable(prodTask.getId(), prodTask.getProductBatchNum(), prodTask.getFinishNum(), staff);
                }*/
				dealErrorBatch(prodTask, endTimeLong);
				logMap = setWorkOrderMqLogMap(true, null, "工单执行状态修改成功","batchStatus", di.getId().toString(), "false",prodTask.getProductBatchNum());
				insertLog(logMap, dealError);
			} else {
				logMap = setWorkOrderMqLogMap(false, null,"工单：" + prodTask.getProductBatchNum()+ "状态不是执行中，不能结束工单,jsonData:" + data,"batchStatus", di.getId().toString(), "false",prodTask.getProductBatchNum());
				insertLog(logMap, dealError);
				result = false;
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
    
	
	
	/**
	 * 指令完成＋自动报工＋有制造数量＝自动报工  02:报工但不提交 03:报工并提交
	 */
	@Override
	public Boolean mqEndTaskToAddReport(RMMQDealinfo di, Boolean dealError,WOMProduceTask prodTask, JSONObject batch,List<Map<String, String>> logMap) {// 结束工单(目前状态为已结束8)
		prodTask = produceTaskService.getProduceTask(prodTask.getId());
		Boolean result = true;
		String data = di.getMqValue().substring(8, di.getMqValue().length());
		try {
			if (prodTask.getBatchTaskState() != null && prodTask.getBatchTaskState().getId().toString().equals("womBatchTaskState/03")) {// 工单批控执行状态为执行中或停止中或已暂停
				boolean hasYeild = true;// 是否有实际产量
				String factYield = batch.getString("FactYield"); // 批控中的实际产量
				BigDecimal factYieldBd = null;
				if (factYield != null && factYield.length() > 0 && isNumeric(factYield)) {
					factYieldBd = new BigDecimal(factYield);
					if (factYieldBd.equals(BigDecimal.ZERO)) {
						hasYeild = false;
					}
				} else {
					hasYeild = false;
				}
				boolean batchComplate = false;// 指令完成 = 批控结束＋批控结束即完成＋非提前放料（批有结论）
				// 判断是否有提前放料活动
				boolean advanceCharge = false;
				Long endTimeLong = batch.getLong("EndTime");
				if (!advanceCharge && prodTask.getFormularId().getBatchOverOnFinish()) { // 非提前放料 +// 批控结束即完成
					batchComplate = true;
				}
				// 指令完成＋自动报工＋有制造数量＝自动报工 02:报工但不提交 03:报工并提交
				if (batchComplate&& prodTask.getAutoReportOnFinish() != null&& hasYeild&& ("autoReportOnFinish/03".equals(prodTask.getAutoReportOnFinish().getId()) 
						|| "autoReportOnFinish/02".equals(prodTask.getAutoReportOnFinish().getId()))) {
					// 生成报工单
					// 需要传staff
					Long staffId = prodTask.getOwnerStaffId();
					Staff staff = null;
					if (staffId != null) {
						staff = staffService.get(staffId);
					}
					String reportState = prodTask.getAutoReportOnFinish().getId();
					// 调用报工接口
					interfaceSelfService.addTaskReportingTable(prodTask.getId().toString(), staff, reportState, factYieldBd.toString());
				}
			} 
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 批控放弃指令单
	 * @return
	 */
	@Override
	public Boolean mqAbortTask(RMMQDealinfo di, Boolean dealError,WOMProduceTask prodTask, JSONObject batch,List<Map<String, String>> logMap) {//放弃工单
        Long endTimeLong = null;
        try {
            endTimeLong = batch.getLong("EndTime");//结束时间
        } catch (JSONException e) {
            log.error(e.getMessage(), e);
        }
        if (endTimeLong != null && endTimeLong.longValue() > 0) {
            Date endTime = Filetime2Date(endTimeLong);
            prodTask.setActEndTime(endTime);
        }                                  
        dealErrorBatch(prodTask,endTimeLong);                                    
        prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/09"));//先修改工单批控状态为已放弃
        prodTask.setTaskState(new SystemCode("womTaskState/09"));//工单状态设为已放弃                                  
        produceTaskDao.save(prodTask);
        logMap = setWorkOrderMqLogMap(true, null, "工单执行状态修改成功", "batchStatus", di.getId().toString(), "false", prodTask.getProductBatchNum());
        insertLog(logMap, dealError);
        return true;
    }
	
	
	/**
	 * 批控暂停指令单
	 * @return
	 */
	@Override
	public Boolean mqStopTask(RMMQDealinfo di, Boolean dealError,WOMProduceTask prodTask, JSONObject batch,List<Map<String, String>> logMap) {//暂停工单
        prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/07"));
        produceTaskDao.save(prodTask);
        logMap = setWorkOrderMqLogMap(true, null, "工单执行状态修改成功", "batchStatus", di.getId().toString(), "false", prodTask.getProductBatchNum());
        insertLog(logMap, dealError);
        return true;
    }
	
	////0213
	/**
	 * 批控处理指令单大方法，其中包括：
	 * 开始指令单，结束指令单，结束生成报工单
	 * @param di
	 * @param dealError
	 * @return
	 */
	@Override
	public Boolean mqDealTaskBoolean(RMMQDealinfo di, Boolean dealError) {
		Boolean result=true;
		String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020001")){
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
                //isSuccess = dealMqBatchDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                	result= false;
                }
                try {
                    JSONObject batch = new JSONObject(data);
                    if (batch != null) {
                        String batchId = batch.getString("ID");
                        WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
                                Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
                        if (prodTask != null) { // 工单存在
                            if (prodTask.getStatus() != 99) {
                                logMap = setWorkOrderMqLogMap(false, null, "工单：" + prodTask.getProductBatchNum() + "未生效，不能更改工单执行状态,jsonData:" + data, "batchStatus", di.getId().toString(), "false", prodTask.getProductBatchNum());
                                insertLog(logMap, dealError);
                                result = false;
                            } else { // 工单生效
                                Long taskState = batch.getLong("ExeStat");//ExeStat 1:运行中  8:已完成  -1:未执行 / womTaskState/01:待执行 02:执行中 03:已完成 04:终止
                                Long oldTaskState = batch.getLong("ExeStatOld");//过去运行状态
                                if (taskState != null && taskState.intValue() == 1) {
                                	//启动工单-调用开始指令单方法
                                	result=mqStartTask(di, dealError, prodTask, batch, logMap);
                                }else if (taskState != null && taskState.intValue() == 8){
                                	//结束工单-调用结束指令单方法，
                                	result=mqEndTask(di, dealError, prodTask, batch, logMap);
                                	//若需要报工，调用报工接口
                                	mqEndTaskToAddReport(di, dealError, prodTask, batch, logMap);
                                }else if (taskState != null && taskState.intValue() == 6) {
                                	//批控放弃指令单
                                	mqAbortTask(di, dealError, prodTask, batch, logMap);
                                } else if (taskState != null && taskState.intValue() == 5) {
                                	//批控暂停指令单
                                	mqStopTask(di, dealError, prodTask, batch, logMap);
                                } 
                            }
                        } else {
                            logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "batchStatus", null, "true", batchId);
                            insertLog(logMap, dealError);
                            result = false;
                        }
                    }
                }catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} 
            	deleteMq(di);
            } 	
        	return result;
	}
	
	

	
	
	
	////
	
	/**
	 * 批控开始Unit
	 * @return
	 */
	@Override
	public Boolean mqStartUnit(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,List<Map<String, String>> logMap,Long startTimeLong,WOMProdTaskProcExelog procExeLog, WOMProduceTaskProcess produceTaskProcess,String batchUnitId, String unitEquipID) {
        /////////////////////////////////////////////////////////////开始工序业务
		Boolean result=true;
		if(startTimeLong!=null && startTimeLong.longValue()>0){
        	//工序开始信号
            WOMProdTaskProcExelog procExeLogNew = new WOMProdTaskProcExelog();
            if (procExeLog != null) {//如果phase开始信号先于unit信号，会新建一条只有batchUnitId的数据
                procExeLogNew = procExeLog;
                procExeLogNew.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中

            } else {
                procExeLogNew.setBatchUnitID(batchUnitId);//批控unitID
            }
            procExeLogNew.setTaskID(prodTask);//工单
            procExeLogNew.setBatchNum(prodTask.getProductBatchNum());//生成批号
            procExeLogNew.setTaskProcessID(produceTaskProcess);//工单.工序
            procExeLogNew.setFormularProcess(produceTaskProcess.getFormularProcess());//配方.工序

            Date startTime = Filetime2Date(startTimeLong);
            procExeLogNew.setStartTime(startTime);//开始时间
            procExeLogNew.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中
            interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) != null && getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length() > 0 ?
                    "http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/" : "http://localhost:8081/";
            String equipCode = getBatchFactoryCode(unitEquipID, interfaceURL);//华科项目，equipCode实际对应工厂表里的name
            MESBasicFactoryModel factoryModel = null;
            if (equipCode != null && equipCode.length() > 0) {
                //factoryModel = factoryModelService.findEntityByProperty("code", equipCode);
                List<Object> params = new ArrayList<Object>();
                params.add(equipCode);
                //List<MESBasicFactoryModel>  factoryModels = factoryModelService.getFactoryModels("this_.CODE = ? and this_.valid=1", params);
                List<MESBasicFactoryModel> factoryModels = factoryModelService.getFactoryModels("this_.NODENAME = ? and this_.valid=1", params);

                factoryModel = factoryModels.get(0);
                if (factoryModel != null) {
                    procExeLogNew.setFactoryID(factoryModel);
                } else {
                    procExeLogNew.setFactoryID(prodTask.getFactoryId());//工作单元
                }
            }
            prodTaskProcExelogDao.save(procExeLogNew);
            if (factoryModel != null && procExeLog != null) {
                prodTaskProcExelogDao.flush();
                prodTaskProcExelogDao.clear();
                procExeLogNew = prodTaskProcExelogService.getProdTaskProcExelog(procExeLogNew.getId());
                List<WOMProdTaskActiExelog> activesExelogs = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("processExeLog", procExeLogNew));
                if (activesExelogs != null && activesExelogs.size() > 0) {
                    for (WOMProdTaskActiExelog activeExelog : activesExelogs) {
                        activeExelog.setFactoryID(factoryModel);
                        prodTaskActiExelogDao.save(activeExelog);
                        prodTaskActiExelogDao.flush();
                        prodTaskActiExelogDao.clear();
                    }
                }
                
                List<WOMBatchPhaseExelog> phaseExelogs = batchPhaseExelogDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskProcessID", procExeLogNew.getTaskProcessID()));
                if (phaseExelogs != null && phaseExelogs.size() > 0) {
                    for (WOMBatchPhaseExelog phaseExelog : phaseExelogs) {
                        phaseExelog.setFactoryId(factoryModel);
                        batchPhaseExelogDao.save(phaseExelog);
                        batchPhaseExelogDao.flush();
                        batchPhaseExelogDao.clear();
                    }
                }
            }
            logMap = setWorkOrderMqLogMap(true, null, "工序\"" + produceTaskProcess.getName() + "\"开始", "unitStatus", di.getId().toString(), "false",
                    produceTaskProcess.getName());
            insertLog(logMap, dealError);        
        }
        return result;
    }

	/**
	 * 批控结束Unit
	 * @return
	 */
	@Override
	public Boolean mqEndUnit(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,List<Map<String, String>> logMap,Long startTimeLong,Long endTimeLong,WOMProdTaskProcExelog procExeLog, WOMProduceTaskProcess produceTaskProcess,String batchUnitId) {
        Boolean result=true;
		////////////////////////////////////////////////////////////////////结束工序业务
        if (endTimeLong != null && endTimeLong.longValue() > 0) {//工序结束信号
            if (procExeLog != null) {
                procExeLog.setState(new SystemCode("womProActiveType/completed"));
                Date endTime = Filetime2Date(endTimeLong);
                procExeLog.setEndTime(endTime);
                prodTaskProcExelogDao.save(procExeLog);
                logMap = setWorkOrderMqLogMap(true, null, "工序\"" + produceTaskProcess.getName() + "\"结束", "unitStatus", di.getId().toString(), "false",
                        procExeLog.getTaskProcessID() != null ? procExeLog.getTaskProcessID().getName() : "");
                insertLog(logMap, dealError);
            } else {//如果工序执行记录为空，
                WOMProdTaskProcExelog procExeLogNew = new WOMProdTaskProcExelog();
                procExeLogNew.setBatchUnitID(batchUnitId);//批控unitID
                procExeLogNew.setTaskID(prodTask);//工单
                procExeLogNew.setBatchNum(prodTask.getProductBatchNum());//生成批号
                procExeLogNew.setTaskProcessID(produceTaskProcess);//工单.工序
                procExeLogNew.setFormularProcess(produceTaskProcess.getFormularProcess());//配方.工序
                Date startTime = Filetime2Date(startTimeLong);
                procExeLogNew.setStartTime(startTime);//开始时间
                procExeLogNew.setState(new SystemCode("womProActiveType/completed"));//执行状态为执行中
                prodTaskProcExelogDao.save(procExeLogNew);
                logMap = setWorkOrderMqLogMap(false, null, "开始信号未传递，工序\"" + produceTaskProcess.getName() + "\"异常结束", "unitStatus", di.getId().toString(), "true",
                        produceTaskProcess != null ? produceTaskProcess.getName() : "");
                insertLog(logMap, dealError);
            }
            //}else if(exeStat.intValue() == 1 && startTimeLong.intValue()!=0 ){//工序开始信号
        }	
        return result;
	}
	
	
	/**
	 * 00020002
	 * 批控处理unit工序大方法，其中包括：
	 * 开始unit，结束unit及修改相关设备
	 * @param di
	 * @param dealError
	 * @return
	 */
	@Override
	public Boolean mqDealUnitBoolean(RMMQDealinfo di, Boolean dealError) {
		Boolean result=true;
        String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020002")) {
        	//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {
              //  isSuccess = dealMqUnitDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                	return false;
                }
                try {
					JSONObject unit = new JSONObject(data);
					if (unit != null){
			               String batchId = unit.getString("BatchID");
			                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
			                        Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
			                if (prodTask != null) {
			                    if (prodTask.getStatus() != 99) {
			                        logMap = setWorkOrderMqLogMap(false, null, "工单未生效,jsonData:" + data, "unitStatus", di.getId().toString(), "false", batchId);
			                        insertLog(logMap, dealError);
			                        result= false;
			                    }
			                    String batchUnitId = unit.getString("ID");//phase关联unitId
			                    Long exeStatOld = null;//unit状态
			                    Long exeStat = null;//unit状态
			                    Long startTimeLong = null;//开始时间
			                    Long endTimeLong = null;//结束时间
			                    String unitEquipID = null;//对应设备

			                    // 回填工单执行状态到计划明细 - added 20180207
			                    SystemCode state = prodTask.getTaskState();//执行状态
			                    String batchNum = prodTask.getProductBatchNum();// 生产批号
			                  //  womPlanPartService.backFillPlanDetail(batchNum, state, null, prodTask.getTaskType());

			                    try {
			                        exeStatOld = unit.getLong("ExeStatOld");//unit状态
			                        exeStat = unit.getLong("ExeStat");//unit状态
			                        startTimeLong = unit.getLong("StartTime");//开始时间
			                        endTimeLong = unit.getLong("EndTime");//结束时间
			                        unitEquipID = unit.getString("UnitEquipID");
			                    } catch (JSONException e) {
			                        log.error(e.getMessage(), e);
			                    }
			                    WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
			                    WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headId", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单工序

			                    if (produceTaskProcess == null) {
			                        logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "unitStatus", di.getId().toString(), "true", batchUnitId);
			                        insertLog(logMap, dealError);
			                        result = false;
			                    }		                    
			                    if(startTimeLong!=null && startTimeLong.longValue()>0){//工序开始信号
			                    	result=mqStartUnit(di, dealError, prodTask, logMap, startTimeLong, procExeLog, produceTaskProcess, batchUnitId, unitEquipID);
			                    }else if(endTimeLong != null && endTimeLong.longValue() > 0){//工序结束信号
			                    	result=mqEndUnit(di, dealError, prodTask, logMap, startTimeLong, endTimeLong, procExeLog, produceTaskProcess, batchUnitId);
			                    }
			                    //////////////////////////////////////////////
			                }else{
			                    logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "unitStatus", di.getId().toString(), "true", batchId);
			                    insertLog(logMap, dealError);
			                    result = false;					                   
			                }
					}
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else if (body != null) {
            	//如果有设备编码，则修改相关数据的设备
                result = updateEquipment(di, false);
            }
            deleteMq(di);
        }  
        return result;
	}
	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////

	
	/**
	 * 批控开始Phase
	 * @return
	 */
	@Override
	public Boolean mqStartPhase(RMMQDealinfo di,Boolean dealError) {
		Boolean result=true;
        log.info("deal mq info start : " + di.getId().toString());
        String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        Boolean isSuccess = false;
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020004")) {
        	//phase层面
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
                //isSuccess = dealMqPhaseDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                    return false;
                }
                try {
					JSONObject phase = new JSONObject(data);
				      if (phase != null){
			                String batchId = phase.getString("BatchID");
			                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
			                        Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
			                if (prodTask != null) {
			                    Long startTimeLong = null;
			                    Long endTimeLong = null;
			                    Date startTime = null;
			                    try {
			                        startTimeLong = phase.getLong("StartTime");
			                        startTime = Filetime2Date(startTimeLong);
			                        endTimeLong = phase.getLong("EndTime");
			                    } catch (JSONException e) {
			                        log.error(e.getMessage(), e);
			                    }
			                    //指令单状态：womTaskState/01 待执行
			                    if (prodTask.getTaskState() != null && "womTaskState/01".equals(prodTask.getTaskState().getId())) {//womTaskState/01 待执行
			                        prodTask.setTaskState(new SystemCode("womTaskState/02"));//先修改工单状态为执行
			                        prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/02"));//修改工单批控状态为执行
			                        prodTask.setActStartTime(startTime);//修改工单开始执行时间
			                        produceTaskDao.save(prodTask);
			                        logMap = setWorkOrderMqLogMap(true, null, "工单执行状态修改成功", "batchStatus", di.getId().toString(), "false", prodTask.getProductBatchNum());
			                        insertLog(logMap, false);
			                    }


			                    String batchUnitId = phase.getString("UnitID");
			                    WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headId", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动
			                    //WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTask),
			                    //		Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录
			                    WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
			                    if (procExeLog == null) {//如果phase开始信号，先于Unit 开始信号，先新建一条只有unitID的数据，给活动执行记录关联

			                        WOMProdTaskProcExelog procExeLogNew = new WOMProdTaskProcExelog();

			                        //phase开始即工单和工序开始 start
			                        procExeLogNew.setStartTime(startTime);//开始时间
			                        procExeLogNew.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中
			                        //phase开始即工单和工序开始end


			                        procExeLogNew.setBatchUnitID(batchUnitId);//批控unitID
			                        procExeLogNew.setTaskID(prodTask);//工单
			                        prodTaskProcExelogDao.save(procExeLogNew);
			                        prodTaskProcExelogDao.flush();
			                        prodTaskProcExelogDao.clear();
			                        procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
			                                Restrictions.eq("batchUnitID", batchUnitId));
			                    } else {
			                    	if(procExeLog.getStartTime() == null){
			                    		procExeLog.setStartTime(startTime);//开始时间
			                    		procExeLog.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中
			                    	}
			                        procExeLog.setBatchUnitID(batchUnitId);//批控unitID
			                        procExeLog.setTaskID(prodTask);//工单
			                        prodTaskProcExelogDao.save(procExeLog);
			                        prodTaskProcExelogDao.flush();
			                        prodTaskProcExelogDao.clear();
			                        procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
			                                Restrictions.eq("batchUnitID", batchUnitId));
			                    }
			                    if (produceTaskProcess == null) {
			                        logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchUnitId);
			                        insertLog(logMap, false);
			                        result = false;
			                    } else {


			                        String batchPhaseId = phase.getString("ID");
			                        int activeIndex = 1;//一个phase对应多个活动的，只需要在操作第一个活动的时候启停phase即可
			                        List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headID", prodTask),
			                                Restrictions.eq("batchPhaseID", batchPhaseId));//根据批控phaseId获取工单活动
			                        if (prodTaskActives != null && prodTaskActives.size() > 0) {
			                            Long exeStat = phase.getLong("ExeStat");
			                            Long exeStatOld = phase.getLong("ExeStatOld");


			                            if (startTimeLong != null && startTimeLong.longValue() > 0) {//第一个Phase开始信号过来的时候吗，才开始工序
			                                //如果工序执行状态为空，开始工序执行状态
			                                if (procExeLog.getState() != null) {

			                                } else {
			                                    procExeLog.setState(new SystemCode("womProActiveType/executing"));
			                                    prodTaskProcExelogDao.save(procExeLog);
			                                    prodTaskProcExelogDao.flush();
			                                    prodTaskActiExelogDao.clear();
			                                    procExeLog = prodTaskProcExelogDao.load(procExeLog.getId());
			                                }
			                            }

			                            for (WOMProduceTaskActive prodTaskActive : prodTaskActives) {
			                                if (prodTaskActive.getActiveType() != null && !prodTaskActive.getActiveType().getId().equals("activeType/activeType2")) {//配料不处理
			                                	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////处理活动
			                                    if (prodTaskActive.getActiveType() != null && ("activeType/activeType1".equals(prodTaskActive.getActiveType().getId()))) {//常规
			                                        //先编辑phase执行记录表里查数据
			                                        result = dealPhaseStartActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                        if (result) {
			                                            //再编辑指令活动记录表
			                                            result = dealStartPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                    produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                        }					                           
			                                    }//3:投料 4:投配料
			                                    else if (prodTaskActive.getActiveType() != null && ("activeType/activeType3".equals(prodTaskActive.getActiveType().getId()  ) ||
			                                    		"activeType/activeType4".equals(prodTaskActive.getActiveType().getId()))) {					                                    	
			                                        if (prodTaskActive.getActiveId().getAuto()) {//自动投料
			                                            //先编辑phase执行记录表里查数据
			                                            result = dealPhaseStartActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                    produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                            if (result) {
			                                                //再编辑指令活动记录表
			                                                result = dealStartPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                            }
			                                        } else {//手动投料
			                                            if (activeIndex == 1) {//手动投配料具体活动记录通过pda录入 //只有手工投配料才可能有一个Phase对应多个活动的情况
			                                                result = startPhaseActiveExeLogManual(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                            }
			                                        }
			                                    }else if (prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {
			                                    	//检验
			                                    	if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
			                                            WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
			                                                    Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
			                                            if (batchPhaseExelog != null) {
			                                                result = true;
			                                            } else {
			                                                //只在phase执行记录表里插数据
			                                                result = dealPhaseStartActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                                if (result) {
			                                                    //再编辑指令活动记录表
			                                                    result = dealStartPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                            produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                                }
		                                                    batchPhaseExelogDao.flush();
		                                                    batchPhaseExelogDao.clear();
			                                            }
			                                        }
			                                    }
			                                	//增减活动的索引，避免多次操作phase和日志
			                                    activeIndex++;
			                                }
			                            }
			                        } else {
			                            logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchPhaseId);
			                            insertLog(logMap, false);
			                            result = false;
			                        }
			                    }
			                } else {
			                    logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchId);
			                    insertLog(logMap, false);
			                    result = false;
			                }
			            }
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else {
                result = dealMqPhaseDateChange(di, false);
            }
            deleteMq(di);
        } 
        return result;
    }
	
	
	/**
	 * 批控结束Phase
	 * @return
	 */
	@Override
	public Boolean mqEndPhase(RMMQDealinfo di,Boolean result) {
        log.info("deal mq info start : " + di.getId().toString());
        String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        Boolean isSuccess = false;
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020004")) {
        	//phase层面
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
                //isSuccess = dealMqPhaseDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                    return false;
                }
                try {
					JSONObject phase = new JSONObject(data);
				      if (phase != null){
			                String batchId = phase.getString("BatchID");
			                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
			                        Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
			                if (prodTask != null) {
			                    Long startTimeLong = null;
			                    Long endTimeLong = null;
			                    Date startTime = null;
			                    try {
			                        startTimeLong = phase.getLong("StartTime");
			                        startTime = Filetime2Date(startTimeLong);
			                        endTimeLong = phase.getLong("EndTime");
			                    } catch (JSONException e) {
			                        log.error(e.getMessage(), e);
			                    }

			                    if (prodTask.getTaskState() != null && "womTaskState/01".equals(prodTask.getTaskState().getId())) {//womTaskState/01 待执行
			                        prodTask.setTaskState(new SystemCode("womTaskState/02"));//先修改工单状态为执行
			                        prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/02"));//修改工单批控状态为执行
			                        prodTask.setActStartTime(startTime);//修改工单开始执行时间
			                        produceTaskDao.save(prodTask);
			                        logMap = setWorkOrderMqLogMap(true, null, "工单执行状态修改成功", "batchStatus", di.getId().toString(), "false", prodTask.getProductBatchNum());
			                        insertLog(logMap, false);
			                    }


			                    String batchUnitId = phase.getString("UnitID");
			                    WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headId", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动
			                    //WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTask),
			                    //		Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录
			                    WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
			                    if (procExeLog == null) {//如果phase开始信号，先于Unit 开始信号，先新建一条只有unitID的数据，给活动执行记录关联

			                        WOMProdTaskProcExelog procExeLogNew = new WOMProdTaskProcExelog();

			                        //phase开始即工单和工序开始 start
			                        procExeLogNew.setStartTime(startTime);//开始时间
			                        procExeLogNew.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中
			                        //phase开始即工单和工序开始end


			                        procExeLogNew.setBatchUnitID(batchUnitId);//批控unitID
			                        procExeLogNew.setTaskID(prodTask);//工单
			                        prodTaskProcExelogDao.save(procExeLogNew);
			                        prodTaskProcExelogDao.flush();
			                        prodTaskProcExelogDao.clear();
			                        procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
			                                Restrictions.eq("batchUnitID", batchUnitId));
			                    } else {
			                    	if(procExeLog.getStartTime() == null){
			                    		procExeLog.setStartTime(startTime);//开始时间
			                    		procExeLog.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中
			                    	}
			                        procExeLog.setBatchUnitID(batchUnitId);//批控unitID
			                        procExeLog.setTaskID(prodTask);//工单
			                        prodTaskProcExelogDao.save(procExeLog);
			                        prodTaskProcExelogDao.flush();
			                        prodTaskProcExelogDao.clear();
			                        procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
			                                Restrictions.eq("batchUnitID", batchUnitId));
			                    }
			                    if (produceTaskProcess == null) {
			                        logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchUnitId);
			                        insertLog(logMap, false);
			                        result = false;
			                    } else {


			                        String batchPhaseId = phase.getString("ID");
			                        int activeIndex = 1;//一个phase对应多个活动的，只需要在操作第一个活动的时候启停phase即可
			                        List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headID", prodTask),
			                                Restrictions.eq("batchPhaseID", batchPhaseId));//根据批控phaseId获取工单活动
			                        if (prodTaskActives != null && prodTaskActives.size() > 0) {
			                            Long exeStat = phase.getLong("ExeStat");
			                            Long exeStatOld = phase.getLong("ExeStatOld");


			                            if (startTimeLong != null && startTimeLong.longValue() > 0) {//第一个Phase开始信号过来的时候吗，才开始工序
			                                //如果工序执行状态为空，开始工序执行状态
			                                if (procExeLog.getState() != null) {

			                                } else {
			                                    procExeLog.setState(new SystemCode("womProActiveType/executing"));
			                                    prodTaskProcExelogDao.save(procExeLog);
			                                    prodTaskProcExelogDao.flush();
			                                    prodTaskActiExelogDao.clear();
			                                    procExeLog = prodTaskProcExelogDao.load(procExeLog.getId());
			                                }
			                            }

			                            for (WOMProduceTaskActive prodTaskActive : prodTaskActives) {
			                                if (prodTaskActive.getActiveType() != null && !prodTaskActive.getActiveType().getId().equals("activeType/activeType2")) {//配料不处理
			                                	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////处理活动
			                                    if (prodTaskActive.getActiveType() != null && ("activeType/activeType1".equals(prodTaskActive.getActiveType().getId()))) {//常规
			                                        //先编辑phase执行记录表里查数据
			                                        result = dealPhaseEndActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                        if (result) {
			                                            //再编辑指令活动记录表
			                                            result = dealEndPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                    produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                        }					                           
			                                    }//3:投料 4:投配料
			                                    else if (prodTaskActive.getActiveType() != null && ("activeType/activeType3".equals(prodTaskActive.getActiveType().getId()  ) ||
			                                    		"activeType/activeType4".equals(prodTaskActive.getActiveType().getId()))) {					                                    	
			                                        if (prodTaskActive.getActiveId().getAuto()) {//自动投料
			                                            //先编辑phase执行记录表里查数据
			                                            result = dealPhaseEndActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                    produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                            if (result) {
			                                                //再编辑指令活动记录表
			                                                result = dealEndPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                            }
			                                        } else {//手动投料
			                                            if (activeIndex == 1) {//手动投配料具体活动记录通过pda录入 //只有手工投配料才可能有一个Phase对应多个活动的情况
			                                                result = startPhaseActiveExeLogManual(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                            }
			                                        }
			                                    }else if (prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {
			                                    	//检验
			                                        if (endTimeLong != null && endTimeLong.longValue() > 0) {
			                                            //完工检验不执行批控的结束信号 -- jojo 2018.9.28
			                                        	if(prodTaskActive.getFinalInspection()){
			                                        		return true;
			                                        	}
			                                            WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
			                                                    Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
			                                            if (batchPhaseExelog != null) {
			                                            	//只在phase执行记录表里插数据
			                                                result = dealPhaseEndActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                                if (result) {
			                                                    //再编辑指令活动记录表
			                                                    result = dealEndPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                            produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                                }
			                                            }
			                                        } 
			                                    }
			                                	//增减活动的索引，避免多次操作phase和日志
			                                    activeIndex++;
			                                }
			                            }
			                        } else {
			                            logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchPhaseId);
			                            insertLog(logMap, false);
			                            result = false;
			                        }
			                    }
			                } else {
			                    logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchId);
			                    insertLog(logMap, false);
			                    result = false;
			                }
			            }
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else {
                isSuccess = dealMqPhaseDateChange(di, false);
            }
            deleteMq(di);
        }       
    
		return result;
	}
	
	
	
	
	
	/**
	 * Phase检验活动生成请检单
	 * @return
	 */
	@Override
	public Boolean mqStartPhaseAddInspect(RMMQDealinfo di,Boolean result) {
        log.info("deal mq info start : " + di.getId().toString());
        String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        Boolean isSuccess = false;
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020004")) {
        	//phase层面
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
                //isSuccess = dealMqPhaseDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                    return false;
                }
                try {
					JSONObject phase = new JSONObject(data);
				      if (phase != null){
			                String batchId = phase.getString("BatchID");
			                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
			                        Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
			                if (prodTask != null) {
			                    Long startTimeLong = null;
			                    Long endTimeLong = null;
			                    Date startTime = null;
			                    try {
			                        startTimeLong = phase.getLong("StartTime");
			                        startTime = Filetime2Date(startTimeLong);
			                        endTimeLong = phase.getLong("EndTime");
			                    } catch (JSONException e) {
			                        log.error(e.getMessage(), e);
			                    }
			                    
			                    String batchUnitId = phase.getString("UnitID");
			                    WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headId", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动
			                    //WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTask),
			                    //		Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录
			                    WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
			                    if (produceTaskProcess == null) {
			                    } else {
			                        String batchPhaseId = phase.getString("ID");
			                        int activeIndex = 1;//一个phase对应多个活动的，只需要在操作第一个活动的时候启停phase即可
			                        List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headID", prodTask),
			                                Restrictions.eq("batchPhaseID", batchPhaseId));//根据批控phaseId获取工单活动
			                        if (prodTaskActives != null && prodTaskActives.size() > 0) {
			                            Long exeStat = phase.getLong("ExeStat");
			                            Long exeStatOld = phase.getLong("ExeStatOld");
			                            
			                            for (WOMProduceTaskActive prodTaskActive : prodTaskActives) {
			                                if (prodTaskActive.getActiveType() != null && !prodTaskActive.getActiveType().getId().equals("activeType/activeType2")) {//配料不处理
			                                   //处理活动
			                                   if (prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {
			                                    	//检验
			                                        if (endTimeLong != null && endTimeLong.longValue() > 0) {
			                                            //完工检验不执行批控的结束信号 -- jojo 2018.9.28
			                                        	if(prodTaskActive.getFinalInspection()){
			                                        		return true;
			                                        	}
			                                            WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
			                                                    Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
			                                            if (batchPhaseExelog != null) {
			                                            	//只在phase执行记录表里插数据
			                                                result = dealPhaseEndActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                                if (result) {
			                                                    //再编辑指令活动记录表
			                                                    result = dealEndPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                            produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                                }
			                                            }
			                                        } else if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
			                                            WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
			                                                    Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
			                                            if (batchPhaseExelog != null) {
			                                                result = true;
			                                            } else {
			                                                //只在phase执行记录表里插数据
			                                                result = dealPhaseStartActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                                if (result) {
			                                                    //再编辑指令活动记录表
			                                                    result = dealStartPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                            produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                                }

			                                                /*
			                                                 *
			                                                 * 生成请检接口
			                                                 *
			                                                 * */

			                                                if (result) {
			                                                    batchPhaseExelogDao.flush();
			                                                    batchPhaseExelogDao.clear();
			                                                    WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
			                                                            Restrictions.eq("phaseID", batchPhaseId), Restrictions.eq("taskActiveID", prodTaskActive));//根据批控phaseId和工序工单获取工单活动记录
			                                                    interfaceSelfService.addApplyCheckByActiveExelog(prodTaskActiExelog);
			                                                }
			                                            }
			                                        }
			                                    }
			                                	//增减活动的索引，避免多次操作phase和日志
			                                    activeIndex++;
			                                }
			                            }
			                        } else {
			                            logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchPhaseId);
			                            insertLog(logMap, false);
			                            result = false;
			                        }
			                    }
			                } else {
			                    logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchId);
			                    insertLog(logMap, false);
			                    result = false;
			                }
			            }
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else {
                isSuccess = dealMqPhaseDateChange(di, false);
            }
            deleteMq(di);
        }       
		return result;
	}
	
	
	/**
	 * Phase投料投配料活动生成投料单
	 * @return
	 */
	@Override
	public Boolean mqStartPhaseAddPutIn(RMMQDealinfo di,Boolean result) {
        log.info("deal mq info start : " + di.getId().toString());
        String  data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        Boolean isSuccess = false;
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020004")) {
        	//phase层面
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
                //isSuccess = dealMqPhaseDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                    return false;
                }
                try {
					JSONObject phase = new JSONObject(data);
				      if (phase != null){
			                String batchId = phase.getString("BatchID");
			                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
			                        Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
			                if (prodTask != null) {
			                    Long startTimeLong = null;
			                    Long endTimeLong = null;
			                    Date startTime = null;
			                    try {
			                        startTimeLong = phase.getLong("StartTime");
			                        startTime = Filetime2Date(startTimeLong);
			                        endTimeLong = phase.getLong("EndTime");
			                    } catch (JSONException e) {
			                        log.error(e.getMessage(), e);
			                    }
			                    
			                    String batchUnitId = phase.getString("UnitID");
			                    WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headId", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动
			                    //WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTask),
			                    //		Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录
			                    WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
			                    if (produceTaskProcess == null) {
			                    } else {
			                        String batchPhaseId = phase.getString("ID");
			                        int activeIndex = 1;//一个phase对应多个活动的，只需要在操作第一个活动的时候启停phase即可
			                        List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headID", prodTask),
			                                Restrictions.eq("batchPhaseID", batchPhaseId));//根据批控phaseId获取工单活动
			                        if (prodTaskActives != null && prodTaskActives.size() > 0) {
			                            Long exeStat = phase.getLong("ExeStat");
			                            Long exeStatOld = phase.getLong("ExeStatOld");		                            
			                            for (WOMProduceTaskActive prodTaskActive : prodTaskActives) {
			                                if (prodTaskActive.getActiveType() != null && !prodTaskActive.getActiveType().getId().equals("activeType/activeType2")) {//配料不处理
			                                  ///////////////////////////////////////////////////////////////////////////////处理投料，投配料活动
			                                   if (prodTaskActive.getActiveType() != null && ("activeType/activeType3".equals(prodTaskActive.getActiveType().getId()) || "activeType/activeType4".equals(prodTaskActive.getActiveType().getId()))) {
			                                       if (prodTaskActive.getActiveId().getAuto()) {//自动投料
			                                           //先编辑phase执行记录表里查数据
			                                          // result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                          //        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                           WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
			                                                   Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动                         
			                                           if (endTimeLong != null && endTimeLong.longValue() > 0) {//完成信号
			                                               if (batchPhaseExelog != null) {
			                                                   if (batchPhaseExelog.getEndTime() != null) {//如果有多次结束信号，只处理第一次
			                                                       return true;
			                                                   } else {
			                                                       Date endTime = Filetime2Date(endTimeLong);
			                                                       batchPhaseExelog.setEndTime(endTime);
			                                                       batchPhaseExelog.setIsFinish(true);//执行结束
			                                                       batchPhaseExelogDao.save(batchPhaseExelog);
			                                                   }
			                                               }
			                                           }else if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
			                                               WOMBatchPhaseExelog batchPhaseExelogNew = new WOMBatchPhaseExelog();
			                                               if (batchPhaseExelog != null) {
			                                                   batchPhaseExelogNew = batchPhaseExelog;
			                                               }
			                                               if (batchPhaseExelogNew.getStartTime() != null) {//如果有多次开始信号，只处理第一次
			                                            	   result= true;
			                                               } else {
			                                                   batchPhaseExelogNew.setAllowPutin(true);//允许投料
			                                                   batchPhaseExelogNew.setBatchNum(prodTask.getProductBatchNum());//批号
			                                                   batchPhaseExelogNew.setExeSystem(new SystemCode("RMsystem/system1"));//系统
			                                                   batchPhaseExelogNew.setFactoryId(procExeLog.getFactoryID());//工作单元
			                                                   batchPhaseExelogNew.setIsFinish(false);//执行开始
			                                                   batchPhaseExelogNew.setMobileTerminal(false);//移动端执行
			                                                   batchPhaseExelogNew.setPhaseID(batchPhaseId);//批控phaseId
			                                                   batchPhaseExelogNew.setRemark("");//备注
			                                                   batchPhaseExelogNew.setStartTime(startTime);
			                                                   batchPhaseExelogNew.setTaskID(prodTask);//指令单
			                                                   batchPhaseExelogNew.setTaskProcessID(produceTaskProcess);//工序
			                                                   batchPhaseExelogNew.setOperartionID(prodTaskActive.getOperartionID());
			                                                   batchPhaseExelogDao.save(batchPhaseExelogNew);
			                                                   result=true; 
			                                               }
			                                           }					                                                                         
			                                           //修改活动执行记录
			                                           if (result) {
			                                               //再编辑指令活动记录表
			                                              // result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                               //        produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			                                               WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
			                                                       Restrictions.eq("phaseID", batchPhaseId), Restrictions.eq("taskActiveID", prodTaskActive));//根据批控phaseId获取工单活动
			                                               if (endTimeLong != null && endTimeLong.longValue() > 0) {//完成信号
			                                                   String matFbValStr = null;
			                                                   if (prodTaskActiExelog != null) {
			                                                       if (prodTaskActiExelog.getEndTime() != null) {//如果有多次结束信号，只处理第一次
			                                                    	   result= true;
			                                                       } else {
			                                                           try {
			                                                               Date endTime = Filetime2Date(endTimeLong);
			                                                               prodTaskActiExelog.setEndTime(endTime);
			                                                               if (phase.toString().contains("MatFbVal")) {
			                                                                   matFbValStr = phase.getString("MatFbVal");
			                                                                   if (matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//如果matFbValStr有值，即总量模式
			                                                                       Double matFbVal = Double.valueOf(matFbValStr);
			                                                                       BigDecimal actualNum = new BigDecimal(matFbVal);
			                                                                       prodTaskActiExelog.setActualNum(actualNum.divide(new BigDecimal(1000)));//实际投料数量 / 1000 - edited by oneway 2018.7.13
			                                                                   }
			                                                               }
			                                                           } catch (JSONException e) {
			                                                               log.error(e.getMessage(), e);
			                                                           }
			                                                           prodTaskActiExelog.setIsFinish(true);
			                                                           //prodTaskActiExelog.setState(new SystemCode("womProActiveType/completed"));//执行状态
			                                                           prodTaskActiExelogDao.save(prodTaskActiExelog);

			                                                           //正常结束活动
			                                                           logMap = setWorkOrderMqLogMap(true, null, "活动\"" + prodTaskActive.getName() + "\"结束", "activeStatus", di.getId().toString(), "false", prodTaskActive.getName());
			                                                           insertLog(logMap, false);


			                                                       }
			                                                   }
			                                                   boolean allowNewPutinRecord = false;//是否生成投料记录
			                                                   if (prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType3") && prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto() &&
			                                                           matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//自动投料活动需要生成投料清单
			                                                       allowNewPutinRecord = true;
			                                                   } else if (prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType4")
			                                                           && prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto()) {//自动投配料先查询一下是否有对应的配料记录
			                                                       List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),
			                                                               Restrictions.eq("phaseID", batchPhaseId));//通过phsae查询配料指令明细
			                                                       if (batchingMaterialPartList != null && batchingMaterialPartList.size() > 0) {
			                                                           allowNewPutinRecord = true;
			                                                       } else {
			                                                           logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "查询不到对应该活动的配料记录,jsonData:" + data, "activeStatus", di.getId().toString(), "false", batchPhaseId);
			                                                           insertLog(logMap, false);
			                                                           result= false;
			                                                       }
			                                                   }

			                                                   if (allowNewPutinRecord) {//调用接口生成投料记录
			                                                       batchPhaseExelogDao.flush();
			                                                       batchPhaseExelogDao.clear();
			                                                       WOMProdTaskActiExelog prodTaskActiExelog2 = prodTaskActiExelogService.getProdTaskActiExelog(prodTaskActiExelog.getId());

			                                                       // 需要传用户名
			                                                       String userName = null;
			                                                       if (getCurrentUser() != null) {
			                                                           userName = getCurrentUser().getName();
			                                                       }
			                                                       if (userName == null) {
			                                                           //userName=prodTask.getOwnerStaff()!=null?prodTask.getOwnerStaff().getUser().getName():null;
			                                                           Long staffId = prodTask.getOwnerStaffId();
			                                                           if (staffId != null) {
			                                                               Staff staff = staffService.get(staffId);
			                                                               userName = staff != null ? staff.getUser().getName() : null;
			                                                           }
			                                                       }
			                                                       interfaceSelfService.addPutinRecordByActiceExelog(prodTaskActiExelog2, false, userName);
			                                                   }

			                                               } else if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
			                                                   if (prodTaskActiExelog != null) {//如果有多次开始信号，只处理第一次
			                                                	   result= true;
			                                                   } else {
			                                                       prodTaskActiExelog = new WOMProdTaskActiExelog();

			                                                       //add 20171113
			                                                       prodTaskActiExelog.setActiveName(prodTaskActive.getName());
			                                                       prodTaskActiExelog.setActiveType(prodTaskActive.getActiveType());//活动类型
			                                                       prodTaskActiExelog.setBatchNum(prodTask.getProductBatchNum());//批号
			                                                       prodTaskActiExelog.setPhaseID(batchPhaseId);//batchPhase
			                                                       prodTaskActiExelog.setDataSource(prodTaskActive.getExeSystem());//数据来源-批控系统
			                                                       prodTaskActiExelog.setDataType(new SystemCode("womDataType/1"));//数据性质-计划内
			                                                       prodTaskActiExelog.setFactoryID(procExeLog.getFactoryID());//工作单元
			                                                       prodTaskActiExelog.setPlanNum(prodTaskActive.getPlanNum());//计划数量
			                                                       prodTaskActiExelog.setProcessExeLog(procExeLog);//工序执行记录
			                                                       prodTaskActiExelog.setProductID(prodTaskActive.getProductId());//物品
			                                                       prodTaskActiExelog.setProductNum("");//物料批号
			                                                       prodTaskActiExelog.setStaffID((Staff) prodTask.getOwnerStaff());//操作人
			                                                       prodTaskActiExelog.setTaskActiveID(prodTaskActive);//工单活动
			                                                       prodTaskActiExelog.setTaskID(prodTask);//工单
			                                                       prodTaskActiExelog.setTaskProcessID(produceTaskProcess);//工单工序
			                                                       prodTaskActiExelog.setCid(prodTask.getCid());

			                                                       prodTaskActiExelog.setStartTime(startTime);//活动开始时间

			                                                       prodTaskActiExelog.setIsFinish(false);//执行结束
			                                                       //prodTaskActiExelog.setState(new SystemCode("womProActiveType/executing"));//执行状态
			                                                       prodTaskActiExelog.setOperartionID(prodTaskActive.getOperartionID());
			                                                       if (prodTaskActive.getActiveId() != null) {
			                                                           prodTaskActiExelog.setIsPassCheck(prodTaskActive.getActiveId().getIsPassCheck());//是否放行检验
			                                                           prodTaskActiExelog.setFinalInspection(prodTaskActive.getActiveId().getFinalInspection());//完工检验
			                                                           prodTaskActiExelog.setFormularActice(prodTaskActive.getActiveId());//配方.活动
			                                                       }
			                                                       prodTaskActiExelog.setActiveSource(prodTaskActive.getActiveSource());//来源
			                                                       prodTaskActiExelog.setTableInfoId(prodTask != null ? prodTask.getTableInfoId() : null);
			                                                       prodTaskActiExelogDao.save(prodTaskActiExelog);

			                                                       //活动正常开始日志
			                                                       logMap = setWorkOrderMqLogMap(true, null, "活动\"" + prodTaskActive.getName() + "\"开始", "activeStatus", di.getId().toString(), "false", prodTaskActive.getName());
			                                                       insertLog(logMap, false);
			                                                   }
			                                               }
			                                               result= true;
			                                           }

			                                       } else {//手动投料
			                                           if (activeIndex == 1) {//手动投配料具体活动记录通过pda录入 //只有手工投配料才可能有一个Phase对应多个活动的情况
			                                               result = startPhaseActiveExeLogManual(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
			                                                       produceTaskProcess, prodTaskActive, false, di.getId().toString(), startTimeLong, endTimeLong);
			                                           }
			                                       }
			                                	//增减活动的索引，避免多次操作phase和日志
			                                    activeIndex++;
			                                   ///////////////////////////////////////////////////////////////////////////////处理投料，投配料活动
			                                }
			                              }
			                          }
			                        } else {
			                            logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchPhaseId);
			                            insertLog(logMap, false);
			                            result = false;
			                        }
			                    }
						} else {
							logMap = setWorkOrderMqLogMap(false, null,"控制配方不是来自MES系统,jsonData:" + data,"activeStatus", di.getId().toString(), "true",batchId);
							insertLog(logMap, false);
							result = false;
						}
			        }
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else {
                isSuccess = dealMqPhaseDateChange(di, false);
            }
            deleteMq(di);
        }       
		return result;
	}
    
	
	/**
	 * 00020004
	 * mq处理phase活动大方法，其中包括：
	 * 开始phase，结束phase，投料投配料活动生成投料单，检验活动生成请检单，修改phase
	 * @param di
	 * @param dealError
	 * @return
	 */
	@Override
	public Boolean mqDealPhaseBoolean(RMMQDealinfo di, Boolean dealError) {
		Boolean result=true;
        log.info("deal mq info start : " + di.getId().toString());
        String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        Boolean isSuccess = false;
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020004")) {
        	//phase层面
        	//只有当数据中包含当前执行状态和之前执行状态，表示执行phase启动停止等操作
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {
            	result = dealMqPhaseDate(di,false);
            } else {
                result = dealMqPhaseDateChange(di, false);
            }
            deleteMq(di);
        } 
        return result;
    }

	
	
	
	/////封装方法/////////////////////////////////////////////////////////////////////////////////////////////////////
    private final static long DIFF_UNIX_WIN_MS = 11644473600000L;
    private final static long MULTIPLE_MS_100NS = 10000;
    private String interfaceURL;
    
    /**
     * 把mq记录的valid改成0,即删除
     */
    @Override
    public void deleteMq(RMMQDealinfo di) {
        String sql = "update rm_mqdealinfos set valid = 0 where id = ?";
        produceTaskDao.createNativeQuery(sql, di.getId()).executeUpdate();
    }
	
    private String getUrl(String systemCodeId) {
        String sql = "select CODE_DESA from " + SystemCode.TABLE_NAME + " where id = ?";
        String url = produceTaskDao.createNativeQuery(sql, systemCodeId).uniqueResult().toString();
        return url;
    }
    
    public Date Filetime2Date(long llt) {
        llt /= MULTIPLE_MS_100NS;
        llt -= DIFF_UNIX_WIN_MS;
        Date date = new Date();
        date.setTime(llt);
        return date;
    }
    
    //组织配方工单日志参数
    @Override
    public List<Map<String, String>> setWorkOrderMqLogMap(Boolean isSuccess, String ids, String returnValue, String operationType, String logids, String isIgnore, String logTypeDes) {
        List<Map<String, String>> maplist = new ArrayList<Map<String, String>>();
        String[] logidarr = null;
        if (null != logids && !"".equals(logids)) {
            logidarr = logids.split(",");
        }
        maplist = new ArrayList<Map<String, String>>();
        Map<String, String> logMap = new HashMap<String, String>();
        logMap.put("logSynFlag", isSuccess.toString());
        logMap.put("logID", logids);
        logMap.put("logType", "workOrder");
        logMap.put("logOperate", operationType);
        logMap.put("logIsIgnore", isIgnore);
        logMap.put("logTypeDes", logTypeDes);
        if (isSuccess) {
            logMap.put("logFault", "success");
        } else {
            logMap.put("logFault", returnValue);
        }
        maplist.add(logMap);
        return maplist;
    }
    
    
    //根据参数插入工单日志
    @Override   
    public void insertLog(List<Map<String, String>> maplist, Boolean dealError) {
        if (!dealError) {//不是错误日志人工处理时才新增记录
            for (Map<String, String> data : maplist) {
                RMInterfaceSyncLog interfaceLog = null;
                String logid = data.get("logid");
                if (null != logid && !"".equals(logid)) {
                    interfaceLog = rmInterFaceSyncLogService.getInterfaceSyncLog(Long.parseLong(logid));
                }
                if (null == interfaceLog) {
                    interfaceLog = new RMInterfaceSyncLog();
                }
                interfaceLog.setLogSynFlag(Boolean.valueOf(data.get("logSynFlag")));//同步状态
                interfaceLog.setLogID(data.get("logID"));//数据Pk值
                interfaceLog.setLogTypeDes(data.get("logTypeDes"));//数据类型描述
                interfaceLog.setLogType(data.get("logType"));//数据类型
                interfaceLog.setLogDate(new Date());
                interfaceLog.setLogOperate((String) data.get("logOperate"));//操作日期
                interfaceLog.setLogFault((String) data.get("logFault"));//错误信息
                if (null != data.get("logIsIgnore")) {//是否忽视
                    interfaceLog.setLogIsIgnore(Boolean.parseBoolean(data.get("logIsIgnore")));
                }
                if (null == getCurrentCompanyId()) {
                    interfaceLog.setCid(Long.parseLong("1000"));
                }
                rmInterFaceSyncLogService.saveLog(interfaceLog);
            }
        }
    }
    
    /**
	 * 放弃和停止的工单，相关未处理的数据和待办处理。
	 * @param prodTask 生产指令单
	 * @param endTimeLong 批次结束时间
	 * @return
	 */
	private void dealErrorBatch(WOMProduceTask prodTask,Long endTimeLong){
		//结束未结束工序执行记录
		List<WOMProdTaskProcExelog> procExeLogs = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("valid", true),
				Restrictions.eq("taskID",prodTask),Restrictions.eq("state",new SystemCode("womProActiveType/executing")));//获取工单活动记录
		if(procExeLogs != null  && procExeLogs.size() > 0){
			for(WOMProdTaskProcExelog procExeLog : procExeLogs){
				procExeLog.setState(new SystemCode("womProActiveType/completed"));
				Date endTime = Filetime2Date(endTimeLong);
				procExeLog.setEndTime(endTime);
				procExeLog.setRemark("指令单作废或中止");
				prodTaskProcExelogDao.save(procExeLog);
			}
		}

		//结束未结束的phase执行记录
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("valid", true),
				Restrictions.eq("isFinish",false),Restrictions.eq("taskID",prodTask));//获取工单活动记录
		if(batchPhaseExelogList != null && batchPhaseExelogList.size() > 0){
			for(WOMBatchPhaseExelog batchPhaseExelog : batchPhaseExelogList){
				batchPhaseExelog.setIsFinish(true);
				Date endTime = Filetime2Date(endTimeLong);
				batchPhaseExelog.setEndTime(endTime);
				batchPhaseExelog.setRemark("指令单作废或中止");
				batchPhaseExelogDao.save(batchPhaseExelog);
			}
		}

		//结束待投料记录（pda投料活动待办）
		List<WOMWaitPutinRecords> waitPutinRecordsList = waitPutinRecordsDao.findByCriteria(Restrictions.eq("isFinish", false),
				Restrictions.eq("valid", true),Restrictions.eq("taskID",prodTask));//获取待投料记录
		if(waitPutinRecordsList != null && waitPutinRecordsList.size() > 0){
			for(WOMWaitPutinRecords waitPutinRecords : waitPutinRecordsList){
				waitPutinRecords.setIsFinish(true);
				waitPutinRecords.setRemark("指令单作废或中止");
				waitPutinRecordsDao.save(waitPutinRecords);
			}
		}

		//状态为待配送，已配送的，状态全部改为已签收
		List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),
				Restrictions.or(Restrictions.eq("state", new SystemCode("womBatPartState/01")),Restrictions.eq("state", new SystemCode("womBatPartState/02"))),
				Restrictions.eq("taskID",prodTask));//获取待投料记录
		if(batchingMaterialPartList != null && batchingMaterialPartList.size() > 0){
			for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList){
				if("womBatPartState/02".equals(batchingMaterialPart.getState().getId()) ){//已配送的记录直接签收
					batchingMaterialPart.setState(new SystemCode("womBatPartState/03"));
					batchingMaterialPart.setRemark("指令单作废或中止");
					batchingMaterialPartDao.save(batchingMaterialPart);
				}else{//待配送的记录直接删除
					batchingMaterialPart.setValid(false);
					batchingMaterialPart.setRemark("指令单作废或中止");
					batchingMaterialPartDao.save(batchingMaterialPart);
					
					//配料指令减少去配料数量
					WOMBatchingMaterial batchingMaterial = batchingMaterialService.getBatchingMaterial(batchingMaterialPart.getHeadId().getId());
					batchingMaterial.setDoneNum(batchingMaterial.getDoneNum().subtract(batchingMaterialPart.getDoneNum()));
					batchingMaterialDao.save(batchingMaterial);
					batchingMaterialDao.flush();
				}
			}
		}

		//状态为编辑状态的配料指令，全部改为生效，且处理相关待办
		List<WOMBatchingMaterial> batchingMaterialList = batchingMaterialDao.findByCriteria(Restrictions.eq("valid", true),
				Restrictions.eq("status", 88),Restrictions.eq("taskID",prodTask));//获取待投料记录
		if(batchingMaterialList != null && batchingMaterialList.size() > 0){
			String tableInfoIds = "";
			for(WOMBatchingMaterial batchingMaterial : batchingMaterialList){
				batchingMaterial.setStatus(99);
				batchingMaterial.setRemark("指令单作废或中止");
				batchingMaterialDao.save(batchingMaterial);

				tableInfoIds += "'" + batchingMaterial.getTableInfoId() + "',";
			}

			if(tableInfoIds.length() > 0) {
				String pendingDelSql = "delete wf_pending where table_info_id in (" + tableInfoIds.substring(0, tableInfoIds.length() - 1) + ")";
				batchingMaterialDao.createNativeQuery(pendingDelSql).executeUpdate();
			}
		}

		//状态为未完成的配料需求，状态全部改完已配送
		List<WOMBatchingMaterialNeed> batchingMaterialNeedList = batchingMaterialNeedDao.findByCriteria(Restrictions.eq("valid", true),
				Restrictions.ne("state", new SystemCode("womNeedState/04")),Restrictions.eq("taskID",prodTask));//获取待投料记录
		if(batchingMaterialNeedList != null && batchingMaterialNeedList.size() > 0){
			for(WOMBatchingMaterialNeed batchingMaterialNeed : batchingMaterialNeedList){
				batchingMaterialNeed.setState(new SystemCode("womNeedState/04"));
				batchingMaterialNeedDao.save(batchingMaterialNeed);
			}
		}

		//如果是提前放料，质量相关待办确实还在执行中；反之，如果是批控直接结束的，就要把待办结束掉
		if(!prodTask.getAdvanceCharge()) {
			//未生效检验单改成生效
			String qcsUpdateSql = "update QUALITYMAN_MANU_CHECKS set status = 99 where PART_CODE = '" + prodTask.getProductBatchNum() + "' and status = 88";
			produceTaskDao.createNativeQuery(qcsUpdateSql).executeUpdate();

			//未生效不良品处理单改成生效
			qcsUpdateSql = "update QUALITYMAN_MANU_DEALS set status = 99 where PART_CODE = '" + prodTask.getProductBatchNum() + "' and status = 88";
			produceTaskDao.createNativeQuery(qcsUpdateSql).executeUpdate();
		}

	}
    //mes工厂模型没有批控生产线关联字段，先查询出所有批控的生产线，再用批控中生产线的id获取工厂的code
    public String getBatchFactoryCode(String batchFactoryId, String interfaceURL) {
        //webservice地址
        String factoryCode = null;
        //interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";
        String geturl = interfaceURL + "factoryModels";
        String refFormula = rmInterFaceSyncLogService.sendSmsGet(geturl);//获取批控所有生产线
        if (refFormula != null && refFormula.length() > 0) {
            log.info(refFormula);
            JSONObject sobj;
            try {//循环验证生产线对应的mes中的工厂
                sobj = new JSONObject(refFormula);
                String resultFlag = sobj.getString("dealSuccessFlag");
                String refFactory = sobj.getString("data");
                if ("true".equals(resultFlag)) {
                    JSONArray sobjarr = new JSONArray(refFactory);
                    if (sobjarr != null) {
                        for (int i = 0; i < sobjarr.length(); i++) {
                            JSONObject cxObj = sobjarr.getJSONObject(i);
                            String cxId = cxObj.getString("ID");//流水线名称，即mes中工厂的code
                            if (cxId != null && batchFactoryId.equals(cxId)) {
                                factoryCode = cxObj.getString("Name");
                                break;
                            }
                            String dyStr = cxObj.toString();
                            if (dyStr != null && dyStr.length() > 0 && dyStr.contains("UnitEquips")) {
                                String refDy = cxObj.getString("UnitEquips");
                                JSONArray dyArr = new JSONArray(refDy);
                                if (dyArr != null) {
                                    for (int j = 0; j < dyArr.length(); j++) {
                                        JSONObject dyObj = dyArr.getJSONObject(j);
                                        String dyId = dyObj.getString("ID");//单元名称，即mes中工厂的code
                                        if (dyId != null && batchFactoryId.equals(dyId)) {
                                            factoryCode = dyObj.getString("Name");
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    return null;
                }
            } catch (JSONException e) {
                log.error(e.getMessage(), e);
                throw new BAPException(e.getMessage(), e);
            }
        } else {
            throw new BAPException("找不到对应工厂模型");
        }

        if (factoryCode != null) {
            return factoryCode;
        } else {
            return null;
        }
    }
    
    
    /**
     * 编辑phase开始活动执行记录，常规、产出、自动投配料使用
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
	private Boolean dealPhaseStartActiveExeLog(Long exeStat, Long exeStatOld,String batchPhaseId, String data, JSONObject phase,WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
			WOMProduceTaskProcess produceTaskProcess,WOMProduceTaskActive prodTaskActive, Boolean dealError,String mqId, Long startTimeLong, Long endTimeLong) {
		List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
		WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao
				.findEntityByCriteria(Restrictions.eq("valid", true),
						Restrictions.eq("phaseID", batchPhaseId),
						Restrictions.eq("taskID", prodTaskActive.getHeadID()));// 根据批控phaseId获取工单活动
		if (startTimeLong != null && startTimeLong.longValue() > 0) {// 开始信号
			WOMBatchPhaseExelog batchPhaseExelogNew = new WOMBatchPhaseExelog();
			if (batchPhaseExelog != null) {
				batchPhaseExelogNew = batchPhaseExelog;
			}
			if (batchPhaseExelogNew.getStartTime() != null) {// 如果有多次开始信号，只处理第一次
				return true;
			} else {
				batchPhaseExelogNew.setAllowPutin(true);// 允许投料
				batchPhaseExelogNew.setBatchNum(prodTask.getProductBatchNum());// 批号
				batchPhaseExelogNew.setExeSystem(new SystemCode("RMsystem/system1"));// 系统
				batchPhaseExelogNew.setFactoryId(procExeLog.getFactoryID());// 工作单元
				if (prodTaskActive.getActiveType() != null && prodTaskActive.getActiveType().getId().equals("activeType/activeType5")) {// 活动类型为检验时,直接结束
					batchPhaseExelogNew.setIsFinish(true);// 执行结束
					Date endTime = Filetime2Date(startTimeLong);
					batchPhaseExelogNew.setEndTime(endTime);
				} else {
					batchPhaseExelogNew.setIsFinish(false);// 执行开始
				}
				batchPhaseExelogNew.setMobileTerminal(false);// 移动端执行
				batchPhaseExelogNew.setPhaseID(batchPhaseId);// 批控phaseId
				batchPhaseExelogNew.setRemark("");// 备注
				Date startTime = Filetime2Date(startTimeLong);
				batchPhaseExelogNew.setStartTime(startTime);

				batchPhaseExelogNew.setTaskID(prodTask);// 指令单
				batchPhaseExelogNew.setTaskProcessID(produceTaskProcess);// 工序
				batchPhaseExelogNew.setOperartionID(prodTaskActive.getOperartionID());
				batchPhaseExelogDao.save(batchPhaseExelogNew);
			}
		}
		return true;
	}
    
    
    
    /**
     * 编辑phase结束活动执行记录，常规、产出、自动投配料使用
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
	private Boolean dealPhaseEndActiveExeLog(Long exeStat, Long exeStatOld,String batchPhaseId, String data, JSONObject phase,WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
			WOMProduceTaskProcess produceTaskProcess,WOMProduceTaskActive prodTaskActive, Boolean dealError,String mqId, Long startTimeLong, Long endTimeLong) {
					List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
                  WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
                          Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
                  if (endTimeLong != null && endTimeLong.longValue() > 0) {//完成信号
                      if (batchPhaseExelog != null) {
                          if (batchPhaseExelog.getEndTime() != null) {//如果有多次结束信号，只处理第一次
                              return true;
                          } else {
                              Date endTime = Filetime2Date(endTimeLong);
                              batchPhaseExelog.setEndTime(endTime);
                              batchPhaseExelog.setIsFinish(true);//执行结束
                              batchPhaseExelogDao.save(batchPhaseExelog);
                          }
                      } else if (prodTaskActive.getActiveType() != null && !"activeType/activeType5".equals(prodTaskActive.getActiveType().getId()) ) {
                    	  //完工检验由检验模块结束
                          WOMBatchPhaseExelog batchPhaseExelogNew = new WOMBatchPhaseExelog();
                          if (batchPhaseExelog != null) {
                              batchPhaseExelogNew = batchPhaseExelog;
                          }
                          batchPhaseExelogNew.setAllowPutin(true);//允许投料
                          batchPhaseExelogNew.setBatchNum(prodTask.getProductBatchNum());//批号
                          batchPhaseExelogNew.setExeSystem(new SystemCode("RMsystem/system1"));//系统
                          batchPhaseExelogNew.setFactoryId(procExeLog.getFactoryID());//工作单元
                          batchPhaseExelogNew.setIsFinish(false);//执行开始
                          batchPhaseExelogNew.setMobileTerminal(false);//移动端执行
                          batchPhaseExelogNew.setPhaseID(batchPhaseId);//批控phaseId
                          batchPhaseExelogNew.setRemark("");//备注
                          batchPhaseExelogNew.setTaskID(prodTask);//指令单
                          batchPhaseExelogNew.setTaskProcessID(produceTaskProcess);//工序
                          batchPhaseExelogNew.setOperartionID(prodTaskActive.getOperartionID());
                          batchPhaseExelogDao.save(batchPhaseExelogNew);
                      }
                  } 
                  return true;
			}
	
	
	
	   /**
     * Phase开始生成活动执行记录
     * 编辑指令单活动执行记录，常规、产出、自动投配料使用
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
	private Boolean dealStartPtActiveExeLog(Long exeStat, Long exeStatOld,
			String batchPhaseId, String data, JSONObject phase,
			WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
			WOMProduceTaskProcess produceTaskProcess,
			WOMProduceTaskActive prodTaskActive, Boolean dealError,
			String mqId, Long startTimeLong, Long endTimeLong){
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();

        WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
                Restrictions.eq("phaseID", batchPhaseId), Restrictions.eq("taskActiveID", prodTaskActive));//根据批控phaseId获取工单活动
        if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
            if (prodTaskActiExelog != null) {//如果有多次开始信号，只处理第一次
                return true;
            } else {
                prodTaskActiExelog = new WOMProdTaskActiExelog();

                //add 20171113
                prodTaskActiExelog.setActiveName(prodTaskActive.getName());
                //检验的时候，设置活动与批状态为生产待检  add 20171113
                if (prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {
                    prodTaskActiExelog.setActiveBatchStateID(actBatStateService.getActBatState(1000L));
                }

                prodTaskActiExelog.setActiveType(prodTaskActive.getActiveType());//活动类型
                prodTaskActiExelog.setBatchNum(prodTask.getProductBatchNum());//批号
                prodTaskActiExelog.setPhaseID(batchPhaseId);//batchPhase
                prodTaskActiExelog.setDataSource(prodTaskActive.getExeSystem());//数据来源-批控系统
                prodTaskActiExelog.setDataType(new SystemCode("womDataType/1"));//数据性质-计划内
                prodTaskActiExelog.setFactoryID(procExeLog.getFactoryID());//工作单元
                prodTaskActiExelog.setPlanNum(prodTaskActive.getPlanNum());//计划数量
                prodTaskActiExelog.setProcessExeLog(procExeLog);//工序执行记录
                prodTaskActiExelog.setProductID(prodTaskActive.getProductId());//物品
                prodTaskActiExelog.setProductNum("");//物料批号
                prodTaskActiExelog.setStaffID((Staff) prodTask.getOwnerStaff());//操作人
                prodTaskActiExelog.setTaskActiveID(prodTaskActive);//工单活动
                prodTaskActiExelog.setTaskID(prodTask);//工单
                prodTaskActiExelog.setTaskProcessID(produceTaskProcess);//工单工序
                prodTaskActiExelog.setCid(prodTask.getCid());

                Date startTime = Filetime2Date(startTimeLong);
                prodTaskActiExelog.setStartTime(startTime);//活动开始时间

                prodTaskActiExelog.setIsFinish(false);//执行结束
                //prodTaskActiExelog.setState(new SystemCode("womProActiveType/executing"));//执行状态
                prodTaskActiExelog.setOperartionID(prodTaskActive.getOperartionID());
                if (prodTaskActive.getActiveId() != null) {
                    prodTaskActiExelog.setIsPassCheck(prodTaskActive.getActiveId().getIsPassCheck());//是否放行检验
                    prodTaskActiExelog.setFinalInspection(prodTaskActive.getActiveId().getFinalInspection());//完工检验
                    prodTaskActiExelog.setFormularActice(prodTaskActive.getActiveId());//配方.活动
                }
                prodTaskActiExelog.setActiveSource(prodTaskActive.getActiveSource());//来源
                prodTaskActiExelog.setTableInfoId(prodTask != null ? prodTask.getTableInfoId() : null);
                prodTaskActiExelogDao.save(prodTaskActiExelog);

                //活动正常开始日志
                logMap = setWorkOrderMqLogMap(true, null, "活动\"" + prodTaskActive.getName() + "\"开始", "activeStatus", mqId, "false", prodTaskActive.getName());
                insertLog(logMap, dealError);
            }
        }
        return true;
    } 
    
    /**
     * Phase结束更新活动执行记录
     * 编辑指令单活动执行记录，常规、产出、自动投配料使用
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
	private Boolean dealEndPtActiveExeLog(Long exeStat, Long exeStatOld,
			String batchPhaseId, String data, JSONObject phase,
			WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
			WOMProduceTaskProcess produceTaskProcess,
			WOMProduceTaskActive prodTaskActive, Boolean dealError,
			String mqId, Long startTimeLong, Long endTimeLong){
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();

        WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
                Restrictions.eq("phaseID", batchPhaseId), Restrictions.eq("taskActiveID", prodTaskActive));//根据批控phaseId获取工单活动

        if (endTimeLong != null && endTimeLong.longValue() > 0) {//完成信号

            String matFbValStr = null;
            if (prodTaskActiExelog != null) {
                if (prodTaskActiExelog.getEndTime() != null) {//如果有多次结束信号，只处理第一次
                    return true;
                } else {
                    try {
                        Date endTime = Filetime2Date(endTimeLong);
                        prodTaskActiExelog.setEndTime(endTime);
                        if (phase.toString().contains("MatFbVal")) {
                            matFbValStr = phase.getString("MatFbVal");
                            if (matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//如果matFbValStr有值，即总量模式
                                Double matFbVal = Double.valueOf(matFbValStr);
                                BigDecimal actualNum = new BigDecimal(matFbVal);
                                prodTaskActiExelog.setActualNum(actualNum.divide(new BigDecimal(1000)));//实际投料数量 / 1000 - edited by oneway 2018.7.13
                            }
                        }
                    } catch (JSONException e) {
                        log.error(e.getMessage(), e);
                    }
                    prodTaskActiExelog.setIsFinish(true);
                    //prodTaskActiExelog.setState(new SystemCode("womProActiveType/completed"));//执行状态
                    prodTaskActiExelogDao.save(prodTaskActiExelog);

                    //正常结束活动
                    logMap = setWorkOrderMqLogMap(true, null, "活动\"" + prodTaskActive.getName() + "\"结束", "activeStatus", mqId, "false", prodTaskActive.getName());
                    insertLog(logMap, dealError);


                }
            } else {//activeType/activeType5 检验
                if (prodTaskActive.getActiveType() != null && !"activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {
                    prodTaskActiExelog = new WOMProdTaskActiExelog();
                    prodTaskActiExelog.setActiveType(prodTaskActive.getActiveType());//活动类型
                    prodTaskActiExelog.setBatchNum(prodTask.getProductBatchNum());//批号
                    prodTaskActiExelog.setPhaseID(batchPhaseId);//batchPhase
                    prodTaskActiExelog.setDataSource(prodTaskActive.getExeSystem());//数据来源-批控系统
                    prodTaskActiExelog.setDataType(new SystemCode("womDataType/1"));//数据性质-计划内
                    prodTaskActiExelog.setFactoryID(procExeLog.getFactoryID());//工作单元
                    prodTaskActiExelog.setPlanNum(prodTaskActive.getPlanNum());//计划数量
                    prodTaskActiExelog.setProcessExeLog(procExeLog);//工序执行记录
                    prodTaskActiExelog.setProductID(prodTaskActive.getProductId());//物品
                    prodTaskActiExelog.setProductNum("");//物料批号
                    prodTaskActiExelog.setStaffID((Staff) prodTask.getOwnerStaff());//操作人
                    prodTaskActiExelog.setTaskActiveID(prodTaskActive);//工单活动
                    prodTaskActiExelog.setTaskID(prodTask);//工单
                    prodTaskActiExelog.setTaskProcessID(produceTaskProcess);//工单工序
                    prodTaskActiExelog.setCid(prodTask.getCid());
                    prodTaskActiExelog.setOperartionID(prodTaskActive.getOperartionID());//批控operationId
                    if (prodTaskActive.getActiveId() != null) {
                        prodTaskActiExelog.setIsPassCheck(prodTaskActive.getActiveId().getIsPassCheck());//是否放行检验
                        prodTaskActiExelog.setFinalInspection(prodTaskActive.getActiveId().getFinalInspection());//完工检验
                        prodTaskActiExelog.setFormularActice(prodTaskActive.getActiveId());//配方.活动
                    }
                    prodTaskActiExelog.setActiveSource(prodTaskActive.getActiveSource());//来源

                    try {
                        Date endTime = Filetime2Date(endTimeLong);
                        prodTaskActiExelog.setEndTime(endTime);
                        if (phase.toString().contains("MatFbVal")) {
                            matFbValStr = phase.getString("MatFbVal");
                            if (matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//如果matFbValStr有值，即总量模式
                                Double matFbVal = Double.valueOf(matFbValStr);
                                BigDecimal actualNum = new BigDecimal(matFbVal);
                                prodTaskActiExelog.setActualNum(actualNum.divide(new BigDecimal(1000)));//实际投料数量 / 1000 - edited by oneway 2018.7.13
                            }
                        }
                    } catch (JSONException e) {
                        log.error(e.getMessage(), e);
                    }
                    prodTaskActiExelog.setIsFinish(true);//是否结束
                    prodTaskActiExelogDao.save(prodTaskActiExelog);
                    logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "活动\"" + prodTaskActive.getName() + "\"异常结束,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                    insertLog(logMap, dealError);
                    return true;
                }
            }


            boolean allowNewPutinRecord = false;//是否生成投料记录  activeType3:投料
            if (prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType3") && prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto() &&
                    matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//自动投料活动需要生成投料清单
                allowNewPutinRecord = true;
            } else if (prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType4")  //activeType4:投配料
                    && prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto()) {//自动投配料先查询一下是否有对应的配料记录
                List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),
                        Restrictions.eq("phaseID", batchPhaseId));//通过phsae查询配料指令明细
                if (batchingMaterialPartList != null && batchingMaterialPartList.size() > 0) {
                    allowNewPutinRecord = true;
                } else {
                    logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "查询不到对应该活动的配料记录,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                    insertLog(logMap, dealError);
                    return false;
                }
            }
        }
        return true;
    } 
    
	

    
    
    public Boolean dealMqPhaseDateChange(RMMQDealinfo di, Boolean dealError) {
        Boolean result = true;
        String data = di.getMqValue().substring(8, di.getMqValue().length());
        if (null == data || "".equals(data)) {
            return false;
        }
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        try {
            JSONObject phase = new JSONObject(data);
            if (phase != null) {
                String batchId = phase.getString("BatchID");
                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId), Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
                if (prodTask != null) {
                    if (prodTask.getStatus() == 88) {//单据未生效时，正常修改
                        result = realPhaseUpdate(phase, prodTask);
                        updateSumNoBatch(prodTask);//更新用料汇总
                        if (result) {
                            logMap = setWorkOrderMqLogMap(true, null, "更新成功", "produceTaskSyn", di.getId().toString(), "false", prodTask.getProductBatchNum());
                            insertLog(logMap, false);
                        }
                    } else {//单据生效时
                        logMap = setWorkOrderMqLogMap(false, null, "工单已生效，不接受批控修改", "produceTaskSyn", di.getId().toString(), "true", prodTask.getProductBatchNum());
                        insertLog(logMap, false);
                        result = false;
                    }
                } else {//如通过批次工单id查不到对应工单
                    logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "produceTaskSyn", di.getId().toString(), "true", batchId);
                    insertLog(logMap, false);
                    result = false;
                }
            }
        } catch (JSONException e) {
            log.error(e.getMessage(), e);
        }
        return result;
    }
    
    
    private Boolean realPhaseUpdate(JSONObject phase, WOMProduceTask prodTask) {
        Boolean result = true;
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        try {
            String batchPhaseId = phase.getString("ID");//phaseId,即指令单活动中的batchPhaseID
            List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headID", prodTask),
                    Restrictions.eq("batchPhaseID", batchPhaseId));//根据批控phaseId获取工单活动
            if (prodTaskActives != null && prodTaskActives.size() > 0) {
                for (WOMProduceTaskActive prodTaskActive : prodTaskActives) {
                    if (prodTaskActive.getActiveType() != null && prodTaskActive.getActiveType().getId().equals("activeType/activeType3")
                            && prodTaskActive.getActiveId().getAuto()) {//只有自动投料的活动，才可以接受批控的修改
                        //投料物品不能修改
						/*String productCode = phaseObj.getString("MatSN");//原料编码，即物料code
						if(productCode != null && productCode.length() > 0){
							MESBasicProduct product = basicProductService.findEntityByProperty("productCode", productCode);
							if(product != null){
								prodTaskActive.setProductId(product);
							}else{
								logMap = setWorkOrderMqLogMap(false,null,"根据物品编码:" + productCode + "查询不到对应物品,jsonData:" + batch,"produceTaskSyn",null,"true",productCode);
								insertLog(logMap, false);
								result = false;
							}
						}*/
                        String matStValStr = phase.getString("MatStVal");//原料设定值，工单活动planNum
                        if (matStValStr != null && isNumeric(matStValStr)) {
                            BigDecimal matStVal = BigDecimal.valueOf(Double.valueOf(matStValStr));
                            BigDecimal planNum = matStVal.multiply(prodTask.getProductNum());
                            prodTaskActive.setPlanNum(planNum);
                        }
                        String name = phase.getString("Name");//phase名称，工单活动planNum
                        if (name != null && name.length() > 0) {
                            prodTaskActive.setName(name);
                        }
                        String remark = phase.getString("Remark");//phase备注，工单活动Remark
                        if (remark != null && remark.length() > 0) {
                            prodTaskActive.setRemark(remark);
                        }
                        produceTaskActiveDao.save(prodTaskActive);
                    }
                }
            } else {
                logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + phase.toString(), "produceTaskSyn", null, "true", batchPhaseId);
                insertLog(logMap, false);
                result = false;
            }
        } catch (JSONException e) {
            log.error(e.getMessage(), e);
            result = false;
        }
        return result;
    }
    
    //当未启用物品批号时，更新汇总信息
    private void updateSumNoBatch(WOMProduceTask produceTask) {
        //如果未启用批号
        List<WOMProduceMaterialSum> sums = produceMaterialSumService.getProduceMaterialSums("headId=" + produceTask.getId(), null);
        for (WOMProduceMaterialSum sum : sums) {
            StringBuilder sBuilder = new StringBuilder();
            sBuilder.append(" ( activeType='activeType/activeType2' or  activeType='activeType/activeType3' or activeType='activeType/activeType6' ) and headId=").append(produceTask.getId()).append(" and productId=").append(sum.getProductId().getId());
            List<WOMProduceTaskActive> ectActives = produceTaskActiveService.getProduceTaskActives
                    (sBuilder.toString(), null);
            BigDecimal addNum = new BigDecimal("0");
            for (WOMProduceTaskActive a : ectActives) {
                BigDecimal oneNum = a.getPlanNum();
                if(oneNum != null){
                	addNum = addNum.add(oneNum);
                }
            }
            sum.setPlanNum(addNum);
            produceMaterialSumDao.save(sum);
            produceTaskActiveDao.flush();
            produceTaskActiveDao.clear();
        }
    }
    
    
    
    /**
     * 开始手工活动
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
    private Boolean startPhaseActiveExeLogManual(Long exeStat, Long exeStatOld, String batchPhaseId, String data, JSONObject phase, WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
                                                 WOMProduceTaskProcess produceTaskProcess, WOMProduceTaskActive prodTaskActive, Boolean dealError, String mqId, Long startTimeLong, Long endTimeLong) {
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        WOMBatchPhaseExelog batchPhaseExelogOld = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
                Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
		/*if(exeStat != null && exeStat.intValue() == -1 && batchPhaseExelogOld != null){
			logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "查询到对应工单工序活动phase执行记录已开始，无法继续开始,jsonData:" + data,"activeStatus",null,"true",batchPhaseId);
			insertLog(logMap, dealError);
			return false;
		}*/

		/*Long startTimeLong = null;
		try {
			startTimeLong = phase.getLong("StartTime");
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
		}	*/

        Boolean result = true;
        if (endTimeLong != null && endTimeLong.longValue() > 0) {//完成信号
            return true;
        } else if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
            WOMBatchPhaseExelog batchPhaseExelog = new WOMBatchPhaseExelog();
            if (batchPhaseExelogOld != null) {
                batchPhaseExelog = batchPhaseExelogOld;
            }
            if (batchPhaseExelog.getStartTime() != null && dealError != null && !dealError) {
                return true;
            } else {
                batchPhaseExelog.setBatchNum(prodTask.getProductBatchNum());//批号
                batchPhaseExelog.setExeSystem(new SystemCode("RMsystem/system1"));//系统
                batchPhaseExelog.setFactoryId(procExeLog.getFactoryID());//工作单元
                batchPhaseExelog.setIsFinish(false);//执行结束
                batchPhaseExelog.setMobileTerminal(true);//移动端执行
                batchPhaseExelog.setPhaseID(batchPhaseId);//批控phaseId
                batchPhaseExelog.setRemark("");//备注
                Date startTime = Filetime2Date(startTimeLong);
                batchPhaseExelog.setStartTime(startTime);
                batchPhaseExelog.setTaskID(prodTask);//指令单
                batchPhaseExelog.setTaskProcessID(produceTaskProcess);//工序
                batchPhaseExelog.setOperartionID(prodTaskActive.getOperartionID());

                //先查询投料需求确定是否允许投料
                Boolean allowPutin = true;
                if (prodTaskActive.getActiveType().getId().equals("activeType/activeType4")) {
                    List<WOMBatchingMaterialNeed> batchingMaterialNeedList = batchingMaterialNeedDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
                            Restrictions.eq("phaseID", batchPhaseId));
                    if (batchingMaterialNeedList != null && batchingMaterialNeedList.size() > 0) {//如果有备料需求，手工投料和手工投配料都要检查
                        for (WOMBatchingMaterialNeed batchingMaterialNeed : batchingMaterialNeedList) {
                            if (batchingMaterialNeed.getState() != null && batchingMaterialNeed.getState().getId().equals("womNeedState/01")) {
                                allowPutin = false;//只要有一条备料没有完成就不允许投料
                                logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "对应的配料需求记录未结束,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                                insertLog(logMap, dealError);
                                result = false;
                                break;
                            }
                        }
                        batchPhaseExelog.setAllowPutin(allowPutin);//允许投料
                    } else {
                        allowPutin = false;
                        batchPhaseExelog.setAllowPutin(allowPutin);//是否允许投料
                        logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "查询不到对应配料需求记录,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                        insertLog(logMap, dealError);
                        result = false;
                    }
                } else if (prodTaskActive.getActiveType().getId().equals("activeType/activeType3")) {//手工投料不一定需要备料需求
                    batchPhaseExelog.setAllowPutin(allowPutin);//是否允许投料
                }
                batchPhaseExelogDao.save(batchPhaseExelog);

                Long staffId = prodTask.getOwnerStaffId();
                Staff staff = null;
                if (staffId != null) {
                    staff = staffService.get(staffId);
                }
                if (allowPutin && prodTaskActive.getActiveType().getId().equals("activeType/activeType4")) {//如果允许投料，手工投配料从配料清单表中组织待投料记录
                    List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),
                            Restrictions.eq("taskID", prodTaskActive.getHeadID()), Restrictions.eq("phaseID", batchPhaseId),
                            Restrictions.or(Restrictions.eq("state", new SystemCode("womBatPartState/02")), Restrictions.eq("state", new SystemCode("womBatPartState/03"))));//通过phsae查询配料指令明细,已配送和已送达的
                    if (batchingMaterialPartList != null && batchingMaterialPartList.size() > 0) {
                        for (WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList) {//有几条配料指令明细就查几条待投料记录
                            WOMWaitPutinRecords waitPutinRecords = new WOMWaitPutinRecords();
                            waitPutinRecords.setActOrder(batchingMaterialPart.getActOrder());//投料顺序

                            waitPutinRecords.setActTime(startTime);//操作时间

                            waitPutinRecords.setActiveType(prodTaskActive.getActiveType());//活动类型
                            waitPutinRecords.setBatchMaterialID(batchingMaterialPart);//配料明细
                            waitPutinRecords.setBatchNum(prodTask.getProductBatchNum());//生产批号
                            waitPutinRecords.setIsFinish(false);//是否结束
                            //waitPutinRecords.setLableCode(null);//标号标签
                            waitPutinRecords.setLableCode(batchingMaterialPart.getLableCode());
                            waitPutinRecords.setMaterialNum(batchingMaterialPart.getDoneNum());//物料数量
                            waitPutinRecords.setProductID(batchingMaterialPart.getProductId());//物料
                            waitPutinRecords.setPhaseID(batchPhaseId);//phaseId
                            waitPutinRecords.setProductNum(batchingMaterialPart.getBatchNum());//物料批号
                            //waitPutinRecords.setRemark("");//备注
                            //waitPutinRecords.setScanMaterial(null);//扫码投料
                            waitPutinRecords.setStaffID(staff);//操作人
                            waitPutinRecords.setTaskActiveID(prodTaskActive);
                            waitPutinRecords.setTaskID(prodTask);
                            waitPutinRecords.setTaskProcessID(produceTaskProcess);
                            waitPutinRecords.setActiveSource(prodTaskActive.getActiveSource());//来源
                            waitPutinRecords.setCid(getCurrentCompany() != null ? getCurrentCompany().getId() : prodTask.getCid());
                            waitPutinRecords.setTableInfoId(prodTask != null ? prodTask.getTableInfoId() : null);
                            waitPutinRecordsDao.save(waitPutinRecords);
                        }
                    } else {
                        logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "查询不到对应配料指令明细记录,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                        insertLog(logMap, dealError);
                        result = false;
                    }
                } else if (allowPutin && prodTaskActive.getActiveType().getId().equals("activeType/activeType3")) {//如果手工投料，从工单工序活动表中组织待投料记录
                    List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headID", prodTask),
                            Restrictions.eq("batchPhaseID", batchPhaseId));//通过phsae查询工单工序活动
                    if (produceTaskActiveList != null && produceTaskActiveList.size() > 0) {
                        for (WOMProduceTaskActive active : produceTaskActiveList) {
                            if (active.getActiveType().getId().equals("activeType/activeType3")) {
                                WOMWaitPutinRecords waitPutinRecords = new WOMWaitPutinRecords();
                                waitPutinRecords.setActOrder(active.getActOrder());//投料顺序
                                waitPutinRecords.setActTime(startTime);//操作时间
                                waitPutinRecords.setActiveType(prodTaskActive.getActiveType());//活动类型
                                waitPutinRecords.setBatchNum(prodTask.getProductBatchNum());//生产批号
                                waitPutinRecords.setIsFinish(false);//是否结束
                                //waitPutinRecords.setLableCode(null);//标号标签
                                waitPutinRecords.setLableCode(active.getId().toString());//标号标签
                                waitPutinRecords.setMaterialNum(active.getPlanNum());//物料数量
                                waitPutinRecords.setProductID(active.getProductId());//物料
                                waitPutinRecords.setPhaseID(batchPhaseId);//phaseId

                                waitPutinRecords.setStaffID(staff);//操作人
                                waitPutinRecords.setTaskActiveID(active);
                                waitPutinRecords.setTaskID(prodTask);
                                waitPutinRecords.setTaskProcessID(produceTaskProcess);
                                waitPutinRecords.setActiveSource(prodTaskActive.getActiveSource());//来源
                                waitPutinRecords.setCid(getCurrentCompany() != null ? getCurrentCompany().getId() : prodTask.getCid());
                                waitPutinRecords.setTableInfoId(prodTask != null ? prodTask.getTableInfoId() : null);
                                waitPutinRecordsDao.save(waitPutinRecords);

                            }
                        }
                    } else {
                        logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "查询不到对应工单活动,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                        insertLog(logMap, dealError);
                        result = false;
                    }
                }

                //活动正常开始日志
                logMap = setWorkOrderMqLogMap(true, null, "活动\"" + prodTaskActive.getName() + "\"开始", "activeStatus", mqId, "false", prodTaskActive.getName());
                insertLog(logMap, dealError);
            }
        }
        return result;
    }
    
	/**
	 * mq结束Operation活动
	 * 及00020005，00020006，00020007
	 * @return
	 */
	@Override
	public Boolean mqEndOperationBoolean(RMMQDealinfo di, Boolean result) {
         result = true;
        deleteMq(di);
        return result;
    }
	
	
	/**
	 * 如果有设备编码，则修改相关数据的设备
	 */
	@Override
	public Boolean updateEquipment(RMMQDealinfo di, Boolean dealError) {
        String data = di.getMqValue().substring(8, di.getMqValue().length());
        if (null == data || "".equals(data)) {
            return false;
        }
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        try {
            JSONObject unit = new JSONObject(data);
            if (unit != null) {
                String batchId = unit.getString("BatchID");

                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
                        Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
                if (prodTask != null) {
                    String batchUnitId = unit.getString("ID");//phase关联unitId
                    String unitEquipID = null;//对应设备
                    try {
                        unitEquipID = unit.getString("UnitEquipID");
                    } catch (JSONException e) {
                        log.error(e.getMessage(), e);
                    }
                    //00020002信号传设备id过来时，工序记录，phase记录，活动记录，只要是有的，都给重新塞一下值
                    if (unitEquipID != null && unitEquipID.length() > 0 && !"-1".equals(unitEquipID)) {


                        prodTaskProcExelogDao.flush();
                        prodTaskProcExelogDao.clear();
                        WOMProdTaskProcExelog procExeLogNew = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
                                Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
                        MESBasicFactoryModel factoryModel = null;

                        if (procExeLogNew != null) {
                            interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) != null && getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length() > 0 ?
                                    "http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/" : "http://localhost:8081/";
                            String equipCode = getBatchFactoryCode(unitEquipID, interfaceURL);

                            if (equipCode != null && equipCode.length() > 0) {
                                //factoryModel = factoryModelService.findEntityByProperty("code", equipCode);
                                List<Object> params = new ArrayList<Object>();
                                params.add(equipCode);
                                //List<MESBasicFactoryModel>  factoryModels = factoryModelService.getFactoryModels("this_.CODE = ? and this_.valid=1", params);
                                List<MESBasicFactoryModel> factoryModels = factoryModelService.getFactoryModels("this_.NODENAME = ? and this_.valid=1", params);

                                factoryModel = factoryModels.get(0);
                                if (factoryModel != null) {
                                    procExeLogNew.setFactoryID(factoryModel);


                                } else {
                                    procExeLogNew.setFactoryID(prodTask.getFactoryId());//工作单元
                                }
                            }

                            prodTaskProcExelogDao.save(procExeLogNew);
                        }

                        if (factoryModel != null && procExeLogNew != null) {
                            prodTaskProcExelogDao.flush();
                            prodTaskProcExelogDao.clear();
                            WOMProdTaskProcExelog procExeLog = prodTaskProcExelogService.getProdTaskProcExelog(procExeLogNew.getId());
                            List<WOMProdTaskActiExelog> activesExelogs = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("processExeLog", procExeLogNew));
                            if (activesExelogs != null && activesExelogs.size() > 0) {
                                for (WOMProdTaskActiExelog activeExelog : activesExelogs) {
                                    activeExelog.setFactoryID(factoryModel);
                                    prodTaskActiExelogDao.save(activeExelog);
                                    prodTaskActiExelogDao.flush();
                                    prodTaskActiExelogDao.clear();
                                }
                            }

                            List<WOMBatchPhaseExelog> phaseExelogs = batchPhaseExelogDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskProcessID", procExeLogNew.getTaskProcessID()));
                            if (phaseExelogs != null && phaseExelogs.size() > 0) {
                                for (WOMBatchPhaseExelog phaseExelog : phaseExelogs) {
                                    phaseExelog.setFactoryId(factoryModel);
                                    batchPhaseExelogDao.save(phaseExelog);
                                    batchPhaseExelogDao.flush();
                                    batchPhaseExelogDao.clear();
                                }
                            }
                        }
                    }
                }
            }
        } catch (JSONException e) {
            log.error(e.getMessage(), e);
        }
        return true;
	}

	///
    public Boolean dealMqPhaseDate(RMMQDealinfo di, Boolean dealError) {
        Boolean result = true;
        String data = di.getMqValue().substring(8, di.getMqValue().length());
        if (null == data || "".equals(data)) {
            return false;
        }
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        try {
            JSONObject phase = new JSONObject(data);
            if (phase != null) {
                String batchId = phase.getString("BatchID");
                //根据批控工单Id获取工单
                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),Restrictions.eq("interfaceUrl", di.getOrigin()));
                if (prodTask != null) {
                    Long startTimeLong = null;
                    Long endTimeLong = null;
                    Date startTime = null;
                    try {
                        startTimeLong = phase.getLong("StartTime");
                        startTime = Filetime2Date(startTimeLong);
                        endTimeLong = phase.getLong("EndTime");
                    } catch (JSONException e) {
                        log.error(e.getMessage(), e);
                    }

                    if (prodTask.getTaskState() != null && "womTaskState/01".equals(prodTask.getTaskState().getId())) {
                        prodTask.setTaskState(new SystemCode("womTaskState/02"));//先修改工单状态为执行
                        prodTask.setBatchTaskState(new SystemCode("womBatchTaskState/02"));//修改工单批控状态为执行
                        prodTask.setActStartTime(startTime);//修改工单开始执行时间
                        produceTaskDao.save(prodTask);
                        logMap = setWorkOrderMqLogMap(true, null, "工单执行状态修改成功", "batchStatus", di.getId().toString(), "false", prodTask.getProductBatchNum());
                        insertLog(logMap, dealError);
                    }


                    String batchUnitId = phase.getString("UnitID");
                    WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headId", prodTask),
                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动
                    //WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTask),
                    //		Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录
                    WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
                    if (procExeLog == null) {//如果phase开始信号，先于Unit 开始信号，先新建一条只有unitID的数据，给活动执行记录关联

                        WOMProdTaskProcExelog procExeLogNew = new WOMProdTaskProcExelog();

                        //phase开始即工单和工序开始 start
                        procExeLogNew.setStartTime(startTime);//开始时间
                        procExeLogNew.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中
                        //phase开始即工单和工序开始end


                        procExeLogNew.setBatchUnitID(batchUnitId);//批控unitID
                        procExeLogNew.setTaskID(prodTask);//工单
                        prodTaskProcExelogDao.save(procExeLogNew);
                        prodTaskProcExelogDao.flush();
                        prodTaskProcExelogDao.clear();
                        procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
                                Restrictions.eq("batchUnitID", batchUnitId));
                    } else {
                    	if(procExeLog.getStartTime() == null){
                    		procExeLog.setStartTime(startTime);//开始时间
                    		procExeLog.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中
                    	}
                        procExeLog.setBatchUnitID(batchUnitId);//批控unitID
                        procExeLog.setTaskID(prodTask);//工单
                        prodTaskProcExelogDao.save(procExeLog);
                        prodTaskProcExelogDao.flush();
                        prodTaskProcExelogDao.clear();
                        procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
                                Restrictions.eq("batchUnitID", batchUnitId));
                    }
                    if (produceTaskProcess == null) {
                        logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchUnitId);
                        insertLog(logMap, dealError);
                        result = false;
                    } else {


                        String batchPhaseId = phase.getString("ID");
                        int activeIndex = 1;//一个phase对应多个活动的，只需要在操作第一个活动的时候启停phase即可
                        List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headID", prodTask),
                                Restrictions.eq("batchPhaseID", batchPhaseId));//根据批控phaseId获取工单活动
                        if (prodTaskActives != null && prodTaskActives.size() > 0) {
                            Long exeStat = phase.getLong("ExeStat");
                            Long exeStatOld = phase.getLong("ExeStatOld");


                            if (startTimeLong != null && startTimeLong.longValue() > 0) {//第一个Phase开始信号过来的时候吗，才开始工序
                                //如果工序执行状态为空，开始工序执行状态
                                if (procExeLog.getState() != null) {

                                } else {
                                    procExeLog.setState(new SystemCode("womProActiveType/executing"));
                                    prodTaskProcExelogDao.save(procExeLog);
                                    prodTaskProcExelogDao.flush();
                                    prodTaskActiExelogDao.clear();
                                    procExeLog = prodTaskProcExelogDao.load(procExeLog.getId());
                                }
                            }

                            for (WOMProduceTaskActive prodTaskActive : prodTaskActives) {
                                if (prodTaskActive.getActiveType() != null && !prodTaskActive.getActiveType().getId().equals("activeType/activeType2")) {//配料不处理
                                    //result = dealSinglePhase(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError, activeIndex, di.getId().toString(), startTimeLong, endTimeLong);//处理活动


									/*if(result && activeIndex ==1 ){//如果操作成功增加成功的日志
										//更新日志
										if(exeStat != null && exeStat.intValue() == 1 && exeStatOld != null && exeStatOld.intValue() == 0){
											logMap = setWorkOrderMqLogMap(true,null,"活动\"" + prodTaskActive.getName() + "\"开始","activeStatus",di.getId().toString(),"false",prodTaskActive.getName());
										}else if(exeStat != null && exeStat.intValue() == 8 && exeStatOld != null && exeStatOld.intValue() == 8){
											logMap = setWorkOrderMqLogMap(true,null,"活动\"" + prodTaskActive.getName() + "\"结束","activeStatus",di.getId().toString(),"false",prodTaskActive.getName());
										}
										insertLog(logMap, dealError);
									}*/
                                	
                                	
                                	
                                	
                                	//处理单个phase活动
                                	String mqId=di.getId().toString();
                                    if (prodTaskActive.getActiveType() != null && "activeType/activeType1".equals(prodTaskActive.getActiveType().getId())) {//常规
                                        //先编辑phase执行记录表里查数据
                                        result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
                                        if (result) {
                                            //再编辑指令活动记录表
                                            result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                    produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
                                        }
                                    } else if (prodTaskActive.getActiveType() != null && "activeType/activeType2".equals(prodTaskActive.getActiveType().getId())) {//配料
                                        //目前不会有配料活动
                                    } else if (prodTaskActive.getActiveType() != null && "activeType/activeType3".equals(prodTaskActive.getActiveType().getId())) {//投料
                                        if (prodTaskActive.getActiveId().getAuto()) {//自动投料
                                            //先编辑phase执行记录表里查数据
                                            result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                    produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
                                            if (result) {
                                                //再编辑指令活动记录表
                                                result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                        produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
                                            }

                                        } else {//手动投料
                                            if (activeIndex == 1) {//手动投配料具体活动记录通过pda录入 //只有手工投配料才可能有一个Phase对应多个活动的情况
                                                result = startPhaseActiveExeLogManual(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                        produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);


                                            }
                                        }
                                    } else if (prodTaskActive.getActiveType() != null && "activeType/activeType4".equals(prodTaskActive.getActiveType().getId())) {//投配料
                                        if (prodTaskActive.getActiveId().getAuto()) {//自动投料-管道投配料
                                            //先编辑phase执行记录表里查数据
                                            result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                    produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
                                            if (result) {
                                                //再编辑指令活动记录表
                                                result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                        produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
                                            }

                                        } else {//手动投配料料
                                            if (activeIndex == 1) {//手动投配料具体活动记录通过pda录入 //只有手工投配料才可能有一个Phase对应多个活动的情况
                                                result = startPhaseActiveExeLogManual(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                        produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);


                                            }
                                        }
                                    } else if (prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {//检验
                                        if (endTimeLong != null && endTimeLong.longValue() > 0) {
                                            //完工检验不执行批控的结束信号 -- jojo 2018.9.28
                                        	if(prodTaskActive.getFinalInspection()){
                                        		return true;
                                        	}
                                            WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
                                                    Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
                                            if (batchPhaseExelog != null) {
                                            	//只在phase执行记录表里插数据
                                                result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                        produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
                                                if (result) {
                                                    //再编辑指令活动记录表
                                                    result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                            produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
                                                }
                                            }
                                        } else if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
                                            WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
                                                    Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
                                            if (batchPhaseExelog != null) {
                                                result = true;
                                            } else {
                                                //只在phase执行记录表里插数据
                                                result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                        produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
                                                if (result) {
                                                    //再编辑指令活动记录表
                                                    result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                            produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
                                                }
                                                /*
                                                 *
                                                 * 生成请检接口
                                                 *
                                                 * */
                                                if (result) {
                                                    batchPhaseExelogDao.flush();
                                                    batchPhaseExelogDao.clear();
                                                    WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
                                                            Restrictions.eq("phaseID", batchPhaseId), Restrictions.eq("taskActiveID", prodTaskActive));//根据批控phaseId和工序工单获取工单活动记录
                                                    interfaceSelfService.addApplyCheckByActiveExelog(prodTaskActiExelog);
                                                }
                                            }
                                        }
                                    } else if (prodTaskActive.getActiveType() != null && "activeType/activeType6".equals(prodTaskActive.getActiveType().getId())) {//产出
                                        //先编辑phase执行记录表里查数据
                                        result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
                                        if (result) {
                                            //再编辑指令活动记录表
                                            result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId, data, phase, prodTask, procExeLog,
                                                    produceTaskProcess, prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
                                        }

                                    }
                                	
                                	
                                    //增减活动的索引，避免多次操作phase和日志
                                    activeIndex++;
                                }
                            }
                        } else {
                            logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchPhaseId);
                            insertLog(logMap, dealError);
                            result = false;
                        }
                    }
                } else {
                    logMap = setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "activeStatus", di.getId().toString(), "true", batchId);
                    insertLog(logMap, dealError);
                    result = false;
                }
            }
        } catch (JSONException e) {
            log.error(e.getMessage(), e);
        }
        return result;
    }

    /**
     * 处理单个phase活动
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
    private Boolean dealSinglePhase(Long exeStat, Long exeStatOld, String batchPhaseId, String data, JSONObject phase, WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
			WOMProduceTaskProcess produceTaskProcess,
			WOMProduceTaskActive prodTaskActive, Boolean dealError,
			int activeIndex, String mqId, Long startTimeLong, Long endTimeLong) {
		Boolean result = true;
		List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
		if (prodTaskActive.getActiveType() != null && "activeType/activeType1".equals(prodTaskActive.getActiveType().getId())) {// 常规
		// 先编辑phase执行记录表里查数据
			result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId,data, phase, prodTask, procExeLog, produceTaskProcess,prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
			if (result) {
				// 再编辑指令活动记录表
				result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId,data, phase, prodTask, procExeLog, produceTaskProcess,prodTaskActive, dealError, mqId, startTimeLong,endTimeLong);// 活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			}
		} else if (prodTaskActive.getActiveType() != null && "activeType/activeType2".equals(prodTaskActive.getActiveType().getId())) {// 配料
		// 目前不会有配料活动
		} else if (prodTaskActive.getActiveType() != null && "activeType/activeType3".equals(prodTaskActive.getActiveType().getId())) {// 投料
			if (prodTaskActive.getActiveId().getAuto()) {// 自动投料
			// 先编辑phase执行记录表里查数据
				result = dealPhaseActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError, mqId,startTimeLong, endTimeLong);
				if (result) {
					// 再编辑指令活动记录表
					result = dealPtActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError,mqId, startTimeLong, endTimeLong);// 活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
				}

			} else {// 手动投料
				if (activeIndex == 1) {// 手动投配料具体活动记录通过pda录入
										// //只有手工投配料才可能有一个Phase对应多个活动的情况
					result = startPhaseActiveExeLogManual(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError,mqId, startTimeLong, endTimeLong);

				}
			}
		} else if (prodTaskActive.getActiveType() != null && "activeType/activeType4".equals(prodTaskActive.getActiveType().getId())) {// 投配料
			if (prodTaskActive.getActiveId().getAuto()) {// 自动投料-管道投配料
			// 先编辑phase执行记录表里查数据
				result = dealPhaseActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError, mqId,startTimeLong, endTimeLong);
				if (result) {
					// 再编辑指令活动记录表
					result = dealPtActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError,mqId, startTimeLong, endTimeLong);// 活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
				}

			} else {// 手动投配料料
				if (activeIndex == 1) {// 手动投配料具体活动记录通过pda录入
										// //只有手工投配料才可能有一个Phase对应多个活动的情况
					result = startPhaseActiveExeLogManual(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError,mqId, startTimeLong, endTimeLong);

				}
			}
		} else if (prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {// 检验
			if (endTimeLong != null && endTimeLong.longValue() > 0) {
				// 完工检验不执行批控的结束信号 -- jojo 2018.9.28
				if (prodTaskActive.getFinalInspection()) {
					return true;
				}
				WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("phaseID", batchPhaseId),Restrictions.eq("taskID",prodTaskActive.getHeadID()));// 根据批控phaseId获取工单活动
				if (batchPhaseExelog != null) {
					// 只在phase执行记录表里插数据
					result = dealPhaseActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError,mqId, startTimeLong, endTimeLong);
					if (result) {
						// 再编辑指令活动记录表
						result = dealPtActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask,procExeLog, produceTaskProcess, prodTaskActive,dealError, mqId, startTimeLong, endTimeLong);// 活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
					}
				}
			} else if (startTimeLong != null && startTimeLong.longValue() > 0) {// 开始信号
				WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("phaseID", batchPhaseId),Restrictions.eq("taskID",prodTaskActive.getHeadID()));// 根据批控phaseId获取工单活动
				if (batchPhaseExelog != null) {
					result = true;
				} else {
					// 只在phase执行记录表里插数据
					result = dealPhaseActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask, procExeLog,produceTaskProcess, prodTaskActive, dealError,mqId, startTimeLong, endTimeLong);
					if (result) {
						// 再编辑指令活动记录表
						result = dealPtActiveExeLog(exeStat, exeStatOld,batchPhaseId, data, phase, prodTask,procExeLog, produceTaskProcess, prodTaskActive,dealError, mqId, startTimeLong, endTimeLong);// 活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
					}
					/*
					 * 
					 * 生成请检接口
					 */
					if (result) {
						batchPhaseExelogDao.flush();
						batchPhaseExelogDao.clear();
						WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid",true), Restrictions.eq("phaseID",batchPhaseId), Restrictions.eq("taskActiveID", prodTaskActive));// 根据批控phaseId和工序工单获取工单活动记录
						interfaceSelfService.addApplyCheckByActiveExelog(prodTaskActiExelog);
					}
				}
			}
		} else if (prodTaskActive.getActiveType() != null && "activeType/activeType6".equals(prodTaskActive.getActiveType().getId())) {// 产出
		// 先编辑phase执行记录表里查数据
			result = dealPhaseActiveExeLog(exeStat, exeStatOld, batchPhaseId,data, phase, prodTask, procExeLog, produceTaskProcess,prodTaskActive, dealError, mqId, startTimeLong, endTimeLong);
			if (result) {
				// 再编辑指令活动记录表
				result = dealPtActiveExeLog(exeStat, exeStatOld, batchPhaseId,data, phase, prodTask, procExeLog, produceTaskProcess,prodTaskActive, dealError, mqId, startTimeLong,endTimeLong);// 活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			}

		}
		return result;
	}

    /**
     * 编辑phase活动执行记录，常规、产出、自动投配料使用
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
    private Boolean dealPhaseActiveExeLog(Long exeStat, Long exeStatOld, String batchPhaseId, String data, JSONObject phase, WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
                                          WOMProduceTaskProcess produceTaskProcess, WOMProduceTaskActive prodTaskActive, Boolean dealError, String mqId, Long startTimeLong, Long endTimeLong) {
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("phaseID", batchPhaseId),
                Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
		/*if(exeStat != null && exeStat.intValue() == -1 && batchPhaseExelog != null){
			logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "查询到对应工单工序活动phase执行记录已开始，无法继续开始,jsonData:" + data,"activeStatus",null,"true",batchPhaseId);
			insertLog(logMap, dealError);
			return false;
		}else if(exeStat != null && exeStat.intValue() == 8 && batchPhaseExelog == null){
			logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "查询不到对应工单工序活动phase执行记录,无法结束记录,jsonData:" + data,"activeStatus",mqId,"true",batchPhaseId);
			insertLog(logMap, dealError);
			return false;
		}*/

		/*Long startTimeLong = null;
		Long endTimeLong = null;
		try {
			startTimeLong = phase.getLong("StartTime");
			endTimeLong = phase.getLong("EndTime");
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
		}*/

        if (endTimeLong != null && endTimeLong.longValue() > 0) {//完成信号
            if (batchPhaseExelog != null) {
                if (batchPhaseExelog.getEndTime() != null) {//如果有多次结束信号，只处理第一次
                    return true;
                } else {
                    Date endTime = Filetime2Date(endTimeLong);
                    batchPhaseExelog.setEndTime(endTime);
                    batchPhaseExelog.setIsFinish(true);//执行结束
                    batchPhaseExelogDao.save(batchPhaseExelog);
                }
            } else if (prodTaskActive.getActiveType() != null && !"activeType/activeType5".equals(prodTaskActive.getActiveType().getId()) ) {//完工检验由检验模块结束
                WOMBatchPhaseExelog batchPhaseExelogNew = new WOMBatchPhaseExelog();
                if (batchPhaseExelog != null) {
                    batchPhaseExelogNew = batchPhaseExelog;
                }
                batchPhaseExelogNew.setAllowPutin(true);//允许投料
                batchPhaseExelogNew.setBatchNum(prodTask.getProductBatchNum());//批号
                batchPhaseExelogNew.setExeSystem(new SystemCode("RMsystem/system1"));//系统
                batchPhaseExelogNew.setFactoryId(procExeLog.getFactoryID());//工作单元
                batchPhaseExelogNew.setIsFinish(false);//执行开始
                batchPhaseExelogNew.setMobileTerminal(false);//移动端执行
                batchPhaseExelogNew.setPhaseID(batchPhaseId);//批控phaseId
                batchPhaseExelogNew.setRemark("");//备注
                batchPhaseExelogNew.setTaskID(prodTask);//指令单
                batchPhaseExelogNew.setTaskProcessID(produceTaskProcess);//工序
                batchPhaseExelogNew.setOperartionID(prodTaskActive.getOperartionID());
                batchPhaseExelogDao.save(batchPhaseExelogNew);
            }
        } else if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
            WOMBatchPhaseExelog batchPhaseExelogNew = new WOMBatchPhaseExelog();
            if (batchPhaseExelog != null) {
                batchPhaseExelogNew = batchPhaseExelog;
            }
            if (batchPhaseExelogNew.getStartTime() != null) {//如果有多次开始信号，只处理第一次
                return true;
            } else {
                batchPhaseExelogNew.setAllowPutin(true);//允许投料
                batchPhaseExelogNew.setBatchNum(prodTask.getProductBatchNum());//批号
                batchPhaseExelogNew.setExeSystem(new SystemCode("RMsystem/system1"));//系统
                batchPhaseExelogNew.setFactoryId(procExeLog.getFactoryID());//工作单元
                if (prodTaskActive.getActiveType() != null && prodTaskActive.getActiveType().getId().equals("activeType/activeType5")) {//活动类型为检验时,直接结束
                    batchPhaseExelogNew.setIsFinish(true);//执行结束
                    Date endTime = Filetime2Date(startTimeLong);
                    batchPhaseExelogNew.setEndTime(endTime);
                } else {
                    batchPhaseExelogNew.setIsFinish(false);//执行开始
                }
                batchPhaseExelogNew.setMobileTerminal(false);//移动端执行
                batchPhaseExelogNew.setPhaseID(batchPhaseId);//批控phaseId
                batchPhaseExelogNew.setRemark("");//备注
                Date startTime = Filetime2Date(startTimeLong);
                batchPhaseExelogNew.setStartTime(startTime);

                batchPhaseExelogNew.setTaskID(prodTask);//指令单
                batchPhaseExelogNew.setTaskProcessID(produceTaskProcess);//工序
                batchPhaseExelogNew.setOperartionID(prodTaskActive.getOperartionID());
                batchPhaseExelogDao.save(batchPhaseExelogNew);
            }
        }
        return true;
    }
    
    
    /**
     * 编辑指令单活动执行记录，常规、产出、自动投配料使用
     *
     * @param exeStat            现在执行状态
     * @param exeStatOld         之前执行状态
     * @param batchPhaseId       批控phaseid
     * @param data               全部需要解析的data
     * @param phase              本phase的数据
     * @param prodTask           工单
     * @param procExeLog         工序执行记录
     * @param produceTaskProcess 配方工序
     * @param prodTaskActive     配方活动
     * @param dealError          是否二次同步
     * @param mqId               mq表id
     * @return
     */
    private Boolean dealPtActiveExeLog(Long exeStat, Long exeStatOld, String batchPhaseId, String data, JSONObject phase, WOMProduceTask prodTask, WOMProdTaskProcExelog procExeLog,
                                       WOMProduceTaskProcess produceTaskProcess, WOMProduceTaskActive prodTaskActive, Boolean dealError, String mqId, Long startTimeLong, Long endTimeLong) {
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();

        WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
        		Restrictions.eq("phaseID", batchPhaseId), Restrictions.eq("taskActiveID", prodTaskActive));//根据批控phaseId获取工单活动

        if (endTimeLong != null && endTimeLong.longValue() > 0) {//完成信号

            String matFbValStr = null;
            if (prodTaskActiExelog != null) {
                if (prodTaskActiExelog.getEndTime() != null) {//如果有多次结束信号，只处理第一次
                    return true;
                } else {
                    try {
                        Date endTime = Filetime2Date(endTimeLong);
                        prodTaskActiExelog.setEndTime(endTime);
                        if (phase.toString().contains("MatFbVal")) {
                            matFbValStr = phase.getString("MatFbVal");
                            if (matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//如果matFbValStr有值，即总量模式
                                Double matFbVal = Double.valueOf(matFbValStr);
                                BigDecimal actualNum = new BigDecimal(matFbVal);
                                prodTaskActiExelog.setActualNum(actualNum.divide(new BigDecimal(1000)));//实际投料数量 / 1000 - edited by oneway 2018.7.13
                            }
                        }
                    } catch (JSONException e) {
                        log.error(e.getMessage(), e);
                    }
                    prodTaskActiExelog.setIsFinish(true);
                    //prodTaskActiExelog.setState(new SystemCode("womProActiveType/completed"));//执行状态
                    prodTaskActiExelogDao.save(prodTaskActiExelog);

                    //正常结束活动
                    logMap = setWorkOrderMqLogMap(true, null, "活动\"" + prodTaskActive.getName() + "\"结束", "activeStatus", mqId, "false", prodTaskActive.getName());
                    insertLog(logMap, dealError);


                }
            } else {
                if (prodTaskActive.getActiveType() != null && !"activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {
                    prodTaskActiExelog = new WOMProdTaskActiExelog();
                    prodTaskActiExelog.setActiveType(prodTaskActive.getActiveType());//活动类型
                    prodTaskActiExelog.setBatchNum(prodTask.getProductBatchNum());//批号
                    prodTaskActiExelog.setPhaseID(batchPhaseId);//batchPhase
                    prodTaskActiExelog.setDataSource(prodTaskActive.getExeSystem());//数据来源-批控系统
                    prodTaskActiExelog.setDataType(new SystemCode("womDataType/1"));//数据性质-计划内
                    prodTaskActiExelog.setFactoryID(procExeLog.getFactoryID());//工作单元
                    prodTaskActiExelog.setPlanNum(prodTaskActive.getPlanNum());//计划数量
                    prodTaskActiExelog.setProcessExeLog(procExeLog);//工序执行记录
                    prodTaskActiExelog.setProductID(prodTaskActive.getProductId());//物品
                    prodTaskActiExelog.setProductNum("");//物料批号
                    prodTaskActiExelog.setStaffID((Staff) prodTask.getOwnerStaff());//操作人
                    prodTaskActiExelog.setTaskActiveID(prodTaskActive);//工单活动
                    prodTaskActiExelog.setTaskID(prodTask);//工单
                    prodTaskActiExelog.setTaskProcessID(produceTaskProcess);//工单工序
                    prodTaskActiExelog.setCid(prodTask.getCid());
                    prodTaskActiExelog.setOperartionID(prodTaskActive.getOperartionID());//批控operationId
                    if (prodTaskActive.getActiveId() != null) {
                        prodTaskActiExelog.setIsPassCheck(prodTaskActive.getActiveId().getIsPassCheck());//是否放行检验
                        prodTaskActiExelog.setFinalInspection(prodTaskActive.getActiveId().getFinalInspection());//完工检验
                        prodTaskActiExelog.setFormularActice(prodTaskActive.getActiveId());//配方.活动
                    }
                    prodTaskActiExelog.setActiveSource(prodTaskActive.getActiveSource());//来源

                    try {
                        Date endTime = Filetime2Date(endTimeLong);
                        prodTaskActiExelog.setEndTime(endTime);
                        if (phase.toString().contains("MatFbVal")) {
                            matFbValStr = phase.getString("MatFbVal");
                            if (matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//如果matFbValStr有值，即总量模式
                                Double matFbVal = Double.valueOf(matFbValStr);
                                BigDecimal actualNum = new BigDecimal(matFbVal);
                                prodTaskActiExelog.setActualNum(actualNum.divide(new BigDecimal(1000)));//实际投料数量 / 1000 - edited by oneway 2018.7.13
                            }
                        }
                    } catch (JSONException e) {
                        log.error(e.getMessage(), e);
                    }
                    prodTaskActiExelog.setIsFinish(true);//是否结束
                    prodTaskActiExelogDao.save(prodTaskActiExelog);
                    logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "活动\"" + prodTaskActive.getName() + "\"异常结束,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                    insertLog(logMap, dealError);
                    return true;
                }
            }


            boolean allowNewPutinRecord = false;//是否生成投料记录
            if (prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType3") && prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto() &&
                    matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr)) {//自动投料活动需要生成投料清单
                allowNewPutinRecord = true;
            } else if (prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType4")
                    && prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto()) {//自动投配料先查询一下是否有对应的配料记录
                List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),
                        Restrictions.eq("phaseID", batchPhaseId));//通过phsae查询配料指令明细
                if (batchingMaterialPartList != null && batchingMaterialPartList.size() > 0) {
                    allowNewPutinRecord = true;
                } else {
                    logMap = setWorkOrderMqLogMap(false, null, "根据控制配方phaseId:" + batchPhaseId + "查询不到对应该活动的配料记录,jsonData:" + data, "activeStatus", mqId, "false", batchPhaseId);
                    insertLog(logMap, dealError);
                    return false;
                }
            }

            if (allowNewPutinRecord) {//调用接口生成投料记录
                batchPhaseExelogDao.flush();
                batchPhaseExelogDao.clear();
                WOMProdTaskActiExelog prodTaskActiExelog2 = prodTaskActiExelogService.getProdTaskActiExelog(prodTaskActiExelog.getId());

                // 需要传用户名
                String userName = null;
                if (getCurrentUser() != null) {
                    userName = getCurrentUser().getName();
                }
                if (userName == null) {
                    //userName=prodTask.getOwnerStaff()!=null?prodTask.getOwnerStaff().getUser().getName():null;
                    Long staffId = prodTask.getOwnerStaffId();
                    if (staffId != null) {
                        Staff staff = staffService.get(staffId);
                        userName = staff != null ? staff.getUser().getName() : null;
                    }
                }
                interfaceSelfService.addPutinRecordByActiceExelog(prodTaskActiExelog2, false, userName);
            }

        } else if (startTimeLong != null && startTimeLong.longValue() > 0) {//开始信号
            if (prodTaskActiExelog != null) {//如果有多次开始信号，只处理第一次
                return true;
            } else {
                prodTaskActiExelog = new WOMProdTaskActiExelog();

                //add 20171113
                prodTaskActiExelog.setActiveName(prodTaskActive.getName());
                //检验的时候，设置活动与批状态为生产待检  add 20171113
/*                if (prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())) {
                    prodTaskActiExelog.setActiveBatchStateID(actBatStateService.getActBatState(1000L));
                }*/

                prodTaskActiExelog.setActiveType(prodTaskActive.getActiveType());//活动类型
                prodTaskActiExelog.setBatchNum(prodTask.getProductBatchNum());//批号
                prodTaskActiExelog.setPhaseID(batchPhaseId);//batchPhase
                prodTaskActiExelog.setDataSource(prodTaskActive.getExeSystem());//数据来源-批控系统
                prodTaskActiExelog.setDataType(new SystemCode("womDataType/1"));//数据性质-计划内
                prodTaskActiExelog.setFactoryID(procExeLog.getFactoryID());//工作单元
                prodTaskActiExelog.setPlanNum(prodTaskActive.getPlanNum());//计划数量
                prodTaskActiExelog.setProcessExeLog(procExeLog);//工序执行记录
                prodTaskActiExelog.setProductID(prodTaskActive.getProductId());//物品
                prodTaskActiExelog.setProductNum("");//物料批号
                prodTaskActiExelog.setStaffID((Staff) prodTask.getOwnerStaff());//操作人
                prodTaskActiExelog.setTaskActiveID(prodTaskActive);//工单活动
                prodTaskActiExelog.setTaskID(prodTask);//工单
                prodTaskActiExelog.setTaskProcessID(produceTaskProcess);//工单工序
                prodTaskActiExelog.setCid(prodTask.getCid());

                Date startTime = Filetime2Date(startTimeLong);
                prodTaskActiExelog.setStartTime(startTime);//活动开始时间

                prodTaskActiExelog.setIsFinish(false);//执行结束
                //prodTaskActiExelog.setState(new SystemCode("womProActiveType/executing"));//执行状态
                prodTaskActiExelog.setOperartionID(prodTaskActive.getOperartionID());
                if (prodTaskActive.getActiveId() != null) {
                    prodTaskActiExelog.setIsPassCheck(prodTaskActive.getActiveId().getIsPassCheck());//是否放行检验
                    prodTaskActiExelog.setFinalInspection(prodTaskActive.getActiveId().getFinalInspection());//完工检验
                    prodTaskActiExelog.setFormularActice(prodTaskActive.getActiveId());//配方.活动
                }
                prodTaskActiExelog.setActiveSource(prodTaskActive.getActiveSource());//来源
                prodTaskActiExelog.setTableInfoId(prodTask != null ? prodTask.getTableInfoId() : null);
                prodTaskActiExelogDao.save(prodTaskActiExelog);

                //活动正常开始日志
                logMap = setWorkOrderMqLogMap(true, null, "活动\"" + prodTaskActive.getName() + "\"开始", "activeStatus", mqId, "false", prodTaskActive.getName());
                insertLog(logMap, dealError);
            }
        }
        return true;
    }
    
    
    
    /**
     *  结束活动时的报工操作
     * @param errorMsg
     * @param produceTaskActive
     */
   	private BigDecimal toProcfeedback(StringBuilder errorMsg, WOMProdTaskActiExelog actiExelog, WOMProduceTaskActive produceTaskActive, Date endTime) {
        BigDecimal actualNum = new BigDecimal("0");
        if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_INSPECT)) {
            List<WOMQualityInspect> qualityInspects = procFeedbackHeadDao.findByHql("FROM WOMQualityInspect  WHERE activeID=? AND VALID = 1", produceTaskActive);
            if (qualityInspects.size() == 0) {
                errorMsg.append("请先进行请检报工操作!");
                return null;
            }else {
                for (WOMQualityInspect qualityInspect : qualityInspects) {
//                    generalInspect(qualityInspect);
                }
            }
        }else if(StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_OUTPUT)){
            List<WOMMaterialsOutput> materialsOutputs = procFeedbackHeadDao.findByHql("FROM WOMMaterialsOutput  WHERE activeID=? AND VALID = 1", produceTaskActive);
            if (materialsOutputs.size() == 0) {
                errorMsg.append("请先进行产出报工操作!");
                return null;
            }else {
                taskReporting = new WOMTaskReporting();
                if (materialsOutputs.size() == 0) {
                    errorMsg.append("投料表体不能为空!");
                    return null;
                }
                for (WOMMaterialsOutput materialsOutput : materialsOutputs) {
                    //指令单
                    taskReporting.setTaskID(produceTaskActive.getHeadID());
                  	taskReporting.setProduceActive(produceTaskActive);
                    taskReporting.setProductID(produceTaskActive.getProductId());
                    if (produceTaskActive.getProductId() == null) {
                        errorMsg.append("物品不能为空!");
                        return null;
                    }else {
                        if (produceTaskActive.getProductId().getBatch() != null && StringUtils.equals(produceTaskActive.getProductId().getBatch().getId(),"batch/batch01")) {
                            if (StringUtils.isBlank(materialsOutput.getBatch())) {
                                errorMsg.append("物品已经启用批次，批号不能为空!");
                                return null;
                            }
                        }
                    }
                    taskReporting.setReportDate(endTime);
                    //报工人
                    taskReporting.setReportStaff(materialsOutput.getOperateStaffID());
                    //仓库
                    taskReporting.setWareID(materialsOutput.getWareID());
                    //报工类型：过程报工
                    taskReporting.setReportType((SystemCode) systemCodeService.getSystemCodeByID("womReportType/03"));
                    taskReporting.setStatus(99);
                    //找到产出数据
                    taskReportingParts = new ArrayList<>();
                    WOMTaskReportingPart taskReportingPart = new WOMTaskReportingPart();
                    taskReportingPart.setStoreID(materialsOutput.getPlaceSet());
                    taskReportingPart.setReportNum(materialsOutput.getProduceNum());
                    taskReportingPart.setBatchNum(materialsOutput.getBatch());
                    taskReportingPart.setRemark(materialsOutput.getRemark());
                    if (materialsOutput.getWareID() == null) {
                        errorMsg.append("仓库不能为空!");
                        return null;
                    }else {
                        if (materialsOutput.getWareID().getIsCargo()) {
                            if (materialsOutput.getPlaceSet() == null) {
                                errorMsg.append("仓库 ["+materialsOutput.getWareID().getWareName()+"] ").append("已经启用了货位，").append("货位不能为空!");
                                return null;
                            }
                        }
                    }
                    if (materialsOutput.getProduceNum() == null) {
                        errorMsg.append("产出数量不能为空，请完善报工数据!");
                        return null;
                    }
                    actualNum = actualNum.add(materialsOutput.getProduceNum());
                    taskReportingParts.add(taskReportingPart);
                    //表体方法
                    DataGridService dataGridService = new DataGridService() {
                        @Override
                        public void execute() {
                            if (taskReportingParts != null && !taskReportingParts.isEmpty()) {
                                for (WOMTaskReportingPart part: taskReportingParts) {
                                  	part.setTableInfoId(taskReporting.getTableInfoId());
                                    part.setHeadId(taskReporting);
                                    taskReportingPartService.saveTaskReportingPart(part, null, "taskReportingView");
                                }
                            }
                        }
                    };

                    WorkFlowVar workFlowVar1 = new WorkFlowVar();
                    workFlowVar1.setOperateType("submit");
                    // 生效
                    taskReportingService.saveSuperEditTaskReporting(taskReporting, workFlowVar1, dataGridService, "WOM_7.5.0.WOM_7.5.0.0_taskReporting_taskReportingView", false);
                    actiExelog.setBatchNum(materialsOutput.getBatch());
                }
            }
        }else {
            List<WOMProcFeedbackHead> procFeedbackHeads = procFeedbackHeadDao.findByHql("FROM WOMProcFeedbackHead  WHERE processActive=? AND VALID = 1", produceTaskActive);
            if (procFeedbackHeads.size() == 0) {
                errorMsg.append("请先进行报工操作!");
                return null;
            }else {
              	if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_COMMON)) {
                    return null;
                }
                putInMaterial = new WOMPutInMaterial();
                //投料或者配料活动时，需要生成投料单
                for (WOMProcFeedbackHead procFeedbackHead : procFeedbackHeads) {
                    putInMaterial.setTaskID(procFeedbackHead.getTaskId());
                    putInMaterial.setPutinStaff(procFeedbackHead.getStaffID());
                    putInMaterial.setStatus(99);
                    putInMaterialParts = new ArrayList<>();
                    //找到投配料表体
                    List<WOMBatchCharge> batchCharges = batchChargeService.findBatchChargesByHql(" from WOMBatchCharge where headerId=? and valid = 1", procFeedbackHead);
                    //是否启用批次
                    boolean useBatch = false;
                    //是否启用货位
                    boolean usePlaceSet = false;
                    if (batchCharges.size() == 0) {
                        errorMsg.append("配料表体不能为空!");
                        return null;
                    }
                    for (int i = 0; i < batchCharges.size(); i++) {
                        WOMBatchCharge womBatchCharge = batchCharges.get(i);
                        MESBasicWare wareID = womBatchCharge.getWareID();
                        if (i == 0) {
                            if (womBatchCharge.getGood() != null) {
                                if (womBatchCharge.getGood().getBatch() != null && StringUtils.equals(womBatchCharge.getGood().getBatch().getId(),"batch/batch01")) {
                                    useBatch = true;
                                }
                            }
                            if (womBatchCharge.getWareID() != null) {
                                usePlaceSet = wareID.getIsCargo();
                            }
                        }
                        WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
                        if (useBatch && StringUtils.isBlank(womBatchCharge.getBatch())){
                            errorMsg.append("物品已经启用批次，批号不能为空!");
                            return null;
                        }
                        //生产批次
                        putInMaterialPart.setBatchNum(womBatchCharge.getBatch());
                        //投入的物品
                        putInMaterialPart.setProductId(womBatchCharge.getGood());
                        //活动
                      	putInMaterialPart.setFormluActive(produceTaskActive.getActiveId());
                        putInMaterialPart.setTaskActiveId(produceTaskActive);
                        if (womBatchCharge.getActualUseNum() == null) {
                            errorMsg.append("实际投料量不能为空!");
                            return null;
                        }
                        //投入量
                        putInMaterialPart.setUseNum(womBatchCharge.getActualUseNum());
                        actualNum = actualNum.add(womBatchCharge.getActualUseNum());
                        if(wareID == null){
                            errorMsg.append("仓库不能为空!");
                            return null;
                        }

                        if (usePlaceSet && womBatchCharge.getPlaceSet() == null) {
                            errorMsg.append("仓库 ["+womBatchCharge.getWareID().getWareName()+"] ").append("已经启用了货位，").append("货位不能为空!");
                            return null;
                        }
                        //仓库
                        putInMaterialPart.setWareID(womBatchCharge.getWareID());
                        //货位
                        putInMaterialPart.setStoreID(womBatchCharge.getPlaceSet());
                        //投料时间
                        putInMaterialPart.setPutinDate(womBatchCharge.getPutinDate());
                        //投料结束时间
                        putInMaterialPart.setPutinEndDate(womBatchCharge.getPutinEndDate());
                        //工作单元
                        putInMaterialPart.setFactoryId(produceTaskActive.getOrderProcessId().getFactoryId());
                        //工序
                        putInMaterialPart.setTaskProcessId(produceTaskActive.getOrderProcessId());
                        //备注
                        putInMaterialPart.setRemark(womBatchCharge.getRemark());
                        putInMaterialParts.add(putInMaterialPart);
                    }

                    //表体方法
                    DataGridService dataGridService = new DataGridService() {
                        @Override
                        public void execute() {
                            if (putInMaterialParts != null && !putInMaterialParts.isEmpty()) {
                                for (WOMPutInMaterialPart part: putInMaterialParts) {
                                  	part.setTableInfoId(putInMaterial.getTableInfoId());
                                    part.setHeadId(putInMaterial);
                                    putInMaterialPartService.savePutInMaterialPart(part, null, "putinView");
                                }
                            }
                        }
                    };

                    WorkFlowVar workFlowVar1 = new WorkFlowVar();
                    workFlowVar1.setOperateType("submit");
                    // 生效
                    putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, workFlowVar1, dataGridService, "WOM_7.5.0.0_putInMaterial_putinView", false);
                }
                //真实投料量
                actiExelog.setActualNum(actualNum);
            }
        }
        //活动执行记录
        actiExelog.setEndTime(endTime);
      	actiExelog.setIsFinish(true);
        prodTaskActiExelogDao.merge(actiExelog);
        return actualNum;
    }
    
}
