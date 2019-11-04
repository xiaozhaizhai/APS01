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
import com.supcon.orchid.MESBasic.entities.MESBasicProductMneCode;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.services.MESBasicProductImportService;
import com.supcon.orchid.MESBasic.entities.MESBasicProductDealInfo;
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
import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;
import com.supcon.orchid.MESBasic.entities.MESBasicProdLevel;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicProdSecUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
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
import com.supcon.orchid.MESBasic.daos.impl.MESBasicProductDaoImpl;
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
/* CUSTOM CODE START(serviceimpl,import,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
import java.math.BigDecimal;
import com.supcon.orchid.id.IdGenerator;
/* CUSTOM CODE END */

@Service("mESBasic_productService")
@Transactional
public class MESBasicProductServiceImpl  extends BaseServiceImpl<MESBasicProduct> implements MESBasicProductService, InitializingBean, DisposableBean {
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
	private MESBasicWareClassService wareClassService;
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
	private IBAPBaseService<MESBasicProduct> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private MESBasicProductImportService productImportService;
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + MESBasicProduct.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)"  + "and VALID = 1";
		Query query =  productDao.createQuery(hql);
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
			String hql = "select " + businessKeyName + ",id from " + MESBasicProduct.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = productDao.createQuery(hql);
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
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + MESBasicProduct.JPA_NAME + " where " + mainDisplayName + " in (:serial)";
		}else if(queryParam!=null && queryParam.equals("bk")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + MESBasicProduct.JPA_NAME + " where " + businessKeyName + " in (:serial)";
		}
		Query query =  productDao.createQuery(hql);
		query.setParameterList("serial", serial);
		List<Object[]> list = query.list();
		/*String sql = null;
		if(queryParam!=null && queryParam.equals("md")){
			sql = "select * from " + MESBasicProduct.TABLE_NAME + " where " + mainDisplayName + " = ?";
		}else if(queryParam!=null && queryParam.equals("bk")){
			sql = "select * from " + MESBasicProduct.TABLE_NAME + " where " + businessKeyName + " = ?";
		}
		List<MESBasicProduct> list = (List<MESBasicProduct>) productDao.createNativeQuery(sql,serial.get(0)).list();
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
	public MESBasicProduct getProduct(long id){
		return getProduct(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicProduct getProduct(long id, String viewCode){
		MESBasicProduct product = productDao.load(id);

		// 一对多情况处理
		if(product != null){
			this.setProductidProdAttrId(product, viewCode);
			this.setProductIDCompareID(product, viewCode);
			this.setProductSecUnit(product, viewCode);
			this.setProductBaseUnit(product, viewCode);
		}
		return product;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getProductAsJSON(long id, String include){
		MESBasicProduct product = productDao.load(id);
		// 一对多情况处理
			this.setProductidProdAttrId(product);
			this.setProductIDCompareID(product);
			this.setProductSecUnit(product);
			this.setProductBaseUnit(product);

		if(product == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(product, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.delete",operType="3")
	public void deleteProduct(MESBasicProduct product){
		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		beforeDeleteProduct(product);
		productDao.delete(product);
		afterDeleteProduct(product);
		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/del", product,MESBasicProductMneCode.class);
		List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
		List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdResetDailyList(prodResetDailyList);
		List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product));
		product.setProdSecUnitList(prodSecUnitList);
		List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdLevelList(prodLevelList);
		List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product));
		product.setCprodAttList(cprodAttList);
		params.add(product);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_product");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
		delIds = product.getProductidProdAttrIdmultiselectIDs();
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
				List<MESBasicCprodAtt> tmpList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product), Restrictions.in("prodAttrId.id", idList), Restrictions.eq("valid", true));
				for (MESBasicCprodAtt item : tmpList) {
					cprodAttDao.deletePhysical(item);
				}
			}
		}
		delIds = product.getProductIDCompareIDmultiselectIDs();
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
				List<MESBasicProdLevel> tmpList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product), Restrictions.in("compareID.id", idList), Restrictions.eq("valid", true));
				for (MESBasicProdLevel item : tmpList) {
					prodLevelDao.deletePhysical(item);
				}
			}
		}
		delIds = product.getProductSecUnitmultiselectIDs();
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
				List<MESBasicProdSecUnit> tmpList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product), Restrictions.in("secUnit.id", idList), Restrictions.eq("valid", true));
				for (MESBasicProdSecUnit item : tmpList) {
					prodSecUnitDao.deletePhysical(item);
				}
			}
		}
		delIds = product.getProductBaseUnitmultiselectIDs();
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
				List<MESBasicProdSecUnit> tmpList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product), Restrictions.in("baseUnit.id", idList), Restrictions.eq("valid", true));
				for (MESBasicProdSecUnit item : tmpList) {
					prodSecUnitDao.deletePhysical(item);
				}
			}
		}
			// TODO delete
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.delete",operType="3")
	public void deleteProduct(List<Long> productIds){
		deleteProduct(productIds, null);
	}

	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.delete",operType="3")
	public void deleteProduct(List<Long> productIds, String eventTopic) {
		List<MESBasicProduct> products = new ArrayList<MESBasicProduct>();
		for(Long productId : productIds){
			MESBasicProduct product = getProduct(productId);
			products.add(product);
			if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(AuditUtil.getColumnStringA() + (null == product.getProductName() ? "" : "," + product.getProductName().toString()));
				} else {
					AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(AuditUtil.getColumnStringB() + (null == product.getId() ? "" : "," + product.getId().toString()));
				} else {
					AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(AuditUtil.getColumnStringC() + (null == product.getId() ? "" : "," + product.getId().toString()));
				} else {
					AuditUtil.setColumnStringC(null == product.getId() ? "" : product.getId().toString());
				}
			}
		}
		
		for(MESBasicProduct product : products){
			beforeDeleteProduct(product);
		}
		
		
		/**
		 * 假删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(products != null && products.size() > 0 ){
			for(MESBasicProduct product : products){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				List<Object> currentState = new ArrayList<Object>();
				propertyNames.add("valid");
				currentState.add(false);
				previousState.add(true);
				dataAuditLogService.saveCustomerAudit(InternationalResource.get("foundation.common.delete"),product, product.getId(), currentState.toArray(), previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
			}
		}
		if(productIds != null && productIds.size() > 0) {
			String hql = "update " + MESBasicProduct.JPA_NAME + " set valid = false where id in(:ids)";
			Query query = productDao.createQuery(hql);
			query.setParameterList("ids", productIds);
			query.executeUpdate();
		}
		
		for(MESBasicProduct product : products){
			afterDeleteProduct(product);
		}
		
		if(eventTopic==null){
			for(MESBasicProduct productz : products){
				productz.setValid(false);
				List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
				List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", productz));
				productz.setProdResetDailyList(prodResetDailyList);
				List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", productz));
				productz.setProdSecUnitList(prodSecUnitList);
				List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", productz));
				productz.setProdLevelList(prodLevelList);
				List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", productz));
				productz.setCprodAttList(cprodAttList);
				params.add(productz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "MESBasic_1_product");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.delete",operType="3")
	public void deleteProduct(long productId, int productVersion){
		this.deleteProduct(productId, productVersion,null);
	}
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.delete",operType="3")
	public void deleteProduct(long productId, int productVersion,SignatureLog signatureLog){
		MESBasicProduct product = getProduct(productId);
		if(product != null && !product.isValid()){
			throw new BAPException(BAPException.Code.OBJECT_HAVE_BEAN_DELETED);
		}
		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		beforeDeleteProduct(product);
		productDao.delete(productId, productVersion);
		afterDeleteProduct(product);
		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/del", product,MESBasicProductMneCode.class);
		List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
		List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdResetDailyList(prodResetDailyList);
		List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product));
		product.setProdSecUnitList(prodSecUnitList);
		List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdLevelList(prodLevelList);
		List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product));
		product.setCprodAttList(cprodAttList);
		params.add(product);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_product");
		props.put("eventType", "delete");
		
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=product.getId();
			signatureLog.setTableId(product.getId());
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
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.delete",operType="3")
	public void deleteProduct(String productIds){
		this.deleteProduct(productIds,null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.delete",operType="3")
	public void deleteProduct(String productIds,SignatureLog signatureLog){
		deleteCollection(productIds,signatureLog);
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
				deleteProduct(Long.valueOf(id), Integer.valueOf(version),signatureLog);
			}
		}
		if(null != signatureLog){
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:MESBasic_1#entityCode:MESBasic_1_product#modelCode:MESBasic_1_product_Product#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="ec.engine.restore",operType="10")
	public void restoreProduct(String productIds){
		restoreCollection(productIds);
	}
	
	public void restoreCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			if (id != null && id.trim().length() > 0) {
				restoreProduct(Long.valueOf(id));
			}
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="ec.engine.restore",operType="10")
	public void restoreProduct(long productId){
		
		findBusinessKeyUsed(productId);	//判断业务主键是否重复
		
		MESBasicProduct product = getProduct(productId);
		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		beforeRestoreProduct(product);
		product.setValid(true);
		productDao.update(product);
		afterRestoreProduct(product);
		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/add", product,MESBasicProductMneCode.class);
		List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
		List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdResetDailyList(prodResetDailyList);
		List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product));
		product.setProdSecUnitList(prodSecUnitList);
		List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdLevelList(prodLevelList);
		List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product));
		product.setCprodAttList(cprodAttList);
		params.add(product);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_product");
		props.put("eventType", "restore");
	}
	
	public void findBusinessKeyUsed(long productId){
		Property property = modelServiceFoundation.getBussinessProperty("MESBasic_1_product_Product");
		if(property != null){
			String propertyName = property.getColumnName();
			String sql  = "select * from " + MESBasicProduct.TABLE_NAME + " where valid = 1 and " + 
					propertyName + " =  (select "+ propertyName +" from "+ MESBasicProduct.TABLE_NAME +" where id = ? )";
			List<Object> list =  productDao.createNativeQuery(sql,productId).list();
			if(list.size() > 0){
				throw new BAPException("foundation.bussinessKey.repeat");
			}
			
		}
	}
	
	public List<String> checkParentIsSelf(MESBasicProduct product) {
		List<String> assSelfPropertyList = new ArrayList<String>();
		if(null != product.getId()) {
			if(null != product.getReplaceItem() && null != product.getReplaceItem().getId()) {
				if(product.getReplaceItem().getId().equals(product.getId())) {
					assSelfPropertyList.add("MESBasic.propertydisplayName.randon1470291334134");
				}
			}
		}
		return assSelfPropertyList;
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.batch.import",operType="4")
	public  void batchImportBaseProduct(List<MESBasicProduct>  products){
		for(MESBasicProduct product:products)  {
			saveProduct(product, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBaseProduct(List<MESBasicProduct>  products){
		for(MESBasicProduct product:products)  {
			saveProduct(product, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="ec.flow.save")
	public void saveProduct(MESBasicProduct product, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		saveProduct(product, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="ec.flow.save")
	public void saveProduct(MESBasicProduct product, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		saveProduct(product, dgLists,dgDeleteIDs,assFileUploads, viewCode, null,null);
	}


	public void generateProductCodes(MESBasicProduct product) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateProductCodes(product, false);
	}
	
	public void generateProductCodes(MESBasicProduct product, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	public void generateProductSummarys(MESBasicProduct product) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateProductSummarys(product, false);
	}

	public void generateProductSummarys(MESBasicProduct product, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product")
	public void saveProduct(MESBasicProduct product,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic,boolean... isImport){
		this.saveProduct(product, dgLists,dgDeleteIDs,assFileUploads, viewCode, eventTopic,null,isImport);
	}

	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product")
	public void saveProduct(MESBasicProduct product,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport){
		List<String> assSelfPropertyList = checkParentIsSelf(product);
		if(null != assSelfPropertyList && !assSelfPropertyList.isEmpty()) {
			throw new BAPException(BAPException.Code.SELECT_NOT_SELF, assSelfPropertyList.get(0));
		}
		boolean isNew = false;
		String entityCode = "MESBasic_1_product";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_product");
		String url = null;
		if(product.getId() != null && product.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/add";
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
				executeGScript(entityCode, "beforeSave", events, product);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(product);
		beforeSaveProduct(product, viewIsView);

		if (viewIsView) {
			productDao.saveWithRevertVersion(product);
		} else {
			if(isNew)
				productDao.save(product);
			else
				productDao.merge(product);
		}
		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		dealDatagridsSave(product,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
			this.dealProductidProdAttrId(product);
			this.dealProductIDCompareID(product);
			this.dealProductSecUnit(product);
			this.dealProductBaseUnit(product);
		
		// 根据配置规则生成编码
		try {
			generateProductCodes(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProductSummarys(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduct(product, viewIsView);


		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/add", product,MESBasicProductMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, product);
			}
		}
		List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
		productDao.flush();
		productDao.clear();
		product = productDao.load(product.getId());
		
		List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdResetDailyList(prodResetDailyList);
		List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product));
		product.setProdSecUnitList(prodSecUnitList);
		List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdLevelList(prodLevelList);
		List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product));
		product.setCprodAttList(cprodAttList);
		
		params.add(product);
		
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=product.getId();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(product.getId());
			String msgId="moduleCode:MESBasic_1#entityCode:MESBasic_1_product#modelCode:MESBasic_1_product_Product#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, MESBasicProduct product){
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
						variables.put("product", product);
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
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product")
	public void mergeProduct(MESBasicProduct product, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(product);
		beforeSaveProduct(product);
		productDao.merge(product);
		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		dealDatagridsSave(product,null,dgLists,dgDeleteIDs,assFileUploads);

			// 一对多情况处理
			this.dealProductidProdAttrId(product);
			this.dealProductIDCompareID(product);
			this.dealProductSecUnit(product);
			this.dealProductBaseUnit(product);
		afterSaveProduct(product);
		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/add", product,MESBasicProductMneCode.class);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<MESBasicProduct> findProducts(Page<MESBasicProduct> page, Criterion... criterions) {
		return productDao.findByPage(page, criterions);
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
	private MESBasicProductDealInfo getDealInfoEntity(Long tableInfoId) {
		
		List<MESBasicProductDealInfo> list=productDao.createQuery("from " + MESBasicProductDealInfo.JPA_NAME + " where tableInfoId=?", tableInfoId).setMaxResults(1).list();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public void saveDealInfo(MESBasicProductDealInfo dealInfo) {
		productDao.saveDealInfo(dealInfo);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public int getDealInfoCount(Long tableInfoId) {
		String sql = "SELECT count(1) totalCount " + "FROM "+MESBasicProductDealInfo.TABLE_NAME+" DI " + "LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME
				+ " S ON S.ID=U.STAFF_ID " + "WHERE DI.TABLE_INFO_ID = ?";
		Number list = (Number) productDao.createNativeQuery(sql, tableInfoId).uniqueResult();
		return list.intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> findDealInfos(Long tableInfoId, boolean expandFlag) {
		String sql = "SELECT DI.TASK_DESCRIPTION ACTIVITYNAME,DI.CREATE_TIME CREATETIME ,DI.COMMENTS COMMENTS,DI.OUTCOME OUTCOME,S.NAME STAFFNAME,DI.OUTCOME_DES OUTCOME_DES,DI.ASSIGN_STAFF ASSIGNSTAFF ,DEALINFO_TYPE DEALINFOTYPE, DI.PROXY_STAFF PROXYSTAFF, DI.PENDING_CREATE_TIME PCREATETIME,  DI.SIGNATURE SIGNATURE, WT.TYPE,WTR.TYPE TRANSITIONTYPE "
				+ " FROM "+MESBasicProductDealInfo.TABLE_NAME + " DI " 
				+ " LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION "
				+ " LEFT JOIN WF_TRANSITION WTR ON WTR.CODE = DI.OUTCOME AND WTR.DEPLOYMENT_ID = WT.DEPLOYMENT_ID "
				+ " LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID " + "LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID "
				+ " WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION is not null ";
		if (expandFlag) {
			sql += " AND DI.COMMENTS IS NOT NULL";
			DBTYPE dbtype = productDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				sql += " AND DI.COMMENTS != ''";
			}
		}
		sql += " ORDER BY DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC";
		List<Object[]> list = productDao.createNativeQuery(sql, tableInfoId).list();
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
				+ MESBasicProductDealInfo.TABLE_NAME
				+ " DI LEFT JOIN WF_TASK WT ON WT.CODE = DI.ACTIVITY_NAME AND WT.PROCESS_KEY = DI.PROCESS_KEY AND WT.PROCESS_VERSION = DI.PROCESS_VERSION ");
		groupSql.append(" LEFT JOIN " + User.TABLE_NAME + " U ON DI.USER_ID=U.ID LEFT JOIN " + Staff.TABLE_NAME + " S ON S.ID=U.STAFF_ID ");
		groupSql.append(" WHERE DI.TABLE_INFO_ID = ? AND DI.TASK_DESCRIPTION IS NOT NULL ");
		if (expandFlag) {
			groupSql.append(" AND DI.COMMENTS IS NOT NULL");
			DBTYPE dbtype = productDao.getDBType();
			if (DBTYPE.MSSQL == dbtype) {
				groupSql.append(" AND DI.COMMENTS != ''");
			}
		}
		groupSql.append(" ORDER BY WT.ROUTE_SEQUENCE ASC, DI.SORT ASC, DI.CREATE_TIME ASC, DI.ID ASC");

		List<Object[]> groupList = productDao.createNativeQuery(groupSql.toString(), tableInfoId).list();
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
	public void findProducts(Page<MESBasicProduct> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, Map exportMap, List<Param> params) {
		findProducts(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findProducts(Page<MESBasicProduct> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findProducts(Page<MESBasicProduct> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
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
	public void commonQuery(Page<MESBasicProduct> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
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
						String tableAlias = lastDotPos < 0 ? "\"product\"" : "\"" + key.substring(0, lastDotPos) + "\"";
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
							s.append(" AND \"product\".CID in (1,").append(getCurrentCompanyId()+")");
						}
					}
					
	//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
	//					if(type == Sql.TYPE_LIST_PENDING) {
	//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_QUERY){
	//						s.append(" AND \"product\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_REFERENCE){
	//						if(null != crossCompanyFlag && !crossCompanyFlag){
	//							s.append(" AND \"product\".CID = ").append(getCurrentCompanyId());
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
							powerCode = "MESBasic_1_product_Product" + "_" + layoutView.getPermissionCode();
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "MESBasic_1_product_Product" + "_" + layoutView.getPermissionCode();
							}
						}
					}else  {
						if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
							powerCode = "MESBasic_1_product_Product" + "_" + view.getPermissionCode();
						}
					}
				}else if(null != dgCode && !"".equals(dgCode)){
					DataGrid dataGrid = viewServiceFoundation.getDataGrid(dgCode);
					if(null != dataGrid.getDataGridType() && dataGrid.getDataGridType() == 1 && null != dataGrid.getIsPermission() && dataGrid.getIsPermission()){
						powerCode = dataGrid.getTargetModel().getCode() + "_" + dataGrid.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  productDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  productDao.createNativeQuery(powerOperateSql, "MESBasic_1_product").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}	
					String	pc = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"product\"","MESBasic_1_product",customCondition,"S2BASE_PRODUCT",false);
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
						s.append(" \"product\".TABLE_INFO_ID IN (  SELECT   D.TABLE_INFO_ID "+
	                      "   FROM   "+MESBasicProductDealInfo.TABLE_NAME+" d "+
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
				s.append(" AND \"product\".STATUS = 99 ");
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
					orderPart.append(" \"product\".LAY_REC ASC, \"product\".SORT ASC");
				} else {
					orderPart.append(" \"product\".PRODUCT_ID DESC");
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
				//Long count = ((Number) productDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    SQLQuery query=productDao.createNativeQuery(countSql, arr);
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
				SQLQuery query = productDao.createNativeQuery(realSql, arr);
				if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
				List<MESBasicProduct> result = new ArrayList<MESBasicProduct>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(MESBasicProduct.class,productDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(MESBasicProduct.class,productDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (MESBasicProduct product : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(product.getId(), "MESBasic_product_product");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(product.getId(), "MESBasic_product_product");
							if(null != documents && !documents.isEmpty()) {
								product.setDocument(documents.get(0));
								product.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				
				for (MESBasicProduct product : result) {
				}	
				if(exportSql.trim().isEmpty()){
					getConfigAssoPropsResult(viewCode, dgCode, result); // 获取配置的关联模型字段的结果集
				}
			}
		}
	}
	
	
	private View getLayoutView(String permissionCode) {
		if(null!=permissionCode&&permissionCode.indexOf("MESBasic_1_product")!=-1) {
				String personalCode=permissionCode.substring(permissionCode.indexOf("MESBasic_1_product")+"MESBasic_1_product".length()+1);
				if(null!=personalCode&&personalCode.trim().length()>0)  {
						return viewServiceFoundation.getViewWithPermissionCode("MESBasic_1_product",personalCode);
				}
		}
		return null;
	}
	
	private void getConfigAssoPropsResult(String viewCode, List<MESBasicProduct> result) {
		getConfigAssoPropsResult(viewCode, null, result);
	}
	
	private void getConfigAssoPropsResult(String viewCode,String dataGridCode, List<MESBasicProduct> result) {
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
		Map<Long, MESBasicProduct> rsMap = new HashMap<Long, MESBasicProduct>();
		for (MESBasicProduct product : result) {
			ids.add(product.getId());
			rsMap.put(product.getId(), product);
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
								rs.addAll(productDao.createNativeQuery(sql)
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
		List<Property> list = productDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
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
	
	protected EntityTableInfo getTableInfo(MESBasicProduct product,boolean... isImport) {
		EntityTableInfo ti = new EntityTableInfo();


		ti.setOwnerStaffId(product.getOwnerStaffId());
		ti.setOwnerPositionId(product.getOwnerPositionId());
		ti.setOwnerDepartmentId(product.getOwnerDepartmentId());
		
		ti.setCreateStaff(product.getCreateStaff());
		ti.setCreateStaffId(product.getCreateStaffId());
		ti.setCreateTime(product.getCreateTime());
		ti.setDeleteStaff(product.getDeleteStaff());
		ti.setDeleteStaffId(product.getDeleteStaffId());
		ti.setDeleteTime(product.getDeleteTime());
		ti.setCreateDepartmentId(product.getCreateDepartmentId());
		ti.setModifyStaff(product.getModifyStaff());
		ti.setModifyStaffId(product.getModifyStaffId());
		ti.setCreatePositionId(product.getCreatePositionId());
		ti.setPositionLayRec(product.getPositionLayRec());
		ti.setTableNo(product.getTableNo());
		ti.setValid(true);
		ti.setTargetEntityCode("MESBasic_1_product");
		ti.setTargetTableName("S2BASE_PRODUCT");
		
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
							powerCode = "MESBasic_1_product_Product" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "MESBasic_1_product_Product" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="MESBasic_1_product_Product" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  productDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  productDao.createNativeQuery(powerOperateSql, "MESBasic_1_product").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"product\"","MESBasic_1_product","","S2BASE_PRODUCT",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"product\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"product\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"product\"","MESBasic_1_product","","S2BASE_PRODUCT",false);
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
								powerCode = "MESBasic_1_product_Product" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "MESBasic_1_product_Product" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "MESBasic_1_product_Product" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  productDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  productDao.createNativeQuery(powerOperateSql, "MESBasic_1_product").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"product\"","MESBasic_1_product","","S2BASE_PRODUCT",false);
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
			
			mnecodeSql.append("  (\"").append("product.mc\"").append(".MNE_CODE) like (?) escape '&' AND \"product\".VALID = 1");
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
					mnecodeSql.append(" AND \"product\".CID = ?");
					totalValues.add(getCurrentCompanyId());
				}else{
					//当前公司不是集团情况下查询集团和本公司数据
					if(!getCurrentCompanyId().equals(1L)){
						mnecodeSql.append(" AND (\"product\".CID = 1 OR \"product\".CID = ?)");
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
				mnecodeSql.append(" and (\"").append("product.mc\"").append(".PRODUCT) not in ("+notinValue+")");
			}
			
			SQLQuery query = productDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
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
		wareClassService = null;
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
		this.counter = this.counterManager.addCounter("product", "MESBasic_1_product", "product_{1,date,yyyyMMdd}_{0,number,000}", CounterType.Daily);
		String formatStr = "";
		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=productDao.createNativeQuery(sql, menuCode);
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
	private void dealProductidProdAttrId(MESBasicProduct product) {
		String addIds = product.getProductidProdAttrIdAddIds();
		String delIds = product.getProductidProdAttrIdDeleteIds();
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
				List<MESBasicCprodAtt> tmpList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product), Restrictions.in("prodAttrId.id", idList), Restrictions.eq("valid", true));
				for (MESBasicCprodAtt item : tmpList) {
					cprodAttDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					MESBasicCprodAtt tmp = new MESBasicCprodAtt();
					tmp.setProductid(product);
					MESBasicProdAttribute indirectObj = new MESBasicProdAttribute();
					indirectObj.setId(Long.valueOf(item));
					tmp.setProdAttrId(indirectObj);
					tmp.setCid(product.getCid());
					cprodAttDao.save(tmp);
				}
			}
		}
	}

	private void setProductidProdAttrId(MESBasicProduct product) {
		setProductidProdAttrId(product, null);
	}

	private void setProductidProdAttrId(MESBasicProduct product, String viewCode) {
		List<MESBasicCprodAtt> tmpList = cprodAttDao.findByCriteria(Order.asc("id"), Restrictions.eq("productid", product), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (MESBasicCprodAtt item : tmpList) {
			if(item.getProdAttrId() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getProdAttrId().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					case "MESBasic_1_product_productViewnew":
						displayField = "name";
						break;
					case "MESBasic_1_product_productEditnew__mobile__":
						displayField = "name";
						break;
					case "MESBasic_1_product_productEditnew":
						displayField = "name";
						break;
					case "MESBasic_1_product_productViewnew__mobile__":
						displayField = "name";
						break;
					}
				}
				names += ReflectUtils.getPropertyValue(item.getProdAttrId(), displayField);
			}
		}
		product.setCprodAttList(tmpList);
		product.setProductidProdAttrIdmultiselectIDs(ids);
		product.setProductidProdAttrIdmultiselectNames(names);
	}
	private void dealProductIDCompareID(MESBasicProduct product) {
		String addIds = product.getProductIDCompareIDAddIds();
		String delIds = product.getProductIDCompareIDDeleteIds();
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
				List<MESBasicProdLevel> tmpList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product), Restrictions.in("compareID.id", idList), Restrictions.eq("valid", true));
				for (MESBasicProdLevel item : tmpList) {
					prodLevelDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					MESBasicProdLevel tmp = new MESBasicProdLevel();
					tmp.setProductID(product);
					MESBasicProduct indirectObj = new MESBasicProduct();
					indirectObj.setId(Long.valueOf(item));
					tmp.setCompareID(indirectObj);
					tmp.setCid(product.getCid());
					prodLevelDao.save(tmp);
				}
			}
		}
	}

	private void setProductIDCompareID(MESBasicProduct product) {
		setProductIDCompareID(product, null);
	}

	private void setProductIDCompareID(MESBasicProduct product, String viewCode) {
		List<MESBasicProdLevel> tmpList = prodLevelDao.findByCriteria(Order.asc("id"), Restrictions.eq("productID", product), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (MESBasicProdLevel item : tmpList) {
			if(item.getCompareID() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getCompareID().getId();
				String displayField = "productName";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getCompareID(), displayField);
			}
		}
		product.setProdLevelList(tmpList);
		product.setProductIDCompareIDmultiselectIDs(ids);
		product.setProductIDCompareIDmultiselectNames(names);
	}
	private void dealProductSecUnit(MESBasicProduct product) {
		String addIds = product.getProductSecUnitAddIds();
		String delIds = product.getProductSecUnitDeleteIds();
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
				List<MESBasicProdSecUnit> tmpList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product), Restrictions.in("secUnit.id", idList), Restrictions.eq("valid", true));
				for (MESBasicProdSecUnit item : tmpList) {
					prodSecUnitDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					MESBasicProdSecUnit tmp = new MESBasicProdSecUnit();
					tmp.setProduct(product);
					X6BasicBaseUnit indirectObj = new X6BasicBaseUnit();
					indirectObj.setId(Long.valueOf(item));
					tmp.setSecUnit(indirectObj);
					tmp.setCid(product.getCid());
					prodSecUnitDao.save(tmp);
				}
			}
		}
	}

	private void setProductSecUnit(MESBasicProduct product) {
		setProductSecUnit(product, null);
	}

	private void setProductSecUnit(MESBasicProduct product, String viewCode) {
		List<MESBasicProdSecUnit> tmpList = prodSecUnitDao.findByCriteria(Order.asc("id"), Restrictions.eq("product", product), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (MESBasicProdSecUnit item : tmpList) {
			if(item.getSecUnit() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getSecUnit().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getSecUnit(), displayField);
			}
		}
		product.setProdSecUnitList(tmpList);
		product.setProductSecUnitmultiselectIDs(ids);
		product.setProductSecUnitmultiselectNames(names);
	}
	private void dealProductBaseUnit(MESBasicProduct product) {
		String addIds = product.getProductBaseUnitAddIds();
		String delIds = product.getProductBaseUnitDeleteIds();
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
				List<MESBasicProdSecUnit> tmpList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product), Restrictions.in("baseUnit.id", idList), Restrictions.eq("valid", true));
				for (MESBasicProdSecUnit item : tmpList) {
					prodSecUnitDao.deletePhysical(item);
				}
			}
		}
		if (addIds != null && addIds.length() > 0) {
			String[] ids = addIds.split(",");
			for (String item : ids) {
				if (item != null && item.length() > 0) {
					MESBasicProdSecUnit tmp = new MESBasicProdSecUnit();
					tmp.setProduct(product);
					X6BasicBaseUnit indirectObj = new X6BasicBaseUnit();
					indirectObj.setId(Long.valueOf(item));
					tmp.setBaseUnit(indirectObj);
					tmp.setCid(product.getCid());
					prodSecUnitDao.save(tmp);
				}
			}
		}
	}

	private void setProductBaseUnit(MESBasicProduct product) {
		setProductBaseUnit(product, null);
	}

	private void setProductBaseUnit(MESBasicProduct product, String viewCode) {
		List<MESBasicProdSecUnit> tmpList = prodSecUnitDao.findByCriteria(Order.asc("id"), Restrictions.eq("product", product), Restrictions.eq("valid", true));
		String ids = "";
		String names = "";
		for (MESBasicProdSecUnit item : tmpList) {
			if(item.getBaseUnit() != null) {
				if(ids.length() > 0) {
					ids += ",";
					names += ",";
				}
				ids += item.getBaseUnit().getId();
				String displayField = "name";
				if(viewCode != null) {
					switch (viewCode) {
					}
				}
				names += ReflectUtils.getPropertyValue(item.getBaseUnit(), displayField);
			}
		}
		product.setProdSecUnitList(tmpList);
		product.setProductBaseUnitmultiselectIDs(ids);
		product.setProductBaseUnitmultiselectNames(names);
	}
	// ================ 生成多选控件数据保存方法 end ====================

	protected String getEntityCode(){return MESBasicProduct.ENTITY_CODE;}
	protected String getModuleCode(){return MESBasicProduct.MODULE_CODE;}
	protected String getModelCode(){return MESBasicProduct.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param product 模型实例
	 */
	public void checkUniqueConstraint(MESBasicProduct product){
	}
	
	
	@Override
	public List<MESBasicProduct> getProducts(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicProduct.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return productDao.findByHql("from " + MESBasicProduct.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return productDao.findByCriteria(detachedCriteria);
	}
	
	
	
	@Override
	public List<MESBasicProduct> findProductsBySql(String sql, List<Object> params){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicProduct.class);
		if(params!=null && params.size()>0){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
			
		}else{
			detachedCriteria.add(Restrictions.sqlRestriction(sql));
		}
		
		return productDao.findByCriteria(detachedCriteria);
	}
	@Override
	public List<MESBasicProduct> findProductsByHql(String hql, Object... objects){
		
		return   productDao.findByHql(hql, objects);
	}
	
	@Override
	public MESBasicProduct loadProductByBussinessKey(MESBasicProduct product){
		return loadProductByBussinessKey(product.getId());
	}
	
	@Override
	public Page<MESBasicProduct> getProducts(Page<MESBasicProduct> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicProduct.class);
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
				page = productDao.findByPage(page, sql);
			}else{
				page = productDao.findAllByPage(page);
			}
			return page;
		}
		page = productDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicProduct loadProductByBussinessKey(Serializable bussinessKey){
		return productDao.findEntityByCriteria(Restrictions.eq("id", Long.valueOf(bussinessKey.toString())),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<MESBasicProduct> findByProperty(String propertyName, Object object){
		return productDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public MESBasicProduct findEntityByProperty(String propertyName, Object object){
		return productDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<Long> bussinessKeyList = new ArrayList<Long>();
			for(String key : bussinessKeys.split(",")){
				bussinessKeyList.add(Long.valueOf(key));
			}
			String sql = "update " + MESBasicProduct.JPA_NAME + " set valid=0 where id in (:businessKeys)";
			Query query = productDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("MESBasic_1_product_Product","runtime");
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
		List<View> views = viewServiceFoundation.findViewsByEntityCode("MESBasic_1_product", ViewType.VIEW);
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
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("MESBasic_1_product_Product","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	public void dealDatagridsSave(MESBasicProduct product,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=viewServiceFoundation.getDataGrids(viewCode, "runtime");
		if(dgs!=null&&dgs.size()>0){
			productDao.flush();
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
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()).replaceAll("\r\n", "\\\\r\\\\n"), _reflect_dgclass,productDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), MESBasicProduct.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, product);
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
								paramMap.put("mainModelId",product.getId());	
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
			String sql = "select " + businessKeyName +" from "+ MESBasicProduct.TABLE_NAME +" where valid = 1";
			list = productDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ MESBasicProduct.TABLE_NAME;
			list = productDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey){
		List<Object[]> list = new ArrayList<Object[]>();
		Map<Object, Object> m = new HashMap<Object, Object>();
		if(null != propertyName && null != businessKey){
			String sql = "select " + businessKey + "," + propertyName +" from "+ MESBasicProduct.TABLE_NAME +" group by " + propertyName + "," + businessKey;
			list = productDao.createNativeQuery(sql).list();
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
	private MESBasicProductDaoImpl productDaoImpl;
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchProduct(final List<MESBasicProduct> insertObjs, final List<MESBasicProduct> updateObjs, 
				List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){
		return this.importBatchProduct(insertObjs, updateObjs, columnInfo, importNodeInfo, importPropInfo,null);		
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchProduct(final List<MESBasicProduct> insertObjs, final List<MESBasicProduct> updateObjs, 
				List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog){
				
		int importCount = 0;
		if (null != insertObjs) {
			importCount += insertObjs.size();
		}
		if (null != updateObjs) {
			importCount += updateObjs.size();
		}
		AuditUtil.setAuditDes(InternationalResource.get("foundation.import.bussiness.info.args",null,InternationalResource.get("MESBasic.modelname.radion1415772316600"),importCount));
		if(null != signatureLog && null == signatureLog.getOperateLogUuid()){
			if (null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()) {
				signatureLog.setOperateLogUuid((null == AuditUtil.getCurrentAudit().getOperationAudit().get_parentCode() || "-1".equals( AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode())) ? AuditUtil.getCurrentAudit().getOperationAudit().getUuid() : AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode());
			}
		}
		Map<Long, MESBasicProduct> oldUpdateObjsMap = new HashMap<Long, MESBasicProduct>(); 
		List<Long> updateObjIdsList = new ArrayList<Long>();
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {
			MESBasicProduct bizObj = updateObjs.get(updateIndex);
			updateObjIdsList.add(bizObj.getId());
		}
		if (updateObjIdsList.size() > 0) {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(MESBasicProduct.class);
			if(updateObjIdsList.size()>1000){
				List<Long> updateObjIdsListBefore = updateObjIdsList.subList(0, 999);
				List<Long> updateObjIdsListAfter = updateObjIdsList.subList(999, updateObjIdsList.size());		
				detachedCriteria.add(Restrictions.or(Restrictions.in("id", updateObjIdsListBefore),Restrictions.in("id", updateObjIdsListAfter)));
			}else{
				detachedCriteria.add(Restrictions.in("id", updateObjIdsList));
			}
			List<MESBasicProduct> bizObjList = productDao.findByCriteria(detachedCriteria);
			if (null != bizObjList) {
				for (int mIndex = 0; mIndex < bizObjList.size(); mIndex++) {
					MESBasicProduct bizObj = bizObjList.get(mIndex);
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
		
		final List<MESBasicProduct> nmeObjs = new ArrayList<MESBasicProduct>();
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(MESBasicProduct.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(MESBasicProduct product:insertObjs)  {
			//id = autoGeneratorID.getNextId(MESBasicProduct.TABLE_NAME,1,dbId);
			if(product.getId() != null ){
				m.put(product.getId(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			product.setId(id);
			id++;
		}
		
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) productDao.createNativeQuery(sql, "MESBasic_1_product_Product"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		
		productDaoImpl.getSession().doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				PreparedStatement updateps = null;
				PreparedStatement insertps = null;
				User currentUser=(User)getCurrentUser();
				Staff currentStaff=currentUser.getStaff();
				
				if(updateObjs != null && updateObjs.size()>0){
					List<String> updateMethods = new ArrayList<String>();
					String updateSql = "UPDATE " + MESBasicProduct.TABLE_NAME + " SET ";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						updateMethods.add(methodName);
						updateSql += columnMaps.get(i).get("dbname")+"=?,";
					}
					updateSql = updateSql.substring(0,updateSql.length()-1);
					updateSql += " where " + dbId + " =?";
					
					updateps = conn.prepareStatement(updateSql);
					for(int updateIndex =0;updateIndex<updateObjs.size();updateIndex++){
						MESBasicProduct product = updateObjs.get(updateIndex);
						Long id = product.getId();
						if(null != id){
							updateps.setLong(columnMaps.size()+1,id);
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = product.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(product);
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
							nmeObjs.add(product);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + MESBasicProduct.TABLE_NAME + " (";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						insertMethods.add(methodName);
						insertSql += columnMaps.get(i).get("dbname")+",";
					}
					insertSql += dbId + ",CID,CREATE_STAFF_ID,PRODUCT_CREATETIME,EFFECTIVE_STATE) VALUES (";
					for(int i = 0;i<columnMaps.size();i++){
						insertSql += "?,";
					}
					insertSql += "?,?,?,?,?)";
					
//					String idSql = "select id from " + MESBasicProduct.TABLE_NAME + " order by id desc";
//					Query query = productDao.createNativeQuery(idSql).setMaxResults(1);
//					Long id = new Long(1000);
//					if(null != query.uniqueResult()){
//						id = Long.valueOf(query.uniqueResult().toString());
//					}
					insertps = conn.prepareStatement(insertSql);
					for(int insertIndex = 0; insertIndex<insertObjs.size(); insertIndex++)  {
						MESBasicProduct product = insertObjs.get(insertIndex);
						insertps.setLong(columnMaps.size() + 1, insertIds.get(insertIndex));
						insertps.setLong(columnMaps.size() + 2,getCurrentCompanyId());
						insertps.setLong(columnMaps.size() + 3,currentStaff.getId());
						java.util.Date date=new java.util.Date();
						insertps.setTimestamp(columnMaps.size() + 4,new java.sql.Timestamp(date.getTime()));
						insertps.setInt(columnMaps.size() + 5,0);
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = product.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(product);
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
						//product.setId(id);
						nmeObjs.add(product);
						insertps.addBatch();
					}		
				}
				
				PreparedStatement deletemneps = null;
				PreparedStatement savemneps = null;
				
				if(nmeObjs != null && nmeObjs.size()>0){//助记码操作
					Object mainEntity = nmeObjs.get(0);			
					Class<?> mainClazz = mainEntity.getClass();
					Class<?> mneCodeEntity = MESBasicProductMneCode.class;

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
					for(MESBasicProduct product:updateObjs)  {
						Long id = product.getId();
						deletemneps.setLong(1, id);
						deletemneps.addBatch();
					}	
					
					//生成并新增助记码
					String idSql = "select id from " + mneCodeTable.name() + " order by id desc";
					Query query = productDao.createNativeQuery(idSql).setMaxResults(1);
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
								for(MESBasicProduct product:nmeObjs)  {
									String value = null;
									try {
										value = (String) getMethod.invoke(product);
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
											savemneps.setLong(3, product.getId());
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
		
		productDaoImpl.getSession().flush();
		productDaoImpl.getSession().clear();
		
		
		//记录导入数据日志（区分新增和修改）
		
		for(int insertIndex = 0; insertIndex < insertObjs.size(); insertIndex++)  {//新增
			MESBasicProduct bizObj = insertObjs.get(insertIndex);
			productImportService.saveImportDataLog(bizObj, null, "id", "productName");
		}
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {//修改
			MESBasicProduct bizObj = updateObjs.get(updateIndex);
			MESBasicProduct oldBizObj = oldUpdateObjsMap.get(bizObj.getId());
			productImportService.saveImportDataLog(bizObj, oldBizObj, "id", "productName");
		}
		
		return m;
	}
	
	
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getViewName(String modelCode){
		String sql = "select NAME from runtime_view where type='LIST' and ass_model_code = ?";
		String viewName = productDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult()!=null?
				productDao.createNativeQuery(sql, modelCode).setMaxResults(1).uniqueResult().toString():"";
		return viewName;
	}
	
	
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = productDao.createNativeQuery(sql, "MESBasic_1_product_Product").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = productDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = productDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = productDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?productDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  productDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,productDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1572259458131Page(Page<MESBasicProdLevel> dg1572259458131Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodLevel\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodLevelDao.findByPage(dg1572259458131Page, criteria);
		prodLevelService.findByNormalDataGridProduct(dg1572259458131Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1572259458193Page(Page<MESBasicProdResetDaily> dg1572259458193Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodResetDaily\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodResetDailyDao.findByPage(dg1572259458193Page, criteria);
		prodResetDailyService.findByNormalDataGridProduct(dg1572259458193Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1572259458240Page(Page<MESBasicProdSecUnit> dg1572259458240Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdSecUnit.class);
		criteria.add(Restrictions.eq("product", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodSecUnit\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodSecUnitDao.findByPage(dg1572259458240Page, criteria);
		prodSecUnitService.findByNormalDataGridProduct(dg1572259458240Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1524759114829Page(Page<MESBasicProdLevel> dg1524759114829Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodLevel\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodLevelDao.findByPage(dg1524759114829Page, criteria);
		prodLevelService.findByNormalDataGridProduct(dg1524759114829Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1524762478590Page(Page<MESBasicProdResetDaily> dg1524762478590Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodResetDaily\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodResetDailyDao.findByPage(dg1524762478590Page, criteria);
		prodResetDailyService.findByNormalDataGridProduct(dg1524762478590Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1530515613350Page(Page<MESBasicProdSecUnit> dg1530515613350Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdSecUnit.class);
		criteria.add(Restrictions.eq("product", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodSecUnit\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodSecUnitDao.findByPage(dg1530515613350Page, criteria);
		prodSecUnitService.findByNormalDataGridProduct(dg1530515613350Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1471522536506Page(Page<MESBasicProdLevel> dg1471522536506Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodLevel\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodLevelDao.findByPage(dg1471522536506Page, criteria);
		prodLevelService.findByNormalDataGridProduct(dg1471522536506Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1476754911770Page(Page<MESBasicProdLevel> dg1476754911770Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodLevel\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodLevelDao.findByPage(dg1476754911770Page, criteria);
		prodLevelService.findByNormalDataGridProduct(dg1476754911770Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1476012237332Page(Page<MESBasicProdLevel> dg1476012237332Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodLevel\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodLevelDao.findByPage(dg1476012237332Page, criteria);
		prodLevelService.findByNormalDataGridProduct(dg1476012237332Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1476754989271Page(Page<MESBasicProdLevel> dg1476754989271Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodLevel\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodLevelDao.findByPage(dg1476754989271Page, criteria);
		prodLevelService.findByNormalDataGridProduct(dg1476754989271Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1473819996855Page(Page<MESBasicProdResetDaily> dg1473819996855Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodResetDaily\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodResetDailyDao.findByPage(dg1473819996855Page, criteria);
		prodResetDailyService.findByNormalDataGridProduct(dg1473819996855Page);
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDg1476060528897Page(Page<MESBasicProdResetDaily> dg1476060528897Page,MESBasicProduct product, String condition, List<Object> params){
		DetachedCriteria criteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
		criteria.add(Restrictions.eq("productID", product));
		criteria.add(Restrictions.eq("valid", true));
		if(!"".equals(condition) && condition.trim().length() > 0) {
			criteria.add(Restrictions.sqlRestriction(condition.replace("\"prodResetDaily\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
		}
		prodResetDailyDao.findByPage(dg1476060528897Page, criteria);
		prodResetDailyService.findByNormalDataGridProduct(dg1476060528897Page);
	}
	
	 
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="ec.flow.save")
	public void saveProduct(MESBasicProduct product, DataGridService dataGridService){
		saveProduct(product, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="ec.flow.save")
	public void saveProduct(MESBasicProduct product, DataGridService dataGridService, String viewCode){
		saveProduct(product, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product")
	public void saveProduct(MESBasicProduct product, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		this.saveProduct(product, dataGridService, viewCode, eventTopic,null,isImport);
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product")
	public void saveProduct(MESBasicProduct product, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog, boolean... isImport){
		List<String> assSelfPropertyList = checkParentIsSelf(product);
		if(null != assSelfPropertyList && !assSelfPropertyList.isEmpty()) {
			throw new BAPException(BAPException.Code.SELECT_NOT_SELF, assSelfPropertyList.get(0));
		}
		boolean isNew = false;
		String entityCode = "MESBasic_1_product";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_product");
		String url = null;
		if(null != product.getId() && product.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/add";
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
				executeGScript(entityCode, "beforeSave", events, product);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(product);
		beforeSaveProduct(product, viewIsView);

		if (viewIsView) {
			productDao.saveWithRevertVersion(product);
		} else {
			if(isNew)
					productDao.save(product);
				else
					productDao.merge(product);
		}
		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		if (dataGridService != null) {
			productDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealProductidProdAttrId(product);
			this.dealProductIDCompareID(product);
			this.dealProductSecUnit(product);
			this.dealProductBaseUnit(product);
		
		// 根据配置规则生成编码
		try {
			generateProductCodes(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProductSummarys(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduct(product, viewIsView);


		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/add", product,MESBasicProductMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, product);
			}
		}
		List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
		productDao.flush();
		productDao.clear();
		product = productDao.load(product.getId());
		
		List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdResetDailyList(prodResetDailyList);
		List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product));
		product.setProdSecUnitList(prodSecUnitList);
		List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdLevelList(prodLevelList);
		List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product));
		product.setCprodAttList(cprodAttList);
		
		params.add(product);
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=product.getId();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(product.getId());
			String msgId="moduleCode:MESBasic_1#entityCode:MESBasic_1_product#modelCode:MESBasic_1_product_Product#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product")
	public Map<Object, Object> productDataGridImport(MESBasicProduct product, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport){
		Map<Object, Object> map = new HashMap<Object, Object>();
		List<String> assSelfPropertyList = checkParentIsSelf(product);
		if(null != assSelfPropertyList && !assSelfPropertyList.isEmpty()) {
			throw new BAPException(BAPException.Code.SELECT_NOT_SELF, assSelfPropertyList.get(0));
		}
		boolean isNew = false;
		String entityCode = "MESBasic_1_product";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_product");
		String url = null;
		if(product.getId() != null && product.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/add";
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
				executeGScript(entityCode, "beforeSave", events, product);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(product);
		beforeSaveProduct(product, viewIsView);

		if (viewIsView) {
			productDao.saveWithRevertVersion(product);
		} else {
			if(isNew)
					productDao.save(product);
				else
					productDao.merge(product);
		}

		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		
		if (dataGridService != null) {
			productDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealProductidProdAttrId(product);
			this.dealProductIDCompareID(product);
			this.dealProductSecUnit(product);
			this.dealProductBaseUnit(product);
		
		// 根据配置规则生成编码
		try {
			generateProductCodes(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProductSummarys(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduct(product, viewIsView);


		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/add", product,MESBasicProductMneCode.class);
		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, product);
			}
		}
		List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
		productDao.flush();
		productDao.clear();
		
		String virturalId = product.getVirtualId();
		
		product = productDao.load(product.getId());
		
		if(virturalId != null && virturalId.length() > 0){
			map.put(virturalId, product.getId());
		}else{
			String methodName = "get" + businessKey.getName().substring(0, 1).toUpperCase() + businessKey.getName().substring(1);
			Object bkValue = null;
			try {
				Method getBkValue = product.getClass().getMethod(methodName);
				bkValue = getBkValue.invoke(product);
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				log.error(e.getMessage(), e);
			}
			map.put(bkValue, product.getId());
		}
		
		List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdResetDailyList(prodResetDailyList);
		List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product));
		product.setProdSecUnitList(prodSecUnitList);
		List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdLevelList(prodLevelList);
		List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product));
		product.setCprodAttList(cprodAttList);
		
		params.add(product);
		return map;
	}
	
	 
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product")
	public void mergeProduct(MESBasicProduct product, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(product);
		beforeSaveProduct(product);
		productDao.merge(product);
		
		if(null != product && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || MESBasicProduct.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == product.getId() ? "" : product.getId().toString());
			AuditUtil.setColumnStringA(null == product.getProductName() ? "" : product.getProductName().toString());
			AuditUtil.setColumnStringC(product.getId().toString());
		}
		
		if (dataGridService != null) {
			dataGridService.execute();
		}

			// 一对多情况处理
			this.dealProductidProdAttrId(product);
			this.dealProductIDCompareID(product);
			this.dealProductSecUnit(product);
			this.dealProductBaseUnit(product);
		afterSaveProduct(product);
		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/add", product,MESBasicProductMneCode.class);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.common.exportExcel",operType="11")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="ec.print.page.print",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes(InternationalResource.get("ec.print.page.print"));
		}else if(printType == 1){
			AuditUtil.setAuditDes(InternationalResource.get("ec.view.controlPrint"));
		}
	}
	
	@Override
	@AuditLog(entity="MESBasic_1_product",model="MESBasic_1_product_Product",desc="foundation.batch.save",operType="4")
	public void batchSaveProduct(MESBasicProduct product, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		List<String> assSelfPropertyList = checkParentIsSelf(product);
		if(null != assSelfPropertyList && !assSelfPropertyList.isEmpty()) {
			throw new BAPException(BAPException.Code.SELECT_NOT_SELF, assSelfPropertyList.get(0));
		}
		String entityCode = "MESBasic_1_product";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "MESBasic_1_product");
		String url = null;
		if(product.getId()!=null && product.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/mESBasic_1_product/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, product);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(product);
		beforeSaveProduct(product, viewIsView);

		if (viewIsView) {
			productDao.saveWithRevertVersion(product);
		} else {
			productDao.save(product);
		}

		if (dataGridService != null) {
			productDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
			this.dealProductidProdAttrId(product);
			this.dealProductIDCompareID(product);
			this.dealProductSecUnit(product);
			this.dealProductBaseUnit(product);
		
		// 根据配置规则生成编码
		try {
			generateProductCodes(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateProductSummarys(product, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveProduct(product, viewIsView);


		productDao.flush();
		BAPEventPublisher.mneCodeGenerateEventPublisher("com/supcon/orchid/entities/mne/product/add", product,MESBasicProductMneCode.class);
		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, product);
			}
		}
		List<MESBasicProduct> params = new ArrayList<MESBasicProduct>();
		productDao.flush();
		productDao.clear();
		product = productDao.load(product.getId());
		
		List<MESBasicProdResetDaily> prodResetDailyList = prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdResetDailyList(prodResetDailyList);
		List<MESBasicProdSecUnit> prodSecUnitList = prodSecUnitDao.findByCriteria(Restrictions.eq("product", product));
		product.setProdSecUnitList(prodSecUnitList);
		List<MESBasicProdLevel> prodLevelList = prodLevelDao.findByCriteria(Restrictions.eq("productID", product));
		product.setProdLevelList(prodLevelList);
		List<MESBasicCprodAtt> cprodAttList = cprodAttDao.findByCriteria(Restrictions.eq("productid", product));
		product.setCprodAttList(cprodAttList);
		
		params.add(product);
	}
	
	@Override
	public Page<MESBasicProduct> getByPage(Page<MESBasicProduct> page,DetachedCriteria detachedCriteria){
		return productDao.findByPage(page, detachedCriteria);
	}
	@Override
	public List<MESBasicCprodAtt> getCprodAttList(MESBasicProduct product){
		return cprodAttDao.findByCriteria(Restrictions.eq("productid", product),Restrictions.eq("valid", true));
	}
	@Override
	public List<MESBasicProdLevel> getProdLevelList(MESBasicProduct product){
		return prodLevelDao.findByCriteria(Restrictions.eq("productID", product),Restrictions.eq("valid", true));
	}
	@Override
	public List<MESBasicProdResetDaily> getProdResetDailyList(MESBasicProduct product){
		return prodResetDailyDao.findByCriteria(Restrictions.eq("productID", product),Restrictions.eq("valid", true));
	}
	@Override
	public List<MESBasicProdSecUnit> getProdSecUnitList(MESBasicProduct product){
		return prodSecUnitDao.findByCriteria(Restrictions.eq("product", product),Restrictions.eq("valid", true));
	}
	
	
	
	public String generateTableNo(){
		this.counter.setPattern(modelServiceFoundation.getEntity("MESBasic_1_product").getPrefix()+"_{1,date,yyyyMMdd}_{0,number,000}");
		return this.counter.incrementAndGetString(new Date(),new Date());
	}
	private void beforeSaveProduct(MESBasicProduct product, Object... objects){
		checkUniqueConstraint(product);
	/* CUSTOM CODE START(serviceimpl,beforeSave,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
      /* CUSTOM CODE START(serviceimpl,beforeSave,MESBasic_1_product_Product,MESBasic_1) */
		//新增时,检测物料编码是否唯一 modify by yy 2019-04-24
		if (product.getId() == null && null != product && !product.getProductCode().isEmpty()){
			if (!checkProductUnique(product.getProductCode())) {
				throw new BAPException("物料编码在系统已经存在,请使用新的物料编码!");
			}
		}
        
        if (product.getProductListID()==null||product.getProductListID().getId()==null) {
			throw new BAPException("物品目录不能为空，请在物品目录下新建物品!");
		}
		product.setModifyPerson(((User) getCurrentUser()).getStaff());
		product.setModifyTime(new Date());
	/*ABC分类*/
		if(product.getAbcClass()!=null&&(!product.getAbcClass().equals(""))){
					if(product.getAbcClass().equals("ABC01")){
						product.setAbcClassS2("A");
					}
					if(product.getAbcClass().equals("ABC02")){
						product.setAbcClassS2("B");
					}
					if(product.getAbcClass().equals("ABC03")){
						product.setAbcClassS2("C");
					}
			}
		
			/*计价方式*/
        if(product.getBapValueType()!=null&&product.getBapValueType().getId()!=null&&product.getBapValueType().getId().length()>0){
			if(product.getBapValueType().getId().equals("valueType/01")){
				product.setValueType(0);
			}
			if(product.getBapValueType().getId().equals("valueType/02")){
				product.setValueType(1);
			}
			if(product.getBapValueType().getId().equals("valueType/03")){
				product.setValueType(5);
			}
			if(product.getBapValueType().getId().equals("valueType/04")){
				product.setValueType(6);
			}
			}
		
		
		//批次启用
		if(product.getBatch()!=null&&product.getBatch().getId()!=null&&product.getBatch().getId().length()>0){
			if(product.getBatch().getId().equals("batch/batch01")){
				product.setBeUnique("0");
			}
			if(product.getBatch().getId().equals("batch/batch02")){
				product.setBeUnique("1");
			}
			if(product.getBatch().getId().equals("batch/batch03")){
				product.setBeUnique("2");
			}
		}
		
		
		//检验方式
		if(product.getCheckMethodbap()!=null&&product.getCheckMethodbap().getId()!=null&&product.getCheckMethodbap().getId().length()>0){
			if(product.getCheckMethodbap().getId().equals("product_checkMethod/1")){
				product.setProductCheckMethod(1);
			}
			if(product.getCheckMethodbap().getId().equals("product_checkMethod/2")){
				product.setProductCheckMethod(2);
			}
		}
		
		//有效期推算
		if(product.getKeepReckon()!=null&&product.getKeepReckon().getId()!=null&&product.getKeepReckon().getId().length()>0){
			if(product.getKeepReckon().getId().equals("product_keepReckon/01")){
				product.setKeepReckonS2(1);
			}
			if(product.getKeepReckon().getId().equals("product_keepReckon/02")){
				product.setKeepReckonS2(2);
			}
		}
			
		//保质期单位
		if(product.getKeepUnit()!=null&&product.getKeepUnit().getId()!=null&&product.getKeepUnit().getId().length()>0){
			if(product.getKeepUnit().getId().equals("product_keepUnit/01")){
				product.setKeepUnitS2(1);
			}
			if(product.getKeepUnit().getId().equals("product_keepUnit/02")){
				product.setKeepUnitS2(2);
			}
			if(product.getKeepUnit().getId().equals("product_keepUnit/03")){
				product.setKeepUnitS2(3);
			}
		}
		
		//物料需求分析方法
		if(product.getReqType()!=null&&product.getReqType().getId()!=null&&product.getReqType().getId().length()>0){
			if(product.getReqType().getId().equals("productReqType/01")){
				product.setReqTypeS2(1);
			}
			if(product.getReqType().getId().equals("productReqType/02")){
				product.setReqTypeS2(2);
			}
			if(product.getReqType().getId().equals("productReqType/03")){
				product.setReqTypeS2(3);
			}
		}
		
		
		//复验期推算
		if(product.getResetMark()!=null&&product.getResetMark().getId()!=null&&product.getResetMark().getId().length()>0){
			if(product.getResetMark().getId().equals("product_resetMark/01")){
				product.setResetMarkS2(1);
			}
			if(product.getResetMark().getId().equals("product_resetMark/02")){
				product.setResetMarkS2(2);
			}
		}
      	
        //计量单位赋值主单位名称
		if(product.getProductBaseUnit()!=null){
			product.setUnit(product.getProductBaseUnit().getName());
		}
/* CUSTOM CODE END */
	}
	
	private void afterSaveProduct(MESBasicProduct product, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
    	//productDao.flush();
		//productDao.clear();
		/*价格历史记录保存*/
	
		String strtemp ="";
		if((product.getCostPriceOri()!=null && product.getProductCostPrice()!=null && !product.getCostPriceOri().equals(product.getProductCostPrice()))||(product.getCostPriceOri()==null&&product.getProductCostPrice()!=null)){
			strtemp = "insert into S2BASE_PRODUCTCOST (PC_TYPE,PC_BAPTYPE,PC_COST,PC_INPUTTIME,PC_INPUTSTAFFID,PC_MEMO,PC_ID,PC_PRODUCTID) values (0,'productCost_type/0',?,?,?,?,?,?)";
			productDao.createNativeQuery(strtemp,product.getProductCostPrice(),(new Date()),((User) getCurrentUser()).getStaff(),product.getDcontent(),idGenerator.getNextId("S2BASE_PRODUCTCOST",1,"PC_ID"),product.getId()).executeUpdate();
		}
		if(product.getCostPriceOri()!=null && product.getProductCostPrice()==null){
			strtemp = "insert into S2BASE_PRODUCTCOST (PC_TYPE,PC_BAPTYPE,PC_COST,PC_INPUTTIME,PC_INPUTSTAFFID,PC_MEMO,PC_ID,PC_PRODUCTID) values (0,'productCost_type/0',?,?,?,?,?,?)";
			productDao.createNativeQuery(strtemp,new BigDecimal(0),(new Date()),((User) getCurrentUser()).getStaff(),product.getDcontent(),idGenerator.getNextId("S2BASE_PRODUCTCOST",1,"PC_ID"),product.getId()).executeUpdate();
		}
		productDao.flush();
		productDao.clear();
		//参考售价
	
		if((product.getSalePriceOri()!=null && product.getSalePrice()!=null && !product.getSalePrice().equals(product.getSalePriceOri()))||(product.getSalePriceOri()==null && product.getSalePrice()!=null)){
			strtemp = "insert into S2BASE_PRODUCTCOST (PC_TYPE,PC_BAPTYPE,PC_COST,PC_INPUTTIME,PC_INPUTSTAFFID,PC_MEMO,PC_ID,PC_PRODUCTID) values (1,'productCost_type/1',?,?,?,?,?,?)";
			productDao.createNativeQuery(strtemp,product.getSalePrice(),(new Date()),((User) getCurrentUser()).getStaff(),product.getDcontent(),idGenerator.getNextId("S2BASE_PRODUCTCOST",1,"PC_ID"),product.getId()).executeUpdate();
		}
		if(product.getSalePriceOri()!=null && product.getSalePrice()==null){
			strtemp = "insert into S2BASE_PRODUCTCOST (PC_TYPE,PC_BAPTYPE,PC_COST,PC_INPUTTIME,PC_INPUTSTAFFID,PC_MEMO,PC_ID,PC_PRODUCTID) values (1,'productCost_type/1',?,?,?,?,?,?)";
			productDao.createNativeQuery(strtemp,new BigDecimal(0),(new Date()),((User) getCurrentUser()).getStaff(),product.getDcontent(),idGenerator.getNextId("S2BASE_PRODUCTCOST",1,"PC_ID"),product.getId()).executeUpdate();
		}
		productDao.flush();
		productDao.clear();
		//最新库存成本
		
		if((product.getRecCostOri()!=null && product.getRecCost()!=null && !product.getRecCostOri().equals(product.getRecCost()))||(product.getRecCostOri()==null && product.getRecCost()!=null)){
			strtemp = "insert into S2BASE_PRODUCTCOST (PC_TYPE,PC_BAPTYPE,PC_COST,PC_INPUTTIME,PC_INPUTSTAFFID,PC_MEMO,PC_ID,PC_PRODUCTID) values (2,'productCost_type/2',?,?,?,?,?,?)";
			productDao.createNativeQuery(strtemp,product.getRecCost(),(new Date()),((User) getCurrentUser()).getStaff(), product.getDcontent(),idGenerator.getNextId("S2BASE_PRODUCTCOST",1,"PC_ID"),product.getId()).executeUpdate();
		}
		if(product.getRecCostOri()!=null && product.getRecCost()==null){
			strtemp = "insert into S2BASE_PRODUCTCOST (PC_TYPE,PC_BAPTYPE,PC_COST,PC_INPUTTIME,PC_INPUTSTAFFID,PC_MEMO,PC_ID,PC_PRODUCTID) values (2,'productCost_type/2',?,?,?,?,?,?)";
			productDao.createNativeQuery(strtemp,new BigDecimal(0),(new Date()),((User) getCurrentUser()).getStaff(), product.getDcontent(),idGenerator.getNextId("S2BASE_PRODUCTCOST",1,"PC_ID"),product.getId()).executeUpdate();
		}
		productDao.flush();
		productDao.clear();
      	
      
      
      
      
       /*采购组更改记录做保存*/
		String GroupName = "";
		if(product.getPurchGroupId()!=null){
			String hql = "from MESBasicPurchGroup  where id = ? ";	
		
			List <MESBasicPurchGroup> purList = purchGroupDao.createQuery(hql, product.getPurchGroupId().getId()).list();	
			for(MESBasicPurchGroup purGroup : purList){
				GroupName = purGroup.getPurchGroupName();
			}
			//GroupName = (String) purchGroupDao.createQuery(hql, product.getPurchGroupId().getId()).uniqueResult();
		}
		String originalName = "";
		if(product.getPurGroupMark()!=null&&product.getPurGroupMark().length()!=0){
			originalName = product.getPurGroupMark();
		}
		if(!GroupName.equals(originalName)){
			String memoGroup = "";
			if(originalName.length()>0&&GroupName.length()>0){
				memoGroup ="采购组从\'"+originalName+"\'更改为\'"+GroupName+"\'";
			}
			if(originalName.length()==0){
				memoGroup = "采购组从\'无\'更改为\'"+GroupName+"\'";
			}
			if(GroupName.length() ==0){
				memoGroup = "采购组从\'"+originalName+"\'更改为\'无\'";
			}
			String sqlGroupHistory = "insert into COMM_DEALINFO (DEALINFO_ID,DEALINFO_ASSIGNID,DEALINFO_TYPE, DEALINFO_DEALERID,DEALINFO_DEALTIME,DEALINFO_CONTENT) values (?,?,?,?,?,?)";
			productDao.createNativeQuery(sqlGroupHistory,idGenerator.getNextId("COMM_DEALINFO",1,"DEALINFO_ID"),product.getId(),12,((User) getCurrentUser()).getStaff(),(new Date()),memoGroup).executeUpdate();
		}
      
      	/*查询保存的物品属性记录*/
		String sqlAttr = "select PRODATT_LAYREC from S2BASE_PRODATTRIBUTE where PRODATT_ID in (select PROD_ATTR_ID from MESBASIC_CPROD_ATTS where PRODUCTID = ? )";
		List <Object> listAttr = productDao.createNativeQuery(sqlAttr, product.getId()).list();
		int rsCount = listAttr.size();
		
		/*删除原有物品属性关联表上的记录*/
		String sqlDelete = "delete from S2BASE_PRODATTREL where PRODATTREL_PRODUCTID = ?";
		productDao.createNativeQuery(sqlDelete, product.getId()).executeUpdate();
		productDao.flush();
		productDao.clear();
		String insertAttr ="";
		Boolean flagFir = true;
		if(listAttr!=null && !listAttr.isEmpty()){
			for(Object objAttr : listAttr){
				String attrId = String.valueOf(objAttr); 
				if(attrId.indexOf('-')!=-1){
					flagFir = false;
					insertAttr = "insert into S2BASE_PRODATTREL (PRODATTREL_SECATTID,PRODATTREL_FIRATTID,PRODATTREL_PRODUCTID,PRODATTREL_ID) values(?,?,?,?)";
					productDao.createNativeQuery(insertAttr, attrId.split("-")[1],attrId.split("-")[0],product.getId(),idGenerator.getNextId("S2BASE_PRODATTREL",1,"PRODATTREL_ID")).executeUpdate();
				}
				if(flagFir==true){
					insertAttr = "insert into S2BASE_PRODATTREL (PRODATTREL_FIRATTID,PRODATTREL_PRODUCTID,PRODATTREL_ID) values(?,?,?)";
					productDao.createNativeQuery(insertAttr,attrId.split("-")[0],product.getId(),idGenerator.getNextId("S2BASE_PRODATTREL",1,"PRODATTREL_ID")).executeUpdate();
				}
			}
		}
		/*备注保存*/
		if(product.getProductComment()!=null){
			product.setCmemo(product.getProductComment());
		}
       
        if(product.getDcontent()!=null&&product.getDcontent().length()!=0){
	        Long dd = product.getId();
	        MESBasicProdDealInfo prodDealInfo = new MESBasicProdDealInfo();
	        if(dd!=null){
	      	  prodDealInfo.setAssignID(product);
	      	}
	        
			prodDealInfo.setContent(product.getDcontent());
			prodDealInfo.setDealerID(((User) getCurrentUser()).getStaff());
			prodDealInfo.setDealTime(new Date());
	       	prodDealInfo.setCtype(1);
			prodDealInfo.setDirectoryID(0);
	      
			prodDealInfoService.saveProdDealInfo(prodDealInfo, null);
		}
		
     	 //Long aa = idGenerator.getNextId("S2BASE_BANKINFO");
		
		/*String hql = "from MESBasicProdResetDaily p where p.valid = true and p.productID = ?";
		List<MESBasicProdResetDaily> list = prodResetDailyDao.findByHql(hql, new Object[] {product});
		String res="";
		for(MESBasicProdResetDaily m:list){
			res+="@"+m.getNotifyDays()+":"+m.getResetCyc();
		}
		res.replaceAll("^@", "");
		productDao.flush();
		productDao.clear();
		//product = getProduct(product.getId());
		product.setResetDaily(res);*/
     	product = getProduct(product.getId());
      	productDao.flush();
		productDao.clear();
		product.setDcontent(null);
		productDao.save(product);
/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportProduct(List<MESBasicProduct> products, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportProduct(List<MESBasicProduct> products){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportProduct(List<MESBasicProduct> products, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportProduct(List<MESBasicProduct> products){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	private void beforeDeleteProduct(MESBasicProduct product){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
        //删除物料前,检测该物料是否已经存在相应业务 modify by yy 2019-04-24
		if(!bapBaseService.canDelete(product)){
			throw new BAPException(product.getProductCode()+":"+product.getProductName()+"，已被其他业务单据使用,无法删除!");
		}
/* CUSTOM CODE END */
	}
	
	private void afterDeleteProduct(MESBasicProduct product){
	/* CUSTOM CODE START(serviceimpl,afterDelete,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
      if(checkProductIsUsed(product)){
			throw new BAPException("该物品被工厂模型引用，请解除引用后再删除！");
	  }
      //bap删除同时把s2相关字段设为删除
      //bap删除同时把s2相关字段设为删除
      /*String judgeStr ="select  * from  user_tab_columns t where t.table_name= ? and t.column_name =?";
      List <Object[]> list = productDao.createNativeQuery(judgeStr,"S2BASE_PRODUCT","PRODUCT_STATE").list();
      if(list!=null&&list.size()!=0){
	      String sql = "update s2base_product set product_state = 0 where PRODUCT_CODE = ?";
		  productDao.createNativeQuery(sql, product.getProductCode()).executeUpdate();
      }
      String isListState ="select  * from  user_tab_columns t where t.table_name= ? and t.column_name =?";
       List <Object[]> stateList = productDao.createNativeQuery(isListState,"S2BASE_PRODLIST","PRODLIST_STATE").list();
      if(stateList!=null&&stateList.size()!=0){
		  String listsql = "update S2BASE_PRODLIST set PRODLIST_STATE = 0 where PRODLIST_CODE = ?";
	      productDao.createNativeQuery(listsql, product.getProductCode()).executeUpdate();
      }*/
/* CUSTOM CODE END */
	}
	
	private void beforeRestoreProduct(MESBasicProduct product){
	/* CUSTOM CODE START(serviceimpl,beforeRestore,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterRestoreProduct(MESBasicProduct product){
	/* CUSTOM CODE START(serviceimpl,afterRestore,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void customGenerateCodes(MESBasicProduct product, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(MESBasicProduct product, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportProduct(List<MESBasicProduct> insertObjs, List<MESBasicProduct> updateObjs, 
			List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportProduct,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void afterImportProduct(List<MESBasicProduct> insertObjs, List<MESBasicProduct> updateObjs, 
			List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportProduct,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	}
	/* CUSTOM CODE START(serviceimpl,functions,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
  	@Value("${bap.s2.integration}")
	private Boolean s2Interation=false;
	
  	public Boolean getS2Interation() {
		return s2Interation;
	}

	public void setS2Interation(Boolean s2Interation) {
		this.s2Interation = s2Interation;
	}
  @Autowired
	 private IdGenerator idGenerator;
  @Override
	public BigDecimal getBatchCode(Long id){
		String sql = "select batchcode from S2BASE_PRODUCT where id = ? for update";
		List<BigDecimal> batchcode = null;
		try{
		batchcode = productDao.createNativeQuery(sql,id).list();
			}catch(Exception e){
		return new BigDecimal(-1);
	}
	BigDecimal bcode = new BigDecimal(-1);
	if(batchcode != null && batchcode.size() > 0){
		bcode = batchcode.get(0);
		sql = "update S2BASE_PRODUCT set batchcode = ? where id = ?";
		productDao.createNativeQuery(sql, new Object[]{bcode.add(new BigDecimal(1)),id}).executeUpdate();
	}
		return bcode;
	}
  
    //  启动、停用  物品
  @Override
     public  void updateGoodState(Long goodID,String goodState){
      String sql = " update S2BASE_PRODUCT set GOOD_STATE = ? where id = ? ";
      productDao.createNativeQuery(sql,goodState,goodID).executeUpdate();          
       
     }
  
  @Override
  @Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
  public Boolean checkProductIsUsed(MESBasicProduct product){
		if(null != product){
			List<MESBasicProduct> productList = null;
			String sql = "select * from " + MESBasicObjProduct.TABLE_NAME + " where OBJ_PRODUCT=?";
			SQLQuery sqlQuery = objProductDao.createNativeQuery(sql, product.getId());
			productList = sqlQuery.list();
			if(null != productList && productList.size()>0){
				return true;
			}
		}
		return false;
	}

 /*取主单位的值*/
  @Override
   public String getUnitMain(String unitGroupIds) {
	  String  sql = "select UNIT_NAME,UNIT_ID from S2BASE_UNIT where UNIT_MAIN = 1 and UNIT_GROUPID = ?"; 
	  List<Object[]> list = productDao.createNativeQuery(sql, unitGroupIds).list();
	 
	  if(list!=null&&list.size()>0){
		  Object[] objs = list.get(0);
		  String str = String.valueOf(objs[0])+','+String.valueOf(objs[1]);
		  return str;
		  }
  	return null;
  }

  /*查询父级属性的名称*/
  @Override
  public String getAttrName(String baseLRC){
	  String  sql = "select PRODATT_NAME from S2BASE_PRODATTRIBUTE where PRODATT_ID = ?"; 
	  List<Object> list = productDao.createNativeQuery(sql, baseLRC).list();
	  if(list!=null&&list.size()>0){
		  Object objs = list.get(0);
		  String str = String.valueOf(objs);
		  return str;
		  }
	  return null;
  }
  
/*检查价格历史*/
  @Override
  public Boolean checkCostHistory(String productCode) {
	  String  sql = "select PC_ID from S2BASE_PRODUCTCOST where PC_PRODUCTID in (select PRODUCT_ID from S2BASE_PRODUCT where PRODUCT_CODE = ?)";
	  List<Object[]> list = productDao.createNativeQuery(sql, productCode).list();
	   if(list!=null&&list.size()>0){
		   return true;
	   }
	  return  false;
  }


/*查询质量等级是否被引用*/
  @Override
  public String checkLevelUsed(Long productID,String level)
  {	
    	String checkFlag = "";
	 	if(s2Interation){
		  String sql1 = "select CPL_ID from  QA_CHECKPROJLEVEL where CPL_CPID = (select CHECKPROJ_ID from QA_CHECKPROJ where CHECKPROJ_PRODUCTID = ? ) and  CPL_LEVEL = ?";
		  String sql2 = "select CURRENTSTOCK_ID from  COMM_CURRENTWHSTOCK where CURRENTSTOCK_PRODID = ? and  CURRENTSTOCK_FREEPARAMA = ?";
		  List<Object[]> list1 = productDao.createNativeQuery(sql1, productID,level).list();
		  List<Object[]> list2 = productDao.createNativeQuery(sql2, productID,level).list();
		   if(list1!=null&&list1.size()>0){
			   checkFlag = "1";
		   }
		   if(list2!=null&&list2.size()>0){
			   checkFlag = "2";
		   }
	  }
	  return checkFlag;
  }
  /*保存复验周期S2上字段*/
  @Override
  public void resetDailySave(Long productID){
	  	//productDao.flush();
		//productDao.clear();
	    MESBasicProduct product = new MESBasicProduct();
	    String hql = "select NOTIFY_DAYS,RESET_CYC,ID from MESBASIC_PROD_RESET_DAILIES where VALID = ? and PRODUCTID = ?";
	  	String strResetDaily = "update MESBASIC_PROD_RESET_DAILIES set NOTIFY_DAYS = ?,RESET_CYC=? where PRODUCTID =? and ID = ?";
		List<Object []> list = productDao.createNativeQuery(hql,1,productID).list();
		if(list!=null&&list.size()>0){
			String res="";
			for(Object [] objs :list ){
			  String astr = "0";
			  String bstr = "0";
			  if(objs[0]!=null&&String.valueOf(objs[0]).length()!=0){
				  astr = String.valueOf(objs[0]);
			  }
			  if(objs[1]!=null&&String.valueOf(objs[1]).length()!=0){
				  bstr = String.valueOf(objs[1]);
			  }
			  res += "@"+bstr+":"+astr;
			  if((objs[0]==null||String.valueOf(objs[0]).length()==0)&&objs[1]!=null&&String.valueOf(objs[1]).length()!=0){
				  productDao.createNativeQuery(strResetDaily,0,String.valueOf(objs[1]),productID,String.valueOf(objs[2])).executeUpdate();
			  	}
			  if(objs[1]==null||String.valueOf(objs[1]).length()==0&&objs[0]!=null&&String.valueOf(objs[0]).length()!=0){
				  productDao.createNativeQuery(strResetDaily,String.valueOf(objs[0]),0,productID,String.valueOf(objs[2])).executeUpdate();
			  	} 
			  }
			  
			res = res.replaceAll("^@", "");
			String strhql ="update S2BASE_PRODUCT set PRODUCT_RESETDAILY = ? WHERE PRODUCT_ID =?";
			productDao.createNativeQuery(strhql,res,productID).executeUpdate();
		}
		//product = getProduct(product.getId());
		//product.setResetDaily(res);
		//productDao.save(product);
  }

	/*校验物品是否被仓库引用*/
	@Override
	public void checkIsWare(Long productId, String batchText) {
		//仓库中有该物品或者流程中的入库单包含该物品，不允许更改批次启用！
		String batchChangeMes = InternationalResource.get("MESBasic.batchChange.radion1494307541443", getCurrentLanguage());
		//获取表中存的批次启用
		String hql = "select batch from S2BASE_PRODUCT where PRODUCT_ID = ?";
		String oldBatch = productDao.createNativeQuery(hql, productId).uniqueResult().toString();
		if (oldBatch != null && !oldBatch.equals(batchText)) {
			//判断物料模块是否上载
			String sql = "select artifact from RUNTIME_MODULE where artifact='material'";
			List<Object[]> list = productDao.createNativeQuery(sql).list();
			if (list != null && list.size() > 0) {
				//判断物料模块中现存量中是否有该物料，是否有流程中的出入库单
				String sql1 = "select a1.c1+a2.c2+a3.c3+a4.c4+a5.c5+a6.c6+a9.c9+a10.c10 as num from " +
						" (SELECT COUNT(*) c1 FROM MATERIAL_USE_OUT_DETAILS s left join MATERIAL_USE_OUT_SINGLES t on S.OUT_SINGLE=t.id WHERE T.VALID = 1 AND T.STATUS = 88 and T.RED_BLUE='redBlue/redBlue01' and S.GOOD=? ) a1," +
						" (select count(*) c2  FROM  MATERIAL_IN_SINGLE_DETAILS s left join MATERIAL_OTHER_IN_SINGLES t on S.IN_SINGLE=T.ID WHERE T.VALID = 1 AND T.STATUS = 88 and T.RED_BLUE='redBlue/redBlue02' and S.GOOD=?) a2, " +
						" (select count(*) c3  FROM MATERIAL_OUT_SINGLE_DETAILS s left join  MATERIAL_OTHER_OUT_SINGLES t on S.OUT_SINGLE=T.ID WHERE T.VALID = 1 AND T.STATUS = 88 and T.RED_BLUE='redBlue/redBlue01' and S.GOOD=? ) a3, " +
						" (SELECT COUNT(*) c4 FROM MATERIAL_INVENTORY_DETAILS s LEFT JOIN MATERIAL_INVENTORIES t ON S.INVENTORY_NO = T.ID LEFT JOIN MATERIAL_STANDINGCROPS t1 ON S.ONHAND = T1.ID WHERE T.VALID = 1 AND T.STATUS = 88 AND T1.GOOD=? ) a4, " +
						" (SELECT COUNT(*) c5 FROM MATERIAL_PRODUCE_IN_DETAILS s left join MATERIAL_PRODUCE_IN_SINGLES t on S.IN_SINGLE=t.id WHERE  T.VALID = 1 AND T.STATUS = 88 and T.RED_BLUE='redBlue/redBlue02' and S.GOOD=?) a5," +
						" (select count(*) c6  FROM  MATERIAL_PRODUCE_OUT_DETAIL s left join MATERIAL_PRODUCE_OUT_SINGLE t on S.OUT_SINGLE=T.ID WHERE T.VALID = 1 AND T.STATUS = 88 and T.RED_BLUE='redBlue/redBlue01' and S.GOOD=?  ) a6, " +
						" (select case when sum(T.BORROW_NUM-T.RETURN_NUM ) is null  then 0 else sum(T.BORROW_NUM-T.RETURN_NUM ) end c9  FROM   MATERIAL_BORROW_AND_RETURNS t WHERE   T.GOOD = ? ) a9, " +
						" (SELECT case when SUM (onhand) is null then 0 else SUM (onhand) end c10 FROM   MATERIAL_STANDINGCROPS t WHERE   T.GOOD = ?) a10 ";
				Number num = (Number) wareDao.createNativeQuery(sql1, productId, productId, productId, productId, productId, productId, productId, productId).uniqueResult();
				if (num.longValue() > 0) {
					throw new BAPException(batchChangeMes);
				}
			}

			//判断物料2模块是否上载
			String sql4 = "select artifact from RUNTIME_MODULE where artifact='material2'";
			List<Object[]> list4 = productDao.createNativeQuery(sql4).list();
			if (list4 != null && list4.size() > 0) {
				//判断物料2接口中采购入库单和销售出库单是否有该物品
				String sql5 = "select a7.c7+a8.c8 as num from " +
						" (select count(*) c7  FROM MATERIAL2_PURCH_IN_DETAILS s left join  MATERIAL2_PURCH_IN_SINGLES t on S.IN_SINGLE=T.ID WHERE T.VALID = 1 AND T.STATUS = 88 and T.RED_BLUE='redBlue/redBlue02' and S.GOOD=?) a7, " +
						" (select count(*) c8 FROM  MATERIAL2_SALE_OUT_DETAILS s left join MATERIAL2_SALE_OUT_SINGLES t on S.OUT_SINGLE=T.ID WHERE T.VALID = 1 AND T.STATUS = 88 and T.RED_BLUE='redBlue/redBlue01' and S.GOOD=? ) a8 ";
				Number num2 = (Number) wareDao.createNativeQuery(sql5, productId, productId).uniqueResult();
				if (num2.longValue() > 0) {
					throw new BAPException(batchChangeMes);
				}
			}
			
			//判断ERP接口模块是否上载
			String sql2 = "select artifact from RUNTIME_MODULE where artifact='ERPInter'";
			List<Object[]> list1 = productDao.createNativeQuery(sql2).list();
			if (list1 != null && list1.size() > 0) {
				//判断erp接口中采购到货单是否有该物品
				String sql3 = "SELECT COUNT(*) c1 FROM MATERIAL_PUR_ARRIVAL_DETAIL s left join MATERIAL_PUR_ARRIVAL_INFOS t on S.ARRIVAL_INFO=t.id WHERE T.VALID = 1 AND T.STATUS = 88 and S.GOOD=? ";
				Number num1 = (Number) wareDao.createNativeQuery(sql3, productId).uniqueResult();
				if (num1.longValue() > 0) {
					throw new BAPException(batchChangeMes);
				}
			}
		}
	}

	/**
	 * 通过物料编码查询物料
	 *
	 * @author yaoyao
	 * @param productCode
	 * @return MESBasicProduct
	 */
	public MESBasicProduct findProductByCode(String productCode) {
		MESBasicProduct product = null;
		String hql = "from MESBasicProduct where productCode = ? and valid = true";

		if (null != productCode && !productCode.isEmpty()) {
			List<MESBasicProduct> products = findProductsByHql(hql, productCode);
			if (null != products && products.size() > 0) {
				product = products.get(0);
			}
		}

		return product;
	}

	/**
	 * 通过物料编码检测物料编码是否唯一(不含已删除的物料)
	 *
	 * @author yaoyao
	 * @param productCode
	 * @return
	 */
	private boolean checkProductUnique(String productCode){
		boolean isUnique = true;

		MESBasicProduct product = findProductByCode(productCode);

		if (null != product){
			isUnique = false;
		}

		return isUnique;
	}
/* CUSTOM CODE END */
}
