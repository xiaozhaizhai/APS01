package com.supcon.orchid.MESBasic.services.impl;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Map; 
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

import com.supcon.orchid.foundation.services.ACLPermissionHandleService;
import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.container.mvc.struts2.results.BAPEntityTransformer;
import com.supcon.orchid.container.mvc.struts2.utils.Struts2Utils;
import com.supcon.orchid.container.mvc.struts2.utils.XmlUtils;
import com.supcon.orchid.counter.Counter;
import com.supcon.orchid.counter.CounterManager;
import com.supcon.orchid.counter.CounterType;
import com.supcon.orchid.counter.support.CounterBean;
import com.supcon.orchid.MESBasic.services.MESBasicProdtypeService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdtypeDealInfo;
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
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.ec.enums.ShowType;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.daos.MESBasicContainerDao;
import com.supcon.orchid.MESBasic.services.MESBasicContainerService;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.daos.MESBasicPropertyTagsDao;
import com.supcon.orchid.MESBasic.services.MESBasicPropertyTagsService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.daos.MESBasicItemPartDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemPartService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.daos.MESBasicItemSetupDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemSetupService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.daos.MESBasicItemRecordDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemRecordService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdtype;
import com.supcon.orchid.MESBasic.daos.MESBasicProdtypeDao;
import com.supcon.orchid.MESBasic.services.MESBasicProdtypeService;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.daos.MESBasicProductDao;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.daos.MESBasicConfigDao;
import com.supcon.orchid.MESBasic.services.MESBasicConfigService;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.daos.MESBasicRoutineDao;
import com.supcon.orchid.MESBasic.services.MESBasicRoutineService;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.daos.MESBasicTankModelDao;
import com.supcon.orchid.MESBasic.services.MESBasicTankModelService;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.daos.MESBasicDataTransDao;
import com.supcon.orchid.MESBasic.services.MESBasicDataTransService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.tree.PrepareData;
import com.supcon.orchid.tree.Tree;
import com.supcon.orchid.tree.TreeDao;
import javax.annotation.Resource;
/* CUSTOM CODE START(serviceimpl,import,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

@Service("mESBasic_prodtypeService")
@Transactional
public class MESBasicProdtypeServiceImpl  extends BaseServiceImpl<MESBasicProdtype> implements MESBasicProdtypeService, InitializingBean, DisposableBean {
	private static final Pattern pattern = Pattern.compile("( AS | as )((\"?)(.*?)(\"?))(,| )");
	private static final Pattern p = Pattern.compile("( JOIN | join )((.*?)) ((\"?)(.*?)(\"?)) ON ");
	private static final Pattern countPattern = Pattern.compile("(SUM\\()((\"?)(.*?)(\"?))(\\) AS | as )");
    @Autowired
	private ACLPermissionHandleService aclPermissionService;
	@Autowired
	private SqlService sqlService;
	@Autowired
	EventService eventService;
	@Autowired
	ScriptService scriptService;
	
	@Autowired
	private DocumentService documentService;
	@Autowired
	private MESBasicContainerDao containerDao;
	@Autowired
	private MESBasicContainerService containerService;
	@Autowired
	private MESBasicPropertyTagsDao propertyTagsDao;
	@Autowired
	private MESBasicPropertyTagsService propertyTagsService;
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
	private MESBasicProdtypeDao prodtypeDao;
	@Autowired
	private MESBasicProductDao productDao;
	@Autowired
	private MESBasicProductService productService;
	@Autowired
	private MESBasicConfigDao configDao;
	@Autowired
	private MESBasicConfigService configService;
	@Autowired
	private MESBasicRoutineDao routineDao;
	@Autowired
	private MESBasicRoutineService routineService;
	@Autowired
	private MESBasicTankModelDao tankModelDao;
	@Autowired
	private MESBasicTankModelService tankModelService;
	@Autowired
	private MESBasicDataTransDao dataTransDao;
	@Autowired
	private MESBasicDataTransService dataTransService;
	
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
			String hql = "select " + businessKeyName + ",id from " + MESBasicProdtype.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = prodtypeDao.createQuery(hql);
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
	public MESBasicProdtype getProdtype(long id){
		return getProdtype(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicProdtype getProdtype(long id, String viewCode){
		MESBasicProdtype prodtype = prodtypeDao.load(id);

		// 一对多情况处理
		return prodtype;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getProdtypeAsJSON(long id, String include){
		MESBasicProdtype prodtype = prodtypeDao.load(id);
		// 一对多情况处理

		if(prodtype == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(prodtype, include, new BAPEntityTransformer());
	}
	

	@Override
	public void deleteProdtype(MESBasicProdtype prodtype){
		beforeDeleteProdtype(prodtype);
		prodtypeDao.delete(prodtype);
		afterDeleteProdtype(prodtype);
		List<MESBasicProdtype> params = new ArrayList<MESBasicProdtype>();
		params.add(prodtype);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_prodtype");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
			// TODO delete
	}
	
	@Override
	public void deleteProdtype(List<Long> prodtypeIds){
		deleteProdtype(prodtypeIds, null);
	}

	@Override
	public void deleteProdtype(List<Long> prodtypeIds, String eventTopic) {
		List<MESBasicProdtype> prodtypes = new ArrayList<MESBasicProdtype>();
		for(Long prodtypeId : prodtypeIds){
			MESBasicProdtype prodtype = getProdtype(prodtypeId);
			prodtypes.add(prodtype);
		}
		
		for(MESBasicProdtype prodtype : prodtypes){
			beforeDeleteProdtype(prodtype);
		}
		
		if(prodtypeIds != null && prodtypeIds.size() > 0) {
			String hql = "update " + MESBasicProdtype.JPA_NAME + " set valid = false where id in(:ids)";
			Query query = prodtypeDao.createQuery(hql);
			query.setParameterList("ids", prodtypeIds);
			query.executeUpdate();
		}
		
		for(MESBasicProdtype prodtype : prodtypes){
			afterDeleteProdtype(prodtype);
		}
		
		if(eventTopic==null){
			for(MESBasicProdtype prodtypez : prodtypes){
				prodtypez.setValid(false);
				List<MESBasicProdtype> params = new ArrayList<MESBasicProdtype>();
				params.add(prodtypez);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "MESBasic_1_prodtype");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	public void deleteProdtype(long prodtypeId, int prodtypeVersion){
		
		MESBasicProdtype prodtype = getProdtype(prodtypeId);
		
		beforeDeleteProdtype(prodtype);
		prodtypeDao.delete(prodtypeId, prodtypeVersion);
		afterDeleteProdtype(prodtype);
		List<MESBasicProdtype> params = new ArrayList<MESBasicProdtype>();
		params.add(prodtype);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_prodtype");
		props.put("eventType", "delete");
	}
	
	
	@Override
	public void deleteProdtype(String prodtypeIds){
		deleteCollection(prodtypeIds);
	}
	
	private void deleteCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			String version = idVersion.split("@")[1];
			if (id != null && id.trim().length() > 0 && version != null && version.trim().length() > 0) {
				deleteProdtype(Long.valueOf(id), Integer.valueOf(version));
			}
		}
	}
	
	
	@Override
	public void saveProdtype(MESBasicProdtype prodtype, DataGridService dataGridService){
		saveProdtype(prodtype, dataGridService, null);
	}
	
	@Override
	public void saveProdtype(MESBasicProdtype prodtype, DataGridService dataGridService, String viewCode){
		saveProdtype(prodtype, dataGridService, viewCode, null);
	}

	private void generateProdtypeCodes(MESBasicProdtype prodtype) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateProdtypeCodes(prodtype, false);
	}
	
	private void generateProdtypeCodes(MESBasicProdtype prodtype, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		prodtypeDao.flush();
		prodtypeDao.clear();
		prodtype = getProdtype(prodtype.getId());
		customGenerateCodes(prodtype, viewIsView);
	}
	
	private void generateProdtypeSummarys(MESBasicProdtype prodtype) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateProdtypeSummarys(prodtype, false);
	}

	private void generateProdtypeSummarys(MESBasicProdtype prodtype, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		prodtypeDao.flush();
		prodtypeDao.clear();
		prodtype = getProdtype(prodtype.getId());
		customGenerateSummarys(prodtype, viewIsView);
	}

	@Override
	public void saveProdtype(MESBasicProdtype prodtype, DataGridService dataGridService, String viewCode, String eventTopic){
		String entityCode = "MESBasic_1_prodtype";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_prodtype");
		String url = null;
		if(prodtype.getId()!=null && prodtype.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_prodtype/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_prodtype/add";
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
				executeGScript(entityCode, "beforeSave", events, prodtype);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(prodtype);
		beforeSaveProdtype(prodtype, viewIsView);

		if (viewIsView) {
			prodtypeDao.saveWithRevertVersion(prodtype);
		} else {
			prodtypeDao.save(prodtype);
		}

		if (dataGridService != null) {
			prodtypeDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		afterSaveProdtype(prodtype, viewIsView);
		// 根据配置规则生成编码
		try {
			generateProdtypeCodes(prodtype, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e);
		}
		// 根据配置规则生成摘要
		try {
			generateProdtypeSummarys(prodtype, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e);
		}


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, prodtype);
			}
		}
		List<MESBasicProdtype> params = new ArrayList<MESBasicProdtype>();
		prodtypeDao.flush();
		prodtypeDao.clear();
		prodtype = prodtypeDao.load(prodtype.getId());
		
		
		params.add(prodtype);
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, MESBasicProdtype prodtype){
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
						variables.put("prodtype", prodtype);
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
	public void mergeProdtype(MESBasicProdtype prodtype, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(prodtype);
		beforeSaveProdtype(prodtype);
		prodtypeDao.merge(prodtype);

		if (dataGridService != null) {
			dataGridService.execute();
		}

		afterSaveProdtype(prodtype);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<MESBasicProdtype> findProdtypes(Page<MESBasicProdtype> page, Criterion... criterions) {
		return prodtypeDao.findByPage(page, criterions);
	}
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	private MESBasicProdtypeDealInfo getDealInfoEntity(Long tableInfoId) {
		
		List<MESBasicProdtypeDealInfo> list=prodtypeDao.createQuery("from " + MESBasicProdtypeDealInfo.JPA_NAME + " where tableInfoId=?", tableInfoId).setMaxResults(1).list();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void saveDealInfo(MESBasicProdtypeDealInfo dealInfo) {
		prodtypeDao.saveDealInfo(dealInfo);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public int getDealInfoCount(Long tableInfoId) {
		String sql = "SELECT count(1) totalCount " + "FROM "+MESBasicProdtypeDealInfo.TABLE_NAME+" DI " + "LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME
				+ " S ON S.ID=U.STAFF_ID " + "WHERE DI.TABLE_INFO_ID = ?";
		Number list = (Number) prodtypeDao.createNativeQuery(sql, tableInfoId).uniqueResult();
		return list.intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag) {
		String sql = "SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, WT.TYPE "
				+ " FROM "+MESBasicProdtypeDealInfo.TABLE_NAME + " DI " 
				+ " LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION "
				+ " LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID "
				+ " WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION is not null ";
		if (expandFlag) {
			sql += " AND DI.COMMENTS IS NOT NULL";
			DBTYPE dbtype = prodtypeDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				sql += " AND DI.COMMENTS != ''";
			}
		}
		sql += " ORDER BY DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC";
		List<Object[]> list = prodtypeDao.createNativeQuery(sql, tableInfoId).list();
		for(Object[] obj:list){
			if(obj[2]!=null){
				obj[2]=HtmlUtils.htmlEscape(obj[2].toString().trim());
			}
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, List<Object[]>> findDealInfosGroup(Long tableInfoId, boolean expandFlag) {
		StringBuilder groupSql = new StringBuilder();
		groupSql.append("SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, DI.ACTIVITY_NAME AN, WT.NAME TDESC, WT.TYPE, WT.SHOW_IN_SIMPLE_DEALINFO ");
		groupSql.append(" FROM "
				+ MESBasicProdtypeDealInfo.TABLE_NAME
				+ " DI LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION ");
		groupSql.append(" LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID ");
		groupSql.append(" WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION IS NOT NULL ");
		if (expandFlag) {
			groupSql.append(" AND DI.COMMENTS IS NOT NULL");
			DBTYPE dbtype = prodtypeDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				groupSql.append(" AND DI.COMMENTS != ''");
			}
		}
		groupSql.append(" ORDER BY WT.ROUTE_SEQUENCE ASC, DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC");

		List<Object[]> groupList = prodtypeDao.createNativeQuery(groupSql.toString(), tableInfoId).list();
		Map<String, List<Object[]>> groupMap = new LinkedHashMap<String, List<Object[]>>();
		List<Object[]> otherList = new ArrayList<Object[]>();
		for (Object[] obj : groupList) {
			if (obj[0] != null) {
				obj[0] = InternationalResource.get(obj[0].toString(), getCurrentLanguage());
			}
			if (obj[2] != null) {
				obj[2] = HtmlUtils.htmlEscape(obj[2].toString().trim());
			}
			if (obj[12] != null) {
				obj[12] = InternationalResource.get(obj[12].toString(), getCurrentLanguage());
			}
			if(null != obj[11]) {
				if (!groupMap.containsKey(obj[11].toString())) {
					List<Object[]> diList = new ArrayList<Object[]>();
					diList.add(obj);
					groupMap.put(obj[11].toString(), diList);
				} else {
					List<Object[]> exsitDiList = groupMap.get(obj[11].toString());
					exsitDiList.add(obj);
					groupMap.put(obj[11].toString(), exsitDiList);
				}
			} else {
				otherList.add(obj);
			}
		}
		if(null != otherList && !otherList.isEmpty()) {
			groupMap.put("bap_other", otherList);
		}
		return groupMap;
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
	public void findProdtypes(Page<MESBasicProdtype> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params) {
		findProdtypes(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findProdtypes(Page<MESBasicProdtype> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findProdtypes(Page<MESBasicProdtype> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Object... objects) {
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
	private void commonQuery(Page<MESBasicProdtype> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
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
						String tableAlias = lastDotPos < 0 ? "\"prodtype\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
						s.append(" AND \"prodtype\".CID = ").append(getCurrentCompanyId());
					}
				}
				
//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
//					if(type == Sql.TYPE_LIST_PENDING) {
//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_QUERY){
//						s.append(" AND \"prodtype\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_REFERENCE){
//						if(null != crossCompanyFlag && !crossCompanyFlag){
//							s.append(" AND \"prodtype\".CID = ").append(getCurrentCompanyId());
//						}
//					}
//				}
				s.append(" ) ");
			}
			// ////PowerCondition

			
			String customCondition=getCustomCondition(page, viewCode, type, processKey, params,list);
			if (customCondition!=null&&customCondition.trim().length() > 0) {
				if (hasWhere)
					s.append(" AND ");
				else
					s.append(" WHERE (");
					
				s.append(customCondition);
			}
			
			//一个实体只有一个权限操作
			if(permissionCode == null || permissionCode.length() == 0) {
				permissionCode = viewCode;
			}
			View view = viewServiceFoundation.getView(viewCode);
			boolean needPermission = true;
			if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
				if(view.getShowType().equals(ShowType.PART)){
					//取布局视图
					View layoutView = viewServiceFoundation.getView(permissionCode);
					if(null != layoutView && !layoutView.getIsPermission()){//未启用权限
						needPermission = false;
					}
				} else {
					if(null != view && !view.getIsPermission()){//未启用权限
						needPermission = false;
					}
				}
			}
			if(needPermission){
				String powerCode = permissionCode + "_self";
				if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
					if(view.getShowType().equals(ShowType.PART)){
						powerCode = permissionCode;
					} else if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
						powerCode = "MESBasic_1_prodtype" + "_" + view.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  prodtypeDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  prodtypeDao.createNativeQuery(powerOperateSql, "MESBasic_1_prodtype").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}	
					String	pc = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"prodtype\"","MESBasic_1_prodtype",customCondition,"MESBASIC_PRODTYPES",false);
				if (pc.trim().length() > 0) {
					if (hasWhere)
						s.append(" AND ");
					else
						s.append(" WHERE (");
						
					s.append(pc);
				}
			}
			
			if(null!=processKey&&!processKey.equals("")){
				if(type == Sql.TYPE_LIST_QUERY){
					
					if (hasWhere)
						s.append(" AND ");
					else
						s.append(" WHERE (");
					String[] arr=processKey.split(",");
					String pendingSql="";
					for(String str:arr){
						if(!"".equals(pendingSql)){
							pendingSql+=" or D.PROCESS_KEY = ? ";
						}else{
							pendingSql+=" D.PROCESS_KEY = ? ";
						}
						list.add(str);
					}
					if(!"".equals(pendingSql)){
						s.append(" \"prodtype\".TABLE_INFO_ID IN (  SELECT   D.TABLE_INFO_ID "+
	                      "   FROM   "+MESBasicProdtypeDealInfo.TABLE_NAME+" d "+
	                      "  WHERE   ("+pendingSql+") "+
	                      " GROUP BY   D.TABLE_INFO_ID) ");
					}
					
				}else if(type==Sql.TYPE_LIST_PENDING){
					if (hasWhere)
						s.append(" AND ");
					else
						s.append(" WHERE (");
					
					String[] arr=processKey.split(",");
					String pendingSql="";
					for(String str:arr){
						if(!"".equals(pendingSql)){
							pendingSql+=" or  \"p\".PROCESS_KEY = ? ";
						}else{
							pendingSql+=" \"p\".PROCESS_KEY = ? ";
						}
						list.add(str);
					}
					if(!"".equals(pendingSql)){
						s.append(" ("+pendingSql+")");
					}
				}
				
			}
			s.append(") ");
			
			
			if (referenceCondition != null && referenceCondition.length() > 0) {
				s.append(" AND (").append(referenceCondition).append(")");
			}
			if(queryType == 1) {
				s.append(" AND \"prodtype\".STATUS = 99 ");
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
				orderPart.append(" \"p\".ID DESC");
			} else {
				orderPart.append(" \"prodtype\".ID DESC");
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
			SQLQuery query = prodtypeDao.createNativeQuery(realSql, arr);
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) prodtypeDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    List<Map<String, Object>> resultCountList = (List<Map<String, Object>>) prodtypeDao.createNativeQuery(countSql, arr)
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
			List<MESBasicProdtype> result = getResult(page, query, new PendingResultTransformer(MESBasicProdtype.class,prodtypeDao,maps));
			page.setResult(result);
			if(null != hasAttachment && hasAttachment) {
				for (MESBasicProdtype prodtype : result) {
					long count = 0l;
					count = documentService.getCountByLinkIdAndType(prodtype.getId(), "MESBasic_prodtype_prodtype");
					if(count > 0) {
						List<Document> documents = documentService.getByLinkIdAndType(prodtype.getId(), "MESBasic_prodtype_prodtype");
						if(null != documents && !documents.isEmpty()) {
							prodtype.setDocument(documents.get(0));
							prodtype.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
						}
					}
				}
			}
			for (MESBasicProdtype prodtype : result) {
			}	
		}
	}
	
	
	

	protected EntityTableInfo getTableInfo(MESBasicProdtype prodtype) {
		EntityTableInfo ti = new EntityTableInfo();


		ti.setOwnerStaffId(prodtype.getOwnerStaffId());
		ti.setOwnerPositionId(prodtype.getOwnerPositionId());
		ti.setOwnerDepartmentId(prodtype.getOwnerDepartmentId());
		
		ti.setCreateStaff(prodtype.getCreateStaff());
		ti.setCreateStaffId(prodtype.getCreateStaffId());
		ti.setCreateTime(prodtype.getCreateTime());
		ti.setDeleteStaff(prodtype.getDeleteStaff());
		ti.setDeleteStaffId(prodtype.getDeleteStaffId());
		ti.setDeleteTime(prodtype.getDeleteTime());
		ti.setCreateDepartmentId(prodtype.getCreateDepartmentId());
		ti.setModifyStaff(prodtype.getModifyStaff());
		ti.setModifyStaffId(prodtype.getModifyStaffId());
		ti.setCreatePositionId(prodtype.getCreatePositionId());
		ti.setPositionLayRec(prodtype.getPositionLayRec());
		ti.setTableNo(prodtype.getTableNo());
		ti.setValid(true);
		ti.setTargetEntityCode("MESBasic_1_prodtype");
		ti.setTargetTableName("MESBASIC_PRODTYPES");
		
		return ti;
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
			mnecodeSql.append(" WHERE UPPER(\"").append("prodtype.mc\"").append(".MNE_CODE) like UPPER(?) AND \"prodtype\".VALID = 1");
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
				mnecodeSql.append(" AND \"prodtype\".CID = ?");
				totalValues.add(getCurrentCompanyId());
			}
			
			SQLQuery query = prodtypeDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
			resultList = query.setMaxResults(showNumber).list();
		}
		
		return resultList;
		
	}

	@Override
	public void destroy() throws Exception {
		beforeServiceDestroy();
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		this.counter = this.counterManager.addCounter("prodtype", "MESBasic_1_prodtype", "prodtype_{0,date,yyyyMMdd}_{1,number,000}", CounterType.Daily);
		String formatStr = null;
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=prodtypeDao.createNativeQuery(sql, menuCode);
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

	protected String getEntityCode(){return MESBasicProdtype.ENTITY_CODE;}
	protected String getModuleCode(){return MESBasicProdtype.MODULE_CODE;}
	protected String getModelCode(){return MESBasicProdtype.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param prodtype 模型实例
	 */
	private void checkUniqueConstraint(MESBasicProdtype prodtype){
	}
	
	
	private void beforeSaveProdtype(MESBasicProdtype prodtype, Object... objects){
		checkUniqueConstraint(prodtype);
	/* CUSTOM CODE START(serviceimpl,beforeSave,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveProdtype(MESBasicProdtype prodtype, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportProdtype(List<MESBasicProdtype> prodtypes, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportProdtype(List<MESBasicProdtype> prodtypes){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeDeleteProdtype(MESBasicProdtype prodtype){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterDeleteProdtype(MESBasicProdtype prodtype){
	/* CUSTOM CODE START(serviceimpl,afterDelete,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateCodes(MESBasicProdtype prodtype, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(MESBasicProdtype prodtype, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}

	
	@Override
	public List<MESBasicProdtype> getProdtypes(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicProdtype.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return prodtypeDao.findByHql("from " + MESBasicProdtype.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return prodtypeDao.findByCriteria(detachedCriteria);
	}
	
	@Override
	public MESBasicProdtype loadProdtypeByBussinessKey(MESBasicProdtype prodtype){
		return prodtypeDao.findEntityByCriteria(Restrictions.eq("id", prodtype.getId()));
	}
	
	@Override
	public Page<MESBasicProdtype> getProdtypes(Page<MESBasicProdtype> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicProdtype.class);
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
				page = prodtypeDao.findByPage(page, sql);
			}else{
				page = prodtypeDao.findAllByPage(page);
			}
			return page;
		}
		page = prodtypeDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	/* CUSTOM CODE START(serviceimpl,functions,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}