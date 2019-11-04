package com.supcon.orchid.RM.services.impl;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map; 
import java.util.Arrays;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.supcon.orchid.audit.annotation.AuditLog;
import com.supcon.orchid.audit.entities.AuditUtil;
import com.supcon.orchid.id.IdGenerator;
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
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.osgi.framework.BundleContext;
import org.osgi.framework.FrameworkUtil;
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
import com.supcon.orchid.counter.support.NonCachedCounterBean;
import com.supcon.orchid.RM.services.RMFormulaClassService;
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
import com.supcon.orchid.ec.entities.CustomPropertyModelMapping;
import com.supcon.orchid.ec.entities.CustomPropertyViewMapping;
import com.supcon.orchid.ec.entities.Sql;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.ec.entities.DataGrid;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Event;
import com.supcon.orchid.ec.entities.ExtraView;
import com.supcon.orchid.ec.services.ConditionService;
import com.supcon.orchid.ec.services.SqlService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.ec.services.EventService;
import com.supcon.orchid.ec.services.DataGridService;
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
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.daos.RMFormulaChangeDao;
import com.supcon.orchid.RM.services.RMFormulaChangeService;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.daos.RMCheckDepartmentSetDao;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetService;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.daos.RMFormulaDao;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.daos.RMFormulaBeforeProcessDao;
import com.supcon.orchid.RM.services.RMFormulaBeforeProcessService;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.daos.RMFormulaBomDao;
import com.supcon.orchid.RM.services.RMFormulaBomService;
import com.supcon.orchid.RM.entities.RMFormulaClass;
import com.supcon.orchid.RM.daos.RMFormulaClassDao;
import com.supcon.orchid.RM.services.RMFormulaClassService;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.daos.RMFormulaMixtureActiveDao;
import com.supcon.orchid.RM.services.RMFormulaMixtureActiveService;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.daos.RMFormulaProcessDao;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.daos.RMFormulaProcessActiveDao;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.daos.RMPrecessStandardsDao;
import com.supcon.orchid.RM.services.RMPrecessStandardsService;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.daos.RMFormulaTypeDao;
import com.supcon.orchid.RM.services.RMFormulaTypeService;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.daos.RMFactoryMapOtherDao;
import com.supcon.orchid.RM.services.RMFactoryMapOtherService;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.daos.RMInterfaceSyncLogDao;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogService;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.daos.RMMQDealinfoDao;
import com.supcon.orchid.RM.services.RMMQDealinfoService;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.daos.RMProcessTypeDao;
import com.supcon.orchid.RM.services.RMProcessTypeService;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.daos.RMStandDao;
import com.supcon.orchid.RM.services.RMStandService;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.daos.RMSampleProjDao;
import com.supcon.orchid.RM.services.RMSampleProjService;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.daos.RMLineFormulaDao;
import com.supcon.orchid.RM.services.RMLineFormulaService;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.daos.RMProcessPointDao;
import com.supcon.orchid.RM.services.RMProcessPointService;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.daos.RMProcessUnitDao;
import com.supcon.orchid.RM.services.RMProcessUnitService;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.daos.RMProcessUnitChoiceDao;
import com.supcon.orchid.RM.services.RMProcessUnitChoiceService;
import com.supcon.orchid.RM.entities.RMTestProj;
import com.supcon.orchid.RM.daos.RMTestProjDao;
import com.supcon.orchid.RM.services.RMTestProjService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.tree.PrepareData;
import com.supcon.orchid.tree.Tree;
import com.supcon.orchid.tree.TreeDao;
import javax.annotation.Resource;
import com.supcon.orchid.ec.entities.Field;
import com.supcon.orchid.ec.entities.Model;
import com.supcon.orchid.ec.entities.Property;
import com.supcon.orchid.ec.services.IBAPBaseService;
import com.supcon.orchid.ec.services.ModelServiceFoundation;
import com.supcon.orchid.ec.enums.RegionType;
import com.supcon.orchid.utils.SerializeUitls;
import com.supcon.orchid.ec.services.EcConfigService;
import com.supcon.orchid.ec.services.FieldService;
import com.supcon.orchid.ec.enums.DbColumnType;
import com.supcon.orchid.workflow.engine.transformers.PendingResultTransformer;
import com.supcon.orchid.RM.daos.impl.RMFormulaClassDaoImpl;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import org.hibernate.jdbc.Work;
import com.supcon.orchid.annotation.BAPIsMneCode;
import com.supcon.orchid.annotation.BAPMneField;
import javax.persistence.Table;
import com.supcon.orchid.utils.MneCodeGenterate;
import com.supcon.orchid.audit.service.DataAuditLogService;
/* CUSTOM CODE START(serviceimpl,import,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */


@Service("rM_formulaClassService")
@Transactional
public class RMFormulaClassServiceImpl  extends BaseServiceImpl<RMFormulaClass> implements RMFormulaClassService, InitializingBean, DisposableBean {
	private static final Pattern pattern = Pattern.compile("( AS | as )((\"?)(.*?)(\"?))(,| )");
	private static final Pattern p = Pattern.compile("( JOIN | join )((.*?)) ((\"?)(.*?)(\"?))( ON | on )");
	private static final Pattern countPattern = Pattern.compile("(SUM\\()((\"?)(.*?)(\"?))(\\) AS | as )");
	@Autowired
	private SqlService sqlService;
	@Autowired
	EventService eventService;
	@Autowired
	ScriptService scriptService;
	@Autowired
	private IdGenerator autoGeneratorID;
	@Autowired
	private DataAuditLogService dataAuditLogService;
	
	@Autowired
	private DocumentService documentService;
	@Autowired
	private RMFormulaChangeDao formulaChangeDao;
	@Autowired
	private RMFormulaChangeService formulaChangeService;
	@Autowired
	private RMCheckDepartmentSetDao checkDepartmentSetDao;
	@Autowired
	private RMCheckDepartmentSetService checkDepartmentSetService;
	@Autowired
	private RMFormulaDao formulaDao;
	@Autowired
	private RMFormulaService formulaService;
	@Autowired
	private RMFormulaBeforeProcessDao formulaBeforeProcessDao;
	@Autowired
	private RMFormulaBeforeProcessService formulaBeforeProcessService;
	@Autowired
	private RMFormulaBomDao formulaBomDao;
	@Autowired
	private RMFormulaBomService formulaBomService;
	@Autowired
	private RMFormulaClassDao formulaClassDao;
	@Autowired
	private RMFormulaMixtureActiveDao formulaMixtureActiveDao;
	@Autowired
	private RMFormulaMixtureActiveService formulaMixtureActiveService;
	@Autowired
	private RMFormulaProcessDao formulaProcessDao;
	@Autowired
	private RMFormulaProcessService formulaProcessService;
	@Autowired
	private RMFormulaProcessActiveDao formulaProcessActiveDao;
	@Autowired
	private RMFormulaProcessActiveService formulaProcessActiveService;
	@Autowired
	private RMPrecessStandardsDao precessStandardsDao;
	@Autowired
	private RMPrecessStandardsService precessStandardsService;
	@Autowired
	private RMFormulaTypeDao formulaTypeDao;
	@Autowired
	private RMFormulaTypeService formulaTypeService;
	@Autowired
	private RMFactoryMapOtherDao factoryMapOtherDao;
	@Autowired
	private RMFactoryMapOtherService factoryMapOtherService;
	@Autowired
	private RMInterfaceSyncLogDao interfaceSyncLogDao;
	@Autowired
	private RMInterfaceSyncLogService interfaceSyncLogService;
	@Autowired
	private RMMQDealinfoDao mQDealinfoDao;
	@Autowired
	private RMMQDealinfoService mQDealinfoService;
	@Autowired
	private RMProcessTypeDao processTypeDao;
	@Autowired
	private RMProcessTypeService processTypeService;
	@Autowired
	private RMStandDao standDao;
	@Autowired
	private RMStandService standService;
	@Autowired
	private RMSampleProjDao sampleProjDao;
	@Autowired
	private RMSampleProjService sampleProjService;
	@Autowired
	private RMLineFormulaDao lineFormulaDao;
	@Autowired
	private RMLineFormulaService lineFormulaService;
	@Autowired
	private RMProcessPointDao processPointDao;
	@Autowired
	private RMProcessPointService processPointService;
	@Autowired
	private RMProcessUnitDao processUnitDao;
	@Autowired
	private RMProcessUnitService processUnitService;
	@Autowired
	private RMProcessUnitChoiceDao processUnitChoiceDao;
	@Autowired
	private RMProcessUnitChoiceService processUnitChoiceService;
	@Autowired
	private RMTestProjDao testProjDao;
	@Autowired
	private RMTestProjService testProjService;
	
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
	@Autowired
	private ModelServiceFoundation modelServiceFoundation;
	@Resource
	private IBAPBaseService<RMFormulaClass> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + RMFormulaClass.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)";
		Query query =  formulaClassDao.createQuery(hql);
		query.setParameterList("mainDisplayKeys", mainDisplayKeys);
		List<Object[]> list = query.list();
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("count", list.size());
		Map<Serializable, Serializable> map = new HashMap<Serializable, Serializable>();
		if (list != null && !list.isEmpty()) {
			for (Object[] objs : list) {
				map.put((Serializable) (String.valueOf(objs[0])), (Serializable) objs[1]);
				map.put(businessKeyName, (Serializable) objs[2]);
			}
		}
		m.put("idMap", map);
		return m;
	}
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
			String hql = "select " + businessKeyName + ",id from " + RMFormulaClass.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = formulaClassDao.createQuery(hql);
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
	public RMFormulaClass getFormulaClass(long id){
		return getFormulaClass(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public RMFormulaClass getFormulaClass(long id, String viewCode){
		RMFormulaClass formulaClass = formulaClassDao.load(id);

		// 一对多情况处理
		return formulaClass;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getFormulaClassAsJSON(long id, String include){
		RMFormulaClass formulaClass = formulaClassDao.load(id);
		// 一对多情况处理

		if(formulaClass == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(formulaClass, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="删除",operType="3")
	public void deleteFormulaClass(RMFormulaClass formulaClass){
		beforeDeleteFormulaClass(formulaClass);
		formulaClassDao.deletePhysical(formulaClass);
		afterDeleteFormulaClass(formulaClass);
		List<RMFormulaClass> params = new ArrayList<RMFormulaClass>();
		params.add(formulaClass);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
			// TODO delete
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="删除",operType="3")
	public void deleteFormulaClass(List<Long> formulaClassIds){
		deleteFormulaClass(formulaClassIds, null);
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="删除",operType="3")
	public void deleteFormulaClass(List<Long> formulaClassIds, String eventTopic) {
		List<RMFormulaClass> formulaClasss = new ArrayList<RMFormulaClass>();
		for(Long formulaClassId : formulaClassIds){
			RMFormulaClass formulaClass = getFormulaClass(formulaClassId);
			formulaClasss.add(formulaClass);
		}
		
		for(RMFormulaClass formulaClass : formulaClasss){
			beforeDeleteFormulaClass(formulaClass);
		}
		
		/**
		 * 真删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(formulaClasss != null && formulaClasss.size() > 0 ){
			for(RMFormulaClass formulaClass : formulaClasss){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				java.lang.reflect.Field[] fields = RMFormulaClass.class.getDeclaredFields();
				try {
					for(java.lang.reflect.Field field : fields){
						field.setAccessible(true);
						try{
							field.get(null);
							continue;
						}catch(NullPointerException e){
							if(field.getName().equalsIgnoreCase("bapAttachmentInfo")
									||field.getName().equalsIgnoreCase("document")
									||field.getName().equalsIgnoreCase("company")){
								continue;
							}
							propertyNames.add(field.getName());
							previousState.add(field.get(formulaClass));
						}
					}
					dataAuditLogService.saveCustomerAudit("删除",formulaClass, formulaClass.getId(), null, previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
				} catch (IllegalArgumentException | IllegalAccessException e) {
				}
			}
		}
		if(formulaClassIds != null && formulaClassIds.size() > 0) {
			String hql = "delete " + RMFormulaClass.JPA_NAME + " where id in(:ids)";
			Query query = formulaClassDao.createQuery(hql);
			query.setParameterList("ids", formulaClassIds);
			query.executeUpdate();
		}
		
		for(RMFormulaClass formulaClass : formulaClasss){
			afterDeleteFormulaClass(formulaClass);
		}
		
		if(eventTopic==null){
			for(RMFormulaClass formulaClassz : formulaClasss){
				formulaClassz.setValid(false);
				List<RMFormulaClass> params = new ArrayList<RMFormulaClass>();
				params.add(formulaClassz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "RM_7.5.0.0_formula");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="删除",operType="3")
	public void deleteFormulaClass(long formulaClassId, int formulaClassVersion){
		
		RMFormulaClass formulaClass = getFormulaClass(formulaClassId);
		
		beforeDeleteFormulaClass(formulaClass);
		formulaClassDao.delete(formulaClassId, formulaClassVersion);
		afterDeleteFormulaClass(formulaClass);
		List<RMFormulaClass> params = new ArrayList<RMFormulaClass>();
		params.add(formulaClass);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		props.put("eventType", "delete");
	}
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="删除",operType="3")
	public void deleteFormulaClass(String formulaClassIds){
		deleteCollection(formulaClassIds);
	}
	
	private void deleteCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			String version = idVersion.split("@")[1];
			if (id != null && id.trim().length() > 0 && version != null && version.trim().length() > 0) {
				deleteFormulaClass(Long.valueOf(id), Integer.valueOf(version));
			}
		}
	}
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="批量导入",operType="4")
	public  void batchImportBaseFormulaClass(List<RMFormulaClass>  formulaClasss){
		for(RMFormulaClass formulaClass:formulaClasss)  {
			saveFormulaClass(formulaClass, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBaseFormulaClass(List<RMFormulaClass>  formulaClasss){
		for(RMFormulaClass formulaClass:formulaClasss)  {
			saveFormulaClass(formulaClass, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="保存")
	public void saveFormulaClass(RMFormulaClass formulaClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		saveFormulaClass(formulaClass, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="保存")
	public void saveFormulaClass(RMFormulaClass formulaClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		saveFormulaClass(formulaClass, dgLists,dgDeleteIDs,assFileUploads, viewCode, null);
	}


	private void generateFormulaClassCodes(RMFormulaClass formulaClass) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateFormulaClassCodes(formulaClass, false);
	}
	
	private void generateFormulaClassCodes(RMFormulaClass formulaClass, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	private void generateFormulaClassSummarys(RMFormulaClass formulaClass) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateFormulaClassSummarys(formulaClass, false);
	}

	private void generateFormulaClassSummarys(RMFormulaClass formulaClass, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass")
	public void saveFormulaClass(RMFormulaClass formulaClass,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, boolean... isImport){
		boolean isNew = false;
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(formulaClass.getId()!=null && formulaClass.getId()>0){
			AuditUtil.setAuditDes("修改");
			AuditUtil.setAuditOperationType("2");
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/modify";
		}else{
			isNew = true;
			AuditUtil.setAuditDes("新增");
			AuditUtil.setAuditOperationType("1");
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/add";
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
				executeGScript(entityCode, "beforeSave", events, formulaClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formulaClass);
		beforeSaveFormulaClass(formulaClass, viewIsView);

		if (viewIsView) {
			formulaClassDao.saveWithRevertVersion(formulaClass);
		} else {
			if(isNew)
					formulaClassDao.save(formulaClass);
				else
					formulaClassDao.merge(formulaClass);
		}
		dealDatagridsSave(formulaClass,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateFormulaClassCodes(formulaClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaClassSummarys(formulaClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormulaClass(formulaClass, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formulaClass);
			}
		}
		List<RMFormulaClass> params = new ArrayList<RMFormulaClass>();
		formulaClassDao.flush();
		formulaClassDao.clear();
		formulaClass = formulaClassDao.load(formulaClass.getId());
		
		
		params.add(formulaClass);
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, RMFormulaClass formulaClass){
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
						variables.put("formulaClass", formulaClass);
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
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass")
	public void mergeFormulaClass(RMFormulaClass formulaClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(formulaClass);
		beforeSaveFormulaClass(formulaClass);
		formulaClassDao.merge(formulaClass);

		dealDatagridsSave(formulaClass,null,dgLists,dgDeleteIDs,assFileUploads);

		afterSaveFormulaClass(formulaClass);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<RMFormulaClass> findFormulaClasss(Page<RMFormulaClass> page, Criterion... criterions) {
		return formulaClassDao.findByPage(page, criterions);
	}
	private static String matchSql(Pattern p, String sql, String prefix, Map<String, String> maps, int n1, int n2) {
		Matcher matcher = p.matcher(sql);
		int i = 1;
		if (null == maps)
			maps = new HashMap<String, String>();
		while (matcher.find()) {
			String tag = (matcher.group(n1));// 含引号
			if(tag.contains("_")){
				tag = "\"" + tag.substring(tag.indexOf("_")+1,tag.length()-1) + "\"";
			}
			String tag2 = (matcher.group(n2));// 不含引号
			if(tag2.contains("_")){
				tag2 = tag2.substring(tag2.indexOf("_")+1,tag2.length());
			}
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
	public void findFormulaClasss(Page<RMFormulaClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, List<Param> params) {
		findFormulaClasss(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findFormulaClasss(Page<RMFormulaClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findFormulaClasss(Page<RMFormulaClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Object... objects) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql ,objects);
	}
	
	/**
	 * 生成自定义字段查询sql
	 * @param viewCode 视图code
	 * @param sql 查询sql
	 * @return
	 */
	private String generateCustomPropertySql(String viewCode, String sql) {
		View v = viewServiceFoundation.getView(viewCode);
		if (v != null && v.getHasCustomSection() != null && v.getHasCustomSection()) {
			StringBuilder selectSql = new StringBuilder();
			StringBuilder joinSql = new StringBuilder();
			List<CustomPropertyViewMapping> viewMapppingList = viewServiceFoundation.getCustomPropertyViewMappings(viewCode);
			if (viewMapppingList != null && viewMapppingList.size() > 0) {
				Set<String> propLayRecSet = new HashSet<String>();
				for (CustomPropertyViewMapping viewMapping : viewMapppingList) {
					if (viewMapping.getPropertyLayRec() != null && viewMapping.getPropertyLayRec().length() > 0) {
						String[] layRecArr = viewMapping.getPropertyLayRec().split("\\|\\|");
						if (!layRecArr[0].contains(".")) {
						    if (null != sql && sql.indexOf(viewMapping.getProperty().getColumnName()) == -1) {
								selectSql.append(",\"").append(layRecArr[0]).append("\".").append(viewMapping.getProperty().getColumnName()).append(" AS ")
										.append("\"").append(viewMapping.getProperty().getName()).append("\"");
							}
						} else {
							propLayRecSet.add(viewMapping.getPropertyLayRec());
							String modelAlias = layRecArr[0].substring(layRecArr[0].indexOf(".") + 1);
							if (null != sql && sql.indexOf(viewMapping.getProperty().getColumnName()) == -1) {
								selectSql.append(",\"cp_").append(modelAlias).append("\".").append(viewMapping.getProperty().getColumnName()).append(" AS ")
										.append("\"cp_").append(modelAlias).append(".").append(viewMapping.getProperty().getName()).append("\"");
							}
						}
					}
				}
				if (propLayRecSet != null && propLayRecSet.size() > 0) {
					Set<String> tmpPropLayRecSet = new HashSet<String>();
					tmpPropLayRecSet.addAll(propLayRecSet);
					for (Iterator<String> iter = propLayRecSet.iterator(); iter.hasNext();) {
						String propLayRec = iter.next();
						String alias1 = propLayRec.split("\\|\\|")[0];
						for (String tmpPropLayRec : tmpPropLayRecSet) {
							String alias2 = tmpPropLayRec.split("\\|\\|")[0];
							if (!alias2.equals(alias1) && alias2.startsWith(alias1)) {
								iter.remove();
								break;
							}
						}
					}
					for (String propLayrec : propLayRecSet) {
						String[] layRecArr = propLayrec.split("\\|\\|");
						String modelAlias = layRecArr[0].substring(layRecArr[0].indexOf(".") + 1);
						String mainModelAlias = layRecArr[0].substring(0, layRecArr[0].indexOf("."));
						String[] modelAliasTuple = modelAlias.split("\\.");
						String[] relations = layRecArr[1].split("\\-");
						String modelAlias1 = "";
						String modelAlias2 = "";
						for (int i = 0; i < relations.length; i++) {
							String[] relationArr = relations[i].split(",");
							String tableName1 = relationArr[0];
							String colName1 = relationArr[1];
							// String tableName2 = relationArr[2];
							String colName2 = relationArr[3];
							modelAlias1 += (i > 0 ? "." + modelAliasTuple[i] : modelAliasTuple[i]);
							if (i > 0) {
								modelAlias2 += (i > 1 ? "." + modelAliasTuple[i - 1] : modelAliasTuple[i - 1]);
							}
							joinSql.append(" LEFT OUTER JOIN ").append(tableName1).append(" \"cp_").append(modelAlias1).append("\"").append(" ON \"cp_")
									.append(modelAlias1).append("\".").append(colName1).append(" = \"");
							if (i > 0) {
								joinSql.append("cp_").append(modelAlias2);
							} else {
								joinSql.append(mainModelAlias);
							}
							joinSql.append("\".").append(colName2);
						}
					}
				}
				if (selectSql.length() > 0) {
					sql = sql.substring(0, sql.indexOf(" FROM ")) + selectSql.toString() + sql.substring(sql.indexOf(" FROM "));
					if (joinSql.length() > 0) {
						sql += joinSql.toString();
					}
				}
			}
		}
		return sql;
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
	private void commonQuery(Page<RMFormulaClass> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Object... objects) {
		int queryType = 0;
		if(objects.length > 0) {
			queryType = (int) objects[0];
		}
		String sql = sqlService.getSqlQuery(viewCode, type);
		 
		if(!exportSql.trim().isEmpty() ) {
			if(page.isExportFlag() && sql != null && sql.contains("LEFT OUTER JOIN")){//如果用于导出，sql里的left outer join的内容拼到exportSql里
				String sql2 = sql;
				if(sql2.contains("LEFT OUTER JOIN")){
					sql2 = sql2.substring(sql2.indexOf("LEFT OUTER JOIN"), sql2.length());
					String tableNames[] = sql2.split("LEFT OUTER JOIN");
					for(String str : tableNames){
						if(str!=null && !str.equals("") && str.contains(" ON ")){
							String tableNames2[] = str.split(" ON ");
							if(tableNames2[0]!=null && !tableNames2[0].equals("") && !exportSql.contains(tableNames2[0].trim())){
								exportSql += " LEFT OUTER JOIN" + str;
							}
						}
					}
					sql = exportSql;
				}	
			}else{//如果存在导出下配置的sql则进行替换
				sql=exportSql;	
			}
		} 
		 
		// 自定义字段sql拼接
		sql = generateCustomPropertySql(viewCode, sql);
		String countSql = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TOTALS);
		if(!exportSql.trim().isEmpty())  {
			//FIXME  有小节配置时,需要将小节信息加入
			countSql="SELECT COUNT(*) count FROM ";	
		}
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
				String classifyCodes = "";
				List<Object> advValues = null;
				String fastQuery = "";
				List<Object> fastValues = null;
				String extraQuery = "";
				List<Object> customerValues = null;
				List<Object> extraQueryValues = null;
				List<Object> customerSqlValues = null;
				List<Object> classifySqlValues = null;
				//组合where条件
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
					//数据分类内的高级查询
					if ("classifyCodes".equals(param.getName())) {
						classifyCodes = (String)param.getValue();
						continue;
					}
					
					if ("fastQueryCond".equals(param.getName())) {
						AdvQueryCondition cond = conditionService.toSql((String) param.getValue());
						if (cond != null) {
							fastValues = cond.getValues();
							fastQuery = cond.getSql();
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
						String key = null, columnName = null,customKey = null;
						if(sortValue.indexOf("::") > 0) {
							key = sortValue.split("::")[0];
							columnName = sortValue.split("::")[1];
							if(key.indexOf(".") > 0 && key.contains("attrMap")){//自定义字段
								key = key.split("\\.")[1];
								if(key.startsWith("cp_")){//判断排序字段是否是关联模型的字段
									key = key.substring(3).replace("_", ".");
								}
							}
						}else {
							key = sortValue;
						}
						int lastDotPos = key.lastIndexOf('.');
						if(null == columnName || "undefined".equals(columnName)) {
							columnName = Inflector.getInstance().columnize(key.substring(lastDotPos + 1));
						}
						String tableAlias = lastDotPos < 0 ? "\"formulaClass\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
				if (fastQuery != null && fastQuery.length() > 0) {
					s.append(" AND ").append(fastQuery);
					if (fastValues != null) {
						list.addAll(fastValues);
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
						s.append(" AND \"formulaClass\".CID = ").append(getCurrentCompanyId());
					}
				}
				
//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
//					if(type == Sql.TYPE_LIST_PENDING) {
//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_QUERY){
//						s.append(" AND \"formulaClass\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_REFERENCE){
//						if(null != crossCompanyFlag && !crossCompanyFlag){
//							s.append(" AND \"formulaClass\".CID = ").append(getCurrentCompanyId());
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
			s.append(" ( \"formulaClass\".TABLE_INFO_ID IN ( SELECT TABLE_INFO_ID FROM RM_FORMULAS \"formula\" ");
			//一个实体只有一个权限操作
			String powerCode = viewCode + "_self";
			View view = viewServiceFoundation.getView(viewCode);
			ExtraView extraView = null;
			boolean isTreeView=false;
			if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
				if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
					powerCode = "RM_7.5.0.0_formula" + "_" + view.getPermissionCode();
				}
			}
			String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
			List<Object> powerCodeList =  formulaClassDao.createNativeQuery(powerCodeSql, powerCode).list();
			if(powerCodeList.size() > 0) {
				powerCode = powerCodeList.get(0).toString();
			} else {
				String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
				List<Object> checkList =  formulaClassDao.createNativeQuery(powerOperateSql, "RM_7.5.0.0_formula").list();
				if(checkList.size()>0){
					powerCode = checkList.get(0).toString();
				}
			}
				String	pc = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formula\"","RM_7.5.0.0_formula","","RM_FORMULAS",false);
			if (pc.trim().length() > 0) {
				s.append(" WHERE (");
				s.append(pc);
				s.append(")");
			}
			s.append(" )");
			s.append(")");
			
			if (type == Sql.TYPE_LIST_PENDING) {
				boolean isMobileRequest = false;
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				if (authentication instanceof OrchidAuthenticationToken) {
					OrchidAuthenticationToken token = (OrchidAuthenticationToken) authentication;
					isMobileRequest = token.getIsMobileRequest() == null ? false : token.getIsMobileRequest();
				}
				if (isMobileRequest) {
					if (hasWhere)
						s.append(" AND ");
					else
						s.append(" WHERE ");
					s.append("(\"p\".MOBILE_APPROVE = 1)");
				}
			}
			
			if (referenceCondition != null && referenceCondition.length() > 0) {
				s.append(" AND (").append(referenceCondition).append(")");
			}
			// 开始处理排序，避免在统计时带入排序条件
			StringBuilder orderPart = new StringBuilder();
			orderPart.append(" ORDER BY ");
			String colOrderByStr = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_ORDERBY);
			int fsIndex = sortOrderByStr.indexOf(".")+1;
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
				if(isTreeView) {
					orderPart.append(" \"formulaClass\".LAY_REC ASC, \"formulaClass\".SORT ASC");
				} else {
					orderPart.append(" \"formulaClass\".ID DESC");
				}
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
			if(isTreeView) {
				page.setPaging(false);
			}
			//计算条数
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) formulaClassDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    List<Map<String, Object>> resultCountList = (List<Map<String, Object>>) formulaClassDao.createNativeQuery(countSql, arr)
					.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
			    if (null != resultCountList && !resultCountList.isEmpty()) {
					Map<String, Object> resultCounts = resultCountList.get(0);
					for (Map.Entry<String, Object> entry : resultCounts.entrySet()) {
						String key = entry.getKey();
						if(maps.containsKey(key)) {
							key = (String) maps.get(key);
						}
						if (key.equalsIgnoreCase("count")) {
							count = ((Number) (null == entry.getValue() ? 0 : entry.getValue())).longValue();
						} else {
							resultTotals.put(key, BigDecimal.valueOf(((Number) (null == entry.getValue() ? 0 : entry.getValue())).doubleValue()));
						}
					}
			    }
			    if(!page.isExportFlag() && !page.isPaging() && count > page.getMaxPageSize()) {
			    	throw new BAPException(BAPException.Code.RESULT_COUNT_EXCEED_MAX_PAGE_SIZE);
			    }
			    page.setTotalCount(count);
			    page.setResultTotals(resultTotals);
			}
			if(!noQueryFlag)  {
				SQLQuery query = formulaClassDao.createNativeQuery(realSql, arr);
				List<RMFormulaClass> result = new ArrayList<RMFormulaClass>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(RMFormulaClass.class,formulaClassDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(RMFormulaClass.class,formulaClassDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (RMFormulaClass formulaClass : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(formulaClass.getId(), "RM_formula_formulaClass");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(formulaClass.getId(), "RM_formula_formulaClass");
							if(null != documents && !documents.isEmpty()) {
								formulaClass.setDocument(documents.get(0));
								formulaClass.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				for (RMFormulaClass formulaClass : result) {
				}	
				if(exportSql.trim().isEmpty()){
					getConfigAssoPropsResult(viewCode, result); // 获取配置的关联模型字段的结果集
				}
			}
		}
	}
	
	
	private View getLayoutView(String permissionCode) {
		if(null!=permissionCode&&permissionCode.indexOf("RM_7.5.0.0_formula")!=-1) {
				String personalCode=permissionCode.substring(permissionCode.indexOf("RM_7.5.0.0_formula")+"RM_7.5.0.0_formula".length()+1);
				if(null!=personalCode&&personalCode.trim().length()>0)  {
						return viewServiceFoundation.getViewWithPermissionCode("RM_7.5.0.0_formula",personalCode);
				}
		}
		return null;
	}
	
	
	private void getConfigAssoPropsResult(String viewCode, List<RMFormulaClass> result) {
		View view = viewServiceFoundation.getView(viewCode);
		List<Field> fields = view.getFields();
		Model origModel = view.getAssModel();
		String origId = modelServiceFoundation.getPropertyColumnName(origModel, "id", false);

		List<Long> ids = new ArrayList<Long>();
		Map<Long, RMFormulaClass> rsMap = new HashMap<Long, RMFormulaClass>();
		for (RMFormulaClass formulaClass : result) {
			ids.add(formulaClass.getId());
			rsMap.put(formulaClass.getId(), formulaClass);
		}
		for (Field f : fields) {
			if (f.getRegionType() == RegionType.LISTPT && f.getCode().startsWith(viewCode + "_LISTPT_ASSO_")) { // 关联模型字段
				Map<String, Object> map = (Map<String, Object>) SerializeUitls.deserialize(f.getConfig());
				Map<String, Object> fieldMap = (Map<String, Object>) map.get("field");
				if (fieldMap.get("assoFlag") != null && "true".equalsIgnoreCase(fieldMap.get("assoFlag").toString())) {
					String assoConfig = (String) fieldMap.get("assoConfig");
					Map<String, Object> configMap = (Map<String, Object>) SerializeUitls.deserialize(assoConfig);
					if (configMap != null && configMap.size() > 0) {
						String sepBegin1 = configMap.get("separatorBeginLevel1") == null ? "" : configMap.get("separatorBeginLevel1").toString();
						String sepEnd1 = configMap.get("separatorEndLevel1") == null ? "" : configMap.get("separatorEndLevel1").toString();
						String sepBegin2 = configMap.get("separatorBeginLevel2") == null ? "" : configMap.get("separatorBeginLevel2").toString();
						String sepEnd2 = configMap.get("separatorEndLevel2") == null ? "" : configMap.get("separatorEndLevel2").toString();

						List<Map<String, Object>> configList = (List<Map<String, Object>>) configMap.get("config");
						Map<String, Object> cfg1 = configList.get(0);
						String propertyCode1 = (String) cfg1.get("propertyCode");
						String[] propArr1 = propertyCode1.split("\\|\\|");
						Property ftProp1 = modelServiceFoundation.getProperty(propArr1[0]);
						Property prop1 = findAssoProperty(ftProp1.getModel().getCode(), view.getAssModel().getCode());
						String id1 = modelServiceFoundation.getPropertyColumnName(prop1.getModel(), "id", false);

						Property prop2 = null;
						String id2 = null;
						for (Map<String, Object> cfgMap : configList) {
							String level = String.valueOf(cfgMap.get("level"));
							if ("2".equals(level)) {
								String propertyCode2 = (String) cfgMap.get("propertyCode");
								String[] propArr2 = propertyCode2.split("\\|\\|");
								Property ftProp2 = modelServiceFoundation.getProperty(propArr2[0]);
								prop2 = findAssoProperty(ftProp2.getModel().getCode(), prop1.getModel().getCode());
								id2 = modelServiceFoundation.getPropertyColumnName(prop2.getModel(), "id", false);
								break;
							}
						}
						List<List<Map<String, Object>>> list1 = new ArrayList<List<Map<String, Object>>>();
						List<List<Map<String, Object>>> list2 = new ArrayList<List<Map<String, Object>>>();
						String lastSep2Level1 = "", lastSep2Level2 = "";
						for (int index = 0; index < configList.size(); index++) {
							Map<String, Object> cfg = configList.get(index);
							String level = String.valueOf(cfg.get("level"));
							String sep1 = cfg.get("separator1") == null ? "" : cfg.get("separator1").toString();
							String sep2 = cfg.get("separator2") == null ? "" : cfg.get("separator2").toString();
							String method = cfg.get("method") == null ? "" : cfg.get("method").toString().toUpperCase();
							String propertyCode = (String) cfg.get("propertyCode");
							
							StringBuilder fromSql = new StringBuilder(" from ");
							StringBuilder whereSql = new StringBuilder(" where ");
							if ("1".equals(level)) {
								lastSep2Level1 = sep2;
								fromSql.append(prop1.getModel().getTableName());
								whereSql.append(prop1.getModel().getTableName()).append(".").append("VALID = 1");
							} else {
								lastSep2Level2 = sep2;
								fromSql.append(prop2.getModel().getTableName());
								whereSql.append(prop2.getModel().getTableName()).append(".").append("VALID = 1");
							}
							String[] propArr = propertyCode.split("\\|\\|");
							for (int i = 0; i < propArr.length - 1; i++) {
								Property tmpProp = modelServiceFoundation.getProperty(propArr[i]);
								Model tmpModel = tmpProp.getModel();
								Property tmpAssoProp = tmpProp.getAssociatedProperty();
								Model tmpAssoModel = tmpAssoProp.getModel();
								fromSql.append(" left join ").append(tmpAssoModel.getTableName());
								fromSql.append(" on ").append(tmpModel.getTableName()).append(".").append(tmpProp.getColumnName()).append(" = ")
										.append(tmpAssoModel.getTableName()).append(".").append(tmpAssoProp.getColumnName());
							}

							String selectSql = "select " + origModel.getTableName() + "." + origId + " AS OID";
							Property laProp = modelServiceFoundation.getProperty(propArr[propArr.length - 1]);
							if (!"".equals(method)) {
								if ("2".equals(level)) {
									selectSql += "," + prop1.getModel().getTableName() + "." + id1 + " AS ID1";
								}
								if ("COUNT".equalsIgnoreCase(method)) {
									Property laPkProperty = null;
									for (Property p : laProp.getModel().getProperties()) {
										if (p.getIsPk() != null && p.getIsPk()) {
											laPkProperty = p;
											break;
										}
									}
									selectSql += ", " + method + " (" + laProp.getModel().getTableName() + "." + laPkProperty.getColumnName() + ") AS VAL";
								} else {
									selectSql += ", " + method + " (" + laProp.getModel().getTableName() + "." + laProp.getColumnName() + ") AS VAL";
								}
							} else {
								selectSql += ", " + prop1.getModel().getTableName() + "." + id1 + " AS ID1";
								if ("2".equals(level)) {
									selectSql += ", " + prop2.getModel().getTableName() + "." + id2 + " AS ID2";
								}
								selectSql += ", " + laProp.getModel().getTableName() + "." + laProp.getColumnName() + " AS VAL";
							}

							if ("2".equals(level)) {
								fromSql.append(" left join ").append(prop1.getModel().getTableName()).append(" on ").append(prop2.getModel().getTableName())
										.append(".").append(prop2.getColumnName()).append(" = ").append(prop1.getModel().getTableName()).append(".")
										.append(prop2.getAssociatedProperty().getColumnName());
								whereSql.append(" and ").append(prop1.getModel().getTableName()).append(".").append("VALID = 1");
							}
							fromSql.append(" left join ").append(origModel.getTableName()).append(" on ").append(prop1.getModel().getTableName()).append(".")
									.append(prop1.getColumnName()).append(" = ").append(origModel.getTableName()).append(".")
									.append(prop1.getAssociatedProperty().getColumnName());
							whereSql.append(" and ").append(origModel.getTableName()).append(".").append("VALID = 1");
							whereSql.append(" and ").append(origModel.getTableName()).append(".").append(origId).append(" in (:ids)");
							String orderSql = " order by ";
							if (!"".equals(method)) {
								whereSql.append(" group by ").append(origModel.getTableName() + "." + origId);
								if ("2".equals(level)) {
									whereSql.append(", ").append(prop1.getModel().getTableName() + "." + id1);
								} 
								orderSql += "2".equals(level) ? "ID1 ASC" : "OID ASC";
							} else {
								orderSql += "2".equals(level) ? "ID2 ASC" : "ID1 ASC";
							}
							String sql = selectSql + fromSql.toString() + whereSql.toString() + orderSql;

							List<Map<String, Object>> rs = new ArrayList<Map<String, Object>>();
							final int PERTIME = 999;
							int count = (ids.size() / PERTIME) + (ids.size() % PERTIME == 0 ? 0 : 1);
							for (int i = 0; i < count; i++) {
								rs.addAll(formulaClassDao.createNativeQuery(sql)
										.setParameterList("ids", ids.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (ids.size() % PERTIME))))
										.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list());
							}
							if (rs.size() > 0) {
								for (Map<String, Object> m : rs) {
									String val = m.get("VAL") == null ? "" : String.valueOf(m.get("VAL"));
									m.put("VAL", sep1 + val + sep2);
								}
								if ("1".equals(level)) {
									list1.add(rs);
								} else if ("2".equals(level)) {
									list2.add(rs);
								}
							}
						}
						List<Map<String, Object>> fList1 = concatListValue(list1);
						List<Map<String, Object>> fList2 = concatListValue(list2);
						if (fList2 != null) {
							for (Map<String, Object> tmpMap1 : fList1) {
								long tmpId1 = ((Number) tmpMap1.get("ID1")).longValue();
								StringBuilder val2 = new StringBuilder();
								val2.append(sepBegin2);
								for (Map<String, Object> tmpMap2 : fList2) {
									long tmpID2 = ((Number) tmpMap2.get("ID1")).longValue();
									if (tmpId1 == tmpID2) {
										val2.append((String) tmpMap2.get("VAL"));
									}
								}
								String val = val2.toString();
								if (!val.equals(sepBegin2)) {
									val = val.substring(0, val.length() - lastSep2Level2.length());
								}
								val += sepEnd2;
								tmpMap1.put("VAL", tmpMap1.get("VAL") + val);
							}
						}
						if (fList1 != null) {
							for (Long tabId : rsMap.keySet()) {
								StringBuilder val1 = new StringBuilder(sepBegin1);
								for (Map<String, Object> tmpMap1 : fList1) {
									long tmpTabId = ((Number) tmpMap1.get("OID")).longValue();
									if (tmpTabId == tabId) {
										val1.append((String) tmpMap1.get("VAL"));
									}
								}
								if (!val1.toString().equals(sepBegin1)) {
									String val = val1.toString();
									if (fList2 == null || fList2.size() < 1){
										val = val.substring(0, val.length() - lastSep2Level1.length());
									}
									val += sepEnd1;
									rsMap.get(tabId).setAttrObject(f.getCode().replace(".", "_"), val);
								}
							}
						}
					}
				}
			}
		}
	}

	private List<Map<String, Object>> concatListValue(List<List<Map<String, Object>>> list) {
		if (list.size() == 0) {
			return null;
		}
		List<Map<String, Object>> fList = list.get(0);
		for (int i = 1; i < list.size(); i++) {
			List<Map<String, Object>> tmpList = list.get(i);
			for (int j = 0; j < tmpList.size(); j++) {
				String tmpVal = (String) tmpList.get(j).get("VAL");
				Map<String, Object> map = fList.get(j);
				String val = (String) map.get("VAL");
				map.put("VAL", val + tmpVal);
			}
		}
		return fList;
	}

	private Property findAssoProperty(String origModelCode, String assoModelCode) {
		String hql = "from Property p where p.valid = true and p.model.code = ? and p.associatedProperty.model.code = ? and (p.associatedType = ? or p.associatedType = ?)";
		List<Property> list = formulaClassDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
		return list.get(0);
	}
	

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDataGridPage(DataGrid dg,final Class dgClass,Page dgPage,final Object orgObj,String condition, List<Object> params){
		Map confMap=dg.getConfigMap();
		Map layoutMap = (Map) confMap.get("layout");
		Map propertyMap = (Map) layoutMap.get("listProperty");
		if(Boolean.TRUE.equals(propertyMap.get("isTreeView"))){
			String conditionSql = (null != condition && condition.trim().length() > 0) ? " and " + condition : "";
			List<Object> list = new ArrayList<Object>();
			list.add(orgObj);
			if(condition != null && condition.trim().length() > 0 && params != null && params.size() > 0){
				list.addAll(params);
			} 
			String key=dg.getTargetModel().getModelName()+fLTU(dg.getName())+((com.supcon.orchid.orm.entities.AbstractEcFullEntity)orgObj).getId();
			String orgPropertyName=dg.getOrgProperty().getName();
			String targetModelName=fLTL(dg.getTargetModel().getModelName());
			List treeList = new ArrayList();
			Object[] daoparams=new Object[]{dgClass,key,orgPropertyName,targetModelName,conditionSql,list,new boolean[]{false}};
			try {
				Class thisclass=this.getClass();
				java.lang.reflect.Field daoField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Dao");	
				java.lang.reflect.Field serviceField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Service");	
				Class serviceType=serviceField.getType();
				Class daoType=daoField.getType();
				Object tree=daoType.getMethod("buildTree",Class.class,String.class,String.class,String.class,String.class,List.class,boolean[].class).invoke(daoField.get(this),daoparams);
				Tree.treeToList((com.supcon.orchid.tree.TreeNode)tree, treeList, false);
				treeList=(List)serviceType.getMethod("findByTreeDataGrid"+dg.getOrgProperty().getAssociatedProperty().getModel().getModelName(),new Class[]{Page.class}).invoke(serviceField.get(this),new Object[]{treeList});
			} catch (Exception e) {
				e.printStackTrace();
			}
			dgPage.setResult(treeList);
		}else{
			DetachedCriteria criteria = DetachedCriteria.forClass(dgClass);
			criteria.add(Restrictions.eq(dg.getOrgProperty().getName(), orgObj));
			criteria.add(Restrictions.eq("valid", true));
			criteria.addOrder(Order.asc("sort"));
			if(!"".equals(condition) && condition.trim().length() > 0) {
				criteria.add(Restrictions.sqlRestriction(condition.replace("\""+fLTL(dg.getTargetModel().getModelName())+"\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
			}
			try {
				Class thisclass=this.getClass();
				java.lang.reflect.Field daoField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Dao");	
				Class daoType=daoField.getType();
				daoType.getMethod("findByPage",new Class[]{Page.class,DetachedCriteria.class}).invoke(daoField.get(this),new Object[]{dgPage,criteria});
				java.lang.reflect.Field serviceField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Service");	
				Class serviceType=serviceField.getType();
				serviceType.getMethod("findByNormalDataGrid"+dg.getOrgProperty().getAssociatedProperty().getModel().getModelName(),new Class[]{Page.class}).invoke(serviceField.get(this),new Object[]{dgPage});
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	
	private String fLTL(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToLower(str);
	}
	
	private String fLTU(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToUpper(str);
	}
	
	
	public List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross, List<Param> params){
		return mneCodeSearch(viewCode, showNumber, cross, params,null,null,null,null);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross, List<Param> params,String refViewCode,String currentViewCode,String sqlType,String realPermissionCode){
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
			//助记码权限,一个实体只有一个权限操作
			String  powerSql="";
			Boolean searchRefView=false;
			Boolean innerJoinAppendFlag = false;
			String  permissionCode = viewCode;
			if(realPermissionCode!=null&&!realPermissionCode.isEmpty())  {
				permissionCode = realPermissionCode;
			}
			StringBuilder sb=new StringBuilder();
			if(refViewCode!=null&&!refViewCode.equals(""))  {
				View refView=viewServiceFoundation.getView(refViewCode);
				//判断是否有参照视图,没有则抛出异常
				if(null==refView)  {
					throw new BAPException(BAPException.Code.REFERVIEW_NOT_FOUND,refViewCode);
				}	
				//未启用权限,使用主列表视图的权限
				String powerCode = permissionCode + "_self";
				boolean needPermission = true;
				if(refView.getType() == ViewType.REFERENCE || refView.getType() == ViewType.REFTREE){
					if(refView.getShowType().equals(ShowType.PART)){
						//取布局视图
						View layoutView = viewServiceFoundation.getView(permissionCode);
						if(null != layoutView && !layoutView.getIsPermission()){//未启用权限
							needPermission = false;
						}
						if(null == layoutView) {
							layoutView = getLayoutView(permissionCode);
							if(null != layoutView && !layoutView.getIsPermission()){//未启用权限
								needPermission = false;
							}	
						}
					} else {
						if(null != refView && !refView.getIsPermission()){//未启用权限
							needPermission = false;
						}
					}
				}
				if(needPermission)  {
					if(null == refView ){
						powerCode = permissionCode;
					}else if(refView.getShowType().equals(ShowType.PART))  {
						View layoutView = viewServiceFoundation.getView(permissionCode);
						if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
							powerCode = permissionCode;
						}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
							powerCode = "RM_7.5.0.0_formula_FormulaClass" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "RM_7.5.0.0_formula_FormulaClass" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="RM_7.5.0.0_formula_FormulaClass" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  formulaClassDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  formulaClassDao.createNativeQuery(powerOperateSql, "RM_7.5.0.0_formula").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formulaClass\"","RM_7.5.0.0_formula","","RM_FORMULA_CLASSES",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"formulaClass\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"formulaClass\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formulaClass\"","RM_7.5.0.0_formula","","RM_FORMULA_CLASSES",false);
					if(sb.length()>0) {
						sb.append(" AND ");
					}
					sb.append(powerSql);
				}
			}else {
				//如果未关联参照视图则使用当前列表的查询权限
				if(currentViewCode!=null&&currentViewCode.trim().length()>0)  {
					boolean needPermission=true;
					View view=viewServiceFoundation.getView(currentViewCode);
					String powerCode = permissionCode + "_self";
					if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
						searchRefView=true;
						if(view.getShowType().equals(ShowType.PART)){
							View layoutView = viewServiceFoundation.getView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
								powerCode = permissionCode;
								needPermission=false;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
								powerCode = "RM_7.5.0.0_formula_FormulaClass" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "RM_7.5.0.0_formula_FormulaClass" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "RM_7.5.0.0_formula_FormulaClass" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  formulaClassDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  formulaClassDao.createNativeQuery(powerOperateSql, "RM_7.5.0.0_formula").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formulaClass\"","RM_7.5.0.0_formula","","RM_FORMULA_CLASSES",false);
						if(sb.length()>0) {
							sb.append(" AND ");
						}
						sb.append(powerSql);
					}
				}
				
			}
			if(!innerJoinAppendFlag)  {
				if(!sb.toString().trim().startsWith("WHERE"))  {
					mnecodeSql.append(" WHERE ");
				}
			}
			if(sb!=null&&sb.length()>0) {
				sb.append(" AND ");
			}
			mnecodeSql.append(sb);
			mnecodeSql.append("  UPPER(\"").append("formulaClass.mc\"").append(".MNE_CODE) like UPPER(?) escape '&' AND \"formulaClass\".VALID = 1");
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
				mnecodeSql.append(" AND \"formulaClass\".CID = ?");
				totalValues.add(getCurrentCompanyId());
			}
			
			SQLQuery query = formulaClassDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
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
		formulaChangeDao = null;
		formulaChangeService = null;
		checkDepartmentSetDao = null;
		checkDepartmentSetService = null;
		formulaDao = null;
		formulaService = null;
		formulaBeforeProcessDao = null;
		formulaBeforeProcessService = null;
		formulaBomDao = null;
		formulaBomService = null;
		formulaClassDao = null;
		formulaMixtureActiveDao = null;
		formulaMixtureActiveService = null;
		formulaProcessDao = null;
		formulaProcessService = null;
		formulaProcessActiveDao = null;
		formulaProcessActiveService = null;
		precessStandardsDao = null;
		precessStandardsService = null;
		formulaTypeDao = null;
		formulaTypeService = null;
		factoryMapOtherDao = null;
		factoryMapOtherService = null;
		interfaceSyncLogDao = null;
		interfaceSyncLogService = null;
		mQDealinfoDao = null;
		mQDealinfoService = null;
		processTypeDao = null;
		processTypeService = null;
		standDao = null;
		standService = null;
		sampleProjDao = null;
		sampleProjService = null;
		lineFormulaDao = null;
		lineFormulaService = null;
		processPointDao = null;
		processPointService = null;
		processUnitDao = null;
		processUnitService = null;
		processUnitChoiceDao = null;
		processUnitChoiceService = null;
		testProjDao = null;
		testProjService = null;
	
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
		this.counter = this.counterManager.addCounter("formula", "RM_7.5.0.0_formula", "formula_{1,date,yyyyMMdd}_{0,number,000}", CounterType.Daily);
		String formatStr = "";
		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=formulaClassDao.createNativeQuery(sql, menuCode);
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

	protected String getEntityCode(){return RMFormulaClass.ENTITY_CODE;}
	protected String getModuleCode(){return RMFormulaClass.MODULE_CODE;}
	protected String getModelCode(){return RMFormulaClass.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param formulaClass 模型实例
	 */
	private void checkUniqueConstraint(RMFormulaClass formulaClass){
	}
	
	
	private void beforeSaveFormulaClass(RMFormulaClass formulaClass, Object... objects){
		checkUniqueConstraint(formulaClass);
	/* CUSTOM CODE START(serviceimpl,beforeSave,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	private void afterSaveFormulaClass(RMFormulaClass formulaClass, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportFormulaClass(List<RMFormulaClass> formulaClasss, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportFormulaClass(List<RMFormulaClass> formulaClasss){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportFormulaClass(List<RMFormulaClass> formulaClasss, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportFormulaClass(List<RMFormulaClass> formulaClasss){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */	
	}
	
	private void beforeDeleteFormulaClass(RMFormulaClass formulaClass){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	private void afterDeleteFormulaClass(RMFormulaClass formulaClass){
	/* CUSTOM CODE START(serviceimpl,afterDelete,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	private void customGenerateCodes(RMFormulaClass formulaClass, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(RMFormulaClass formulaClass, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}

	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportFormulaClass(List<RMFormulaClass> insertObjs, List<RMFormulaClass> updateObjs, List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportFormulaClass,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	@Override
	public void afterImportFormulaClass(List<RMFormulaClass> insertObjs, List<RMFormulaClass> updateObjs, List<Map<String,String>> columnInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportFormulaClass,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	@Override
	public List<RMFormulaClass> getFormulaClasss(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RMFormulaClass.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return formulaClassDao.findByHql("from " + RMFormulaClass.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return formulaClassDao.findByCriteria(detachedCriteria);
	}
	
	@Override
	public RMFormulaClass loadFormulaClassByBussinessKey(RMFormulaClass formulaClass){
		return loadFormulaClassByBussinessKey(formulaClass.getId());
	}
	
	@Override
	public Page<RMFormulaClass> getFormulaClasss(Page<RMFormulaClass> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RMFormulaClass.class);
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
				page = formulaClassDao.findByPage(page, sql);
			}else{
				page = formulaClassDao.findAllByPage(page);
			}
			return page;
		}
		page = formulaClassDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public RMFormulaClass loadFormulaClassByBussinessKey(Serializable bussinessKey){
		return formulaClassDao.findEntityByCriteria(Restrictions.eq("id", Long.valueOf(bussinessKey.toString())),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<RMFormulaClass> findByProperty(String propertyName, Object object){
		return formulaClassDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public RMFormulaClass findEntityByProperty(String propertyName, Object object){
		return formulaClassDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<Long> bussinessKeyList = new ArrayList<Long>();
			for(String key : bussinessKeys.split(",")){
				bussinessKeyList.add(Long.valueOf(key));
			}
			String sql = "update " + RMFormulaClass.JPA_NAME + " set valid=0 where id in (:businessKeys)";
			Query query = formulaClassDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("RM_7.5.0.0_formula_FormulaClass","runtime");
		try {
			for(View dgv:dgviews){
				if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
					List<DataGrid> ldg=dgv.getDataGrids();
					for(DataGrid dg:ldg){
						bap_validate_datagrids+=dg.getName()+",";
						dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.RM.entities."+dg.getTargetModel().getJpaName()));
					}
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return bap_validate_datagrids;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String findMainViewPath(){
		String mainViewPath="";
		List<View> views = viewServiceFoundation.findViewsByEntityCode("RM_7.5.0.0_formula", ViewType.VIEW);
		for(View v:views){
			if(v.getMainView()){
				mainViewPath=v.getUrl();
			}
		}
		return mainViewPath;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<DataGrid> findDatagrids(){
		List<DataGrid> ldg=new ArrayList<DataGrid>();
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("RM_7.5.0.0_formula_FormulaClass","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	private void dealDatagridsSave(RMFormulaClass formulaClass,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=findDatagrids();
		if(dgs!=null&&dgs.size()>0){
			formulaClassDao.flush();
			Class _reflect_thisclass=this.getClass();
			try {
				for(DataGrid dg:dgs){
					if(dg.getConfigMap()==null){
						continue;
					}
					Class _reflect_dgclass=Class.forName("com.supcon.orchid.RM.entities."+dg.getTargetModel().getJpaName());
					java.lang.reflect.Field _reflect_serviceField = _reflect_thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Service");
					Class _reflect_serviceType=_reflect_serviceField.getType();
					Object _reflect_serviceObj=_reflect_serviceField.get(this);
					Model _targetModel=dg.getTargetModel();
					List<Long> _needDealIds = new ArrayList<>();
					Map<String, Long> _dgCodeMap = new HashMap<String, Long>();
					boolean isTree=(_targetModel.getDataType()==2);
					List<String> _attachKey =new ArrayList<String>();
					Map _confMap=dg.getConfigMap();
					Map _layoutMap = (Map) _confMap.get("layout");
					List<Map> ls = (List<Map>) _layoutMap.get("sections");
					for(Map lm:ls){
						if(lm.get("regionType").equals("DATAGRID")){
							List<Map> lc = (List<Map>) lm.get("cells");
							for(Map lk:lc){
								if("PROPERTYATTACHMENT".equals(lk.get("columnType"))&&lk.get("key")!=null){
									_attachKey.add(lk.get("key").toString());
								}
							}
						}
					}
					boolean hasAttach=(_attachKey.size()>0);
					if(null == assFileUploads){
						assFileUploads = new HashMap<String,Object>();
					}
					if(hasAttach&&assFileUploads.get("staffId")==null){	
						assFileUploads.put("staffId", ((OrchidAuthenticationToken)SecurityContextHolder.getContext().getAuthentication()).getStaff().getId());
					}
					Map<String,Object> dgAttachMap = (Map<String, Object>) assFileUploads.get(dg.getName());
					if(hasAttach){
						if(null == dgAttachMap){
							dgAttachMap = new HashMap<String,Object>();
						}
						for(String key:_attachKey){
							dgAttachMap.put(key+"_propertyCode",_reflect_dgclass.getDeclaredField(key.toUpperCase()+"_PROPERTY_CODE").get(null));
						}
						dgAttachMap.put("type", _reflect_dgclass.getDeclaredField("DOC_TYPE").get(null));
					}
					if(dgDeleteIDs!=null&&dgDeleteIDs.get(dg.getName())!=null){
						ArrayList<Long> param=new ArrayList<Long>();
						String[] arrs=dgDeleteIDs.get(dg.getName()).split(",");
						for(int i=0;i<arrs.length;i++){
							param.add(Long.valueOf(arrs[i]));
						}
						if(hasAttach){
							dgAttachMap.put("deleteIds",param);
						}
						_reflect_serviceType.getDeclaredMethod("delete"+_targetModel.getModelName(),List.class,String.class).invoke(_reflect_serviceObj,param,"noEvent");
					}
					if(dgLists!=null&&dgLists.get(dg.getName())!=null){
						if(isTree){
							_needDealIds.clear();
							_dgCodeMap.clear();
						}
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()), _reflect_dgclass,formulaClassDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), RMFormulaClass.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, formulaClass);
							Map<String,Object> paramMap = new HashMap<String,Object>();
							if(hasAttach){
								for(String key:_attachKey){
									String fileAddPath=(String)_reflect_dgclass.getDeclaredMethod("get"+fLTU(key)+"FileAddPaths", null).invoke(odg, null);
									if(fileAddPath!=null&&fileAddPath.length()>0){
										paramMap.put(key+"_fileAddPaths",fileAddPath);
									}
									String fileDeleteIds=(String)_reflect_dgclass.getDeclaredMethod("get"+fLTU(key)+"FileDeleteIds", null).invoke(odg, null);
									if(fileDeleteIds!=null&&fileDeleteIds.length()>0){
										paramMap.put(key+"_fileDeleteIds",fileDeleteIds);
									}
								}
							}
							if(isTree){
								((com.supcon.orchid.orm.entities.AbstractEcTreeEntity)odg).setTableInfoId(formulaClass.getTableInfoId());
							}else{
								((com.supcon.orchid.orm.entities.AbstractEcPartEntity)odg).setTableInfoId(formulaClass.getTableInfoId());
							}
							if(isTree){
								String ppCode = ((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getVirtualParentCode();
								if(null != ppCode && ppCode.indexOf("x") > -1) {
									if(_dgCodeMap.containsKey(ppCode)) {
										((com.supcon.orchid.tree.AbstractCidTreeNode)odg).setParentId(_dgCodeMap.get(ppCode));
									}
								} else if(null != ppCode && !ppCode.isEmpty()) {
									((com.supcon.orchid.tree.AbstractCidTreeNode)odg).setParentId(Long.parseLong(ppCode));
								}
							}
							_reflect_saveMethod.invoke(_reflect_serviceObj, odg,null,null,null,viewCode,"noEvent",new boolean[]{});
							if(isTree){
								_needDealIds.add(((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getId());
								String pCode = ((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getVirtualCode();
								if(!_dgCodeMap.containsKey(pCode)) {
									_dgCodeMap.put(pCode, ((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getId());
								}
							}
							if(!paramMap.isEmpty()){
								paramMap.put("linkId",((com.supcon.orchid.orm.entities.IdEntity)odg).getId());
								paramMap.put("mainModelId",formulaClass.getTableInfoId());	
								dgAttachMap.put(((com.supcon.orchid.orm.entities.IdEntity)odg).getId().toString(), paramMap);
							}
						}
						if(isTree){
							_reflect_serviceType.getMethod("deal"+_targetModel.getModelName()+"Leaf",List.class).invoke(_reflect_serviceObj, _needDealIds);
						}
					}
					if(hasAttach){
						if(null != dgAttachMap && !dgAttachMap.isEmpty()){
							assFileUploads.put(dg.getName(),dgAttachMap);
						}
					}
				}
			}catch (Exception e) {
				log.error(e.getMessage(),e);
				if(e instanceof InvocationTargetException){
					InvocationTargetException iteException=(InvocationTargetException)e;
					if(iteException.getTargetException()!=null){
						Throwable throwable=iteException.getTargetException();
						if(throwable instanceof BAPException){
					     	 throw (BAPException)throwable;
					    }else{
							throw new BAPException(throwable.getMessage()!=null?throwable.getMessage():InternationalResource.get("foundation.error.message", getCurrentLanguage()));
						}
					}
				}
				throw new BAPException(InternationalResource.get("foundation.error.message", getCurrentLanguage()));
			}
		}
	} 

	
		@Override
	@Transactional
	public List<String> getBusinessKeyData(String businessKeyName){
		List<String> list = new ArrayList<String>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ RMFormulaClass.TABLE_NAME;
			list = formulaClassDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Autowired
	private RMFormulaClassDaoImpl formulaClassDaoImpl;
	
	@Override
	@Transactional
	public String getTableNoById(Long id){
		String sql = "select table_no from " + RMFormulaClass.TABLE_NAME + " where id = ?";
		String tableNo = formulaClassDao.createNativeQuery(sql,id).uniqueResult().toString();
		return tableNo;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public Map<Object, Long> importBatchFormulaClass(final List<RMFormulaClass> insertObjs, 
			final List<RMFormulaClass> updateObjs, List<Map<String,String>> columnInfo, Map<String, Map<Integer, Long>> tableInfoIds){
		final List<Map<String,String>> columnMaps = new ArrayList<Map<String,String>>();
		List<String> columnName = new ArrayList<String>();
		final List<String> associatedModelNames = new ArrayList<String>();
		final List<String> associatedModelTypes = new ArrayList<String>();
		for(int i = 0 ; i<columnInfo.size(); i++){//封装excel中列名对应的模型中的字段，数据库中的字段，字段类型
			if(!columnName.contains(columnInfo.get(i).get("name")) && !columnInfo.get(i).get("name").equals("id")){
				Map<String,String> columnMap = new HashMap<String, String>();
				columnMap.put("name", columnInfo.get(i).get("name"));
				String name = columnInfo.get(i).get("name");
				if(name.equals("deleteStaff") || name.equals("createStaff") || name.equals("modifyStaff") || name.equals("effectStaff") || name.equals("ownerDepartment") || 
						name.equals("ownerPosition") || name.equals("createPosition") || name.equals("createDepartment") || name.equals("ownerStaff")){
					name = name + "Id";
				}
				columnMap.put("dbname", columnInfo.get(i).get("dbname"));
				columnMap.put("type", columnInfo.get(i).get("type"));
				columnMap.put("isCustom", columnInfo.get(i).get("isCustom"));
				columnMap.put("multable", columnInfo.get(i).get("multable"));
				columnMaps.add(columnMap);
				columnName.add(columnInfo.get(i).get("name"));
				associatedModelNames.add(columnInfo.get(i).get("associatedModelName"));
				associatedModelTypes.add(columnInfo.get(i).get("associatedModelType"));
			}
		}
		
		final List<RMFormulaClass> nmeObjs = new ArrayList<RMFormulaClass>();
		
		final Map<Integer, Long> updateTableInfoIds = tableInfoIds.get("updateTableInfoIds");
		final Map<Integer, Long> insertTableInfoIds = tableInfoIds.get("insertTableInfoIds");
		//final List<Long> updateTableInfoIds = tableInfoIds.get("updateTableInfoIds");
		//final List<Long> insertTableInfoIds = tableInfoIds.get("insertTableInfoIds");
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		//String idSql = "select id from " + RMFormulaClass.TABLE_NAME + " order by id desc";
		//Query query = formulaClassDao.createNativeQuery(idSql).setMaxResults(1);
		/*String hql = "select id from " + RMFormulaClass.JPA_NAME + " order by id desc";
		Query query =  formulaClassDao.createQuery(hql).setMaxResults(1);
		Long id = new Long(1000);
		if(null != query.uniqueResult()){
			id = Long.valueOf(query.uniqueResult().toString());
		}*/
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(RMFormulaClass.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(RMFormulaClass formulaClass:insertObjs)  {
			//id = autoGeneratorID.getNextId(RMFormulaClass.TABLE_NAME,1,dbId);
			if(formulaClass.getId() != null ){
				m.put(formulaClass.getId(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			formulaClass.setId(id);
			id++;
		}
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) formulaClassDao.createNativeQuery(sql, "RM_7.5.0.0_formula_FormulaClass"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		
		formulaClassDaoImpl.getSession().doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				PreparedStatement updateps = null;
				PreparedStatement insertps = null;
				
				if(updateObjs != null && updateObjs.size()>0){
					List<String> updateMethods = new ArrayList<String>();
					String updateSql = "UPDATE " + RMFormulaClass.TABLE_NAME + " SET ";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						updateMethods.add(methodName);
						updateSql += columnMaps.get(i).get("dbname")+"=?,";
					}
					updateSql += " TABLE_INFO_ID=?";
					//updateSql += " where id=?";
					updateSql += " where " + dbId + " =?";
					
					updateps = conn.prepareStatement(updateSql);
					for(int updateIndex = 0; updateIndex<updateObjs.size(); updateIndex++)  {
						RMFormulaClass formulaClass = updateObjs.get(updateIndex);
						Long id = formulaClass.getId();
						if(null != id){
							if(updateTableInfoIds!=null&&updateTableInfoIds.size()>0){
								if(updateTableInfoIds.get(updateIndex)!=null){
									updateps.setLong(columnMaps.size() + 1, updateTableInfoIds.get(updateIndex));
								}else{
									updateps.setNull(columnMaps.size() + 1, Types.NUMERIC);
								}
							}else{
								updateps.setNull(columnMaps.size() + 1, Types.NUMERIC);
							}
							updateps.setLong(columnMaps.size()+2,id);
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = formulaClass.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(formulaClass);
									} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
										log.error(e.getMessage(),e);
									}
								}
								if(null != obj){
									String type = columnMaps.get(i).get("type");
									if (type.equals("TEXT") || type.equals("PASSWORD") || type.equals("LONGTEXT") || type.equals("BAPCODE") || type.equals("SUMMARY")) {
										updateps.setString(i+1, obj.toString());
									} else if(type.equals("SYSTEMCODE")){
										if( null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true") ){
											updateps.setString(i+1, obj.toString());
										}else if( null != columnMaps.get(i).get("multable") && columnMaps.get(i).get("multable").equals("true") ){
											updateps.setString(i+1, obj.toString());
										}else if(null != columnMaps.get(i).get("isSenior") && columnMaps.get(i).get("isSenior").equals("0")){
											SystemCode sc = (SystemCode) obj;
											updateps.setString(i+1, sc.getId());
										}else{
											if(obj.toString().contains("SystemCode")){
												SystemCode sc = (SystemCode) obj;
												updateps.setString(i+1, sc.getId());
											}else{
												updateps.setString(i+1, obj.toString());
											}
										}
									} else if ("DATE".equals(type)) {
										java.sql.Date sqlDate=new java.sql.Date(((Date) obj).getTime());
										updateps.setDate(i+1, sqlDate);
									} else if ("DATETIME".equals(type)) {
										java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(((Date) obj).getTime());
										updateps.setTimestamp(i+1, sqlTimestamp);
									} else if ("INTEGER".equals(type)) {
										updateps.setInt(i+1, (Integer) obj);
									} else if ("LONG".equals(type)) {
										updateps.setLong(i+1, (Long) obj);
									} else if ("DECIMAL".equals(type) || "MONEY".equals(type)) {
										updateps.setBigDecimal(i+1, (BigDecimal) obj);
									} else if ("BOOLEAN".equals(type)) {
										updateps.setBoolean(i+1 , (Boolean) obj);
									} else if ("OBJECT".equals(type)) {
										if(null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true")){
											updateps.setLong(i+1, (Long) obj);
										}else{
											Method objmethod = null;
											try {
												String methodName = "get" + associatedModelNames.get(i).substring(0, 1).toUpperCase() +  associatedModelNames.get(i).substring(1, associatedModelNames.get(i).length()).toLowerCase();
												objmethod = obj.getClass().getMethod(methodName);
												if(associatedModelTypes.get(i).equals("LONG")){
													Long objId = null;
													objId = (Long) objmethod.invoke(obj);
													updateps.setObject(i+1, objId);
												}else if(associatedModelTypes.get(i).equals("TEXT")){
													String objCode = null;
													objCode = (String) objmethod.invoke(obj);
													updateps.setObject(i+1, objCode);
												}
											} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
												log.error(e.getMessage(),e);
											}	
										}
									}
								}else{
									updateps.setString(i+1, null);
								}
							}
							nmeObjs.add(formulaClass);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + RMFormulaClass.TABLE_NAME + " (";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						insertMethods.add(methodName);
						insertSql += columnMaps.get(i).get("dbname")+",";
					}
					//insertSql += "ID,CID,TABLE_INFO_ID) VALUES (";
					insertSql += dbId + ",CID,TABLE_INFO_ID) VALUES (";
					for(int i = 0;i<columnMaps.size();i++){
						insertSql += "?,";
					}
					insertSql += "?,?,?)";
					
//					String idSql = "select id from " + RMFormulaClass.TABLE_NAME + " order by id desc";
//					Query query = formulaClassDao.createNativeQuery(idSql).setMaxResults(1);
//					Long id = new Long(1000);
//					if(null != query.uniqueResult()){
//						id = Long.valueOf(query.uniqueResult().toString());
//					}
					insertps = conn.prepareStatement(insertSql);
					for(int insertIndex = 0; insertIndex<insertObjs.size(); insertIndex++)  {
						RMFormulaClass formulaClass = insertObjs.get(insertIndex);
						Long id = insertIds.get(insertIndex);
						insertps.setLong(columnMaps.size() + 1, id);
//						insertps.setLong(columnMaps.size() + 1, formulaClass.getId());
//						insertps.setLong(columnMaps.size() + 1, autoGeneratorID.getNextId(RMFormulaClass.TABLE_NAME,1,dbId));
						insertps.setLong(columnMaps.size() + 2, getCurrentCompanyId());
						if(insertTableInfoIds!=null&&insertTableInfoIds.size()>0){
							if(insertTableInfoIds.get(insertIndex)!=null){
								insertps.setLong(columnMaps.size() + 3, insertTableInfoIds.get(insertIndex));
							}else{
								insertps.setNull(columnMaps.size() + 3, Types.NUMERIC);
							}
						}else{
							insertps.setNull(columnMaps.size() + 3, Types.NUMERIC);
						}
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = formulaClass.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(formulaClass);
								} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
									log.error(e.getMessage(),e);
								}
							}
							if (null != obj) {
								String type = columnMaps.get(i).get("type");
								if (type.equals("TEXT") || type.equals("PASSWORD") || type.equals("LONGTEXT") || type.equals("BAPCODE") || type.equals("SUMMARY")) {
									insertps.setString(i+1, obj.toString());
								} else if(type.equals("SYSTEMCODE")){
									if( null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true") ){
										insertps.setString(i+1, obj.toString());
									}else if( null != columnMaps.get(i).get("multable") && columnMaps.get(i).get("multable").equals("true") ){
										insertps.setString(i+1, obj.toString());
									}else if(null != columnMaps.get(i).get("isSenior") && columnMaps.get(i).get("isSenior").equals("0")){
										SystemCode sc = (SystemCode) obj;
										insertps.setString(i+1, sc.getId());
									}else{
										if(obj.toString().contains("SystemCode")){
											SystemCode sc = (SystemCode) obj;
											insertps.setString(i+1, sc.getId());
										}else{
											insertps.setString(i+1, obj.toString());
										}
									}
								} else if ("DATE".equals(type)) {
									java.sql.Date sqlDate=new java.sql.Date(((Date) obj).getTime());
									insertps.setDate(i+1, sqlDate);
								} else if ("DATETIME".equals(type)) {
									java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(((Date) obj).getTime());
									insertps.setTimestamp(i+1, sqlTimestamp);
								} else if ("INTEGER".equals(type)) {
									insertps.setInt(i+1, (Integer) obj);
								} else if ("LONG".equals(type)) {
									insertps.setLong(i+1, (Long) obj);
								} else if ("DECIMAL".equals(type) || "MONEY".equals(type)) {
									insertps.setBigDecimal(i+1, (BigDecimal) obj);
								} else if ("BOOLEAN".equals(type)) {
									insertps.setBoolean(i+1 , (Boolean) obj);
								} else if ("OBJECT".equals(type)) {
									if(null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true")){
										insertps.setLong(i+1, (Long) obj);
									}else{
										Method objmethod = null;
										try {
											String methodName = "get" + associatedModelNames.get(i).substring(0, 1).toUpperCase() +  associatedModelNames.get(i).substring(1, associatedModelNames.get(i).length()).toLowerCase();
											objmethod = obj.getClass().getMethod(methodName);
											if(associatedModelTypes.get(i).equals("LONG")){
												Long objId = null;
												objId = (Long) objmethod.invoke(obj);
												insertps.setObject(i+1, objId);
											}else if(associatedModelTypes.get(i).equals("TEXT")){
												String objCode = null;
												objCode = (String) objmethod.invoke(obj);
												insertps.setObject(i+1, objCode);
											}
										} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
											log.error(e.getMessage(),e);
										}	
									}
								}
							} else {
								insertps.setString(i + 1, null);
							}
						}
						//formulaClass.setId(id);
						nmeObjs.add(formulaClass);
						insertps.addBatch();
					}		
				}
				
				
				if(null != insertps){
					insertps.executeBatch();
					insertps.close();
				}
				if(null != updateps){
					updateps.executeBatch();
					updateps.close();
				}
				
			}
		});	
		
		formulaClassDaoImpl.getSession().flush();
		formulaClassDaoImpl.getSession().clear();
		
		return m;
	}
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	//excel辅模型查询
	public void excelAuxModelQuery(Page<RMFormulaClass> page,  String viewCode, int type, String processKey,
		Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model) {
		auxModelQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, paramMain, assosiatedKey, model);
	}
	
	@SuppressWarnings("unchecked")
	private void auxModelQuery(Page<RMFormulaClass> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, List paramMain, Map assosiatedKey, Model realModel, Object... objects) {
		int queryType = 0;
		if(objects.length > 0) {
			queryType = (int) objects[0];
		}
		String sql = sqlService.getSqlQuery(viewCode, type);
		//如果存在导出下配置的sql则进行替换
		if(!exportSql.trim().isEmpty())  {
				sql=exportSql;	
		}
		// 自定义字段sql拼接
		//sql = generateCustomPropertySql(viewCode, sql);
		String countSql = "";
		if(viewCode !=null && viewCode.endsWith("_")){
			countSql = "SELECT COUNT(*) count FROM ";
		}else{
			countSql = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TOTALS);
		}
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
				String classifyCodes = "";
				List<Object> advValues = null;
				String extraQuery = "";
				List<Object> customerValues = null;
				List<Object> extraQueryValues = null;
				List<Object> customerSqlValues = null;
				List<Object> classifySqlValues = null;
				//组合where条件
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
					//数据分类内的高级查询
					if ("classifyCodes".equals(param.getName())) {
						classifyCodes = (String)param.getValue();
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
						String key = null, columnName = null,customKey = null;
						if(sortValue.indexOf("::") > 0) {
							key = sortValue.split("::")[0];
							columnName = sortValue.split("::")[1];
						}else if(sortValue.indexOf(".") > 0){
							customKey = sortValue.split("\\.")[0];
							if(customKey.contains("attrMap")){
								key =customKey;
								columnName = sortValue.split("\\.")[1];
							}else{
								key = sortValue;
							}
						} else {
							key = sortValue;
						}
						int lastDotPos = key.lastIndexOf('.');
						if(null == columnName) {
							columnName = Inflector.getInstance().columnize(key.substring(lastDotPos + 1));
						}
						String tableAlias = lastDotPos < 0 ? "\"formulaClass\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
						s.append(" AND \"formulaClass\".CID = ").append(getCurrentCompanyId());
					}
				}
				
//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
//					if(type == Sql.TYPE_LIST_PENDING) {
//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_QUERY){
//						s.append(" AND \"formulaClass\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_REFERENCE){
//						if(null != crossCompanyFlag && !crossCompanyFlag){
//							s.append(" AND \"formulaClass\".CID = ").append(getCurrentCompanyId());
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
			
			Map<String, Object> linkMap = linkMainMap(realModel.getCode(), realModel.getEntity().getCode());
			List<Model> modelList = modelServiceFoundation.findModels(realModel.getEntity());
			Model mainModel = null;
			for(Model m : modelList){
				if(m.getIsMain()){
					mainModel = m;
				}
			}
			if(linkMap != null && linkMap.get("needChange")!=null && linkMap.get("needChange").equals("no!!")){
				s.append(" ( \"formulaClass\".");	
				List<Property> properties = modelServiceFoundation.findProperties(realModel);
				for(Property p : properties){
					if(p.getType().toString().equals("OBJECT") && p.getAssociatedProperty() != null && p.getAssociatedProperty().getModel().getCode().equals(mainModel.getCode())){
						s.append(p.getColumnName() + " IN ( SELECT ");
						Property assProp = modelServiceFoundation.findPropertyByCode(p.getAssociatedProperty().getCode());
						s.append(assProp.getColumnName());
					}
				}
				s.append(" FROM RM_FORMULAS \"formula\" ");
			}else{
				Property origin = (Property) linkMap.get("origin");
				Property target = (Property) linkMap.get("target");
				s.append("( \"");
				s.append(origin.getModel().getModelName().substring(0,1).toLowerCase());
				s.append(origin.getModel().getModelName().substring(1));
				s.append("_");
				s.append(origin.getName());
				s.append("\".");
				s.append(target.getColumnName() + " IN ( SELECT ");
				Property assProp = modelServiceFoundation.findPropertyByCode(target.getAssociatedProperty().getCode());
				s.append(assProp.getColumnName());
				s.append(" FROM RM_FORMULAS \"formula\" ");
			}	
			//s.append(" ( \"formulaClass\".TABLE_INFO_ID IN ( SELECT TABLE_INFO_ID FROM RM_FORMULAS \"formula\" ");
			
			//辅模型,一个实体只有一个权限操作
			String powerCode = viewCode + "_self";
			View view = viewServiceFoundation.getView(viewCode);
			if(view!=null && (view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE)){
				if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
					powerCode = "RM_7.5.0.0_formula" + "_" + view.getPermissionCode();
				}
			}
			String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
			List<Object> powerCodeList =  formulaClassDao.createNativeQuery(powerCodeSql, powerCode).list();
			if(powerCodeList.size() > 0) {
				powerCode = powerCodeList.get(0).toString();
			} else {
				String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
				List<Object> checkList =  formulaClassDao.createNativeQuery(powerOperateSql, "RM_7.5.0.0_formula").list();
				if(checkList.size()>0){
					powerCode = checkList.get(0).toString();
				}
			}
				String	pc = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formula\"","RM_7.5.0.0_formula","","RM_FORMULAS",false);
			if (pc.trim().length() > 0) {
				s.append(" WHERE (");
				s.append(pc);
				s.append(")");
			}
			
			if(assosiatedKey != null && assosiatedKey.size()>0){
				if (pc.trim().length() > 0) {
					s.append(" AND (");
				} else {
					s.append(" WHERE (");
				}
				String queryParam = (String) assosiatedKey.get("keyName");
				List<Long> ids = (List<Long>) assosiatedKey.get("keyValue");
				int count = 0;
				String queryValue = "";
				if(ids != null && ids.size() > 999){
					count = ids.size() / 999;
				}
				if(ids.size() > 999){
					if(count == 1){
						s.append(queryParam);
						s.append(" in (");
						for(int j = 0; j < 999; j++){//in语句999条
							Long id = ids.get(j);
							queryValue += id.toString() + ",";
						}
						s.append(queryValue.subSequence(0, queryValue.length() - 1));
						s.append(") or ");
						s.append(queryParam);
						s.append(" in (");
						queryValue = "";
						for(int j = 999; j < ids.size(); j++){//in语句999条
							Long id = ids.get(j);
							queryValue += id.toString() + ",";
						}
						s.append(queryValue.subSequence(0, queryValue.length() - 1));
						s.append(")");
					}else{
						for(int i = 1; i <= count + 1; i++ ){
							if(i==count + 1){
								s.append(queryParam);
								s.append(" in (");
								queryValue = "";
								for(int j = (i-1)*1000; j < ids.size(); j++){//in语句999条
									Long id = ids.get(j);
									queryValue += id.toString() + ",";
								}
								s.append(queryValue.subSequence(0, queryValue.length() - 1));
								s.append(")");
							}else{
								s.append(queryParam);
								s.append(" in (");
								queryValue = "";
								for(int j = (0+(i-1)*1000); j < (i*1000); j++){//in语句999条
									Long id = ids.get(j);
									queryValue += id.toString() + ",";
								}
								s.append(queryValue.subSequence(0, queryValue.length() - 1));
								s.append(") or ");
							}
						}
					}
				}else{
					for(Long id: ids){
						queryValue += id.toString() + ",";
					}
					s.append(queryParam);
					s.append(" in (");
					s.append(queryValue.subSequence(0, queryValue.length() - 1));
					s.append(")");
				}	
			}
			s.append(")");
			
			s.append(" )");
			s.append(")");
			
			if (type == Sql.TYPE_LIST_PENDING) {
				boolean isMobileRequest = false;
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				if (authentication instanceof OrchidAuthenticationToken) {
					OrchidAuthenticationToken token = (OrchidAuthenticationToken) authentication;
					isMobileRequest = token.getIsMobileRequest() == null ? false : token.getIsMobileRequest();
				}
				if (isMobileRequest) {
					if (hasWhere)
						s.append(" AND ");
					else
						s.append(" WHERE ");
					s.append("(\"p\".MOBILE_APPROVE = 1)");
				}
			}
			
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
					orderPart.append(sortOrderByStr).append(",");
				} 
			}
			if(type == Sql.TYPE_LIST_PENDING) {
				orderPart.append(" \"p\".ID DESC");
			} else {
				orderPart.append(" \"formulaClass\".ID DESC");
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
			
			//计算条数
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) formulaClassDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    List<Map<String, Object>> resultCountList = (List<Map<String, Object>>) formulaClassDao.createNativeQuery(countSql, arr)
					.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
			    if (null != resultCountList && !resultCountList.isEmpty()) {
					Map<String, Object> resultCounts = resultCountList.get(0);
					for (Map.Entry<String, Object> entry : resultCounts.entrySet()) {
						String key = entry.getKey();
						if(maps.containsKey(key)) {
							key = (String) maps.get(key);
						}
						if (key.equalsIgnoreCase("count")) {
							count = ((Number) (null == entry.getValue() ? 0 : entry.getValue())).longValue();
						} else {
							resultTotals.put(key, BigDecimal.valueOf(((Number) (null == entry.getValue() ? 0 : entry.getValue())).doubleValue()));
						}
					}
			    }
			    if(!page.isExportFlag() && !page.isPaging() && count > page.getMaxPageSize()) {
			    	throw new BAPException(BAPException.Code.RESULT_COUNT_EXCEED_MAX_PAGE_SIZE);
			    }
			    page.setTotalCount(count);
			    page.setResultTotals(resultTotals);
			}
			if(!noQueryFlag)  {
				SQLQuery query = formulaClassDao.createNativeQuery(realSql, arr);
				/*List<RMFormulaClass> result = new ArrayList<RMFormulaClass>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(RMFormulaClass.class,formulaClassDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(RMFormulaClass.class,formulaClassDao,maps));
				}
				modelServiceFoundation.initCacheData();*/
				List<RMFormulaClass> result = getResult(page, query, new PendingResultTransformer(RMFormulaClass.class,formulaClassDao,maps));
				
				List<Map> propList = page.getProperties();
				for(Map m : propList){
					if(m.get("isCustom") != null && m.get("isCustom").equals("true") && m.get("columntype").equals("SYSTEMCODE") ){
						for(RMFormulaClass model : result){
							Map<String, Object> map1 = model.getAttrMap();
							if(map1!=null && map1.size()>0){
								for(Map.Entry<String, Object> entry : map1.entrySet()) {
									if(entry.getKey().equals(m.get("name")) && entry.getValue() != null && !entry.getValue().equals("")) {
										String[] strs = new String[2];
										strs[0] = entry.getValue().toString();
										strs[1] = entry.getValue().toString();
										map1.put(entry.getKey(), strs);
									}
								}
							}
						}
					}else if(m.get("isCustom") != null && m.get("isCustom").equals("true") && m.get("columntype").equals("OBJECT") ){
						for(RMFormulaClass model : result){
							Map<String, Object> map1 = model.getAttrMap();
							if(map1!=null && map1.size()>0){
								for(Map.Entry<String, Object> entry : map1.entrySet()) {
									if(entry.getKey().equals(m.get("name")) && entry.getValue() != null && !entry.getValue().equals("")) {
										String[] strs = new String[2];
										strs[0] = entry.getValue().toString();
										String methodName = "get" + entry.getKey().toString().substring(0, 1).toUpperCase() + entry.getKey().toString().substring(1);
										String businessKeyValue = "";
										Long idValue = null;
										
										try {
											Property prop = modelServiceFoundation.findPropertyByCode(m.get("propertyCode").toString(), null);
											String methodName2 = "get" + prop.getName().substring(0, 1).toUpperCase() + prop.getName().substring(1);
											Method idMethod = model.getClass().getMethod(methodName2);
											idValue = (Long) idMethod.invoke(model);
											List<CustomPropertyModelMapping> modelMappings = viewServiceFoundation.findCustomPropertyForAsso(prop.getModel().getCode(), prop.getCode());
											String serviceStr = "";
											if(modelMappings != null && modelMappings.size()>0){
												String moduleName = modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode();
												if(modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().indexOf("_") != -1){
													moduleName = modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().substring(0,modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().indexOf("_"));
												}
												if(moduleName.equals("sysbase")){
													serviceStr = "com.supcon.orchid.foundation.services." + modelMappings.get(0).getAssociatedProperty().getModel().getModelName() + "Service";
												}else{
													if(modelMappings.get(0).getAssociatedProperty().getModel().getEcVersion().equals("1.0")){
														serviceStr = "com.supcon.orchid."+ moduleName + ".services." + modelMappings.get(0).getAssociatedProperty().getModel().getModelName() + "Service";
													}else{
														serviceStr = "com.supcon.orchid."+ moduleName + ".services." + modelMappings.get(0).getAssociatedProperty().getModel().getJpaName() + "Service";
													}	
												}
												BundleContext bundleContext = FrameworkUtil.getBundle(getClass()).getBundleContext();
												ServiceReference ref = bundleContext.getServiceReference(serviceStr);
												Object realService = bundleContext.getService(ref);
												
												List<Property> props = modelServiceFoundation.findProperties(modelMappings.get(0).getAssociatedProperty().getModel(), null);
												Property bussinessKeyProp = null;
												for(Property p : props){
													if(p.getIsBussinessKey()){
														bussinessKeyProp = p;
													}
												}
												String getBussinessKeyMethodName = "get" + bussinessKeyProp.getName().substring(0, 1).toUpperCase() + bussinessKeyProp.getName().substring(1);
												
												if(moduleName.equals("sysbase")){
													Method loadMethod = realService.getClass().getMethod("get", new Class[] { Long.class });
													Object obj = loadMethod.invoke(realService, idValue);
													Method getBusKeyValueMethod = obj.getClass().getMethod(getBussinessKeyMethodName);
													businessKeyValue = (String) getBusKeyValueMethod.invoke(obj);
												}else{
													String methodName3 = "get" + modelMappings.get(0).getAssociatedProperty().getModel().getModelName();
													Method loadMethod = realService.getClass().getMethod(methodName3, new Class[] { long.class });
													Object obj = loadMethod.invoke(realService, idValue);
													Method getBusKeyValueMethod = obj.getClass().getMethod(getBussinessKeyMethodName);
													businessKeyValue = (String) getBusKeyValueMethod.invoke(obj);
												}	
											}	
										} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
											log.error(e.getMessage(), e);
										}
										strs[1] = businessKeyValue;
										map1.put(entry.getKey(), strs);
									}
								}
							}
						}
					}
				}
				
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (RMFormulaClass formulaClass : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(formulaClass.getId(), "RM_formula_formulaClass");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(formulaClass.getId(), "RM_formula_formulaClass");
							if(null != documents && !documents.isEmpty()) {
								formulaClass.setDocument(documents.get(0));
								formulaClass.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				for (RMFormulaClass formulaClass : result) {
				}	
				if(exportSql.trim().isEmpty()){
					getConfigAssoPropsResult(viewCode, result); // 获取配置的关联模型字段的结果集
				}
			}
		}
	}
	
	private Map<String, Object> linkMainMap(String modelCode, String entityCode){
		Model mainModel = modelServiceFoundation.getMainModel(entityCode);
		Model model = modelServiceFoundation.getModel(modelCode);
		List<Property> props = modelServiceFoundation.findProperties(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("needChange", "no!!");
		for(Property p : props){
			if(!p.getIsCustom() && p.getType().toString().equals("OBJECT") && p.getAssociatedProperty() != null){
				if(p.getAssociatedProperty().getModel().getCode().equals(mainModel.getCode())){
					return map;
				}else{
					List<Property> props2 = modelServiceFoundation.findProperties(p.getAssociatedProperty().getModel());
					for(Property p2 : props2){
						if(!p2.getIsCustom() && p2.getType().toString().equals("OBJECT") && p2.getAssociatedProperty() != null
								&& p2.getAssociatedProperty().getModel().getCode().equals(mainModel.getCode())){
							map.put("needChange", "yep");
							map.put("origin", p);
							map.put("target", p2);
							return map;
						}
					}	
				}
			}
		}
		return map;
	}
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = formulaClassDao.createNativeQuery(sql, "RM_7.5.0.0_formula_FormulaClass").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = formulaClassDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = formulaClassDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = formulaClassDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?formulaClassDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  formulaClassDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,formulaClassDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	
	 
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="保存")
	public void saveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService){
		saveFormulaClass(formulaClass, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="保存")
	public void saveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService, String viewCode){
		saveFormulaClass(formulaClass, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass")
	public void saveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		boolean isNew = false;
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(formulaClass.getId()!=null && formulaClass.getId()>0){
			AuditUtil.setAuditDes("修改");
			AuditUtil.setAuditOperationType("2");
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/modify";
		}else{
			isNew = true;
			AuditUtil.setAuditDes("新增");
			AuditUtil.setAuditOperationType("1");
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/add";
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
				executeGScript(entityCode, "beforeSave", events, formulaClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formulaClass);
		beforeSaveFormulaClass(formulaClass, viewIsView);

		if (viewIsView) {
			formulaClassDao.saveWithRevertVersion(formulaClass);
		} else {
			if(isNew)
					formulaClassDao.save(formulaClass);
				else
					formulaClassDao.merge(formulaClass);
		}

		if (dataGridService != null) {
			formulaClassDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateFormulaClassCodes(formulaClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaClassSummarys(formulaClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormulaClass(formulaClass, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formulaClass);
			}
		}
		List<RMFormulaClass> params = new ArrayList<RMFormulaClass>();
		formulaClassDao.flush();
		formulaClassDao.clear();
		formulaClass = formulaClassDao.load(formulaClass.getId());
		
		
		params.add(formulaClass);
	}
	 
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass")
	public void mergeFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(formulaClass);
		beforeSaveFormulaClass(formulaClass);
		formulaClassDao.merge(formulaClass);

		if (dataGridService != null) {
			dataGridService.execute();
		}

		afterSaveFormulaClass(formulaClass);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="excel导出",operType="4")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="页面打印",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes("页面打印");
		}else if(printType == 1){
			AuditUtil.setAuditDes("控件打印");
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_FormulaClass",desc="批量保存",operType="4")
	public void batchSaveFormulaClass(RMFormulaClass formulaClass, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(formulaClass.getId()!=null && formulaClass.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, formulaClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formulaClass);
		beforeSaveFormulaClass(formulaClass, viewIsView);

		if (viewIsView) {
			formulaClassDao.saveWithRevertVersion(formulaClass);
		} else {
			formulaClassDao.save(formulaClass);
		}

		if (dataGridService != null) {
			formulaClassDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateFormulaClassCodes(formulaClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaClassSummarys(formulaClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormulaClass(formulaClass, viewIsView);


		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formulaClass);
			}
		}
		List<RMFormulaClass> params = new ArrayList<RMFormulaClass>();
		formulaClassDao.flush();
		formulaClassDao.clear();
		formulaClass = formulaClassDao.load(formulaClass.getId());
		
		
		params.add(formulaClass);
	}
	
	
	/* CUSTOM CODE START(serviceimpl,functions,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}
