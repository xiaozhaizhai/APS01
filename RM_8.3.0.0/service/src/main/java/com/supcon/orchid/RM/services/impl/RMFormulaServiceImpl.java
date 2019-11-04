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

import com.supcon.orchid.foundation.services.ACLPermissionHandleService;
import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.container.mvc.struts2.results.BAPEntityTransformer;
import com.supcon.orchid.container.mvc.struts2.utils.Struts2Utils;
import com.supcon.orchid.container.mvc.struts2.utils.XmlUtils;
import com.supcon.orchid.counter.Counter;
import com.supcon.orchid.counter.CounterManager;
import com.supcon.orchid.counter.CounterType;
import com.supcon.orchid.counter.support.NonCachedCounterBean;
import com.supcon.orchid.RM.entities.RMFormulaMneCode;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.RM.services.RMFormulaImportService;
import com.supcon.orchid.RM.entities.RMFormulaDealInfo;
import com.supcon.orchid.RM.entities.RMFormulaSupervision;
import com.supcon.orchid.utils.BAPEventPublisher;
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
import com.supcon.orchid.RM.entities.RMFormulaSupervision;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.services.SupervisionService;
import com.supcon.orchid.workflow.engine.services.InstanceService;
import com.supcon.orchid.workflow.engine.services.TaskService;
import org.jbpm.api.ProcessInstance;
import com.supcon.orchid.workflow.engine.entities.Task;
import com.supcon.orchid.workflow.engine.entities.FlowCurrentStatus;
import com.supcon.orchid.workflow.engine.entities.Deployment;
import com.supcon.orchid.workflow.engine.services.ProcessService;
import org.jbpm.api.model.Transition;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.exceptions.WorkFlowException;
import com.supcon.orchid.workflow.engine.services.IScriptService;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import org.osgi.framework.Bundle;
import org.osgi.framework.FrameworkUtil;
import java.io.IOException;
import com.supcon.orchid.orm.entities.ICookie;
import com.supcon.orchid.foundation.entities.Cookie;
import com.supcon.orchid.foundation.services.CookieService;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.ec.enums.ShowType;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.daos.RMSampleProjDao;
import com.supcon.orchid.RM.services.RMSampleProjService;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.daos.RMCheckDepartmentSetDao;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetService;
import com.supcon.orchid.RM.entities.RMCheckDetail;
import com.supcon.orchid.RM.daos.RMCheckDetailDao;
import com.supcon.orchid.RM.services.RMCheckDetailService;
import com.supcon.orchid.RM.entities.RMCheckDetailItemSetups;
import com.supcon.orchid.RM.daos.RMCheckDetailItemSetupsDao;
import com.supcon.orchid.RM.services.RMCheckDetailItemSetupsService;
import com.supcon.orchid.RM.entities.RMForLineFormula;
import com.supcon.orchid.RM.daos.RMForLineFormulaDao;
import com.supcon.orchid.RM.services.RMForLineFormulaService;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.daos.RMFormulaDao;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.daos.RMFormulaBeforeProcessDao;
import com.supcon.orchid.RM.services.RMFormulaBeforeProcessService;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.daos.RMFormulaBomDao;
import com.supcon.orchid.RM.services.RMFormulaBomService;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.daos.RMFormulaMixtureActiveDao;
import com.supcon.orchid.RM.services.RMFormulaMixtureActiveService;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.daos.RMFormulaProcessDao;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.daos.RMFormulaProcessActiveDao;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
import com.supcon.orchid.RM.entities.RMForProcessUnit;
import com.supcon.orchid.RM.daos.RMForProcessUnitDao;
import com.supcon.orchid.RM.services.RMForProcessUnitService;
import com.supcon.orchid.RM.entities.RMForProcessUnitChoice;
import com.supcon.orchid.RM.daos.RMForProcessUnitChoiceDao;
import com.supcon.orchid.RM.services.RMForProcessUnitChoiceService;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.daos.RMPrecessStandardsDao;
import com.supcon.orchid.RM.services.RMPrecessStandardsService;
import com.supcon.orchid.RM.entities.RMProductReplace;
import com.supcon.orchid.RM.daos.RMProductReplaceDao;
import com.supcon.orchid.RM.services.RMProductReplaceService;
import com.supcon.orchid.RM.entities.RMReplaceFormula;
import com.supcon.orchid.RM.daos.RMReplaceFormulaDao;
import com.supcon.orchid.RM.services.RMReplaceFormulaService;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.daos.RMProcessTypeDao;
import com.supcon.orchid.RM.services.RMProcessTypeService;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.daos.RMPickSiteDao;
import com.supcon.orchid.RM.services.RMPickSiteService;
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
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.daos.RMFormulaTypeDao;
import com.supcon.orchid.RM.services.RMFormulaTypeService;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.daos.RMStandDao;
import com.supcon.orchid.RM.services.RMStandService;
import com.supcon.orchid.RM.entities.RMBatchFactory;
import com.supcon.orchid.RM.daos.RMBatchFactoryDao;
import com.supcon.orchid.RM.services.RMBatchFactoryService;
import com.supcon.orchid.RM.entities.RMBatchFormulaMain;
import com.supcon.orchid.RM.daos.RMBatchFormulaMainDao;
import com.supcon.orchid.RM.services.RMBatchFormulaMainService;
import com.supcon.orchid.RM.entities.RMSynchroLog;
import com.supcon.orchid.RM.daos.RMSynchroLogDao;
import com.supcon.orchid.RM.services.RMSynchroLogService;
import com.supcon.orchid.RM.entities.RMTestProj;
import com.supcon.orchid.RM.daos.RMTestProjDao;
import com.supcon.orchid.RM.services.RMTestProjService;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.daos.RMFactoryMapOtherDao;
import com.supcon.orchid.RM.services.RMFactoryMapOtherService;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.daos.RMInterfaceSyncLogDao;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogService;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.daos.RMMQDealinfoDao;
import com.supcon.orchid.RM.services.RMMQDealinfoService;
import com.supcon.orchid.RM.entities.RMProductMapOther;
import com.supcon.orchid.RM.daos.RMProductMapOtherDao;
import com.supcon.orchid.RM.services.RMProductMapOtherService;
import com.supcon.orchid.RM.entities.RMFormulaBomMain;
import com.supcon.orchid.RM.daos.RMFormulaBomMainDao;
import com.supcon.orchid.RM.services.RMFormulaBomMainService;
import com.supcon.orchid.RM.entities.RMFormulaBomMaterial;
import com.supcon.orchid.RM.daos.RMFormulaBomMaterialDao;
import com.supcon.orchid.RM.services.RMFormulaBomMaterialService;
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.daos.RMFormulaChangeDao;
import com.supcon.orchid.RM.services.RMFormulaChangeService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.foundation.entities.Department;
import com.supcon.orchid.foundation.entities.Department;
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
import com.supcon.orchid.RM.daos.impl.RMFormulaDaoImpl;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.hibernate.jdbc.Work;
import com.supcon.orchid.annotation.BAPIsMneCode;
import com.supcon.orchid.annotation.BAPMneField;
import javax.persistence.Table;
import com.supcon.orchid.utils.MneCodeGenterate;
import com.supcon.orchid.audit.service.DataAuditLogService;
import com.supcon.orchid.audit.entities.SignatureLog;
import com.supcon.orchid.workflow.engine.services.TransitionService;
import com.supcon.orchid.foundation.services.ReliableMessageSenderService;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
/* CUSTOM CODE START(serviceimpl,import,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.services.ConsulService;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import com.supcon.orchid.RM.utils.RedisUtil;
/* CUSTOM CODE END */

@Service("rM_formulaService")
@Transactional
public class RMFormulaServiceImpl  extends BaseServiceImpl<RMFormula> implements RMFormulaService,IScriptService, InitializingBean, DisposableBean {
	private static final Pattern pattern = Pattern.compile("( AS | as )((\"?)(.*?)(\"?))(,| )");
	private static final Pattern p = Pattern.compile("( JOIN | join )((.*?)) ((\"?)(.*?)(\"?))( ON | on )");
	private static final Pattern countPattern = Pattern.compile("(SUM\\()((\"?)(.*?)(\"?))(\\) AS | as )");
	private static final Pattern p1 = Pattern.compile("( JOIN | join )((.*)) ((\"?)(.*?)(\"?))( ON | on )");
	private static final Pattern p2 = Pattern.compile("( JOIN | join )((.*?)) ((\")(.*?)(\"))( ON | on )");
	
	@Autowired
	private SupervisionService supervisionService;
	@Autowired
	ReliableMessageSenderService  reliableMessageSenderService;//消息发送服务
    @Autowired
	private ACLPermissionHandleService aclPermissionService;
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
	@Value("${bap.company.single}")
	private Boolean isSingleMode = false;
	
	public Boolean getIsSingleMode() {
		if(null == isSingleMode)
			isSingleMode = false;
		return isSingleMode;
	}
	@Autowired
	private DocumentService documentService;
	@Autowired
	private RMSampleProjDao sampleProjDao;
	@Autowired
	private RMSampleProjService sampleProjService;
	@Autowired
	private RMCheckDepartmentSetDao checkDepartmentSetDao;
	@Autowired
	private RMCheckDepartmentSetService checkDepartmentSetService;
	@Autowired
	private RMCheckDetailDao checkDetailDao;
	@Autowired
	private RMCheckDetailService checkDetailService;
	@Autowired
	private RMCheckDetailItemSetupsDao checkDetailItemSetupsDao;
	@Autowired
	private RMCheckDetailItemSetupsService checkDetailItemSetupsService;
	@Autowired
	private RMForLineFormulaDao forLineFormulaDao;
	@Autowired
	private RMForLineFormulaService forLineFormulaService;
	@Autowired
	private RMFormulaDao formulaDao;
	@Autowired
	private RMFormulaBeforeProcessDao formulaBeforeProcessDao;
	@Autowired
	private RMFormulaBeforeProcessService formulaBeforeProcessService;
	@Autowired
	private RMFormulaBomDao formulaBomDao;
	@Autowired
	private RMFormulaBomService formulaBomService;
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
	private RMForProcessUnitDao forProcessUnitDao;
	@Autowired
	private RMForProcessUnitService forProcessUnitService;
	@Autowired
	private RMForProcessUnitChoiceDao forProcessUnitChoiceDao;
	@Autowired
	private RMForProcessUnitChoiceService forProcessUnitChoiceService;
	@Autowired
	private RMPrecessStandardsDao precessStandardsDao;
	@Autowired
	private RMPrecessStandardsService precessStandardsService;
	@Autowired
	private RMProductReplaceDao productReplaceDao;
	@Autowired
	private RMProductReplaceService productReplaceService;
	@Autowired
	private RMReplaceFormulaDao replaceFormulaDao;
	@Autowired
	private RMReplaceFormulaService replaceFormulaService;
	@Autowired
	private RMProcessTypeDao processTypeDao;
	@Autowired
	private RMProcessTypeService processTypeService;
	@Autowired
	private RMPickSiteDao pickSiteDao;
	@Autowired
	private RMPickSiteService pickSiteService;
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
	private RMFormulaTypeDao formulaTypeDao;
	@Autowired
	private RMFormulaTypeService formulaTypeService;
	@Autowired
	private RMStandDao standDao;
	@Autowired
	private RMStandService standService;
	@Autowired
	private RMBatchFactoryDao batchFactoryDao;
	@Autowired
	private RMBatchFactoryService batchFactoryService;
	@Autowired
	private RMBatchFormulaMainDao batchFormulaMainDao;
	@Autowired
	private RMBatchFormulaMainService batchFormulaMainService;
	@Autowired
	private RMSynchroLogDao synchroLogDao;
	@Autowired
	private RMSynchroLogService synchroLogService;
	@Autowired
	private RMTestProjDao testProjDao;
	@Autowired
	private RMTestProjService testProjService;
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
	private RMProductMapOtherDao productMapOtherDao;
	@Autowired
	private RMProductMapOtherService productMapOtherService;
	@Autowired
	private RMFormulaBomMainDao formulaBomMainDao;
	@Autowired
	private RMFormulaBomMainService formulaBomMainService;
	@Autowired
	private RMFormulaBomMaterialDao formulaBomMaterialDao;
	@Autowired
	private RMFormulaBomMaterialService formulaBomMaterialService;
	@Autowired
	private RMFormulaChangeDao formulaChangeDao;
	@Autowired
	private RMFormulaChangeService formulaChangeService;
	
	@Value("${bap.recall.remain.time}")
	private int recallRemainTime = 60;

	@Autowired
	private InstanceService instanceService;
	@Resource
	private TransitionService transitionService;
	
	@Autowired
	private TaskService taskService;
	@Autowired
	private RMFormulaVariablesProvider variablesProvider;
	@Autowired
	private ProcessService processService;
	@Autowired
	private CookieService cookieService;
	@Autowired
	private DataPermissionService dataPermissionService;
	@Autowired
	private CounterManager counterManager;
	@Autowired
	private ConditionService conditionService;
	@Autowired
	private ViewServiceFoundation viewServiceFoundation;
	private Counter counter;
	private Counter codeCounter;
	@Autowired
	private CreatorService creatorService;
	@Autowired
	private BundleContext bundleContext;
	@Autowired
	private SynchronizeInfoService synchronizeInfoService;
	@Autowired
	private ModelServiceFoundation modelServiceFoundation;
	@Resource
	private IBAPBaseService<RMFormula> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private RMFormulaImportService formulaImportService;
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + RMFormula.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)"  + "and VALID = 1";
		Query query =  formulaDao.createQuery(hql);
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
			String hql = "select " + businessKeyName + ",id from " + RMFormula.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = formulaDao.createQuery(hql);
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
	
	/**
	 * 获取父节点对象
	*/
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam) {
		String hql = null;
		if(queryParam!=null && queryParam.equals("md")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + RMFormula.JPA_NAME + " where " + mainDisplayName + " in (:serial)";
		}else if(queryParam!=null && queryParam.equals("bk")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + RMFormula.JPA_NAME + " where " + businessKeyName + " in (:serial)";
		}
		Query query =  formulaDao.createQuery(hql);
		query.setParameterList("serial", serial);
		List<Object[]> list = query.list();
		/*String sql = null;
		if(queryParam!=null && queryParam.equals("md")){
			sql = "select * from " + RMFormula.TABLE_NAME + " where " + mainDisplayName + " = ?";
		}else if(queryParam!=null && queryParam.equals("bk")){
			sql = "select * from " + RMFormula.TABLE_NAME + " where " + businessKeyName + " = ?";
		}
		List<RMFormula> list = (List<RMFormula>) formulaDao.createNativeQuery(sql,serial.get(0)).list();
		*/
		Map<String, Object> m = new HashMap<String, Object>();
		if(queryParam!=null && queryParam.equals("md")){
			m.put("count", list.size());
		}
		if (list != null && !list.isEmpty()) {
			for (Object[] obj : list) {
				m.put(serial.get(0).toString(), obj);
			}
		}
		
		return m;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public RMFormula getFormula(long id){
		return getFormula(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public RMFormula getFormula(long id, String viewCode){
		RMFormula formula = formulaDao.load(id);

		// 一对多情况处理
		if(formula != null){
			this.setFormulaIDApplyCheckStaff(formula, viewCode);
			this.setFormulaIDFactoryID(formula, viewCode);
			this.setFormulaIDActiveID(formula, viewCode);
			this.setFormulaIDApplyCheckDept(formula, viewCode);
			this.setFormulaIDExeCheckDept(formula, viewCode);
			this.setSupervision(formula);
		}
		return formula;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getFormulaAsJSON(long id, String include){
		RMFormula formula = formulaDao.load(id);
		// 一对多情况处理
			this.setFormulaIDApplyCheckStaff(formula);
			this.setFormulaIDFactoryID(formula);
			this.setFormulaIDActiveID(formula);
			this.setFormulaIDApplyCheckDept(formula);
			this.setFormulaIDExeCheckDept(formula);
			this.dealSupervision(formula);

		if(formula == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(formula, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.delete",operType="3")
	public void deleteFormula(RMFormula formula){
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		beforeDeleteFormula(formula);
		formulaDao.delete(formula);
		afterDeleteFormula(formula);
		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/del", formula,RMFormulaMneCode.class);
		List<RMFormula> params = new ArrayList<RMFormula>();
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		params.add(formula);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
		delIds = formula.getFormulaIDApplyCheckStaffmultiselectIDs();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("applyCheckStaff.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		delIds = formula.getFormulaIDFactoryIDmultiselectIDs();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("factoryID.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		delIds = formula.getFormulaIDActiveIDmultiselectIDs();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("activeID.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		delIds = formula.getFormulaIDApplyCheckDeptmultiselectIDs();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("applyCheckDept.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		delIds = formula.getFormulaIDExeCheckDeptmultiselectIDs();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("exeCheckDept.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
			// TODO delete
			// this.dealSupervision(formula);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.delete",operType="3")
	public void deleteFormula(List<Long> formulaIds){
		deleteFormula(formulaIds, null);
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.delete",operType="3")
	public void deleteFormula(List<Long> formulaIds, String eventTopic) {
		List<RMFormula> formulas = new ArrayList<RMFormula>();
		for(Long formulaId : formulaIds){
			RMFormula formula = getFormula(formulaId);
			formulas.add(formula);
			if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(AuditUtil.getColumnStringA() + (null == formula.getId() ? "" : "," + formula.getId().toString()));
				} else {
					AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(AuditUtil.getColumnStringB() + (null == formula.getTableNo() ? "" : "," + formula.getTableNo().toString()));
				} else {
					AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(AuditUtil.getColumnStringC() + (null == formula.getId() ? "" : "," + formula.getId().toString()));
				} else {
					AuditUtil.setColumnStringC(null == formula.getId() ? "" : formula.getId().toString());
				}
			}
		}
		
		for(RMFormula formula : formulas){
			beforeDeleteFormula(formula);
		}
		
		
		/**
		 * 假删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(formulas != null && formulas.size() > 0 ){
			for(RMFormula formula : formulas){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				List<Object> currentState = new ArrayList<Object>();
				propertyNames.add("valid");
				currentState.add(false);
				previousState.add(true);
				dataAuditLogService.saveCustomerAudit(InternationalResource.get("foundation.common.delete"),formula, formula.getId(), currentState.toArray(), previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
			}
		}
		if(formulaIds != null && formulaIds.size() > 0) {
			String hql = "update " + RMFormula.JPA_NAME + " set valid = false where id in(:ids)";
			Query query = formulaDao.createQuery(hql);
			query.setParameterList("ids", formulaIds);
			query.executeUpdate();
		}
		
		for(RMFormula formula : formulas){
			afterDeleteFormula(formula);
		}
		
		if(eventTopic==null){
			for(RMFormula formulaz : formulas){
				formulaz.setValid(false);
				List<RMFormula> params = new ArrayList<RMFormula>();
				List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formulaz));
				formulaz.setCheckDepartmentSetList(checkDepartmentSetList);
				params.add(formulaz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "RM_7.5.0.0_formula");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.delete",operType="3")
	public void deleteFormula(long formulaId, int formulaVersion){
		this.deleteFormula(formulaId, formulaVersion,null);
	}
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.delete",operType="3")
	public void deleteFormula(long formulaId, int formulaVersion,SignatureLog signatureLog){
		RMFormula formula = getFormula(formulaId);
		if(formula != null && !formula.isValid()){
			throw new BAPException(BAPException.Code.OBJECT_HAVE_BEAN_DELETED);
		}
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		beforeDeleteFormula(formula);
		formulaDao.delete(formulaId, formulaVersion);
		afterDeleteFormula(formula);
		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/del", formula,RMFormulaMneCode.class);
		List<RMFormula> params = new ArrayList<RMFormula>();
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		params.add(formula);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		props.put("eventType", "delete");
		
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=formula.getTableNo();
			signatureLog.setTableId(formula.getId());
			if(businessKey != null) {
				if(StringUtils.isEmpty(signatureLog.getBusinessKey())){
					signatureLog.setBusinessKey(businessKey.toString());
				} else {
					signatureLog.setBusinessKey(signatureLog.getBusinessKey() + "," + businessKey.toString());
				}
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
		}
		
	}
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.delete",operType="3")
	public void deleteFormula(String formulaIds){
		this.deleteFormula(formulaIds,null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.delete",operType="3")
	public void deleteFormula(String formulaIds,SignatureLog signatureLog){
		deleteCollection(formulaIds,signatureLog);
	}
	
	private void deleteCollection(String ids,SignatureLog signatureLog) {
		if(ids.isEmpty()){
			throw new BAPException("ec.common.checkselected");
		}
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			String version = idVersion.split("@")[1];
			if (id != null && id.trim().length() > 0 && version != null && version.trim().length() > 0) {
				deleteFormula(Long.valueOf(id), Integer.valueOf(version),signatureLog);
			}
		}
		if(null != signatureLog){
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:RM_7.5.0.0#entityCode:RM_7.5.0.0_formula#modelCode:RM_7.5.0.0_formula_Formula#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.engine.restore",operType="10")
	public void restoreFormula(String formulaIds){
		restoreCollection(formulaIds);
	}
	
	public void restoreCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			if (id != null && id.trim().length() > 0) {
				restoreFormula(Long.valueOf(id));
			}
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.engine.restore",operType="10")
	public void restoreFormula(long formulaId){
		
		findBusinessKeyUsed(formulaId);	//判断业务主键是否重复
		
		RMFormula formula = getFormula(formulaId);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		beforeRestoreFormula(formula);
		formula.setValid(true);
		formulaDao.update(formula);
		afterRestoreFormula(formula);
		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
		List<RMFormula> params = new ArrayList<RMFormula>();
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		params.add(formula);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		props.put("eventType", "restore");
	}
	
	public void findBusinessKeyUsed(long formulaId){
		Property property = modelServiceFoundation.getBussinessProperty("RM_7.5.0.0_formula_Formula");
		if(property != null){
			String propertyName = property.getColumnName();
			String sql  = "select * from " + RMFormula.TABLE_NAME + " where valid = 1 and " + 
					propertyName + " =  (select "+ propertyName +" from "+ RMFormula.TABLE_NAME +" where id = ? )";
			List<Object> list =  formulaDao.createNativeQuery(sql,formulaId).list();
			if(list.size() > 0){
				throw new BAPException("foundation.bussinessKey.repeat");
			}
			
		}
	}
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.batch.import",operType="4")
	public  void batchImportBaseFormula(List<RMFormula>  formulas){
		for(RMFormula formula:formulas)  {
			saveFormula(formula, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBaseFormula(List<RMFormula>  formulas){
		for(RMFormula formula:formulas)  {
			saveFormula(formula, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.save")
	public void saveFormula(RMFormula formula, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		saveFormula(formula, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.save")
	public void saveFormula(RMFormula formula, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		saveFormula(formula, dgLists,dgDeleteIDs,assFileUploads, viewCode, null,null);
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditFormula(RMFormula formula, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, boolean... isImport){
		this.saveSuperEditFormula(formula, workFlowVar, dgLists, dgDeleteIDs, assFileUploads, viewCode, null, isImport);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditFormula(RMFormula formula, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, SignatureLog signatureLog, boolean... isImport){
		String entityCode = "RM_7.5.0.0_formula";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditFormula(workFlowVar, dgLists, dgDeleteIDs, assFileUploads, view, entityCode, events, formula, isImport);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=formula.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			signatureLog.setTableId(formula.getId());
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:RM_7.5.0.0#entityCode:RM_7.5.0.0_formula#modelCode:RM_7.5.0.0_formula_Formula#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.upload.importFlow",operType="4")
	public void importFormulaWorkFlow(RMFormula formula, String viewCode){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 saveSuperEditFormula(formula, workFlowVar, null,null,null, viewCode, null,true);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.batch.upload.importFlow",operType="4")
	public void batchImportFormulaWorkFlow(List<RMFormula>  formulas, View view){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 batchSaveSuperEditFormula(formulas, workFlowVar, null,null,null, view, true);
	}
	
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.batch.import",operType="4")
	public void batchSaveSuperEditFormula(List<RMFormula>  formulas, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport){
		String entityCode = "RM_7.5.0.0_formula";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(RMFormula formula:formulas)  {
			saveSingleSuperEditFormula(workFlowVar, dgLists, dgDeleteIDs,assFileUploads, view, entityCode, events, formula, isImport);
		}
	}
	
	
	
	public void saveSingleSuperEditFormula(WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, String entityCode, List<Event> events,RMFormula formula, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, formula);
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("RM_7.5.0.0_formula");
		workFlowVar.setTableName(RMFormula.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("rM_formulaService");
		workFlowVar.setStatus(formula);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		formula.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (formula.getId() == null) {
			formula.setStatus(EntityTableInfo.STATUS_EFFECTED);
			formula.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitFormula(formula, workFlowVar, true);
		batchSaveFormula(formula,dgLists, dgDeleteIDs,assFileUploads, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(formula.getTableInfoId(), isSuperAdd,isImport);
		formulaDao.flush();
		workFlowVar.setModelId(formula.getId());
		workFlowVar.setTableInfoId(formula.getTableInfoId());
		workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
		workFlowVar.setOwnerId(formula.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
		workFlowVar.setTableNo(formula.getTableNo());
		
		afterSubmitProcessFormula(formula, di, workFlowVar, view.getCode(), true);
		afterSubmitFormula(formula, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, formula);
			}
		}
	}
	
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.batch.save",operType="4")
	public void batchSaveFormula(RMFormula formula,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads ,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(formula.getId()!=null && formula.getId()>0){
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
				executeGScript(entityCode, "beforeSave", events, formula);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		beforeSaveFormula(formula, viewIsView);

		if (null == formula.getId()) {
			if(null == formula.getStatus()){
				formula.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			formula.setTableNo(generateTableNo());
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				formulaDao.save(formula);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(formula,isImport);
			formulaDao.saveTableInfo(ti);
			formula.setTableInfoId(ti.getId());
			if(formula.getOwnerStaffId()==null){
				formula.setOwnerStaffId(formula.getCreateStaffId());
				ti.setOwnerStaffId(formula.getCreateStaffId());
			}
			if(formula.getOwnerDepartmentId()==null){
				formula.setOwnerDepartmentId(formula.getCreateDepartmentId());
				ti.setOwnerDepartmentId(formula.getCreateDepartmentId());
			}
			if(formula.getOwnerPositionId()==null){
				formula.setOwnerPositionId(formula.getCreatePositionId());
				ti.setOwnerPositionId(formula.getCreatePositionId());
			}
			formula.setCreateStaffId(formula.getCreateStaffId());
			formula.setCreatePositionId(formula.getCreatePositionId());
			formula.setCreateDepartmentId(formula.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (formula.getCompany() == null) {
				formula.setCompany(getCurrentCompany());
			}
			if (formula.getCid() == null || formula.getCid() == -1l) {
				formula.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				formulaDao.save(formula);
			}
		} else {
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				formulaDao.merge(formula);
			}
		}
		dealDatagridsSave(formula,view.getCode(),dgLists,dgDeleteIDs,assFileUploads);
		
		// 一对多情况处理
		this.dealFormulaIDApplyCheckStaff(formula);
		this.dealFormulaIDFactoryID(formula);
		this.dealFormulaIDActiveID(formula);
		this.dealFormulaIDApplyCheckDept(formula);
		this.dealFormulaIDExeCheckDept(formula);
		this.dealSupervision(formula);
		
		// 根据配置规则生成编码
		try {
			generateFormulaCodes(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaSummarys(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormula(formula, viewIsView);
		

		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formula);
			}
		}
		List<RMFormula> params = new ArrayList<RMFormula>();
		formulaDao.flush();
		formulaDao.clear();
		formula = formulaDao.load(formula.getId());
		
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		
		params.add(formula);
	}
	
	
	
	

	public void generateFormulaCodes(RMFormula formula) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateFormulaCodes(formula, false);
	}
	
	public void generateFormulaCodes(RMFormula formula, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
			formulaDao.flush();
			formulaDao.clear();
			RMFormula modelinstance = getFormula(formula.getId());
			customGenerateCodes(modelinstance, viewIsView);
			ArrayList<Map<String, Object>> configs=null;
			String dependence;
			Property property=null;
			boolean isLegal;
		// code
		if (formula.getCode() == null || formula.getCode().isEmpty()) {
			String code_property_code = "RM_7.5.0.0_formula_Formula_code";
			property = modelServiceFoundation.getProperty(code_property_code);
			isLegal=true;
			if(null != property){
				Map<String, Object> codeattributesMap = property.getAttributesMap();
				if(codeattributesMap.get("pattern")!=null){
					codeCounter.setPattern(codeattributesMap.get("pattern").toString());
				}
				configs=(ArrayList<Map<String, Object>>) codeattributesMap.get("config");
				dependence=null;
				ArrayList<Object> codeparamlist=new ArrayList<Object>();
				for(int i=0;i<configs.size();i++){
					String ovalue=null;
					if(configs.get(i).get("type").equals("auto")&&configs.get(i).get("autoType").equals("Date")){
						Map<String, Object> autoConfig=configs.get(i);
						if(autoConfig.get("value").equals("_systemdate")){
							dependence=NonCachedCounterBean.dateFormat(new Date(),autoConfig.get("countType").toString());
						}else{
							String field=autoConfig.get("value").toString();
							if(field.equals("")){
								isLegal=false;
								break;
							}
							String fieldValue=ReflectUtils.getPropertyValue(modelinstance,field.substring(field.indexOf(".")+1));
							if(fieldValue==null||fieldValue.equals("")){
								isLegal=false;
								break;
							}else{
								if(autoConfig.get("countType").equals("Yearly")){
									dependence = fieldValue.substring(0, 4);
								}else if(autoConfig.get("countType").equals("Monthly")){
									dependence = fieldValue.substring(0, 7);
								}else if(autoConfig.get("countType").equals("Daily")){
									dependence = fieldValue.substring(0, 10);
								}
							}
						}
					}
					if(configs.get(i).get("type").equals("property")){
						ovalue=ReflectUtils.getPropertyValue(modelinstance,configs.get(i).get("value").toString().substring(configs.get(i).get("value").toString().indexOf(".")+1));
						if(ovalue.equals("")){
							isLegal=false;
							break;
						}
					}else if(configs.get(i).get("type").equals("date")){
						if(configs.get(i).get("value").equals("_systemdate")){
							ovalue=NonCachedCounterBean.dateFormat(new Date(),configs.get(i).get("dateType").toString());
						}else{
							String field=configs.get(i).get("value").toString();
							if(field.equals("")){
								isLegal=false;
								break;
							}
							String fieldValue=ReflectUtils.getPropertyValue(modelinstance,field.substring(field.indexOf(".")+1));
							if(fieldValue==null||fieldValue.equals("")){
								isLegal=false;
								break;
							}else{
								if(configs.get(i).get("dateType").equals("YearA")){
									ovalue=fieldValue.substring(0, 4);
								}else if(configs.get(i).get("dateType").equals("YearB")){
									ovalue=fieldValue.substring(2, 4);
								}else if(configs.get(i).get("dateType").equals("Month")){
									ovalue=fieldValue.substring(5, 7);
								}else if(configs.get(i).get("dateType").equals("Date")){
									ovalue=fieldValue.substring(8, 10);
								}
							}
						}
					}else{
						ovalue=configs.get(i).get("value").toString();
					}
					if(configs.get(i).get("thecase").equals("uppercase")){
						ovalue=ovalue.toUpperCase();
					}else if(configs.get(i).get("thecase").equals("lowercase")){
						ovalue=ovalue.toLowerCase();
					}
					codeparamlist.add(ovalue);
				}
				if(isLegal){
					String codenewCodeValue="";
					if(dependence!=null){
						if((Boolean)codeattributesMap.get("rollbackable")==true){
							codenewCodeValue=codeCounter.incrementAndGetStringDependenceWithTx(dependence,codeparamlist.toArray());
						}else{
							codenewCodeValue=codeCounter.incrementAndGetStringDependence(dependence,codeparamlist.toArray());
						}
					}else{
						if((Boolean)codeattributesMap.get("rollbackable")==true){
							codenewCodeValue=codeCounter.incrementAndGetStringWithTx(codeparamlist.toArray());
						}else{
							codenewCodeValue=codeCounter.incrementAndGetString(codeparamlist.toArray());
						}
					}
					modelinstance.setCode(codenewCodeValue);
					formula.setCode(codenewCodeValue);
				}
				
				if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
					if(property.getIsBussinessKey()){
						AuditUtil.setColumnStringB(modelinstance.getCode());
					}
					if(property.getIsMainDisplay()){
						AuditUtil.setColumnStringA(modelinstance.getCode());
					}
				}
			}
				
		}
		if (viewIsView) {
			formulaDao.saveWithRevertVersion(modelinstance);
		} else {
			formulaDao.save(modelinstance);
		}
	}
	
	public void generateFormulaSummarys(RMFormula formula) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateFormulaSummarys(formula, false);
	}

	public void generateFormulaSummarys(RMFormula formula, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void saveFormula(RMFormula formula,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic,boolean... isImport){
		this.saveFormula(formula, dgLists,dgDeleteIDs,assFileUploads, viewCode, eventTopic,null,isImport);
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void saveFormula(RMFormula formula,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport){
		boolean isNew = false;
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(formula.getId() != null && formula.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
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
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, formula);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		beforeSaveFormula(formula, viewIsView);

		if (null == formula.getId()) {
			if(null == formula.getStatus()){
				formula.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			formula.setTableNo(generateTableNo());
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				if(isNew)
					formulaDao.save(formula);
				else
					formulaDao.merge(formula);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(formula,isImport);
				formulaDao.saveTableInfo(ti);
				formula.setTableInfoId(ti.getId());
				if(formula.getOwnerStaffId()==null){
					formula.setOwnerStaffId(formula.getCreateStaffId());
					ti.setOwnerStaffId(formula.getCreateStaffId());
				}
				if(formula.getOwnerDepartmentId()==null){
					formula.setOwnerDepartmentId(formula.getCreateDepartmentId());
					ti.setOwnerDepartmentId(formula.getCreateDepartmentId());
				}
				if(formula.getOwnerPositionId()==null){
					formula.setOwnerPositionId(formula.getCreatePositionId());
					ti.setOwnerPositionId(formula.getCreatePositionId());
				}
				formula.setCreateStaffId(formula.getCreateStaffId());
				formula.setCreatePositionId(formula.getCreatePositionId());
				formula.setCreateDepartmentId(formula.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (formula.getCompany() == null) {
					formula.setCompany(getCurrentCompany());
				}
				if (formula.getCid() == null || formula.getCid() == -1l) {
					formula.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					formulaDao.saveWithRevertVersion(formula);
				} else {
					formulaDao.save(formula);
				}
				
		} else {
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				if(isNew)
					formulaDao.save(formula);
				else
					formulaDao.merge(formula);
			}
		}
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		dealDatagridsSave(formula,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
			this.dealFormulaIDApplyCheckStaff(formula);
			this.dealFormulaIDFactoryID(formula);
			this.dealFormulaIDActiveID(formula);
			this.dealFormulaIDApplyCheckDept(formula);
			this.dealFormulaIDExeCheckDept(formula);
			this.dealSupervision(formula);
		
		// 根据配置规则生成编码
		try {
			generateFormulaCodes(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaSummarys(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormula(formula, viewIsView);


		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formula);
			}
		}
		List<RMFormula> params = new ArrayList<RMFormula>();
		formulaDao.flush();
		formulaDao.clear();
		formula = formulaDao.load(formula.getId());
		
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		
		params.add(formula);
		
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=formula.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(formula.getId());
			String msgId="moduleCode:RM_7.5.0.0#entityCode:RM_7.5.0.0_formula#modelCode:RM_7.5.0.0_formula_Formula#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, RMFormula formula){
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
						variables.put("formula", formula);
						variables.put("userId", getCurrentUser().getId().toString());
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
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void mergeFormula(RMFormula formula, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(formula);
		beforeSaveFormula(formula);
		if (null == formula.getId()) {
			formula.setStatus(EntityTableInfo.STATUS_RUNNING);
			formula.setTableNo(generateTableNo());
			formulaDao.save(formula);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(formula);
				formulaDao.saveTableInfo(ti);
				formula.setTableInfoId(ti.getId());
				if(formula.getOwnerStaffId()==null){
					formula.setOwnerStaffId(formula.getCreateStaffId());
				}
				if(formula.getOwnerDepartmentId()==null){
					formula.setOwnerDepartmentId(formula.getCreateDepartmentId());
				}
				if(formula.getOwnerPositionId()==null){
					formula.setOwnerPositionId(formula.getCreatePositionId());
				}
				formula.setCreateStaffId(formula.getCreateStaffId());
				formula.setCreatePositionId(formula.getCreatePositionId());
				formula.setCreateDepartmentId(formula.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (formula.getCompany() == null) {
					formula.setCompany(getCurrentCompany());
				}
				if (formula.getCid() == null || formula.getCid() == -1l) {
					formula.setCid(getCurrentCompanyId());
				}
				formulaDao.merge(formula);
		} else {
			formulaDao.merge(formula);
		}
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		dealDatagridsSave(formula,null,dgLists,dgDeleteIDs,assFileUploads);

			// 一对多情况处理
			this.dealFormulaIDApplyCheckStaff(formula);
			this.dealFormulaIDFactoryID(formula);
			this.dealFormulaIDActiveID(formula);
			this.dealFormulaIDApplyCheckDept(formula);
			this.dealFormulaIDExeCheckDept(formula);
			this.dealSupervision(formula);
		afterSaveFormula(formula);
		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<RMFormula> findFormulas(Page<RMFormula> page, Criterion... criterions) {
		return formulaDao.findByPage(page, criterions);
	}
	@Override
	public List<Object> generateParamExcelSql(List<Param> params, Integer type, String viewCode){
		List<Object> returnList = new ArrayList<Object>();
		Boolean crossCompanyFlag = null;
		StringBuilder s = new StringBuilder();
		List<Object> list = new ArrayList<Object>();
		boolean hasWhere = false;
		String referenceCondition = "";
		String customerSql = "";
		String customerCondition = "";
		String classifySql = "";
		if (null != params && !params.isEmpty()) {
			Param param = params.get(0);
			if ("crossCompanyFlag".equals(param.getName())) {
				crossCompanyFlag = Boolean.parseBoolean(param.getValue()
						.toString());
				params.remove(0);
			}
		}

		if (null != params && !params.isEmpty()) {
			s.append(" AND ((");
			hasWhere = true;
			String advQuery = "";
			String classifyCodes = "";
			List<Object> advValues = null;
			String extraQuery = "";
			List<Object> customerValues = null;
			List<Object> extraQueryValues = null;
			List<Object> customerSqlValues = null;
			List<Object> classifySqlValues = null;
			// 组合where条件
			for (int i = 0; i < params.size(); i++) {
				Param param = params.get(i);

				if ("classifySql".equals(param.getName())) {
					classifySql = (String) param.getValue();
					continue;
				}

				if ("classifySqlValues".equals(param.getName())) {
					classifySqlValues = (List<Object>) param.getValue();
					continue;
				}

				if (type == Sql.TYPE_LIST_REFERENCE
						&& "referenceCondition".equals(param.getName())) {
					referenceCondition = (String) param.getValue();
					continue;
				}

				if ("customerValues".equals(param.getName())) {
					customerValues = (List<Object>) param.getValue();
					continue;
				}
				if ("customerSqlValues".equals(param.getName())) {
					customerSqlValues = (List<Object>) param.getValue();
					continue;
				}
				if ("customerCondition".equals(param.getName())) {
					customerCondition = (String) param.getValue();
					continue;
				}
				if ("customerSql".equals(param.getName())) {
					customerSql = (String) param.getValue();
					continue;
				}

				if ("advQueryCond".equals(param.getName())) {
					AdvQueryCondition cond = conditionService
							.toSql((String) param.getValue());
					if (cond != null) {
						advValues = cond.getValues();
						advQuery = cond.getSql();
					}
					continue;
				}
				// 数据分类内的高级查询
				if ("classifyCodes".equals(param.getName())) {
					classifyCodes = (String) param.getValue();
					continue;
				}
				if ("extraQueryCond".equals(param.getName())) {
					Map<String, String> oneToManyParams = new HashMap<String, String>();
					oneToManyParams = (Map<String, String>) param.getValue();
					String json = sqlService.getExtraQueryJson(viewCode);
					Pattern oneToManyPattern = Pattern
							.compile("(\"value\":\")(\\$\\$.*?\\$\\$)(\")");
					Matcher matcher = oneToManyPattern.matcher(json);
					while (matcher.find()) {
						String tag = (matcher.group(2));
						String subTag = tag.substring(2, tag.length() - 2);
						if (null != oneToManyParams.get(subTag)
								&& ((String) (oneToManyParams.get(subTag)))
										.length() > 0) {
							json = json.replace(
									tag,
									oneToManyParams.get(subTag).replace("\"",
											"SYMBOL_DOUBLE_QUOTE"));
						} else {
							json = json.replace(tag, "");
						}
					}
					if (null != json && json.length() > 0) {
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
					String key = null, columnName = null, customKey = null;
					if (sortValue.indexOf("::") > 0) {
						key = sortValue.split("::")[0];
						columnName = sortValue.split("::")[1];
					} else if (sortValue.indexOf(".") > 0) {
						customKey = sortValue.split("\\.")[0];
						if (customKey.contains("attrMap")) {
							key = customKey;
							columnName = sortValue.split("\\.")[1];
						} else {
							key = sortValue;
						}
					} else {
						key = sortValue;
					}
					int lastDotPos = key.lastIndexOf('.');
					if (null == columnName) {
						columnName = Inflector.getInstance().columnize(
								key.substring(lastDotPos + 1));
					}
					String tableAlias = lastDotPos < 0 ? "\"maintenanceList\""
							: "\"" + key.substring(0, lastDotPos) + "\"";
					if ("\"pending\"".equals(tableAlias)) {
						tableAlias = "\"p\"";
					}
					// sortOrderByStr.append(tableAlias).append(".").append(columnName);
					continue;
				}
				if ("dataTable-sortColOrder".equals(param.getName())) {
					// sortOrderByStr.append(" ").append((String)
					// param.getValue());
					continue;
				}
				if (param.getName().startsWith("\"tree-")) {
					if (param.getName().startsWith("\"tree-layRec-")) {
						String treeCondition = sqlService.getSqlQuery(viewCode,
								Sql.TYPE_USED_TREE);
						if (treeCondition != null
								&& treeCondition.trim().length() > 0) {
							if (hasWhere)
								s.append(" AND ");
							else
								s.append(" WHERE (");

							s.append(treeCondition);
							if (param.getLikeType() == Param.EQUAL_LIKELEFT) {
								list.add(param.getValue());
								list.add((String) param.getValue() + "-%");
							}
							if (param.getLikeType() == Param.LIKE_UNSUPPORT) {
								list.add(param.getValue());
							}
						}
					}
					continue;
				}
				if (!param.getName().startsWith("\"tree-")
						&& param.getLikeType() == Param.EQUAL_LIKELEFT) {
					s.append(" AND ( ").append(param.getName()).append("= ? ")
							.append(" OR ").append(param.getName())
							.append(" like ? )");
					list.add(param.getValue());
					list.add(param.getValue() + "-%");
					continue;
				}
				if (i > 0) {
					s.append(" AND ");
				}
				if ((null != param.getContainLower() && param.getContainLower())) {
					s.append(" ( ");
				}
				if (!param.getCaseSensitive()) {
					if (param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT
							|| param.getLikeType() == Param.LIKE_UNSUPPORT || param.getLikeType() == Param.NONE_EQUAL) {
						if (!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType())
								&& !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
							s.append(" UPPER (");
						}
					}
				}
				if (param.getLikeType() != Param.MULTI_LIKE) {
					s.append(param.getName());
				}
				if (!param.getCaseSensitive()) {
					if (param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT
							|| param.getLikeType() == Param.LIKE_UNSUPPORT || param.getLikeType() == Param.NONE_EQUAL) {
						if (!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType())
								&& !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
							s.append(") ");
						}
					}
				}
				String exp = " = ?";
				if (param.getLikeType() == Param.LIKE_UNSUPPORT) {
					/*if ((Boolean) param.getValue() == true) {
						s.append(" = 1");
					} else {
						s.append(" = 0");
					}*/
					s.append(" = ?");
				} else if (param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_LEFT) {
					//s.append(" LIKE '%" + param.getValue() + "%'");
					s.append(" LIKE ?");
					exp = " LIKE ?";
				} else if (param.getLikeType() == Param.GREATE_EQUAL) {
					//s.append(" <= '" + param.getValue() + "'");
					s.append(" <= ?");
					exp = " >= ?";
				} else if (param.getLikeType() == Param.LESS_EQUAL) {
					//s.append(" <= '" + param.getValue() + "'");
					s.append(" <= ?");
					exp = " <= ?";
				} else if (param.getLikeType() == Param.GREATE_THAN) {
					//s.append(" > '" + param.getValue() + "'");
					s.append(" > ?");
					exp = " > ?";
				} else if (param.getLikeType() == Param.LESS_THAN) {
					//s.append(" < '" + param.getValue() + "'");
					s.append(" < ?");
					exp = " < ?";
				} else if (param.getLikeType() == Param.NONE_EQUAL) {
					//s.append(" <> '" + param.getValue() + "'");
					s.append(" <> ?");
					exp = " <> ?";
				} else if (param.getLikeType() == Param.MULTI_LIKE) {
					exp = " LIKE ?";
					String multiValue = param.getValue().toString();
					String[] values = multiValue.split(",");
					StringBuilder multiSb = new StringBuilder();
					for (int m = 0; m < values.length; m++) {
						if (null != values[m] && values[m].length() > 0) {
							multiSb.append(" OR ");
							multiSb.append(param.getName()).append(" LIKE ? ");
							list.add("%," + values[m] + ",%");
						}
					}
					if (multiSb.length() > 0) {
						s.append(" ( ");
						s.append(multiSb.toString().substring(4));
						s.append(" ) ");
					}
				} else {
				}
				if (param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT) {
					String upperStr = (String) param.getValue();
					if (!param.getCaseSensitive()) {
						upperStr = upperStr.toUpperCase();
					}
					if (param.getLikeType() == Param.LIKE_ALL) {
						param.setValue('%' + upperStr + '%');
					}
					if (param.getLikeType() == Param.LIKE_LEFT) {
						param.setValue(upperStr + '%');
					}
					if (param.getLikeType() == Param.LIKE_RIGHT) {
						param.setValue('%' + upperStr);
					}
				}
				if (param.getLikeType() == Param.LIKE_UNSUPPORT || param.getLikeType() == Param.NONE_EQUAL) {
					if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
						}
					} else if ("LONG".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(Long.parseLong((String) param.getValue()));
						}
					} else if ("INTEGER".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(Integer.parseInt((String) param.getValue()));
						}
					} else if ("DECIMAL".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(new BigDecimal((String) param.getValue()));
						}
					} else {
						if (param.getValue() instanceof String) {
							String upperStr = (String) param.getValue();
							if (!param.getCaseSensitive()) {
								upperStr = upperStr.toUpperCase();
							}
							param.setValue(upperStr);
						} else {
							param.setValue(param.getValue());
						}
					}
				}
				if (param.getLikeType() == Param.GREATE_EQUAL || param.getLikeType() == Param.GREATE_THAN || param.getLikeType() == Param.LESS_EQUAL || param.getLikeType() == Param.LESS_THAN) {
					if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
						}
					} else if ("LONG".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(Long.parseLong((String) param.getValue()));
						}
					} else if ("INTEGER".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(Integer.parseInt((String) param.getValue()));
						}
					} else if ("DECIMAL".equals(param.getColumnType())) {
						if (param.getValue() instanceof String) {
							param.setValue(new BigDecimal((String) param.getValue()));
						}
					}

				}

				if (param.getLikeType() != Param.MULTI_LIKE) {
					list.add(param.getValue());
				}
				if (null != param.getContainLower() && param.getContainLower()) {
					String prefix = param.getName().substring(0, param.getName().lastIndexOf("."));
					String columnName = param.getName().substring(param.getName().lastIndexOf(".") + 1);
					if (null != param.getModelInfo() && param.getModelInfo().length > 0) {
						String entityInfo = (param.getModelInfo())[0];
						String serviceInfo = (param.getModelInfo())[1];
						String layRecColumnName = null;
						if (param.getModelInfo().length > 2) {
							layRecColumnName = (param.getModelInfo())[2];
						}
						ServiceReference ref = bundleContext.getServiceReference(serviceInfo);
						List<String> layRecs = null;
						if (null != ref) {
							IModelTreeLayRecService layRecService = (IModelTreeLayRecService) bundleContext.getService(ref);
							layRecs = layRecService.getContainLower(entityInfo, Inflector.getInstance().columnToField(columnName), exp, param.getValue(), false);
						}
						if (null != layRecs && !layRecs.isEmpty()) {
							String layRecCond = "";
							for (String layRec : layRecs) {
								layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) + " = ?";
								layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) + " like ?";
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
			if (customerCondition != null && customerCondition.length() > 0) {
				s.append(" AND ").append(customerCondition);
				if (customerValues != null && customerValues.size() > 0) {
					list.addAll(customerValues);
				}
			}
			if (customerSql != null && customerSql.length() > 0) {
				s.append(" AND ").append(customerSql);
				if (customerSqlValues != null && customerSqlValues.size() > 0) {
					list.addAll(customerSqlValues);
				}
			}
			if (classifySql != null && classifySql.length() > 0) {
				s.append(" AND (").append(classifySql).append(")");
				if (classifySqlValues != null && classifySqlValues.size() > 0) {
					list.addAll(classifySqlValues);
				}
			}
			s.append(" ) ");
		}
		s.append(" ) ");

		returnList.add(s.toString());
		returnList.add(list);
		return returnList;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	private RMFormulaDealInfo getDealInfoEntity(Long tableInfoId) {
		
		List<RMFormulaDealInfo> list=formulaDao.createQuery("from " + RMFormulaDealInfo.JPA_NAME + " where tableInfoId=?", tableInfoId).setMaxResults(1).list();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void saveDealInfo(RMFormulaDealInfo dealInfo) {
		formulaDao.saveDealInfo(dealInfo);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public int getDealInfoCount(Long tableInfoId) {
		String sql = "SELECT count(1) totalCount " + "FROM "+RMFormulaDealInfo.TABLE_NAME+" DI " + "LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME
				+ " S ON S.ID=U.STAFF_ID " + "WHERE DI.TABLE_INFO_ID = ?";
		Number list = (Number) formulaDao.createNativeQuery(sql, tableInfoId).uniqueResult();
		return list.intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag) {
		String sql = "SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, WT.TYPE,WTR.TYPE TRANSITIONTYPE "
				+ " FROM "+RMFormulaDealInfo.TABLE_NAME + " DI " 
				+ " LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION "
				+ " LEFT JOIN WF_TRANSITION WTR ON WTR.CODE = DI.OUTCOME AND WTR.DEPLOYMENT_ID = WT.DEPLOYMENT_ID "
				+ " LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID "
				+ " WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION is not null ";
		if (expandFlag) {
			sql += " AND DI.COMMENTS IS NOT NULL";
			DBTYPE dbtype = formulaDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				sql += " AND DI.COMMENTS != ''";
			}
		}
		sql += " ORDER BY DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC";
		List<Object[]> list = formulaDao.createNativeQuery(sql, tableInfoId).list();
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
				+ RMFormulaDealInfo.TABLE_NAME
				+ " DI LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION ");
		groupSql.append(" LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID ");
		groupSql.append(" WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION IS NOT NULL ");
		if (expandFlag) {
			groupSql.append(" AND DI.COMMENTS IS NOT NULL");
			DBTYPE dbtype = formulaDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				groupSql.append(" AND DI.COMMENTS != ''");
			}
		}
		groupSql.append(" ORDER BY WT.ROUTE_SEQUENCE ASC, DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC");

		List<Object[]> groupList = formulaDao.createNativeQuery(groupSql.toString(), tableInfoId).list();
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
			} else {
				if(null != obj[11]) {
					obj[12] = InternationalResource.get(obj[11].toString(), getCurrentLanguage());
				}
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


	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public boolean isRecallAble(Long tableInfoId) {
		try{
			FlowCurrentStatus flowCurrentStatus = taskService.findFlowCurrentStatus(tableInfoId, getCurrentUser().getReferenceStaff().getId());

			if (flowCurrentStatus == null || flowCurrentStatus.getDeploymentId() == null) {
				return false;
			}

			Deployment d = processService.getDeployment(flowCurrentStatus.getDeploymentId());
			Map<String, Object> activeMap = processService.getActivityMap(d.getProcessDefinitionId(), flowCurrentStatus.getLastActivityName());
			Boolean recallAble = (d.getRecallAble() != null && d.getRecallAble() && (Boolean) activeMap.get("recallAble"));
			// 当前状态中，有当前用户的处理记录，并且处理未失去时效
			if (recallAble && checkRecallTimeout(flowCurrentStatus.getCreateTime().getTime(), d.getRecallRemainTime())) {
				return true;
			}
		} catch(Exception e) {
			log.warn(e.getMessage(), e);
			return false;
		}
		return false;
	}

	public boolean checkRecallTimeout(Long dealTime, Long recallRemainTime) {
		if(recallRemainTime == null) {
			recallRemainTime = new Long(this.recallRemainTime);
		}
		if (recallRemainTime != null && recallRemainTime != -1 && dealTime + recallRemainTime * 1000 < System.currentTimeMillis()) {
			return false;
		}
		return true;
	}

	@Override
	@Transactional
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="撤回",operType="4")
	public Pending recall(long tableInfoId) {
		Long modelId = null;
		RMFormula  formula = null;
		List<Object> list = formulaDao.createNativeQuery("select ID from " + RMFormula.TABLE_NAME + " where TABLE_INFO_ID = ?", tableInfoId).list();
		if (list != null && list.size() > 0) {
			if (list.get(0) != null) {
				modelId = ((Number) list.get(0)).longValue();
				formula = this.getFormula(modelId);
			}
		}
		if(null != formula){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(formula.getId().toString());
				}
			}
		}
		FlowCurrentStatus flowCurrentStatus = taskService.findFlowCurrentStatus(tableInfoId, getCurrentUser().getReferenceStaff().getId());
		if (flowCurrentStatus == null) {
			throw new BAPException(BAPException.Code.RECALL_ERROR_DEALED);
		}
		Deployment d = processService.getDeployment(flowCurrentStatus.getDeploymentId());
		Map<String, Object> activeMap = processService.getActivityMap(d.getProcessDefinitionId(), flowCurrentStatus.getLastActivityName());
		Boolean recallAble = (d.getRecallAble() != null && d.getRecallAble() && (Boolean) activeMap.get("recallAble"));

		if(!recallAble){
			throw new BAPException(BAPException.Code.RECALL_ERROR_CLOSED);
		} else if (!checkRecallTimeout(flowCurrentStatus.getCreateTime().getTime(), d.getRecallRemainTime())) {
			throw new BAPException(BAPException.Code.RECALL_ERROR_TIMEOUT);
		} else {
			List<Pending> pendings = taskService.getPendingsByTableId(tableInfoId);
			if (pendings == null || pendings.isEmpty()) {
				throw new BAPException(BAPException.Code.RECALL_ERROR_DEALED);
			}

			for (Pending pending : pendings) {
				if (pending.getStatus() == 77) {
					throw new BAPException(BAPException.Code.RECALL_ERROR_NOT_HANGUP);
				}
			}

			taskService.recallPending(flowCurrentStatus);
			Pending pending = taskService.getPendingByTableId(tableInfoId);

			Map<String, Object> props = new HashMap<>();
			props.put("callType", "service");
			props.put("entityCode", "RM_7.5.0.0_formula");
			props.put("eventType", "recall");
			return pending;
		}
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public boolean existsSupervision(Long tableInfoId, Long staffId) {
		List<RMFormulaSupervision> list = formulaDao.findSupervision(tableInfoId, staffId);
		if(list!=null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	public String getWorkFlowVarStatus(WorkFlowVar workFlowVar){
		return workFlowVar == null ? null : workFlowVar.getOutcomeType();
	}
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void save(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		save(formula, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void save(RMFormula formula, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(formula);
		boolean first = null == formula.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != formula.getCreateStaff() && null != formula.getCreateStaff().getUser()){
		    	createStaffUserId = formula.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("RM_7.5.0.0_formula");
			workFlowVar.setTableName(RMFormula.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("rM_formulaService");
		}
		formula.setWorkFlowVar(workFlowVar);
		if(formula.getDeploymentId() == null && deploymentId != null) {
			formula.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				formula.setProcessKey(d.getProcessKey());
				formula.setProcessVersion(d.getProcessVersion());
			}
		}

		saveFormula(formula, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(formula.getId().toString());
			}
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(formula.getId());
			workFlowVar.setTableInfoId(formula.getTableInfoId());
			workFlowVar.setTableNo(formula.getTableNo());
			workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
			workFlowVar.setOwnerId(formula.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(formula, instance, deploymentId, pendingId, workFlowVar);
		formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
		formulaDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessFormula(formula, di, workFlowVar, viewCode);
	}
	@Override
	public  void doFLowScript( String scriptCode,Map<String, Object> variables){
		//把本模块的bundleid传过去，为了得到本类的classload
		Bundle bundle = FrameworkUtil.getBundle(getClass());
		variables.put("moduleBundleId", bundle.getBundleId());
		EngineScriptExecutor.eval(scriptCode, variables);
		
	}
	
	@Override
	public void syncEntity(Long id, String type) {
		// TODO Auto-generated method stub
		formulaDao.flush();
		formulaDao.clear();
		RMFormula formula = getFormula(id);
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");                                                                                                                   
		props.put("entityCode", "RM_7.5.0.0_formula");
		props.put("eventType", type);
	}
	@Override
	public Date findLastDealInfo(Long tableInfoId, String activityName) {
		return formulaDao.findLastDealInfo(tableInfoId, activityName);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.submit",operType="4")
	public void submit(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		submit(formula, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.submit",operType="4")
	public void submit(RMFormula formula, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		this.submit(formula, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null,null);
	}
	
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.submit",operType="4")
	public void submit(RMFormula formula, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog) {
		String entityCode = "RM_7.5.0.0_formula";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, formula);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("RM_7.5.0.0_formula");
		workFlowVar.setTableName(RMFormula.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("rM_formulaService");
		workFlowVar.setStatus(formula);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		formula.setWorkFlowVar(workFlowVar);
		if(formula.getDeploymentId() == null && deploymentId != null) {
			formula.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				formula.setProcessKey(d.getProcessKey());
				formula.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitFormula(formula, workFlowVar);
		saveFormula(formula, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(formula.getId().toString());
			}
		}
		Integer preStatus = formula.getStatus();
		formulaDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(formula.getId());
		workFlowVar.setTableInfoId(formula.getTableInfoId());
		workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
		workFlowVar.setOwnerId(formula.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
		workFlowVar.setTableNo(formula.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, formula.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(formula, di, deploymentId, pendingId, workFlowVar, true);
			formulaDao.copyAndSaveDealInfo(saveDi, formula, creatorService.getStaffFromSession());
		}
		formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					formulaDao.flush();
					
					RMFormulaDealInfo formulaDealInfo=formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
					formulaDealInfo.setOutcome(outcome);
					formulaDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						formulaDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				formulaDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(formula.getStatus() == 99) {
			if(!preStatus.equals(formula.getStatus())){
				dataAuditLogService.saveCustomerAudit("2", formula, formula.getId(), new Object[]{formula.getStatus(),formula.getEffectTime()}, new Object[]{preStatus,null}, new String[]{"status","effectTime"});
			}
			formulaDao.deleteSupervision(formula.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + formula.getProcessKey() + "_" + di.getActivityName() + "_RM_7.5.0.0_formula_" + formula.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		formulaDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessFormula(formula, di, workFlowVar, viewCode);
		afterSubmitFormula(formula, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, formula);
			}
		}
		if(null != workFlowVar && null != workFlowVar.getOutcomeDes() && !workFlowVar.getOutcomeDes().equals("")){
			AuditUtil.setAuditDes(workFlowVar.getOutcomeDes());
			if("cancel".equals(workFlowVar.getOutcomeType())){
				AuditUtil.setAuditOperationType("6");
			} else if("reject".equals(workFlowVar.getOutcomeType())){
				AuditUtil.setAuditOperationType("7");
			}
		}
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey = formula.getTableNo();
			String transitionCode=workFlowVar.getOutcome();
			com.supcon.orchid.workflow.engine.entities.Transition transition=transitionService.getTransition(transitionCode, deploymentId);
			if(null != transition) {
				Long  transitionId=transition.getId();
				String transitionName=transition.getName();
				transitionName=InternationalResource.get(transitionName,this.getCurrentLanguage());
				signatureLog.setTransitionName(transitionName);
				signatureLog.setTransitionId(transitionId);
			}
			String processName=processService.getDeployment(deploymentId).getName();
			processName=InternationalResource.get(processName,this.getCurrentLanguage());
			signatureLog.setProcessName(processName);
			signatureLog.setTableId(formula.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:RM_7.5.0.0#entityCode:RM_7.5.0.0_formula#modelCode:RM_7.5.0.0_formula_Formula#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
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
	public void findFormulas(Page<RMFormula> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, Map exportMap, List<Param> params) {
		findFormulas(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findFormulas(Page<RMFormula> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findFormulas(Page<RMFormula> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap, objects);
	}
	
	/**
	 * 生成自定义字段查询sql
	 * @param viewCode 视图code
	 * @param sql 查询sql
	 * @return
	 */
	public String generateCustomPropertySql(String viewCode, String sql) {
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
	public void commonQuery(Page<RMFormula> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
		int queryType = 0;
		if(objects.length > 0) {
			queryType = (int) objects[0];
		}
		String sql = "";
		String dgCode = "";
	
		if(viewCode.split(",").length < 2){
			sql = sqlService.getSqlQuery(viewCode, type);
		}else{
			dgCode = viewCode.split(",")[1];
			viewCode = viewCode.split(",")[0];
			sql = sqlService.getDGSqlQuery(dgCode,type);
		}
		//如果存在导出下配置的sql则进行替换
		
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
		String countSql = null;
		if(null != dgCode && !"".equals(dgCode)){
			countSql = sqlService.getDGSqlQuery(dgCode,Sql.TYPE_USED_TOTALS);
		}else{
			countSql = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TOTALS);
		}
		if(!exportSql.trim().isEmpty())  {
			//FIXME  有小节配置时,需要将小节信息加入
			countSql="SELECT COUNT(*) count FROM ";	
		}
		User currentUser=(User)getCurrentUser();
		if(sql == null){
			sql = "";
		}
		StringBuilder totalSql = new StringBuilder(sql);
		Boolean crossCompanyFlag = null;
		if (null != sql && sql.length() > 0) {
			StringBuilder s = new StringBuilder();
			StringBuilder queryCond = new StringBuilder();
			List<Object> list = new ArrayList<Object>();
			Map<String,Object> customerSqlListMap = new HashMap<String,Object>();
			boolean hasWhere = false;
			String referenceCondition = "";
			String customerSql = "";
			String customerCondition = "";
			String classifySql = "";
			String pendingFilter = "";
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
					if("customerSqlListMap".equals(param.getName())){
						customerSqlListMap = (Map<String,Object>) param.getValue();
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
						} else if (sortValue.indexOf(".") > 0){
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
						String tableAlias = lastDotPos < 0 ? "\"formula\"" : "\"" + key.substring(0, lastDotPos) + "\"";
						if("\"pending\"".equals(tableAlias)) {
							tableAlias = "\"p\"";
						}
						sortOrderByStr.append(tableAlias).append(".").append(columnName);
						continue;
					}
					if ("dataTable-sortColOrder".equals(param.getName())) {
						sortOrderByStr.append(" ").append((String) param.getValue());
						// 工作流实体，如果不是待办查询，则对单据状态排序时关联pending表
						if(type != Sql.TYPE_LIST_PENDING && sortOrderByStr.toString().length() > 0 && sortOrderByStr.toString().startsWith("\"p\".TASK_DESCRIPTION")) {
							sortOrderByStr.append(",").append("\"formula\".STATUS ").append((String) param.getValue());
						}
						continue;
					}
					if(param.getName()!=null&&param.getName().startsWith("\"tree-")){
						if(param.getName().startsWith("\"tree-layRec-")){
							String treeCondition = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TREE);
							if (treeCondition!=null && treeCondition.trim().length() > 0) {
								if (hasWhere){
									s.append(" AND ");
								}else{
									s.append(" WHERE (");
									hasWhere = true;
								}
									
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
					if(param.getName()!=null&&!param.getName().startsWith("\"tree-") && param.getLikeType() == Param.EQUAL_LIKELEFT){
						s.append(" AND ( ").append(param.getName()).append("= ? ").append(" OR ")
							.append(param.getName()).append(" like ? )");
						list.add(param.getValue());
						list.add(param.getValue()+"-%");
						continue;
					}
					if(param.getName()!=null&&param.getName().startsWith("pending-")){
						String columnName = Inflector.getInstance().columnize("createTime");
						if(param.getName().indexOf("beginDate") > 0) {
							//if(pendingFilter.length() > 0) {
							//	pendingFilter += " AND ";
							//}
							//pendingFilter += " \"p\"." + columnName + " >= ?";
							s.append(" AND (").append(" \"p\"." + columnName + " >= ?").append(")");
							param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							list.add(param.getValue());
						}
						if(param.getName().indexOf("endDate") > 0) {
							//if(pendingFilter.length() > 0) {
							//	pendingFilter += " AND ";
							//}
							//pendingFilter += " \"p\"." + columnName + " <= ?";
							s.append(" AND (").append(" \"p\"." + columnName + " <= ?").append(")");
							param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							list.add(param.getValue());

						}
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
					if((advQuery == null || advQuery.length() == 0 || advQuery.indexOf("\"formula\".STATUS") == -1) 
						&& (classifySql == null || classifySql.length() == 0 || classifySql.indexOf("\"formula\".STATUS") == -1)) {
						s.append(" AND \"formula\".STATUS <> 0");
					}
					if(type == Sql.TYPE_LIST_PENDING) {
						s.append(" AND \"formula\".STATUS <> 77");
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
						if(null != crossCompanyFlag && !crossCompanyFlag && !getCurrentCompanyId().equals(1L)){
							s.append(" AND \"formula\".CID in (1,").append(getCurrentCompanyId()+")");
						}
					}
					
	//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
	//					if(type == Sql.TYPE_LIST_PENDING) {
	//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_QUERY){
	//						s.append(" AND \"formula\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_REFERENCE){
	//						if(null != crossCompanyFlag && !crossCompanyFlag){
	//							s.append(" AND \"formula\".CID = ").append(getCurrentCompanyId());
	//						}
	//					}
	//				}
					s.append(" ) ");
			}
			// ////PowerCondition
			//if (pendingFilter != null && pendingFilter.length() > 0) {
			//	s.append(" AND (").append(pendingFilter).append(")");
			//}

			//组合自定义条件
			String customCondition=getCustomCondition(page, viewCode, type, processKey, params,list);
			if (customCondition!=null&&customCondition.trim().length() > 0) {
				if (hasWhere){
					s.append(" AND ");
				}else{
					s.append(" WHERE (");
					hasWhere = true;
				}
					
				s.append(customCondition);
			}
			
			//一个实体只有一个权限操作
			if(permissionCode == null || permissionCode.length() == 0) {
				permissionCode = viewCode;
			}
			View view = viewServiceFoundation.getView(viewCode);
			ExtraView extraView = null;
			boolean isTreeView=false;
			boolean needPermission = true;
			if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
				if(view.getShowType().equals(ShowType.PART)){
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
					if(null != view && !view.getIsPermission()){//未启用权限
						needPermission = false;
					}
				}
			}
			//加入权限过滤
			if(needPermission){
				String powerCode = permissionCode + "_self";
				if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
					if(view.getShowType().equals(ShowType.PART)){
						View layoutView = viewServiceFoundation.getView(permissionCode);
						if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
							powerCode = permissionCode;
						}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
							powerCode = "RM_7.5.0.0_formula_Formula" + "_" + layoutView.getPermissionCode();
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "RM_7.5.0.0_formula_Formula" + "_" + layoutView.getPermissionCode();
							}
						}
					}else  {
						if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
							powerCode = "RM_7.5.0.0_formula_Formula" + "_" + view.getPermissionCode();
						}
					}
				}else if(null != dgCode && !"".equals(dgCode)){
					DataGrid dataGrid = viewServiceFoundation.getDataGrid(dgCode);
					if(null != dataGrid.getDataGridType() && dataGrid.getDataGridType() == 1 && null != dataGrid.getIsPermission() && dataGrid.getIsPermission()){
						powerCode = dataGrid.getTargetModel().getCode() + "_" + dataGrid.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  formulaDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  formulaDao.createNativeQuery(powerOperateSql, "RM_7.5.0.0_formula").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}	
					String	pc = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formula\"","RM_7.5.0.0_formula",customCondition,"RM_FORMULAS",false);
				if (pc.trim().length() > 0) {
					if (hasWhere){
						s.append(" AND ");
					}else{
						s.append(" WHERE (");
						hasWhere = true;
					}
						
					s.append(pc);
				}
			}
			
			if(null!=processKey&&!processKey.equals("")){
				if(type == Sql.TYPE_LIST_QUERY){
					
					if (hasWhere){
						s.append(" AND ");
					}else{
						s.append(" WHERE (");
						hasWhere = true;
					}
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
						s.append(" \"formula\".TABLE_INFO_ID IN (  SELECT   D.TABLE_INFO_ID "+
	                      "   FROM   "+RMFormulaDealInfo.TABLE_NAME+" d "+
	                      "  WHERE   ("+pendingSql+") "+
	                      " GROUP BY   D.TABLE_INFO_ID) ");
					}
					
				}else if(type==Sql.TYPE_LIST_PENDING){
					if (hasWhere){
						s.append(" AND ");
					}else{
						s.append(" WHERE (");
						hasWhere = true;
					}
					
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
			if(s != null && s.length()>0 && s.toString().contains("WHERE")){
				s.append(") ");
			}
			
			if (type == Sql.TYPE_LIST_PENDING) {
				boolean isMobileRequest = false;
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				if (authentication instanceof OrchidAuthenticationToken) {
					OrchidAuthenticationToken token = (OrchidAuthenticationToken) authentication;
					isMobileRequest = token.getIsMobileRequest() == null ? false : token.getIsMobileRequest();
				}
				if (isMobileRequest) {
					if (hasWhere){
						s.append(" AND ");
					}else{
						s.append(" WHERE ");
						hasWhere = true;
					}
					s.append("(\"p\".MOBILE_APPROVE = 1)");
				}
			}
			
			if (referenceCondition != null && referenceCondition.length() > 0) {
				s.append(" AND (").append(referenceCondition).append(")");
			}
			if(type != Sql.TYPE_LIST_PENDING && sortOrderByStr.toString().length() > 0 && sortOrderByStr.toString().startsWith("\"p\".TASK_DESCRIPTION")) {
				totalSql.append(" LEFT OUTER JOIN ").append("(SELECT TASK_DESCRIPTION, TABLE_INFO_ID FROM ").append(Pending.TABLE_NAME).append(" WHERE ID IN (SELECT MAX(ID) FROM ").append(Pending.TABLE_NAME).append(" GROUP BY TABLE_INFO_ID))").append(" \"p\" ON \"p\".TABLE_INFO_ID= \"formula\".TABLE_INFO_ID ");
			}
			if(queryType == 1) {
				s.append(" AND \"formula\".STATUS = 99 ");
			}
			// 开始处理排序，避免在统计时带入排序条件
			StringBuilder orderPart = new StringBuilder();
			orderPart.append(" ORDER BY ");
			String colOrderByStr = null;
			if (null != dgCode && !"".equals(dgCode)) {
				colOrderByStr = sqlService.getDGSqlQuery(dgCode,Sql.TYPE_USED_ORDERBY);
			} else {
				colOrderByStr = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_ORDERBY);
			}
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
					orderPart.append(" \"formula\".LAY_REC ASC, \"formula\".SORT ASC");
				} else {
					orderPart.append(" \"formula\".ID DESC");
				}
			}
			Object[] arr = list.toArray();
			totalSql.append(s);
			String realSql = totalSql.toString() + orderPart.toString();
			Map<String, String> maps = new HashMap<String, String>();
			countSql += " ( " + totalSql.toString() + " ) T";
			// 突破ORACLE 30个字符限制
			if(DbUtils.getDbName().equals("oracle")){
			realSql = matchSql(pattern, realSql, "T", maps, 2, 4);
			countSql = replaceSql(pattern, countSql, maps, 4, 2);
			if(type != Sql.TYPE_LIST_PENDING && sortOrderByStr.toString().length() > 0 && sortOrderByStr.toString().startsWith("\"p\".TASK_DESCRIPTION")) {
				realSql = matchSql(p1, realSql, "P", null, 4, 6);
				realSql = matchSql(p2, realSql, "E", null, 4, 6);
				countSql = matchSql(p1, countSql, "P", null, 4, 6);
				countSql = matchSql(p2, countSql, "E", null, 4, 6);
			} else {
				realSql = matchSql(p, realSql, "E", null, 4, 6);
				countSql = matchSql(p, countSql, "E", null, 4, 6);
			}
			//组织总条数，合计SQL
			countSql = replaceSql(countPattern, countSql, maps, 4, 2);
			if(isTreeView) {
				page.setPaging(false);
			}
			}
			//计算条数
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) formulaDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    SQLQuery query=formulaDao.createNativeQuery(countSql, arr);
			    if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
			    List<Map<String, Object>> resultCountList = (List<Map<String, Object>>)query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
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
				SQLQuery query = formulaDao.createNativeQuery(realSql, arr);
				if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
				List<RMFormula> result = new ArrayList<RMFormula>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(RMFormula.class,formulaDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(RMFormula.class,formulaDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (RMFormula formula : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(formula.getTableInfoId(), "Table");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(formula.getTableInfoId(), "Table");
							if(null != documents && !documents.isEmpty()) {
								formula.setDocument(documents.get(0));
								formula.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				
				for (RMFormula formula : result) {
				}	
				if(queryType == 0) {
					if (type == Sql.TYPE_LIST_QUERY) {
						if (!result.isEmpty()) {
							List<Long> tIds = new ArrayList<Long>(result.size());
							for (RMFormula formula : result)
								tIds.add(formula.getTableInfoId());
							String pSql = "SELECT DISTINCT p.TABLE_INFO_ID,p.TASK_DESCRIPTION,p.ACTIVITY_TYPE,p.ACTIVITY_NAME,p.PROCESS_KEY,p.PROCESS_VERSION,p.DEPLOYMENT_ID,p.PROCESS_ID,p.PROCESS_NAME,p.PROCESS_DESCRIPTION,t.route_sequence,p.PROXY_SOURCE FROM " + Pending.TABLE_NAME + " p, wf_task t WHERE p.TABLE_INFO_ID IN (:ids) and p.activity_name =t.code and p.deployment_id=t.deployment_id order by t.route_sequence";
							// 解决in最大值为999问题
							List<Object[]> plist = new ArrayList<Object[]>();
							List<Object[]> mylist = new ArrayList<Object[]>();
							int PERTIME = 999;
							int count = (tIds.size() / PERTIME) + (tIds.size() % PERTIME == 0 ? 0 : 1);
							for(int i = 0 ; i < count ; i++){
								plist.addAll(formulaDao.createNativeQuery(pSql).setParameterList("ids", tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							String myPql="SELECT DISTINCT TABLE_INFO_ID,ID  FROM " + Pending.TABLE_NAME + " WHERE TABLE_INFO_ID IN (:ids) and USER_ID="+getCurrentUser().getId();
							for(int j = 0 ; j < count ; j++){
								mylist.addAll(formulaDao.createNativeQuery(myPql).setParameterList("ids", tIds.subList(PERTIME * j, PERTIME * j + (j < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							// List<Object[]> plist = formulaDao.createNativeQuery(pSql).setParameterList("ids", tIds).list();
							if (!plist.isEmpty()) {
							/*
								Map<Long, Object[]> map = new HashMap<Long, Object[]>(plist.size());
								for (Object[] o : plist) {
									Object[] r = map.get(((Number) o[0]).longValue());
									if (null == r) {
										r = new Object[] { "", "", null,null };
									}
									r[0] = (String) o[1];
									if (((String) r[1]).length() > 0)
										r[1] = r[1] + ",";
									r[1] = ((String) r[1]) + o[2];
									r[2] = o[3];
									r[3] = o[4];
									map.put(((Number) o[0]).longValue(), r);
								}
							*/
							Map<Long,Pending> map = new HashMap<Long,Pending>(plist.size());
								for(Object[] o : plist){
									long pTableInfoId = ((Number) o[0]).longValue();
									Pending pending =null;
									if(map.get(pTableInfoId)!=null){
										pending= map.get(pTableInfoId);
									}else{
										pending=new Pending();
									}
									String pKey=(o[4]!=null)?o[4].toString():"";
									int pVersion=(o[5]!=null)?Integer.parseInt(o[5].toString()):0;
									String activeName=(o[3]!=null)?o[3].toString():"";
									String activeType=(o[2]!=null)?o[2].toString():"";
									long deploymentId= (o[6]!=null)?((Number) o[6]).longValue():0L;
									String processId= (o[7]!=null)?o[7].toString():"";
									String processName = (o[8]!=null)?o[8].toString():"";
									String processDescription = (o[9]!=null)?o[9].toString():"";
									String proxySource = (o[11]!=null)?o[11].toString():"";
									//String taskDesc=(o[1]!=null)?InternationalResource.get(o[1].toString(), currentUser.getLanguage()):"";
									if(flowBulkFlag!=null && flowBulkFlag){
										Boolean flag=processService.getActiveBulkDealFlag(processId, activeName);
										pending.setBulkDealFlag(flag);
									}else{
										pending.setBulkDealFlag(false);
									}
									
									pending.setActivityType(activeType);
									pending.setActivityName(activeName);
									pending.setProcessKey(pKey);
									pending.setDeploymentId(deploymentId);
									pending.setProcessVersion(pVersion);
									pending.setProcessId(processId);
									pending.setProcessName(processName);
									pending.setProcessDescription(processDescription);
									pending.setProxySource(proxySource);
									//if(pending.getTaskDescription()!=null){
									//	pending.setTaskDescription(pending.getTaskDescription()+","+taskDesc);
									//}else{
									//	pending.setTaskDescription(taskDesc);
									//}
		
									map.put(pTableInfoId, pending);
								}
								if (!mylist.isEmpty()) {
									for(Object[] m : mylist){
										long pTableInfoId = ((Number) m[0]).longValue();
										long pendingId=((Number) m[1]).longValue();
										Pending pp = map.get(pTableInfoId);
										if(pp!=null){
											pp.setId(pendingId);
										}
									}
								}
								for (RMFormula formula : result) {
									Pending p = map.get(formula.getTableInfoId());
									if(null != p){
										//if(formula.getStatus()==99){
										//	p.setTaskDescription(p.getTaskDescription() + "," + InternationalResource.get("ec.pending.over", currentUser.getLanguage()));
										//} else if(formula.getStatus()==77){
										//	p.setTaskDescription(InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage()));
										//}
										formula.setPending(p);
									}
								}
							}
						}
						getTableInfoStatus(result, false);
					} else {
						getTableInfoStatus(result, true);
					}
				}
				if(exportSql.trim().isEmpty()){
					getConfigAssoPropsResult(viewCode, dgCode, result); // 获取配置的关联模型字段的结果集
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
	
	private void getConfigAssoPropsResult(String viewCode, List<RMFormula> result) {
		getConfigAssoPropsResult(viewCode, null, result);
	}
	
	private void getConfigAssoPropsResult(String viewCode,String dataGridCode, List<RMFormula> result) {
		View view = null;
		DataGrid dataGrid = null;
		List<Field> fields = null;
		Model origModel = null;
		if (null != dataGridCode && !"".equals(dataGridCode)) {
			dataGrid = viewServiceFoundation.getDataGrid(dataGridCode);
			fields = viewServiceFoundation.getFields(dataGrid);
			origModel = dataGrid.getTargetModel();
		} else {
			view = viewServiceFoundation.getView(viewCode);
			fields = viewServiceFoundation.getFields(view);
			origModel = view.getAssModel();
		}
		String origId = modelServiceFoundation.getPropertyColumnName(origModel, "id", false);

		List<Long> ids = new ArrayList<Long>();
		Map<Long, RMFormula> rsMap = new HashMap<Long, RMFormula>();
		for (RMFormula formula : result) {
			ids.add(formula.getId());
			rsMap.put(formula.getId(), formula);
		}
		for (Field f : fields) {
			if (f.getRegionType() == RegionType.LISTPT && (f.getCode().startsWith(viewCode + "_LISTPT_ASSO_") || f.getCode().startsWith(dataGridCode + "_LISTPT_ASSO_"))) { // 关联模型字段
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
						Property prop1 = findAssoProperty(ftProp1.getModel().getCode(), origModel.getCode());
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
							String propertyType = String.valueOf(cfg.get("propertyType"));
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
								whereSql.append(" and ").append(tmpAssoModel.getTableName()).append(".").append("VALID = 1").append(" ");
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
								if("SYSTEMCODE".equals(propertyType)){
									selectSql += ", BASE_SYSTEMCODE.VALUE AS REALVAL";
								}
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
							if("SYSTEMCODE".equals(propertyType)){
								fromSql.append(",BASE_SYSTEMCODE");
							}
							whereSql.append(" and ").append(origModel.getTableName()).append(".").append("VALID = 1");
							whereSql.append(" and ").append(origModel.getTableName()).append(".").append(origId).append(" in (:ids)");
							if("SYSTEMCODE".equals(propertyType)){
								whereSql.append(" and ").append(laProp.getModel().getTableName() + "." + laProp.getColumnName()).append("= BASE_SYSTEMCODE.ID");
							}
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
								rs.addAll(formulaDao.createNativeQuery(sql)
										.setParameterList("ids", ids.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (ids.size() % PERTIME))))
										.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list());
							}
							if (rs.size() > 0) {
								if("SYSTEMCODE".equals(propertyType)){
									for (Map<String, Object> m : rs) {
										String REALVAL = m.get("REALVAL") == null ? "" : String.valueOf(m.get("REALVAL"));
										m.put("VAL", sep1 + InternationalResource.get(REALVAL, getCurrentLanguage()) + sep2);
									}
								}else{
									for (Map<String, Object> m : rs) {
										if(null != m.get("VAL") && !"".equals(String.valueOf(m.get("VAL")))){
											String val = String.valueOf(m.get("VAL"));
											m.put("VAL", sep1 + val + sep2);
										}else{
											m.put("VAL", "");
										}										
									}
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
		List<Property> list = formulaDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
		return list.get(0);
	}
	
	public List<RMFormula> getTableInfoStatus(List<RMFormula> result, boolean isPendingQuery, Long ... deploymentId) {
		List<Long> tIds = new ArrayList<Long>(result.size());
		User currentUser = (User) getCurrentUser();
		String hangUp = InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage());
		String over = InternationalResource.get("ec.pending.over", currentUser.getLanguage());
		String dai = InternationalResource.get("ec.flowActive.dai", currentUser.getLanguage());
		String invalid = InternationalResource.get("ec.edit.remove", currentUser.getLanguage());
		String closed = InternationalResource.get("ec.edit.closed", currentUser.getLanguage());
		if (isPendingQuery) {
			for (RMFormula formula : result) {
				if (formula.getPending() != null) {
					if (formula.getStatus() == 77) {
						formula.getPending().setTaskDescription(hangUp);
					} else if (formula.getPending().getProxySource() != null && !formula.getPending().getProxySource().isEmpty()
							|| formula.getPending().getSourceStaff() != null && !formula.getPending().getSourceStaff().isEmpty()) {
						String statsName = formula.getPending().getTaskDescription();
						statsName = InternationalResource.get(statsName, currentUser.getLanguage());
						statsName += "(" + dai + ")";
						formula.getPending().setTaskDescription(statsName);
					}
				}
			}
		} else {
			Map<Long, RMFormula> map = new HashMap<>();
			for (RMFormula formula : result) {
				tIds.add(formula.getTableInfoId());
				map.put(formula.getTableInfoId(), formula);
				Pending pending = formula.getPending();
				if (pending != null) {
					pending.setTaskDescription(null);
				}
			}
			String pSql = "SELECT DISTINCT p.TABLE_INFO_ID,p.TASK_DESCRIPTION,p.ACTIVITY_TYPE,p.ACTIVITY_NAME,p.PROCESS_KEY,p.PROCESS_VERSION,p.DEPLOYMENT_ID,p.PROCESS_ID,p.PROCESS_NAME,p.PROCESS_DESCRIPTION,t.route_sequence FROM "
					+ Pending.TABLE_NAME
					+ " p, wf_task t WHERE p.TABLE_INFO_ID IN (:ids) "
					+ ((deploymentId == null || deploymentId.length == 0 || deploymentId[0] == null) ? "" : (" and p.DEPLOYMENT_ID = " + deploymentId[0]))
					+ " and p.activity_name =t.code and p.deployment_id=t.deployment_id order by t.route_sequence";
			//String pSql = "SELECT DISTINCT p.TABLE_INFO_ID,p.TASK_DESCRIPTION,p.ACTIVITY_TYPE,p.ACTIVITY_NAME,p.PROCESS_KEY,p.PROCESS_VERSION,p.DEPLOYMENT_ID,p.PROCESS_ID,p.PROCESS_NAME,p.PROCESS_DESCRIPTION,t.route_sequence FROM "
			//		+ Pending.TABLE_NAME
			//		+ " p, wf_task t WHERE p.TABLE_INFO_ID IN (:ids) and p.activity_name =t.code and p.deployment_id=t.deployment_id order by t.route_sequence";
			// 解决in最大值为999问题
			List<Object[]> plist = new ArrayList<Object[]>();
			int PERTIME = 999;
			int count = (tIds.size() / PERTIME) + (tIds.size() % PERTIME == 0 ? 0 : 1);
			for (int i = 0; i < count; i++) {
				plist.addAll(formulaDao
						.createNativeQuery(pSql)
						.setParameterList("ids",
								tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
			}
			for (Object[] o : plist) {
				long pTableInfoId = ((Number) o[0]).longValue();
				RMFormula formula = map.get(pTableInfoId);
				Pending pending = formula.getPending();
				if (pending == null) {
					pending = new Pending();
					formula.setPending(pending);
				}
				String taskDesc = (o[1] != null) ? InternationalResource.get(o[1].toString(), currentUser.getLanguage()) : "";
				if (pending.getTaskDescription() != null) {
					pending.setTaskDescription(pending.getTaskDescription() + "," + taskDesc);
				} else {
					pending.setTaskDescription(taskDesc);
				}
			}
			for (RMFormula formula : result) {
				Pending p = formula.getPending();
				if(p == null) {
					p = new Pending();
				}
				if (formula.getStatus() == 99) {
					if (p.getTaskDescription() == null) {
						p.setTaskDescription(over);
					} else {
						p.setTaskDescription(p.getTaskDescription() + "," + over);
					}
				} else if (formula.getStatus() == 77) {
					p.setTaskDescription(hangUp);
				} else if (formula.getStatus() == 0) {
					p.setTaskDescription(invalid);
				}
				formula.setPending(p);
			}
		}
		return result;
	
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDataGridPage(DataGrid dg,final Class dgClass,Page dgPage,final Object orgObj,String condition, List<Object> params){
		Map confMap=dg.getConfigMap();
		Map layoutMap = (Map) confMap.get("layout");
		Map propertyMap = (Map) layoutMap.get("listProperty");
		if(dg.getDataGridType() ==0 && Boolean.TRUE.equals(propertyMap.get("isTreeView"))){
			String conditionSql = (null != condition && condition.trim().length() > 0) ? " and " + condition : "";
			List<Object> list = new ArrayList<Object>();
			list.add(orgObj);
			if(condition != null && condition.trim().length() > 0 && params != null && params.size() > 0){
				list.addAll(params);
			} 
			//String key=dg.getTargetModel().getModelName()+fLTU(dg.getName())+((com.supcon.orchid.orm.entities.AbstractEcFullEntity)orgObj).getId();
			String orgObjId = "";
			try {
				Method method = orgObj.getClass().getMethod("getId");
				orgObjId = String.valueOf((Long) method.invoke(orgObj));
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e1) {
				log.error(e1.getMessage(), e1);
			}
			String key=dg.getTargetModel().getModelName()+fLTU(dg.getName())+orgObjId;
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
			if(null != orgObj){
				criteria.add(Restrictions.eq(dg.getOrgProperty().getName(), orgObj));
			}
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
	
	public String fLTL(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToLower(str);
	}
	
	public String fLTU(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToUpper(str);
	}
	
	protected EntityTableInfo getTableInfo(RMFormula formula,boolean... isImport) {
		EntityTableInfo ti = new EntityTableInfo();

		if(formula.getDeploymentId() != null) {
			ti.setDeploymentId(formula.getDeploymentId());
			ti.setProcessKey(formula.getProcessKey());
			ti.setProcessVersion(formula.getProcessVersion());
		}

		ti.setOwnerStaffId(formula.getOwnerStaffId());
		ti.setOwnerPositionId(formula.getOwnerPositionId());
		ti.setOwnerDepartmentId(formula.getOwnerDepartmentId());
		
		ti.setCreateStaff(formula.getCreateStaff());
		ti.setCreateStaffId(formula.getCreateStaffId());
		ti.setCreateTime(formula.getCreateTime());
		ti.setDeleteStaff(formula.getDeleteStaff());
		ti.setDeleteStaffId(formula.getDeleteStaffId());
		ti.setDeleteTime(formula.getDeleteTime());
		ti.setCreateDepartmentId(formula.getCreateDepartmentId());
		ti.setModifyStaff(formula.getModifyStaff());
		ti.setModifyStaffId(formula.getModifyStaffId());
		ti.setCreatePositionId(formula.getCreatePositionId());
		ti.setPositionLayRec(formula.getPositionLayRec());
		ti.setTableNo(formula.getTableNo());
		ti.setValid(true);
		ti.setTargetEntityCode("RM_7.5.0.0_formula");
		if(isImport!=null&&isImport.length>0&&isImport[0]) {
			ti.setStatus(EntityTableInfo.STATUS_EFFECTED);
			ti.setEffectiveState(formula.getEffectiveState());
		}else {
			ti.setStatus(formula.getStatus());
			ti.setEffectiveState(formula.getEffectiveState());
		}
		ti.setTargetTableName("RM_FORMULAS");
		
		return ti;
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
		Object notinValue = null;
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
			
			if("notinValue".equals(p.getName())){
				notinValue =  (Object) p.getValue();
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
							powerCode = "RM_7.5.0.0_formula_Formula" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "RM_7.5.0.0_formula_Formula" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="RM_7.5.0.0_formula_Formula" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  formulaDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  formulaDao.createNativeQuery(powerOperateSql, "RM_7.5.0.0_formula").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						if(sqlType!=null&&sqlType.trim().length()>0)  {
							if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
								sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"formula\".TABLE_INFO_ID ");
								sb.append(" WHERE  \"formula\".STATUS <> 0  ");
								innerJoinAppendFlag = true;
							}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
								
							}
						}
						powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formula\"","RM_7.5.0.0_formula","","RM_FORMULAS",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"formula\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"formula\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formula\"","RM_7.5.0.0_formula","","RM_FORMULAS",false);
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
								powerCode = "RM_7.5.0.0_formula_Formula" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "RM_7.5.0.0_formula_Formula" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "RM_7.5.0.0_formula_Formula" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  formulaDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  formulaDao.createNativeQuery(powerOperateSql, "RM_7.5.0.0_formula").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							if(!searchRefView&&sqlType!=null&&sqlType.trim().length()>0)  {
								if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
									sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"formula\".TABLE_INFO_ID ");
									sb.append(" WHERE  \"formula\".STATUS <> 0  ");
									innerJoinAppendFlag = true;
								}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
									
								}
							}
							powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"formula\"","RM_7.5.0.0_formula","","RM_FORMULAS",false);
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
			if(sb != null && sb.length() > 0 && !sb.toString().trim().endsWith(" AND")) {
				sb.append(" AND ");
			}
			mnecodeSql.append(sb);
			
			mnecodeSql.append("  (\"").append("formula.mc\"").append(".MNE_CODE) like (?) escape '&' AND \"formula\".VALID = 1");
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
				if(isSingleMode){
					mnecodeSql.append(" AND \"formula\".CID = ?");
					totalValues.add(getCurrentCompanyId());
				}else{
					//当前公司不是集团情况下查询集团和本公司数据
					if(!getCurrentCompanyId().equals(1L)){
						mnecodeSql.append(" AND (\"formula\".CID = 1 OR \"formula\".CID = ?)");
						totalValues.add(getCurrentCompanyId());
					}
				}
			}
			
			//组合自定义条件
			String customCondition=getCustomMneCondition(viewCode,  showNumber, cross,  params, refViewCode, currentViewCode, sqlType, realPermissionCode);
			if (customCondition!=null&&customCondition.trim().length() > 0) {
				
				if(customCondition != null && customCondition.length() > 0 && !customCondition.toString().trim().startsWith("AND") ) {
					mnecodeSql.append(" AND ");
				}
				mnecodeSql.append(customCondition);
			}
			
			if(notinValue != null){
				mnecodeSql.append(" and (\"").append("formula.mc\"").append(".FORMULA) not in ("+notinValue+")");
			}
			
			SQLQuery query = formulaDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
			resultList = query.setMaxResults(showNumber).list();
		}
		
		return resultList;
		
	}

	@Override
	public void destroy() throws Exception {
		beforeServiceDestroy();
		if(this.codeCounter != null) {
			this.codeCounter.destroy();
		}
		supervisionService = null;
	   	aclPermissionService = null;
		sqlService = null;
		eventService = null;
		scriptService = null;
		documentService = null;
		sampleProjDao = null;
		sampleProjService = null;
		checkDepartmentSetDao = null;
		checkDepartmentSetService = null;
		checkDetailDao = null;
		checkDetailService = null;
		checkDetailItemSetupsDao = null;
		checkDetailItemSetupsService = null;
		forLineFormulaDao = null;
		forLineFormulaService = null;
		formulaDao = null;
		formulaBeforeProcessDao = null;
		formulaBeforeProcessService = null;
		formulaBomDao = null;
		formulaBomService = null;
		formulaMixtureActiveDao = null;
		formulaMixtureActiveService = null;
		formulaProcessDao = null;
		formulaProcessService = null;
		formulaProcessActiveDao = null;
		formulaProcessActiveService = null;
		forProcessUnitDao = null;
		forProcessUnitService = null;
		forProcessUnitChoiceDao = null;
		forProcessUnitChoiceService = null;
		precessStandardsDao = null;
		precessStandardsService = null;
		productReplaceDao = null;
		productReplaceService = null;
		replaceFormulaDao = null;
		replaceFormulaService = null;
		processTypeDao = null;
		processTypeService = null;
		pickSiteDao = null;
		pickSiteService = null;
		lineFormulaDao = null;
		lineFormulaService = null;
		processPointDao = null;
		processPointService = null;
		processUnitDao = null;
		processUnitService = null;
		processUnitChoiceDao = null;
		processUnitChoiceService = null;
		formulaTypeDao = null;
		formulaTypeService = null;
		standDao = null;
		standService = null;
		batchFactoryDao = null;
		batchFactoryService = null;
		batchFormulaMainDao = null;
		batchFormulaMainService = null;
		synchroLogDao = null;
		synchroLogService = null;
		testProjDao = null;
		testProjService = null;
		factoryMapOtherDao = null;
		factoryMapOtherService = null;
		interfaceSyncLogDao = null;
		interfaceSyncLogService = null;
		mQDealinfoDao = null;
		mQDealinfoService = null;
		productMapOtherDao = null;
		productMapOtherService = null;
		formulaBomMainDao = null;
		formulaBomMainService = null;
		formulaBomMaterialDao = null;
		formulaBomMaterialService = null;
		formulaChangeDao = null;
		formulaChangeService = null;
	
		instanceService = null;
		taskService = null;
		variablesProvider = null;
		processService = null;
		cookieService = null;
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
			//新的编码字段不需要初始化pattern
		this.codeCounter = this.counterManager.addCounter("RM_7.5.0.0_formula_Formula_code", "RM_7.5.0.0_formula", formatStr, CounterType.All);

		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=formulaDao.createNativeQuery(sql, menuCode);
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
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(RMFormula formula, Long tableInfoId,String scriptCode) {
		this.retrialThisTable(formula, tableInfoId,scriptCode,null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(RMFormula formula, Long tableInfoId,String scriptCode,SignatureLog signatureLog) {
		beforeRetrial(formula);
		formula.setStatus(88);
		formulaDao.save(formula);
		formulaDao.flush(); //如果不flush无法更新effect信息
		ProcessInstance instance = null;
		RMFormulaDealInfo del=getDealInfoEntity(tableInfoId);
		Deployment deployment=taskService.getDeployment(del.getProcessKey(), del.getProcessVersion());
		long deploymentId=deployment.getId();
		//删除流程下所有通知活动的待办
		String hql = "delete Pending p where p.entityCode = ? and p.processKey = ? and p.processVersion = ? and p.activityType = ?";
		formulaDao.bulkExecute(hql, new Object[]{"RM_7.5.0.0_formula", del.getProcessKey(), del.getProcessVersion(), "notification"});
		taskService.completeTaskHistory(tableInfoId);
		List<Transition> transitions=processService.findFirstTransitions(deploymentId);
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setModelId(formula.getId());
		workFlowVar.setProcessInitiator(formula.getCreateStaff().getUser().getId());
		workFlowVar.setTableInfoId(formula.getTableInfoId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("RM_7.5.0.0_formula");
		workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
		workFlowVar.setOwnerId(formula.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
		workFlowVar.setTableNo(formula.getTableNo());
		workFlowVar.setTableName(RMFormula.TABLE_NAME);
		workFlowVar.setStatus(formula);
		workFlowVar.setCrossCompanyFlag(true);
		workFlowVar.setGroupEnabled(false);
		workFlowVar.setOutcome(transitions.get(0).getName());
		workFlowVar.setScriptExcuteBeanName("rM_formulaService");
		//DealInfo di = taskService.take(null, deploymentId, workFlowVar);
		instance = instanceService.start(deploymentId, null, workFlowVar);
		DealInfo di = taskService.doSaveDealInfo(formula, instance, deploymentId, null, workFlowVar);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(formula.getId().toString());
			}
		}
		RMFormulaDealInfo dl=new RMFormulaDealInfo();
		dl.setActivityName("ec.flow.retrial");
		dl.setComments(di.getComments());
		dl.setCreateTime(di.getCreateTime());
		dl.setEntityCode(di.getEntityCode());
		dl.setInstanceId(di.getInstanceId());
		dl.setOutcome(di.getOutcome());
		dl.setOutcomeDes("ec.flow.retrial");
		dl.setProcessKey(di.getProcessKey());
		dl.setProcessVersion(di.getProcessVersion());
		dl.setTableInfoId(di.getTableInfoId());
		dl.setTaskDescription("ec.flow.retrial");
		Staff staff = new Staff();
		staff.setId(formula.getOwnerStaffId());
		dl.setStaff(staff);
		dl.setUserId(di.getUserId());
		dl.setDealInfoType(DealInfoType.NORMAL);
		formulaDao.saveDealInfo(dl);
		formulaDao.createNativeQuery("update EC_TABLE_INFO set STATUS=88 where id=?", formula.getTableInfoId()).executeUpdate();
		if(null!=scriptCode&&!"".equals(scriptCode)){
			doScript(scriptCode,formula);
		}
		afterRetrial(formula);
		//crossCompanyDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=formula.getTableNo();
			Task task=taskService.getEndTask(deploymentId);
			String taskName=task.getName();
			Long taskId =task.getId();
			String processName=deployment.getName();
			taskName=InternationalResource.get(taskName, this.getCurrentLanguage());
			processName=InternationalResource.get(processName, this.getCurrentLanguage());
			signatureLog.setTaskId(taskId);
			signatureLog.setProcessId(deploymentId);
			signatureLog.setProcessName(processName);
			signatureLog.setTaskName(taskName);
			signatureLog.setTableId(formula.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:RM_7.5.0.0#entityCode:RM_7.5.0.0_formula#modelCode:RM_7.5.0.0_formula_Formula#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
			
	}
	public void doScript(String code ,RMFormula formula){

		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("db", DbUtils.getInstance());
		variables.put("formula", formula);
		try {
			Script script = scriptService.get("RM_7.5.0.0_formula", code);
			if (null == script || null == script.getCode()){
				throw new BAPException(BAPException.Code.SCRIPT_NOT_FOUND);
			}
			EngineScriptExecutor.eval(script.getCode(), variables);
		} catch (IOException e) {
			log.error(e.getMessage());
			throw new BAPException(BAPException.Code.SCRIPT_NOT_FOUND);
		}
		
	}
	
	
	/*outcomeString格式：activeType，outcome，dec，assignUser;activeType，outcome，dec，assignUser||activeType，outcome，dec，assignUser;activeType，outcome，dec，assignUser
	 * 
	 * */
	@Override
	public void bulkSubmit(String ids,Long deploymentId,String pendingIds,String outcomeStr){
		 
		String[] idArr=ids.split(",");
		String[] pendingArr=pendingIds.split(",");
		String[] outcomeInfoArr=outcomeStr.split(";");
		List<Map<String,?>> mapList=new ArrayList<Map<String,?>>();
		String comment="";
		for(String outcomes:outcomeInfoArr){
			String[] outcomArr=outcomes.split(",");
			Map<String,String> map=new HashMap<String, String>();
			map.put("type", outcomArr[0]);
			map.put("outcome", outcomArr[1]);
			map.put("dec", outcomArr[2]);
			if(outcomArr[3]!=null&&comment.length()==0){
				comment= outcomArr[3].toString();
			}
			String assignIds="";
			if(outcomArr.length>=5){
				assignIds = outcomArr[4].replace("@@",",");
			}
			map.put("assignUser", assignIds);
			String countersignUsers="";
			if(outcomArr.length>=6){
				countersignUsers = outcomArr[5].replace("@@",",");
			}
			map.put("countersignUsers",countersignUsers);
			mapList.add(map);
		}
		for(int i=0;i<idArr.length;i++){
			RMFormula formula=formulaDao.load(Long.parseLong(idArr[i]));
			Long pendingId=Long.parseLong(pendingArr[i]);
			WorkFlowVar workFlowVar = new WorkFlowVar();
			workFlowVar.setOutcomeMap(mapList);
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setModelId(formula.getId());
			workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setTableInfoId(formula.getTableInfoId());
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setComment(comment);
			workFlowVar.setEntityCode("RM_7.5.0.0_formula");
			workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
			workFlowVar.setOwnerId(formula.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
			workFlowVar.setTableNo(formula.getTableNo());
			workFlowVar.setTableName(formula.TABLE_NAME);
			workFlowVar.setScriptExcuteBeanName("rM_formulaService");
			workFlowVar.setStatus(formula);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			if(!mapList.isEmpty()&&mapList.size()>0&&mapList.get(0).get("countersignUsers")!=null){
				workFlowVar.setCountersignUsers(mapList.get(0).get("countersignUsers").toString());
			}
			DealInfo di = taskService.take(pendingId, deploymentId, formula.getId(), creatorService.getStaffFromSession(), workFlowVar);
			formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
			if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
				for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
					String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
					String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
					String type=(map.get("type")!=null)?map.get("type").toString():"";
					String assignUser=(map.get("assignUser")!=null)?map.get("assignUser").toString():"";
					if(type.equals("notification")){
						formulaDao.flush();
						di.setOutcome(outcome);
						di.setOutcomeDes(dec);
						if(assignUser!=null&&assignUser.length()>0){
							String assignStaff=taskService.getAssignUserName(assignUser);
							di.setAssignStaff(assignStaff);
						}
						formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
						
					}
				}
			}
			afterSubmitFormula(formula, workFlowVar);
		}
		
	}
	// ================ 生成多选控件数据保存方法 start====================
	private void dealFormulaIDApplyCheckStaff(RMFormula formula) {
		String addIds = formula.getFormulaIDApplyCheckStaffAddIds();
		String delIds = formula.getFormulaIDApplyCheckStaffDeleteIds();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("applyCheckStaff.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					RMCheckDepartmentSet tmp = new RMCheckDepartmentSet();
					tmp.setFormulaID(formula);
					Staff indirectObj = new Staff();
					indirectObj.setId(Long.valueOf(item));
					tmp.setApplyCheckStaff(indirectObj);
					tmp.setCid(formula.getCid());
					checkDepartmentSetDao.save(tmp);
				}
			}
		}
	}

	private void setFormulaIDApplyCheckStaff(RMFormula formula) {
		setFormulaIDApplyCheckStaff(formula, null);
	}

	private void setFormulaIDApplyCheckStaff(RMFormula formula, String viewCode) {
		List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Order.asc("id"), Restrictions.eq("formulaID", formula), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (RMCheckDepartmentSet item : tmpList) {
			if(item.getApplyCheckStaff() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getApplyCheckStaff().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getApplyCheckStaff(), displayField);
			}
		}
		formula.setCheckDepartmentSetList(tmpList);
		formula.setFormulaIDApplyCheckStaffmultiselectIDs(ids);
		formula.setFormulaIDApplyCheckStaffmultiselectNames(names);
	}
	private void dealFormulaIDFactoryID(RMFormula formula) {
		String addIds = formula.getFormulaIDFactoryIDAddIds();
		String delIds = formula.getFormulaIDFactoryIDDeleteIds();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("factoryID.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					RMCheckDepartmentSet tmp = new RMCheckDepartmentSet();
					tmp.setFormulaID(formula);
					MESBasicFactoryModel indirectObj = new MESBasicFactoryModel();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFactoryID(indirectObj);
					tmp.setCid(formula.getCid());
					checkDepartmentSetDao.save(tmp);
				}
			}
		}
	}

	private void setFormulaIDFactoryID(RMFormula formula) {
		setFormulaIDFactoryID(formula, null);
	}

	private void setFormulaIDFactoryID(RMFormula formula, String viewCode) {
		List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Order.asc("id"), Restrictions.eq("formulaID", formula), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (RMCheckDepartmentSet item : tmpList) {
			if(item.getFactoryID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFactoryID().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFactoryID(), displayField);
			}
		}
		formula.setCheckDepartmentSetList(tmpList);
		formula.setFormulaIDFactoryIDmultiselectIDs(ids);
		formula.setFormulaIDFactoryIDmultiselectNames(names);
	}
	private void dealFormulaIDActiveID(RMFormula formula) {
		String addIds = formula.getFormulaIDActiveIDAddIds();
		String delIds = formula.getFormulaIDActiveIDDeleteIds();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("activeID.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					RMCheckDepartmentSet tmp = new RMCheckDepartmentSet();
					tmp.setFormulaID(formula);
					RMFormulaProcessActive indirectObj = new RMFormulaProcessActive();
					indirectObj.setId(Long.valueOf(item));
					tmp.setActiveID(indirectObj);
					tmp.setCid(formula.getCid());
					checkDepartmentSetDao.save(tmp);
				}
			}
		}
	}

	private void setFormulaIDActiveID(RMFormula formula) {
		setFormulaIDActiveID(formula, null);
	}

	private void setFormulaIDActiveID(RMFormula formula, String viewCode) {
		List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Order.asc("id"), Restrictions.eq("formulaID", formula), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (RMCheckDepartmentSet item : tmpList) {
			if(item.getActiveID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getActiveID().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getActiveID(), displayField);
			}
		}
		formula.setCheckDepartmentSetList(tmpList);
		formula.setFormulaIDActiveIDmultiselectIDs(ids);
		formula.setFormulaIDActiveIDmultiselectNames(names);
	}
	private void dealFormulaIDApplyCheckDept(RMFormula formula) {
		String addIds = formula.getFormulaIDApplyCheckDeptAddIds();
		String delIds = formula.getFormulaIDApplyCheckDeptDeleteIds();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("applyCheckDept.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					RMCheckDepartmentSet tmp = new RMCheckDepartmentSet();
					tmp.setFormulaID(formula);
					Department indirectObj = new Department();
					indirectObj.setId(Long.valueOf(item));
					tmp.setApplyCheckDept(indirectObj);
					tmp.setCid(formula.getCid());
					checkDepartmentSetDao.save(tmp);
				}
			}
		}
	}

	private void setFormulaIDApplyCheckDept(RMFormula formula) {
		setFormulaIDApplyCheckDept(formula, null);
	}

	private void setFormulaIDApplyCheckDept(RMFormula formula, String viewCode) {
		List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Order.asc("id"), Restrictions.eq("formulaID", formula), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (RMCheckDepartmentSet item : tmpList) {
			if(item.getApplyCheckDept() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getApplyCheckDept().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getApplyCheckDept(), displayField);
			}
		}
		formula.setCheckDepartmentSetList(tmpList);
		formula.setFormulaIDApplyCheckDeptmultiselectIDs(ids);
		formula.setFormulaIDApplyCheckDeptmultiselectNames(names);
	}
	private void dealFormulaIDExeCheckDept(RMFormula formula) {
		String addIds = formula.getFormulaIDExeCheckDeptAddIds();
		String delIds = formula.getFormulaIDExeCheckDeptDeleteIds();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula), Restrictions.in("exeCheckDept.id", idList), Restrictions.eq("valid", true));
				for (RMCheckDepartmentSet item : tmpList) {
					checkDepartmentSetDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					RMCheckDepartmentSet tmp = new RMCheckDepartmentSet();
					tmp.setFormulaID(formula);
					Department indirectObj = new Department();
					indirectObj.setId(Long.valueOf(item));
					tmp.setExeCheckDept(indirectObj);
					tmp.setCid(formula.getCid());
					checkDepartmentSetDao.save(tmp);
				}
			}
		}
	}

	private void setFormulaIDExeCheckDept(RMFormula formula) {
		setFormulaIDExeCheckDept(formula, null);
	}

	private void setFormulaIDExeCheckDept(RMFormula formula, String viewCode) {
		List<RMCheckDepartmentSet> tmpList = checkDepartmentSetDao.findByCriteria(Order.asc("id"), Restrictions.eq("formulaID", formula), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (RMCheckDepartmentSet item : tmpList) {
			if(item.getExeCheckDept() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getExeCheckDept().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getExeCheckDept(), displayField);
			}
		}
		formula.setCheckDepartmentSetList(tmpList);
		formula.setFormulaIDExeCheckDeptmultiselectIDs(ids);
		formula.setFormulaIDExeCheckDeptmultiselectNames(names);
	}
	private void dealSupervision(RMFormula formula) {
		String addIds = formula.getSupervisionAddIds();
		String delIds = formula.getSupervisionDeleteIds();
		// 删除
		if (delIds != null && delIds.length() > 0) {
			String[] ids = delIds.split(",");
			List<Long> idList = new ArrayList<Long>();
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					idList.add(Long.valueOf(item));
				}
			}
			if (!idList.isEmpty()) {
				formulaDao.deleteSupervision(formula.getTableInfoId(), idList);
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					Supervision tmp = new Supervision();
					tmp.setTableInfoId(formula.getTableInfoId());
					Staff indirectObj = new Staff();
					indirectObj.setId(Long.valueOf(item));
					tmp.setStaff(indirectObj);
					formulaDao.addSupervision(tmp, formula);
					// supervisionService.save(tmp);
				}
			}
		}
	}

	private void setSupervision(RMFormula formula) {
		List<RMFormulaSupervision> tmpList = formulaDao.findSupervision(formula.getTableInfoId());
		String ids = "";
		String names = "";
		for (RMFormulaSupervision item : tmpList) {
			if(item.getStaff() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getStaff().getId();
				names += item.getStaff().getName();
			}
		}
		formula.setSupervisionList(tmpList);
		formula.setSupervisionmultiselectIDs(ids);
		formula.setSupervisionmultiselectNames(names);
	}
	// ================ 生成多选控件数据保存方法 end ====================

	protected String getEntityCode(){return RMFormula.ENTITY_CODE;}
	protected String getModuleCode(){return RMFormula.MODULE_CODE;}
	protected String getModelCode(){return RMFormula.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param formula 模型实例
	 */
	public void checkUniqueConstraint(RMFormula formula){
		if(null == formula.getTableNo() || StringUtils.isEmpty(formula.getTableNo().toString())){
			return;
		}
		if(formula.getId()==null ){
			List<RMFormula> formulas = formulaDao.findByCriteria(Restrictions.eq("tableNo", formula.getTableNo()));
			if(formulas!=null && !formulas.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), formula.getTableNo());
			}
		} else {
			List<RMFormula> formulas = formulaDao.findByCriteria(Restrictions.ne("id", formula.getId()), Restrictions.eq("tableNo", formula.getTableNo()));
			if(formulas!=null && !formulas.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), formula.getTableNo());
			}
		}
	}
	
	
	@Override
	public List<RMFormula> getFormulas(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RMFormula.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return formulaDao.findByHql("from " + RMFormula.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return formulaDao.findByCriteria(detachedCriteria);
	}
	
	
	
	@Override
	public List<RMFormula> findFormulasBySql(String sql, List<Object> params){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RMFormula.class);
		if(params!=null && params.size()>0){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
			
		}else{
			detachedCriteria.add(Restrictions.sqlRestriction(sql));
		}
		
		return formulaDao.findByCriteria(detachedCriteria);
	}
	@Override
	public List<RMFormula> findFormulasByHql(String hql, Object... objects){
		
		return   formulaDao.findByHql(hql, objects);
	}
	
	@Override
	public RMFormula loadFormulaByBussinessKey(RMFormula formula){
		return loadFormulaByBussinessKey(formula.getTableNo());
	}
	
	@Override
	public Page<RMFormula> getFormulas(Page<RMFormula> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RMFormula.class);
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
				page = formulaDao.findByPage(page, sql);
			}else{
				page = formulaDao.findAllByPage(page);
			}
			return page;
		}
		page = formulaDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public RMFormula loadFormulaByBussinessKey(Serializable bussinessKey){
		return formulaDao.findEntityByCriteria(Restrictions.eq("tableNo", bussinessKey),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<RMFormula> findByProperty(String propertyName, Object object){
		return formulaDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public RMFormula findEntityByProperty(String propertyName, Object object){
		return formulaDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<String> bussinessKeyList = Arrays.asList(bussinessKeys.split(","));
			String sql = "update " + RMFormula.JPA_NAME + " set valid=0 where tableNo in (:businessKeys)";
			Query query = formulaDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("RM_7.5.0.0_formula_Formula","runtime");
		try {
			for(View dgv:dgviews){
				if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
					List<DataGrid> ldg=viewServiceFoundation.getDataGrids(dgv.getCode());
					for(DataGrid dg:ldg){
						bap_validate_datagrids+=dg.getName()+",";
						dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.RM.entities."+dg.getTargetModel().getJpaName()));
					}
				}
			}
		} catch (ClassNotFoundException e) {
			log.error(e.getMessage(),e);
		}
		return bap_validate_datagrids;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String findValidateDatagrids(Map<String,Class> dgClassMap,String viewCode){
		String bap_validate_datagrids="";
		List<DataGrid> dgs = viewServiceFoundation.getDataGrids(viewCode, "runtime");
		try {
			for(DataGrid dg:dgs){
				bap_validate_datagrids+=dg.getName()+",";
				dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.RM.entities."+dg.getTargetModel().getJpaName()));
			}
		} catch (ClassNotFoundException e) {
			log.error(e.getMessage(),e);
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
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("RM_7.5.0.0_formula_Formula","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	public void dealDatagridsSave(RMFormula formula,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=viewServiceFoundation.getDataGrids(viewCode, "runtime");
		if(dgs!=null&&dgs.size()>0){
			formulaDao.flush();
			Class _reflect_thisclass=this.getClass();
			try {
				for(DataGrid dg:dgs){
					if(null != dg.getDataGridType() && dg.getDataGridType() == 1){
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
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()).replaceAll("\r\n", "\\\\r\\\\n"), _reflect_dgclass,formulaDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), RMFormula.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, formula);
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
								((com.supcon.orchid.orm.entities.AbstractEcTreeEntity)odg).setTableInfoId(formula.getTableInfoId());
							}else{
								if (odg instanceof com.supcon.orchid.orm.entities.AbstractEcPartEntity) {
									((com.supcon.orchid.orm.entities.AbstractEcPartEntity)odg).setTableInfoId(formula.getTableInfoId());
								} else if ((odg instanceof com.supcon.orchid.orm.entities.AbstractEcFullEntity)) {
									((com.supcon.orchid.orm.entities.AbstractEcFullEntity)odg).setTableInfoId(formula.getTableInfoId());
								}
								
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
								paramMap.put("mainModelId",formula.getTableInfoId());	
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
	public List<Object> getBusinessKeyData(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ RMFormula.TABLE_NAME +" where valid = 1";
			list = formulaDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ RMFormula.TABLE_NAME;
			list = formulaDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey){
		List<Object[]> list = new ArrayList<Object[]>();
		Map<Object, Object> m = new HashMap<Object, Object>();
		if(null != propertyName && null != businessKey){
			String sql = "select " + businessKey + "," + propertyName +" from "+ RMFormula.TABLE_NAME +" group by " + propertyName + "," + businessKey;
			list = formulaDao.createNativeQuery(sql).list();
		}
		if (list != null && !list.isEmpty()) {
			for (Object[] obj : list) {
				if(null != obj[1]){
					m.put(obj[0], obj[1]);
				}
			}
		}
		return m;
	}
	
	@Autowired
	private RMFormulaDaoImpl formulaDaoImpl;
	
	@Override
	@Transactional
	public String getTableNoById(Long id){
		String sql = "select table_no from " + RMFormula.TABLE_NAME + " where id = ?";
		String tableNo = formulaDao.createNativeQuery(sql,id).uniqueResult().toString();
		return tableNo;
	}
	
	@Override
	@Transactional
	public List<String> getTableNoData(){
		List<String> list = new ArrayList<String>();
		String sql = "select table_no from " + RMFormula.TABLE_NAME;
		list = formulaDao.createNativeQuery(sql).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchFormulaWorkFlow(final List<RMFormula> insertObjs, final List<RMFormula> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){
		return this.importBatchFormulaWorkFlow(insertObjs, updateObjs, columnInfo, entityCode, importNodeInfo, importPropInfo,null);		
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchFormulaWorkFlow(final List<RMFormula> insertObjs, final List<RMFormula> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog){
			
		int importCount = 0;
		if (null != insertObjs) {
			importCount += insertObjs.size();
		}
		if (null != updateObjs) {
			importCount += updateObjs.size();
		}
		AuditUtil.setAuditDes(InternationalResource.get("foundation.import.bussiness.info.args",null,InternationalResource.get("RM.modelname.randon1487075762209"),importCount));
		if(null != signatureLog && null == signatureLog.getOperateLogUuid()){
			if (null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()) {
				signatureLog.setOperateLogUuid((null == AuditUtil.getCurrentAudit().getOperationAudit().get_parentCode() || "-1".equals( AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode())) ? AuditUtil.getCurrentAudit().getOperationAudit().getUuid() : AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode());
			}
		}
		Map<Long, RMFormula> oldUpdateObjsMap = new HashMap<Long, RMFormula>(); 
		List<Long> updateObjIdsList = new ArrayList<Long>();
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {
			RMFormula bizObj = updateObjs.get(updateIndex);
			updateObjIdsList.add(bizObj.getId());
		}
		if (updateObjIdsList.size() > 0) {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RMFormula.class);
			if(updateObjIdsList.size()>1000){
				List<Long> updateObjIdsListBefore = updateObjIdsList.subList(0, 999);
				List<Long> updateObjIdsListAfter = updateObjIdsList.subList(999, updateObjIdsList.size());		
				detachedCriteria.add(Restrictions.or(Restrictions.in("id", updateObjIdsListBefore),Restrictions.in("id", updateObjIdsListAfter)));
			}else{
				detachedCriteria.add(Restrictions.in("id", updateObjIdsList));
			}
			List<RMFormula> bizObjList = formulaDao.findByCriteria(detachedCriteria);
			if (null != bizObjList) {
				for (int mIndex = 0; mIndex < bizObjList.size(); mIndex++) {
					RMFormula bizObj = bizObjList.get(mIndex);
					if (null != bizObj && null != bizObj.getId()) {
						oldUpdateObjsMap.put(bizObj.getId(), bizObj);
					}
				}
			}
		}	
			
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
		
		final List<RMFormula> nmeObjs = new ArrayList<RMFormula>();
											
		for(RMFormula formula:insertObjs){//没有table_no的新增项，系统生成
			if(formula.getTableNo() == null || (formula.getTableNo() != null && formula.getTableNo().equals(""))){
				formula.setTableNo(generateTableNo());	
			}
		}
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		//String idSql = "select id from " + RMFormula.TABLE_NAME + " order by id desc";
		//Query query = formulaDao.createNativeQuery(idSql).setMaxResults(1);
		/*String hql = "select id from " + RMFormula.JPA_NAME + " order by id desc";
		Query query =  formulaDao.createQuery(hql).setMaxResults(1);
		Long id = new Long(1000);
		if(null != query.uniqueResult()){
			id = Long.valueOf(query.uniqueResult().toString());
		}*/
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(RMFormula.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(RMFormula formula:insertObjs)  {
			//id = autoGeneratorID.getNextId(RMFormula.TABLE_NAME,1,dbId);
			if(formula.getTableNo() != null && !formula.getTableNo().equals("") ){
				m.put(formula.getTableNo(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			formula.setId(id);
			id++;
		}
		
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) formulaDao.createNativeQuery(sql, "RM_7.5.0.0_formula_Formula"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		formulaDaoImpl.getSession().doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				PreparedStatement updateps = null;
				PreparedStatement insertps = null;
				PreparedStatement insertDips = null;
				PreparedStatement ecTableInfops = null;
				PreparedStatement wfDealInfops = null;
				User currentUser=(User)getCurrentUser();
				Staff currentStaff=currentUser.getStaff();
				
				if(updateObjs != null && updateObjs.size()>0){
					List<String> updateMethods = new ArrayList<String>();
					String updateSql = "UPDATE " + RMFormula.TABLE_NAME + " SET ";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						updateMethods.add(methodName);
						updateSql += columnMaps.get(i).get("dbname")+"=?,";
					}
					updateSql = updateSql.substring(0,updateSql.length()-1);
					updateSql += " where " + dbId + " =?";
					
					updateps = conn.prepareStatement(updateSql);
					for(int updateIndex = 0; updateIndex<updateObjs.size(); updateIndex++)  {
						RMFormula formula = updateObjs.get(updateIndex);
						Long id = formula.getId();
						if(null != id){
							updateps.setLong(columnMaps.size()+1,id);
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = formula.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(formula);
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
							nmeObjs.add(formula);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + RMFormula.TABLE_NAME + " (";
					String[] colArr  = {"CID","STATUS","TABLE_INFO_ID","CREATE_STAFF_ID","CREATE_POSITION_ID","PROCESS_VERSION","PROCESS_KEY",dbId,"EFFECTIVE_STATE","POSITION_LAY_REC","OWNER_DEPARTMENT_ID","CREATE_TIME"};
					List<String> colList = Arrays.asList(colArr);
					List<Integer> colExclude = new ArrayList<Integer>();
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						insertMethods.add(methodName);
						if(colList.contains(columnMaps.get(i).get("dbname"))){
							colExclude.add(colList.indexOf(columnMaps.get(i).get("dbname")));
						}
						insertSql += columnMaps.get(i).get("dbname")+",";
					}
					for(int i=0; i<colList.size(); i++){
						if(!colExclude.contains(i)){
							insertSql += colList.get(i)+",";
						}
					}
					insertSql = insertSql.substring(0, insertSql.length()-1);
					insertSql += ") VALUES (";
					for(int i = 0;i<columnMaps.size();i++){
						insertSql += "?,";
					}
					for(int i=0; i<colList.size(); i++){
						if(!colExclude.contains(i)){
							insertSql += "?,";
						}
					}
					insertSql = insertSql.substring(0, insertSql.length()-1);
					insertSql += ")";
					String insertDiSql = "INSERT INTO " + RMFormula.TABLE_NAME + "_DI " +
										"(VERSION,DEALINFO_TYPE,TASK_DESCRIPTION,OUTCOME_DES,CREATE_TIME,ENTITY_CODE,USER_ID,TABLE_INFO_ID,ID,TASK_DESCRIPTION_ZH_CN,OUTCOME_DES_ZH_CN)" +
										" VALUES (?,?,?,?,?,?,?,?,?,?,?)";
					
					String wfDealInfoSql = "INSERT INTO WF_DEAL_INFO " +
							"(ID,VERSION,DEALINFO_TYPE,TASK_DESCRIPTION,OUTCOME_DES,CREATE_TIME,TABLE_INFO_ID,ENTITY_CODE,USER_ID,CID,TASK_DESCRIPTION_ZH_CN,OUTCOME_DES_ZH_CN)" +
							" VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
					
					String ecTableInfoSql = "INSERT INTO EC_TABLE_INFO " +
							"(ID,VERSION,CREATE_TIME,CREATE_STAFF_ID,VALID,EFFECTIVE_STATE,TARGET_TABLE_NAME,STATUS,OWNER_POSITION_ID,OWNER_STAFF_ID,TARGET_ENTITY_CODE,POSITION_LAY_REC,TABLE_NO,OWNER_DEPARTMENT_ID)" +
							" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					
					
					insertps = conn.prepareStatement(insertSql);
					insertDips = conn.prepareStatement(insertDiSql);
					ecTableInfops = conn.prepareStatement(ecTableInfoSql);
					wfDealInfops = conn.prepareStatement(wfDealInfoSql);
					
					int insSize=insertObjs.size();
					Long initId = autoGeneratorID.getNextId("EC_TABLE_INFO",insSize);
					Long diId = autoGeneratorID.getNextId(RMFormula.TABLE_NAME + "_DI",insSize, "ID");
					Long dealInfoId = autoGeneratorID.getNextId("WF_DEAL_INFO",insSize);
					
					for(int insertIndex = 0; insertIndex<insSize; insertIndex++)  {
						RMFormula formula = insertObjs.get(insertIndex);
						Long id = insertIds.get(insertIndex);
						//基础信息
						if(!colExclude.contains(7))
							insertps.setLong(columnMaps.size() + 8, id);
						if(!colExclude.contains(0))
							insertps.setLong(columnMaps.size() + 1, getCurrentCompanyId());
						if(!colExclude.contains(1))
							insertps.setLong(columnMaps.size() + 2, EntityTableInfo.STATUS_EFFECTED);
						if(!colExclude.contains(2))
							insertps.setLong(columnMaps.size() + 3, initId);
						if(!colExclude.contains(3))
							insertps.setLong(columnMaps.size() + 4, currentStaff.getId());
						if(!colExclude.contains(4))
							insertps.setLong(columnMaps.size() + 5, formula.getOwnerPositionId());
						if(!colExclude.contains(5))
                      		insertps.setInt(columnMaps.size() + 6, 0);
                      	if(!colExclude.contains(6))
                      		insertps.setString(columnMaps.size() + 7, "excelImport");
                      	if(!colExclude.contains(8))
							insertps.setLong(columnMaps.size() + 9, 1);
						if(!colExclude.contains(9))
							insertps.setString(columnMaps.size() + 10,formula.getPositionLayRec());
						if(!colExclude.contains(10))
							insertps.setLong(columnMaps.size() + 11,formula.getOwnerPosition().getDepartment().getId());
						java.util.Date date=new java.util.Date();
						if(!colExclude.contains(11))
							insertps.setTimestamp(columnMaps.size() + 12,new java.sql.Timestamp(date.getTime()));
						
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = formula.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(formula);
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
						formula.setId(id);
						nmeObjs.add(formula);
						insertps.addBatch();
						
						//工作流信息
						insertDips.setInt(1, 0);
						insertDips.setString(2, "IMPORT");
						insertDips.setString(3, InternationalResource.get("foundation.common.importExcel"));
						insertDips.setString(4, InternationalResource.get("ec.dealInfo.alreadyEffect"));
						insertDips.setTimestamp(5, new java.sql.Timestamp(System.currentTimeMillis()));
						insertDips.setString(6, "excelExIm_1.0_importExportExcel");
						insertDips.setLong(7, currentUser.getId());//导入的操作人定位当前用户
						insertDips.setLong(8, initId);
						insertDips.setLong(9, diId);
						insertDips.setString(10, InternationalResource.get("foundation.common.importExcel"));
						insertDips.setString(11, InternationalResource.get("ec.dealInfo.alreadyEffect"));
						insertDips.addBatch();
						
						Date now = new Date();
						java.sql.Timestamp timeNow = new java.sql.Timestamp(((Date) now).getTime());
						//ec_table_info信息
						ecTableInfops.setLong(1,initId);
						ecTableInfops.setInt(2,2);
						ecTableInfops.setTimestamp(3,timeNow);
						ecTableInfops.setLong(4,currentStaff.getId());
						ecTableInfops.setInt(5,1);
						ecTableInfops.setInt(6,1);
						ecTableInfops.setString(7,RMFormula.TABLE_NAME);
						ecTableInfops.setInt(8,99);
						ecTableInfops.setLong(9,formula.getOwnerPosition().getId());
						ecTableInfops.setLong(10,formula.getOwnerStaff().getId());
						ecTableInfops.setString(11,entityCode);
						ecTableInfops.setString(12,formula.getPositionLayRec());
						ecTableInfops.setString(13,formula.getTableNo());
						ecTableInfops.setLong(14,formula.getOwnerPosition().getDepartment().getId());
						ecTableInfops.addBatch();
						
						//wf_deal_info信息
						wfDealInfops.setLong(1,dealInfoId);
						wfDealInfops.setInt(2,2);
						wfDealInfops.setString(3,"IMPORT");
						wfDealInfops.setString(4,InternationalResource.get("ec.dealInfo.alreadyEffect"));
						wfDealInfops.setString(5,InternationalResource.get("foundation.common.import"));
						wfDealInfops.setTimestamp(6,timeNow);
						wfDealInfops.setLong(7,initId);
						wfDealInfops.setString(8,entityCode);
						wfDealInfops.setLong(9,currentUser.getId());
						wfDealInfops.setLong(10,getCurrentCompanyId());
						wfDealInfops.setString(11,InternationalResource.get("ec.dealInfo.alreadyEffect"));
						wfDealInfops.setString(12,InternationalResource.get("foundation.common.import"));
						wfDealInfops.addBatch();
						
						diId++;
						initId++;	
						dealInfoId++;
					}		
				}
				
				PreparedStatement savemneps = null;
				PreparedStatement deletemneps = null;				
				
				if(nmeObjs != null && nmeObjs.size()>0){//助记码操作
					Object mainEntity = nmeObjs.get(0);			
					Class<?> mainClazz = mainEntity.getClass();
					Class<?> mneCodeEntity = RMFormulaMneCode.class;

					String entityName = mainClazz.getSimpleName();
					//此段必须要用
					int idx = entityName.indexOf("_$$_javassist_");
					if(idx > 0) {
						mainClazz = Hibernate.getClass(mainEntity);
						entityName = entityName.substring(0, idx);
					}
					BAPMneField mneField = mneCodeEntity.getAnnotation(BAPMneField.class);
					if(mneField != null) {
						entityName = mneField.name();
					}
					entityName = Inflector.getInstance().columnize(com.supcon.orchid.utils.StringUtils.firstLetterToLower(entityName));
					
					final String dbEntityName = entityName;
					final Table mneCodeTable = mneCodeEntity.getAnnotation(Table.class);
					final Class<?> dbMainClazz = mainClazz;
					final Object dbMainEntity = mainEntity;
					
					//删除原有助记码
					String deleteSql = "DELETE FROM " + mneCodeTable.name() + " WHERE " + dbEntityName + " = ?";
					deletemneps = conn.prepareStatement(deleteSql);
					for(RMFormula formula:updateObjs)  {
						Long id = formula.getId();
						deletemneps.setLong(1, id);
						deletemneps.addBatch();
					}	
					
					//生成并新增助记码
					String idSql = "select id from " + mneCodeTable.name() + " order by id desc";
					Query query = formulaDao.createNativeQuery(idSql).setMaxResults(1);
					Long id = new Long(1000);
					if(null != query.uniqueResult()){
						id = Long.valueOf(query.uniqueResult().toString());
					}
					String insertMneSql = "INSERT INTO " + mneCodeTable.name() + "(ID, MNE_CODE, " + dbEntityName
							+ ", VERSION) VALUES (?,?,?,?)";
					savemneps = conn.prepareStatement(insertMneSql);
					for (java.lang.reflect.Field f : dbMainClazz.getDeclaredFields()) {
						if (f.isAnnotationPresent(BAPIsMneCode.class)) { // 被标注为是否用于助记码
							String fieldName = f.getName();
							String getName = "get" + Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1);
							Method getMethod = null;
							try {
								getMethod = dbMainClazz.getMethod(getName);
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							if (getMethod.getReturnType() == String.class) {
								for(RMFormula formula:nmeObjs)  {
									String value = null;
									try {
										value = (String) getMethod.invoke(formula);
									} catch (IllegalAccessException
											| IllegalArgumentException
											| InvocationTargetException e) {
										// TODO Auto-generated catch block
										log.error(e.getMessage(),e);
									}
									
									if (null != value) {
										Set<String> mneCodeSet = new HashSet<String>();
										List<String> mneCodeList = MneCodeGenterate.mneCodeTupleGenerate(value.length()>10?value.substring(0, 10):value);
										if (null != mneCodeList && !mneCodeList.isEmpty()) {
											mneCodeSet.addAll(mneCodeList);
										}
										mneCodeSet.add(value.toLowerCase());
										for (String mneCode : mneCodeSet) {
//											id = id + 1;
//											savemneps.setLong(1, id);
											savemneps.setLong(1, autoGeneratorID.getNextId(mneCodeTable.name(),1,"ID"));
											savemneps.setString(2, mneCode);
											savemneps.setLong(3, formula.getId());
											savemneps.setInt(4, 0);
											savemneps.addBatch();
										}
									}
								}	
							}
						}
					}	
				}
				if(null != deletemneps){
					deletemneps.executeBatch();
					deletemneps.close();	
				}
				if(null != savemneps){
					savemneps.executeBatch();
					savemneps.close();
				}
				
				if(null != insertps){
					insertps.executeBatch();
					insertps.close();
				}
				if(null != insertDips){
					insertDips.executeBatch();
					insertDips.close();
				}
				if(null != updateps){
					updateps.executeBatch();
					updateps.close();
				}
				if(null != ecTableInfops){
					ecTableInfops.executeBatch();
					ecTableInfops.close();
				}
				if(null != wfDealInfops){
					wfDealInfops.executeBatch();
					wfDealInfops.close();
				}
			}
		});	
		
		formulaDaoImpl.getSession().flush();
		formulaDaoImpl.getSession().clear();
		
		
		//记录导入数据日志（区分新增和修改）
		String sqlQueryBussinesskey = "select name from runtime_property  where model_code=? and valid=1 and is_bussiness_key=1";
		String sqlQueryMainDispaly = "select name from runtime_property  where model_code=? and valid=1 and is_main_display=1";
		Object retObjBussinesskey = formulaDao.createNativeQuery(sqlQueryBussinesskey, "RM_7.5.0.0_formula_Formula").setMaxResults(1).uniqueResult();
		String bussinesskeyFieldName = (null != retObjBussinesskey) ? retObjBussinesskey.toString() : null;
		Object retObjMainDispaly = formulaDao.createNativeQuery(sqlQueryMainDispaly, "RM_7.5.0.0_formula_Formula").setMaxResults(1).uniqueResult();
		String mainDispalyFieldName = (null != retObjMainDispaly) ? retObjMainDispaly.toString() : null;
		
		for(int insertIndex = 0; insertIndex < insertObjs.size(); insertIndex++)  {//新增
			RMFormula bizObj = insertObjs.get(insertIndex);
			formulaImportService.saveImportDataLog(bizObj, null, "tableNo", "id");
		}
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {//修改
			RMFormula bizObj = updateObjs.get(updateIndex);
			RMFormula oldBizObj = oldUpdateObjsMap.get(bizObj.getId());
			formulaImportService.saveImportDataLog(bizObj, oldBizObj, "tableNo", "id");
		}
		
		return m;
	}
	
	
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getViewName(String modelCode){
		String sql = "select NAME from runtime_view where type='LIST' and ass_model_code = ?";
		String viewName = formulaDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult()!=null?
				formulaDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult().toString():"";
		return viewName;
	}
	
	
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = formulaDao.createNativeQuery(sql, "RM_7.5.0.0_formula_Formula").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = formulaDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = formulaDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = formulaDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?formulaDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  formulaDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,formulaDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1540451901057Page(Page<RMForLineFormula> dg1540451901057Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMForLineFormula.class);
		criteria.add(Restrictions.eq("lfformulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"forLineFormula\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		forLineFormulaDao.findByPage(dg1540451901057Page, criteria);
		forLineFormulaService.findByNormalDataGridFormula(dg1540451901057Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1540451909387Page(Page<RMForProcessUnit> dg1540451909387Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMForProcessUnit.class);
		criteria.add(Restrictions.eq("puformulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"forProcessUnit\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		forProcessUnitDao.findByPage(dg1540451909387Page, criteria);
		forProcessUnitService.findByNormalDataGridFormula(dg1540451909387Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1497589621829Page(Page<RMCheckDepartmentSet> dg1497589621829Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
		criteria.add(Restrictions.eq("formulaID", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"checkDepartmentSet\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		checkDepartmentSetDao.findByPage(dg1497589621829Page, criteria);
		checkDepartmentSetService.findByNormalDataGridFormula(dg1497589621829Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1491547759425Page(Page<RMFormulaBom> dg1491547759425Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaBom.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaBom\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaBomDao.findByPage(dg1491547759425Page, criteria);
		formulaBomService.findByNormalDataGridFormula(dg1491547759425Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1491548186600Page(Page<RMFormulaBom> dg1491548186600Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaBom.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaBom\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaBomDao.findByPage(dg1491548186600Page, criteria);
		formulaBomService.findByNormalDataGridFormula(dg1491548186600Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1487242802285Page(Page<RMFormulaProcess> dg1487242802285Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaProcess.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaProcessDao.findByPage(dg1487242802285Page, criteria);
		formulaProcessService.findByNormalDataGridFormula(dg1487242802285Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1503551511011Page(Page<RMFormulaBom> dg1503551511011Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaBom.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaBom\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaBomDao.findByPage(dg1503551511011Page, criteria);
		formulaBomService.findByNormalDataGridFormula(dg1503551511011Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1503642053482Page(Page<RMFormulaProcess> dg1503642053482Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaProcess.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaProcessDao.findByPage(dg1503642053482Page, criteria);
		formulaProcessService.findByNormalDataGridFormula(dg1503642053482Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1503642053729Page(Page<RMFormulaBom> dg1503642053729Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaBom.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaBom\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaBomDao.findByPage(dg1503642053729Page, criteria);
		formulaBomService.findByNormalDataGridFormula(dg1503642053729Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1488969463663Page(Page<RMFormulaProcess> dg1488969463663Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaProcess.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaProcessDao.findByPage(dg1488969463663Page, criteria);
		formulaProcessService.findByNormalDataGridFormula(dg1488969463663Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1504485505216Page(Page<RMFormulaBom> dg1504485505216Page,RMFormula formula, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(RMFormulaBom.class);
		criteria.add(Restrictions.eq("formulaId", formula));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"formulaBom\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		formulaBomDao.findByPage(dg1504485505216Page, criteria);
		formulaBomService.findByNormalDataGridFormula(dg1504485505216Page);
	}
	
	 
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.save")
	public void saveFormula(RMFormula formula, DataGridService dataGridService){
		saveFormula(formula, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.save")
	public void saveFormula(RMFormula formula, DataGridService dataGridService, String viewCode){
		saveFormula(formula, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void saveFormula(RMFormula formula, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		this.saveFormula(formula, dataGridService, viewCode, eventTopic,null,isImport);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void saveFormula(RMFormula formula, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog, boolean... isImport){
		boolean isNew = false;
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(null != formula.getId() && formula.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
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
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, formula);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		beforeSaveFormula(formula, viewIsView);

		if (null == formula.getId()) {
			if(null == formula.getStatus()){
				formula.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			formula.setTableNo(generateTableNo());
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				if(isNew)
					formulaDao.save(formula);
				else
					formulaDao.merge(formula);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(formula,isImport);
				formulaDao.saveTableInfo(ti);
				formula.setTableInfoId(ti.getId());
				if(formula.getOwnerStaffId()==null){
					formula.setOwnerStaffId(formula.getCreateStaffId());
					ti.setOwnerStaffId(formula.getCreateStaffId());
				}
				if(formula.getOwnerDepartmentId()==null){
					formula.setOwnerDepartmentId(formula.getCreateDepartmentId());
					ti.setOwnerDepartmentId(formula.getCreateDepartmentId());
				}
				if(formula.getOwnerPositionId()==null){
					formula.setOwnerPositionId(formula.getCreatePositionId());
					ti.setOwnerPositionId(formula.getCreatePositionId());
				}
				formula.setCreateStaffId(formula.getCreateStaffId());
				formula.setCreatePositionId(formula.getCreatePositionId());
				formula.setCreateDepartmentId(formula.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (formula.getCompany() == null) {
					formula.setCompany(getCurrentCompany());
				}
				if (formula.getCid() == null || formula.getCid() == -1l) {
					formula.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					formulaDao.saveWithRevertVersion(formula);
				} else {
					formulaDao.save(formula);
				}
				
		} else {
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				if(isNew)
					formulaDao.save(formula);
				else
					formulaDao.merge(formula);
			}
		}
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		if (dataGridService != null) {
			formulaDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealFormulaIDApplyCheckStaff(formula);
			this.dealFormulaIDFactoryID(formula);
			this.dealFormulaIDActiveID(formula);
			this.dealFormulaIDApplyCheckDept(formula);
			this.dealFormulaIDExeCheckDept(formula);
			this.dealSupervision(formula);
		
		// 根据配置规则生成编码
		try {
			generateFormulaCodes(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaSummarys(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormula(formula, viewIsView);


		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formula);
			}
		}
		List<RMFormula> params = new ArrayList<RMFormula>();
		formulaDao.flush();
		formulaDao.clear();
		formula = formulaDao.load(formula.getId());
		
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		
		params.add(formula);
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=formula.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(formula.getId());
			String msgId="moduleCode:RM_7.5.0.0#entityCode:RM_7.5.0.0_formula#modelCode:RM_7.5.0.0_formula_Formula#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public Map<Object, Object> formulaDataGridImport(RMFormula formula, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport){
		Map<Object, Object> map = new HashMap<Object, Object>();
		boolean isNew = false;
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(formula.getId() != null && formula.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/rM_7500_formula/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
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
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, formula);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		beforeSaveFormula(formula, viewIsView);

		if (null == formula.getId()) {
			if(null == formula.getStatus()){
				formula.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			formula.setTableNo(generateTableNo());
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				if(isNew)
					formulaDao.save(formula);
				else
					formulaDao.merge(formula);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(formula,isImport);
				formulaDao.saveTableInfo(ti);
				formula.setTableInfoId(ti.getId());
				if(formula.getOwnerStaffId()==null){
					formula.setOwnerStaffId(formula.getCreateStaffId());
					ti.setOwnerStaffId(formula.getCreateStaffId());
				}
				if(formula.getOwnerDepartmentId()==null){
					formula.setOwnerDepartmentId(formula.getCreateDepartmentId());
					ti.setOwnerDepartmentId(formula.getCreateDepartmentId());
				}
				if(formula.getOwnerPositionId()==null){
					formula.setOwnerPositionId(formula.getCreatePositionId());
					ti.setOwnerPositionId(formula.getCreatePositionId());
				}
				formula.setCreateStaffId(formula.getCreateStaffId());
				formula.setCreatePositionId(formula.getCreatePositionId());
				formula.setCreateDepartmentId(formula.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (formula.getCompany() == null) {
					formula.setCompany(getCurrentCompany());
				}
				if (formula.getCid() == null || formula.getCid() == -1l) {
					formula.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					formulaDao.saveWithRevertVersion(formula);
				} else {
					formulaDao.save(formula);
				}
				
		} else {
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				if(isNew)
					formulaDao.save(formula);
				else
					formulaDao.merge(formula);
			}
		}

		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		
		if (dataGridService != null) {
			formulaDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealFormulaIDApplyCheckStaff(formula);
			this.dealFormulaIDFactoryID(formula);
			this.dealFormulaIDActiveID(formula);
			this.dealFormulaIDApplyCheckDept(formula);
			this.dealFormulaIDExeCheckDept(formula);
			this.dealSupervision(formula);
		
		// 根据配置规则生成编码
		try {
			generateFormulaCodes(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaSummarys(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormula(formula, viewIsView);


		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formula);
			}
		}
		List<RMFormula> params = new ArrayList<RMFormula>();
		formulaDao.flush();
		formulaDao.clear();
		
		String virturalId = formula.getVirtualId();
		
		formula = formulaDao.load(formula.getId());
		
		if(virturalId != null && virturalId.length() > 0){
			map.put(virturalId, formula.getId());
		}else{
			String methodName = "get" + businessKey.getName().substring(0, 1).toUpperCase() + businessKey.getName().substring(1);
			Object bkValue = null;
			try {
				Method getBkValue = formula.getClass().getMethod(methodName);
				bkValue = getBkValue.invoke(formula);
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				log.error(e.getMessage(), e);
			}
			map.put(bkValue, formula.getId());
		}
		
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		
		params.add(formula);
		return map;
	}
	
	 
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void mergeFormula(RMFormula formula, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(formula);
		beforeSaveFormula(formula);
		if (null == formula.getId()) {
			formula.setStatus(EntityTableInfo.STATUS_RUNNING);
			formula.setTableNo(generateTableNo());
			formulaDao.save(formula);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(formula);
				formulaDao.saveTableInfo(ti);
				formula.setTableInfoId(ti.getId());
				if(formula.getOwnerStaffId()==null){
					formula.setOwnerStaffId(formula.getCreateStaffId());
				}
				if(formula.getOwnerDepartmentId()==null){
					formula.setOwnerDepartmentId(formula.getCreateDepartmentId());
				}
				if(formula.getOwnerPositionId()==null){
					formula.setOwnerPositionId(formula.getCreatePositionId());
				}
				formula.setCreateStaffId(formula.getCreateStaffId());
				formula.setCreatePositionId(formula.getCreatePositionId());
				formula.setCreateDepartmentId(formula.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (formula.getCompany() == null) {
					formula.setCompany(getCurrentCompany());
				}
				if (formula.getCid() == null || formula.getCid() == -1l) {
					formula.setCid(getCurrentCompanyId());
				}
				formulaDao.merge(formula);
		} else {
			formulaDao.merge(formula);
		}
		
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		
		if (dataGridService != null) {
			dataGridService.execute();
		}

			// 一对多情况处理
			this.dealFormulaIDApplyCheckStaff(formula);
			this.dealFormulaIDFactoryID(formula);
			this.dealFormulaIDActiveID(formula);
			this.dealFormulaIDApplyCheckDept(formula);
			this.dealFormulaIDExeCheckDept(formula);
			this.dealSupervision(formula);
		afterSaveFormula(formula);
		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.exportExcel",operType="11")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.print.page.print",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes(InternationalResource.get("ec.print.page.print"));
		}else if(printType == 1){
			AuditUtil.setAuditDes(InternationalResource.get("ec.view.controlPrint"));
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.batch.save",operType="4")
	public void batchSaveFormula(RMFormula formula, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "RM_7.5.0.0_formula";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "RM_7.5.0.0_formula");
		String url = null;
		if(formula.getId()!=null && formula.getId()>0){
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
				executeGScript(entityCode, "beforeSave", events, formula);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		beforeSaveFormula(formula, viewIsView);

		if (null == formula.getId()) {
			if(null == formula.getStatus()){
				formula.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			formula.setTableNo(generateTableNo());
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				formulaDao.save(formula);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(formula,isImport);
			formulaDao.saveTableInfo(ti);
			formula.setTableInfoId(ti.getId());
			if(formula.getOwnerStaffId()==null){
				formula.setOwnerStaffId(formula.getCreateStaffId());
				ti.setOwnerStaffId(formula.getCreateStaffId());
			}
			if(formula.getOwnerDepartmentId()==null){
				formula.setOwnerDepartmentId(formula.getCreateDepartmentId());
				ti.setOwnerDepartmentId(formula.getCreateDepartmentId());
			}
			if(formula.getOwnerPositionId()==null){
				formula.setOwnerPositionId(formula.getCreatePositionId());
				ti.setOwnerPositionId(formula.getCreatePositionId());
			}
			formula.setCreateStaffId(formula.getCreateStaffId());
			formula.setCreatePositionId(formula.getCreatePositionId());
			formula.setCreateDepartmentId(formula.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (formula.getCompany() == null) {
				formula.setCompany(getCurrentCompany());
			}
			if (formula.getCid() == null || formula.getCid() == -1l) {
				formula.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				formulaDao.save(formula);
			}
		} else {
			if (viewIsView) {
				formulaDao.saveWithRevertVersion(formula);
			} else {
				formulaDao.merge(formula);
			}
		}

		if (dataGridService != null) {
			formulaDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealFormulaIDApplyCheckStaff(formula);
			this.dealFormulaIDFactoryID(formula);
			this.dealFormulaIDActiveID(formula);
			this.dealFormulaIDApplyCheckDept(formula);
			this.dealFormulaIDExeCheckDept(formula);
			this.dealSupervision(formula);
		
		// 根据配置规则生成编码
		try {
			generateFormulaCodes(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateFormulaSummarys(formula, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveFormula(formula, viewIsView);


		formulaDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/formula/add", formula,RMFormulaMneCode.class);
		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, formula);
			}
		}
		List<RMFormula> params = new ArrayList<RMFormula>();
		formulaDao.flush();
		formulaDao.clear();
		formula = formulaDao.load(formula.getId());
		
		List<RMCheckDepartmentSet> checkDepartmentSetList = checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula));
		formula.setCheckDepartmentSetList(checkDepartmentSetList);
		
		params.add(formula);
	}
	
	@Override
	public Page<RMFormula> getByPage(Page<RMFormula> page,DetachedCriteria detachedCriteria){
		return formulaDao.findByPage(page, detachedCriteria);
	}
	@Override
	public List<RMCheckDepartmentSet> getCheckDepartmentSetList(RMFormula formula){
		return checkDepartmentSetDao.findByCriteria(Restrictions.eq("formulaID", formula),Restrictions.eq("valid", true));
	}
	
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.common.super.edit",operType="4")
	public void saveSuperEditFormula(RMFormula formula, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode, boolean... isImport){
		String entityCode = "RM_7.5.0.0_formula";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditFormula(workFlowVar, dataGridService, view, entityCode, events, formula, isImport);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="foundation.batch.import")
	public void batchSaveSuperEditFormula(List<RMFormula>  formulas, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport){
		String entityCode = "RM_7.5.0.0_formula";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(RMFormula formula:formulas)  {
			saveSingleSuperEditFormula(workFlowVar, dataGridService, view, entityCode, events, formula, isImport);
		}
	}
	
	
	
	private void saveSingleSuperEditFormula(WorkFlowVar workFlowVar, DataGridService dataGridService, View view, String entityCode, List<Event> events,RMFormula formula, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, formula);
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("RM_7.5.0.0_formula");
		workFlowVar.setTableName(RMFormula.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("rM_formulaService");
		workFlowVar.setStatus(formula);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		formula.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (formula.getId() == null) {
			formula.setStatus(EntityTableInfo.STATUS_EFFECTED);
			formula.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitFormula(formula, workFlowVar, true);
		batchSaveFormula(formula, dataGridService, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(formula.getTableInfoId(), isSuperAdd,isImport);
		formulaDao.flush();
		workFlowVar.setModelId(formula.getId());
		workFlowVar.setTableInfoId(formula.getTableInfoId());
		workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
		workFlowVar.setOwnerId(formula.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
		workFlowVar.setTableNo(formula.getTableNo());
		
		afterSubmitProcessFormula(formula, di, workFlowVar, view.getCode(), true);
		afterSubmitFormula(formula, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, formula);
			}
		}
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void save(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		save(formula, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}

	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula")
	public void save(RMFormula formula, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(formula);
		boolean first = null == formula.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != formula.getCreateStaff() && null != formula.getCreateStaff().getUser()){
		    	createStaffUserId = formula.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("RM_7.5.0.0_formula");
			workFlowVar.setTableName(RMFormula.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("rM_formulaService");
		}
		formula.setWorkFlowVar(workFlowVar);
		if(formula.getDeploymentId() == null && deploymentId != null) {
			formula.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				formula.setProcessKey(d.getProcessKey());
				formula.setProcessVersion(d.getProcessVersion());
			}
		}

		saveFormula(formula, dataGridService, viewCode);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(formula.getId());
			workFlowVar.setTableInfoId(formula.getTableInfoId());
			workFlowVar.setTableNo(formula.getTableNo());
			workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
			workFlowVar.setOwnerId(formula.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(formula, instance, deploymentId, pendingId, workFlowVar);
		formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
		formulaDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessFormula(formula, di, workFlowVar, viewCode);
	}
	
	@Override
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.submit",operType="4")
	public void submit(RMFormula formula,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		submit(formula, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}
	
	@AuditLog(entity="RM_7.5.0.0_formula",model="RM_7.5.0.0_formula_Formula",desc="ec.flow.submit",operType="4")
	public void submit(RMFormula formula, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		String entityCode = "RM_7.5.0.0_formula";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, formula);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(formula);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("RM_7.5.0.0_formula");
		workFlowVar.setTableName(RMFormula.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("rM_formulaService");
		workFlowVar.setStatus(formula);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		formula.setWorkFlowVar(workFlowVar);
		if(formula.getDeploymentId() == null && deploymentId != null) {
			formula.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				formula.setProcessKey(d.getProcessKey());
				formula.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitFormula(formula, workFlowVar);
		saveFormula(formula, dataGridService, viewCode);
		if(null != formula && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || RMFormula.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == formula.getTableNo() ? "" : formula.getTableNo().toString());
			AuditUtil.setColumnStringA(null == formula.getId() ? "" : formula.getId().toString());
			AuditUtil.setColumnStringC(formula.getId().toString());
		}
		formulaDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(formula.getId());
		workFlowVar.setTableInfoId(formula.getTableInfoId());
		workFlowVar.setInitiatorPositionId(formula.getCreatePositionId());
		workFlowVar.setOwnerId(formula.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(formula.getOwnerPositionId());
		workFlowVar.setTableNo(formula.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, formula.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(formula, di, deploymentId, pendingId, workFlowVar, true);
			formulaDao.copyAndSaveDealInfo(saveDi, formula, creatorService.getStaffFromSession());
		}
		formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					formulaDao.flush();
					
					RMFormulaDealInfo formulaDealInfo=formulaDao.copyAndSaveDealInfo(di, formula, creatorService.getStaffFromSession());
					formulaDealInfo.setOutcome(outcome);
					formulaDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						formulaDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				formulaDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(formula.getStatus() == 99) {
			formulaDao.deleteSupervision(formula.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + formula.getProcessKey() + "_" + di.getActivityName() + "_RM_7.5.0.0_formula_" + formula.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		formulaDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessFormula(formula, di, workFlowVar, viewCode);
		afterSubmitFormula(formula, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, formula);
			}
		}
	}
	
	public String generateTableNo(){
		this.counter.setPattern(modelServiceFoundation.getEntity("RM_7.5.0.0_formula").getPrefix()+"_{1,date,yyyyMMdd}_{0,number,000}");
		return this.counter.incrementAndGetString(new Date(),new Date());
	}
	private void beforeSaveFormula(RMFormula formula, Object... objects){
		checkUniqueConstraint(formula);
	/* CUSTOM CODE START(serviceimpl,beforeSave,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
		if(formula.getBatchContral()){//如果勾选批控
			String formulaCode = "";
			ArrayList<Map<String, Object>> configs=null;
			String dependence;
			Property property=null;
			boolean isLegal;
			if (formula.getCode() == null || formula.getCode().isEmpty()) {//根据设定的规则生成编码用于校验
				String code_property_code = "RM_7.5.0.0_formula_Formula_code";
				property = modelServiceFoundation.getProperty(code_property_code);
				isLegal=true;
				if(null != property){
					Map<String, Object> codeattributesMap = property.getAttributesMap();
					if(codeattributesMap.get("pattern")!=null){
						codeCounter.setPattern(codeattributesMap.get("pattern").toString());
					}
					configs=(ArrayList<Map<String, Object>>) codeattributesMap.get("config");
					dependence=null;
					ArrayList<Object> codeparamlist=new ArrayList<Object>();
					for(int i=0;i<configs.size();i++){
						String ovalue=null;
						if(configs.get(i).get("type").equals("auto")&&configs.get(i).get("autoType").equals("Date")){
							Map<String, Object> autoConfig=configs.get(i);
							if(autoConfig.get("value").equals("_systemdate")){
								dependence=NonCachedCounterBean.dateFormat(new Date(),autoConfig.get("countType").toString());
							}else{
								String field=autoConfig.get("value").toString();
								if(field.equals("")){
									isLegal=false;
									break;
								}
								String fieldValue=ReflectUtils.getPropertyValue(formula,field.substring(field.indexOf(".")+1));
								if(fieldValue==null||fieldValue.equals("")){
									isLegal=false;
									break;
								}else{
									if(autoConfig.get("countType").equals("Yearly")){
										dependence = fieldValue.substring(0, 4);
									}else if(autoConfig.get("countType").equals("Monthly")){
										dependence = fieldValue.substring(0, 7);
									}else if(autoConfig.get("countType").equals("Daily")){
										dependence = fieldValue.substring(0, 10);
									}
								}
							}
						}
						if(configs.get(i).get("type").equals("property")){
							ovalue=ReflectUtils.getPropertyValue(formula,configs.get(i).get("value").toString().substring(configs.get(i).get("value").toString().indexOf(".")+1));
							if(ovalue.equals("")){
								isLegal=false;
								break;
							}
						}else if(configs.get(i).get("type").equals("date")){
							if(configs.get(i).get("value").equals("_systemdate")){
								ovalue=NonCachedCounterBean.dateFormat(new Date(),configs.get(i).get("dateType").toString());
							}else{
								String field=configs.get(i).get("value").toString();
								if(field.equals("")){
									isLegal=false;
									break;
								}
								String fieldValue=ReflectUtils.getPropertyValue(formula,field.substring(field.indexOf(".")+1));
								if(fieldValue==null||fieldValue.equals("")){
									isLegal=false;
									break;
								}else{
									if(configs.get(i).get("dateType").equals("YearA")){
										ovalue=fieldValue.substring(0, 4);
									}else if(configs.get(i).get("dateType").equals("YearB")){
										ovalue=fieldValue.substring(2, 4);
									}else if(configs.get(i).get("dateType").equals("Month")){
										ovalue=fieldValue.substring(5, 7);
									}else if(configs.get(i).get("dateType").equals("Date")){
										ovalue=fieldValue.substring(8, 10);
									}
								}
							}
						}else{
							ovalue=configs.get(i).get("value").toString();
						}
						if(configs.get(i).get("thecase").equals("uppercase")){
							ovalue=ovalue.toUpperCase();
						}else if(configs.get(i).get("thecase").equals("lowercase")){
							ovalue=ovalue.toLowerCase();
						}
						codeparamlist.add(ovalue);
					}
					if(isLegal){
						String codenewCodeValue="";
						if(dependence!=null){
							if((Boolean)codeattributesMap.get("rollbackable")==true){
								codenewCodeValue=codeCounter.incrementAndGetStringDependenceWithTx(dependence,codeparamlist.toArray());
							}else{
								codenewCodeValue=codeCounter.incrementAndGetStringDependence(dependence,codeparamlist.toArray());
							}
						}else{
							if((Boolean)codeattributesMap.get("rollbackable")==true){
								codenewCodeValue=codeCounter.incrementAndGetStringWithTx(codeparamlist.toArray());
							}else{
								codenewCodeValue=codeCounter.incrementAndGetString(codeparamlist.toArray());
							}
						}
						formulaCode = codenewCodeValue;
					}
				}
			}else{
				formula.getCode();
			}

			if(formulaCode.contains("\"") || formulaCode.contains("\'") || formulaCode.contains("@") || formulaCode.contains("*")
					|| formulaCode.contains("/") || formulaCode.contains("\\") ){
				throw new BAPException("RM.showMessage00000013");
			}
			if(formulaCode.length() > 16){
				throw new BAPException("RM.showMessage00000012");
			}
			Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
			Matcher m = p.matcher(formulaCode);
			if (m.find()) {
				throw new BAPException("RM.showMessage00000011");
			}

			//描述的验证
			String remark = formula.getDescription();
			if(remark != null && remark.length() > 0){
				if(remark.contains("\"") || remark.contains("\'") || remark.contains("@") || remark.contains("*")
						|| remark.contains("/") || remark.contains("\\") ){
					throw new BAPException("RM.showMessage00000013");
				}
				if(remark.length() > 255){
					throw new BAPException("RM.showMessage00000010");
				}
			}
		}

		//勾选批控时  配方类型必须是两层
		if(formula.getBatchContral()){
			if(formula.getFormulaType()!=null && formula.getFormulaType().getId()!=null && formulaTypeService.getFormulaType(formula.getFormulaType().getId())!=null){
				String layRec = formulaTypeService.getFormulaType(formula.getFormulaType().getId()).getLayRec();
				if(layRec.split("-").length!=2){
					throw new BAPException("RM.showMessage00000009");
				}
			}else{
				throw new BAPException("RM.showMessage00000014");
			}
		}

		//勾选批控时  中间服务器地址必填
		if(formula.getBatchContral()){
			boolean flag = true;
			if(formula.getInterfaceUrl() != null && formula.getInterfaceUrl().getId() != null && formula.getInterfaceUrl().getId().length() > 0 ){
				flag = false;
			}

			if(flag){
				throw new BAPException("RM.showMessage00000018");
			}
		}

		/************************************ 同步批控配方 start ************************************/
		// 勾选批控时, 在配方表中设置批控配方对象
		if (formula.getBatchContral()) {
			String batchFormulaId = formula.getBatchFormulaID();
			RMBatchFormulaMain batchFormula = formula.getBatchFormula();
			if (batchFormula != null) {
				batchFormula.setBatchFormulaId(batchFormulaId);
				// 解决保存后表中Batch_Formula字段含有两个值的情况
				formula.setBatchFormula(batchFormula);
			}
		}

		// 保存前的配方对象-Edit by hyc 空指针修改
		RMFormula beforeFormula = formula.getId() != null ? formulaDao.load(formula.getId()) : null;
		// 保存前的批控主配方ID
		if(beforeFormula != null && beforeFormula.getBatchFormula() != null ){
			RMBatchFormulaMain beforeRmBatchFormula=batchFormulaMainDao.load(beforeFormula.getBatchFormula().getId());
			beforeBatchFormulaId=beforeRmBatchFormula.getBatchFormulaId();
		}else{
			beforeBatchFormulaId="";
		}
		//beforeBatchFormulaId = beforeFormula != null && beforeFormula.getBatchFormula() != null ? beforeFormula.getBatchFormula().getBatchFormulaId() : null;
		formulaDao.flush();
		formulaDao.clear();
		/************************************ 同步批控配方 end ************************************/
/* CUSTOM CODE END */
	}
	
	private void afterSaveFormula(RMFormula formula, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
		//升版 编码违反唯一性约束
		String codedisplay=InternationalResource.get("RM.formula.randon15987456321", getCurrentLanguage());
		if(formula.getName()!=null &&formula.getEdition()!=null){
			//编码为空时，名称+版本唯一
			if(formula.getCode() == null || ( formula.getCode()!=null && formula.getCode().length()==0 )){
				List<Object> params=new ArrayList<Object>();
				params.add(formula.getName());
				params.add(formula.getEdition());
				//List<RMFormula> forumulaCount=this.getFormulas("this_.name=? and this_.edition=? and this_.valid=1", params);
				List<RMFormula> forumulaCount=this.getFormulas("this_.name=? and this_.edition=? and this_.valid=1 and this_.status != 0", params);
				if( forumulaCount.size()>1 ){
					throw new BAPException(codedisplay);
				}
			}else{
				//编码不为空，编码+版本唯一
				List<Object> params=new ArrayList<Object>();
				params.add(formula.getCode());
				params.add(formula.getEdition());
				//List<RMFormula> forumulaCount=this.getFormulas("this_.code=? and this_.edition=? and this_.valid=1", params);
				List<RMFormula> forumulaCount=this.getFormulas("this_.code=? and this_.edition=? and this_.valid=1 and this_.status != 0", params);
				if(forumulaCount.size()>1 ){
					throw new BAPException(codedisplay);
				}

			}

		}
        /*ServiceReference ref = bundleContext.getServiceReference(RMInterfaceSyncLogService.class.getName());
        if(null != ref) {
            RMInterfaceSyncLogService interfaceSyncLogService = (RMInterfaceSyncLogService) bundleContext.getService(ref);
            interfaceSyncLogService.addFormulasync(formula.getId().toString(), null);
        }*/
		if("formulaProperty/formulaProperty1".equals(formula.getSetProcess().getId())){
			formulaDao.flush();
			formulaDao.clear();
			formulaBomService.autoProduce(formula.getId());
			formulaDao.flush();
			formulaDao.clear();
		}

		/************************************ 同步批控配方 start ************************************/
		formulaDao.flush();
		formulaDao.clear();
		// 保存后的批控主配方ID
		//String afterBatchFormulaId = formula.getBatchFormula() != null ? formula.getBatchFormula().getBatchFormulaId() : "";
		String afterBatchFormulaId="";
		if(formula.getBatchFormula() != null){
			RMBatchFormulaMain afterRmBatchFormula=batchFormulaMainDao.load(formula.getBatchFormula().getId());
			afterBatchFormulaId=afterRmBatchFormula.getBatchFormulaId();
		}
		//如果不是复制配方
		if (!isCopy && formula.getBatchFormula() != null && !afterBatchFormulaId.equals(beforeBatchFormulaId)) {
			/* 根据具体的批控配方信息生成对应的工序  */
			//批控配方id
			String batchFormulaId = formula.getBatchFormulaID();
			//中间接口服务地址
			String interfaceUrl = formula.getInterfaceUrl() != null ? formula.getInterfaceUrl().getId() : null;
			String data;
			if (interfaceUrl != null && batchFormulaId != null && batchFormulaId.length() > 0) {
				//先从redis取
				data = RedisUtil.getString("batchFormula_" + batchFormulaId);

				JSONObject sobj = null;
				//如果redis取不到, 则发请求取
				if (data == null) {
					//获取get请求地址
					String url = batchFormulaMainService.getUrl(interfaceUrl);
					//获取批控配方明细
					data = batchFormulaMainService.getBatchFormulaList(url, batchFormulaId);
					try {
						sobj = new JSONObject(data);
						String dealSuccessFlag = sobj.getString("dealSuccessFlag");
						if ("true".equals(dealSuccessFlag)) {
							data = sobj.getString("data");
						} else {
							data = null;
						}
					} catch (JSONException e) {
						log.error(e.getMessage());
					}

				}

				try {
					if (data != null) {
						sobj = new JSONObject(data);
						// 提取json中的units信息
						String units = sobj.getString("Units");
						// 批控主配方模式 1总量/2分量
						String runMode = sobj.getString("Mode");

						if (units == null || "".equals(units)) {
							throw new BAPException("此配方没有配置工序信息!");
						}
						if (formula.getFeedingMode() == null) {
							if (runMode != null && "1".equals(runMode)) {
								formula.setFeedingMode(new SystemCode("RMfixAmount/01"));
							} else if (runMode != null && "2".equals(runMode)) {
								formula.setFeedingMode(new SystemCode("RMfixAmount/02"));
							}
						}
						//生成对应的工序和活动记录
						batchFormulaMainService.setUnitFromString(units, formula, runMode);
						//更新物料签单
						formulaBomService.autoProduce(formula.getId());
					} else {
						log.error("获取data为空!");
					}

				} catch (JSONException e) {
					throw new BAPException("此配方没有配置工序信息!");
				}
			}

		}
		isCopy = false;
		formulaDao.flush();
		formulaDao.clear();
		/************************************ 同步批控配方 end ************************************/

		//如果保存前批控主配方id有值，保存后批控主配方id为空，则删除配方工序
		if (!beforeBatchFormulaId.equals("")  && afterBatchFormulaId.equals("")) {
			String sql = "update RM_FORMULA_PROCESSES set valid = 0 where FORMULA_ID = ?";
			formulaDao.createNativeQuery(sql,formula.getId()).executeUpdate();
			String sql2 = "update RM_FORMULA_PROCESS_ACTIVES set valid = 0 where FORMULA_ID = ?";
			formulaDao.createNativeQuery(sql2,formula.getId()).executeUpdate();
			formulaDao.flush();
			formulaDao.clear();
			formulaBomService.autoProduce(formula.getId());
		}
/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportFormula(List<RMFormula> formulas, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportFormula(List<RMFormula> formulas){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportFormula(List<RMFormula> formulas, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportFormula(List<RMFormula> formulas){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	private void beforeDeleteFormula(RMFormula formula){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterDeleteFormula(RMFormula formula){
	/* CUSTOM CODE START(serviceimpl,afterDelete,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRestoreFormula(RMFormula formula){
	/* CUSTOM CODE START(serviceimpl,beforeRestore,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterRestoreFormula(RMFormula formula){
	/* CUSTOM CODE START(serviceimpl,afterRestore,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void customGenerateCodes(RMFormula formula, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(RMFormula formula, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeSubmitFormula(RMFormula formula, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,beforeSubmit,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeSubmitFormula(RMFormula formula, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,beforeSubmitSuperEdit,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitFormula(RMFormula formula, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,afterSubmit,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

		if("cancel".equals(workFlowVar.getOutcomeType())  && formula.getBatchContral() ){//配方作废且同步批控时
			//只有最后一个关联批控的配方删除时，才会删除批控的配方
			List<RMFormula> formulaList = formulaDao.findByCriteria(Restrictions.eq("batchFormulaID", formula.getBatchFormulaID()), Restrictions.ne("status", 0),Restrictions.eq("valid",true));
			if(formulaList != null && formulaList.size() > 0){
				log.info("有其他关联该批控配方的配方");
			}else{
				ServiceReference ref = bundleContext.getServiceReference(RMInterfaceSyncLogService.class.getName());
				if(null != ref) {
					RMInterfaceSyncLogService interfaceSyncLogService = (RMInterfaceSyncLogService) bundleContext.getService(ref);
					if(interfaceSyncLogService!=null){
						interfaceSyncLogService.deleteFormulasync(formula.getId().toString(), null);
					}
				}
			}
		}

		//如果是完整配方，则生效之前需要保证至少有一条工序与活动
		if(formula.getStatus()==88 &&  formula.getSetProcess()!=null  && formula.getSetProcess().getId().equals("formulaProperty/formulaProperty1")  && !"reject".equals(workFlowVar.getOutcomeType())){
			//工序
			List<RMFormulaProcess>processList=formulaProcessService.getFormulaProcesss("formulaId="+formula.getId()+" and valid = 1 ", null);
			int proSize=processList.size();
			//活动
			List<RMFormulaProcessActive>activeList=formulaProcessActiveService.getFormulaProcessActives("formulaId="+formula.getId()+" and valid = 1", null);
			int actSize=activeList.size();
			if(proSize<=0 || actSize<=0){
				throw new BAPException(InternationalResource.get("RM.errorMesg.randogfffdeftg44545642", getCurrentLanguage()));
			}

			for(RMFormulaProcess process:processList){
				List<Object> params=new ArrayList<Object>();
				params.add(formula.getId());
				params.add(process.getId());
				List<RMFormulaProcessActive>proessactiveList=formulaProcessActiveService.getFormulaProcessActives("FORMULA_ID=? and PROCESS_ID=? and valid=1",params);
				int size=proessactiveList.size();
				if(size==0){
					throw new BAPException("工序 :"+process.getName()+" 应至少有一条活动！");
				}
			}
		}

		//如果是完整配方，在提交之前确保每一条投配料活动至少有一条配料活动
		if(formula.getStatus()==88 &&  formula.getSetProcess()!=null  && formula.getSetProcess().getId().equals("formulaProperty/formulaProperty1")  && !"reject".equals(workFlowVar.getOutcomeType())){
			//工序[
			String processpagedisplay= InternationalResource.get("RM.errorMesg.radion1421378409234", getCurrentLanguage());
			//]中投配料活动[
			String activepagedisplay=InternationalResource.get("RM.errorMesg.radion1293742234234", getCurrentLanguage());
			//]还没有设置配料活动！
			String mixturepagedisplay=InternationalResource.get("RM.errorMesg.radion1293232423426", getCurrentLanguage());

			List<Object> params=new ArrayList<Object>();
			params.add(formula.getId());
			params.add("activeType/activeType4");
			//获取该配方中活动类型为投配的的活动
			List<RMFormulaProcessActive> forumulaActives=formulaProcessActiveService.getFormulaProcessActives("FORMULA_ID=? and ACTIVE_TYPE=? and valid=1", params);
			for(RMFormulaProcessActive forumulaActive:forumulaActives){
				List<Object> params1=new ArrayList<Object>();
				params1.add(formula.getId());
				params1.add("activeType/activeType2");
				params1.add(forumulaActive.getId());
				//获取该配方中投配料活动的配料活动
				int mixtureSize=formulaProcessActiveService.getFormulaProcessActives("FORMULA_ID=? and ACTIVE_TYPE=? and ACTIVE_HIDDEN_ID=? and valid=1", params1).size();
				//获取该投配料活动的工序
				RMFormulaProcess formulaProcess=formulaProcessDao.load(forumulaActive.getProcessId().getId());
				if(mixtureSize<=0){
					throw new BAPException(processpagedisplay+formulaProcess.getName()+activepagedisplay+forumulaActive.getName()+mixturepagedisplay);
				}
			}

		}
/* CUSTOM CODE END */
	}
	
	private void afterSubmitFormula(RMFormula formula, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,afterSubmitSuperEdit,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRetrial(RMFormula formula){
	/* CUSTOM CODE START(serviceimpl,beforeRetrial,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterRetrial(RMFormula formula){
	/* CUSTOM CODE START(serviceimpl,afterRetrial,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterSubmitProcessFormula(RMFormula formula, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcess,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitProcessFormula(RMFormula formula, DealInfo di, WorkFlowVar workFlowVar, String viewCode, Boolean superEdit){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcessSuperEdit,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveProcessFormula(RMFormula formula, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSaveProcess,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportFormula(List<RMFormula> insertObjs, List<RMFormula> updateObjs, 
			List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportFormula,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void afterImportFormula(List<RMFormula> insertObjs, List<RMFormula> updateObjs, 
			List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportFormula,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	/* CUSTOM CODE START(serviceimpl,functions,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
	List<RMFormulaProcess> newFormulaProcesss;
	RMFormula newFormula;
	List<RMFormulaBom> newFormualBoms;
	/**
	 * 设置启用停用
	 * @param ids 配方表id
	 * @param state 配方表状态
	 */
	public void updateFomulaState(String ids,String state) {
		if(ids==null || ids.length()==0){
			return;
		}
		String[] idsArray = ids.split(",");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String currentTime=sdf.format(new Date());
		try {
			Date date = sdf.parse(currentTime);
			for(int i=0;i<idsArray.length;i++){
				long id = Long.parseLong(idsArray[i]);
				RMFormula f=this.getFormula(id);
				if(state.equals("RMstate/state2") && f.getStartTime()==null){
					f.setState((SystemCode)systemCodeService.getSystemCode(state));
					f.setStartTime(date);
					formulaDao.merge(f);
				}
				if(state.equals("RMstate/state3")){
					f.setState((SystemCode)systemCodeService.getSystemCode(state));
					f.setEndTime(date);
					if(f.getIsDafault()==true){
						f.setIsDafault(false);
					}
					formulaDao.merge(f);
				}
				if(f.getStartTime()!=null){
					f.setState((SystemCode)systemCodeService.getSystemCode(state));
					formulaDao.merge(f);
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 设置配方的默认
	 * @param id 配方表id
	 * @param isDefault 是否为默认状态
	 */
	public void updateDefault(Long id,Boolean isDefault){
		if(id==null){
			return;
		}
		RMFormula f=this.getFormula(id);
		f.setIsDafault(isDefault);
		formulaDao.merge(f);
		//String sql="update "
	}
	@Autowired
	private SystemCodeService systemCodeService;
	/**
	 * 更新配方用途
	 * @param id 配方表id
	 * @param usedForid 用途id
	 * @param isForPro 生产性质
	 */
	public void updateUseChange(Long id,String usedForid,Boolean isForPro){
		if(id==null){
			return;
		}

		RMFormula f=this.getFormula(id);
		f.setUsedFor((SystemCode)systemCodeService.getSystemCode(usedForid));
		f.setIsForProduct(isForPro);
		//如果生产性质为否则默认配方为否
		if(isForPro==false){
			f.setIsDafault(false);
		}
		//String sql="update RM_FORMULAS set USED_FOR='"+usedForid+"' where id="+id;
		//formulaDao.createNativeQuery(sql).executeUpdate();
		formulaDao.merge(f);
	}
	/**
	 * 查找产品和默认配方并设置为非默认
	 * @param productId
	 * @return
	 */
	public void selectIsDefault(Long productId){
		List<RMFormula> formulas=this.getFormulas("product="+productId+"and isDafault=1",null);
		for(RMFormula f:formulas){
			f.setIsDafault(false);
			formulaDao.save(f);
		}
	}
	/**
	 * 返回配方的标识
	 */
	public String fomulaName(Long productId){
		List<RMFormula> formulas=this.getFormulas("product="+productId+"and isDafault=1",null);
		String formulaCode="";
		if(formulas.size()>0){
			formulaCode=formulas.get(0).getCode();
		}
		return formulaCode;
	}
	@Override
	public Boolean processDelete(Long processId) {
		//删除工序活动
		String hql = "delete " + RMFormulaProcessActive.JPA_NAME + " where process_Id in(:ids) ";
		Query query = formulaDao.createQuery(hql);
		query.setParameter("ids", processId);
		query.executeUpdate();
		formulaDao.clear();
		formulaDao.flush();
		//删除对应的工艺标准
		String sql = "delete " + RMPrecessStandards.JPA_NAME + " where process_Id in(:ids) ";
		Query query1 = formulaDao.createQuery(hql);
		query1.setParameter("ids", processId);
		query1.executeUpdate();
		formulaDao.clear();
		formulaDao.flush();
		//删除工序
		String hql2 = "delete " + RMFormulaProcess.JPA_NAME + " where id in(:ids)";
		Query query2 = formulaDao.createQuery(hql2);
		query2.setParameter("ids", processId);
		query2.executeUpdate();

		return true;
	}

	@Override
	public void upFormulaVersion(Long formulaId, String editionName,Long deployId,String formulaCode, String formulaName) {
		formulaDao.flush();
		formulaDao.clear();
		//得到配方
		RMFormula rmFormula=formulaDao.load(formulaId);
		//定义升级后的新的配方
		newFormula=new RMFormula();
		//插入配方常规信息的数据
		setNewFormula(rmFormula,newFormula,editionName,formulaCode,formulaName);
		//获取工序
		List<RMFormulaProcess>  formulaProcess=formulaProcessService.getFormulaProcesss("formulaId="+formulaId + " order by sort", null);
		//生成新的工序数据
		setNewProcss(formulaProcess,deployId);
		//生成前置工序
		generateBeforeProcess(formulaProcess,newFormula);
		//获取物品清单
		List<RMFormulaBom>  formulaBoms=formulaBomService.getFormulaBoms("formulaId="+formulaId, null);
		//生成新的物品清单的数据
		setNewFormulaBom(formulaBoms,deployId);
		List<RMFormulaProcessActive> newFormulaProcesssActive= new ArrayList<RMFormulaProcessActive>();
		//生成工序活动
		setNewProcessActive(newFormulaProcesss,newFormulaProcesssActive);
		//生成工艺标准
		setMixtureStand(newFormulaProcesssActive);

	}

	@Override
	public void copyFormula(Long formulaId, String editionName,Long deployId,String formulaCode, String formulaName){
		//标记此配方是复制出来的
		isCopy = true;
		formulaDao.flush();
		formulaDao.clear();
		//得到配方
		RMFormula rmFormula=formulaDao.load(formulaId);
		//定义升级后的新的配方
		newFormula= new RMFormula();
		//插入配方常规信息的数据
		setNewFormula(rmFormula,newFormula,editionName,formulaCode,formulaName);
		//获取工序
		List<RMFormulaProcess>  formulaProcess=formulaProcessService.getFormulaProcesss("formulaId="+formulaId  + " order by sort", null);
		//生成新的工序数据
		setNewProcss(formulaProcess,deployId);
		//生成前置工序
		generateBeforeProcess(formulaProcess,newFormula);
		//获取物品清单
		List<RMFormulaBom>  formulaBoms=formulaBomService.getFormulaBoms("formulaId="+formulaId, null);
		//生成新的物品清单的数据
		setNewFormulaBom(formulaBoms,deployId);
		List<RMFormulaProcessActive> newFormulaProcesssActive= new ArrayList<RMFormulaProcessActive>();
		//生成工序活动
		setNewProcessActive(newFormulaProcesss,newFormulaProcesssActive);
		//生成工艺标准
		setMixtureStand(newFormulaProcesssActive);
	}

	//根据旧的配方常规信息生成新的配方常规信息
	public  void setNewFormula(RMFormula rmFormula,RMFormula newFormula,String editionName,String formulaCode, String formulaName){
		newFormula.setCreatePositionId(rmFormula.getCreatePositionId());
		newFormula.setCreateDepartmentId(rmFormula.getCreateDepartmentId());
		newFormula.setCreateStaffId(rmFormula.getCreateStaffId());
		newFormula.setVersion(0);
		newFormula.setOwnerDepartmentId(rmFormula.getOwnerDepartmentId());
		newFormula.setOwnerPositionId(rmFormula.getOwnerDepartmentId());
		newFormula.setOwnerStaffId(rmFormula.getOwnerStaffId());
		if(formulaCode!=null && !formulaCode.equals("")){
			newFormula.setCode(formulaCode);
		}
		//名称
		newFormula.setName(formulaName);
		//版本
		newFormula.setEditions(editionName);
		//状态
		newFormula.setState((SystemCode) systemCodeService.getSystemCode("RMstate/state1"));
		//物料
		newFormula.setProduct(rmFormula.getProduct());
		//用于
		newFormula.setUsedFor(rmFormula.getUsedFor());
		//生产性质
		newFormula.setIsForProduct(rmFormula.getIsForProduct());
		//性质
		newFormula.setProduceType(rmFormula.getProduceType());
		//批控
		newFormula.setBatchContral(rmFormula.getBatchContral());
		//支持EBR
		newFormula.setSupportEbr(rmFormula.getSupportEbr());
		//标准时长
		newFormula.setLongTime(rmFormula.getLongTime());
		//主原料
		newFormula.setMainMetarial(rmFormula.getMainMetarial());
		//收率公式
		newFormula.setYieldFormula(rmFormula.getYieldFormula());
		//理论收率
		newFormula.setTheoreYield(rmFormula.getTheoreYield());
		//默认配方
		newFormula.setIsDafault(false);
		//配方类型
		newFormula.setFormulaType(rmFormula.getFormulaType());
		//描述
		newFormula.setDescription(rmFormula.getDescription());
		//配方属性
		newFormula.setSetProcess(rmFormula.getSetProcess());
		//配方批控ID
		newFormula.setBatchFormulaID(rmFormula.getBatchFormulaID());
		//质量标准
		newFormula.setQualityStandard(rmFormula.getQualityStandard());
		//样品模板
		newFormula.setSampleProj(rmFormula.getSampleProj());
		//采样点
		newFormula.setPickSite(rmFormula.getPickSite());
		//批控接口服务器地址
		newFormula.setInterfaceUrl(rmFormula.getInterfaceUrl());
		//批控接口服务器地址
		newFormula.setBatchFormulaCode(rmFormula.getBatchFormulaCode());
		//备注，继承于XXX配方
		newFormula.setDescription("继承于["+rmFormula.getCode() + "]。" + (rmFormula.getDescription()!=null?rmFormula.getDescription():"" ) );
		//投料模式
		newFormula.setFeedingMode(rmFormula.getFeedingMode());
		//允许提前放料
		newFormula.setAdvanceCharge(rmFormula.getAdvanceCharge());
		//放料条件
		newFormula.setFeedCondition(rmFormula.getFeedCondition());
		//完成后自动报工
		newFormula.setAutoReportOnFinish(rmFormula.getAutoReportOnFinish());
		//批控配方
		newFormula.setBatchFormula(rmFormula.getBatchFormula());
		//批控版本
		newFormula.setBatchFormulaEdition(rmFormula.getBatchFormulaEdition());
	}

	public void  setNewProcss(List<RMFormulaProcess> formulaProcess,Long deployId){
		//新的工序
		newFormulaProcesss=new ArrayList<RMFormulaProcess>();
		for(RMFormulaProcess formulaProcessItem :formulaProcess){
			RMFormulaProcess newFormulaProcesssItem=new RMFormulaProcess();
			//名称
			newFormulaProcesssItem.setName(formulaProcessItem.getName());
			//执行顺序
			newFormulaProcesssItem.setProcSort(formulaProcessItem.getProcSort());
			//批控工艺Id
			newFormulaProcesssItem.setBatchUnitID(formulaProcessItem.getBatchUnitID());
			//工序号
			newFormulaProcesssItem.setFormId(formulaProcessItem.getFormId());
			//配方隐藏Id
			newFormulaProcesssItem.setFormulaHideId(newFormula.getId());
			//标准时长
			newFormulaProcesssItem.setLongTime(formulaProcessItem.getLongTime());
			//最后一道工序
			newFormulaProcesssItem.setIsLastProcess(formulaProcessItem.getIsLastProcess());
			//第一道工序
			newFormulaProcesssItem.setIsFirstProcess(formulaProcessItem.getIsFirstProcess());
			//备注
			newFormulaProcesssItem.setMeno(formulaProcessItem.getMeno());
			//表单号
			newFormulaProcesssItem.setTableInfoId(formulaProcessItem.getTableInfoId());
			//工序类型
			newFormulaProcesssItem.setProcessType(formulaProcessItem.getProcessType());
			//末道工序
			newFormulaProcesssItem.setIsLastProcess(formulaProcessItem.getIsLastProcess());
			//升级工序Id
			newFormulaProcesssItem.setUpVersionId(formulaProcessItem.getId());
			//批控工序ID
			newFormulaProcesssItem.setBatchUnitID(formulaProcessItem.getBatchUnitID());
			newFormulaProcesssItem.setSort(formulaProcessItem.getSort());
			newFormulaProcesssItem.setIsNewCreate(false);
			newFormulaProcesss.add(newFormulaProcesssItem);
		}
		DataGridService dataGridService = new DataGridService() {
			@Override
			public void execute() {
				if (newFormulaProcesss != null
						&& !newFormulaProcesss.isEmpty()) {
					for (RMFormulaProcess item : newFormulaProcesss) {
						item.setFormulaId(newFormula);
						item.setTableInfoId(newFormula.getTableInfoId());
						formulaProcessService.saveFormulaProcess(item, null, "formulaEdit", "noEvent");
					}
				}
			}
		};
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setOperateType("save");
		// 保存
		save(newFormula, deployId, null,workFlowVar, dataGridService,"RM_7.5.0.0_formula_formulaEdit");

		List<RMFormulaProcess> newFormulaProcessList = formulaProcessService.getFormulaProcesss("formulaId="+newFormula.getId(), null);
		if(newFormulaProcessList != null && newFormulaProcessList.size() > 0){
			for(RMFormulaProcess formulaProcessItem :formulaProcess){
				//配方隐藏Id
				formulaProcessItem.setFormulaHideId(newFormula.getId());
				formulaProcessDao.save(formulaProcessItem);
			}
		}
	}

	public void setNewFormulaBom(List<RMFormulaBom>  formulaBoms,Long deployId){
		newFormualBoms=new ArrayList<RMFormulaBom>();
		for(RMFormulaBom formulaBom :formulaBoms){
			RMFormulaBom newFormulaBom=new RMFormulaBom();
			//物料
			newFormulaBom.setProductId(formulaBom.getProductId());
			//性质
			newFormulaBom.setProperty(formulaBom.getProperty());
			//单位数量
			newFormulaBom.setUnitQuality(formulaBom.getUnitQuality());
			//备注
			newFormulaBom.setMeno(formulaBom.getMeno());
			//上限
			newFormulaBom.setMaxQuality(formulaBom.getMaxQuality());
			//下限
			newFormulaBom.setMinQuality(formulaBom.getMinQuality());
			//损耗率
			newFormulaBom.setLossRate(formulaBom.getLossRate());
			//固定数量
			newFormulaBom.setIsMixQuality(formulaBom.getIsMixQuality());
			//次序号
			newFormulaBom.setSequence(formulaBom.getSequence());
			//阶段
			newFormulaBom.setPhase(formulaBom.getPhase());
			//是否需要称重
			newFormulaBom.setNeedWeigh(formulaBom.getNeedWeigh());
			newFormulaBom.setFormulaId(newFormula);
			newFormulaBom.setSort(formulaBom.getSort());
			newFormulaBom.setTableInfoId(newFormula.getTableInfoId());
			formulaBomDao.save(newFormulaBom);

		}


	}
	public void setNewProcessActive(List<RMFormulaProcess> newFormulaProcess,List<RMFormulaProcessActive> newFormulaProcesssActive){

		for(RMFormulaProcess newFormulaProcessItem:newFormulaProcess){
			List<RMFormulaProcessActive>  FormulaProcessActives= formulaProcessActiveService.getFormulaProcessActives("valid = 1 and processId="+newFormulaProcessItem.getUpVersionId(), null);
			for(RMFormulaProcessActive formulaProcessActive:FormulaProcessActives){
				//如果不是投配料活动中配料活动
				if(formulaProcessActive.getMixtureId()==null){
					RMFormulaProcessActive newFormulaActive=new RMFormulaProcessActive();
					newFormulaActive.setUpVersionId(formulaProcessActive.getId());
					//tableinfoId
					newFormulaActive.setTableInfoId(newFormulaProcessItem.getTableInfoId());
					//顺序
					newFormulaActive.setSort(formulaProcessActive.getSort());
					//隐藏顺序
					newFormulaActive.setHiddenSort(formulaProcessActive.getHiddenSort());
					//执行顺序
					newFormulaActive.setExecSort(formulaProcessActive.getExecSort());
					//是否是父活动
					newFormulaActive.setMainActive(formulaProcessActive.getMainActive());
					//子活动数量
					newFormulaActive.setSubActiveNum(formulaProcessActive.getSubActiveNum());
					//类型
					newFormulaActive.setActiveType(formulaProcessActive.getActiveType());
					//自动
					newFormulaActive.setAuto(formulaProcessActive.getAuto());
					//配于
					newFormulaActive.setBatchSite(formulaProcessActive.getBatchSite());
					//批控
					newFormulaActive.setBatchPhaseID(formulaProcessActive.getBatchPhaseID());
					//手工管道
					newFormulaActive.setChannelOrManual(formulaProcessActive.getChannelOrManual());
					//容器
					newFormulaActive.setContainer(formulaProcessActive.getContainer());
					//处理表单
					newFormulaActive.setExeBillName(formulaProcessActive.getExeBillName());
					//处理表单URL
					newFormulaActive.setExeBillUrl(formulaProcessActive.getExeBillUrl());
					//执行系统
					newFormulaActive.setExeSystem(formulaProcessActive.getExeSystem());
					//配方隐藏Id
					newFormulaActive.setFormulaHiddenId(newFormula.getId());
					//配方Id
					newFormulaActive.setFormulaId(newFormula);
					//来自容器
					newFormulaActive.setFromContainer(formulaProcessActive.getFromContainer());
					//投配料顺序
					newFormulaActive.setIngredientsOrder(formulaProcessActive.getIngredientsOrder());
					//固定数量
					newFormulaActive.setIsMixQuality(formulaProcessActive.getIsMixQuality());
					//顺序
					newFormulaActive.setActOrder(formulaProcessActive.getActOrder());
					//替代料
					newFormulaActive.setIsReplace(formulaProcessActive.getIsReplace());
					//工艺检测
					newFormulaActive.setIsWatchActive(formulaProcessActive.getIsWatchActive());
					//标准时长
					newFormulaActive.setLongTime(formulaProcessActive.getLongTime());
					//区间上限
					newFormulaActive.setMaxQuality(formulaProcessActive.getMaxQuality());
					//区间下限
					newFormulaActive.setMinQuality(formulaProcessActive.getMinQuality());
					//备注
					newFormulaActive.setMeno(formulaProcessActive.getMeno());
					//活动名称
					newFormulaActive.setName(formulaProcessActive.getName());
					//发生于
					newFormulaActive.setOccurTurn(formulaProcessActive.getOccurTurn());
					//工序隐藏Id
					newFormulaActive.setProcessHiddenId(newFormulaProcessItem.getId());
					//工序
					newFormulaActive.setProcessId(newFormulaProcessItem);
					//物料
					newFormulaActive.setProduct(formulaProcessActive.getProduct());
					//表单号
					newFormulaActive.setProcessTableId(newFormula.getTableInfoId());
					//质量标准
					newFormulaActive.setQualityStandard(formulaProcessActive.getQualityStandard());
					//检验方案
					newFormulaActive.setTestProduct(formulaProcessActive.getTestProduct());
					//单位数量
					newFormulaActive.setStandardQuantity(formulaProcessActive.getStandardQuantity());
					//类型名称
					newFormulaActive.setTypeName(formulaProcessActive.getTypeName());
					//顺序
					newFormulaActive.setSort(formulaProcessActive.getSort());
					//投料顺序
					newFormulaActive.setActOrder(formulaProcessActive.getActOrder());
					//损耗率
					newFormulaActive.setLossRate(formulaProcessActive.getLossRate());
					//配料顺序
					newFormulaActive.setIngredientsOrder(formulaProcessActive.getIngredientsOrder());
					//完工检验
					newFormulaActive.setFinalInspection(formulaProcessActive.getFinalInspection());
					//移动端执行
					newFormulaActive.setMobileTerminal(formulaProcessActive.getMobileTerminal());
					//批控phaseID
					newFormulaActive.setBatchPhaseID(formulaProcessActive.getBatchPhaseID());
					//批控phasename
					newFormulaActive.setBatchPhaseName(formulaProcessActive.getBatchPhaseName());
					//质量标准
					newFormulaActive.setQualityStandard(formulaProcessActive.getQualityStandard());
					//样品模板
					newFormulaActive.setTestProduct(formulaProcessActive.getTestProduct());
					//采样点
					newFormulaActive.setPickSite(formulaProcessActive.getPickSite());
					//是否机动投料
					newFormulaActive.setIsAgile(formulaProcessActive.getIsAgile());
					//机动行为
					newFormulaActive.setIsForTemp(formulaProcessActive.getIsForTemp());
					//是否是复制处理的活动
					newFormulaActive.setCopy(formulaProcessActive.getCopy());
					//可用于调整
					newFormulaActive.setIsForAdjust(formulaProcessActive.getIsForAdjust());
					//是否其他活动
					newFormulaActive.setIsMoreOther(formulaProcessActive.getIsMoreOther());
					//是否放行检验
					newFormulaActive.setIsPassCheck(formulaProcessActive.getIsPassCheck());
					newFormulaProcesssActive.add(newFormulaActive);
					formulaProcessActiveDao.save(newFormulaActive);

					//如果存在配料活动
					List<RMFormulaMixtureActive>  FormulaMixtureActives= formulaMixtureActiveService.getFormulaMixtureActives("valid = 1 and processActiveId="+formulaProcessActive.getId(), null);
					if(FormulaMixtureActives.size()>0){
						//遍历配料活动
						for(RMFormulaMixtureActive FormulaMixtureActive:FormulaMixtureActives){
							//新建配料活动
							RMFormulaMixtureActive newformulaMixtureActive=new RMFormulaMixtureActive();
							//添加标识
							newformulaMixtureActive.setAddFlag(FormulaMixtureActive.getAddFlag());
							//控制系统执行
							newformulaMixtureActive.setAuto(FormulaMixtureActive.getAuto());
							//损耗率
							newformulaMixtureActive.setLossRate(FormulaMixtureActive.getLossRate());
							//配于
							newformulaMixtureActive.setBatchSite(FormulaMixtureActive.getBatchSite());
							//批控活动ID
							//newformulaMixtureActive.setBatchPhaseID(FormulaMixtureActive.getBatchPhaseID());
							//手工管道
							newformulaMixtureActive.setChannelOrManual(FormulaMixtureActive.getChannelOrManual());
							//容器
							newformulaMixtureActive.setContainer(FormulaMixtureActive.getContainer());
							//顺序
							newformulaMixtureActive.setExeOrder(FormulaMixtureActive.getExeOrder());
							//执行顺序
							newformulaMixtureActive.setExecSort(FormulaMixtureActive.getExecSort());
							//隐藏顺序
							newformulaMixtureActive.setHiddenSort(FormulaMixtureActive.getHiddenSort());
							//执行系统
							newformulaMixtureActive.setExeSystem(FormulaMixtureActive.getExeSystem());
							//配方隐藏Id
							newformulaMixtureActive.setFormulaHiddenId(newFormulaProcessItem.getFormulaHideId());
							//类型
							newformulaMixtureActive.setFormulaType(FormulaMixtureActive.getFormulaType());
							//来自容器
							newformulaMixtureActive.setFromContainer(FormulaMixtureActive.getFromContainer());
							//投配料顺序
							newformulaMixtureActive.setIngredientsOrder(FormulaMixtureActive.getIngredientsOrder());
							//固定数量
							newformulaMixtureActive.setIsMixQuality(FormulaMixtureActive.getIsMixQuality());
							//替代料
							newformulaMixtureActive.setIsPlace(FormulaMixtureActive.getIsPlace());
							//是否监视工艺
							newformulaMixtureActive.setIsWatchActive(FormulaMixtureActive.getIsWatchActive());
							//标准时长
							newformulaMixtureActive.setLongTime(FormulaMixtureActive.getLongTime());
							//区间上限
							newformulaMixtureActive.setMaxQuality(FormulaMixtureActive.getMaxQuality());
							//备注
							newformulaMixtureActive.setMeno(FormulaMixtureActive.getMeno());
							//区间下限
							newformulaMixtureActive.setMinQuality(FormulaMixtureActive.getMinQuality());
							//名字
							newformulaMixtureActive.setName(FormulaMixtureActive.getName());
							//发生于
							newformulaMixtureActive.setOccurTurn(FormulaMixtureActive.getOccurTurn());
							//工序活动ID
							newformulaMixtureActive.setProcessActiveId(newFormulaActive);
							//工序隐藏Id
							newformulaMixtureActive.setProcessHiddenId(newFormulaProcessItem.getId());
							//表单号
							newformulaMixtureActive.setTableInfoId(newFormulaProcessItem.getTableInfoId());
							//表单号
							newformulaMixtureActive.setProcessTableId(newFormulaProcessItem.getTableInfoId());
							//物料
							newformulaMixtureActive.setProduct(FormulaMixtureActive.getProduct());
							//保存标识
							newformulaMixtureActive.setSaveFlag(FormulaMixtureActive.getSaveFlag());
							//单位数量
							newformulaMixtureActive.setStandardQuantity(FormulaMixtureActive.getStandardQuantity());
							formulaMixtureActiveDao.save(newformulaMixtureActive);
							//新建工序活动
							RMFormulaProcessActive processActive=new  RMFormulaProcessActive();
							//插入表单编号
							processActive.setTableInfoId(newFormulaActive.getTableInfoId());
							//损耗率
							processActive.setLossRate(newFormulaActive.getLossRate());
							//插入工序Id
							processActive.setProcessId(newFormulaActive.getProcessId());
							//隐藏的工序Id
							processActive.setActiveHiddenId(newFormulaActive.getId());
							//顺序
							processActive.setSort(FormulaMixtureActive.getSort());
							//隐藏顺序id
							processActive.setHiddenSort(FormulaMixtureActive.getHiddenSort());
							//执行顺序
							processActive.setExecSort(FormulaMixtureActive.getExecSort());
							//配方Id
							processActive.setFormulaId(newFormulaActive.getFormulaId());
							//是否机动投料
							processActive.setIsAgile(newFormulaActive.getIsAgile());
							//批控
							processActive.setBatchPhaseID(newFormulaActive.getBatchPhaseID());
							//机动行为
							processActive.setIsForTemp(newFormulaActive.getIsForTemp());
							//是否是复制处理的活动
							processActive.setCopy(newFormulaActive.getCopy());
							//可用于调整
							processActive.setIsForAdjust(newFormulaActive.getIsForAdjust());
							//是否其他活动
							processActive.setIsMoreOther(newFormulaActive.getIsMoreOther());
							//是否放行检验
							processActive.setIsPassCheck(newFormulaActive.getIsPassCheck());

							formulaProcessActiveService.addFromMixtureActive(processActive,newformulaMixtureActive);

							if(newFormulaActive.getActiveHiddenId()==null){
								newFormulaActive.setActiveHiddenId(processActive.getId());
								formulaProcessActiveDao.merge(newFormulaActive);
							}

						}

					}

				}
			}


		}


	}
	public void setMixtureStand(List <RMFormulaProcessActive> newFormulaProcesssActive ){
		for(RMFormulaProcessActive newProcesssActiveItem :newFormulaProcesssActive ){
			List<RMPrecessStandards>  FormulaPrecessStandards= precessStandardsService.getPrecessStandardss("activeId="+newProcesssActiveItem.getUpVersionId(), null);
			for(RMPrecessStandards RMPrecessStandard:FormulaPrecessStandards){
				RMPrecessStandards newPrecessStand=new RMPrecessStandards();
				//工序活动Id
				newPrecessStand.setActiveId(newProcesssActiveItem);
				//波动扫描间隔(秒)
				newPrecessStand.setFlucInter(RMPrecessStandard.getFlucInter());
				//波动下限
				newPrecessStand.setFlucLowerLimit(RMPrecessStandard.getFlucLowerLimit());
				//波动上限
				newPrecessStand.setFlucUpperLimit(RMPrecessStandard.getFlucUpperLimit());
				//统计波动
				newPrecessStand.setFluctuateFlag(RMPrecessStandard.getFluctuateFlag());
				//扫描间隔（超限）
				newPrecessStand.setLimitInter(RMPrecessStandard.getLimitInter());
				//下下限
				newPrecessStand.setLoweMxLimit(RMPrecessStandard.getLoweMxLimit());
				//下限
				newPrecessStand.setLimitInter(RMPrecessStandard.getLimitInter());
				//上上限
				newPrecessStand.setMaxLimit(RMPrecessStandard.getMaxLimit());
				//统计超限
				newPrecessStand.setOverrunFlag(RMPrecessStandard.getOverrunFlag());
				//工序Id
				newPrecessStand.setProcessId(newProcesssActiveItem.getProcessId());
				//指标
				newPrecessStand.setQuota(RMPrecessStandard.getQuota());
				//标准值
				newPrecessStand.setStValue(RMPrecessStandard.getStValue());
				//上限
				newPrecessStand.setUpperLimit(RMPrecessStandard.getUpperLimit());
				//tableIfID
				newPrecessStand.setTableInfoId(newProcesssActiveItem.getTableInfoId());
				precessStandardsDao.save(newPrecessStand);

			}

		}
	}
	public void generateBeforeProcess(List<RMFormulaProcess> formulaProcess,RMFormula newformul){
		//遍历工序
		for(RMFormulaProcess formulaProcessItem :formulaProcess){
			//得到原工序的前置工序
			//List<RMFormulaBeforeProcess> formualBeforeProcess= formulaBeforeProcessService.getFormulaBeforeProcesss("processId="+formulaProcessItem, null);
			String  Hql = " from "+ RMFormulaBeforeProcess.JPA_NAME + " where processId = ?  ";
			Query	query  =  formulaBeforeProcessDao.createQuery(Hql, formulaProcessItem);
			List<RMFormulaBeforeProcess>  formualBeforeProcess = query.list();



			//遍历前置工序
			for(RMFormulaBeforeProcess formualBeforeProcessItem: formualBeforeProcess){
				RMFormulaBeforeProcess newFormulaBeforeProcess=new RMFormulaBeforeProcess();
				List<Object> params=new ArrayList<Object>();
				//params.add(new Param("advQueryCond", request.getParameter("advQueryCond"), Param.LIKE_ALL));
				params.add(formulaProcessItem.getName());
				params.add(newformul.getId());
				List<RMFormulaProcess> newFormulaProcess=formulaProcessService.getFormulaProcesss("this_.name=? and this_.formula_Id=?", params);
				//获取新的前置工序
				List<Object> params1=new ArrayList<Object>();
				//params.add(new Param("advQueryCond", request.getParameter("advQueryCond"), Param.LIKE_ALL));
				params1.add(formualBeforeProcessItem.getBeforeProcessID().getName());
				params1.add(newformul.getId());
				List<RMFormulaProcess> newBeforeFormulaProcess=formulaProcessService.getFormulaProcesss("this_.name=? and this_.formula_Id=?", params1);

				newFormulaBeforeProcess.setBeforeProcessID(newBeforeFormulaProcess.get(0));
				newFormulaBeforeProcess.setProcessId(newFormulaProcess.get(0));
				formulaBeforeProcessDao.save(newFormulaBeforeProcess);

			}

		}
	}
	@Override
	public boolean checkFormulaType(Long formulaTypeId) {
		String savehql="from "+ RMFormula.JPA_NAME +" where formulaType.id=? and valid=1";
		List<RMFormula> rmFormulas=formulaDao.findByHql(savehql, formulaTypeId);
		if(rmFormulas.size()>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean isExists(String code,String name, String edition){//复制，唯一性验证
		String codedisplay=InternationalResource.get("RM.formula.randon15987456321", getCurrentLanguage());
		if(name!=null && edition!=null){
			//编码为空时，名称+版本唯一
			if(code == null || ( code !=null && code.length()==0 )){
				List<Object> params=new ArrayList<Object>();
				params.add(name);
				params.add(edition);
				//List<RMFormula> forumulaCount=this.getFormulas("this_.name=? and this_.edition=? and this_.valid=1", params);
				List<RMFormula> forumulaCount=this.getFormulas("this_.name=? and this_.editions=? and this_.valid=1 and this_.status != 0", params);
				if( forumulaCount.size()>0 ){
					return false;
				}
			}else{
				//编码不为空，编码+版本唯一
				List<Object> params=new ArrayList<Object>();
				params.add(code);
				params.add(edition);
				//List<RMFormula> forumulaCount=this.getFormulas("this_.code=? and this_.edition=? and this_.valid=1", params);
				List<RMFormula> forumulaCount=this.getFormulas("this_.code=? and this_.editions=? and this_.valid=1 and this_.status != 0", params);
				if(forumulaCount.size()>0 ){
					return false;
				}
			}
		}
		return true;
	}

	@Resource
	private ConsulService consulService;

	/* 根据参照的工序id复制所有活动到当前工序活动中
	 * processId原工序id
	 * refProcessId参照工序id
	 * */
	@Override
	public String copyFormulaProcessActivity(String processId, String refProcessId) {
		//boolean batchContral = consulService.getValueAsBoolean("platform/bap/RM/RM.batchContral");
		boolean batchContral =false;
		RMFormulaProcess formulaProcess = formulaProcessService.getFormulaProcess(Long.valueOf(processId));
		if(formulaProcess != null && formulaProcess.getFormulaId() != null){
			batchContral = formulaProcess.getFormulaId().getBatchContral();
		}
		String flag = "";
		if (batchContral) {
			flag = copyFormulaProcessActivityWithBatch(processId, refProcessId);
		} else {
			flag = copyFormulaProcessActivityWithoutBatch(processId, refProcessId);
		}
		return flag;
	}

	// 启用批控时复制
	public String copyFormulaProcessActivityWithBatch(String processId, String refProcessId) {
		//isCopyActivity = true;
		String flag = "";
		//原工序
		RMFormulaProcess formulaProcess = formulaProcessDao.load(Long.valueOf(processId));
		//参照工序
		RMFormulaProcess refFormulaProcess = formulaProcessDao.load(Long.valueOf(refProcessId));

		// HQL查询语句,根据sort字段进行升序排列
		String hql = "from " + RMFormulaProcessActive.JPA_NAME + " where processId = ? and valid = 1 and batchPhaseID <> null order by sort asc";
		String refHql = "from " + RMFormulaProcessActive.JPA_NAME + " where processId = ? and valid = 1 and batchPhaseID <> null order by sort asc";

		// 原工序活动
		List<RMFormulaProcessActive> processActives = formulaProcessActiveDao.findByHql(hql, formulaProcess);
		// 参照工序活动
		List<RMFormulaProcessActive> refProcessActives = formulaProcessActiveDao.findByHql(hql, refFormulaProcess);

		//比较两个活动列表的差异, 即判断是否满足可复制的条件: 参照活动PhaseID数 = 原有活动PhaseID数
		List<String> refPhaseIDs = new ArrayList<String>();
		List<String> phaseIDs = new ArrayList<String>();

		//比较两个活动列表的差异, 即判断是否满足可复制的条件: 两边的自动下达字段状态必须一致
		List<Boolean> refAutos = new ArrayList<Boolean>();
		List<Boolean> autos = new ArrayList<Boolean>();

		for (RMFormulaProcessActive active : processActives) {
			String phaseID = active.getBatchPhaseID();
			Boolean autoCommit = active.getAuto();
			if (!phaseIDs.contains(phaseID)) {//过滤phaseID重复的数据
				phaseIDs.add(phaseID);
				autos.add(autoCommit);
			}
		}
		for (RMFormulaProcessActive refActive : refProcessActives) {
			String phaseID = refActive.getBatchPhaseID();
			Boolean autoCommit = refActive.getAuto();
			if (!refPhaseIDs.contains(phaseID)) {//过滤phaseID重复的数据
				refPhaseIDs.add(phaseID);
				refAutos.add(autoCommit);
			}
		}

		// 参照活动PhaseID数 != 原有活动PhaseID数, 不可参照
		if( phaseIDs.size() != refPhaseIDs.size() ){
			return "由于被参照工序所含活动数量与原工序不相等，因此无法参照该工序下的活动！";
		}

		// 参照活动与原有活动自动状态不相符, 不可参照
		for(int i = 0; i < phaseIDs.size(); i++){
			if(autos.get(i) != refAutos.get(i)){
				return "参照活动与原有活动自动状态不相符, 不可参照！";
			}
		}

		List<RMFormulaProcessActive> newFormulaProcesssActive = new ArrayList<RMFormulaProcessActive>();
		// 删除原有活动中的配料活动
		deleteIngredientsActivityFromDb(processActives);
		// 移除list中的配料活动
		filterIngredientsActivity(processActives);
		filterIngredientsActivity(refProcessActives);
		// 如果存在复制的活动(即phaseID相等,不包括配料)
		if (refProcessActives.size() > processActives.size()) { }
		log.info("**************************************原有活动: " + processActives.toString());
		log.info("**************************************参照活动: " + refProcessActives.toString());
		//复制活动到当前工序活动中
		flag = setReferredProcessActive(processActives, refProcessActives, newFormulaProcesssActive, formulaProcess);
		log.info("**************************************复制的活动(不包括配料活动): " + newFormulaProcesssActive.toString());
		//生成工艺标准
		setReferredMixtureStand(newFormulaProcesssActive);

		return flag;
	}

	//复制活动到当前工序活动中
	private String setReferredProcessActive(List<RMFormulaProcessActive> processActives, List<RMFormulaProcessActive> refProcessActives, List<RMFormulaProcessActive> newFormulaProcesssActive, RMFormulaProcess formulaProcess) {
		//配料活动数量
		//int ingredientsCount = 0;
		//对同一道工序进行操作
		String flag = "";
		for (int i = 0; i < refProcessActives.size(); i++) {
			//如果不是投配料活动中配料活动
			if (refProcessActives.get(i).getMixtureId() == null) {
				RMFormulaProcessActive formulaActive = null;
				try {
					formulaActive = processActives.get(i);
				} catch (IndexOutOfBoundsException e) {//捕获数组下标越界异常
					StringBuilder msg = new StringBuilder("**************************************[in setReferredProcessActive: ");
					log.info(msg.append("参照的配方活动中存在复制出来的活动(不包括配料)而导致 IndexOutOfBoundsException - ").append(e.getMessage()).append("]").toString());
					// 如果下标越界,说明参照的配方活动中存在复制出来的活动(不包括配料),因此要新增一条活动
					formulaActive = new RMFormulaProcessActive();
				}
				// 跳过为"控制系统执行"并且"活动类型"为"投料"的活动 - added 20180828
				if (formulaActive.getAuto() && null != formulaActive.getActiveType() && "activeType/activeType3".equals(formulaActive.getActiveType().getId())) {
					formulaActive.setSort(refProcessActives.get(i).getSort());
					newFormulaProcesssActive.add(formulaActive);
					formulaProcessActiveDao.save(formulaActive);
				} else {
					//formulaActive.setUpVersionId(refFormulaActive.getId());
					//tableinfoId
					formulaActive.setTableInfoId(formulaProcess.getTableInfoId());
					//顺序
					formulaActive.setSort(refProcessActives.get(i).getSort());
					// 隐藏顺序
					formulaActive.setHiddenSort(refProcessActives.get(i).getHiddenSort());
					// 执行顺序
					formulaActive.setExecSort(refProcessActives.get(i).getExecSort());
					// 是否是父活动
					formulaActive.setMainActive(refProcessActives.get(i).getMainActive());
					// 子活动数量
					formulaActive.setSubActiveNum(refProcessActives.get(i).getSubActiveNum());
					//类型
					formulaActive.setActiveType(refProcessActives.get(i).getActiveType());
					//自动
					formulaActive.setAuto(refProcessActives.get(i).getAuto());
					//配于
					formulaActive.setBatchSite(refProcessActives.get(i).getBatchSite());
					//批控
					//formulaActive.setBatchPhaseID(formulaActive.getBatchPhaseID());
					//手工管道
					formulaActive.setChannelOrManual(refProcessActives.get(i).getChannelOrManual());
					//容器
					formulaActive.setContainer(refProcessActives.get(i).getContainer());
					//处理表单
					formulaActive.setExeBillName(refProcessActives.get(i).getExeBillName());
					//处理表单URL
					formulaActive.setExeBillUrl(refProcessActives.get(i).getExeBillUrl());
					//执行系统
					formulaActive.setExeSystem(refProcessActives.get(i).getExeSystem());
					//配方隐藏Id
					formulaActive.setFormulaHiddenId(formulaProcess.getFormulaId().getId());
					//配方Id
					formulaActive.setFormulaId(formulaProcess.getFormulaId());
					//来自容器
					formulaActive.setFromContainer(refProcessActives.get(i).getFromContainer());
					//投配料顺序
					formulaActive.setIngredientsOrder(refProcessActives.get(i).getIngredientsOrder());
					//固定数量
					formulaActive.setIsMixQuality(refProcessActives.get(i).getIsMixQuality());
					//顺序
					formulaActive.setActOrder(refProcessActives.get(i).getActOrder());
					//替代料
					formulaActive.setIsReplace(refProcessActives.get(i).getIsReplace());
					//工艺检测
					formulaActive.setIsWatchActive(refProcessActives.get(i).getIsWatchActive());
					//标准时长
					formulaActive.setLongTime(refProcessActives.get(i).getLongTime());
					//区间上限
					formulaActive.setMaxQuality(refProcessActives.get(i).getMaxQuality());
					//区间下限
					formulaActive.setMinQuality(refProcessActives.get(i).getMinQuality());
					//备注
					formulaActive.setMeno(refProcessActives.get(i).getMeno());
					//活动名称
					formulaActive.setName(refProcessActives.get(i).getName());
					//发生于
					formulaActive.setOccurTurn(refProcessActives.get(i).getOccurTurn());
					//工序隐藏Id
					formulaActive.setProcessHiddenId(formulaProcess.getId());
					//工序
					formulaActive.setProcessId(formulaProcess);
					//物料
					formulaActive.setProduct(refProcessActives.get(i).getProduct());
					//表单号
					formulaActive.setProcessTableId(formulaProcess.getFormulaId().getTableInfoId());
					//质量标准
					formulaActive.setQualityStandard(refProcessActives.get(i).getQualityStandard());
					//检验方案
					formulaActive.setTestProduct(refProcessActives.get(i).getTestProduct());
					//单位数量
					formulaActive.setStandardQuantity(refProcessActives.get(i).getStandardQuantity());
					//类型名称
					formulaActive.setTypeName(refProcessActives.get(i).getTypeName());
					//投料顺序
					formulaActive.setActOrder(refProcessActives.get(i).getActOrder());
					//损耗率
					formulaActive.setLossRate(refProcessActives.get(i).getLossRate());
					//配料顺序
					formulaActive.setIngredientsOrder(refProcessActives.get(i).getIngredientsOrder());
					//完工检验
					formulaActive.setFinalInspection(refProcessActives.get(i).getFinalInspection());
					//移动端执行
					formulaActive.setMobileTerminal(refProcessActives.get(i).getMobileTerminal());

					/*if (i >= 1 && refProcessActives.get(i).getBatchPhaseID().equals(refProcessActives.get(i-1).getBatchPhaseID())){//如果当前活动为的phaseID与上一个活动的phaseID相等
						//复制上一个活动的批控phaseID
						formulaActive.setBatchPhaseID(processActives.get(i-1).getBatchPhaseID());
					}*/

					//批控PhaseName
					formulaActive.setBatchPhaseName(refProcessActives.get(i).getBatchPhaseName());
					//质量标准
					formulaActive.setQualityStandard(refProcessActives.get(i).getQualityStandard());
					//样品模板
					formulaActive.setTestProduct(refProcessActives.get(i).getTestProduct());
					//采样点
					formulaActive.setPickSite(refProcessActives.get(i).getPickSite());
					//是否机动投料
					formulaActive.setIsAgile(refProcessActives.get(i).getIsAgile());
					//机动行为
					formulaActive.setIsForTemp(refProcessActives.get(i).getIsForTemp());
					//是否是复制处理的活动
					formulaActive.setCopy(refProcessActives.get(i).getCopy());
					//可用于调整
					formulaActive.setIsForAdjust(refProcessActives.get(i).getIsForAdjust());
					//是否其他活动
					formulaActive.setIsMoreOther(refProcessActives.get(i).getIsMoreOther());
					//是否放行检验
					formulaActive.setIsPassCheck(refProcessActives.get(i).getIsPassCheck());
					/*//配料完成后才能执行
					formulaActive.setCanExcuteAfterBatch(refProcessActives.get(i).getCanExcuteAfterBatch());
					//准备前确保指令可下达
					formulaActive.setCheckBeforePrepare(refProcessActives.get(i).getCheckBeforePrepare());
					//配料时机
					formulaActive.setMixTime(refProcessActives.get(i).getMixTime());
					//是否自动下达
					formulaActive.setAutoCommit(refProcessActives.get(i).getAutoCommit());
					//配料指令创建人
					formulaActive.setBatchStaff(refProcessActives.get(i).getBatchStaff());
					//要求完成时间
					formulaActive.setNeedFinishTime(refProcessActives.get(i).getNeedFinishTime());
					//要求完成时长
					formulaActive.setNeedFinishDuring(refProcessActives.get(i).getNeedFinishDuring());*/

					newFormulaProcesssActive.add(formulaActive);
					formulaProcessActiveDao.save(formulaActive);

					//如果存在配料活动
					List<RMFormulaMixtureActive> refFormulaMixtureActives = formulaMixtureActiveService.getFormulaMixtureActives("processActiveId=" + refProcessActives.get(i).getId(), null);
					if (refFormulaMixtureActives.size() > 0) {
						//遍历配料活动
						for (RMFormulaMixtureActive FormulaMixtureActive : refFormulaMixtureActives) {
							//配料活动数量+1
							//++ingredientsCount;
							//新建配料活动
							RMFormulaMixtureActive newformulaMixtureActive = new RMFormulaMixtureActive();
							//添加标识
							newformulaMixtureActive.setAddFlag(FormulaMixtureActive.getAddFlag());
							//控制系统执行
							newformulaMixtureActive.setAuto(FormulaMixtureActive.getAuto());
							//损耗率
							newformulaMixtureActive.setLossRate(FormulaMixtureActive.getLossRate());
							//配于
							newformulaMixtureActive.setBatchSite(FormulaMixtureActive.getBatchSite());
							//手工管道
							newformulaMixtureActive.setChannelOrManual(FormulaMixtureActive.getChannelOrManual());
							//容器
							newformulaMixtureActive.setContainer(FormulaMixtureActive.getContainer());
							//顺序
							newformulaMixtureActive.setSort(FormulaMixtureActive.getSort());
							//执行顺序
							newformulaMixtureActive.setExeOrder(FormulaMixtureActive.getExeOrder());
							//执行顺序
							newformulaMixtureActive.setExecSort(FormulaMixtureActive.getExecSort());
							//执行系统
							newformulaMixtureActive.setExeSystem(FormulaMixtureActive.getExeSystem());
							//配方隐藏Id
							newformulaMixtureActive.setFormulaHiddenId(formulaProcess.getFormulaHideId());
							//类型
							newformulaMixtureActive.setFormulaType(FormulaMixtureActive.getFormulaType());
							//来自容器
							newformulaMixtureActive.setFromContainer(FormulaMixtureActive.getFromContainer());
							//投配料顺序
							newformulaMixtureActive.setIngredientsOrder(FormulaMixtureActive.getIngredientsOrder());
							//固定数量
							newformulaMixtureActive.setIsMixQuality(FormulaMixtureActive.getIsMixQuality());
							//替代料
							newformulaMixtureActive.setIsPlace(FormulaMixtureActive.getIsPlace());
							//是否监视工艺
							newformulaMixtureActive.setIsWatchActive(FormulaMixtureActive.getIsWatchActive());
							//标准时长
							newformulaMixtureActive.setLongTime(FormulaMixtureActive.getLongTime());
							//区间上限
							newformulaMixtureActive.setMaxQuality(FormulaMixtureActive.getMaxQuality());
							//备注
							newformulaMixtureActive.setMeno(FormulaMixtureActive.getMeno());
							//区间下限
							newformulaMixtureActive.setMinQuality(FormulaMixtureActive.getMinQuality());
							//名字
							newformulaMixtureActive.setName(FormulaMixtureActive.getName());
							//发生于
							newformulaMixtureActive.setOccurTurn(FormulaMixtureActive.getOccurTurn());
							//工序活动ID
							newformulaMixtureActive.setProcessActiveId(formulaActive);
							//工序隐藏Id
							newformulaMixtureActive.setProcessHiddenId(formulaProcess.getId());
							//表单号
							newformulaMixtureActive.setTableInfoId(formulaProcess.getTableInfoId());
							//表单号
							newformulaMixtureActive.setProcessTableId(formulaProcess.getTableInfoId());
							//物料
							newformulaMixtureActive.setProduct(FormulaMixtureActive.getProduct());
							//保存标识
							newformulaMixtureActive.setSaveFlag(FormulaMixtureActive.getSaveFlag());
							//单位数量
							newformulaMixtureActive.setStandardQuantity(FormulaMixtureActive.getStandardQuantity());
							/*//配料完成后才能执行
							newformulaMixtureActive.setCanExcuteAfterBatch(FormulaMixtureActive.getCanExcuteAfterBatch());
							//准备前确保指令可下达
							newformulaMixtureActive.setCheckBeforePrepare(FormulaMixtureActive.getCheckBeforePrepare());
							//配料时机
							newformulaMixtureActive.setMixTime(FormulaMixtureActive.getMixTime());
							//是否自动下达
							newformulaMixtureActive.setAutoCommit(FormulaMixtureActive.getAutoCommit());
							//配料指令创建人
							newformulaMixtureActive.setBatchStaff(FormulaMixtureActive.getBatchStaff());
							//要求完成时间
							newformulaMixtureActive.setNeedFinishTime(FormulaMixtureActive.getNeedFinishTime());
							//要求完成时长
							newformulaMixtureActive.setNeedFinishDuring(FormulaMixtureActive.getNeedFinishDuring());*/
							//保存配料活动
							formulaMixtureActiveDao.save(newformulaMixtureActive);

							//新建工序活动
							RMFormulaProcessActive processActive = new RMFormulaProcessActive();
							//插入表单编号
							processActive.setTableInfoId(formulaActive.getTableInfoId());
							//损耗率
							processActive.setLossRate(formulaActive.getLossRate());
							//插入工序Id
							processActive.setProcessId(formulaActive.getProcessId());
							//隐藏的工序Id
							processActive.setActiveHiddenId(formulaActive.getId());
							//顺序
							processActive.setSort(refProcessActives.get(i).getSort());
							//配方Id
							processActive.setFormulaId(formulaActive.getFormulaId());
							//是否机动投料
							processActive.setIsAgile(formulaActive.getIsAgile());
							//批控phaseID
							processActive.setBatchPhaseID(formulaActive.getBatchPhaseID());
							//机动行为
							processActive.setIsForTemp(formulaActive.getIsForTemp());
							//是否是复制处理的活动
							processActive.setCopy(formulaActive.getCopy());
							//可用于调整
							processActive.setIsForAdjust(formulaActive.getIsForAdjust());
							//是否其他活动
							processActive.setIsMoreOther(formulaActive.getIsMoreOther());
							//是否放行检验
							processActive.setIsPassCheck(formulaActive.getIsPassCheck());
							/*//配料完成后才能执行
							processActive.setCanExcuteAfterBatch(FormulaMixtureActive.getCanExcuteAfterBatch());
							//准备前确保指令可下达
							processActive.setCheckBeforePrepare(FormulaMixtureActive.getCheckBeforePrepare());
							//配料时机
							processActive.setMixTime(FormulaMixtureActive.getMixTime());
							//是否自动下达
							processActive.setAutoCommit(FormulaMixtureActive.getAutoCommit());
							//配料指令创建人
							processActive.setBatchStaff(FormulaMixtureActive.getBatchStaff());
							//要求完成时间
							processActive.setNeedFinishTime(FormulaMixtureActive.getNeedFinishTime());
							//要求完成时长
							processActive.setNeedFinishDuring(FormulaMixtureActive.getNeedFinishDuring());*/
							//批控活动名称
							processActive.setBatchPhaseName(refProcessActives.get(i).getBatchPhaseName());
							// 隐藏顺序
							processActive.setHiddenSort(FormulaMixtureActive.getHiddenSort());
							// 执行顺序
							processActive.setExecSort(refProcessActives.get(i).getExecSort());
							// 是否是父活动
							processActive.setMainActive(false);
							// 子活动数量
							//processActive.setSubActiveNum(refProcessActives.get(i).getSubActiveNum());
							//从配料活动添加到工序活动
							formulaProcessActiveService.addFromMixtureActive(processActive, newformulaMixtureActive);

							if (formulaActive.getActiveHiddenId() == null) {
								formulaActive.setActiveHiddenId(processActive.getId());
								formulaProcessActiveDao.merge(formulaActive);
							}

						}
					}
				}
			}
		}
		return flag;
	}

	//生成工艺标准
	private void setReferredMixtureStand(List<RMFormulaProcessActive> newFormulaProcesssActive) {

		for (RMFormulaProcessActive newProcesssActiveItem : newFormulaProcesssActive) {
			List<RMPrecessStandards> FormulaPrecessStandards = precessStandardsService.getPrecessStandardss("activeId=" + newProcesssActiveItem.getId(), null);
			for (RMPrecessStandards RMPrecessStandard : FormulaPrecessStandards) {
				RMPrecessStandards newPrecessStand = new RMPrecessStandards();
				//工序活动Id
				newPrecessStand.setActiveId(newProcesssActiveItem);
				//波动扫描间隔(秒)
				newPrecessStand.setFlucInter(RMPrecessStandard.getFlucInter());
				//波动下限
				newPrecessStand.setFlucLowerLimit(RMPrecessStandard.getFlucLowerLimit());
				//波动上限
				newPrecessStand.setFlucUpperLimit(RMPrecessStandard.getFlucUpperLimit());
				//统计波动
				newPrecessStand.setFluctuateFlag(RMPrecessStandard.getFluctuateFlag());
				//扫描间隔（超限）
				newPrecessStand.setLimitInter(RMPrecessStandard.getLimitInter());
				//下下限
				newPrecessStand.setLoweMxLimit(RMPrecessStandard.getLoweMxLimit());
				//下限
				newPrecessStand.setLimitInter(RMPrecessStandard.getLimitInter());
				//上上限
				newPrecessStand.setMaxLimit(RMPrecessStandard.getMaxLimit());
				//统计超限
				newPrecessStand.setOverrunFlag(RMPrecessStandard.getOverrunFlag());
				//工序Id
				newPrecessStand.setProcessId(newProcesssActiveItem.getProcessId());
				//指标
				newPrecessStand.setQuota(RMPrecessStandard.getQuota());
				//标准值
				newPrecessStand.setStValue(RMPrecessStandard.getStValue());
				//上限
				newPrecessStand.setUpperLimit(RMPrecessStandard.getUpperLimit());
				//tableInfoID
				newPrecessStand.setTableInfoId(newProcesssActiveItem.getTableInfoId());
				precessStandardsDao.save(newPrecessStand);
			}
		}

	}

	//过滤配料活动
	private void filterIngredientsActivity(List<RMFormulaProcessActive> processActives) {
		for (int i = 0; i < processActives.size(); i++) {
			if (processActives.get(i).getMixtureId() != null) {//配料活动
				processActives.remove(i);
				i--;
			}
		}
	}

	//从数据库里删除原来的配料活动
	private void deleteIngredientsActivityFromDb(List<RMFormulaProcessActive> processActives) {
		for (RMFormulaProcessActive active : processActives) {
			if (active.getActiveType() != null && "activeType/activeType2".equals(active.getActiveType().getId())) {//配料活动
				//删除工序活动表对应的记录
				formulaProcessActiveDao.delete(active.getId());
				//删除配料表对应的记录
				String hql = "delete from " + RMFormulaMixtureActive.JPA_NAME + " where processHiddenId=:processId";
				formulaMixtureActiveDao.createQuery(hql, "processId", active.getProcessId().getId()).executeUpdate();
			}
		}
	}

	// 不启用批控时复制
	public String copyFormulaProcessActivityWithoutBatch(String processId, String refProcessId) {
		String flag = "";
		//原工序
		RMFormulaProcess formulaProcess = formulaProcessDao.load(Long.valueOf(processId));
		//参照工序
		RMFormulaProcess refFormulaProcess = formulaProcessDao.load(Long.valueOf(refProcessId));

		//原工序不为批控工序，如果参照工序为批控工序，不允许复制
		if(refFormulaProcess.getFormulaId() != null && refFormulaProcess.getFormulaId().getBatchContral()){
			return "原工序不为批控工序，参照工序为批控工序，不允许复制！";
		}

		//获得工序下的所有工序活动，将与批控有对应关系的从这个集合清除，最后没有清除的即被批控删除的工序活动，在MES这边删除
		List<RMFormulaProcessActive> formulaProcessActiveChecks=formulaProcessActiveDao.findByCriteria(Restrictions.eq("processId",formulaProcess), Restrictions.eq("valid", true));
		if(formulaProcessActiveChecks.size()>0){
			for (RMFormulaProcessActive rmFormulaProcessActive : formulaProcessActiveChecks) {
				Boolean activeDeleteflag = formulaProcessService.processActiveDelete(rmFormulaProcessActive.getId());
				if(!activeDeleteflag){
					break;
				}
			}
		}

		if("".equals(flag)){
			List<RMFormulaProcessActive> newFormulaProcesssActive= new ArrayList<RMFormulaProcessActive>();
			//生成工序活动
			flag = setNewProcessActiveWithoutBatch( formulaProcess, refFormulaProcess,newFormulaProcesssActive);
			//生成工艺标准
			setMixtureStand(newFormulaProcesssActive);
		}
		return flag;
	}

	// 复制活动到当前工序活动中
	private String setNewProcessActiveWithoutBatch(RMFormulaProcess formulaProcess, RMFormulaProcess refFormulaProcess, List<RMFormulaProcessActive> newFormulaProcesssActive) {
		String flag = "";

		List<RMFormulaProcessActive> FormulaProcessActives = formulaProcessActiveService.getFormulaProcessActives("processId = " + refFormulaProcess.getId() + " and valid = 1",null);
		for (RMFormulaProcessActive formulaProcessActive : FormulaProcessActives) {
			// 如果不是投配料活动中配料活动
			if (formulaProcessActive.getMixtureId() == null) {
				RMFormulaProcessActive newFormulaActive = new RMFormulaProcessActive();
				newFormulaActive.setUpVersionId(formulaProcessActive.getId());
				// tableinfoId
				newFormulaActive.setTableInfoId(formulaProcess.getTableInfoId());
				// 顺序
				newFormulaActive.setSort(formulaProcessActive.getSort());
				// 隐藏顺序
				newFormulaActive.setHiddenSort(formulaProcessActive.getHiddenSort());
				// 执行顺序
				newFormulaActive.setExecSort(formulaProcessActive.getExecSort());
				// 是否是父活动
				newFormulaActive.setMainActive(formulaProcessActive.getMainActive());
				// 子活动数量
				newFormulaActive.setSubActiveNum(formulaProcessActive.getSubActiveNum());
				// 类型
				newFormulaActive.setActiveType(formulaProcessActive.getActiveType());
				// 自动
				newFormulaActive.setAuto(formulaProcessActive.getAuto());
				// 配于
				newFormulaActive.setBatchSite(formulaProcessActive.getBatchSite());
				// 批控
				newFormulaActive.setBatchPhaseID(formulaProcessActive.getBatchPhaseID());
				// 手工管道
				newFormulaActive.setChannelOrManual(formulaProcessActive.getChannelOrManual());
				// 容器
				newFormulaActive.setContainer(formulaProcessActive.getContainer());
				// 处理表单
				newFormulaActive.setExeBillName(formulaProcessActive.getExeBillName());
				// 处理表单URL
				newFormulaActive.setExeBillUrl(formulaProcessActive.getExeBillUrl());
				// 执行系统
				newFormulaActive.setExeSystem(formulaProcessActive.getExeSystem());
				// 配方隐藏Id
				newFormulaActive.setFormulaHiddenId(formulaProcess.getFormulaId().getId());
				// 配方Id
				newFormulaActive.setFormulaId(formulaProcess.getFormulaId());
				// 来自容器
				newFormulaActive.setFromContainer(formulaProcessActive.getFromContainer());
				// 投配料顺序
				newFormulaActive.setIngredientsOrder(formulaProcessActive.getIngredientsOrder());
				// 固定数量
				newFormulaActive.setIsMixQuality(formulaProcessActive.getIsMixQuality());
				// 顺序
				newFormulaActive.setActOrder(formulaProcessActive.getActOrder());
				// 替代料
				newFormulaActive.setIsReplace(formulaProcessActive.getIsReplace());
				// 工艺检测
				newFormulaActive.setIsWatchActive(formulaProcessActive.getIsWatchActive());
				// 标准时长
				newFormulaActive.setLongTime(formulaProcessActive.getLongTime());
				// 区间上限
				newFormulaActive.setMaxQuality(formulaProcessActive.getMaxQuality());
				// 区间下限
				newFormulaActive.setMinQuality(formulaProcessActive.getMinQuality());
				// 备注
				newFormulaActive.setMeno(formulaProcessActive.getMeno());
				// 活动名称
				newFormulaActive.setName(formulaProcessActive.getName());
				// 发生于
				newFormulaActive.setOccurTurn(formulaProcessActive.getOccurTurn());
				// 工序隐藏Id
				newFormulaActive.setProcessHiddenId(formulaProcess.getId());
				// 工序
				newFormulaActive.setProcessId(formulaProcess);
				// 物料
				newFormulaActive.setProduct(formulaProcessActive.getProduct());
				// 表单号
				newFormulaActive.setProcessTableId(formulaProcess.getTableInfoId());
				// 质量标准
				newFormulaActive.setQualityStandard(formulaProcessActive.getQualityStandard());
				// 检验方案
				newFormulaActive.setTestProduct(formulaProcessActive.getTestProduct());
				// 单位数量
				newFormulaActive.setStandardQuantity(formulaProcessActive.getStandardQuantity());
				// 类型名称
				newFormulaActive.setTypeName(formulaProcessActive.getTypeName());
				// 投料顺序
				newFormulaActive.setActOrder(formulaProcessActive.getActOrder());
				// 损耗率
				newFormulaActive.setLossRate(formulaProcessActive.getLossRate());
				// 配料顺序
				newFormulaActive.setIngredientsOrder(formulaProcessActive.getIngredientsOrder());
				// 完工检验
				newFormulaActive.setFinalInspection(formulaProcessActive.getFinalInspection());
				// 移动端执行
				newFormulaActive.setMobileTerminal(formulaProcessActive.getMobileTerminal());
				// 批控phaseID
				newFormulaActive.setBatchPhaseID(formulaProcessActive.getBatchPhaseID());
				// 批控phasename
				newFormulaActive.setBatchPhaseName(formulaProcessActive.getBatchPhaseName());
				// 质量标准
				newFormulaActive.setQualityStandard(formulaProcessActive.getQualityStandard());
				// 样品模板
				newFormulaActive.setTestProduct(formulaProcessActive.getTestProduct());
				// 采样点
				newFormulaActive.setPickSite(formulaProcessActive.getPickSite());
				// 是否机动投料
				newFormulaActive.setIsAgile(formulaProcessActive.getIsAgile());
				// 机动行为
				newFormulaActive.setIsForTemp(formulaProcessActive.getIsForTemp());
				// 是否是复制处理的活动
				newFormulaActive.setCopy(formulaProcessActive.getCopy());
				// 可用于调整
				newFormulaActive.setIsForAdjust(formulaProcessActive.getIsForAdjust());
				// 是否其他活动
				newFormulaActive.setIsMoreOther(formulaProcessActive.getIsMoreOther());
				// 是否放行检验
				newFormulaActive.setIsPassCheck(formulaProcessActive.getIsPassCheck());
				// 执行顺序
				newFormulaActive.setExecSort(formulaProcessActive.getExecSort());
				newFormulaProcesssActive.add(newFormulaActive);
				formulaProcessActiveDao.save(newFormulaActive);

				// 如果存在配料活动
				List<RMFormulaMixtureActive> FormulaMixtureActives = formulaMixtureActiveService.getFormulaMixtureActives("processActiveId=" + formulaProcessActive.getId(), null);
				if (FormulaMixtureActives.size() > 0) {
					// 遍历配料活动
					for (RMFormulaMixtureActive formulaMixtureActive : FormulaMixtureActives) {
						// 新建配料活动
						RMFormulaMixtureActive newformulaMixtureActive = new RMFormulaMixtureActive();
						// 添加标识
						newformulaMixtureActive.setAddFlag(formulaMixtureActive.getAddFlag());
						// 控制系统执行
						newformulaMixtureActive.setAuto(formulaMixtureActive.getAuto());
						// 损耗率
						newformulaMixtureActive.setLossRate(formulaMixtureActive.getLossRate());
						// 配于
						newformulaMixtureActive.setBatchSite(formulaMixtureActive.getBatchSite());
						// 批控活动ID
						// newformulaMixtureActive.setBatchPhaseID(FormulaMixtureActive.getBatchPhaseID());
						// 手工管道
						newformulaMixtureActive.setChannelOrManual(formulaMixtureActive.getChannelOrManual());
						// 容器
						newformulaMixtureActive.setContainer(formulaMixtureActive.getContainer());
						// 顺序
						newformulaMixtureActive.setSort(formulaMixtureActive.getSort());
						// 顺序
						newformulaMixtureActive.setExecSort(formulaMixtureActive.getExecSort());
						// 隐藏顺序
						newformulaMixtureActive.setHiddenSort(formulaMixtureActive.getHiddenSort());
						// 执行系统
						newformulaMixtureActive.setExeSystem(formulaMixtureActive.getExeSystem());
						// 配方隐藏Id
						newformulaMixtureActive.setFormulaHiddenId(formulaProcess.getFormulaHideId());
						// 类型
						newformulaMixtureActive.setFormulaType(formulaMixtureActive.getFormulaType());
						// 来自容器
						newformulaMixtureActive.setFromContainer(formulaMixtureActive.getFromContainer());
						// 投配料顺序
						newformulaMixtureActive.setIngredientsOrder(formulaMixtureActive.getIngredientsOrder());
						// 固定数量
						newformulaMixtureActive.setIsMixQuality(formulaMixtureActive.getIsMixQuality());
						// 替代料
						newformulaMixtureActive.setIsPlace(formulaMixtureActive.getIsPlace());
						// 是否监视工艺
						newformulaMixtureActive.setIsWatchActive(formulaMixtureActive.getIsWatchActive());
						// 标准时长
						newformulaMixtureActive.setLongTime(formulaMixtureActive.getLongTime());
						// 区间上限
						newformulaMixtureActive.setMaxQuality(formulaMixtureActive.getMaxQuality());
						// 备注
						newformulaMixtureActive.setMeno(formulaMixtureActive.getMeno());
						// 区间下限
						newformulaMixtureActive.setMinQuality(formulaMixtureActive.getMinQuality());
						// 名字
						newformulaMixtureActive.setName(formulaMixtureActive.getName());
						// 发生于
						newformulaMixtureActive.setOccurTurn(formulaMixtureActive.getOccurTurn());
						// 工序活动ID
						newformulaMixtureActive.setProcessActiveId(newFormulaActive);
						// 工序隐藏Id
						newformulaMixtureActive.setProcessHiddenId(formulaProcess.getId());
						// 表单号
						newformulaMixtureActive.setTableInfoId(formulaProcess.getTableInfoId());
						// 表单号
						newformulaMixtureActive.setProcessTableId(formulaProcess.getTableInfoId());
						// 物料
						newformulaMixtureActive.setProduct(formulaMixtureActive.getProduct());
						// 保存标识
						newformulaMixtureActive.setSaveFlag(formulaMixtureActive.getSaveFlag());
						// 单位数量
						newformulaMixtureActive.setStandardQuantity(formulaMixtureActive.getStandardQuantity());
						formulaMixtureActiveDao.save(newformulaMixtureActive);
						// 新建工序活动
						RMFormulaProcessActive processActive = new RMFormulaProcessActive();
						// 插入表单编号
						processActive.setTableInfoId(newFormulaActive.getTableInfoId());
						// 损耗率
						processActive.setLossRate(newFormulaActive.getLossRate());
						// 插入工序Id
						processActive.setProcessId(newFormulaActive.getProcessId());
						// 隐藏的工序Id
						processActive.setActiveHiddenId(newFormulaActive.getId());
						// 顺序
						processActive.setSort(formulaMixtureActive.getSort());
						// 配方Id
						processActive.setFormulaId(newFormulaActive.getFormulaId());
						// 是否机动投料
						processActive.setIsAgile(newFormulaActive.getIsAgile());
						// 批控
						processActive.setBatchPhaseID(newFormulaActive.getBatchPhaseID());
						// 机动行为
						processActive.setIsForTemp(newFormulaActive.getIsForTemp());
						// 是否是复制处理的活动
						processActive.setCopy(newFormulaActive.getCopy());
						// 可用于调整
						processActive.setIsForAdjust(newFormulaActive.getIsForAdjust());
						// 是否其他活动
						processActive.setIsMoreOther(newFormulaActive.getIsMoreOther());
						// 是否放行检验
						processActive.setIsPassCheck(newFormulaActive.getIsPassCheck());
						// 隐藏顺序
						processActive.setHiddenSort(formulaMixtureActive.getHiddenSort());
						// 执行顺序
						processActive.setExecSort(formulaMixtureActive.getExecSort());
						// 是否是父活动
						processActive.setMainActive(false);
						// 子活动数量 配料活动为空
						//newFormulaActive.setSubActiveNum();
						formulaProcessActiveService.addFromMixtureActive(processActive, newformulaMixtureActive);

						if (newFormulaActive.getActiveHiddenId() == null) {
							newFormulaActive.setActiveHiddenId(processActive.getId());
							formulaProcessActiveDao.merge(newFormulaActive);
						}
					}
				}
			}
		}

		return flag;
	}

	/**
	 * 物料替换列表查询接口
	 *
	 * @param productId 物料id
	 * @return 配方列表
	 */
	public List<RMFormula> getProduceReplaceList(List<Param> params, int pageNo, int pageSize) {
		String data = params.get(1).getValue().toString();
		Long productId = -1L;
		String productName = "";
		String codeParam = "";
		try {//循环验证生产线对应的mes中的工厂
			if (data.contains("subconds")) {
				JSONObject sobj = new JSONObject(data);
				String subconds1 = sobj.getString("subconds");
				JSONArray subconds1Arr = new JSONArray(subconds1);
				if (subconds1Arr != null && subconds1Arr.length() > 0) {
					for (int i = 0; i < subconds1Arr.length(); i++) {
						JSONObject subconds1Obj = subconds1Arr.getJSONObject(i);
						String type = subconds1Obj.getString("type");

						if (type != null && "0".equals(type)) {
							codeParam = subconds1Obj.getString("value");
						} else {
							String subconds2 = subconds1Obj.getString("subconds");
							JSONArray subconds2Arr = new JSONArray(subconds2);
							JSONObject productIdObj = subconds2Arr.getJSONObject(0);
							String columnName = productIdObj.getString("columnName");
							if ("PRODUCT_ID".equals(columnName)) {
								productId = productIdObj.getLong("value");
							} else {
								productName = productIdObj.getString("value");
							}
							//log.info(productId.toString());

						}

					}
				}
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}

		//String sql = "select t1.id from rm_formulas t1, rm_formula_process_actives t2 where t2.FORMULA_ID = t1.id and (t2.ACTIVE_TYPE = 'activeType/activeType1' or t2.ACTIVE_TYPE = 'activeType/activeType2') and t2.product = ?";
		String sql="";
		if("ORACLE".equals(formulaDao.getDBType().name())){
			sql = "select * from ( ";
			sql += " select id,rownum RN from( ";
			sql += "select distinct t1.id from rm_formulas t1, rm_formula_process_actives t2 where t2.FORMULA_ID = t1.id and t1.status != 0 and (t2.ACTIVE_TYPE = 'activeType/activeType2') and t2.valid = 1 ";
			if (productId != -1) {
				sql += " and t2.product = " + productId;
			}
			if (productName.length() > 0) {
				sql += " and t2.product in (select t3.PRODUCT_ID from S2BASE_PRODUCT t3 where t3.PRODUCT_NAME like '%" + productName + "%'）";
			}
			if (codeParam.length() > 0) {
				sql += " and t1.code like '%" + codeParam + "%'";
			}
			sql += " order by t1.id desc ) where rownum <= " + pageNo * pageSize + "  order by id desc ) where RN > " + (pageNo - 1) * pageSize + " order by id desc";
		}else{
			sql="select * from ( ";
			sql+=" select id,ROW_NUMBER() OVER(order by aa.id desc) as numer from (";
			sql += "select distinct t1.id from rm_formulas t1, rm_formula_process_actives t2 where t2.FORMULA_ID = t1.id and t1.status != 0 and (t2.ACTIVE_TYPE = 'activeType/activeType2') and t2.valid = 1 ";
			if (productId != -1) {
				sql += " and t2.product = " + productId;
			}
			if (productName.length() > 0) {
				sql += " and t2.product in (select t3.PRODUCT_ID from S2BASE_PRODUCT t3 where t3.PRODUCT_NAME like '%" + productName + "%')";
			}
			if (codeParam.length() > 0) {
				sql += " and t1.code like '%" + codeParam + "%'";
			}
			sql += ") as aa	) as bb where bb.numer <= " + pageNo * pageSize + "and bb.numer>"+ (pageNo - 1) * pageSize+"  order by id desc";
		}
		List<Object[]> formulaIds = formulaDao.createNativeQuery(sql).list();
		if (formulaIds != null && formulaIds.size() > 0) {
			/*String ids = "";
			for(Object formulaId : formulaIds){
				ids += "'" +   formulaId.toString() + "',";
			}
			if(ids.length()>0) {
				ids = ids.substring(0,ids.length()-1);
				String sql2 = "select * from " + RMFormula.TABLE_NAME + " where valid = 1 and id in ( " + ids + " )";
				List<RMFormula> formulas = formulaDao.createNativeQuery(sql2).list();
				return formulas;

			}*/
			List<Long> ids = new ArrayList<Long>();
			for (Object[] formulaId : formulaIds) {
				ids.add(Long.valueOf(formulaId[0].toString()));
			}
			String hql = "select formula from " + RMFormula.JPA_NAME + " formula where status != 0 and id in (:formulaIds) order by id desc";
			Query query = formulaDao.createQuery(hql);
			//List<RMFormula> formulas = query.setParameterList("formulaIds", ids).setFirstResult((pageNo-1)*pageSize).setMaxResults(pageSize).list();
			List<RMFormula> formulas = query.setParameterList("formulaIds", ids).list();
			return formulas;
		}
		return null;
	}

	/**
	 * 物料替换列表查询接口
	 *
	 * @param productId 物料id
	 * @return 配方列表
	 */
	public int getProduceReplaceListCount(List<Param> params, int pageNo, int pageSize) {
		String data = params.get(1).getValue().toString();
		Long productId = -1L;
		String productName = "";
		String codeParam = "";
		try {//循环验证生产线对应的mes中的工厂
			if (data.contains("subconds")) {
				JSONObject sobj = new JSONObject(data);
				String subconds1 = sobj.getString("subconds");
				JSONArray subconds1Arr = new JSONArray(subconds1);
				if (subconds1Arr != null && subconds1Arr.length() > 0) {
					for (int i = 0; i < subconds1Arr.length(); i++) {
						JSONObject subconds1Obj = subconds1Arr.getJSONObject(i);
						String type = subconds1Obj.getString("type");

						if (type != null && "0".equals(type)) {
							codeParam = subconds1Obj.getString("value");
						} else {
							String subconds2 = subconds1Obj.getString("subconds");
							JSONArray subconds2Arr = new JSONArray(subconds2);
							JSONObject productIdObj = subconds2Arr.getJSONObject(0);
							String columnName = productIdObj.getString("columnName");
							if ("PRODUCT_ID".equals(columnName)) {
								productId = productIdObj.getLong("value");
							} else {
								productName = productIdObj.getString("value");
							}
							//log.info(productId.toString());

						}

					}
				}
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}

		String sql ="";
		sql += "select distinct t1.id from rm_formulas t1, rm_formula_process_actives t2 where t2.FORMULA_ID = t1.id and t1.status != 0 and (t2.ACTIVE_TYPE = 'activeType/activeType2') and t2.valid = 1 ";
		if (productId != -1) {
			sql += " and t2.product = " + productId;
		}
		if (productName.length() > 0) {
			sql += " and t2.product in (select t3.PRODUCT_ID from S2BASE_PRODUCT t3 where t3.PRODUCT_NAME like '%" + productName + "%')";
		}
		if (codeParam.length() > 0) {
			sql += " and t1.code like '%" + codeParam + "%'";
		}
		//sql += " )";
		int count=0;
		count=formulaDao.createNativeQuery(sql).list().size();
		return count;
	}

	@Override
	@AuditLog(entity = "RM_7.5.0.0_formula", model = "RM_7.5.0.0_formula_Formula", desc = "超级编辑", operType = "4")
	public void saveSuperEditFormulaCustom(RMFormula formula, WorkFlowVar workFlowVar, Map<String, String> dgLists, Map<String, String> dgDeleteIDs, Map<String, Object> assFileUploads, String viewCode) {
		String entityCode = "RM_7.5.0.0_formula";
		List<Event> events = null;
		View view = null;
		if (viewCode != null) {
			view = viewServiceFoundation.getView(viewCode);
			events = eventService.getEventsByView(view);
		}
		//saveSingleSuperEditFormula(workFlowVar, dgLists, dgDeleteIDs, assFileUploads, view, entityCode, events, formula);
		dealDatagridsSaveCustom(formula, view.getCode(), dgLists, dgDeleteIDs, assFileUploads);
	}

	private void dealDatagridsSaveCustom(RMFormula formula, String viewCode, Map<String, String> dgLists, Map<String, String> dgDeleteIDs, Map<String, Object> assFileUploads) {
		if (dgLists == null && dgDeleteIDs == null) {
			return;
		}
		List<DataGrid> dgs = findDatagrids();
		if (dgs != null && dgs.size() > 0) {
			formulaDao.flush();
			Class _reflect_thisclass = this.getClass();
			try {
				//先删工序-工作单元表，再删配方-生产线表
				if (dgDeleteIDs != null && dgDeleteIDs.get("dg1515465493030") != null) {
					ArrayList<Long> param = new ArrayList<Long>();
					String[] arrs = dgDeleteIDs.get("dg1515465493030").split(",");
					for (int i = 0; i < arrs.length; i++) {
						param.add(Long.valueOf(arrs[i]));
					}
					processUnitService.deleteProcessUnit(param, "noEvent");
				}
				if (dgDeleteIDs != null && dgDeleteIDs.get("dg1515461411247") != null) {
					ArrayList<Long> param = new ArrayList<Long>();
					String[] arrs = dgDeleteIDs.get("dg1515461411247").split(",");
					for (int i = 0; i < arrs.length; i++) {
						param.add(Long.valueOf(arrs[i]));
					}
					lineFormulaService.deleteLineFormula(param, "noEvent");
				}

				for (DataGrid dg : dgs) {
					Class _reflect_dgclass = Class.forName("com.supcon.orchid.RM.entities." + dg.getTargetModel().getJpaName());
					java.lang.reflect.Field _reflect_serviceField = _reflect_thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName()) + "Service");
					Class _reflect_serviceType = _reflect_serviceField.getType();
					Object _reflect_serviceObj = _reflect_serviceField.get(this);
					Model _targetModel = dg.getTargetModel();
					List<Long> _needDealIds = new ArrayList<>();
					Map<String, Long> _dgCodeMap = new HashMap<String, Long>();
					boolean isTree = (_targetModel.getDataType() == 2);
					List<String> _attachKey = new ArrayList<String>();
					Map _confMap = dg.getConfigMap();
					Map _layoutMap = (Map) _confMap.get("layout");
					List<Map> ls = (List<Map>) _layoutMap.get("sections");
					for (Map lm : ls) {
						if (lm.get("regionType").equals("DATAGRID")) {
							List<Map> lc = (List<Map>) lm.get("cells");
							for (Map lk : lc) {
								if ("PROPERTYATTACHMENT".equals(lk.get("columnType")) && lk.get("key") != null) {
									_attachKey.add(lk.get("key").toString());
								}
							}
						}
					}
					boolean hasAttach = (_attachKey.size() > 0);
					if (null == assFileUploads) {
						assFileUploads = new HashMap<String, Object>();
					}
					if (hasAttach && assFileUploads.get("staffId") == null) {
						assFileUploads.put("staffId", ((OrchidAuthenticationToken) SecurityContextHolder.getContext().getAuthentication()).getStaff().getId());
					}
					Map<String, Object> dgAttachMap = (Map<String, Object>) assFileUploads.get(dg.getName());
					if (hasAttach) {
						if (null == dgAttachMap) {
							dgAttachMap = new HashMap<String, Object>();
						}
						for (String key : _attachKey) {
							dgAttachMap.put(key + "_propertyCode", _reflect_dgclass.getDeclaredField(key.toUpperCase() + "_PROPERTY_CODE").get(null));
						}
						dgAttachMap.put("type", _reflect_dgclass.getDeclaredField("DOC_TYPE").get(null));
					}
					/*if(dgDeleteIDs!=null&&dgDeleteIDs.get(dg.getName())!=null){
						ArrayList<Long> param=new ArrayList<Long>();
						String[] arrs=dgDeleteIDs.get(dg.getName()).split(",");
						for(int i=0;i<arrs.length;i++){
							param.add(Long.valueOf(arrs[i]));
						}
						if(hasAttach){
							dgAttachMap.put("deleteIds",param);
						}
						_reflect_serviceType.getDeclaredMethod("delete"+_targetModel.getModelName(),List.class,String.class).invoke(_reflect_serviceObj,param,"noEvent");
					}*/
					if (dgLists != null && dgLists.get(dg.getName()) != null) {
						if (isTree) {
							_needDealIds.clear();
							_dgCodeMap.clear();
						}
						List dglist = (List) com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()), _reflect_dgclass, formulaDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod = _reflect_dgclass.getMethod("set" + fLTU(dg.getOrgProperty().getName()), RMFormula.class);


						java.lang.reflect.Method _reflect_saveMethod = _reflect_serviceType.getMethod("save" + _targetModel.getModelName(), _reflect_dgclass, Map.class, Map.class, Map.class, String.class, String.class, boolean[].class);
						if (dg.getName().equals("dg1515465493030")) {//直接commit配方-产线表，之后工序-单元表要用
							_reflect_saveMethod = _reflect_serviceType.getMethod("customSave" + _targetModel.getModelName(), _reflect_dgclass, Map.class, Map.class, Map.class, String.class, String.class, boolean[].class);
						}

						for (Object odg : dglist) {
							_reflect_setMethod.invoke(odg, formula);
							Map<String, Object> paramMap = new HashMap<String, Object>();
							if (hasAttach) {
								for (String key : _attachKey) {
									String fileAddPath = (String) _reflect_dgclass.getDeclaredMethod("get" + fLTU(key) + "FileAddPaths", null).invoke(odg, null);
									if (fileAddPath != null && fileAddPath.length() > 0) {
										paramMap.put(key + "_fileAddPaths", fileAddPath);
									}
									String fileDeleteIds = (String) _reflect_dgclass.getDeclaredMethod("get" + fLTU(key) + "FileDeleteIds", null).invoke(odg, null);
									if (fileDeleteIds != null && fileDeleteIds.length() > 0) {
										paramMap.put(key + "_fileDeleteIds", fileDeleteIds);
									}
								}
							}
							//if(isTree){
							//	((com.supcon.orchid.orm.entities.AbstractEcTreeEntity)odg).setTableInfoId(formula.getTableInfoId());
							//}else{
							//	((com.supcon.orchid.orm.entities.AbstractEcPartEntity)odg).setTableInfoId(formula.getTableInfoId());
							//}
							if (isTree) {
								String ppCode = ((com.supcon.orchid.tree.AbstractCidTreeNode) odg).getVirtualParentCode();
								if (null != ppCode && ppCode.indexOf("x") > -1) {
									if (_dgCodeMap.containsKey(ppCode)) {
										((com.supcon.orchid.tree.AbstractCidTreeNode) odg).setParentId(_dgCodeMap.get(ppCode));
									}
								} else if (null != ppCode && !ppCode.isEmpty()) {
									((com.supcon.orchid.tree.AbstractCidTreeNode) odg).setParentId(Long.parseLong(ppCode));
								}
							}
							_reflect_saveMethod.invoke(_reflect_serviceObj, odg, null, null, null, viewCode, "noEvent", new boolean[]{});
							if (isTree) {
								_needDealIds.add(((com.supcon.orchid.tree.AbstractCidTreeNode) odg).getId());
								String pCode = ((com.supcon.orchid.tree.AbstractCidTreeNode) odg).getVirtualCode();
								if (!_dgCodeMap.containsKey(pCode)) {
									_dgCodeMap.put(pCode, ((com.supcon.orchid.tree.AbstractCidTreeNode) odg).getId());
								}
							}
							if (!paramMap.isEmpty()) {
								paramMap.put("linkId", ((com.supcon.orchid.orm.entities.IdEntity) odg).getId());
								paramMap.put("mainModelId", formula.getTableInfoId());
								dgAttachMap.put(((com.supcon.orchid.orm.entities.IdEntity) odg).getId().toString(), paramMap);
							}
						}
						if (isTree) {
							_reflect_serviceType.getMethod("deal" + _targetModel.getModelName() + "Leaf", List.class).invoke(_reflect_serviceObj, _needDealIds);
						}

						/*if(dg.getName().equals("dg1515461411247")){//直接commit配方-产线表，之后工序-单元表要用
							lineFormulaDao.flush();
							lineFormulaDao.clear();
						}*/
					}
					if (hasAttach) {
						if (null != dgAttachMap && !dgAttachMap.isEmpty()) {
							assFileUploads.put(dg.getName(), dgAttachMap);
						}
					}
				}
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				if (e instanceof InvocationTargetException) {
					InvocationTargetException iteException = (InvocationTargetException) e;
					if (iteException.getTargetException() != null) {
						Throwable throwable = iteException.getTargetException();
						if (throwable instanceof BAPException) {
							throw (BAPException) throwable;
						} else {
							throw new BAPException(throwable.getMessage() != null ? throwable.getMessage() : InternationalResource.get("foundation.error.message", getCurrentLanguage()));
						}
					}
				}
				throw new BAPException(InternationalResource.get("foundation.error.message", getCurrentLanguage()));
			}
		}
	}

	//获取生产线配方表的nextId
	@Override
	public long getForLineFormulaNextId() {
		//long nextId = autoGeneratorID.getNextId(RMForLineFormula.TABLE_NAME,1,"id");
		long nextId = 1000;
		String sql = "select id from " + RMForLineFormula.TABLE_NAME + " order by id desc";
		List<Object> list = formulaDao.createNativeQuery(sql).list();
		if (list != null && list.size() > 0) {
			nextId = Long.valueOf(list.get(0).toString()).longValue() + 1;
		}
		return nextId;
	}

	// 获取指定物品对应的配方最大版本号
	@Override
	public BigDecimal getLatestFormulaEdition(Long productId){
		// 倒序获取edition
		String findBiggestEditionSql = "select edition from RM_FORMULAS where product = ? and status <> 0 order by edition desc";
		List<Object> editions = formulaDao.createNativeQuery(findBiggestEditionSql, productId).list();
		BigDecimal latestEdition = null;
		if (editions.size() > 0) {
			// 获取倒序的第一个值，即最大值
			latestEdition = new BigDecimal(editions.get(0).toString());
		}
		return latestEdition;
	}

	// 执行复制配方的标记
	private boolean isCopy = false;
	// 保存前的批控配方ID
	private String beforeBatchFormulaId;

	/***
	 * 根据工序id和formuid保存执行顺序
	 * @param processId
	 * @param formulaId
	 * @param procSort
	 */
	@Override
	public void saveProcSort(Long processId,Long formulaId,String procSort){
		RMFormulaProcess formulaProcess = formulaProcessDao.load(processId);
		//找到配方相同，执行顺序相同的有效工序记录
		List<RMFormulaProcess> processList = formulaProcessDao.findByCriteria(Restrictions.eq("formulaId.id",formulaId),Restrictions.eq("procSort",procSort),Restrictions.eq("valid",true));
		if(processList.size()>0 && processList.size()<0 ){
			//执行顺序暂时不需要重复性验证
			throw  new BAPException("工序设置的执行顺序重复，请重新设置！");
		}else{
			formulaProcess.setProcSort(procSort);
			formulaProcessDao.merge(formulaProcess);
			formulaProcessDao.flush();
			formulaProcessDao.clear();
		}

	}
/* CUSTOM CODE END */
}
