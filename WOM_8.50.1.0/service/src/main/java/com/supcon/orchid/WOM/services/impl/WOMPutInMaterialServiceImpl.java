package com.supcon.orchid.WOM.services.impl;
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
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialImportService;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialDealInfo;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialSupervision;
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
import com.supcon.orchid.WOM.entities.WOMPutInMaterialSupervision;
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
import com.supcon.orchid.WOM.entities.WOMQualityInspect;
import com.supcon.orchid.WOM.daos.WOMQualityInspectDao;
import com.supcon.orchid.WOM.services.WOMQualityInspectService;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.daos.WOMDayBatchPlanInfoDao;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanInfoService;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.daos.WOMDayBatchPlanPartsDao;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanPartsService;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.daos.WOMCheckManageDao;
import com.supcon.orchid.WOM.services.WOMCheckManageService;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.daos.WOMInspectDao;
import com.supcon.orchid.WOM.services.WOMInspectService;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.daos.WOMProduceTaskManageDao;
import com.supcon.orchid.WOM.services.WOMProduceTaskManageService;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.daos.WOMPutInManageDao;
import com.supcon.orchid.WOM.services.WOMPutInManageService;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.daos.WOMTaskReportManageDao;
import com.supcon.orchid.WOM.services.WOMTaskReportManageService;
import com.supcon.orchid.WOM.entities.WOMBatchCharge;
import com.supcon.orchid.WOM.daos.WOMBatchChargeDao;
import com.supcon.orchid.WOM.services.WOMBatchChargeService;
import com.supcon.orchid.WOM.entities.WOMCraftRecords;
import com.supcon.orchid.WOM.daos.WOMCraftRecordsDao;
import com.supcon.orchid.WOM.services.WOMCraftRecordsService;
import com.supcon.orchid.WOM.entities.WOMCraftStandards;
import com.supcon.orchid.WOM.daos.WOMCraftStandardsDao;
import com.supcon.orchid.WOM.services.WOMCraftStandardsService;
import com.supcon.orchid.WOM.entities.WOMProcFeedbackHead;
import com.supcon.orchid.WOM.daos.WOMProcFeedbackHeadDao;
import com.supcon.orchid.WOM.services.WOMProcFeedbackHeadService;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.daos.WOMStandingcropRefDao;
import com.supcon.orchid.WOM.services.WOMStandingcropRefService;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.daos.WOMTaskReportingDao;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.WOM.daos.WOMTaskReportingPartDao;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartService;
import com.supcon.orchid.WOM.entities.WOMMaterialsOutput;
import com.supcon.orchid.WOM.daos.WOMMaterialsOutputDao;
import com.supcon.orchid.WOM.services.WOMMaterialsOutputService;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.WOM.daos.WOMProActAndBatStateDao;
import com.supcon.orchid.WOM.services.WOMProActAndBatStateService;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialDao;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialService;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialPartDao;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;
import com.supcon.orchid.WOM.entities.WOMBatchingRejectParts;
import com.supcon.orchid.WOM.daos.WOMBatchingRejectPartsDao;
import com.supcon.orchid.WOM.services.WOMBatchingRejectPartsService;
import com.supcon.orchid.WOM.entities.WOMRejectReason;
import com.supcon.orchid.WOM.daos.WOMRejectReasonDao;
import com.supcon.orchid.WOM.services.WOMRejectReasonService;
import com.supcon.orchid.WOM.entities.WOMBatchTrace;
import com.supcon.orchid.WOM.daos.WOMBatchTraceDao;
import com.supcon.orchid.WOM.services.WOMBatchTraceService;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempHead;
import com.supcon.orchid.WOM.daos.WOMAdjustOrTempHeadDao;
import com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempRecords;
import com.supcon.orchid.WOM.daos.WOMAdjustOrTempRecordsDao;
import com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService;
import com.supcon.orchid.WOM.entities.WOMBatchChargeDetails;
import com.supcon.orchid.WOM.daos.WOMBatchChargeDetailsDao;
import com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.daos.WOMBatchPhaseExelogDao;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.daos.WOMProdTaskActiExelogDao;
import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.daos.WOMProdTaskProcExelogDao;
import com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.daos.WOMProduceMaterialSumDao;
import com.supcon.orchid.WOM.services.WOMProduceMaterialSumService;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.daos.WOMProduceTaskDao;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.daos.WOMProduceTaskActiveDao;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveService;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.daos.WOMProduceTaskProcessDao;
import com.supcon.orchid.WOM.services.WOMProduceTaskProcessService;
import com.supcon.orchid.WOM.entities.WOMProductNumIndex;
import com.supcon.orchid.WOM.daos.WOMProductNumIndexDao;
import com.supcon.orchid.WOM.services.WOMProductNumIndexService;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.daos.WOMWaitPutinRecordsDao;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.daos.WOMPrepareMaterialDao;
import com.supcon.orchid.WOM.services.WOMPrepareMaterialService;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.daos.WOMPrepareMaterialPartDao;
import com.supcon.orchid.WOM.services.WOMPrepareMaterialPartService;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.daos.WOMPutMaterialExceptionDao;
import com.supcon.orchid.WOM.services.WOMPutMaterialExceptionService;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.daos.WOMBatchNumRuleDao;
import com.supcon.orchid.WOM.services.WOMBatchNumRuleService;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialNeedDao;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialNeedService;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.daos.WOMMakeBatOrderHeadDao;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderHeadService;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.daos.WOMMakeBatOrderPartDao;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderPartService;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialDao;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialPartDao;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
import com.supcon.orchid.WOM.entities.WOMManulOrderMain;
import com.supcon.orchid.WOM.daos.WOMManulOrderMainDao;
import com.supcon.orchid.WOM.services.WOMManulOrderMainService;
import com.supcon.orchid.WOM.entities.WOMManulOrderMaterial;
import com.supcon.orchid.WOM.daos.WOMManulOrderMaterialDao;
import com.supcon.orchid.WOM.services.WOMManulOrderMaterialService;
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.daos.WOMActiveExelogDao;
import com.supcon.orchid.WOM.services.WOMActiveExelogService;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.daos.WOMBatchProdTaskPartDao;
import com.supcon.orchid.WOM.services.WOMBatchProdTaskPartService;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.daos.WOMBatchProduceTaskDao;
import com.supcon.orchid.WOM.services.WOMBatchProduceTaskService;
import com.supcon.orchid.WOM.entities.WOMInventoryDetail;
import com.supcon.orchid.WOM.daos.WOMInventoryDetailDao;
import com.supcon.orchid.WOM.services.WOMInventoryDetailService;
import com.supcon.orchid.WOM.entities.WOMInventoryRecord;
import com.supcon.orchid.WOM.daos.WOMInventoryRecordDao;
import com.supcon.orchid.WOM.services.WOMInventoryRecordService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempRecords;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.foundation.entities.Staff;
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
import com.supcon.orchid.WOM.daos.impl.WOMPutInMaterialDaoImpl;
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
/* CUSTOM CODE START(serviceimpl,import,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.services.MESBasicStoreSetService;
import com.supcon.orchid.MESBasic.services.MESBasicWareService;
import com.supcon.orchid.MESBasic.services.MaterialService;
import com.supcon.orchid.services.ConsulService;
import com.supcon.orchid.publicSet.entities.PublicSetBatchDeal;
import com.supcon.orchid.publicSet.entities.PublicSetBatchRelate;
import com.supcon.orchid.publicSet.entities.PublicSetWorkflowState;
import com.supcon.orchid.publicSet.services.PublicSetBatchDealService;
import com.supcon.orchid.publicSet.services.PublicSetBatchRelateService;
import com.supcon.orchid.publicSet.services.PublicSetWorkflowStateService;
import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.foundation.entities.Position;
import com.supcon.orchid.publicSet.services.WomMaterialService;
import com.supcon.orchid.RM.services.RMFormulaService;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import com.supcon.orchid.ec.utils.JSONUtil;
import java.text.SimpleDateFormat;

import com.google.gson.Gson;
/* CUSTOM CODE END */

@Service("wOM_putInMaterialService")
@Transactional
public class WOMPutInMaterialServiceImpl  extends BaseServiceImpl<WOMPutInMaterial> implements WOMPutInMaterialService,IScriptService, InitializingBean, DisposableBean {
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
	private WOMQualityInspectDao qualityInspectDao;
	@Autowired
	private WOMQualityInspectService qualityInspectService;
	@Autowired
	private WOMDayBatchPlanInfoDao dayBatchPlanInfoDao;
	@Autowired
	private WOMDayBatchPlanInfoService dayBatchPlanInfoService;
	@Autowired
	private WOMDayBatchPlanPartsDao dayBatchPlanPartsDao;
	@Autowired
	private WOMDayBatchPlanPartsService dayBatchPlanPartsService;
	@Autowired
	private WOMCheckManageDao checkManageDao;
	@Autowired
	private WOMCheckManageService checkManageService;
	@Autowired
	private WOMInspectDao inspectDao;
	@Autowired
	private WOMInspectService inspectService;
	@Autowired
	private WOMProduceTaskManageDao produceTaskManageDao;
	@Autowired
	private WOMProduceTaskManageService produceTaskManageService;
	@Autowired
	private WOMPutInManageDao putInManageDao;
	@Autowired
	private WOMPutInManageService putInManageService;
	@Autowired
	private WOMTaskReportManageDao taskReportManageDao;
	@Autowired
	private WOMTaskReportManageService taskReportManageService;
	@Autowired
	private WOMBatchChargeDao batchChargeDao;
	@Autowired
	private WOMBatchChargeService batchChargeService;
	@Autowired
	private WOMCraftRecordsDao craftRecordsDao;
	@Autowired
	private WOMCraftRecordsService craftRecordsService;
	@Autowired
	private WOMCraftStandardsDao craftStandardsDao;
	@Autowired
	private WOMCraftStandardsService craftStandardsService;
	@Autowired
	private WOMProcFeedbackHeadDao procFeedbackHeadDao;
	@Autowired
	private WOMProcFeedbackHeadService procFeedbackHeadService;
	@Autowired
	private WOMStandingcropRefDao standingcropRefDao;
	@Autowired
	private WOMStandingcropRefService standingcropRefService;
	@Autowired
	private WOMTaskReportingDao taskReportingDao;
	@Autowired
	private WOMTaskReportingService taskReportingService;
	@Autowired
	private WOMTaskReportingPartDao taskReportingPartDao;
	@Autowired
	private WOMTaskReportingPartService taskReportingPartService;
	@Autowired
	private WOMMaterialsOutputDao materialsOutputDao;
	@Autowired
	private WOMMaterialsOutputService materialsOutputService;
	@Autowired
	private WOMProActAndBatStateDao proActAndBatStateDao;
	@Autowired
	private WOMProActAndBatStateService proActAndBatStateService;
	@Autowired
	private WOMBatchingMaterialDao batchingMaterialDao;
	@Autowired
	private WOMBatchingMaterialService batchingMaterialService;
	@Autowired
	private WOMBatchingMaterialPartDao batchingMaterialPartDao;
	@Autowired
	private WOMBatchingMaterialPartService batchingMaterialPartService;
	@Autowired
	private WOMBatchingRejectPartsDao batchingRejectPartsDao;
	@Autowired
	private WOMBatchingRejectPartsService batchingRejectPartsService;
	@Autowired
	private WOMRejectReasonDao rejectReasonDao;
	@Autowired
	private WOMRejectReasonService rejectReasonService;
	@Autowired
	private WOMBatchTraceDao batchTraceDao;
	@Autowired
	private WOMBatchTraceService batchTraceService;
	@Autowired
	private WOMAdjustOrTempHeadDao adjustOrTempHeadDao;
	@Autowired
	private WOMAdjustOrTempHeadService adjustOrTempHeadService;
	@Autowired
	private WOMAdjustOrTempRecordsDao adjustOrTempRecordsDao;
	@Autowired
	private WOMAdjustOrTempRecordsService adjustOrTempRecordsService;
	@Autowired
	private WOMBatchChargeDetailsDao batchChargeDetailsDao;
	@Autowired
	private WOMBatchChargeDetailsService batchChargeDetailsService;
	@Autowired
	private WOMBatchPhaseExelogDao batchPhaseExelogDao;
	@Autowired
	private WOMBatchPhaseExelogService batchPhaseExelogService;
	@Autowired
	private WOMProdTaskActiExelogDao prodTaskActiExelogDao;
	@Autowired
	private WOMProdTaskActiExelogService prodTaskActiExelogService;
	@Autowired
	private WOMProdTaskProcExelogDao prodTaskProcExelogDao;
	@Autowired
	private WOMProdTaskProcExelogService prodTaskProcExelogService;
	@Autowired
	private WOMProduceMaterialSumDao produceMaterialSumDao;
	@Autowired
	private WOMProduceMaterialSumService produceMaterialSumService;
	@Autowired
	private WOMProduceTaskDao produceTaskDao;
	@Autowired
	private WOMProduceTaskService produceTaskService;
	@Autowired
	private WOMProduceTaskActiveDao produceTaskActiveDao;
	@Autowired
	private WOMProduceTaskActiveService produceTaskActiveService;
	@Autowired
	private WOMProduceTaskProcessDao produceTaskProcessDao;
	@Autowired
	private WOMProduceTaskProcessService produceTaskProcessService;
	@Autowired
	private WOMProductNumIndexDao productNumIndexDao;
	@Autowired
	private WOMProductNumIndexService productNumIndexService;
	@Autowired
	private WOMWaitPutinRecordsDao waitPutinRecordsDao;
	@Autowired
	private WOMWaitPutinRecordsService waitPutinRecordsService;
	@Autowired
	private WOMPrepareMaterialDao prepareMaterialDao;
	@Autowired
	private WOMPrepareMaterialService prepareMaterialService;
	@Autowired
	private WOMPrepareMaterialPartDao prepareMaterialPartDao;
	@Autowired
	private WOMPrepareMaterialPartService prepareMaterialPartService;
	@Autowired
	private WOMPutMaterialExceptionDao putMaterialExceptionDao;
	@Autowired
	private WOMPutMaterialExceptionService putMaterialExceptionService;
	@Autowired
	private WOMBatchNumRuleDao batchNumRuleDao;
	@Autowired
	private WOMBatchNumRuleService batchNumRuleService;
	@Autowired
	private WOMBatchingMaterialNeedDao batchingMaterialNeedDao;
	@Autowired
	private WOMBatchingMaterialNeedService batchingMaterialNeedService;
	@Autowired
	private WOMMakeBatOrderHeadDao makeBatOrderHeadDao;
	@Autowired
	private WOMMakeBatOrderHeadService makeBatOrderHeadService;
	@Autowired
	private WOMMakeBatOrderPartDao makeBatOrderPartDao;
	@Autowired
	private WOMMakeBatOrderPartService makeBatOrderPartService;
	@Autowired
	private WOMPutInMaterialDao putInMaterialDao;
	@Autowired
	private WOMPutInMaterialPartDao putInMaterialPartDao;
	@Autowired
	private WOMPutInMaterialPartService putInMaterialPartService;
	@Autowired
	private WOMManulOrderMainDao manulOrderMainDao;
	@Autowired
	private WOMManulOrderMainService manulOrderMainService;
	@Autowired
	private WOMManulOrderMaterialDao manulOrderMaterialDao;
	@Autowired
	private WOMManulOrderMaterialService manulOrderMaterialService;
	@Autowired
	private WOMActiveExelogDao activeExelogDao;
	@Autowired
	private WOMActiveExelogService activeExelogService;
	@Autowired
	private WOMBatchProdTaskPartDao batchProdTaskPartDao;
	@Autowired
	private WOMBatchProdTaskPartService batchProdTaskPartService;
	@Autowired
	private WOMBatchProduceTaskDao batchProduceTaskDao;
	@Autowired
	private WOMBatchProduceTaskService batchProduceTaskService;
	@Autowired
	private WOMInventoryDetailDao inventoryDetailDao;
	@Autowired
	private WOMInventoryDetailService inventoryDetailService;
	@Autowired
	private WOMInventoryRecordDao inventoryRecordDao;
	@Autowired
	private WOMInventoryRecordService inventoryRecordService;
	
	@Value("${bap.recall.remain.time}")
	private int recallRemainTime = 60;

	@Autowired
	private InstanceService instanceService;
	@Resource
	private TransitionService transitionService;
	
	@Autowired
	private TaskService taskService;
	@Autowired
	private WOMPutInMaterialVariablesProvider variablesProvider;
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
	@Autowired
	private CreatorService creatorService;
	@Autowired
	private BundleContext bundleContext;
	@Autowired
	private SynchronizeInfoService synchronizeInfoService;
	@Autowired
	private ModelServiceFoundation modelServiceFoundation;
	@Resource
	private IBAPBaseService<WOMPutInMaterial> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private WOMPutInMaterialImportService putInMaterialImportService;
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + WOMPutInMaterial.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)"  + "and VALID = 1";
		Query query =  putInMaterialDao.createQuery(hql);
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
			String hql = "select " + businessKeyName + ",id from " + WOMPutInMaterial.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = putInMaterialDao.createQuery(hql);
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
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + WOMPutInMaterial.JPA_NAME + " where " + mainDisplayName + " in (:serial)";
		}else if(queryParam!=null && queryParam.equals("bk")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + WOMPutInMaterial.JPA_NAME + " where " + businessKeyName + " in (:serial)";
		}
		Query query =  putInMaterialDao.createQuery(hql);
		query.setParameterList("serial", serial);
		List<Object[]> list = query.list();
		/*String sql = null;
		if(queryParam!=null && queryParam.equals("md")){
			sql = "select * from " + WOMPutInMaterial.TABLE_NAME + " where " + mainDisplayName + " = ?";
		}else if(queryParam!=null && queryParam.equals("bk")){
			sql = "select * from " + WOMPutInMaterial.TABLE_NAME + " where " + businessKeyName + " = ?";
		}
		List<WOMPutInMaterial> list = (List<WOMPutInMaterial>) putInMaterialDao.createNativeQuery(sql,serial.get(0)).list();
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
	public WOMPutInMaterial getPutInMaterial(long id){
		return getPutInMaterial(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMPutInMaterial getPutInMaterial(long id, String viewCode){
		WOMPutInMaterial putInMaterial = putInMaterialDao.load(id);

		// 一对多情况处理
		if(putInMaterial != null){
			this.setHeadIdTaskProcessId(putInMaterial, viewCode);
			this.setHeadIdAdjustActive(putInMaterial, viewCode);
			this.setHeadIdTaskID(putInMaterial, viewCode);
			this.setHeadIdWareID(putInMaterial, viewCode);
			this.setHeadIdFormluActive(putInMaterial, viewCode);
			this.setHeadIdTaskActiveId(putInMaterial, viewCode);
			this.setHeadIdStoreID(putInMaterial, viewCode);
			this.setHeadIdFactoryId(putInMaterial, viewCode);
			this.setHeadIdProductId(putInMaterial, viewCode);
			this.setHeadIdProBatch(putInMaterial, viewCode);
			this.setHeadIdPutinStaff(putInMaterial, viewCode);
			this.setSupervision(putInMaterial);
		}
		return putInMaterial;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getPutInMaterialAsJSON(long id, String include){
		WOMPutInMaterial putInMaterial = putInMaterialDao.load(id);
		// 一对多情况处理
			this.setHeadIdTaskProcessId(putInMaterial);
			this.setHeadIdAdjustActive(putInMaterial);
			this.setHeadIdTaskID(putInMaterial);
			this.setHeadIdWareID(putInMaterial);
			this.setHeadIdFormluActive(putInMaterial);
			this.setHeadIdTaskActiveId(putInMaterial);
			this.setHeadIdStoreID(putInMaterial);
			this.setHeadIdFactoryId(putInMaterial);
			this.setHeadIdProductId(putInMaterial);
			this.setHeadIdProBatch(putInMaterial);
			this.setHeadIdPutinStaff(putInMaterial);
			this.dealSupervision(putInMaterial);

		if(putInMaterial == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(putInMaterial, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.delete",operType="3")
	public void deletePutInMaterial(WOMPutInMaterial putInMaterial){
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		beforeDeletePutInMaterial(putInMaterial);
		putInMaterialDao.delete(putInMaterial);
		afterDeletePutInMaterial(putInMaterial);
		putInMaterialDao.flush();
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		params.add(putInMaterial);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
		delIds = putInMaterial.getHeadIdTaskProcessIdmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("taskProcessId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdAdjustActivemultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("adjustActive.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdTaskIDmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("taskID.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdWareIDmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("wareID.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdFormluActivemultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("formluActive.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdTaskActiveIdmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("taskActiveId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdStoreIDmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("storeID.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdFactoryIdmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdProductIdmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdProBatchmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("proBatch.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		delIds = putInMaterial.getHeadIdPutinStaffmultiselectIDs();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("putinStaff.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
			// TODO delete
			// this.dealSupervision(putInMaterial);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.delete",operType="3")
	public void deletePutInMaterial(List<Long> putInMaterialIds){
		deletePutInMaterial(putInMaterialIds, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.delete",operType="3")
	public void deletePutInMaterial(List<Long> putInMaterialIds, String eventTopic) {
		List<WOMPutInMaterial> putInMaterials = new ArrayList<WOMPutInMaterial>();
		for(Long putInMaterialId : putInMaterialIds){
			WOMPutInMaterial putInMaterial = getPutInMaterial(putInMaterialId);
			putInMaterials.add(putInMaterial);
			if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(AuditUtil.getColumnStringA() + (null == putInMaterial.getId() ? "" : "," + putInMaterial.getId().toString()));
				} else {
					AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(AuditUtil.getColumnStringB() + (null == putInMaterial.getTableNo() ? "" : "," + putInMaterial.getTableNo().toString()));
				} else {
					AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(AuditUtil.getColumnStringC() + (null == putInMaterial.getId() ? "" : "," + putInMaterial.getId().toString()));
				} else {
					AuditUtil.setColumnStringC(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
				}
			}
		}
		
		for(WOMPutInMaterial putInMaterial : putInMaterials){
			beforeDeletePutInMaterial(putInMaterial);
		}
		
		
		/**
		 * 假删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(putInMaterials != null && putInMaterials.size() > 0 ){
			for(WOMPutInMaterial putInMaterial : putInMaterials){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				List<Object> currentState = new ArrayList<Object>();
				propertyNames.add("valid");
				currentState.add(false);
				previousState.add(true);
				dataAuditLogService.saveCustomerAudit(InternationalResource.get("foundation.common.delete"),putInMaterial, putInMaterial.getId(), currentState.toArray(), previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
			}
		}
		if(putInMaterialIds != null && putInMaterialIds.size() > 0) {
			String hql = "update " + WOMPutInMaterial.JPA_NAME + " set valid = false where id in(:ids)";
			Query query = putInMaterialDao.createQuery(hql);
			query.setParameterList("ids", putInMaterialIds);
			query.executeUpdate();
		}
		
		for(WOMPutInMaterial putInMaterial : putInMaterials){
			afterDeletePutInMaterial(putInMaterial);
		}
		
		if(eventTopic==null){
			for(WOMPutInMaterial putInMaterialz : putInMaterials){
				putInMaterialz.setValid(false);
				List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
				List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterialz));
				putInMaterialz.setPutInMaterialPartList(putInMaterialPartList);
				params.add(putInMaterialz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.delete",operType="3")
	public void deletePutInMaterial(long putInMaterialId, int putInMaterialVersion){
		this.deletePutInMaterial(putInMaterialId, putInMaterialVersion,null);
	}
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.delete",operType="3")
	public void deletePutInMaterial(long putInMaterialId, int putInMaterialVersion,SignatureLog signatureLog){
		WOMPutInMaterial putInMaterial = getPutInMaterial(putInMaterialId);
		if(putInMaterial != null && !putInMaterial.isValid()){
			throw new BAPException(BAPException.Code.OBJECT_HAVE_BEAN_DELETED);
		}
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		beforeDeletePutInMaterial(putInMaterial);
		putInMaterialDao.delete(putInMaterialId, putInMaterialVersion);
		afterDeletePutInMaterial(putInMaterial);
		putInMaterialDao.flush();
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		params.add(putInMaterial);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		props.put("eventType", "delete");
		
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=putInMaterial.getTableNo();
			signatureLog.setTableId(putInMaterial.getId());
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
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.delete",operType="3")
	public void deletePutInMaterial(String putInMaterialIds){
		this.deletePutInMaterial(putInMaterialIds,null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.delete",operType="3")
	public void deletePutInMaterial(String putInMaterialIds,SignatureLog signatureLog){
		deleteCollection(putInMaterialIds,signatureLog);
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
				deletePutInMaterial(Long.valueOf(id), Integer.valueOf(version),signatureLog);
			}
		}
		if(null != signatureLog){
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_putInMaterial#modelCode:WOM_7.5.0.0_putInMaterial_PutInMaterial#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.engine.restore",operType="10")
	public void restorePutInMaterial(String putInMaterialIds){
		restoreCollection(putInMaterialIds);
	}
	
	public void restoreCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			if (id != null && id.trim().length() > 0) {
				restorePutInMaterial(Long.valueOf(id));
			}
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.engine.restore",operType="10")
	public void restorePutInMaterial(long putInMaterialId){
		
		findBusinessKeyUsed(putInMaterialId);	//判断业务主键是否重复
		
		WOMPutInMaterial putInMaterial = getPutInMaterial(putInMaterialId);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		beforeRestorePutInMaterial(putInMaterial);
		putInMaterial.setValid(true);
		putInMaterialDao.update(putInMaterial);
		afterRestorePutInMaterial(putInMaterial);
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		params.add(putInMaterial);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		props.put("eventType", "restore");
	}
	
	public void findBusinessKeyUsed(long putInMaterialId){
		Property property = modelServiceFoundation.getBussinessProperty("WOM_7.5.0.0_putInMaterial_PutInMaterial");
		if(property != null){
			String propertyName = property.getColumnName();
			String sql  = "select * from " + WOMPutInMaterial.TABLE_NAME + " where valid = 1 and " + 
					propertyName + " =  (select "+ propertyName +" from "+ WOMPutInMaterial.TABLE_NAME +" where id = ? )";
			List<Object> list =  putInMaterialDao.createNativeQuery(sql,putInMaterialId).list();
			if(list.size() > 0){
				throw new BAPException("foundation.bussinessKey.repeat");
			}
			
		}
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.batch.import",operType="4")
	public  void batchImportBasePutInMaterial(List<WOMPutInMaterial>  putInMaterials){
		for(WOMPutInMaterial putInMaterial:putInMaterials)  {
			savePutInMaterial(putInMaterial, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBasePutInMaterial(List<WOMPutInMaterial>  putInMaterials){
		for(WOMPutInMaterial putInMaterial:putInMaterials)  {
			savePutInMaterial(putInMaterial, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.save")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		savePutInMaterial(putInMaterial, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.save")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		savePutInMaterial(putInMaterial, dgLists,dgDeleteIDs,assFileUploads, viewCode, null,null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditPutInMaterial(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, boolean... isImport){
		this.saveSuperEditPutInMaterial(putInMaterial, workFlowVar, dgLists, dgDeleteIDs, assFileUploads, viewCode, null, isImport);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditPutInMaterial(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, SignatureLog signatureLog, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditPutInMaterial(workFlowVar, dgLists, dgDeleteIDs, assFileUploads, view, entityCode, events, putInMaterial, isImport);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=putInMaterial.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			signatureLog.setTableId(putInMaterial.getId());
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_putInMaterial#modelCode:WOM_7.5.0.0_putInMaterial_PutInMaterial#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.upload.importFlow",operType="4")
	public void importPutInMaterialWorkFlow(WOMPutInMaterial putInMaterial, String viewCode){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 saveSuperEditPutInMaterial(putInMaterial, workFlowVar, null,null,null, viewCode, null,true);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.batch.upload.importFlow",operType="4")
	public void batchImportPutInMaterialWorkFlow(List<WOMPutInMaterial>  putInMaterials, View view){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 batchSaveSuperEditPutInMaterial(putInMaterials, workFlowVar, null,null,null, view, true);
	}
	
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.batch.import",operType="4")
	public void batchSaveSuperEditPutInMaterial(List<WOMPutInMaterial>  putInMaterials, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(WOMPutInMaterial putInMaterial:putInMaterials)  {
			saveSingleSuperEditPutInMaterial(workFlowVar, dgLists, dgDeleteIDs,assFileUploads, view, entityCode, events, putInMaterial, isImport);
		}
	}
	
	
	
	public void saveSingleSuperEditPutInMaterial(WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, String entityCode, List<Event> events,WOMPutInMaterial putInMaterial, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, putInMaterial);
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
		workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		workFlowVar.setStatus(putInMaterial);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		putInMaterial.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (putInMaterial.getId() == null) {
			putInMaterial.setStatus(EntityTableInfo.STATUS_EFFECTED);
			putInMaterial.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitPutInMaterial(putInMaterial, workFlowVar, true);
		batchSavePutInMaterial(putInMaterial,dgLists, dgDeleteIDs,assFileUploads, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(putInMaterial.getTableInfoId(), isSuperAdd,isImport);
		putInMaterialDao.flush();
		workFlowVar.setModelId(putInMaterial.getId());
		workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
		workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
		workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		workFlowVar.setTableNo(putInMaterial.getTableNo());
		
		afterSubmitProcessPutInMaterial(putInMaterial, di, workFlowVar, view.getCode(), true);
		afterSubmitPutInMaterial(putInMaterial, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, putInMaterial);
			}
		}
	}
	
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.batch.save",operType="4")
	public void batchSavePutInMaterial(WOMPutInMaterial putInMaterial,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads ,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		String url = null;
		if(putInMaterial.getId()!=null && putInMaterial.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, putInMaterial);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		beforeSavePutInMaterial(putInMaterial, viewIsView);

		if (null == putInMaterial.getId()) {
			if(null == putInMaterial.getStatus()){
				putInMaterial.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			putInMaterial.setTableNo(generateTableNo());
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				putInMaterialDao.save(putInMaterial);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(putInMaterial,isImport);
			putInMaterialDao.saveTableInfo(ti);
			putInMaterial.setTableInfoId(ti.getId());
			if(putInMaterial.getOwnerStaffId()==null){
				putInMaterial.setOwnerStaffId(putInMaterial.getCreateStaffId());
				ti.setOwnerStaffId(putInMaterial.getCreateStaffId());
			}
			if(putInMaterial.getOwnerDepartmentId()==null){
				putInMaterial.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
				ti.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
			}
			if(putInMaterial.getOwnerPositionId()==null){
				putInMaterial.setOwnerPositionId(putInMaterial.getCreatePositionId());
				ti.setOwnerPositionId(putInMaterial.getCreatePositionId());
			}
			putInMaterial.setCreateStaffId(putInMaterial.getCreateStaffId());
			putInMaterial.setCreatePositionId(putInMaterial.getCreatePositionId());
			putInMaterial.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (putInMaterial.getCompany() == null) {
				putInMaterial.setCompany(getCurrentCompany());
			}
			if (putInMaterial.getCid() == null || putInMaterial.getCid() == -1l) {
				putInMaterial.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				putInMaterialDao.save(putInMaterial);
			}
		} else {
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				putInMaterialDao.merge(putInMaterial);
			}
		}
		dealDatagridsSave(putInMaterial,view.getCode(),dgLists,dgDeleteIDs,assFileUploads);
		
		// 一对多情况处理
		this.dealHeadIdTaskProcessId(putInMaterial);
		this.dealHeadIdAdjustActive(putInMaterial);
		this.dealHeadIdTaskID(putInMaterial);
		this.dealHeadIdWareID(putInMaterial);
		this.dealHeadIdFormluActive(putInMaterial);
		this.dealHeadIdTaskActiveId(putInMaterial);
		this.dealHeadIdStoreID(putInMaterial);
		this.dealHeadIdFactoryId(putInMaterial);
		this.dealHeadIdProductId(putInMaterial);
		this.dealHeadIdProBatch(putInMaterial);
		this.dealHeadIdPutinStaff(putInMaterial);
		this.dealSupervision(putInMaterial);
		
		// 根据配置规则生成编码
		try {
			generatePutInMaterialCodes(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generatePutInMaterialSummarys(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSavePutInMaterial(putInMaterial, viewIsView);
		

		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, putInMaterial);
			}
		}
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		putInMaterialDao.flush();
		putInMaterialDao.clear();
		putInMaterial = putInMaterialDao.load(putInMaterial.getId());
		
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		
		params.add(putInMaterial);
	}
	
	
	
	

	public void generatePutInMaterialCodes(WOMPutInMaterial putInMaterial) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generatePutInMaterialCodes(putInMaterial, false);
	}
	
	public void generatePutInMaterialCodes(WOMPutInMaterial putInMaterial, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	public void generatePutInMaterialSummarys(WOMPutInMaterial putInMaterial) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generatePutInMaterialSummarys(putInMaterial, false);
	}

	public void generatePutInMaterialSummarys(WOMPutInMaterial putInMaterial, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic,boolean... isImport){
		this.savePutInMaterial(putInMaterial, dgLists,dgDeleteIDs,assFileUploads, viewCode, eventTopic,null,isImport);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport){
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		String url = null;
		if(putInMaterial.getId() != null && putInMaterial.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/add";
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
				executeGScript(entityCode, "beforeSave", events, putInMaterial);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		beforeSavePutInMaterial(putInMaterial, viewIsView);

		if (null == putInMaterial.getId()) {
			if(null == putInMaterial.getStatus()){
				putInMaterial.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			putInMaterial.setTableNo(generateTableNo());
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				if(isNew)
					putInMaterialDao.save(putInMaterial);
				else
					putInMaterialDao.merge(putInMaterial);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(putInMaterial,isImport);
				putInMaterialDao.saveTableInfo(ti);
				putInMaterial.setTableInfoId(ti.getId());
				if(putInMaterial.getOwnerStaffId()==null){
					putInMaterial.setOwnerStaffId(putInMaterial.getCreateStaffId());
					ti.setOwnerStaffId(putInMaterial.getCreateStaffId());
				}
				if(putInMaterial.getOwnerDepartmentId()==null){
					putInMaterial.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
					ti.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
				}
				if(putInMaterial.getOwnerPositionId()==null){
					putInMaterial.setOwnerPositionId(putInMaterial.getCreatePositionId());
					ti.setOwnerPositionId(putInMaterial.getCreatePositionId());
				}
				putInMaterial.setCreateStaffId(putInMaterial.getCreateStaffId());
				putInMaterial.setCreatePositionId(putInMaterial.getCreatePositionId());
				putInMaterial.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (putInMaterial.getCompany() == null) {
					putInMaterial.setCompany(getCurrentCompany());
				}
				if (putInMaterial.getCid() == null || putInMaterial.getCid() == -1l) {
					putInMaterial.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					putInMaterialDao.saveWithRevertVersion(putInMaterial);
				} else {
					putInMaterialDao.save(putInMaterial);
				}
				
		} else {
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				if(isNew)
					putInMaterialDao.save(putInMaterial);
				else
					putInMaterialDao.merge(putInMaterial);
			}
		}
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		dealDatagridsSave(putInMaterial,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
			this.dealHeadIdTaskProcessId(putInMaterial);
			this.dealHeadIdAdjustActive(putInMaterial);
			this.dealHeadIdTaskID(putInMaterial);
			this.dealHeadIdWareID(putInMaterial);
			this.dealHeadIdFormluActive(putInMaterial);
			this.dealHeadIdTaskActiveId(putInMaterial);
			this.dealHeadIdStoreID(putInMaterial);
			this.dealHeadIdFactoryId(putInMaterial);
			this.dealHeadIdProductId(putInMaterial);
			this.dealHeadIdProBatch(putInMaterial);
			this.dealHeadIdPutinStaff(putInMaterial);
			this.dealSupervision(putInMaterial);
		
		// 根据配置规则生成编码
		try {
			generatePutInMaterialCodes(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generatePutInMaterialSummarys(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSavePutInMaterial(putInMaterial, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, putInMaterial);
			}
		}
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		putInMaterialDao.flush();
		putInMaterialDao.clear();
		putInMaterial = putInMaterialDao.load(putInMaterial.getId());
		
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		
		params.add(putInMaterial);
		
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=putInMaterial.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(putInMaterial.getId());
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_putInMaterial#modelCode:WOM_7.5.0.0_putInMaterial_PutInMaterial#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, WOMPutInMaterial putInMaterial){
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
						variables.put("putInMaterial", putInMaterial);
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
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void mergePutInMaterial(WOMPutInMaterial putInMaterial, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		beforeSavePutInMaterial(putInMaterial);
		if (null == putInMaterial.getId()) {
			putInMaterial.setStatus(EntityTableInfo.STATUS_RUNNING);
			putInMaterial.setTableNo(generateTableNo());
			putInMaterialDao.save(putInMaterial);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(putInMaterial);
				putInMaterialDao.saveTableInfo(ti);
				putInMaterial.setTableInfoId(ti.getId());
				if(putInMaterial.getOwnerStaffId()==null){
					putInMaterial.setOwnerStaffId(putInMaterial.getCreateStaffId());
				}
				if(putInMaterial.getOwnerDepartmentId()==null){
					putInMaterial.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
				}
				if(putInMaterial.getOwnerPositionId()==null){
					putInMaterial.setOwnerPositionId(putInMaterial.getCreatePositionId());
				}
				putInMaterial.setCreateStaffId(putInMaterial.getCreateStaffId());
				putInMaterial.setCreatePositionId(putInMaterial.getCreatePositionId());
				putInMaterial.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (putInMaterial.getCompany() == null) {
					putInMaterial.setCompany(getCurrentCompany());
				}
				if (putInMaterial.getCid() == null || putInMaterial.getCid() == -1l) {
					putInMaterial.setCid(getCurrentCompanyId());
				}
				putInMaterialDao.merge(putInMaterial);
		} else {
			putInMaterialDao.merge(putInMaterial);
		}
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		dealDatagridsSave(putInMaterial,null,dgLists,dgDeleteIDs,assFileUploads);

			// 一对多情况处理
			this.dealHeadIdTaskProcessId(putInMaterial);
			this.dealHeadIdAdjustActive(putInMaterial);
			this.dealHeadIdTaskID(putInMaterial);
			this.dealHeadIdWareID(putInMaterial);
			this.dealHeadIdFormluActive(putInMaterial);
			this.dealHeadIdTaskActiveId(putInMaterial);
			this.dealHeadIdStoreID(putInMaterial);
			this.dealHeadIdFactoryId(putInMaterial);
			this.dealHeadIdProductId(putInMaterial);
			this.dealHeadIdProBatch(putInMaterial);
			this.dealHeadIdPutinStaff(putInMaterial);
			this.dealSupervision(putInMaterial);
		afterSavePutInMaterial(putInMaterial);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<WOMPutInMaterial> findPutInMaterials(Page<WOMPutInMaterial> page, Criterion... criterions) {
		return putInMaterialDao.findByPage(page, criterions);
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
	private WOMPutInMaterialDealInfo getDealInfoEntity(Long tableInfoId) {
		
		List<WOMPutInMaterialDealInfo> list=putInMaterialDao.createQuery("from " + WOMPutInMaterialDealInfo.JPA_NAME + " where tableInfoId=?", tableInfoId).setMaxResults(1).list();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void saveDealInfo(WOMPutInMaterialDealInfo dealInfo) {
		putInMaterialDao.saveDealInfo(dealInfo);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public int getDealInfoCount(Long tableInfoId) {
		String sql = "SELECT count(1) totalCount " + "FROM "+WOMPutInMaterialDealInfo.TABLE_NAME+" DI " + "LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME
				+ " S ON S.ID=U.STAFF_ID " + "WHERE DI.TABLE_INFO_ID = ?";
		Number list = (Number) putInMaterialDao.createNativeQuery(sql, tableInfoId).uniqueResult();
		return list.intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag) {
		String sql = "SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, WT.TYPE,WTR.TYPE TRANSITIONTYPE "
				+ " FROM "+WOMPutInMaterialDealInfo.TABLE_NAME + " DI " 
				+ " LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION "
				+ " LEFT JOIN WF_TRANSITION WTR ON WTR.CODE = DI.OUTCOME AND WTR.DEPLOYMENT_ID = WT.DEPLOYMENT_ID "
				+ " LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID "
				+ " WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION is not null ";
		if (expandFlag) {
			sql += " AND DI.COMMENTS IS NOT NULL";
			DBTYPE dbtype = putInMaterialDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				sql += " AND DI.COMMENTS != ''";
			}
		}
		sql += " ORDER BY DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC";
		List<Object[]> list = putInMaterialDao.createNativeQuery(sql, tableInfoId).list();
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
				+ WOMPutInMaterialDealInfo.TABLE_NAME
				+ " DI LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION ");
		groupSql.append(" LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID ");
		groupSql.append(" WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION IS NOT NULL ");
		if (expandFlag) {
			groupSql.append(" AND DI.COMMENTS IS NOT NULL");
			DBTYPE dbtype = putInMaterialDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				groupSql.append(" AND DI.COMMENTS != ''");
			}
		}
		groupSql.append(" ORDER BY WT.ROUTE_SEQUENCE ASC, DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC");

		List<Object[]> groupList = putInMaterialDao.createNativeQuery(groupSql.toString(), tableInfoId).list();
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
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="撤回",operType="4")
	public Pending recall(long tableInfoId) {
		Long modelId = null;
		WOMPutInMaterial  putInMaterial = null;
		List<Object> list = putInMaterialDao.createNativeQuery("select ID from " + WOMPutInMaterial.TABLE_NAME + " where TABLE_INFO_ID = ?", tableInfoId).list();
		if (list != null && list.size() > 0) {
			if (list.get(0) != null) {
				modelId = ((Number) list.get(0)).longValue();
				putInMaterial = this.getPutInMaterial(modelId);
			}
		}
		if(null != putInMaterial){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(putInMaterial.getId().toString());
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
			props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
			props.put("eventType", "recall");
			return pending;
		}
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public boolean existsSupervision(Long tableInfoId, Long staffId) {
		List<WOMPutInMaterialSupervision> list = putInMaterialDao.findSupervision(tableInfoId, staffId);
		if(list!=null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	public String getWorkFlowVarStatus(WorkFlowVar workFlowVar){
		return workFlowVar == null ? null : workFlowVar.getOutcomeType();
	}
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void save(WOMPutInMaterial putInMaterial,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		save(putInMaterial, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void save(WOMPutInMaterial putInMaterial, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		boolean first = null == putInMaterial.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != putInMaterial.getCreateStaff() && null != putInMaterial.getCreateStaff().getUser()){
		    	createStaffUserId = putInMaterial.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
			workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		}
		putInMaterial.setWorkFlowVar(workFlowVar);
		if(putInMaterial.getDeploymentId() == null && deploymentId != null) {
			putInMaterial.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				putInMaterial.setProcessKey(d.getProcessKey());
				putInMaterial.setProcessVersion(d.getProcessVersion());
			}
		}

		savePutInMaterial(putInMaterial, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(putInMaterial.getId().toString());
			}
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(putInMaterial.getId());
			workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
			workFlowVar.setTableNo(putInMaterial.getTableNo());
			workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
			workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(putInMaterial, instance, deploymentId, pendingId, workFlowVar);
		putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
		putInMaterialDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessPutInMaterial(putInMaterial, di, workFlowVar, viewCode);
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
		putInMaterialDao.flush();
		putInMaterialDao.clear();
		WOMPutInMaterial putInMaterial = getPutInMaterial(id);
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");                                                                                                                   
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		props.put("eventType", type);
	}
	@Override
	public Date findLastDealInfo(Long tableInfoId, String activityName) {
		return putInMaterialDao.findLastDealInfo(tableInfoId, activityName);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.submit",operType="4")
	public void submit(WOMPutInMaterial putInMaterial,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		submit(putInMaterial, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.submit",operType="4")
	public void submit(WOMPutInMaterial putInMaterial, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		this.submit(putInMaterial, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null,null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.submit",operType="4")
	public void submit(WOMPutInMaterial putInMaterial, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog) {
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, putInMaterial);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
		workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		workFlowVar.setStatus(putInMaterial);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		putInMaterial.setWorkFlowVar(workFlowVar);
		if(putInMaterial.getDeploymentId() == null && deploymentId != null) {
			putInMaterial.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				putInMaterial.setProcessKey(d.getProcessKey());
				putInMaterial.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitPutInMaterial(putInMaterial, workFlowVar);
		savePutInMaterial(putInMaterial, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(putInMaterial.getId().toString());
			}
		}
		Integer preStatus = putInMaterial.getStatus();
		putInMaterialDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(putInMaterial.getId());
		workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
		workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
		workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		workFlowVar.setTableNo(putInMaterial.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, putInMaterial.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(putInMaterial, di, deploymentId, pendingId, workFlowVar, true);
			putInMaterialDao.copyAndSaveDealInfo(saveDi, putInMaterial, creatorService.getStaffFromSession());
		}
		putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					putInMaterialDao.flush();
					
					WOMPutInMaterialDealInfo putInMaterialDealInfo=putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
					putInMaterialDealInfo.setOutcome(outcome);
					putInMaterialDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						putInMaterialDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				putInMaterialDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(putInMaterial.getStatus() == 99) {
			if(!preStatus.equals(putInMaterial.getStatus())){
				dataAuditLogService.saveCustomerAudit("2", putInMaterial, putInMaterial.getId(), new Object[]{putInMaterial.getStatus(),putInMaterial.getEffectTime()}, new Object[]{preStatus,null}, new String[]{"status","effectTime"});
			}
			putInMaterialDao.deleteSupervision(putInMaterial.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + putInMaterial.getProcessKey() + "_" + di.getActivityName() + "_WOM_7.5.0.0_putInMaterial_" + putInMaterial.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		putInMaterialDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessPutInMaterial(putInMaterial, di, workFlowVar, viewCode);
		afterSubmitPutInMaterial(putInMaterial, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, putInMaterial);
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
			businessKey = putInMaterial.getTableNo();
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
			signatureLog.setTableId(putInMaterial.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_putInMaterial#modelCode:WOM_7.5.0.0_putInMaterial_PutInMaterial#timeStamp:"+String.valueOf(new Date().getTime());
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
	public void findPutInMaterials(Page<WOMPutInMaterial> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, Map exportMap, List<Param> params) {
		findPutInMaterials(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findPutInMaterials(Page<WOMPutInMaterial> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findPutInMaterials(Page<WOMPutInMaterial> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
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
	public void commonQuery(Page<WOMPutInMaterial> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
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
						String tableAlias = lastDotPos < 0 ? "\"putInMaterial\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
							sortOrderByStr.append(",").append("\"putInMaterial\".STATUS ").append((String) param.getValue());
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
					if((advQuery == null || advQuery.length() == 0 || advQuery.indexOf("\"putInMaterial\".STATUS") == -1) 
						&& (classifySql == null || classifySql.length() == 0 || classifySql.indexOf("\"putInMaterial\".STATUS") == -1)) {
						s.append(" AND \"putInMaterial\".STATUS <> 0");
					}
					if(type == Sql.TYPE_LIST_PENDING) {
						s.append(" AND \"putInMaterial\".STATUS <> 77");
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
							s.append(" AND \"putInMaterial\".CID in (1,").append(getCurrentCompanyId()+")");
						}
					}
					
	//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
	//					if(type == Sql.TYPE_LIST_PENDING) {
	//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_QUERY){
	//						s.append(" AND \"putInMaterial\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_REFERENCE){
	//						if(null != crossCompanyFlag && !crossCompanyFlag){
	//							s.append(" AND \"putInMaterial\".CID = ").append(getCurrentCompanyId());
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
							powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + layoutView.getPermissionCode();
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + layoutView.getPermissionCode();
							}
						}
					}else  {
						if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
							powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + view.getPermissionCode();
						}
					}
				}else if(null != dgCode && !"".equals(dgCode)){
					DataGrid dataGrid = viewServiceFoundation.getDataGrid(dgCode);
					if(null != dataGrid.getDataGridType() && dataGrid.getDataGridType() == 1 && null != dataGrid.getIsPermission() && dataGrid.getIsPermission()){
						powerCode = dataGrid.getTargetModel().getCode() + "_" + dataGrid.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  putInMaterialDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  putInMaterialDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_putInMaterial").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}	
					String	pc = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"putInMaterial\"","WOM_7.5.0.0_putInMaterial",customCondition,"WOM_PUT_IN_MATERIALS",false);
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
						s.append(" \"putInMaterial\".TABLE_INFO_ID IN (  SELECT   D.TABLE_INFO_ID "+
	                      "   FROM   "+WOMPutInMaterialDealInfo.TABLE_NAME+" d "+
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
				totalSql.append(" LEFT OUTER JOIN ").append("(SELECT TASK_DESCRIPTION, TABLE_INFO_ID FROM ").append(Pending.TABLE_NAME).append(" WHERE ID IN (SELECT MAX(ID) FROM ").append(Pending.TABLE_NAME).append(" GROUP BY TABLE_INFO_ID))").append(" \"p\" ON \"p\".TABLE_INFO_ID= \"putInMaterial\".TABLE_INFO_ID ");
			}
			if(queryType == 1) {
				s.append(" AND \"putInMaterial\".STATUS = 99 ");
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
					orderPart.append(" \"putInMaterial\".LAY_REC ASC, \"putInMaterial\".SORT ASC");
				} else {
					orderPart.append(" \"putInMaterial\".ID DESC");
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
				//Long count = ((Number) putInMaterialDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    SQLQuery query=putInMaterialDao.createNativeQuery(countSql, arr);
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
				SQLQuery query = putInMaterialDao.createNativeQuery(realSql, arr);
				if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
				List<WOMPutInMaterial> result = new ArrayList<WOMPutInMaterial>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(WOMPutInMaterial.class,putInMaterialDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(WOMPutInMaterial.class,putInMaterialDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (WOMPutInMaterial putInMaterial : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(putInMaterial.getTableInfoId(), "Table");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(putInMaterial.getTableInfoId(), "Table");
							if(null != documents && !documents.isEmpty()) {
								putInMaterial.setDocument(documents.get(0));
								putInMaterial.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				
				for (WOMPutInMaterial putInMaterial : result) {
				}	
				if(queryType == 0) {
					if (type == Sql.TYPE_LIST_QUERY) {
						if (!result.isEmpty()) {
							List<Long> tIds = new ArrayList<Long>(result.size());
							for (WOMPutInMaterial putInMaterial : result)
								tIds.add(putInMaterial.getTableInfoId());
							String pSql = "SELECT DISTINCT p.TABLE_INFO_ID,p.TASK_DESCRIPTION,p.ACTIVITY_TYPE,p.ACTIVITY_NAME,p.PROCESS_KEY,p.PROCESS_VERSION,p.DEPLOYMENT_ID,p.PROCESS_ID,p.PROCESS_NAME,p.PROCESS_DESCRIPTION,t.route_sequence,p.PROXY_SOURCE FROM " + Pending.TABLE_NAME + " p, wf_task t WHERE p.TABLE_INFO_ID IN (:ids) and p.activity_name =t.code and p.deployment_id=t.deployment_id order by t.route_sequence";
							// 解决in最大值为999问题
							List<Object[]> plist = new ArrayList<Object[]>();
							List<Object[]> mylist = new ArrayList<Object[]>();
							int PERTIME = 999;
							int count = (tIds.size() / PERTIME) + (tIds.size() % PERTIME == 0 ? 0 : 1);
							for(int i = 0 ; i < count ; i++){
								plist.addAll(putInMaterialDao.createNativeQuery(pSql).setParameterList("ids", tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							String myPql="SELECT DISTINCT TABLE_INFO_ID,ID  FROM " + Pending.TABLE_NAME + " WHERE TABLE_INFO_ID IN (:ids) and USER_ID="+getCurrentUser().getId();
							for(int j = 0 ; j < count ; j++){
								mylist.addAll(putInMaterialDao.createNativeQuery(myPql).setParameterList("ids", tIds.subList(PERTIME * j, PERTIME * j + (j < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							// List<Object[]> plist = putInMaterialDao.createNativeQuery(pSql).setParameterList("ids", tIds).list();
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
								for (WOMPutInMaterial putInMaterial : result) {
									Pending p = map.get(putInMaterial.getTableInfoId());
									if(null != p){
										//if(putInMaterial.getStatus()==99){
										//	p.setTaskDescription(p.getTaskDescription() + "," + InternationalResource.get("ec.pending.over", currentUser.getLanguage()));
										//} else if(putInMaterial.getStatus()==77){
										//	p.setTaskDescription(InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage()));
										//}
										putInMaterial.setPending(p);
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
		if(null!=permissionCode&&permissionCode.indexOf("WOM_7.5.0.0_putInMaterial")!=-1) {
				String personalCode=permissionCode.substring(permissionCode.indexOf("WOM_7.5.0.0_putInMaterial")+"WOM_7.5.0.0_putInMaterial".length()+1);
				if(null!=personalCode&&personalCode.trim().length()>0)  {
						return viewServiceFoundation.getViewWithPermissionCode("WOM_7.5.0.0_putInMaterial",personalCode);
				}
		}
		return null;
	}
	
	private void getConfigAssoPropsResult(String viewCode, List<WOMPutInMaterial> result) {
		getConfigAssoPropsResult(viewCode, null, result);
	}
	
	private void getConfigAssoPropsResult(String viewCode,String dataGridCode, List<WOMPutInMaterial> result) {
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
		Map<Long, WOMPutInMaterial> rsMap = new HashMap<Long, WOMPutInMaterial>();
		for (WOMPutInMaterial putInMaterial : result) {
			ids.add(putInMaterial.getId());
			rsMap.put(putInMaterial.getId(), putInMaterial);
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
								rs.addAll(putInMaterialDao.createNativeQuery(sql)
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
		List<Property> list = putInMaterialDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
		return list.get(0);
	}
	
	public List<WOMPutInMaterial> getTableInfoStatus(List<WOMPutInMaterial> result, boolean isPendingQuery, Long ... deploymentId) {
		List<Long> tIds = new ArrayList<Long>(result.size());
		User currentUser = (User) getCurrentUser();
		String hangUp = InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage());
		String over = InternationalResource.get("ec.pending.over", currentUser.getLanguage());
		String dai = InternationalResource.get("ec.flowActive.dai", currentUser.getLanguage());
		String invalid = InternationalResource.get("ec.edit.remove", currentUser.getLanguage());
		String closed = InternationalResource.get("ec.edit.closed", currentUser.getLanguage());
		if (isPendingQuery) {
			for (WOMPutInMaterial putInMaterial : result) {
				if (putInMaterial.getPending() != null) {
					if (putInMaterial.getStatus() == 77) {
						putInMaterial.getPending().setTaskDescription(hangUp);
					} else if (putInMaterial.getPending().getProxySource() != null && !putInMaterial.getPending().getProxySource().isEmpty()
							|| putInMaterial.getPending().getSourceStaff() != null && !putInMaterial.getPending().getSourceStaff().isEmpty()) {
						String statsName = putInMaterial.getPending().getTaskDescription();
						statsName = InternationalResource.get(statsName, currentUser.getLanguage());
						statsName += "(" + dai + ")";
						putInMaterial.getPending().setTaskDescription(statsName);
					}
				}
			}
		} else {
			Map<Long, WOMPutInMaterial> map = new HashMap<>();
			for (WOMPutInMaterial putInMaterial : result) {
				tIds.add(putInMaterial.getTableInfoId());
				map.put(putInMaterial.getTableInfoId(), putInMaterial);
				Pending pending = putInMaterial.getPending();
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
				plist.addAll(putInMaterialDao
						.createNativeQuery(pSql)
						.setParameterList("ids",
								tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
			}
			for (Object[] o : plist) {
				long pTableInfoId = ((Number) o[0]).longValue();
				WOMPutInMaterial putInMaterial = map.get(pTableInfoId);
				Pending pending = putInMaterial.getPending();
				if (pending == null) {
					pending = new Pending();
					putInMaterial.setPending(pending);
				}
				String taskDesc = (o[1] != null) ? InternationalResource.get(o[1].toString(), currentUser.getLanguage()) : "";
				if (pending.getTaskDescription() != null) {
					pending.setTaskDescription(pending.getTaskDescription() + "," + taskDesc);
				} else {
					pending.setTaskDescription(taskDesc);
				}
			}
			for (WOMPutInMaterial putInMaterial : result) {
				Pending p = putInMaterial.getPending();
				if(p == null) {
					p = new Pending();
				}
				if (putInMaterial.getStatus() == 99) {
					if (p.getTaskDescription() == null) {
						p.setTaskDescription(over);
					} else {
						p.setTaskDescription(p.getTaskDescription() + "," + over);
					}
				} else if (putInMaterial.getStatus() == 77) {
					p.setTaskDescription(hangUp);
				} else if (putInMaterial.getStatus() == 0) {
					p.setTaskDescription(invalid);
				}
				putInMaterial.setPending(p);
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
	
	protected EntityTableInfo getTableInfo(WOMPutInMaterial putInMaterial,boolean... isImport) {
		EntityTableInfo ti = new EntityTableInfo();

		if(putInMaterial.getDeploymentId() != null) {
			ti.setDeploymentId(putInMaterial.getDeploymentId());
			ti.setProcessKey(putInMaterial.getProcessKey());
			ti.setProcessVersion(putInMaterial.getProcessVersion());
		}

		ti.setOwnerStaffId(putInMaterial.getOwnerStaffId());
		ti.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		ti.setOwnerDepartmentId(putInMaterial.getOwnerDepartmentId());
		
		ti.setCreateStaff(putInMaterial.getCreateStaff());
		ti.setCreateStaffId(putInMaterial.getCreateStaffId());
		ti.setCreateTime(putInMaterial.getCreateTime());
		ti.setDeleteStaff(putInMaterial.getDeleteStaff());
		ti.setDeleteStaffId(putInMaterial.getDeleteStaffId());
		ti.setDeleteTime(putInMaterial.getDeleteTime());
		ti.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
		ti.setModifyStaff(putInMaterial.getModifyStaff());
		ti.setModifyStaffId(putInMaterial.getModifyStaffId());
		ti.setCreatePositionId(putInMaterial.getCreatePositionId());
		ti.setPositionLayRec(putInMaterial.getPositionLayRec());
		ti.setTableNo(putInMaterial.getTableNo());
		ti.setValid(true);
		ti.setTargetEntityCode("WOM_7.5.0.0_putInMaterial");
		if(isImport!=null&&isImport.length>0&&isImport[0]) {
			ti.setStatus(EntityTableInfo.STATUS_EFFECTED);
			ti.setEffectiveState(putInMaterial.getEffectiveState());
		}else {
			ti.setStatus(putInMaterial.getStatus());
			ti.setEffectiveState(putInMaterial.getEffectiveState());
		}
		ti.setTargetTableName("WOM_PUT_IN_MATERIALS");
		
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
							powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  putInMaterialDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  putInMaterialDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_putInMaterial").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						if(sqlType!=null&&sqlType.trim().length()>0)  {
							if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
								sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"putInMaterial\".TABLE_INFO_ID ");
								sb.append(" WHERE  \"putInMaterial\".STATUS <> 0  ");
								innerJoinAppendFlag = true;
							}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
								
							}
						}
						powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"putInMaterial\"","WOM_7.5.0.0_putInMaterial","","WOM_PUT_IN_MATERIALS",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"putInMaterial\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"putInMaterial\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"putInMaterial\"","WOM_7.5.0.0_putInMaterial","","WOM_PUT_IN_MATERIALS",false);
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
								powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "WOM_7.5.0.0_putInMaterial_PutInMaterial" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  putInMaterialDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  putInMaterialDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_putInMaterial").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							if(!searchRefView&&sqlType!=null&&sqlType.trim().length()>0)  {
								if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
									sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"putInMaterial\".TABLE_INFO_ID ");
									sb.append(" WHERE  \"putInMaterial\".STATUS <> 0  ");
									innerJoinAppendFlag = true;
								}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
									
								}
							}
							powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"putInMaterial\"","WOM_7.5.0.0_putInMaterial","","WOM_PUT_IN_MATERIALS",false);
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
			
			mnecodeSql.append("  (\"").append("putInMaterial.mc\"").append(".MNE_CODE) like (?) escape '&' AND \"putInMaterial\".VALID = 1");
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
					mnecodeSql.append(" AND \"putInMaterial\".CID = ?");
					totalValues.add(getCurrentCompanyId());
				}else{
					//当前公司不是集团情况下查询集团和本公司数据
					if(!getCurrentCompanyId().equals(1L)){
						mnecodeSql.append(" AND (\"putInMaterial\".CID = 1 OR \"putInMaterial\".CID = ?)");
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
				mnecodeSql.append(" and (\"").append("putInMaterial.mc\"").append(".PUT_IN_MATERIAL) not in ("+notinValue+")");
			}
			
			SQLQuery query = putInMaterialDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
			resultList = query.setMaxResults(showNumber).list();
		}
		
		return resultList;
		
	}

	@Override
	public void destroy() throws Exception {
		beforeServiceDestroy();
		supervisionService = null;
	   	aclPermissionService = null;
		sqlService = null;
		eventService = null;
		scriptService = null;
		documentService = null;
		qualityInspectDao = null;
		qualityInspectService = null;
		dayBatchPlanInfoDao = null;
		dayBatchPlanInfoService = null;
		dayBatchPlanPartsDao = null;
		dayBatchPlanPartsService = null;
		checkManageDao = null;
		checkManageService = null;
		inspectDao = null;
		inspectService = null;
		produceTaskManageDao = null;
		produceTaskManageService = null;
		putInManageDao = null;
		putInManageService = null;
		taskReportManageDao = null;
		taskReportManageService = null;
		batchChargeDao = null;
		batchChargeService = null;
		craftRecordsDao = null;
		craftRecordsService = null;
		craftStandardsDao = null;
		craftStandardsService = null;
		procFeedbackHeadDao = null;
		procFeedbackHeadService = null;
		standingcropRefDao = null;
		standingcropRefService = null;
		taskReportingDao = null;
		taskReportingService = null;
		taskReportingPartDao = null;
		taskReportingPartService = null;
		materialsOutputDao = null;
		materialsOutputService = null;
		proActAndBatStateDao = null;
		proActAndBatStateService = null;
		batchingMaterialDao = null;
		batchingMaterialService = null;
		batchingMaterialPartDao = null;
		batchingMaterialPartService = null;
		batchingRejectPartsDao = null;
		batchingRejectPartsService = null;
		rejectReasonDao = null;
		rejectReasonService = null;
		batchTraceDao = null;
		batchTraceService = null;
		adjustOrTempHeadDao = null;
		adjustOrTempHeadService = null;
		adjustOrTempRecordsDao = null;
		adjustOrTempRecordsService = null;
		batchChargeDetailsDao = null;
		batchChargeDetailsService = null;
		batchPhaseExelogDao = null;
		batchPhaseExelogService = null;
		prodTaskActiExelogDao = null;
		prodTaskActiExelogService = null;
		prodTaskProcExelogDao = null;
		prodTaskProcExelogService = null;
		produceMaterialSumDao = null;
		produceMaterialSumService = null;
		produceTaskDao = null;
		produceTaskService = null;
		produceTaskActiveDao = null;
		produceTaskActiveService = null;
		produceTaskProcessDao = null;
		produceTaskProcessService = null;
		productNumIndexDao = null;
		productNumIndexService = null;
		waitPutinRecordsDao = null;
		waitPutinRecordsService = null;
		prepareMaterialDao = null;
		prepareMaterialService = null;
		prepareMaterialPartDao = null;
		prepareMaterialPartService = null;
		putMaterialExceptionDao = null;
		putMaterialExceptionService = null;
		batchNumRuleDao = null;
		batchNumRuleService = null;
		batchingMaterialNeedDao = null;
		batchingMaterialNeedService = null;
		makeBatOrderHeadDao = null;
		makeBatOrderHeadService = null;
		makeBatOrderPartDao = null;
		makeBatOrderPartService = null;
		putInMaterialDao = null;
		putInMaterialPartDao = null;
		putInMaterialPartService = null;
		manulOrderMainDao = null;
		manulOrderMainService = null;
		manulOrderMaterialDao = null;
		manulOrderMaterialService = null;
		activeExelogDao = null;
		activeExelogService = null;
		batchProdTaskPartDao = null;
		batchProdTaskPartService = null;
		batchProduceTaskDao = null;
		batchProduceTaskService = null;
		inventoryDetailDao = null;
		inventoryDetailService = null;
		inventoryRecordDao = null;
		inventoryRecordService = null;
	
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
		this.counter = this.counterManager.addCounter("putInMaterial", "WOM_7.5.0.0_putInMaterial", "putInMaterial_{1,date,yyyyMMdd}_{0,number,000}", CounterType.Daily);
		String formatStr = "";
		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=putInMaterialDao.createNativeQuery(sql, menuCode);
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
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(WOMPutInMaterial putInMaterial, Long tableInfoId,String scriptCode) {
		this.retrialThisTable(putInMaterial, tableInfoId,scriptCode,null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(WOMPutInMaterial putInMaterial, Long tableInfoId,String scriptCode,SignatureLog signatureLog) {
		beforeRetrial(putInMaterial);
		putInMaterial.setStatus(88);
		putInMaterialDao.save(putInMaterial);
		putInMaterialDao.flush(); //如果不flush无法更新effect信息
		ProcessInstance instance = null;
		WOMPutInMaterialDealInfo del=getDealInfoEntity(tableInfoId);
		Deployment deployment=taskService.getDeployment(del.getProcessKey(), del.getProcessVersion());
		long deploymentId=deployment.getId();
		//删除流程下所有通知活动的待办
		String hql = "delete Pending p where p.entityCode = ? and p.processKey = ? and p.processVersion = ? and p.activityType = ?";
		putInMaterialDao.bulkExecute(hql, new Object[]{"WOM_7.5.0.0_putInMaterial", del.getProcessKey(), del.getProcessVersion(), "notification"});
		taskService.completeTaskHistory(tableInfoId);
		List<Transition> transitions=processService.findFirstTransitions(deploymentId);
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setModelId(putInMaterial.getId());
		workFlowVar.setProcessInitiator(putInMaterial.getCreateStaff().getUser().getId());
		workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
		workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
		workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		workFlowVar.setTableNo(putInMaterial.getTableNo());
		workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
		workFlowVar.setStatus(putInMaterial);
		workFlowVar.setCrossCompanyFlag(true);
		workFlowVar.setGroupEnabled(false);
		workFlowVar.setOutcome(transitions.get(0).getName());
		workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		//DealInfo di = taskService.take(null, deploymentId, workFlowVar);
		instance = instanceService.start(deploymentId, null, workFlowVar);
		DealInfo di = taskService.doSaveDealInfo(putInMaterial, instance, deploymentId, null, workFlowVar);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(putInMaterial.getId().toString());
			}
		}
		WOMPutInMaterialDealInfo dl=new WOMPutInMaterialDealInfo();
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
		staff.setId(putInMaterial.getOwnerStaffId());
		dl.setStaff(staff);
		dl.setUserId(di.getUserId());
		dl.setDealInfoType(DealInfoType.NORMAL);
		putInMaterialDao.saveDealInfo(dl);
		putInMaterialDao.createNativeQuery("update EC_TABLE_INFO set STATUS=88 where id=?", putInMaterial.getTableInfoId()).executeUpdate();
		if(null!=scriptCode&&!"".equals(scriptCode)){
			doScript(scriptCode,putInMaterial);
		}
		afterRetrial(putInMaterial);
		//crossCompanyDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=putInMaterial.getTableNo();
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
			signatureLog.setTableId(putInMaterial.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_putInMaterial#modelCode:WOM_7.5.0.0_putInMaterial_PutInMaterial#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
			
	}
	public void doScript(String code ,WOMPutInMaterial putInMaterial){

		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("db", DbUtils.getInstance());
		variables.put("putInMaterial", putInMaterial);
		try {
			Script script = scriptService.get("WOM_7.5.0.0_putInMaterial", code);
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
			WOMPutInMaterial putInMaterial=putInMaterialDao.load(Long.parseLong(idArr[i]));
			Long pendingId=Long.parseLong(pendingArr[i]);
			WorkFlowVar workFlowVar = new WorkFlowVar();
			workFlowVar.setOutcomeMap(mapList);
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setModelId(putInMaterial.getId());
			workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setComment(comment);
			workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
			workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
			workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
			workFlowVar.setTableNo(putInMaterial.getTableNo());
			workFlowVar.setTableName(putInMaterial.TABLE_NAME);
			workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
			workFlowVar.setStatus(putInMaterial);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			if(!mapList.isEmpty()&&mapList.size()>0&&mapList.get(0).get("countersignUsers")!=null){
				workFlowVar.setCountersignUsers(mapList.get(0).get("countersignUsers").toString());
			}
			DealInfo di = taskService.take(pendingId, deploymentId, putInMaterial.getId(), creatorService.getStaffFromSession(), workFlowVar);
			putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
			if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
				for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
					String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
					String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
					String type=(map.get("type")!=null)?map.get("type").toString():"";
					String assignUser=(map.get("assignUser")!=null)?map.get("assignUser").toString():"";
					if(type.equals("notification")){
						putInMaterialDao.flush();
						di.setOutcome(outcome);
						di.setOutcomeDes(dec);
						if(assignUser!=null&&assignUser.length()>0){
							String assignStaff=taskService.getAssignUserName(assignUser);
							di.setAssignStaff(assignStaff);
						}
						putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
						
					}
				}
			}
			afterSubmitPutInMaterial(putInMaterial, workFlowVar);
		}
		
	}
	// ================ 生成多选控件数据保存方法 start====================
	private void dealHeadIdTaskProcessId(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdTaskProcessIdAddIds();
		String delIds = putInMaterial.getHeadIdTaskProcessIdDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("taskProcessId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					WOMProduceTaskProcess indirectObj = new WOMProduceTaskProcess();
					indirectObj.setId(Long.valueOf(item));
					tmp.setTaskProcessId(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdTaskProcessId(WOMPutInMaterial putInMaterial) {
		setHeadIdTaskProcessId(putInMaterial, null);
	}

	private void setHeadIdTaskProcessId(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getTaskProcessId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getTaskProcessId().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getTaskProcessId(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdTaskProcessIdmultiselectIDs(ids);
		putInMaterial.setHeadIdTaskProcessIdmultiselectNames(names);
	}
	private void dealHeadIdAdjustActive(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdAdjustActiveAddIds();
		String delIds = putInMaterial.getHeadIdAdjustActiveDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("adjustActive.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					WOMAdjustOrTempRecords indirectObj = new WOMAdjustOrTempRecords();
					indirectObj.setId(Long.valueOf(item));
					tmp.setAdjustActive(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdAdjustActive(WOMPutInMaterial putInMaterial) {
		setHeadIdAdjustActive(putInMaterial, null);
	}

	private void setHeadIdAdjustActive(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getAdjustActive() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getAdjustActive().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getAdjustActive(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdAdjustActivemultiselectIDs(ids);
		putInMaterial.setHeadIdAdjustActivemultiselectNames(names);
	}
	private void dealHeadIdTaskID(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdTaskIDAddIds();
		String delIds = putInMaterial.getHeadIdTaskIDDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("taskID.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					WOMProduceTask indirectObj = new WOMProduceTask();
					indirectObj.setId(Long.valueOf(item));
					tmp.setTaskID(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdTaskID(WOMPutInMaterial putInMaterial) {
		setHeadIdTaskID(putInMaterial, null);
	}

	private void setHeadIdTaskID(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getTaskID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getTaskID().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getTaskID(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdTaskIDmultiselectIDs(ids);
		putInMaterial.setHeadIdTaskIDmultiselectNames(names);
	}
	private void dealHeadIdWareID(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdWareIDAddIds();
		String delIds = putInMaterial.getHeadIdWareIDDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("wareID.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					MESBasicWare indirectObj = new MESBasicWare();
					indirectObj.setId(Long.valueOf(item));
					tmp.setWareID(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdWareID(WOMPutInMaterial putInMaterial) {
		setHeadIdWareID(putInMaterial, null);
	}

	private void setHeadIdWareID(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getWareID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getWareID().getId();
				String displayField = "wareName";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getWareID(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdWareIDmultiselectIDs(ids);
		putInMaterial.setHeadIdWareIDmultiselectNames(names);
	}
	private void dealHeadIdFormluActive(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdFormluActiveAddIds();
		String delIds = putInMaterial.getHeadIdFormluActiveDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("formluActive.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					RMFormulaProcessActive indirectObj = new RMFormulaProcessActive();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormluActive(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdFormluActive(WOMPutInMaterial putInMaterial) {
		setHeadIdFormluActive(putInMaterial, null);
	}

	private void setHeadIdFormluActive(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getFormluActive() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormluActive().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormluActive(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdFormluActivemultiselectIDs(ids);
		putInMaterial.setHeadIdFormluActivemultiselectNames(names);
	}
	private void dealHeadIdTaskActiveId(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdTaskActiveIdAddIds();
		String delIds = putInMaterial.getHeadIdTaskActiveIdDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("taskActiveId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					WOMProduceTaskActive indirectObj = new WOMProduceTaskActive();
					indirectObj.setId(Long.valueOf(item));
					tmp.setTaskActiveId(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdTaskActiveId(WOMPutInMaterial putInMaterial) {
		setHeadIdTaskActiveId(putInMaterial, null);
	}

	private void setHeadIdTaskActiveId(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getTaskActiveId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getTaskActiveId().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getTaskActiveId(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdTaskActiveIdmultiselectIDs(ids);
		putInMaterial.setHeadIdTaskActiveIdmultiselectNames(names);
	}
	private void dealHeadIdStoreID(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdStoreIDAddIds();
		String delIds = putInMaterial.getHeadIdStoreIDDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("storeID.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					MESBasicStoreSet indirectObj = new MESBasicStoreSet();
					indirectObj.setId(Long.valueOf(item));
					tmp.setStoreID(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdStoreID(WOMPutInMaterial putInMaterial) {
		setHeadIdStoreID(putInMaterial, null);
	}

	private void setHeadIdStoreID(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getStoreID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getStoreID().getId();
				String displayField = "placeSetName";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getStoreID(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdStoreIDmultiselectIDs(ids);
		putInMaterial.setHeadIdStoreIDmultiselectNames(names);
	}
	private void dealHeadIdFactoryId(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdFactoryIdAddIds();
		String delIds = putInMaterial.getHeadIdFactoryIdDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					MESBasicFactoryModel indirectObj = new MESBasicFactoryModel();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFactoryId(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdFactoryId(WOMPutInMaterial putInMaterial) {
		setHeadIdFactoryId(putInMaterial, null);
	}

	private void setHeadIdFactoryId(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getFactoryId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFactoryId().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFactoryId(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdFactoryIdmultiselectIDs(ids);
		putInMaterial.setHeadIdFactoryIdmultiselectNames(names);
	}
	private void dealHeadIdProductId(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdProductIdAddIds();
		String delIds = putInMaterial.getHeadIdProductIdDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					MESBasicProduct indirectObj = new MESBasicProduct();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProductId(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdProductId(WOMPutInMaterial putInMaterial) {
		setHeadIdProductId(putInMaterial, null);
	}

	private void setHeadIdProductId(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getProductId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getProductId().getId();
				String displayField = "productName";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getProductId(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdProductIdmultiselectIDs(ids);
		putInMaterial.setHeadIdProductIdmultiselectNames(names);
	}
	private void dealHeadIdProBatch(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdProBatchAddIds();
		String delIds = putInMaterial.getHeadIdProBatchDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("proBatch.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					WOMStandingcropRef indirectObj = new WOMStandingcropRef();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProBatch(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdProBatch(WOMPutInMaterial putInMaterial) {
		setHeadIdProBatch(putInMaterial, null);
	}

	private void setHeadIdProBatch(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getProBatch() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getProBatch().getId();
				String displayField = "batchText";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getProBatch(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdProBatchmultiselectIDs(ids);
		putInMaterial.setHeadIdProBatchmultiselectNames(names);
	}
	private void dealHeadIdPutinStaff(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getHeadIdPutinStaffAddIds();
		String delIds = putInMaterial.getHeadIdPutinStaffDeleteIds();
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
				List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial), Restrictions.in("putinStaff.id", idList), Restrictions.eq("valid", true));
				for (WOMPutInMaterialPart item : tmpList) {
					putInMaterialPartDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMPutInMaterialPart tmp = new WOMPutInMaterialPart();
					tmp.setHeadId(putInMaterial);
					Staff indirectObj = new Staff();
					indirectObj.setId(Long.valueOf(item));
					tmp.setPutinStaff(indirectObj);
					tmp.setCid(putInMaterial.getCid());
					putInMaterialPartDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdPutinStaff(WOMPutInMaterial putInMaterial) {
		setHeadIdPutinStaff(putInMaterial, null);
	}

	private void setHeadIdPutinStaff(WOMPutInMaterial putInMaterial, String viewCode) {
		List<WOMPutInMaterialPart> tmpList = putInMaterialPartDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", putInMaterial), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMPutInMaterialPart item : tmpList) {
			if(item.getPutinStaff() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getPutinStaff().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getPutinStaff(), displayField);
			}
		}
		putInMaterial.setPutInMaterialPartList(tmpList);
		putInMaterial.setHeadIdPutinStaffmultiselectIDs(ids);
		putInMaterial.setHeadIdPutinStaffmultiselectNames(names);
	}
	private void dealSupervision(WOMPutInMaterial putInMaterial) {
		String addIds = putInMaterial.getSupervisionAddIds();
		String delIds = putInMaterial.getSupervisionDeleteIds();
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
				putInMaterialDao.deleteSupervision(putInMaterial.getTableInfoId(), idList);
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					Supervision tmp = new Supervision();
					tmp.setTableInfoId(putInMaterial.getTableInfoId());
					Staff indirectObj = new Staff();
					indirectObj.setId(Long.valueOf(item));
					tmp.setStaff(indirectObj);
					putInMaterialDao.addSupervision(tmp, putInMaterial);
					// supervisionService.save(tmp);
				}
			}
		}
	}

	private void setSupervision(WOMPutInMaterial putInMaterial) {
		List<WOMPutInMaterialSupervision> tmpList = putInMaterialDao.findSupervision(putInMaterial.getTableInfoId());
		String ids = "";
		String names = "";
		for (WOMPutInMaterialSupervision item : tmpList) {
			if(item.getStaff() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getStaff().getId();
				names += item.getStaff().getName();
			}
		}
		putInMaterial.setSupervisionList(tmpList);
		putInMaterial.setSupervisionmultiselectIDs(ids);
		putInMaterial.setSupervisionmultiselectNames(names);
	}
	// ================ 生成多选控件数据保存方法 end ====================

	protected String getEntityCode(){return WOMPutInMaterial.ENTITY_CODE;}
	protected String getModuleCode(){return WOMPutInMaterial.MODULE_CODE;}
	protected String getModelCode(){return WOMPutInMaterial.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param putInMaterial 模型实例
	 */
	public void checkUniqueConstraint(WOMPutInMaterial putInMaterial){
		if(null == putInMaterial.getTableNo() || StringUtils.isEmpty(putInMaterial.getTableNo().toString())){
			return;
		}
		if(putInMaterial.getId()==null ){
			List<WOMPutInMaterial> putInMaterials = putInMaterialDao.findByCriteria(Restrictions.eq("tableNo", putInMaterial.getTableNo()));
			if(putInMaterials!=null && !putInMaterials.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), putInMaterial.getTableNo());
			}
		} else {
			List<WOMPutInMaterial> putInMaterials = putInMaterialDao.findByCriteria(Restrictions.ne("id", putInMaterial.getId()), Restrictions.eq("tableNo", putInMaterial.getTableNo()));
			if(putInMaterials!=null && !putInMaterials.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), putInMaterial.getTableNo());
			}
		}
	}
	
	
	@Override
	public List<WOMPutInMaterial> getPutInMaterials(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterial.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return putInMaterialDao.findByHql("from " + WOMPutInMaterial.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return putInMaterialDao.findByCriteria(detachedCriteria);
	}
	
	
	
	@Override
	public List<WOMPutInMaterial> findPutInMaterialsBySql(String sql, List<Object> params){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterial.class);
		if(params!=null && params.size()>0){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
			
		}else{
			detachedCriteria.add(Restrictions.sqlRestriction(sql));
		}
		
		return putInMaterialDao.findByCriteria(detachedCriteria);
	}
	@Override
	public List<WOMPutInMaterial> findPutInMaterialsByHql(String hql, Object... objects){
		
		return   putInMaterialDao.findByHql(hql, objects);
	}
	
	@Override
	public WOMPutInMaterial loadPutInMaterialByBussinessKey(WOMPutInMaterial putInMaterial){
		return loadPutInMaterialByBussinessKey(putInMaterial.getTableNo());
	}
	
	@Override
	public Page<WOMPutInMaterial> getPutInMaterials(Page<WOMPutInMaterial> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterial.class);
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
				page = putInMaterialDao.findByPage(page, sql);
			}else{
				page = putInMaterialDao.findAllByPage(page);
			}
			return page;
		}
		page = putInMaterialDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMPutInMaterial loadPutInMaterialByBussinessKey(Serializable bussinessKey){
		return putInMaterialDao.findEntityByCriteria(Restrictions.eq("tableNo", bussinessKey),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<WOMPutInMaterial> findByProperty(String propertyName, Object object){
		return putInMaterialDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMPutInMaterial findEntityByProperty(String propertyName, Object object){
		return putInMaterialDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<String> bussinessKeyList = Arrays.asList(bussinessKeys.split(","));
			String sql = "update " + WOMPutInMaterial.JPA_NAME + " set valid=0 where tableNo in (:businessKeys)";
			Query query = putInMaterialDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("WOM_7.5.0.0_putInMaterial_PutInMaterial","runtime");
		try {
			for(View dgv:dgviews){
				if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
					List<DataGrid> ldg=viewServiceFoundation.getDataGrids(dgv.getCode());
					for(DataGrid dg:ldg){
						bap_validate_datagrids+=dg.getName()+",";
						dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.WOM.entities."+dg.getTargetModel().getJpaName()));
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
				dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.WOM.entities."+dg.getTargetModel().getJpaName()));
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
		List<View> views = viewServiceFoundation.findViewsByEntityCode("WOM_7.5.0.0_putInMaterial", ViewType.VIEW);
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
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("WOM_7.5.0.0_putInMaterial_PutInMaterial","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	public void dealDatagridsSave(WOMPutInMaterial putInMaterial,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=viewServiceFoundation.getDataGrids(viewCode, "runtime");
		if(dgs!=null&&dgs.size()>0){
			putInMaterialDao.flush();
			Class _reflect_thisclass=this.getClass();
			try {
				for(DataGrid dg:dgs){
					if(null != dg.getDataGridType() && dg.getDataGridType() == 1){
						continue;
					}
					Class _reflect_dgclass=Class.forName("com.supcon.orchid.WOM.entities."+dg.getTargetModel().getJpaName());
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
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()).replaceAll("\r\n", "\\\\r\\\\n"), _reflect_dgclass,putInMaterialDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), WOMPutInMaterial.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, putInMaterial);
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
								((com.supcon.orchid.orm.entities.AbstractEcTreeEntity)odg).setTableInfoId(putInMaterial.getTableInfoId());
							}else{
								if (odg instanceof com.supcon.orchid.orm.entities.AbstractEcPartEntity) {
									((com.supcon.orchid.orm.entities.AbstractEcPartEntity)odg).setTableInfoId(putInMaterial.getTableInfoId());
								} else if ((odg instanceof com.supcon.orchid.orm.entities.AbstractEcFullEntity)) {
									((com.supcon.orchid.orm.entities.AbstractEcFullEntity)odg).setTableInfoId(putInMaterial.getTableInfoId());
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
								paramMap.put("mainModelId",putInMaterial.getTableInfoId());	
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
			String sql = "select " + businessKeyName +" from "+ WOMPutInMaterial.TABLE_NAME +" where valid = 1";
			list = putInMaterialDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ WOMPutInMaterial.TABLE_NAME;
			list = putInMaterialDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey){
		List<Object[]> list = new ArrayList<Object[]>();
		Map<Object, Object> m = new HashMap<Object, Object>();
		if(null != propertyName && null != businessKey){
			String sql = "select " + businessKey + "," + propertyName +" from "+ WOMPutInMaterial.TABLE_NAME +" group by " + propertyName + "," + businessKey;
			list = putInMaterialDao.createNativeQuery(sql).list();
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
	private WOMPutInMaterialDaoImpl putInMaterialDaoImpl;
	
	@Override
	@Transactional
	public String getTableNoById(Long id){
		String sql = "select table_no from " + WOMPutInMaterial.TABLE_NAME + " where id = ?";
		String tableNo = putInMaterialDao.createNativeQuery(sql,id).uniqueResult().toString();
		return tableNo;
	}
	
	@Override
	@Transactional
	public List<String> getTableNoData(){
		List<String> list = new ArrayList<String>();
		String sql = "select table_no from " + WOMPutInMaterial.TABLE_NAME;
		list = putInMaterialDao.createNativeQuery(sql).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchPutInMaterialWorkFlow(final List<WOMPutInMaterial> insertObjs, final List<WOMPutInMaterial> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){
		return this.importBatchPutInMaterialWorkFlow(insertObjs, updateObjs, columnInfo, entityCode, importNodeInfo, importPropInfo,null);		
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchPutInMaterialWorkFlow(final List<WOMPutInMaterial> insertObjs, final List<WOMPutInMaterial> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog){
			
		int importCount = 0;
		if (null != insertObjs) {
			importCount += insertObjs.size();
		}
		if (null != updateObjs) {
			importCount += updateObjs.size();
		}
		AuditUtil.setAuditDes(InternationalResource.get("foundation.import.bussiness.info.args",null,InternationalResource.get("WOM.modelname.randon1490604832447"),importCount));
		if(null != signatureLog && null == signatureLog.getOperateLogUuid()){
			if (null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()) {
				signatureLog.setOperateLogUuid((null == AuditUtil.getCurrentAudit().getOperationAudit().get_parentCode() || "-1".equals( AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode())) ? AuditUtil.getCurrentAudit().getOperationAudit().getUuid() : AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode());
			}
		}
		Map<Long, WOMPutInMaterial> oldUpdateObjsMap = new HashMap<Long, WOMPutInMaterial>(); 
		List<Long> updateObjIdsList = new ArrayList<Long>();
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {
			WOMPutInMaterial bizObj = updateObjs.get(updateIndex);
			updateObjIdsList.add(bizObj.getId());
		}
		if (updateObjIdsList.size() > 0) {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterial.class);
			if(updateObjIdsList.size()>1000){
				List<Long> updateObjIdsListBefore = updateObjIdsList.subList(0, 999);
				List<Long> updateObjIdsListAfter = updateObjIdsList.subList(999, updateObjIdsList.size());		
				detachedCriteria.add(Restrictions.or(Restrictions.in("id", updateObjIdsListBefore),Restrictions.in("id", updateObjIdsListAfter)));
			}else{
				detachedCriteria.add(Restrictions.in("id", updateObjIdsList));
			}
			List<WOMPutInMaterial> bizObjList = putInMaterialDao.findByCriteria(detachedCriteria);
			if (null != bizObjList) {
				for (int mIndex = 0; mIndex < bizObjList.size(); mIndex++) {
					WOMPutInMaterial bizObj = bizObjList.get(mIndex);
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
		
		final List<WOMPutInMaterial> nmeObjs = new ArrayList<WOMPutInMaterial>();
											
		for(WOMPutInMaterial putInMaterial:insertObjs){//没有table_no的新增项，系统生成
			if(putInMaterial.getTableNo() == null || (putInMaterial.getTableNo() != null && putInMaterial.getTableNo().equals(""))){
				putInMaterial.setTableNo(generateTableNo());	
			}
		}
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		//String idSql = "select id from " + WOMPutInMaterial.TABLE_NAME + " order by id desc";
		//Query query = putInMaterialDao.createNativeQuery(idSql).setMaxResults(1);
		/*String hql = "select id from " + WOMPutInMaterial.JPA_NAME + " order by id desc";
		Query query =  putInMaterialDao.createQuery(hql).setMaxResults(1);
		Long id = new Long(1000);
		if(null != query.uniqueResult()){
			id = Long.valueOf(query.uniqueResult().toString());
		}*/
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(WOMPutInMaterial.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(WOMPutInMaterial putInMaterial:insertObjs)  {
			//id = autoGeneratorID.getNextId(WOMPutInMaterial.TABLE_NAME,1,dbId);
			if(putInMaterial.getTableNo() != null && !putInMaterial.getTableNo().equals("") ){
				m.put(putInMaterial.getTableNo(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			putInMaterial.setId(id);
			id++;
		}
		
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) putInMaterialDao.createNativeQuery(sql, "WOM_7.5.0.0_putInMaterial_PutInMaterial"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		putInMaterialDaoImpl.getSession().doWork(new Work() {
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
					String updateSql = "UPDATE " + WOMPutInMaterial.TABLE_NAME + " SET ";
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
						WOMPutInMaterial putInMaterial = updateObjs.get(updateIndex);
						Long id = putInMaterial.getId();
						if(null != id){
							updateps.setLong(columnMaps.size()+1,id);
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = putInMaterial.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(putInMaterial);
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
							nmeObjs.add(putInMaterial);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + WOMPutInMaterial.TABLE_NAME + " (";
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
					String insertDiSql = "INSERT INTO " + WOMPutInMaterial.TABLE_NAME + "_DI " +
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
					Long diId = autoGeneratorID.getNextId(WOMPutInMaterial.TABLE_NAME + "_DI",insSize, "ID");
					Long dealInfoId = autoGeneratorID.getNextId("WF_DEAL_INFO",insSize);
					
					for(int insertIndex = 0; insertIndex<insSize; insertIndex++)  {
						WOMPutInMaterial putInMaterial = insertObjs.get(insertIndex);
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
							insertps.setLong(columnMaps.size() + 5, putInMaterial.getOwnerPositionId());
						if(!colExclude.contains(5))
                      		insertps.setInt(columnMaps.size() + 6, 0);
                      	if(!colExclude.contains(6))
                      		insertps.setString(columnMaps.size() + 7, "excelImport");
                      	if(!colExclude.contains(8))
							insertps.setLong(columnMaps.size() + 9, 1);
						if(!colExclude.contains(9))
							insertps.setString(columnMaps.size() + 10,putInMaterial.getPositionLayRec());
						if(!colExclude.contains(10))
							insertps.setLong(columnMaps.size() + 11,putInMaterial.getOwnerPosition().getDepartment().getId());
						java.util.Date date=new java.util.Date();
						if(!colExclude.contains(11))
							insertps.setTimestamp(columnMaps.size() + 12,new java.sql.Timestamp(date.getTime()));
						
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = putInMaterial.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(putInMaterial);
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
						putInMaterial.setId(id);
						nmeObjs.add(putInMaterial);
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
						ecTableInfops.setString(7,WOMPutInMaterial.TABLE_NAME);
						ecTableInfops.setInt(8,99);
						ecTableInfops.setLong(9,putInMaterial.getOwnerPosition().getId());
						ecTableInfops.setLong(10,putInMaterial.getOwnerStaff().getId());
						ecTableInfops.setString(11,entityCode);
						ecTableInfops.setString(12,putInMaterial.getPositionLayRec());
						ecTableInfops.setString(13,putInMaterial.getTableNo());
						ecTableInfops.setLong(14,putInMaterial.getOwnerPosition().getDepartment().getId());
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
		
		putInMaterialDaoImpl.getSession().flush();
		putInMaterialDaoImpl.getSession().clear();
		
		
		//记录导入数据日志（区分新增和修改）
		String sqlQueryBussinesskey = "select name from runtime_property  where model_code=? and valid=1 and is_bussiness_key=1";
		String sqlQueryMainDispaly = "select name from runtime_property  where model_code=? and valid=1 and is_main_display=1";
		Object retObjBussinesskey = putInMaterialDao.createNativeQuery(sqlQueryBussinesskey, "WOM_7.5.0.0_putInMaterial_PutInMaterial").setMaxResults(1).uniqueResult();
		String bussinesskeyFieldName = (null != retObjBussinesskey) ? retObjBussinesskey.toString() : null;
		Object retObjMainDispaly = putInMaterialDao.createNativeQuery(sqlQueryMainDispaly, "WOM_7.5.0.0_putInMaterial_PutInMaterial").setMaxResults(1).uniqueResult();
		String mainDispalyFieldName = (null != retObjMainDispaly) ? retObjMainDispaly.toString() : null;
		
		for(int insertIndex = 0; insertIndex < insertObjs.size(); insertIndex++)  {//新增
			WOMPutInMaterial bizObj = insertObjs.get(insertIndex);
			putInMaterialImportService.saveImportDataLog(bizObj, null, "tableNo", "id");
		}
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {//修改
			WOMPutInMaterial bizObj = updateObjs.get(updateIndex);
			WOMPutInMaterial oldBizObj = oldUpdateObjsMap.get(bizObj.getId());
			putInMaterialImportService.saveImportDataLog(bizObj, oldBizObj, "tableNo", "id");
		}
		
		return m;
	}
	
	
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getViewName(String modelCode){
		String sql = "select NAME from runtime_view where type='LIST' and ass_model_code = ?";
		String viewName = putInMaterialDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult()!=null?
				putInMaterialDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult().toString():"";
		return viewName;
	}
	
	
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = putInMaterialDao.createNativeQuery(sql, "WOM_7.5.0.0_putInMaterial_PutInMaterial").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = putInMaterialDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = putInMaterialDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = putInMaterialDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?putInMaterialDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  putInMaterialDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,putInMaterialDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1490605831075Page(Page<WOMPutInMaterialPart> dg1490605831075Page,WOMPutInMaterial putInMaterial, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
		criteria.add(Restrictions.eq("headId", putInMaterial));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"putInMaterialPart\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		putInMaterialPartDao.findByPage(dg1490605831075Page, criteria);
		putInMaterialPartService.findByNormalDataGridPutInMaterial(dg1490605831075Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1491534562130Page(Page<WOMPutInMaterialPart> dg1491534562130Page,WOMPutInMaterial putInMaterial, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
		criteria.add(Restrictions.eq("headId", putInMaterial));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"putInMaterialPart\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		putInMaterialPartDao.findByPage(dg1491534562130Page, criteria);
		putInMaterialPartService.findByNormalDataGridPutInMaterial(dg1491534562130Page);
	}
	
	 
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.save")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial, DataGridService dataGridService){
		savePutInMaterial(putInMaterial, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.save")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial, DataGridService dataGridService, String viewCode){
		savePutInMaterial(putInMaterial, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		this.savePutInMaterial(putInMaterial, dataGridService, viewCode, eventTopic,null,isImport);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void savePutInMaterial(WOMPutInMaterial putInMaterial, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog, boolean... isImport){
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		String url = null;
		if(null != putInMaterial.getId() && putInMaterial.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/add";
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
				executeGScript(entityCode, "beforeSave", events, putInMaterial);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		beforeSavePutInMaterial(putInMaterial, viewIsView);

		if (null == putInMaterial.getId()) {
			if(null == putInMaterial.getStatus()){
				putInMaterial.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			putInMaterial.setTableNo(generateTableNo());
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				if(isNew)
					putInMaterialDao.save(putInMaterial);
				else
					putInMaterialDao.merge(putInMaterial);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(putInMaterial,isImport);
				putInMaterialDao.saveTableInfo(ti);
				putInMaterial.setTableInfoId(ti.getId());
				if(putInMaterial.getOwnerStaffId()==null){
					putInMaterial.setOwnerStaffId(putInMaterial.getCreateStaffId());
					ti.setOwnerStaffId(putInMaterial.getCreateStaffId());
				}
				if(putInMaterial.getOwnerDepartmentId()==null){
					putInMaterial.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
					ti.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
				}
				if(putInMaterial.getOwnerPositionId()==null){
					putInMaterial.setOwnerPositionId(putInMaterial.getCreatePositionId());
					ti.setOwnerPositionId(putInMaterial.getCreatePositionId());
				}
				putInMaterial.setCreateStaffId(putInMaterial.getCreateStaffId());
				putInMaterial.setCreatePositionId(putInMaterial.getCreatePositionId());
				putInMaterial.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (putInMaterial.getCompany() == null) {
					putInMaterial.setCompany(getCurrentCompany());
				}
				if (putInMaterial.getCid() == null || putInMaterial.getCid() == -1l) {
					putInMaterial.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					putInMaterialDao.saveWithRevertVersion(putInMaterial);
				} else {
					putInMaterialDao.save(putInMaterial);
				}
				
		} else {
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				if(isNew)
					putInMaterialDao.save(putInMaterial);
				else
					putInMaterialDao.merge(putInMaterial);
			}
		}
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		if (dataGridService != null) {
			putInMaterialDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealHeadIdTaskProcessId(putInMaterial);
			this.dealHeadIdAdjustActive(putInMaterial);
			this.dealHeadIdTaskID(putInMaterial);
			this.dealHeadIdWareID(putInMaterial);
			this.dealHeadIdFormluActive(putInMaterial);
			this.dealHeadIdTaskActiveId(putInMaterial);
			this.dealHeadIdStoreID(putInMaterial);
			this.dealHeadIdFactoryId(putInMaterial);
			this.dealHeadIdProductId(putInMaterial);
			this.dealHeadIdProBatch(putInMaterial);
			this.dealHeadIdPutinStaff(putInMaterial);
			this.dealSupervision(putInMaterial);
		
		// 根据配置规则生成编码
		try {
			generatePutInMaterialCodes(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generatePutInMaterialSummarys(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSavePutInMaterial(putInMaterial, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, putInMaterial);
			}
		}
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		putInMaterialDao.flush();
		putInMaterialDao.clear();
		putInMaterial = putInMaterialDao.load(putInMaterial.getId());
		
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		
		params.add(putInMaterial);
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=putInMaterial.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(putInMaterial.getId());
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_putInMaterial#modelCode:WOM_7.5.0.0_putInMaterial_PutInMaterial#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public Map<Object, Object> putInMaterialDataGridImport(WOMPutInMaterial putInMaterial, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport){
		Map<Object, Object> map = new HashMap<Object, Object>();
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		String url = null;
		if(putInMaterial.getId() != null && putInMaterial.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/add";
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
				executeGScript(entityCode, "beforeSave", events, putInMaterial);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		beforeSavePutInMaterial(putInMaterial, viewIsView);

		if (null == putInMaterial.getId()) {
			if(null == putInMaterial.getStatus()){
				putInMaterial.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			putInMaterial.setTableNo(generateTableNo());
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				if(isNew)
					putInMaterialDao.save(putInMaterial);
				else
					putInMaterialDao.merge(putInMaterial);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(putInMaterial,isImport);
				putInMaterialDao.saveTableInfo(ti);
				putInMaterial.setTableInfoId(ti.getId());
				if(putInMaterial.getOwnerStaffId()==null){
					putInMaterial.setOwnerStaffId(putInMaterial.getCreateStaffId());
					ti.setOwnerStaffId(putInMaterial.getCreateStaffId());
				}
				if(putInMaterial.getOwnerDepartmentId()==null){
					putInMaterial.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
					ti.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
				}
				if(putInMaterial.getOwnerPositionId()==null){
					putInMaterial.setOwnerPositionId(putInMaterial.getCreatePositionId());
					ti.setOwnerPositionId(putInMaterial.getCreatePositionId());
				}
				putInMaterial.setCreateStaffId(putInMaterial.getCreateStaffId());
				putInMaterial.setCreatePositionId(putInMaterial.getCreatePositionId());
				putInMaterial.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (putInMaterial.getCompany() == null) {
					putInMaterial.setCompany(getCurrentCompany());
				}
				if (putInMaterial.getCid() == null || putInMaterial.getCid() == -1l) {
					putInMaterial.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					putInMaterialDao.saveWithRevertVersion(putInMaterial);
				} else {
					putInMaterialDao.save(putInMaterial);
				}
				
		} else {
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				if(isNew)
					putInMaterialDao.save(putInMaterial);
				else
					putInMaterialDao.merge(putInMaterial);
			}
		}

		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		
		if (dataGridService != null) {
			putInMaterialDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealHeadIdTaskProcessId(putInMaterial);
			this.dealHeadIdAdjustActive(putInMaterial);
			this.dealHeadIdTaskID(putInMaterial);
			this.dealHeadIdWareID(putInMaterial);
			this.dealHeadIdFormluActive(putInMaterial);
			this.dealHeadIdTaskActiveId(putInMaterial);
			this.dealHeadIdStoreID(putInMaterial);
			this.dealHeadIdFactoryId(putInMaterial);
			this.dealHeadIdProductId(putInMaterial);
			this.dealHeadIdProBatch(putInMaterial);
			this.dealHeadIdPutinStaff(putInMaterial);
			this.dealSupervision(putInMaterial);
		
		// 根据配置规则生成编码
		try {
			generatePutInMaterialCodes(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generatePutInMaterialSummarys(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSavePutInMaterial(putInMaterial, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, putInMaterial);
			}
		}
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		putInMaterialDao.flush();
		putInMaterialDao.clear();
		
		String virturalId = putInMaterial.getVirtualId();
		
		putInMaterial = putInMaterialDao.load(putInMaterial.getId());
		
		if(virturalId != null && virturalId.length() > 0){
			map.put(virturalId, putInMaterial.getId());
		}else{
			String methodName = "get" + businessKey.getName().substring(0, 1).toUpperCase() + businessKey.getName().substring(1);
			Object bkValue = null;
			try {
				Method getBkValue = putInMaterial.getClass().getMethod(methodName);
				bkValue = getBkValue.invoke(putInMaterial);
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				log.error(e.getMessage(), e);
			}
			map.put(bkValue, putInMaterial.getId());
		}
		
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		
		params.add(putInMaterial);
		return map;
	}
	
	 
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void mergePutInMaterial(WOMPutInMaterial putInMaterial, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		beforeSavePutInMaterial(putInMaterial);
		if (null == putInMaterial.getId()) {
			putInMaterial.setStatus(EntityTableInfo.STATUS_RUNNING);
			putInMaterial.setTableNo(generateTableNo());
			putInMaterialDao.save(putInMaterial);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(putInMaterial);
				putInMaterialDao.saveTableInfo(ti);
				putInMaterial.setTableInfoId(ti.getId());
				if(putInMaterial.getOwnerStaffId()==null){
					putInMaterial.setOwnerStaffId(putInMaterial.getCreateStaffId());
				}
				if(putInMaterial.getOwnerDepartmentId()==null){
					putInMaterial.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
				}
				if(putInMaterial.getOwnerPositionId()==null){
					putInMaterial.setOwnerPositionId(putInMaterial.getCreatePositionId());
				}
				putInMaterial.setCreateStaffId(putInMaterial.getCreateStaffId());
				putInMaterial.setCreatePositionId(putInMaterial.getCreatePositionId());
				putInMaterial.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (putInMaterial.getCompany() == null) {
					putInMaterial.setCompany(getCurrentCompany());
				}
				if (putInMaterial.getCid() == null || putInMaterial.getCid() == -1l) {
					putInMaterial.setCid(getCurrentCompanyId());
				}
				putInMaterialDao.merge(putInMaterial);
		} else {
			putInMaterialDao.merge(putInMaterial);
		}
		
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		
		if (dataGridService != null) {
			dataGridService.execute();
		}

			// 一对多情况处理
			this.dealHeadIdTaskProcessId(putInMaterial);
			this.dealHeadIdAdjustActive(putInMaterial);
			this.dealHeadIdTaskID(putInMaterial);
			this.dealHeadIdWareID(putInMaterial);
			this.dealHeadIdFormluActive(putInMaterial);
			this.dealHeadIdTaskActiveId(putInMaterial);
			this.dealHeadIdStoreID(putInMaterial);
			this.dealHeadIdFactoryId(putInMaterial);
			this.dealHeadIdProductId(putInMaterial);
			this.dealHeadIdProBatch(putInMaterial);
			this.dealHeadIdPutinStaff(putInMaterial);
			this.dealSupervision(putInMaterial);
		afterSavePutInMaterial(putInMaterial);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.exportExcel",operType="11")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.print.page.print",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes(InternationalResource.get("ec.print.page.print"));
		}else if(printType == 1){
			AuditUtil.setAuditDes(InternationalResource.get("ec.view.controlPrint"));
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.batch.save",operType="4")
	public void batchSavePutInMaterial(WOMPutInMaterial putInMaterial, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_putInMaterial");
		String url = null;
		if(putInMaterial.getId()!=null && putInMaterial.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_putInMaterial/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, putInMaterial);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		beforeSavePutInMaterial(putInMaterial, viewIsView);

		if (null == putInMaterial.getId()) {
			if(null == putInMaterial.getStatus()){
				putInMaterial.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			putInMaterial.setTableNo(generateTableNo());
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				putInMaterialDao.save(putInMaterial);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(putInMaterial,isImport);
			putInMaterialDao.saveTableInfo(ti);
			putInMaterial.setTableInfoId(ti.getId());
			if(putInMaterial.getOwnerStaffId()==null){
				putInMaterial.setOwnerStaffId(putInMaterial.getCreateStaffId());
				ti.setOwnerStaffId(putInMaterial.getCreateStaffId());
			}
			if(putInMaterial.getOwnerDepartmentId()==null){
				putInMaterial.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
				ti.setOwnerDepartmentId(putInMaterial.getCreateDepartmentId());
			}
			if(putInMaterial.getOwnerPositionId()==null){
				putInMaterial.setOwnerPositionId(putInMaterial.getCreatePositionId());
				ti.setOwnerPositionId(putInMaterial.getCreatePositionId());
			}
			putInMaterial.setCreateStaffId(putInMaterial.getCreateStaffId());
			putInMaterial.setCreatePositionId(putInMaterial.getCreatePositionId());
			putInMaterial.setCreateDepartmentId(putInMaterial.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (putInMaterial.getCompany() == null) {
				putInMaterial.setCompany(getCurrentCompany());
			}
			if (putInMaterial.getCid() == null || putInMaterial.getCid() == -1l) {
				putInMaterial.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				putInMaterialDao.save(putInMaterial);
			}
		} else {
			if (viewIsView) {
				putInMaterialDao.saveWithRevertVersion(putInMaterial);
			} else {
				putInMaterialDao.merge(putInMaterial);
			}
		}

		if (dataGridService != null) {
			putInMaterialDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealHeadIdTaskProcessId(putInMaterial);
			this.dealHeadIdAdjustActive(putInMaterial);
			this.dealHeadIdTaskID(putInMaterial);
			this.dealHeadIdWareID(putInMaterial);
			this.dealHeadIdFormluActive(putInMaterial);
			this.dealHeadIdTaskActiveId(putInMaterial);
			this.dealHeadIdStoreID(putInMaterial);
			this.dealHeadIdFactoryId(putInMaterial);
			this.dealHeadIdProductId(putInMaterial);
			this.dealHeadIdProBatch(putInMaterial);
			this.dealHeadIdPutinStaff(putInMaterial);
			this.dealSupervision(putInMaterial);
		
		// 根据配置规则生成编码
		try {
			generatePutInMaterialCodes(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generatePutInMaterialSummarys(putInMaterial, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSavePutInMaterial(putInMaterial, viewIsView);


		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, putInMaterial);
			}
		}
		List<WOMPutInMaterial> params = new ArrayList<WOMPutInMaterial>();
		putInMaterialDao.flush();
		putInMaterialDao.clear();
		putInMaterial = putInMaterialDao.load(putInMaterial.getId());
		
		List<WOMPutInMaterialPart> putInMaterialPartList = putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial));
		putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
		
		params.add(putInMaterial);
	}
	
	@Override
	public Page<WOMPutInMaterial> getByPage(Page<WOMPutInMaterial> page,DetachedCriteria detachedCriteria){
		return putInMaterialDao.findByPage(page, detachedCriteria);
	}
	@Override
	public List<WOMPutInMaterialPart> getPutInMaterialPartList(WOMPutInMaterial putInMaterial){
		return putInMaterialPartDao.findByCriteria(Restrictions.eq("headId", putInMaterial),Restrictions.eq("valid", true));
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.common.super.edit",operType="4")
	public void saveSuperEditPutInMaterial(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditPutInMaterial(workFlowVar, dataGridService, view, entityCode, events, putInMaterial, isImport);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="foundation.batch.import")
	public void batchSaveSuperEditPutInMaterial(List<WOMPutInMaterial>  putInMaterials, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(WOMPutInMaterial putInMaterial:putInMaterials)  {
			saveSingleSuperEditPutInMaterial(workFlowVar, dataGridService, view, entityCode, events, putInMaterial, isImport);
		}
	}
	
	
	
	private void saveSingleSuperEditPutInMaterial(WorkFlowVar workFlowVar, DataGridService dataGridService, View view, String entityCode, List<Event> events,WOMPutInMaterial putInMaterial, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, putInMaterial);
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
		workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		workFlowVar.setStatus(putInMaterial);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		putInMaterial.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (putInMaterial.getId() == null) {
			putInMaterial.setStatus(EntityTableInfo.STATUS_EFFECTED);
			putInMaterial.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitPutInMaterial(putInMaterial, workFlowVar, true);
		batchSavePutInMaterial(putInMaterial, dataGridService, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(putInMaterial.getTableInfoId(), isSuperAdd,isImport);
		putInMaterialDao.flush();
		workFlowVar.setModelId(putInMaterial.getId());
		workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
		workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
		workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		workFlowVar.setTableNo(putInMaterial.getTableNo());
		
		afterSubmitProcessPutInMaterial(putInMaterial, di, workFlowVar, view.getCode(), true);
		afterSubmitPutInMaterial(putInMaterial, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, putInMaterial);
			}
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void save(WOMPutInMaterial putInMaterial,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		save(putInMaterial, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial")
	public void save(WOMPutInMaterial putInMaterial, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		boolean first = null == putInMaterial.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != putInMaterial.getCreateStaff() && null != putInMaterial.getCreateStaff().getUser()){
		    	createStaffUserId = putInMaterial.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
			workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		}
		putInMaterial.setWorkFlowVar(workFlowVar);
		if(putInMaterial.getDeploymentId() == null && deploymentId != null) {
			putInMaterial.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				putInMaterial.setProcessKey(d.getProcessKey());
				putInMaterial.setProcessVersion(d.getProcessVersion());
			}
		}

		savePutInMaterial(putInMaterial, dataGridService, viewCode);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(putInMaterial.getId());
			workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
			workFlowVar.setTableNo(putInMaterial.getTableNo());
			workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
			workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(putInMaterial, instance, deploymentId, pendingId, workFlowVar);
		putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
		putInMaterialDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessPutInMaterial(putInMaterial, di, workFlowVar, viewCode);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.submit",operType="4")
	public void submit(WOMPutInMaterial putInMaterial,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		submit(putInMaterial, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_putInMaterial",model="WOM_7.5.0.0_putInMaterial_PutInMaterial",desc="ec.flow.submit",operType="4")
	public void submit(WOMPutInMaterial putInMaterial, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, putInMaterial);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
		workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		workFlowVar.setStatus(putInMaterial);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		putInMaterial.setWorkFlowVar(workFlowVar);
		if(putInMaterial.getDeploymentId() == null && deploymentId != null) {
			putInMaterial.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				putInMaterial.setProcessKey(d.getProcessKey());
				putInMaterial.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitPutInMaterial(putInMaterial, workFlowVar);
		savePutInMaterial(putInMaterial, dataGridService, viewCode);
		if(null != putInMaterial && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMPutInMaterial.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == putInMaterial.getTableNo() ? "" : putInMaterial.getTableNo().toString());
			AuditUtil.setColumnStringA(null == putInMaterial.getId() ? "" : putInMaterial.getId().toString());
			AuditUtil.setColumnStringC(putInMaterial.getId().toString());
		}
		putInMaterialDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(putInMaterial.getId());
		workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
		workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
		workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		workFlowVar.setTableNo(putInMaterial.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, putInMaterial.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(putInMaterial, di, deploymentId, pendingId, workFlowVar, true);
			putInMaterialDao.copyAndSaveDealInfo(saveDi, putInMaterial, creatorService.getStaffFromSession());
		}
		putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					putInMaterialDao.flush();
					
					WOMPutInMaterialDealInfo putInMaterialDealInfo=putInMaterialDao.copyAndSaveDealInfo(di, putInMaterial, creatorService.getStaffFromSession());
					putInMaterialDealInfo.setOutcome(outcome);
					putInMaterialDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						putInMaterialDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				putInMaterialDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(putInMaterial.getStatus() == 99) {
			putInMaterialDao.deleteSupervision(putInMaterial.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + putInMaterial.getProcessKey() + "_" + di.getActivityName() + "_WOM_7.5.0.0_putInMaterial_" + putInMaterial.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		putInMaterialDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessPutInMaterial(putInMaterial, di, workFlowVar, viewCode);
		afterSubmitPutInMaterial(putInMaterial, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, putInMaterial);
			}
		}
	}
	
	public String generateTableNo(){
		this.counter.setPattern(modelServiceFoundation.getEntity("WOM_7.5.0.0_putInMaterial").getPrefix()+"_{1,date,yyyyMMdd}_{0,number,000}");
		return this.counter.incrementAndGetString(new Date(),new Date());
	}
	private void beforeSavePutInMaterial(WOMPutInMaterial putInMaterial, Object... objects){
		checkUniqueConstraint(putInMaterial);
	/* CUSTOM CODE START(serviceimpl,beforeSave,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSavePutInMaterial(WOMPutInMaterial putInMaterial, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

		//将表头字段信息冗余到表体
		List<WOMPutInMaterialPart> parts=putInMaterialPartService.getPutInMaterialParts("headId="+putInMaterial.getId(), null);
		for(WOMPutInMaterialPart part:parts){
			part.setTaskID(putInMaterial.getTaskID());
			part.setPutinStaff(putInMaterial.getPutinStaff());
			part.setPutinType(putInMaterial.getPutinType());
			if(part.getProBatch()!=null){
				part.setBatchNum(part.getProBatch().getBatchText());
			}
			putInMaterialPartDao.merge(part);
		}
/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportPutInMaterial(List<WOMPutInMaterial> putInMaterials, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportPutInMaterial(List<WOMPutInMaterial> putInMaterials){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportPutInMaterial(List<WOMPutInMaterial> putInMaterials, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportPutInMaterial(List<WOMPutInMaterial> putInMaterials){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	private void beforeDeletePutInMaterial(WOMPutInMaterial putInMaterial){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterDeletePutInMaterial(WOMPutInMaterial putInMaterial){
	/* CUSTOM CODE START(serviceimpl,afterDelete,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRestorePutInMaterial(WOMPutInMaterial putInMaterial){
	/* CUSTOM CODE START(serviceimpl,beforeRestore,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterRestorePutInMaterial(WOMPutInMaterial putInMaterial){
	/* CUSTOM CODE START(serviceimpl,afterRestore,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void customGenerateCodes(WOMPutInMaterial putInMaterial, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(WOMPutInMaterial putInMaterial, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeSubmitPutInMaterial(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,beforeSubmit,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeSubmitPutInMaterial(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,beforeSubmitSuperEdit,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitPutInMaterial(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,afterSubmit,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码
		//生产报工生效时执行
		//生成入库单
      		final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		if(putInMaterial.getStatus()==99){
			//赋值表体结束时间
			String hql_1 = "from WOMPutInMaterialPart where valid = 1 and headId = ?)";
			List<WOMPutInMaterialPart> putInMaterialPartList = taskReportingDao.findByHql(hql_1,putInMaterial);
			for (WOMPutInMaterialPart putInMaterialPart : putInMaterialPartList) {
				if(putInMaterialPart.getPutinEndDate()==null){
					if(putInMaterialPart.getPutinDate()==null){
						putInMaterialPart.setPutinDate(new Date());
					}
					putInMaterialPart.setPutinEndDate(new Date());
					long takeTime = (putInMaterialPart.getPutinEndDate().getTime()-putInMaterialPart.getPutinDate().getTime())/(1000*60);
					putInMaterialPart.setTakeTime((int) takeTime);
					putInMaterialPartDao.merge(putInMaterialPart);
				}
			}

			String hql = "from WOMProduceTask where valid = 1 and id = ?)";
			List<WOMProduceTask> rangPlanDailyList = taskReportingDao.findByHql(hql,putInMaterial.getTaskID().getId());
			WOMProduceTask womProduceTask = rangPlanDailyList.get(0);
			if(womProduceTask.getTaskState()==null  || womProduceTask.getTaskState().getId().equals("womTaskState/01") ){
				womProduceTask.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/02"));//投料单生效将指令单状态设为执行中
				//投料单生效时回填指令单实际开始时间
				womProduceTask.setActStartTime(new Date());
				produceTaskDao.merge(womProduceTask);
			}
			//是否启用MES物料管理
			Boolean isProBatch=consulService.getValueAsBoolean("platform/bap/WOM/WOM.mesProBatch");
			//如果不启用，不生成出库单
			if(isProBatch){
				// 调用仓库接口，实现出库
				List<Map> inoutMaplist = new ArrayList<Map>();
			 	Gson g = new Gson();
				//查找表体数据
				String hqlChart = "from WOMPutInMaterialPart where valid = 1 and headId = ? ";
				List<WOMPutInMaterialPart> taskReportingPartList = taskReportingDao.findByHql(hqlChart,putInMaterial);
				//查找所有仓库
				String hqlString = "from MESBasicWare where valid = ?";
				List<MESBasicWare> wareList = taskReportingDao.findByHql(hqlString, true);
				//遍历仓库
				for (MESBasicWare mesBasicWare : wareList) {
					Map<String, Object> inoutMap = new HashMap<String, Object>();

					//根据委托类型来区别出入库
					inoutMap.put("staffCode", putInMaterial.getCreateStaff().getCode());// 制单人员编码
					inoutMap.put("deptCode", putInMaterial.getCreateStaff().getMainPosition().getDepartment().getCode());// 制单部门编码
					inoutMap.put("workflowStateSetCode", "produceOutSingleFlw");// 工作流配置实体编码
					inoutMap.put("wareCode", mesBasicWare.getWareCode());// 仓库编码必填
					inoutMap.put("comeType", "produceOut");// 出库用途/入库原因编码必填
					inoutMap.put("redBlue", "redBlue/redBlue02");// 红蓝字
					String dateStr = formatter.format(new Date());
					inoutMap.put("storageDate",dateStr);// 出入库时间
					inoutMap.put("useDeptCode", putInMaterial.getPutinStaff().getMainPosition().getDepartment().getCode());// 领用部门编码
					inoutMap.put("useStaffCode", putInMaterial.getPutinStaff().getCode());// 领用人员编码
					inoutMap.put("srcID", putInMaterial.getId().toString());// 生成的出入库单上级来源记录
					inoutMap.put("srcType", "putInMaterial");// 生成的出入库单上级来源记录
					inoutMap.put("srcNo", putInMaterial.getTableNo().toString());// 生成的出入库单上级表单编号
					//inoutMap.put("comeTypeId", "1014");// 生产出库单类型id
                  
					//遍历表体，根据表体仓库字段进行区分
					List<Map<String,String>> detailList = new ArrayList<Map<String,String>>();
					//以下是表头封装
					for (WOMPutInMaterialPart womPutInMaterialPart : taskReportingPartList) {
						//选择同一个仓库下的表体
						if(womPutInMaterialPart.getWareID()!=null && womPutInMaterialPart.getWareID().getId()==mesBasicWare.getId()){
							Map<String, String> detailMap = new HashMap<String, String>();
							if(womPutInMaterialPart.getProductId() !=null){
								detailMap.put("goodCode", productService.getProduct(womPutInMaterialPart.getProductId().getId()).getProductCode());// 物品编码
							}
							if(womPutInMaterialPart.getBatchNum()!=null && womPutInMaterialPart.getBatchNum()!=""){
								detailMap.put("batchText", womPutInMaterialPart.getBatchNum());// 出库批号
							}
							if(womPutInMaterialPart.getUseNum()!=null){
								if(womPutInMaterialPart.getLossNum()!=null){
									detailMap.put("quantity", womPutInMaterialPart.getUseNum().add(womPutInMaterialPart.getLossNum()).toString());// 出库数量
								}else{
									detailMap.put("quantity", womPutInMaterialPart.getUseNum().toString());// 出库数量
								}
							}
							if(womPutInMaterialPart.getStoreID()!=null && womPutInMaterialPart.getStoreID().getId()!=null ){
								detailMap.put("placeSetCode", womPutInMaterialPart.getStoreID().getId().toString());// 货位
							}
							if(womPutInMaterialPart.getWareID()!=null && womPutInMaterialPart.getWareID().getId()!=null){
								detailMap.put("wareID", womPutInMaterialPart.getWareID().getId().toString());// 仓库
							}
                          
							detailList.add(detailMap);
                          
							/*boolean ifAdd = false;
							if(detailMapList!=null && detailMapList.size()>0){
								for (Map<String, String> map : detailMapList) {
									//当仓库货位物品相同时，合并
									if(map.get("storeID")==null){
										if(map.get("goodCode").toString().equals(detailMap.get("goodCode").toString())
												&& map.get("batchID").toString().equals(detailMap.get("batchID").toString())
												&& map.get("wareID").toString().equals(detailMap.get("wareID").toString())){
											Float sum = Float.parseFloat(map.get("quantity").toString())+Float.parseFloat(detailMap.get("quantity").toString());
											map.put("quantity", sum.toString());
											ifAdd = false;
											break;
										}else{
											ifAdd = true;

										}
									}else{
										if(map.get("goodCode").toString().equals(detailMap.get("goodCode").toString())
												&& map.get("batchID").toString().equals(detailMap.get("batchID").toString())
												&& map.get("storeID").toString().equals(detailMap.get("storeID").toString())){
											Float sum = Float.parseFloat(map.get("quantity").toString())+Float.parseFloat(detailMap.get("quantity").toString());
											map.put("quantity", sum.toString());
											ifAdd = false;
											break;
										}else{
											ifAdd = true;

										}
									}
								}
							}else{
								detailMapList.add(detailMap);
							}
							if(ifAdd){
								detailMapList.add(detailMap);
								ifAdd = false;
							}*/
						}
					}
                 
					//当表体不为空时，添加记录，生成出库单
					if(!detailList.isEmpty()){
						inoutMap.put("detailList", detailList);
						HashMap<String, Object> paraMap = new HashMap<>();
						//String jsonStrInMaterial = "{\"staffCode\": \"\",\"deptCode\": \"\",\"workflowStateSetCode\": \"produceOutSingleFlw\",\"wareCode\": \"\",\"comeType\": \"produceOut\", \"redBlue\": \"redBlue/redBlue02\",\"storageDate\": \"2019-05-15\",\"useDeptCode\": \"\",\"useStaffCode\": \"\",\"memo\": \"\",\"detailList\": [{\"placeSetCode\": \"\",\"goodCode\": \"\",\"batchText\": \"\",\"quantity\": \"\",\"memo\": \"\",\"srcPartId\": \"\",\"checkInfo\": \"\",\"bodyCustomMap\": {}}],\"srcId\": \"\",\"srcTableNo\": \"\",\"srcType\": \"\",\"headCustomMap\": {}}";
						paraMap.put("jsonParam", g.toJson(inoutMap));
						paraMap.put("userName",putInMaterial.getPutinStaff().getUser().getName());
						paraMap.put("companyCode", "defaultCompany");

						String jsonResult = sendPostNormal("http://192.168.90.178:8080/public/material/produceOutSingle/generateProduceOutSingle.action", paraMap);
						Map<String, Object> resultMap = (Map<String, Object>) JSONUtil.generateMapFromJson(jsonResult);
						if ("FAILURE".equals(resultMap.get("resFlag"))){
							throw new BAPException(resultMap.get("errorMsg").toString());
						}
						//inoutMaplist.add(inoutMap);
					}                 	
				}

				/*ServiceReference ref = bundleContext.getServiceReference(WomMaterialService.class.getName());
				if (null != ref) {
					WomMaterialService materialService = (WomMaterialService) bundleContext.getService(ref);
					String jieguo =materialService.womMaterialCreate(inoutMaplist);
					if(jieguo !=null){
						throw new BAPException(jieguo);
					}
				}*/
			}
			//生成批次处理信息表
			//查找表体数据
			String hqlChart = "from WOMPutInMaterialPart where valid = 1 and headId = ? ";
			List<WOMPutInMaterialPart> taskReportingPartList = taskReportingDao.findByHql(hqlChart,putInMaterial);
			for (WOMPutInMaterialPart putInMaterialPart : taskReportingPartList) {
				//生成批次处理信息
				PublicSetBatchDeal batchDealinfo = new PublicSetBatchDeal();
				batchDealinfo.setBatchNum(putInMaterialPart.getBatchNum());
				batchDealinfo.setProduct(putInMaterialPart.getProductId());
				batchDealinfo.setDealDate(new Date());
				batchDealinfo.setDealStaff((Staff)getCurrentUser().getReferenceStaff());
				batchDealinfo.setDealDept(((Position) ((Staff)getCurrentUser().getReferenceStaff()).getMainPosition()).getDepartment());
				batchDealinfo.setDealTableID(putInMaterial.getTableInfoId());
				batchDealinfo.setDealTableNo(putInMaterial.getTableNo());
				batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_putInMaterial_putinView","WOM_7.5.0.0_putInMaterial_putinList", putInMaterial.getTableInfoId(), putInMaterial.getId()));
				batchDealinfo.setAmount(putInMaterialPart.getUseNum());
				if(putInMaterialPart.getLossNum()!=null && !putInMaterialPart.getLossNum().equals("")){
					batchDealinfo.setRemark("投料单生效，损耗数量："+putInMaterialPart.getLossNum());
				}else {
					batchDealinfo.setRemark("投料单生效");
				}
				batchDealinfo.setDealType((SystemCode) systemCodeService.getSystemCode("publicSetDealWay/putInMaterial"));
				batchDealinfo.setSourceBatchNum(putInMaterial.getTaskID().getProductBatchNum());
				batchDealinfo.setTableState((SystemCode) systemCodeService.getSystemCode("publicSetTableState/02"));
				batchDealService.saveBatchDealInfoData(batchDealinfo);

				//生成批次冠词表
				PublicSetBatchRelate batchRelation = new PublicSetBatchRelate();
				batchRelation.setMainBatch(putInMaterial.getTaskID().getProductBatchNum());
				batchRelation.setMainProduct(putInMaterial.getTaskID().getProductId());
				batchRelation.setPartBatch(putInMaterialPart.getBatchNum());
				batchRelation.setPartProduct(putInMaterialPart.getProductId());
				batchRelation.setBatchType((SystemCode) systemCodeService.getSystemCode("publicSetBatchType/01"));
				batchRelateService.saveBatchRelate(batchRelation, null);
			}
		}
/* CUSTOM CODE END */
	}
	
	private void afterSubmitPutInMaterial(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,afterSubmitSuperEdit,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码
		afterSubmitPutInMaterial(putInMaterial,workFlowVar);
/* CUSTOM CODE END */
	}
	
	private void beforeRetrial(WOMPutInMaterial putInMaterial){
	/* CUSTOM CODE START(serviceimpl,beforeRetrial,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterRetrial(WOMPutInMaterial putInMaterial){
	/* CUSTOM CODE START(serviceimpl,afterRetrial,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterSubmitProcessPutInMaterial(WOMPutInMaterial putInMaterial, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcess,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitProcessPutInMaterial(WOMPutInMaterial putInMaterial, DealInfo di, WorkFlowVar workFlowVar, String viewCode, Boolean superEdit){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcessSuperEdit,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveProcessPutInMaterial(WOMPutInMaterial putInMaterial, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSaveProcess,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportPutInMaterial(List<WOMPutInMaterial> insertObjs, List<WOMPutInMaterial> updateObjs, 
			List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportPutInMaterial,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void afterImportPutInMaterial(List<WOMPutInMaterial> insertObjs, List<WOMPutInMaterial> updateObjs, 
			List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportPutInMaterial,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	/* CUSTOM CODE START(serviceimpl,functions,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码
	@Autowired
	private MESBasicProductService productService;
	@Resource
	private ConsulService consulService;
	@Autowired
	private PublicSetBatchDealService batchDealService;
	@Resource
	protected SystemCodeService systemCodeService;
	@Autowired
	private PublicSetBatchRelateService batchRelateService;
	@Autowired
	private RMFormulaService formulaService;
	@Autowired
	private MESBasicWareService wareService;
	@Autowired
	private MESBasicStoreSetService storeSetService;
	@Autowired
	private PublicSetWorkflowStateService WorkflowStateService;

	@Override
	public void saveUsedByInterface(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = eventService.getEventsByView(view);
		}
		saveSinglePutInMaterial(workFlowVar, dataGridService, view, entityCode, events, putInMaterial, isImport);
	}


	private void saveSinglePutInMaterial(WorkFlowVar workFlowVar, DataGridService dataGridService, View view, String entityCode, List<Event> events,WOMPutInMaterial putInMaterial, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, putInMaterial);
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
		workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		workFlowVar.setStatus(putInMaterial);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		putInMaterial.setWorkFlowVar(workFlowVar);

		boolean isSuperAdd = false;
		if (putInMaterial.getId() == null) {
			putInMaterial.setStatus(EntityTableInfo.STATUS_EFFECTED);
			putInMaterial.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitPutInMaterial(putInMaterial, workFlowVar, true);
		batchSavePutInMaterial(putInMaterial, dataGridService, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(putInMaterial.getTableInfoId(), isSuperAdd,isImport);
		putInMaterialDao.flush();
		workFlowVar.setModelId(putInMaterial.getId());
		workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
		workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
		workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		workFlowVar.setTableNo(putInMaterial.getTableNo());

		//afterSubmitProcessPutInMaterial(putInMaterial, di, workFlowVar, view.getCode(), true);
		//afterSubmitPutInMaterial(putInMaterial, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, putInMaterial);
			}
		}
	}
	//根据指令单物料清单生成表体物品数据
	@Override
	public List<WOMPutInMaterialPart> getPart(String produceTaskId) {
		WOMProduceTask produceTask = produceTaskService.getProduceTask(Long.parseLong(produceTaskId));
		if(produceTask.getFormularId()!=null && produceTask.getFormularId().getId()!=null){
			if("formulaProperty/formulaProperty2".equals(formulaService.getFormula(produceTask.getFormularId().getId()).getSetProcess().getId())){
				List<WOMPutInMaterialPart> partList = new ArrayList<WOMPutInMaterialPart>();
				//包装指令单 换包装指令单  特殊处理
				if(produceTask.getTaskType()!=null && ("womTaskType/type2".equals(produceTask.getTaskType().getId())
						|| "womTaskType/type7".equals(produceTask.getTaskType().getId()))){
					WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
					putInMaterialPart.setProductId(produceTask.getBulkProduct());
					putInMaterialPart.setUseNum(produceTask.getBulkNum());
					putInMaterialPart.setPutinDate(new Date());
					setWare(putInMaterialPart, produceTask.getBulkBatchNum());
					partList.add(putInMaterialPart);
				}
				//返工 重新加工 特殊处理
				if(produceTask.getTaskType()!=null && ("womTaskType/type3".equals(produceTask.getTaskType().getId())
						|| "womTaskType/type4".equals(produceTask.getTaskType().getId()))){
					WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
					putInMaterialPart.setProductId(produceTask.getProductId());
					putInMaterialPart.setUseNum(produceTask.getProductNum());
					putInMaterialPart.setPutinDate(new Date());
					if(produceTask.getReWorkBatchNum()!=null && produceTask.getReWorkBatchNum().getBatchNum()!=null){
						String batchNum = produceTask.getReWorkBatchNum().getBatchNum();
						String hqlChart = "from WOMStandingcropRef where valid = ? and batchText = ?)";
						List<WOMStandingcropRef> standingcropRefList = putInMaterialDao.findByHql(hqlChart,true,batchNum);
						if(standingcropRefList!=null && standingcropRefList.size()>0){
							setWare(putInMaterialPart, standingcropRefList.get(0));
						}
					}

					partList.add(putInMaterialPart);
				}
				String hqlChart = "from WOMProduceTaskActive where valid = 1 and headID.id = ?";
				List<WOMProduceTaskActive> sumList = taskReportingPartDao.findByHql(hqlChart,Long.parseLong(produceTaskId));
				if(sumList!=null && sumList.size()>0)
					for (WOMProduceTaskActive produceTaskActive : sumList) {
						WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
						putInMaterialPart.setProductId(produceTaskActive.getProductId());
						putInMaterialPart.setUseNum(produceTaskActive.getPlanNum());
						putInMaterialPart.setPutinDate(new Date());
						if(produceTaskActive.getBatchNumObj()!=null)
							setWare(putInMaterialPart, produceTaskActive.getBatchNumObj());
						partList.add(putInMaterialPart);
					}
				return partList;
			}
		}
		return null;
	}

	/**
	 * 设置仓库，物料
	 * @param putInMaterialPart
	 * @param standingcrop
	 */
	private void setWare(WOMPutInMaterialPart putInMaterialPart,WOMStandingcropRef standingcrop){
		if(standingcrop!=null && standingcrop.getId()!=null){
			WOMStandingcropRef standingcropRef = standingcropRefService.getStandingcropRef(standingcrop.getId());
			putInMaterialPart.setProBatch(standingcropRef);
			putInMaterialPart.setBatchNum(standingcropRef.getBatchText());
			if(standingcropRef.getWareID()!=null && standingcropRef.getWareID().getId()!=null){
				MESBasicWare ware = wareService.getWare(standingcropRef.getWareID().getId());
				putInMaterialPart.setWareID(ware);
			}
			if(standingcropRef.getPlaceSet()!=null && standingcropRef.getPlaceSet().getId()!=null){
				MESBasicStoreSet storeSet = storeSetService.getStoreSet(standingcropRef.getPlaceSet().getId());
				putInMaterialPart.setStoreID(storeSet);
			}
		}
	}

	@Override
	public void saveByInterface(WOMPutInMaterial putInMaterial, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_putInMaterial";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = eventService.getEventsByView(view);
		}
		savePutInMaterial(workFlowVar, dataGridService, view, entityCode, events, putInMaterial, isImport);
	}


	private void savePutInMaterial(WorkFlowVar workFlowVar, DataGridService dataGridService, View view, String entityCode, List<Event> events,WOMPutInMaterial putInMaterial, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, putInMaterial);
		}
		ReflectUtils.filterObjectIdIsNVL(putInMaterial);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_putInMaterial");
		workFlowVar.setTableName(WOMPutInMaterial.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_putInMaterialService");
		workFlowVar.setStatus(putInMaterial);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		putInMaterial.setWorkFlowVar(workFlowVar);

		boolean isSuperAdd = false;
		if (putInMaterial.getId() == null) {
			putInMaterial.setStatus(EntityTableInfo.STATUS_EFFECTED);
			putInMaterial.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitPutInMaterial(putInMaterial, workFlowVar, true);
		batchSavePutInMaterial(putInMaterial, dataGridService, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(putInMaterial.getTableInfoId(), isSuperAdd,isImport);
		putInMaterialDao.flush();
		workFlowVar.setModelId(putInMaterial.getId());
		workFlowVar.setTableInfoId(putInMaterial.getTableInfoId());
		workFlowVar.setInitiatorPositionId(putInMaterial.getCreatePositionId());
		workFlowVar.setOwnerId(putInMaterial.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(putInMaterial.getOwnerPositionId());
		workFlowVar.setTableNo(putInMaterial.getTableNo());

		//afterSubmitProcessPutInMaterial(putInMaterial, di, workFlowVar, view.getCode(), true);
		afterSubmitPutInMaterial(putInMaterial, workFlowVar);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, putInMaterial);
			}
		}
	}
	@Override
	public boolean checkTask(Long taskId) {
		WOMProduceTask produceTask = produceTaskService.getProduceTask(taskId);
		if(produceTask!=null && produceTask.getTaskState()!=null){
			if("womTaskState/03".equals(produceTask.getTaskState().getId()) || "womTaskState/04".equals(produceTask.getTaskState().getId())){
				return true;
			}
		}
		return false;
	}


	@Override
	public void saveWOMPutInMaterialByDao(WOMPutInMaterial putInMaterial) {
		putInMaterial.setTableNo(this.counter.incrementAndGetString(new Date(),new Date()));
		EntityTableInfo ti = getTableInfo(putInMaterial,false);
		putInMaterialDao.saveTableInfo(ti);
		putInMaterial.setTableInfoId(ti.getId());
		putInMaterialDao.save(putInMaterial);
		putInMaterialDao.flush();
	}
	/**
	 * 投料单生效生成生产出库单groovy实现类
	 */
	@Override
	public void createPutInMaterialToProOut(Long putInMaterialId) {
		WOMPutInMaterial putInMaterial=this.getPutInMaterial(putInMaterialId);
		//是否启用MES物料管理
		Boolean isProBatch=consulService.getValueAsBoolean("platform/bap/WOM/WOM.mesProBatch");
		//如果不启用，不生成出库单
		if(isProBatch){
			// 调用仓库接口，实现出库
			//List<Map> inoutMaplist = new ArrayList<Map>();

			//查找表体数据
			String hqlChart = "from WOMPutInMaterialPart where valid = 1 and headId = ? ";
			List<WOMPutInMaterialPart> taskReportingPartList = taskReportingDao.findByHql(hqlChart,putInMaterial);
			//查找所有仓库
			String hqlString = "from MESBasicWare where valid = ?";
			List<MESBasicWare> wareList = taskReportingDao.findByHql(hqlString, true);
			//遍历仓库
			for (MESBasicWare mesBasicWare : wareList) {
				Map<String, Object> inoutMap = new HashMap<String, Object>() {};

				//根据委托类型来区别出入库
				inoutMap.put("ComeType", "produceOut");// 出库用途/入库原因编码必填
				inoutMap.put("workflowStateSetCode", "putInMaterialToProOut");// 工作流配置实体编码
				inoutMap.put("Type", "produceOutSingle");// 属于什么类型 其他出入库

				inoutMap.put("SrcID", putInMaterial.getId());// 生成的出入库单上级来源记录
				inoutMap.put("SrcType", "putInMaterial");// 生成的出入库单上级来源记录
				inoutMap.put("SrcNo", putInMaterial.getTableNo());// 生成的出入库单上级表单编号

				inoutMap.put("comeTypeId", "1014");// 生产出库单类型id

				//设置子流程下推标记    1 子流程    2 参照
				inoutMap.put("SourceType", 1);//

				inoutMap.put("StorageDate", new Date());// 出库时间
				inoutMap.put("redBlue", "redBlue/redBlue02");// 红蓝字

				inoutMap.put("wareCode", mesBasicWare.getWareCode());// 仓库编码必填
				//遍历表体，根据表体仓库字段进行区分
				List<Map<String, String>> detailMapList = new ArrayList<Map<String, String>>();
				//以下是表头封装
				for (WOMPutInMaterialPart womPutInMaterialPart : taskReportingPartList) {
					//选择同一个仓库下的表体
					if(womPutInMaterialPart.getWareID()!=null && womPutInMaterialPart.getWareID().getId()==mesBasicWare.getId()){
						Map<String, String> detailMap = new HashMap<String, String>() ;
						if(womPutInMaterialPart.getProductId() !=null){
							detailMap.put("productcode", productService.getProduct(womPutInMaterialPart.getProductId().getId()).getProductCode());// 物品编码
						}
						if(womPutInMaterialPart.getUseNum()!=null){
							if(womPutInMaterialPart.getLossNum()!=null){
								detailMap.put("Quantity", womPutInMaterialPart.getUseNum().add(womPutInMaterialPart.getLossNum()).toString());// 出库数量
							}else{
								detailMap.put("Quantity", womPutInMaterialPart.getUseNum().toString());// 出库数量
							}
						}
						if(womPutInMaterialPart.getProBatch()!=null && womPutInMaterialPart.getProBatch().getId()!=null){
							detailMap.put("batchID", womPutInMaterialPart.getProBatch().getId().toString());// 出库批号
						}
						if(womPutInMaterialPart.getStoreID()!=null && womPutInMaterialPart.getStoreID().getId()!=null ){
							detailMap.put("StoreID", womPutInMaterialPart.getStoreID().getId().toString());// 货位
						}
						if(womPutInMaterialPart.getWareID()!=null && womPutInMaterialPart.getWareID().getId()!=null){
							detailMap.put("wareID", womPutInMaterialPart.getWareID().getId().toString());// 仓库
						}
						boolean ifAdd = false;
						if(detailMapList!=null && detailMapList.size()>0){
							for (Map<String, String> map : detailMapList) {
								//当仓库货位物品相同时，合并
								if(map.get("StoreID")==null){
									if(map.get("productcode").toString().equals(detailMap.get("productcode").toString())
											&& map.get("batchID").toString().equals(detailMap.get("batchID").toString())
											&& map.get("wareID").toString().equals(detailMap.get("wareID").toString())){
										Float sum = Float.parseFloat(map.get("Quantity").toString())+Float.parseFloat(detailMap.get("Quantity").toString());
										map.put("Quantity", sum.toString());
										ifAdd = false;
										break;
									}else{
										ifAdd = true;

									}
								}else{
									if(map.get("productcode").toString().equals(detailMap.get("productcode").toString())
											&& map.get("batchID").toString().equals(detailMap.get("batchID").toString())
											&& map.get("StoreID").toString().equals(detailMap.get("StoreID").toString())){
										Float sum = Float.parseFloat(map.get("Quantity").toString())+Float.parseFloat(detailMap.get("Quantity").toString());
										map.put("Quantity", sum.toString());
										ifAdd = false;
										break;
									}else{
										ifAdd = true;

									}
								}
							}
						}else{
							detailMapList.add(detailMap);
						}
						if(ifAdd){
							detailMapList.add(detailMap);
							ifAdd = false;
						}
					}
				}
				//当表体不为空时，添加记录，生成出库单
				if(!detailMapList.isEmpty()){
					inoutMap.put("DetialMap", detailMapList);
					String jsonResult = sendPostNormal("/public/material/produceOutSingle/generateProduceOutSingle.action", inoutMap);
					Map<String, Object> resultMap = (Map<String, Object>) JSONUtil.generateMapFromJson(jsonResult);
					if ("FAILURE".equals(resultMap.get("resFlag"))){
						throw new BAPException(resultMap.get("errorMsg").toString());
					}
				}
			}

				/*ServiceReference ref = bundleContext.getServiceReference(WomMaterialService.class.getName());
				List<PublicSetWorkflowState> workflowStateList = WorkflowStateService
						.getWorkflowStates("CODE='putInMaterialToProOut' and valid=1", null);
				if(workflowStateList.size()!=0){
					if (null != ref) {
						WomMaterialService materialService = (WomMaterialService) bundleContext.getService(ref);
						String jieguo =materialService.womMaterialCreate(inoutMaplist);
                      	logger.info("调用投料接口");
					}else{
						//如果物料模块未发布，则 ref 为空，需要提示用户发布物料模块，否则不能生成调拨单
						//提示异常为:物料模块未发布，无法自动生成生产入库单，请联系管理员!
						throw new BAPException(InternationalResource.get("WOM.common.cangkuweifabu954123687", getCurrentLanguage()));
					}
				}else{
					//公用工作流状态配置未找到相关工作流，请先初始化！
					throw new BAPException(InternationalResource.get("WOM.common.cangkuweifabu9541220180102", getCurrentLanguage()));
				}*/
		}
	}

	public String sendPostNormal(String url, Map<String,Object> params) {
		byte[] responseBody = null;
		String responseStr = null;
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod(url);

		NameValuePair[] formParams = new NameValuePair[params.keySet().size()];
		int i = 0;
		for (String key: params.keySet()) {
			if (params.get(key) != null) {
				formParams[i++] = new NameValuePair(key,
						params.get(key).toString());
			} else {
				formParams[i++] = new NameValuePair(key, null);
			}
		}
		try {
			post.getParams().setParameter(HttpMethodParams
					.HTTP_CONTENT_CHARSET, "utf-8");
			post.setRequestBody(formParams);
			post.releaseConnection();
        	client.setConnectionTimeout(120000);
			client.setTimeout(120000);
			client.executeMethod(post);
			responseBody = post.getResponseBody();
			responseStr = new String(responseBody, "UTF-8");
			logger.info(responseStr);
		} catch (Exception e) {
			logger.error(e.toString());
			throw new BAPException(e.toString());
		}
		return responseStr;
	}

	private static final Logger logger = LoggerFactory.getLogger(WOMPutInMaterialServiceImpl.class);
/* CUSTOM CODE END */
}
