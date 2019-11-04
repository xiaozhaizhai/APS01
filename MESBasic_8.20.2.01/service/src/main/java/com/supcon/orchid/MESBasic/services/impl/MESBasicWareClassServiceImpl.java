package com.supcon.orchid.MESBasic.services.impl;
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
import com.supcon.orchid.MESBasic.entities.MESBasicWareClassMneCode;
import com.supcon.orchid.MESBasic.services.MESBasicWareClassService;
import com.supcon.orchid.MESBasic.services.MESBasicWareClassImportService;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClassDealInfo;
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
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.ec.enums.ShowType;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.daos.MESBasicBatchDataDao;
import com.supcon.orchid.MESBasic.services.MESBasicBatchDataService;
import com.supcon.orchid.MESBasic.entities.MESBasicCommDealInfo;
import com.supcon.orchid.MESBasic.daos.MESBasicCommDealInfoDao;
import com.supcon.orchid.MESBasic.services.MESBasicCommDealInfoService;
import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;
import com.supcon.orchid.MESBasic.daos.MESBasicCprodAttDao;
import com.supcon.orchid.MESBasic.services.MESBasicCprodAttService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdDealInfo;
import com.supcon.orchid.MESBasic.daos.MESBasicProdDealInfoDao;
import com.supcon.orchid.MESBasic.services.MESBasicProdDealInfoService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdLevel;
import com.supcon.orchid.MESBasic.daos.MESBasicProdLevelDao;
import com.supcon.orchid.MESBasic.services.MESBasicProdLevelService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdResetDaily;
import com.supcon.orchid.MESBasic.daos.MESBasicProdResetDailyDao;
import com.supcon.orchid.MESBasic.services.MESBasicProdResetDailyService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdSecUnit;
import com.supcon.orchid.MESBasic.daos.MESBasicProdSecUnitDao;
import com.supcon.orchid.MESBasic.services.MESBasicProdSecUnitService;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.daos.MESBasicProductDao;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.entities.MESBasicProductCost;
import com.supcon.orchid.MESBasic.daos.MESBasicProductCostDao;
import com.supcon.orchid.MESBasic.services.MESBasicProductCostService;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchDealInfo;
import com.supcon.orchid.MESBasic.daos.MESBasicBatchDealInfoDao;
import com.supcon.orchid.MESBasic.services.MESBasicBatchDealInfoService;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchInformation;
import com.supcon.orchid.MESBasic.daos.MESBasicBatchInformationDao;
import com.supcon.orchid.MESBasic.services.MESBasicBatchInformationService;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchRelationship;
import com.supcon.orchid.MESBasic.daos.MESBasicBatchRelationshipDao;
import com.supcon.orchid.MESBasic.services.MESBasicBatchRelationshipService;
import com.supcon.orchid.MESBasic.entities.MESBasicClearSinget;
import com.supcon.orchid.MESBasic.daos.MESBasicClearSingetDao;
import com.supcon.orchid.MESBasic.services.MESBasicClearSingetService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseVendorClassDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseVendorClassService;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceSyncLog;
import com.supcon.orchid.MESBasic.daos.MESBasicInterfaceSyncLogDao;
import com.supcon.orchid.MESBasic.services.MESBasicInterfaceSyncLogService;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.daos.MESBasicFactoryModelDao;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.entities.MESBasicObjBatContainer;
import com.supcon.orchid.MESBasic.daos.MESBasicObjBatContainerDao;
import com.supcon.orchid.MESBasic.services.MESBasicObjBatContainerService;
import com.supcon.orchid.MESBasic.entities.MESBasicObjEquipment;
import com.supcon.orchid.MESBasic.daos.MESBasicObjEquipmentDao;
import com.supcon.orchid.MESBasic.services.MESBasicObjEquipmentService;
import com.supcon.orchid.MESBasic.entities.MESBasicObjPostion;
import com.supcon.orchid.MESBasic.daos.MESBasicObjPostionDao;
import com.supcon.orchid.MESBasic.services.MESBasicObjPostionService;
import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;
import com.supcon.orchid.MESBasic.daos.MESBasicObjProductDao;
import com.supcon.orchid.MESBasic.services.MESBasicObjProductService;
import com.supcon.orchid.MESBasic.entities.MESBasicObjTeam;
import com.supcon.orchid.MESBasic.daos.MESBasicObjTeamDao;
import com.supcon.orchid.MESBasic.services.MESBasicObjTeamService;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.daos.MESBasicObjWareStoreDao;
import com.supcon.orchid.MESBasic.services.MESBasicObjWareStoreService;
import com.supcon.orchid.MESBasic.entities.MESBasicPositionDeal;
import com.supcon.orchid.MESBasic.daos.MESBasicPositionDealDao;
import com.supcon.orchid.MESBasic.services.MESBasicPositionDealService;
import com.supcon.orchid.MESBasic.entities.MESBasicDepartmentWare;
import com.supcon.orchid.MESBasic.daos.MESBasicDepartmentWareDao;
import com.supcon.orchid.MESBasic.services.MESBasicDepartmentWareService;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.daos.MESBasicFacWareMaterialDao;
import com.supcon.orchid.MESBasic.services.MESBasicFacWareMaterialService;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;
import com.supcon.orchid.MESBasic.daos.MESBasicNodeTypeDao;
import com.supcon.orchid.MESBasic.services.MESBasicNodeTypeService;
import com.supcon.orchid.MESBasic.entities.MESBasicCustomerMaterial;
import com.supcon.orchid.MESBasic.daos.MESBasicCustomerMaterialDao;
import com.supcon.orchid.MESBasic.services.MESBasicCustomerMaterialService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.daos.MESBasicItemRecordDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemRecordService;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.daos.MESBasicMESServicesDao;
import com.supcon.orchid.MESBasic.services.MESBasicMESServicesService;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.daos.MESBasicServiceLoggerDao;
import com.supcon.orchid.MESBasic.services.MESBasicServiceLoggerService;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.daos.MESBasicPotDataDao;
import com.supcon.orchid.MESBasic.services.MESBasicPotDataService;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.daos.MESBasicEquipmentDao;
import com.supcon.orchid.MESBasic.services.MESBasicEquipmentService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseVendorDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseVendorService;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.daos.MESBasicContainerDao;
import com.supcon.orchid.MESBasic.services.MESBasicContainerService;
import com.supcon.orchid.MESBasic.entities.MESBasicContainerExp;
import com.supcon.orchid.MESBasic.daos.MESBasicContainerExpDao;
import com.supcon.orchid.MESBasic.services.MESBasicContainerExpService;
import com.supcon.orchid.MESBasic.entities.MESBasicFlowRecord;
import com.supcon.orchid.MESBasic.daos.MESBasicFlowRecordDao;
import com.supcon.orchid.MESBasic.services.MESBasicFlowRecordService;
import com.supcon.orchid.MESBasic.entities.MESBasicFunctionInfo;
import com.supcon.orchid.MESBasic.daos.MESBasicFunctionInfoDao;
import com.supcon.orchid.MESBasic.services.MESBasicFunctionInfoService;
import com.supcon.orchid.MESBasic.entities.MESBasicMaintainLog;
import com.supcon.orchid.MESBasic.daos.MESBasicMaintainLogDao;
import com.supcon.orchid.MESBasic.services.MESBasicMaintainLogService;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.daos.MESBasicPropertyTagsDao;
import com.supcon.orchid.MESBasic.services.MESBasicPropertyTagsService;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.daos.MESBasicStoreSetDao;
import com.supcon.orchid.MESBasic.services.MESBasicStoreSetService;
import com.supcon.orchid.MESBasic.entities.MESBasicArea;
import com.supcon.orchid.MESBasic.daos.MESBasicAreaDao;
import com.supcon.orchid.MESBasic.services.MESBasicAreaService;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.daos.MESBasicPlaceManageDao;
import com.supcon.orchid.MESBasic.services.MESBasicPlaceManageService;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClass;
import com.supcon.orchid.MESBasic.daos.MESBasicWareClassDao;
import com.supcon.orchid.MESBasic.services.MESBasicWareClassService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;
import com.supcon.orchid.MESBasic.daos.MESBasicProdAttributeDao;
import com.supcon.orchid.MESBasic.services.MESBasicProdAttributeService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseProdListDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseProdListService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseCustomerDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustomerService;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.daos.MESBasicBaseCustomerClassDao;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustomerClassService;
import com.supcon.orchid.MESBasic.entities.MESBasicProdattrel;
import com.supcon.orchid.MESBasic.daos.MESBasicProdattrelDao;
import com.supcon.orchid.MESBasic.services.MESBasicProdattrelService;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.daos.MESBasicInterfaceLogDao;
import com.supcon.orchid.MESBasic.services.MESBasicInterfaceLogService;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.MESBasic.daos.MESBasicWareDao;
import com.supcon.orchid.MESBasic.services.MESBasicWareService;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroup;
import com.supcon.orchid.MESBasic.daos.MESBasicPurchGroupDao;
import com.supcon.orchid.MESBasic.services.MESBasicPurchGroupService;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroupMember;
import com.supcon.orchid.MESBasic.daos.MESBasicPurchGroupMemberDao;
import com.supcon.orchid.MESBasic.services.MESBasicPurchGroupMemberService;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.daos.MESBasicDataTransDao;
import com.supcon.orchid.MESBasic.services.MESBasicDataTransService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
import com.supcon.orchid.MESBasic.daos.MESBasicItemSeqDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemSeqService;
import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndex;
import com.supcon.orchid.MESBasic.daos.MESBasicQACheckIndexDao;
import com.supcon.orchid.MESBasic.services.MESBasicQACheckIndexService;
import com.supcon.orchid.MESBasic.entities.MESBasicOriginalSignal;
import com.supcon.orchid.MESBasic.daos.MESBasicOriginalSignalDao;
import com.supcon.orchid.MESBasic.services.MESBasicOriginalSignalService;
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
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.daos.MESBasicItemPartDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemPartService;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.daos.MESBasicItemSetupDao;
import com.supcon.orchid.MESBasic.services.MESBasicItemSetupService;
import com.supcon.orchid.MESBasic.entities.MESBasicEamType;
import com.supcon.orchid.MESBasic.daos.MESBasicEamTypeDao;
import com.supcon.orchid.MESBasic.services.MESBasicEamTypeService;
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
import com.supcon.orchid.MESBasic.daos.impl.MESBasicWareClassDaoImpl;
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
/* CUSTOM CODE START(serviceimpl,import,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

@Service("mESBasic_wareClassService")
@Transactional
public class MESBasicWareClassServiceImpl  extends BaseServiceImpl<MESBasicWareClass> implements MESBasicWareClassService, InitializingBean, DisposableBean {
	private static final Pattern pattern = Pattern.compile("( AS | as )((\"?)(.*?)(\"?))(,| )");
	private static final Pattern p = Pattern.compile("( JOIN | join )((.*?)) ((\"?)(.*?)(\"?))( ON | on )");
	private static final Pattern countPattern = Pattern.compile("(SUM\\()((\"?)(.*?)(\"?))(\\) AS | as )");
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
	private MESBasicBatchDataDao batchDataDao;
	@Autowired
	private MESBasicBatchDataService batchDataService;
	@Autowired
	private MESBasicCommDealInfoDao commDealInfoDao;
	@Autowired
	private MESBasicCommDealInfoService commDealInfoService;
	@Autowired
	private MESBasicCprodAttDao cprodAttDao;
	@Autowired
	private MESBasicCprodAttService cprodAttService;
	@Autowired
	private MESBasicProdDealInfoDao prodDealInfoDao;
	@Autowired
	private MESBasicProdDealInfoService prodDealInfoService;
	@Autowired
	private MESBasicProdLevelDao prodLevelDao;
	@Autowired
	private MESBasicProdLevelService prodLevelService;
	@Autowired
	private MESBasicProdResetDailyDao prodResetDailyDao;
	@Autowired
	private MESBasicProdResetDailyService prodResetDailyService;
	@Autowired
	private MESBasicProdSecUnitDao prodSecUnitDao;
	@Autowired
	private MESBasicProdSecUnitService prodSecUnitService;
	@Autowired
	private MESBasicProductDao productDao;
	@Autowired
	private MESBasicProductService productService;
	@Autowired
	private MESBasicProductCostDao productCostDao;
	@Autowired
	private MESBasicProductCostService productCostService;
	@Autowired
	private MESBasicBatchDealInfoDao batchDealInfoDao;
	@Autowired
	private MESBasicBatchDealInfoService batchDealInfoService;
	@Autowired
	private MESBasicBatchInformationDao batchInformationDao;
	@Autowired
	private MESBasicBatchInformationService batchInformationService;
	@Autowired
	private MESBasicBatchRelationshipDao batchRelationshipDao;
	@Autowired
	private MESBasicBatchRelationshipService batchRelationshipService;
	@Autowired
	private MESBasicClearSingetDao clearSingetDao;
	@Autowired
	private MESBasicClearSingetService clearSingetService;
	@Autowired
	private MESBasicBaseVendorClassDao baseVendorClassDao;
	@Autowired
	private MESBasicBaseVendorClassService baseVendorClassService;
	@Autowired
	private MESBasicInterfaceSyncLogDao interfaceSyncLogDao;
	@Autowired
	private MESBasicInterfaceSyncLogService interfaceSyncLogService;
	@Autowired
	private MESBasicFactoryModelDao factoryModelDao;
	@Autowired
	private MESBasicFactoryModelService factoryModelService;
	@Autowired
	private MESBasicObjBatContainerDao objBatContainerDao;
	@Autowired
	private MESBasicObjBatContainerService objBatContainerService;
	@Autowired
	private MESBasicObjEquipmentDao objEquipmentDao;
	@Autowired
	private MESBasicObjEquipmentService objEquipmentService;
	@Autowired
	private MESBasicObjPostionDao objPostionDao;
	@Autowired
	private MESBasicObjPostionService objPostionService;
	@Autowired
	private MESBasicObjProductDao objProductDao;
	@Autowired
	private MESBasicObjProductService objProductService;
	@Autowired
	private MESBasicObjTeamDao objTeamDao;
	@Autowired
	private MESBasicObjTeamService objTeamService;
	@Autowired
	private MESBasicObjWareStoreDao objWareStoreDao;
	@Autowired
	private MESBasicObjWareStoreService objWareStoreService;
	@Autowired
	private MESBasicPositionDealDao positionDealDao;
	@Autowired
	private MESBasicPositionDealService positionDealService;
	@Autowired
	private MESBasicDepartmentWareDao departmentWareDao;
	@Autowired
	private MESBasicDepartmentWareService departmentWareService;
	@Autowired
	private MESBasicFacWareMaterialDao facWareMaterialDao;
	@Autowired
	private MESBasicFacWareMaterialService facWareMaterialService;
	@Autowired
	private MESBasicNodeTypeDao nodeTypeDao;
	@Autowired
	private MESBasicNodeTypeService nodeTypeService;
	@Autowired
	private MESBasicCustomerMaterialDao customerMaterialDao;
	@Autowired
	private MESBasicCustomerMaterialService customerMaterialService;
	@Autowired
	private MESBasicItemRecordDao itemRecordDao;
	@Autowired
	private MESBasicItemRecordService itemRecordService;
	@Autowired
	private MESBasicMESServicesDao mESServicesDao;
	@Autowired
	private MESBasicMESServicesService mESServicesService;
	@Autowired
	private MESBasicServiceLoggerDao serviceLoggerDao;
	@Autowired
	private MESBasicServiceLoggerService serviceLoggerService;
	@Autowired
	private MESBasicPotDataDao potDataDao;
	@Autowired
	private MESBasicPotDataService potDataService;
	@Autowired
	private MESBasicEquipmentDao equipmentDao;
	@Autowired
	private MESBasicEquipmentService equipmentService;
	@Autowired
	private MESBasicBaseVendorDao baseVendorDao;
	@Autowired
	private MESBasicBaseVendorService baseVendorService;
	@Autowired
	private MESBasicContainerDao containerDao;
	@Autowired
	private MESBasicContainerService containerService;
	@Autowired
	private MESBasicContainerExpDao containerExpDao;
	@Autowired
	private MESBasicContainerExpService containerExpService;
	@Autowired
	private MESBasicFlowRecordDao flowRecordDao;
	@Autowired
	private MESBasicFlowRecordService flowRecordService;
	@Autowired
	private MESBasicFunctionInfoDao functionInfoDao;
	@Autowired
	private MESBasicFunctionInfoService functionInfoService;
	@Autowired
	private MESBasicMaintainLogDao maintainLogDao;
	@Autowired
	private MESBasicMaintainLogService maintainLogService;
	@Autowired
	private MESBasicPropertyTagsDao propertyTagsDao;
	@Autowired
	private MESBasicPropertyTagsService propertyTagsService;
	@Autowired
	private MESBasicStoreSetDao storeSetDao;
	@Autowired
	private MESBasicStoreSetService storeSetService;
	@Autowired
	private MESBasicAreaDao areaDao;
	@Autowired
	private MESBasicAreaService areaService;
	@Autowired
	private MESBasicPlaceManageDao placeManageDao;
	@Autowired
	private MESBasicPlaceManageService placeManageService;
	@Autowired
	private MESBasicWareClassDao wareClassDao;
	@Autowired
	private MESBasicProdAttributeDao prodAttributeDao;
	@Autowired
	private MESBasicProdAttributeService prodAttributeService;
	@Autowired
	private MESBasicBaseProdListDao baseProdListDao;
	@Autowired
	private MESBasicBaseProdListService baseProdListService;
	@Autowired
	private MESBasicBaseCustomerDao baseCustomerDao;
	@Autowired
	private MESBasicBaseCustomerService baseCustomerService;
	@Autowired
	private MESBasicBaseCustomerClassDao baseCustomerClassDao;
	@Autowired
	private MESBasicBaseCustomerClassService baseCustomerClassService;
	@Autowired
	private MESBasicProdattrelDao prodattrelDao;
	@Autowired
	private MESBasicProdattrelService prodattrelService;
	@Autowired
	private MESBasicInterfaceLogDao interfaceLogDao;
	@Autowired
	private MESBasicInterfaceLogService interfaceLogService;
	@Autowired
	private MESBasicWareDao wareDao;
	@Autowired
	private MESBasicWareService wareService;
	@Autowired
	private MESBasicPurchGroupDao purchGroupDao;
	@Autowired
	private MESBasicPurchGroupService purchGroupService;
	@Autowired
	private MESBasicPurchGroupMemberDao purchGroupMemberDao;
	@Autowired
	private MESBasicPurchGroupMemberService purchGroupMemberService;
	@Autowired
	private MESBasicDataTransDao dataTransDao;
	@Autowired
	private MESBasicDataTransService dataTransService;
	@Autowired
	private MESBasicItemSeqDao itemSeqDao;
	@Autowired
	private MESBasicItemSeqService itemSeqService;
	@Autowired
	private MESBasicQACheckIndexDao qACheckIndexDao;
	@Autowired
	private MESBasicQACheckIndexService qACheckIndexService;
	@Autowired
	private MESBasicOriginalSignalDao originalSignalDao;
	@Autowired
	private MESBasicOriginalSignalService originalSignalService;
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
	private MESBasicItemPartDao itemPartDao;
	@Autowired
	private MESBasicItemPartService itemPartService;
	@Autowired
	private MESBasicItemSetupDao itemSetupDao;
	@Autowired
	private MESBasicItemSetupService itemSetupService;
	@Autowired
	private MESBasicEamTypeDao eamTypeDao;
	@Autowired
	private MESBasicEamTypeService eamTypeService;
	
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
	private IBAPBaseService<MESBasicWareClass> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private MESBasicWareClassImportService wareClassImportService;
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + MESBasicWareClass.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)"  + "and VALID = 1";
		Query query =  wareClassDao.createQuery(hql);
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
			String hql = "select " + businessKeyName + ",id from " + MESBasicWareClass.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = wareClassDao.createQuery(hql);
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
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + MESBasicWareClass.JPA_NAME + " where " + mainDisplayName + " in (:serial)";
		}else if(queryParam!=null && queryParam.equals("bk")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + MESBasicWareClass.JPA_NAME + " where " + businessKeyName + " in (:serial)";
		}
		Query query =  wareClassDao.createQuery(hql);
		query.setParameterList("serial", serial);
		List<Object[]> list = query.list();
		/*String sql = null;
		if(queryParam!=null && queryParam.equals("md")){
			sql = "select * from " + MESBasicWareClass.TABLE_NAME + " where " + mainDisplayName + " = ?";
		}else if(queryParam!=null && queryParam.equals("bk")){
			sql = "select * from " + MESBasicWareClass.TABLE_NAME + " where " + businessKeyName + " = ?";
		}
		List<MESBasicWareClass> list = (List<MESBasicWareClass>) wareClassDao.createNativeQuery(sql,serial.get(0)).list();
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
	public MESBasicWareClass getWareClass(long id){
		return getWareClass(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicWareClass getWareClass(long id, String viewCode){
		MESBasicWareClass wareClass = wareClassDao.load(id);

		// 一对多情况处理
		if(wareClass != null){
		}
		return wareClass;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWareClassAsJSON(long id, String include){
		MESBasicWareClass wareClass = wareClassDao.load(id);
		// 一对多情况处理

		if(wareClass == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(wareClass, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.delete",operType="3")
	public void deleteWareClass(MESBasicWareClass wareClass){
		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		checkDeletePermit(wareClass.getId());
		beforeDeleteWareClass(wareClass);
		wareClassDao.delete(wareClass);
		afterDeleteWareClass(wareClass);
		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/del", wareClass,MESBasicWareClassMneCode.class);
		List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
		params.add(wareClass);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_wareClass");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
			// TODO delete
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.delete",operType="3")
	public void deleteWareClass(List<Long> wareClassIds){
		deleteWareClass(wareClassIds, null);
	}

	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.delete",operType="3")
	public void deleteWareClass(List<Long> wareClassIds, String eventTopic) {
		List<MESBasicWareClass> wareClasss = new ArrayList<MESBasicWareClass>();
		for(Long wareClassId : wareClassIds){
			MESBasicWareClass wareClass = getWareClass(wareClassId);
			wareClasss.add(wareClass);
			if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(AuditUtil.getColumnStringA() + (null == wareClass.getName() ? "" : "," + wareClass.getName().toString()));
				} else {
					AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(AuditUtil.getColumnStringB() + (null == wareClass.getCode() ? "" : "," + wareClass.getCode().toString()));
				} else {
					AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(AuditUtil.getColumnStringC() + (null == wareClass.getId() ? "" : "," + wareClass.getId().toString()));
				} else {
					AuditUtil.setColumnStringC(null == wareClass.getId() ? "" : wareClass.getId().toString());
				}
			}
		}
		
		for(MESBasicWareClass wareClass : wareClasss){
			beforeDeleteWareClass(wareClass);
		}
		
		
		/**
		 * 假删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(wareClasss != null && wareClasss.size() > 0 ){
			for(MESBasicWareClass wareClass : wareClasss){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				List<Object> currentState = new ArrayList<Object>();
				propertyNames.add("valid");
				currentState.add(false);
				previousState.add(true);
				dataAuditLogService.saveCustomerAudit(InternationalResource.get("foundation.common.delete"),wareClass, wareClass.getId(), currentState.toArray(), previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
			}
		}
		if(wareClassIds != null && wareClassIds.size() > 0) {
			String hql = "update " + MESBasicWareClass.JPA_NAME + " set valid = false where id in(:ids)";
			Query query = wareClassDao.createQuery(hql);
			query.setParameterList("ids", wareClassIds);
			query.executeUpdate();
			wareClassDao.clearAllCacheByEntity();
		}
		
		for(MESBasicWareClass wareClass : wareClasss){
			afterDeleteWareClass(wareClass);
		}
		
		if(eventTopic==null){
			for(MESBasicWareClass wareClassz : wareClasss){
				wareClassz.setValid(false);
				List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
				params.add(wareClassz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "MESBasic_1_wareClass");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.delete",operType="3")
	public void deleteWareClass(long wareClassId, int wareClassVersion){
		this.deleteWareClass(wareClassId, wareClassVersion,null);
	}
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.delete",operType="3")
	public void deleteWareClass(long wareClassId, int wareClassVersion,SignatureLog signatureLog){
		MESBasicWareClass wareClass = getWareClass(wareClassId);
		if(wareClass != null && !wareClass.isValid()){
			throw new BAPException(BAPException.Code.OBJECT_HAVE_BEAN_DELETED);
		}
		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		checkDeletePermit(wareClassId);
		beforeDeleteWareClass(wareClass);
		wareClassDao.delete(wareClassId, wareClassVersion);
		afterDeleteWareClass(wareClass);
		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/del", wareClass,MESBasicWareClassMneCode.class);
		List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
		params.add(wareClass);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_wareClass");
		props.put("eventType", "delete");
		
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=wareClass.getCode();
			signatureLog.setTableId(wareClass.getId());
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
	
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void checkDeletePermit(Long id) throws BAPException{
		String wareClassHql = "select count(wareClass.id) as totalCoual from " + MESBasicWareClass.JPA_NAME + " as wareClass where wareClass.parentId=? and wareClass.valid=true";
		List<Long> wareClassCount = wareClassDao.findByHql(wareClassHql, id);
		if (wareClassCount.get(0) > 0){
			throw new BAPException(BAPException.Code.ASS_NOT_DELETE);
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.delete",operType="3")
	public void deleteWareClass(String wareClassIds){
		this.deleteWareClass(wareClassIds,null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.delete",operType="3")
	public void deleteWareClass(String wareClassIds,SignatureLog signatureLog){
		deleteCollection(wareClassIds,signatureLog);
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
				deleteWareClass(Long.valueOf(id), Integer.valueOf(version),signatureLog);
			}
		}
		if(null != signatureLog){
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:MESBasic_1#entityCode:MESBasic_1_wareClass#modelCode:MESBasic_1_wareClass_WareClass#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="ec.engine.restore",operType="10")
	public void restoreWareClass(String wareClassIds){
		restoreCollection(wareClassIds);
	}
	
	public void restoreCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			if (id != null && id.trim().length() > 0) {
				restoreWareClass(Long.valueOf(id));
			}
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="ec.engine.restore",operType="10")
	public void restoreWareClass(long wareClassId){
		
		findBusinessKeyUsed(wareClassId);	//判断业务主键是否重复
		
		MESBasicWareClass wareClass = getWareClass(wareClassId);
		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		checkDeletePermit(wareClassId);
		beforeRestoreWareClass(wareClass);
		wareClass.setValid(true);
		wareClassDao.update(wareClass);
		afterRestoreWareClass(wareClass);
		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/add", wareClass,MESBasicWareClassMneCode.class);
		List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
		params.add(wareClass);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_wareClass");
		props.put("eventType", "restore");
	}
	
	public void findBusinessKeyUsed(long wareClassId){
		Property property = modelServiceFoundation.getBussinessProperty("MESBasic_1_wareClass_WareClass");
		if(property != null){
			String propertyName = property.getColumnName();
			String sql  = "select * from " + MESBasicWareClass.TABLE_NAME + " where valid = 1 and " + 
					propertyName + " =  (select "+ propertyName +" from "+ MESBasicWareClass.TABLE_NAME +" where id = ? )";
			List<Object> list =  wareClassDao.createNativeQuery(sql,wareClassId).list();
			if(list.size() > 0){
				throw new BAPException("foundation.bussinessKey.repeat");
			}
			
		}
	}
	
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.batch.import",operType="4")
	public  void batchImportBaseWareClass(List<MESBasicWareClass>  wareClasss){
		for(MESBasicWareClass wareClass:wareClasss)  {
			saveWareClass(wareClass, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBaseWareClass(List<MESBasicWareClass>  wareClasss){
		for(MESBasicWareClass wareClass:wareClasss)  {
			saveWareClass(wareClass, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="ec.flow.save")
	public void saveWareClass(MESBasicWareClass wareClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		saveWareClass(wareClass, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="ec.flow.save")
	public void saveWareClass(MESBasicWareClass wareClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		saveWareClass(wareClass, dgLists,dgDeleteIDs,assFileUploads, viewCode, null,null);
	}


	public void generateWareClassCodes(MESBasicWareClass wareClass) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateWareClassCodes(wareClass, false);
	}
	
	public void generateWareClassCodes(MESBasicWareClass wareClass, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	public void generateWareClassSummarys(MESBasicWareClass wareClass) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateWareClassSummarys(wareClass, false);
	}

	public void generateWareClassSummarys(MESBasicWareClass wareClass, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass")
	public void saveWareClass(MESBasicWareClass wareClass,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic,boolean... isImport){
		this.saveWareClass(wareClass, dgLists,dgDeleteIDs,assFileUploads, viewCode, eventTopic,null,isImport);
	}

	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass")
	public void saveWareClass(MESBasicWareClass wareClass,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport){
		boolean isNew = false;
		String entityCode = "MESBasic_1_wareClass";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_wareClass");
		String url = null;
		if(wareClass.getId() != null && wareClass.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/add";
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
				executeGScript(entityCode, "beforeSave", events, wareClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(wareClass);
		beforeSaveWareClass(wareClass, viewIsView);

		if (viewIsView) {
			wareClassDao.saveWithRevertVersion(wareClass);
		} else {
			wareClassDao.save(wareClass);
		}
		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		dealDatagridsSave(wareClass,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateWareClassCodes(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateWareClassSummarys(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveWareClass(wareClass, viewIsView);


		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/add", wareClass,MESBasicWareClassMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, wareClass);
			}
		}
		List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
		wareClassDao.flush();
		wareClassDao.clear();
		wareClass = wareClassDao.load(wareClass.getId());
		
		
		params.add(wareClass);
		
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=wareClass.getCode();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(wareClass.getId());
			String msgId="moduleCode:MESBasic_1#entityCode:MESBasic_1_wareClass#modelCode:MESBasic_1_wareClass_WareClass#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, MESBasicWareClass wareClass){
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
						variables.put("wareClass", wareClass);
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
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass")
	public void mergeWareClass(MESBasicWareClass wareClass, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(wareClass);
		beforeSaveWareClass(wareClass);
		wareClassDao.merge(wareClass);
		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		dealDatagridsSave(wareClass,null,dgLists,dgDeleteIDs,assFileUploads);

		afterSaveWareClass(wareClass);
		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/add", wareClass,MESBasicWareClassMneCode.class);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<MESBasicWareClass> findWareClasss(Page<MESBasicWareClass> page, Criterion... criterions) {
		return wareClassDao.findByPage(page, criterions);
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
	private MESBasicWareClassDealInfo getDealInfoEntity(Long tableInfoId) {
		
		List<MESBasicWareClassDealInfo> list=wareClassDao.createQuery("from " + MESBasicWareClassDealInfo.JPA_NAME + " where tableInfoId=?", tableInfoId).setMaxResults(1).list();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void saveDealInfo(MESBasicWareClassDealInfo dealInfo) {
		wareClassDao.saveDealInfo(dealInfo);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public int getDealInfoCount(Long tableInfoId) {
		String sql = "SELECT count(1) totalCount " + "FROM "+MESBasicWareClassDealInfo.TABLE_NAME+" DI " + "LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME
				+ " S ON S.ID=U.STAFF_ID " + "WHERE DI.TABLE_INFO_ID = ?";
		Number list = (Number) wareClassDao.createNativeQuery(sql, tableInfoId).uniqueResult();
		return list.intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag) {
		String sql = "SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, WT.TYPE,WTR.TYPE TRANSITIONTYPE "
				+ " FROM "+MESBasicWareClassDealInfo.TABLE_NAME + " DI " 
				+ " LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION "
				+ " LEFT JOIN WF_TRANSITION WTR ON WTR.CODE = DI.OUTCOME AND WTR.DEPLOYMENT_ID = WT.DEPLOYMENT_ID "
				+ " LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID "
				+ " WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION is not null ";
		if (expandFlag) {
			sql += " AND DI.COMMENTS IS NOT NULL";
			DBTYPE dbtype = wareClassDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				sql += " AND DI.COMMENTS != ''";
			}
		}
		sql += " ORDER BY DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC";
		List<Object[]> list = wareClassDao.createNativeQuery(sql, tableInfoId).list();
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
				+ MESBasicWareClassDealInfo.TABLE_NAME
				+ " DI LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION ");
		groupSql.append(" LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID ");
		groupSql.append(" WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION IS NOT NULL ");
		if (expandFlag) {
			groupSql.append(" AND DI.COMMENTS IS NOT NULL");
			DBTYPE dbtype = wareClassDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				groupSql.append(" AND DI.COMMENTS != ''");
			}
		}
		groupSql.append(" ORDER BY WT.ROUTE_SEQUENCE ASC, DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC");

		List<Object[]> groupList = wareClassDao.createNativeQuery(groupSql.toString(), tableInfoId).list();
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
	public List<String> getContainLower(String modelName, String fieldName, String exp, Object value, Boolean crossCompany) {
		String layRecHql = "select layRec from " + modelName + " where valid = true and " + fieldName + exp;
		if(crossCompany) {
			layRecHql += " and cid = ?";
			return wareClassDao.createQuery(layRecHql, value, getCurrentCompanyId()).list();
		}
		return wareClassDao.createQuery(layRecHql, value).list();
	}
	
	private void dealListTreePageData(Page<MESBasicWareClass> wareClasss, String viewCode){
		List<MESBasicWareClass> result = wareClasss.getResult();
		if(null != result && !result.isEmpty()) {
			int rootPos = 0;
			MESBasicWareClass rootTree = result.get(0);
			for(int i = 0; i < result.size(); i++) {
				if(rootTree.getLayNo() > result.get(i).getLayNo()) {
					rootTree = result.get(i);
					rootPos = i;
				}
			}
			result.get(rootPos).setParentId(-1l);
			wareClasss.setTreeToSurfaceMode(true);
			MESBasicWareClass wareClassTree = wareClassDao.buildTree("wareClass" + viewCode, new ListPrepareData(wareClasss), false);
			if(null != wareClassTree.getChildren() && !wareClassTree.getChildren().isEmpty()) {
				List<MESBasicWareClass> treeList = new ArrayList<MESBasicWareClass>();
				Tree.treeToList(wareClassTree, treeList, false);
				if(treeList.size() == result.size()) {
					wareClasss.setResult(treeList);
					wareClasss.setTreeToSurfaceMode(false);
				} 
			} 
		}
	}
	
	/**
	 * 列表树数据准备内部类<br>
	 * 
	 */
	private class ListPrepareData implements PrepareData<MESBasicWareClass,Long> {
		private Page<MESBasicWareClass> wareClasss;

		public ListPrepareData(Page<MESBasicWareClass> wareClasss) {
			this.wareClasss = wareClasss;
		}

		@Override
			public MESBasicWareClass root() {
				MESBasicWareClass wareClass = new MESBasicWareClass();
				wareClass.setId(-1l);
				return wareClass;
			}
			
			@Override
			public List<MESBasicWareClass> prepare(TreeDao<MESBasicWareClass, Long> dao) {
				return wareClasss.getResult();
			}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findWareClasss(Page<MESBasicWareClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, Map exportMap, List<Param> params) {
		findWareClasss(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findWareClasss(Page<MESBasicWareClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findWareClasss(Page<MESBasicWareClass> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
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
	public void commonQuery(Page<MESBasicWareClass> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
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
						String tableAlias = lastDotPos < 0 ? "\"wareClass\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
							} else {
								layRecs = getContainLower(entityInfo, Inflector.getInstance().columnToField(columnName), exp, param.getValue(), false);
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
						if(null != crossCompanyFlag && !crossCompanyFlag && !getCurrentCompanyId().equals(1L)){
							s.append(" AND \"wareClass\".CID in (1,").append(getCurrentCompanyId()+")");
						}
					}
					
	//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
	//					if(type == Sql.TYPE_LIST_PENDING) {
	//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_QUERY){
	//						s.append(" AND \"wareClass\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_REFERENCE){
	//						if(null != crossCompanyFlag && !crossCompanyFlag){
	//							s.append(" AND \"wareClass\".CID = ").append(getCurrentCompanyId());
	//						}
	//					}
	//				}
					s.append(" ) ");
			}
			// ////PowerCondition

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
			if (null != view.getIsShadow() && view.getIsShadow() && null != view.getShadowView()) {
				extraView = view.getShadowView().getExtraView();
			} else {
				extraView = view.getExtraView();
			}
			if (null != extraView && extraView.getConfigMap() != null) {
				Map<String, Object> layout = (Map<String, Object>) extraView.getConfigMap().get("layout");
				if (layout != null && !layout.isEmpty()) {
					List<Map<String, Object>> sections = (List<Map<String, Object>>) layout.get("sections");
					if(null != sections) {
						for (Map section : sections) {
							if (section.get("regionType").toString().equals("LISTPT")) {
								Map<String, Object> listProperties = (Map<String, Object>) section.get("listProperty");
								if (null != listProperties && !listProperties.isEmpty()) {
									for (Map.Entry<String, Object> listProperty : listProperties.entrySet()) {
										if (listProperty.getKey().equals("isTreeView")) {
											if (new Boolean(listProperty.getValue().toString()).equals(Boolean.TRUE)) {
												isTreeView=true;
											}
										}
									}
								}
							}
						}
					}
				}
			}
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
							powerCode = "MESBasic_1_wareClass_WareClass" + "_" + layoutView.getPermissionCode();
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "MESBasic_1_wareClass_WareClass" + "_" + layoutView.getPermissionCode();
							}
						}
					}else  {
						if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
							powerCode = "MESBasic_1_wareClass_WareClass" + "_" + view.getPermissionCode();
						}
					}
				}else if(null != dgCode && !"".equals(dgCode)){
					DataGrid dataGrid = viewServiceFoundation.getDataGrid(dgCode);
					if(null != dataGrid.getDataGridType() && dataGrid.getDataGridType() == 1 && null != dataGrid.getIsPermission() && dataGrid.getIsPermission()){
						powerCode = dataGrid.getTargetModel().getCode() + "_" + dataGrid.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  wareClassDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  wareClassDao.createNativeQuery(powerOperateSql, "MESBasic_1_wareClass").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}	
					String	pc = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"wareClass\"","MESBasic_1_wareClass",customCondition,"MATERIAL_WARE_CLASSES",false);
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
						s.append(" \"wareClass\".TABLE_INFO_ID IN (  SELECT   D.TABLE_INFO_ID "+
	                      "   FROM   "+MESBasicWareClassDealInfo.TABLE_NAME+" d "+
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
			
			
			if (referenceCondition != null && referenceCondition.length() > 0) {
				s.append(" AND (").append(referenceCondition).append(")");
			}
			if(queryType == 1) {
				s.append(" AND \"wareClass\".STATUS = 99 ");
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
					orderPart.append(" \"wareClass\".LAY_REC ASC, \"wareClass\".SORT ASC");
				} else {
					orderPart.append(" \"wareClass\".LAY_REC ASC, \"wareClass\".ID DESC");
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
			realSql = matchSql(p, realSql, "E", null, 4, 6);
			countSql = matchSql(p, countSql, "E", null, 4, 6);
			//组织总条数，合计SQL
			countSql = replaceSql(countPattern, countSql, maps, 4, 2);
			if(isTreeView) {
				page.setPaging(false);
			}
			}
			//计算条数
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) wareClassDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    SQLQuery query=wareClassDao.createNativeQuery(countSql, arr);
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
				SQLQuery query = wareClassDao.createNativeQuery(realSql, arr);
				if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
				List<MESBasicWareClass> result = new ArrayList<MESBasicWareClass>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(MESBasicWareClass.class,wareClassDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(MESBasicWareClass.class,wareClassDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (MESBasicWareClass wareClass : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(wareClass.getId(), "MESBasic_wareClass_wareClass");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(wareClass.getId(), "MESBasic_wareClass_wareClass");
							if(null != documents && !documents.isEmpty()) {
								wareClass.setDocument(documents.get(0));
								wareClass.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				if(page.isExportFlag()){
					Method getBusKeyMethod = null;
					if(exportMap.get("businessKey")!=null){
						try {
							Property p = (Property) exportMap.get("businessKey");
							String getBusKeyMethodStr = "get" + p.getName().substring(0, 1).toUpperCase() + p.getName().substring(1);
							MESBasicWareClass wareClass = new MESBasicWareClass();
							getBusKeyMethod = wareClass.getClass().getMethod(getBusKeyMethodStr);
						} catch (NoSuchMethodException | SecurityException e) {
							log.error(e.getMessage(),e);
						}
					}
					Method getMainDisMethod = null;
					if(exportMap.get("mainDisplay")!=null){
						try {
							Property p = (Property) exportMap.get("mainDisplay");
							String getMainDisMethodStr = "get" + p.getName().substring(0, 1).toUpperCase() + p.getName().substring(1);
							MESBasicWareClass wareClass = new MESBasicWareClass();
							getMainDisMethod = wareClass.getClass().getMethod(getMainDisMethodStr);
						} catch (NoSuchMethodException | SecurityException e) {
							log.error(e.getMessage(),e);
						}
					}
					
					for (MESBasicWareClass wareClass : result) {
						Long parentId = wareClass.getParentId();
						if(parentId != null && parentId.longValue() != new Long(-1).longValue()){
							for (MESBasicWareClass wareClass2 : result) {
								if(wareClass2.getId() != null && wareClass2.getId().longValue() == parentId.longValue()){
									try {
										if(getBusKeyMethod != null){
											Object busKey = getBusKeyMethod.invoke(wareClass2);
											wareClass.setParentNodeBusinessKey(busKey.toString());
										}
										if(getMainDisMethod != null){
											Object mainDis = getMainDisMethod.invoke(wareClass2);
											wareClass.setParentNodeMainDisplay(mainDis.toString());
										}	
									} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
										log.error(e.getMessage(),e);
									}
								}
							}
						}
					}	
				}	
				
				for (MESBasicWareClass wareClass : result) {
				}	
				if(exportSql.trim().isEmpty()){
					getConfigAssoPropsResult(viewCode, dgCode, result); // 获取配置的关联模型字段的结果集
				}
			}
			if(isTreeView) {
				dealListTreePageData(page, viewCode);
			}
		}
	}
	
	
	private View getLayoutView(String permissionCode) {
		if(null!=permissionCode&&permissionCode.indexOf("MESBasic_1_wareClass")!=-1) {
				String personalCode=permissionCode.substring(permissionCode.indexOf("MESBasic_1_wareClass")+"MESBasic_1_wareClass".length()+1);
				if(null!=personalCode&&personalCode.trim().length()>0)  {
						return viewServiceFoundation.getViewWithPermissionCode("MESBasic_1_wareClass",personalCode);
				}
		}
		return null;
	}
	
	private void getConfigAssoPropsResult(String viewCode, List<MESBasicWareClass> result) {
		getConfigAssoPropsResult(viewCode, null, result);
	}
	
	private void getConfigAssoPropsResult(String viewCode,String dataGridCode, List<MESBasicWareClass> result) {
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
		Map<Long, MESBasicWareClass> rsMap = new HashMap<Long, MESBasicWareClass>();
		for (MESBasicWareClass wareClass : result) {
			ids.add(wareClass.getId());
			rsMap.put(wareClass.getId(), wareClass);
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
								rs.addAll(wareClassDao.createNativeQuery(sql)
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
		List<Property> list = wareClassDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
		return list.get(0);
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
	
	protected EntityTableInfo getTableInfo(MESBasicWareClass wareClass,boolean... isImport) {
		EntityTableInfo ti = new EntityTableInfo();


		ti.setOwnerStaffId(wareClass.getOwnerStaffId());
		ti.setOwnerPositionId(wareClass.getOwnerPositionId());
		ti.setOwnerDepartmentId(wareClass.getOwnerDepartmentId());
		
		ti.setCreateStaff(wareClass.getCreateStaff());
		ti.setCreateStaffId(wareClass.getCreateStaffId());
		ti.setCreateTime(wareClass.getCreateTime());
		ti.setDeleteStaff(wareClass.getDeleteStaff());
		ti.setDeleteStaffId(wareClass.getDeleteStaffId());
		ti.setDeleteTime(wareClass.getDeleteTime());
		ti.setCreateDepartmentId(wareClass.getCreateDepartmentId());
		ti.setModifyStaff(wareClass.getModifyStaff());
		ti.setModifyStaffId(wareClass.getModifyStaffId());
		ti.setCreatePositionId(wareClass.getCreatePositionId());
		ti.setPositionLayRec(wareClass.getPositionLayRec());
		ti.setTableNo(wareClass.getTableNo());
		ti.setValid(true);
		ti.setTargetEntityCode("MESBasic_1_wareClass");
		ti.setTargetTableName("MATERIAL_WARE_CLASSES");
		
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
							powerCode = "MESBasic_1_wareClass_WareClass" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "MESBasic_1_wareClass_WareClass" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="MESBasic_1_wareClass_WareClass" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  wareClassDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  wareClassDao.createNativeQuery(powerOperateSql, "MESBasic_1_wareClass").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"wareClass\"","MESBasic_1_wareClass","","MATERIAL_WARE_CLASSES",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"wareClass\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"wareClass\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"wareClass\"","MESBasic_1_wareClass","","MATERIAL_WARE_CLASSES",false);
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
								powerCode = "MESBasic_1_wareClass_WareClass" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "MESBasic_1_wareClass_WareClass" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "MESBasic_1_wareClass_WareClass" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  wareClassDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  wareClassDao.createNativeQuery(powerOperateSql, "MESBasic_1_wareClass").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"wareClass\"","MESBasic_1_wareClass","","MATERIAL_WARE_CLASSES",false);
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
			
			mnecodeSql.append("  (\"").append("wareClass.mc\"").append(".MNE_CODE) like (?) escape '&' AND \"wareClass\".VALID = 1");
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
					mnecodeSql.append(" AND \"wareClass\".CID = ?");
					totalValues.add(getCurrentCompanyId());
				}else{
					//当前公司不是集团情况下查询集团和本公司数据
					if(!getCurrentCompanyId().equals(1L)){
						mnecodeSql.append(" AND (\"wareClass\".CID = 1 OR \"wareClass\".CID = ?)");
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
				mnecodeSql.append(" and (\"").append("wareClass.mc\"").append(".WARE_CLASS) not in ("+notinValue+")");
			}
			
			SQLQuery query = wareClassDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
			resultList = query.setMaxResults(showNumber).list();
		}
		
		return resultList;
		
	}

	@Override
	public void destroy() throws Exception {
		beforeServiceDestroy();
	   	aclPermissionService = null;
		sqlService = null;
		eventService = null;
		scriptService = null;
		documentService = null;
		batchDataDao = null;
		batchDataService = null;
		commDealInfoDao = null;
		commDealInfoService = null;
		cprodAttDao = null;
		cprodAttService = null;
		prodDealInfoDao = null;
		prodDealInfoService = null;
		prodLevelDao = null;
		prodLevelService = null;
		prodResetDailyDao = null;
		prodResetDailyService = null;
		prodSecUnitDao = null;
		prodSecUnitService = null;
		productDao = null;
		productService = null;
		productCostDao = null;
		productCostService = null;
		batchDealInfoDao = null;
		batchDealInfoService = null;
		batchInformationDao = null;
		batchInformationService = null;
		batchRelationshipDao = null;
		batchRelationshipService = null;
		clearSingetDao = null;
		clearSingetService = null;
		baseVendorClassDao = null;
		baseVendorClassService = null;
		interfaceSyncLogDao = null;
		interfaceSyncLogService = null;
		factoryModelDao = null;
		factoryModelService = null;
		objBatContainerDao = null;
		objBatContainerService = null;
		objEquipmentDao = null;
		objEquipmentService = null;
		objPostionDao = null;
		objPostionService = null;
		objProductDao = null;
		objProductService = null;
		objTeamDao = null;
		objTeamService = null;
		objWareStoreDao = null;
		objWareStoreService = null;
		positionDealDao = null;
		positionDealService = null;
		departmentWareDao = null;
		departmentWareService = null;
		facWareMaterialDao = null;
		facWareMaterialService = null;
		nodeTypeDao = null;
		nodeTypeService = null;
		customerMaterialDao = null;
		customerMaterialService = null;
		itemRecordDao = null;
		itemRecordService = null;
		mESServicesDao = null;
		mESServicesService = null;
		serviceLoggerDao = null;
		serviceLoggerService = null;
		potDataDao = null;
		potDataService = null;
		equipmentDao = null;
		equipmentService = null;
		baseVendorDao = null;
		baseVendorService = null;
		containerDao = null;
		containerService = null;
		containerExpDao = null;
		containerExpService = null;
		flowRecordDao = null;
		flowRecordService = null;
		functionInfoDao = null;
		functionInfoService = null;
		maintainLogDao = null;
		maintainLogService = null;
		propertyTagsDao = null;
		propertyTagsService = null;
		storeSetDao = null;
		storeSetService = null;
		areaDao = null;
		areaService = null;
		placeManageDao = null;
		placeManageService = null;
		wareClassDao = null;
		prodAttributeDao = null;
		prodAttributeService = null;
		baseProdListDao = null;
		baseProdListService = null;
		baseCustomerDao = null;
		baseCustomerService = null;
		baseCustomerClassDao = null;
		baseCustomerClassService = null;
		prodattrelDao = null;
		prodattrelService = null;
		interfaceLogDao = null;
		interfaceLogService = null;
		wareDao = null;
		wareService = null;
		purchGroupDao = null;
		purchGroupService = null;
		purchGroupMemberDao = null;
		purchGroupMemberService = null;
		dataTransDao = null;
		dataTransService = null;
		itemSeqDao = null;
		itemSeqService = null;
		qACheckIndexDao = null;
		qACheckIndexService = null;
		originalSignalDao = null;
		originalSignalService = null;
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
		itemPartDao = null;
		itemPartService = null;
		itemSetupDao = null;
		itemSetupService = null;
		eamTypeDao = null;
		eamTypeService = null;
	
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
		this.counter = this.counterManager.addCounter("wareClass", "MESBasic_1_wareClass", "wareClass_{1,date,yyyyMMdd}_{0,number,000}", CounterType.Daily);
		String formatStr = "";
		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=wareClassDao.createNativeQuery(sql, menuCode);
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

	protected String getEntityCode(){return MESBasicWareClass.ENTITY_CODE;}
	protected String getModuleCode(){return MESBasicWareClass.MODULE_CODE;}
	protected String getModelCode(){return MESBasicWareClass.MODEL_CODE;}
	
	@Override
	public List<MESBasicWareClass> getTreeChildren(Long parentId, String cond, Object... params) {
		MESBasicWareClass parent = wareClassDao.getTree("wareClass_tree_" + parentId, parentId, new MESBasicWareClassPrepareData(cond, params), false);
		if (null != parent && null != parent.getChildren())
			return parent.getChildren();
		return Collections.emptyList();
	}
	
	@Override
	public List<MESBasicWareClass> getTreeInfo(Map<Long, String> treeInfo, String condition, List<Object> params) {
		final String conditionSql = (null != condition && condition.trim().length() > 0) ? " and " + condition : "";
		// key与value转换一下，方便通过layRec取id
		Map<String, Long> newTreeInfo = MapUtils.invertMap(treeInfo);
		// 存放顶层节点layRec
		List<String> mapKeys = new ArrayList<>();
		Map<String, List<String>> mapInfos = new HashMap<>();
		// 把选中的节点归类到各自所属的顶层节点中
		for (Map.Entry<Long, String> info : treeInfo.entrySet()) {
			if (mapKeys.isEmpty() || !info.getValue().startsWith(mapKeys.get(mapKeys.size() - 1) + "-")) {
				mapKeys.add(info.getValue());
				mapInfos.put(info.getValue(), new ArrayList<String>());
				mapInfos.get(mapKeys.get(mapKeys.size() - 1)).add(info.getValue());
			} else {
				mapInfos.get(mapKeys.get(mapKeys.size() - 1)).add(info.getValue());
			}
		}
		List<MESBasicWareClass> treeList = new ArrayList<MESBasicWareClass>();
		for(String layRec : mapKeys) {
			StringBuffer strBuf = new StringBuffer();
			List<String> partTreeLayRecs = mapInfos.get(layRec);
			final List<Object> paramsList = new ArrayList<Object>();
			for (String partLayRec : partTreeLayRecs) {
				if (strBuf.length() != 0) {
					strBuf.append(" or ");
				}
				boolean existsSubChildrenFlag = false;
				// 判断是否存在下级节点，如有同时选择了父节点与下级节点，只需要把父节点本身返回；如果未选择下级节点，需要拿到当前节点为根的整棵树
				for (String partLayRec1 : partTreeLayRecs) {
					if (partLayRec1.startsWith(partLayRec + "-")) {
						existsSubChildrenFlag = true;
						break;
					}
				}
				if (existsSubChildrenFlag) {
					strBuf.append("id = ?");
					paramsList.add(newTreeInfo.get(partLayRec));
				} else {
					strBuf.append("(layRec like ? or id = ?)");
					paramsList.add(partLayRec + "-%");
					paramsList.add(newTreeInfo.get(partLayRec));
				}
			}
			if (null != condition && condition.trim().length() > 0) {
				paramsList.addAll(params);
			}
			final String rootLayRec = layRec + "-";
			final Long rootId = newTreeInfo.get(layRec);
			final String searchCondition = strBuf.length() == 0 ? " 1=1" : strBuf.toString();
			MESBasicWareClass wareClassTree = wareClassDao.getTree("MESBasicWareClass" + rootLayRec + "-", rootId, new PrepareData<MESBasicWareClass, Long>() {
				@Override
				public MESBasicWareClass root() {
					MESBasicWareClass wareClass = new MESBasicWareClass();
					wareClass.setId(-1l);
					return wareClass;
				}

				@Override
				public List<MESBasicWareClass> prepare(TreeDao<MESBasicWareClass, Long> dao) {
					String hql = "from " + MESBasicWareClass.JPA_NAME + " where (" + searchCondition + ") and valid = true " + conditionSql + " order by layRec asc, sort asc";
					return dao.findByHql(hql, paramsList.toArray());
				}
			}, false);
			List<MESBasicWareClass> treeChildren = new ArrayList<MESBasicWareClass>();
			Tree.treeToList(wareClassTree, treeChildren, true);
			treeList.addAll(treeChildren);
		}
		return treeList;
	}

	private class MESBasicWareClassPrepareData implements PrepareData<MESBasicWareClass, Long> {
		private String cond;
		private Object[] params;
		
		public MESBasicWareClassPrepareData(String cond, Object... params) {
			this.cond = cond;
			this.params = params;
		}

		//@Override
		//public List<MESBasicWareClass> prepare(TreeDao<MESBasicWareClass, Long> dao) {
		//	String hql = "from " + MESBasicWareClass.JPA_NAME;
		//	if (null != cond && cond.trim().length() > 0) {
		//		hql += " where " + cond;
		//	}
		//	List<MESBasicWareClass> list = dao.findByHql(hql);
		//	return list;
		//}
		
		@Override
		public List<MESBasicWareClass> prepare(TreeDao<MESBasicWareClass, Long> dao) {
			List<MESBasicWareClass> list = null;
			List<MESBasicWareClass> result = new ArrayList<MESBasicWareClass>();
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicWareClass.class);
			if(params!=null&&params.length>0){
				List<Type> types = new ArrayList<Type>();
				for(Object obj : params){
					types.add(TypeFactory.basic(obj.getClass().getName()));
				}
				detachedCriteria.add(Restrictions.sqlRestriction(cond, params, types.toArray(new Type[]{})));
				detachedCriteria.addOrder(Order.asc("sort"));
				detachedCriteria.addOrder(Order.asc("id"));
				list = dao.findByCriteria(detachedCriteria);
			}else{
				list = dao.findByHql("from " + MESBasicWareClass.JPA_NAME + " " + ((cond==null || cond.isEmpty()) ? "" : "where " + cond + " order by layRec asc, sort asc")) ;
			}
			for(MESBasicWareClass m : list){
				result.add(m);
				if(m.getParentId()!=-1){
					while(m.getParentId()!=-1){
						MESBasicWareClass parent = dao.get(m.getParentId());
						if(!list.contains(parent)){
							result.add(parent);
						}
						m = parent;
					}
				}
			}
			return result;
		}

		@Override
		public MESBasicWareClass root() {
			MESBasicWareClass wareClass = new MESBasicWareClass();
			wareClass.setId(-1l);
			return wareClass;
		}
	}
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param wareClass 模型实例
	 */
	public void checkUniqueConstraint(MESBasicWareClass wareClass){
		if(wareClass.getId()==null){
			List<MESBasicWareClass> wareClasss = wareClassDao.findByCriteria(Restrictions.eq("code", wareClass.getCode()), Restrictions.eq("valid", true));
			if(wareClasss!=null && !wareClasss.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"MESBasic.propertydisplayName.randon1516252276448", getCurrentUser().getLanguage()), wareClass.getCode());
			}
		} else {
			List<MESBasicWareClass> wareClasss = wareClassDao.findByCriteria(Restrictions.ne("id", wareClass.getId()), Restrictions.eq("code", wareClass.getCode()), Restrictions.eq("valid", true));
			if(wareClasss!=null && !wareClasss.isEmpty()){
				throw new BAPException(BAPException.Code.UNIQUE_FIELD,InternationalResource.get(
						"MESBasic.propertydisplayName.randon1516252276448", getCurrentUser().getLanguage()), wareClass.getCode());
			}
		}
	}
	
	
	@Override
	public List<MESBasicWareClass> getWareClasss(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicWareClass.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return wareClassDao.findByHql("from " + MESBasicWareClass.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return wareClassDao.findByCriteria(detachedCriteria);
	}
	
	
	
	@Override
	public List<MESBasicWareClass> findWareClasssBySql(String sql, List<Object> params){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicWareClass.class);
		if(params!=null && params.size()>0){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
			
		}else{
			detachedCriteria.add(Restrictions.sqlRestriction(sql));
		}
		
		return wareClassDao.findByCriteria(detachedCriteria);
	}
	@Override
	public List<MESBasicWareClass> findWareClasssByHql(String hql, Object... objects){
		
		return   wareClassDao.findByHql(hql, objects);
	}
	
	@Override
	public MESBasicWareClass loadWareClassByBussinessKey(MESBasicWareClass wareClass){
		return loadWareClassByBussinessKey(wareClass.getCode());
	}
	
	@Override
	public Page<MESBasicWareClass> getWareClasss(Page<MESBasicWareClass> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicWareClass.class);
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
				page = wareClassDao.findByPage(page, sql);
			}else{
				page = wareClassDao.findAllByPage(page);
			}
			return page;
		}
		page = wareClassDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	@Override
	public void dealWareClassLeaf(List<Long> wareClassIds) {
		if (wareClassIds != null && wareClassIds.size() > 0) {
			String hql = "update " + MESBasicWareClass.JPA_NAME + " as t1 set t1.leaf=1 where id in(:ids) and not exists (select t2.id from "
					+ MESBasicWareClass.JPA_NAME + " as t2 where t2.parentId = t1.id)";
			Query query = wareClassDao.createQuery(hql);
			query.setParameterList("ids", wareClassIds);
			query.executeUpdate();
		}
	}
	/**
	 * 树拖动节点
	 * @param source
	 * @param target
	 */
	public void drag(long dragSource, long dragTarget, long sort){
		MESBasicWareClass source = getWareClass(dragSource);
		MESBasicWareClass oldParent = source.getParent();
		
		MESBasicWareClass target = null;
		if(dragTarget!=-1){
			target = getWareClass(dragTarget);
		} else {
			target = new MESBasicWareClass();
			target.setId(-1L);
		}
		wareClassDao.move(source, target);
	}
	
	private void dragWareClass(MESBasicWareClass parent, List<MESBasicWareClass> children){
		for(MESBasicWareClass child : children){
			child.setLayNo(parent.getLayNo()+1);
			child.setLayRec(parent.getLayRec() + "-" + child.getId());
			child.setFullPathName(OrchidUtils.getMainDisplayValue(parent) + "/" + OrchidUtils.getMainDisplayValue(child));
			saveWareClass(child, null,null,null);
			List<MESBasicWareClass> subChildren = getTreeChildren(child.getId(), "");
			if(subChildren!=null && subChildren.size()>0){
				dragWareClass(child, subChildren);
			}
		}
	}
	
	public List<MESBasicWareClass> convertTree(List<MESBasicWareClass> wareClasss){
		List<MESBasicWareClass> trees = new ArrayList<MESBasicWareClass>();
		Map<Long, MESBasicWareClass> map = new LinkedHashMap<Long, MESBasicWareClass>(wareClasss.size());
		Map<Long, Boolean> isParent = new HashMap<Long, Boolean>();
		for (MESBasicWareClass node : wareClasss) {
			map.put(Long.parseLong(node.getId().toString()), node);
		}
		for (MESBasicWareClass node : wareClasss) {
			if (null == node.getParentId() ||Long.parseLong(node.getParentId().toString()) == -1) {
				trees.add(node);
			} else {
				MESBasicWareClass parent = map.get(node.getParentId());
				node.setParent(parent);
				isParent.put(parent.getId(), true);
			}
		}
		for (MESBasicWareClass node : wareClasss) {
			if(isParent.get(node.getId())!=null && isParent.get(node.getId())){
				node.setIsParent(true);
			}
		}
		return trees;
	}
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicWareClass loadWareClassByBussinessKey(Serializable bussinessKey){
		return wareClassDao.findEntityByCriteria(Restrictions.eq("code", bussinessKey),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<MESBasicWareClass> findByProperty(String propertyName, Object object){
		return wareClassDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicWareClass findEntityByProperty(String propertyName, Object object){
		return wareClassDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<String> bussinessKeyList = Arrays.asList(bussinessKeys.split(","));
			String sql = "update " + MESBasicWareClass.JPA_NAME + " set valid=0 where code in (:businessKeys)";
			Query query = wareClassDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("MESBasic_1_wareClass_WareClass","runtime");
		try {
			for(View dgv:dgviews){
				if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
					List<DataGrid> ldg=viewServiceFoundation.getDataGrids(dgv.getCode());
					for(DataGrid dg:ldg){
						bap_validate_datagrids+=dg.getName()+",";
						dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.MESBasic.entities."+dg.getTargetModel().getJpaName()));
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
				dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.MESBasic.entities."+dg.getTargetModel().getJpaName()));
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
		List<View> views = viewServiceFoundation.findViewsByEntityCode("MESBasic_1_wareClass", ViewType.VIEW);
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
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("MESBasic_1_wareClass_WareClass","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	public void dealDatagridsSave(MESBasicWareClass wareClass,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=viewServiceFoundation.getDataGrids(viewCode, "runtime");
		if(dgs!=null&&dgs.size()>0){
			wareClassDao.flush();
			Class _reflect_thisclass=this.getClass();
			try {
				for(DataGrid dg:dgs){
					if(null != dg.getDataGridType() && dg.getDataGridType() == 1){
						continue;
					}
					Class _reflect_dgclass=Class.forName("com.supcon.orchid.MESBasic.entities."+dg.getTargetModel().getJpaName());
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
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()).replaceAll("\r\n", "\\\\r\\\\n"), _reflect_dgclass,wareClassDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), MESBasicWareClass.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, wareClass);
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
								paramMap.put("mainModelId",wareClass.getId());	
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
			String sql = "select " + businessKeyName +" from "+ MESBasicWareClass.TABLE_NAME +" where valid = 1";
			list = wareClassDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ MESBasicWareClass.TABLE_NAME;
			list = wareClassDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey){
		List<Object[]> list = new ArrayList<Object[]>();
		Map<Object, Object> m = new HashMap<Object, Object>();
		if(null != propertyName && null != businessKey){
			String sql = "select " + businessKey + "," + propertyName +" from "+ MESBasicWareClass.TABLE_NAME +" group by " + propertyName + "," + businessKey;
			list = wareClassDao.createNativeQuery(sql).list();
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
	private MESBasicWareClassDaoImpl wareClassDaoImpl;
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchWareClass(final List<MESBasicWareClass> insertObjs, final List<MESBasicWareClass> updateObjs, 
				List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){
		return this.importBatchWareClass(insertObjs, updateObjs, columnInfo, importNodeInfo, importPropInfo,null);		
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchWareClass(final List<MESBasicWareClass> insertObjs, final List<MESBasicWareClass> updateObjs, 
				List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog){
				
		int importCount = 0;
		if (null != insertObjs) {
			importCount += insertObjs.size();
		}
		if (null != updateObjs) {
			importCount += updateObjs.size();
		}
		AuditUtil.setAuditDes(InternationalResource.get("foundation.import.bussiness.info.args",null,InternationalResource.get("MESBasic.modelname.randon1516252171050"),importCount));
		if(null != signatureLog && null == signatureLog.getOperateLogUuid()){
			if (null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()) {
				signatureLog.setOperateLogUuid((null == AuditUtil.getCurrentAudit().getOperationAudit().get_parentCode() || "-1".equals( AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode())) ? AuditUtil.getCurrentAudit().getOperationAudit().getUuid() : AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode());
			}
		}
		Map<Long, MESBasicWareClass> oldUpdateObjsMap = new HashMap<Long, MESBasicWareClass>(); 
		List<Long> updateObjIdsList = new ArrayList<Long>();
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {
			MESBasicWareClass bizObj = updateObjs.get(updateIndex);
			updateObjIdsList.add(bizObj.getId());
		}
		if (updateObjIdsList.size() > 0) {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicWareClass.class);
			if(updateObjIdsList.size()>1000){
				List<Long> updateObjIdsListBefore = updateObjIdsList.subList(0, 999);
				List<Long> updateObjIdsListAfter = updateObjIdsList.subList(999, updateObjIdsList.size());		
				detachedCriteria.add(Restrictions.or(Restrictions.in("id", updateObjIdsListBefore),Restrictions.in("id", updateObjIdsListAfter)));
			}else{
				detachedCriteria.add(Restrictions.in("id", updateObjIdsList));
			}
			List<MESBasicWareClass> bizObjList = wareClassDao.findByCriteria(detachedCriteria);
			if (null != bizObjList) {
				for (int mIndex = 0; mIndex < bizObjList.size(); mIndex++) {
					MESBasicWareClass bizObj = bizObjList.get(mIndex);
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
		
		final List<MESBasicWareClass> nmeObjs = new ArrayList<MESBasicWareClass>();
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(MESBasicWareClass.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(MESBasicWareClass wareClass:insertObjs)  {
			//id = autoGeneratorID.getNextId(MESBasicWareClass.TABLE_NAME,1,dbId);
			if(wareClass.getCode() != null && !wareClass.getCode().equals("") ){
				m.put(wareClass.getCode(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			wareClass.setId(id);
			id++;
		}
		
		//节点处理
		List<Map<String, Object>> updateNodeList = importNodeInfo.get("update");
		List<Map<String, Object>> insertNodeList = importNodeInfo.get("insert");
		Property mainDisplayProp = importPropInfo.get("mainDisplay");
		Property businessKeyProp = importPropInfo.get("businessKey");
		
		String mainDisName = null;
		if(updateNodeList!=null && updateNodeList.size()>0){
			mainDisName = (String) updateNodeList.get(0).get("mainDisplayName");
		}else{
			mainDisName = (String) insertNodeList.get(0).get("mainDisplayName");
		}
		String getMainDisMethodName = "get" + mainDisName.substring(0, 1).toUpperCase() + mainDisName.substring(1);
		Method getMainDis =null;
		try {
			if(updateObjs!=null && updateObjs.size()>0){
				getMainDis = updateObjs.get(0).getClass().getMethod(getMainDisMethodName);
			}else{
				getMainDis = insertObjs.get(0).getClass().getMethod(getMainDisMethodName);
			}
		} catch (NoSuchMethodException | SecurityException e) {
			log.error(e.getMessage(),e);
		}
		
		String busKeyName = null;
		if(updateNodeList!=null && updateNodeList.size()>0){
			busKeyName = (String) updateNodeList.get(0).get("businessKeyName");
		}else{
			busKeyName = (String) insertNodeList.get(0).get("businessKeyName");
		}
		String getBusKeyMethodName = "get" + busKeyName.substring(0, 1).toUpperCase() + busKeyName.substring(1);
		Method getBusKey =null;
		try {
			if(updateObjs!=null && updateObjs.size()>0){
				getBusKey = updateObjs.get(0).getClass().getMethod(getBusKeyMethodName);
			}else{
				getBusKey = insertObjs.get(0).getClass().getMethod(getBusKeyMethodName);
			}
		} catch (NoSuchMethodException | SecurityException e) {
			log.error(e.getMessage(),e);
		}
		
		this.insertBuildedObj = new HashMap<String, Object>();
		this.insertBuildedObjCount = 0;
		Map<String, Object> insertParentNode = new HashMap<String, Object>();
		List<Map<String, Object>> needChangeInsertNodeList = new ArrayList<Map<String,Object>>();
		List<MESBasicWareClass> needChangeInsertObjList = new ArrayList<MESBasicWareClass>();
		if(insertNodeList != null && insertNodeList.size()>0 ){
			for(int i = 0; i < insertNodeList.size(); i++){
				Map<String, Object> insertNode = insertNodeList.get(i);
				Boolean needChange = false;
				Boolean isRoot = false;
				if(insertNode.get("needChange")!=null){
					needChange = (Boolean) insertNode.get("needChange");	
					if(needChange){
						needChangeInsertNodeList.add(insertNode);
						needChangeInsertObjList.add(insertObjs.get(i));
					}
				}else if(insertNode.get("isRoot")!=null){
					isRoot = (Boolean) insertNode.get("isRoot");	
					if(isRoot){
						needChangeInsertNodeList.add(insertNode);
						needChangeInsertObjList.add(insertObjs.get(i));
					}
				}	
				if(!needChange && !isRoot){
					MESBasicWareClass obj = insertObjs.get(i);
					String virtualId = null;
					String mainDis = null;
					String busKey = null;
					try {
						if(null != getMainDis.invoke(obj)){
							mainDis = getMainDis.invoke(obj).toString();
						}
						if(null != getBusKey.invoke(obj)){
							busKey = getBusKey.invoke(obj).toString();
						}
						Method virtualMethod = obj.getClass().getMethod("getVirtualId");
						virtualId = (String) virtualMethod.invoke(obj);
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
						log.error(e.getMessage(),e);
					}
					/*String parentNode = insertNode.get("parentNode").toString();
					MESBasicWareClass parentObj = (MESBasicWareClass) insertNode.get(parentNode);
					*/
					Object[] parentNode = (Object[]) insertNode.get("parentNode");//0.主显示；1.id；2.业务主；3.fullPathName;4.layNo;5.layRec;6.parentId;7.leaf
					String layRec = parentNode[5] + "-" + obj.getId().toString();
					obj.setParentId(Long.valueOf(parentNode[1].toString()));
					obj.setLayNo(Integer.valueOf(parentNode[4].toString())+1);
					obj.setLayRec(layRec);
					obj.setFullPathName(parentNode[3].toString() + "/" + mainDis);
					if(virtualId != null && virtualId.length() > 0){
						insertBuildedObj.put(virtualId, obj);
					}else{
						insertBuildedObj.put(busKey, obj);
					}
					insertBuildedObj.put(mainDis, obj);
				}
			}	
			insertParentNode = buildInsertObjNode(needChangeInsertNodeList, needChangeInsertObjList,getMainDis, getBusKey);//首先处理新增对象的对象,完善节点信息
		}
		
		final List<Long> updateParentIdList = new ArrayList<Long>();
		final List<Integer> updateLayNoList = new ArrayList<Integer>();
		final List<String> updateLayRecList = new ArrayList<String>();
		final List<String> updateFullPathNameList = new ArrayList<String>();
		if(updateNodeList != null && updateNodeList.size()>0){
			for(int i = 0; i < updateNodeList.size(); i++){
				Map<String, Object> updateNode = updateNodeList.get(i);
				MESBasicWareClass updateObj = updateObjs.get(i);
				Boolean isRoot = (Boolean) updateNode.get("isRoot");
				
				if(isRoot){
					updateParentIdList.add(new Long(-1));
					updateLayNoList.add(1);
					updateLayRecList.add(updateObj.getId().toString());
					String mainDis =null;
					try {
						if(null != getMainDis.invoke(updateObj)){
							mainDis = getMainDis.invoke(updateObj).toString();
						}
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						log.error(e.getMessage(),e);
					}
					updateFullPathNameList.add(mainDis);
				}else{
					Boolean needChange = (Boolean) updateNode.get("needChange");					
					String mainDis =null;
					try {
						if(null != getMainDis.invoke(updateObj)){
							mainDis = getMainDis.invoke(updateObj).toString();
						}
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						log.error(e.getMessage(),e);
					}
					if(needChange!=null && !needChange){
						Object[] parentNode = (Object[]) updateNode.get("parentNode");//0.主显示；1.id；2.业务主；3.fullPathName;4.layNo;5.layRec;6.parentId;7.leaf
						String layRec = parentNode[5] + "-" + updateObj.getId().toString();
						updateParentIdList.add(Long.valueOf(parentNode[1].toString()));
						updateLayNoList.add(Integer.valueOf(parentNode[4].toString())+1);
						updateLayRecList.add(layRec);
						updateFullPathNameList.add(parentNode[3].toString() + "/" + mainDis);
					}else{
						String parentNodeKey = (String) updateNode.get("parentNode");
						MESBasicWareClass parentNode = (MESBasicWareClass) insertParentNode.get(parentNodeKey);
						updateParentIdList.add(parentNode.getId());
						updateLayNoList.add(parentNode.getLayNo()+1);
						updateLayRecList.add(parentNode.getLayRec() + "-" + updateObj.getId().toString());
						updateFullPathNameList.add(parentNode.getFullPathName() + "/" + mainDis);
					}
				}
			}
		}
		final List<Long> insertParentIdList = new ArrayList<Long>();
		final List<Integer> insertLayNoList = new ArrayList<Integer>();
		final List<String> insertLayRecList = new ArrayList<String>();
		final List<String> insertFullPathNameList = new ArrayList<String>();
		if(insertNodeList != null && insertNodeList.size()>0){
			for(int i = 0; i < insertNodeList.size(); i++){
				Map<String, Object> insertNode = insertNodeList.get(i);
				MESBasicWareClass insertObj = insertObjs.get(i);
				Boolean isRoot = (Boolean) insertNode.get("isRoot");
				if(isRoot){
					insertParentIdList.add(new Long(-1));
					insertLayNoList.add(1);
					insertLayRecList.add(insertObj.getId().toString());
					String mainDis =null;
					try {
						if(null != getMainDis.invoke(insertObj)){
							mainDis = getMainDis.invoke(insertObj).toString();
						}
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						log.error(e.getMessage(),e);
					}
					insertFullPathNameList.add(mainDis);
				}else{
					Boolean needChange = (Boolean) insertNode.get("needChange");					
					String mainDis =null;
					try {
						if(null != getMainDis.invoke(insertObj)){
							mainDis = getMainDis.invoke(insertObj).toString();
						}
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						log.error(e.getMessage(),e);
					}
					if(needChange!=null && !needChange){
						Object[] parentNode = (Object[]) insertNode.get("parentNode");//0.主显示；1.id；2.业务主；3.fullPathName;4.layNo;5.layRec;6.parentId;7.leaf
						String layRec = parentNode[5] + "-" + insertObj.getId().toString();
						insertParentIdList.add(Long.valueOf(parentNode[1].toString()));
						insertLayNoList.add(Integer.valueOf(parentNode[4].toString())+1);
						insertLayRecList.add(layRec);
						insertFullPathNameList.add(parentNode[3].toString() + "/" + mainDis);
					}else{
						String parentNodeKey = (String) insertNode.get("parentNode");
						MESBasicWareClass parentNode = (MESBasicWareClass) insertParentNode.get(parentNodeKey);
						insertParentIdList.add(parentNode.getId());
						insertLayNoList.add(parentNode.getLayNo()+1);
						insertLayRecList.add(parentNode.getLayRec() + "-" + insertObj.getId().toString());
						insertFullPathNameList.add(parentNode.getFullPathName() + "/" + mainDis);
					}	
				}
			}
		}
		
		List paramList = new ArrayList();
		if(updateObjs != null && updateObjs.size()>0 ){
			for(MESBasicWareClass obj : updateObjs){
				Object bus;
				try {
					bus = getBusKey.invoke(obj);
					paramList.add(bus);
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
					log.error(e.getMessage(),e);
				}
			}
		}
		
		//节点fullPathName单独处理
		Property businessKey = importPropInfo.get("businessKey");
		Property mainDisplay = importPropInfo.get("mainDisplay");
		List<Long> needChangeFullPathNameId = new ArrayList<Long>();
		//List<Map<Object, Object>> needChangeFullPathNameList = new ArrayList<Map<Object, Object>>();
		Map<Object, Object> needChangeFullPathName = new HashMap<Object, Object>();//原主显示，现主显示
		//先查出来表中主显示字段的值，如果和修改的对象不一致，存在map里。后面用来重刷fullpathname
		if(businessKey != null && mainDisplay != null && businessKey != mainDisplay  && paramList != null && paramList.size()>0){
			String hql = "select " + businessKey.getName() + "," + mainDisplay.getName() + ",id from " + MESBasicWareClass.JPA_NAME + " where " + businessKey.getName() + " in (:codes)";
			Query query =  wareClassDao.createQuery(hql);
			query.setParameterList("codes", paramList);
			List<Object[]> list = query.list();
			if(list.size() == updateObjs.size()){
				for(int i = 0 ; i < updateObjs.size();i++ ){
					MESBasicWareClass obj = updateObjs.get(i);
					for(int j = 0 ; j < list.size();j++){
						Object[] listobj = list.get(j);
						try {
							Object md = getMainDis.invoke(obj);
							Object bus = getBusKey.invoke(obj);
							if(bus.toString().equals(listobj[0].toString()) && !md.toString().equals(listobj[1].toString())){
								needChangeFullPathName.put(listobj[1].toString(), md);
								needChangeFullPathNameId.add(Long.valueOf(listobj[2].toString()));
								//needChangeFullPathNameList.add(needChangeFullPathName);
							}
						} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
							log.error(e.getMessage(),e);
						}
					}
				}
			}
		}
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) wareClassDao.createNativeQuery(sql, "MESBasic_1_wareClass_WareClass"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		
		wareClassDaoImpl.getSession().doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				PreparedStatement updateps = null;
				PreparedStatement insertps = null;
				User currentUser=(User)getCurrentUser();
				Staff currentStaff=currentUser.getStaff();
				
				if(updateObjs != null && updateObjs.size()>0){
					List<String> updateMethods = new ArrayList<String>();
					String updateSql = "UPDATE " + MESBasicWareClass.TABLE_NAME + " SET ";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						updateMethods.add(methodName);
						updateSql += columnMaps.get(i).get("dbname")+"=?,";
					}
					updateSql += "parent_id = ?, LAY_NO = ?, LAY_REC = ?, FULL_PATH_NAME = ?";
					updateSql += " where " + dbId + " =?";
					
					updateps = conn.prepareStatement(updateSql);
					for(int updateIndex =0;updateIndex<updateObjs.size();updateIndex++){
						MESBasicWareClass wareClass = updateObjs.get(updateIndex);
						Long id = wareClass.getId();
						if(null != id){
							updateps.setLong(columnMaps.size()+5,id);
							updateps.setLong(columnMaps.size()+1,updateParentIdList.get(updateIndex));
							updateps.setInt(columnMaps.size()+2,updateLayNoList.get(updateIndex));
							updateps.setString(columnMaps.size()+3,updateLayRecList.get(updateIndex));
							updateps.setString(columnMaps.size()+4,updateFullPathNameList.get(updateIndex));
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = wareClass.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(wareClass);
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
												String methodName = "get" + associatedModelNames.get(i).substring(0, 1).toUpperCase() +  associatedModelNames.get(i).substring(1, associatedModelNames.get(i).length());
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
											
										}							}
								}else{
									updateps.setString(i+1, null);
								}
							}
							nmeObjs.add(wareClass);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + MESBasicWareClass.TABLE_NAME + " (";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						insertMethods.add(methodName);
						insertSql += columnMaps.get(i).get("dbname")+",";
					}
					insertSql += dbId + ",CID,CREATE_STAFF_ID,CREATE_TIME,EFFECTIVE_STATE,PARENT_ID,LAY_NO,LAY_REC,FULL_PATH_NAME) VALUES (";
					for(int i = 0;i<columnMaps.size();i++){
						insertSql += "?,";
					}
					insertSql += "?,?,?,?,?,?,?,?,?)";
					
//					String idSql = "select id from " + MESBasicWareClass.TABLE_NAME + " order by id desc";
//					Query query = wareClassDao.createNativeQuery(idSql).setMaxResults(1);
//					Long id = new Long(1000);
//					if(null != query.uniqueResult()){
//						id = Long.valueOf(query.uniqueResult().toString());
//					}
					insertps = conn.prepareStatement(insertSql);
					for(int insertIndex = 0; insertIndex<insertObjs.size(); insertIndex++)  {
						MESBasicWareClass wareClass = insertObjs.get(insertIndex);
						insertps.setLong(columnMaps.size() + 1, insertIds.get(insertIndex));
						insertps.setLong(columnMaps.size() + 2,getCurrentCompanyId());
						insertps.setLong(columnMaps.size() + 3,currentStaff.getId());
						java.util.Date date=new java.util.Date();
						insertps.setTimestamp(columnMaps.size() + 4,new java.sql.Timestamp(date.getTime()));
						insertps.setInt(columnMaps.size() + 5,0);
						insertps.setLong(columnMaps.size() + 6,insertParentIdList.get(insertIndex));
						insertps.setInt(columnMaps.size() + 7,insertLayNoList.get(insertIndex));
						insertps.setString(columnMaps.size() + 8,insertLayRecList.get(insertIndex));
						insertps.setString(columnMaps.size() + 9,insertFullPathNameList.get(insertIndex));
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = wareClass.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(wareClass);
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
											String methodName = "get" + associatedModelNames.get(i).substring(0, 1).toUpperCase() +  associatedModelNames.get(i).substring(1, associatedModelNames.get(i).length());
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
						//wareClass.setId(id);
						nmeObjs.add(wareClass);
						insertps.addBatch();
					}		
				}
				
				PreparedStatement deletemneps = null;
				PreparedStatement savemneps = null;
				
				if(nmeObjs != null && nmeObjs.size()>0){//助记码操作
					Object mainEntity = nmeObjs.get(0);			
					Class<?> mainClazz = mainEntity.getClass();
					Class<?> mneCodeEntity = MESBasicWareClassMneCode.class;

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
					for(MESBasicWareClass wareClass:updateObjs)  {
						Long id = wareClass.getId();
						deletemneps.setLong(1, id);
						deletemneps.addBatch();
					}	
					
					//生成并新增助记码
					String idSql = "select id from " + mneCodeTable.name() + " order by id desc";
					Query query = wareClassDao.createNativeQuery(idSql).setMaxResults(1);
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
								for(MESBasicWareClass wareClass:nmeObjs)  {
									String value = null;
									try {
										value = (String) getMethod.invoke(wareClass);
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
											id = autoGeneratorID.getNextId(mneCodeTable.name(),1,"ID");
											savemneps.setLong(1, id);
											savemneps.setString(2, mneCode);
											savemneps.setLong(3, wareClass.getId());
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
				if(null != updateps){
					updateps.executeBatch();
					updateps.close();
				}
				
			}
		});	
		
		wareClassDaoImpl.getSession().flush();
		wareClassDaoImpl.getSession().clear();
		
		if(needChangeFullPathNameId!=null && needChangeFullPathNameId.size()>0){
			changeFullPathName(needChangeFullPathNameId,needChangeFullPathName,businessKey,mainDisplay);//根据修改过的主显示，调整FullPathName
		}
		
		//记录导入数据日志（区分新增和修改）
		
		for(int insertIndex = 0; insertIndex < insertObjs.size(); insertIndex++)  {//新增
			MESBasicWareClass bizObj = insertObjs.get(insertIndex);
			wareClassImportService.saveImportDataLog(bizObj, null, "code", "name");
		}
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {//修改
			MESBasicWareClass bizObj = updateObjs.get(updateIndex);
			MESBasicWareClass oldBizObj = oldUpdateObjsMap.get(bizObj.getId());
			wareClassImportService.saveImportDataLog(bizObj, oldBizObj, "code", "name");
		}
		
		return m;
	}
	
	private void changeFullPathName(List<Long> needChangeFullPathNameId, Map<Object, Object> needChangeFullPathName,final Property businessKey,Property mainDisplay){
		final List<Object[]> updateLists = new ArrayList<Object[]>();
		StringBuilder sql = new StringBuilder();
		sql.append("select FULL_PATH_NAME,parent_id,");
		sql.append(businessKey.getColumnName());
		sql.append(",");
		sql.append(mainDisplay.getColumnName());
		sql.append(" from ");
		sql.append(MESBasicWareClass.TABLE_NAME);
		sql.append(" where ");
		for(Long id : needChangeFullPathNameId){
			sql.append(" LAY_REC like '%");
			sql.append(id.toString());
			sql.append("%' or");
		}
		String sqlStr = sql.toString();
		sqlStr = sqlStr.substring(0, sqlStr.length()-2);
		List<Object[]> lists =  wareClassDao.createNativeQuery(sqlStr).list();
		for(Object[] result : lists){
			if(Integer.valueOf(result[1].toString()) != -1){
				String[] strs = result[0].toString().split("/");
				StringBuilder newFullPathName = new StringBuilder();
				for(String str : strs){
					if(needChangeFullPathName.get(str)!=null){
						newFullPathName.append(needChangeFullPathName.get(str));
						newFullPathName.append("/");
					}else{
						newFullPathName.append(str);	
						newFullPathName.append("/");
					}
				}
				result[0] = newFullPathName.substring(0, newFullPathName.length()-1).toString();
				updateLists.add(result);
			}
		}
		
		wareClassDaoImpl.getSession().doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				PreparedStatement updateps = null;
				
				if(updateLists != null && updateLists.size()>0){
					String updateSql = "UPDATE " + MESBasicWareClass.TABLE_NAME + " SET FULL_PATH_NAME = ? WHERE " + businessKey.getColumnName() + " = ?";
					updateps = conn.prepareStatement(updateSql);
					for(int updateIndex =0;updateIndex<updateLists.size();updateIndex++){
						Object[] obj = updateLists.get(updateIndex);
						updateps.setString(1, obj[0].toString());
						if(businessKey.getType().toString().equals("TEXT")){
							updateps.setString(2, obj[2].toString());
						}else if(businessKey.getType().toString().equals("LONG")){
							updateps.setInt(2, Integer.valueOf(obj[2].toString()));
						}else if(businessKey.getType().toString().equals("INTEGER")){
							updateps.setLong(2, Long.valueOf(obj[2].toString()));
						}
						updateps.addBatch();
					}	
				}	
				
				if(null != updateps){
					updateps.executeBatch();
					updateps.close();
				}
			}
		});		
		wareClassDaoImpl.getSession().flush();
		wareClassDaoImpl.getSession().clear();
	}
	
	
	Map<String, Object> insertBuildedObj = new HashMap<String, Object>();
	int insertBuildedObjCount = 0;
	//新增对象的节点信息处理，从根节点开始，往上递归，如果其他对象关联的节点是新增对象，从这里获取节点信息
	private Map<String, Object> buildInsertObjNode(List<Map<String, Object>> insertNodeList, List<MESBasicWareClass> insertObjs, 
			Method getMainDis, Method getBusKey){
		if(insertNodeList != null && insertNodeList.size()>0){
			for(int i =0; i<insertNodeList.size(); i++){
				Map<String, Object> insertNode = insertNodeList.get(i);
				MESBasicWareClass insertObj = insertObjs.get(i);
				Boolean isRoot = (Boolean) insertNode.get("isRoot");
				MESBasicWareClass obj = insertObjs.get(i);
				String virtualId = null;
				String mainDis =null;
				String busKey =null;
				try {
					if(null != getMainDis.invoke(obj)){
						mainDis = getMainDis.invoke(obj).toString();
					}
					if(null != getBusKey.invoke(obj)){
						busKey = getBusKey.invoke(obj).toString();
					}
					Method virtualMethod = obj.getClass().getMethod("getVirtualId");
					virtualId = (String) virtualMethod.invoke(obj);
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
					log.error(e.getMessage(),e);
				}
				if(insertBuildedObj.get(busKey)!=null){
					continue;
				}else{
					if(isRoot){
						obj.setParentId(new Long(-1));
						obj.setLayNo(1);
						obj.setLayRec(obj.getId().toString());
						obj.setFullPathName(mainDis);
						if(virtualId != null && virtualId.length() > 0){
							insertBuildedObj.put(virtualId, obj);
						}else{
							insertBuildedObj.put(busKey, obj);
						}
						insertBuildedObj.put(mainDis, obj);
						insertBuildedObjCount++;
					}else if(insertNode.get("parentNode")!=null && insertBuildedObj.get(insertNode.get("parentNode").toString()) != null){
						String parentNode = insertNode.get("parentNode").toString();
						MESBasicWareClass parentObj = (MESBasicWareClass) insertBuildedObj.get(parentNode);
						obj.setParentId(parentObj.getId());
						obj.setLayNo(parentObj.getLayNo() + 1);
						obj.setLayRec(parentObj.getLayRec().toString() + "-" + obj.getId().toString());
						obj.setFullPathName(parentObj.getFullPathName() + "/" + mainDis);
						if(virtualId != null && virtualId.length() > 0){
							insertBuildedObj.put(virtualId, obj);
						}else{
							insertBuildedObj.put(busKey, obj);
						}
						insertBuildedObj.put(mainDis, obj);
						insertBuildedObjCount++;
					}
				}	
			}
			if(insertBuildedObjCount != insertNodeList.size()){
				buildInsertObjNode(insertNodeList,insertObjs,getMainDis,getBusKey);
			}else{
				return insertBuildedObj;
			}
		}
		return insertBuildedObj;
	}
	
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getViewName(String modelCode){
		String sql = "select NAME from runtime_view where type='LIST' and ass_model_code = ?";
		String viewName = wareClassDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult()!=null?
				wareClassDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult().toString():"";
		return viewName;
	}
	
	
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = wareClassDao.createNativeQuery(sql, "MESBasic_1_wareClass_WareClass").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = wareClassDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = wareClassDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = wareClassDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?wareClassDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  wareClassDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,wareClassDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	
	 
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="ec.flow.save")
	public void saveWareClass(MESBasicWareClass wareClass, DataGridService dataGridService){
		saveWareClass(wareClass, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="ec.flow.save")
	public void saveWareClass(MESBasicWareClass wareClass, DataGridService dataGridService, String viewCode){
		saveWareClass(wareClass, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass")
	public void saveWareClass(MESBasicWareClass wareClass, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		this.saveWareClass(wareClass, dataGridService, viewCode, eventTopic,null,isImport);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass")
	public void saveWareClass(MESBasicWareClass wareClass, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog, boolean... isImport){
		boolean isNew = false;
		String entityCode = "MESBasic_1_wareClass";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_wareClass");
		String url = null;
		if(null != wareClass.getId() && wareClass.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/add";
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
				executeGScript(entityCode, "beforeSave", events, wareClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(wareClass);
		beforeSaveWareClass(wareClass, viewIsView);

		if (viewIsView) {
			wareClassDao.saveWithRevertVersion(wareClass);
		} else {
			if(isNew)
					wareClassDao.save(wareClass);
				else
					wareClassDao.merge(wareClass);
		}
		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		if (dataGridService != null) {
			wareClassDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateWareClassCodes(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateWareClassSummarys(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveWareClass(wareClass, viewIsView);


		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/add", wareClass,MESBasicWareClassMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, wareClass);
			}
		}
		List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
		wareClassDao.flush();
		wareClassDao.clear();
		wareClass = wareClassDao.load(wareClass.getId());
		
		
		params.add(wareClass);
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=wareClass.getCode();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(wareClass.getId());
			String msgId="moduleCode:MESBasic_1#entityCode:MESBasic_1_wareClass#modelCode:MESBasic_1_wareClass_WareClass#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass")
	public Map<Object, Object> wareClassDataGridImport(MESBasicWareClass wareClass, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport){
		Map<Object, Object> map = new HashMap<Object, Object>();
		boolean isNew = false;
		String entityCode = "MESBasic_1_wareClass";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_wareClass");
		String url = null;
		if(wareClass.getId() != null && wareClass.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/add";
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
				executeGScript(entityCode, "beforeSave", events, wareClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(wareClass);
		beforeSaveWareClass(wareClass, viewIsView);

		if (viewIsView) {
			wareClassDao.saveWithRevertVersion(wareClass);
		} else {
			if(isNew)
					wareClassDao.save(wareClass);
				else
					wareClassDao.merge(wareClass);
		}

		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		
		if (dataGridService != null) {
			wareClassDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateWareClassCodes(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateWareClassSummarys(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveWareClass(wareClass, viewIsView);


		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/add", wareClass,MESBasicWareClassMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, wareClass);
			}
		}
		List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
		wareClassDao.flush();
		wareClassDao.clear();
		
		String virturalId = wareClass.getVirtualId();
		
		wareClass = wareClassDao.load(wareClass.getId());
		
		if(virturalId != null && virturalId.length() > 0){
			map.put(virturalId, wareClass.getId());
		}else{
			String methodName = "get" + businessKey.getName().substring(0, 1).toUpperCase() + businessKey.getName().substring(1);
			Object bkValue = null;
			try {
				Method getBkValue = wareClass.getClass().getMethod(methodName);
				bkValue = getBkValue.invoke(wareClass);
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				log.error(e.getMessage(), e);
			}
			map.put(bkValue, wareClass.getId());
		}
		
		
		params.add(wareClass);
		return map;
	}
	
	 
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass")
	public void mergeWareClass(MESBasicWareClass wareClass, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(wareClass);
		beforeSaveWareClass(wareClass);
		wareClassDao.merge(wareClass);
		
		if(null != wareClass && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicWareClass.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == wareClass.getCode() ? "" : wareClass.getCode().toString());
			AuditUtil.setColumnStringA(null == wareClass.getName() ? "" : wareClass.getName().toString());
			AuditUtil.setColumnStringC(wareClass.getId().toString());
		}
		
		if (dataGridService != null) {
			dataGridService.execute();
		}

		afterSaveWareClass(wareClass);
		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/add", wareClass,MESBasicWareClassMneCode.class);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.common.exportExcel",operType="11")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="ec.print.page.print",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes(InternationalResource.get("ec.print.page.print"));
		}else if(printType == 1){
			AuditUtil.setAuditDes(InternationalResource.get("ec.view.controlPrint"));
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_wareClass",model="MESBasic_1_wareClass_WareClass",desc="foundation.batch.save",operType="4")
	public void batchSaveWareClass(MESBasicWareClass wareClass, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "MESBasic_1_wareClass";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_wareClass");
		String url = null;
		if(wareClass.getId()!=null && wareClass.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_wareClass/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, wareClass);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(wareClass);
		beforeSaveWareClass(wareClass, viewIsView);

		if (viewIsView) {
			wareClassDao.saveWithRevertVersion(wareClass);
		} else {
			wareClassDao.save(wareClass);
		}

		if (dataGridService != null) {
			wareClassDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateWareClassCodes(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateWareClassSummarys(wareClass, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveWareClass(wareClass, viewIsView);


		wareClassDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/wareClass/add", wareClass,MESBasicWareClassMneCode.class);
		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, wareClass);
			}
		}
		List<MESBasicWareClass> params = new ArrayList<MESBasicWareClass>();
		wareClassDao.flush();
		wareClassDao.clear();
		wareClass = wareClassDao.load(wareClass.getId());
		
		
		params.add(wareClass);
	}
	
	@Override
	public Page<MESBasicWareClass> getByPage(Page<MESBasicWareClass> page,DetachedCriteria detachedCriteria){
		return wareClassDao.findByPage(page, detachedCriteria);
	}
	
	
	
	public String generateTableNo(){
		this.counter.setPattern(modelServiceFoundation.getEntity("MESBasic_1_wareClass").getPrefix()+"_{1,date,yyyyMMdd}_{0,number,000}");
		return this.counter.incrementAndGetString(new Date(),new Date());
	}
	private void beforeSaveWareClass(MESBasicWareClass wareClass, Object... objects){
		checkUniqueConstraint(wareClass);
	/* CUSTOM CODE START(serviceimpl,beforeSave,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveWareClass(MESBasicWareClass wareClass, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportWareClass(List<MESBasicWareClass> wareClasss, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportWareClass(List<MESBasicWareClass> wareClasss){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportWareClass(List<MESBasicWareClass> wareClasss, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportWareClass(List<MESBasicWareClass> wareClasss){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	private void beforeDeleteWareClass(MESBasicWareClass wareClass){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterDeleteWareClass(MESBasicWareClass wareClass){
	/* CUSTOM CODE START(serviceimpl,afterDelete,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRestoreWareClass(MESBasicWareClass wareClass){
	/* CUSTOM CODE START(serviceimpl,beforeRestore,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterRestoreWareClass(MESBasicWareClass wareClass){
	/* CUSTOM CODE START(serviceimpl,afterRestore,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void customGenerateCodes(MESBasicWareClass wareClass, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(MESBasicWareClass wareClass, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportWareClass(List<MESBasicWareClass> insertObjs, List<MESBasicWareClass> updateObjs, 
			List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportWareClass,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void afterImportWareClass(List<MESBasicWareClass> insertObjs, List<MESBasicWareClass> updateObjs, 
			List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportWareClass,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	/* CUSTOM CODE START(serviceimpl,functions,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
