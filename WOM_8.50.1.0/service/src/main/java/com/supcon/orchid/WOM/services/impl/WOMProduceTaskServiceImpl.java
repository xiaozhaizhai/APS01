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
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.services.WOMProduceTaskImportService;
import com.supcon.orchid.WOM.entities.WOMProduceTaskDealInfo;
import com.supcon.orchid.WOM.entities.WOMProduceTaskSupervision;
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
import com.supcon.orchid.WOM.entities.WOMProduceTaskSupervision;
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
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.publicSet.entities.PublicSetActBatState;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.publicSet.entities.PublicSetActBatState;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
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
import com.supcon.orchid.WOM.daos.impl.WOMProduceTaskDaoImpl;
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
/* CUSTOM CODE START(serviceimpl,import,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
import java.util.TreeMap;

import com.supcon.orchid.RM.services.RMFormulaBomService;
import com.supcon.orchid.RM.entities.RMBatchFactory;
import com.supcon.orchid.RM.services.RMBatchFactoryService;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.RM.services.RMProcessUnitChoiceService;
import com.supcon.orchid.RM.services.RMProcessUnitService;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.ec.utils.ConditionUtil;
import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.services.ConsulService;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.WOM.entities.ProcessStep;
import com.supcon.orchid.WOM.entities.WOMResult;
import com.supcon.orchid.WOM.enums.ResultEnum;

import java.text.SimpleDateFormat;

import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.entities.Position;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogService;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.RM.entities.RMMQDealinfo;

import java.text.ParseException;

import com.supcon.orchid.publicSet.services.*;

import com.supcon.orchid.RM.services.RMMQDealinfoService;
import com.supcon.orchid.WOM.entities.BatchAnalyze;
import java.util.*;
import com.supcon.orchid.WOM.services.WOMInterfaceSelfService;
import com.supcon.orchid.publicSet.entities.*;
/* CUSTOM CODE END */

@Service("wOM_produceTaskService")
@Transactional
public class WOMProduceTaskServiceImpl  extends BaseServiceImpl<WOMProduceTask> implements WOMProduceTaskService,IScriptService, InitializingBean, DisposableBean {
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
	private WOMProduceTaskVariablesProvider variablesProvider;
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
	private Counter productBatchNumCounter;
	@Autowired
	private CreatorService creatorService;
	@Autowired
	private BundleContext bundleContext;
	@Autowired
	private SynchronizeInfoService synchronizeInfoService;
	@Autowired
	private ModelServiceFoundation modelServiceFoundation;
	@Resource
	private IBAPBaseService<WOMProduceTask> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private WOMProduceTaskImportService produceTaskImportService;
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + WOMProduceTask.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)"  + "and VALID = 1";
		Query query =  produceTaskDao.createQuery(hql);
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
			String hql = "select " + businessKeyName + ",id from " + WOMProduceTask.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = produceTaskDao.createQuery(hql);
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
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + WOMProduceTask.JPA_NAME + " where " + mainDisplayName + " in (:serial)";
		}else if(queryParam!=null && queryParam.equals("bk")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + WOMProduceTask.JPA_NAME + " where " + businessKeyName + " in (:serial)";
		}
		Query query =  produceTaskDao.createQuery(hql);
		query.setParameterList("serial", serial);
		List<Object[]> list = query.list();
		/*String sql = null;
		if(queryParam!=null && queryParam.equals("md")){
			sql = "select * from " + WOMProduceTask.TABLE_NAME + " where " + mainDisplayName + " = ?";
		}else if(queryParam!=null && queryParam.equals("bk")){
			sql = "select * from " + WOMProduceTask.TABLE_NAME + " where " + businessKeyName + " = ?";
		}
		List<WOMProduceTask> list = (List<WOMProduceTask>) produceTaskDao.createNativeQuery(sql,serial.get(0)).list();
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
	public WOMProduceTask getProduceTask(long id){
		return getProduceTask(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMProduceTask getProduceTask(long id, String viewCode){
		WOMProduceTask produceTask = produceTaskDao.load(id);

		// 一对多情况处理
		if(produceTask != null){
			this.setTaskIDTaskProcessID(produceTask, viewCode);
			this.setTaskIDFactoryId(produceTask, viewCode);
			this.setTaskIDStaffID(produceTask, viewCode);
			this.setTaskIDFormularActice(produceTask, viewCode);
			this.setTaskIDWaitPutinRecordID(produceTask, viewCode);
			this.setTaskIDProductID(produceTask, viewCode);
			this.setTaskIDActiveBatchStateID(produceTask, viewCode);
			this.setTaskIDTaskActiveID(produceTask, viewCode);
			this.setTaskIDProcessExeLog(produceTask, viewCode);
			this.setTaskIDFactoryID(produceTask, viewCode);
			this.setTaskIDFormularProcess(produceTask, viewCode);
			this.setHeadIdProductId(produceTask, viewCode);
			this.setHeadIDFactoryId(produceTask, viewCode);
			this.setHeadIDPutBatMateId(produceTask, viewCode);
			this.setHeadIDActiveBatchState(produceTask, viewCode);
			this.setHeadIDFormulaBom(produceTask, viewCode);
			this.setHeadIDFormulaId(produceTask, viewCode);
			this.setHeadIDProductId(produceTask, viewCode);
			this.setHeadIDOrderProcessId(produceTask, viewCode);
			this.setHeadIDBatchNumObj(produceTask, viewCode);
			this.setHeadIDActiveId(produceTask, viewCode);
			this.setHeadIDProcessId(produceTask, viewCode);
			this.setHeadIdFormulaId(produceTask, viewCode);
			this.setHeadIdProcessType(produceTask, viewCode);
			this.setHeadIdFormularProcess(produceTask, viewCode);
			this.setHeadIdFactoryId(produceTask, viewCode);
			this.setSupervision(produceTask);
		}
		return produceTask;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getProduceTaskAsJSON(long id, String include){
		WOMProduceTask produceTask = produceTaskDao.load(id);
		// 一对多情况处理
			this.setTaskIDTaskProcessID(produceTask);
			this.setTaskIDFactoryId(produceTask);
			this.setTaskIDStaffID(produceTask);
			this.setTaskIDFormularActice(produceTask);
			this.setTaskIDWaitPutinRecordID(produceTask);
			this.setTaskIDProductID(produceTask);
			this.setTaskIDActiveBatchStateID(produceTask);
			this.setTaskIDTaskActiveID(produceTask);
			this.setTaskIDProcessExeLog(produceTask);
			this.setTaskIDFactoryID(produceTask);
			this.setTaskIDFormularProcess(produceTask);
			this.setHeadIdProductId(produceTask);
			this.setHeadIDFactoryId(produceTask);
			this.setHeadIDPutBatMateId(produceTask);
			this.setHeadIDActiveBatchState(produceTask);
			this.setHeadIDFormulaBom(produceTask);
			this.setHeadIDFormulaId(produceTask);
			this.setHeadIDProductId(produceTask);
			this.setHeadIDOrderProcessId(produceTask);
			this.setHeadIDBatchNumObj(produceTask);
			this.setHeadIDActiveId(produceTask);
			this.setHeadIDProcessId(produceTask);
			this.setHeadIdFormulaId(produceTask);
			this.setHeadIdProcessType(produceTask);
			this.setHeadIdFormularProcess(produceTask);
			this.setHeadIdFactoryId(produceTask);
			this.dealSupervision(produceTask);

		if(produceTask == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(produceTask, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.delete",operType="3")
	public void deleteProduceTask(WOMProduceTask produceTask){
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		beforeDeleteProduceTask(produceTask);
		produceTaskDao.delete(produceTask);
		afterDeleteProduceTask(produceTask);
		produceTaskDao.flush();
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		params.add(produceTask);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
		delIds = produceTask.getTaskIDTaskProcessIDmultiselectIDs();
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
				List<WOMBatchPhaseExelog> tmpList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("taskProcessID.id", idList), Restrictions.eq("valid", true));
				for (WOMBatchPhaseExelog item : tmpList) {
					batchPhaseExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDFactoryIdmultiselectIDs();
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
				List<WOMBatchPhaseExelog> tmpList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMBatchPhaseExelog item : tmpList) {
					batchPhaseExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDStaffIDmultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("staffID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDFormularActicemultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("formularActice.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDWaitPutinRecordIDmultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("waitPutinRecordID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDProductIDmultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("productID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDActiveBatchStateIDmultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("activeBatchStateID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDTaskActiveIDmultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("taskActiveID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDProcessExeLogmultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("processExeLog.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDFactoryIDmultiselectIDs();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("factoryID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getTaskIDFormularProcessmultiselectIDs();
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
				List<WOMProdTaskProcExelog> tmpList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("formularProcess.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskProcExelog item : tmpList) {
					prodTaskProcExelogDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIdProductIdmultiselectIDs();
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
				List<WOMProduceMaterialSum> tmpList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceMaterialSum item : tmpList) {
					produceMaterialSumDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDFactoryIdmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDPutBatMateIdmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("putBatMateId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDActiveBatchStatemultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("activeBatchState.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDFormulaBommultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("formulaBom.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDFormulaIdmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("formulaId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDProductIdmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDOrderProcessIdmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("orderProcessId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDBatchNumObjmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("batchNumObj.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDActiveIdmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("activeId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIDProcessIdmultiselectIDs();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("processId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIdFormulaIdmultiselectIDs();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("formulaId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIdProcessTypemultiselectIDs();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("processType.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIdFormularProcessmultiselectIDs();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("formularProcess.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
		delIds = produceTask.getHeadIdFactoryIdmultiselectIDs();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
			// TODO delete
			// this.dealSupervision(produceTask);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.delete",operType="3")
	public void deleteProduceTask(List<Long> produceTaskIds){
		deleteProduceTask(produceTaskIds, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.delete",operType="3")
	public void deleteProduceTask(List<Long> produceTaskIds, String eventTopic) {
		List<WOMProduceTask> produceTasks = new ArrayList<WOMProduceTask>();
		for(Long produceTaskId : produceTaskIds){
			WOMProduceTask produceTask = getProduceTask(produceTaskId);
			produceTasks.add(produceTask);
			if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(AuditUtil.getColumnStringA() + (null == produceTask.getId() ? "" : "," + produceTask.getId().toString()));
				} else {
					AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(AuditUtil.getColumnStringB() + (null == produceTask.getTableNo() ? "" : "," + produceTask.getTableNo().toString()));
				} else {
					AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(AuditUtil.getColumnStringC() + (null == produceTask.getId() ? "" : "," + produceTask.getId().toString()));
				} else {
					AuditUtil.setColumnStringC(null == produceTask.getId() ? "" : produceTask.getId().toString());
				}
			}
		}
		
		for(WOMProduceTask produceTask : produceTasks){
			beforeDeleteProduceTask(produceTask);
		}
		
		
		/**
		 * 假删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(produceTasks != null && produceTasks.size() > 0 ){
			for(WOMProduceTask produceTask : produceTasks){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				List<Object> currentState = new ArrayList<Object>();
				propertyNames.add("valid");
				currentState.add(false);
				previousState.add(true);
				dataAuditLogService.saveCustomerAudit(InternationalResource.get("foundation.common.delete"),produceTask, produceTask.getId(), currentState.toArray(), previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
			}
		}
		if(produceTaskIds != null && produceTaskIds.size() > 0) {
			String hql = "update " + WOMProduceTask.JPA_NAME + " set valid = false where id in(:ids)";
			Query query = produceTaskDao.createQuery(hql);
			query.setParameterList("ids", produceTaskIds);
			query.executeUpdate();
		}
		
		for(WOMProduceTask produceTask : produceTasks){
			afterDeleteProduceTask(produceTask);
		}
		
		if(eventTopic==null){
			for(WOMProduceTask produceTaskz : produceTasks){
				produceTaskz.setValid(false);
				List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
				List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTaskz));
				produceTaskz.setProduceTaskActiveList(produceTaskActiveList);
				List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTaskz));
				produceTaskz.setBatchPhaseExelogList(batchPhaseExelogList);
				List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTaskz));
				produceTaskz.setProdTaskActiExelogList(prodTaskActiExelogList);
				List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTaskz));
				produceTaskz.setProduceMaterialSumList(produceMaterialSumList);
				List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTaskz));
				produceTaskz.setProduceTaskProcessList(produceTaskProcessList);
				List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTaskz));
				produceTaskz.setProdTaskProcExelogList(prodTaskProcExelogList);
				params.add(produceTaskz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "WOM_7.5.0.0_produceTask");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.delete",operType="3")
	public void deleteProduceTask(long produceTaskId, int produceTaskVersion){
		this.deleteProduceTask(produceTaskId, produceTaskVersion,null);
	}
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.delete",operType="3")
	public void deleteProduceTask(long produceTaskId, int produceTaskVersion,SignatureLog signatureLog){
		WOMProduceTask produceTask = getProduceTask(produceTaskId);
		if(produceTask != null && !produceTask.isValid()){
			throw new BAPException(BAPException.Code.OBJECT_HAVE_BEAN_DELETED);
		}
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		beforeDeleteProduceTask(produceTask);
		produceTaskDao.delete(produceTaskId, produceTaskVersion);
		afterDeleteProduceTask(produceTask);
		produceTaskDao.flush();
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		params.add(produceTask);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		props.put("eventType", "delete");
		
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=produceTask.getTableNo();
			signatureLog.setTableId(produceTask.getId());
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
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.delete",operType="3")
	public void deleteProduceTask(String produceTaskIds){
		this.deleteProduceTask(produceTaskIds,null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.delete",operType="3")
	public void deleteProduceTask(String produceTaskIds,SignatureLog signatureLog){
		deleteCollection(produceTaskIds,signatureLog);
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
				deleteProduceTask(Long.valueOf(id), Integer.valueOf(version),signatureLog);
			}
		}
		if(null != signatureLog){
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_produceTask#modelCode:WOM_7.5.0.0_produceTask_ProduceTask#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.engine.restore",operType="10")
	public void restoreProduceTask(String produceTaskIds){
		restoreCollection(produceTaskIds);
	}
	
	public void restoreCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			if (id != null && id.trim().length() > 0) {
				restoreProduceTask(Long.valueOf(id));
			}
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.engine.restore",operType="10")
	public void restoreProduceTask(long produceTaskId){
		
		findBusinessKeyUsed(produceTaskId);	//判断业务主键是否重复
		
		WOMProduceTask produceTask = getProduceTask(produceTaskId);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		beforeRestoreProduceTask(produceTask);
		produceTask.setValid(true);
		produceTaskDao.update(produceTask);
		afterRestoreProduceTask(produceTask);
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		params.add(produceTask);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		props.put("eventType", "restore");
	}
	
	public void findBusinessKeyUsed(long produceTaskId){
		Property property = modelServiceFoundation.getBussinessProperty("WOM_7.5.0.0_produceTask_ProduceTask");
		if(property != null){
			String propertyName = property.getColumnName();
			String sql  = "select * from " + WOMProduceTask.TABLE_NAME + " where valid = 1 and " + 
					propertyName + " =  (select "+ propertyName +" from "+ WOMProduceTask.TABLE_NAME +" where id = ? )";
			List<Object> list =  produceTaskDao.createNativeQuery(sql,produceTaskId).list();
			if(list.size() > 0){
				throw new BAPException("foundation.bussinessKey.repeat");
			}
			
		}
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.batch.import",operType="4")
	public  void batchImportBaseProduceTask(List<WOMProduceTask>  produceTasks){
		for(WOMProduceTask produceTask:produceTasks)  {
			saveProduceTask(produceTask, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBaseProduceTask(List<WOMProduceTask>  produceTasks){
		for(WOMProduceTask produceTask:produceTasks)  {
			saveProduceTask(produceTask, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.save")
	public void saveProduceTask(WOMProduceTask produceTask, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		saveProduceTask(produceTask, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.save")
	public void saveProduceTask(WOMProduceTask produceTask, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		saveProduceTask(produceTask, dgLists,dgDeleteIDs,assFileUploads, viewCode, null,null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, boolean... isImport){
		this.saveSuperEditProduceTask(produceTask, workFlowVar, dgLists, dgDeleteIDs, assFileUploads, viewCode, null, isImport);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.dealInfo.superEdit",operType="4")
	public void saveSuperEditProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode, SignatureLog signatureLog, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_produceTask";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditProduceTask(workFlowVar, dgLists, dgDeleteIDs, assFileUploads, view, entityCode, events, produceTask, isImport);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=produceTask.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			signatureLog.setTableId(produceTask.getId());
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_produceTask#modelCode:WOM_7.5.0.0_produceTask_ProduceTask#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.upload.importFlow",operType="4")
	public void importProduceTaskWorkFlow(WOMProduceTask produceTask, String viewCode){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 saveSuperEditProduceTask(produceTask, workFlowVar, null,null,null, viewCode, null,true);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.batch.upload.importFlow",operType="4")
	public void batchImportProduceTaskWorkFlow(List<WOMProduceTask>  produceTasks, View view){
		 WorkFlowVar workFlowVar =new WorkFlowVar();
		 workFlowVar.setOperateType("submit");
		 batchSaveSuperEditProduceTask(produceTasks, workFlowVar, null,null,null, view, true);
	}
	
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.batch.import",operType="4")
	public void batchSaveSuperEditProduceTask(List<WOMProduceTask>  produceTasks, WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_produceTask";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(WOMProduceTask produceTask:produceTasks)  {
			saveSingleSuperEditProduceTask(workFlowVar, dgLists, dgDeleteIDs,assFileUploads, view, entityCode, events, produceTask, isImport);
		}
	}
	
	
	
	public void saveSingleSuperEditProduceTask(WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, View view, String entityCode, List<Event> events,WOMProduceTask produceTask, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, produceTask);
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
		workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		workFlowVar.setStatus(produceTask);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		produceTask.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (produceTask.getId() == null) {
			produceTask.setStatus(EntityTableInfo.STATUS_EFFECTED);
			produceTask.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitProduceTask(produceTask, workFlowVar, true);
		batchSaveProduceTask(produceTask,dgLists, dgDeleteIDs,assFileUploads, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(produceTask.getTableInfoId(), isSuperAdd,isImport);
		produceTaskDao.flush();
		workFlowVar.setModelId(produceTask.getId());
		workFlowVar.setTableInfoId(produceTask.getTableInfoId());
		workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
		workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
		workFlowVar.setTableNo(produceTask.getTableNo());
		
		afterSubmitProcessProduceTask(produceTask, di, workFlowVar, view.getCode(), true);
		afterSubmitProduceTask(produceTask, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, produceTask);
			}
		}
	}
	
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.batch.save",operType="4")
	public void batchSaveProduceTask(WOMProduceTask produceTask,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads ,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_produceTask";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		String url = null;
		if(produceTask.getId()!=null && produceTask.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, produceTask);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		beforeSaveProduceTask(produceTask, viewIsView);

		if (null == produceTask.getId()) {
			if(null == produceTask.getStatus()){
				produceTask.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			produceTask.setTableNo(generateTableNo());
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				produceTaskDao.save(produceTask);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(produceTask,isImport);
			produceTaskDao.saveTableInfo(ti);
			produceTask.setTableInfoId(ti.getId());
			if(produceTask.getOwnerStaffId()==null){
				produceTask.setOwnerStaffId(produceTask.getCreateStaffId());
				ti.setOwnerStaffId(produceTask.getCreateStaffId());
			}
			if(produceTask.getOwnerDepartmentId()==null){
				produceTask.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
				ti.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
			}
			if(produceTask.getOwnerPositionId()==null){
				produceTask.setOwnerPositionId(produceTask.getCreatePositionId());
				ti.setOwnerPositionId(produceTask.getCreatePositionId());
			}
			produceTask.setCreateStaffId(produceTask.getCreateStaffId());
			produceTask.setCreatePositionId(produceTask.getCreatePositionId());
			produceTask.setCreateDepartmentId(produceTask.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (produceTask.getCompany() == null) {
				produceTask.setCompany(getCurrentCompany());
			}
			if (produceTask.getCid() == null || produceTask.getCid() == -1l) {
				produceTask.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				produceTaskDao.save(produceTask);
			}
		} else {
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				produceTaskDao.merge(produceTask);
			}
		}
		dealDatagridsSave(produceTask,view.getCode(),dgLists,dgDeleteIDs,assFileUploads);
		
		// 一对多情况处理
		this.dealTaskIDTaskProcessID(produceTask);
		this.dealTaskIDFactoryId(produceTask);
		this.dealTaskIDStaffID(produceTask);
		this.dealTaskIDFormularActice(produceTask);
		this.dealTaskIDWaitPutinRecordID(produceTask);
		this.dealTaskIDProductID(produceTask);
		this.dealTaskIDActiveBatchStateID(produceTask);
		this.dealTaskIDTaskActiveID(produceTask);
		this.dealTaskIDProcessExeLog(produceTask);
		this.dealTaskIDFactoryID(produceTask);
		this.dealTaskIDFormularProcess(produceTask);
		this.dealHeadIdProductId(produceTask);
		this.dealHeadIDFactoryId(produceTask);
		this.dealHeadIDPutBatMateId(produceTask);
		this.dealHeadIDActiveBatchState(produceTask);
		this.dealHeadIDFormulaBom(produceTask);
		this.dealHeadIDFormulaId(produceTask);
		this.dealHeadIDProductId(produceTask);
		this.dealHeadIDOrderProcessId(produceTask);
		this.dealHeadIDBatchNumObj(produceTask);
		this.dealHeadIDActiveId(produceTask);
		this.dealHeadIDProcessId(produceTask);
		this.dealHeadIdFormulaId(produceTask);
		this.dealHeadIdProcessType(produceTask);
		this.dealHeadIdFormularProcess(produceTask);
		this.dealHeadIdFactoryId(produceTask);
		this.dealSupervision(produceTask);
		
		// 根据配置规则生成编码
		try {
			generateProduceTaskCodes(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProduceTaskSummarys(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduceTask(produceTask, viewIsView);
		

		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, produceTask);
			}
		}
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		produceTaskDao.flush();
		produceTaskDao.clear();
		produceTask = produceTaskDao.load(produceTask.getId());
		
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		
		params.add(produceTask);
	}
	
	
	
	

	public void generateProduceTaskCodes(WOMProduceTask produceTask) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateProduceTaskCodes(produceTask, false);
	}
	
	public void generateProduceTaskCodes(WOMProduceTask produceTask, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
			produceTaskDao.flush();
			produceTaskDao.clear();
			WOMProduceTask modelinstance = getProduceTask(produceTask.getId());
			customGenerateCodes(modelinstance, viewIsView);
			ArrayList<Map<String, Object>> configs=null;
			String dependence;
			Property property=null;
			boolean isLegal;
		// productBatchNum
		if (produceTask.getProductBatchNum() == null || produceTask.getProductBatchNum().isEmpty()) {
			String productBatchNum_property_code = "WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum";
			property = modelServiceFoundation.getProperty(productBatchNum_property_code);
			isLegal=true;
			if(null != property){
				Map<String, Object> productBatchNumattributesMap = property.getAttributesMap();
				if(productBatchNumattributesMap.get("pattern")!=null){
					productBatchNumCounter.setPattern(productBatchNumattributesMap.get("pattern").toString());
				}
				configs=(ArrayList<Map<String, Object>>) productBatchNumattributesMap.get("config");
				dependence=null;
				ArrayList<Object> productBatchNumparamlist=new ArrayList<Object>();
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
					productBatchNumparamlist.add(ovalue);
				}
				if(isLegal){
					String productBatchNumnewCodeValue="";
					if(dependence!=null){
						if((Boolean)productBatchNumattributesMap.get("rollbackable")==true){
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetStringDependenceWithTx(dependence,productBatchNumparamlist.toArray());
						}else{
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetStringDependence(dependence,productBatchNumparamlist.toArray());
						}
					}else{
						if((Boolean)productBatchNumattributesMap.get("rollbackable")==true){
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetStringWithTx(productBatchNumparamlist.toArray());
						}else{
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetString(productBatchNumparamlist.toArray());
						}
					}
					modelinstance.setProductBatchNum(productBatchNumnewCodeValue);
					produceTask.setProductBatchNum(productBatchNumnewCodeValue);
				}
				
				if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
					if(property.getIsBussinessKey()){
						AuditUtil.setColumnStringB(modelinstance.getProductBatchNum());
					}
					if(property.getIsMainDisplay()){
						AuditUtil.setColumnStringA(modelinstance.getProductBatchNum());
					}
				}
			}
				
		}
		if (viewIsView) {
			produceTaskDao.saveWithRevertVersion(modelinstance);
		} else {
			produceTaskDao.save(modelinstance);
		}
	}
	
	public void generateProduceTaskSummarys(WOMProduceTask produceTask) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateProduceTaskSummarys(produceTask, false);
	}

	public void generateProduceTaskSummarys(WOMProduceTask produceTask, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void saveProduceTask(WOMProduceTask produceTask,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic,boolean... isImport){
		this.saveProduceTask(produceTask, dgLists,dgDeleteIDs,assFileUploads, viewCode, eventTopic,null,isImport);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void saveProduceTask(WOMProduceTask produceTask,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport){
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_produceTask";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		String url = null;
		if(produceTask.getId() != null && produceTask.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/add";
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
				executeGScript(entityCode, "beforeSave", events, produceTask);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		beforeSaveProduceTask(produceTask, viewIsView);

		if (null == produceTask.getId()) {
			if(null == produceTask.getStatus()){
				produceTask.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			produceTask.setTableNo(generateTableNo());
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				if(isNew)
					produceTaskDao.save(produceTask);
				else
					produceTaskDao.merge(produceTask);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(produceTask,isImport);
				produceTaskDao.saveTableInfo(ti);
				produceTask.setTableInfoId(ti.getId());
				if(produceTask.getOwnerStaffId()==null){
					produceTask.setOwnerStaffId(produceTask.getCreateStaffId());
					ti.setOwnerStaffId(produceTask.getCreateStaffId());
				}
				if(produceTask.getOwnerDepartmentId()==null){
					produceTask.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
					ti.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
				}
				if(produceTask.getOwnerPositionId()==null){
					produceTask.setOwnerPositionId(produceTask.getCreatePositionId());
					ti.setOwnerPositionId(produceTask.getCreatePositionId());
				}
				produceTask.setCreateStaffId(produceTask.getCreateStaffId());
				produceTask.setCreatePositionId(produceTask.getCreatePositionId());
				produceTask.setCreateDepartmentId(produceTask.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (produceTask.getCompany() == null) {
					produceTask.setCompany(getCurrentCompany());
				}
				if (produceTask.getCid() == null || produceTask.getCid() == -1l) {
					produceTask.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					produceTaskDao.saveWithRevertVersion(produceTask);
				} else {
					produceTaskDao.save(produceTask);
				}
				
		} else {
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				if(isNew)
					produceTaskDao.save(produceTask);
				else
					produceTaskDao.merge(produceTask);
			}
		}
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		dealDatagridsSave(produceTask,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
			this.dealTaskIDTaskProcessID(produceTask);
			this.dealTaskIDFactoryId(produceTask);
			this.dealTaskIDStaffID(produceTask);
			this.dealTaskIDFormularActice(produceTask);
			this.dealTaskIDWaitPutinRecordID(produceTask);
			this.dealTaskIDProductID(produceTask);
			this.dealTaskIDActiveBatchStateID(produceTask);
			this.dealTaskIDTaskActiveID(produceTask);
			this.dealTaskIDProcessExeLog(produceTask);
			this.dealTaskIDFactoryID(produceTask);
			this.dealTaskIDFormularProcess(produceTask);
			this.dealHeadIdProductId(produceTask);
			this.dealHeadIDFactoryId(produceTask);
			this.dealHeadIDPutBatMateId(produceTask);
			this.dealHeadIDActiveBatchState(produceTask);
			this.dealHeadIDFormulaBom(produceTask);
			this.dealHeadIDFormulaId(produceTask);
			this.dealHeadIDProductId(produceTask);
			this.dealHeadIDOrderProcessId(produceTask);
			this.dealHeadIDBatchNumObj(produceTask);
			this.dealHeadIDActiveId(produceTask);
			this.dealHeadIDProcessId(produceTask);
			this.dealHeadIdFormulaId(produceTask);
			this.dealHeadIdProcessType(produceTask);
			this.dealHeadIdFormularProcess(produceTask);
			this.dealHeadIdFactoryId(produceTask);
			this.dealSupervision(produceTask);
		
		// 根据配置规则生成编码
		try {
			generateProduceTaskCodes(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProduceTaskSummarys(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduceTask(produceTask, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, produceTask);
			}
		}
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		produceTaskDao.flush();
		produceTaskDao.clear();
		produceTask = produceTaskDao.load(produceTask.getId());
		
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		
		params.add(produceTask);
		
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=produceTask.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(produceTask.getId());
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_produceTask#modelCode:WOM_7.5.0.0_produceTask_ProduceTask#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, WOMProduceTask produceTask){
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
						variables.put("produceTask", produceTask);
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
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void mergeProduceTask(WOMProduceTask produceTask, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		beforeSaveProduceTask(produceTask);
		if (null == produceTask.getId()) {
			produceTask.setStatus(EntityTableInfo.STATUS_RUNNING);
			produceTask.setTableNo(generateTableNo());
			produceTaskDao.save(produceTask);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(produceTask);
				produceTaskDao.saveTableInfo(ti);
				produceTask.setTableInfoId(ti.getId());
				if(produceTask.getOwnerStaffId()==null){
					produceTask.setOwnerStaffId(produceTask.getCreateStaffId());
				}
				if(produceTask.getOwnerDepartmentId()==null){
					produceTask.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
				}
				if(produceTask.getOwnerPositionId()==null){
					produceTask.setOwnerPositionId(produceTask.getCreatePositionId());
				}
				produceTask.setCreateStaffId(produceTask.getCreateStaffId());
				produceTask.setCreatePositionId(produceTask.getCreatePositionId());
				produceTask.setCreateDepartmentId(produceTask.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (produceTask.getCompany() == null) {
					produceTask.setCompany(getCurrentCompany());
				}
				if (produceTask.getCid() == null || produceTask.getCid() == -1l) {
					produceTask.setCid(getCurrentCompanyId());
				}
				produceTaskDao.merge(produceTask);
		} else {
			produceTaskDao.merge(produceTask);
		}
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		dealDatagridsSave(produceTask,null,dgLists,dgDeleteIDs,assFileUploads);

			// 一对多情况处理
			this.dealTaskIDTaskProcessID(produceTask);
			this.dealTaskIDFactoryId(produceTask);
			this.dealTaskIDStaffID(produceTask);
			this.dealTaskIDFormularActice(produceTask);
			this.dealTaskIDWaitPutinRecordID(produceTask);
			this.dealTaskIDProductID(produceTask);
			this.dealTaskIDActiveBatchStateID(produceTask);
			this.dealTaskIDTaskActiveID(produceTask);
			this.dealTaskIDProcessExeLog(produceTask);
			this.dealTaskIDFactoryID(produceTask);
			this.dealTaskIDFormularProcess(produceTask);
			this.dealHeadIdProductId(produceTask);
			this.dealHeadIDFactoryId(produceTask);
			this.dealHeadIDPutBatMateId(produceTask);
			this.dealHeadIDActiveBatchState(produceTask);
			this.dealHeadIDFormulaBom(produceTask);
			this.dealHeadIDFormulaId(produceTask);
			this.dealHeadIDProductId(produceTask);
			this.dealHeadIDOrderProcessId(produceTask);
			this.dealHeadIDBatchNumObj(produceTask);
			this.dealHeadIDActiveId(produceTask);
			this.dealHeadIDProcessId(produceTask);
			this.dealHeadIdFormulaId(produceTask);
			this.dealHeadIdProcessType(produceTask);
			this.dealHeadIdFormularProcess(produceTask);
			this.dealHeadIdFactoryId(produceTask);
			this.dealSupervision(produceTask);
		afterSaveProduceTask(produceTask);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<WOMProduceTask> findProduceTasks(Page<WOMProduceTask> page, Criterion... criterions) {
		return produceTaskDao.findByPage(page, criterions);
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
	private WOMProduceTaskDealInfo getDealInfoEntity(Long tableInfoId) {
		
		List<WOMProduceTaskDealInfo> list=produceTaskDao.createQuery("from " + WOMProduceTaskDealInfo.JPA_NAME + " where tableInfoId=?", tableInfoId).setMaxResults(1).list();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void saveDealInfo(WOMProduceTaskDealInfo dealInfo) {
		produceTaskDao.saveDealInfo(dealInfo);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public int getDealInfoCount(Long tableInfoId) {
		String sql = "SELECT count(1) totalCount " + "FROM "+WOMProduceTaskDealInfo.TABLE_NAME+" DI " + "LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME
				+ " S ON S.ID=U.STAFF_ID " + "WHERE DI.TABLE_INFO_ID = ?";
		Number list = (Number) produceTaskDao.createNativeQuery(sql, tableInfoId).uniqueResult();
		return list.intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag) {
		String sql = "SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, WT.TYPE,WTR.TYPE TRANSITIONTYPE "
				+ " FROM "+WOMProduceTaskDealInfo.TABLE_NAME + " DI " 
				+ " LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION "
				+ " LEFT JOIN WF_TRANSITION WTR ON WTR.CODE = DI.OUTCOME AND WTR.DEPLOYMENT_ID = WT.DEPLOYMENT_ID "
				+ " LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID "
				+ " WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION is not null ";
		if (expandFlag) {
			sql += " AND DI.COMMENTS IS NOT NULL";
			DBTYPE dbtype = produceTaskDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				sql += " AND DI.COMMENTS != ''";
			}
		}
		sql += " ORDER BY DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC";
		List<Object[]> list = produceTaskDao.createNativeQuery(sql, tableInfoId).list();
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
				+ WOMProduceTaskDealInfo.TABLE_NAME
				+ " DI LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION ");
		groupSql.append(" LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID ");
		groupSql.append(" WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION IS NOT NULL ");
		if (expandFlag) {
			groupSql.append(" AND DI.COMMENTS IS NOT NULL");
			DBTYPE dbtype = produceTaskDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				groupSql.append(" AND DI.COMMENTS != ''");
			}
		}
		groupSql.append(" ORDER BY WT.ROUTE_SEQUENCE ASC, DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC");

		List<Object[]> groupList = produceTaskDao.createNativeQuery(groupSql.toString(), tableInfoId).list();
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
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="撤回",operType="4")
	public Pending recall(long tableInfoId) {
		Long modelId = null;
		WOMProduceTask  produceTask = null;
		List<Object> list = produceTaskDao.createNativeQuery("select ID from " + WOMProduceTask.TABLE_NAME + " where TABLE_INFO_ID = ?", tableInfoId).list();
		if (list != null && list.size() > 0) {
			if (list.get(0) != null) {
				modelId = ((Number) list.get(0)).longValue();
				produceTask = this.getProduceTask(modelId);
			}
		}
		if(null != produceTask){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
				}
				if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(produceTask.getId().toString());
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
			props.put("entityCode", "WOM_7.5.0.0_produceTask");
			props.put("eventType", "recall");
			return pending;
		}
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public boolean existsSupervision(Long tableInfoId, Long staffId) {
		List<WOMProduceTaskSupervision> list = produceTaskDao.findSupervision(tableInfoId, staffId);
		if(list!=null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	public String getWorkFlowVarStatus(WorkFlowVar workFlowVar){
		return workFlowVar == null ? null : workFlowVar.getOutcomeType();
	}
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void save(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		save(produceTask, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void save(WOMProduceTask produceTask, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		boolean first = null == produceTask.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != produceTask.getCreateStaff() && null != produceTask.getCreateStaff().getUser()){
		    	createStaffUserId = produceTask.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
			workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		}
		produceTask.setWorkFlowVar(workFlowVar);
		if(produceTask.getDeploymentId() == null && deploymentId != null) {
			produceTask.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				produceTask.setProcessKey(d.getProcessKey());
				produceTask.setProcessVersion(d.getProcessVersion());
			}
		}

		saveProduceTask(produceTask, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(produceTask.getId().toString());
			}
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(produceTask.getId());
			workFlowVar.setTableInfoId(produceTask.getTableInfoId());
			workFlowVar.setTableNo(produceTask.getTableNo());
			workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
			workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(produceTask, instance, deploymentId, pendingId, workFlowVar);
		produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
		produceTaskDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessProduceTask(produceTask, di, workFlowVar, viewCode);
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
		produceTaskDao.flush();
		produceTaskDao.clear();
		WOMProduceTask produceTask = getProduceTask(id);
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");                                                                                                                   
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		props.put("eventType", type);
	}
	@Override
	public Date findLastDealInfo(Long tableInfoId, String activityName) {
		return produceTaskDao.findLastDealInfo(tableInfoId, activityName);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.submit",operType="4")
	public void submit(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		submit(produceTask, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.submit",operType="4")
	public void submit(WOMProduceTask produceTask, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode) {
		this.submit(produceTask, deploymentId, pendingId, workFlowVar, dgLists,dgDeleteIDs,assFileUploads, null,null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.submit",operType="4")
	public void submit(WOMProduceTask produceTask, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode,SignatureLog signatureLog) {
		String entityCode = "WOM_7.5.0.0_produceTask";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, produceTask);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
		workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		workFlowVar.setStatus(produceTask);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		produceTask.setWorkFlowVar(workFlowVar);
		if(produceTask.getDeploymentId() == null && deploymentId != null) {
			produceTask.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				produceTask.setProcessKey(d.getProcessKey());
				produceTask.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitProduceTask(produceTask, workFlowVar);
		saveProduceTask(produceTask, dgLists,dgDeleteIDs,assFileUploads, viewCode);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(produceTask.getId().toString());
			}
		}
		Integer preStatus = produceTask.getStatus();
		produceTaskDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(produceTask.getId());
		workFlowVar.setTableInfoId(produceTask.getTableInfoId());
		workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
		workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
		workFlowVar.setTableNo(produceTask.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, produceTask.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(produceTask, di, deploymentId, pendingId, workFlowVar, true);
			produceTaskDao.copyAndSaveDealInfo(saveDi, produceTask, creatorService.getStaffFromSession());
		}
		produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					produceTaskDao.flush();
					
					WOMProduceTaskDealInfo produceTaskDealInfo=produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
					produceTaskDealInfo.setOutcome(outcome);
					produceTaskDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						produceTaskDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				produceTaskDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(produceTask.getStatus() == 99) {
			if(!preStatus.equals(produceTask.getStatus())){
				dataAuditLogService.saveCustomerAudit("2", produceTask, produceTask.getId(), new Object[]{produceTask.getStatus(),produceTask.getEffectTime()}, new Object[]{preStatus,null}, new String[]{"status","effectTime"});
			}
			produceTaskDao.deleteSupervision(produceTask.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + produceTask.getProcessKey() + "_" + di.getActivityName() + "_WOM_7.5.0.0_produceTask_" + produceTask.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		produceTaskDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessProduceTask(produceTask, di, workFlowVar, viewCode);
		afterSubmitProduceTask(produceTask, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, produceTask);
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
			businessKey = produceTask.getTableNo();
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
			signatureLog.setTableId(produceTask.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_produceTask#modelCode:WOM_7.5.0.0_produceTask_ProduceTask#timeStamp:"+String.valueOf(new Date().getTime());
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
	public void findProduceTasks(Page<WOMProduceTask> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, Map exportMap, List<Param> params) {
		findProduceTasks(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findProduceTasks(Page<WOMProduceTask> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findProduceTasks(Page<WOMProduceTask> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
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
	public void commonQuery(Page<WOMProduceTask> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
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
						String tableAlias = lastDotPos < 0 ? "\"produceTask\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
							sortOrderByStr.append(",").append("\"produceTask\".STATUS ").append((String) param.getValue());
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
					if((advQuery == null || advQuery.length() == 0 || advQuery.indexOf("\"produceTask\".STATUS") == -1) 
						&& (classifySql == null || classifySql.length() == 0 || classifySql.indexOf("\"produceTask\".STATUS") == -1)) {
						s.append(" AND \"produceTask\".STATUS <> 0");
					}
					if(type == Sql.TYPE_LIST_PENDING) {
						s.append(" AND \"produceTask\".STATUS <> 77");
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
							s.append(" AND \"produceTask\".CID in (1,").append(getCurrentCompanyId()+")");
						}
					}
					
	//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
	//					if(type == Sql.TYPE_LIST_PENDING) {
	//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_QUERY){
	//						s.append(" AND \"produceTask\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_REFERENCE){
	//						if(null != crossCompanyFlag && !crossCompanyFlag){
	//							s.append(" AND \"produceTask\".CID = ").append(getCurrentCompanyId());
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
							powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + layoutView.getPermissionCode();
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + layoutView.getPermissionCode();
							}
						}
					}else  {
						if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
							powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + view.getPermissionCode();
						}
					}
				}else if(null != dgCode && !"".equals(dgCode)){
					DataGrid dataGrid = viewServiceFoundation.getDataGrid(dgCode);
					if(null != dataGrid.getDataGridType() && dataGrid.getDataGridType() == 1 && null != dataGrid.getIsPermission() && dataGrid.getIsPermission()){
						powerCode = dataGrid.getTargetModel().getCode() + "_" + dataGrid.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  produceTaskDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  produceTaskDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_produceTask").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}	
					String	pc = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"produceTask\"","WOM_7.5.0.0_produceTask",customCondition,"WOM_PRODUCE_TASKS",false);
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
						s.append(" \"produceTask\".TABLE_INFO_ID IN (  SELECT   D.TABLE_INFO_ID "+
	                      "   FROM   "+WOMProduceTaskDealInfo.TABLE_NAME+" d "+
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
				totalSql.append(" LEFT OUTER JOIN ").append("(SELECT TASK_DESCRIPTION, TABLE_INFO_ID FROM ").append(Pending.TABLE_NAME).append(" WHERE ID IN (SELECT MAX(ID) FROM ").append(Pending.TABLE_NAME).append(" GROUP BY TABLE_INFO_ID))").append(" \"p\" ON \"p\".TABLE_INFO_ID= \"produceTask\".TABLE_INFO_ID ");
			}
			if(queryType == 1) {
				s.append(" AND \"produceTask\".STATUS = 99 ");
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
					orderPart.append(" \"produceTask\".LAY_REC ASC, \"produceTask\".SORT ASC");
				} else {
					orderPart.append(" \"produceTask\".ID DESC");
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
				//Long count = ((Number) produceTaskDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    SQLQuery query=produceTaskDao.createNativeQuery(countSql, arr);
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
				SQLQuery query = produceTaskDao.createNativeQuery(realSql, arr);
				if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
				List<WOMProduceTask> result = new ArrayList<WOMProduceTask>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(WOMProduceTask.class,produceTaskDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(WOMProduceTask.class,produceTaskDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (WOMProduceTask produceTask : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(produceTask.getTableInfoId(), "Table");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(produceTask.getTableInfoId(), "Table");
							if(null != documents && !documents.isEmpty()) {
								produceTask.setDocument(documents.get(0));
								produceTask.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				
				for (WOMProduceTask produceTask : result) {
				}	
				if(queryType == 0) {
					if (type == Sql.TYPE_LIST_QUERY) {
						if (!result.isEmpty()) {
							List<Long> tIds = new ArrayList<Long>(result.size());
							for (WOMProduceTask produceTask : result)
								tIds.add(produceTask.getTableInfoId());
							String pSql = "SELECT DISTINCT p.TABLE_INFO_ID,p.TASK_DESCRIPTION,p.ACTIVITY_TYPE,p.ACTIVITY_NAME,p.PROCESS_KEY,p.PROCESS_VERSION,p.DEPLOYMENT_ID,p.PROCESS_ID,p.PROCESS_NAME,p.PROCESS_DESCRIPTION,t.route_sequence,p.PROXY_SOURCE FROM " + Pending.TABLE_NAME + " p, wf_task t WHERE p.TABLE_INFO_ID IN (:ids) and p.activity_name =t.code and p.deployment_id=t.deployment_id order by t.route_sequence";
							// 解决in最大值为999问题
							List<Object[]> plist = new ArrayList<Object[]>();
							List<Object[]> mylist = new ArrayList<Object[]>();
							int PERTIME = 999;
							int count = (tIds.size() / PERTIME) + (tIds.size() % PERTIME == 0 ? 0 : 1);
							for(int i = 0 ; i < count ; i++){
								plist.addAll(produceTaskDao.createNativeQuery(pSql).setParameterList("ids", tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							String myPql="SELECT DISTINCT TABLE_INFO_ID,ID  FROM " + Pending.TABLE_NAME + " WHERE TABLE_INFO_ID IN (:ids) and USER_ID="+getCurrentUser().getId();
							for(int j = 0 ; j < count ; j++){
								mylist.addAll(produceTaskDao.createNativeQuery(myPql).setParameterList("ids", tIds.subList(PERTIME * j, PERTIME * j + (j < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
							}
							// List<Object[]> plist = produceTaskDao.createNativeQuery(pSql).setParameterList("ids", tIds).list();
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
								for (WOMProduceTask produceTask : result) {
									Pending p = map.get(produceTask.getTableInfoId());
									if(null != p){
										//if(produceTask.getStatus()==99){
										//	p.setTaskDescription(p.getTaskDescription() + "," + InternationalResource.get("ec.pending.over", currentUser.getLanguage()));
										//} else if(produceTask.getStatus()==77){
										//	p.setTaskDescription(InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage()));
										//}
										produceTask.setPending(p);
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
		if(null!=permissionCode&&permissionCode.indexOf("WOM_7.5.0.0_produceTask")!=-1) {
				String personalCode=permissionCode.substring(permissionCode.indexOf("WOM_7.5.0.0_produceTask")+"WOM_7.5.0.0_produceTask".length()+1);
				if(null!=personalCode&&personalCode.trim().length()>0)  {
						return viewServiceFoundation.getViewWithPermissionCode("WOM_7.5.0.0_produceTask",personalCode);
				}
		}
		return null;
	}
	
	private void getConfigAssoPropsResult(String viewCode, List<WOMProduceTask> result) {
		getConfigAssoPropsResult(viewCode, null, result);
	}
	
	private void getConfigAssoPropsResult(String viewCode,String dataGridCode, List<WOMProduceTask> result) {
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
		Map<Long, WOMProduceTask> rsMap = new HashMap<Long, WOMProduceTask>();
		for (WOMProduceTask produceTask : result) {
			ids.add(produceTask.getId());
			rsMap.put(produceTask.getId(), produceTask);
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
								rs.addAll(produceTaskDao.createNativeQuery(sql)
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
		List<Property> list = produceTaskDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
		return list.get(0);
	}
	
	public List<WOMProduceTask> getTableInfoStatus(List<WOMProduceTask> result, boolean isPendingQuery, Long ... deploymentId) {
		List<Long> tIds = new ArrayList<Long>(result.size());
		User currentUser = (User) getCurrentUser();
		String hangUp = InternationalResource.get("foundation.workflow.flow.hangUp", currentUser.getLanguage());
		String over = InternationalResource.get("ec.pending.over", currentUser.getLanguage());
		String dai = InternationalResource.get("ec.flowActive.dai", currentUser.getLanguage());
		String invalid = InternationalResource.get("ec.edit.remove", currentUser.getLanguage());
		String closed = InternationalResource.get("ec.edit.closed", currentUser.getLanguage());
		if (isPendingQuery) {
			for (WOMProduceTask produceTask : result) {
				if (produceTask.getPending() != null) {
					if (produceTask.getStatus() == 77) {
						produceTask.getPending().setTaskDescription(hangUp);
					} else if (produceTask.getPending().getProxySource() != null && !produceTask.getPending().getProxySource().isEmpty()
							|| produceTask.getPending().getSourceStaff() != null && !produceTask.getPending().getSourceStaff().isEmpty()) {
						String statsName = produceTask.getPending().getTaskDescription();
						statsName = InternationalResource.get(statsName, currentUser.getLanguage());
						statsName += "(" + dai + ")";
						produceTask.getPending().setTaskDescription(statsName);
					}
				}
			}
		} else {
			Map<Long, WOMProduceTask> map = new HashMap<>();
			for (WOMProduceTask produceTask : result) {
				tIds.add(produceTask.getTableInfoId());
				map.put(produceTask.getTableInfoId(), produceTask);
				Pending pending = produceTask.getPending();
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
				plist.addAll(produceTaskDao
						.createNativeQuery(pSql)
						.setParameterList("ids",
								tIds.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (tIds.size() % PERTIME)))).list());
			}
			for (Object[] o : plist) {
				long pTableInfoId = ((Number) o[0]).longValue();
				WOMProduceTask produceTask = map.get(pTableInfoId);
				Pending pending = produceTask.getPending();
				if (pending == null) {
					pending = new Pending();
					produceTask.setPending(pending);
				}
				String taskDesc = (o[1] != null) ? InternationalResource.get(o[1].toString(), currentUser.getLanguage()) : "";
				if (pending.getTaskDescription() != null) {
					pending.setTaskDescription(pending.getTaskDescription() + "," + taskDesc);
				} else {
					pending.setTaskDescription(taskDesc);
				}
			}
			for (WOMProduceTask produceTask : result) {
				Pending p = produceTask.getPending();
				if(p == null) {
					p = new Pending();
				}
				if (produceTask.getStatus() == 99) {
					if (p.getTaskDescription() == null) {
						p.setTaskDescription(over);
					} else {
						p.setTaskDescription(p.getTaskDescription() + "," + over);
					}
				} else if (produceTask.getStatus() == 77) {
					p.setTaskDescription(hangUp);
				} else if (produceTask.getStatus() == 0) {
					p.setTaskDescription(invalid);
				}
				produceTask.setPending(p);
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
	
	protected EntityTableInfo getTableInfo(WOMProduceTask produceTask,boolean... isImport) {
		EntityTableInfo ti = new EntityTableInfo();

		if(produceTask.getDeploymentId() != null) {
			ti.setDeploymentId(produceTask.getDeploymentId());
			ti.setProcessKey(produceTask.getProcessKey());
			ti.setProcessVersion(produceTask.getProcessVersion());
		}

		ti.setOwnerStaffId(produceTask.getOwnerStaffId());
		ti.setOwnerPositionId(produceTask.getOwnerPositionId());
		ti.setOwnerDepartmentId(produceTask.getOwnerDepartmentId());
		
		ti.setCreateStaff(produceTask.getCreateStaff());
		ti.setCreateStaffId(produceTask.getCreateStaffId());
		ti.setCreateTime(produceTask.getCreateTime());
		ti.setDeleteStaff(produceTask.getDeleteStaff());
		ti.setDeleteStaffId(produceTask.getDeleteStaffId());
		ti.setDeleteTime(produceTask.getDeleteTime());
		ti.setCreateDepartmentId(produceTask.getCreateDepartmentId());
		ti.setModifyStaff(produceTask.getModifyStaff());
		ti.setModifyStaffId(produceTask.getModifyStaffId());
		ti.setCreatePositionId(produceTask.getCreatePositionId());
		ti.setPositionLayRec(produceTask.getPositionLayRec());
		ti.setTableNo(produceTask.getTableNo());
		ti.setValid(true);
		ti.setTargetEntityCode("WOM_7.5.0.0_produceTask");
		if(isImport!=null&&isImport.length>0&&isImport[0]) {
			ti.setStatus(EntityTableInfo.STATUS_EFFECTED);
			ti.setEffectiveState(produceTask.getEffectiveState());
		}else {
			ti.setStatus(produceTask.getStatus());
			ti.setEffectiveState(produceTask.getEffectiveState());
		}
		ti.setTargetTableName("WOM_PRODUCE_TASKS");
		
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
							powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="WOM_7.5.0.0_produceTask_ProduceTask" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  produceTaskDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  produceTaskDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_produceTask").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						if(sqlType!=null&&sqlType.trim().length()>0)  {
							if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
								sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"produceTask\".TABLE_INFO_ID ");
								sb.append(" WHERE  \"produceTask\".STATUS <> 0  ");
								innerJoinAppendFlag = true;
							}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
								
							}
						}
						powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"produceTask\"","WOM_7.5.0.0_produceTask","","WOM_PRODUCE_TASKS",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"produceTask\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"produceTask\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"produceTask\"","WOM_7.5.0.0_produceTask","","WOM_PRODUCE_TASKS",false);
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
								powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "WOM_7.5.0.0_produceTask_ProduceTask" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  produceTaskDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  produceTaskDao.createNativeQuery(powerOperateSql, "WOM_7.5.0.0_produceTask").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							if(!searchRefView&&sqlType!=null&&sqlType.trim().length()>0)  {
								if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_PENDING) {	
									sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"produceTask\".TABLE_INFO_ID ");
									sb.append(" WHERE  \"produceTask\".STATUS <> 0  ");
									innerJoinAppendFlag = true;
								}else if(Integer.valueOf(sqlType)==Sql.TYPE_LIST_QUERY)  {
									
								}
							}
							powerSql = dataPermissionService.getPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"produceTask\"","WOM_7.5.0.0_produceTask","","WOM_PRODUCE_TASKS",false);
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
			
			mnecodeSql.append("  (\"").append("produceTask.mc\"").append(".MNE_CODE) like (?) escape '&' AND \"produceTask\".VALID = 1");
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
					mnecodeSql.append(" AND \"produceTask\".CID = ?");
					totalValues.add(getCurrentCompanyId());
				}else{
					//当前公司不是集团情况下查询集团和本公司数据
					if(!getCurrentCompanyId().equals(1L)){
						mnecodeSql.append(" AND (\"produceTask\".CID = 1 OR \"produceTask\".CID = ?)");
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
				mnecodeSql.append(" and (\"").append("produceTask.mc\"").append(".PRODUCE_TASK) not in ("+notinValue+")");
			}
			
			SQLQuery query = produceTaskDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
			resultList = query.setMaxResults(showNumber).list();
		}
		
		return resultList;
		
	}

	@Override
	public void destroy() throws Exception {
		beforeServiceDestroy();
		if(this.productBatchNumCounter != null) {
			this.productBatchNumCounter.destroy();
		}
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
		this.counter = this.counterManager.addCounter("produceTask", "WOM_7.5.0.0_produceTask", "produceTask_{1,date,yyyyMMdd}_{0,number,000}", CounterType.Daily);
		String formatStr = "";
			//新的编码字段不需要初始化pattern
		this.productBatchNumCounter = this.counterManager.addCounter("WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum", "WOM_7.5.0.0_produceTask", formatStr, CounterType.All);

		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=produceTaskDao.createNativeQuery(sql, menuCode);
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
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(WOMProduceTask produceTask, Long tableInfoId,String scriptCode) {
		this.retrialThisTable(produceTask, tableInfoId,scriptCode,null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.retrial",operType="4")
	public void retrialThisTable(WOMProduceTask produceTask, Long tableInfoId,String scriptCode,SignatureLog signatureLog) {
		beforeRetrial(produceTask);
		produceTask.setStatus(88);
		produceTaskDao.save(produceTask);
		produceTaskDao.flush(); //如果不flush无法更新effect信息
		ProcessInstance instance = null;
		WOMProduceTaskDealInfo del=getDealInfoEntity(tableInfoId);
		Deployment deployment=taskService.getDeployment(del.getProcessKey(), del.getProcessVersion());
		long deploymentId=deployment.getId();
		//删除流程下所有通知活动的待办
		String hql = "delete Pending p where p.entityCode = ? and p.processKey = ? and p.processVersion = ? and p.activityType = ?";
		produceTaskDao.bulkExecute(hql, new Object[]{"WOM_7.5.0.0_produceTask", del.getProcessKey(), del.getProcessVersion(), "notification"});
		taskService.completeTaskHistory(tableInfoId);
		List<Transition> transitions=processService.findFirstTransitions(deploymentId);
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setModelId(produceTask.getId());
		workFlowVar.setProcessInitiator(produceTask.getCreateStaff().getUser().getId());
		workFlowVar.setTableInfoId(produceTask.getTableInfoId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
		workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
		workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
		workFlowVar.setTableNo(produceTask.getTableNo());
		workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
		workFlowVar.setStatus(produceTask);
		workFlowVar.setCrossCompanyFlag(true);
		workFlowVar.setGroupEnabled(false);
		workFlowVar.setOutcome(transitions.get(0).getName());
		workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		//DealInfo di = taskService.take(null, deploymentId, workFlowVar);
		instance = instanceService.start(deploymentId, null, workFlowVar);
		DealInfo di = taskService.doSaveDealInfo(produceTask, instance, deploymentId, null, workFlowVar);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringB())){
				AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringA())){
				AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			}
			if(StringUtils.isEmpty(AuditUtil.getColumnStringC())){
				AuditUtil.setColumnStringC(produceTask.getId().toString());
			}
		}
		WOMProduceTaskDealInfo dl=new WOMProduceTaskDealInfo();
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
		staff.setId(produceTask.getOwnerStaffId());
		dl.setStaff(staff);
		dl.setUserId(di.getUserId());
		dl.setDealInfoType(DealInfoType.NORMAL);
		produceTaskDao.saveDealInfo(dl);
		produceTaskDao.createNativeQuery("update EC_TABLE_INFO set STATUS=88 where id=?", produceTask.getTableInfoId()).executeUpdate();
		if(null!=scriptCode&&!"".equals(scriptCode)){
			doScript(scriptCode,produceTask);
		}
		afterRetrial(produceTask);
		//crossCompanyDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=produceTask.getTableNo();
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
			signatureLog.setTableId(produceTask.getId());
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_produceTask#modelCode:WOM_7.5.0.0_produceTask_ProduceTask#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
			
	}
	public void doScript(String code ,WOMProduceTask produceTask){

		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("db", DbUtils.getInstance());
		variables.put("produceTask", produceTask);
		try {
			Script script = scriptService.get("WOM_7.5.0.0_produceTask", code);
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
			WOMProduceTask produceTask=produceTaskDao.load(Long.parseLong(idArr[i]));
			Long pendingId=Long.parseLong(pendingArr[i]);
			WorkFlowVar workFlowVar = new WorkFlowVar();
			workFlowVar.setOutcomeMap(mapList);
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setModelId(produceTask.getId());
			workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setTableInfoId(produceTask.getTableInfoId());
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setComment(comment);
			workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
			workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
			workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
			workFlowVar.setTableNo(produceTask.getTableNo());
			workFlowVar.setTableName(produceTask.TABLE_NAME);
			workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
			workFlowVar.setStatus(produceTask);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			if(!mapList.isEmpty()&&mapList.size()>0&&mapList.get(0).get("countersignUsers")!=null){
				workFlowVar.setCountersignUsers(mapList.get(0).get("countersignUsers").toString());
			}
			DealInfo di = taskService.take(pendingId, deploymentId, produceTask.getId(), creatorService.getStaffFromSession(), workFlowVar);
			produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
			if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
				for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
					String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
					String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
					String type=(map.get("type")!=null)?map.get("type").toString():"";
					String assignUser=(map.get("assignUser")!=null)?map.get("assignUser").toString():"";
					if(type.equals("notification")){
						produceTaskDao.flush();
						di.setOutcome(outcome);
						di.setOutcomeDes(dec);
						if(assignUser!=null&&assignUser.length()>0){
							String assignStaff=taskService.getAssignUserName(assignUser);
							di.setAssignStaff(assignStaff);
						}
						produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
						
					}
				}
			}
			afterSubmitProduceTask(produceTask, workFlowVar);
		}
		
	}
	// ================ 生成多选控件数据保存方法 start====================
	private void dealTaskIDTaskProcessID(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDTaskProcessIDAddIds();
		String delIds = produceTask.getTaskIDTaskProcessIDDeleteIds();
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
				List<WOMBatchPhaseExelog> tmpList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("taskProcessID.id", idList), Restrictions.eq("valid", true));
				for (WOMBatchPhaseExelog item : tmpList) {
					batchPhaseExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMBatchPhaseExelog tmp = new WOMBatchPhaseExelog();
					tmp.setTaskID(produceTask);
					WOMProduceTaskProcess indirectObj = new WOMProduceTaskProcess();
					indirectObj.setId(Long.valueOf(item));
					tmp.setTaskProcessID(indirectObj);
					tmp.setCid(produceTask.getCid());
					batchPhaseExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDTaskProcessID(WOMProduceTask produceTask) {
		setTaskIDTaskProcessID(produceTask, null);
	}

	private void setTaskIDTaskProcessID(WOMProduceTask produceTask, String viewCode) {
		List<WOMBatchPhaseExelog> tmpList = batchPhaseExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMBatchPhaseExelog item : tmpList) {
			if(item.getTaskProcessID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getTaskProcessID().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getTaskProcessID(), displayField);
			}
		}
		produceTask.setBatchPhaseExelogList(tmpList);
		produceTask.setTaskIDTaskProcessIDmultiselectIDs(ids);
		produceTask.setTaskIDTaskProcessIDmultiselectNames(names);
	}
	private void dealTaskIDFactoryId(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDFactoryIdAddIds();
		String delIds = produceTask.getTaskIDFactoryIdDeleteIds();
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
				List<WOMBatchPhaseExelog> tmpList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMBatchPhaseExelog item : tmpList) {
					batchPhaseExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMBatchPhaseExelog tmp = new WOMBatchPhaseExelog();
					tmp.setTaskID(produceTask);
					MESBasicFactoryModel indirectObj = new MESBasicFactoryModel();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFactoryId(indirectObj);
					tmp.setCid(produceTask.getCid());
					batchPhaseExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDFactoryId(WOMProduceTask produceTask) {
		setTaskIDFactoryId(produceTask, null);
	}

	private void setTaskIDFactoryId(WOMProduceTask produceTask, String viewCode) {
		List<WOMBatchPhaseExelog> tmpList = batchPhaseExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMBatchPhaseExelog item : tmpList) {
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
		produceTask.setBatchPhaseExelogList(tmpList);
		produceTask.setTaskIDFactoryIdmultiselectIDs(ids);
		produceTask.setTaskIDFactoryIdmultiselectNames(names);
	}
	private void dealTaskIDStaffID(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDStaffIDAddIds();
		String delIds = produceTask.getTaskIDStaffIDDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("staffID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					Staff indirectObj = new Staff();
					indirectObj.setId(Long.valueOf(item));
					tmp.setStaffID(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDStaffID(WOMProduceTask produceTask) {
		setTaskIDStaffID(produceTask, null);
	}

	private void setTaskIDStaffID(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
			if(item.getStaffID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getStaffID().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getStaffID(), displayField);
			}
		}
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDStaffIDmultiselectIDs(ids);
		produceTask.setTaskIDStaffIDmultiselectNames(names);
	}
	private void dealTaskIDFormularActice(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDFormularActiceAddIds();
		String delIds = produceTask.getTaskIDFormularActiceDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("formularActice.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					RMFormulaProcessActive indirectObj = new RMFormulaProcessActive();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormularActice(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDFormularActice(WOMProduceTask produceTask) {
		setTaskIDFormularActice(produceTask, null);
	}

	private void setTaskIDFormularActice(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
			if(item.getFormularActice() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormularActice().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormularActice(), displayField);
			}
		}
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDFormularActicemultiselectIDs(ids);
		produceTask.setTaskIDFormularActicemultiselectNames(names);
	}
	private void dealTaskIDWaitPutinRecordID(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDWaitPutinRecordIDAddIds();
		String delIds = produceTask.getTaskIDWaitPutinRecordIDDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("waitPutinRecordID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					WOMWaitPutinRecords indirectObj = new WOMWaitPutinRecords();
					indirectObj.setId(Long.valueOf(item));
					tmp.setWaitPutinRecordID(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDWaitPutinRecordID(WOMProduceTask produceTask) {
		setTaskIDWaitPutinRecordID(produceTask, null);
	}

	private void setTaskIDWaitPutinRecordID(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
			if(item.getWaitPutinRecordID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getWaitPutinRecordID().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getWaitPutinRecordID(), displayField);
			}
		}
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDWaitPutinRecordIDmultiselectIDs(ids);
		produceTask.setTaskIDWaitPutinRecordIDmultiselectNames(names);
	}
	private void dealTaskIDProductID(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDProductIDAddIds();
		String delIds = produceTask.getTaskIDProductIDDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("productID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					MESBasicProduct indirectObj = new MESBasicProduct();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProductID(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDProductID(WOMProduceTask produceTask) {
		setTaskIDProductID(produceTask, null);
	}

	private void setTaskIDProductID(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
			if(item.getProductID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getProductID().getId();
				String displayField = "productName";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getProductID(), displayField);
			}
		}
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDProductIDmultiselectIDs(ids);
		produceTask.setTaskIDProductIDmultiselectNames(names);
	}
	private void dealTaskIDActiveBatchStateID(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDActiveBatchStateIDAddIds();
		String delIds = produceTask.getTaskIDActiveBatchStateIDDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("activeBatchStateID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					PublicSetActBatState indirectObj = new PublicSetActBatState();
					indirectObj.setId(Long.valueOf(item));
					tmp.setActiveBatchStateID(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDActiveBatchStateID(WOMProduceTask produceTask) {
		setTaskIDActiveBatchStateID(produceTask, null);
	}

	private void setTaskIDActiveBatchStateID(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
			if(item.getActiveBatchStateID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getActiveBatchStateID().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getActiveBatchStateID(), displayField);
			}
		}
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDActiveBatchStateIDmultiselectIDs(ids);
		produceTask.setTaskIDActiveBatchStateIDmultiselectNames(names);
	}
	private void dealTaskIDTaskActiveID(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDTaskActiveIDAddIds();
		String delIds = produceTask.getTaskIDTaskActiveIDDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("taskActiveID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					WOMProduceTaskActive indirectObj = new WOMProduceTaskActive();
					indirectObj.setId(Long.valueOf(item));
					tmp.setTaskActiveID(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDTaskActiveID(WOMProduceTask produceTask) {
		setTaskIDTaskActiveID(produceTask, null);
	}

	private void setTaskIDTaskActiveID(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
			if(item.getTaskActiveID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getTaskActiveID().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getTaskActiveID(), displayField);
			}
		}
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDTaskActiveIDmultiselectIDs(ids);
		produceTask.setTaskIDTaskActiveIDmultiselectNames(names);
	}
	private void dealTaskIDProcessExeLog(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDProcessExeLogAddIds();
		String delIds = produceTask.getTaskIDProcessExeLogDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("processExeLog.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					WOMProdTaskProcExelog indirectObj = new WOMProdTaskProcExelog();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProcessExeLog(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDProcessExeLog(WOMProduceTask produceTask) {
		setTaskIDProcessExeLog(produceTask, null);
	}

	private void setTaskIDProcessExeLog(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
			if(item.getProcessExeLog() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getProcessExeLog().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getProcessExeLog(), displayField);
			}
		}
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDProcessExeLogmultiselectIDs(ids);
		produceTask.setTaskIDProcessExeLogmultiselectNames(names);
	}
	private void dealTaskIDFactoryID(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDFactoryIDAddIds();
		String delIds = produceTask.getTaskIDFactoryIDDeleteIds();
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
				List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("factoryID.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskActiExelog item : tmpList) {
					prodTaskActiExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskActiExelog tmp = new WOMProdTaskActiExelog();
					tmp.setTaskID(produceTask);
					MESBasicFactoryModel indirectObj = new MESBasicFactoryModel();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFactoryID(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskActiExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDFactoryID(WOMProduceTask produceTask) {
		setTaskIDFactoryID(produceTask, null);
	}

	private void setTaskIDFactoryID(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskActiExelog> tmpList = prodTaskActiExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskActiExelog item : tmpList) {
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
		produceTask.setProdTaskActiExelogList(tmpList);
		produceTask.setTaskIDFactoryIDmultiselectIDs(ids);
		produceTask.setTaskIDFactoryIDmultiselectNames(names);
	}
	private void dealTaskIDFormularProcess(WOMProduceTask produceTask) {
		String addIds = produceTask.getTaskIDFormularProcessAddIds();
		String delIds = produceTask.getTaskIDFormularProcessDeleteIds();
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
				List<WOMProdTaskProcExelog> tmpList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask), Restrictions.in("formularProcess.id", idList), Restrictions.eq("valid", true));
				for (WOMProdTaskProcExelog item : tmpList) {
					prodTaskProcExelogDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProdTaskProcExelog tmp = new WOMProdTaskProcExelog();
					tmp.setTaskID(produceTask);
					RMFormulaProcess indirectObj = new RMFormulaProcess();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormularProcess(indirectObj);
					tmp.setCid(produceTask.getCid());
					prodTaskProcExelogDao.save(tmp);
				}
			}
		}
	}

	private void setTaskIDFormularProcess(WOMProduceTask produceTask) {
		setTaskIDFormularProcess(produceTask, null);
	}

	private void setTaskIDFormularProcess(WOMProduceTask produceTask, String viewCode) {
		List<WOMProdTaskProcExelog> tmpList = prodTaskProcExelogDao.findByCriteria(Order.asc("id"), Restrictions.eq("taskID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProdTaskProcExelog item : tmpList) {
			if(item.getFormularProcess() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormularProcess().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormularProcess(), displayField);
			}
		}
		produceTask.setProdTaskProcExelogList(tmpList);
		produceTask.setTaskIDFormularProcessmultiselectIDs(ids);
		produceTask.setTaskIDFormularProcessmultiselectNames(names);
	}
	private void dealHeadIdProductId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIdProductIdAddIds();
		String delIds = produceTask.getHeadIdProductIdDeleteIds();
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
				List<WOMProduceMaterialSum> tmpList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceMaterialSum item : tmpList) {
					produceMaterialSumDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceMaterialSum tmp = new WOMProduceMaterialSum();
					tmp.setHeadId(produceTask);
					MESBasicProduct indirectObj = new MESBasicProduct();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProductId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceMaterialSumDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdProductId(WOMProduceTask produceTask) {
		setHeadIdProductId(produceTask, null);
	}

	private void setHeadIdProductId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceMaterialSum> tmpList = produceMaterialSumDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceMaterialSum item : tmpList) {
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
		produceTask.setProduceMaterialSumList(tmpList);
		produceTask.setHeadIdProductIdmultiselectIDs(ids);
		produceTask.setHeadIdProductIdmultiselectNames(names);
	}
	private void dealHeadIDFactoryId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDFactoryIdAddIds();
		String delIds = produceTask.getHeadIDFactoryIdDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					MESBasicFactoryModel indirectObj = new MESBasicFactoryModel();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFactoryId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDFactoryId(WOMProduceTask produceTask) {
		setHeadIDFactoryId(produceTask, null);
	}

	private void setHeadIDFactoryId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
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
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDFactoryIdmultiselectIDs(ids);
		produceTask.setHeadIDFactoryIdmultiselectNames(names);
	}
	private void dealHeadIDPutBatMateId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDPutBatMateIdAddIds();
		String delIds = produceTask.getHeadIDPutBatMateIdDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("putBatMateId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					RMFormulaProcessActive indirectObj = new RMFormulaProcessActive();
					indirectObj.setId(Long.valueOf(item));
					tmp.setPutBatMateId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDPutBatMateId(WOMProduceTask produceTask) {
		setHeadIDPutBatMateId(produceTask, null);
	}

	private void setHeadIDPutBatMateId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getPutBatMateId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getPutBatMateId().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getPutBatMateId(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDPutBatMateIdmultiselectIDs(ids);
		produceTask.setHeadIDPutBatMateIdmultiselectNames(names);
	}
	private void dealHeadIDActiveBatchState(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDActiveBatchStateAddIds();
		String delIds = produceTask.getHeadIDActiveBatchStateDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("activeBatchState.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					PublicSetActBatState indirectObj = new PublicSetActBatState();
					indirectObj.setId(Long.valueOf(item));
					tmp.setActiveBatchState(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDActiveBatchState(WOMProduceTask produceTask) {
		setHeadIDActiveBatchState(produceTask, null);
	}

	private void setHeadIDActiveBatchState(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getActiveBatchState() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getActiveBatchState().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getActiveBatchState(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDActiveBatchStatemultiselectIDs(ids);
		produceTask.setHeadIDActiveBatchStatemultiselectNames(names);
	}
	private void dealHeadIDFormulaBom(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDFormulaBomAddIds();
		String delIds = produceTask.getHeadIDFormulaBomDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("formulaBom.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					RMFormulaBom indirectObj = new RMFormulaBom();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormulaBom(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDFormulaBom(WOMProduceTask produceTask) {
		setHeadIDFormulaBom(produceTask, null);
	}

	private void setHeadIDFormulaBom(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getFormulaBom() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormulaBom().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormulaBom(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDFormulaBommultiselectIDs(ids);
		produceTask.setHeadIDFormulaBommultiselectNames(names);
	}
	private void dealHeadIDFormulaId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDFormulaIdAddIds();
		String delIds = produceTask.getHeadIDFormulaIdDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("formulaId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					RMFormula indirectObj = new RMFormula();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormulaId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDFormulaId(WOMProduceTask produceTask) {
		setHeadIDFormulaId(produceTask, null);
	}

	private void setHeadIDFormulaId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getFormulaId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormulaId().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormulaId(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDFormulaIdmultiselectIDs(ids);
		produceTask.setHeadIDFormulaIdmultiselectNames(names);
	}
	private void dealHeadIDProductId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDProductIdAddIds();
		String delIds = produceTask.getHeadIDProductIdDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("productId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					MESBasicProduct indirectObj = new MESBasicProduct();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProductId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDProductId(WOMProduceTask produceTask) {
		setHeadIDProductId(produceTask, null);
	}

	private void setHeadIDProductId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
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
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDProductIdmultiselectIDs(ids);
		produceTask.setHeadIDProductIdmultiselectNames(names);
	}
	private void dealHeadIDOrderProcessId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDOrderProcessIdAddIds();
		String delIds = produceTask.getHeadIDOrderProcessIdDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("orderProcessId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					WOMProduceTaskProcess indirectObj = new WOMProduceTaskProcess();
					indirectObj.setId(Long.valueOf(item));
					tmp.setOrderProcessId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDOrderProcessId(WOMProduceTask produceTask) {
		setHeadIDOrderProcessId(produceTask, null);
	}

	private void setHeadIDOrderProcessId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getOrderProcessId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getOrderProcessId().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getOrderProcessId(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDOrderProcessIdmultiselectIDs(ids);
		produceTask.setHeadIDOrderProcessIdmultiselectNames(names);
	}
	private void dealHeadIDBatchNumObj(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDBatchNumObjAddIds();
		String delIds = produceTask.getHeadIDBatchNumObjDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("batchNumObj.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					WOMStandingcropRef indirectObj = new WOMStandingcropRef();
					indirectObj.setId(Long.valueOf(item));
					tmp.setBatchNumObj(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDBatchNumObj(WOMProduceTask produceTask) {
		setHeadIDBatchNumObj(produceTask, null);
	}

	private void setHeadIDBatchNumObj(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getBatchNumObj() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getBatchNumObj().getId();
				String displayField = "batchText";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getBatchNumObj(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDBatchNumObjmultiselectIDs(ids);
		produceTask.setHeadIDBatchNumObjmultiselectNames(names);
	}
	private void dealHeadIDActiveId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDActiveIdAddIds();
		String delIds = produceTask.getHeadIDActiveIdDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("activeId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					RMFormulaProcessActive indirectObj = new RMFormulaProcessActive();
					indirectObj.setId(Long.valueOf(item));
					tmp.setActiveId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDActiveId(WOMProduceTask produceTask) {
		setHeadIDActiveId(produceTask, null);
	}

	private void setHeadIDActiveId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getActiveId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getActiveId().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getActiveId(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDActiveIdmultiselectIDs(ids);
		produceTask.setHeadIDActiveIdmultiselectNames(names);
	}
	private void dealHeadIDProcessId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIDProcessIdAddIds();
		String delIds = produceTask.getHeadIDProcessIdDeleteIds();
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
				List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask), Restrictions.in("processId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskActive item : tmpList) {
					produceTaskActiveDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskActive tmp = new WOMProduceTaskActive();
					tmp.setHeadID(produceTask);
					RMFormulaProcess indirectObj = new RMFormulaProcess();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProcessId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskActiveDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIDProcessId(WOMProduceTask produceTask) {
		setHeadIDProcessId(produceTask, null);
	}

	private void setHeadIDProcessId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskActive> tmpList = produceTaskActiveDao.findByCriteria(Order.asc("id"), Restrictions.eq("headID", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskActive item : tmpList) {
			if(item.getProcessId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getProcessId().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getProcessId(), displayField);
			}
		}
		produceTask.setProduceTaskActiveList(tmpList);
		produceTask.setHeadIDProcessIdmultiselectIDs(ids);
		produceTask.setHeadIDProcessIdmultiselectNames(names);
	}
	private void dealHeadIdFormulaId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIdFormulaIdAddIds();
		String delIds = produceTask.getHeadIdFormulaIdDeleteIds();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("formulaId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskProcess tmp = new WOMProduceTaskProcess();
					tmp.setHeadId(produceTask);
					RMFormula indirectObj = new RMFormula();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormulaId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskProcessDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdFormulaId(WOMProduceTask produceTask) {
		setHeadIdFormulaId(produceTask, null);
	}

	private void setHeadIdFormulaId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskProcess item : tmpList) {
			if(item.getFormulaId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormulaId().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormulaId(), displayField);
			}
		}
		produceTask.setProduceTaskProcessList(tmpList);
		produceTask.setHeadIdFormulaIdmultiselectIDs(ids);
		produceTask.setHeadIdFormulaIdmultiselectNames(names);
	}
	private void dealHeadIdProcessType(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIdProcessTypeAddIds();
		String delIds = produceTask.getHeadIdProcessTypeDeleteIds();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("processType.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskProcess tmp = new WOMProduceTaskProcess();
					tmp.setHeadId(produceTask);
					RMProcessType indirectObj = new RMProcessType();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProcessType(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskProcessDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdProcessType(WOMProduceTask produceTask) {
		setHeadIdProcessType(produceTask, null);
	}

	private void setHeadIdProcessType(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskProcess item : tmpList) {
			if(item.getProcessType() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getProcessType().getId();
				String displayField = "id";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getProcessType(), displayField);
			}
		}
		produceTask.setProduceTaskProcessList(tmpList);
		produceTask.setHeadIdProcessTypemultiselectIDs(ids);
		produceTask.setHeadIdProcessTypemultiselectNames(names);
	}
	private void dealHeadIdFormularProcess(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIdFormularProcessAddIds();
		String delIds = produceTask.getHeadIdFormularProcessDeleteIds();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("formularProcess.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskProcess tmp = new WOMProduceTaskProcess();
					tmp.setHeadId(produceTask);
					RMFormulaProcess indirectObj = new RMFormulaProcess();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFormularProcess(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskProcessDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdFormularProcess(WOMProduceTask produceTask) {
		setHeadIdFormularProcess(produceTask, null);
	}

	private void setHeadIdFormularProcess(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskProcess item : tmpList) {
			if(item.getFormularProcess() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getFormularProcess().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getFormularProcess(), displayField);
			}
		}
		produceTask.setProduceTaskProcessList(tmpList);
		produceTask.setHeadIdFormularProcessmultiselectIDs(ids);
		produceTask.setHeadIdFormularProcessmultiselectNames(names);
	}
	private void dealHeadIdFactoryId(WOMProduceTask produceTask) {
		String addIds = produceTask.getHeadIdFactoryIdAddIds();
		String delIds = produceTask.getHeadIdFactoryIdDeleteIds();
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
				List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask), Restrictions.in("factoryId.id", idList), Restrictions.eq("valid", true));
				for (WOMProduceTaskProcess item : tmpList) {
					produceTaskProcessDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					WOMProduceTaskProcess tmp = new WOMProduceTaskProcess();
					tmp.setHeadId(produceTask);
					MESBasicFactoryModel indirectObj = new MESBasicFactoryModel();
					indirectObj.setId(Long.valueOf(item));
					tmp.setFactoryId(indirectObj);
					tmp.setCid(produceTask.getCid());
					produceTaskProcessDao.save(tmp);
				}
			}
		}
	}

	private void setHeadIdFactoryId(WOMProduceTask produceTask) {
		setHeadIdFactoryId(produceTask, null);
	}

	private void setHeadIdFactoryId(WOMProduceTask produceTask, String viewCode) {
		List<WOMProduceTaskProcess> tmpList = produceTaskProcessDao.findByCriteria(Order.asc("id"), Restrictions.eq("headId", produceTask), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (WOMProduceTaskProcess item : tmpList) {
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
		produceTask.setProduceTaskProcessList(tmpList);
		produceTask.setHeadIdFactoryIdmultiselectIDs(ids);
		produceTask.setHeadIdFactoryIdmultiselectNames(names);
	}
	private void dealSupervision(WOMProduceTask produceTask) {
		String addIds = produceTask.getSupervisionAddIds();
		String delIds = produceTask.getSupervisionDeleteIds();
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
				produceTaskDao.deleteSupervision(produceTask.getTableInfoId(), idList);
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					Supervision tmp = new Supervision();
					tmp.setTableInfoId(produceTask.getTableInfoId());
					Staff indirectObj = new Staff();
					indirectObj.setId(Long.valueOf(item));
					tmp.setStaff(indirectObj);
					produceTaskDao.addSupervision(tmp, produceTask);
					// supervisionService.save(tmp);
				}
			}
		}
	}

	private void setSupervision(WOMProduceTask produceTask) {
		List<WOMProduceTaskSupervision> tmpList = produceTaskDao.findSupervision(produceTask.getTableInfoId());
		String ids = "";
		String names = "";
		for (WOMProduceTaskSupervision item : tmpList) {
			if(item.getStaff() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getStaff().getId();
				names += item.getStaff().getName();
			}
		}
		produceTask.setSupervisionList(tmpList);
		produceTask.setSupervisionmultiselectIDs(ids);
		produceTask.setSupervisionmultiselectNames(names);
	}
	// ================ 生成多选控件数据保存方法 end ====================

	protected String getEntityCode(){return WOMProduceTask.ENTITY_CODE;}
	protected String getModuleCode(){return WOMProduceTask.MODULE_CODE;}
	protected String getModelCode(){return WOMProduceTask.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param produceTask 模型实例
	 */
	public void checkUniqueConstraint(WOMProduceTask produceTask){
		if(null == produceTask.getTableNo() || StringUtils.isEmpty(produceTask.getTableNo().toString())){
			return;
		}
		if(produceTask.getId()==null ){
			List<WOMProduceTask> produceTasks = produceTaskDao.findByCriteria(Restrictions.eq("tableNo", produceTask.getTableNo()));
			if(produceTasks!=null && !produceTasks.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), produceTask.getTableNo());
			}
		} else {
			List<WOMProduceTask> produceTasks = produceTaskDao.findByCriteria(Restrictions.ne("id", produceTask.getId()), Restrictions.eq("tableNo", produceTask.getTableNo()));
			if(produceTasks!=null && !produceTasks.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"ec.common.tableNo", getCurrentUser().getLanguage()), produceTask.getTableNo());
			}
		}
	}
	
	
	@Override
	public List<WOMProduceTask> getProduceTasks(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMProduceTask.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return produceTaskDao.findByHql("from " + WOMProduceTask.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return produceTaskDao.findByCriteria(detachedCriteria);
	}
	
	
	
	@Override
	public List<WOMProduceTask> findProduceTasksBySql(String sql, List<Object> params){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMProduceTask.class);
		if(params!=null && params.size()>0){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
			
		}else{
			detachedCriteria.add(Restrictions.sqlRestriction(sql));
		}
		
		return produceTaskDao.findByCriteria(detachedCriteria);
	}
	@Override
	public List<WOMProduceTask> findProduceTasksByHql(String hql, Object... objects){
		
		return   produceTaskDao.findByHql(hql, objects);
	}
	
	@Override
	public WOMProduceTask loadProduceTaskByBussinessKey(WOMProduceTask produceTask){
		return loadProduceTaskByBussinessKey(produceTask.getTableNo());
	}
	
	@Override
	public Page<WOMProduceTask> getProduceTasks(Page<WOMProduceTask> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMProduceTask.class);
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
				page = produceTaskDao.findByPage(page, sql);
			}else{
				page = produceTaskDao.findAllByPage(page);
			}
			return page;
		}
		page = produceTaskDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMProduceTask loadProduceTaskByBussinessKey(Serializable bussinessKey){
		return produceTaskDao.findEntityByCriteria(Restrictions.eq("tableNo", bussinessKey),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<WOMProduceTask> findByProperty(String propertyName, Object object){
		return produceTaskDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public WOMProduceTask findEntityByProperty(String propertyName, Object object){
		return produceTaskDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<String> bussinessKeyList = Arrays.asList(bussinessKeys.split(","));
			String sql = "update " + WOMProduceTask.JPA_NAME + " set valid=0 where tableNo in (:businessKeys)";
			Query query = produceTaskDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("WOM_7.5.0.0_produceTask_ProduceTask","runtime");
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
		List<View> views = viewServiceFoundation.findViewsByEntityCode("WOM_7.5.0.0_produceTask", ViewType.VIEW);
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
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("WOM_7.5.0.0_produceTask_ProduceTask","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	public void dealDatagridsSave(WOMProduceTask produceTask,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=viewServiceFoundation.getDataGrids(viewCode, "runtime");
		if(dgs!=null&&dgs.size()>0){
			produceTaskDao.flush();
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
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()).replaceAll("\r\n", "\\\\r\\\\n"), _reflect_dgclass,produceTaskDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), WOMProduceTask.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, produceTask);
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
								((com.supcon.orchid.orm.entities.AbstractEcTreeEntity)odg).setTableInfoId(produceTask.getTableInfoId());
							}else{
								if (odg instanceof com.supcon.orchid.orm.entities.AbstractEcPartEntity) {
									((com.supcon.orchid.orm.entities.AbstractEcPartEntity)odg).setTableInfoId(produceTask.getTableInfoId());
								} else if ((odg instanceof com.supcon.orchid.orm.entities.AbstractEcFullEntity)) {
									((com.supcon.orchid.orm.entities.AbstractEcFullEntity)odg).setTableInfoId(produceTask.getTableInfoId());
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
								paramMap.put("mainModelId",produceTask.getTableInfoId());	
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
			String sql = "select " + businessKeyName +" from "+ WOMProduceTask.TABLE_NAME +" where valid = 1";
			list = produceTaskDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ WOMProduceTask.TABLE_NAME;
			list = produceTaskDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey){
		List<Object[]> list = new ArrayList<Object[]>();
		Map<Object, Object> m = new HashMap<Object, Object>();
		if(null != propertyName && null != businessKey){
			String sql = "select " + businessKey + "," + propertyName +" from "+ WOMProduceTask.TABLE_NAME +" group by " + propertyName + "," + businessKey;
			list = produceTaskDao.createNativeQuery(sql).list();
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
	private WOMProduceTaskDaoImpl produceTaskDaoImpl;
	
	@Override
	@Transactional
	public String getTableNoById(Long id){
		String sql = "select table_no from " + WOMProduceTask.TABLE_NAME + " where id = ?";
		String tableNo = produceTaskDao.createNativeQuery(sql,id).uniqueResult().toString();
		return tableNo;
	}
	
	@Override
	@Transactional
	public List<String> getTableNoData(){
		List<String> list = new ArrayList<String>();
		String sql = "select table_no from " + WOMProduceTask.TABLE_NAME;
		list = produceTaskDao.createNativeQuery(sql).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchProduceTaskWorkFlow(final List<WOMProduceTask> insertObjs, final List<WOMProduceTask> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){
		return this.importBatchProduceTaskWorkFlow(insertObjs, updateObjs, columnInfo, entityCode, importNodeInfo, importPropInfo,null);		
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchProduceTaskWorkFlow(final List<WOMProduceTask> insertObjs, final List<WOMProduceTask> updateObjs, 
			List<Map<String,String>> columnInfo, final String entityCode, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog){
			
		int importCount = 0;
		if (null != insertObjs) {
			importCount += insertObjs.size();
		}
		if (null != updateObjs) {
			importCount += updateObjs.size();
		}
		AuditUtil.setAuditDes(InternationalResource.get("foundation.import.bussiness.info.args",null,InternationalResource.get("WOM.modelname.randon1489657901718"),importCount));
		if(null != signatureLog && null == signatureLog.getOperateLogUuid()){
			if (null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()) {
				signatureLog.setOperateLogUuid((null == AuditUtil.getCurrentAudit().getOperationAudit().get_parentCode() || "-1".equals( AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode())) ? AuditUtil.getCurrentAudit().getOperationAudit().getUuid() : AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode());
			}
		}
		Map<Long, WOMProduceTask> oldUpdateObjsMap = new HashMap<Long, WOMProduceTask>(); 
		List<Long> updateObjIdsList = new ArrayList<Long>();
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {
			WOMProduceTask bizObj = updateObjs.get(updateIndex);
			updateObjIdsList.add(bizObj.getId());
		}
		if (updateObjIdsList.size() > 0) {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(WOMProduceTask.class);
			if(updateObjIdsList.size()>1000){
				List<Long> updateObjIdsListBefore = updateObjIdsList.subList(0, 999);
				List<Long> updateObjIdsListAfter = updateObjIdsList.subList(999, updateObjIdsList.size());		
				detachedCriteria.add(Restrictions.or(Restrictions.in("id", updateObjIdsListBefore),Restrictions.in("id", updateObjIdsListAfter)));
			}else{
				detachedCriteria.add(Restrictions.in("id", updateObjIdsList));
			}
			List<WOMProduceTask> bizObjList = produceTaskDao.findByCriteria(detachedCriteria);
			if (null != bizObjList) {
				for (int mIndex = 0; mIndex < bizObjList.size(); mIndex++) {
					WOMProduceTask bizObj = bizObjList.get(mIndex);
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
		
		final List<WOMProduceTask> nmeObjs = new ArrayList<WOMProduceTask>();
											
		for(WOMProduceTask produceTask:insertObjs){//没有table_no的新增项，系统生成
			if(produceTask.getTableNo() == null || (produceTask.getTableNo() != null && produceTask.getTableNo().equals(""))){
				produceTask.setTableNo(generateTableNo());	
			}
		}
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		//String idSql = "select id from " + WOMProduceTask.TABLE_NAME + " order by id desc";
		//Query query = produceTaskDao.createNativeQuery(idSql).setMaxResults(1);
		/*String hql = "select id from " + WOMProduceTask.JPA_NAME + " order by id desc";
		Query query =  produceTaskDao.createQuery(hql).setMaxResults(1);
		Long id = new Long(1000);
		if(null != query.uniqueResult()){
			id = Long.valueOf(query.uniqueResult().toString());
		}*/
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(WOMProduceTask.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(WOMProduceTask produceTask:insertObjs)  {
			//id = autoGeneratorID.getNextId(WOMProduceTask.TABLE_NAME,1,dbId);
			if(produceTask.getTableNo() != null && !produceTask.getTableNo().equals("") ){
				m.put(produceTask.getTableNo(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			produceTask.setId(id);
			id++;
		}
		
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) produceTaskDao.createNativeQuery(sql, "WOM_7.5.0.0_produceTask_ProduceTask"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		produceTaskDaoImpl.getSession().doWork(new Work() {
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
					String updateSql = "UPDATE " + WOMProduceTask.TABLE_NAME + " SET ";
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
						WOMProduceTask produceTask = updateObjs.get(updateIndex);
						Long id = produceTask.getId();
						if(null != id){
							updateps.setLong(columnMaps.size()+1,id);
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = produceTask.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(produceTask);
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
							nmeObjs.add(produceTask);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + WOMProduceTask.TABLE_NAME + " (";
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
					String insertDiSql = "INSERT INTO " + WOMProduceTask.TABLE_NAME + "_DI " +
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
					Long diId = autoGeneratorID.getNextId(WOMProduceTask.TABLE_NAME + "_DI",insSize, "ID");
					Long dealInfoId = autoGeneratorID.getNextId("WF_DEAL_INFO",insSize);
					
					for(int insertIndex = 0; insertIndex<insSize; insertIndex++)  {
						WOMProduceTask produceTask = insertObjs.get(insertIndex);
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
							insertps.setLong(columnMaps.size() + 5, produceTask.getOwnerPositionId());
						if(!colExclude.contains(5))
                      		insertps.setInt(columnMaps.size() + 6, 0);
                      	if(!colExclude.contains(6))
                      		insertps.setString(columnMaps.size() + 7, "excelImport");
                      	if(!colExclude.contains(8))
							insertps.setLong(columnMaps.size() + 9, 1);
						if(!colExclude.contains(9))
							insertps.setString(columnMaps.size() + 10,produceTask.getPositionLayRec());
						if(!colExclude.contains(10))
							insertps.setLong(columnMaps.size() + 11,produceTask.getOwnerPosition().getDepartment().getId());
						java.util.Date date=new java.util.Date();
						if(!colExclude.contains(11))
							insertps.setTimestamp(columnMaps.size() + 12,new java.sql.Timestamp(date.getTime()));
						
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = produceTask.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(produceTask);
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
						produceTask.setId(id);
						nmeObjs.add(produceTask);
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
						ecTableInfops.setString(7,WOMProduceTask.TABLE_NAME);
						ecTableInfops.setInt(8,99);
						ecTableInfops.setLong(9,produceTask.getOwnerPosition().getId());
						ecTableInfops.setLong(10,produceTask.getOwnerStaff().getId());
						ecTableInfops.setString(11,entityCode);
						ecTableInfops.setString(12,produceTask.getPositionLayRec());
						ecTableInfops.setString(13,produceTask.getTableNo());
						ecTableInfops.setLong(14,produceTask.getOwnerPosition().getDepartment().getId());
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
		
		produceTaskDaoImpl.getSession().flush();
		produceTaskDaoImpl.getSession().clear();
		
		
		//记录导入数据日志（区分新增和修改）
		String sqlQueryBussinesskey = "select name from runtime_property  where model_code=? and valid=1 and is_bussiness_key=1";
		String sqlQueryMainDispaly = "select name from runtime_property  where model_code=? and valid=1 and is_main_display=1";
		Object retObjBussinesskey = produceTaskDao.createNativeQuery(sqlQueryBussinesskey, "WOM_7.5.0.0_produceTask_ProduceTask").setMaxResults(1).uniqueResult();
		String bussinesskeyFieldName = (null != retObjBussinesskey) ? retObjBussinesskey.toString() : null;
		Object retObjMainDispaly = produceTaskDao.createNativeQuery(sqlQueryMainDispaly, "WOM_7.5.0.0_produceTask_ProduceTask").setMaxResults(1).uniqueResult();
		String mainDispalyFieldName = (null != retObjMainDispaly) ? retObjMainDispaly.toString() : null;
		
		for(int insertIndex = 0; insertIndex < insertObjs.size(); insertIndex++)  {//新增
			WOMProduceTask bizObj = insertObjs.get(insertIndex);
			produceTaskImportService.saveImportDataLog(bizObj, null, "tableNo", "id");
		}
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {//修改
			WOMProduceTask bizObj = updateObjs.get(updateIndex);
			WOMProduceTask oldBizObj = oldUpdateObjsMap.get(bizObj.getId());
			produceTaskImportService.saveImportDataLog(bizObj, oldBizObj, "tableNo", "id");
		}
		
		return m;
	}
	
	
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getViewName(String modelCode){
		String sql = "select NAME from runtime_view where type='LIST' and ass_model_code = ?";
		String viewName = produceTaskDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult()!=null?
				produceTaskDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult().toString():"";
		return viewName;
	}
	
	
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = produceTaskDao.createNativeQuery(sql, "WOM_7.5.0.0_produceTask_ProduceTask").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = produceTaskDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = produceTaskDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = produceTaskDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?produceTaskDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  produceTaskDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,produceTaskDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1542100691662Page(Page<WOMAdjustOrTempHead> dg1542100691662Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMAdjustOrTempHead.class);
		criteria.add(Restrictions.eq("adjustHeadID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"adjustOrTempHead\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		adjustOrTempHeadDao.findByPage(dg1542100691662Page, criteria);
		adjustOrTempHeadService.findByNormalDataGridProduceTask(dg1542100691662Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1542100698339Page(Page<WOMAdjustOrTempRecords> dg1542100698339Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMAdjustOrTempRecords.class);
		criteria.add(Restrictions.eq("headerID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"adjustOrTempRecords\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		adjustOrTempRecordsDao.findByPage(dg1542100698339Page, criteria);
		adjustOrTempRecordsService.findByNormalDataGridProduceTask(dg1542100698339Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505983091921Page(Page<WOMProduceTaskActive> dg1505983091921Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505983091921Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505983091921Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505983091997Page(Page<WOMProduceMaterialSum> dg1505983091997Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505983091997Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505983091997Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1506060049547Page(Page<WOMProduceTaskActive> dg1506060049547Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1506060049547Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1506060049547Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1506060049644Page(Page<WOMProduceMaterialSum> dg1506060049644Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1506060049644Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1506060049644Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1506306746525Page(Page<WOMProduceTaskActive> dg1506306746525Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1506306746525Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1506306746525Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1506306746606Page(Page<WOMProduceMaterialSum> dg1506306746606Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1506306746606Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1506306746606Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1498733248586Page(Page<WOMProdTaskProcExelog> dg1498733248586Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
		criteria.add(Restrictions.eq("taskID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodTaskProcExelog\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodTaskProcExelogDao.findByPage(dg1498733248586Page, criteria);
		prodTaskProcExelogService.findByNormalDataGridProduceTask(dg1498733248586Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1498733279732Page(Page<WOMProdTaskActiExelog> dg1498733279732Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
		criteria.add(Restrictions.eq("taskID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodTaskActiExelog\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodTaskActiExelogDao.findByPage(dg1498733279732Page, criteria);
		prodTaskActiExelogService.findByNormalDataGridProduceTask(dg1498733279732Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1489730796226Page(Page<WOMProduceTaskActive> dg1489730796226Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1489730796226Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1489730796226Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1489731937175Page(Page<WOMProduceTaskProcess> dg1489731937175Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskProcessDao.findByPage(dg1489731937175Page, criteria);
		produceTaskProcessService.findByNormalDataGridProduceTask(dg1489731937175Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1489732429091Page(Page<WOMProduceMaterialSum> dg1489732429091Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1489732429091Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1489732429091Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1489736028416Page(Page<WOMProduceTaskActive> dg1489736028416Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1489736028416Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1489736028416Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1572513055658Page(Page<WOMProduceTaskActive> dg1572513055658Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1572513055658Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1572513055658Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1572513055772Page(Page<WOMProduceTaskProcess> dg1572513055772Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskProcessDao.findByPage(dg1572513055772Page, criteria);
		produceTaskProcessService.findByNormalDataGridProduceTask(dg1572513055772Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1572513055825Page(Page<WOMProduceMaterialSum> dg1572513055825Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1572513055825Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1572513055825Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1572513055910Page(Page<WOMProduceTaskActive> dg1572513055910Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1572513055910Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1572513055910Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1540191119508Page(Page<WOMProduceTaskActive> dg1540191119508Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1540191119508Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1540191119508Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1540191119680Page(Page<WOMProduceMaterialSum> dg1540191119680Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1540191119680Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1540191119680Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1540191119773Page(Page<WOMProduceTaskActive> dg1540191119773Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1540191119773Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1540191119773Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1540191119898Page(Page<WOMProduceTaskProcess> dg1540191119898Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskProcessDao.findByPage(dg1540191119898Page, criteria);
		produceTaskProcessService.findByNormalDataGridProduceTask(dg1540191119898Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1490749384698Page(Page<WOMProduceTaskActive> dg1490749384698Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1490749384698Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1490749384698Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1490749384787Page(Page<WOMProduceMaterialSum> dg1490749384787Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1490749384787Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1490749384787Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1490749384886Page(Page<WOMProduceTaskActive> dg1490749384886Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1490749384886Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1490749384886Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1490749384962Page(Page<WOMProduceTaskProcess> dg1490749384962Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskProcessDao.findByPage(dg1490749384962Page, criteria);
		produceTaskProcessService.findByNormalDataGridProduceTask(dg1490749384962Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505802969630Page(Page<WOMProduceTaskActive> dg1505802969630Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505802969630Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505802969630Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505802969738Page(Page<WOMProduceMaterialSum> dg1505802969738Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505802969738Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505802969738Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505804201833Page(Page<WOMProduceTaskActive> dg1505804201833Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505804201833Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505804201833Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505804201918Page(Page<WOMProduceMaterialSum> dg1505804201918Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505804201918Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505804201918Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1495850751698Page(Page<WOMProduceTaskActive> dg1495850751698Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1495850751698Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1495850751698Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1495850751757Page(Page<WOMProduceMaterialSum> dg1495850751757Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1495850751757Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1495850751757Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1495850751807Page(Page<WOMProduceTaskActive> dg1495850751807Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1495850751807Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1495850751807Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1495850751863Page(Page<WOMProduceTaskProcess> dg1495850751863Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskProcessDao.findByPage(dg1495850751863Page, criteria);
		produceTaskProcessService.findByNormalDataGridProduceTask(dg1495850751863Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1496389818499Page(Page<WOMProduceTaskActive> dg1496389818499Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1496389818499Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1496389818499Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1496389818610Page(Page<WOMProduceMaterialSum> dg1496389818610Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1496389818610Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1496389818610Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1496389818686Page(Page<WOMProduceTaskActive> dg1496389818686Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1496389818686Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1496389818686Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1496389818751Page(Page<WOMProduceTaskProcess> dg1496389818751Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskProcess\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskProcessDao.findByPage(dg1496389818751Page, criteria);
		produceTaskProcessService.findByNormalDataGridProduceTask(dg1496389818751Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505285519431Page(Page<WOMProduceMaterialSum> dg1505285519431Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505285519431Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505285519431Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505285519610Page(Page<WOMProduceTaskActive> dg1505285519610Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505285519610Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505285519610Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505456701981Page(Page<WOMProduceTaskActive> dg1505456701981Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505456701981Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505456701981Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505456702135Page(Page<WOMProduceMaterialSum> dg1505456702135Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505456702135Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505456702135Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505974050406Page(Page<WOMProduceTaskActive> dg1505974050406Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505974050406Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505974050406Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505983284775Page(Page<WOMProduceMaterialSum> dg1505983284775Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505983284775Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505983284775Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505975951232Page(Page<WOMProduceTaskActive> dg1505975951232Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505975951232Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505975951232Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505983664771Page(Page<WOMProduceMaterialSum> dg1505983664771Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505983664771Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505983664771Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1504926238926Page(Page<WOMProduceTaskActive> dg1504926238926Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1504926238926Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1504926238926Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505176886273Page(Page<WOMProduceMaterialSum> dg1505176886273Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505176886273Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505176886273Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505100155794Page(Page<WOMProduceTaskActive> dg1505100155794Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
		criteria.add(Restrictions.eq("headID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceTaskActive\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceTaskActiveDao.findByPage(dg1505100155794Page, criteria);
		produceTaskActiveService.findByNormalDataGridProduceTask(dg1505100155794Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1505178110802Page(Page<WOMProduceMaterialSum> dg1505178110802Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
		criteria.add(Restrictions.eq("headId", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"produceMaterialSum\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		produceMaterialSumDao.findByPage(dg1505178110802Page, criteria);
		produceMaterialSumService.findByNormalDataGridProduceTask(dg1505178110802Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1495780442464Page(Page<WOMProdTaskProcExelog> dg1495780442464Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
		criteria.add(Restrictions.eq("taskID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodTaskProcExelog\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodTaskProcExelogDao.findByPage(dg1495780442464Page, criteria);
		prodTaskProcExelogService.findByNormalDataGridProduceTask(dg1495780442464Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1495781791731Page(Page<WOMProdTaskActiExelog> dg1495781791731Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
		criteria.add(Restrictions.eq("taskID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodTaskActiExelog\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodTaskActiExelogDao.findByPage(dg1495781791731Page, criteria);
		prodTaskActiExelogService.findByNormalDataGridProduceTask(dg1495781791731Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1542351151648Page(Page<WOMAdjustOrTempHead> dg1542351151648Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMAdjustOrTempHead.class);
		criteria.add(Restrictions.eq("adjustHeadID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"adjustOrTempHead\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		adjustOrTempHeadDao.findByPage(dg1542351151648Page, criteria);
		adjustOrTempHeadService.findByNormalDataGridProduceTask(dg1542351151648Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1542351151777Page(Page<WOMAdjustOrTempRecords> dg1542351151777Page,WOMProduceTask produceTask, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(WOMAdjustOrTempRecords.class);
		criteria.add(Restrictions.eq("headerID", produceTask));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"adjustOrTempRecords\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		adjustOrTempRecordsDao.findByPage(dg1542351151777Page, criteria);
		adjustOrTempRecordsService.findByNormalDataGridProduceTask(dg1542351151777Page);
	}
	
	 
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.save")
	public void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService){
		saveProduceTask(produceTask, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.save")
	public void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode){
		saveProduceTask(produceTask, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		this.saveProduceTask(produceTask, dataGridService, viewCode, eventTopic,null,isImport);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void saveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog, boolean... isImport){
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_produceTask";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		String url = null;
		if(null != produceTask.getId() && produceTask.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/add";
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
				executeGScript(entityCode, "beforeSave", events, produceTask);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		beforeSaveProduceTask(produceTask, viewIsView);

		if (null == produceTask.getId()) {
			if(null == produceTask.getStatus()){
				produceTask.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			produceTask.setTableNo(generateTableNo());
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				if(isNew)
					produceTaskDao.save(produceTask);
				else
					produceTaskDao.merge(produceTask);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(produceTask,isImport);
				produceTaskDao.saveTableInfo(ti);
				produceTask.setTableInfoId(ti.getId());
				if(produceTask.getOwnerStaffId()==null){
					produceTask.setOwnerStaffId(produceTask.getCreateStaffId());
					ti.setOwnerStaffId(produceTask.getCreateStaffId());
				}
				if(produceTask.getOwnerDepartmentId()==null){
					produceTask.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
					ti.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
				}
				if(produceTask.getOwnerPositionId()==null){
					produceTask.setOwnerPositionId(produceTask.getCreatePositionId());
					ti.setOwnerPositionId(produceTask.getCreatePositionId());
				}
				produceTask.setCreateStaffId(produceTask.getCreateStaffId());
				produceTask.setCreatePositionId(produceTask.getCreatePositionId());
				produceTask.setCreateDepartmentId(produceTask.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (produceTask.getCompany() == null) {
					produceTask.setCompany(getCurrentCompany());
				}
				if (produceTask.getCid() == null || produceTask.getCid() == -1l) {
					produceTask.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					produceTaskDao.saveWithRevertVersion(produceTask);
				} else {
					produceTaskDao.save(produceTask);
				}
				
		} else {
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				if(isNew)
					produceTaskDao.save(produceTask);
				else
					produceTaskDao.merge(produceTask);
			}
		}
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		if (dataGridService != null) {
			produceTaskDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealTaskIDTaskProcessID(produceTask);
			this.dealTaskIDFactoryId(produceTask);
			this.dealTaskIDStaffID(produceTask);
			this.dealTaskIDFormularActice(produceTask);
			this.dealTaskIDWaitPutinRecordID(produceTask);
			this.dealTaskIDProductID(produceTask);
			this.dealTaskIDActiveBatchStateID(produceTask);
			this.dealTaskIDTaskActiveID(produceTask);
			this.dealTaskIDProcessExeLog(produceTask);
			this.dealTaskIDFactoryID(produceTask);
			this.dealTaskIDFormularProcess(produceTask);
			this.dealHeadIdProductId(produceTask);
			this.dealHeadIDFactoryId(produceTask);
			this.dealHeadIDPutBatMateId(produceTask);
			this.dealHeadIDActiveBatchState(produceTask);
			this.dealHeadIDFormulaBom(produceTask);
			this.dealHeadIDFormulaId(produceTask);
			this.dealHeadIDProductId(produceTask);
			this.dealHeadIDOrderProcessId(produceTask);
			this.dealHeadIDBatchNumObj(produceTask);
			this.dealHeadIDActiveId(produceTask);
			this.dealHeadIDProcessId(produceTask);
			this.dealHeadIdFormulaId(produceTask);
			this.dealHeadIdProcessType(produceTask);
			this.dealHeadIdFormularProcess(produceTask);
			this.dealHeadIdFactoryId(produceTask);
			this.dealSupervision(produceTask);
		
		// 根据配置规则生成编码
		try {
			generateProduceTaskCodes(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProduceTaskSummarys(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduceTask(produceTask, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, produceTask);
			}
		}
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		produceTaskDao.flush();
		produceTaskDao.clear();
		produceTask = produceTaskDao.load(produceTask.getId());
		
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		
		params.add(produceTask);
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=produceTask.getTableNo();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(produceTask.getId());
			String msgId="moduleCode:WOM_7.5.0.0#entityCode:WOM_7.5.0.0_produceTask#modelCode:WOM_7.5.0.0_produceTask_ProduceTask#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public Map<Object, Object> produceTaskDataGridImport(WOMProduceTask produceTask, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport){
		Map<Object, Object> map = new HashMap<Object, Object>();
		boolean isNew = false;
		String entityCode = "WOM_7.5.0.0_produceTask";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		String url = null;
		if(produceTask.getId() != null && produceTask.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/add";
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
				executeGScript(entityCode, "beforeSave", events, produceTask);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		beforeSaveProduceTask(produceTask, viewIsView);

		if (null == produceTask.getId()) {
			if(null == produceTask.getStatus()){
				produceTask.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			produceTask.setTableNo(generateTableNo());
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				if(isNew)
					produceTaskDao.save(produceTask);
				else
					produceTaskDao.merge(produceTask);
			}
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(produceTask,isImport);
				produceTaskDao.saveTableInfo(ti);
				produceTask.setTableInfoId(ti.getId());
				if(produceTask.getOwnerStaffId()==null){
					produceTask.setOwnerStaffId(produceTask.getCreateStaffId());
					ti.setOwnerStaffId(produceTask.getCreateStaffId());
				}
				if(produceTask.getOwnerDepartmentId()==null){
					produceTask.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
					ti.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
				}
				if(produceTask.getOwnerPositionId()==null){
					produceTask.setOwnerPositionId(produceTask.getCreatePositionId());
					ti.setOwnerPositionId(produceTask.getCreatePositionId());
				}
				produceTask.setCreateStaffId(produceTask.getCreateStaffId());
				produceTask.setCreatePositionId(produceTask.getCreatePositionId());
				produceTask.setCreateDepartmentId(produceTask.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (produceTask.getCompany() == null) {
					produceTask.setCompany(getCurrentCompany());
				}
				if (produceTask.getCid() == null || produceTask.getCid() == -1l) {
					produceTask.setCid(getCurrentCompanyId());
				}
				
				
				if (viewIsView) {
					produceTaskDao.saveWithRevertVersion(produceTask);
				} else {
					produceTaskDao.save(produceTask);
				}
				
		} else {
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				if(isNew)
					produceTaskDao.save(produceTask);
				else
					produceTaskDao.merge(produceTask);
			}
		}

		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		
		if (dataGridService != null) {
			produceTaskDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealTaskIDTaskProcessID(produceTask);
			this.dealTaskIDFactoryId(produceTask);
			this.dealTaskIDStaffID(produceTask);
			this.dealTaskIDFormularActice(produceTask);
			this.dealTaskIDWaitPutinRecordID(produceTask);
			this.dealTaskIDProductID(produceTask);
			this.dealTaskIDActiveBatchStateID(produceTask);
			this.dealTaskIDTaskActiveID(produceTask);
			this.dealTaskIDProcessExeLog(produceTask);
			this.dealTaskIDFactoryID(produceTask);
			this.dealTaskIDFormularProcess(produceTask);
			this.dealHeadIdProductId(produceTask);
			this.dealHeadIDFactoryId(produceTask);
			this.dealHeadIDPutBatMateId(produceTask);
			this.dealHeadIDActiveBatchState(produceTask);
			this.dealHeadIDFormulaBom(produceTask);
			this.dealHeadIDFormulaId(produceTask);
			this.dealHeadIDProductId(produceTask);
			this.dealHeadIDOrderProcessId(produceTask);
			this.dealHeadIDBatchNumObj(produceTask);
			this.dealHeadIDActiveId(produceTask);
			this.dealHeadIDProcessId(produceTask);
			this.dealHeadIdFormulaId(produceTask);
			this.dealHeadIdProcessType(produceTask);
			this.dealHeadIdFormularProcess(produceTask);
			this.dealHeadIdFactoryId(produceTask);
			this.dealSupervision(produceTask);
		
		// 根据配置规则生成编码
		try {
			generateProduceTaskCodes(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProduceTaskSummarys(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduceTask(produceTask, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, produceTask);
			}
		}
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		produceTaskDao.flush();
		produceTaskDao.clear();
		
		String virturalId = produceTask.getVirtualId();
		
		produceTask = produceTaskDao.load(produceTask.getId());
		
		if(virturalId != null && virturalId.length() > 0){
			map.put(virturalId, produceTask.getId());
		}else{
			String methodName = "get" + businessKey.getName().substring(0, 1).toUpperCase() + businessKey.getName().substring(1);
			Object bkValue = null;
			try {
				Method getBkValue = produceTask.getClass().getMethod(methodName);
				bkValue = getBkValue.invoke(produceTask);
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				log.error(e.getMessage(), e);
			}
			map.put(bkValue, produceTask.getId());
		}
		
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		
		params.add(produceTask);
		return map;
	}
	
	 
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void mergeProduceTask(WOMProduceTask produceTask, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		beforeSaveProduceTask(produceTask);
		if (null == produceTask.getId()) {
			produceTask.setStatus(EntityTableInfo.STATUS_RUNNING);
			produceTask.setTableNo(generateTableNo());
			produceTaskDao.save(produceTask);
			// 保存TableInfo,如果是基础不保存
				EntityTableInfo ti = getTableInfo(produceTask);
				produceTaskDao.saveTableInfo(ti);
				produceTask.setTableInfoId(ti.getId());
				if(produceTask.getOwnerStaffId()==null){
					produceTask.setOwnerStaffId(produceTask.getCreateStaffId());
				}
				if(produceTask.getOwnerDepartmentId()==null){
					produceTask.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
				}
				if(produceTask.getOwnerPositionId()==null){
					produceTask.setOwnerPositionId(produceTask.getCreatePositionId());
				}
				produceTask.setCreateStaffId(produceTask.getCreateStaffId());
				produceTask.setCreatePositionId(produceTask.getCreatePositionId());
				produceTask.setCreateDepartmentId(produceTask.getCreateDepartmentId());
				// 当公司为空时，默认插入当前公司
				if (produceTask.getCompany() == null) {
					produceTask.setCompany(getCurrentCompany());
				}
				if (produceTask.getCid() == null || produceTask.getCid() == -1l) {
					produceTask.setCid(getCurrentCompanyId());
				}
				produceTaskDao.merge(produceTask);
		} else {
			produceTaskDao.merge(produceTask);
		}
		
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		
		if (dataGridService != null) {
			dataGridService.execute();
		}

			// 一对多情况处理
			this.dealTaskIDTaskProcessID(produceTask);
			this.dealTaskIDFactoryId(produceTask);
			this.dealTaskIDStaffID(produceTask);
			this.dealTaskIDFormularActice(produceTask);
			this.dealTaskIDWaitPutinRecordID(produceTask);
			this.dealTaskIDProductID(produceTask);
			this.dealTaskIDActiveBatchStateID(produceTask);
			this.dealTaskIDTaskActiveID(produceTask);
			this.dealTaskIDProcessExeLog(produceTask);
			this.dealTaskIDFactoryID(produceTask);
			this.dealTaskIDFormularProcess(produceTask);
			this.dealHeadIdProductId(produceTask);
			this.dealHeadIDFactoryId(produceTask);
			this.dealHeadIDPutBatMateId(produceTask);
			this.dealHeadIDActiveBatchState(produceTask);
			this.dealHeadIDFormulaBom(produceTask);
			this.dealHeadIDFormulaId(produceTask);
			this.dealHeadIDProductId(produceTask);
			this.dealHeadIDOrderProcessId(produceTask);
			this.dealHeadIDBatchNumObj(produceTask);
			this.dealHeadIDActiveId(produceTask);
			this.dealHeadIDProcessId(produceTask);
			this.dealHeadIdFormulaId(produceTask);
			this.dealHeadIdProcessType(produceTask);
			this.dealHeadIdFormularProcess(produceTask);
			this.dealHeadIdFactoryId(produceTask);
			this.dealSupervision(produceTask);
		afterSaveProduceTask(produceTask);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.exportExcel",operType="11")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.print.page.print",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes(InternationalResource.get("ec.print.page.print"));
		}else if(printType == 1){
			AuditUtil.setAuditDes(InternationalResource.get("ec.view.controlPrint"));
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.batch.save",operType="4")
	public void batchSaveProduceTask(WOMProduceTask produceTask, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_produceTask";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "WOM_7.5.0.0_produceTask");
		String url = null;
		if(produceTask.getId()!=null && produceTask.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/wOM_7500_produceTask/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, produceTask);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		beforeSaveProduceTask(produceTask, viewIsView);

		if (null == produceTask.getId()) {
			if(null == produceTask.getStatus()){
				produceTask.setStatus(EntityTableInfo.STATUS_RUNNING);
			}
			produceTask.setTableNo(generateTableNo());
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				produceTaskDao.save(produceTask);
			}
			// 保存TableInfo,如果是基础不保存
			EntityTableInfo ti = getTableInfo(produceTask,isImport);
			produceTaskDao.saveTableInfo(ti);
			produceTask.setTableInfoId(ti.getId());
			if(produceTask.getOwnerStaffId()==null){
				produceTask.setOwnerStaffId(produceTask.getCreateStaffId());
				ti.setOwnerStaffId(produceTask.getCreateStaffId());
			}
			if(produceTask.getOwnerDepartmentId()==null){
				produceTask.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
				ti.setOwnerDepartmentId(produceTask.getCreateDepartmentId());
			}
			if(produceTask.getOwnerPositionId()==null){
				produceTask.setOwnerPositionId(produceTask.getCreatePositionId());
				ti.setOwnerPositionId(produceTask.getCreatePositionId());
			}
			produceTask.setCreateStaffId(produceTask.getCreateStaffId());
			produceTask.setCreatePositionId(produceTask.getCreatePositionId());
			produceTask.setCreateDepartmentId(produceTask.getCreateDepartmentId());
			// 当公司为空时，默认插入当前公司
			if (produceTask.getCompany() == null) {
				produceTask.setCompany(getCurrentCompany());
			}
			if (produceTask.getCid() == null || produceTask.getCid() == -1l) {
				produceTask.setCid(getCurrentCompanyId());
			}
			
			
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				produceTaskDao.save(produceTask);
			}
		} else {
			if (viewIsView) {
				produceTaskDao.saveWithRevertVersion(produceTask);
			} else {
				produceTaskDao.merge(produceTask);
			}
		}

		if (dataGridService != null) {
			produceTaskDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealTaskIDTaskProcessID(produceTask);
			this.dealTaskIDFactoryId(produceTask);
			this.dealTaskIDStaffID(produceTask);
			this.dealTaskIDFormularActice(produceTask);
			this.dealTaskIDWaitPutinRecordID(produceTask);
			this.dealTaskIDProductID(produceTask);
			this.dealTaskIDActiveBatchStateID(produceTask);
			this.dealTaskIDTaskActiveID(produceTask);
			this.dealTaskIDProcessExeLog(produceTask);
			this.dealTaskIDFactoryID(produceTask);
			this.dealTaskIDFormularProcess(produceTask);
			this.dealHeadIdProductId(produceTask);
			this.dealHeadIDFactoryId(produceTask);
			this.dealHeadIDPutBatMateId(produceTask);
			this.dealHeadIDActiveBatchState(produceTask);
			this.dealHeadIDFormulaBom(produceTask);
			this.dealHeadIDFormulaId(produceTask);
			this.dealHeadIDProductId(produceTask);
			this.dealHeadIDOrderProcessId(produceTask);
			this.dealHeadIDBatchNumObj(produceTask);
			this.dealHeadIDActiveId(produceTask);
			this.dealHeadIDProcessId(produceTask);
			this.dealHeadIdFormulaId(produceTask);
			this.dealHeadIdProcessType(produceTask);
			this.dealHeadIdFormularProcess(produceTask);
			this.dealHeadIdFactoryId(produceTask);
			this.dealSupervision(produceTask);
		
		// 根据配置规则生成编码
		try {
			generateProduceTaskCodes(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProduceTaskSummarys(produceTask, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduceTask(produceTask, viewIsView);


		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, produceTask);
			}
		}
		List<WOMProduceTask> params = new ArrayList<WOMProduceTask>();
		produceTaskDao.flush();
		produceTaskDao.clear();
		produceTask = produceTaskDao.load(produceTask.getId());
		
		List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask));
		produceTask.setProduceTaskActiveList(produceTaskActiveList);
		List<WOMBatchPhaseExelog> batchPhaseExelogList = batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
		List<WOMProdTaskActiExelog> prodTaskActiExelogList = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
		List<WOMProduceMaterialSum> produceMaterialSumList = produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceMaterialSumList(produceMaterialSumList);
		List<WOMProduceTaskProcess> produceTaskProcessList = produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask));
		produceTask.setProduceTaskProcessList(produceTaskProcessList);
		List<WOMProdTaskProcExelog> prodTaskProcExelogList = prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask));
		produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
		
		params.add(produceTask);
	}
	
	@Override
	public Page<WOMProduceTask> getByPage(Page<WOMProduceTask> page,DetachedCriteria detachedCriteria){
		return produceTaskDao.findByPage(page, detachedCriteria);
	}
	@Override
	public List<WOMBatchPhaseExelog> getBatchPhaseExelogList(WOMProduceTask produceTask){
		return batchPhaseExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask),Restrictions.eq("valid", true));
	}
	@Override
	public List<WOMProdTaskActiExelog> getProdTaskActiExelogList(WOMProduceTask produceTask){
		return prodTaskActiExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask),Restrictions.eq("valid", true));
	}
	@Override
	public List<WOMProdTaskProcExelog> getProdTaskProcExelogList(WOMProduceTask produceTask){
		return prodTaskProcExelogDao.findByCriteria(Restrictions.eq("taskID", produceTask),Restrictions.eq("valid", true));
	}
	@Override
	public List<WOMProduceMaterialSum> getProduceMaterialSumList(WOMProduceTask produceTask){
		return produceMaterialSumDao.findByCriteria(Restrictions.eq("headId", produceTask),Restrictions.eq("valid", true));
	}
	@Override
	public List<WOMProduceTaskActive> getProduceTaskActiveList(WOMProduceTask produceTask){
		return produceTaskActiveDao.findByCriteria(Restrictions.eq("headID", produceTask),Restrictions.eq("valid", true));
	}
	@Override
	public List<WOMProduceTaskProcess> getProduceTaskProcessList(WOMProduceTask produceTask){
		return produceTaskProcessDao.findByCriteria(Restrictions.eq("headId", produceTask),Restrictions.eq("valid", true));
	}
	
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.common.super.edit",operType="4")
	public void saveSuperEditProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_produceTask";
		List<Event> events = null;
		View view = null;
		if(viewCode != null){
			view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
		}
		saveSingleSuperEditProduceTask(workFlowVar, dataGridService, view, entityCode, events, produceTask, isImport);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="foundation.batch.import")
	public void batchSaveSuperEditProduceTask(List<WOMProduceTask>  produceTasks, WorkFlowVar workFlowVar, DataGridService dataGridService, View view, boolean... isImport){
		String entityCode = "WOM_7.5.0.0_produceTask";
		List<Event> events = null;
		if(view != null){
			events = viewServiceFoundation.getEventsByView(view);
		}
		for(WOMProduceTask produceTask:produceTasks)  {
			saveSingleSuperEditProduceTask(workFlowVar, dataGridService, view, entityCode, events, produceTask, isImport);
		}
	}
	
	
	
	private void saveSingleSuperEditProduceTask(WorkFlowVar workFlowVar, DataGridService dataGridService, View view, String entityCode, List<Event> events,WOMProduceTask produceTask, boolean... isImport) {
		if(events != null && events.size() > 0){
			executeGScript(entityCode, "beforeSubmit", events, produceTask);
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		if(view == null){
			view = new View();
		}
		
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
		workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		workFlowVar.setStatus(produceTask);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		produceTask.setWorkFlowVar(workFlowVar);
		
		boolean isSuperAdd = false;
		if (produceTask.getId() == null) {
			produceTask.setStatus(EntityTableInfo.STATUS_EFFECTED);
			produceTask.setEffectiveState(1);
			isSuperAdd = true;
		}
		beforeSubmitProduceTask(produceTask, workFlowVar, true);
		batchSaveProduceTask(produceTask, dataGridService, view,events, null,isImport);
		DealInfo di = taskService.generateSuperEditDealInfo(produceTask.getTableInfoId(), isSuperAdd,isImport);
		produceTaskDao.flush();
		workFlowVar.setModelId(produceTask.getId());
		workFlowVar.setTableInfoId(produceTask.getTableInfoId());
		workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
		workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
		workFlowVar.setTableNo(produceTask.getTableNo());
		
		afterSubmitProcessProduceTask(produceTask, di, workFlowVar, view.getCode(), true);
		afterSubmitProduceTask(produceTask, workFlowVar, true);
		if (view != null) {
			if(events != null && events.size() > 0){
				executeGScript(entityCode, "afterSubmit", events, produceTask);
			}
		}
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void save(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		save(produceTask, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}

	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask")
	public void save(WOMProduceTask produceTask, Long deploymentId,Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		boolean first = null == produceTask.getId();
		if (first){
			if(workFlowVar==null){
				workFlowVar = new WorkFlowVar();
			}
			Long createStaffUserId = null;
		   	if(null != produceTask.getCreateStaff() && null != produceTask.getCreateStaff().getUser()){
		    	createStaffUserId = produceTask.getCreateStaff().getUser().getId();
		   	}
   			workFlowVar.setProcessInitiator(null != createStaffUserId ? createStaffUserId : creatorService.getStaffFromSession().getUser().getId());
			workFlowVar.setVariablesProvider(variablesProvider);
			workFlowVar.setDeploymentId(deploymentId);
			workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
			workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
			workFlowVar.setCrossCompanyFlag(false);
			workFlowVar.setGroupEnabled(false);
			workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		}
		produceTask.setWorkFlowVar(workFlowVar);
		if(produceTask.getDeploymentId() == null && deploymentId != null) {
			produceTask.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				produceTask.setProcessKey(d.getProcessKey());
				produceTask.setProcessVersion(d.getProcessVersion());
			}
		}

		saveProduceTask(produceTask, dataGridService, viewCode);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		ProcessInstance instance = null;
		if (first){
			workFlowVar.setModelId(produceTask.getId());
			workFlowVar.setTableInfoId(produceTask.getTableInfoId());
			workFlowVar.setTableNo(produceTask.getTableNo());
			workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
			workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
			workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
			instance = instanceService.start(deploymentId, null, workFlowVar);
		}
		// SAVE也有DealInfo
		DealInfo di = taskService.doSaveDealInfo(produceTask, instance, deploymentId, pendingId, workFlowVar);
		produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
		produceTaskDao.flush(); //将Session的实例同步到数据库
		
		afterSaveProcessProduceTask(produceTask, di, workFlowVar, viewCode);
	}
	
	@Override
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.submit",operType="4")
	public void submit(WOMProduceTask produceTask,Long deploymentId,Long pendingId,WorkFlowVar workFlowVar,DataGridService dataGridService){
		submit(produceTask, deploymentId, pendingId, workFlowVar, dataGridService, null);
	}
	
	@AuditLog(entity="WOM_7.5.0.0_produceTask",model="WOM_7.5.0.0_produceTask_ProduceTask",desc="ec.flow.submit",operType="4")
	public void submit(WOMProduceTask produceTask, Long deploymentId, Long pendingId, WorkFlowVar workFlowVar, DataGridService dataGridService, String viewCode) {
		String entityCode = "WOM_7.5.0.0_produceTask";
		List<Event> events = null;
		if(viewCode != null){
			View view = viewServiceFoundation.getView(viewCode);
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSubmit", events, produceTask);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(produceTask);
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setProcessInitiator(creatorService.getStaffFromSession().getUser().getId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
		workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
		workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		workFlowVar.setStatus(produceTask);
		workFlowVar.setCrossCompanyFlag(false);
		workFlowVar.setGroupEnabled(false);
		produceTask.setWorkFlowVar(workFlowVar);
		if(produceTask.getDeploymentId() == null && deploymentId != null) {
			produceTask.setDeploymentId(deploymentId);
			Deployment d = taskService.getDeployment(deploymentId);
			if(d != null) {
				produceTask.setProcessKey(d.getProcessKey());
				produceTask.setProcessVersion(d.getProcessVersion());
			}
		}

		beforeSubmitProduceTask(produceTask, workFlowVar);
		saveProduceTask(produceTask, dataGridService, viewCode);
		if(null != produceTask && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || WOMProduceTask.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
			AuditUtil.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
			AuditUtil.setColumnStringC(produceTask.getId().toString());
		}
		produceTaskDao.flush(); //如果不flush无法更新effect信息
		workFlowVar.setModelId(produceTask.getId());
		workFlowVar.setTableInfoId(produceTask.getTableInfoId());
		workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
		workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
		workFlowVar.setTableNo(produceTask.getTableNo());
		DealInfo di = taskService.take(pendingId, deploymentId, produceTask.getId(), creatorService.getStaffFromSession(), workFlowVar);
		if(pendingId == null) {
			DealInfo saveDi = taskService.doSaveDealInfo(produceTask, di, deploymentId, pendingId, workFlowVar, true);
			produceTaskDao.copyAndSaveDealInfo(saveDi, produceTask, creatorService.getStaffFromSession());
		}
		produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
		if(workFlowVar.getOutcomeMap()!=null&&workFlowVar.getOutcomeMap().size()>1){
			for(Map<String, ?> map:workFlowVar.getOutcomeMap()){
				String outcome=(map.get("outcome")!=null)?map.get("outcome").toString():"";
				String dec=(map.get("dec")!=null)?map.get("dec").toString():"";
				String type=(map.get("type")!=null)?map.get("type").toString():"";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";
				if(type.equals("notification")){
					produceTaskDao.flush();
					
					WOMProduceTaskDealInfo produceTaskDealInfo=produceTaskDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());
					produceTaskDealInfo.setOutcome(outcome);
					produceTaskDealInfo.setOutcomeDes(dec);
					if(assignUser!=null&&assignUser.length()>0){
						produceTaskDealInfo.setAssignStaff(taskService.getAssignUserName(assignUser));
					}
				}
			}
		}
		// 修改预期委托处理意见生成的顺序
		List<DealInfo> ecDealInfos = taskService.getExpectedConsignDealInfos();
		if (ecDealInfos != null && ecDealInfos.size() > 0) {
			for (DealInfo ecDealInfo : ecDealInfos) {
				produceTaskDao.copyAndSaveDealInfo(ecDealInfo);
			}
			taskService.clearExpectedConsignDealInfos();
		}
		
		if(produceTask.getStatus() == 99) {
			produceTaskDao.deleteSupervision(produceTask.getTableInfoId());
		}
		//将临时处理意见从cookie中删除
		String ctype = "TEMP_DEALINFO_" + produceTask.getProcessKey() + "_" + di.getActivityName() + "_WOM_7.5.0.0_produceTask_" + produceTask.getId();
		List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
		if(cookies != null && !cookies.isEmpty()){
			for(ICookie c : cookies){
				cookieService.delete((Cookie) c);
			}
		}
		produceTaskDao.flush(); //将Session中的处理意见同步到数据库
		afterSubmitProcessProduceTask(produceTask, di, workFlowVar, viewCode);
		afterSubmitProduceTask(produceTask, workFlowVar);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSubmit", events, produceTask);
			}
		}
	}
	
	public String generateTableNo(){
		this.counter.setPattern(modelServiceFoundation.getEntity("WOM_7.5.0.0_produceTask").getPrefix()+"_{1,date,yyyyMMdd}_{0,number,000}");
		return this.counter.incrementAndGetString(new Date(),new Date());
	}
	private void beforeSaveProduceTask(WOMProduceTask produceTask, Object... objects){
		checkUniqueConstraint(produceTask);
	/* CUSTOM CODE START(serviceimpl,beforeSave,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
		List<WOMProduceTaskActive> actives1= produceTaskActiveService.getProduceTaskActives("headId="+produceTask.getId(), null);
		if(produceTask.getBatchContral() && produceTask.getFormularId() != null){
			RMFormula prepareMaterial = formulaService.getFormula(produceTask.getFormularId().getId());
			if(prepareMaterial != null && prepareMaterial.getBatchContral() != null && !prepareMaterial.getBatchContral() ){
				throw new BAPException("指令单勾选批控，但选中配方未同步批控，请重新选择");
			}
		}
		//工单内对象赋值除id以外的参数
		setValueInit(produceTask);

		//生成批號
		if("".equals(produceTask.getProductBatchNum()) || produceTask.getProductBatchNum()==null){
			batchNumCodes(produceTask);
		}

		//查看原工单的配方和生产数量，afterSave当中需要跟新的做比较，如果修改了需要重刷。
		if (produceTask.getId() != null) {
			String getFormula = "select FORMULAR_ID from wom_produce_tasks where id = ?";
			oldFormulaId = produceTaskDao.createNativeQuery(getFormula, produceTask.getId()).uniqueResult() != null ?
					Long.valueOf(produceTaskDao.createNativeQuery(getFormula, produceTask.getId()).uniqueResult().toString()) : null;
			String getProductNum = "select PRODUCT_NUM from wom_produce_tasks where id = ?";
			oldQuantity = produceTaskDao.createNativeQuery(getProductNum, produceTask.getId()).uniqueResult() != null ?
					new BigDecimal(produceTaskDao.createNativeQuery(getProductNum, produceTask.getId()).uniqueResult().toString()) : null;
		}

		produceTaskDao.flush();
		produceTaskDao.clear();
/* CUSTOM CODE END */
	}
	
	private void afterSaveProduceTask(WOMProduceTask produceTask, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
		produceTaskDao.flush();
		produceTaskDao.clear();
		produceTask=produceTaskDao.get(produceTask.getId());


		//处理回掺业务
		updateNumByPutinRatio(produceTask);

		//将车间计划明细设置状态为已下达
		if( produceTask.getPlanParId()!=null){
			WOMDayBatchPlanParts planPart=produceTask.getPlanParId();
			planPart.setPlanState("ppmPlanState/02");
			dayBatchPlanPartsDao.merge(planPart);
		}

		//产品
		MESBasicProduct product = produceTask.getProductId();
		//配方
		RMFormula formular=produceTask.getFormularId();
		//生产线
		MESBasicFactoryModel factory=produceTask.getFactoryId();
		//生产数量
		BigDecimal planNum=produceTask.getProductNum();
		if(formular!=null && ((SystemCode) systemCodeService.getSystemCode("formulaProperty/formulaProperty1")).equals(produceTask.getFormularId().getSetProcess())){
			List<WOMProduceTaskActive> actives= produceTaskActiveService.getProduceTaskActives("headId="+produceTask.getId(), null);
			if (actives.size() != 0) {
				//XX地方会将顺序覆盖掉，这里暂且强行重新排序。。。
				for (int i = 0; i < actives.size(); i++) {
					actives.get(i).setSort(i);
					produceTaskActiveDao.save(actives.get(0));
				}
				produceTaskDao.flush();
				produceTaskDao.clear();
			}
			//首次根据配方 生产数量  生产线 组织指令单的数据
			if(  product!=null && formular!=null && factory!=null && planNum!=null && actives.size()==0){
				//首次根据配方 生产数量  生产线 组织指令单的数据(汇总额外组织)
				if( !( produceTask.getTaskType().getId().equals("womTaskType/type3") || produceTask.getTaskType().getId().equals("womTaskType/type5") )){
					addProTaskData(produceTask,planNum,formular,factory);
				}
				if(!consulService.getValueAsBoolean("platform/bap/WOM/WOM.proBatch")){
					//完整配方不启用物料批号时  保存物料清单
					addSumNoBatch(produceTask);
				}else{
					//TODO 不会执行
					updateSumBatch(produceTask);
				}
			}

			//不是新增工单的时候，且修改过配方或者产量时，先删除工单工序、工单活动、用量汇总表，再重新生成
			try {
				if ((oldFormulaId != null && produceTask.getFormularId() != null && oldFormulaId.longValue() != produceTask.getFormularId().getId().longValue()) ||
						(oldQuantity != null && produceTask.getProductNum() != null && oldQuantity.compareTo(produceTask.getProductNum()) != 0)) {

					String delProcessSql = "delete from WOM_PRODUCE_TASK_PROCESSES where HEAD_ID = " + produceTask.getId();
					produceTaskProcessDao.createNativeQuery(delProcessSql).executeUpdate();
					String delActiveSql = "delete from WOM_PRODUCE_TASK_ACTIVES where HEADID = " + produceTask.getId();
					produceTaskActiveDao.createNativeQuery(delActiveSql).executeUpdate();
					String delSumSql = "delete from WOM_PRODUCE_MATERIAL_SUMS where HEAD_ID = " + produceTask.getId();
					produceMaterialSumDao.createNativeQuery(delSumSql).executeUpdate();
					produceMaterialSumDao.flush();
					produceMaterialSumDao.clear();


					if (product != null && formular != null && factory != null && planNum != null) {
						if (!(produceTask.getTaskType().getId().equals("womTaskType/type3") || produceTask.getTaskType().getId().equals("womTaskType/type5"))) {
							addProTaskData(produceTask, planNum, formular, factory);
						}
						if (!consulService.getValueAsBoolean("platform/bap/WOM/WOM.proBatch")) {
							//完整配方不启用物料批号时  保存物料清单
							addSumNoBatch(produceTask);
						} else {
							//TODO 不会执行
							updateSumBatch(produceTask);
						}
					}
				}
			} catch (Exception e) {
				throw new BAPException(e.getMessage());
			}

			//根据指令单中对所需物料进行的修改，更新指令单的用料汇总的数据
			if(product!=null && formular!=null && factory!=null && planNum!=null && actives.size()>0){
				if(!consulService.getValueAsBoolean("platform/bap/WOM/WOM.proBatch")){
					//当未启用物品批号时，更新汇总信息
					updateSumNoBatch(produceTask);
				}else{
					//当启用物品批号时，保存重新生成汇总信息
					updateSumBatch(produceTask);
				}
			}
		}else if(formular!=null && ((SystemCode) systemCodeService.getSystemCode("formulaProperty/formulaProperty2")).equals(produceTask.getFormularId().getSetProcess())){
			List<WOMProduceTaskActive> actives= produceTaskActiveService.getProduceTaskActives("headId="+produceTask.getId(), null);
			//首次根据配方 生产数量  生产线 组织指令单的数据
			if(   product!=null && formular!=null && factory!=null && planNum!=null && actives.size()==0){
				//简易配方生成物料清单数据
				if( !( produceTask.getTaskType().getId().equals("womTaskType/type3") || produceTask.getTaskType().getId().equals("womTaskType/type5") )){
					addTaskActive(produceTask,planNum,formular);
				}
				updateSumBatch(produceTask);
			}
			//根据指令单中对所需物料进行的修改，更新指令单的用料汇总的数据
			if(product!=null && formular!=null && factory!=null && planNum!=null && actives.size()>0){
				updateSumBatch(produceTask);
			}
		}else if(formular==null){
			String delProcessSql = "delete from WOM_PRODUCE_TASK_PROCESSES where HEAD_ID = " + produceTask.getId();
			produceTaskProcessDao.createNativeQuery(delProcessSql).executeUpdate();
			String delActiveSql = "delete from WOM_PRODUCE_TASK_ACTIVES where HEADID = " + produceTask.getId();
			produceTaskActiveDao.createNativeQuery(delActiveSql).executeUpdate();
			String delSumSql = "delete from WOM_PRODUCE_MATERIAL_SUMS where HEAD_ID = " + produceTask.getId();
			produceMaterialSumDao.createNativeQuery(delSumSql).executeUpdate();
			produceMaterialSumDao.flush();
			produceMaterialSumDao.clear();

			List<WOMProduceTaskActive> actives= produceTaskActiveService.getProduceTaskActives("headId="+produceTask.getId(), null);
			//根据指令单中对所需物料进行的修改，更新指令单的用料汇总的数据
			if(actives.size()>0){
				//当未启用物品批号时，更新汇总信息
				updateSumBatch(produceTask);
			}
		}

		//判断批号唯一
		String hqlChart = "from WOMProduceTask where status != 0 and productBatchNum = ?)";
		List<WOMProduceTask> produceTaskList = produceTaskDao.findByHql(hqlChart,produceTask.getProductBatchNum());
		if(produceTaskList!=null && produceTaskList.size()>1){
			throw new BAPException("WOM.showMessage00000029");
		}
/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportProduceTask(List<WOMProduceTask> produceTasks, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportProduceTask(List<WOMProduceTask> produceTasks){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportProduceTask(List<WOMProduceTask> produceTasks, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportProduceTask(List<WOMProduceTask> produceTasks){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	private void beforeDeleteProduceTask(WOMProduceTask produceTask){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterDeleteProduceTask(WOMProduceTask produceTask){
	/* CUSTOM CODE START(serviceimpl,afterDelete,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRestoreProduceTask(WOMProduceTask produceTask){
	/* CUSTOM CODE START(serviceimpl,beforeRestore,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterRestoreProduceTask(WOMProduceTask produceTask){
	/* CUSTOM CODE START(serviceimpl,afterRestore,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void customGenerateCodes(WOMProduceTask produceTask, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(WOMProduceTask produceTask, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeSubmitProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,beforeSubmit,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeSubmitProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,beforeSubmitSuperEdit,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar){
	/* CUSTOM CODE START(serviceimpl,afterSubmit,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
		produceTaskDao.flush();
		produceTaskDao.clear();
		produceTask = produceTaskDao.load(produceTask.getId());

		/*制造指令单据生效时,将来源为指令单的插到待投料记录表
		 *指令单生效下推备料单*/
		if(produceTask.getStatus()==99 &&  produceTask.getTaskType()!=null && produceTask.getTaskType().getId().equals("womTaskType/type1") ){
			addActiveToWaitPutin(produceTask);
			if(consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynPrepare")) {
			autoCreatPrepareTask(produceTask);
			}
			produceTaskDao.flush();
			produceTaskDao.clear();
		}


		//同一个投配料活动，配料活动不允许所有的计划量都为空
		if(produceTask.getBatchProdTaskID()!=null && produceTask.getBatchProdTaskID().length() > 0){
	    	/*String hql = "from WOMProduceTaskActive where valid = 1 and headID = ? ";
	    	List<WOMProduceTaskActive> produceTaskActiveList = produceTaskDao.findByHql(hql, produceTask);
	    	List<RMFormulaProcessActive> activeHiddenIds = new ArrayList<RMFormulaProcessActive>();
	    	if(produceTaskActiveList != null && produceTaskActiveList.size() > 0){
				for (WOMProduceTaskActive womProduceTaskActive : produceTaskActiveList) {
					if(activeHiddenIds.contains(womProduceTaskActive.getPutBatMateId())){
						continue;
					}else{
						activeHiddenIds.add(womProduceTaskActive.getId())
					}
				}
	    	}
	    	if(activeHiddenIds != null && activeHiddenIds.size() > 0){
	    		for (Long activeHiddenId : activeHiddenIds) {
	    			String hql = "from WOMProduceTaskActive where valid = 1 and headID = ? ";
	    	    	List<WOMProduceTaskActive> produceTaskActiveList = produceTaskDao.findByHql(hql, activeHiddenIds);
					if(activeIds.contains(womProduceTaskActive.getId())){
						continue;
					}else{
						activeIds.add(womProduceTaskActive.getId())
					}
				}
	    	}
	    	throw new BAPException("同一个投配料活动，配料活动不允许所有的计划量都为0");*/

	    	/*String hql = "from WOMProduceTaskActive where valid = 1 and headID = ? ";
	    	List<WOMProduceTaskActive> produceTaskActiveList = produceTaskDao.findByHql(hql, produceTask);
	    	List<String> phaseIds = new ArrayList<String>();
	    	if(produceTaskActiveList != null && produceTaskActiveList.size() > 0){
	    		for (WOMProduceTaskActive womProduceTaskActive : produceTaskActiveList) {
	    			if(womProduceTaskActive.getActiveType() != null &&
	    					"activeType/activeType2".equals(womProduceTaskActive.getActiveType().getId()) ){
						if(phaseIds.contains(womProduceTaskActive.getBatchPhaseID())){
							continue;
						}else{
							phaseIds.add(womProduceTaskActive.getBatchPhaseID());
						}
	    			}
				}
	    	}
	    	if(phaseIds != null && phaseIds.size() > 0){
	    		for(String phaseId : phaseIds){
	    			String hql2 = "from WOMProduceTaskActive where valid = 1 and batchPhaseID = ? ";
	    			List<WOMProduceTaskActive> produceTaskActiveList2 = produceTaskDao.findByHql(hql, phaseId);
	    			if(produceTaskActiveList2 != null && produceTaskActiveList2.size() > 0){
	    				boolean allNone = true;
	    	    		for (WOMProduceTaskActive womProduceTaskActive2 : produceTaskActiveList2) {
	    	    			if(womProduceTaskActive2.getPlanNum().compareTo(BigDecimal.ZERO) ==1){
	    	    				allNone = false;
	    	    				break;
	    	    			}
	    	    		}
	    	    		if(allNone){
	    	    			throw new BAPException("phase对应活动，计划数量不能都为0");
	    	    		}
	    			}
	    		}
	    	}*/
		}


		//单据生效时处理
		if(produceTask.getStatus()==99){
			//单据生效时，将单据状态改为待执行
			produceTaskDao.flush();
			produceTaskDao.clear();
			produceTask = produceTaskDao.load(produceTask.getId());
			produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode("womTaskState/01"));
			produceTaskDao.save(produceTask);
			produceTaskDao.flush();
			produceTaskDao.clear();

			//将工序中所设置的工作单元值，赋值到活动中的工作单元
			setFactoryValue(produceTask);
			produceTaskDao.flush();
			produceTaskDao.clear();
			//配方
			RMFormula formular=produceTask.getFormularId();
			//简易配方不生成配料需求清单
			if(formular!=null && formular.getSetProcess()!=null && formular.getSetProcess().equals(systemCodeService.getSystemCode("formulaProperty/formulaProperty1")) ){
				//根据计划单获得指令单活动
				String hql = "from WOMProduceTaskActive where valid = 1 and headID = ? ";
				List<WOMProduceTaskActive> produceTaskActiveList = produceTaskDao.findByHql(hql, produceTask);
				for (WOMProduceTaskActive womProduceTaskActive : produceTaskActiveList) {
					//将指令单活动 活动类型为 配料 的数据冗余到配料需求
					if(((SystemCode) systemCodeService.getSystemCode("activeType/activeType2")).equals(womProduceTaskActive.getActiveType()) ){
						WOMBatchingMaterialNeed batchingMaterialNeed = new WOMBatchingMaterialNeed();
						batchingMaterialNeed.setFactoryId(womProduceTaskActive.getFactoryId());
						batchingMaterialNeed.setOfferSystem(womProduceTaskActive.getExeSystem());
						//如果计划为空，或者小于等于0 ， 则跳出循环不添加到配料需求中       //结果是:-1 小于,0 等于,1 大于
						if(womProduceTaskActive.getPlanNum()==null || womProduceTaskActive.getPlanNum().compareTo(BigDecimal.ZERO) == 0){
							continue;
						}
						//	需配数量=计划用量/(1-损耗率)
						if(womProduceTaskActive.getPlanNum()!=null ){
							if(womProduceTaskActive.getLossRate()!=null ){
								batchingMaterialNeed.setPlanNum(womProduceTaskActive.getPlanNum().divide(new BigDecimal(1).subtract(womProduceTaskActive.getLossRate().divide(new BigDecimal(100),6,java.math.RoundingMode.HALF_UP)),6,java.math.RoundingMode.HALF_UP));
							}else{
								batchingMaterialNeed.setPlanNum(womProduceTaskActive.getPlanNum());
							}
						}
						batchingMaterialNeed.setProductId(womProduceTaskActive.getProductId());
						//配料顺序
						batchingMaterialNeed.setOfferOrder(womProduceTaskActive.getActiveId().getIngredientsOrder());
						//投料顺序
						batchingMaterialNeed.setActOrder(womProduceTaskActive.getActiveId().getActOrder());
						//phaseID
						batchingMaterialNeed.setPhaseID(womProduceTaskActive.getBatchPhaseID());
						batchingMaterialNeed.setTaskActive(womProduceTaskActive);
						batchingMaterialNeed.setTaskID(produceTask);
						batchingMaterialNeed.setTaskProcess(womProduceTaskActive.getOrderProcessId());
						batchingMaterialNeed.setActiveType(womProduceTaskActive.getActiveType());

						//配料执行系统
						batchingMaterialNeed.setOfferSystem(womProduceTaskActive.getExeSystem());

						//配料活动所对应的投配料活动
						batchingMaterialNeed.setPutBatMateId(womProduceTaskActive.getPutBatMateId());
						batchingMaterialNeed.setState((SystemCode) systemCodeService.getSystemCode("womNeedState/01"));
						//容器与配料方式  add by pl 20170621
						if(womProduceTaskActive.getActiveId()!=null){
							batchingMaterialNeed.setContainer(womProduceTaskActive.getActiveId().getContainer());
							batchingMaterialNeed.setBatchSite(womProduceTaskActive.getActiveId().getBatchSite());
						}
						batchingMaterialNeedDao.save(batchingMaterialNeed);
						produceTaskDao.flush();
						produceTaskDao.clear();
					}
				}
			}
		}


		//如果是作废，则将所参照的计划状态改为待下达
		if(produceTask.getStatus()==0){
			//将车间计划明细设置状态为已下达
			if( produceTask.getPlanParId()!=null){
				WOMDayBatchPlanParts planPart = produceTask.getPlanParId();
				planPart.setPlanState("ppmPlanState/01");
				dayBatchPlanPartsDao.save(planPart);
				produceTaskDao.flush();
				produceTaskDao.clear();
			}
		}

		if("cancel".equals(workFlowVar.getOutcomeType()) && produceTask.getBatchContral() &&
				produceTask.getBatchProdTaskID() != null && produceTask.getBatchProdTaskID().length() > 0 ){//删除表单时同步批次
			deleteProdTaskSync(produceTask.getId().toString(), null);
			produceTaskDao.flush();
			produceTaskDao.clear();
		}

		if(produceTask.getStatus()==99 && produceTask.getBatchContral() &&
				produceTask.getBatchProdTaskID() != null && produceTask.getBatchProdTaskID().length() > 0 ) {//单据生效时，同步批控表单状态为已派单
			updateProdTaskSync(produceTask.getId().toString(), null, 4);
			produceTaskDao.flush();
			produceTaskDao.clear();
		}
/* CUSTOM CODE END */
	}
	
	private void afterSubmitProduceTask(WOMProduceTask produceTask, WorkFlowVar workFlowVar, Boolean superEdit){
	/* CUSTOM CODE START(serviceimpl,afterSubmitSuperEdit,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRetrial(WOMProduceTask produceTask){
	/* CUSTOM CODE START(serviceimpl,beforeRetrial,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
		if(produceTask.getTasksID()!=null){
			throw new BAPException("由批量指令单生成的指令单，不能弃审");
		}
/* CUSTOM CODE END */
	}
	private void afterRetrial(WOMProduceTask produceTask){
	/* CUSTOM CODE START(serviceimpl,afterRetrial,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
		if(produceTask.getTaskState().getId().equals("womTaskState/02") || produceTask.getTaskState().getId().equals("womTaskState/03")){//单据状态为已执行或已完成，不能弃审
			throw new BAPException("WOM.retrialTaskException0811");//"工单执行中或已执行，不能弃审"
		}else{
			//添加批次处理信息
			addDealBatch(produceTask,(SystemCode) systemCodeService.getSystemCode("publicSetTableState/04"),"指令单弃审操作");
			//删除指令单生成的配料需求单   指令单活动有配料才生成配料需求清单
			batchingMaterialNeedService.deleteBytaskId(produceTask.getId());

			if(produceTask.getBatchContral()){
				updateProdTaskSync(produceTask.getId().toString(), null, 1);
			}
		}
		WOMProduceTask produceTaskNew = produceTaskDao.load(produceTask.getId());
		produceTaskNew.setTaskState(null);
		produceTaskDao.save(produceTaskNew);
/* CUSTOM CODE END */
	}
	private void afterSubmitProcessProduceTask(WOMProduceTask produceTask, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcess,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSubmitProcessProduceTask(WOMProduceTask produceTask, DealInfo di, WorkFlowVar workFlowVar, String viewCode, Boolean superEdit){
		/* CUSTOM CODE START(serviceimpl,afterSubmitProcessSuperEdit,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveProcessProduceTask(WOMProduceTask produceTask, DealInfo di, WorkFlowVar workFlowVar, String viewCode){
		/* CUSTOM CODE START(serviceimpl,afterSaveProcess,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportProduceTask(List<WOMProduceTask> insertObjs, List<WOMProduceTask> updateObjs, 
			List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportProduceTask,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void afterImportProduceTask(List<WOMProduceTask> insertObjs, List<WOMProduceTask> updateObjs, 
			List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportProduceTask,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	/* CUSTOM CODE START(serviceimpl,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

	@Resource
	protected SystemCodeService systemCodeService;

	@Autowired
	private RMFormulaProcessService formulaProcessService;

	@Autowired
	private RMFormulaBomService formulaBomService;

	@Autowired
	private RMFormulaProcessActiveService formulaProcessActiveService;

	@Autowired
	private RMFormulaService formulaService;

	@Autowired
	private RMProcessUnitChoiceService processUnitChoiceServiceImpl;

	@Autowired
	private RMProcessUnitService processUnitService;

	@Resource
	private ConsulService consulService;

	@Autowired
	private StaffService staffService;

	@Autowired
	private PublicSetBatchInfoService batchInfoService;

	@Autowired
	private PublicSetBatchDealService batchDealService;


	public StaffService getStaffService() {
		return staffService;
	}
	public void setStaffService(StaffService staffService) {
		this.staffService = staffService;
	}
	/*
	 * 根据产品ID获取默认配方
	 */
	public RMFormula getDefaultFormular(Long productID, String taskType){
		List<RMFormula> formulars = new ArrayList<RMFormula>();
		if("packageTask".equals(taskType)){
			//包装纸平淡
			formulars= formulaService.getFormulas("IS_DAFAULT=1 and VALID=1 and  PRODUCT="+productID +" and IS_FOR_PRODUCT = 1 and STATE ='RMstate/state2' and (PRODUCE_TYPE='produceType/produceType2' or PRODUCE_TYPE='produceType/produceType3')", null);
		}else if("recycleTask".equals(taskType)){
			//回收指定单
			formulars= formulaService.getFormulas("IS_DAFAULT=1 and VALID=1 and  PRODUCT="+productID +" and IS_FOR_PRODUCT = 1 and STATE ='RMstate/state2' and PRODUCE_TYPE='produceType/produceType6'", null);
		}else if("produceTask".equals(taskType)){
			//生产指令单
			formulars= formulaService.getFormulas("IS_DAFAULT=1 and VALID=1 and  PRODUCT="+productID +" and IS_FOR_PRODUCT = 1 and STATE ='RMstate/state2' and (PRODUCE_TYPE='produceType/produceType1' or PRODUCE_TYPE='produceType/produceType4' or PRODUCE_TYPE='produceType/produceType5')", null);
		}else if("otherTask".equals(taskType)){
			//生产指令单
			formulars= formulaService.getFormulas("IS_DAFAULT=1 and VALID=1 and  PRODUCT="+productID +" and IS_FOR_PRODUCT = 1 and STATE ='RMstate/state2' and PRODUCE_TYPE='produceType/produceType7'", null);
		}
		if(formulars.size()>0){
			return formulars.get(0);
		}else{
			return null;
		}
	}
	//json转map
	public Map<String, Object> getAttributesMap(String json){
		if (json == null) {
			return null;
		}
		return ConditionUtil.deserializeJson(json);
	}

	//生产批号自动生成
	@Override
	public void batchNumCodes(WOMProduceTask produceTask){
		boolean isLegal;
		String dependence;
		//if(produceTask.getBatchNumRule()!=null){
		if(produceTask.getTaskType()!=null){
			SystemCode systemCode = null;
			if("womTaskType/type1".equals(produceTask.getTaskType().getId())){//制造
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type1");
			}else if("womTaskType/type2".equals(produceTask.getTaskType().getId()) && produceTask.getPackageType()!=null && "womPackageType/inside".equals(produceTask.getPackageType().getId())){//包装内销
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type2");
			}else if("womTaskType/type2".equals(produceTask.getTaskType().getId()) && produceTask.getPackageType()!=null &&"womPackageType/outside".equals(produceTask.getPackageType().getId())){//包装外销
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type3");
			}else if("womTaskType/type3".equals(produceTask.getTaskType().getId())){//返工
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type4");
			}else if("womTaskType/type4".equals(produceTask.getTaskType().getId())){//回收
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type5");
			}else if("womTaskType/type5".equals(produceTask.getTaskType().getId())){//重新加工
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type6");
			}else if("womTaskType/type6".equals(produceTask.getTaskType().getId())){//其他
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type7");
			}else if("womTaskType/type7".equals(produceTask.getTaskType().getId()) && produceTask.getPackageType()!=null && "womPackageType/inside".equals(produceTask.getPackageType().getId())){//换包装内销
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type2");
			}else if("womTaskType/type7".equals(produceTask.getTaskType().getId()) && produceTask.getPackageType()!=null &&"womPackageType/outside".equals(produceTask.getPackageType().getId())){//换包装外销
				systemCode = (SystemCode) systemCodeService.getSystemCode("womRuleType/type3");
			}
			if(systemCode!=null){
				Counter productBatchNumCounter1 = counterManager.addCounter("WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum"+systemCode.getId(), "WOM_7.5.0.0_produceTask", "", CounterType.All);
				String hqlString = "from WOMBatchNumRule where valid = 1 and ruleType = ? ";
				List<WOMBatchNumRule> batchNumRuleList = produceTaskDao.findByHql(hqlString, systemCode);
				if(batchNumRuleList!=null && batchNumRuleList.size()>0){
					String rule = batchNumRuleList.get(0).getRuleDetail();
					isLegal=true;
					if(rule!=null&&!"".equals(rule)){
						try {
							afterPropertiesSet();	//初始化code
						} catch (Exception e) {
							throw new BAPException(e.getMessage());
						}
						Map configMap = getAttributesMap(rule);
						configMap.put("rollbackable",false);
						List<Map<String,Object>> configs = (List) configMap.get("config");
						dependence=null;
						productBatchNumCounter1.setPattern(configMap.get("pattern").toString());
						List<Object>codingparamlist=new ArrayList<Object>();
						for(int i=0;i<configs.size();i++){
							String ovalue=null;
							//自增长
							if(configs.get(i).get("type").equals("auto")&&configs.get(i).get("autoType").equals("Date")){
								Map<String, Object> autoConfig=configs.get(i);

								if(!batchNumRuleList.get(0).getIsAccountPeriod()){
									if(autoConfig.get("value").equals("_systemdate")){
										dependence=NonCachedCounterBean.dateFormat(new Date(),autoConfig.get("countType").toString());
									}else{
										String field=autoConfig.get("value").toString();
										if(field.equals("")){
											isLegal=false;
											break;
										}
										String fieldValue=ReflectUtils.getPropertyValue(produceTask,field.substring(field.indexOf(".")+1));
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
								}else{
									if(autoConfig.get("value").equals("_systemdate")){
										SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
										String dateString = sdf.format(new Date());
										Date date = null;
										try {
											date = sdf.parse(dateString);
										} catch (Exception e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										//会计期
										List<X6BasicAccountPeriod> accountPeriods = null;
										String hql = "from X6BasicAccountPeriodPart where endDate>=? and startDate<= ?";
										//会计期表体
										List<X6BasicAccountPeriodPart> accountPeriodParts = produceTaskDao.findByHql(hql, date,date);
										if(accountPeriodParts==null || accountPeriodParts.size()==0 || accountPeriodParts.size()>1 ||accountPeriodParts.get(0).getAccountPeriod()==null){
											throw new BAPException("WOM.showMessage00000024");
										}else{
											String hql_head = "from X6BasicAccountPeriod where id=? ";
											accountPeriods = produceTaskDao.findByHql(hql_head, accountPeriodParts.get(0).getAccountPeriod().getId());
										}
										String monthString = "";
										if(accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m1") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m2") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m3") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m4") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m5") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m6") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m7") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m8") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m9")){
											monthString = "0" + accountPeriodParts.get(0).getMonth().getId().substring(10, 11);
										}else{
											monthString = accountPeriodParts.get(0).getMonth().getId().substring(10, 12);
										}
										Date date2 = null;
										try {
											date2 = sdf.parse(accountPeriods.get(0).getYear().getId().substring(9, 13)+"-"+monthString+"-01");
										} catch (ParseException e) {
											e.printStackTrace();
										}
										dependence=NonCachedCounterBean.dateFormat(date2,autoConfig.get("countType").toString());
									}else{
										String field=configs.get(i).get("value").toString();
										if(field.equals("")){
											isLegal=false;
											break;
										}
										String fieldValue=ReflectUtils.getPropertyValue(produceTask,field.substring(field.indexOf(".")+1));
										if(fieldValue==null||fieldValue.equals("")){
											isLegal=false;
											break;
										}else{
											SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
											Date date = null;
											try {
												date = sdf.parse(fieldValue);
											} catch (Exception e) {
												// TODO Auto-generated catch block
												e.printStackTrace();
											}
											//会计期
											List<X6BasicAccountPeriod> accountPeriods = null;
											String hql = "from X6BasicAccountPeriodPart where endDate>=? and startDate<= ?";
											//会计期表体
											List<X6BasicAccountPeriodPart> accountPeriodParts = produceTaskDao.findByHql(hql, date,date);
											if(accountPeriodParts==null || accountPeriodParts.size()==0 || accountPeriodParts.size()>1 ||accountPeriodParts.get(0).getAccountPeriod()==null){
												throw new BAPException("WOM.showMessage00000024");
											}else{
												String hql_head = "from X6BasicAccountPeriod where id=? ";
												accountPeriods = produceTaskDao.findByHql(hql_head, accountPeriodParts.get(0).getAccountPeriod().getId());
											}
											String monthString = "";
											if(accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m1") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m2") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m3") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m4") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m5") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m6") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m7") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m8") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m9")){
												monthString = "0" + accountPeriodParts.get(0).getMonth().getId().substring(10, 11);
											}else{
												monthString = accountPeriodParts.get(0).getMonth().getId().substring(10, 12);
											}
											if(configs.get(i).get("dateType").equals("YearA")){
												ovalue=accountPeriods.get(0).getYear().getId().substring(9, 13);
											}else if(configs.get(i).get("dateType").equals("YearB")){
												ovalue=accountPeriods.get(0).getYear().getId().substring(11, 13);
											}else if(configs.get(i).get("dateType").equals("Month")){
												ovalue=monthString;
											}else if(configs.get(i).get("dateType").equals("Date")){
												ovalue="";
											}
										}
									}
								}
							}
							//实体字段
							if(configs.get(i).get("type").equals("property")){
								ovalue=ReflectUtils.getPropertyValue(produceTask,configs.get(i).get("value").toString().substring(configs.get(i).get("value").toString().indexOf(".")+1));
								if(ovalue.equals("")){
									isLegal=false;
									break;
								}
							} else if(configs.get(i).get("type").equals("date")){
								if(!batchNumRuleList.get(0).getIsAccountPeriod()){
									if(configs.get(i).get("value").equals("_systemdate")){
										ovalue=NonCachedCounterBean.dateFormat(new Date(),configs.get(i).get("dateType").toString());
									}else{
										String field=configs.get(i).get("value").toString();
										if(field.equals("")){
											isLegal=false;
											break;
										}
										String fieldValue=ReflectUtils.getPropertyValue(produceTask,field.substring(field.indexOf(".")+1));
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
									//会计期
									if(configs.get(i).get("value").equals("_systemdate")){
										SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
										String dateString = sdf.format(new Date());
										Date date = null;
										try {
											date = sdf.parse(dateString);
										} catch (Exception e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										//会计期
										List<X6BasicAccountPeriod> accountPeriods = null;
										String hql = "from X6BasicAccountPeriodPart where endDate>=? and startDate<= ?";
										//会计期表体
										List<X6BasicAccountPeriodPart> accountPeriodParts = produceTaskDao.findByHql(hql, date,date);
										if(accountPeriodParts==null || accountPeriodParts.size()==0 || accountPeriodParts.size()>1 ||accountPeriodParts.get(0).getAccountPeriod()==null){
											throw new BAPException("WOM.showMessage00000024");
										}else{
											String hql_head = "from X6BasicAccountPeriod where id=? ";
											accountPeriods = produceTaskDao.findByHql(hql_head, accountPeriodParts.get(0).getAccountPeriod().getId());
										}
										String monthString = "";
										if(accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m1") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m2") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m3") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m4") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m5") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m6") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m7") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m8") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m9")){
											monthString = "0" + accountPeriodParts.get(0).getMonth().getId().substring(10, 11);
										}else{
											monthString = accountPeriodParts.get(0).getMonth().getId().substring(10, 12);
										}
										if(configs.get(i).get("dateType").equals("YearA")){
											ovalue=accountPeriods.get(0).getYear().getId().substring(9, 13);
										}else if(configs.get(i).get("dateType").equals("YearB")){
											ovalue=accountPeriods.get(0).getYear().getId().substring(11, 13);
										}else if(configs.get(i).get("dateType").equals("Month")){
											ovalue=monthString;
										}else if(configs.get(i).get("dateType").equals("Date")){
											ovalue="";
										}
									}else{
										String field=configs.get(i).get("value").toString();
										if(field.equals("")){
											isLegal=false;
											break;
										}
										String fieldValue=ReflectUtils.getPropertyValue(produceTask,field.substring(field.indexOf(".")+1));
										if(fieldValue==null||fieldValue.equals("")){
											isLegal=false;
											break;
										}else{
											SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
											Date date = null;
											try {
												date = sdf.parse(fieldValue);
											} catch (Exception e) {
												// TODO Auto-generated catch block
												e.printStackTrace();
											}
											//会计期
											List<X6BasicAccountPeriod> accountPeriods = null;
											String hql = "from X6BasicAccountPeriodPart where endDate>=? and startDate<= ?";
											//会计期表体
											List<X6BasicAccountPeriodPart> accountPeriodParts = produceTaskDao.findByHql(hql, date,date);
											if(accountPeriodParts==null || accountPeriodParts.size()==0 || accountPeriodParts.size()>1 ||accountPeriodParts.get(0).getAccountPeriod()==null){
												throw new BAPException("WOM.showMessage00000024");
											}else{
												String hql_head = "from X6BasicAccountPeriod where id=? ";
												accountPeriods = produceTaskDao.findByHql(hql_head, accountPeriodParts.get(0).getAccountPeriod().getId());
											}
											String monthString = "";
											if(accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m1") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m2") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m3") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m4") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m5") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m6") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m7") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m8") || accountPeriodParts.get(0).getMonth().getId().equals("accMonth/m9")){
												monthString = "0" + accountPeriodParts.get(0).getMonth().getId().substring(10, 11);
											}else{
												monthString = accountPeriodParts.get(0).getMonth().getId().substring(10, 12);
											}
											if(configs.get(i).get("dateType").equals("YearA")){
												ovalue=accountPeriods.get(0).getYear().getId().substring(9, 13);
											}else if(configs.get(i).get("dateType").equals("YearB")){
												ovalue=accountPeriods.get(0).getYear().getId().substring(11, 13);
											}else if(configs.get(i).get("dateType").equals("Month")){
												ovalue=monthString;
											}else if(configs.get(i).get("dateType").equals("Date")){
												ovalue="";
											}
										}
									}
								}

							} else{
								ovalue=configs.get(i).get("value").toString();
							}
							//大写
							if(configs.get(i).get("thecase").equals("uppercase")){
								ovalue=ovalue.toUpperCase();
							} else if(configs.get(i).get("thecase").equals("lowercase")){	//小写
								ovalue=ovalue.toLowerCase();
							}
							codingparamlist.add(ovalue);
						}
						if(isLegal){
							String codenewCodeValue="";
							if(dependence!=null){
								if((Boolean)configMap.get("rollbackable")==true){
									codenewCodeValue=productBatchNumCounter1.incrementAndGetStringDependenceWithTx(dependence,codingparamlist.toArray());
								}else{
									codenewCodeValue=productBatchNumCounter1.incrementAndGetStringDependence(dependence,codingparamlist.toArray());
								}
							}else{
								if((Boolean)configMap.get("rollbackable")==true){
									codenewCodeValue=productBatchNumCounter1.incrementAndGetStringWithTx(codingparamlist.toArray());
								}else{
									codenewCodeValue=productBatchNumCounter1.incrementAndGetString(codingparamlist.toArray());
								}
							}
							produceTask.setProductBatchNum(codenewCodeValue);
						}
					}
				}
			}
		}
		batchNumCodesByAcc(produceTask);
	}

	//将工序中所设置的工作单元值，赋值到活动中的工作单元
	private void setFactoryValue(WOMProduceTask produceTask){
		List<WOMProduceTaskProcess> wps=produceTaskProcessService.getProduceTaskProcesss("headId="+produceTask.getId(), null);
		for(WOMProduceTaskProcess wp:wps){
			List<WOMProduceTaskActive>was=produceTaskActiveService.getProduceTaskActives("headID="+produceTask.getId()+" and orderProcessId="+wp.getId(), null);
			for(WOMProduceTaskActive wa:was ){
				wa.setFactoryId(wp.getFactoryId());
				produceTaskActiveDao.save(wa);
			}
		}
	}

	//按自定义癖好规则生成规则，若不存在自定义规则则生成系统默认编码
	public void batchNumCodesByAcc(WOMProduceTask produceTask){
		ArrayList<Map<String, Object>> configs=null;
		String dependence;
		Property property=null;
		boolean isLegal;
		// productBatchNum
		if (produceTask.getProductBatchNum() == null || produceTask.getProductBatchNum().isEmpty()) {
			String productBatchNum_property_code = "WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum";
			property = modelServiceFoundation.getProperty(productBatchNum_property_code);
			isLegal=true;
			if(null != property){
				Map<String, Object> productBatchNumattributesMap = property.getAttributesMap();
				if(productBatchNumattributesMap.get("pattern")!=null){
					productBatchNumCounter.setPattern(productBatchNumattributesMap.get("pattern").toString());
				}
				configs=(ArrayList<Map<String, Object>>) productBatchNumattributesMap.get("config");
				dependence=null;
				ArrayList<Object> productBatchNumparamlist=new ArrayList<Object>();
				for(int i=0;i<configs.size();i++){
					String ovalue=null;
					//自增长
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
							String fieldValue=ReflectUtils.getPropertyValue(produceTask,field.substring(field.indexOf(".")+1));
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
						ovalue=ReflectUtils.getPropertyValue(produceTask,configs.get(i).get("value").toString().substring(configs.get(i).get("value").toString().indexOf(".")+1));
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
							String fieldValue=ReflectUtils.getPropertyValue(produceTask,field.substring(field.indexOf(".")+1));
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
					productBatchNumparamlist.add(ovalue);
				}
				if(isLegal){
					String productBatchNumnewCodeValue="";
					if(dependence!=null){
						if((Boolean)productBatchNumattributesMap.get("rollbackable")==true){
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetStringDependenceWithTx(dependence,productBatchNumparamlist.toArray());
						}else{
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetStringDependence(dependence,productBatchNumparamlist.toArray());
						}
					}else{
						if((Boolean)productBatchNumattributesMap.get("rollbackable")==true){
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetStringWithTx(productBatchNumparamlist.toArray());
						}else{
							productBatchNumnewCodeValue=productBatchNumCounter.incrementAndGetString(productBatchNumparamlist.toArray());
						}
					}
					produceTask.setProductBatchNum(productBatchNumnewCodeValue);
				}
			}

		}
	}

	/**
	 * 根据车间计划生成生产指令
	 */
	public void makeProduceOrder(Long exeOrderStaff, Long batchPlanId, String remark){
		Staff exeOrder=staffService.get(exeOrderStaff);
		WOMDayBatchPlanParts plan=dayBatchPlanPartsService.getDayBatchPlanParts(batchPlanId);
		if(plan==null){
			return;
		}
		//暂时按照制造类型的工作流进行处理，后期有其它类型指令单时，需要进行选择判断
		Deployment deployment=processService.getCurrentDeploymentByKey("makeTaskFlow");
		if(deployment==null){
			throw new BAPException(InternationalResource.get("WOM.erroMeasge.radion148829344455443093"));
		}
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setOperateType("save");
		//创建指令单
		WOMProduceTask task=new WOMProduceTask();
		//指令单表头信息
		task.setPlanParId(plan);
		if(plan.getFormularID()!=null){
			task.setWorkType(plan.getFormularID().getProduceType());
		}
		task.setProductId(plan.getProductId());
		task.setProductNum(plan.getQuantity());
		task.setProductBatchNum(plan.getBatchNum());
		task.setFormularId(plan.getFormularID());
		task.setFactoryId(plan.getFactoryCode());
		task.setPlanStartTime(plan.getStartTime());
		task.setPlanEndTime(plan.getEndTime());
		task.setRemark(remark);
		//工作流相关
		task.setCreateStaffId(exeOrderStaff);
		task.setCreatePositionId(exeOrder.getMainPositionId());
		task.setCreateDepartmentId(exeOrder.getMainPosition().getDepartment().getId());
		task.setOwnerStaffId(exeOrderStaff);
		task.setOwnerPositionId(exeOrder.getMainPositionId());
		task.setOwnerDepartmentId(exeOrder.getMainPosition().getDepartment().getId());
		task.setVersion(0);
		this.save(task, deployment.getId(), null, workFlowVar, null, "WOM_7.5.0.0_produceTask_makeTaskEdit");

		//更新计划状态为已下达
		dayBatchPlanPartsDao.flush();
		dayBatchPlanPartsDao.clear();
		plan = dayBatchPlanPartsDao.load(batchPlanId);
		plan.setPlanState("ppmPlanState/02");
		dayBatchPlanPartsDao.merge(plan);
	}

	/**
	 * 根据批量明细生产指令单
	 */
	public void makeProduceOrderByBatchTask(WOMBatchProdTaskPart batchTask){
		User u=(User) getCurrentUser();
		Staff exeOrder=u.getStaff();
		//暂时按照制造类型的工作流进行处理，后期有其它类型指令单时，需要进行选择判断
		Deployment deployment=null;


		//制造
		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type1")){
			deployment=processService.getCurrentDeploymentByKey("makeTaskFlow");
		}
		//包装
		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type2")){
			deployment=processService.getCurrentDeploymentByKey("packageTaskFlow");
		}
		//回收
		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type4")){
			deployment=processService.getCurrentDeploymentByKey("recycleTaskFlow");
		}
		//回收
		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type6")){
			deployment=processService.getCurrentDeploymentByKey("otherTaskFlow");
		}
		if(deployment==null){
			throw new BAPException(InternationalResource.get("WOM.erroMeasge.radion148829344455443093"));
		}
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setOperateType("save");
		//创建指令单
		WOMProduceTask task=new WOMProduceTask();
		task.setProductId(batchTask.getProductId());
		task.setProductNum(batchTask.getProductNum());
		task.setProductBatchNum(batchTask.getProductBatchNum());
		task.setFormularId(batchTask.getFormularId());
		task.setFactoryId(batchTask.getFactoryId());
		task.setRemark(batchTask.getRemark());
		task.setPlanStartTime(batchTask.getPlanStartTime());
		task.setPlanEndTime(batchTask.getPlanEndTime());
		task.setWorkType(batchTask.getOrderType());
		task.setBulkBatchNum(batchTask.getBulkBatchNum());
		task.setBulkNum(batchTask.getBulkNum());
		task.setBulkProduct(batchTask.getBulkProduct());
		task.setTaskState(new SystemCode("womTaskState/01"));
		task.setTasksID(batchTask.getId());
		task.setTaskType(batchTask.getTaskType());
		//工作流相关
		task.setCreateStaffId(exeOrder.getId());
		task.setCreatePositionId(exeOrder.getMainPositionId());
		task.setCreateDepartmentId(exeOrder.getMainPosition().getDepartment().getId());
		task.setOwnerStaffId(exeOrder.getId());
		task.setOwnerPositionId(exeOrder.getMainPositionId());
		task.setOwnerDepartmentId(exeOrder.getMainPosition().getDepartment().getId());
		task.setVersion(0);


		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type1")){
			this.save(task, deployment.getId(), null, workFlowVar, null, "WOM_7.5.0.0_produceTask_makeTaskEdit");
		}
		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type2")){
			this.save(task, deployment.getId(), null, workFlowVar, null, "WOM_7.5.0.0_produceTask_packageTaskEdit");
		}
		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type4")){
			this.save(task, deployment.getId(), null, workFlowVar, null, "WOM_7.5.0.0_produceTask_recycleTaskEdit");
		}
		if( batchTask.getTaskType()!=null &&  batchTask.getTaskType().getId().equals("womTaskType/type6")){
			this.save(task, deployment.getId(), null, workFlowVar, null, "WOM_7.5.0.0_produceTask_otherTaskEdit");
		}

		produceTaskDao.createNativeQuery("delete from wf_pending where table_info_id=?",task.getTableInfoId()).executeUpdate();
	}

	//首次根据配方 生产数量  生产线 组织指令单的数据(汇总额外组织)//完整配方
	private void addProTaskData(WOMProduceTask produceTask,BigDecimal planNum,RMFormula formular,MESBasicFactoryModel factory){
		//将配方的工序在工单中创建一遍
		List<RMFormulaProcess>  formulaProcess=formulaProcessService.getFormulaProcesss("formulaId="+formular.getId() + "  and valid = 1 order by sort", null);
		for(RMFormulaProcess f:formulaProcess){
			WOMProduceTaskProcess tp=new WOMProduceTaskProcess();
			if (StringUtils.isNotBlank(f.getProcSort())) {
				tp.setExeOrder(Integer.valueOf(f.getProcSort()));
			}
			tp.setHeadId(produceTask);
			tp.setTableInfoId(produceTask.getTableInfoId());
			tp.setFormulaId(formular);
			tp.setName(f.getName());
			tp.setProcessType(f.getProcessType());
			tp.setLongTime(f.getLongTime());
			//末道工序
			tp.setIsLastProcess(f.getIsLastProcess());
			//首道工序
			tp.setIsFirstProcess(f.getIsFirstProcess());
			tp.setFormularProcess(f);


			//投料比例  add  by pl 2017-09-18
			tp.setAfterRatio(new BigDecimal(100));
			tp.setBeforeRatio(new BigDecimal(100));

			StringBuilder sBuilder = new StringBuilder();
			sBuilder.append("formulaId=").append(formular.getId()).append(" and lineId=").append(factory.getId()).append(" and processId=").append(f.getId());
			List<RMProcessUnit> pus= processUnitService.getProcessUnits(
					sBuilder.toString(), null);
			//根据适用产线所设置的工序与工作单元的关系，给工作单元赋默认值
			if(pus.size()>0){
				RMProcessUnit pu=pus.get(0);
				List<RMProcessUnitChoice> pucs=processUnitChoiceServiceImpl.getProcessUnitChoices("processUnitID="+pu.getId(), null);
				if(pucs.size()==1){
					tp.setFactoryId(pucs.get(0).getUnitId());
				}
			}

			produceTaskProcessDao.save(tp);
			//工序下的活动在工单中创建一遍
			int i = 0;
			List<RMFormulaProcessActive>  formulaProcessActives= formulaProcessActiveService.getFormulaProcessActives("processId="+f.getId() + "  and valid = 1 order by sort", null);
			for(RMFormulaProcessActive a:formulaProcessActives){
				//其他活动之外的活动
				if(a.getIsMoreOther()){
					continue;
				}
				WOMProduceTaskActive ta=new WOMProduceTaskActive();
				ta.setParentActive(a.getMainActive());
				ta.setHeadID(produceTask);
				ta.setTableInfoId(produceTask.getTableInfoId());
				ta.setFormulaId(formular);
				ta.setProcessId(f);
				ta.setActiveId(a);
				ta.setOrderProcessId(tp);
				if(a.getStandardQuantity()!=null ){//单位数量不为空
					if(a.getIsMixQuality()){ //固定数量
						ta.setStandardNum(a.getStandardQuantity());//理论数量
						ta.setPlanNum(a.getStandardQuantity());//计划数量
						if(a.getMaxQuality()!=null){
							ta.setMaxQuality(a.getMaxQuality());
						}
						if(a.getMinQuality()!=null){
							ta.setMinQuality(a.getMinQuality());
						}
					}else{
						ta.setStandardNum(a.getStandardQuantity().multiply(planNum));//理论数量
						ta.setPlanNum(a.getStandardQuantity().multiply(planNum));//计划数量
						if(a.getMaxQuality()!=null){
							ta.setMaxQuality(a.getMaxQuality().multiply(planNum));
						}
						if(a.getMinQuality()!=null){
							ta.setMinQuality(a.getMinQuality().multiply(planNum));
						}
					}
				}
				ta.setIsMixQuality(a.getIsMixQuality());
				ta.setActiveType(a.getActiveType());
				//性质 ：投料，投配料，配料性质投入，产出性质产出
				if (a.getActiveType().getId().equals("activeType/activeType2")|| a.getActiveType().getId().equals("activeType/activeType3")|| a.getActiveType().getId().equals("activeType/activeType4")) {
					ta.setProperty((SystemCode) systemCodeService.getSystemCode("RMproperty/property1"));//投入
				}
				if(a.getActiveType().getId().equals("activeType/activeType6")){
					ta.setProperty((SystemCode) systemCodeService.getSystemCode("RMproperty/property2"));//产出
				}
				ta.setExecSort(a.getExecSort());
				ta.setIsReplace(a.getIsReplace());
				ta.setSort(i++);
				ta.setExeSystem(a.getExeSystem());
				ta.setProductId(a.getProduct());
				ta.setRemark(a.getMeno());
				ta.setName(a.getName());
				//完工检验  移动端执行
				ta.setFinalInspection(a.getFinalInspection());
				ta.setMobileTerminal(a.getMobileTerminal());
				//配料顺序
				ta.setOfferOrder(a.getIngredientsOrder());
				//投料顺序
				ta.setActOrder(a.getActOrder());
				//配料活动所对应的投配料活动
				if(a.getActiveHiddenId()!=null){
					ta.setPutBatMateId(formulaProcessActiveService.getFormulaProcessActive(a.getActiveHiddenId()));
				}
				ta.setLossRate(a.getLossRate());


				//活动来源为来自配方  add  by pl 2017-09-28
				ta.setActiveSource(new SystemCode("womActiveSource/01"));

				produceTaskActiveDao.save(ta);
			}
			produceTaskActiveDao.flush();
			produceTaskActiveDao.clear();
			//设置对应的父从活动关系
			setParentsId(produceTask);
		}
	}
	private void setParentsId(WOMProduceTask produceTask) {
		Map<Long,Long> keyMap = new HashMap<>();
		List<WOMProduceTaskActive> taskActives = produceTaskActiveDao.findByHql(" from WOMProduceTaskActive where headID = ? and valid = 1  order by sort", produceTask);
		for (WOMProduceTaskActive taskActive : taskActives) {
			if (taskActive.getActiveId() != null) {
				//从用料活动找到配方工序活动，然后将父子关系理清楚
				if (taskActive.getParentActive()) {    //如果是
					keyMap.put(taskActive.getActiveId().getId(),taskActive.getId());
				}else {
					if (keyMap.containsKey(taskActive.getActiveId().getActiveHiddenId()) && keyMap.get(taskActive.getActiveId().getActiveHiddenId()) != null) {
						taskActive.setParentActiveId(keyMap.get(taskActive.getActiveId().getActiveHiddenId()));
						produceTaskActiveDao.save(taskActive);
					}
				}
			}
		}
	}

	//完整配方不启用物料批号时  保存物料清单
	private void addSumNoBatch(WOMProduceTask produceTask){
		//如果未启用批号
		//找到所有活动
		List<WOMProduceTaskActive> taskActives = produceTaskActiveService.getProduceTaskActives("headID="+produceTask.getId(), null);
		if(taskActives!=null){
			List<WOMProduceMaterialSum> materialSumList = new ArrayList<WOMProduceMaterialSum>();
			for (WOMProduceTaskActive womProduceTaskActive : taskActives) {
				//过滤投料配料之外哦的工序
				if(womProduceTaskActive.getActiveType()!=null  && !( womProduceTaskActive.getActiveType().getId().equals("activeType/activeType2")
						||  womProduceTaskActive.getActiveType().getId().equals("activeType/activeType3") ) ){
					continue;
				}
				//过滤机动投料
				if(womProduceTaskActive.getProductId()==null ){
					continue;
				}
				WOMProduceMaterialSum materialSum=new WOMProduceMaterialSum();
				materialSum.setHeadId(produceTask);
				materialSum.setTableInfoId(produceTask.getTableInfoId());
				materialSum.setProductId(womProduceTaskActive.getProductId());
				//性质
				if(womProduceTaskActive.getProperty()!=null){
					materialSum.setProperty(womProduceTaskActive.getProperty());
				}
				if(womProduceTaskActive.getStandardNum()!=null){
					materialSum.setStandardNum(womProduceTaskActive.getStandardNum());
				}
				if(womProduceTaskActive.getPlanNum()!=null){
					materialSum.setPlanNum(womProduceTaskActive.getPlanNum());
				}
				materialSum.setIsMixQuality(womProduceTaskActive.getIsMixQuality());
				if(womProduceTaskActive.getMaxQuality()!=null){
					materialSum.setMaxQuality(womProduceTaskActive.getMaxQuality());
				}
				if(womProduceTaskActive.getMinQuality()!=null){
					materialSum.setMinQuality(womProduceTaskActive.getMinQuality());
				}
				//过滤重复物品，数量相加
				if(materialSumList!=null && materialSumList.size()!=0){
					boolean isExit= false;
					for (WOMProduceMaterialSum womProduceMaterialSum : materialSumList) {
						if(womProduceMaterialSum.getProductId().getId()==materialSum.getProductId().getId()){
							womProduceMaterialSum.setPlanNum(womProduceMaterialSum.getPlanNum().add(materialSum.getPlanNum()));
							womProduceMaterialSum.setStandardNum(womProduceMaterialSum.getStandardNum().add(materialSum.getStandardNum()));
							isExit = true;
							break;
						}
					}
					if(!isExit){
						materialSumList.add(materialSum);
					}
				}else if(materialSumList!=null && materialSumList.size()==0){
					materialSumList.add(materialSum);
				}
			}
			for (WOMProduceMaterialSum womProduceMaterialSum : materialSumList) {
				produceMaterialSumDao.save(womProduceMaterialSum);
			}
			produceMaterialSumDao.flush();
			produceMaterialSumDao.clear();
		}
	}
	//简易配方生成物料清单数据
	private void addTaskActive(WOMProduceTask produceTask,BigDecimal planNum,RMFormula formular){
		//获取物料清单
		List<RMFormulaBom>  formulaBoms=formulaBomService.getFormulaBoms("formulaId="+formular.getId(), null);
		for(RMFormulaBom a:formulaBoms){
			if(((SystemCode) systemCodeService.getSystemCode("RMproperty/property1")).equals(a.getProperty())){//性质：投入
				WOMProduceTaskActive ta=new WOMProduceTaskActive();
				ta.setHeadID(produceTask);
				ta.setTableInfoId(produceTask.getTableInfoId());
				ta.setFormulaId(formular);
				if(a.getUnitQuality()!=null){//配方物料清单-单位数量
					if(a.getIsMixQuality()){//固定数量为是
						ta.setStandardNum(a.getUnitQuality());//理论数量
						ta.setPlanNum(a.getUnitQuality());//计划数量
						if(a.getMaxQuality()!=null){
							ta.setMaxQuality(a.getMaxQuality());
						}
						if(a.getMinQuality()!=null){
							ta.setMinQuality(a.getMinQuality());
						}
					}else{//固定数量为否
						ta.setStandardNum(a.getUnitQuality().multiply(planNum));//理论数量
						ta.setPlanNum(a.getUnitQuality().multiply(planNum));//计划数量
						if(a.getMaxQuality()!=null){
							ta.setMaxQuality(a.getMaxQuality().multiply(planNum));//理论上限
						}
						if(a.getMinQuality()!=null){
							ta.setMinQuality(a.getMinQuality().multiply(planNum));//理论下限
						}
					}
				}
				ta.setIsMixQuality(a.getIsMixQuality());
				ta.setProductId(a.getProductId());
				ta.setLossRate(a.getLossRate());
				ta.setRemark(a.getMeno());
				//阶段，次序，需要称重
				if(a.getPhase()!=null){
					ta.setPhase(a.getPhase());
				}
				if(a.getSequence()!=null){
					ta.setSequence(a.getSequence());
				}
				if(a.getNeedWeigh()!=null){
					ta.setNeedWeigh(a.getNeedWeigh());
				}
				//性质
				if(a.getProperty()!=null){
					ta.setProperty(a.getProperty());
				}
				//设置活动为投料
				ta.setActiveType((SystemCode) systemCodeService.getSystemCode("activeType/activeType3"));
				produceTaskActiveDao.save(ta);
			}
		}
	}
	//当未启用物品批号时，更新汇总信息
	private void updateSumNoBatch(WOMProduceTask produceTask){
		//如果未启用批号
		List<WOMProduceMaterialSum> sums=produceMaterialSumService.getProduceMaterialSums("headId="+produceTask.getId(), null);
		for(WOMProduceMaterialSum sum:sums){
			StringBuilder sBuilder = new StringBuilder();
			//sBuilder.append(" ( activeType='activeType/activeType2' or  activeType='activeType/activeType3' or activeType='activeType/activeType6' ) and headId=").append(produceTask.getId()).append(" and productId=").append(sum.getProductId().getId());
			sBuilder.append(" ( activeType='activeType/activeType2' or  activeType='activeType/activeType3' ) and headId=").append(produceTask.getId()).append(" and productId=").append(sum.getProductId().getId());
			List<WOMProduceTaskActive> ectActives= produceTaskActiveService.getProduceTaskActives
					(sBuilder.toString(), null);
			BigDecimal addNum=new BigDecimal("0");
			for(WOMProduceTaskActive a:ectActives){
				BigDecimal oneNum=a.getPlanNum();
				addNum=addNum.add(oneNum);
			}
			sum.setPlanNum(addNum);
			produceMaterialSumDao.save(sum);
		}
	}
	//当启用物品批号时，保存重新生成汇总信息
	private void updateSumBatch(WOMProduceTask produceTask){
		//如果启用批号
		//删除原纪录  --用料汇总
		List<WOMProduceMaterialSum> produceMaterialSums = produceMaterialSumService.getProduceMaterialSums("headId="+produceTask.getId(), null);
		if(produceMaterialSums!=null){
			for (WOMProduceMaterialSum womProduceMaterialSum : produceMaterialSums) {
				produceMaterialSumDao.createNativeQuery("delete wom_produce_material_sums where ID = ?", womProduceMaterialSum.getId()).executeUpdate();
				produceMaterialSumDao.flush();
			}
		}
		//找到所有活动--指令单活动
		List<WOMProduceTaskActive> taskActives = produceTaskActiveService.getProduceTaskActives("headID="+produceTask.getId(), null);
		if(taskActives!=null){
			List<WOMProduceMaterialSum> materialSumList = new ArrayList<WOMProduceMaterialSum>();//用料汇总
			for (WOMProduceTaskActive womProduceTaskActive : taskActives) {
				//过滤投料配料之外的工序
				if(womProduceTaskActive.getActiveType()!=null  && !( womProduceTaskActive.getActiveType().getId().equals("activeType/activeType2")
						||  womProduceTaskActive.getActiveType().getId().equals("activeType/activeType3") ||womProduceTaskActive.getActiveType().getId().equals("activeType/activeType6")) ){
					continue;
				}
				//过滤机动投配料
				if(womProduceTaskActive.getProductId()==null){
					continue;
				}
				WOMProduceMaterialSum materialSum=new WOMProduceMaterialSum();
				materialSum.setHeadId(produceTask);
				materialSum.setTableInfoId(produceTask.getTableInfoId());
				materialSum.setProductId(womProduceTaskActive.getProductId());
				//性质
				if(womProduceTaskActive.getProperty()!=null){
					materialSum.setProperty(womProduceTaskActive.getProperty());
				}
				//计划用量
				if(womProduceTaskActive.getPlanNum()!=null){
					materialSum.setPlanNum(womProduceTaskActive.getPlanNum());
				}
				if(womProduceTaskActive.getBatchNumObj()!=null){//物料批号
					materialSum.setBatchNum(womProduceTaskActive.getBatchNumObj().getBatchText());
				}
				//过滤重复物品，数量相加
				if(materialSumList!=null && materialSumList.size()!=0){
					boolean isExit= false;
					for (WOMProduceMaterialSum womProduceMaterialSum : materialSumList) {
						//同物品，同批号时  数量相加
						if(materialSum.getProductId()!=null && materialSum.getBatchNum()!=null && materialSum.getPlanNum()!=null){//非空校验
							if(womProduceMaterialSum.getProductId()!=null && womProduceMaterialSum.getProductId().getId()==materialSum.getProductId().getId() && womProduceMaterialSum.getBatchNum()!=null && womProduceMaterialSum.getBatchNum().equals(materialSum.getBatchNum())  && womProduceMaterialSum.getProperty()==materialSum.getProperty()){
								womProduceMaterialSum.setPlanNum(womProduceMaterialSum.getPlanNum().add(materialSum.getPlanNum()));
								if(womProduceMaterialSum.getStandardNum()!=null&&materialSum.getStandardNum()!=null){
									womProduceMaterialSum.setStandardNum(womProduceMaterialSum.getStandardNum().add(materialSum.getStandardNum()));
								}
								isExit = true;
								break;
							}
						}
						//同物品，批号为空，数量相加
						if(materialSum.getProductId()!=null && materialSum.getBatchNum()==null && materialSum.getPlanNum()!=null){//非空校验
							if(womProduceMaterialSum.getProductId()!=null && womProduceMaterialSum.getProductId().getId()==materialSum.getProductId().getId() && womProduceMaterialSum.getBatchNum()==null && womProduceMaterialSum.getProperty()==materialSum.getProperty()){
								womProduceMaterialSum.setPlanNum(womProduceMaterialSum.getPlanNum().add(materialSum.getPlanNum()));
								if(womProduceMaterialSum.getStandardNum()!=null&&materialSum.getStandardNum()!=null){
									womProduceMaterialSum.setStandardNum(womProduceMaterialSum.getStandardNum().add(materialSum.getStandardNum()));
								}
								isExit = true;
								break;
							}
						}
					}
					if(!isExit){
						materialSumList.add(materialSum);
					}
				}else if(materialSumList!=null && materialSumList.size()==0 && womProduceTaskActive.getPlanNum()!=null){
					materialSumList.add(materialSum);
				}
			}
			for (WOMProduceMaterialSum womProduceMaterialSum : materialSumList) {
				produceMaterialSumDao.save(womProduceMaterialSum);
			}
			produceMaterialSumDao.flush();
			produceMaterialSumDao.clear();
		}
	}

	/**
	 * 生效时执行，生成批次信息
	 * @param produceTask 指令单
	 *
	 */
	@Override
	public void setBatch(WOMProduceTask produceTask) {
		//生成批号记录
		PublicSetBatchInfo batchInfo = new PublicSetBatchInfo();
		batchInfo.setBatchNum(produceTask.getProductBatchNum());
		batchInfo.setProduct(produceTask.getProductId());
		batchInfo.setSourceType((SystemCode) systemCodeService.getSystemCode("publicSetSourceType/04"));
		batchInfo.setCheckState((SystemCode) systemCodeService.getSystemCode("publicSetCheckState/02"));
		batchInfo.setPassState((SystemCode) systemCodeService.getSystemCode("publicSetPassState/02"));
		batchInfo.setIsAvailable(false);
		batchInfoService.saveBatchInfoData(batchInfo);

		//生成批次处理信息
		PublicSetBatchDeal batchDealinfo = new PublicSetBatchDeal();
		batchDealinfo.setBatchNum(produceTask.getProductBatchNum());
		batchDealinfo.setProduct(produceTask.getProductId());
		batchDealinfo.setDealDate(new Date());
		batchDealinfo.setAmount(produceTask.getProductNum());
		batchDealinfo.setDealStaff((Staff)getCurrentUser().getReferenceStaff());
		batchDealinfo.setDealDept(((Position) ((Staff)getCurrentUser().getReferenceStaff()).getMainPosition()).getDepartment());
		batchDealinfo.setDealTableID(produceTask.getTableInfoId());
		batchDealinfo.setDealTableNo(produceTask.getTableNo());
		batchDealinfo.setSourceBatchNum(produceTask.getProductBatchNum());
		batchDealinfo.setDealType((SystemCode) systemCodeService.getSystemCode("publicSetDealWay/produceTask"));
		if(produceTask.getTaskType().getId().equals("womTaskType/type1")){//制造指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_makeTaskView","WOM_7.5.0.0_produceTask_makeTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type2")){//包装指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_packageTaskView","WOM_7.5.0.0_produceTask_packageTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type3")){//返工指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_reWorkView","WOM_7.5.0.0_produceTask_reWorkList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type4")){//回收指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_recycleTaskView","WOM_7.5.0.0_produceTask_recycleTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type5")){//重新加工指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_reProcessView","WOM_7.5.0.0_produceTask_reProcessList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type6")){//其他指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_otherTaskView","WOM_7.5.0.0_produceTask_otherTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type7")){//换包装指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_changePackageView","WOM_7.5.0.0_produceTask_changePackageList", produceTask.getTableInfoId(), produceTask.getId()));
		}
		batchDealinfo.setRemark("指令单新增批号");
		batchDealinfo.setTableState((SystemCode) systemCodeService.getSystemCode("publicSetTableState/01"));
		batchDealService.saveBatchDealInfoData(batchDealinfo);
	}

	/**
	 * 删除批次信息,处理记录
	 * @param productBatchNum 批号
	 */
	@Override
	public void delBatchNum(String productBatchNum) {
		batchInfoService.deletebatchInformationBybatchNum(productBatchNum);
	}

	/**
	 * 删除批次信息
	 * @param productBatchNum 批号
	 */
	@Override
	public void delBatch(String productBatchNum) {
		batchInfoService.deletebatchInfoBybatchNum(productBatchNum);
	}

	/**
	 * 判断是否弃审 已经历弃审返回false
	 * produceTask 指令单
	 */
	@Override
	public boolean checkRecall(WOMProduceTask produceTask) {
		String sql = "select ID,DEALINFO_TYPE,TABLE_INFO_ID from WOM_PRODUCE_TASKS_DI where TASK_DESCRIPTION=? and TABLE_INFO_ID = ? ";
		SQLQuery query = produceTaskDao.createNativeQuery(sql,"ec.flow.retrial",produceTask.getTableInfoId());
		List<Object[]> list_produceTask=query.list();
		if(list_produceTask!=null && !list_produceTask.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	/**
	 * 生成批次处理信息
	 * produceTask 指令单
	 */
	@Override
	public void addDealBatch(WOMProduceTask produceTask, SystemCode tableState, String remark) {
		//生成批次处理信息
		PublicSetBatchDeal batchDealinfo = new PublicSetBatchDeal();
		batchDealinfo.setBatchNum(produceTask.getProductBatchNum());
		batchDealinfo.setProduct(produceTask.getProductId());
		batchDealinfo.setDealDate(new Date());
		batchDealinfo.setAmount(produceTask.getProductNum());
		batchDealinfo.setDealStaff((Staff)getCurrentUser().getReferenceStaff());
		batchDealinfo.setDealDept(((Position) ((Staff)getCurrentUser().getReferenceStaff()).getMainPosition()).getDepartment());
		batchDealinfo.setDealTableID(produceTask.getTableInfoId());
		batchDealinfo.setDealTableNo(produceTask.getTableNo());
		batchDealinfo.setDealType((SystemCode) systemCodeService.getSystemCode("publicSetDealWay/produceTask"));
		batchDealinfo.setSourceBatchNum(produceTask.getProductBatchNum());
		batchDealinfo.setTableState(tableState);
		batchDealinfo.setRemark(remark);
		if(produceTask.getTaskType().getId().equals("womTaskType/type1")){//制造指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_makeTaskView","WOM_7.5.0.0_produceTask_makeTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type2")){//包装指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_packageTaskView","WOM_7.5.0.0_produceTask_packageTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type3")){//返工指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_reWorkView","WOM_7.5.0.0_produceTask_reWorkList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type4")){//回收指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_recycleTaskView","WOM_7.5.0.0_produceTask_recycleTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type5")){//重新加工指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_reProcessView","WOM_7.5.0.0_produceTask_reProcessList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type6")){//其他指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_otherTaskView","WOM_7.5.0.0_produceTask_otherTaskList", produceTask.getTableInfoId(), produceTask.getId()));
		}else if(produceTask.getTaskType().getId().equals("womTaskType/type7")){//换包装指令单
			batchDealinfo.setDealTableURL(batchDealService.getOpenViewUrl("WOM_7.5.0.0_produceTask_changePackageView","WOM_7.5.0.0_produceTask_changePackageList", produceTask.getTableInfoId(), produceTask.getId()));
		}
		batchDealService.saveBatchDealInfoData(batchDealinfo);
	}

	/**
	 * 更新批次信息
	 * produceTask 指令单
	 */
	@Override
	public void updateBatch(WOMProduceTask produceTask) {
		produceTaskDao.flush();
		produceTaskDao.clear();
		PublicSetBatchInfo batchInfo = batchInfoService.getbatchInformationBybatchNum(produceTask.getProductBatchNum());
		if(produceTask.getProductId()!=null && produceTask.getProductId().getId()!=null){
			batchInfo.setProduct(produceTask.getProductId());
		}
		batchInfo.setSourceType((SystemCode) systemCodeService.getSystemCode("publicSetSourceType/04"));
		batchInfo.setCheckState((SystemCode) systemCodeService.getSystemCode("publicSetCheckState/02"));
		batchInfo.setPassState((SystemCode) systemCodeService.getSystemCode("publicSetPassState/02"));
		batchInfo.setIsAvailable(false);
		batchInfoService.updateBatchInfoData(batchInfo);
	}

	@Override
	public WOMProduceTask reloadProduceTask(Long id) {
		produceTaskDao.flush();
		produceTaskDao.clear();
		return produceTaskDao.load(id);
	}

	/**
	 * 通过批量指令单的明显ID获取指令单
	 */
	@Override
	public WOMProduceTask getProduceTaskByBatchID(Long batchId) {
		List<WOMProduceTask> tasks=this.getProduceTasks("tasksID="+batchId+"and valid=1", null);
		if(tasks.size()>0){
			return tasks.get(0);
		}
		return null;
	}

	/*mes发起请求同步批控*/
	/*-- webService start  --*/
	@Autowired
	private RMInterfaceSyncLogService rmInterFaceSyncLogService;
	private String interfaceURL;

	private String getUrl(String systemCodeId){
		String sql = "select CODE_DESA from " + SystemCode.TABLE_NAME + " where id = ?";
		String url = produceTaskDao.createNativeQuery(sql, systemCodeId).uniqueResult().toString();
		return url;
	}

	//根据参数插入工单日志
	public void insertLog(List<Map<String,String>> maplist, Boolean dealError){
		if(!dealError){//不是错误日志人工处理时才新增记录
			for (Map<String, String> data : maplist) {
				RMInterfaceSyncLog interfaceLog=null;
				String logid=data.get("logid");
				if(null!=logid&&!"".equals(logid)){
					interfaceLog=rmInterFaceSyncLogService.getInterfaceSyncLog(Long.parseLong(logid));
				}
				if(null==interfaceLog){
					interfaceLog=new RMInterfaceSyncLog();
				}
				interfaceLog.setLogSynFlag(Boolean.valueOf(data.get("logSynFlag")));
				interfaceLog.setLogID(data.get("logID"));
				interfaceLog.setLogTypeDes(data.get("logTypeDes"));
				interfaceLog.setLogType(data.get("logType"));
				interfaceLog.setLogDate(new Date());
				interfaceLog.setLogOperate((String)data.get("logOperate"));
				interfaceLog.setLogFault((String)data.get("logFault"));
				if(null!=data.get("logIsIgnore")){
					interfaceLog.setLogIsIgnore(Boolean.parseBoolean(data.get("logIsIgnore")));
				}
				if(null==getCurrentCompanyId()){
					interfaceLog.setCid(Long.parseLong("1000"));
				}
				rmInterFaceSyncLogService.saveLog(interfaceLog);
			}
		}
	}
	//组织配方工单日志参数
	public List<Map<String,String>> setFormulaLogMap(Boolean isSuccess,String ids,String returnValue,String operationType,String logids){
		List<Map<String,String>> maplist=new ArrayList<Map<String,String>>();
		if(ids!=null&&ids.length()>0){
			String[] idarr=ids.split(",");
			String[] logidarr=null;
			if(null!=logids&&!"".equals(logids)){
				logidarr=logids.split(",");
			}
			maplist=new ArrayList<Map<String,String>>();
			for (int i=0;i<idarr.length;i++) {
				WOMProduceTask prodTask = null;
				//prodTask = getProduceTask(Long.parseLong(idarr[i]));
				prodTask = produceTaskDao.load(Long.parseLong(idarr[i]));
				if(null!=prodTask){
					Map<String,String> logMap = new HashMap<String,String>();
					logMap.put("logSynFlag", isSuccess.toString());
					logMap.put("logID", prodTask.getId().toString());
					logMap.put("logTypeDes", prodTask.getProductBatchNum());
					logMap.put("logType", "workOrder");
					logMap.put("logOperate", operationType);
					if(!isSuccess && prodTask.getStatus()==99){
						logMap.put("logIsIgnore", "true");
					}
					if(isSuccess){
						logMap.put("logFault", "success");
					}else{
						logMap.put("logFault", returnValue);
					}
					if(null!=logidarr&&null!=logidarr[i]){
						logMap.put("logid", logidarr[i]);
					}
					maplist.add(logMap);
				}
			}
		}
		return maplist;
	}

	//新增工单的时候向批控同步控制配方头
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean addProduceTaskSync(String ids,String logids){
		//webservice地址
		//interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";
		boolean isSuccess = false;
		List<Map<String,String>> logMap=new ArrayList<>();
		try {
			if(null==ids||"".equals(ids)){
				return false;
			}
			String[] idarr=ids.split(",");
			WOMProduceTask prodTask = new WOMProduceTask();
			for (String id : idarr) {
				prodTask = getProduceTask(Long.parseLong(id));
				if(!prodTask.getBatchContral()){
					return true;
				}
				if(null!=prodTask.getBatchProdTaskID() && !"".equals(prodTask.getBatchProdTaskID())){//是否已有批控id,如果已有说明已同步，走更新方法
					return updateProdTaskSync(ids,logids,1);
				}
				interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId())!=null&&getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length()>0?
						"http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
			}
			String produceTaskJson = getStringFromJsonFormula(idarr,1);//拼接json
			produceTaskJson = prodTask.getFormularId().getInterfaceUrl().getId() + "##" + produceTaskJson;
			Map<String,String> createMap = new HashMap<String,String>();
			createMap.put("workOrder", produceTaskJson);
			String refProduceTask = rmInterFaceSyncLogService.sendSmsPost(interfaceURL+"workOrder",createMap);
			isSuccess = false;
			if(refProduceTask != null && refProduceTask.length() > 0 && !refProduceTask.contains("not change, need not save.")){
				isSuccess = setProduceTaskIDsForsync(refProduceTask, prodTask);
			}
			logMap = setFormulaLogMap(isSuccess,ids,refProduceTask,"produceTaskAdd",logids);
			insertLog(logMap, false);
		} catch (Exception e) {
			log.error("批控异常返回日志 ：{} " , e.getMessage());
			for (Map<String, String> stringMap : logMap) {
				if (!StringUtils.equals(stringMap.get("logFault"),"success")) {
					log.error("批控异常 ：{} " , stringMap.get("logFault"));
				}
			}
			throw new BAPException("新增批控出错！");
		}
		return isSuccess;
	}

	//根据配方id返回对应配方json格式的参数
	public  String getStringFromJsonFormula(String[] ids, int opStat) {
		if(null==ids){
			return "";
		}
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (String id : ids) {
			WOMProduceTask prodTask = getProduceTask(Long.parseLong(id));
			if(null!=prodTask){
				sb.append("{");
				if(prodTask.getBatchProdTaskID()!=null && !"".equals(prodTask.getBatchProdTaskID())){
					sb.append("\"ID\":"+prodTask.getBatchProdTaskID()+",");
				}
				sb.append("\"Name\":\""+prodTask.getProductBatchNum()+"\",");
				sb.append("\"Product\":\""+prodTask.getProductId().getProductName()+"\",");
				//sb.append("\"Recipe\":\""+prodTask.getFormularId().getCode()+"\",");
				sb.append("\"Recipe\":\""+prodTask.getFormularId().getBatchFormulaCode()+"\",");
				sb.append("\"PlanYield\":"+prodTask.getProductNum()+",");
				//sb.append("\"Mode\":1,");
				sb.append("\"OpStat\":"+opStat+",");
				sb.append("\"Remark\":\""+prodTask.getRemark()+"\",");

				//interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId())!=null&&getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length()>0?
				//		"http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";

				String batchFactoryId = getBatchFactoryId(prodTask.getFactoryId().getCode(), prodTask.getFormularId().getInterfaceUrl()!=null?prodTask.getFormularId().getInterfaceUrl().getId():null);
				sb.append("\"Cell\":"+ batchFactoryId);
				//sb.append("\"Cell\":\""+ prodTask.getFactoryId().getCode()+"\"");
				sb.append("},");
			}
		}
		String rtn = sb.toString().substring(0, sb.toString().length()-1)+"]";
		return rtn;
	}

	@Autowired
	private RMBatchFactoryService batchFactoryService;

	//mes工厂模型没有批控生产线关联字段，先从本地表查询出所有批控的生产线，如果没有在通过批控接口查，再用工厂的code获取到批控中生产线的id
	private String getBatchFactoryId(String factoryCode, String interfaceUrl){
		//webservice地址
		String batchFactoryId = null;
		if(interfaceUrl != null && interfaceUrl.length() > 0) {
			//先查询批控工厂表中是否有对应的数据
			RMBatchFactory batchFactory = batchFactoryService.findEntityByProperty("code",interfaceUrl);
			if(batchFactory != null && batchFactory.getFactoryValue() != null && batchFactory.getFactoryValue().length() > 0){
				batchFactoryId = checkBatchFactoryId(factoryCode, batchFactory.getFactoryValue());
			}

			if(batchFactoryId != null){
				return batchFactoryId;
			}else {
				interfaceURL = getUrl(interfaceUrl) != null && getUrl(interfaceUrl).length() > 0 ? "http://" + getUrl(interfaceUrl) + ":8081/" : "http://localhost:8081/";
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
							if(batchFactory != null && batchFactory.getId() != null ){
								batchFactory.setFactoryValue(refFactory);
							}else{
								batchFactory = new RMBatchFactory();
								batchFactory.setCode(interfaceUrl);
								batchFactory.setFactoryValue(refFactory);
							}
							batchFactoryService.saveBatchFactory(batchFactory, null);

							batchFactoryId = checkBatchFactoryId(factoryCode, refFactory);
						} else {
							throw new BAPException("找不到对应工厂模型");
						}
					} catch (JSONException e) {
						log.error(e.getMessage(), e);
						throw new BAPException(e.getMessage(), e);
					}
				} else {
					throw new BAPException("找不到对应工厂模型");
				}
			}
		}
		if(batchFactoryId != null){
			return batchFactoryId;
		}else{
			throw new BAPException("找不到对应工厂模型");
		}
	}

	private String checkBatchFactoryId(String factoryCode, String factoryValue){
		String batchFactoryId = null;
		try {//循环验证生产线对应的mes中的工厂
			JSONArray sobjarr = new JSONArray(factoryValue);
			if (sobjarr != null) {
				for (int i = 0; i < sobjarr.length(); i++) {
					JSONObject cxObj = sobjarr.getJSONObject(i);
					String cxName = cxObj.getString("Name");//流水线名称，即mes中工厂的code
					if (cxName != null && factoryCode.equals(cxName)) {
						batchFactoryId = cxObj.getString("ID");
						return batchFactoryId;
					}
					String dyStr = cxObj.toString();
					if (dyStr != null && dyStr.length() > 0 && dyStr.contains("UnitEquips")) {
						String refDy = cxObj.getString("UnitEquips");
						JSONArray dyArr = new JSONArray(refDy);
						if (dyArr != null) {
							for (int j = 0; j < dyArr.length(); j++) {
								JSONObject dyObj = dyArr.getJSONObject(j);
								String dyName = dyObj.getString("Name");//单元名称，即mes中工厂的code
								if (dyName != null && factoryCode.equals(dyName)) {
									batchFactoryId = dyObj.getString("ID");
									return batchFactoryId;
								}
							}
						}
					}
				}
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		return batchFactoryId;
	}

	//批控和mes的配方的ID做关联
	public boolean setProduceTaskIDsForsync(String data, WOMProduceTask prodTask){
		if(null==data||"".equals(data)){
			return false;
		}
		JSONObject sobj;
		try {
			sobj = new JSONObject(data);
			String resultFlag = sobj.getString("dealSuccessFlag");
			String refProdTask = sobj.getString("data");
			if("true".equals(resultFlag)){
				JSONArray sobjarr = new JSONArray(refProdTask);
				if(sobjarr != null){
					for (int i = 0; i < sobjarr.length(); i++) {
						JSONObject prodTaskObj=sobjarr.getJSONObject(i);
						//WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("productBatchNum",prodTaskObj.getString("Name")));
						prodTask.setInterfaceUrl(prodTask.getFormularId().getInterfaceUrl().getId());//数据来源
						prodTask.setBatchProdTaskID(prodTaskObj.getString("ID"));//同步工单
						produceTaskDao.save(prodTask);
						String refProdTaskUnit = prodTaskObj.getString("Units");
						JSONArray arrProdTaskUnit = new JSONArray(refProdTaskUnit);
						if(arrProdTaskUnit != null){
							for(int j = 0; j < arrProdTaskUnit.length(); j++){
								JSONObject prodTaskUnitObj = arrProdTaskUnit.getJSONObject(j);
								String unitSql = "select id from RM_FORMULA_PROCESSES where BATCH_UNITID = ? and VALID = 1 and FORMULA_ID = ?";
								List<Object> unitIds = produceTaskDao.createNativeQuery(unitSql, prodTaskUnitObj.getLong("RU_ID"), prodTask.getFormularId().getId()).list();
								if(unitIds != null && unitIds.size() > 0){
									for(Object unitIdObj : unitIds){
										Long unitId = Long.valueOf(unitIdObj.toString());
										RMFormulaProcess formularProcess = formulaProcessService.getFormulaProcess(unitId.longValue());
										WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true),
												Restrictions.eq("formularProcess",formularProcess),Restrictions.eq("headId",prodTask));
										if(produceTaskProcess == null){
											throw new BAPException("找不到对应的工序");
										}else{
											produceTaskProcess.setBatchUnitID(prodTaskUnitObj.getString("ID"));//同步工序
											produceTaskProcessDao.save(produceTaskProcess);
										}
										String refProdTaskOperations = prodTaskUnitObj.getString("Operations");
										JSONArray arrProdTaskOperations = new JSONArray(refProdTaskOperations);
										if(arrProdTaskUnit != null){
											for(int k = 0; k < arrProdTaskOperations.length(); k++){
												JSONObject prodTaskOperationsObj = arrProdTaskOperations.getJSONObject(k);
												String operationId = prodTaskOperationsObj.getString("ID");
												String refProdTaskPhase = prodTaskOperationsObj.getString("Phases");
												JSONArray arrProdTaskPhase = new JSONArray(refProdTaskPhase);
												if(arrProdTaskPhase != null){
													for(int l = 0; l < arrProdTaskPhase.length(); l++){
														JSONObject prodTaskPhaseObj = arrProdTaskPhase.getJSONObject(l);
														String rmActiveIdSql = "select id from RM_FORMULA_PROCESS_ACTIVES where BATCH_PHASEID = ?  and VALID = 1 and FORMULA_ID = ?";
														List<Object> rmActiveIds = produceTaskDao.createNativeQuery(rmActiveIdSql, prodTaskPhaseObj.getLong("RP_ID"),
																prodTask.getFormularId().getId()).list();
														if(rmActiveIds != null && rmActiveIds.size() > 0){
															for(Object rmActiveId : rmActiveIds){
																Long activeId = Long.valueOf(rmActiveId.toString());
																RMFormulaProcessActive active = formulaProcessActiveService.getFormulaProcessActive(activeId);
																WOMProduceTaskActive produceTaskActive = produceTaskActiveDao.findEntityByCriteria(Restrictions.eq("valid", true),
																		Restrictions.eq("activeId",active),Restrictions.eq("orderProcessId",produceTaskProcess));
																if(produceTaskActive == null){
																	throw new BAPException("找不到对应的活动");
																}else{
																	String batchPhaseId = prodTaskPhaseObj.getString("ID");
																	produceTaskActive.setOperartionID(operationId);
																	produceTaskActive.setBatchPhaseID(batchPhaseId);//同步活动
																	produceTaskActiveDao.save(produceTaskActive);
																}
															}
														}else{
															throw new BAPException("找不到对应的活动");
														}
													}
												}
											}
										}
									}
								}else{
									throw new BAPException("找不到对应的工序");
								}
							}
						}
					}
				}
				return true;
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		return false;
	}

	//修改工单的时候向批控同步配方头
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean updateProdTaskSync(String ids,String logids,int opStat){
		//获取webservice地址
		//interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";
		boolean isSuccess= false;
		List<Map<String,String>> logMap= new ArrayList<>();
		try {
			if(null==ids){
				return false;
			}else{
				if(ids.length()<=0){
					return false;
				}
			}
			isSuccess = false;
			String refFormula=null;
			String bformulaid=returnBatchId(ids);//更具mes中的id获取批控的Id
			//boolean issync=checkIsSync(bformulaid);//检查是否已经同步
			//if(issync){
			String[] idarr = ids.split(",");
			WOMProduceTask prodTask = getProduceTask(Long.parseLong(idarr[0]));

			interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId())!=null&&getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length()>0?
					"http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";

			String produceTaskJson = getStringFromJsonFormula(idarr,opStat);//转成json格式
			produceTaskJson = prodTask.getFormularId().getInterfaceUrl().getId() + "##" + produceTaskJson;
			Map<String,String> createMap = new HashMap<String,String>();
			createMap.put("workOrder", produceTaskJson);
			createMap.put("_method", "put");
			refFormula=rmInterFaceSyncLogService.sendSmsPost(interfaceURL+"workOrder",createMap);//发送webservice请求
			if(refFormula != null && refFormula.length() > 0 && !refFormula.contains("not change, need not save.")){
				JSONObject sobj;
				try {
					sobj = new JSONObject(refFormula);
					String resultFlag = sobj.getString("dealSuccessFlag");
					if("true".equals(resultFlag)){
						isSuccess= true;
					}
				} catch (JSONException e) {
					log.error(e.getMessage(), e);
					throw new BAPException(e.getMessage(), e);
				}
			}else if(refFormula != null && refFormula.length() > 0 && refFormula.contains("not change, need not save.")){
				isSuccess = true;
			}
		/*}else{
			refFormula=InternationalResource.get("RM.rmFormula.Prompt");
			isSuccess= false;
		}*/
			logMap = setFormulaLogMap(isSuccess,ids,refFormula,"produceTaskUpdate",logids);
			insertLog(logMap, false);
		} catch (Exception e) {
			log.error("批控异常返回日志 ：{} " , e.getMessage());
			for (Map<String, String> stringMap : logMap) {
				if (!StringUtils.equals(stringMap.get("logFault"),"success")) {
					log.error("批控异常 ：{} " , stringMap.get("logFault"));
				}
			}
			throw new BAPException("修改批控信息出错！");
		}
		return isSuccess;
	}

	//很据MES的配方ID返回对应的批控配方ID
	public String returnBatchId(String ids){
		String[] mesids=null;
		String batchids="";
		if(null!=ids&&!"".equals(ids)){
			mesids=ids.split(",");
			for (String id : mesids) {
				WOMProduceTask prodTask = produceTaskDao.load(Long.parseLong(id));
				if(null!=prodTask){
					batchids+=prodTask.getBatchProdTaskID()+",";
				}
			}
		}
		if(batchids!=null&&batchids.endsWith(",")){
			batchids = batchids.substring(0, batchids.toString().length()-1);
		}
		return batchids;
	}

	//检查工单是否同步
	public boolean checkIsSync(String batchids){
		String[] batchidarr=null;
		if(null!=batchids&&!"".equals(batchids)){
			batchidarr=batchids.split(",");
			for (String id : batchidarr) {
				WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("batchProdTaskID",id),Restrictions.eq("status", 99));
				if(null!=prodTask){
					return false;
				}
			}
		}
		return true;
	}

	//删除工单的时候调用
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean deleteProdTaskSync(String ids,String logids){
		//interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";
		boolean isSuccess= false;
		List<Map<String,String>> logMap= new ArrayList<>();
		try {
			if(null==ids||"".equals(ids)){
				return false;
			}
			WOMProduceTask prodTask = getProduceTask(Long.valueOf(ids));
			interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId())!=null&&getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length()>0?
					"http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";

			isSuccess = false;
			String refFormula=null;
			String bformulaid=returnBatchId(ids);
			boolean issync=checkIsSync(bformulaid);
			if(issync){
				String deleteurl=interfaceURL+"workOrder"+"/"+bformulaid;
				refFormula=rmInterFaceSyncLogService.sendSmsDelete(deleteurl);//发送webservice请求
				JSONObject sobj;
				try {
					sobj = new JSONObject(refFormula);
					String resultFlag = sobj.getString("dealSuccessFlag");
					if("true".equals(resultFlag)){
						isSuccess= true;
					}
				} catch (JSONException e) {
					log.error(e.getMessage(), e);
					throw new BAPException(e.getMessage(), e);
				}
			}else{
				refFormula=InternationalResource.get("批控不存在该工单");
				isSuccess= false;
			}
			logMap = setFormulaLogMap(isSuccess,ids,refFormula,"produceTaskDelete",logids);
			insertLog(logMap, false);
		} catch (Exception e) {
			log.error("批控异常返回日志 ：{} " , e.getMessage());
			for (Map<String, String> stringMap : logMap) {
				if (!StringUtils.equals(stringMap.get("logFault"),"success")) {
					log.error("批控异常 ：{} " , stringMap.get("logFault"));
				}
			}
			throw new BAPException("删除批控信息时出错！");
		}
		return isSuccess;
	}

	//结束phase
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean stopPhaseSync(String ids, String logids){
		Boolean isSuccess = null;
		List<Map<String,String>> logMap = null;
		try {
			if(null==ids||"".equals(ids)){
				return false;
			}
			//interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";

			WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogService.getBatchPhaseExelog(Long.valueOf(ids));
			interfaceURL = getUrl(batchPhaseExelog.getTaskID().getFormularId().getInterfaceUrl().getId())!=null&&getUrl(batchPhaseExelog.getTaskID().getFormularId().getInterfaceUrl().getId()).length()>0?
					"http://" + getUrl(batchPhaseExelog.getTaskID().getFormularId().getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
			isSuccess = false;
			StringBuilder phaseJson = new StringBuilder("[{");
			phaseJson.append("\"BatchID\":" + batchPhaseExelog.getTaskID().getBatchProdTaskID() + ",");
			phaseJson.append("\"UnitID\":" + batchPhaseExelog.getTaskProcessID().getBatchUnitID() + ",");
			phaseJson.append("\"OpID\":" + batchPhaseExelog.getOperartionID() + ",");
			phaseJson.append("\"PhaseID\":" + batchPhaseExelog.getPhaseID());
			phaseJson.append("}]");
			Map<String,String> createMap = new HashMap<String,String>();
			createMap.put("phase", phaseJson.toString());
			String refFormula = rmInterFaceSyncLogService.sendSmsPost(interfaceURL+"phase",createMap);
			if(refFormula.contains("dealSuccessFlag=true")){
				isSuccess= true;
			}
			//List<Map<String,String>> logMap= setFormulaLogMap(isSuccess,ids,refFormula,"stopPhase",logids);
			//insertLog(logMap, false);
			//List<Map<String,String>> logMap = setWorkOrderMqLogMap(isSuccess,ids,"结束批控Phase失败,jsonData:"+ids,"stopPhase",null,null, logids);
			if(isSuccess){
				logMap = setWorkOrderMqLogMap(isSuccess,ids,"结束批控Phase成功","stopPhase",null,null, batchPhaseExelog.getPhaseID());
			}else{
				logMap = setWorkOrderMqLogMap(isSuccess,ids,"结束批控Phase失败,jsonData:"+ids,"stopPhase",null,"false", batchPhaseExelog.getPhaseID());
			}

			if(logids != null && logids.length() > 0){
				insertLog(logMap, true);
			}else{
				insertLog(logMap, false);
			}
		} catch (Exception e) {
			log.error("批控异常返回日志 ：{} " , e.getMessage());
			for (Map<String, String> stringMap : logMap) {
				if (!StringUtils.equals(stringMap.get("logFault"),"success")) {
					log.error("批控异常 ：{} " , stringMap.get("logFault"));
				}
			}
			throw new BAPException("结束批控Phase失败!");
		}
		return isSuccess;
	}
	/*-- webService end --*/

	/*批控发起请求同步mes*/
	/*-- mq start  --*/
	@Autowired
	private RMMQDealinfoService rMMQDealinfoService;
	@Autowired
	private MESBasicProductService basicProductService;
	@Resource
	private WOMInterfaceSelfService interfaceSelfService;
	@Resource
	private WOMInterfaceService interfaceService;

	private void deleteMq(RMMQDealinfo di){//把mq记录的value改成0,即删除
		String sql = "update rm_mqdealinfos set valid = 0 where id = ?";
		produceTaskDao.createNativeQuery(sql, di.getId()).executeUpdate();
	}

	@Override
	public void dealMQDate(){
		List<RMMQDealinfo> mqInfo = rMMQDealinfoService.getMQWOMDetail();
		if(mqInfo != null && mqInfo.size() > 0){
			for(RMMQDealinfo di : mqInfo){
				String data = di.getMqValue();
				String messageId = data.substring(0, 8);
				String body = data.substring(8, data.length());
				Boolean isSuccess = false;
				List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
				if(messageId.equals("00020001")){//batch层面的操作
					if(body != null && body.contains("ExeStat") && body.contains("ExeStatOld") ){//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
						isSuccess = dealMqBatchDate(di,false);
					}
					deleteMq(di);
				}else if(messageId.equals("00020002")){//unit层面
					if(body != null && body.contains("ExeStat") && body.contains("ExeStatOld") ){//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
						isSuccess = dealMqUnitDate(di,false);
					}else if(body != null){//如果有设备编码，则修改相关数据的设备
						isSuccess = updateEquipment(di, false);
					}
					deleteMq(di);
				}else if(messageId.equals("00020003")){//operation层面
					isSuccess = dealMqOperationDate(di,false);
					deleteMq(di);
				}else if(messageId.equals("00020004")){//phase层面
					if(body != null && body.contains("ExeStat") && body.contains("ExeStatOld") ){//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
						isSuccess = dealMqPhaseDate(di,false);
					}else{
						isSuccess = dealMqPhaseDateChange(di,false);
					}
					deleteMq(di);
				}else if(messageId.equals("00020005")){//produceTaskSyn表体信息
					//isSuccess = updateWorkOrderByMqDate(body,false);
					deleteMq(di);
				}else if(messageId.equals("00020006")){//工单新增，不关注
					deleteMq(di);
				}else if(messageId.equals("00020007")){//工单已删除，不关注
					deleteMq(di);
				}
			}
		}
		log.info("deal mq complete");
	}


	//组织配方工单日志参数
	public List<Map<String,String>> setWorkOrderMqLogMap(Boolean isSuccess,String ids,String returnValue,String operationType,String logids,String isIgnore,String logTypeDes){
		List<Map<String,String>> maplist=new ArrayList<Map<String,String>>();
		String[] logidarr=null;
		if(null!=logids&&!"".equals(logids)){
			logidarr=logids.split(",");
		}
		maplist=new ArrayList<Map<String,String>>();
		Map<String,String> logMap = new HashMap<String,String>();
		logMap.put("logSynFlag", isSuccess.toString());
		logMap.put("logID", logids);
		logMap.put("logType", "workOrder");
		logMap.put("logOperate", operationType);
		logMap.put("logIsIgnore", isIgnore);
		logMap.put("logTypeDes", logTypeDes);
		if(isSuccess){
			logMap.put("logFault", "success");
		}else{
			logMap.put("logFault", returnValue);
		}
		maplist.add(logMap);
		return maplist;
	}



	//fileTime2JaveTime
	private final static long DIFF_UNIX_WIN_MS = 11644473600000L;
	private final static long MULTIPLE_MS_100NS = 10000;
	public Date Filetime2Date(long llt) {
		llt /= MULTIPLE_MS_100NS;
		llt -= DIFF_UNIX_WIN_MS;
		Date date = new Date();
		date.setTime(llt);
		return date;
	}

	@Autowired
	private MESBasicProductService productService;
	@Autowired
	private MESBasicFactoryModelService factoryModelService;

	public void retrialTable(WOMProduceTask produceTask, Long tableInfoId,String scriptCode) {
		beforeRetrial(produceTask);
		produceTask.setStatus(88);
		produceTaskDao.save(produceTask);
		produceTaskDao.flush(); //如果不flush无法更新effect信息
		ProcessInstance instance = null;
		WOMProduceTaskDealInfo del=getDealInfoEntity(tableInfoId);
		Deployment deployment=taskService.getDeployment(del.getProcessKey(), del.getProcessVersion());
		long deploymentId=deployment.getId();
		//删除流程下所有通知活动的待办
		String hql = "delete Pending p where p.entityCode = ? and p.processKey = ? and p.processVersion = ? and p.activityType = ?";
		produceTaskDao.bulkExecute(hql, new Object[]{"WOM_7.5.0.0_produceTask", del.getProcessKey(), del.getProcessVersion(), "notification"});
		//taskService.completeTaskHistory(tableInfoId);
		List<Transition> transitions=processService.findFirstTransitions(deploymentId);
		WorkFlowVar workFlowVar = new WorkFlowVar();
		workFlowVar.setVariablesProvider(variablesProvider);
		workFlowVar.setModelId(produceTask.getId());
		workFlowVar.setProcessInitiator(produceTask.getCreateStaff().getUser().getId());
		workFlowVar.setTableInfoId(produceTask.getTableInfoId());
		workFlowVar.setDeploymentId(deploymentId);
		workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
		workFlowVar.setInitiatorPositionId(produceTask.getCreatePositionId());
		workFlowVar.setOwnerId(produceTask.getOwnerStaffId());
		workFlowVar.setOwnerPositionId(produceTask.getOwnerPositionId());
		workFlowVar.setTableNo(produceTask.getTableNo());
		workFlowVar.setTableName(WOMProduceTask.TABLE_NAME);
		workFlowVar.setStatus(produceTask);
		workFlowVar.setCrossCompanyFlag(true);
		workFlowVar.setGroupEnabled(false);
		workFlowVar.setOutcome(transitions.get(0).getName());
		workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
		//DealInfo di = taskService.take(null, deploymentId, workFlowVar);
		instance = instanceService.start(deploymentId, null, workFlowVar);
		DealInfo di = taskService.doSaveDealInfo(produceTask, instance, deploymentId, null, workFlowVar);
		WOMProduceTaskDealInfo dl=new WOMProduceTaskDealInfo();
		dl.setActivityName(di.getActivityName());
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
		dl.setUserId(di.getUserId());
		produceTaskDao.saveDealInfo(dl);
		produceTaskDao.createNativeQuery("update EC_TABLE_INFO set STATUS=88 where id=?", produceTask.getTableInfoId()).executeUpdate();
		if(null!=scriptCode&&!"".equals(scriptCode)){
			doScript(scriptCode,produceTask);
		}
		afterRetrial(produceTask);
		//crossCompanyDao.copyAndSaveDealInfo(di, produceTask, creatorService.getStaffFromSession());

	}


	//mes工厂模型没有批控生产线关联字段，先查询出所有批控的生产线，再用批控中生产线的id获取工厂的code
	public String getBatchFactoryCode(String batchFactoryId, String interfaceURL){
		//webservice地址
		String factoryCode = null;
		//interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";

		//先查询批控工厂表中是否有对应的数据
		RMBatchFactory batchFactory = batchFactoryService.findEntityByProperty("code",interfaceURL);
		if(batchFactory != null && batchFactory.getFactoryValue() != null && batchFactory.getFactoryValue().length() > 0){
			factoryCode = checkBatchFactoryCode(batchFactoryId, batchFactory.getFactoryValue());
		}

		if(factoryCode != null){
			return factoryCode;
		} else {
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
						factoryCode = checkBatchFactoryCode(batchFactoryId, refFactory);
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
		}

		if(factoryCode != null){
			return factoryCode;
		}else{
			return null;
		}
	}

	private String checkBatchFactoryCode(String batchFactoryId, String factoryValue){
		String factoryCode2 = null;
		try {//循环验证生产线对应的mes中的工厂
			JSONArray sobjarr = new JSONArray(factoryValue);
			if (sobjarr != null) {
				for (int i = 0; i < sobjarr.length(); i++) {
					JSONObject cxObj = sobjarr.getJSONObject(i);
					String cxId = cxObj.getString("ID");//流水线id
					if(cxId != null && batchFactoryId.equals(cxId)){
						factoryCode2 = cxObj.getString("Name");
						return factoryCode2;
					}
					String dyStr = cxObj.toString();
					if (dyStr != null && dyStr.length() > 0 && dyStr.contains("UnitEquips")) {
						String refDy = cxObj.getString("UnitEquips");
						JSONArray dyArr = new JSONArray(refDy);
						if (dyArr != null) {
							for (int j = 0; j < dyArr.length(); j++) {
								JSONObject dyObj = dyArr.getJSONObject(j);
								String dyId = dyObj.getString("ID");//单元id
								if(dyId != null && batchFactoryId.equals(dyId)){
									factoryCode2 = cxObj.getString("Name");
									return factoryCode2;
								}
							}
						}
					}
				}
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		return batchFactoryId;
	}

	//获取工单详细
	public String getProduceTaskDetailJson(String batchId, String interfaceUrl){
		//根据系统配置项获取webservice地址
		//interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";
		boolean isSuccess=false;
		String geturl=interfaceURL+"workOrder"+"/"+batchId;
		String refFormula=rmInterFaceSyncLogService.sendSmsGet(geturl);
		JSONObject sobj;
		try {
			sobj = new JSONObject(refFormula);
			String resultFlag = sobj.getString("dealSuccessFlag");
			if("true".equals(resultFlag)){
				return sobj.getString("data");
			}
		} catch (JSONException e) {
			log.error(e.getMessage(),e);
		}
		return null;
	}

	@Override
	public Boolean dealMqBatchDate(RMMQDealinfo di, Boolean dealError){//000020001工单启停
		Boolean result = true;
		String data = di.getMqValue().substring(8, di.getMqValue().length());
		if(null==data||"".equals(data)){
			return false;
		}
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		try {
			JSONObject batch = new JSONObject(data);
			if(batch != null){
				String batchId = batch.getString("ID");
				WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("batchProdTaskID",batchId),
						Restrictions.eq("interfaceUrl",di.getOrigin()));//根据批控工单Id获取工单
				if(prodTask != null){
					if(prodTask.getStatus() != 99){
						logMap = setWorkOrderMqLogMap(false,null,"工单："+ prodTask.getProductBatchNum() + "未生效，不能更改工单执行状态,jsonData:"+data,"batchStatus",di.getId().toString(),"false", prodTask.getProductBatchNum());
						insertLog(logMap, dealError);
						result = false;
					}else{
						Long taskState = batch.getLong("ExeStat");//ExeStat 1:运行中  8:已完成  -1:未执行
						if(taskState != null && taskState.intValue() == 1 ){//启用工单
							Long startTimeLong = batch.getLong("StartTime");
							Date startTime = Filetime2Date(startTimeLong);
							if(prodTask.getTaskState() != null && prodTask.getTaskState().getId().toString().equals("womTaskState/01")){//工单待执行，正常启动工单
								prodTask.setTaskState(new SystemCode("womTaskState/02"));//先修改工单状态为执行
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
						}else if(taskState != null && taskState.intValue() == 8){//结束工单
							if(prodTask.getTaskState() != null && prodTask.getTaskState().getId().toString().equals("womTaskState/02")){//工单执行中状态

								//获取工单实际产量 、结束时间、并结束工单
								/*String batchDetail = getProduceTaskDetailJson(prodTask.getBatchProdTaskID());
								if(batchDetail != null && batchDetail.length() > 0){
									JSONObject sobj;
									try {
										sobj = new JSONObject(batchDetail);
										String factYield = sobj.getString("FactYield");
										if(factYield != null && factYield.length() > 0 && isNumeric(factYield)){
											prodTask.setFinishNum(new BigDecimal(factYield));
										}

										Long endTimeLong = sobj.getLong("EndTime");
										Date endTime = Filetime2Date(endTimeLong);
										prodTask.setActEndTime(endTime);//修改工单结束执行时间

										prodTask.setTaskState(new SystemCode("womTaskState/03"));//先修改工单状态为结束
										produceTaskDao.save(prodTask);

										//生成报工单
										// 需要传staff
										Long staffId = prodTask.getOwnerStaffId();
										Staff staff = null;
										if(staffId!=null){
										    staff = staffService.get(staffId);
										}
										interfaceService.addTaskReportingTable(prodTask.getId(), prodTask.getProductBatchNum(), prodTask.getFinishNum(), staff);

										logMap = setWorkOrderMqLogMap(true,null,"工单执行状态修改成功","batchStatus",null,"false", prodTask.getProductBatchNum());
										insertLog(logMap, dealError);
									} catch (JSONException e) {
										log.error(e.getMessage(),e);
									}
								}else{
									logMap = setWorkOrderMqLogMap(false,null,"工单："+ prodTask.getProductBatchNum() + "未入记录，获取不到详细信息,jsonData:"+data,"batchStatus",null,"false", prodTask.getProductBatchNum());
									insertLog(logMap, dealError);
									result = false;
								}*/

								boolean taskReporting = true;
								String factYield = batch.getString("FactYield");
								if(factYield != null && factYield.length() > 0 && isNumeric(factYield)){
									BigDecimal factYieldBd = new BigDecimal(factYield);
									if(factYieldBd.equals(BigDecimal.ZERO)){
										taskReporting = false;
									}
									prodTask.setFinishNum(factYieldBd);
								} else {
									taskReporting = false;
								}

								Long endTimeLong = batch.getLong("EndTime");
								Date endTime = Filetime2Date(endTimeLong);
								prodTask.setActEndTime(endTime);//修改工单结束执行时间

								prodTask.setTaskState(new SystemCode("womTaskState/03"));//先修改工单状态为结束
								produceTaskDao.save(prodTask);

								if(taskReporting){
									// 生成报工单
									// 需要传staff
									Long staffId = prodTask.getOwnerStaffId();
									Staff staff = null;
									if(staffId!=null){
										staff = staffService.get(staffId);
									}
									interfaceService.addTaskReportingTable(prodTask.getId(), prodTask.getProductBatchNum(), prodTask.getFinishNum(), staff);
								}

								logMap = setWorkOrderMqLogMap(true,null,"工单执行状态修改成功","batchStatus",di.getId().toString(),"false", prodTask.getProductBatchNum());
								insertLog(logMap, dealError);

							}else{
								logMap = setWorkOrderMqLogMap(false,null,"工单："+ prodTask.getProductBatchNum() + "状态不是执行中，不能结束工单,jsonData:"+data,"batchStatus",di.getId().toString(),"false", prodTask.getProductBatchNum());
								insertLog(logMap, dealError);
								result = false;
							}
						}
					}
				}else{
					logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:"+data,"batchStatus",null,"true",batchId);
					insertLog(logMap, dealError);
					result = false;
				}
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
		}
		return result;
	}

	@Override
	public Boolean dealMqUnitDate(RMMQDealinfo di, Boolean dealError){//000020002工序启停
		Boolean result = true;
		String data = di.getMqValue().substring(8, di.getMqValue().length());
		if(null==data||"".equals(data)){
			return false;
		}
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		try {
			JSONObject unit = new JSONObject(data);
			if(unit != null){
				String batchId = unit.getString("BatchID");
				WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("batchProdTaskID",batchId),
						Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
				if(prodTask != null){
					if(prodTask.getStatus() != 99){
						logMap = setWorkOrderMqLogMap(false,null,"工单未生效,jsonData:"+data,"unitStatus",di.getId().toString(),"false",batchId);
						insertLog(logMap, dealError);
						return false;
					}
					String batchUnitId = unit.getString("ID");//phase关联unitId
					Long exeStatOld = null;//unit状态
					Long exeStat = null;//unit状态
					Long startTimeLong = null;//开始时间
					Long endTimeLong = null;//结束时间
					String unitEquipID = null;//对应设备
					try{
						exeStatOld = unit.getLong("ExeStatOld");//unit状态
						exeStat = unit.getLong("ExeStat");//unit状态
						startTimeLong = unit.getLong("StartTime");//开始时间
						endTimeLong = unit.getLong("EndTime");//结束时间
						unitEquipID = unit.getString("UnitEquipID");
					}catch (JSONException e) {
						log.error(e.getMessage(), e);
					}
					WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID",prodTask),
							Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录
					WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("headId",prodTask),
							Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单工序

					if(produceTaskProcess == null){
						logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:"+data,"unitStatus",di.getId().toString(),"true",batchUnitId);
						insertLog(logMap, dealError);
						result = false;
					}

					//if(exeStat.intValue() == 8 && exeStatOld.intValue() == 1){//工序结束信号
					if( endTimeLong != null && endTimeLong.longValue() >0 ){//工序结束信号
						if(procExeLog != null){
							procExeLog.setState(new SystemCode("womProActiveType/completed"));

							Date endTime = Filetime2Date(endTimeLong);
							procExeLog.setEndTime(endTime);

							prodTaskProcExelogDao.save(procExeLog);
							logMap = setWorkOrderMqLogMap(true,null,"工序\"" + produceTaskProcess.getName() + "\"结束","unitStatus",di.getId().toString(),"false",
									procExeLog.getTaskProcessID()!=null?procExeLog.getTaskProcessID().getName():"");
							insertLog(logMap, dealError);
						}else{//如果工序执行记录为空，
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
							logMap = setWorkOrderMqLogMap(false,null,"开始信号未传递，工序\"" + produceTaskProcess.getName() + "\"异常结束","unitStatus",di.getId().toString(),"true",
									produceTaskProcess!=null?produceTaskProcess.getName():"");
							insertLog(logMap, dealError);
						}
						//}else if(exeStat.intValue() == 1 && startTimeLong.intValue()!=0 ){//工序开始信号
					}else if( startTimeLong != null && startTimeLong.longValue() >0 ){//工序开始信号
						WOMProdTaskProcExelog procExeLogNew = new WOMProdTaskProcExelog();
						if(procExeLog != null){//如果phase开始信号先于unit信号，会新建一条只有batchUnitId的数据
							procExeLogNew = procExeLog;
							procExeLogNew.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中

						}else{
							procExeLogNew.setBatchUnitID(batchUnitId);//批控unitID
						}
						procExeLogNew.setTaskID(prodTask);//工单
						procExeLogNew.setBatchNum(prodTask.getProductBatchNum());//生成批号
						procExeLogNew.setTaskProcessID(produceTaskProcess);//工单.工序
						procExeLogNew.setFormularProcess(produceTaskProcess.getFormularProcess());//配方.工序

						Date startTime = Filetime2Date(startTimeLong);
						procExeLogNew.setStartTime(startTime);//开始时间
						//procExeLogNew.setState(new SystemCode("womProActiveType/executing"));//执行状态为执行中

						interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId())!=null&&getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length()>0?
								"http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";

						String equipCode = getBatchFactoryCode(unitEquipID, interfaceURL);
						MESBasicFactoryModel factoryModel = null;
						if(equipCode != null && equipCode.length() > 0){
							factoryModel = factoryModelService.findEntityByProperty("code", equipCode);
							if(factoryModel != null){
								procExeLogNew.setFactoryID(factoryModel);


							}else {
								procExeLogNew.setFactoryID(prodTask.getFactoryId());//工作单元
							}
						}

						prodTaskProcExelogDao.save(procExeLogNew);

						if(factoryModel != null && procExeLog != null){
							prodTaskProcExelogDao.flush();
							prodTaskProcExelogDao.clear();
							procExeLogNew = prodTaskProcExelogService.getProdTaskProcExelog(procExeLogNew.getId());
							List<WOMProdTaskActiExelog> activesExelogs = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("processExeLog", procExeLogNew) );
							if(activesExelogs != null && activesExelogs.size() > 0){
								for(WOMProdTaskActiExelog activeExelog : activesExelogs){
									activeExelog.setFactoryID(factoryModel);
									prodTaskActiExelogDao.save(activeExelog);
									prodTaskActiExelogDao.flush();
									prodTaskActiExelogDao.clear();
								}
							}

							List<WOMBatchPhaseExelog> phaseExelogs = batchPhaseExelogDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskProcessID", procExeLogNew.getTaskProcessID()) );
							if(phaseExelogs != null && phaseExelogs.size() > 0){
								for(WOMBatchPhaseExelog phaseExelog : phaseExelogs){
									phaseExelog.setFactoryId(factoryModel);
									batchPhaseExelogDao.save(phaseExelog);
									batchPhaseExelogDao.flush();
									batchPhaseExelogDao.clear();
								}
							}
						}

						logMap = setWorkOrderMqLogMap(true,null,"工序\"" + produceTaskProcess.getName() + "\"开始","unitStatus",di.getId().toString(),"false",
								produceTaskProcess.getName());
						insertLog(logMap, dealError);
					}


				}else{
					logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:"+data,"unitStatus",di.getId().toString(),"true",batchId);
					insertLog(logMap, dealError);
					result = false;
				}
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
		}
		return result;
	}

	public Boolean updateEquipment(RMMQDealinfo di, Boolean dealError){
		String data = di.getMqValue().substring(8, di.getMqValue().length());
		if(null==data||"".equals(data)){
			return false;
		}
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		try {
			JSONObject unit = new JSONObject(data);
			if(unit != null){
				String batchId = unit.getString("BatchID");

				WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("batchProdTaskID",batchId),
						Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
				if(prodTask != null){
					String batchUnitId = unit.getString("ID");//phase关联unitId
					String unitEquipID = null;//对应设备
					try{
						unitEquipID = unit.getString("UnitEquipID");
					}catch (JSONException e) {
						log.error(e.getMessage(), e);
					}
					//00020002信号传设备id过来时，工序记录，phase记录，活动记录，只要是有的，都给重新塞一下值
					if(unitEquipID != null && unitEquipID.length() > 0 && !"-1".equals(unitEquipID) ) {
						interfaceURL = getUrl(prodTask.getFormularId().getInterfaceUrl().getId())!=null&&getUrl(prodTask.getFormularId().getInterfaceUrl().getId()).length()>0?
								"http://" + getUrl(prodTask.getFormularId().getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";

						prodTaskProcExelogDao.flush();
						prodTaskProcExelogDao.clear();
						WOMProdTaskProcExelog procExeLogNew = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID",prodTask),
								Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录

						String equipCode = getBatchFactoryCode(unitEquipID, interfaceURL);
						MESBasicFactoryModel factoryModel = null;
						if(equipCode != null && equipCode.length() > 0){
							factoryModel = factoryModelService.findEntityByProperty("code", equipCode);
							if(factoryModel != null){
								procExeLogNew.setFactoryID(factoryModel);


							}else {
								procExeLogNew.setFactoryID(prodTask.getFactoryId());//工作单元
							}
						}

						prodTaskProcExelogDao.save(procExeLogNew);

						if(factoryModel != null && procExeLogNew != null){
							prodTaskProcExelogDao.flush();
							prodTaskProcExelogDao.clear();
							WOMProdTaskProcExelog procExeLog = prodTaskProcExelogService.getProdTaskProcExelog(procExeLogNew.getId());
							List<WOMProdTaskActiExelog> activesExelogs = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("processExeLog", procExeLogNew) );
							if(activesExelogs != null && activesExelogs.size() > 0){
								for(WOMProdTaskActiExelog activeExelog : activesExelogs){
									activeExelog.setFactoryID(factoryModel);
									prodTaskActiExelogDao.save(activeExelog);
									prodTaskActiExelogDao.flush();
									prodTaskActiExelogDao.clear();
								}
							}

							List<WOMBatchPhaseExelog> phaseExelogs = batchPhaseExelogDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskProcessID", procExeLogNew.getTaskProcessID()) );
							if(phaseExelogs != null && phaseExelogs.size() > 0){
								for(WOMBatchPhaseExelog phaseExelog : phaseExelogs){
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

	@Override
	public Boolean dealMqOperationDate(RMMQDealinfo di, Boolean dealError){
		Boolean result = true;
		//List<Map<String,String>> logMap = setWorkOrderMqLogMap(true, null, "mes不关注operation级别的操作，无需同步", "operatrion状态变更", null, "false",null);
		//insertLog(logMap, dealError);
		return result;
	}


	//phase的修改
	@Override
	public Boolean dealMqPhaseDateChange(RMMQDealinfo di, Boolean dealError){
		Boolean result = true;
		String data = di.getMqValue().substring(8, di.getMqValue().length());
		if(null==data||"".equals(data)){
			return false;
		}
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		try {
			JSONObject phase = new JSONObject(data);
			if(phase != null){
				String batchId = phase.getString("BatchID");
				WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("batchProdTaskID",batchId),Restrictions.eq("interfaceUrl",di.getOrigin()));//根据批控工单Id获取工单
				if(prodTask != null){
					if(prodTask.getStatus() == 88){//单据未生效时，正常修改
						result = realPhaseUpdate(phase,prodTask);
						updateSumNoBatch(prodTask);//更新用料汇总
						if(result){
							logMap = setWorkOrderMqLogMap(true, null, "更新成功", "produceTaskSyn", di.getId().toString(), "false",prodTask.getProductBatchNum());
							insertLog(logMap, false);
						}
					}else{//单据生效时
						logMap = setWorkOrderMqLogMap(false,null,"工单已生效，不接受批控修改","produceTaskSyn",di.getId().toString(),"true",prodTask.getProductBatchNum());
						insertLog(logMap, false);
						result = false;
					}
				}else{//如通过批次工单id查不到对应工单
					logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:"+data,"produceTaskSyn",di.getId().toString(),"true",batchId);
					insertLog(logMap, false);
					result = false;
				}
			}
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
		}
		return result;
	}

	private Boolean realPhaseUpdate(JSONObject phase,WOMProduceTask prodTask){
		Boolean result = true;
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		try {
			String batchPhaseId = phase.getString("ID");//phaseId,即指令单活动中的batchPhaseID
			List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("headID", prodTask),
					Restrictions.eq("batchPhaseID",batchPhaseId));//根据批控phaseId获取工单活动
			if(prodTaskActives!= null && prodTaskActives.size() > 0){
				for(WOMProduceTaskActive prodTaskActive : prodTaskActives){
					if( prodTaskActive.getActiveType() != null && prodTaskActive.getActiveType().getId().equals("activeType/activeType3")
							&& prodTaskActive.getActiveId().getAuto() ){//只有自动投料的活动，才可以接受批控的修改
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
						if(matStValStr != null && isNumeric(matStValStr)){
							BigDecimal matStVal = BigDecimal.valueOf(Double.valueOf(matStValStr));
							BigDecimal planNum = matStVal.multiply(prodTask.getProductNum());
							prodTaskActive.setPlanNum(planNum);
						}
						String name = phase.getString("Name");//phase名称，工单活动planNum
						if(name != null && name.length() > 0){
							prodTaskActive.setName(name);
						}
						String remark = phase.getString("Remark");//phase备注，工单活动Remark
						if(remark != null && remark.length() > 0){
							prodTaskActive.setRemark(remark);
						}
						produceTaskActiveDao.save(prodTaskActive);
					}
				}
			}else{
				logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:" + phase.toString(),"produceTaskSyn",null,"true",batchPhaseId);
				insertLog(logMap, false);
				result = false;
			}
		}catch (JSONException e) {
			log.error(e.getMessage(), e);
			result = false;
		}
		return result;
	}

	/**
	 * 工单工序活动的启停
	 * @param di mq表对象
	 * @param dealError 是否二次同步
	 */
	@Override
	public Boolean dealMqPhaseDate(RMMQDealinfo di, Boolean dealError){
		Boolean result = true;
		String data = di.getMqValue().substring(8, di.getMqValue().length());
		if(null==data||"".equals(data)){
			return false;
		}
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		try {
			JSONObject phase = new JSONObject(data);
			if(phase != null){
				String batchId = phase.getString("BatchID");
				WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("batchProdTaskID",batchId),
						Restrictions.eq("interfaceUrl",di.getOrigin()));//根据批控工单Id获取工单
				if(prodTask != null){
					String batchUnitId = phase.getString("UnitID");
					WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("headId", prodTask),
							Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动
					WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTask),
							Restrictions.eq("batchUnitID",batchUnitId));//根据批控unitId获取工单活动记录
					if(procExeLog == null){//如果phase开始信号，先于Unit 开始信号，先新建一条只有unitID的数据，给活动执行记录关联
						//logMap = setWorkOrderMqLogMap(false,null,"根据控制配方unitId:" + batchUnitId + "查询不到对应工单工序执行记录,jsonData:" + data,"activeStatus",null,"false",batchUnitId);
						//insertLog(logMap, dealError);
						//result = false;
						WOMProdTaskProcExelog procExeLogNew = new WOMProdTaskProcExelog();
						procExeLogNew.setBatchUnitID(batchUnitId);//批控unitID
						procExeLogNew.setTaskID(prodTask);//工单
						prodTaskProcExelogDao.save(procExeLogNew);
						prodTaskProcExelogDao.flush();
						prodTaskActiExelogDao.clear();
						procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTask),
								Restrictions.eq("batchUnitID",batchUnitId));
					}else if(produceTaskProcess == null){
						logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:" + data,"activeStatus",di.getId().toString(),"true",batchUnitId);
						insertLog(logMap, dealError);
						result = false;
					}else{


						String batchPhaseId = phase.getString("ID");
						int activeIndex = 1;//一个phase对应多个活动的，只需要在操作第一个活动的时候启停phase即可
						List<WOMProduceTaskActive> prodTaskActives = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("headID", prodTask),
								Restrictions.eq("batchPhaseID",batchPhaseId));//根据批控phaseId获取工单活动
						if(prodTaskActives != null && prodTaskActives.size() > 0){
							Long exeStat = phase.getLong("ExeStat");
							Long exeStatOld = phase.getLong("ExeStatOld");
							Long startTimeLong = null;
							Long endTimeLong = null;
							try {
								startTimeLong = phase.getLong("StartTime");
								endTimeLong = phase.getLong("EndTime");
							} catch (JSONException e) {
								log.error(e.getMessage(), e);
							}


							if(startTimeLong != null && startTimeLong.longValue() > 0){//第一个Phase开始信号过来的时候吗，才开始工序
								//如果工序执行状态为空，开始工序执行状态
								if(procExeLog.getState() != null){

								}else{
									procExeLog.setState(new SystemCode("womProActiveType/executing"));
									prodTaskProcExelogDao.save(procExeLog);
									prodTaskProcExelogDao.flush();
									prodTaskActiExelogDao.clear();
									procExeLog = prodTaskProcExelogDao.load(procExeLog.getId());
								}
							}

							for(WOMProduceTaskActive prodTaskActive : prodTaskActives){
								if(prodTaskActive.getActiveType() != null && !prodTaskActive.getActiveType().getId().equals("activeType/activeType2")){//配料不处理
									result = dealSinglePhase(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
											produceTaskProcess,prodTaskActive, dealError,activeIndex, di.getId().toString(),startTimeLong,endTimeLong);//处理活动


									/*if(result && activeIndex ==1 ){//如果操作成功增加成功的日志
										//更新日志
										if(exeStat != null && exeStat.intValue() == 1 && exeStatOld != null && exeStatOld.intValue() == 0){
											logMap = setWorkOrderMqLogMap(true,null,"活动\"" + prodTaskActive.getName() + "\"开始","activeStatus",di.getId().toString(),"false",prodTaskActive.getName());
										}else if(exeStat != null && exeStat.intValue() == 8 && exeStatOld != null && exeStatOld.intValue() == 8){
											logMap = setWorkOrderMqLogMap(true,null,"活动\"" + prodTaskActive.getName() + "\"结束","activeStatus",di.getId().toString(),"false",prodTaskActive.getName());
										}
										insertLog(logMap, dealError);
									}*/

									//增减活动的索引，避免多次操作phase和日志
									activeIndex++;
								}
							}
						}else{
							logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:" + data,"activeStatus",di.getId().toString(),"true",batchPhaseId);
							insertLog(logMap, dealError);
							result = false;
						}
					}
				}else{
					logMap = setWorkOrderMqLogMap(false,null,"控制配方不是来自MES系统,jsonData:"+data,"activeStatus",di.getId().toString(),"true",batchId);
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
	 * @param exeStat 现在执行状态
	 * @param exeStatOld 之前执行状态
	 * @param batchPhaseId 批控phaseid
	 * @param data 全部需要解析的data
	 * @param phase 本phase的数据
	 * @param prodTask 工单
	 * @param procExeLog 工序执行记录
	 * @param produceTaskProcess 配方工序
	 * @param prodTaskActive 配方活动
	 * @param dealError 是否二次同步
	 * @param mqId mq表id
	 * @return
	 *
	 */
	private Boolean dealSinglePhase(Long exeStat,Long exeStatOld,String batchPhaseId,String data,JSONObject phase,WOMProduceTask prodTask,WOMProdTaskProcExelog procExeLog,
									WOMProduceTaskProcess produceTaskProcess,WOMProduceTaskActive prodTaskActive, Boolean dealError,int activeIndex, String mqId,Long startTimeLong,Long endTimeLong){
		Boolean result = true;
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		if(prodTaskActive.getActiveType() != null && "activeType/activeType1".equals(prodTaskActive.getActiveType().getId()) ){//常规
			//先编辑phase执行记录表里查数据
			result = dealPhaseActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
					produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);
			if(result){
				//再编辑指令活动记录表
				result = dealPtActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
						produceTaskProcess,prodTaskActive, dealError,mqId,startTimeLong,endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			}
		}else if(prodTaskActive.getActiveType() != null && "activeType/activeType2".equals(prodTaskActive.getActiveType().getId()) ){//配料
			//目前不会有配料活动
		}else if(prodTaskActive.getActiveType() != null && "activeType/activeType3".equals(prodTaskActive.getActiveType().getId()) ){//投料
			if(prodTaskActive.getActiveId().getAuto()){//自动投料
				//先编辑phase执行记录表里查数据
				result = dealPhaseActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
						produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);
				if(result){
					//再编辑指令活动记录表
					result = dealPtActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
							produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
				}

			}else{//手动投料
				if(activeIndex == 1){//手动投配料具体活动记录通过pda录入 //只有手工投配料才可能有一个Phase对应多个活动的情况
					result = startPhaseActiveExeLogManual(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
							produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);


				}
			}
		}else if(prodTaskActive.getActiveType() != null && "activeType/activeType4".equals(prodTaskActive.getActiveType().getId()) ){//投配料
			if(prodTaskActive.getActiveId().getAuto()){//自动投料
				//先编辑phase执行记录表里查数据
				result = dealPhaseActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
						produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);
				if(result){
					//再编辑指令活动记录表
					result = dealPtActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
							produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
				}

			}else{//手动投配料料
				if(activeIndex == 1){//手动投配料具体活动记录通过pda录入 //只有手工投配料才可能有一个Phase对应多个活动的情况
					result = startPhaseActiveExeLogManual(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
							produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);



				}
			}
		}else if(prodTaskActive.getActiveType() != null && "activeType/activeType5".equals(prodTaskActive.getActiveType().getId()) ){//检验
			if(endTimeLong != null && endTimeLong.longValue() >0){
				return true;
			}else if(startTimeLong != null && startTimeLong.longValue() >0){//开始信号
				WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("phaseID",batchPhaseId),
						Restrictions.eq("taskID", prodTaskActive.getHeadID()));//根据批控phaseId获取工单活动
				if(batchPhaseExelog!=null){
					result = true;
				}else{
					//只在phase执行记录表里插数据
					result = dealPhaseActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
							produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);
					if(result){
						//再编辑指令活动记录表
						result = dealPtActiveExeLog(exeStat,exeStatOld,batchPhaseId,data,phase,prodTask,procExeLog,
								produceTaskProcess,prodTaskActive, dealError, mqId,startTimeLong,endTimeLong);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
					}
					/*
					 *
					 * 生成请检接口
					 *
					 * */
					if(result){
						batchPhaseExelogDao.flush();
						batchPhaseExelogDao.clear();
						WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
								Restrictions.eq("phaseID",batchPhaseId), Restrictions.eq("taskActiveID",prodTaskActive));//根据批控phaseId和工序工单获取工单活动记录
						interfaceSelfService.addApplyCheckByActiveExelog(prodTaskActiExelog);
					}
				}
			}
		}else if(prodTaskActive.getActiveType() != null && "activeType/activeType6".equals(prodTaskActive.getActiveType().getId()) ){//产出
			//先编辑phase执行记录表里查数据
			/*result = dealPhaseActiveExeLog(exeStat,batchPhaseId,data,phase,prodTask,procExeLog,
					produceTaskProcess,prodTaskActive, dealError);
			if(result){
				//再编辑指令活动记录表
				result = dealPtActiveExeLog(exeStat,batchPhaseId,data,phase,prodTask,procExeLog,
						produceTaskProcess,prodTaskActive, dealError);//活动状态，活动批控id,mq数据,jsonObj类型的mq，工单，工单工序记录，工单工序，工单工序活动
			}*/

		}
		return result;
	}


	/**
	 * 编辑phase活动执行记录，常规、产出、自动投配料使用
	 * @param exeStat 现在执行状态
	 * @param exeStatOld 之前执行状态
	 * @param batchPhaseId 批控phaseid
	 * @param data 全部需要解析的data
	 * @param phase 本phase的数据
	 * @param prodTask 工单
	 * @param procExeLog 工序执行记录
	 * @param produceTaskProcess 配方工序
	 * @param prodTaskActive 配方活动
	 * @param dealError 是否二次同步
	 * @param mqId mq表id
	 * @return
	 */
	private Boolean dealPhaseActiveExeLog(Long exeStat,Long exeStatOld,String batchPhaseId,String data,JSONObject phase,WOMProduceTask prodTask,WOMProdTaskProcExelog procExeLog,
										  WOMProduceTaskProcess produceTaskProcess,WOMProduceTaskActive prodTaskActive, Boolean dealError, String mqId,Long startTimeLong,Long endTimeLong){
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("phaseID",batchPhaseId),
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

		if(endTimeLong != null && endTimeLong.longValue() >0 ){//完成信号
			if( batchPhaseExelog != null){
				if( batchPhaseExelog.getEndTime() != null ){//如果有多次结束信号，只处理第一次
					return true;
				}else{
					Date endTime = Filetime2Date(endTimeLong);
					batchPhaseExelog.setEndTime(endTime);
					batchPhaseExelog.setIsFinish(true);//执行结束
					batchPhaseExelogDao.save(batchPhaseExelog);
				}
			}else if(prodTaskActive.getActiveType() != null && !"activeType/activeType5".equals(prodTaskActive.getActiveType().getId())){
				WOMBatchPhaseExelog batchPhaseExelogNew = new WOMBatchPhaseExelog();
				if(batchPhaseExelog != null){
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
		}else if(startTimeLong != null && startTimeLong.longValue() >0){//开始信号
			WOMBatchPhaseExelog batchPhaseExelogNew = new WOMBatchPhaseExelog();
			if(batchPhaseExelog != null){
				batchPhaseExelogNew = batchPhaseExelog;
			}
			if(batchPhaseExelogNew.getStartTime() != null){//如果有多次开始信号，只处理第一次
				return true;
			}else{
				batchPhaseExelogNew.setAllowPutin(true);//允许投料
				batchPhaseExelogNew.setBatchNum(prodTask.getProductBatchNum());//批号
				batchPhaseExelogNew.setExeSystem(new SystemCode("RMsystem/system1"));//系统
				batchPhaseExelogNew.setFactoryId(procExeLog.getFactoryID());//工作单元
				if(prodTaskActive.getActiveType() != null && prodTaskActive.getActiveType().getId().equals("activeType/activeType5")){//活动类型为检验时,直接结束
					batchPhaseExelogNew.setIsFinish(true);//执行结束
					Date endTime = Filetime2Date(startTimeLong);
					batchPhaseExelogNew.setEndTime(endTime);
				}else{
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


	@Autowired
	private PublicSetActBatStateService actBatStateService;

	/**
	 * 编辑指令单活动执行记录，常规、产出、自动投配料使用
	 * @param exeStat 现在执行状态
	 * @param exeStatOld 之前执行状态
	 * @param batchPhaseId 批控phaseid
	 * @param data 全部需要解析的data
	 * @param phase 本phase的数据
	 * @param prodTask 工单
	 * @param procExeLog 工序执行记录
	 * @param produceTaskProcess 配方工序
	 * @param prodTaskActive 配方活动
	 * @param dealError 是否二次同步
	 * @param mqId mq表id
	 * @return
	 */
	private Boolean dealPtActiveExeLog(Long exeStat,Long exeStatOld,String batchPhaseId,String data,JSONObject phase,WOMProduceTask prodTask,WOMProdTaskProcExelog procExeLog,
									   WOMProduceTaskProcess produceTaskProcess,WOMProduceTaskActive prodTaskActive, Boolean dealError, String mqId,Long startTimeLong,Long endTimeLong){
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();

		WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
				Restrictions.eq("phaseID",batchPhaseId),Restrictions.eq("taskActiveID",prodTaskActive));//根据批控phaseId获取工单活动

		if(endTimeLong != null && endTimeLong.longValue() >0 ){//完成信号

			String matFbValStr = null;
			if(prodTaskActiExelog!=null){
				if(prodTaskActiExelog.getEndTime() != null){//如果有多次结束信号，只处理第一次
					return true;
				} else {
					try {
						Date endTime = Filetime2Date(endTimeLong);
						prodTaskActiExelog.setEndTime(endTime);
						if(phase.toString().contains("MatFbVal")){
							matFbValStr = phase.getString("MatFbVal");
							if(matFbValStr!=null && matFbValStr.length()>0 && isNumeric(matFbValStr)){//如果matFbValStr有值，即总量模式
								Double matFbVal = Double.valueOf(matFbValStr);
								BigDecimal actualNum = new BigDecimal(matFbVal);
								prodTaskActiExelog.setActualNum(actualNum);//实际投料数量
							}
						}
					} catch (JSONException e) {
						log.error(e.getMessage(), e);
					}
					prodTaskActiExelog.setIsFinish(true);
					//prodTaskActiExelog.setState(new SystemCode("womProActiveType/completed"));//执行状态
					prodTaskActiExelogDao.save(prodTaskActiExelog);

					//正常结束活动
					logMap = setWorkOrderMqLogMap(true,null,"活动\"" + prodTaskActive.getName() + "\"结束","activeStatus",mqId,"false",prodTaskActive.getName());
					insertLog(logMap, dealError);


				}
			}else{
				if(prodTaskActive.getActiveType() != null && !"activeType/activeType5".equals(prodTaskActive.getActiveType().getId())){
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
					prodTaskActiExelog.setStaffID((Staff)prodTask.getOwnerStaff());//操作人
					prodTaskActiExelog.setTaskActiveID(prodTaskActive);//工单活动
					prodTaskActiExelog.setTaskID(prodTask);//工单
					prodTaskActiExelog.setTaskProcessID(produceTaskProcess);//工单工序
					prodTaskActiExelog.setCid(prodTask.getCid());
					prodTaskActiExelog.setOperartionID(prodTaskActive.getOperartionID());//批控operationId
					if(prodTaskActive.getActiveId() != null){
						prodTaskActiExelog.setIsPassCheck(prodTaskActive.getActiveId().getIsPassCheck());//是否放行检验
						prodTaskActiExelog.setFinalInspection(prodTaskActive.getActiveId().getFinalInspection());//完工检验
						prodTaskActiExelog.setFormularActice(prodTaskActive.getActiveId());//配方.活动
					}
					prodTaskActiExelog.setActiveSource(prodTaskActive.getActiveSource());//来源

					try {
						Date endTime = Filetime2Date(endTimeLong);
						prodTaskActiExelog.setEndTime(endTime);
						if(phase.toString().contains("MatFbVal")){
							matFbValStr = phase.getString("MatFbVal");
							if(matFbValStr!=null && matFbValStr.length()>0 && isNumeric(matFbValStr)){//如果matFbValStr有值，即总量模式
								Double matFbVal = Double.valueOf(matFbValStr);
								BigDecimal actualNum = new BigDecimal(matFbVal);
								prodTaskActiExelog.setActualNum(actualNum);//实际投料数量
							}
						}
					} catch (JSONException e) {
						log.error(e.getMessage(), e);
					}
					prodTaskActiExelog.setIsFinish(true);//是否结束
					prodTaskActiExelogDao.save(prodTaskActiExelog);
					logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "活动\"" + prodTaskActive.getName() + "\"异常结束,jsonData:" + data,"activeStatus",mqId,"false",batchPhaseId);
					insertLog(logMap, dealError);
					return true;
				}
			}


			boolean allowNewPutinRecord = false;//是否生成投料记录
			if( prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType3") && prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto() &&
					matFbValStr != null && matFbValStr.length() > 0 && isNumeric(matFbValStr) ){//自动投料活动需要生成投料清单
				allowNewPutinRecord = true;
			}else if( prodTaskActiExelog.getActiveType().getId().equals("activeType/activeType4")
					&& prodTaskActiExelog.getTaskActiveID().getActiveId().getAuto() ){//自动投配料先查询一下是否有对应的配料记录
				List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),
						Restrictions.eq("phaseID",batchPhaseId));//通过phsae查询配料指令明细
				if( batchingMaterialPartList != null && batchingMaterialPartList.size() >0 ){
					allowNewPutinRecord = true;
				}else{
					logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "查询不到对应该活动的配料记录,jsonData:" + data,"activeStatus",mqId,"false",batchPhaseId);
					insertLog(logMap, dealError);
					return false;
				}
			}

			if(allowNewPutinRecord){//调用接口生成投料记录
				batchPhaseExelogDao.flush();
				batchPhaseExelogDao.clear();
				WOMProdTaskActiExelog prodTaskActiExelog2 = prodTaskActiExelogService.getProdTaskActiExelog(prodTaskActiExelog.getId());

				// 需要传用户名
				String userName = null;
				if(getCurrentUser()!=null){
					userName=getCurrentUser().getName();
				}
				if(userName==null){
					//userName=prodTask.getOwnerStaff()!=null?prodTask.getOwnerStaff().getUser().getName():null;
					Long staffId = prodTask.getOwnerStaffId();
					if(staffId!=null){
						Staff staff = staffService.get(staffId);
						userName = staff!=null?staff.getUser().getName():null;
					}
				}
				interfaceSelfService.addPutinRecordByActiceExelog(prodTaskActiExelog2, false,userName);
			}

		}else if(startTimeLong != null && startTimeLong.longValue() >0){//开始信号
			if(prodTaskActiExelog != null ){//如果有多次开始信号，只处理第一次
				return true;
			}else{
				prodTaskActiExelog = new WOMProdTaskActiExelog();

				//add 20171113
				prodTaskActiExelog.setActiveName(prodTaskActive.getName());
				//检验的时候，设置活动与批状态为生产待检  add 20171113
				if(prodTaskActive.getActiveType() != null &&  "activeType/activeType5".equals(prodTaskActive.getActiveType().getId())){
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
				prodTaskActiExelog.setStaffID((Staff)prodTask.getOwnerStaff());//操作人
				prodTaskActiExelog.setTaskActiveID(prodTaskActive);//工单活动
				prodTaskActiExelog.setTaskID(prodTask);//工单
				prodTaskActiExelog.setTaskProcessID(produceTaskProcess);//工单工序
				prodTaskActiExelog.setCid(prodTask.getCid());

				Date startTime = Filetime2Date(startTimeLong);
				prodTaskActiExelog.setStartTime(startTime);//活动开始时间

				prodTaskActiExelog.setIsFinish(false);//执行结束
				//prodTaskActiExelog.setState(new SystemCode("womProActiveType/executing"));//执行状态
				prodTaskActiExelog.setOperartionID(prodTaskActive.getOperartionID());
				if(prodTaskActive.getActiveId() != null){
					prodTaskActiExelog.setIsPassCheck(prodTaskActive.getActiveId().getIsPassCheck());//是否放行检验
					prodTaskActiExelog.setFinalInspection(prodTaskActive.getActiveId().getFinalInspection());//完工检验
					prodTaskActiExelog.setFormularActice(prodTaskActive.getActiveId());//配方.活动
				}
				prodTaskActiExelog.setActiveSource(prodTaskActive.getActiveSource());//来源
				prodTaskActiExelog.setTableInfoId(prodTask!=null?prodTask.getTableInfoId():null);
				prodTaskActiExelogDao.save(prodTaskActiExelog);

				//活动正常开始日志
				logMap = setWorkOrderMqLogMap(true,null,"活动\"" + prodTaskActive.getName() + "\"开始","activeStatus",mqId,"false",prodTaskActive.getName());
				insertLog(logMap, dealError);
			}
		}
		return true;
	}


	/**
	 * 开始手工活动
	 * @param exeStat 现在执行状态
	 * @param exeStatOld 之前执行状态
	 * @param batchPhaseId 批控phaseid
	 * @param data 全部需要解析的data
	 * @param phase 本phase的数据
	 * @param prodTask 工单
	 * @param procExeLog 工序执行记录
	 * @param produceTaskProcess 配方工序
	 * @param prodTaskActive 配方活动
	 * @param dealError 是否二次同步
	 * @param mqId mq表id
	 * @return
	 */
	private Boolean startPhaseActiveExeLogManual(Long exeStat,Long exeStatOld,String batchPhaseId,String data,JSONObject phase,WOMProduceTask prodTask,WOMProdTaskProcExelog procExeLog,
												 WOMProduceTaskProcess produceTaskProcess,WOMProduceTaskActive prodTaskActive, Boolean dealError, String mqId,Long startTimeLong,Long endTimeLong){
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		WOMBatchPhaseExelog batchPhaseExelogOld = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("phaseID",batchPhaseId),
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
		if(endTimeLong != null && endTimeLong.longValue() >0 ){//完成信号
			return true;
		}else if(startTimeLong != null && startTimeLong.longValue() >0){//开始信号
			WOMBatchPhaseExelog batchPhaseExelog = new WOMBatchPhaseExelog();
			if(batchPhaseExelogOld != null){
				batchPhaseExelog = batchPhaseExelogOld;
			}
			if(batchPhaseExelog.getStartTime() != null && dealError != null && !dealError){
				return true;
			}else{
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
				if(prodTaskActive.getActiveType().getId().equals("activeType/activeType4")){
					List<WOMBatchingMaterialNeed> batchingMaterialNeedList = batchingMaterialNeedDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
							Restrictions.eq("phaseID",batchPhaseId));
					if(batchingMaterialNeedList != null && batchingMaterialNeedList.size() > 0 ){//如果有备料需求，手工投料和手工投配料都要检查
						for(WOMBatchingMaterialNeed batchingMaterialNeed : batchingMaterialNeedList){
							if(batchingMaterialNeed.getState() != null && batchingMaterialNeed.getState().getId().equals("womNeedState/01")){
								allowPutin = false;//只要有一条备料没有完成就不允许投料
								logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "对应的配料需求记录未结束,jsonData:" + data,"activeStatus",mqId,"false",batchPhaseId);
								insertLog(logMap, dealError);
								result = false;
								break;
							}
						}
						batchPhaseExelog.setAllowPutin(allowPutin);//允许投料
					}else{
						allowPutin = false;
						batchPhaseExelog.setAllowPutin(allowPutin);//是否允许投料
						logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "查询不到对应配料需求记录,jsonData:" + data,"activeStatus",mqId,"false",batchPhaseId);
						insertLog(logMap, dealError);
						result = false;
					}
				}else if(prodTaskActive.getActiveType().getId().equals("activeType/activeType3")){//手工投料不一定需要备料需求
					batchPhaseExelog.setAllowPutin(allowPutin);//是否允许投料
				}
				batchPhaseExelogDao.save(batchPhaseExelog);

				Long staffId = prodTask.getOwnerStaffId();
				Staff staff = null;
				if(staffId!=null){
					staff = staffService.get(staffId);
				}
				if(allowPutin && prodTaskActive.getActiveType().getId().equals("activeType/activeType4")){//如果允许投料，手工投配料从配料清单表中组织待投料记录
					List<WOMBatchingMaterialPart> batchingMaterialPartList = batchingMaterialPartDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskID", prodTaskActive.getHeadID()),
							Restrictions.eq("phaseID",batchPhaseId));//通过phsae查询配料指令明细
					if(batchingMaterialPartList != null && batchingMaterialPartList.size() > 0){
						for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList){//有几条配料指令明细就查几条待投料记录
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
							waitPutinRecords.setCid(getCurrentCompany() != null ?getCurrentCompany().getId():prodTask.getCid());
							waitPutinRecords.setTableInfoId(prodTask!=null?prodTask.getTableInfoId():null);
							waitPutinRecordsDao.save(waitPutinRecords);
						}
					}else{
						logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "查询不到对应配料指令明细记录,jsonData:" + data,"activeStatus",mqId,"false",batchPhaseId);
						insertLog(logMap, dealError);
						result = false;
					}
				}else if(allowPutin && prodTaskActive.getActiveType().getId().equals("activeType/activeType3")){//如果手工投料，从工单工序活动表中组织待投料记录
					List<WOMProduceTaskActive> produceTaskActiveList = produceTaskActiveDao.findByCriteria(Restrictions.eq("valid", true),Restrictions.eq("headID", prodTask),
							Restrictions.eq("batchPhaseID",batchPhaseId));//通过phsae查询工单工序活动
					if(produceTaskActiveList != null && produceTaskActiveList.size() > 0){
						for(WOMProduceTaskActive active : produceTaskActiveList){
							if(active.getActiveType().getId().equals("activeType/activeType3")){
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
								waitPutinRecords.setCid(getCurrentCompany() != null ?getCurrentCompany().getId():prodTask.getCid());
								waitPutinRecords.setTableInfoId(prodTask!=null?prodTask.getTableInfoId():null);
								waitPutinRecordsDao.save(waitPutinRecords);

							}
						}
					}else{
						logMap = setWorkOrderMqLogMap(false,null,"根据控制配方phaseId:" + batchPhaseId + "查询不到对应工单活动,jsonData:" + data,"activeStatus",mqId,"false",batchPhaseId);
						insertLog(logMap, dealError);
						result = false;
					}
				}

				//活动正常开始日志
				logMap = setWorkOrderMqLogMap(true,null,"活动\"" + prodTaskActive.getName() + "\"开始","activeStatus",mqId,"false",prodTaskActive.getName());
				insertLog(logMap, dealError);
			}
		}
		return result;
	}

	/**
	 * PDA结束手工活动
	 * @param phaseID 批控phaseid
	 * @param errorDeal 是否二次同步
	 */
	@Override
	public Boolean endPhaseActive(String phaseID, Boolean errorDeal){
		WOMBatchPhaseExelog batchPhaseExelogOld = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
				Restrictions.eq("phaseID",phaseID));//根据批控phaseId获取工单活动
		List<Map<String,String>> logMap = new ArrayList<Map<String,String>>();
		boolean result =true;
		if(batchPhaseExelogOld.getTaskID().getBatchProdTaskID() == null || "".equals(batchPhaseExelogOld.getTaskID().getBatchProdTaskID())){
			logMap = setWorkOrderMqLogMap(false,null,"手工结束Phase失败，找不到批控批次ID，jsonData:" + phaseID,"mesStopPhaseFault",null,"true",phaseID);
			insertLog(logMap, errorDeal);
			result = false;
		}
		if(batchPhaseExelogOld.getTaskProcessID().getBatchUnitID() == null || "".equals(batchPhaseExelogOld.getTaskProcessID().getBatchUnitID())){
			logMap = setWorkOrderMqLogMap(false,null,"手工结束Phase失败，找不到批控UnitID，jsonData:" + phaseID,"mesStopPhaseFault",null,"true",phaseID);
			insertLog(logMap, errorDeal);
			result = false;
		}
		if(batchPhaseExelogOld.getOperartionID() == null || "".equals(batchPhaseExelogOld.getOperartionID())){
			logMap = setWorkOrderMqLogMap(false,null,"手工结束Phase失败，找不到批控OpertationID，jsonData:" + phaseID,"mesStopPhaseFault",null,"true",phaseID);
			insertLog(logMap, errorDeal);
			result = false;
		}
		if(batchPhaseExelogOld.getPhaseID() == null || "".equals(batchPhaseExelogOld.getPhaseID())){
			logMap = setWorkOrderMqLogMap(false,null,"手工结束Phase失败，找不到批控PhaseID，jsonData:" + phaseID,"mesStopPhaseFault",null,"true",phaseID);
			insertLog(logMap, errorDeal);
			result = false;
		}
		result = stopPhaseSync(batchPhaseExelogOld.getId().toString(), null);
		return result;
	}


	public boolean isNumeric(String str) { // 正则验证是否是数字
		String reg = "^[0-9]+(.[0-9]+)?$";
		return str.matches(reg);
	}
	/*-- mq end  --*/


	/**
	 * 根据批号查找指令单
	 *
	 * @param batchNum
	 * @return
	 */
	@Override
	public WOMProduceTask getBybatchNum(String batchNum) {
		String hql1="from PublicSetBatchRelate where (partBatch=? or mainBatch=?) and valid=?";
		List<PublicSetBatchRelate>relateInfoList=produceTaskDao.findByHql(hql1, batchNum,batchNum,true);
		if(relateInfoList.size()>0){
			PublicSetBatchRelate relate=relateInfoList.get(0);
			String mainBatch=relate.getMainBatch();
			String hql="from WOMProduceTask where productBatchNum=?";
			List<WOMProduceTask> taskList =produceTaskDao.findByHql(hql, mainBatch);
			if (taskList.size() > 0) {
				return taskList.get(0);
			}else {
				return null;
			}
		}else {
			return null;
		}


	}


	/**
	 * 根据返工前批号查找最新检验报告单
	 * @param batchNum
	 * @return
	 */
	@Override
	public String findManuCheckBybatchNum(String batchNum) {
		String hql1="from PublicSetBatchRelate where (partBatch=? or mainBatch=?) and valid=?";
		List<PublicSetBatchRelate>relateInfoList=produceTaskDao.findByHql(hql1, batchNum,batchNum,true);
		String result="";
		if(relateInfoList.size()>0){
			PublicSetBatchRelate relate=relateInfoList.get(0);
			String mainBatch=relate.getMainBatch();
			String sql="select TABLE_INFO_ID,ID from QUALITYMAN_MANU_CHECKS where PART_CODE=? ORDER BY CREATE_TIME DESC";
			Object[] obj=(Object[]) produceTaskDao.createNativeQuery(sql, mainBatch).list().get(0);
			result=obj[0]+"-"+obj[1];
		}
		return result;

	}


	/**
	 *  回掺业务代码
	 *  判断工序中的投料比例是否发生改变，如果发生改变，则修改工序下相关活动的投料数量
	 * @param produceTask
	 */
	public void updateNumByPutinRatio(WOMProduceTask produceTask){

		if(produceTask!=null && produceTask.getId()!=null){
			//生产数量
			BigDecimal productNum=produceTask.getProductNum();
			//获取工序
			List<WOMProduceTaskProcess> processes=produceTaskProcessService.getProduceTaskProcesss("headId="+produceTask.getId(), null);
			//工序不为空  且指令单类型为制造
			if(processes.size()>0 &&  produceTask.getTaskType()!=null && produceTask.getTaskType().getId().equals("womTaskType/type1")){
				for(WOMProduceTaskProcess process:processes ){
					//如果某工序的投料比例发生了改变
					if(process.getBeforeRatio()!=null && process.getAfterRatio()!=null && !process.getBeforeRatio().equals(process.getAfterRatio()) ){
						List<WOMProduceTaskActive> actives=produceTaskActiveService.getProduceTaskActives("orderProcessId="+process.getId(), null);
						if(actives.size()>0){
							for(WOMProduceTaskActive active:actives){
								Boolean isBatch=produceTask.getBatchContral();
								//固定数量为否、活动类型为配料或者投料（不为批控执行的）、不为配方中定义的活动
								if(!active.getIsMixQuality() &&   active.getActiveType()!=null  &&
										( active.getActiveSource()==null  ||  !active.getActiveSource().getId().equals("womActiveSource/02")  ) &&
										( active.getActiveType().getId().equals("activeType/activeType3") ||  active.getActiveType().getId().equals("activeType/activeType2")  )  &&
										( active.getExeSystem()==null  ||  !active.getExeSystem().getId().equals("RMsystem/system1")  ) ){
									RMFormulaProcessActive rmactive=active.getActiveId();
									//配方中活动的理论数量
									BigDecimal activeNum=rmactive.getStandardQuantity();
									if(productNum!=null && activeNum!=null ){
										//理论数量=计划数量=物料清单.单位数量×生产数量×(投料比例/100)
										active.setPlanNum(activeNum.multiply(productNum).multiply(process.getAfterRatio().divide(new BigDecimal(100))) );
										active.setStandardNum(active.getPlanNum());
										active.setMinQuality(rmactive.getMinQuality()==null?null:rmactive.getMinQuality().multiply(productNum).multiply(process.getAfterRatio().divide(new BigDecimal(100))));
										active.setMaxQuality(rmactive.getMaxQuality()==null?null:rmactive.getMaxQuality().multiply(productNum).multiply(process.getAfterRatio().divide(new BigDecimal(100))));
										produceTaskActiveDao.merge(active);
									}
								}
							}
						}
					}
					//将工序的投料比例赋值给投料前比例
					process.setBeforeRatio(process.getAfterRatio());
					produceTaskProcessDao.merge(process);
				}
				produceTaskActiveDao.flush();
				produceTaskActiveDao.clear();
			}
		}

	}


	/**
	 *  回掺业务代码,生产指令单生效时，将活动来源为指令单的活动插入到待投料记录表，然后PDA读取数据进行操作
	 * @param produceTask
	 */
	public void addActiveToWaitPutin(WOMProduceTask produceTask){
		List<WOMProduceTaskActive> actives=produceTaskActiveService.getProduceTaskActives("headID="+produceTask.getId()+" and activeSource='womActiveSource/02' ", null);
		for(WOMProduceTaskActive active:actives){
			WOMWaitPutinRecords waitPutinRecords = new WOMWaitPutinRecords();
			waitPutinRecords.setActOrder(active.getActOrder());//投料顺序
			waitPutinRecords.setActTime(null);//操作时间
			waitPutinRecords.setActiveType(active.getActiveType());//活动类型
			waitPutinRecords.setBatchNum(produceTask.getProductBatchNum());//生产批号
			waitPutinRecords.setIsFinish(false);//是否结束
			waitPutinRecords.setLableCode(active.getId().toString());//标号标签
			waitPutinRecords.setMaterialNum(active.getPlanNum());//物料数量
			waitPutinRecords.setProductID(active.getProductId());//物料
			waitPutinRecords.setTaskActiveID(active);
			waitPutinRecords.setTaskID(produceTask);
			//活动来源
			waitPutinRecords.setActiveSource(new SystemCode("womActiveSource/02"));
			waitPutinRecords.setTaskProcessID(active.getOrderProcessId());
			waitPutinRecords.setCid(getCurrentCompany() != null ?getCurrentCompany().getId():produceTask.getCid());

			//移动端
			waitPutinRecords.setMobileTerminal(active.getMobileTerminal());

			waitPutinRecordsDao.save(waitPutinRecords);
		}
	}

	/**
	 * 工单内对象赋值除id以外的参数
	 * @param produceTask
	 */
	private void setValueInit(WOMProduceTask produceTask){
		//赋值 产品 其他参数
		if(produceTask.getProductId()!=null && produceTask.getProductId().getId()!=null){
			MESBasicProduct produce = productService.getProduct(produceTask.getProductId().getId());
			produceTask.setProductId(produce);
		}
		//赋值 配方 其他参数
		if(produceTask.getFormularId()!=null && produceTask.getFormularId().getId()!=null){
			RMFormula prepareMaterial = formulaService.getFormula(produceTask.getFormularId().getId());
			produceTask.setFormularId(prepareMaterial);
		}
		//赋值 生产线 其他参数
		if(produceTask.getFactoryId()!=null && produceTask.getFactoryId().getId()!=null){
			MESBasicFactoryModel factoryModel = factoryModelService.getFactoryModel(produceTask.getFactoryId().getId());
			produceTask.setFactoryId(factoryModel);
		}
	}

	@Override
	public Long toProcFeedbackPage(Long activeId) {
		Long procFeedbackPageId = null;
		WOMProcFeedbackHead womProcFeedbackHead = null;
		WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(activeId);
		if (produceTaskActive != null) {
			List<WOMProcFeedbackHead> womProcFeedbackHeads = procFeedbackHeadDao.findByHql(" from WOMProcFeedbackHead  where processActive=? and valid = 1", produceTaskActive);
			if (!womProcFeedbackHeads.isEmpty()) {
				womProcFeedbackHead = womProcFeedbackHeads.get(0);
				procFeedbackPageId = womProcFeedbackHead.getId();
			}else {
				//如果没有操作过，新建页面
				womProcFeedbackHead = new WOMProcFeedbackHead();
				womProcFeedbackHead.setProcessActive(produceTaskActive);
				womProcFeedbackHead.setProduct(produceTaskActive.getProductId());
				womProcFeedbackHead.setTaskId(produceTaskActive.getHeadID());
				if (produceTaskActive.getProductId() != null) {
					womProcFeedbackHead.setIsAgile(true);
				}

				procFeedbackHeadDao.save(womProcFeedbackHead);
				procFeedbackPageId = womProcFeedbackHead.getId();
			}
		}
		return procFeedbackPageId;
	}
	@Override
	public Long searchProcFeedbackPage(Long activeId, String activeType) {
		Long pageId = null;
		String sql = null;
		if (StringUtils.equals(activeType,"activeType/activeType5")) {  //质检
			sql = "SELECT ID FROM WOM_QUALITY_INSPECTS WHERE ACTIVEID=? ";
		}else if(StringUtils.equals(activeType,"activeType/activeType6")){  //产出
			sql = "SELECT ID FROM WOM_MATERIALS_OUTPUTS WHERE ACTIVEID=? ";
		}else {  //产出
			sql = "SELECT ID FROM WOM_PROC_FEEDBACK_HEADS WHERE PROCESS_ACTIVE=? ";
		}
		if (sql != null) {
			Object result = procFeedbackHeadDao.createNativeQuery(sql + "and valid = 1", activeId).uniqueResult();
			if (result != null) {
				pageId = ((BigDecimal) result).longValue();
			}
		}
		return pageId;
	}
	@Override
	public List<ProcessStep> getProcessesData(Long produceTaskId) {
		List<ProcessStep> processSteps = new ArrayList<>();
		List<WOMProduceTaskProcess> produceTaskProcesses =  procFeedbackHeadDao.findByHql(" from WOMProduceTaskProcess where headId.id = ?",produceTaskId);
		for (WOMProduceTaskProcess produceTaskProcess : produceTaskProcesses) {
			if (produceTaskProcess.getExeOrder() != null) {
				//大工序
				ProcessStep processStep = new ProcessStep(produceTaskProcess.getId(),produceTaskProcess.getExeOrder().toString(),produceTaskProcess.getName(),produceTaskProcess.getProcessState().getId());
				List<ProcessStep> stepList = new ArrayList<>();
				//给当前步骤做标记
				int markStep = 1;
				Map<String,Integer> keyAndValue = new TreeMap<>(new Comparator<String>() {
					@Override
					public int compare(String o1, String o2) {
						Integer oo1 = StringUtils.isNotBlank(o1) ? Integer.valueOf(o1) : 0;
						Integer oo2 = StringUtils.isNotBlank(o2) ? Integer.valueOf(o2) : 0;
						return oo1 - oo2;
					}
				});
				//获取大工序下面的各种活动,首先获取各个"父活动"的执行顺序和其执行顺序出现的次数
				String sql = "SELECT DISTINCT(EXEC_SORT),COUNT(EXEC_SORT) AS COUNT FROM WOM_PRODUCE_TASK_ACTIVES  WHERE VALID = 1 AND ORDER_PROCESS_ID = ? AND PARENT_ACTIVE = 1 GROUP BY EXEC_SORT ORDER BY EXEC_SORT ";
				List<Object[]> sortAndCounts = procFeedbackHeadDao.createNativeQuery(sql, produceTaskProcess).list();
				for (Object[] sortAndCount : sortAndCounts) {
					if (sortAndCount[0] != null && sortAndCount[1] != null)
						keyAndValue.put(sortAndCount[0].toString(),Integer.valueOf(sortAndCount[1].toString()));
				}
                /*
                    keyAndValue 当前结果是:
                                            1 - 3
                                            2 - 3
                                            3 - 1
                                            4 - 1
                                            5 - 1
                 */

				for (Map.Entry<String, Integer> sortAndCountsEntry : keyAndValue.entrySet()) {
					List<WOMProduceTaskActive> parentsTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and parentActive = 1 and execSort=?", produceTaskProcess,sortAndCountsEntry.getKey());
					ProcessStep childrenStep = null;
					if (sortAndCountsEntry.getValue().intValue() == 1) {    //如果只有一次，那么这里顺序规则是单位数
						for (WOMProduceTaskActive parentsTaskActive : parentsTaskActives) {
							if (StringUtils.equals(parentsTaskActive.getActiveType().getId(),"activeType/activeType4")) {   //如果是投配料，就找到其"子活动"
								List<WOMProduceTaskActive> batchesTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and parentActive = 0 and parentActiveId=?", produceTaskProcess,parentsTaskActive.getId());
								for (WOMProduceTaskActive batchesTaskActive : batchesTaskActives) {
									childrenStep = new ProcessStep(batchesTaskActive.getId(), markStep + "",parentsTaskActive.getName() + ":" + batchesTaskActive.getName(),batchesTaskActive.getActiveState().getId());
									childrenStep.setActiveHeaderId(batchesTaskActive.getOrderProcessId().getId());
									childrenStep.setParentId(parentsTaskActive.getId());
									childrenStep.setProcessType(batchesTaskActive.getActiveType().getId());
									if (produceTaskProcess.getExeOrder() != null) {
										childrenStep.setProcessStep(produceTaskProcess.getExeOrder().toString());
									}
									stepList.add(childrenStep);
								}
							}else {
								childrenStep = new ProcessStep(parentsTaskActive.getId(),markStep + "",parentsTaskActive.getName(),parentsTaskActive.getActiveState().getId());
								childrenStep.setActiveHeaderId(parentsTaskActive.getOrderProcessId().getId());
								childrenStep.setProcessType(parentsTaskActive.getActiveType().getId());
								if (produceTaskProcess.getExeOrder() != null) {
									childrenStep.setProcessStep(produceTaskProcess.getExeOrder().toString());
								}
								stepList.add(childrenStep);
							}
						}
					}else {     //如果有并列关系,这里的顺序规则是 markStep-x-x
						for (int i = 0; i < parentsTaskActives.size(); i++) {
							if (StringUtils.equals(parentsTaskActives.get(i).getActiveType().getId(),"activeType/activeType4")) {   //如果是投配料，就找到其"子活动"
								List<WOMProduceTaskActive> batchesTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and parentActive = 0 and parentActiveId=?", produceTaskProcess,parentsTaskActives.get(i).getId());
								for (WOMProduceTaskActive batchesTaskActive : batchesTaskActives) {
									childrenStep = new ProcessStep(batchesTaskActive.getId(), markStep + "-" + (i + 1) + "-" + StringUtils.substringAfter(batchesTaskActive.getExecSort(),"-"),parentsTaskActives.get(i).getName() + ":" + batchesTaskActive.getName(),batchesTaskActive.getActiveState().getId());
									childrenStep.setActiveHeaderId(batchesTaskActive.getOrderProcessId().getId());
									childrenStep.setParentId(parentsTaskActives.get(i).getId());
									childrenStep.setProcessType(batchesTaskActive.getActiveType().getId());
									if (produceTaskProcess.getExeOrder() != null) {
										childrenStep.setProcessStep(produceTaskProcess.getExeOrder().toString());
									}
									stepList.add(childrenStep);
								}
							}else {
								childrenStep = new ProcessStep(parentsTaskActives.get(i).getId(),markStep + "-" + (i + 1) + "-1",parentsTaskActives.get(i).getName(),parentsTaskActives.get(i).getActiveState().getId());
								childrenStep.setActiveHeaderId(parentsTaskActives.get(i).getOrderProcessId().getId());
								childrenStep.setProcessType(parentsTaskActives.get(i).getActiveType().getId());
								if (produceTaskProcess.getExeOrder() != null) {
									childrenStep.setProcessStep(produceTaskProcess.getExeOrder().toString());
								}
								stepList.add(childrenStep);
							}
						}
					}
					markStep++;
				}
				processStep.setChildStep(stepList);
				processSteps.add(processStep);
			}
		}
		return processSteps;
	}
	@Override
	public Long searchAdjustPage(Long activeId, String processId) {
		Long pageId = null;
		String sql  = null;
		if (StringUtils.isBlank(processId)) {
			sql = "SELECT ID FROM WOM_ADJUST_OR_TEMP_HEADS WHERE valid = 1 and PROCESS_ACTIVEID=? ";
			if (sql != null) {
				Object result = procFeedbackHeadDao.createNativeQuery(sql + "and valid = 1", activeId).uniqueResult();
				if (result != null) {
					pageId = ((BigDecimal) result).longValue();
				}
			}
		}else {
			sql = "SELECT ID FROM WOM_ADJUST_OR_TEMP_HEADS WHERE valid = 1 and PROCESS_ID=? ";
			if (sql != null) {
				Object result = procFeedbackHeadDao.createNativeQuery(sql + "and valid = 1", Long.valueOf(processId)).uniqueResult();
				if (result != null) {
					pageId = ((BigDecimal) result).longValue();
				}
			}
		}
		return pageId;
	}

	private Map<String, String> deploymentId(String process_key) {
		Map<String, String> deployMap = new HashMap<String, String>();
		String sql = " select id , version  from wf_deployment where  process_key=?  and valid=1  and is_current_version=1  order by id desc ";
		List<Object[]> busiTypes = prodTaskActiExelogDao.createNativeQuery(sql, process_key).list();
		if (busiTypes.isEmpty()) {
			throw new BAPException("未找到key为"+ process_key + "的工作流");
		}
		String id = "";
		String version = "";
		for (Object[] type : busiTypes) {
			id = type[0] != null ? (type[0].toString()) : "";
			version = type[1] != null ? (type[1].toString()) : "";
			break;
		}
		deployMap.put("id", id);
		deployMap.put("version", version);
		return deployMap;
	}

	/**
	 * 在执行记录中展示 工序 或 活动 的投料明细
	 * @param activeId
	 * @param processId
	 * @return
	 */
	@Override
	public List<WOMBatchChargeDetails> getBatchingRecordByProcessAndActive(Long activeId, String processId) {
		List<WOMBatchChargeDetails> chargeDetails = new ArrayList<>();
		//所有的数据都要建立在已经选了工序时
		if (StringUtils.isNotBlank(processId)) {
			WOMProduceTaskProcess produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(Long.valueOf(processId));
			if (produceTaskProcess != null) {
				List<WOMPutInMaterialPart> womPutInMaterialParts = new ArrayList<>();
				WOMProdTaskActiExelog exelog = null;
				if (activeId != null) {
					WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(activeId);
					if (produceTaskActive != null && (StringUtils.equals(produceTaskActive.getActiveType().getId(),"activeType/activeType3") || StringUtils.equals(produceTaskActive.getActiveType().getId(),"activeType/activeType2"))) {
						womPutInMaterialParts = putInMaterialPartService.findPutInMaterialPartsByHql(" from WOMPutInMaterialPart where valid = 1 and taskProcessId = ? and taskActiveId = ?", produceTaskProcess,produceTaskActive);
						//通过活动查找活动执行记录
						List<WOMProdTaskActiExelog> actiExelogs = new ArrayList<>();
						if (StringUtils.equals(produceTaskActive.getActiveSource().getId(),"womActiveSource/03") || StringUtils.equals(produceTaskActive.getActiveSource().getId(),"womActiveSource/04")) {
							actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and taskActiveID=?",produceTaskActive);
						}else {
							actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and adjustRecordID=?",activeId);
						}
						if (!actiExelogs.isEmpty()) {
							exelog = actiExelogs.get(0);
						}
					}else {
						WOMAdjustOrTempRecords adjustOrTempRecords = adjustOrTempRecordsDao.get(activeId);
						if (adjustOrTempRecords != null && (StringUtils.equals(adjustOrTempRecords.getActiveType().getId(),"activeType/activeType3") || StringUtils.equals(adjustOrTempRecords.getActiveType().getId(),"activeType/activeType2"))){
							womPutInMaterialParts = putInMaterialPartService.findPutInMaterialPartsByHql(" from WOMPutInMaterialPart where valid = 1 and taskProcessId = ? and adjustActive = ?", produceTaskProcess,adjustOrTempRecords);
						}
					}
				}else {
					womPutInMaterialParts = putInMaterialPartService.findPutInMaterialPartsByHql(" from WOMPutInMaterialPart where valid = 1 and taskProcessId = ?", produceTaskProcess);
				}
				for (WOMPutInMaterialPart womPutInMaterialPart : womPutInMaterialParts) {
					WOMBatchChargeDetails chargeDetail = new WOMBatchChargeDetails();
					//实际投料量
					chargeDetail.setActualUseNum(womPutInMaterialPart.getUseNum());
					//批次
					chargeDetail.setBatch(womPutInMaterialPart.getBatchNum());
					//物品
					chargeDetail.setGood(womPutInMaterialPart.getProductId());
					if (exelog == null) {
						List<WOMProdTaskActiExelog> actiExelogs = new ArrayList<>();
						if (womPutInMaterialPart.getTaskActiveId() != null) {
							actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and taskActiveID=?",womPutInMaterialPart.getTaskActiveId());
						}else if(womPutInMaterialPart.getAdjustActive() != null) {
							actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and adjustRecordID=?",womPutInMaterialPart.getAdjustActive().getId());
						}
						if (!actiExelogs.isEmpty()) {
							//活动执行记录
							exelog = actiExelogs.get(0);
						}
					}
					chargeDetail.setTaskActiExelog(exelog);
					chargeDetail.setPutinStaff(womPutInMaterialPart.getPutinStaff());
					//物品
					chargeDetail.setGood(womPutInMaterialPart.getProductId());
					//投料开始时间
					chargeDetail.setPutinDate(womPutInMaterialPart.getPutinDate());
					//投料结束时间
					chargeDetail.setPutinEndDate(womPutInMaterialPart.getPutinEndDate());
					//出库 货位
					chargeDetail.setPlaceSet(womPutInMaterialPart.getStoreID());
					//出库 仓库
					chargeDetail.setWareID(womPutInMaterialPart.getWareID());
					//备注
					chargeDetail.setRemark(womPutInMaterialPart.getRemark());
					chargeDetails.add(chargeDetail);
				}
			}
		}
		return chargeDetails;
	}

	@Override
	public List<WOMBatchChargeDetails> getBatchingRecordByActive(Long activeId) {
		List<WOMBatchChargeDetails> chargeDetails = new ArrayList<>();
		List<WOMPutInMaterialPart> womPutInMaterialParts = new ArrayList<>();
		WOMProdTaskActiExelog exelog = null;
		if (activeId != null) {
			WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(activeId);
			if (produceTaskActive != null && (StringUtils.equals(produceTaskActive.getActiveType().getId(),"activeType/activeType3") || StringUtils.equals(produceTaskActive.getActiveType().getId(),"activeType/activeType2"))) {
				womPutInMaterialParts = putInMaterialPartService.findPutInMaterialPartsByHql(" from WOMPutInMaterialPart where valid = 1 and taskProcessId = ? and taskActiveId = ?", produceTaskActive.getOrderProcessId(),produceTaskActive);
				//通过活动查找活动执行记录
				List<WOMProdTaskActiExelog> actiExelogs = new ArrayList<>();
				if (StringUtils.equals(produceTaskActive.getActiveSource().getId(),"womActiveSource/03") || StringUtils.equals(produceTaskActive.getActiveSource().getId(),"womActiveSource/04")) {
					actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and taskActiveID=?",produceTaskActive);
				}else {
					actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and adjustRecordID=?",activeId);
				}
				if (!actiExelogs.isEmpty()) {
					exelog = actiExelogs.get(0);
				}
			}else {
				WOMAdjustOrTempRecords adjustOrTempRecords = adjustOrTempRecordsDao.get(activeId);
				if (adjustOrTempRecords != null && (StringUtils.equals(adjustOrTempRecords.getActiveType().getId(),"activeType/activeType3") || StringUtils.equals(adjustOrTempRecords.getActiveType().getId(),"activeType/activeType2"))){
					womPutInMaterialParts = putInMaterialPartService.findPutInMaterialPartsByHql(" from WOMPutInMaterialPart where valid = 1 and taskProcessId.id = ? and adjustActive = ?", adjustOrTempRecords.getProcessID(),adjustOrTempRecords);
				}
			}
		}
		for (WOMPutInMaterialPart womPutInMaterialPart : womPutInMaterialParts) {
			WOMBatchChargeDetails chargeDetail = new WOMBatchChargeDetails();
			//实际投料量
			chargeDetail.setActualUseNum(womPutInMaterialPart.getUseNum());
			//批次
			chargeDetail.setBatch(womPutInMaterialPart.getBatchNum());
			//物品
			chargeDetail.setGood(womPutInMaterialPart.getProductId());
			if (exelog == null) {
				List<WOMProdTaskActiExelog> actiExelogs = new ArrayList<>();
				if (womPutInMaterialPart.getTaskActiveId() != null) {
					actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and taskActiveID=?",womPutInMaterialPart.getTaskActiveId());
				}else if(womPutInMaterialPart.getAdjustActive() != null) {
					actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and adjustRecordID=?",womPutInMaterialPart.getAdjustActive().getId());
				}
				if (!actiExelogs.isEmpty()) {
					//活动执行记录
					exelog = actiExelogs.get(0);
				}
			}
			chargeDetail.setTaskActiExelog(exelog);
			chargeDetail.setPutinStaff(womPutInMaterialPart.getPutinStaff());
			//物品
			chargeDetail.setGood(womPutInMaterialPart.getProductId());
			//投料开始时间
			chargeDetail.setPutinDate(womPutInMaterialPart.getPutinDate());
			//投料结束时间
			chargeDetail.setPutinEndDate(womPutInMaterialPart.getPutinEndDate());
			//出库 货位
			chargeDetail.setPlaceSet(womPutInMaterialPart.getStoreID());
			//出库 仓库
			chargeDetail.setWareID(womPutInMaterialPart.getWareID());
			//备注
			chargeDetail.setRemark(womPutInMaterialPart.getRemark());
			chargeDetails.add(chargeDetail);
		}


		return chargeDetails;
	}

	/**
	 * 通过指令单 查找到当前指令单的所有投料记录
	 * 并根据不同的形式返回
	 * @param produceTaskId
	 * @return
	 */
	@Override
	public List<Map<String,Object>> getBatchingRecordByProduceTaskId(Long produceTaskId) {
		Map<String,Map<String,Object>> result = new HashMap<>();
		WOMProduceTask womProduceTask = produceTaskDao.get(produceTaskId);
		if (womProduceTask == null) {
			throw new BAPException("查找不到指令单记录！");
		}
		List<WOMPutInMaterialPart> womPutInMaterialParts = putInMaterialPartService.findPutInMaterialPartsByHql(" from WOMPutInMaterialPart where valid = 1 and taskID = ?", womProduceTask);
		for (WOMPutInMaterialPart womPutInMaterialPart : womPutInMaterialParts) {
			String product = womPutInMaterialPart.getProductId().getProductName() + "(物品编码：" + womPutInMaterialPart.getProductId().getProductCode() + ")";
			if (result.containsKey(product)) {
				result.get(product).put("totalUseNum",new BigDecimal(result.get(product).get("totalUseNum").toString()).add(womPutInMaterialPart.getUseNum()));
				String str = null;
				if (womPutInMaterialPart.getAdjustActive() == null) {
					str = "<span id='"+womPutInMaterialPart.getTaskActiveId().getId()+"' activeSource='"+womPutInMaterialPart.getTaskActiveId().getActiveSource().getId()+"'>" + womPutInMaterialPart.getTaskActiveId().getName() + "</span>";
					if (!StringUtils.contains(result.get(product).get("active").toString(),str)) {
						result.get(product).put("active",result.get(product).get("active").toString() + "," + str);
					}
				}else {
					str = "<span id='"+womPutInMaterialPart.getAdjustActive().getId()+"' activeSource='"+womPutInMaterialPart.getAdjustActive().getRecordDataSource().getId()+"'>" + womPutInMaterialPart.getAdjustActive().getActiceName() + "</span>";
					if (!StringUtils.contains(result.get(product).get("active").toString(),str)) {
						result.get(product).put("active",result.get(product).get("active").toString() + ","+str);
					}
				}
				String processStr = "<span id='"+womPutInMaterialPart.getTaskProcessId().getId()+"'>" + womPutInMaterialPart.getTaskProcessId().getName() + "</span>";
				if (!StringUtils.contains(result.get(product).get("process").toString(),processStr)) {
					result.get(product).put("process",result.get(product).get("process").toString() + "," + processStr);
				}
			}else {
				Map<String,Object> temp = new HashMap<>();
				temp.put("good",product);
				temp.put("totalUseNum",womPutInMaterialPart.getUseNum());
				temp.put("baseUnit",womPutInMaterialPart.getProductId().getProductBaseUnit().getName());
				if (womPutInMaterialPart.getAdjustActive() == null) {
					temp.put("active","<span id='"+womPutInMaterialPart.getTaskActiveId().getId()+"' activeSource='"+womPutInMaterialPart.getTaskActiveId().getActiveSource().getId()+"'>" + womPutInMaterialPart.getTaskActiveId().getName() + "</span>");
				}else {
					temp.put("active","<span id='"+womPutInMaterialPart.getAdjustActive().getId()+"' activeSource='"+womPutInMaterialPart.getAdjustActive().getRecordDataSource().getId()+"'>" + womPutInMaterialPart.getAdjustActive().getActiceName() + "</span>");
				}
				temp.put("process","<span id='"+womPutInMaterialPart.getTaskProcessId().getId()+"'>" + womPutInMaterialPart.getTaskProcessId().getName() + "</span>");
				result.put(product,temp);
			}
		}
		List<Map<String,Object>> resultList = new ArrayList<>();
		for (Map.Entry<String, Map<String, Object>> stringMapEntry : result.entrySet()) {
			resultList.add(stringMapEntry.getValue());
		}
		return resultList;
	}
	@Override
	public List<Map<String, Object>> getInspectDetails(Long activeId, String activeType) {
		List<Map<String,Object>> datas = new ArrayList<>();
		String sql = null;
		if (StringUtils.equals(activeType,"active")) {
			sql = "\n" +
					"SELECT THIS_.ID AS INSPECT_ID,\n" +
					"        THIS_.ACTIVE_ID,\n" +
					"        THIS_.PSID,\n" +
					"        THIS_.QM_BUSINESS_TYPE,\n" +
					"        THIS_.QUANTITY,\n" +
					"        THIS_.INSPECT_DATE,\n" +
					"        THIS_.BATCH_NUM,\n" +
					"        THIS_.PRODUCTID AS INSPECT_GOOD,\n" +
					"        THIS_.MEMO_FIELD AS REMARK,\n" +
					"        THIS_.DEPTID AS INSPECT_DEPTID,\n" +
					"        THIS_.STAFFID AS INSPECT_STAFFID,\n" +
					"        TASK.TASK_ACTIVEID AS TASKID,\n" +
					"        TASK.ACTIVE_NAME,\n" +
					"        DEPARTMENT.ID AS DEPARTMENT_ID,\n" +
					"        DEPARTMENT.NAME AS DEPARTMENT_NAME,\n" +
					"        PRODUCT.PRODUCT_ID AS PRODUCT_ID,\n" +
					"        PRODUCT.PRODUCT_NAME AS PRODUCT_NAME,\n" +
					"        PRODUCT.PRODUCT_CODE AS PRODUCT_CODE,\n" +
					"        PRODUCT.UNIT AS PRODUCT_UNIT,\n" +
					"        STAFF.ID AS STAFF_ID,\n" +
					"        STAFF.NAME AS STAFF_NAME,\n" +
					"        SITE.ID AS SITE_ID,\n" +
					"        SITE.NAME AS SITE_NAME,\n" +
					"        THIS_.PART_CODE" +
					"\n" +
					"FROM \n" +
					"      QUALITYMAN_MANU_INSPECTS THIS_ LEFT JOIN wom_prod_task_acti_exelogs TASK \n" +
					"      ON THIS_.ACTIVE_ID = TASK.TASKID LEFT JOIN BASE_DEPARTMENT DEPARTMENT \n" +
					"      ON THIS_.DEPTID = DEPARTMENT.ID LEFT JOIN S2BASE_PRODUCT PRODUCT \n" +
					"      ON THIS_.PRODUCTID = PRODUCT.PRODUCT_ID LEFT JOIN BASE_STAFF STAFF \n" +
					"      ON THIS_.STAFFID = STAFF.ID LEFT JOIN LIMSBASIC_PICK_SITES SITE \n" +
					"      ON THIS_.PSID = SITE.ID\n" +
					"      \n" +
					"      \n" +
					"      \n" +
					"      WHERE THIS_.ACTIVE_ID = (\n" +
					"      SELECT ID\n" +
					"      FROM wom_prod_task_acti_exelogs\n" +
					"      WHERE VALID = 1\n" +
					"      AND TASK_ACTIVEID = ?)\n";
			List<Object[]> list = prodTaskActiExelogDao.createNativeQuery(sql, activeId).list();
			for (Object[] data : list) {
				//获取需要的数据
				Map<String,Object> map = new HashMap<>();
				if (data[3] != null) {
					map.put("QM_BUSINESS_TYPE",data[3].toString());
				}else {
					map.put("QM_BUSINESS_TYPE","");
				}
				if (data[4] != null) {
					map.put("QUANTITY",data[4].toString());
				}else {
					map.put("QUANTITY","");
				}
				if (data[5] != null) {
					map.put("INSPECT_DATE",data[5].toString());
				}else {
					map.put("INSPECT_DATE","");
				}
				if (data[6] != null) {
					map.put("BATCH_NUM",data[6].toString());
				}else {
					map.put("BATCH_NUM","");
				}
				if (data[8] != null) {
					map.put("REMARK",data[8].toString());
				}else {
					map.put("REMARK","");
				}
				if (data[12] != null) {
					map.put("ACTIVE_NAME",data[12].toString());
				}else {
					map.put("ACTIVE_NAME","");
				}
				if (data[14] != null) {
					map.put("DEPARTMENT_NAME",data[14].toString());
				}else {
					map.put("DEPARTMENT_NAME","");
				}
				if (data[16] != null) {
					map.put("PRODUCT_NAME",data[16].toString());
				}else {
					map.put("PRODUCT_NAME","");
				}
				if (data[17] != null) {
					map.put("PRODUCT_CODE",data[17].toString());
				}else {
					map.put("PRODUCT_CODE","");
				}
				if (data[18] != null) {
					map.put("PRODUCT_UNIT",data[18].toString());
				}else {
					map.put("PRODUCT_UNIT","");
				}
				if (data[20] != null) {
					map.put("STAFF_NAME",data[20].toString());
				}else {
					map.put("STAFF_NAME","");
				}
				if (data[22] != null) {
					map.put("SITE_NAME",data[22].toString());
				}else {
					map.put("SITE_NAME","");
				}
				if (data[23] != null) {
					map.put("PART_CODE",data[23].toString());
				}else {
					map.put("PART_CODE","");
				}
				datas.add(map);
			}
		}else {

		}
		return datas;
	}
	/**
	 * 通过批次号 查询批次所有的操作记录
	 * @param batchNum
	 * @return
	 */
	@Override
	public BatchAnalyze getBatchInfo(String batchNum) {
		BatchAnalyze batchAnalyze = new BatchAnalyze();
		List<Map<String,Object>> events = new ArrayList<>();

		if (StringUtils.isNotBlank(batchNum)) {
			PublicSetBatchInfo batchInfo = batchInfoService.getBybatchNumNoException(batchNum);
			if (batchInfo != null) {
				batchAnalyze.setProduct(batchInfo.getProduct());

				if (StringUtils.equals(batchInfo.getSourceType().getId(),"publicSetSourceType/04")) {   //生产报工
					List<WOMTaskReporting> reportings = taskReportingService.findTaskReportingsByHql(" from WOMTaskReporting where valid = 1 and batchNum = ?",batchNum);
					if (!reportings.isEmpty()) {
						WOMTaskReporting reporting = reportings.get(0);
						batchAnalyze.setTaskReporting(reporting);
					}

				}else  if (StringUtils.equals(batchInfo.getSourceType().getId(),"publicSetSourceType/01")) {    //采购到货
					batchAnalyze.setBasicBaseVendor(batchInfo.getVendor());
				}
			}
			//通过批号查询质检记录
			List<Map<String, Object>> inspectDetails = getInspectDetailsByBatchNum(batchNum);
			batchAnalyze.setEvents(inspectDetails);
			//通过批号查询领料记录
			List<Map<String, Object>> requisitionDetails = getRequisitionDetailsByBatchNum(batchNum);
			batchAnalyze.setEvents(inspectDetails);
		}
		return batchAnalyze;
	}

	private List<Map<String, Object>> getRequisitionDetailsByBatchNum(String batchNum) {
		List<Map<String, Object>> details = new ArrayList<>();
		List<WOMBatchingMaterialPart> parts = batchingMaterialPartService.findBatchingMaterialPartsByHql(" from WOMBatchingMaterialPart where valid = 1 and batchNum = ?",batchNum);
		for (WOMBatchingMaterialPart part : parts) {
			Map<String,Object> map = new HashMap<>();
			map.put("exeDate",part.getExeDate());   //配料时间
			map.put("exeStaff",part.getExeStaff());   //配料操作人
			map.put("doneNum",part.getDoneNum());   //配料数量
			map.put("receiveDate",part.getReceiveDate());   //配料接收时间
			map.put("receiveStaff",part.getReceiveStaff());   //配料接收人
			map.put("ware",part.getWareID());   //仓库
			map.put("store",part.getStoreID());   //货位
			map.put("state",part.getState());   //状态
			map.put("remark",part.getRemark());   //备注
			details.add(map);
		}
		return details;
	}

	private List<Map<String,Object>> getInspectDetailsByBatchNum(String batchNum) {
		List<Map<String,Object>> inspects = new ArrayList<>();
		String sql = "SELECT THIS_.ID AS INSPECT_ID,\n" +
				"        THIS_.ACTIVE_ID,\n" +
				"        THIS_.PSID,\n" +
				"        THIS_.QM_BUSINESS_TYPE,\n" +
				"        THIS_.QUANTITY,\n" +
				"        THIS_.INSPECT_DATE,\n" +
				"        THIS_.BATCH_NUM,\n" +
				"        THIS_.PRODUCTID AS INSPECT_GOOD,\n" +
				"        THIS_.MEMO_FIELD AS REMARK,\n" +
				"        THIS_.DEPTID AS INSPECT_DEPTID,\n" +
				"        THIS_.STAFFID AS INSPECT_STAFFID,\n" +
				"        TASK.TASK_ACTIVEID AS TASKID,\n" +
				"        TASK.ACTIVE_NAME,\n" +
				"        DEPARTMENT.ID AS DEPARTMENT_ID,\n" +
				"        DEPARTMENT.NAME AS DEPARTMENT_NAME,\n" +
				"        PRODUCT.PRODUCT_ID AS PRODUCT_ID,\n" +
				"        PRODUCT.PRODUCT_NAME AS PRODUCT_NAME,\n" +
				"        PRODUCT.PRODUCT_CODE AS PRODUCT_CODE,\n" +
				"        PRODUCT.UNIT AS PRODUCT_UNIT,\n" +
				"        STAFF.ID AS STAFF_ID,\n" +
				"        STAFF.NAME AS STAFF_NAME,\n" +
				"        SITE.ID AS SITE_ID,\n" +
				"        SITE.NAME AS SITE_NAME,\n" +
				"        THIS_.VALID AS VALID\n" +
				"\n" +
				"FROM \n" +
				"      QUALITYMAN_MANU_INSPECTS THIS_ LEFT JOIN wom_prod_task_acti_exelogs TASK \n" +
				"      ON THIS_.ACTIVE_ID = TASK.TASKID LEFT JOIN BASE_DEPARTMENT DEPARTMENT \n" +
				"      ON THIS_.DEPTID = DEPARTMENT.ID LEFT JOIN S2BASE_PRODUCT PRODUCT \n" +
				"      ON THIS_.PRODUCTID = PRODUCT.PRODUCT_ID LEFT JOIN BASE_STAFF STAFF \n" +
				"      ON THIS_.STAFFID = STAFF.ID LEFT JOIN LIMSBASIC_PICK_SITES SITE \n" +
				"      ON THIS_.PSID = SITE.ID\n" +
				"      \n" +
				"      \n" +
				"      \n" +
				"      WHERE THIS_.batch_num = ? and THIS_.valid = 1";
		List<Object[]> list = prodTaskActiExelogDao.createNativeQuery(sql, batchNum).list();
		for (Object[] data : list) {
			//获取需要的数据
			Map<String,Object> map = new HashMap<>();
			if (data[3] != null) {
				map.put("QM_BUSINESS_TYPE",data[3].toString());
			}else {
				map.put("QM_BUSINESS_TYPE","");
			}
			if (data[4] != null) {
				map.put("QUANTITY",data[4].toString());
			}else {
				map.put("QUANTITY","");
			}
			if (data[5] != null) {
				map.put("INSPECT_DATE",((java.sql.Timestamp)data[5]).getTime());
			}else {
				map.put("INSPECT_DATE","");
			}
			if (data[6] != null) {
				map.put("BATCH_NUM",data[6].toString());
			}else {
				map.put("BATCH_NUM","");
			}
			if (data[8] != null) {
				map.put("REMARK",data[8].toString());
			}else {
				map.put("REMARK","");
			}
			if (data[12] != null) {
				map.put("ACTIVE_NAME",data[12].toString());
			}else {
				map.put("ACTIVE_NAME","");
			}
			if (data[14] != null) {
				map.put("DEPARTMENT_NAME",data[14].toString());
			}else {
				map.put("DEPARTMENT_NAME","");
			}
			if (data[16] != null) {
				map.put("PRODUCT_NAME",data[16].toString());
			}else {
				map.put("PRODUCT_NAME","");
			}
			if (data[17] != null) {
				map.put("PRODUCT_CODE",data[17].toString());
			}else {
				map.put("PRODUCT_CODE","");
			}
			if (data[18] != null) {
				map.put("PRODUCT_UNIT",data[18].toString());
			}else {
				map.put("PRODUCT_UNIT","");
			}
			if (data[20] != null) {
				map.put("STAFF_NAME",data[20].toString());
			}else {
				map.put("STAFF_NAME","");
			}
			if (data[22] != null) {
				map.put("SITE_NAME",data[22].toString());
			}else {
				map.put("SITE_NAME","");
			}
			inspects.add(map);
		}
		return inspects;
	}


	//////////////////////////////////////////////////////MES向批控接口
	//开始工单
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public Map startBatchSync(String productBatchNum, String logid) {
		Map<String, Object> messageMap = new HashMap<String, Object>();
		Boolean isSuccess = false;
		String message = null;
		WOMProduceTask produceTask = new WOMProduceTask();
		if (null == productBatchNum || "".equals(productBatchNum)) {
			message = "生产批号不存在";
		} else {
			produceTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("status", 99),Restrictions.eq("productBatchNum", productBatchNum));
			//findEntityByProperty("productBatchNum", productBatchNum);
			if (produceTask != null) {
				String batchId = produceTask.getBatchProdTaskID();
				String interfaceUrl = getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) != null
						&& getUrl(produceTask.getFormularId().getInterfaceUrl().getId()).length() > 0
						? "http://" + getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) + ":8081/" : "http://localhost:8081/";
				if (batchId != null) {
					StringBuilder batchJson = new StringBuilder("[{");
					batchJson.append("\"ID\":" + batchId); // 批控控制配方Id
					batchJson.append("}]");
					Map<String, String> createMap = new HashMap<String, String>();
					createMap.put("batch", batchJson.toString());
					String refFormula = rmInterFaceSyncLogService.sendSmsPost(interfaceUrl + "batch/start", createMap);
					if (refFormula.contains("dealSuccessFlag=true")) {
						isSuccess = true;
						produceTask.setBatchTaskState(new SystemCode("womBatchTaskState/02"));
						produceTaskDao.save(produceTask);
						produceTaskDao.flush();
					} else {
						//message = "批控执行错误:" + refFormula.substring(refFormula.lastIndexOf("=")+1,refFormula.lastIndexOf("}"));
						message = "批控执行错误:" + refFormula;
					}
				} else {
					message = "制造指令单未关联批控";
				}
			} else {
				message = "通过生产批号获取不到制造指令单";
			}
		}
		List<Map<String, String>> logMap = setwordOrderLogMap(isSuccess, productBatchNum, message, "startBatch", logid);
		insertLog(logMap, false);
		messageMap.put("productBatchNum", productBatchNum);
		messageMap.put("flag", isSuccess);
		if (isSuccess) {
			messageMap.put("state", "运行");
		}
		messageMap.put("message", message);
		return messageMap;
	}

	//停止工单
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public Map stopBatchSync(String productBatchNum, String logid) {
		Map<String, Object> messageMap = new HashMap<String, Object>();
		Boolean isSuccess = false;
		String message = null;
		WOMProduceTask produceTask = new WOMProduceTask();
		if (null == productBatchNum || "".equals(productBatchNum)) {
			message = "生产批号不存在";
		} else {
			produceTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("status", 99),Restrictions.eq("productBatchNum", productBatchNum));
			if (produceTask != null) {
				String batchId = produceTask.getBatchProdTaskID();
				String interfaceUrl = getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) != null && getUrl(produceTask.getFormularId().getInterfaceUrl().getId()).length() > 0
						? "http://" + getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) + ":8081/" : "http://localhost:8081/";
				if (batchId != null) {
					StringBuilder batchJson = new StringBuilder("[{");
					batchJson.append("\"ID\":" + batchId); // 批控控制配方Id
					batchJson.append("}]");
					Map<String, String> createMap = new HashMap<String, String>();
					createMap.put("batch", batchJson.toString());
					String refFormula = rmInterFaceSyncLogService.sendSmsPost(interfaceUrl + "batch/stop", createMap);
					if (refFormula.contains("dealSuccessFlag=true")) {
						isSuccess = true;
						//设置工单状态为停止中
						produceTask.setBatchTaskState(new SystemCode("womBatchTaskState/05"));
						produceTaskDao.save(produceTask);
					} else {
						//message = "批控执行错误:" + refFormula.substring(refFormula.lastIndexOf("=")+1,refFormula.lastIndexOf("}"));
						message = "批控执行错误:" + refFormula;
					}
				} else {
					message = "制造指令单未关联批控";
				}
			} else {
				message = "通过生产批号获取不到制造指令单";
			}
		}
		List<Map<String, String>> logMap = setwordOrderLogMap(isSuccess, produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "", message, "stopBatch", logid);
		insertLog(logMap, false);
		messageMap.put("productBatchNum", produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "");
		messageMap.put("flag", isSuccess);
		if (isSuccess) {
			messageMap.put("state", "停止中");
		}
		messageMap.put("message", message);
		return messageMap;
	}


	//暂停工单
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public Map pauseBatchSync(String productBatchNum, String logid) {
		Map<String, Object> messageMap = new HashMap<String, Object>();
		Boolean isSuccess = false;
		String message = null;
		WOMProduceTask produceTask = new WOMProduceTask();
		if (null == productBatchNum || "".equals(productBatchNum)) {
			message = "生产批号不存在";
		} else {
			produceTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("status", 99),Restrictions.eq("productBatchNum", productBatchNum));
			if (produceTask != null) {
				if (produceTask.getBatchTaskState() != null && !"womBatchTaskState/02".equals(produceTask.getBatchTaskState().getId())) {
					message = "制造指令单状态不为执行中，请刷新后重试";
				} else {
					String batchId = produceTask.getBatchProdTaskID();
					String interfaceUrl = getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) != null && getUrl(produceTask.getFormularId().getInterfaceUrl().getId()).length() > 0
							? "http://" + getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) + ":8081/" : "http://localhost:8081/";
					if (batchId != null) {
						StringBuilder batchJson = new StringBuilder("[{");
						batchJson.append("\"ID\":" + batchId); // 批控控制配方Id
						batchJson.append("}]");
						Map<String, String> createMap = new HashMap<String, String>();
						createMap.put("batch", batchJson.toString());
						String refFormula = rmInterFaceSyncLogService.sendSmsPost(interfaceUrl + "batch/pause", createMap);
						if (refFormula.contains("dealSuccessFlag=true")) {
							isSuccess = true;
							//设置工单状态为暂停中
							produceTask.setBatchTaskState(new SystemCode("womBatchTaskState/06"));
							produceTaskDao.save(produceTask);
						} else {
							//message = "批控执行错误:" + refFormula.substring(refFormula.lastIndexOf("=")+1,refFormula.lastIndexOf("}"));
							message = "批控执行错误:" + refFormula;
						}
					} else {
						message = "制造指令单未关联批控";
					}
				}
			} else {
				message = "通过生产批号获取不到制造指令单";
			}
		}
		List<Map<String, String>> logMap = setwordOrderLogMap(isSuccess, produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "", message, "pauseBatch", logid);
		insertLog(logMap, false);
		messageMap.put("productBatchNum", produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "");
		messageMap.put("flag", isSuccess);
		if (isSuccess) {
			messageMap.put("state", "暂停中");
		}
		messageMap.put("message", message);
		return messageMap;
	}



	//恢复工单
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public Map resumeBatchSync(String productBatchNum, String logid) {
		Map<String, Object> messageMap = new HashMap<String, Object>();
		Boolean isSuccess = false;
		String message = null;
		WOMProduceTask produceTask = new WOMProduceTask();
		if (null == productBatchNum || "".equals(productBatchNum)) {
			message = "生产批号不存在";
		} else {
			produceTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("status", 99),Restrictions.eq("productBatchNum", productBatchNum));
			//produceTask = getProduceTask(Integer.valueOf(taskId));
			if (produceTask != null) {
				if (produceTask.getBatchTaskState() != null && !"womBatchTaskState/07".equals(produceTask.getBatchTaskState().getId())) {
					message = "制造指令单状态不为已暂停，请刷新后重试";
				} else {
					String batchId = produceTask.getBatchProdTaskID();
					String interfaceUrl = getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) != null
							&& getUrl(produceTask.getFormularId().getInterfaceUrl().getId()).length() > 0
							? "http://" + getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) + ":8081/" : "http://localhost:8081/";
					if (batchId != null) {
						StringBuilder batchJson = new StringBuilder("[{");
						batchJson.append("\"ID\":" + batchId); // 批控控制配方Id
						batchJson.append("}]");
						Map<String, String> createMap = new HashMap<String, String>();
						createMap.put("batch", batchJson.toString());
						String refFormula = rmInterFaceSyncLogService.sendSmsPost(interfaceUrl + "batch/resume", createMap);
						if (refFormula.contains("dealSuccessFlag=true")) {
							isSuccess = true;
							//设置工单状态为恢复中
							produceTask.setBatchTaskState(new SystemCode("womBatchTaskState/10"));
							produceTaskDao.save(produceTask);
						} else {
							//message = "批控执行错误:" + refFormula.substring(refFormula.lastIndexOf("=")+1,refFormula.lastIndexOf("}"));
							message = "批控执行错误:" + refFormula;
						}
					} else {
						message = "制造指令单未关联批控";
					}
				}
			} else {
				message = "通过生产批号获取不到制造指令单";
			}
		}
		List<Map<String, String>> logMap = setwordOrderLogMap(isSuccess, produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "", message, "resumeBatch", logid);
		System.out.println("测试数据" + logMap);
		insertLog(logMap, false);
		messageMap.put("productBatchNum", produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "");
		messageMap.put("flag", isSuccess);
		if (isSuccess) {
			messageMap.put("state", "恢复运行中");
		}
		messageMap.put("message", message);
		return messageMap;

	}


	//放弃工单
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public Map abortBatchSync(String productBatchNum, String logid) {
		Map<String, Object> messageMap = new HashMap<String, Object>();
		Boolean isSuccess = false;
		String message = null;
		WOMProduceTask produceTask = new WOMProduceTask();
		if (null == productBatchNum || "".equals(productBatchNum)) {
			message = "生产批号不存在";
		} else {
			produceTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("status", 99),Restrictions.eq("productBatchNum", productBatchNum));
			if (produceTask != null) {
				String batchId = produceTask.getBatchProdTaskID();
				String interfaceUrl = getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) != null
						&& getUrl(produceTask.getFormularId().getInterfaceUrl().getId()).length() > 0
						? "http://" + getUrl(produceTask.getFormularId().getInterfaceUrl().getId()) + ":8081/" : "http://localhost:8081/";
				if (batchId != null) {
					StringBuilder batchJson = new StringBuilder("[{");
					batchJson.append("\"ID\":" + batchId); // 批控控制配方Id
					batchJson.append("}]");
					Map<String, String> createMap = new HashMap<String, String>();
					createMap.put("batch", batchJson.toString());
					String refFormula = rmInterFaceSyncLogService.sendSmsPost(interfaceUrl + "batch/abort", createMap);
					if (refFormula.contains("dealSuccessFlag=true")) {
						isSuccess = true;
						//设置工单状态为放弃中
						produceTask.setBatchTaskState(new SystemCode("womTaskState/08"));
						produceTaskDao.save(produceTask);
					} else {
						//message = "批控执行错误:" + refFormula.substring(refFormula.lastIndexOf("=")+1,refFormula.lastIndexOf("}"));
						message = "批控执行错误:" + refFormula;
					}
				} else {
					message = "制造指令单未关联批控";
				}

			} else {
				message = "通过生产批号获取不到制造指令单";
			}
		}
		List<Map<String, String>> logMap = setwordOrderLogMap(isSuccess, produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "", message, "abortBatch", logid);
		insertLog(logMap, false);
		messageMap.put("productBatchNum", produceTask.getProductBatchNum() != null ? produceTask.getProductBatchNum() : "");
		messageMap.put("flag", isSuccess);
		if (isSuccess) {
			messageMap.put("state", "放弃中");
		}
		messageMap.put("message", message);
		return messageMap;

	}

	//组织工单日志参数
	public List<Map<String, String>> setwordOrderLogMap(Boolean isSuccess, String ids, String returnValue, String operationType, String logids) {
		List<Map<String, String>> maplist = new ArrayList<Map<String, String>>();
		maplist = new ArrayList<Map<String, String>>();
		WOMProduceTask prodTask = null;
		//prodTask = getProduceTask(Long.parseLong(idarr[i]));
		prodTask = findEntityByProperty("productBatchNum",
				ids);
		if (null != prodTask) {
			Map<String, String> logMap = new HashMap<String, String>();
			logMap.put("logSynFlag", isSuccess.toString());//logSynFlag（数据同步状态）
			logMap.put("logID", prodTask.getProductBatchNum());//logID（数据PK值）
			logMap.put("logTypeDes", prodTask.getProductBatchNum());//
			logMap.put("logType", "workOrder");//logType（数据类型）
			logMap.put("logOperate", operationType);//logOperate（操作类型）
			if (!isSuccess && prodTask.getStatus() == 99) {
				logMap.put("logIsIgnore", "false");//logIsIgnore（是否忽视）
			}
			if (isSuccess) {
				logMap.put("logFault", "success");//logSynFlag（数据同步状态）
			} else {
				logMap.put("logFault", returnValue);
			}
			if (null != logids && null != logids) {
				logMap.put("logid", logids);//interface_sync_log表id
			}
			maplist.add(logMap);
		}
		return maplist;
	}

	private Long oldFormulaId;
	private BigDecimal oldQuantity;

	@Override
	public WOMResult getAutoFinishReporting(Long forluma, Long factoryLineId) {
		if (factoryLineId != null && forluma != null) {
			String data = null;
			List<Object> list = produceTaskDao.createNativeQuery("SELECT AUTO_REPORT_ON_FINISH FROM RM_LINE_FORMULAS WHERE VALID = 1 AND LINE_ID = ? AND FORMULA_ID = ? order by ID ", factoryLineId, forluma).list();
			if (!list.isEmpty() && list.get(0) != null) {
				data = list.get(0).toString();
			}
			return new WOMResult(ResultEnum.SUCCESS,data);
		}
		return new WOMResult(ResultEnum.FAILED);
	}

	@Override
	public List getFormulaIdByformulaCode(String formulaCode) {
		List<Object> list =  produceTaskDao.createNativeQuery("SELECT ID FROM rm_formulas WHERE VALID = 1 and code= ? and state = ? ",formulaCode ,"RMstate/state2" ).list();
		return list;
	}

	public static String Code = "AutoprepareMaterial";


	/**
	 * 下推生成备料单
	 * @param produceTask 指令单
	 *
	 */
	public void autoCreatPrepareTask(WOMProduceTask produceTask){
		//处理表头表体
		List<WOMPrepareMaterialPart> partList = new ArrayList<>();
		final WOMPrepareMaterial prepareMaterial = new WOMPrepareMaterial();
		final List<WOMPrepareMaterialPart> prepareMaterialParts = prepareMaterialService.getTaskPart(produceTask.getId().toString(), partList);//备料明细
		Staff staff = produceTask.getManuOrderMain().getManulStaff();
		if (null ==staff){
			throw new BAPException("查询不到订单中的生产人员！！");
		}
		Long positionId = staff.getMainPosition().getId();
		prepareMaterial.setApplyStaff(staff);
		prepareMaterial.setApplyDate(new Date());
		prepareMaterial.setManulOrderMain(produceTask.getManuOrderMain());

		prepareMaterial.setCreateStaff(staff);
		prepareMaterial.setCreateStaffId(staff.getId());
		prepareMaterial.setCreateDepartment(staff.getMainPosition().getDepartment());
		prepareMaterial.setCreateDepartmentId(staff.getMainPosition().getDepartment().getId());
		prepareMaterial.setOwnerDepartmentId(staff.getMainPosition().getDepartment().getId());
		prepareMaterial.setOwnerDepartment(staff.getMainPosition().getDepartment());
		prepareMaterial.setOwnerPositionId(positionId);
		prepareMaterial.setOwnerPosition(staff.getMainPosition());
		prepareMaterial.setCreatePosition(staff.getMainPosition());
		prepareMaterial.setOwnerStaff(staff);
		prepareMaterial.setOwnerStaffId(staff.getId());
		prepareMaterial.setCreatePositionId(positionId);
		prepareMaterial.setValid(true);
		prepareMaterial.setVersion(0);
		prepareMaterial.setCid(staff.getMainPosition().getCompany().getId());

		DataGridService dataGridService = new DataGridService() {
			@Override
			public void execute() {
				if (null!=prepareMaterialParts && !prepareMaterialParts.isEmpty()){
					for (WOMPrepareMaterialPart materialPart : prepareMaterialParts) {
						materialPart.setFormulaId(prepareMaterial);
						materialPart.setTableInfoId(prepareMaterial.getTableInfoId());
						prepareMaterialPartService.savePrepareMaterialPart(materialPart,null);
					}
				}
			}
		};

		/*处理工作流*/
		PublicSetWorkflowState workflowState = getworkFlowKey(Code);
		WorkFlowVar workFlowVar = new WorkFlowVar();
		String workflowKey = workflowState.getWorkflowKey();
		//校验工作流是否存在
		Map<String, Object> workflowMap = getWorkflowIdVersion(workflowKey);
		if (null != workflowMap.get("errorMsg") && !workflowMap.get("errorMsg").toString().isEmpty()) {
			throw new BAPException(workflowMap.get("errorMsg").toString());
		}
		workFlowVar = generateWorkFlowVarByWorkState(staff, workflowState);

		// 如果单据为保存
		if ("workFlowType/save".equals(workflowState.getWorkFlowType().getId())) {
			prepareMaterialService.save(prepareMaterial, Long.parseLong(workflowMap.get("workflowId").toString()), null, workFlowVar, dataGridService);

		}

		// 如果单据为提交
		if ("workFlowType/submit".equals(workflowState.getWorkFlowType().getId())) {
         	prepareMaterial.setIncode("i"+new Date().getTime());
			prepareMaterial.setOutCode("o"+new Date().getTime());
			prepareMaterialService.submit(prepareMaterial, Long.parseLong(workflowMap.get("workflowId").toString()), null, workFlowVar, dataGridService);
		}

		// 如果单据为生效状态
		if ("workFlowType/effect".equals(workflowState.getWorkFlowType().getId())) {
         	prepareMaterial.setIncode("i"+new Date().getTime());
			prepareMaterial.setOutCode("o"+new Date().getTime());
			prepareMaterial.setEffectStaff(staff);
			prepareMaterial.setEffectTime(new Date());
			Deployment d = taskService.getDeployment(Long.parseLong(workflowMap.get("workflowId").toString()));
			prepareMaterial.setDeploymentId(d.getId());
			prepareMaterialService.saveSuperEditPrepareMaterial(prepareMaterial, workFlowVar, dataGridService, "material_1.0_defrost_defrostEdit", false);
		}

	}
	@Autowired
	private PublicSetWorkflowStateService workflowStateService;
	@Autowired
	private  PublicSetWorkStateStaffService workStateStaffService;
	/**
	 * 获取对应的工作流信息
	 * @param workflowCode
	 */
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public  Map<String, Object> getWorkflowIdVersion(String workflowCode) {
		Map<String, Object> map = new HashMap<String, Object>(16);
		String errorMsg = "";
		String workflowId = "";
		String workflowVersion = "";
		try {
			String strSql = "select id, process_version from wf_deployment where valid = 1 and is_current_version = 1 and process_key = ?";
			Query query = prepareMaterialDao.createNativeQuery(strSql, workflowCode);
			if (!query.list().isEmpty()) {
				Object []obj = (Object [])query.list().get(0);
				workflowId = String.valueOf(obj[0]);
				workflowVersion = String.valueOf(obj[1]);
			} else {
				// 未找到对应的工作流信息
				errorMsg = InternationalResource.get("material.workflow.notFound404");
			}
		} catch (Exception ex) {
			errorMsg = ex.getMessage();
		}
		map.put("workflowId", workflowId);
		map.put("workflowVersion", workflowVersion);
		map.put("errorMsg", errorMsg);
		return map;
	}



	/**
	 * 检测并返回不同阶段的workFlowVar对象
	 * @author yaoyao
	 * @param workflowState
	 * @param staff
	 * @return workFlowVar
	 */
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public  WorkFlowVar generateWorkFlowVarByWorkState(Staff staff, PublicSetWorkflowState workflowState){
		WorkFlowVar workFlowVar = new WorkFlowVar();
		List<Map<String, ?>> outcomeMapsList = new ArrayList<>();
		Map<String, Object> outcomeMap = new HashMap<>(16);

		String workflowKey = workflowState.getWorkflowKey();

		//查询整理待办人员
		List<PublicSetWorkStateStaff> workStateStaffs = workStateStaffService.findWorkStateStaffsByHql("from PublicSetWorkStateStaff where workflowStateSetid.id = ? and valid = true", workflowState.getId());

		Set<Long> addUserIds = new HashSet<>();

		for (PublicSetWorkStateStaff waitStaff : workStateStaffs){
			if (null != waitStaff.getStaff() && null != waitStaff.getStaff().getUser()) {
				Long staffId = waitStaff.getStaff().getUser().getId();
				addUserIds.add(staffId);
			}
		}

		if (null != workflowKey){
			Map<String, Object> workflowMap = getWorkflowIdVersion(workflowKey);
			Long deploymentId = Long.parseLong(workflowMap.get("workflowId").toString());

			if(null != workflowState.getWorkFlowType()) {
				if ("workFlowType/save".equals(workflowState.getWorkFlowType().getId())) {
					//如果未配置待办人员,则去根据权限,查询待办人员
					if (addUserIds.isEmpty()) {
						List<Long> workflowUsers = dataPermissionService.getPowerUserList(staff.getUser().getId(), processService.findStartTransitions(deploymentId).getDestination().getName(), workflowKey, workflowMap.get("workflowVersion").toString(), staff.getMainPositionId(), null, false);
						addUserIds.addAll(workflowUsers);
					}

					outcomeMap.put("dec", "提交");
					outcomeMap.put("type", "normal");
					outcomeMap.put("assignUser", staff.getUser().getId().toString());
					outcomeMap.put("outcome", processService.findStartTransitions(deploymentId).getName());

					outcomeMapsList.add(outcomeMap);

					workFlowVar.setAdditionalUsers(addUserIds);
					workFlowVar.setOperateType("save");
					workFlowVar.setOutcomeMap(outcomeMapsList);
				} else if ("workFlowType/submit".equals(workflowState.getWorkFlowType().getId())) {
					//如果未配置待办人员,则去根据权限,查询待办人员
					if (addUserIds.isEmpty()) {
						List<Long> workflowUsers = dataPermissionService.getPowerUserList(staff.getUser().getId(), processService.findStartTransitions(deploymentId).getDestination().getName(), workflowKey, workflowMap.get("workflowVersion").toString(), staff.getMainPositionId(), null, false);
						addUserIds.addAll(workflowUsers);
					}

					outcomeMap.put("dec", "提交");
					outcomeMap.put("type", "normal");
					outcomeMap.put("outcome", workflowState.getOperateCode());

					outcomeMapsList.add(outcomeMap);

					workFlowVar.setAdditionalUsers(addUserIds);
					workFlowVar.setOperateType("submit");
					workFlowVar.setOutcomeMap(outcomeMapsList);
				} else if ("workFlowType/effect".equals(workflowState.getWorkFlowType().getId())){
					outcomeMap.put("dec", "生效");
					outcomeMap.put("type", "normal");
					org.jbpm.api.model.Transition endTransitions = processService.findEndTransitions(deploymentId);//取迁移线
					outcomeMap.put("outcome", endTransitions.getName());
					outcomeMapsList.add(outcomeMap);
					workFlowVar.setOperateType("submit");
					workFlowVar.setOutcomeMap(outcomeMapsList);
				}
			}
		}

		return workFlowVar;
	}
	public PublicSetWorkflowState getworkFlowKey(String code){
		PublicSetWorkflowState workflowState = null;
		List<Object> params = new ArrayList<>();
		params.add(code);
		List<PublicSetWorkflowState> workflowStateList = workflowStateService.getWorkflowStates("code = ? and valid = 1", params);
		if (workflowStateList.size() > 0) {
			workflowState = workflowStateList.get(0);
		}
//        WorkFlowVar workFlowVar = new WorkFlowVar();
//        String workflowKey = workflowState.getWorkflowKey();
		if (null ==workflowState||workflowState.getId().toString().isEmpty()){
			throw new BAPException("找不到"+code+"对应的工作流状态配置");
		}
		return workflowState;
	}
/* CUSTOM CODE END */
}
