package com.supcon.orchid.MESBasic.services.impl;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Map; 
import java.util.Arrays;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.beanutils.PropertyUtils;
import java.io.Serializable;
import org.hibernate.Hibernate;
import org.hibernate.type.Type;
import org.hibernate.type.TypeFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import com.supcon.orchid.ec.services.DataGridService;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.web.util.HtmlUtils;
import com.supcon.orchid.workflow.engine.transformers.PendingResultTransformer;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.DisposableBean;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.utils.DateUtils;
import com.supcon.orchid.services.BaseServiceImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.supcon.orchid.security.OrchidAuthenticationToken;

import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.container.mvc.struts2.results.BAPEntityTransformer;
import com.supcon.orchid.container.mvc.struts2.utils.Struts2Utils;
import com.supcon.orchid.container.mvc.struts2.utils.XmlUtils;
import com.supcon.orchid.counter.Counter;
import com.supcon.orchid.counter.CounterManager;
import com.supcon.orchid.counter.CounterType;
import com.supcon.orchid.counter.support.CounterBean;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustClassService;
import com.supcon.orchid.utils.DateUtils;
import com.supcon.orchid.utils.Inflector;
import com.supcon.orchid.utils.OrchidUtils;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.foundation.entities.Document;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.db.DbUtils;
import com.supcon.orchid.utils.JSONPlainSerializer;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.entities.Sql;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Event;
import com.supcon.orchid.ec.services.ConditionService;
import com.supcon.orchid.ec.services.SqlService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.ec.services.EventService;
import com.supcon.orchid.utils.ReflectUtils;
import com.supcon.orchid.ec.services.CreatorService;
import com.supcon.orchid.foundation.services.DataPermissionService;
import com.supcon.orchid.foundation.services.DocumentService;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.script.entities.Script;
import com.supcon.orchid.script.EngineScriptExecutor;
import com.supcon.orchid.script.services.ScriptService;
import com.supcon.orchid.i18n.InternationalResource;
import com.supcon.orchid.orm.dao.BaseDao.DBTYPE;
import com.supcon.orchid.orm.enums.DealInfoType;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.ec.enums.ShowType;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.daos.MESBasicMESServicesDao;
import com.supcon.orchid.MESBasic.services.MESBasicMESServicesService;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.daos.MESBasicServiceLoggerDao;
import com.supcon.orchid.MESBasic.services.MESBasicServiceLoggerService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustClass;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseCustClassDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustClassService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseCustomerDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustomerService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseCustomerClassDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustomerClassService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseVendorClassDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseVendorClassService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseVendorDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseVendorService;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.daos.MESBasicContainerDao;
import com.supcon.orchid.MESBasic.services.MESBasicContainerService;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.daos.MESBasicPropertyTagsDao;
import com.supcon.orchid.MESBasic.services.MESBasicPropertyTagsService;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.daos.MESBasicEquipmentDao;
import com.supcon.orchid.MESBasic.services.MESBasicEquipmentService;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.daos.MESBasicFactoryModelDao;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.daos.MESBasicItemPartDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemPartService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.daos.MESBasicItemSetupDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemSetupService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.daos.MESBasicItemRecordDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemRecordService;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.daos.MESBasicInterfaceLogDao;
import com.supcon.orchid.MESBasic.services.MESBasicInterfaceLogService;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.daos.MESBasicPlaceManageDao;
import com.supcon.orchid.MESBasic.services.MESBasicPlaceManageService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseProdListDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseProdListService;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.daos.MESBasicProductDao;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.daos.MESBasicConfigDao;
import com.supcon.orchid.MESBasic.services.MESBasicConfigService;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.daos.MESBasicInvolveItemsetupsDao;
import com.supcon.orchid.MESBasic.services.MESBasicInvolveItemsetupsService;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.daos.MESBasicRoutineDao;
import com.supcon.orchid.MESBasic.services.MESBasicRoutineService;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.daos.MESBasicSwitcherModelDao;
import com.supcon.orchid.MESBasic.services.MESBasicSwitcherModelService;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.daos.MESBasicTankModelDao;
import com.supcon.orchid.MESBasic.services.MESBasicTankModelService;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.daos.MESBasicTestMappingSetDao;
import com.supcon.orchid.MESBasic.services.MESBasicTestMappingSetService;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.daos.MESBasicDataTransDao;
import com.supcon.orchid.MESBasic.services.MESBasicDataTransService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
import com.supcon.orchid.MESBasic.daos.MESBasicItemSeqDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemSeqService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.tree.PrepareData;
import com.supcon.orchid.tree.Tree;
import com.supcon.orchid.tree.TreeDao;
import javax.annotation.Resource;
/* CUSTOM CODE START(serviceimpl,import,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */

@Service("mESBasic_baseCustClassService")
@Transactional
public class MESBasicBaseCustClassServiceImpl  extends BaseServiceImpl<MESBasicBaseCustClass> implements MESBasicBaseCustClassService, InitializingBean, DisposableBean {
	private static final Pattern pattern = Pattern.compile("( AS | as )((\"?)(.*?)(\"?))(,| )");
	private static final Pattern p = Pattern.compile("( JOIN | join )((.*?)) ((\"?)(.*?)(\"?)) ON ");
	private static final Pattern countPattern = Pattern.compile("(SUM\\()((\"?)(.*?)(\"?))(\\) AS | as )");
	@Autowired
	private SqlService sqlService;
	@Autowired
	EventService eventService;
	@Autowired
	ScriptService scriptService;
	
	@Autowired
	private DocumentService documentService;
	@Autowired
	private MESBasicMESServicesDao mESServicesDao;
	@Autowired
	private MESBasicMESServicesService mESServicesService;
	@Autowired
	private MESBasicServiceLoggerDao serviceLoggerDao;
	@Autowired
	private MESBasicServiceLoggerService serviceLoggerService;
	@Autowired
	private MESBasicBaseCustClassDao baseCustClassDao;
	@Autowired
	private MESBasicBaseCustomerDao baseCustomerDao;
	@Autowired
	private MESBasicBaseCustomerService baseCustomerService;
	@Autowired
	private MESBasicBaseCustomerClassDao baseCustomerClassDao;
	@Autowired
	private MESBasicBaseCustomerClassService baseCustomerClassService;
	@Autowired
	private MESBasicBaseVendorClassDao baseVendorClassDao;
	@Autowired
	private MESBasicBaseVendorClassService baseVendorClassService;
	@Autowired
	private MESBasicBaseVendorDao baseVendorDao;
	@Autowired
	private MESBasicBaseVendorService baseVendorService;
	@Autowired
	private MESBasicContainerDao containerDao;
	@Autowired
	private MESBasicContainerService containerService;
	@Autowired
	private MESBasicPropertyTagsDao propertyTagsDao;
	@Autowired
	private MESBasicPropertyTagsService propertyTagsService;
	@Autowired
	private MESBasicEquipmentDao equipmentDao;
	@Autowired
	private MESBasicEquipmentService equipmentService;
	@Autowired
	private MESBasicFactoryModelDao factoryModelDao;
	@Autowired
	private MESBasicFactoryModelService factoryModelService;
	@Autowired
	private MESBasicItemPartDao itemPartDao;
	@Autowired
	private MESBasicItemPartService itemPartService;
	@Autowired
	private MESBasicItemSetupDao itemSetupDao;
	@Autowired
	private MESBasicItemSetupService itemSetupService;
	@Autowired
	private MESBasicItemRecordDao itemRecordDao;
	@Autowired
	private MESBasicItemRecordService itemRecordService;
	@Autowired
	private MESBasicInterfaceLogDao interfaceLogDao;
	@Autowired
	private MESBasicInterfaceLogService interfaceLogService;
	@Autowired
	private MESBasicPlaceManageDao placeManageDao;
	@Autowired
	private MESBasicPlaceManageService placeManageService;
	@Autowired
	private MESBasicBaseProdListDao baseProdListDao;
	@Autowired
	private MESBasicBaseProdListService baseProdListService;
	@Autowired
	private MESBasicProductDao productDao;
	@Autowired
	private MESBasicProductService productService;
	@Autowired
	private MESBasicConfigDao configDao;
	@Autowired
	private MESBasicConfigService configService;
	@Autowired
	private MESBasicInvolveItemsetupsDao involveItemsetupsDao;
	@Autowired
	private MESBasicInvolveItemsetupsService involveItemsetupsService;
	@Autowired
	private MESBasicRoutineDao routineDao;
	@Autowired
	private MESBasicRoutineService routineService;
	@Autowired
	private MESBasicSwitcherModelDao switcherModelDao;
	@Autowired
	private MESBasicSwitcherModelService switcherModelService;
	@Autowired
	private MESBasicTankModelDao tankModelDao;
	@Autowired
	private MESBasicTankModelService tankModelService;
	@Autowired
	private MESBasicTestMappingSetDao testMappingSetDao;
	@Autowired
	private MESBasicTestMappingSetService testMappingSetService;
	@Autowired
	private MESBasicDataTransDao dataTransDao;
	@Autowired
	private MESBasicDataTransService dataTransService;
	@Autowired
	private MESBasicItemSeqDao itemSeqDao;
	@Autowired
	private MESBasicItemSeqService itemSeqService;
	
	@Autowired
	private DataPermissionService dataPermissionService;
	@Autowired
	private CounterManager counterManager;
	@Autowired
	private ConditionService conditionService;
	@Autowired
	private ViewServiceFoundation viewServiceFoundation;
	private Counter counter;
	@Autowired
	private CreatorService creatorService;
	@Autowired
	private BundleContext bundleContext;
	@Autowired
	private SynchronizeInfoService synchronizeInfoService;
	/**
	 * 根据业务主键列表获取Map
	 * @param businessKeys 业务主键列表
	 * @return Map<String,String> key：businessKey  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<Serializable,Serializable> getBusinessKeyMap(Serializable businessKeyName,List<Serializable> businessKeys){
		if(businessKeyName!=null && String.valueOf(businessKeyName).length() > 0){
			String hql = "select " + businessKeyName + ",id from " + MESBasicBaseCustClass.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = baseCustClassDao.createQuery(hql);
			query.setParameterList("businessKeys", businessKeys);
			List<Object[]> list = query.list();
			Map<Serializable,Serializable> map = new HashMap<Serializable,Serializable>();
			if(list!=null && !list.isEmpty()){
				for (Object[] objs : list) {
					map.put((Serializable)(String.valueOf(objs[0])), (Serializable)objs[1]);
				}
			}
			return map;
		}
		return null;	
		
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicBaseCustClass getBaseCustClass(long id){
		return getBaseCustClass(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicBaseCustClass getBaseCustClass(long id, String viewCode){
		MESBasicBaseCustClass baseCustClass = baseCustClassDao.load(id);

		// 一对多情况处理
		return baseCustClass;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getBaseCustClassAsJSON(long id, String include){
		MESBasicBaseCustClass baseCustClass = baseCustClassDao.load(id);
		// 一对多情况处理

		if(baseCustClass == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(baseCustClass, include, new BAPEntityTransformer());
	}
	

	@Override
	public void deleteBaseCustClass(MESBasicBaseCustClass baseCustClass){
		beforeDeleteBaseCustClass(baseCustClass);
		baseCustClassDao.deletePhysical(baseCustClass);
		afterDeleteBaseCustClass(baseCustClass);
		List<MESBasicBaseCustClass> params = new ArrayList<MESBasicBaseCustClass>();
		params.add(baseCustClass);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_baseCustomer");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
			// TODO delete
	}
	
	@Override
	public void deleteBaseCustClass(List<Long> baseCustClassIds){
		deleteBaseCustClass(baseCustClassIds, null);
	}

	@Override
	public void deleteBaseCustClass(List<Long> baseCustClassIds, String eventTopic) {
		List<MESBasicBaseCustClass> baseCustClasss = new ArrayList<MESBasicBaseCustClass>();
		for(Long baseCustClassId : baseCustClassIds){
			MESBasicBaseCustClass baseCustClass = getBaseCustClass(baseCustClassId);
			baseCustClasss.add(baseCustClass);
		}
		
		for(MESBasicBaseCustClass baseCustClass : baseCustClasss){
			beforeDeleteBaseCustClass(baseCustClass);
		}
		
		if(baseCustClassIds != null && baseCustClassIds.size() > 0) {
			String hql = "delete " + MESBasicBaseCustClass.JPA_NAME + " where id in(:ids)";
			Query query = baseCustClassDao.createQuery(hql);
			query.setParameterList("ids", baseCustClassIds);
			query.executeUpdate();
		}
		
		for(MESBasicBaseCustClass baseCustClass : baseCustClasss){
			afterDeleteBaseCustClass(baseCustClass);
		}
		
		if(eventTopic==null){
			for(MESBasicBaseCustClass baseCustClassz : baseCustClasss){
				baseCustClassz.setValid(false);
				List<MESBasicBaseCustClass> params = new ArrayList<MESBasicBaseCustClass>();
				params.add(baseCustClassz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "MESBasic_1_baseCustomer");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	public void deleteBaseCustClass(long baseCustClassId, int baseCustClassVersion){
		
		MESBasicBaseCustClass baseCustClass = getBaseCustClass(baseCustClassId);
		
		beforeDeleteBaseCustClass(baseCustClass);
		baseCustClassDao.delete(baseCustClassId, baseCustClassVersion);
		afterDeleteBaseCustClass(baseCustClass);
		List<MESBasicBaseCustClass> params = new ArrayList<MESBasicBaseCustClass>();
		params.add(baseCustClass);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_baseCustomer");
		props.put("eventType", "delete");
	}
	
	
	@Override
	public void deleteBaseCustClass(String baseCustClassIds){
		deleteCollection(baseCustClassIds);
	}
	
	private void deleteCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			String version = idVersion.split("@")[1];
			if (id != null && id.trim().length() > 0 && version != null && version.trim().length() > 0) {
				deleteBaseCustClass(Long.valueOf(id), Integer.valueOf(version));
			}
		}
	}
	
	
	@Override
	public void saveBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService){
		saveBaseCustClass(baseCustClass, dataGridService, null);
	}
	
	@Override
	public void saveBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService, String viewCode){
		saveBaseCustClass(baseCustClass, dataGridService, viewCode, null);
	}


	private void generateBaseCustClassCodes(MESBasicBaseCustClass baseCustClass) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateBaseCustClassCodes(baseCustClass, false);
	}
	
	private void generateBaseCustClassCodes(MESBasicBaseCustClass baseCustClass, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		baseCustClassDao.flush();
		baseCustClassDao.clear();
		baseCustClass = getBaseCustClass(baseCustClass.getId());
		customGenerateCodes(baseCustClass, viewIsView);
	}
	
	private void generateBaseCustClassSummarys(MESBasicBaseCustClass baseCustClass) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateBaseCustClassSummarys(baseCustClass, false);
	}

	private void generateBaseCustClassSummarys(MESBasicBaseCustClass baseCustClass, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		baseCustClassDao.flush();
		baseCustClassDao.clear();
		baseCustClass = getBaseCustClass(baseCustClass.getId());
		customGenerateSummarys(baseCustClass, viewIsView);
	}

	@Override
	public void saveBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService, String viewCode, String eventTopic){
		String entityCode = "MESBasic_1_baseCustomer";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_baseCustomer");
		String url = null;
		if(baseCustClass.getId()!=null && baseCustClass.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_baseCustomer/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_baseCustomer/add";
		}
		List<Event> events = null;
		Boolean viewIsView = false;
		if(viewCode != null && !viewCode.trim().isEmpty()){
			View view = viewServiceFoundation.getView(viewCode);
			if(null != view) {
				viewIsView = (view.getType() == ViewType.VIEW);
			}
			events = eventService.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, baseCustClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(baseCustClass);
		beforeSaveBaseCustClass(baseCustClass, viewIsView);

		if (viewIsView) {
			baseCustClassDao.saveWithRevertVersion(baseCustClass);
		} else {
			baseCustClassDao.save(baseCustClass);
		}

		if (dataGridService != null) {
			baseCustClassDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		afterSaveBaseCustClass(baseCustClass, viewIsView);
		// 根据配置规则生成编码
		try {
			generateBaseCustClassCodes(baseCustClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e);
		}
		// 根据配置规则生成摘要
		try {
			generateBaseCustClassSummarys(baseCustClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e);
		}


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, baseCustClass);
			}
		}
		List<MESBasicBaseCustClass> params = new ArrayList<MESBasicBaseCustClass>();
		baseCustClassDao.flush();
		baseCustClassDao.clear();
		baseCustClass = baseCustClassDao.load(baseCustClass.getId());
		
		
		params.add(baseCustClass);
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, MESBasicBaseCustClass baseCustClass){
		for(Event e : events){
			if(e.getName().equals(scriptType)){
				if(e.getFunction()!=null && e.getFunction().length() > 0){
					try{
						Script script = scriptService.get(entityCode, e.getFunction());
						if (null == script || null == script.getCode()) {
							throw new BAPException("could not found the script.");
						}
						// 调用执行脚本方法
						Map<String, Object> variables = new HashMap<String, Object>();
						variables.put("db", DbUtils.getInstance());
						variables.put("baseCustClass", baseCustClass);
						Object retObj = EngineScriptExecutor.eval(script.getCode(), variables);
					}catch(Exception ex){
						log.warn(ex.getMessage());
					}
				}
				break;
			}
		}
	}

	@Override
	public void mergeBaseCustClass(MESBasicBaseCustClass baseCustClass, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(baseCustClass);
		beforeSaveBaseCustClass(baseCustClass);
		baseCustClassDao.merge(baseCustClass);

		if (dataGridService != null) {
			dataGridService.execute();
		}

		afterSaveBaseCustClass(baseCustClass);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<MESBasicBaseCustClass> findBaseCustClasss(Page<MESBasicBaseCustClass> page, Criterion... criterions) {
		return baseCustClassDao.findByPage(page, criterions);
	}
	private static String matchSql(Pattern p, String sql, String prefix, Map<String, String> maps, int n1, int n2) {
		Matcher matcher = p.matcher(sql);
		int i = 1;
		if (null == maps)
			maps = new HashMap<String, String>();
		while (matcher.find()) {
			String tag = (matcher.group(n1));// 含引号
			String tag2 = (matcher.group(n2));// 不含引号
			String symbol = prefix + i++;
			sql = sql.replace(tag, symbol);
			maps.put(symbol, tag2);
		}
		return sql;
	}
	
	private static String replaceSql(Pattern p, String sql, Map<String, String> maps, int n1, int n2) {
		Matcher matcher = p.matcher(sql);
		while (matcher.find()) {
			String tag = matcher.group(n1);
			String tag2 = matcher.group(n2);
			for(Map.Entry<String, String> entry : maps.entrySet()) {
				if(entry.getValue().equals(tag)) {
					sql = sql.replace(tag2,entry.getKey());
				}
			}
		}
		return sql;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findBaseCustClasss(Page<MESBasicBaseCustClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params) {
		findBaseCustClasss(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findBaseCustClasss(Page<MESBasicBaseCustClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findBaseCustClasss(Page<MESBasicBaseCustClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, objects);
	}
	
	/**
	 * @param page
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param flowBulkFlag
	 * @param hasAttachment
	 * @param params
	 * @param permissionCode
	 */
	@SuppressWarnings("unchecked")
	private void commonQuery(Page<MESBasicBaseCustClass> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects) {
		int queryType = 0;
		if(objects.length > 0) {
			queryType = (int) objects[0];
		}
		String sql = sqlService.getSqlQuery(viewCode, type);
		String countSql = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TOTALS);
		User currentUser=(User)getCurrentUser();
		StringBuilder totalSql = new StringBuilder(sql);
		Boolean crossCompanyFlag = null;
		if (null != sql && sql.length() > 0) {
			StringBuilder s = new StringBuilder();
			List<Object> list = new ArrayList<Object>();
			boolean hasWhere = false;
			String referenceCondition = "";
			String customerSql = "";
			String customerCondition = "";
			String classifySql = "";
			if (null != params && !params.isEmpty()) {
				Param param = params.get(0);
				if("crossCompanyFlag".equals(param.getName())){
					crossCompanyFlag = Boolean.parseBoolean(param.getValue().toString());
					params.remove(0);
				}
			}
			StringBuilder sortOrderByStr = new StringBuilder("");
			if (null != params && !params.isEmpty()) {
				s.append(" WHERE ((");
				hasWhere = true;
				String advQuery = "";
				List<Object> advValues = null;
				String extraQuery = "";
				List<Object> customerValues = null;
				List<Object> extraQueryValues = null;
				List<Object> customerSqlValues = null;
				List<Object> classifySqlValues = null;
				for (int i = 0; i < params.size(); i++) {
					Param param = params.get(i);
					
					if("classifySql".equals(param.getName())){
						classifySql = (String) param.getValue();
						continue;
					}
					
					if("classifySqlValues".equals(param.getName())){
						classifySqlValues = (List<Object>) param.getValue();
						continue;
					}
					
					if(type == Sql.TYPE_LIST_REFERENCE && "referenceCondition".equals(param.getName())) {
						referenceCondition = (String) param.getValue();
						continue;
					}
					
					if("customerValues".equals(param.getName())){
						customerValues = (List<Object>) param.getValue();
						continue;
					}
					if("customerSqlValues".equals(param.getName())){
						customerSqlValues = (List<Object>) param.getValue();
						continue;
					}
					if("customerCondition".equals(param.getName())){
						customerCondition = (String) param.getValue();
						continue;
					}
					if("customerSql".equals(param.getName())){
						customerSql = (String)param.getValue();
						continue;
					}
					
					if ("advQueryCond".equals(param.getName())) {
						AdvQueryCondition cond = conditionService.toSql((String) param.getValue());
						if (cond != null) {
							advValues = cond.getValues();
							advQuery = cond.getSql();
						}
						continue;
					}
					if ("extraQueryCond".equals(param.getName())) {
						Map<String,String> oneToManyParams = new HashMap<String,String>();
						oneToManyParams = (Map<String, String>) param.getValue();
						String json = sqlService.getExtraQueryJson(viewCode);
						Pattern oneToManyPattern = Pattern.compile("(\"value\":\")(\\$\\$.*?\\$\\$)(\")");
						Matcher matcher = oneToManyPattern.matcher(json);
						while (matcher.find()) {
							String tag = (matcher.group(2));
							String subTag = tag.substring(2, tag.length()-2);
							if(null != oneToManyParams.get(subTag) && ((String)(oneToManyParams.get(subTag))).length() > 0) {
								json = json.replace(tag, oneToManyParams.get(subTag).replace("\"", "SYMBOL_DOUBLE_QUOTE"));
							} else {
								json = json.replace(tag, "");
							}
						}
						if(null != json && json.length() > 0) {
							AdvQueryCondition cond = conditionService.toSql(json);
							if (cond != null) {
								extraQueryValues = cond.getValues();
								extraQuery = cond.getSql();
							}
						}
						continue;
					}
					if ("dataTable-sortColKey".equals(param.getName())) {
						String sortValue = (String) param.getValue();
						String key = null, columnName = null;
						if(sortValue.indexOf("::") > 0) {
							key = sortValue.split("::")[0];
							columnName = sortValue.split("::")[1];
						} else {
							key = sortValue;
						}
						int lastDotPos = key.lastIndexOf('.');
						if(null == columnName) {
							columnName = Inflector.getInstance().columnize(key.substring(lastDotPos + 1));
						}
						String tableAlias = lastDotPos < 0 ? "\"baseCustClass\"" : "\"" + key.substring(0, lastDotPos) + "\"";
						if("\"pending\"".equals(tableAlias)) {
							tableAlias = "\"p\"";
						}
						sortOrderByStr.append(tableAlias).append(".").append(columnName);
						continue;
					}
					if ("dataTable-sortColOrder".equals(param.getName())) {
						sortOrderByStr.append(" ").append((String) param.getValue());
						continue;
					}
					if(param.getName().startsWith("\"tree-")){
						if(param.getName().startsWith("\"tree-layRec-")){
							String treeCondition = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TREE);
							if (treeCondition!=null && treeCondition.trim().length() > 0) {
								if (hasWhere)
									s.append(" AND ");
								else
									s.append(" WHERE (");
									
								s.append(treeCondition);
								if(param.getLikeType() == Param.EQUAL_LIKELEFT) {
									list.add(param.getValue());
									list.add((String) param.getValue()+"-%");
								} 
								if(param.getLikeType() == Param.LIKE_UNSUPPORT) { 
									list.add(param.getValue());
								}
							}
						}
						continue;
					}
					if(!param.getName().startsWith("\"tree-") && param.getLikeType() == Param.EQUAL_LIKELEFT){
						s.append(" AND ( ").append(param.getName()).append("= ? ").append(" OR ")
							.append(param.getName()).append(" like ? )");
						list.add(param.getValue());
						list.add(param.getValue()+"-%");
						continue;
					}
					if (i > 0){
						s.append(" AND ");
					}
					if((null != param.getContainLower() && param.getContainLower())) {
						s.append(" ( ");
					}
					if(!param.getCaseSensitive()) {
						if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
							if(!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType()) && !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
								s.append(" UPPER (");
							}
						}
					}
					if(param.getLikeType() != Param.MULTI_LIKE) {
						s.append(param.getName());
					}
					if(!param.getCaseSensitive()) {
						if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
							if(!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType()) && !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
								s.append(") ");
							}
						}
					}
					String exp = " = ?";
					if (param.getLikeType() == Param.LIKE_UNSUPPORT) {
						s.append(" = ?");
					} else if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_LEFT) {
						s.append(" LIKE ?");
						exp = " LIKE ?";
					} else if(param.getLikeType() == Param.GREATE_EQUAL) {
						s.append(" >= ?");
						exp = " >= ?";
					}else if(param.getLikeType() == Param.LESS_EQUAL) {
						s.append(" <= ?");
						exp = " <= ?";
					}else if (param.getLikeType() == Param.GREATE_THAN) {
						s.append(" > ?");
						exp = " > ?";
					}else if (param.getLikeType() == Param.LESS_THAN) {
						s.append(" < ?");
						exp = " < ?";
					}else if (param.getLikeType() == Param.NONE_EQUAL) {
						s.append(" <> ?");
						exp = " <> ?";
					}else if (param.getLikeType() == Param.MULTI_LIKE) {
						exp = " LIKE ?";
						String multiValue = param.getValue().toString();
						String[] values = multiValue.split(",");
						StringBuilder multiSb = new StringBuilder();
						for(int m = 0; m < values.length; m++) {
							if(null != values[m] && values[m].length() > 0) {
								multiSb.append(" OR ");
								multiSb.append(param.getName()).append(" LIKE ? ");
								list.add("%," + values[m] + ",%");
							}
						}
						if(multiSb.length() > 0) {
							s.append(" ( ");
							s.append(multiSb.toString().substring(4));
							s.append(" ) ");
						}
					}else {}
					if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT) {
						String upperStr = (String) param.getValue();
						if(!param.getCaseSensitive()) {
							upperStr = upperStr.toUpperCase();
						}
						if(param.getLikeType() == Param.LIKE_ALL) {
							param.setValue('%' + upperStr + '%');
						}
						if(param.getLikeType() == Param.LIKE_LEFT) {
							param.setValue(upperStr + '%');
						}
						if(param.getLikeType() == Param.LIKE_RIGHT) {
							param.setValue('%' + upperStr);
						}	
					}
					if(param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
						if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							}
						} else if ("LONG".equals(param.getColumnType())){
							if(param.getValue() instanceof String){
								param.setValue(Long.parseLong((String) param.getValue()));
							}
						} else if ("INTEGER".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(Integer.parseInt((String) param.getValue()));
							}
						} else if ("DECIMAL".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(new BigDecimal((String) param.getValue()));
							}
						} else {
							if(param.getValue() instanceof String){
								String upperStr = (String) param.getValue();
								if(!param.getCaseSensitive()) {
									upperStr = upperStr.toUpperCase();
								} 
								param.setValue(upperStr);
							} else {
								param.setValue(param.getValue());
							}
						}
					}
					if(param.getLikeType() == Param.GREATE_EQUAL || param.getLikeType() == Param.GREATE_THAN || param.getLikeType() == Param.LESS_EQUAL || param.getLikeType() == Param.LESS_THAN) {
						if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							}
						} else if ("LONG".equals(param.getColumnType())){
							if(param.getValue() instanceof String){
								param.setValue(Long.parseLong((String) param.getValue()));
							}
						} else if ("INTEGER".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(Integer.parseInt((String) param.getValue()));
							}
						} else if ("DECIMAL".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(new BigDecimal((String) param.getValue()));
							}
						}					

					}
					
					if(param.getLikeType() != Param.MULTI_LIKE) {
						list.add(param.getValue());
					}
					if(null != param.getContainLower() && param.getContainLower()) {
						String prefix = param.getName().substring(0, param.getName().lastIndexOf("."));
						String columnName = param.getName().substring(param.getName().lastIndexOf(".") + 1);
						if(null != param.getModelInfo() && param.getModelInfo().length > 0) {
							String entityInfo = (param.getModelInfo())[0];
							String serviceInfo = (param.getModelInfo())[1];
							String layRecColumnName = null;
							if(param.getModelInfo().length > 2) {
								layRecColumnName = (param.getModelInfo())[2];
							}
							ServiceReference ref = bundleContext.getServiceReference(serviceInfo);
							List<String> layRecs = null;
							if(null != ref) {
								IModelTreeLayRecService layRecService = (IModelTreeLayRecService) bundleContext.getService(ref);
								layRecs = layRecService.getContainLower(entityInfo, Inflector.getInstance().columnToField(columnName), exp, param.getValue(), false);
							}
							if(null != layRecs && !layRecs.isEmpty()) {
								String layRecCond = "";
								for (String layRec : layRecs) {
									layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) +  " = ?";
									layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) +  " like ?";
									list.add(layRec);
									list.add(layRec + "-%");
								}
								s.append(layRecCond);
							}
							s.append(" ) ");
						}
					}
				}
				if (advQuery != null && advQuery.length() > 0) {
					s.append(" AND ").append(advQuery);
					if (advValues != null) {
						list.addAll(advValues);
					}
				}
				if (extraQuery != null && extraQuery.length() > 0) {
					s.append(" AND ").append(extraQuery);
					if (extraQueryValues != null) {
						list.addAll(extraQueryValues);
					}
				}
				if(customerCondition !=null && customerCondition.length()>0){
					s.append(" AND ").append(customerCondition);
					if(customerValues!=null && customerValues.size()>0){
						list.addAll(customerValues);
					}
				}
				if(customerSql != null && customerSql.length()>0){
					s.append(" AND ").append(customerSql);
					if(customerSqlValues!=null && customerSqlValues.size()>0){
						list.addAll(customerSqlValues);
					}
				}
				if(classifySql != null && classifySql.length() > 0){
					s.append(" AND (").append(classifySql).append(")");
					if(classifySqlValues != null && classifySqlValues.size() > 0){
						list.addAll(classifySqlValues);
					}
				}
				
				if(type == Sql.TYPE_LIST_REFERENCE){
					if(null != crossCompanyFlag && !crossCompanyFlag){
						s.append(" AND \"baseCustClass\".CID = ").append(getCurrentCompanyId());
					}
				}
				
//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
//					if(type == Sql.TYPE_LIST_PENDING) {
//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_QUERY){
//						s.append(" AND \"baseCustClass\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_REFERENCE){
//						if(null != crossCompanyFlag && !crossCompanyFlag){
//							s.append(" AND \"baseCustClass\".CID = ").append(getCurrentCompanyId());
//						}
//					}
//				}
				s.append(" ) ");
			}
			// ////PowerCondition

			s.append(") ");
			
			if (hasWhere)
				s.append(" AND ");
			else
				s.append(" WHERE ");
			s.append(" ( \"baseCustClass\".CC_CODE IN ( SELECT CUSTOMER_CODE FROM S2BASE_CUSTOMER \"baseCustomer\" ");
			//一个实体只有一个权限操作
			String powerCode = viewCode + "_self";
			View view = viewServiceFoundation.getView(viewCode);
			if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
				if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
					powerCode = "MESBasic_1_baseCustomer" + "_" + view.getPermissionCode();
				}
			}
			String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
			List<Object> powerCodeList =  baseCustClassDao.createNativeQuery(powerCodeSql, powerCode).list();
			if(powerCodeList.size() > 0) {
				powerCode = powerCodeList.get(0).toString();
			} else {
				String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
				List<Object> checkList =  baseCustClassDao.createNativeQuery(powerOperateSql, "MESBasic_1_baseCustomer").list();
				if(checkList.size()>0){
					powerCode = checkList.get(0).toString();
				}
			}
				String	pc = "";
				pc = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"baseCustomer\"","MESBasic_1_baseCustomer","",false);
			if (pc.trim().length() > 0) {
				s.append(" WHERE (");
				s.append(pc);
				s.append(")");
			}
			s.append(" )");
			s.append(")");
			
			
			if (referenceCondition != null && referenceCondition.length() > 0) {
				s.append(" AND (").append(referenceCondition).append(")");
			}
			// 开始处理排序，避免在统计时带入排序条件
			StringBuilder orderPart = new StringBuilder();
			orderPart.append(" ORDER BY ");
			String colOrderByStr = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_ORDERBY);
			if(null != colOrderByStr && colOrderByStr.length() > 0) {
				if(sortOrderByStr.toString().length() > 0) {
					String[] colOrderByArr = colOrderByStr.substring(1).split(",");
					String[] sortOrderByArr = sortOrderByStr.toString().split(" ");
					Boolean flag = false;
					for(String colOrderBy : colOrderByArr) {
						if(colOrderBy.indexOf(sortOrderByArr[0] + " ") > -1) {
							colOrderByStr = colOrderByStr.replace(colOrderBy, sortOrderByStr.toString());
							flag = true;
							break;
						}
					}
					if(!flag) {
						orderPart.append(sortOrderByStr).append(",");
					} 
					orderPart.append(colOrderByStr.substring(1)).append(",");
				} else {
					orderPart.append(colOrderByStr.substring(1)).append(",");
				}
			} else {
				if(sortOrderByStr.toString().length() > 0) {
					orderPart.append(sortOrderByStr.toString()).append(",");
				} 
			}
			if(type == Sql.TYPE_LIST_PENDING) {
				orderPart.append(" \"p\".WAITWORK_ID DESC");
			} else {
				orderPart.append(" \"baseCustClass\".ID DESC");
			}
			Object[] arr = list.toArray();
			totalSql.append(s);
			String realSql = totalSql.toString() + orderPart.toString();
			// 突破ORACLE 30个字符限制
			Map<String, String> maps = new HashMap<String, String>();
			realSql = matchSql(pattern, realSql, "T", maps, 2, 4);
			countSql += " ( " + totalSql.toString() + " ) T";
			countSql = replaceSql(pattern, countSql, maps, 4, 2);
			realSql = matchSql(p, realSql, "E", null, 4, 6);
			countSql = matchSql(p, countSql, "E", null, 4, 6);
			//组织总条数，合计SQL
			countSql = replaceSql(countPattern, countSql, maps, 4, 2);
			SQLQuery query = baseCustClassDao.createNativeQuery(realSql, arr);
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) baseCustClassDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    List<Map<String, Object>> resultCountList = (List<Map<String, Object>>) baseCustClassDao.createNativeQuery(countSql, arr)
					.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
			    if (null != resultCountList && !resultCountList.isEmpty()) {
					Map<String, Object> resultCounts = resultCountList.get(0);
					for (Map.Entry<String, Object> entry : resultCounts.entrySet()) {
						String key = entry.getKey();
						if(maps.containsKey(key)) {
							key = (String) maps.get(key);
						}
						if (key.equalsIgnoreCase("count")) {
							count = ((Number) entry.getValue()).longValue();
						} else {
							resultTotals.put(key, (BigDecimal) entry.getValue());
						}
					}
			    }
			    if(!page.isExportFlag() && !page.isPaging() && count > page.getMaxPageSize()) {
			    	throw new BAPException(BAPException.Code.RESULT_COUNT_EXCEED_MAX_PAGE_SIZE);
			    }
			    page.setTotalCount(count);
			    page.setResultTotals(resultTotals);
			}
			List<MESBasicBaseCustClass> result = getResult(page, query, new PendingResultTransformer(MESBasicBaseCustClass.class,baseCustClassDao,maps));
			page.setResult(result);
			if(null != hasAttachment && hasAttachment) {
				for (MESBasicBaseCustClass baseCustClass : result) {
					long count = 0l;
					count = documentService.getCountByLinkIdAndType(baseCustClass.getId(), "MESBasic_baseCustomer_baseCustClass");
					if(count > 0) {
						List<Document> documents = documentService.getByLinkIdAndType(baseCustClass.getId(), "MESBasic_baseCustomer_baseCustClass");
						if(null != documents && !documents.isEmpty()) {
							baseCustClass.setDocument(documents.get(0));
							baseCustClass.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
						}
					}
				}
			}
			for (MESBasicBaseCustClass baseCustClass : result) {
			}	
		}
	}
	
	
	

	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross, List<Param> params){
		List<Object[]> resultList = null;
		List<Object> totalValues = new ArrayList<Object>();
		String customerSql = null;
		List<Object> customerSqlValues = null;
		String customerCondition = null;
		List<Object> customerValues = null;
		Object mneValues = null;
		for(Param p : params){
			
			if("customerSql".equals(p.getName())){
				customerSql = (String) p.getValue();
				continue;
			}
			
			if("customerSqlValues".equals(p.getName())){
				customerSqlValues = (List<Object>) p.getValue();
				continue;
			}
			
			if("customerCondition".equals(p.getName())){
				customerCondition = (String) p.getValue();
				continue;
			}

			if("customerValues".equals(p.getName())){
				customerValues = (List<Object>) p.getValue();
				continue;
			}
			
			
			if("mneValues".equals(p.getName())){
				mneValues =  (Object) p.getValue();
				continue;
			}
		}
		
		String sql = sqlService.getSqlQuery(viewCode, Sql.TYPE_USED_MNECODE);
		if (null != sql && sql.length() > 0) {
			StringBuilder mnecodeSql = new StringBuilder();
			mnecodeSql.append(sql);
			mnecodeSql.append(" WHERE UPPER(\"").append("baseCustClass.mc\"").append(".MNE_CODE) like UPPER(?) AND \"baseCustClass\".VALID = 1");
			totalValues.add(mneValues);
			
			if(customerSql != null && customerSql.length() > 0){
				mnecodeSql.append(" AND (").append(customerSql).append(")");
				if(customerSqlValues!=null&&customerSqlValues.size()>0){
					totalValues.addAll(customerSqlValues);
				}
			}
			
			if(customerCondition != null && customerCondition.length() > 0){
				mnecodeSql.append(" AND (").append(customerCondition).append(")");
				if(customerValues!=null&&customerValues.size()>0){
					totalValues.addAll(customerValues);
				}
			}
			
			if(!cross){
				mnecodeSql.append(" AND \"baseCustClass\".CID = ?");
				totalValues.add(getCurrentCompanyId());
			}
			
			SQLQuery query = baseCustClassDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
			resultList = query.setMaxResults(showNumber).list();
		}
		
		return resultList;
		
	}

	@Override
	public void destroy() throws Exception {
		beforeServiceDestroy();
		sqlService = null;
		eventService = null;
		scriptService = null;
		documentService = null;
		mESServicesDao = null;
		mESServicesService = null;
		serviceLoggerDao = null;
		serviceLoggerService = null;
		baseCustClassDao = null;
		baseCustomerDao = null;
		baseCustomerService = null;
		baseCustomerClassDao = null;
		baseCustomerClassService = null;
		baseVendorClassDao = null;
		baseVendorClassService = null;
		baseVendorDao = null;
		baseVendorService = null;
		containerDao = null;
		containerService = null;
		propertyTagsDao = null;
		propertyTagsService = null;
		equipmentDao = null;
		equipmentService = null;
		factoryModelDao = null;
		factoryModelService = null;
		itemPartDao = null;
		itemPartService = null;
		itemSetupDao = null;
		itemSetupService = null;
		itemRecordDao = null;
		itemRecordService = null;
		interfaceLogDao = null;
		interfaceLogService = null;
		placeManageDao = null;
		placeManageService = null;
		baseProdListDao = null;
		baseProdListService = null;
		productDao = null;
		productService = null;
		configDao = null;
		configService = null;
		involveItemsetupsDao = null;
		involveItemsetupsService = null;
		routineDao = null;
		routineService = null;
		switcherModelDao = null;
		switcherModelService = null;
		tankModelDao = null;
		tankModelService = null;
		testMappingSetDao = null;
		testMappingSetService = null;
		dataTransDao = null;
		dataTransService = null;
		itemSeqDao = null;
		itemSeqService = null;
	
		dataPermissionService = null;
		counterManager = null;
		conditionService = null;
		viewServiceFoundation = null;
		creatorService = null;
		bundleContext = null;
		synchronizeInfoService = null;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		this.beforeInitBean();
		this.counter = this.counterManager.addCounter("baseCustomer", "MESBasic_1_baseCustomer", "baseCustomer_{0,date,yyyyMMdd}_{1,number,000}", CounterType.Daily);
		String formatStr = null;
		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=baseCustClassDao.createNativeQuery(sql, menuCode);
		List<String> list=query.list();
		String keys="";
		for(String key:list){
			keys+=","+key;
		}
		if(!"".equals(keys)){
			keys=keys.substring(1);
		}
		
		return keys;
	}
	// ================ 生成多选控件数据保存方法 start====================
	// ================ 生成多选控件数据保存方法 end ====================

	protected String getEntityCode(){return MESBasicBaseCustClass.ENTITY_CODE;}
	protected String getModuleCode(){return MESBasicBaseCustClass.MODULE_CODE;}
	protected String getModelCode(){return MESBasicBaseCustClass.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param baseCustClass 模型实例
	 */
	private void checkUniqueConstraint(MESBasicBaseCustClass baseCustClass){
	}
	
	
	private void beforeSaveBaseCustClass(MESBasicBaseCustClass baseCustClass, Object... objects){
		checkUniqueConstraint(baseCustClass);
	/* CUSTOM CODE START(serviceimpl,beforeSave,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	private void afterSaveBaseCustClass(MESBasicBaseCustClass baseCustClass, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportBaseCustClass(List<MESBasicBaseCustClass> baseCustClasss, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportBaseCustClass(List<MESBasicBaseCustClass> baseCustClasss){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	private void beforeDeleteBaseCustClass(MESBasicBaseCustClass baseCustClass){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	private void afterDeleteBaseCustClass(MESBasicBaseCustClass baseCustClass){
	/* CUSTOM CODE START(serviceimpl,afterDelete,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	private void customGenerateCodes(MESBasicBaseCustClass baseCustClass, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(MESBasicBaseCustClass baseCustClass, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}

	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	@Override
	public List<MESBasicBaseCustClass> getBaseCustClasss(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicBaseCustClass.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return baseCustClassDao.findByHql("from " + MESBasicBaseCustClass.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return baseCustClassDao.findByCriteria(detachedCriteria);
	}
	
	@Override
	public MESBasicBaseCustClass loadBaseCustClassByBussinessKey(MESBasicBaseCustClass baseCustClass){
		return loadBaseCustClassByBussinessKey(baseCustClass.getId());
	}
	
	@Override
	public Page<MESBasicBaseCustClass> getBaseCustClasss(Page<MESBasicBaseCustClass> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicBaseCustClass.class);
		if(sort!=null && sort.length()>0){
			String[] sorts = sort.split("\\|");
			if(sorts!=null && sorts.length>0){
				for(String condition : sorts){
					if(condition!=null && condition.length()>0 && condition.contains(",")){
						String[] conditions = condition.split(",");
						if("asc".equals(conditions[1])){
							detachedCriteria.addOrder(Order.asc(conditions[0]));
						}else if("desc".equals(conditions[1])){
							detachedCriteria.addOrder(Order.desc(conditions[0]));
						}
					}
				}
			}
		}
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			if(sql!=null){
				page = baseCustClassDao.findByPage(page, sql);
			}else{
				page = baseCustClassDao.findAllByPage(page);
			}
			return page;
		}
		page = baseCustClassDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicBaseCustClass loadBaseCustClassByBussinessKey(Serializable bussinessKey){
		return baseCustClassDao.findEntityByCriteria(Restrictions.eq("id", Long.valueOf(bussinessKey.toString())));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<MESBasicBaseCustClass> findByProperty(String propertyName, Object object){
		return baseCustClassDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicBaseCustClass findEntityByProperty(String propertyName, Object object){
		return baseCustClassDao.findEntityByProperty(propertyName, object);
	}
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<Long> bussinessKeyList = new ArrayList<Long>();
			for(String key : bussinessKeys.split(",")){
				bussinessKeyList.add(Long.valueOf(key));
			}
			String sql = "update " + MESBasicBaseCustClass.JPA_NAME + " set valid=0 where id in (:businessKeys)";
			Query query = baseCustClassDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	/* CUSTOM CODE START(serviceimpl,functions,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}