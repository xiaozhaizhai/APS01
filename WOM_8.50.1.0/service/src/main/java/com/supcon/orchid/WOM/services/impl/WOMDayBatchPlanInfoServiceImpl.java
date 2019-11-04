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
import com.supcon.orchid.WOM.services.WOMDayBatchPlanInfoService;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanInfoImportService;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfoDealInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfoSupervision;
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
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfoSupervision;
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
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.foundation.entities.Department;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.RM.entities.RMFormula;
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
import com.supcon.orchid.WOM.daos.impl.WOMDayBatchPlanInfoDaoImpl;
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
/* CUSTOM CODE START(serviceimpl,import,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

@Service("wOM_dayBatchPlanInfoService")
@Transactional
public class WOMDayBatchPlanInfoServiceImpl  extends BaseServiceImpl<WOMDayBatchPlanInfo> implements WOMDayBatchPlanInfoService,IScriptService, InitializingBean, DisposableBean {
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
	private WOMPutInMaterialService putInMaterialService;
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
	private WOMDayBatchPlanInfoVariablesProvider variablesProvider;
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
	private IBAPBaseService<WOMDayBatchPlanInfo> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private WOMDayBatchPlanInfoImportService dayBatchPlanInfoImportService;
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + WOMDayBatchPlanInfo.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)"  + "and VALID = 1";
		Query query =  dayBatchPlanInfoDao.createQuery(hql);
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
			String hql = "select " + businessKeyName + ",id from " + WOMDayBatchPlanInfo.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = dayBatchPlanInfoDao.createQuery(hql);
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
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + WOMDayBatchPlanInfo.JPA_NAME + " where " + mainDisplayName + " in (:serial)";
		}else if(queryParam!=null && queryParam.equals("bk")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + WOMDayBatchPlanInfo.JPA_NAME + " where " + businessKeyName + " in (:serial)";
		}
		Query query =  dayBatchPlanInfoDao.createQuery(hql);
		query.setParameterList("serial", serial);
		List<Object[]> list = query.list();
		/*String sql = null;
		if(queryParam!=null && queryParam.equals("md")){
			sql = "select * from " + WOMDayBatchPlanInfo.TABLE_NAME + " where " + mainDisplayName + " = ?";
		}else if(queryParam!=null && queryParam.equals("bk")){
			sql = "select * from " + WOMDayBatchPlanInfo.TABLE_NAME + " where " + businessKeyName + " = ?";
		}
		List<WOMDayBatchPlanInfo> list = (List<WOMDayBatchPlanInfo>) dayBatchPlanInfoDao.createNativeQuery(sql,serial.get(0)).list();
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
	public WOMDayBatchPlanInfo getDayBatchPlanInfo(long id){
		return getDayBatchPlanInfo(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMDayBatchPlanInfo getDayBatchPlanInfo(long id, String viewCode){
		WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoDao.load(id);

		// 一对多情况处理
		if(dayBatchPlanInfo != null){
			this.setDayPlanInfoFactoryCode(dayBatchPlanInfo, viewCode);
			this.setDayPlanInfoManudeptId(dayBatchPlanInfo, viewCode);
			this.setDayPlanInfoProductId(dayBatchPlanInfo, viewCode);
			this.setDayPlanInfoFormularID(dayBatchPlanInfo, viewCode);
			this.setSupervision(dayBatchPlanInfo);
		}
		return dayBatchPlanInfo;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getDayBatchPlanInfoAsJSON(long id, String include){
		WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoDao.load(id);
		// 一对多情况处理
			this.setDayPlanInfoFactoryCode(dayBatchPlanInfo);
			this.setDayPlanInfoManudeptId(dayBatchPlanInfo);
			this.setDayPlanInfoProductId(dayBatchPlanInfo);
			this.setDayPlanInfoFormularID(dayBatchPlanInfo);
			this.dealSupervision(dayBatchPlanInfo);

		if(dayBatchPlanInfo == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(dayBatchPlanInfo, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.delete",operType="3")
	public void deleteDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo){
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		beforeDeleteDayBatchPlanInfo(dayBatchPlanInfo);
		dayBatchPlanInfoDao.delete(dayBatchPlanInfo);
		afterDeleteDayBatchPlanInfo(dayBatchPlanInfo);
		dayBatchPlanInfoDao.flush();
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		params.add(dayBatchPlanInfo);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
		delIds = dayBatchPlanInfo.getDayPlanInfoFactoryCodemultiselectIDs();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("factoryCode.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
		delIds = dayBatchPlanInfo.getDayPlanInfoManudeptIdmultiselectIDs();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("manudeptId.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
		delIds = dayBatchPlanInfo.getDayPlanInfoProductIdmultiselectIDs();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
		delIds = dayBatchPlanInfo.getDayPlanInfoFormularIDmultiselectIDs();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("formularID.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
			// TODO delete
			// this.dealSupervision(dayBatchPlanInfo);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.delete",operType="3")
	public void deleteDayBatchPlanInfo(List<Long> dayBatchPlanInfoIds){
		deleteDayBatchPlanInfo(dayBatchPlanInfoIds, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.delete",operType="3")
	public void deleteDayBatchPlanInfo(List<Long> dayBatchPlanInfoIds, String eventTopic) {
		List<WOMDayBatchPlanInfo> dayBatchPlanInfos = new ArrayList<WOMDayBatchPlanInfo>();
		for(Long dayBatchPlanInfoId : dayBatchPlanInfoIds){
			WOMDayBatchPlanInfo dayBatchPlanInfo = getDayBatchPlanInfo(dayBatchPlanInfoId);
			dayBatchPlanInfos.add(dayBatchPlanInfo);
			if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(AuditUtil.getColumnStringA() + (null == dayBatchPlanInfo.getId() ? "" : "," + dayBatchPlanInfo.getId().toString()));
				} else {
					AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(AuditUtil.getColumnStringB() + (null == dayBatchPlanInfo.getTableNo() ? "" : "," + dayBatchPlanInfo.getTableNo().toString()));
				} else {
					AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(AuditUtil.getColumnStringC() + (null == dayBatchPlanInfo.getId() ? "" : "," + dayBatchPlanInfo.getId().toString()));
				} else {
					AuditUtil.setColumnStringC(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
				}
			}
		}
		
		for(WOMDayBatchPlanInfo dayBatchPlanInfo : dayBatchPlanInfos){
			beforeDeleteDayBatchPlanInfo(dayBatchPlanInfo);
		}
		
		
		/**
		 * 假删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(dayBatchPlanInfos != null && dayBatchPlanInfos.size() > 0 ){
			for(WOMDayBatchPlanInfo dayBatchPlanInfo : dayBatchPlanInfos){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				List<Object> currentState = new ArrayList<Object>();
				propertyNames.add("valid");
				currentState.add(false);
				previousState.add(true);
				dataAuditLogService.saveCustomerAudit(InternationalResource.get("foundation.common.delete"),dayBatchPlanInfo, dayBatchPlanInfo.getId(), currentState.toArray(), previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
			}
		}
		if(dayBatchPlanInfoIds != null && dayBatchPlanInfoIds.size() > 0) {
			String hql = "update " + WOMDayBatchPlanInfo.JPA_NAME + " set valid = false where id in(:ids)";
			Query query = dayBatchPlanInfoDao.createQuery(hql);
			query.setParameterList("ids", dayBatchPlanInfoIds);
			query.executeUpdate();
		}
		
		for(WOMDayBatchPlanInfo dayBatchPlanInfo : dayBatchPlanInfos){
			afterDeleteDayBatchPlanInfo(dayBatchPlanInfo);
		}
		
		if(eventTopic==null){
			for(WOMDayBatchPlanInfo dayBatchPlanInfoz : dayBatchPlanInfos){
				dayBatchPlanInfoz.setValid(false);
				List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
				List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfoz));
				dayBatchPlanInfoz.setDayBatchPlanPartsList(dayBatchPlanPartsList);
				params.add(dayBatchPlanInfoz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.delete",operType="3")
	public void deleteDayBatchPlanInfo(long dayBatchPlanInfoId, int dayBatchPlanInfoVersion){
		this.deleteDayBatchPlanInfo(dayBatchPlanInfoId, dayBatchPlanInfoVersion,null);
	}
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.delete",operType="3")
	public void deleteDayBatchPlanInfo(long dayBatchPlanInfoId, int dayBatchPlanInfoVersion,SignatureLog signatureLog){
		WOMDayBatchPlanInfo dayBatchPlanInfo = getDayBatchPlanInfo(dayBatchPlanInfoId);
		if(dayBatchPlanInfo != null && !dayBatchPlanInfo.isValid()){
			throw new BAPException(BAPException.Code.OBJECT_HAVE_BEAN_DELETED);
		}
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		beforeDeleteDayBatchPlanInfo(dayBatchPlanInfo);
		dayBatchPlanInfoDao.delete(dayBatchPlanInfoId, dayBatchPlanInfoVersion);
		afterDeleteDayBatchPlanInfo(dayBatchPlanInfo);
		dayBatchPlanInfoDao.flush();
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		params.add(dayBatchPlanInfo);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		props.put("eventType", "delete");
		
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=dayBatchPlanInfo.getTableNo();
			signatureLog.setTableId(dayBatchPlanInfo.getId());
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
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.delete",operType="3")
	public void deleteDayBatchPlanInfo(String dayBatchPlanInfoIds){
		this.deleteDayBatchPlanInfo(dayBatchPlanInfoIds,null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.delete",operType="3")
	public void deleteDayBatchPlanInfo(String dayBatchPlanInfoIds,SignatureLog signatureLog){
		deleteCollection(dayBatchPlanInfoIds,signatureLog);
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
				deleteDayBatchPlanInfo(Long.valueOf(id), Integer.valueOf(version),signatureLog);
			}
		}
		if(null != signatureLog){
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_producePlanRef#modelCode:WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.engine.restore",operType="10")
	public void restoreDayBatchPlanInfo(String dayBatchPlanInfoIds){
		restoreCollection(dayBatchPlanInfoIds);
	}
	
	public void restoreCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			if (id != null && id.trim().length() > 0) {
				restoreDayBatchPlanInfo(Long.valueOf(id));
			}
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.engine.restore",operType="10")
	public void restoreDayBatchPlanInfo(long dayBatchPlanInfoId){
		
		findBusinessKeyUsed(dayBatchPlanInfoId);	//判断业务主键是否重复
		
		WOMDayBatchPlanInfo dayBatchPlanInfo = getDayBatchPlanInfo(dayBatchPlanInfoId);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		beforeRestoreDayBatchPlanInfo(dayBatchPlanInfo);
		dayBatchPlanInfo.setValid(true);
		dayBatchPlanInfoDao.update(dayBatchPlanInfo);
		afterRestoreDayBatchPlanInfo(dayBatchPlanInfo);
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		params.add(dayBatchPlanInfo);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		props.put("eventType", "restore");
	}
	
	public void findBusinessKeyUsed(long dayBatchPlanInfoId){
		Property property = modelServiceFoundation.getBussinessProperty("WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo");
		if(property != null){
			String propertyName = property.getColumnName();
			String sql  = "select * from " + WOMDayBatchPlanInfo.TABLE_NAME + " where valid = 1 and " + 
					propertyName + " =  (select "+ propertyName +" from "+ WOMDayBatchPlanInfo.TABLE_NAME +" where id = ? )";
			List<Object> list =  dayBatchPlanInfoDao.createNativeQuery(sql,dayBatchPlanInfoId).list();
			if(list.size() > 0){
				throw new BAPException("foundation.bussinessKey.repeat");
			}
			
		}
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.batch.import",operType="4")
	public  void batchImportBaseDayBatchPlanInfo(List<WOMDayBatchPlanInfo>  dayBatchPlanInfos){
		for(WOMDayBatchPlanInfo dayBatchPlanInfo:dayBatchPlanInfos)  {
			saveDayBatchPlanInfo(dayBatchPlanInfo, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBaseDayBatchPlanInfo(List<WOMDayBatchPlanInfo>  dayBatchPlanInfos){
		for(WOMDayBatchPlanInfo dayBatchPlanInfo:dayBatchPlanInfos)  {
			saveDayBatchPlanInfo(dayBatchPlanInfo, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.save")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		saveDayBatchPlanInfo(dayBatchPlanInfo, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.save")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		saveDayBatchPlanInfo(dayBatchPlanInfo, dgLists,dgDeleteIDs,assFileUploads, viewCode, null,null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, boolean... isImport){
		this.saveSuperEditDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar, dgLists, dgDeleteIDs, assFileUploads, viewCode, null, isImport);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, SignatureLog signatureLog, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditDayBatchPlanInfo(workFlowVar, dgLists, dgDeleteIDs, assFileUploads, view, entityCode, events, dayBatchPlanInfo, isImport);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=dayBatchPlanInfo.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			signatureLog.setTableId(dayBatchPlanInfo.getId());
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_producePlanRef#modelCode:WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.upload.importFlow",operType="4")
	public void importDayBatchPlanInfoWorkFlow(WOMDayBatchPlanInfo dayBatchPlanInfo, String viewCode){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 saveSuperEditDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar, null,null,null, viewCode, null,true);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.batch.upload.importFlow",operType="4")
	public void batchImportDayBatchPlanInfoWorkFlow(List<WOMDayBatchPlanInfo>  dayBatchPlanInfos, View view){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 batchSaveSuperEditDayBatchPlanInfo(dayBatchPlanInfos, workFlowVar, null,null,null, view, true);
	}
	
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.batch.import",operType="4")
	public void batchSaveSuperEditDayBatchPlanInfo(List<WOMDayBatchPlanInfo>  dayBatchPlanInfos, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(WOMDayBatchPlanInfo dayBatchPlanInfo:dayBatchPlanInfos)  {
			saveSingleSuperEditDayBatchPlanInfo(workFlowVar, dgLists, dgDeleteIDs,assFileUploads, view, entityCode, events, dayBatchPlanInfo, isImport);
		}
	}
	
	
	
	public void saveSingleSuperEditDayBatchPlanInfo(WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, String entityCode, List<Event> events,WOMDayBatchPlanInfo dayBatchPlanInfo, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, dayBatchPlanInfo);
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
		workFlowVar.setTableName(WOMDayBatchPlanInfo.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
		workFlowVar.setStatus(dayBatchPlanInfo);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		dayBatchPlanInfo.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (dayBatchPlanInfo.getId() == null) {
			dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_EFFECTED);
			dayBatchPlanInfo.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar, true);
		batchSaveDayBatchPlanInfo(dayBatchPlanInfo,dgLists, dgDeleteIDs,assFileUploads, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(dayBatchPlanInfo.getTableInfoId(), isSuperAdd,isImport);
		dayBatchPlanInfoDao.flush();
		workFlowVar.setModelId(dayBatchPlanInfo.getId());
		workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
		workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
		workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
		workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
		
		afterSubmitProcessDayBatchPlanInfo(dayBatchPlanInfo, di, workFlowVar, view.getCode(), true);
		afterSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, dayBatchPlanInfo);
			}
		}
	}
	
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.batch.save",operType="4")
	public void batchSaveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads ,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		String url = null;
		if(dayBatchPlanInfo.getId()!=null && dayBatchPlanInfo.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, dayBatchPlanInfo);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		beforeSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);

		if (null == dayBatchPlanInfo.getId()) {
			if(null == dayBatchPlanInfo.getStatus()){
				dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			dayBatchPlanInfo.setTableNo(generateTableNo());
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				dayBatchPlanInfoDao.save(dayBatchPlanInfo);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(dayBatchPlanInfo,isImport);
			dayBatchPlanInfoDao.saveTableInfo(ti);
			dayBatchPlanInfo.setTableInfoId(ti.getId());
			if(dayBatchPlanInfo.getOwnerStaffId()==null){
				dayBatchPlanInfo.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
				ti.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
			}
			if(dayBatchPlanInfo.getOwnerDepartmentId()==null){
				dayBatchPlanInfo.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				ti.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
			}
			if(dayBatchPlanInfo.getOwnerPositionId()==null){
				dayBatchPlanInfo.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
				ti.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
			}
			dayBatchPlanInfo.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
			dayBatchPlanInfo.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
			dayBatchPlanInfo.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (dayBatchPlanInfo.getCompany() == null) {
				dayBatchPlanInfo.setCompany(getCurrentCompany());
			}
			if (dayBatchPlanInfo.getCid() == null || dayBatchPlanInfo.getCid() == -1l) {
				dayBatchPlanInfo.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				dayBatchPlanInfoDao.save(dayBatchPlanInfo);
			}
		} else {
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
		}
		dealDatagridsSave(dayBatchPlanInfo,view.getCode(),dgLists,dgDeleteIDs,assFileUploads);
		
		// 一对多情况处理
		this.dealDayPlanInfoFactoryCode(dayBatchPlanInfo);
		this.dealDayPlanInfoManudeptId(dayBatchPlanInfo);
		this.dealDayPlanInfoProductId(dayBatchPlanInfo);
		this.dealDayPlanInfoFormularID(dayBatchPlanInfo);
		this.dealSupervision(dayBatchPlanInfo);
		
		// 根据配置规则生成编码
		try {
			generateDayBatchPlanInfoCodes(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateDayBatchPlanInfoSummarys(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);
		

		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, dayBatchPlanInfo);
			}
		}
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		dayBatchPlanInfoDao.flush();
		dayBatchPlanInfoDao.clear();
		dayBatchPlanInfo = dayBatchPlanInfoDao.load(dayBatchPlanInfo.getId());
		
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		
		params.add(dayBatchPlanInfo);
	}
	
	
	
	

	public void generateDayBatchPlanInfoCodes(WOMDayBatchPlanInfo dayBatchPlanInfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateDayBatchPlanInfoCodes(dayBatchPlanInfo, false);
	}
	
	public void generateDayBatchPlanInfoCodes(WOMDayBatchPlanInfo dayBatchPlanInfo, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	public void generateDayBatchPlanInfoSummarys(WOMDayBatchPlanInfo dayBatchPlanInfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateDayBatchPlanInfoSummarys(dayBatchPlanInfo, false);
	}

	public void generateDayBatchPlanInfoSummarys(WOMDayBatchPlanInfo dayBatchPlanInfo, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic,boolean... isImport){
		this.saveDayBatchPlanInfo(dayBatchPlanInfo, dgLists,dgDeleteIDs,assFileUploads, viewCode, eventTopic,null,isImport);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport){
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		String url = null;
		if(dayBatchPlanInfo.getId() != null && dayBatchPlanInfo.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/add";
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
				executeGScript(entityCode, "beforeSave", events, dayBatchPlanInfo);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		beforeSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);

		if (null == dayBatchPlanInfo.getId()) {
			if(null == dayBatchPlanInfo.getStatus()){
				dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			dayBatchPlanInfo.setTableNo(generateTableNo());
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				if(isNew)
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				else
					dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(dayBatchPlanInfo,isImport);
				dayBatchPlanInfoDao.saveTableInfo(ti);
				dayBatchPlanInfo.setTableInfoId(ti.getId());
				if(dayBatchPlanInfo.getOwnerStaffId()==null){
					dayBatchPlanInfo.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
					ti.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
				}
				if(dayBatchPlanInfo.getOwnerDepartmentId()==null){
					dayBatchPlanInfo.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
					ti.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				}
				if(dayBatchPlanInfo.getOwnerPositionId()==null){
					dayBatchPlanInfo.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
					ti.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
				}
				dayBatchPlanInfo.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
				dayBatchPlanInfo.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
				dayBatchPlanInfo.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (dayBatchPlanInfo.getCompany() == null) {
					dayBatchPlanInfo.setCompany(getCurrentCompany());
				}
				if (dayBatchPlanInfo.getCid() == null || dayBatchPlanInfo.getCid() == -1l) {
					dayBatchPlanInfo.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
				} else {
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				}
				
		} else {
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				if(isNew)
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				else
					dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
		}
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		dealDatagridsSave(dayBatchPlanInfo,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
			this.dealDayPlanInfoFactoryCode(dayBatchPlanInfo);
			this.dealDayPlanInfoManudeptId(dayBatchPlanInfo);
			this.dealDayPlanInfoProductId(dayBatchPlanInfo);
			this.dealDayPlanInfoFormularID(dayBatchPlanInfo);
			this.dealSupervision(dayBatchPlanInfo);
		
		// 根据配置规则生成编码
		try {
			generateDayBatchPlanInfoCodes(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateDayBatchPlanInfoSummarys(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, dayBatchPlanInfo);
			}
		}
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		dayBatchPlanInfoDao.flush();
		dayBatchPlanInfoDao.clear();
		dayBatchPlanInfo = dayBatchPlanInfoDao.load(dayBatchPlanInfo.getId());
		
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		
		params.add(dayBatchPlanInfo);
		
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=dayBatchPlanInfo.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(dayBatchPlanInfo.getId());
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_producePlanRef#modelCode:WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, WOMDayBatchPlanInfo dayBatchPlanInfo){
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
						variables.put("dayBatchPlanInfo", dayBatchPlanInfo);
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
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void mergeDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		beforeSaveDayBatchPlanInfo(dayBatchPlanInfo);
		if (null == dayBatchPlanInfo.getId()) {
			dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_RUNNING);
			dayBatchPlanInfo.setTableNo(generateTableNo());
			dayBatchPlanInfoDao.save(dayBatchPlanInfo);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(dayBatchPlanInfo);
				dayBatchPlanInfoDao.saveTableInfo(ti);
				dayBatchPlanInfo.setTableInfoId(ti.getId());
				if(dayBatchPlanInfo.getOwnerStaffId()==null){
					dayBatchPlanInfo.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
				}
				if(dayBatchPlanInfo.getOwnerDepartmentId()==null){
					dayBatchPlanInfo.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				}
				if(dayBatchPlanInfo.getOwnerPositionId()==null){
					dayBatchPlanInfo.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
				}
				dayBatchPlanInfo.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
				dayBatchPlanInfo.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
				dayBatchPlanInfo.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (dayBatchPlanInfo.getCompany() == null) {
					dayBatchPlanInfo.setCompany(getCurrentCompany());
				}
				if (dayBatchPlanInfo.getCid() == null || dayBatchPlanInfo.getCid() == -1l) {
					dayBatchPlanInfo.setCid(getCurrentCompanyId());
				}
				dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
		} else {
			dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
		}
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		dealDatagridsSave(dayBatchPlanInfo,null,dgLists,dgDeleteIDs,assFileUploads);

			// 一对多情况处理
			this.dealDayPlanInfoFactoryCode(dayBatchPlanInfo);
			this.dealDayPlanInfoManudeptId(dayBatchPlanInfo);
			this.dealDayPlanInfoProductId(dayBatchPlanInfo);
			this.dealDayPlanInfoFormularID(dayBatchPlanInfo);
			this.dealSupervision(dayBatchPlanInfo);
		afterSaveDayBatchPlanInfo(dayBatchPlanInfo);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<WOMDayBatchPlanInfo> findDayBatchPlanInfos(Page<WOMDayBatchPlanInfo> page, Criterion... criterions) {
		return dayBatchPlanInfoDao.findByPage(page, criterions);
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
	private WOMDayBatchPlanInfoDealInfo getDealInfoEntity(Long tableInfoId) {
		
		List<WOMDayBatchPlanInfoDealInfo> list=dayBatchPlanInfoDao.createQuery("from " + WOMDayBatchPlanInfoDealInfo.JPA_NAME + " where tableInfoId=?", tableInfoId).setMaxResults(1).list();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void saveDealInfo(WOMDayBatchPlanInfoDealInfo dealInfo) {
		dayBatchPlanInfoDao.saveDealInfo(dealInfo);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public int getDealInfoCount(Long tableInfoId) {
		String sql = "SELECT count(1) totalCount " + "FROM "+WOMDayBatchPlanInfoDealInfo.TABLE_NAME+" DI " + "LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME
				+ " S ON S.ID=U.STAFF_ID " + "WHERE DI.TABLE_INFO_ID = ?";
		Number list = (Number) dayBatchPlanInfoDao.createNativeQuery(sql, tableInfoId).uniqueResult();
		return list.intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag) {
		String sql = "SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, WT.TYPE,WTR.TYPE TRANSITIONTYPE "
				+ " FROM "+WOMDayBatchPlanInfoDealInfo.TABLE_NAME + " DI " 
				+ " LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION "
				+ " LEFT JOIN WF_TRANSITION WTR ON WTR.CODE = DI.OUTCOME AND WTR.DEPLOYMENT_ID = WT.DEPLOYMENT_ID "
				+ " LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID "
				+ " WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION is not null ";
		if (expandFlag) {
			sql += " AND DI.COMMENTS IS NOT NULL";
			DBTYPE dbtype = dayBatchPlanInfoDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				sql += " AND DI.COMMENTS != ''";
			}
		}
		sql += " ORDER BY DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC";
		List<Object[]> list = dayBatchPlanInfoDao.createNativeQuery(sql, tableInfoId).list();
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
				+ WOMDayBatchPlanInfoDealInfo.TABLE_NAME
				+ " DI LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION ");
		groupSql.append(" LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID ");
		groupSql.append(" WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION IS NOT NULL ");
		if (expandFlag) {
			groupSql.append(" AND DI.COMMENTS IS NOT NULL");
			DBTYPE dbtype = dayBatchPlanInfoDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				groupSql.append(" AND DI.COMMENTS != ''");
			}
		}
		groupSql.append(" ORDER BY WT.ROUTE_SEQUENCE ASC, DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC");

		List<Object[]> groupList = dayBatchPlanInfoDao.createNativeQuery(groupSql.toString(), tableInfoId).list();
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
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="撤回",operType="4")
	public Pending recall(long tableInfoId) {
		Long modelId = null;
		WOMDayBatchPlanInfo  dayBatchPlanInfo = null;
		List<Object> list = dayBatchPlanInfoDao.createNativeQuery("select ID from " + WOMDayBatchPlanInfo.TABLE_NAME + " where TABLE_INFO_ID = ?", tableInfoId).list();
		if (list != null && list.size() > 0) {
			if (list.get(0) != null) {
				modelId = ((Number) list.get(0)).longValue();
				dayBatchPlanInfo = this.getDayBatchPlanInfo(modelId);
			}
		}
		if(null != dayBatchPlanInfo){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
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
			props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
			props.put("eventType", "recall");
			return pending;
		}
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public boolean existsSupervision(Long tableInfoId, Long staffId) {
		List<WOMDayBatchPlanInfoSupervision> list = dayBatchPlanInfoDao.findSupervision(tableInfoId, staffId);
		if(list!=null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	public String getWorkFlowVarStatus(WorkFlowVar workFlowVar){
		return workFlowVar == null ? null : workFlowVar.getOutcomeType();
	}
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void save(WOMDayBatchPlanInfo dayBatchPlanInfo,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		save(dayBatchPlanInfo, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void save(WOMDayBatchPlanInfo dayBatchPlanInfo, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		boolean first = null == dayBatchPlanInfo.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != dayBatchPlanInfo.getCreateStaff() && null != dayBatchPlanInfo.getCreateStaff().getUser()){
		    	createStaffUserId = dayBatchPlanInfo.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
			workFlowVar.setTableName(WOMDayBatchPlanInfo.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
		}
		dayBatchPlanInfo.setWorkFlowVar(workFlowVar);
		if(dayBatchPlanInfo.getDeploymentId() == null && deploymentId != null) {
			dayBatchPlanInfo.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				dayBatchPlanInfo.setProcessKey(d.getProcessKey());
				dayBatchPlanInfo.setProcessVersion(d.getProcessVersion());
			}
		}

		saveDayBatchPlanInfo(dayBatchPlanInfo, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
			}
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(dayBatchPlanInfo.getId());
			workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
			workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
			workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
			workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(dayBatchPlanInfo, instance, deploymentId, pendingId, workFlowVar);
		dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
		dayBatchPlanInfoDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessDayBatchPlanInfo(dayBatchPlanInfo, di, workFlowVar, viewCode);
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
		dayBatchPlanInfoDao.flush();
		dayBatchPlanInfoDao.clear();
		WOMDayBatchPlanInfo dayBatchPlanInfo = getDayBatchPlanInfo(id);
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");                                                                                                                   
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		props.put("eventType", type);
	}
	@Override
	public Date findLastDealInfo(Long tableInfoId, String activityName) {
		return dayBatchPlanInfoDao.findLastDealInfo(tableInfoId, activityName);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.submit",operType="4")
	public void submit(WOMDayBatchPlanInfo dayBatchPlanInfo,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		submit(dayBatchPlanInfo, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.submit",operType="4")
	public void submit(WOMDayBatchPlanInfo dayBatchPlanInfo, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		this.submit(dayBatchPlanInfo, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null,null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.submit",operType="4")
	public void submit(WOMDayBatchPlanInfo dayBatchPlanInfo, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog) {
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, dayBatchPlanInfo);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
		workFlowVar.setTableName(WOMDayBatchPlanInfo.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
		workFlowVar.setStatus(dayBatchPlanInfo);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		dayBatchPlanInfo.setWorkFlowVar(workFlowVar);
		if(dayBatchPlanInfo.getDeploymentId() == null && deploymentId != null) {
			dayBatchPlanInfo.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				dayBatchPlanInfo.setProcessKey(d.getProcessKey());
				dayBatchPlanInfo.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar);
		saveDayBatchPlanInfo(dayBatchPlanInfo, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
			}
		}
		Integer preStatus = dayBatchPlanInfo.getStatus();
		dayBatchPlanInfoDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(dayBatchPlanInfo.getId());
		workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
		workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
		workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
		workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, dayBatchPlanInfo.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(dayBatchPlanInfo, di, deploymentId, pendingId, workFlowVar, true);
			dayBatchPlanInfoDao.copyAndSaveDealInfo(saveDi, dayBatchPlanInfo, creatorService.getStaffFromSession());
		}
		dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					dayBatchPlanInfoDao.flush();
					
					WOMDayBatchPlanInfoDealInfo dayBatchPlanInfoDealInfo=dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
					dayBatchPlanInfoDealInfo.setOutcome(outcome);
					dayBatchPlanInfoDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						dayBatchPlanInfoDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				dayBatchPlanInfoDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(dayBatchPlanInfo.getStatus() == 99) {
			if(!preStatus.equals(dayBatchPlanInfo.getStatus())){
				dataAuditLogService.saveCustomerAudit("2", dayBatchPlanInfo, dayBatchPlanInfo.getId(), new Object[]{dayBatchPlanInfo.getStatus(),dayBatchPlanInfo.getEffectTime()}, new Object[]{preStatus,null}, new String[]{"status","effectTime"});
			}
			dayBatchPlanInfoDao.deleteSupervision(dayBatchPlanInfo.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + dayBatchPlanInfo.getProcessKey() + "_" + di.getActivityName() + "_WOM_7.5.0.0_producePlanRef_" + dayBatchPlanInfo.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		dayBatchPlanInfoDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessDayBatchPlanInfo(dayBatchPlanInfo, di, workFlowVar, viewCode);
		afterSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, dayBatchPlanInfo);
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
			businessKey = dayBatchPlanInfo.getTableNo();
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
			signatureLog.setTableId(dayBatchPlanInfo.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_producePlanRef#modelCode:WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo#timeStamp:"+String.valueOf(new Date().getTime());
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
	public void findDayBatchPlanInfos(Page<WOMDayBatchPlanInfo> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, Map exportMap, List<Param> params) {
		findDayBatchPlanInfos(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDayBatchPlanInfos(Page<WOMDayBatchPlanInfo> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDayBatchPlanInfos(Page<WOMDayBatchPlanInfo> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
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
	public void commonQuery(Page<WOMDayBatchPlanInfo> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
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
						String tableAlias = lastDotPos < 0 ? "\"dayBatchPlanInfo\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
							sortOrderByStr.append(",").append("\"dayBatchPlanInfo\".STATUS ").append((String) param.getValue());
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
					if((advQuery == null || advQuery.length() == 0 || advQuery.indexOf("\"dayBatchPlanInfo\".STATUS") == -1) 
						&& (classifySql == null || classifySql.length() == 0 || classifySql.indexOf("\"dayBatchPlanInfo\".STATUS") == -1)) {
						s.append(" AND \"dayBatchPlanInfo\".STATUS <> 0");
					}
					if(type == Sql.TYPE_LIST_PENDING) {
						s.append(" AND \"dayBatchPlanInfo\".STATUS <> 77");
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
							s.append(" AND \"dayBatchPlanInfo\".CID in (1,").append(getCurrentCompanyId()+")");
						}
					}
					
	//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
	//					if(type == Sql.TYPE_LIST_PENDING) {
	//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_QUERY){
	//						s.append(" AND \"dayBatchPlanInfo\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_REFERENCE){
	//						if(null != crossCompanyFlag && !crossCompanyFlag){
	//							s.append(" AND \"dayBatchPlanInfo\".CID = ").append(getCurrentCompanyId());
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
							powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + layoutView.getPermissionCode();
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + layoutView.getPermissionCode();
							}
						}
					}else  {
						if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
							powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + view.getPermissionCode();
						}
					}
				}else if(null != dgCode && !"".equals(dgCode)){
					DataGrid dataGrid = viewServiceFoundation.getDataGrid(dgCode);
					if(null != dataGrid.getDataGridType() && dataGrid.getDataGridType() == 1 && null != dataGrid.getIsPermission() && dataGrid.getIsPermission()){
						powerCode = dataGrid.getTargetModel().getCode() + "_" + dataGrid.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  dayBatchPlanInfoDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  dayBatchPlanInfoDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_producePlanRef").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}	
					String	pc = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"dayBatchPlanInfo\"","WOM_7.5.0.0_producePlanRef",customCondition,"PPM_DAY_PLAN_INFOS",false);
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
						s.append(" \"dayBatchPlanInfo\".TABLE_INFO_ID IN (  SELECT   D.TABLE_INFO_ID "+
	                      "   FROM   "+WOMDayBatchPlanInfoDealInfo.TABLE_NAME+" d "+
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
				totalSql.append(" LEFT OUTER JOIN ").append("(SELECT TASK_DESCRIPTION, TABLE_INFO_ID FROM ").append(Pending.TABLE_NAME).append(" WHERE ID IN (SELECT MAX(ID) FROM ").append(Pending.TABLE_NAME).append(" GROUP BY TABLE_INFO_ID))").append(" \"p\" ON \"p\".TABLE_INFO_ID= \"dayBatchPlanInfo\".TABLE_INFO_ID ");
			}
			if(queryType == 1) {
				s.append(" AND \"dayBatchPlanInfo\".STATUS = 99 ");
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
					orderPart.append(" \"dayBatchPlanInfo\".LAY_REC ASC, \"dayBatchPlanInfo\".SORT ASC");
				} else {
					orderPart.append(" \"dayBatchPlanInfo\".ID DESC");
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
				//Long count = ((Number) dayBatchPlanInfoDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    SQLQuery query=dayBatchPlanInfoDao.createNativeQuery(countSql, arr);
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
				SQLQuery query = dayBatchPlanInfoDao.createNativeQuery(realSql, arr);
				if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
				List<WOMDayBatchPlanInfo> result = new ArrayList<WOMDayBatchPlanInfo>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(WOMDayBatchPlanInfo.class,dayBatchPlanInfoDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(WOMDayBatchPlanInfo.class,dayBatchPlanInfoDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (WOMDayBatchPlanInfo dayBatchPlanInfo : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(dayBatchPlanInfo.getTableInfoId(), "Table");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(dayBatchPlanInfo.getTableInfoId(), "Table");
							if(null != documents && !documents.isEmpty()) {
								dayBatchPlanInfo.setDocument(documents.get(0));
								dayBatchPlanInfo.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				
				for (WOMDayBatchPlanInfo dayBatchPlanInfo : result) {
				}	
				if(queryType == 0) {
					if (type == Sql.TYPE_LIST_QUERY) {
						if (!result.isEmpty()) {
							List<Long> tIds = new ArrayList<Long>(result.size());
							for (WOMDayBatchPlanInfo dayBatchPlanInfo : result)
								tIds.add(dayBatchPlanInfo.getTableInfoId());
							String pSql = "SELECT DISTINCT p.TABLE_INFO_ID,p.TASK_DESCRIPTION,p.ACTIVITY_TYPE,p.ACTIVITY_NAME,p.PROCESS_KEY,p.PROCESS_VERSION,p.DEPLOYMENT_ID,p.PROCESS_ID,p.PROCESS_NAME,p.PROCESS_DESCRIPTION,t.route_sequence,p.PROXY_SOURCE FROM " + Pending.TABLE_NAME + " p, wf_task t WHERE p.TABLE_INFO_ID IN (:ids) and p.activity_name =t.code and p.deployment_id=t.deployment_id order by t.route_sequence";
							// 解决in最大值为999问题
							List<Object[]> plist = new ArrayList<Object[]>();
							List<Object[]> mylist = new ArrayList<Object[]>();
							int PERTIME = 999;
							int count = (tIds.size() / PERTIME) + (tIds.size() % PERTIME == 0 ? 0 : 1);
							for(int i = 0 ; i < count ; i++){
								plist.addAll(dayBatchPlanInfoDao.createNativeQuery(pSql).setParameterList("ids", tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							String myPql="SELECT DISTINCT TABLE_INFO_ID,ID  FROM " + Pending.TABLE_NAME + " WHERE TABLE_INFO_ID IN (:ids) and USER_ID="+getCurrentUser().getId();
							for(int j = 0 ; j < count ; j++){
								mylist.addAll(dayBatchPlanInfoDao.createNativeQuery(myPql).setParameterList("ids", tIds.subList(PERTIME * j, PERTIME * j + (j < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							// List<Object[]> plist = dayBatchPlanInfoDao.createNativeQuery(pSql).setParameterList("ids", tIds).list();
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
								for (WOMDayBatchPlanInfo dayBatchPlanInfo : result) {
									Pending p = map.get(dayBatchPlanInfo.getTableInfoId());
									if(null != p){
										//if(dayBatchPlanInfo.getStatus()==99){
										//	p.setTaskDescription(p.getTaskDescription() + "," + InternationalResource.get("ec.pending.over", currentUser.getLanguage()));
										//} else if(dayBatchPlanInfo.getStatus()==77){
										//	p.setTaskDescription(InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage()));
										//}
										dayBatchPlanInfo.setPending(p);
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
		if(null!=permissionCode&&permissionCode.indexOf("WOM_7.5.0.0_producePlanRef")!=-1) {
				String personalCode=permissionCode.substring(permissionCode.indexOf("WOM_7.5.0.0_producePlanRef")+"WOM_7.5.0.0_producePlanRef".length()+1);
				if(null!=personalCode&&personalCode.trim().length()>0)  {
						return viewServiceFoundation.getViewWithPermissionCode("WOM_7.5.0.0_producePlanRef",personalCode);
				}
		}
		return null;
	}
	
	private void getConfigAssoPropsResult(String viewCode, List<WOMDayBatchPlanInfo> result) {
		getConfigAssoPropsResult(viewCode, null, result);
	}
	
	private void getConfigAssoPropsResult(String viewCode,String dataGridCode, List<WOMDayBatchPlanInfo> result) {
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
		Map<Long, WOMDayBatchPlanInfo> rsMap = new HashMap<Long, WOMDayBatchPlanInfo>();
		for (WOMDayBatchPlanInfo dayBatchPlanInfo : result) {
			ids.add(dayBatchPlanInfo.getId());
			rsMap.put(dayBatchPlanInfo.getId(), dayBatchPlanInfo);
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
								rs.addAll(dayBatchPlanInfoDao.createNativeQuery(sql)
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
		List<Property> list = dayBatchPlanInfoDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
		return list.get(0);
	}
	
	public List<WOMDayBatchPlanInfo> getTableInfoStatus(List<WOMDayBatchPlanInfo> result, boolean isPendingQuery, Long ... deploymentId) {
		List<Long> tIds = new ArrayList<Long>(result.size());
		User currentUser = (User) getCurrentUser();
		String hangUp = InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage());
		String over = InternationalResource.get("ec.pending.over", currentUser.getLanguage());
		String dai = InternationalResource.get("ec.flowActive.dai", currentUser.getLanguage());
		String invalid = InternationalResource.get("ec.edit.remove", currentUser.getLanguage());
		String closed = InternationalResource.get("ec.edit.closed", currentUser.getLanguage());
		if (isPendingQuery) {
			for (WOMDayBatchPlanInfo dayBatchPlanInfo : result) {
				if (dayBatchPlanInfo.getPending() != null) {
					if (dayBatchPlanInfo.getStatus() == 77) {
						dayBatchPlanInfo.getPending().setTaskDescription(hangUp);
					} else if (dayBatchPlanInfo.getPending().getProxySource() != null && !dayBatchPlanInfo.getPending().getProxySource().isEmpty()
							|| dayBatchPlanInfo.getPending().getSourceStaff() != null && !dayBatchPlanInfo.getPending().getSourceStaff().isEmpty()) {
						String statsName = dayBatchPlanInfo.getPending().getTaskDescription();
						statsName = InternationalResource.get(statsName, currentUser.getLanguage());
						statsName += "(" + dai + ")";
						dayBatchPlanInfo.getPending().setTaskDescription(statsName);
					}
				}
			}
		} else {
			Map<Long, WOMDayBatchPlanInfo> map = new HashMap<>();
			for (WOMDayBatchPlanInfo dayBatchPlanInfo : result) {
				tIds.add(dayBatchPlanInfo.getTableInfoId());
				map.put(dayBatchPlanInfo.getTableInfoId(), dayBatchPlanInfo);
				Pending pending = dayBatchPlanInfo.getPending();
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
				plist.addAll(dayBatchPlanInfoDao
						.createNativeQuery(pSql)
						.setParameterList("ids",
								tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
			}
			for (Object[] o : plist) {
				long pTableInfoId = ((Number) o[0]).longValue();
				WOMDayBatchPlanInfo dayBatchPlanInfo = map.get(pTableInfoId);
				Pending pending = dayBatchPlanInfo.getPending();
				if (pending == null) {
					pending = new Pending();
					dayBatchPlanInfo.setPending(pending);
				}
				String taskDesc = (o[1] != null) ? InternationalResource.get(o[1].toString(), currentUser.getLanguage()) : "";
				if (pending.getTaskDescription() != null) {
					pending.setTaskDescription(pending.getTaskDescription() + "," + taskDesc);
				} else {
					pending.setTaskDescription(taskDesc);
				}
			}
			for (WOMDayBatchPlanInfo dayBatchPlanInfo : result) {
				Pending p = dayBatchPlanInfo.getPending();
				if(p == null) {
					p = new Pending();
				}
				if (dayBatchPlanInfo.getStatus() == 99) {
					if (p.getTaskDescription() == null) {
						p.setTaskDescription(over);
					} else {
						p.setTaskDescription(p.getTaskDescription() + "," + over);
					}
				} else if (dayBatchPlanInfo.getStatus() == 77) {
					p.setTaskDescription(hangUp);
				} else if (dayBatchPlanInfo.getStatus() == 0) {
					p.setTaskDescription(invalid);
				}
				dayBatchPlanInfo.setPending(p);
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
	
	protected EntityTableInfo getTableInfo(WOMDayBatchPlanInfo dayBatchPlanInfo,boolean... isImport) {
		EntityTableInfo ti = new EntityTableInfo();

		if(dayBatchPlanInfo.getDeploymentId() != null) {
			ti.setDeploymentId(dayBatchPlanInfo.getDeploymentId());
			ti.setProcessKey(dayBatchPlanInfo.getProcessKey());
			ti.setProcessVersion(dayBatchPlanInfo.getProcessVersion());
		}

		ti.setOwnerStaffId(dayBatchPlanInfo.getOwnerStaffId());
		ti.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
		ti.setOwnerDepartmentId(dayBatchPlanInfo.getOwnerDepartmentId());
		
		ti.setCreateStaff(dayBatchPlanInfo.getCreateStaff());
		ti.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
		ti.setCreateTime(dayBatchPlanInfo.getCreateTime());
		ti.setDeleteStaff(dayBatchPlanInfo.getDeleteStaff());
		ti.setDeleteStaffId(dayBatchPlanInfo.getDeleteStaffId());
		ti.setDeleteTime(dayBatchPlanInfo.getDeleteTime());
		ti.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
		ti.setModifyStaff(dayBatchPlanInfo.getModifyStaff());
		ti.setModifyStaffId(dayBatchPlanInfo.getModifyStaffId());
		ti.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
		ti.setPositionLayRec(dayBatchPlanInfo.getPositionLayRec());
		ti.setTableNo(dayBatchPlanInfo.getTableNo());
		ti.setValid(true);
		ti.setTargetEntityCode("WOM_7.5.0.0_producePlanRef");
		if(isImport!=null&&isImport.length>0&&isImport[0]) {
			ti.setStatus(EntityTableInfo.STATUS_EFFECTED);
			ti.setEffectiveState(dayBatchPlanInfo.getEffectiveState());
		}else {
			ti.setStatus(dayBatchPlanInfo.getStatus());
			ti.setEffectiveState(dayBatchPlanInfo.getEffectiveState());
		}
		ti.setTargetTableName("PPM_DAY_PLAN_INFOS");
		
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
							powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  dayBatchPlanInfoDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  dayBatchPlanInfoDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_producePlanRef").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						if(sqlType!=null&&sqlType.trim().length()>0)  {
							if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
								sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"dayBatchPlanInfo\".TABLE_INFO_ID ");
								sb.append(" WHERE  \"dayBatchPlanInfo\".STATUS <> 0  ");
								innerJoinAppendFlag = true;
							}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
								
							}
						}
						powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"dayBatchPlanInfo\"","WOM_7.5.0.0_producePlanRef","","PPM_DAY_PLAN_INFOS",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"dayBatchPlanInfo\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"dayBatchPlanInfo\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"dayBatchPlanInfo\"","WOM_7.5.0.0_producePlanRef","","PPM_DAY_PLAN_INFOS",false);
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
								powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  dayBatchPlanInfoDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  dayBatchPlanInfoDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_producePlanRef").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							if(!searchRefView&&sqlType!=null&&sqlType.trim().length()>0)  {
								if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
									sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"dayBatchPlanInfo\".TABLE_INFO_ID ");
									sb.append(" WHERE  \"dayBatchPlanInfo\".STATUS <> 0  ");
									innerJoinAppendFlag = true;
								}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
									
								}
							}
							powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"dayBatchPlanInfo\"","WOM_7.5.0.0_producePlanRef","","PPM_DAY_PLAN_INFOS",false);
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
			
			mnecodeSql.append("  (\"").append("dayBatchPlanInfo.mc\"").append(".MNE_CODE) like (?) escape '&' AND \"dayBatchPlanInfo\".VALID = 1");
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
					mnecodeSql.append(" AND \"dayBatchPlanInfo\".CID = ?");
					totalValues.add(getCurrentCompanyId());
				}else{
					//当前公司不是集团情况下查询集团和本公司数据
					if(!getCurrentCompanyId().equals(1L)){
						mnecodeSql.append(" AND (\"dayBatchPlanInfo\".CID = 1 OR \"dayBatchPlanInfo\".CID = ?)");
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
				mnecodeSql.append(" and (\"").append("dayBatchPlanInfo.mc\"").append(".DAY_BATCH_PLAN_INFO) not in ("+notinValue+")");
			}
			
			SQLQuery query = dayBatchPlanInfoDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
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
		putInMaterialService = null;
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
		this.counter = this.counterManager.addCounter("producePlanRef", "WOM_7.5.0.0_producePlanRef", "producePlanRef_{1,date,yyyyMMdd}_{0,number,000}", CounterType.Daily);
		String formatStr = "";
		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=dayBatchPlanInfoDao.createNativeQuery(sql, menuCode);
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
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(WOMDayBatchPlanInfo dayBatchPlanInfo, Long tableInfoId,String scriptCode) {
		this.retrialThisTable(dayBatchPlanInfo, tableInfoId,scriptCode,null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(WOMDayBatchPlanInfo dayBatchPlanInfo, Long tableInfoId,String scriptCode,SignatureLog signatureLog) {
		beforeRetrial(dayBatchPlanInfo);
		dayBatchPlanInfo.setStatus(88);
		dayBatchPlanInfoDao.save(dayBatchPlanInfo);
		dayBatchPlanInfoDao.flush(); //如果不flush无法更新effect信息
		ProcessInstance instance = null;
		WOMDayBatchPlanInfoDealInfo del=getDealInfoEntity(tableInfoId);
		Deployment deployment=taskService.getDeployment(del.getProcessKey(), del.getProcessVersion());
		long deploymentId=deployment.getId();
		//删除流程下所有通知活动的待办
		String hql = "delete Pending p where p.entityCode = ? and p.processKey = ? and p.processVersion = ? and p.activityType = ?";
		dayBatchPlanInfoDao.bulkExecute(hql, new Object[]{"WOM_7.5.0.0_producePlanRef", del.getProcessKey(), del.getProcessVersion(), "notification"});
		taskService.completeTaskHistory(tableInfoId);
		List<Transition> transitions=processService.findFirstTransitions(deploymentId);
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setModelId(dayBatchPlanInfo.getId());
		workFlowVar.setProcessInitiator(dayBatchPlanInfo.getCreateStaff().getUser().getId());
		workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
		workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
		workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
		workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
		workFlowVar.setTableName(WOMDayBatchPlanInfo.TABLE_NAME);
		workFlowVar.setStatus(dayBatchPlanInfo);
		workFlowVar.setCrossCompanyFlag(true);
		workFlowVar.setGroupEnabled(false);
		workFlowVar.setOutcome(transitions.get(0).getName());
		workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
		//DealInfo di = taskService.take(null, deploymentId, workFlowVar);
		instance = instanceService.start(deploymentId, null, workFlowVar);
		DealInfo di = taskService.doSaveDealInfo(dayBatchPlanInfo, instance, deploymentId, null, workFlowVar);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
			}
		}
		WOMDayBatchPlanInfoDealInfo dl=new WOMDayBatchPlanInfoDealInfo();
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
		staff.setId(dayBatchPlanInfo.getOwnerStaffId());
		dl.setStaff(staff);
		dl.setUserId(di.getUserId());
		dl.setDealInfoType(DealInfoType.NORMAL);
		dayBatchPlanInfoDao.saveDealInfo(dl);
		dayBatchPlanInfoDao.createNativeQuery("update EC_TABLE_INFO set STATUS=88 where id=?", dayBatchPlanInfo.getTableInfoId()).executeUpdate();
		if(null!=scriptCode&&!"".equals(scriptCode)){
			doScript(scriptCode,dayBatchPlanInfo);
		}
		afterRetrial(dayBatchPlanInfo);
		//crossCompanyDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=dayBatchPlanInfo.getTableNo();
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
			signatureLog.setTableId(dayBatchPlanInfo.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_producePlanRef#modelCode:WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
			
	}
	public void doScript(String code ,WOMDayBatchPlanInfo dayBatchPlanInfo){

		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("db", DbUtils.getInstance());
		variables.put("dayBatchPlanInfo", dayBatchPlanInfo);
		try {
			Script script = scriptService.get("WOM_7.5.0.0_producePlanRef", code);
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
			WOMDayBatchPlanInfo dayBatchPlanInfo=dayBatchPlanInfoDao.load(Long.parseLong(idArr[i]));
			Long pendingId=Long.parseLong(pendingArr[i]);
			WorkFlowVar workFlowVar = new WorkFlowVar();
			workFlowVar.setOutcomeMap(mapList);
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setModelId(dayBatchPlanInfo.getId());
			workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setComment(comment);
			workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
			workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
			workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
			workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
			workFlowVar.setTableName(dayBatchPlanInfo.TABLE_NAME);
			workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
			workFlowVar.setStatus(dayBatchPlanInfo);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			if(!mapList.isEmpty()&&mapList.size()>0&&mapList.get(0).get("countersignUsers")!=null){
				workFlowVar.setCountersignUsers(mapList.get(0).get("countersignUsers").toString());
			}
			DealInfo di = taskService.take(pendingId, deploymentId, dayBatchPlanInfo.getId(), creatorService.getStaffFromSession(), workFlowVar);
			dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
			if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
				for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
					String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
					String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
					String type=(map.get("type")!=null)?map.get("type").toString():"";
					String assignUser=(map.get("assignUser")!=null)?map.get("assignUser").toString():"";
					if(type.equals("notification")){
						dayBatchPlanInfoDao.flush();
						di.setOutcome(outcome);
						di.setOutcomeDes(dec);
						if(assignUser!=null&&assignUser.length()>0){
							String assignStaff=taskService.getAssignUserName(assignUser);
							di.setAssignStaff(assignStaff);
						}
						dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
						
					}
				}
			}
			afterSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar);
		}
		
	}
	// ================ 生成多选控件数据保存方法 start====================
	private void dealDayPlanInfoFactoryCode(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		String addIds = dayBatchPlanInfo.getDayPlanInfoFactoryCodeAddIds();
		String delIds = dayBatchPlanInfo.getDayPlanInfoFactoryCodeDeleteIds();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("factoryCode.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMDayBatchPlanParts tmp = new WOMDayBatchPlanParts();
					tmp.setDayPlanInfo(dayBatchPlanInfo);
					MESBasicFactoryModel indirectObj = new MESBasicFactoryModel();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFactoryCode(indirectObj);
					tmp.setCid(dayBatchPlanInfo.getCid());
					dayBatchPlanPartsDao.save(tmp);
				}
			}
		}
	}

	private void setDayPlanInfoFactoryCode(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		setDayPlanInfoFactoryCode(dayBatchPlanInfo, null);
	}

	private void setDayPlanInfoFactoryCode(WOMDayBatchPlanInfo dayBatchPlanInfo, String viewCode) {
		List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Order.asc("id"), Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMDayBatchPlanParts item : tmpList) {
			if(item.getFactoryCode() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFactoryCode().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFactoryCode(), displayField);
			}
		}
		dayBatchPlanInfo.setDayBatchPlanPartsList(tmpList);
		dayBatchPlanInfo.setDayPlanInfoFactoryCodemultiselectIDs(ids);
		dayBatchPlanInfo.setDayPlanInfoFactoryCodemultiselectNames(names);
	}
	private void dealDayPlanInfoManudeptId(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		String addIds = dayBatchPlanInfo.getDayPlanInfoManudeptIdAddIds();
		String delIds = dayBatchPlanInfo.getDayPlanInfoManudeptIdDeleteIds();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("manudeptId.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMDayBatchPlanParts tmp = new WOMDayBatchPlanParts();
					tmp.setDayPlanInfo(dayBatchPlanInfo);
					Department indirectObj = new Department();
					indirectObj.setId(Long.valueOf(item));
					tmp.setManudeptId(indirectObj);
					tmp.setCid(dayBatchPlanInfo.getCid());
					dayBatchPlanPartsDao.save(tmp);
				}
			}
		}
	}

	private void setDayPlanInfoManudeptId(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		setDayPlanInfoManudeptId(dayBatchPlanInfo, null);
	}

	private void setDayPlanInfoManudeptId(WOMDayBatchPlanInfo dayBatchPlanInfo, String viewCode) {
		List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Order.asc("id"), Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMDayBatchPlanParts item : tmpList) {
			if(item.getManudeptId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getManudeptId().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getManudeptId(), displayField);
			}
		}
		dayBatchPlanInfo.setDayBatchPlanPartsList(tmpList);
		dayBatchPlanInfo.setDayPlanInfoManudeptIdmultiselectIDs(ids);
		dayBatchPlanInfo.setDayPlanInfoManudeptIdmultiselectNames(names);
	}
	private void dealDayPlanInfoProductId(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		String addIds = dayBatchPlanInfo.getDayPlanInfoProductIdAddIds();
		String delIds = dayBatchPlanInfo.getDayPlanInfoProductIdDeleteIds();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMDayBatchPlanParts tmp = new WOMDayBatchPlanParts();
					tmp.setDayPlanInfo(dayBatchPlanInfo);
					MESBasicProduct indirectObj = new MESBasicProduct();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProductId(indirectObj);
					tmp.setCid(dayBatchPlanInfo.getCid());
					dayBatchPlanPartsDao.save(tmp);
				}
			}
		}
	}

	private void setDayPlanInfoProductId(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		setDayPlanInfoProductId(dayBatchPlanInfo, null);
	}

	private void setDayPlanInfoProductId(WOMDayBatchPlanInfo dayBatchPlanInfo, String viewCode) {
		List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Order.asc("id"), Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMDayBatchPlanParts item : tmpList) {
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
		dayBatchPlanInfo.setDayBatchPlanPartsList(tmpList);
		dayBatchPlanInfo.setDayPlanInfoProductIdmultiselectIDs(ids);
		dayBatchPlanInfo.setDayPlanInfoProductIdmultiselectNames(names);
	}
	private void dealDayPlanInfoFormularID(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		String addIds = dayBatchPlanInfo.getDayPlanInfoFormularIDAddIds();
		String delIds = dayBatchPlanInfo.getDayPlanInfoFormularIDDeleteIds();
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
				List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.in("formularID.id", idList), Restrictions.eq("valid", true));
				for (WOMDayBatchPlanParts item : tmpList) {
					dayBatchPlanPartsDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMDayBatchPlanParts tmp = new WOMDayBatchPlanParts();
					tmp.setDayPlanInfo(dayBatchPlanInfo);
					RMFormula indirectObj = new RMFormula();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormularID(indirectObj);
					tmp.setCid(dayBatchPlanInfo.getCid());
					dayBatchPlanPartsDao.save(tmp);
				}
			}
		}
	}

	private void setDayPlanInfoFormularID(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		setDayPlanInfoFormularID(dayBatchPlanInfo, null);
	}

	private void setDayPlanInfoFormularID(WOMDayBatchPlanInfo dayBatchPlanInfo, String viewCode) {
		List<WOMDayBatchPlanParts> tmpList = dayBatchPlanPartsDao.findByCriteria(Order.asc("id"), Restrictions.eq("dayPlanInfo", dayBatchPlanInfo), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMDayBatchPlanParts item : tmpList) {
			if(item.getFormularID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormularID().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormularID(), displayField);
			}
		}
		dayBatchPlanInfo.setDayBatchPlanPartsList(tmpList);
		dayBatchPlanInfo.setDayPlanInfoFormularIDmultiselectIDs(ids);
		dayBatchPlanInfo.setDayPlanInfoFormularIDmultiselectNames(names);
	}
	private void dealSupervision(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		String addIds = dayBatchPlanInfo.getSupervisionAddIds();
		String delIds = dayBatchPlanInfo.getSupervisionDeleteIds();
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
				dayBatchPlanInfoDao.deleteSupervision(dayBatchPlanInfo.getTableInfoId(), idList);
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					Supervision tmp = new Supervision();
					tmp.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
					Staff indirectObj = new Staff();
					indirectObj.setId(Long.valueOf(item));
					tmp.setStaff(indirectObj);
					dayBatchPlanInfoDao.addSupervision(tmp, dayBatchPlanInfo);
					// supervisionService.save(tmp);
				}
			}
		}
	}

	private void setSupervision(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		List<WOMDayBatchPlanInfoSupervision> tmpList = dayBatchPlanInfoDao.findSupervision(dayBatchPlanInfo.getTableInfoId());
		String ids = "";
		String names = "";
		for (WOMDayBatchPlanInfoSupervision item : tmpList) {
			if(item.getStaff() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getStaff().getId();
				names += item.getStaff().getName();
			}
		}
		dayBatchPlanInfo.setSupervisionList(tmpList);
		dayBatchPlanInfo.setSupervisionmultiselectIDs(ids);
		dayBatchPlanInfo.setSupervisionmultiselectNames(names);
	}
	// ================ 生成多选控件数据保存方法 end ====================

	protected String getEntityCode(){return WOMDayBatchPlanInfo.ENTITY_CODE;}
	protected String getModuleCode(){return WOMDayBatchPlanInfo.MODULE_CODE;}
	protected String getModelCode(){return WOMDayBatchPlanInfo.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param dayBatchPlanInfo 模型实例
	 */
	public void checkUniqueConstraint(WOMDayBatchPlanInfo dayBatchPlanInfo){
		if(null == dayBatchPlanInfo.getTableNo() || StringUtils.isEmpty(dayBatchPlanInfo.getTableNo().toString())){
			return;
		}
		if(dayBatchPlanInfo.getId()==null ){
			List<WOMDayBatchPlanInfo> dayBatchPlanInfos = dayBatchPlanInfoDao.findByCriteria(Restrictions.eq("tableNo", dayBatchPlanInfo.getTableNo()));
			if(dayBatchPlanInfos!=null && !dayBatchPlanInfos.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), dayBatchPlanInfo.getTableNo());
			}
		} else {
			List<WOMDayBatchPlanInfo> dayBatchPlanInfos = dayBatchPlanInfoDao.findByCriteria(Restrictions.ne("id", dayBatchPlanInfo.getId()), Restrictions.eq("tableNo", dayBatchPlanInfo.getTableNo()));
			if(dayBatchPlanInfos!=null && !dayBatchPlanInfos.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), dayBatchPlanInfo.getTableNo());
			}
		}
	}
	
	
	@Override
	public List<WOMDayBatchPlanInfo> getDayBatchPlanInfos(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanInfo.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return dayBatchPlanInfoDao.findByHql("from " + WOMDayBatchPlanInfo.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return dayBatchPlanInfoDao.findByCriteria(detachedCriteria);
	}
	
	
	
	@Override
	public List<WOMDayBatchPlanInfo> findDayBatchPlanInfosBySql(String sql, List<Object> params){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanInfo.class);
		if(params!=null && params.size()>0){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
			
		}else{
			detachedCriteria.add(Restrictions.sqlRestriction(sql));
		}
		
		return dayBatchPlanInfoDao.findByCriteria(detachedCriteria);
	}
	@Override
	public List<WOMDayBatchPlanInfo> findDayBatchPlanInfosByHql(String hql, Object... objects){
		
		return   dayBatchPlanInfoDao.findByHql(hql, objects);
	}
	
	@Override
	public WOMDayBatchPlanInfo loadDayBatchPlanInfoByBussinessKey(WOMDayBatchPlanInfo dayBatchPlanInfo){
		return loadDayBatchPlanInfoByBussinessKey(dayBatchPlanInfo.getTableNo());
	}
	
	@Override
	public Page<WOMDayBatchPlanInfo> getDayBatchPlanInfos(Page<WOMDayBatchPlanInfo> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanInfo.class);
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
				page = dayBatchPlanInfoDao.findByPage(page, sql);
			}else{
				page = dayBatchPlanInfoDao.findAllByPage(page);
			}
			return page;
		}
		page = dayBatchPlanInfoDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMDayBatchPlanInfo loadDayBatchPlanInfoByBussinessKey(Serializable bussinessKey){
		return dayBatchPlanInfoDao.findEntityByCriteria(Restrictions.eq("tableNo", bussinessKey),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<WOMDayBatchPlanInfo> findByProperty(String propertyName, Object object){
		return dayBatchPlanInfoDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMDayBatchPlanInfo findEntityByProperty(String propertyName, Object object){
		return dayBatchPlanInfoDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<String> bussinessKeyList = Arrays.asList(bussinessKeys.split(","));
			String sql = "update " + WOMDayBatchPlanInfo.JPA_NAME + " set valid=0 where tableNo in (:businessKeys)";
			Query query = dayBatchPlanInfoDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo","runtime");
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
		List<View> views = viewServiceFoundation.findViewsByEntityCode("WOM_7.5.0.0_producePlanRef", ViewType.VIEW);
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
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	public void dealDatagridsSave(WOMDayBatchPlanInfo dayBatchPlanInfo,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=viewServiceFoundation.getDataGrids(viewCode, "runtime");
		if(dgs!=null&&dgs.size()>0){
			dayBatchPlanInfoDao.flush();
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
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()).replaceAll("\r\n", "\\\\r\\\\n"), _reflect_dgclass,dayBatchPlanInfoDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), WOMDayBatchPlanInfo.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, dayBatchPlanInfo);
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
								((com.supcon.orchid.orm.entities.AbstractEcTreeEntity)odg).setTableInfoId(dayBatchPlanInfo.getTableInfoId());
							}else{
								if (odg instanceof com.supcon.orchid.orm.entities.AbstractEcPartEntity) {
									((com.supcon.orchid.orm.entities.AbstractEcPartEntity)odg).setTableInfoId(dayBatchPlanInfo.getTableInfoId());
								} else if ((odg instanceof com.supcon.orchid.orm.entities.AbstractEcFullEntity)) {
									((com.supcon.orchid.orm.entities.AbstractEcFullEntity)odg).setTableInfoId(dayBatchPlanInfo.getTableInfoId());
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
								paramMap.put("mainModelId",dayBatchPlanInfo.getTableInfoId());	
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
			String sql = "select " + businessKeyName +" from "+ WOMDayBatchPlanInfo.TABLE_NAME +" where valid = 1";
			list = dayBatchPlanInfoDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ WOMDayBatchPlanInfo.TABLE_NAME;
			list = dayBatchPlanInfoDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey){
		List<Object[]> list = new ArrayList<Object[]>();
		Map<Object, Object> m = new HashMap<Object, Object>();
		if(null != propertyName && null != businessKey){
			String sql = "select " + businessKey + "," + propertyName +" from "+ WOMDayBatchPlanInfo.TABLE_NAME +" group by " + propertyName + "," + businessKey;
			list = dayBatchPlanInfoDao.createNativeQuery(sql).list();
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
	private WOMDayBatchPlanInfoDaoImpl dayBatchPlanInfoDaoImpl;
	
	@Override
	@Transactional
	public String getTableNoById(Long id){
		String sql = "select table_no from " + WOMDayBatchPlanInfo.TABLE_NAME + " where id = ?";
		String tableNo = dayBatchPlanInfoDao.createNativeQuery(sql,id).uniqueResult().toString();
		return tableNo;
	}
	
	@Override
	@Transactional
	public List<String> getTableNoData(){
		List<String> list = new ArrayList<String>();
		String sql = "select table_no from " + WOMDayBatchPlanInfo.TABLE_NAME;
		list = dayBatchPlanInfoDao.createNativeQuery(sql).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchDayBatchPlanInfoWorkFlow(final List<WOMDayBatchPlanInfo> insertObjs, final List<WOMDayBatchPlanInfo> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){
		return this.importBatchDayBatchPlanInfoWorkFlow(insertObjs, updateObjs, columnInfo, entityCode, importNodeInfo, importPropInfo,null);		
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchDayBatchPlanInfoWorkFlow(final List<WOMDayBatchPlanInfo> insertObjs, final List<WOMDayBatchPlanInfo> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog){
			
		int importCount = 0;
		if (null != insertObjs) {
			importCount += insertObjs.size();
		}
		if (null != updateObjs) {
			importCount += updateObjs.size();
		}
		AuditUtil.setAuditDes(InternationalResource.get("foundation.import.bussiness.info.args",null,InternationalResource.get("WOM.modelname.randon1489822842145"),importCount));
		if(null != signatureLog && null == signatureLog.getOperateLogUuid()){
			if (null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()) {
				signatureLog.setOperateLogUuid((null == AuditUtil.getCurrentAudit().getOperationAudit().get_parentCode() || "-1".equals( AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode())) ? AuditUtil.getCurrentAudit().getOperationAudit().getUuid() : AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode());
			}
		}
		Map<Long, WOMDayBatchPlanInfo> oldUpdateObjsMap = new HashMap<Long, WOMDayBatchPlanInfo>(); 
		List<Long> updateObjIdsList = new ArrayList<Long>();
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {
			WOMDayBatchPlanInfo bizObj = updateObjs.get(updateIndex);
			updateObjIdsList.add(bizObj.getId());
		}
		if (updateObjIdsList.size() > 0) {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanInfo.class);
			if(updateObjIdsList.size()>1000){
				List<Long> updateObjIdsListBefore = updateObjIdsList.subList(0, 999);
				List<Long> updateObjIdsListAfter = updateObjIdsList.subList(999, updateObjIdsList.size());		
				detachedCriteria.add(Restrictions.or(Restrictions.in("id", updateObjIdsListBefore),Restrictions.in("id", updateObjIdsListAfter)));
			}else{
				detachedCriteria.add(Restrictions.in("id", updateObjIdsList));
			}
			List<WOMDayBatchPlanInfo> bizObjList = dayBatchPlanInfoDao.findByCriteria(detachedCriteria);
			if (null != bizObjList) {
				for (int mIndex = 0; mIndex < bizObjList.size(); mIndex++) {
					WOMDayBatchPlanInfo bizObj = bizObjList.get(mIndex);
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
		
		final List<WOMDayBatchPlanInfo> nmeObjs = new ArrayList<WOMDayBatchPlanInfo>();
											
		for(WOMDayBatchPlanInfo dayBatchPlanInfo:insertObjs){//没有table_no的新增项，系统生成
			if(dayBatchPlanInfo.getTableNo() == null || (dayBatchPlanInfo.getTableNo() != null && dayBatchPlanInfo.getTableNo().equals(""))){
				dayBatchPlanInfo.setTableNo(generateTableNo());	
			}
		}
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		//String idSql = "select id from " + WOMDayBatchPlanInfo.TABLE_NAME + " order by id desc";
		//Query query = dayBatchPlanInfoDao.createNativeQuery(idSql).setMaxResults(1);
		/*String hql = "select id from " + WOMDayBatchPlanInfo.JPA_NAME + " order by id desc";
		Query query =  dayBatchPlanInfoDao.createQuery(hql).setMaxResults(1);
		Long id = new Long(1000);
		if(null != query.uniqueResult()){
			id = Long.valueOf(query.uniqueResult().toString());
		}*/
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(WOMDayBatchPlanInfo.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(WOMDayBatchPlanInfo dayBatchPlanInfo:insertObjs)  {
			//id = autoGeneratorID.getNextId(WOMDayBatchPlanInfo.TABLE_NAME,1,dbId);
			if(dayBatchPlanInfo.getTableNo() != null && !dayBatchPlanInfo.getTableNo().equals("") ){
				m.put(dayBatchPlanInfo.getTableNo(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			dayBatchPlanInfo.setId(id);
			id++;
		}
		
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) dayBatchPlanInfoDao.createNativeQuery(sql, "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		dayBatchPlanInfoDaoImpl.getSession().doWork(new Work() {
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
					String updateSql = "UPDATE " + WOMDayBatchPlanInfo.TABLE_NAME + " SET ";
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
						WOMDayBatchPlanInfo dayBatchPlanInfo = updateObjs.get(updateIndex);
						Long id = dayBatchPlanInfo.getId();
						if(null != id){
							updateps.setLong(columnMaps.size()+1,id);
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = dayBatchPlanInfo.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(dayBatchPlanInfo);
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
							nmeObjs.add(dayBatchPlanInfo);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + WOMDayBatchPlanInfo.TABLE_NAME + " (";
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
					String insertDiSql = "INSERT INTO " + WOMDayBatchPlanInfo.TABLE_NAME + "_DI " +
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
					Long diId = autoGeneratorID.getNextId(WOMDayBatchPlanInfo.TABLE_NAME + "_DI",insSize, "ID");
					Long dealInfoId = autoGeneratorID.getNextId("WF_DEAL_INFO",insSize);
					
					for(int insertIndex = 0; insertIndex<insSize; insertIndex++)  {
						WOMDayBatchPlanInfo dayBatchPlanInfo = insertObjs.get(insertIndex);
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
							insertps.setLong(columnMaps.size() + 5, dayBatchPlanInfo.getOwnerPositionId());
						if(!colExclude.contains(5))
                      		insertps.setInt(columnMaps.size() + 6, 0);
                      	if(!colExclude.contains(6))
                      		insertps.setString(columnMaps.size() + 7, "excelImport");
                      	if(!colExclude.contains(8))
							insertps.setLong(columnMaps.size() + 9, 1);
						if(!colExclude.contains(9))
							insertps.setString(columnMaps.size() + 10,dayBatchPlanInfo.getPositionLayRec());
						if(!colExclude.contains(10))
							insertps.setLong(columnMaps.size() + 11,dayBatchPlanInfo.getOwnerPosition().getDepartment().getId());
						java.util.Date date=new java.util.Date();
						if(!colExclude.contains(11))
							insertps.setTimestamp(columnMaps.size() + 12,new java.sql.Timestamp(date.getTime()));
						
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = dayBatchPlanInfo.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(dayBatchPlanInfo);
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
						dayBatchPlanInfo.setId(id);
						nmeObjs.add(dayBatchPlanInfo);
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
						ecTableInfops.setString(7,WOMDayBatchPlanInfo.TABLE_NAME);
						ecTableInfops.setInt(8,99);
						ecTableInfops.setLong(9,dayBatchPlanInfo.getOwnerPosition().getId());
						ecTableInfops.setLong(10,dayBatchPlanInfo.getOwnerStaff().getId());
						ecTableInfops.setString(11,entityCode);
						ecTableInfops.setString(12,dayBatchPlanInfo.getPositionLayRec());
						ecTableInfops.setString(13,dayBatchPlanInfo.getTableNo());
						ecTableInfops.setLong(14,dayBatchPlanInfo.getOwnerPosition().getDepartment().getId());
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
		
		dayBatchPlanInfoDaoImpl.getSession().flush();
		dayBatchPlanInfoDaoImpl.getSession().clear();
		
		
		//记录导入数据日志（区分新增和修改）
		String sqlQueryBussinesskey = "select name from runtime_property  where model_code=? and valid=1 and is_bussiness_key=1";
		String sqlQueryMainDispaly = "select name from runtime_property  where model_code=? and valid=1 and is_main_display=1";
		Object retObjBussinesskey = dayBatchPlanInfoDao.createNativeQuery(sqlQueryBussinesskey, "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo").setMaxResults(1).uniqueResult();
		String bussinesskeyFieldName = (null != retObjBussinesskey) ? retObjBussinesskey.toString() : null;
		Object retObjMainDispaly = dayBatchPlanInfoDao.createNativeQuery(sqlQueryMainDispaly, "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo").setMaxResults(1).uniqueResult();
		String mainDispalyFieldName = (null != retObjMainDispaly) ? retObjMainDispaly.toString() : null;
		
		for(int insertIndex = 0; insertIndex < insertObjs.size(); insertIndex++)  {//新增
			WOMDayBatchPlanInfo bizObj = insertObjs.get(insertIndex);
			dayBatchPlanInfoImportService.saveImportDataLog(bizObj, null, "tableNo", "id");
		}
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {//修改
			WOMDayBatchPlanInfo bizObj = updateObjs.get(updateIndex);
			WOMDayBatchPlanInfo oldBizObj = oldUpdateObjsMap.get(bizObj.getId());
			dayBatchPlanInfoImportService.saveImportDataLog(bizObj, oldBizObj, "tableNo", "id");
		}
		
		return m;
	}
	
	
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getViewName(String modelCode){
		String sql = "select NAME from runtime_view where type='LIST' and ass_model_code = ?";
		String viewName = dayBatchPlanInfoDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult()!=null?
				dayBatchPlanInfoDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult().toString():"";
		return viewName;
	}
	
	
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = dayBatchPlanInfoDao.createNativeQuery(sql, "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = dayBatchPlanInfoDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = dayBatchPlanInfoDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = dayBatchPlanInfoDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?dayBatchPlanInfoDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  dayBatchPlanInfoDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,dayBatchPlanInfoDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	
	 
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.save")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DataGridService dataGridService){
		saveDayBatchPlanInfo(dayBatchPlanInfo, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.save")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DataGridService dataGridService, String viewCode){
		saveDayBatchPlanInfo(dayBatchPlanInfo, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		this.saveDayBatchPlanInfo(dayBatchPlanInfo, dataGridService, viewCode, eventTopic,null,isImport);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void saveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog, boolean... isImport){
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		String url = null;
		if(null != dayBatchPlanInfo.getId() && dayBatchPlanInfo.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/add";
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
				executeGScript(entityCode, "beforeSave", events, dayBatchPlanInfo);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		beforeSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);

		if (null == dayBatchPlanInfo.getId()) {
			if(null == dayBatchPlanInfo.getStatus()){
				dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			dayBatchPlanInfo.setTableNo(generateTableNo());
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				if(isNew)
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				else
					dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(dayBatchPlanInfo,isImport);
				dayBatchPlanInfoDao.saveTableInfo(ti);
				dayBatchPlanInfo.setTableInfoId(ti.getId());
				if(dayBatchPlanInfo.getOwnerStaffId()==null){
					dayBatchPlanInfo.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
					ti.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
				}
				if(dayBatchPlanInfo.getOwnerDepartmentId()==null){
					dayBatchPlanInfo.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
					ti.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				}
				if(dayBatchPlanInfo.getOwnerPositionId()==null){
					dayBatchPlanInfo.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
					ti.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
				}
				dayBatchPlanInfo.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
				dayBatchPlanInfo.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
				dayBatchPlanInfo.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (dayBatchPlanInfo.getCompany() == null) {
					dayBatchPlanInfo.setCompany(getCurrentCompany());
				}
				if (dayBatchPlanInfo.getCid() == null || dayBatchPlanInfo.getCid() == -1l) {
					dayBatchPlanInfo.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
				} else {
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				}
				
		} else {
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				if(isNew)
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				else
					dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
		}
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		if (dataGridService != null) {
			dayBatchPlanInfoDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealDayPlanInfoFactoryCode(dayBatchPlanInfo);
			this.dealDayPlanInfoManudeptId(dayBatchPlanInfo);
			this.dealDayPlanInfoProductId(dayBatchPlanInfo);
			this.dealDayPlanInfoFormularID(dayBatchPlanInfo);
			this.dealSupervision(dayBatchPlanInfo);
		
		// 根据配置规则生成编码
		try {
			generateDayBatchPlanInfoCodes(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateDayBatchPlanInfoSummarys(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, dayBatchPlanInfo);
			}
		}
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		dayBatchPlanInfoDao.flush();
		dayBatchPlanInfoDao.clear();
		dayBatchPlanInfo = dayBatchPlanInfoDao.load(dayBatchPlanInfo.getId());
		
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		
		params.add(dayBatchPlanInfo);
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=dayBatchPlanInfo.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(dayBatchPlanInfo.getId());
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_producePlanRef#modelCode:WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public Map<Object, Object> dayBatchPlanInfoDataGridImport(WOMDayBatchPlanInfo dayBatchPlanInfo, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport){
		Map<Object, Object> map = new HashMap<Object, Object>();
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		String url = null;
		if(dayBatchPlanInfo.getId() != null && dayBatchPlanInfo.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/add";
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
				executeGScript(entityCode, "beforeSave", events, dayBatchPlanInfo);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		beforeSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);

		if (null == dayBatchPlanInfo.getId()) {
			if(null == dayBatchPlanInfo.getStatus()){
				dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			dayBatchPlanInfo.setTableNo(generateTableNo());
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				if(isNew)
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				else
					dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(dayBatchPlanInfo,isImport);
				dayBatchPlanInfoDao.saveTableInfo(ti);
				dayBatchPlanInfo.setTableInfoId(ti.getId());
				if(dayBatchPlanInfo.getOwnerStaffId()==null){
					dayBatchPlanInfo.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
					ti.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
				}
				if(dayBatchPlanInfo.getOwnerDepartmentId()==null){
					dayBatchPlanInfo.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
					ti.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				}
				if(dayBatchPlanInfo.getOwnerPositionId()==null){
					dayBatchPlanInfo.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
					ti.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
				}
				dayBatchPlanInfo.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
				dayBatchPlanInfo.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
				dayBatchPlanInfo.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (dayBatchPlanInfo.getCompany() == null) {
					dayBatchPlanInfo.setCompany(getCurrentCompany());
				}
				if (dayBatchPlanInfo.getCid() == null || dayBatchPlanInfo.getCid() == -1l) {
					dayBatchPlanInfo.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
				} else {
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				}
				
		} else {
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				if(isNew)
					dayBatchPlanInfoDao.save(dayBatchPlanInfo);
				else
					dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
		}

		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		
		if (dataGridService != null) {
			dayBatchPlanInfoDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealDayPlanInfoFactoryCode(dayBatchPlanInfo);
			this.dealDayPlanInfoManudeptId(dayBatchPlanInfo);
			this.dealDayPlanInfoProductId(dayBatchPlanInfo);
			this.dealDayPlanInfoFormularID(dayBatchPlanInfo);
			this.dealSupervision(dayBatchPlanInfo);
		
		// 根据配置规则生成编码
		try {
			generateDayBatchPlanInfoCodes(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateDayBatchPlanInfoSummarys(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, dayBatchPlanInfo);
			}
		}
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		dayBatchPlanInfoDao.flush();
		dayBatchPlanInfoDao.clear();
		
		String virturalId = dayBatchPlanInfo.getVirtualId();
		
		dayBatchPlanInfo = dayBatchPlanInfoDao.load(dayBatchPlanInfo.getId());
		
		if(virturalId != null && virturalId.length() > 0){
			map.put(virturalId, dayBatchPlanInfo.getId());
		}else{
			String methodName = "get" + businessKey.getName().substring(0, 1).toUpperCase() + businessKey.getName().substring(1);
			Object bkValue = null;
			try {
				Method getBkValue = dayBatchPlanInfo.getClass().getMethod(methodName);
				bkValue = getBkValue.invoke(dayBatchPlanInfo);
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				log.error(e.getMessage(), e);
			}
			map.put(bkValue, dayBatchPlanInfo.getId());
		}
		
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		
		params.add(dayBatchPlanInfo);
		return map;
	}
	
	 
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void mergeDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		beforeSaveDayBatchPlanInfo(dayBatchPlanInfo);
		if (null == dayBatchPlanInfo.getId()) {
			dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_RUNNING);
			dayBatchPlanInfo.setTableNo(generateTableNo());
			dayBatchPlanInfoDao.save(dayBatchPlanInfo);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(dayBatchPlanInfo);
				dayBatchPlanInfoDao.saveTableInfo(ti);
				dayBatchPlanInfo.setTableInfoId(ti.getId());
				if(dayBatchPlanInfo.getOwnerStaffId()==null){
					dayBatchPlanInfo.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
				}
				if(dayBatchPlanInfo.getOwnerDepartmentId()==null){
					dayBatchPlanInfo.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				}
				if(dayBatchPlanInfo.getOwnerPositionId()==null){
					dayBatchPlanInfo.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
				}
				dayBatchPlanInfo.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
				dayBatchPlanInfo.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
				dayBatchPlanInfo.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (dayBatchPlanInfo.getCompany() == null) {
					dayBatchPlanInfo.setCompany(getCurrentCompany());
				}
				if (dayBatchPlanInfo.getCid() == null || dayBatchPlanInfo.getCid() == -1l) {
					dayBatchPlanInfo.setCid(getCurrentCompanyId());
				}
				dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
		} else {
			dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
		}
		
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		
		if (dataGridService != null) {
			dataGridService.execute();
		}

			// 一对多情况处理
			this.dealDayPlanInfoFactoryCode(dayBatchPlanInfo);
			this.dealDayPlanInfoManudeptId(dayBatchPlanInfo);
			this.dealDayPlanInfoProductId(dayBatchPlanInfo);
			this.dealDayPlanInfoFormularID(dayBatchPlanInfo);
			this.dealSupervision(dayBatchPlanInfo);
		afterSaveDayBatchPlanInfo(dayBatchPlanInfo);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.exportExcel",operType="11")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.print.page.print",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes(InternationalResource.get("ec.print.page.print"));
		}else if(printType == 1){
			AuditUtil.setAuditDes(InternationalResource.get("ec.view.controlPrint"));
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.batch.save",operType="4")
	public void batchSaveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_producePlanRef");
		String url = null;
		if(dayBatchPlanInfo.getId()!=null && dayBatchPlanInfo.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_producePlanRef/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, dayBatchPlanInfo);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		beforeSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);

		if (null == dayBatchPlanInfo.getId()) {
			if(null == dayBatchPlanInfo.getStatus()){
				dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			dayBatchPlanInfo.setTableNo(generateTableNo());
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				dayBatchPlanInfoDao.save(dayBatchPlanInfo);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(dayBatchPlanInfo,isImport);
			dayBatchPlanInfoDao.saveTableInfo(ti);
			dayBatchPlanInfo.setTableInfoId(ti.getId());
			if(dayBatchPlanInfo.getOwnerStaffId()==null){
				dayBatchPlanInfo.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
				ti.setOwnerStaffId(dayBatchPlanInfo.getCreateStaffId());
			}
			if(dayBatchPlanInfo.getOwnerDepartmentId()==null){
				dayBatchPlanInfo.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
				ti.setOwnerDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
			}
			if(dayBatchPlanInfo.getOwnerPositionId()==null){
				dayBatchPlanInfo.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
				ti.setOwnerPositionId(dayBatchPlanInfo.getCreatePositionId());
			}
			dayBatchPlanInfo.setCreateStaffId(dayBatchPlanInfo.getCreateStaffId());
			dayBatchPlanInfo.setCreatePositionId(dayBatchPlanInfo.getCreatePositionId());
			dayBatchPlanInfo.setCreateDepartmentId(dayBatchPlanInfo.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (dayBatchPlanInfo.getCompany() == null) {
				dayBatchPlanInfo.setCompany(getCurrentCompany());
			}
			if (dayBatchPlanInfo.getCid() == null || dayBatchPlanInfo.getCid() == -1l) {
				dayBatchPlanInfo.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				dayBatchPlanInfoDao.save(dayBatchPlanInfo);
			}
		} else {
			if (viewIsView) {
				dayBatchPlanInfoDao.saveWithRevertVersion(dayBatchPlanInfo);
			} else {
				dayBatchPlanInfoDao.merge(dayBatchPlanInfo);
			}
		}

		if (dataGridService != null) {
			dayBatchPlanInfoDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealDayPlanInfoFactoryCode(dayBatchPlanInfo);
			this.dealDayPlanInfoManudeptId(dayBatchPlanInfo);
			this.dealDayPlanInfoProductId(dayBatchPlanInfo);
			this.dealDayPlanInfoFormularID(dayBatchPlanInfo);
			this.dealSupervision(dayBatchPlanInfo);
		
		// 根据配置规则生成编码
		try {
			generateDayBatchPlanInfoCodes(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateDayBatchPlanInfoSummarys(dayBatchPlanInfo, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveDayBatchPlanInfo(dayBatchPlanInfo, viewIsView);


		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, dayBatchPlanInfo);
			}
		}
		List<WOMDayBatchPlanInfo> params = new ArrayList<WOMDayBatchPlanInfo>();
		dayBatchPlanInfoDao.flush();
		dayBatchPlanInfoDao.clear();
		dayBatchPlanInfo = dayBatchPlanInfoDao.load(dayBatchPlanInfo.getId());
		
		List<WOMDayBatchPlanParts> dayBatchPlanPartsList = dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo));
		dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
		
		params.add(dayBatchPlanInfo);
	}
	
	@Override
	public Page<WOMDayBatchPlanInfo> getByPage(Page<WOMDayBatchPlanInfo> page,DetachedCriteria detachedCriteria){
		return dayBatchPlanInfoDao.findByPage(page, detachedCriteria);
	}
	@Override
	public List<WOMDayBatchPlanParts> getDayBatchPlanPartsList(WOMDayBatchPlanInfo dayBatchPlanInfo){
		return dayBatchPlanPartsDao.findByCriteria(Restrictions.eq("dayPlanInfo", dayBatchPlanInfo),Restrictions.eq("valid", true));
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.common.super.edit",operType="4")
	public void saveSuperEditDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditDayBatchPlanInfo(workFlowVar, dataGridService, view, entityCode, events, dayBatchPlanInfo, isImport);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="foundation.batch.import")
	public void batchSaveSuperEditDayBatchPlanInfo(List<WOMDayBatchPlanInfo>  dayBatchPlanInfos, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(WOMDayBatchPlanInfo dayBatchPlanInfo:dayBatchPlanInfos)  {
			saveSingleSuperEditDayBatchPlanInfo(workFlowVar, dataGridService, view, entityCode, events, dayBatchPlanInfo, isImport);
		}
	}
	
	
	
	private void saveSingleSuperEditDayBatchPlanInfo(WorkFlowVar workFlowVar, DataGridService dataGridService, View view, String entityCode, List<Event> events,WOMDayBatchPlanInfo dayBatchPlanInfo, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, dayBatchPlanInfo);
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
		workFlowVar.setTableName(WOMDayBatchPlanInfo.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
		workFlowVar.setStatus(dayBatchPlanInfo);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		dayBatchPlanInfo.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (dayBatchPlanInfo.getId() == null) {
			dayBatchPlanInfo.setStatus(EntityTableInfo.STATUS_EFFECTED);
			dayBatchPlanInfo.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar, true);
		batchSaveDayBatchPlanInfo(dayBatchPlanInfo, dataGridService, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(dayBatchPlanInfo.getTableInfoId(), isSuperAdd,isImport);
		dayBatchPlanInfoDao.flush();
		workFlowVar.setModelId(dayBatchPlanInfo.getId());
		workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
		workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
		workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
		workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
		
		afterSubmitProcessDayBatchPlanInfo(dayBatchPlanInfo, di, workFlowVar, view.getCode(), true);
		afterSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, dayBatchPlanInfo);
			}
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void save(WOMDayBatchPlanInfo dayBatchPlanInfo,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		save(dayBatchPlanInfo, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
	public void save(WOMDayBatchPlanInfo dayBatchPlanInfo, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		boolean first = null == dayBatchPlanInfo.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != dayBatchPlanInfo.getCreateStaff() && null != dayBatchPlanInfo.getCreateStaff().getUser()){
		    	createStaffUserId = dayBatchPlanInfo.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
			workFlowVar.setTableName(WOMDayBatchPlanInfo.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
		}
		dayBatchPlanInfo.setWorkFlowVar(workFlowVar);
		if(dayBatchPlanInfo.getDeploymentId() == null && deploymentId != null) {
			dayBatchPlanInfo.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				dayBatchPlanInfo.setProcessKey(d.getProcessKey());
				dayBatchPlanInfo.setProcessVersion(d.getProcessVersion());
			}
		}

		saveDayBatchPlanInfo(dayBatchPlanInfo, dataGridService, viewCode);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(dayBatchPlanInfo.getId());
			workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
			workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
			workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
			workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(dayBatchPlanInfo, instance, deploymentId, pendingId, workFlowVar);
		dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
		dayBatchPlanInfoDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessDayBatchPlanInfo(dayBatchPlanInfo, di, workFlowVar, viewCode);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.submit",operType="4")
	public void submit(WOMDayBatchPlanInfo dayBatchPlanInfo,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		submit(dayBatchPlanInfo, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_producePlanRef",model="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo",desc="ec.flow.submit",operType="4")
	public void submit(WOMDayBatchPlanInfo dayBatchPlanInfo, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		String entityCode = "WOM_7.5.0.0_producePlanRef";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, dayBatchPlanInfo);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(dayBatchPlanInfo);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_producePlanRef");
		workFlowVar.setTableName(WOMDayBatchPlanInfo.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_dayBatchPlanInfoService");
		workFlowVar.setStatus(dayBatchPlanInfo);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		dayBatchPlanInfo.setWorkFlowVar(workFlowVar);
		if(dayBatchPlanInfo.getDeploymentId() == null && deploymentId != null) {
			dayBatchPlanInfo.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				dayBatchPlanInfo.setProcessKey(d.getProcessKey());
				dayBatchPlanInfo.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar);
		saveDayBatchPlanInfo(dayBatchPlanInfo, dataGridService, viewCode);
		if(null != dayBatchPlanInfo && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMDayBatchPlanInfo.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == dayBatchPlanInfo.getTableNo() ? "" : dayBatchPlanInfo.getTableNo().toString());
			AuditUtil.setColumnStringA(null == dayBatchPlanInfo.getId() ? "" : dayBatchPlanInfo.getId().toString());
			AuditUtil.setColumnStringC(dayBatchPlanInfo.getId().toString());
		}
		dayBatchPlanInfoDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(dayBatchPlanInfo.getId());
		workFlowVar.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
		workFlowVar.setInitiatorPositionId(dayBatchPlanInfo.getCreatePositionId());
		workFlowVar.setOwnerId(dayBatchPlanInfo.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(dayBatchPlanInfo.getOwnerPositionId());
		workFlowVar.setTableNo(dayBatchPlanInfo.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, dayBatchPlanInfo.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(dayBatchPlanInfo, di, deploymentId, pendingId, workFlowVar, true);
			dayBatchPlanInfoDao.copyAndSaveDealInfo(saveDi, dayBatchPlanInfo, creatorService.getStaffFromSession());
		}
		dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					dayBatchPlanInfoDao.flush();
					
					WOMDayBatchPlanInfoDealInfo dayBatchPlanInfoDealInfo=dayBatchPlanInfoDao.copyAndSaveDealInfo(di, dayBatchPlanInfo, creatorService.getStaffFromSession());
					dayBatchPlanInfoDealInfo.setOutcome(outcome);
					dayBatchPlanInfoDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						dayBatchPlanInfoDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				dayBatchPlanInfoDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(dayBatchPlanInfo.getStatus() == 99) {
			dayBatchPlanInfoDao.deleteSupervision(dayBatchPlanInfo.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + dayBatchPlanInfo.getProcessKey() + "_" + di.getActivityName() + "_WOM_7.5.0.0_producePlanRef_" + dayBatchPlanInfo.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		dayBatchPlanInfoDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessDayBatchPlanInfo(dayBatchPlanInfo, di, workFlowVar, viewCode);
		afterSubmitDayBatchPlanInfo(dayBatchPlanInfo, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, dayBatchPlanInfo);
			}
		}
	}
	
	public String generateTableNo(){
		this.counter.setPattern(modelServiceFoundation.getEntity("WOM_7.5.0.0_producePlanRef").getPrefix()+"_{1,date,yyyyMMdd}_{0,number,000}");
		return this.counter.incrementAndGetString(new Date(),new Date());
	}
	private void beforeSaveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, Object... objects){
		checkUniqueConstraint(dayBatchPlanInfo);
	/* CUSTOM CODE START(serviceimpl,beforeSave,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportDayBatchPlanInfo(List<WOMDayBatchPlanInfo> dayBatchPlanInfos, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportDayBatchPlanInfo(List<WOMDayBatchPlanInfo> dayBatchPlanInfos){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportDayBatchPlanInfo(List<WOMDayBatchPlanInfo> dayBatchPlanInfos, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportDayBatchPlanInfo(List<WOMDayBatchPlanInfo> dayBatchPlanInfos){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	private void beforeDeleteDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterDeleteDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo){
	/* CUSTOM CODE START(serviceimpl,afterDelete,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRestoreDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo){
	/* CUSTOM CODE START(serviceimpl,beforeRestore,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterRestoreDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo){
	/* CUSTOM CODE START(serviceimpl,afterRestore,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void customGenerateCodes(WOMDayBatchPlanInfo dayBatchPlanInfo, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(WOMDayBatchPlanInfo dayBatchPlanInfo, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeSubmitDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,beforeSubmit,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeSubmitDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,beforeSubmitSuperEdit,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,afterSubmit,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,afterSubmitSuperEdit,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRetrial(WOMDayBatchPlanInfo dayBatchPlanInfo){
	/* CUSTOM CODE START(serviceimpl,beforeRetrial,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterRetrial(WOMDayBatchPlanInfo dayBatchPlanInfo){
	/* CUSTOM CODE START(serviceimpl,afterRetrial,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterSubmitProcessDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcess,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitProcessDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DealInfo di, WorkFlowVar workFlowVar, String viewCode, Boolean superEdit){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcessSuperEdit,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveProcessDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSaveProcess,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportDayBatchPlanInfo(List<WOMDayBatchPlanInfo> insertObjs, List<WOMDayBatchPlanInfo> updateObjs, 
			List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportDayBatchPlanInfo,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void afterImportDayBatchPlanInfo(List<WOMDayBatchPlanInfo> insertObjs, List<WOMDayBatchPlanInfo> updateObjs, 
			List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportDayBatchPlanInfo,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	/* CUSTOM CODE START(serviceimpl,functions,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
