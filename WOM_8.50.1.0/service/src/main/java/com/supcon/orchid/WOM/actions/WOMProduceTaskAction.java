package com.supcon.orchid.WOM.actions;
import com.supcon.orchid.WOM.entities.WOMProduceTaskDealInfo;
import java.net.URLDecoder;
import java.util.Date;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashMap;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map.Entry;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.StringTokenizer;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.net.URLEncoder;
import ognl.Ognl;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.osgi.framework.FrameworkUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import com.supcon.orchid.ec.entities.Sql;
import com.supcon.orchid.utils.DocumentUtils;
import com.supcon.orchid.utils.Inflector;
import com.supcon.orchid.utils.SerializeUitls;
import com.supcon.orchid.utils.OrchidUtils;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.utils.UUIDUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;
import com.supcon.orchid.PropertyHolder;
import com.supcon.orchid.i18n.InternationalResource;
import com.supcon.orchid.container.mvc.struts2.support.BAPEntityConfGenericActionSupport;
import com.supcon.orchid.container.mvc.struts2.support.GenericActionSupport;
import com.supcon.orchid.container.mvc.struts2.utils.ResponseMsg;
import com.supcon.orchid.container.mvc.struts2.utils.Struts2Utils;
import com.supcon.orchid.container.mvc.struts2.utils.XmlUtils;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.ec.entities.CreatorInfo;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.entities.Cookie;
import com.supcon.orchid.notification.NotificationService;
import com.supcon.orchid.orm.entities.ICookie;
import com.supcon.orchid.foundation.entities.Document;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import java.util.LinkedHashSet;
import com.supcon.orchid.foundation.entities.FlowStatus;
import com.supcon.orchid.foundation.services.ACLPermissionHandleService;
import org.osgi.framework.BundleContext;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.ServiceReference;
import com.supcon.orchid.ec.entities.AssociatedInfo;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.foundation.services.CookieService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.DocumentService;
import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.services.IViewServiceFoundation;
import com.supcon.orchid.ec.services.BusinessCenterService;
import com.supcon.orchid.ec.services.CreatorService;
import com.supcon.orchid.ec.services.ConditionService;
import com.supcon.orchid.ec.services.ModelServiceFoundation;
import com.supcon.orchid.ec.services.PrintService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.script.EngineScriptExecutor;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.entities.CustomPropertyModelMapping;
import com.supcon.orchid.ec.entities.CustomPropertyViewMapping;
import com.supcon.orchid.ec.entities.CustomerCondition;
import com.supcon.orchid.ec.entities.BusinessCenter;
import com.supcon.orchid.ec.entities.Model;
import com.supcon.orchid.ec.entities.PrintTemplate;
import com.supcon.orchid.ec.entities.Property;
import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DataGrid;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.ec.enums.DbColumnType;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.orm.enums.CompanyType;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BAPException.Code;
import com.supcon.orchid.services.ExportExcelAble;
import com.supcon.orchid.services.IUserFieldPermissionService;
import com.supcon.orchid.foundation.services.ImportService;
import com.supcon.orchid.ec.services.ImportTemplateServiceFoundation;
import com.supcon.orchid.ec.entities.ImportTemplate;
import com.supcon.orchid.services.Page;
import java.util.List;
import java.util.regex.Matcher;
import com.supcon.orchid.ec.entities.EchartsData;
import com.supcon.orchid.ec.services.EchartsDataService;


import com.supcon.orchid.foundation.services.ReliableMessageSenderService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import java.util.regex.Pattern;
import com.supcon.orchid.foundation.entities.UploadInfo;
import com.supcon.orchid.foundation.exceptions.ImportValidateException;
import com.supcon.orchid.foundation.exceptions.ImportSaveException;
import org.jbpm.api.model.Transition;
import org.jbpm.api.model.Activity;

import com.supcon.orchid.workflow.engine.entities.Deployment;
import com.supcon.orchid.workflow.engine.entities.Task;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.services.ProcessService;
import com.supcon.orchid.workflow.engine.services.TaskService;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.exceptions.WorkFlowException;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempHead;
import com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.services.WOMProduceTaskProcessService;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.services.RMStandService;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempRecords;
import com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.services.X6BasicBaseUnitService;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveService;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.services.WOMStandingcropRefService;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.services.RMFormulaBomService;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.services.WOMProduceMaterialSumService;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.services.RMProcessTypeService;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;
import com.supcon.orchid.publicSet.entities.PublicSetActBatState;
import com.supcon.orchid.publicSet.services.PublicSetActBatStateService;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.services.RMSampleProjService;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.services.RMPickSiteService;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import java.util.Iterator;
import com.supcon.orchid.ec.enums.ShowType;
import com.supcon.orchid.ec.entities.DataGrid;
import com.supcon.orchid.ec.services.EcConfigService;
import com.supcon.orchid.ec.services.FieldService;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.audit.entities.PrintRecordLog;
import com.supcon.orchid.audit.entities.OperationAuditLog;
import com.supcon.orchid.audit.entities.SignatureLog;
import com.supcon.orchid.audit.service.DataAuditLogService;
import com.supcon.orchid.ec.entities.Button;
/* CUSTOM CODE START(action,import,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
import com.supcon.orchid.WOM.entities.ProcessStep;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.services.ConsulService;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogService;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialNeedService;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.services.RMMQDealinfoService;
import java.math.BigDecimal;
import com.supcon.orchid.ec.utils.JSONUtil;
import com.supcon.orchid.WOM.entities.WOMBatchChargeDetails;
import com.supcon.orchid.WOM.entities.BatchAnalyze;
import com.supcon.orchid.WOM.services.impl.handler.ActiveChoseHandler;
import com.supcon.orchid.WOM.services.ProcedureReport;
import com.supcon.orchid.WOM.enums.DealsEnum;
import com.supcon.orchid.WOM.entities.WOMResult;
/* CUSTOM CODE END */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class WOMProduceTaskAction extends BAPEntityConfGenericActionSupport implements Preparable, ExportExcelAble<WOMProduceTask> {
	private static final long serialVersionUID = 1L;
	@Resource
	protected SystemCodeService systemCodeService;
	@Resource
	ViewServiceFoundation viewServiceFoundation;
	@Resource
	ConditionService conditionService;
	@Resource
	private WOMProduceTaskService produceTaskService;
	@Resource
	private CreatorService creatorService;
	@Resource
	private CookieService cookieService;
    @Resource
	private StaffService _staffService;
	@Autowired
	private ImportTemplateServiceFoundation importTemplateServiceFoundation;
    @Resource
	private ACLPermissionHandleService aclPermissionService;
	@Resource
	private SessionFactory sessionFactory;
	private IUserFieldPermissionService userFieldPermissionService;
	@Value("${bap.company.single}")
	private Boolean isSingleMode = false;
	
	public Boolean getIsSingleMode() {
		if(null == isSingleMode)
			isSingleMode = false;
		return isSingleMode;
	}
	@Resource
	private WOMAdjustOrTempHeadService adjustOrTempHeadService;
	@Resource
	private WOMProduceTaskProcessService produceTaskProcessService;
	@Resource
	private MESBasicProductService productService;
	@Resource
	private RMStandService standService;
	@Resource
	private WOMAdjustOrTempRecordsService adjustOrTempRecordsService;
	@Resource
	private X6BasicBaseUnitService baseUnitService;
	@Resource
	private WOMProduceTaskActiveService produceTaskActiveService;
	@Resource
	private WOMStandingcropRefService standingcropRefService;
	@Resource
	private RMFormulaBomService formulaBomService;
	@Resource
	private WOMProduceMaterialSumService produceMaterialSumService;
	@Resource
	private RMFormulaProcessActiveService formulaProcessActiveService;
	@Resource
	private RMFormulaService formulaService;
	@Resource
	private RMFormulaProcessService formulaProcessService;
	@Resource
	private WOMProdTaskProcExelogService prodTaskProcExelogService;
	@Resource
	private RMProcessTypeService processTypeService;
	@Resource
	private MESBasicFactoryModelService factoryModelService;
	@Resource
	private WOMProdTaskActiExelogService prodTaskActiExelogService;
	@Resource
	private PublicSetActBatStateService actBatStateService;
	@Resource
	private RMSampleProjService sampleProjService;
	@Resource
	private RMPickSiteService pickSiteService;
	
	@Resource
	private ImportService importService;
	@Resource
	private NotificationService notificationService;
	@Autowired
	private DataAuditLogService dataAuditLogService;
	private Long id;
	private String exportFetchDataMethod;
	private String dealInfoGroup;
	private String ids;
	private String retJson;
	private String includes;
	private String callBackFuncName;
	private String condition;
	private WOMProduceTask produceTask;
	private CreatorInfo creatorInfo;
	private String tableProcessKey;
	private String refUrl;
	private String classifyCodes;
	private String workFlowVarStatus;
	private String scriptCode;
	private String rt;//return type;
	private int currentSqlType = Sql.TYPE_LIST_PENDING;
	private String viewCode = null;
	private String permissionCode = null;
	private String layoutViewCode = null;
	private String pendingIds;
	private String outcomeStr;
	private Boolean flowBulkFlag = false;
	private Boolean hasAttachment = false;
	private Boolean hasSupervision = false;
	private Boolean hasPayCloseAttention = false;
	private List<Param> params = null;
	private int showNumber;
	private String pendingBeginDate;
	private String pendingEndDate;
	private Boolean dealFlag;
	private Integer dealSet;
	private String datagridCode;
	private String datagridName;
	private File dataFile;
	private String xlsResult;
	private String fileName;
	private InputStream inputStream;
	private String tid;
	private String xlsSize;
	private Long refId;
	private String time;
	private String downloadType;
	private String orgName;
	private String viewShowType;
	private String useInBusiness;
	//文件类型
	private String fileType;
	
	private String listCustomCondition;
	private String listFirstCustomCond;
	
	private Boolean mainContent;
	private Boolean attachmentInfo;
	private Boolean dealInfo;
	
	private String propertyCode;
	
	private Long treeId;
	
	//用于office控件
	private String sign;
	private String handSign;
	private String signMark;
	private String handSignMark;
	private String officeDeal;
	private String officeDate;
	
	private long treecid;
	private long pid;
	private int cindex;
	private String uploadDocIds;//附件ID
	
	private Boolean isReplace = false;
	private Boolean isIgnore = false;
	private Boolean isBatch = false;
	
	private String sortResult;
	
	private Boolean graduallyReject;
	
	private boolean isNeedSaveCookie = true;
	//导出的sql
	private String  exportSql="";
	
	//是否生成标志
	private  Boolean  generateFlag=false;
	
	//查询配置
	private String  queryConfig;
	
	//导入时必须的数据
	private List<Map<String, String>> data = new ArrayList<Map<String, String>>();
	
	//导出数据包装的map
	private Map<String, Object> map = new HashMap<String, Object>();
	

	//取出该类所有属性标志位
	private Boolean getAllProperties = false;
	
	//查询标志
	private Boolean noQueryFlag=false;
	
	//是否用于导入的标志
	private Boolean useForImportFlag=false;
	
	//是否允许委托的标志
 	private Boolean isAllowProxy = true;
	
	//模型编码或者datagridCode
	private  String  templateRelatedModelCode;
	//传入导入模板中用于生成自定义字段相关信息
	private Map<String,Object> customPropData;
	
	private static final String LISTSHOWTYPE="LISTPT";
	
	private static final String DATAGRIDSHOWTYPE="DATAGRID";
	
	//视图显示的自定义字段的属性信息
	private Map<String,List>  showCustomProps;
	//是否导出辅模型的标志
	private Boolean exportAuxiliaryModelFlag=false;
	
	//excel字段的style
	List<Map> styleFormats = new ArrayList<Map>();
	//导出excel时,主模型内容
	List<WOMProduceTask> queryResults = new ArrayList<WOMProduceTask>();
	
	//导入导出时常用的属性
	Map<String, Object> excelExportModels = new HashMap<String, Object>();//modelCode,Model
	Map<String, Object> excelProperty = new HashMap<String, Object>();//propertyCode,Property
	Map<String, Object> excelProperties = new HashMap<String, Object>();//modelCode,List<Property>
	Map<String, Object> excelRunningCustomPropertyCode = new HashMap<String, Object>();//modelCode,RunningCustomPropertyCode
	Map<String, Object> excelModelMappings = new HashMap<String, Object>();//modelCode,CustomPropertyModelMapping
	Map<String, Object> excelTotal = new HashMap<String, Object>();//上面五个变量的集合
	private Boolean superEdit = false; //是否是超级修改/录入，默认是false
	private String pendingActivityType;//待办的活动类型
	public String getPendingActivityType() {
		return pendingActivityType;
	}

	public void setPendingActivityType(String pendingActivityType) {
		this.pendingActivityType = pendingActivityType;
	}
	public Boolean getSuperEdit() {
		return superEdit;
	}
	
	public void setSuperEdit(Boolean superEdit) {
		this.superEdit = superEdit;
	}
	
	
	@Autowired
	ReliableMessageSenderService  reliableMessageSenderService;//可靠消息发送service
	
	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	
	
	public Boolean getGetAllProperties() {
		return getAllProperties;
	}

	public void setGetAllProperties(Boolean getAllProperties) {
		this.getAllProperties = getAllProperties;
	}
	
	
	public String getQueryConfig() {
		return queryConfig;
	}

	public void setQueryConfig(String queryConfig) {
		this.queryConfig = queryConfig;
	}
	
	
	public Boolean getNoQueryFlag() {
		return noQueryFlag;
	}

	public void setNoQueryFlag(Boolean noQueryFlag) {
		this.noQueryFlag = noQueryFlag;
	}
	
	public String getTemplateRelatedModelCode() {
		return templateRelatedModelCode;
	}

	public void setTemplateRelatedModelCode(String templateRelatedModelCode) {
		this.templateRelatedModelCode = templateRelatedModelCode;
	}
	
	public Map<String, Object> getCustomPropData() {
		return customPropData;
	}

	public void setCustomPropData(Map<String, Object> customPropData) {
		this.customPropData = customPropData;
	}

	public Boolean getExportAuxiliaryModelFlag() {
		return exportAuxiliaryModelFlag;
	}

	public void setExportAuxiliaryModelFlag(Boolean exportAuxiliaryModelFlag) {
		this.exportAuxiliaryModelFlag = exportAuxiliaryModelFlag;
	}
	
	public Boolean getUseForImportFlag() {
		return useForImportFlag;
	}

	public void setUseForImportFlag(Boolean useForImportFlag) {
		this.useForImportFlag = useForImportFlag;
	}
	
	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
			
	public Boolean getIsReplace() {
		return isReplace;
	}

	public void setIsReplace(Boolean isReplace) {
		this.isReplace = isReplace;
	}
	
	public Boolean getIsIgnore() {
		return isIgnore;
	}
	
	public void setIsIgnore(Boolean isIgnore) {
		this.isIgnore = isIgnore;
	}
	
	public Boolean getIsBatch() {
		return isBatch;
	}
	
	public void setIsBatch(Boolean isBatch) {
		this.isBatch = isBatch;
	}
	
	public Boolean getGraduallyReject() {
		return graduallyReject;
	}

	public void setGraduallyReject(Boolean graduallyReject) {
		this.graduallyReject = graduallyReject;
	}
	
	public void setSortResult(String sortResult){
		this.sortResult = sortResult;
	}
	
	public String getSortResult(){
		return this.sortResult;
	}
	public String getDealInfoGroup(){
		return this.dealInfoGroup;
	}
	
	public void setDealInfoGroup(String dealInfoGroup){
		this.dealInfoGroup = dealInfoGroup;
	}

	private Object[] importServices;
	
	private Object[] searchObjects;
	
	public Object[] getSearchObjects() {
		return searchObjects;
	}

	public void setSearchObjects(Object[] searchObjects) {
		this.searchObjects = searchObjects;
	}
	
	public String getUploadDocIds() {
		return uploadDocIds;
	}

	public void setUploadDocIds(String uploadDocIds) {
		this.uploadDocIds = uploadDocIds;
	}
	
	public long getTreecid() {
		return treecid;
	}

	public void setTreecid(long treecid) {
		this.treecid = treecid;
	}

	public Boolean getHasSupervision(){
		return this.hasSupervision;
	}

	public Boolean getHasPayCloseAttention() {
		return this.hasPayCloseAttention;
	}

	public long getPid() {
		return pid;
	}

	public void setPid(long pid) {
		this.pid = pid;
	}
	
	public int getCindex() {
		return cindex;
	}

	public void setCindex(int cindex) {
		this.cindex = cindex;
	}
	
	public String getPermissionCode(){
		return permissionCode;
	}
	
	public void setPermissionCode(String permissionCode){
		this.permissionCode = permissionCode;
	}
	
	public String getLayoutViewCode() {
		return layoutViewCode;
	}

	public void setLayoutViewCode(String layoutViewCode) {
		this.layoutViewCode = layoutViewCode;
	}
	
	/**
	 * @return the officeDate
	 */
	public String getOfficeDate() {
		return officeDate;
	}

	/**
	 * @param officeDate the officeDate to set
	 */
	public void setOfficeDate(String officeDate) {
		this.officeDate = officeDate;
	}
	
	/**
	 * @return the officeDeal
	 */
	public String getOfficeDeal() {
		return officeDeal;
	}

	/**
	 * @param officeDeal the officeDeal to set
	 */
	public void setOfficeDeal(String officeDeal) {
		this.officeDeal = officeDeal;
	}
	
	/**
	 * @return the sign
	 */
	public String getSign() {
		return sign;
	}

	/**
	 * @param sign the sign to set
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * @return the handSign
	 */
	public String getHandSign() {
		return handSign;
	}

	/**
	 * @param handSign the handSign to set
	 */
	public void setHandSign(String handSign) {
		this.handSign = handSign;
	}

	/**
	 * @return the signMark
	 */
	public String getSignMark() {
		return signMark;
	}

	/**
	 * @param signMark the signMark to set
	 */
	public void setSignMark(String signMark) {
		this.signMark = signMark;
	}

	/**
	 * @return the handSignMark
	 */
	public String getHandSignMark() {
		return handSignMark;
	}

	/**
	 * @param handSignMark the handSignMark to set
	 */
	public void setHandSignMark(String handSignMark) {
		this.handSignMark = handSignMark;
	}
	
	public Long getTreeId() {
		return treeId;
	}
	
	public void setTreeId(Long treeId) {
		this.treeId = treeId;
	}
	
	public String getPropertyCode() {
		return propertyCode;
	}

	public void setPropertyCode(String propertyCode) {
		this.propertyCode = propertyCode;
	}
		
	public String getUseInBusiness() {
		return useInBusiness;
	}

	public void setUseInBusiness(String useInBusiness) {
		this.useInBusiness = useInBusiness;
	}
	
	public String getListCustomCondition() {
		return listCustomCondition;
	}

	public void setListCustomCondition(String listCustomCondition) {
		this.listCustomCondition = listCustomCondition;
	}
	
	public String getListFirstCustomCond() {
		return listFirstCustomCond;
	}

	public void setListFirstCustomCond(String listFirstCustomCond) {
		this.listFirstCustomCond = listFirstCustomCond;
	}
	
	public String getViewShowType() {
		return viewShowType;
	}

	public void setViewShowType(String viewShowType) {
		this.viewShowType = viewShowType;
	}
	
	public void setViewCode(String viewCode) {
		this.viewCode = viewCode;
	}

	public String getViewCode() {
		return viewCode;
	}
	
	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	public String getDownloadType() {
		return downloadType;
	}

	public void setDownloadType(String downloadType) {
		this.downloadType = downloadType;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public Long getRefId() {
		return refId;
	}

	public void setRefId(Long refId) {
		this.refId = refId;
	}
	
	public String getXlsSize() {
		return xlsSize;
	}

	public void setXlsSize(String xlsSize) {
		this.xlsSize = xlsSize;
	}
	
	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
	
	public InputStream getInputStream() throws Exception {
		if("template".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/WOM/produceTask/produceTask/" + getFileName()));
		}else if("mainTemplate".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/WOM/produceTask/produceTask/" + getFileName()));
		}else if("mainError".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "error/WOM_7.5.0.0_produceTask_ProduceTask" + File.separator + viewCode + File.separator + time + File.separator + getFileName()));
		}else{
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "error/" + datagridCode + File.separator + time + File.separator + getFileName()));
			orgName = URLEncoder.encode(orgName, "utf-8");
		}
		return inputStream;
	}
	
	public String getFileName() {
		String returnName = null;
		if("template".equals(downloadType)){
			returnName = "importExcel-" + fileName + ".xls";
		}else if("mainTemplate".equals(downloadType)){
			returnName = fileName;
		}else if("customizeExport".equals(downloadType)){
			returnName = fileName + ".xls";
		}else{
			returnName = orgName;
		}
		return returnName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getXlsResult() {
		return xlsResult;
	}

	public void setXlsResult(String xlsResult) {
		this.xlsResult = xlsResult;
	}
	
	public File getDataFile() {
		return dataFile;
	}

	public void setDataFile(File dataFile) {
		this.dataFile = dataFile;
	}
	
	public String getDatagridName(){
		return datagridName;
	}
	
	public void setDatagridName(String datagridName){
		this.datagridName = datagridName;
	}
	
	public String getDatagridCode() {
		return datagridCode;
	}

	public void setDatagridCode(String datagridCode) {
		this.datagridCode = datagridCode;
	}

	public Boolean getDealFlag() {
		return dealFlag;
	}
	
	public Boolean getIsAllowProxy() {
 		return isAllowProxy;
 	}
 
 	public void setIsAllowProxy(Boolean isAllowProxy) {
 		this.isAllowProxy = isAllowProxy;
 	}
 	
	public void setDealSet(Integer dealSet) {
		this.dealSet = dealSet;
	}
	public Integer getDealSet() {
		return dealSet;
	}

	public void setDealFlag(Boolean dealFlag) {
		this.dealFlag = dealFlag;
	}
	
	public Boolean getMainContent() {
		return mainContent;
	}

	public void setMainContent(Boolean mainContent) {
		this.mainContent = mainContent;
	}
	
	public Boolean getAttachmentInfo() {
		return attachmentInfo;
	}

	public void setAttachmentInfo(Boolean attachmentInfo) {
		this.attachmentInfo = attachmentInfo;
	}
	
	public Boolean getDealInfo() {
		return dealInfo;
	}

	public void setDealInfo(Boolean dealInfo) {
		this.dealInfo = dealInfo;
	}

	@Autowired
	public void setUserFieldPermissionService(IUserFieldPermissionService userFieldPermissionService) {
		this.userFieldPermissionService = userFieldPermissionService;
	}

	public void setPendingBeginDate(String pendingBeginDate) {
		this.pendingBeginDate = pendingBeginDate;
	}
	
	public String getPendingBeginDate() {
		return pendingBeginDate;
	}
	
	public void setPendingEndDate(String pendingEndDate) {
		this.pendingEndDate = pendingEndDate;
	}
	
	public String getPendingEndDate() {
		return pendingEndDate;
	}
	
	public void setShowNumber(int showNumber) {
		this.showNumber = showNumber;
	}
	
	private String dataTableSortColKey;
	private String dataTableSortColName;
	private String dataTableSortColOrder;
	
	public String getDataTableSortColKey() {
		return dataTableSortColKey;
	}
	
	public void setDataTableSortColKey(String dataTableSortColKey) {
		this.dataTableSortColKey = dataTableSortColKey;
	}
	
	public String getDataTableSortColName() {
		return dataTableSortColName;
	}
	
	public void setDataTableSortColName(String dataTableSortColName) {
		this.dataTableSortColName = dataTableSortColName;
	}
	
	public String getDataTableSortColOrder() {
		return dataTableSortColOrder;
	}
	
	public void setDataTableSortColOrder(String dataTableSortColOrder) {
		this.dataTableSortColOrder = dataTableSortColOrder;
	}
	
	public Boolean getFlowBulkFlag() {
		return flowBulkFlag;
	}
	public void setFlowBulkFlag(Boolean flowBulkFlag) {
		this.flowBulkFlag = flowBulkFlag;
	}
	
	public String getPendingIds() {
		return pendingIds;
	}
	public void setPendingIds(String pendingIds) {
		this.pendingIds = pendingIds;
	}
	public String getOutcomeStr() {
		return outcomeStr;
	}
	public void setOutcomeStr(String outcomeStr) {
		this.outcomeStr = outcomeStr;
	}
	
	public void setRt(String rt) {
		this.rt = rt;
	}
	public String getScriptCode() {
		return scriptCode;
	}

	public void setScriptCode(String scriptCode) {
		this.scriptCode = scriptCode;
	}
	
	public String getTableProcessKey() {
		return tableProcessKey;
	}

	public void setTableProcessKey(String tableProcessKey) {
		this.tableProcessKey = tableProcessKey;
	}

	public String getWorkFlowVarStatus() {
		return workFlowVarStatus;
	}

	private void hangUpRedirect() throws Exception {
		List<View> views = ViewServiceFoundation.findViewsByEntityCode(entityCode, ViewType.LIST);
		View mainListView = null;
		if (views != null && !views.isEmpty()) {
			for (View view : views) {
				mainListView = view;
				if (view.getUsedForWorkFlow()) {
					break;
				}
			}
		}
		if(mainListView != null) {
			String url = "/foundation/user/open-pending.action?tableInfoId=" + tableInfoId + "&id=" + id + "&entityCode=" + entityCode + "&__pc__=" + new String(OrchidUtils.encode((mainListView.getCode() + "_self|").getBytes()));
			response.sendRedirect(url);
		}
	}

	public void setWorkFlowVarStatus(String workFlowVarStatus) {
		this.workFlowVarStatus = workFlowVarStatus;
		if(workFlowVar!=null){
			workFlowVar.setOutcomeType(workFlowVarStatus);
		}
	}

	private String workFlowMenuCode;
	
	public String getWorkFlowMenuCode() {
		return workFlowMenuCode;
	}

	public void setWorkFlowMenuCode(String workFlowMenuCode) {
		this.workFlowMenuCode = workFlowMenuCode;
	}
	private String entityCode;
	private List<WOMProduceTask> produceTasks;
	
	public List<WOMProduceTask> getProduceTasks() {
		return produceTasks;
	}
	public String getEntityCode() {
		return entityCode;
	}
	public void setEntityCode(String entityCode) {
		this.entityCode = entityCode;
	}
	private String viewselect;
	public void setViewselect(String viewselect) {
		this.viewselect = viewselect;
	}
	public String getViewselect() {
		return viewselect;
	}
	public String getRefUrl() {
		return refUrl;
	}

	public void setRefUrl(String refUrl) {
		this.refUrl = refUrl;
	}
	
	public String getClassifyCodes() {
		return classifyCodes;
	}

	public void setClassifyCodes(String classifyCodes) {
		this.classifyCodes = classifyCodes;
	}
	
	public void setCallBackFuncName(String callBackFuncName) {
		this.callBackFuncName = callBackFuncName;
	}
	public String getCallBackFuncName() {
		return this.callBackFuncName;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getCondition() {
		return this.condition;
	}
	public String getRetJson() {
		return retJson;
	}
	public void setIncludes(String includes) {
		this.includes = includes;
	}

	private Page<WOMProduceTask> page;
	
	private Long tableInfoId;
	private Integer dealDefaulCount=50;
	
	private Boolean expandDealInof=true;
	
	 @Resource
	 private BusinessCenterService businessCenterService;
	 
	 @Resource
	 private ModelServiceFoundation modelServiceFoundation;
	 
	 @Resource
	 private ViewServiceFoundation ViewServiceFoundation;
	 
	 @Resource
	 private  IViewServiceFoundation iViewServiceFoundation;
	 
	 private List<BusinessCenter> businessCenterList;
	 
	 public List<BusinessCenter> getBusinessCenterList() {
			return businessCenterList;
	}
	public void setBusinessCenterList(List<BusinessCenter> businessCenterList) {
		this.businessCenterList = businessCenterList;
	}
	public  BusinessCenter businessCenter;
	private Long mainBusinessId;
	private String businessCenterCode;
	private String businessParam;
	
	public String getBusinessParam() {
		return businessParam;
	}
	public void setBusinessParam(String businessParam) {
		this.businessParam = businessParam;
	}
	public String getBusinessCenterCode() {
		return businessCenterCode;
	}
	public void setBusinessCenterCode(String businessCenterCode) {
		this.businessCenterCode = businessCenterCode;
	}
	public Long getMainBusinessId() {
		return mainBusinessId;
	}
	public void setMainBusinessId(Long mainBusinessId) {
		this.mainBusinessId = mainBusinessId;
	}
	public BusinessCenter getBusinessCenter() {
		return businessCenter;
	}
	public void setBusinessCenter(BusinessCenter businessCenter) {
		this.businessCenter = businessCenter;
	}
	
	private List<Object[]> dealInfoData;
	
	private Boolean groupByTask = false;
	private Map<String, List<Object[]>> dealInfoDataMap;
	
	/**
	 * @return the dealInfoDataMap
	 */
	public Map<String, List<Object[]>> getDealInfoDataMap() {
		return dealInfoDataMap;
	}

	/**
	 * @param dealInfoDataMap the dealInfoDataMap to set
	 */
	public void setDealInfoDataMap(Map<String, List<Object[]>> dealInfoDataMap) {
		this.dealInfoDataMap = dealInfoDataMap;
	}
	
	/**
	 * @return the groupByTask
	 */
	public Boolean getGroupByTask() {
		return groupByTask;
	}

	/**
	 * @param groupByTask the groupByTask to set
	 */
	public void setGroupByTask(Boolean groupByTask) {
		this.groupByTask = groupByTask;
	}
	
	public List<Object[]> getDealInfoData() {
		return dealInfoData;
	}

	public void setDealInfoData(List<Object[]> dealInfoData) {
		this.dealInfoData = dealInfoData;
	}
	
	public Integer getDealDefaulCount() {
		return dealDefaulCount;
	}

	public void setDealDefaulCount(Integer dealDefaulCount) {
		this.dealDefaulCount = dealDefaulCount;
	}
	
	public Boolean getExpandDealInof() {
		return expandDealInof;
	}

	public void setExpandDealInof(Boolean expandDealInof) {
		this.expandDealInof = expandDealInof;
	}
	
	@Override
	public void prepare() throws Exception {
		if (null == id) {
			produceTask = new WOMProduceTask();
			if(produceTask.getAutoReportOnFinish() != null) {
				produceTask.setAutoReportOnFinish((SystemCode) systemCodeService.getSystemCode(produceTask.getAutoReportOnFinish().getId()));
			}
			if(produceTask.getBatchTaskState() != null) {
				produceTask.setBatchTaskState((SystemCode) systemCodeService.getSystemCode(produceTask.getBatchTaskState().getId()));
			}
			if(produceTask.getPackageType() != null) {
				produceTask.setPackageType((SystemCode) systemCodeService.getSystemCode(produceTask.getPackageType().getId()));
			}
			if(produceTask.getTaskState() != null) {
				produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode(produceTask.getTaskState().getId()));
			}
			if(produceTask.getTaskType() != null) {
				produceTask.setTaskType((SystemCode) systemCodeService.getSystemCode(produceTask.getTaskType().getId()));
			}
			if(produceTask.getTeam() != null) {
				produceTask.setTeam((SystemCode) systemCodeService.getSystemCode(produceTask.getTeam().getId()));
			}
			if(produceTask.getWorkType() != null) {
				produceTask.setWorkType((SystemCode) systemCodeService.getSystemCode(produceTask.getWorkType().getId()));
			}
		} else {
			if(id > 0){
				produceTask = produceTaskService.getProduceTask(id, viewCode);
				if(tableInfoId == null && produceTask != null){
					tableInfoId = produceTask.getTableInfoId();
				}
			}
		}
		if(null!=businessCenterCode){
			businessCenter=businessCenterService.getBusinessCenter(businessCenterCode);
		}
	}
	
	public Page<WOMProduceTask> getPage() {
		if (null == page) {
			page = new Page<WOMProduceTask>(1, (getIsMobile() ? 10 : 20));
		}
		return page;
	}
	public Long getTableInfoId(){return this.tableInfoId;}
	public void setTableInfoId(Long tableInfoId){this.tableInfoId = tableInfoId;}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getExportFetchDataMethod() {
		return exportFetchDataMethod;
	}
	public void setExportFetchDataMethod(String exportFetchDataMethod) {
		this.exportFetchDataMethod = exportFetchDataMethod;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public WOMProduceTask getProduceTask() {
		return produceTask;
	}		

	public void setProduceTask(WOMProduceTask produceTask) {
		this.produceTask = produceTask;
	}

	public boolean getNotifyEnabled() {
		return notificationService.notifyEnabled();
	}

	/**
	 * 根据ID，返回需要的内容
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
	@Action(value = "/WOM/produceTask/produceTask/get", results = { @Result(type = JSON_PLAIN, params = { "root", "retJson" }) })
	public String _get() throws Exception{
		if(id == null) {
			return SUCCESS;
		}
		retJson = produceTaskService.getProduceTaskAsJSON(id, includes);
		return SUCCESS;
	}
	/**
	 * 根据ID，返回大字段内容
	 * 
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
	@Action(value = "/WOM/produceTask/produceTask/edit-extra-col")
	public String _editExtraCol() throws Exception{
		Struts2Utils.renderXml("");
	
		return null;
	}
	
	@Resource
	private CompanyService _companyService;
	/** 部门公选页面，公司切换列表 */
	private List<Company> companyList = new ArrayList<Company>();
	/** 部门公选页面，进行公司切换时，传递公司id */
	private Long companyId;
	
	/**
	 * @return the companyId
	 */
	public Long getCompanyId() {
		return companyId;
	}

	/**
	 * @param companyId the companyId to set
	 */
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	/**
	 * @return the companyList
	 */
	public List<Company> getCompanyList() {
		return companyList;
	}

	/**
	 * @param companyList the companyList to set
	 */
	public void setCompanyList(List<Company> companyList) {
		this.companyList = companyList;
	}
	/**
	 * WOM.modelname.randon1489657901718
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
		public String produceTaskReferenceCopy() throws Exception{
			WOMProduceTask oldProduceTask = null;
			if(isEditNew()){
				this.creatorInfo = creatorService.getCurrent();
				if (null == pendingId && null != deploymentId) {
					transitions = processService.findFirstTransitions(deploymentId);
					Deployment d = processService.getDeployment(deploymentId);
					if(transitions!=null&&transitions.size()>0){
						Activity activity=transitions.get(0).getSource();
						//dealFlag=processService.getActivityDealFlag(d.getProcessDefinitionId(), activity.getName());
						Map<String,Object> activeMap = processService.getActivityMap(d.getProcessDefinitionId(), activity.getName());
						dealFlag=(Boolean)activeMap.get("dealFlag");
						dealSet=(Integer)activeMap.get("dealSet");
						webSignetFlag = (Boolean)activeMap.get("webSignetFlag");
					}
				}
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						bc.setUrl("");
						bc.setCount(0);
					}
				}
				oldProduceTask = new WOMProduceTask();
			}else{
			//WOMProduceTask produceTask = produceTaskService.getProduceTask(this.produceTask.getId());
			this.creatorInfo = creatorService.get(produceTask.getCreateStaffId(), produceTask.getCreatePositionId(), produceTask.getCreateDepartmentId());
			//setProduceTask(produceTask);
			if (null != pendingId) {
				pending = taskService.getPending(pendingId);
				if (null == pending) {
					throw new WorkFlowException(Code.PENDING_NOT_FOUND);
				}
				if(pending.getStatus() == 77) {
					hangUpRedirect();
					return null;
				}
				deploymentId = pending.getDeploymentId();
				if (!pending.getTableInfoId().equals(produceTask.getTableInfoId())) {
					throw new WorkFlowException("Illegal opertion:the pending's tableinfo not equals the model's.");
				}
				/*
				if (!pending.getUserId().equals(creatorService.getStaffFromSession().getUser().getId())) {
					throw new WorkFlowException("Illegal opertion:this is not your pending.");
				}
				*/
				transitions = taskService.findTransitions(pending);
				//dealFlag=processService.getActivityDealFlag(pending.getProcessId(), pending.getActivityName());
				Map<String,Object> activeMap=processService.getActivityMap(pending.getProcessId(), pending.getActivityName());
				dealFlag=(Boolean)activeMap.get("dealFlag");
				dealSet=(Integer)activeMap.get("dealSet");
				webSignetFlag = (Boolean)activeMap.get("webSignetFlag");
				if (activeMap.get("loopFlag") != null) {
					pending.setLoop((Integer) activeMap.get("loopFlag"));
				}
			}
			if(null!=entityCode){
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						//String url=businessCenterService.getBusinessUrl(bc,produceTask.getId().toString());
						String url = bc.getAssview().getUrl();
						int count=businessCenterService.getBusinessCount(bc, produceTask.getId());
						//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
						bc.setViewCode(bc.getAssview().getCode());
						bc.setUrl(url);
						bc.setCount(count);
					}
				}
				}
				oldProduceTask = produceTaskService.getProduceTask(id);
			}
			
			//查询临时处理意见
			if(pending != null && pending.getActivityName() != null && !pending.getActivityName().isEmpty()){
				String ctype = "TEMP_DEALINFO_" + oldProduceTask.getProcessKey() + "_" + pending.getActivityName() + "_WOM_7.5.0.0_produceTask_" + oldProduceTask.getId();
				List<ICookie> cookieList = cookieService.findCookieByCriteria(Restrictions.eq("user", getCurrentUser()), Restrictions.eq("type", ctype));
				Cookie dc = null;
				if(cookieList != null && !cookieList.isEmpty()){
					dc = (Cookie) cookieList.get(0);
					if(workFlowVar == null){
						workFlowVar = new WorkFlowVar();
					}
					workFlowVar.setComment(dc.getValue());
				}
			}
			
			produceTask = produceTaskService.getProduceTask(refId);
			produceTask.setPending(pending);
			Model model = modelServiceFoundation.getModel("WOM_7.5.0.0_produceTask_ProduceTask");
			List<Property> pros = modelServiceFoundation.findProperties(model);
			for(Property p : pros){
				if((p.getIsBussinessKey()!=null&&p.getIsBussinessKey())||(p.getIsInherent()!=null&&p.getIsInherent())){
					String setMethod = "set" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					String getMethod = "get" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					try{
						Method getValue = WOMProduceTask.class.getMethod(getMethod, null);
						Class returnType = getValue.getReturnType();
						Object gValue = getValue.invoke(oldProduceTask, null);
						Method setValue = WOMProduceTask.class.getMethod(setMethod, new Class[]{returnType});
						setValue.invoke(produceTask, gValue);
					}catch(Exception e){
						logger.debug(e.getMessage());
					}
				}
			}
			produceTask.setCreateDepartmentId(oldProduceTask.getCreateDepartmentId());
			produceTask.setCreatePositionId(oldProduceTask.getCreatePositionId());
			produceTask.setCreateStaffId(oldProduceTask.getCreateStaffId());
			produceTask.setOwnerDepartmentId(oldProduceTask.getOwnerDepartmentId());
			produceTask.setOwnerPositionId(oldProduceTask.getOwnerPositionId());
			produceTask.setOwnerStaffId(oldProduceTask.getOwnerStaffId());
			produceTask.setId(null);	//参考复制时，将上游id去掉
			bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "referenceCopy");
			if(null != transitions && !transitions.isEmpty()){
				rejectTransitions = new LinkedList<Transition>();
				nomalTransitions = new LinkedList<Transition>();
				for(Transition t : transitions){
					if(t.getReject() > 0){
						rejectTransitions.add(t);
					} else {
						nomalTransitions.add(t);
					}
				}
			}
			return SUCCESS;
		}
	
	
	/**
	 *  编辑视图公用主方法
	 */
	String calltype;
	public String getCalltype() {
		return calltype;
	}

	public void setCalltype(String calltype) {
		this.calltype = calltype;
	}
	@Actions({
		
		@Action(value = "/WOM/produceTask/produceTask/adjustActiveEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "adjustActiveEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/adjustActiveEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "adjustActiveEditPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/chPackageEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "chPackageEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/chPackageEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "chPackageEditPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/makeTaskEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskEditPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskEditforJS",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskEditforJS.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/makeTaskEditforJSPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskEditforJSPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/otherTaskEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "otherTaskEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/otherTaskEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "otherTaskEditPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/packageTaskEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "packageTaskEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/packageTaskEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "packageTaskEditPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "recycleTaskEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "recycleTaskEditPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/reProcessEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reProcessEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/reProcessEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reProcessEditPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/reWorkEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reWorkEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/reWorkEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reWorkEditPrint.ftl")})
	})
	public String viewEdit() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View printView = viewServiceFoundation.getView(viewCode);
		String printName=request.getRequestURI().replaceAll("^.*/"+printView.getName(),"").replaceAll(".action$", "");
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=produceTaskService.findValidateDatagrids(getDgClassMap(),viewCode);
		if (null != entityCode) {
			businessCenterList = businessCenterService.getBusinessCenters(entityCode);
		}
		if(refId !=null && refId > 0){
			return produceTaskReferenceCopy();
		}
		if(isEditNew()){
			this.creatorInfo = creatorService.getCurrent();
			if (null == pendingId && null != deploymentId) {
				transitions = processService.findFirstTransitions(deploymentId);
				Deployment d = processService.getDeployment(deploymentId);
				if(produceTask!=null){
						produceTask.setProcessKey(d.getProcessKey());
						produceTask.setProcessVersion(d.getProcessVersion());
					}
				if(transitions!=null&&transitions.size()>0){
					Activity activity=transitions.get(0).getSource();
					//dealFlag=processService.getActivityDealFlag(d.getProcessDefinitionId(), activity.getName());
					Map<String,Object> activeMap=processService.getActivityMap(d.getProcessDefinitionId(), activity.getName());
					dealFlag=(Boolean)activeMap.get("dealFlag");
					dealSet=(Integer)activeMap.get("dealSet");
					activityName = (String) activeMap.get("activityName");
					taskDescription = (String) activeMap.get("taskDescription");
					webSignetFlag = (Boolean)activeMap.get("webSignetFlag");
				}
			}
			if (null != businessCenterList && !businessCenterList.isEmpty()) {
				for(BusinessCenter bc:businessCenterList){
					bc.setUrl("");
					bc.setCount(0);
				}
			}
		} else {
			produceTask = produceTaskService.getProduceTask(this.produceTask.getId(), viewCode);
			this.creatorInfo = creatorService.get(produceTask.getCreateStaffId(), produceTask.getCreatePositionId(), produceTask.getCreateDepartmentId());
			//setProduceTask(produceTask);
			if (null != pendingId) {
				pending = taskService.getPending(pendingId);
				if (null == pending) {
					throw new WorkFlowException(Code.PENDING_NOT_FOUND);
				}
				if(pending.getStatus() == 77) {
					hangUpRedirect();
					return null;
				}
				deploymentId = pending.getDeploymentId();
				if (!pending.getTableInfoId().equals(produceTask.getTableInfoId())) {
					throw new WorkFlowException("Illegal opertion:the pending's tableinfo not equals the model's.");
				}
				/*
				if (!pending.getUserId().equals(creatorService.getStaffFromSession().getUser().getId())) {
					throw new WorkFlowException("Illegal opertion:this is not your pending.");
				}
				*/
				Task task = taskService.getTask(pending.getActivityName(), pending.getDeploymentId());
				isAllowProxy = task.getIsAllowProxy();
				transitions = taskService.findTransitions(pending);
				Deployment deployment = taskService.getDeployment(deploymentId);
				graduallyReject = deployment.getGraduallyReject();
				if(graduallyReject != null && graduallyReject){
					Date date = null;
					Transition t = null;
					List<Transition> tss = new ArrayList<Transition>();
					for(Transition ts : transitions){
						if(ts.getReject() == 1){
							tss.add(ts);
							if(date == null){
								date = produceTaskService.findLastDealInfo(tableInfoId, ts.getDestination().getName());
								t = ts;
							}else{
								Date d = produceTaskService.findLastDealInfo(tableInfoId, ts.getDestination().getName());
								if(d != null && d.after(date)){
									date = d;
									t = ts;
								}
							}
						}
					}
					transitions.removeAll(tss);
					if(t!=null){
						transitions.add(t);
					}
				}
				//dealFlag=processService.getActivityDealFlag(pending.getProcessId(), pending.getActivityName());
				Map<String,Object> activeMap=processService.getActivityMap(pending.getProcessId(), pending.getActivityName());
				dealFlag=(Boolean)activeMap.get("dealFlag");
				dealSet=(Integer)activeMap.get("dealSet");
				activityName = (String) activeMap.get("activityName");
				taskDescription = (String) activeMap.get("taskDescription");
				webSignetFlag = (Boolean)activeMap.get("webSignetFlag");
				if (activeMap.get("loopFlag") != null) {
					pending.setLoop((Integer) activeMap.get("loopFlag"));
				}
				produceTask.setPending(pending);
			}

			//查询临时处理意见
			if(pending != null && pending.getActivityName() != null && !pending.getActivityName().isEmpty()){
				String ctype = "TEMP_DEALINFO_" + produceTask.getProcessKey() + "_" + pending.getActivityName() + "_WOM_7.5.0.0_produceTask_" + produceTask.getId();
				List<ICookie> cookieList = cookieService.findCookieByCriteria(Restrictions.eq("user", getCurrentUser()), Restrictions.eq("type", ctype));
				Cookie dc = null;
				if(cookieList != null && !cookieList.isEmpty()){
					dc = (Cookie) cookieList.get(0);
					if(workFlowVar == null){
						workFlowVar = new WorkFlowVar();
					}
					workFlowVar.setComment(dc.getValue());
				}
			}

			List<WOMProduceTask> tmpList = new ArrayList<>();
			tmpList.add(produceTask);
			produceTaskService.getTableInfoStatus(tmpList, null != pendingId, deploymentId);
			
			hasSupervision = produceTaskService.existsSupervision(tableInfoId, getCurrentStaff().getId());
			if(null!=entityCode){
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						//String url=businessCenterService.getBusinessUrl(bc,produceTask.getId().toString());
						String url = bc.getAssview().getUrl();
						int count=businessCenterService.getBusinessCount(bc, produceTask.getId());
						//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
						bc.setViewCode(bc.getAssview().getCode());
						bc.setUrl(url);
						bc.setCount(count);
					}
				}
			}
			
		}
		bapAfterCustomMethod(viewCode, viewName);
		if(null != transitions && !transitions.isEmpty()){
			rejectTransitions = new LinkedList<Transition>();
			nomalTransitions = new LinkedList<Transition>();
			for(Transition t : transitions){
				if(t.getReject() > 0){
					rejectTransitions.add(t);
				} else {
					nomalTransitions.add(t);
				}
			}
		}
		if(null != printName && !printName.equals("")){
			produceTaskService.print(0);
		}
		return SUCCESS;
	}
	
	
	/**
	 *  查看视图公用主方法
	 */
	@Actions({
		
		@Action(value = "/WOM/produceTask/produceTask/changePackageView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "changePackageView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/changePackageViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "changePackageViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/chPackageView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "chPackageView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/chPackageViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "chPackageViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/makeExcutView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeExcutView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/makeExcutViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeExcutViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskOperaView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskOperaView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/makeTaskOperaViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskOperaViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/makeTaskViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "makeTaskViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/otherTaskView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "otherTaskView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/otherTaskViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "otherTaskViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/packageTaskView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "packageTaskView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/packageTaskViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "packageTaskViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "recycleTaskView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "recycleTaskViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/reProcessView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reProcessView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/reProcessViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reProcessViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/reWorkView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reWorkView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/reWorkViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "reWorkViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/taskExecRecordView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "taskExecRecordView.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/taskExecRecordViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "taskExecRecordViewPrint.ftl")})
		,
		@Action(value = "/WOM/produceTask/produceTask/tempActiveEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "tempActiveEdit.ftl") }),
		@Action(value = "/WOM/produceTask/produceTask/tempActiveEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "tempActiveEditPrint.ftl")})
	})
	public String viewView() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View printView = viewServiceFoundation.getView(viewCode);
		String printName=request.getRequestURI().replaceAll("^.*/"+printView.getName(),"").replaceAll(".action$", "");
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=produceTaskService.findValidateDatagrids(getDgClassMap(),viewCode);
		produceTask = produceTaskService.getProduceTask(this.produceTask.getId(), viewCode);

		this.creatorInfo = creatorService.get(produceTask.getCreateStaffId(), produceTask.getCreatePositionId(), produceTask.getCreateDepartmentId());
		//setProduceTask(produceTask);
		if (null != pendingId) {
			pending = taskService.getPending(pendingId);
			if (null == pending) {
				throw new WorkFlowException(Code.PENDING_NOT_FOUND);
			}
			if(pending.getStatus() == 77) {
				hangUpRedirect();
				return null;
			}
			deploymentId = pending.getDeploymentId();
			if (!pending.getTableInfoId().equals(produceTask.getTableInfoId())) {
				throw new WorkFlowException("Illegal opertion:the pending's tableinfo not equals the model's.");
			}
			/*
			if (!pending.getUserId().equals(creatorService.getStaffFromSession().getUser().getId())) {
				throw new WorkFlowException("Illegal opertion:this is not your pending.");
			}
			*/
			Task task = taskService.getTask(pending.getActivityName(), pending.getDeploymentId());
 			isAllowProxy = task.getIsAllowProxy();
			transitions = taskService.findTransitions(pending);
			Deployment deployment = taskService.getDeployment(deploymentId);
			graduallyReject = deployment.getGraduallyReject();
			if(graduallyReject != null && graduallyReject){
				Date date = null;
				Transition t = null;
				List<Transition> tss = new ArrayList<Transition>();
				for(Transition ts : transitions){
					if(ts.getReject() == 1){
						tss.add(ts);
						if(date == null){
							date = produceTaskService.findLastDealInfo(tableInfoId, ts.getDestination().getName());
							t = ts;
						}else{
							Date d = produceTaskService.findLastDealInfo(tableInfoId, ts.getDestination().getName());
							if(d != null && d.after(date)){
								date = d;
								t = ts;
							}
						}
					}
				}
				transitions.removeAll(tss);
				if(t!=null){
					transitions.add(t);
				}
			}
			//dealFlag=processService.getActivityDealFlag(pending.getProcessId(), pending.getActivityName());
			Map<String,Object> activeMap=processService.getActivityMap(pending.getProcessId(), pending.getActivityName());
			dealFlag=(Boolean)activeMap.get("dealFlag");
			dealSet=(Integer)activeMap.get("dealSet");
			activityName = (String) activeMap.get("activityName");
			taskDescription = (String) activeMap.get("taskDescription");
			webSignetFlag = (Boolean)activeMap.get("webSignetFlag");
			if (activeMap.get("loopFlag") != null) {
				pending.setLoop((Integer) activeMap.get("loopFlag"));
			}
			produceTask.setPending(pending);
		}

		//查询临时处理意见
		if(pending != null && pending.getActivityName() != null && !pending.getActivityName().isEmpty()){
			String ctype = "TEMP_DEALINFO_" + produceTask.getProcessKey() + "_" + pending.getActivityName() + "_WOM_7.5.0.0_produceTask_" + produceTask.getId();
			List<ICookie> cookieList = cookieService.findCookieByCriteria(Restrictions.eq("user", getCurrentUser()), Restrictions.eq("type", ctype));
			Cookie dc = null;
			if(cookieList != null && !cookieList.isEmpty()){
				dc = (Cookie) cookieList.get(0);
				if(workFlowVar == null){
					workFlowVar = new WorkFlowVar();
				}
				workFlowVar.setComment(dc.getValue());
			}
		}
		
		List<WOMProduceTask> tmpList = new ArrayList<>();
		tmpList.add(produceTask);
		produceTaskService.getTableInfoStatus(tmpList, null != pendingId, deploymentId);

		hasSupervision = produceTaskService.existsSupervision(tableInfoId, getCurrentStaff().getId());
		if(null!=entityCode){
			businessCenterList = businessCenterService.getBusinessCenters(entityCode);
			for(BusinessCenter bc:businessCenterList){
				//String url=businessCenterService.getBusinessUrl(bc,produceTask.getId().toString());
				String url = bc.getAssview().getUrl();
				int count=businessCenterService.getBusinessCount(bc, produceTask.getId());
				//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
				bc.setViewCode(bc.getAssview().getCode());
				bc.setUrl(url);
				bc.setCount(count);
			}
		}
		bapAfterCustomMethod(viewCode, viewName);
		if(null != transitions && !transitions.isEmpty()){
			rejectTransitions = new LinkedList<Transition>();
			nomalTransitions = new LinkedList<Transition>();
			for(Transition t : transitions){
				if(t.getReject() > 0){
					rejectTransitions.add(t);
				} else {
					nomalTransitions.add(t);
				}
			}
		}
		if(null != printName && !printName.equals("")){
			produceTaskService.print(0);
		}
		return SUCCESS;
	}
	
	/**
	 *  列表视图公用主方法
	 */
	@Actions({
		
		@Action(value = "/WOM/produceTask/produceTask/changePackageList", results = { @Result(type = FREEMARKER, location = "changePackageList.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/generalManageView", results = { @Result(type = FREEMARKER, location = "generalManageView.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/makeExcutList", results = { @Result(type = FREEMARKER, location = "makeExcutList.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskList", results = { @Result(type = FREEMARKER, location = "makeTaskList.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/otherTaskList", results = { @Result(type = FREEMARKER, location = "otherTaskList.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/packageTaskList", results = { @Result(type = FREEMARKER, location = "packageTaskList.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskList", results = { @Result(type = FREEMARKER, location = "recycleTaskList.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/reProcessList", results = { @Result(type = FREEMARKER, location = "reProcessList.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/reWorkList", results = { @Result(type = FREEMARKER, location = "reWorkList.ftl") })
	})
	public String viewList() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=produceTaskService.findValidateDatagrids(getDgClassMap(),viewCode);
		userId = creatorService.getStaffFromSession().getUser().getId();
		//mainViewPath = "/WOM/produceTask/produceTask/makeTaskOperaView.action";
		mainViewPath=produceTaskService.findMainViewPath();
		if(null != workFlowMenuCode && !"".equals(workFlowMenuCode)){
			String processKey = produceTaskService.getWorkFlowInfo(workFlowMenuCode);
			if(processKey != null && processKey.length() > 0){
				flowBulkFlag = processService.checkFlowbullkFlag(processKey);
			}
		}else if(null != processKey && processKey.length() > 0){
			flowBulkFlag = processService.checkFlowbullkFlag(processKey);
		}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			businessParam=businessCenterService.getBusinessParamUrl(businessCenterCode, mainBusinessId.toString());
		}
		bapAfterCustomMethod(viewCode, viewName);
		return SUCCESS;
	}
	
	/**
	 *  布局视图公用主方法
	 */
	public String viewLayout() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		bapBeforeCustomMethod(viewCode, viewName);
		View layoutView = ViewServiceFoundation.getView(viewCode);
		Map confMap = layoutView.getExtraView().getConfigMap();
		if (confMap != null) {
			Map layoutMap = (Map) confMap.get("layout");
			if (layoutMap != null) {
				for (Object key : layoutMap.keySet()) {
					Map lay = (Map) layoutMap.get(key);
					if (lay.get("ctype") != null
							&& lay.get("ctype").equals("tree")) {
						if (lay.get("tree_model") != null
								&& (lay.get("tree_model")
										.equals("sysbase_1.0_department_base_department")
									|| lay.get("tree_model")
										.equals("sysbase_1.0_position_base_position"))) {
							if (lay.get("tree_crossCompanyFlag") != null
									&& lay.get("tree_crossCompanyFlag").equals("yes")) {
								companyList = new ArrayList<Company>();
								Company currentCompany;
								if (companyId == null || companyId.equals("")) {
									currentCompany = (Company) session.get("company");
								} else {
									currentCompany = _companyService.load(companyId);
								}
								List<Company> list = _companyService.getAllUnitCompanies();
								if (currentCompany.getType().equals(CompanyType.GROUP)) {
									companyList.add(0, (Company) _companyService.getGroupCompany());
								}
								companyList.addAll(list);
							}
						}
					}
				}
			}
		}
		bapAfterCustomMethod(viewCode, viewName);
		return SUCCESS;
	}
	
	/**
	 *  助记码视图公用主方法
	 */

	public String mneClient() throws Exception {
		if(request.getAttribute("ViewCode")==null){
			return null;
		}
		String mneViewCode = request.getAttribute("ViewCode").toString();
		if (null == mneViewCode || "".equals(mneViewCode)) {
			return null;
		}
		this.params = new ArrayList<Param>();
		bapBeforeCustomMethod(mneViewCode, "mneClient");
		String searchContent = null;
		String isCrossCompany = "";
		StringBuilder conditionStr = new StringBuilder();
		Map mnecodeset=null;
		StringBuffer sb = new StringBuffer("id");
		View MneView=ViewServiceFoundation.getView(mneViewCode);
		if (null == MneView) {
			return null;
		}
		Map confMap=MneView.getExtraView().getConfigMap();
		Map layoutMap = (Map) confMap.get("layout");
		List<Map> ls = (List<Map>) layoutMap.get("sections");
		for(Map lm:ls){
			List<Map> lc = (List<Map>) lm.get("cells");
			for(Map lk:lc){
				sb.append(",").append(lk.get("key"));
			}
			mnecodeset=(Map)lm.get("mnecodeset");
		}
		if(showNumber <= 0&&mnecodeset!=null&&mnecodeset.get("showNumber")!=null) {
			showNumber = Integer.valueOf(mnecodeset.get("showNumber").toString());
		}
		String[] params,columns;
		columns = sb.toString().split(",");
		String[] searchContents = request.getParameterValues("searchContent");
		boolean customerRule = false;
		if (null != searchContents && searchContents.length > 0) {
			searchContent = searchContents[0];
			if(searchContent.isEmpty()){
				searchContent = "*";
			}
			if(searchContent.contains("*")){
				customerRule = true;
			}
			searchContent = com.supcon.orchid.utils.StringUtils.escape(searchContent);
			searchContent = searchContent.toLowerCase();
		}
		
		params = request.getParameterValues("conditionParams");
		if(null != params && params.length > 0) {
			if(!"".equals(params[0]) && params[0].trim().length() > 0) {
				conditionStr.append(" AND (").append(params[0]).append(")");
			}
		}
		Boolean cross = false;
		String[] isCrossCompanys = request.getParameterValues("isCrossCompany");
		if (null != isCrossCompanys && isCrossCompanys.length > 0) {
			isCrossCompany = isCrossCompanys[0];
			if(null != isCrossCompany && "true".equals(isCrossCompany)) {
				cross = true;
			}
		}
		String refViewCode=request.getParameter("refViewCode");
		String currentViewCode=request.getParameter("currentViewCode");
		if (refViewCode != null && refViewCode.trim().length() > 0) {
			View refView = ViewServiceFoundation.getView(refViewCode);
		    if(null!=refView&&ShowType.LAYOUT2.equals(refView.getShowType()))  {
		    	//布局视图取其中的片段的自定义条件,但权限还是根据布局视图
				Map configMap = ViewServiceFoundation.getExtraViewFullConfigMap(refView);
				Map layout = (Map) configMap.get("layout");
				if (layout != null && !layout.isEmpty()) {
					Map center = (Map) layout.get("center");
					if (center != null && !center.isEmpty()) {
					    if(null!=center.get("vcode"))  {
							String listCode = center.get("vcode").toString();
							if (null != listCode && !listCode.isEmpty()) {
								generateCustomerCondition(listCode);
							}
						}
					}
				}
			}else {
				generateCustomerCondition(refViewCode);
			}
		} else if (currentViewCode != null && currentViewCode.trim().length() > 0) {
			generateCustomerCondition(currentViewCode);
		} else {
			generateCustomerCondition(mneViewCode);
		}
		String currentSqlType=request.getParameter("currentSqlType");
		String realPermissionCode=request.getParameter("realPermissionCode");
		
		
		if (mnecodeset != null
				&& "true".equals(mnecodeset.get("isTransCondition").toString())
				&& mnecodeset.get("conditionContent") != null
				&& !"".equals(mnecodeset.get("conditionContent").toString()
						.trim())) {
			conditionStr.append(" AND ("+mnecodeset.get("conditionContent").toString()+")");
		}
		try {
			List<Object[]> list = null;
			if(customerRule){//如输入字符串中包含 * 则不自动添加%
				this.params.add(new Param("mneValues", searchContent));
				list = produceTaskService.mneCodeSearch(mneViewCode,showNumber,cross,this.params,refViewCode,currentViewCode,currentSqlType,realPermissionCode);
			} else {
				List<Param> searchStep2Param=new ArrayList<Param>();
				searchStep2Param.addAll(this.params);
				List<Param> searchStep3Param=new ArrayList<Param>();
				searchStep3Param.addAll(this.params);
				this.params.add(new Param("mneValues", searchContent));
				list = produceTaskService.mneCodeSearch(mneViewCode,showNumber,cross,this.params,refViewCode,currentViewCode,currentSqlType,realPermissionCode);
				if(showNumber>list.size()){
					int showNumStep2=showNumber-list.size();
					searchStep2Param.add(new Param("mneValues", searchContent + "%"));
					searchStep2Param.add(new Param("notinValue", getMneIDs(list)));
					list.addAll(produceTaskService.mneCodeSearch(mneViewCode,showNumStep2,cross,searchStep2Param,refViewCode,currentViewCode,currentSqlType,realPermissionCode));
					if(showNumber>list.size()){
						int showNumStep3=showNumber-list.size();
						searchStep3Param.add(new Param("mneValues", "%" + searchContent + "%"));
						searchStep3Param.add(new Param("notinValue", getMneIDs(list)));
						list.addAll(produceTaskService.mneCodeSearch(mneViewCode,showNumStep3,cross,searchStep3Param,refViewCode,currentViewCode,currentSqlType,realPermissionCode));
					}
				}
			}
			if (!list.isEmpty()) {
				StringBuilder json = new StringBuilder();
				json.append('[');
				for (int i = 0; i < list.size(); i++) {
					if (i > 0) {
						json.append(',');
					}
					json.append('"');
					int count = 0;
					for (int j = 0; j < list.get(i).length; j++) {
						if(userFieldPermissionService.findFieldPermission("WOM_7.5.0.0_produceTask_ProduceTask", columns[j], null) != 0) {
							if (count++ > 0) {
								json.append("$$BAP$$");
							}
							json.append(columns[j]);
							json.append("@@BAP@@");
							json.append(list.get(i)[j]);
						}	
					}
					json.append('"');
				}
				json.append(']');
				bapAfterCustomMethod(mneViewCode, "mneClient");
				Struts2Utils.render(Struts2Utils.JSON_TYPE, json.toString());
				return null;
			}
			bapAfterCustomMethod(mneViewCode, "mneClient");
			Struts2Utils.render(Struts2Utils.JSON_TYPE, "null");
			return null;
		} finally {
			showNumber = 5;
			searchContent = null;
			params = null;
		}
	}
	
	private String getMneIDs(List<Object[]> list){
		if(list.size()==0){
			return null;
		}else{
			String res="";
			for(Object[] m:list){
				if(m[0]!=null){
					res+=","+m[0];
				}
			}
			return res.substring(1);
		}
		
	}
	
	/**
	 *  参照视图、树视图、树参照视图、摘要视图公用主方法
	 */
	@Actions({
		
		@Action(value = "/WOM/produceTask/produceTask/maketaskRef", results = { @Result(type = FREEMARKER, location = "maketaskRef.ftl") })
		,
		@Action(value = "/WOM/produceTask/produceTask/taskRef", results = { @Result(type = FREEMARKER, location = "taskRef.ftl") })
	})
	public String viewOther() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View otherView = ViewServiceFoundation.getView(viewCode);
		View assView = otherView.getAssView();
		if(assView != null && assView.getCode() != null){
			if(null == workFlowMenuCode || "".equals(workFlowMenuCode)){
				workFlowMenuCode = assView.getCode();
			}
			if (null != processKey && processKey.length() > 0){
				flowBulkFlag = processService.checkFlowbullkFlag(processKey);
			} else {
				if(null != workFlowMenuCode && !"".equals(workFlowMenuCode)){
					String processKey = produceTaskService.getWorkFlowInfo(workFlowMenuCode);
					if(processKey != null && processKey.length() > 0){
						flowBulkFlag = processService.checkFlowbullkFlag(processKey);
					}
				}
			}
		}
		bapBeforeCustomMethod(viewCode, viewName);
		bapAfterCustomMethod(viewCode, viewName);
		return SUCCESS;
	}
	
	
	
	/**
	 *  列表视图公用待办查询方法
	 */
	@Actions({
	
		@Action(value = "/WOM/produceTask/produceTask/changePackageList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="changePackageList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/generalManageView-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.planParId.dayPlanInfo.tableNo,result.productId.productCode,result.productId.productName,result.productId.productBaseUnit.name,result.productBatchNum,result.taskType.id,result.taskType.value,result.formularId.code,result.formularId.name,result.formularId.edition,result.formularId.setProcess.id,result.formularId.setProcess.value,result.factoryId.name,result.taskState.id,result.taskState.value,result.productNum,result.finishNum,result.actStartTime,result.actEndTime,result.remark,result.planParId.dayPlanInfo.id,result.productId.id,result.productId.productBaseUnit.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="generalManageView-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/makeExcutList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productBatchNum,result.productId.productName,result.productNum,result.finishNum,result.taskType.id,result.taskType.value,result.formularId.code,result.batchContral,result.factoryId.name,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.staticFlag,result.isAnaly,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="makeExcutList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.manuOrderMain.manulOrderNum,result.productId.productCode,result.productId.productName,result.manuOrderMain.orderNumber,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.batchContral,result.batchTaskState.id,result.batchTaskState.value,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.staticFlag,result.remark,result.manuOrderMain.id,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="makeTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/otherTaskList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="otherTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/packageTaskList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.bulkProduct.productCode,result.bulkProduct.productName,result.bulkBatchNum.batchText,result.bulkNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.bulkProduct.id,result.bulkBatchNum.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="packageTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="recycleTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/reProcessList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.reWorkBatchNum.batchNum,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.reWorkBatchNum.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="reProcessList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/reWorkList-pending", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.reWorkBatchNum.batchNum,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.reWorkBatchNum.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="reWorkList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	})
	public String viewListPending() throws Exception{
		viewCode = request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View listView = ViewServiceFoundation.getView(viewCode);
		params = new ArrayList<Param>();
		params.add(new Param("\"produceTask\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		bapBeforeCustomMethod(viewCode, viewName+"Pending");
		setFieldPermissionModelCode(listView.getAssModel().getCode());
		Map<String,String> oneToManyParams = new HashMap<String,String>();
		params.add(new Param("\"p\"." + Pending.COL_USER_ID, creatorService.getStaffFromSession().getUser().getId()));
		if (null != processKey && processKey.length() > 0) {
			params.add(new Param("\"p\"." + Pending.COL_PROCESS_KEY, processKey));
		}
		if (null != entityCode && entityCode.length() > 0) {
			params.add(new Param("\"p\"." + Pending.COL_ENTITY_ID, entityCode));
		}
		if (null != activityName && activityName.length() > 0) {
			params.add(new Param("\"p\"." + Pending.COL_ACTIVITY_NAME, activityName));
		}
		if (null != processVersion && processVersion.length() > 0) {
			params.add(new Param("\"p\"." + Pending.COL_PROCESS_VERSION, processVersion));
		}
		if (null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0) {
			params.add(new Param("advQueryCond", request.getParameter("advQueryCond"), Param.LIKE_ALL));
		}
		if (null != request.getParameter("classifyCodes") && request.getParameter("classifyCodes").trim().length() > 0) {
			params.add(new Param("classifyCodes", request.getParameter("classifyCodes")));
		}
		if (null != getDataTableSortColKey() && getDataTableSortColKey().length() > 0) {
			String sortColKey = getDataTableSortColKey();
			if (null != getDataTableSortColName() && getDataTableSortColName().length() > 0) {
				sortColKey += "::" + getDataTableSortColName();
			}
			params.add(new Param("dataTable-sortColKey", sortColKey));
		}
		if (null != getDataTableSortColOrder() && getDataTableSortColOrder().length() > 0) {
			params.add(new Param("dataTable-sortColOrder", getDataTableSortColOrder()));
		}
				if (!(null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0)) {
			if (null != request.getParameter("fastQueryCond") && request.getParameter("fastQueryCond").trim().length() > 0) {
				params.add(new Param("fastQueryCond", request.getParameter("fastQueryCond"), Param.LIKE_ALL));
			}
		}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			Param pm=businessCenterService.businessSql("\"produceTask\"",businessCenterCode, mainBusinessId);
			params.add(pm);
		}
		if(null != oneToManyParams && !oneToManyParams.isEmpty()) {
			params.add(new Param("extraQueryCond", oneToManyParams, Param.LIKE_ALL));
		}
		Model assmodel= modelServiceFoundation.getModel(listView.getAssModel().getCode());
		List<Property> properties = modelServiceFoundation.findProperties(assmodel);
		Map<String,String> fieldMap=new HashMap<String, String>();
		for (Property p : properties) {
			fieldMap.put(p.getName(), p.getColumnName());
		}
		if(listView.getUsedForTree()&&listView.getAssTreeModelCode()!=null){
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".id") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".id").trim().length() > 0) {
				params.add(new Param("\"tree-id-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("id"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".id"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec").trim().length() > 0) {
				if(listView.getIncludeChildren()){
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.EQUAL_LIKELEFT));
				}else{
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.LIKE_UNSUPPORT));
				}
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo").trim().length() > 0) {
				params.add(new Param("\"tree-layNo-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layNo"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId").trim().length() > 0) {
				params.add(new Param("\"tree-"+listView.getAssTreeModelCode()+"\"."+Inflector.getInstance().columnize("parentId"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId"),Param.LIKE_UNSUPPORT,"LONG"));
			}
		}
		if (null != request.getParameter("department.layRec") && request.getParameter("department.layRec").trim().length() > 0) {
			params.add(new Param("\"createDepartment\".LAY_REC", request.getParameter("department.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("position.layRec") && request.getParameter("position.layRec").trim().length() > 0) {
			params.add(new Param("\"createPosition\".LAY_REC", request.getParameter("position.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("factoryModel.layRec") && request.getParameter("factoryModel.layRec").trim().length() > 0) {
			params.add(new Param("\"factoryId\".LAY_REC", request.getParameter("factoryModel.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if(listView.getAssModel().getDataType()== 2){
			if (null != request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec") && request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec").trim().length() > 0) {
				params.add(new Param("\""+firstLatterToLowerCase(listView.getAssModel().getModelName())+"\"."+fieldMap.get("layRec"), request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec"), Param.EQUAL_LIKELEFT));
			}
		}
		if (null != request.getParameter("pending-beginDate") && request.getParameter("pending-beginDate").trim().length() > 0) {
			params.add(new Param("pending-beginDate", request.getParameter("pending-beginDate") + " 00:00:00", Param.GREATE_EQUAL, "DATETIME"));
		}
		if (null != request.getParameter("pending-endDate") && request.getParameter("pending-endDate").trim().length() > 0) {
			params.add(new Param("pending-endDate", request.getParameter("pending-endDate") + " 23:59:59", Param.LESS_EQUAL, "DATETIME"));
		}
		currentSqlType = Sql.TYPE_LIST_PENDING;
		hasAttachment = listView.getHasAttachment();
		generateCustomerCondition(viewCode);
		generateClassificCondition();
		if(getPage().isExportFlag()) {
			this.excelModelMappings = new HashMap<String, Object>();
			this.excelExportModels = new HashMap<String, Object>();
			this.excelProperties = new HashMap<String, Object>();
			this.excelProperty = new HashMap<String, Object>();
			this.excelRunningCustomPropertyCode = new HashMap<String, Object>();
			this.excelTotal = new HashMap<String, Object>();
			Boolean hasFastQueryCond = false;//防止重复添加hasFastQueryCond
			for(Param par : params){
				if(par.getName().equals("fastQueryCond")){
					hasFastQueryCond = true;
				}
			}
			if (null != request.getParameter("exportFastQueryCond") && request.getParameter("exportFastQueryCond").trim().length() > 0 && !hasFastQueryCond) {
				params.add(new Param("fastQueryCond", request.getParameter("exportFastQueryCond"), Param.LIKE_ALL));
			}
			exportAuxiliaryModelFlag = page.isExportAuxiliaryModel();
			bapAfterCustomMethod(viewCode, "viewListPending");
			produceTaskService.excelExport();
			return "excel";
		} else {
			findExportDataInfos(getPage());
			if(null != flowBulkFlag && flowBulkFlag){
				List<WOMProduceTask> produceTaskList=page.getResult();
				for(WOMProduceTask lz:produceTaskList){
					Boolean flag=processService.getActiveBulkDealFlag(lz.getPending().getProcessId(), lz.getPending().getActivityName());
					lz.getPending().setBulkDealFlag(flag);
				}
			}
			bapAfterCustomMethod(viewCode, viewName+"Pending");
			if(listView.getDataGridType()==1){
				response.setContentType("text/xml;charset=UTF-8");
				if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
				return "xml";
			}else{
				return SUCCESS;
			}
		}
	}
	
	/**
	 *  列表视图公用数据查询方法
	 */
	@Actions({
	
		@Action(value = "/WOM/produceTask/produceTask/changePackageList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="changePackageList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/generalManageView-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.planParId.dayPlanInfo.tableNo,result.productId.productCode,result.productId.productName,result.productId.productBaseUnit.name,result.productBatchNum,result.taskType.id,result.taskType.value,result.formularId.code,result.formularId.name,result.formularId.edition,result.formularId.setProcess.id,result.formularId.setProcess.value,result.factoryId.name,result.taskState.id,result.taskState.value,result.productNum,result.finishNum,result.actStartTime,result.actEndTime,result.remark,result.planParId.dayPlanInfo.id,result.productId.id,result.productId.productBaseUnit.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="generalManageView-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/makeExcutList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productBatchNum,result.productId.productName,result.productNum,result.finishNum,result.taskType.id,result.taskType.value,result.formularId.code,result.batchContral,result.factoryId.name,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.staticFlag,result.isAnaly,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="makeExcutList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.manuOrderMain.manulOrderNum,result.productId.productCode,result.productId.productName,result.manuOrderMain.orderNumber,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.batchContral,result.batchTaskState.id,result.batchTaskState.value,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.staticFlag,result.remark,result.manuOrderMain.id,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="makeTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/otherTaskList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="otherTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/packageTaskList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.bulkProduct.productCode,result.bulkProduct.productName,result.bulkBatchNum.batchText,result.bulkNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.bulkProduct.id,result.bulkBatchNum.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="packageTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="recycleTaskList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/reProcessList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.reWorkBatchNum.batchNum,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.reWorkBatchNum.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="reProcessList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/reWorkList-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.reWorkBatchNum.batchNum,result.productBatchNum,result.formularId.code,result.formularId.name,result.formularId.edition,result.factoryId.name,result.productNum,result.finishNum,result.taskState.id,result.taskState.value,result.planStartTime,result.planEndTime,result.actStartTime,result.actEndTime,result.remark,result.productId.id,result.reWorkBatchNum.id,result.formularId.id,result.factoryId.id,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="reWorkList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
	})
	public String viewListQuery() throws Exception{
		DataGrid dg=null;
		String viewName = "";
		if(datagridCode!=null&&!"".equals(datagridCode)){
			if((datagridCode.split(",")).length > 1){
				datagridCode = datagridCode.split(",")[0];
			}
			dg=ViewServiceFoundation.getDataGrid(datagridCode, "runtime");
			viewCode = dg.getView().getCode();
			viewName = dg.getView().getName();
		}else{
			if(request.getRequestURI().endsWith("-query.action")){
				viewCode = request.getAttribute("ViewCode").toString();
				viewName=request.getAttribute("ViewName").toString();
			}else if(request.getRequestURI().replaceAll("^.*/data-","").length() > 0){
				String dataGridName=request.getRequestURI().replaceAll("^.*/data-","").replaceAll(".action$", "");
				dg=ViewServiceFoundation.getDataGridByName(dataGridName, "runtime");
				datagridCode=dg.getCode();
				viewCode = dg.getView().getCode();
				viewName = dg.getView().getName();
			}else{
				viewCode = request.getAttribute("ViewCode").toString();
				viewName=request.getAttribute("ViewName").toString();
			}			
		}
		View listView = ViewServiceFoundation.getView(viewCode);
		params = new ArrayList<Param>();
		params.add(new Param("\"produceTask\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		if(datagridCode!=null&&!"".equals(datagridCode)){
			bapBeforeCustomMethod(datagridCode, viewName+"Query");
		}else{
			bapBeforeCustomMethod(viewCode, viewName+"Query");
		}
		setFieldPermissionModelCode(listView.getAssModel().getCode());
		Map<String,String> oneToManyParams = new HashMap<String,String>();
		//if (null != processKey && processKey.length() > 0) {
		//	params.add(new Param("\"p\"." + Pending.COL_PROCESS_KEY, processKey));
		//}
		//if (null != entityCode && entityCode.length() > 0) {
		//	params.add(new Param("\"p\"." + Pending.COL_ENTITY_ID, entityCode));
		//}
		if (null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0) {
			params.add(new Param("advQueryCond", request.getParameter("advQueryCond"), Param.LIKE_ALL));
		}
		if (null != request.getParameter("classifyCodes") && request.getParameter("classifyCodes").trim().length() > 0) {
			params.add(new Param("classifyCodes", request.getParameter("classifyCodes")));
		}
		if (null != getDataTableSortColKey() && getDataTableSortColKey().length() > 0) {
			String sortColKey = getDataTableSortColKey();
			if (null != getDataTableSortColName() && getDataTableSortColName().length() > 0) {
				sortColKey += "::" + getDataTableSortColName();
			}
			params.add(new Param("dataTable-sortColKey", sortColKey));
		}
		if (null != getDataTableSortColOrder() && getDataTableSortColOrder().length() > 0) {
			params.add(new Param("dataTable-sortColOrder", getDataTableSortColOrder()));
		}
				if (!(null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0)) {
			if (null != request.getParameter("fastQueryCond") && request.getParameter("fastQueryCond").trim().length() > 0) {
				params.add(new Param("fastQueryCond", request.getParameter("fastQueryCond"), Param.LIKE_ALL));
			}
		}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			Param pm=businessCenterService.businessSql("\"produceTask\"",businessCenterCode, mainBusinessId);
			params.add(pm);
		}
		if(null != oneToManyParams && !oneToManyParams.isEmpty()) {
			params.add(new Param("extraQueryCond", oneToManyParams, Param.LIKE_ALL));
		}
		Model assmodel= modelServiceFoundation.getModel(listView.getAssModel().getCode());
		List<Property> properties = modelServiceFoundation.findProperties(assmodel);
		Map<String,String> fieldMap=new HashMap<String, String>();
		for (Property p : properties) {
			fieldMap.put(p.getName(), p.getColumnName());
		}
		if(listView.getUsedForTree()&&listView.getAssTreeModelCode()!=null){
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".id") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".id").trim().length() > 0) {
				params.add(new Param("\"tree-id-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("id"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".id"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec").trim().length() > 0) {
				if(listView.getIncludeChildren()){
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.EQUAL_LIKELEFT));
				}else{
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.LIKE_UNSUPPORT));
				}
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo").trim().length() > 0) {
				params.add(new Param("\"tree-layNo-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layNo"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId").trim().length() > 0) {
				params.add(new Param("\"tree-"+listView.getAssTreeModelCode()+"\"."+Inflector.getInstance().columnize("parentId"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId"),Param.LIKE_UNSUPPORT,"LONG"));
			}
		}
		if (null != request.getParameter("department.layRec") && request.getParameter("department.layRec").trim().length() > 0) {
			params.add(new Param("\"createDepartment\".LAY_REC", request.getParameter("department.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("position.layRec") && request.getParameter("position.layRec").trim().length() > 0) {
			params.add(new Param("\"createPosition\".LAY_REC", request.getParameter("position.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("factoryModel.layRec") && request.getParameter("factoryModel.layRec").trim().length() > 0) {
			params.add(new Param("\"factoryId\".LAY_REC", request.getParameter("factoryModel.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if(listView.getAssModel().getDataType()== 2){
			if (null != request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec") && request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec").trim().length() > 0) {
				params.add(new Param("\""+firstLatterToLowerCase(listView.getAssModel().getModelName())+"\"."+fieldMap.get("layRec"), request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec"), Param.EQUAL_LIKELEFT));
			}
		}
		currentSqlType = Sql.TYPE_LIST_QUERY;
		hasAttachment = listView.getHasAttachment();
		if(datagridCode!=null&&!"".equals(datagridCode)){
			generateCustomerConditionByDg(datagridCode);
		}else{
			generateCustomerCondition(viewCode);
		}
		generateClassificCondition();
		int validPosition = 0;	//出现valid字段的下标
		for (int i=0;i<params.size();i++) {
			Object param = params.get(i);
			if(param.toString().indexOf("\"produceTask\".VALID = true") != -1){
				validPosition = i;
			}
			if(param.toString().indexOf("\"columnName\":\"VALID\"")>0||param.toString().indexOf("\"produceTask\".VALID = ?")>0){
				params.set(validPosition, new Param("1", 1, Param.LIKE_UNSUPPORT, "int"));
				break;
			}
		}
		//fieldFlag 暂定为zzsqd的内容
		//fieldFlag = ",*,dsyj,requestPerson.name,requestDept.name,name,createStaff.name,zzry.testSysCode,zzry.testEnum,";
		//fieldFlag = ",*,";
		if(getPage().isExportFlag()) {
			this.excelModelMappings = new HashMap<String, Object>();
			this.excelExportModels = new HashMap<String, Object>();
			this.excelProperties = new HashMap<String, Object>();
			this.excelProperty = new HashMap<String, Object>();
			this.excelRunningCustomPropertyCode = new HashMap<String, Object>();
			this.excelTotal = new HashMap<String, Object>();
			Boolean hasFastQueryCond = false;//防止重复添加hasFastQueryCond
			for(Param par : params){
				if(par.getName().equals("fastQueryCond")){
					hasFastQueryCond = true;
				}
			}
			if (null != request.getParameter("exportFastQueryCond") && request.getParameter("exportFastQueryCond").trim().length() > 0 && !hasFastQueryCond) {
				params.add(new Param("fastQueryCond", request.getParameter("exportFastQueryCond"), Param.LIKE_ALL));
				String str = request.getParameter("exportFastQueryCond");
			}
			if(listView.getAssModel().getDataType()== 2){
				if (null != request.getParameter("treeNodeSelectedQueryCond") && request.getParameter("treeNodeSelectedQueryCond").trim().length() > 0) {
					params.add(new Param("\""+firstLatterToLowerCase(listView.getAssModel().getModelName())+"\"."+fieldMap.get("layRec"), request.getParameter("treeNodeSelectedQueryCond"), Param.EQUAL_LIKELEFT));
				}
			}
			exportAuxiliaryModelFlag = page.isExportAuxiliaryModel();
			if(datagridCode!=null&&!"".equals(datagridCode)){
				bapAfterCustomMethod(datagridCode, viewName+"Query");
			}else{
				bapAfterCustomMethod(viewCode, viewName+"Query");
			}
			produceTaskService.excelExport();
			return "excel";
		} else {
			if(listView.getOnlyForQuery()){
				searchObjects = new Object[1];
				searchObjects[0] = 1;
			}
			findExportDataInfos(getPage());
			if(datagridCode!=null&&!"".equals(datagridCode)){
				bapAfterCustomMethod(datagridCode, viewName+"Query");
			}else{
				bapAfterCustomMethod(viewCode, viewName+"Query");
			}
			if(listView.getDataGridType()==1){
				response.setContentType("text/xml;charset=UTF-8");
				if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
				return "xml";
			}else{
				return SUCCESS;
			}
		}
		
	}
	
	/**
	 *  列表视图公用GetRequireData方法
	 */
	@Actions({
	
		@Action(value = "/WOM/produceTask/produceTask/changePackageList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/generalManageView-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/makeExcutList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/makeTaskList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/otherTaskList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/packageTaskList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/recycleTaskList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/reProcessList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	,
		@Action(value = "/WOM/produceTask/produceTask/reWorkList-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
	})
	public String viewListGetRequireData() throws Exception{
		viewCode = request.getAttribute("ViewCode").toString();
		data = ViewServiceFoundation.getRequireData(viewCode,getAllProperties);
		map.put("data", data);
		return  SUCCESS;
	}
	
	/**
	 *  参照视图公用数据查询方法
	 */
	@Actions({
	
		@Action(value = "/WOM/produceTask/produceTask/maketaskRef-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productBatchNum,result.workType.id,result.workType.value,result.formularId.code,result.formularId.name,result.factoryId.name,result.manuOrderMain.manulOrderNum,result.productId.id,result.formularId.id,result.factoryId.id,result.manuOrderMain.id,result.attrMap.*"})
			,@Result(name="excel",type="excel",location="maketaskRef-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	,
		@Action(value = "/WOM/produceTask/produceTask/taskRef-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.tableNo,result.productId.productCode,result.productId.productName,result.productNum,result.productBatchNum,result.taskType.id,result.taskType.value,result.formularId.code,result.formularId.name,result.formularId.setProcess.id,result.formularId.setProcess.value,result.factoryId.name,result.planStartTime,result.planEndTime,result.taskState.id,result.taskState.value,result.productId.id,result.formularId.id,result.factoryId.id,result.attrMap.*"})
			,@Result(name="excel",type="excel",location="taskRef-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	})
	public String viewReferenceQuery() throws Exception{
		viewCode = request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		params = new ArrayList<Param>();
		View listView = ViewServiceFoundation.getView(viewCode);
		boolean crossCompanyFlag = false;
		if(null != request.getParameter("crossCompanyFlag")){
			crossCompanyFlag = Boolean.parseBoolean(request.getParameter("crossCompanyFlag"));
		}
		params.add(new Param("crossCompanyFlag", crossCompanyFlag, Param.EQUAL_LIKELEFT, "BOOLEAN"));
		params.add(new Param("\"produceTask\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		bapBeforeCustomMethod(viewCode, viewName+"Query");
		setFieldPermissionModelCode(listView.getAssModel().getCode());
		Map<String,String> oneToManyParams = new HashMap<String,String>();
		//params.add(new Param("\"produceTask\".CREATE_STAFF_ID" , creatorService.getStaffFromSession().getId()));
		if (null != processKey && processKey.length() > 0) {
			params.add(new Param("\"p\"." + Pending.COL_PROCESS_KEY, processKey));
		}
		if (null != entityCode && entityCode.length() > 0) {
			params.add(new Param("\"p\"." + Pending.COL_ENTITY_ID, entityCode));
		}
		if (null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0) {
			params.add(new Param("advQueryCond", request.getParameter("advQueryCond"), Param.LIKE_ALL));
		}
		if (null != request.getParameter("classifyCodes") && request.getParameter("classifyCodes").trim().length() > 0) {
			params.add(new Param("classifyCodes", request.getParameter("classifyCodes")));
		}
		if (null != getDataTableSortColKey() && getDataTableSortColKey().length() > 0) {
			String sortColKey = getDataTableSortColKey();
			if (null != getDataTableSortColName() && getDataTableSortColName().length() > 0) {
				sortColKey += "::" + getDataTableSortColName();
			}
			params.add(new Param("dataTable-sortColKey", sortColKey));
		}
		if (null != getDataTableSortColOrder() && getDataTableSortColOrder().length() > 0) {
			params.add(new Param("dataTable-sortColOrder", getDataTableSortColOrder()));
		}
				if (!(null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0)) {
			if (null != request.getParameter("fastQueryCond") && request.getParameter("fastQueryCond").trim().length() > 0) {
				params.add(new Param("fastQueryCond", request.getParameter("fastQueryCond"), Param.LIKE_ALL));
			}
		}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			Param pm=businessCenterService.businessSql("\"produceTask\"",businessCenterCode, mainBusinessId);
			params.add(pm);
		}
		if(null != oneToManyParams && !oneToManyParams.isEmpty()) {
			params.add(new Param("extraQueryCond", oneToManyParams, Param.LIKE_ALL));
		}
		Model assmodel= modelServiceFoundation.getModel(listView.getAssModel().getCode());
		List<Property> properties = modelServiceFoundation.findProperties(assmodel);
		Map<String,String> fieldMap=new HashMap<String, String>();
		for (Property p : properties) {
			fieldMap.put(p.getName(), p.getColumnName());
		}
		if(listView.getUsedForTree()&&listView.getAssTreeModelCode()!=null){
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".id") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".id").trim().length() > 0) {
				params.add(new Param("\"tree-id-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("id"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".id"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec").trim().length() > 0) {
				if(listView.getIncludeChildren()){
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.EQUAL_LIKELEFT));
				}else{
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.LIKE_UNSUPPORT));
				}
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo").trim().length() > 0) {
				params.add(new Param("\"tree-layNo-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layNo"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId").trim().length() > 0) {
				params.add(new Param("\"tree-"+listView.getAssTreeModelCode()+"\"."+Inflector.getInstance().columnize("parentId"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId"),Param.LIKE_UNSUPPORT,"LONG"));
			}
		}
		if (null != request.getParameter("department.layRec") && request.getParameter("department.layRec").trim().length() > 0) {
			params.add(new Param("\"createDepartment\".LAY_REC", request.getParameter("department.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("position.layRec") && request.getParameter("position.layRec").trim().length() > 0) {
			params.add(new Param("\"createPosition\".LAY_REC", request.getParameter("position.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("factoryModel.layRec") && request.getParameter("factoryModel.layRec").trim().length() > 0) {
			params.add(new Param("\"factoryId\".LAY_REC", request.getParameter("factoryModel.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if(listView.getAssModel().getDataType()== 2){
			if (null != request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec") && request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec").trim().length() > 0) {
				params.add(new Param("\""+firstLatterToLowerCase(listView.getAssModel().getModelName())+"\"."+fieldMap.get("layRec"), request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec"), Param.EQUAL_LIKELEFT));
			}
		}
		Map confMap=null;
		if(listView.getIsShadow()){
			confMap=listView.getShadowView().getExtraView().getConfigMap();
		}else{
			confMap=listView.getExtraView().getConfigMap();
		}
		if(confMap!=null){
			Map listProperty=(Map)confMap.get("listProperty");
			if(listProperty!=null&&listProperty.get("isTransCondition")!=null&&listProperty.get("isTransCondition").equals("true")){
				if(listProperty.get("conditionContent")!=null&&!listProperty.get("conditionContent").equals("")){
					params.add(new Param("referenceCondition",listProperty.get("conditionContent").toString(), Param.LIKE_ALL));
				}
			}
		}
		hasAttachment = listView.getHasAttachment();
		generateCustomerCondition(viewCode);
		generateClassificCondition();
		int validPosition = 0;	//出现valid字段的下标
		for (int i=0;i<params.size();i++) {
			Object param = params.get(i);
			if(param.toString().indexOf("\"produceTask\".VALID = true") != -1){
				validPosition = i;
			}
			if(param.toString().indexOf("\"columnName\":\"VALID\"")>0||param.toString().indexOf("\"produceTask\".VALID = ?")>0){
				params.set(validPosition, new Param("1", 1, Param.LIKE_UNSUPPORT, "int"));
				break;
			}
		}
		currentSqlType = Sql.TYPE_LIST_REFERENCE;
		if(getPage().isExportFlag()) {
			this.excelModelMappings = new HashMap<String, Object>();
			this.excelExportModels = new HashMap<String, Object>();
			this.excelProperties = new HashMap<String, Object>();
			this.excelProperty = new HashMap<String, Object>();
			this.excelRunningCustomPropertyCode = new HashMap<String, Object>();
			this.excelTotal = new HashMap<String, Object>();
			Boolean hasFastQueryCond = false;//防止重复添加hasFastQueryCond
			for(Param par : params){
				if(par.getName().equals("fastQueryCond")){
					hasFastQueryCond = true;
				}
			}
			if (null != request.getParameter("exportFastQueryCond") && request.getParameter("exportFastQueryCond").trim().length() > 0 && !hasFastQueryCond) {
				params.add(new Param("fastQueryCond", request.getParameter("exportFastQueryCond"), Param.LIKE_ALL));
			}
			exportAuxiliaryModelFlag = page.isExportAuxiliaryModel();
			bapAfterCustomMethod(viewCode, viewName+"Query");
			produceTaskService.excelExport();
			return "excel";
		} else {
			findExportDataInfos(getPage());
			bapAfterCustomMethod(viewCode, viewName+"Query");
			return SUCCESS;
		}
	}	
	
	
	private String parseSqlCondition(String sql, List<Object> list,Map<String,Object> listMap){
		Pattern p = Pattern.compile("\\$\\{(.+?),(.+?)\\}");
		Matcher m =	p.matcher(sql);
		while(m.find()){
			String str = m.group();
			String value = request.getParameter(m.group(1));
			String type = m.group(2);
			if("int".equalsIgnoreCase(type)){
				Integer integer = new Integer(value);
				list.add(integer);
			}else if("date".equals(type)){
				value=value.replaceAll("/", "-");
				SimpleDateFormat sdf=null;
				if(value.length()==19){
					sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				}else if(value.length()==10){
					sdf=new SimpleDateFormat("yyyy-MM-dd");
				}else{
					list.add(new Date(value));
				}
				if(sdf!=null){
					try {
						list.add(sdf.parse(value));
					} catch (Exception e) {
						logger.info(e.getMessage());
					}
				}
			}else if("double".equals(type)){
				Double doubles = new Double(value);
				list.add(doubles);
			}else if("long".equalsIgnoreCase(type)){
				Long longs = new Long(value);
				list.add(longs);
			}else if("string".equalsIgnoreCase(type)){
				list.add(value);
			}else if("method".equalsIgnoreCase(type)){
				value = m.group(1);
				try {
					list.add(Ognl.getValue(value, this));
				} catch (Exception e) {
					logger.info(e.getMessage());
				}
			}else if("array".equalsIgnoreCase(type)||"list".equalsIgnoreCase(type)){
				Object split=request.getParameter("split");
				String splitChar=(split==null?",":split.toString());
				if(listMap!=null){
					listMap.put(m.group(1),value.split(splitChar));
					sql = sql.replace(str,":"+m.group(1));
				}
			}else{
				list.add(value);
			}
			sql = sql.replace(str, "?");
		}
		return sql;
	}
	
	private AdvQueryCondition parseJsonCondition(String jsonString){
		Pattern p = Pattern.compile("\\$\\{(.*?)\\}");
		Matcher m =	p.matcher(jsonString);
		while(m.find()){
			String str = m.group();
			String value = request.getParameter(m.group(1)); //request.getParameter(str.substring(2, str.length()-1));
			if(value != null){
				jsonString = jsonString.replace(str, value);
			}else{
				jsonString = jsonString.replace(str, "");
			}
		}
		return conditionService.toSql(jsonString);
	}
	
	private void generateCustomerConditionByDg(String dgCode){
		CustomerCondition ccon= viewServiceFoundation.findCustomerConditionByDatagridCode(dgCode);
		if(ccon!=null && ccon.getSql()!=null && ccon.getSql().length()>0){
			String customerSql = ccon.getSql();
			if(customerSql.indexOf("return")>-1){
				Map<String, Object> variables = new HashMap<String, Object>(); 
				Map<String, String[]> parameters =request.getParameterMap();
				for(String key:parameters.keySet()){
					variables.put(key, parameters.get(key)[0]);
				}
				variables.put("parameters", parameters);
				customerSql=EngineScriptExecutor.eval(customerSql, variables).toString();
			}
			List<Object> list = new ArrayList<Object>();
			Map<String,Object> listMap = new HashMap<String,Object>();
			customerSql = parseSqlCondition(customerSql, list,listMap);
			params.add(new Param("customerSql", customerSql));
			params.add(new Param("customerSqlValues", list));
			params.add(new Param("customerSqlListMap", listMap));
		}else if(ccon!=null && ccon.getJsonCondition()!=null && ccon.getJsonCondition().length()>0){
			String jsonString = ccon.getJsonCondition();
			AdvQueryCondition acon = parseJsonCondition(jsonString);
			String customer = acon.getSql();
			List<Object> customerValue = acon.getValues();
			params.add(new Param("customerCondition", customer));
			params.add(new Param("customerValues", customerValue));
		}
	}
	
	private void generateCustomerCondition(String viewCode){
		View v = viewServiceFoundation.getView(viewCode);
		if(v!= null && v.getIsShadow()!=null && v.getIsShadow()){
			View shadow = v.getShadowView();
			if(shadow != null){
				viewCode = shadow.getCode();
			}
		}
		CustomerCondition ccon=null;
		if(v.getShowType().equals(ShowType.LAYOUT)){
			//如果是布局情况下在布局中获取center区域的viewCode
			Map viewConfig=viewServiceFoundation.getExtraViewFullConfigMap(v);
			if(viewConfig.get("layout")!=null
					&&((Map)viewConfig.get("layout")).get("center")!=null
					&&((Map)((Map)viewConfig.get("layout")).get("center")).get("vcode")!=null){
				ccon = viewServiceFoundation.findCustomerConditionByViewCode(((Map)((Map)viewConfig.get("layout")).get("center")).get("vcode").toString());
			}else{
				ccon = viewServiceFoundation.findCustomerConditionByViewCode(viewCode);
			}
		}else{
			ccon = viewServiceFoundation.findCustomerConditionByViewCode(viewCode);
		}
		if(ccon!=null && ccon.getSql()!=null && ccon.getSql().length()>0){
			String customerSql = ccon.getSql();
			if(customerSql.indexOf("return")>-1){
				Map<String, Object> variables = new HashMap<String, Object>(); 
				Map<String, String[]> parameters =request.getParameterMap();
				for(String key:parameters.keySet()){
					variables.put(key, parameters.get(key)[0]);
				}
				variables.put("parameters", parameters);
				customerSql=EngineScriptExecutor.eval(customerSql, variables).toString();
			}
			List<Object> list = new ArrayList<Object>();
			Map<String,Object> listMap = new HashMap<String,Object>();
			customerSql = parseSqlCondition(customerSql, list,listMap);
			params.add(new Param("customerSql", customerSql));
			params.add(new Param("customerSqlValues", list));
			params.add(new Param("customerSqlListMap", listMap));
		}else if(ccon!=null && ccon.getJsonCondition()!=null && ccon.getJsonCondition().length()>0){
			String jsonString = ccon.getJsonCondition();
			AdvQueryCondition acon = parseJsonCondition(jsonString);
			String customer = acon.getSql();
			List<Object> customerValue = acon.getValues();
			params.add(new Param("customerCondition", customer));
			params.add(new Param("customerValues", customerValue));
		}
	}
	
	private void generateClassificCondition(){
		if (null != getClassifyCodes()) {
			String classifyCodes = getClassifyCodes();
			String[] classifyCodeArray = classifyCodes.split(",");
			Map<String, List<Map<String, List<Object>>>> groupMap = new HashMap<String, List<Map<String, List<Object>>>>();
			//Map<String, List<Object>> classifyMap = new HashMap<String, List<Object>>();
			AdvQueryCondition advCondition = null;
			for(int i = 0; i < classifyCodeArray.length; i++){
				if(!classifyCodeArray[i].startsWith("bap:adv:classific:")) {
					CustomerCondition cuscon = viewServiceFoundation.findCustomerConditionByClassificCode(classifyCodeArray[i]);
					DataClassific dc = viewServiceFoundation.getDataClassific(classifyCodeArray[i]);
					Map<String, List<Object>> classifyMap = new HashMap<String, List<Object>>();
					boolean flag = false;
					if(cuscon != null && cuscon.getSql() !=null && cuscon.getSql().length() > 0){
						flag = true;
						String customerSql = cuscon.getSql();
						List<Object> list = new ArrayList<Object>();
						customerSql = parseSqlCondition(customerSql, list,null);
						classifyMap.put(customerSql, list);
						
					}else if(cuscon != null && cuscon.getJsonCondition() != null && cuscon.getJsonCondition().length() > 0){
						flag = true;
						String jsonString = cuscon.getJsonCondition();
						AdvQueryCondition acon = parseJsonCondition(jsonString);
						String customer = acon.getSql();
						if(customer!=null){
							List<Object> customerValue = acon.getValues();
							classifyMap.put(customer, customerValue);
						}
					}
					if(flag){
						if(groupMap.containsKey(dc.getDataGroup().getCode())){
							List<Map<String, List<Object>>> temp = groupMap.get(dc.getDataGroup().getCode());
							temp.add(classifyMap);
						}else{
							List<Map<String, List<Object>>> temp = new ArrayList<Map<String, List<Object>>>();
							temp.add(classifyMap);
							groupMap.put(dc.getDataGroup().getCode(), temp);
						}
					}
				} else {
					String idStr = classifyCodeArray[i].substring(classifyCodeArray[i].lastIndexOf(":") + 1);
					advCondition = conditionService.getAdvQueryConditionAndSubs(Long.parseLong(idStr));
					advCondition = conditionService.toSql(advCondition);
				}
			}
			
			String totalClassifySql = "";
			List<Object> classObjs = new ArrayList<Object>();
			if(groupMap != null && groupMap.size() > 0){
				for(Map.Entry<String, List<Map<String, List<Object>>>> bentry : groupMap.entrySet()){
					if(bentry.getValue()!=null){
						for(Map<String, List<Object>> classifyMap : bentry.getValue()){
							if(classifyMap!=null && classifyMap.size()>0){
								if(totalClassifySql.length() > 0){
									totalClassifySql += " AND ";
								}
								if(classifyMap.size() > 1) {
									totalClassifySql += " ( ";
								}
								String classifySql = "";
								for(Map.Entry<String, List<Object>> entry : classifyMap.entrySet()){
									classifySql = classifySql + " OR " + entry.getKey();
									if(entry.getValue()!=null && entry.getValue().size() > 0){
										classObjs.addAll(entry.getValue());
									}
								}
								classifySql = classifySql.substring(3);
								totalClassifySql += classifySql;
								if(classifyMap.size() > 1) {
									totalClassifySql += " ) ";
								}
							}
						}
					}
				}
			}
			if(null != advCondition) {
				StringBuilder advSql = new StringBuilder();
				List<Object> advValue = new ArrayList<Object>();
				if(null != advCondition.getSql() && !advCondition.getSql().isEmpty()) {
					if(totalClassifySql.length() > 0){
						advSql.append(" AND ");
					}
					advSql.append(advCondition.getSql());
					advValue.addAll(advCondition.getValues());
					totalClassifySql += advSql;
					classObjs.addAll(advValue);
				}
			}
			params.add(new Param("classifySql", totalClassifySql));
			params.add(new Param("classifySqlValues", classObjs));
		}
	}
	
	/**
	 * 下载导入模板下载全部模型 ljc
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/allTempleteDownload", results = { @Result(name="excel",type="excel",location="changePackageList-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
	})
	public String allTempleteDownload() throws Exception{
		useForImportFlag = true;
		isNeedSaveCookie = false;
		// 导出模板前先组织好主模型的queryconfig
		Model realmodel = modelServiceFoundation.getModel("WOM_7.5.0.0_produceTask_ProduceTask");
		queryConfig = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><list>";
		
		//导入导出模板配置里面的property的code取出来用于后面过滤，并且防止parseXml中将generateFlag修改掉
       	boolean generateFlagTemp=this.generateFlag;
		ImportTemplate importTemplate=importTemplateServiceFoundation.getImportTemplateByCode(realmodel.getCode());
		this.generateFlag=generateFlagTemp;
		
		if(importTemplate!=null){
			queryConfig=importTemplate.getValue();
		}
		
		queryConfig=getQueryConfig(realmodel.getCode(),queryConfig,false);
		
		return "excel";
	}
	
	/**
	 * 重新组织queryConfig
	 * @param modelCode
	 * @param queryConfig
	 * @param isProj
	 * @return
	 */
	private String getQueryConfig(String modelCode,String queryConfig,Boolean isProj){
		Model model=modelServiceFoundation.getModel(modelCode);

		List<String> runningCustomPropertyCode = importTemplateServiceFoundation.getRunningCustomProperties(modelCode);//已启用的自定义字段
		Map<String,Object> excelRunningCustomPropertyCode=new HashMap<String, Object>();
		excelRunningCustomPropertyCode.put(modelCode, runningCustomPropertyCode);
		
		String supplyConfig = new String();
		
		List<Criterion> criterionList=new ArrayList<Criterion>();
		criterionList.add(Restrictions.eq("model.code", model.getCode()));
		criterionList.add(Restrictions.eq("valid", true));
		List<Property> properties = modelServiceFoundation.findProperties(criterionList.toArray(new Criterion[0]));
		
		//用于导入时条件过滤
		for(Property p : properties){
			if( (p.getIsBussinessKey() || p.getIsMainDisplay()) && !p.getName().equals("id") && !queryConfig.contains(p.getCode()) ){
				supplyConfig += generteAuxXml(p);
			}else if(p.getIsCustom() && runningCustomPropertyCode.contains(p.getCode()) && !p.getNullable() && !queryConfig.contains(p.getCode())){
				supplyConfig += generteAuxXml(p);
			}else if(!p.getMultable() && !p.getNullable() && !p.getName().equals("id") && !queryConfig.contains(p.getCode()) &&
					((p.getIsCustom() && runningCustomPropertyCode.contains(p.getCode())) || !p.getIsCustom())  ){//用于导入时非空字段必导
				if(p.getType() != null && !p.getType().toString().equals("OBJECT")){
					supplyConfig += generteAuxXml(p);
				}
				if(p.getType() != null && p.getType().toString().equals("OBJECT") ){
					Model assModel = null;
					if(!p.getIsCustom()){
						//String assProperty = drdcptmx1Service.getAssProperty(p.getCode());	
						//String assModelCode = drdcptmx1Service.getPropertyModelCode(assProperty);
						//assModel = modelServiceFoundation.getModel(assModelCode);
						assModel = p.getAssociatedProperty().getModel();
					}else{
						if(isProj){
							List<CustomPropertyModelMapping> modelMappings = viewServiceFoundation.findCustomPropertyForAsso(p.getModel().getCode(), p.getCode());
							
							//List<CustomPropertyModelMapping> modelMappings = viewServiceFoundation.findCustomPropertyForAsso(p.getModel().getCode(), p.getCode());
							if(modelMappings != null && modelMappings.size()>0){
								assModel = modelMappings.get(0).getAssociatedProperty().getModel();
							}
						}
					}
					
					List<Property> assProperties = modelServiceFoundation.findProperties(assModel);
					
					if(assProperties!=null){
						//获取模型中Id对应的数据库列名
						String idColumnName = "ID";
						for(Property ap : assProperties){
							if(ap.getName()!=null && ap.getName().equals("id")){
								idColumnName = ap.getColumnName();
							}
						}
							
						for(Property ap : assProperties){
							if((ap.getIsMainDisplay() && !ap.getName().equals("id")) || ap.getIsBussinessKey()){
								supplyConfig += generteAuxObjXml(p, ap, assModel, idColumnName, model);
							}
						}
					}
				}
			}else if( p.getName().equals("tableNo") && !queryConfig.contains(p.getCode()) ){
				supplyConfig += generteAuxXml(p);
			}else if( p.getName().equals("ownerStaff") ){//用于导出时，基础表单必导所有者
				//String assProperty = drdcptmx1Service.getAssProperty(p.getCode());	
				//String assModelCode = drdcptmx1Service.getPropertyModelCode(assProperty);
				//Model assModel = modelServiceFoundation.getModel(assModelCode);
				Model assModel = p.getAssociatedProperty().getModel();
				if(!queryConfig.contains("ownerStaff.code")){
					supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerStaffCode");
				}
				if(!queryConfig.contains("ownerStaff.name")){
					supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerStaffName");
				}
			}else if( p.getName().equals("ownerPosition") && !p.getModel().getEntity().getIsBase() ){//用于导出时，流程表单导出拥有者岗位
				//String assProperty = drdcptmx1Service.getAssProperty(p.getCode());	
				//String assModelCode = drdcptmx1Service.getPropertyModelCode(assProperty);
				//Model assModel = modelServiceFoundation.getModel(assModelCode);
				Model assModel = p.getAssociatedProperty().getModel();
				if(!queryConfig.contains("ownerPosition.code")){
					supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerPositionCode");
				}
				if(!queryConfig.contains("ownerPosition.name")){
					supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerPositionName");
				}
			}
		}
		
		if(supplyConfig.length()>0 && queryConfig.lastIndexOf("</list>")>0){
			queryConfig = queryConfig.substring(0, queryConfig.lastIndexOf("</list>")) + supplyConfig + "</list>";
		}else if(supplyConfig.length()>0 && queryConfig.lastIndexOf("</list>")<0){
			queryConfig = queryConfig + supplyConfig + "</list>";
		}else if(queryConfig.lastIndexOf("</list>")<0){
			queryConfig = queryConfig + "</list>";
		}
		return queryConfig;
	}
	@Override
	public int findFieldPermission(String modelCode, String propertyKey) {
		return userFieldPermissionService.findFieldPermission(modelCode, propertyKey, null);
	}	
	
	private String bap_validate_datagrids;
		
	public String getBap_validate_datagrids() {
		return bap_validate_datagrids;
	}
	
	// DataGrid 修改后公用方法 Start 
	
	private String fLTU(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToUpper(str);
	}
	
	private String fLTL(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToLower(str);
	}
	
	private Page dgPage;
	public Page getDgPage(){
		if(null == dgPage){
			dgPage = new Page(1,20);
		}
		return dgPage;
	}
	
	private Map<String,Class> dgClassMap;
	
	public Map<String, Class> getDgClassMap() {
		if(null==dgClassMap){
			dgClassMap=new HashMap<String, Class>();
		}
		return dgClassMap;
	}
	
	public String dataGridRefCopy(DataGrid dg) throws Exception{
		Model model = dg.getTargetModel();
		String artifact=model.getEntity().getModule().getArtifact();
		Class dgclass=Class.forName("com.supcon.orchid."+artifact+".entities."+model.getJpaName());
		setFieldPermissionModelCode(model.getCode());
		List<Property> pros = modelServiceFoundation.findProperties(model);
		produceTaskService.findDataGridPage(dg,dgclass,getDgPage(),produceTask,"", null);
		if(model.getDataType()==2){
			Class thisclass=this.getClass();
			Field serviceField=thisclass.getDeclaredField(fLTL(model.getModelName())+"Service");
			Class serviceType=serviceField.getType();
			serviceType.getMethod("convertTree",java.util.List.class).invoke(serviceField.get(this), getDgPage().getResult());
		}
		List newList = new ArrayList();
		for(int i = 0; i < dgPage.getResult().size(); i++){
			Object oRecord = dgPage.getResult().get(i);
			Object emptyRecord = dgclass.newInstance();
			for(Property p : pros){
				if (!((p.getIsBussinessKey() != null && p.getIsBussinessKey()) || (p.getIsInherent() != null && p.getIsInherent()))) {
					String setMethod = "set" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					String getMethod = "get" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					try{
						Method getValue = dgclass.getMethod(getMethod, null);
						Class returnType = getValue.getReturnType();
						Object gValue = getValue.invoke(oRecord, null);
						Method setValue = null;
						setValue = dgclass.getMethod(setMethod, new Class[]{returnType});
						setValue.invoke(emptyRecord, gValue);
					}catch(Exception e){
						logger.debug(e.getMessage());
					}
				}
			}
			if(model.getDataType()==2){
				dgclass.getMethod("setLayRec",String.class).invoke(emptyRecord,dgclass.getMethod("getLayRec",null).invoke(oRecord,null).toString());
				dgclass.getMethod("setFullPathName",String.class).invoke(emptyRecord,OrchidUtils.getMainDisplayValue(oRecord).toString());
				dgclass.getMethod("setLayNo",Integer.class).invoke(emptyRecord,Integer.valueOf(dgclass.getMethod("getLayNo",null).invoke(oRecord,null).toString()));
				dgclass.getMethod("set_code",String.class).invoke(emptyRecord,dgclass.getMethod("getId",null).invoke(oRecord,null).toString());
				dgclass.getMethod("set_parentCode",String.class).invoke(emptyRecord,dgclass.getMethod("getParentId",null).invoke(oRecord,null).toString());
				dgclass.getMethod("setIsParent",Boolean.class).invoke(emptyRecord,Boolean.valueOf(dgclass.getMethod("getIsParent",null).invoke(oRecord,null).toString()));
				dgclass.getMethod("setLeaf",Boolean.class).invoke(emptyRecord,Boolean.valueOf(dgclass.getMethod("isLeaf",null).invoke(oRecord,null).toString()));
			}
			List<String> multiKey =new ArrayList<String>();
			Map confMap=dg.getConfigMap();
			Map layoutMap = (Map) confMap.get("layout");
			List<Map> ls = (List<Map>) layoutMap.get("sections");
			for(Map lm:ls){
				if(lm.get("regionType").equals("DATAGRID")){
					List<Map> lc = (List<Map>) lm.get("cells");
					for(Map lk:lc){
						if("MULTSELECT".equals(lk.get("showType"))&&lk.get("key")!=null){
							multiKey.add(lk.get("key").toString());
						}
					}
				}
			}
			if(multiKey.size()>0){
				for(String key:multiKey){
					dgclass.getMethod("set"+fLTU(key)+"multiselectIDs", String.class).invoke(emptyRecord, dgclass.getMethod("get"+fLTU(key)+"multiselectIDs",null).invoke(oRecord,null).toString());
					dgclass.getMethod("set"+fLTU(key)+"multiselectNames", String.class).invoke(emptyRecord, dgclass.getMethod("get"+fLTU(key)+"multiselectNames",null).invoke(oRecord,null).toString());
				}
			}
			newList.add(emptyRecord);
		}
		dgPage.setResult(newList);
		if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
		if(dg.getEx()){
			return "xml";
		}else{
			return SUCCESS;
		}
	}
	
	private Map<String,String> dgDeletedIds;
	
	public Map<String, String> getDgDeletedIds() {
		if(null==dgDeletedIds){
			dgDeletedIds=new HashMap<String, String>();
		}
		return dgDeletedIds;
	}
	
	private Map<String,String> dgLists;
	
	public Map<String, String> getDgLists() {
		if(null==dgLists){
			dgLists=new HashMap<String, String>();
		}
		return dgLists;
	}
	
	// DataGrid 修改后公用方法  End 
	
	
	private Page<WOMAdjustOrTempHead> dg1542100691662Page;
	public Page<WOMAdjustOrTempHead> getDg1542100691662Page(){
		if(null == dg1542100691662Page){
			dg1542100691662Page = new Page<WOMAdjustOrTempHead>(1,20);
		}
		return dg1542100691662Page;
	}
	
	private Class dg1542100691662Clazz = WOMAdjustOrTempHead.class;
	
	public Class getDg1542100691662Clazz() {
		return dg1542100691662Clazz;
	}
	
	private List<WOMAdjustOrTempHead> dg1542100691662List;
	public List<WOMAdjustOrTempHead> getDg1542100691662List(){
		if(null == dg1542100691662List){
			dg1542100691662List = new ArrayList<WOMAdjustOrTempHead>();
		}
		return dg1542100691662List;
	}
	public void setDg1542100691662ListJson(String json) {
		//dg1542100691662List = (List<WOMAdjustOrTempHead>) produceTaskService.generateObjectFromJson(json, WOMAdjustOrTempHead.class);
	}
	
	private List<Long> dg1542100691662DeletedIds;
	public List<Long> getDg1542100691662DeletedIds(){
		if(null == dg1542100691662DeletedIds){
			dg1542100691662DeletedIds = new ArrayList<Long>();
		}
		return dg1542100691662DeletedIds;
	}

	private Page<WOMAdjustOrTempRecords> dg1542100698339Page;
	public Page<WOMAdjustOrTempRecords> getDg1542100698339Page(){
		if(null == dg1542100698339Page){
			dg1542100698339Page = new Page<WOMAdjustOrTempRecords>(1,20);
		}
		return dg1542100698339Page;
	}
	
	private Class dg1542100698339Clazz = WOMAdjustOrTempRecords.class;
	
	public Class getDg1542100698339Clazz() {
		return dg1542100698339Clazz;
	}
	
	private List<WOMAdjustOrTempRecords> dg1542100698339List;
	public List<WOMAdjustOrTempRecords> getDg1542100698339List(){
		if(null == dg1542100698339List){
			dg1542100698339List = new ArrayList<WOMAdjustOrTempRecords>();
		}
		return dg1542100698339List;
	}
	public void setDg1542100698339ListJson(String json) {
		//dg1542100698339List = (List<WOMAdjustOrTempRecords>) produceTaskService.generateObjectFromJson(json, WOMAdjustOrTempRecords.class);
	}
	
	private List<Long> dg1542100698339DeletedIds;
	public List<Long> getDg1542100698339DeletedIds(){
		if(null == dg1542100698339DeletedIds){
			dg1542100698339DeletedIds = new ArrayList<Long>();
		}
		return dg1542100698339DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505983091921Page;
	public Page<WOMProduceTaskActive> getDg1505983091921Page(){
		if(null == dg1505983091921Page){
			dg1505983091921Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505983091921Page;
	}
	
	private Class dg1505983091921Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505983091921Clazz() {
		return dg1505983091921Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505983091921List;
	public List<WOMProduceTaskActive> getDg1505983091921List(){
		if(null == dg1505983091921List){
			dg1505983091921List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505983091921List;
	}
	public void setDg1505983091921ListJson(String json) {
		//dg1505983091921List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505983091921DeletedIds;
	public List<Long> getDg1505983091921DeletedIds(){
		if(null == dg1505983091921DeletedIds){
			dg1505983091921DeletedIds = new ArrayList<Long>();
		}
		return dg1505983091921DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505983091997Page;
	public Page<WOMProduceMaterialSum> getDg1505983091997Page(){
		if(null == dg1505983091997Page){
			dg1505983091997Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505983091997Page;
	}
	
	private Class dg1505983091997Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505983091997Clazz() {
		return dg1505983091997Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505983091997List;
	public List<WOMProduceMaterialSum> getDg1505983091997List(){
		if(null == dg1505983091997List){
			dg1505983091997List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505983091997List;
	}
	public void setDg1505983091997ListJson(String json) {
		//dg1505983091997List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505983091997DeletedIds;
	public List<Long> getDg1505983091997DeletedIds(){
		if(null == dg1505983091997DeletedIds){
			dg1505983091997DeletedIds = new ArrayList<Long>();
		}
		return dg1505983091997DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1506060049547Page;
	public Page<WOMProduceTaskActive> getDg1506060049547Page(){
		if(null == dg1506060049547Page){
			dg1506060049547Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1506060049547Page;
	}
	
	private Class dg1506060049547Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1506060049547Clazz() {
		return dg1506060049547Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1506060049547List;
	public List<WOMProduceTaskActive> getDg1506060049547List(){
		if(null == dg1506060049547List){
			dg1506060049547List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1506060049547List;
	}
	public void setDg1506060049547ListJson(String json) {
		//dg1506060049547List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1506060049547DeletedIds;
	public List<Long> getDg1506060049547DeletedIds(){
		if(null == dg1506060049547DeletedIds){
			dg1506060049547DeletedIds = new ArrayList<Long>();
		}
		return dg1506060049547DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1506060049644Page;
	public Page<WOMProduceMaterialSum> getDg1506060049644Page(){
		if(null == dg1506060049644Page){
			dg1506060049644Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1506060049644Page;
	}
	
	private Class dg1506060049644Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1506060049644Clazz() {
		return dg1506060049644Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1506060049644List;
	public List<WOMProduceMaterialSum> getDg1506060049644List(){
		if(null == dg1506060049644List){
			dg1506060049644List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1506060049644List;
	}
	public void setDg1506060049644ListJson(String json) {
		//dg1506060049644List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1506060049644DeletedIds;
	public List<Long> getDg1506060049644DeletedIds(){
		if(null == dg1506060049644DeletedIds){
			dg1506060049644DeletedIds = new ArrayList<Long>();
		}
		return dg1506060049644DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1506306746525Page;
	public Page<WOMProduceTaskActive> getDg1506306746525Page(){
		if(null == dg1506306746525Page){
			dg1506306746525Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1506306746525Page;
	}
	
	private Class dg1506306746525Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1506306746525Clazz() {
		return dg1506306746525Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1506306746525List;
	public List<WOMProduceTaskActive> getDg1506306746525List(){
		if(null == dg1506306746525List){
			dg1506306746525List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1506306746525List;
	}
	public void setDg1506306746525ListJson(String json) {
		//dg1506306746525List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1506306746525DeletedIds;
	public List<Long> getDg1506306746525DeletedIds(){
		if(null == dg1506306746525DeletedIds){
			dg1506306746525DeletedIds = new ArrayList<Long>();
		}
		return dg1506306746525DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1506306746606Page;
	public Page<WOMProduceMaterialSum> getDg1506306746606Page(){
		if(null == dg1506306746606Page){
			dg1506306746606Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1506306746606Page;
	}
	
	private Class dg1506306746606Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1506306746606Clazz() {
		return dg1506306746606Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1506306746606List;
	public List<WOMProduceMaterialSum> getDg1506306746606List(){
		if(null == dg1506306746606List){
			dg1506306746606List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1506306746606List;
	}
	public void setDg1506306746606ListJson(String json) {
		//dg1506306746606List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1506306746606DeletedIds;
	public List<Long> getDg1506306746606DeletedIds(){
		if(null == dg1506306746606DeletedIds){
			dg1506306746606DeletedIds = new ArrayList<Long>();
		}
		return dg1506306746606DeletedIds;
	}

	private Page<WOMProdTaskProcExelog> dg1498733248586Page;
	public Page<WOMProdTaskProcExelog> getDg1498733248586Page(){
		if(null == dg1498733248586Page){
			dg1498733248586Page = new Page<WOMProdTaskProcExelog>(1,20);
		}
		return dg1498733248586Page;
	}
	
	private Class dg1498733248586Clazz = WOMProdTaskProcExelog.class;
	
	public Class getDg1498733248586Clazz() {
		return dg1498733248586Clazz;
	}
	
	private List<WOMProdTaskProcExelog> dg1498733248586List;
	public List<WOMProdTaskProcExelog> getDg1498733248586List(){
		if(null == dg1498733248586List){
			dg1498733248586List = new ArrayList<WOMProdTaskProcExelog>();
		}
		return dg1498733248586List;
	}
	public void setDg1498733248586ListJson(String json) {
		//dg1498733248586List = (List<WOMProdTaskProcExelog>) produceTaskService.generateObjectFromJson(json, WOMProdTaskProcExelog.class);
	}
	
	private List<Long> dg1498733248586DeletedIds;
	public List<Long> getDg1498733248586DeletedIds(){
		if(null == dg1498733248586DeletedIds){
			dg1498733248586DeletedIds = new ArrayList<Long>();
		}
		return dg1498733248586DeletedIds;
	}

	private Page<WOMProdTaskActiExelog> dg1498733279732Page;
	public Page<WOMProdTaskActiExelog> getDg1498733279732Page(){
		if(null == dg1498733279732Page){
			dg1498733279732Page = new Page<WOMProdTaskActiExelog>(1,20);
		}
		return dg1498733279732Page;
	}
	
	private Class dg1498733279732Clazz = WOMProdTaskActiExelog.class;
	
	public Class getDg1498733279732Clazz() {
		return dg1498733279732Clazz;
	}
	
	private List<WOMProdTaskActiExelog> dg1498733279732List;
	public List<WOMProdTaskActiExelog> getDg1498733279732List(){
		if(null == dg1498733279732List){
			dg1498733279732List = new ArrayList<WOMProdTaskActiExelog>();
		}
		return dg1498733279732List;
	}
	public void setDg1498733279732ListJson(String json) {
		//dg1498733279732List = (List<WOMProdTaskActiExelog>) produceTaskService.generateObjectFromJson(json, WOMProdTaskActiExelog.class);
	}
	
	private List<Long> dg1498733279732DeletedIds;
	public List<Long> getDg1498733279732DeletedIds(){
		if(null == dg1498733279732DeletedIds){
			dg1498733279732DeletedIds = new ArrayList<Long>();
		}
		return dg1498733279732DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1489730796226Page;
	public Page<WOMProduceTaskActive> getDg1489730796226Page(){
		if(null == dg1489730796226Page){
			dg1489730796226Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1489730796226Page;
	}
	
	private Class dg1489730796226Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1489730796226Clazz() {
		return dg1489730796226Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1489730796226List;
	public List<WOMProduceTaskActive> getDg1489730796226List(){
		if(null == dg1489730796226List){
			dg1489730796226List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1489730796226List;
	}
	public void setDg1489730796226ListJson(String json) {
		//dg1489730796226List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1489730796226DeletedIds;
	public List<Long> getDg1489730796226DeletedIds(){
		if(null == dg1489730796226DeletedIds){
			dg1489730796226DeletedIds = new ArrayList<Long>();
		}
		return dg1489730796226DeletedIds;
	}

	private Page<WOMProduceTaskProcess> dg1489731937175Page;
	public Page<WOMProduceTaskProcess> getDg1489731937175Page(){
		if(null == dg1489731937175Page){
			dg1489731937175Page = new Page<WOMProduceTaskProcess>(1,20);
		}
		return dg1489731937175Page;
	}
	
	private Class dg1489731937175Clazz = WOMProduceTaskProcess.class;
	
	public Class getDg1489731937175Clazz() {
		return dg1489731937175Clazz;
	}
	
	private List<WOMProduceTaskProcess> dg1489731937175List;
	public List<WOMProduceTaskProcess> getDg1489731937175List(){
		if(null == dg1489731937175List){
			dg1489731937175List = new ArrayList<WOMProduceTaskProcess>();
		}
		return dg1489731937175List;
	}
	public void setDg1489731937175ListJson(String json) {
		//dg1489731937175List = (List<WOMProduceTaskProcess>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskProcess.class);
	}
	
	private List<Long> dg1489731937175DeletedIds;
	public List<Long> getDg1489731937175DeletedIds(){
		if(null == dg1489731937175DeletedIds){
			dg1489731937175DeletedIds = new ArrayList<Long>();
		}
		return dg1489731937175DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1489732429091Page;
	public Page<WOMProduceMaterialSum> getDg1489732429091Page(){
		if(null == dg1489732429091Page){
			dg1489732429091Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1489732429091Page;
	}
	
	private Class dg1489732429091Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1489732429091Clazz() {
		return dg1489732429091Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1489732429091List;
	public List<WOMProduceMaterialSum> getDg1489732429091List(){
		if(null == dg1489732429091List){
			dg1489732429091List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1489732429091List;
	}
	public void setDg1489732429091ListJson(String json) {
		//dg1489732429091List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1489732429091DeletedIds;
	public List<Long> getDg1489732429091DeletedIds(){
		if(null == dg1489732429091DeletedIds){
			dg1489732429091DeletedIds = new ArrayList<Long>();
		}
		return dg1489732429091DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1489736028416Page;
	public Page<WOMProduceTaskActive> getDg1489736028416Page(){
		if(null == dg1489736028416Page){
			dg1489736028416Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1489736028416Page;
	}
	
	private Class dg1489736028416Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1489736028416Clazz() {
		return dg1489736028416Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1489736028416List;
	public List<WOMProduceTaskActive> getDg1489736028416List(){
		if(null == dg1489736028416List){
			dg1489736028416List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1489736028416List;
	}
	public void setDg1489736028416ListJson(String json) {
		//dg1489736028416List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1489736028416DeletedIds;
	public List<Long> getDg1489736028416DeletedIds(){
		if(null == dg1489736028416DeletedIds){
			dg1489736028416DeletedIds = new ArrayList<Long>();
		}
		return dg1489736028416DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1572513055658Page;
	public Page<WOMProduceTaskActive> getDg1572513055658Page(){
		if(null == dg1572513055658Page){
			dg1572513055658Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1572513055658Page;
	}
	
	private Class dg1572513055658Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1572513055658Clazz() {
		return dg1572513055658Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1572513055658List;
	public List<WOMProduceTaskActive> getDg1572513055658List(){
		if(null == dg1572513055658List){
			dg1572513055658List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1572513055658List;
	}
	public void setDg1572513055658ListJson(String json) {
		//dg1572513055658List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1572513055658DeletedIds;
	public List<Long> getDg1572513055658DeletedIds(){
		if(null == dg1572513055658DeletedIds){
			dg1572513055658DeletedIds = new ArrayList<Long>();
		}
		return dg1572513055658DeletedIds;
	}

	private Page<WOMProduceTaskProcess> dg1572513055772Page;
	public Page<WOMProduceTaskProcess> getDg1572513055772Page(){
		if(null == dg1572513055772Page){
			dg1572513055772Page = new Page<WOMProduceTaskProcess>(1,20);
		}
		return dg1572513055772Page;
	}
	
	private Class dg1572513055772Clazz = WOMProduceTaskProcess.class;
	
	public Class getDg1572513055772Clazz() {
		return dg1572513055772Clazz;
	}
	
	private List<WOMProduceTaskProcess> dg1572513055772List;
	public List<WOMProduceTaskProcess> getDg1572513055772List(){
		if(null == dg1572513055772List){
			dg1572513055772List = new ArrayList<WOMProduceTaskProcess>();
		}
		return dg1572513055772List;
	}
	public void setDg1572513055772ListJson(String json) {
		//dg1572513055772List = (List<WOMProduceTaskProcess>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskProcess.class);
	}
	
	private List<Long> dg1572513055772DeletedIds;
	public List<Long> getDg1572513055772DeletedIds(){
		if(null == dg1572513055772DeletedIds){
			dg1572513055772DeletedIds = new ArrayList<Long>();
		}
		return dg1572513055772DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1572513055825Page;
	public Page<WOMProduceMaterialSum> getDg1572513055825Page(){
		if(null == dg1572513055825Page){
			dg1572513055825Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1572513055825Page;
	}
	
	private Class dg1572513055825Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1572513055825Clazz() {
		return dg1572513055825Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1572513055825List;
	public List<WOMProduceMaterialSum> getDg1572513055825List(){
		if(null == dg1572513055825List){
			dg1572513055825List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1572513055825List;
	}
	public void setDg1572513055825ListJson(String json) {
		//dg1572513055825List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1572513055825DeletedIds;
	public List<Long> getDg1572513055825DeletedIds(){
		if(null == dg1572513055825DeletedIds){
			dg1572513055825DeletedIds = new ArrayList<Long>();
		}
		return dg1572513055825DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1572513055910Page;
	public Page<WOMProduceTaskActive> getDg1572513055910Page(){
		if(null == dg1572513055910Page){
			dg1572513055910Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1572513055910Page;
	}
	
	private Class dg1572513055910Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1572513055910Clazz() {
		return dg1572513055910Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1572513055910List;
	public List<WOMProduceTaskActive> getDg1572513055910List(){
		if(null == dg1572513055910List){
			dg1572513055910List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1572513055910List;
	}
	public void setDg1572513055910ListJson(String json) {
		//dg1572513055910List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1572513055910DeletedIds;
	public List<Long> getDg1572513055910DeletedIds(){
		if(null == dg1572513055910DeletedIds){
			dg1572513055910DeletedIds = new ArrayList<Long>();
		}
		return dg1572513055910DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1540191119508Page;
	public Page<WOMProduceTaskActive> getDg1540191119508Page(){
		if(null == dg1540191119508Page){
			dg1540191119508Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1540191119508Page;
	}
	
	private Class dg1540191119508Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1540191119508Clazz() {
		return dg1540191119508Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1540191119508List;
	public List<WOMProduceTaskActive> getDg1540191119508List(){
		if(null == dg1540191119508List){
			dg1540191119508List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1540191119508List;
	}
	public void setDg1540191119508ListJson(String json) {
		//dg1540191119508List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1540191119508DeletedIds;
	public List<Long> getDg1540191119508DeletedIds(){
		if(null == dg1540191119508DeletedIds){
			dg1540191119508DeletedIds = new ArrayList<Long>();
		}
		return dg1540191119508DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1540191119680Page;
	public Page<WOMProduceMaterialSum> getDg1540191119680Page(){
		if(null == dg1540191119680Page){
			dg1540191119680Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1540191119680Page;
	}
	
	private Class dg1540191119680Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1540191119680Clazz() {
		return dg1540191119680Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1540191119680List;
	public List<WOMProduceMaterialSum> getDg1540191119680List(){
		if(null == dg1540191119680List){
			dg1540191119680List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1540191119680List;
	}
	public void setDg1540191119680ListJson(String json) {
		//dg1540191119680List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1540191119680DeletedIds;
	public List<Long> getDg1540191119680DeletedIds(){
		if(null == dg1540191119680DeletedIds){
			dg1540191119680DeletedIds = new ArrayList<Long>();
		}
		return dg1540191119680DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1540191119773Page;
	public Page<WOMProduceTaskActive> getDg1540191119773Page(){
		if(null == dg1540191119773Page){
			dg1540191119773Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1540191119773Page;
	}
	
	private Class dg1540191119773Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1540191119773Clazz() {
		return dg1540191119773Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1540191119773List;
	public List<WOMProduceTaskActive> getDg1540191119773List(){
		if(null == dg1540191119773List){
			dg1540191119773List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1540191119773List;
	}
	public void setDg1540191119773ListJson(String json) {
		//dg1540191119773List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1540191119773DeletedIds;
	public List<Long> getDg1540191119773DeletedIds(){
		if(null == dg1540191119773DeletedIds){
			dg1540191119773DeletedIds = new ArrayList<Long>();
		}
		return dg1540191119773DeletedIds;
	}

	private Page<WOMProduceTaskProcess> dg1540191119898Page;
	public Page<WOMProduceTaskProcess> getDg1540191119898Page(){
		if(null == dg1540191119898Page){
			dg1540191119898Page = new Page<WOMProduceTaskProcess>(1,20);
		}
		return dg1540191119898Page;
	}
	
	private Class dg1540191119898Clazz = WOMProduceTaskProcess.class;
	
	public Class getDg1540191119898Clazz() {
		return dg1540191119898Clazz;
	}
	
	private List<WOMProduceTaskProcess> dg1540191119898List;
	public List<WOMProduceTaskProcess> getDg1540191119898List(){
		if(null == dg1540191119898List){
			dg1540191119898List = new ArrayList<WOMProduceTaskProcess>();
		}
		return dg1540191119898List;
	}
	public void setDg1540191119898ListJson(String json) {
		//dg1540191119898List = (List<WOMProduceTaskProcess>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskProcess.class);
	}
	
	private List<Long> dg1540191119898DeletedIds;
	public List<Long> getDg1540191119898DeletedIds(){
		if(null == dg1540191119898DeletedIds){
			dg1540191119898DeletedIds = new ArrayList<Long>();
		}
		return dg1540191119898DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1490749384698Page;
	public Page<WOMProduceTaskActive> getDg1490749384698Page(){
		if(null == dg1490749384698Page){
			dg1490749384698Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1490749384698Page;
	}
	
	private Class dg1490749384698Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1490749384698Clazz() {
		return dg1490749384698Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1490749384698List;
	public List<WOMProduceTaskActive> getDg1490749384698List(){
		if(null == dg1490749384698List){
			dg1490749384698List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1490749384698List;
	}
	public void setDg1490749384698ListJson(String json) {
		//dg1490749384698List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1490749384698DeletedIds;
	public List<Long> getDg1490749384698DeletedIds(){
		if(null == dg1490749384698DeletedIds){
			dg1490749384698DeletedIds = new ArrayList<Long>();
		}
		return dg1490749384698DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1490749384787Page;
	public Page<WOMProduceMaterialSum> getDg1490749384787Page(){
		if(null == dg1490749384787Page){
			dg1490749384787Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1490749384787Page;
	}
	
	private Class dg1490749384787Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1490749384787Clazz() {
		return dg1490749384787Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1490749384787List;
	public List<WOMProduceMaterialSum> getDg1490749384787List(){
		if(null == dg1490749384787List){
			dg1490749384787List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1490749384787List;
	}
	public void setDg1490749384787ListJson(String json) {
		//dg1490749384787List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1490749384787DeletedIds;
	public List<Long> getDg1490749384787DeletedIds(){
		if(null == dg1490749384787DeletedIds){
			dg1490749384787DeletedIds = new ArrayList<Long>();
		}
		return dg1490749384787DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1490749384886Page;
	public Page<WOMProduceTaskActive> getDg1490749384886Page(){
		if(null == dg1490749384886Page){
			dg1490749384886Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1490749384886Page;
	}
	
	private Class dg1490749384886Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1490749384886Clazz() {
		return dg1490749384886Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1490749384886List;
	public List<WOMProduceTaskActive> getDg1490749384886List(){
		if(null == dg1490749384886List){
			dg1490749384886List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1490749384886List;
	}
	public void setDg1490749384886ListJson(String json) {
		//dg1490749384886List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1490749384886DeletedIds;
	public List<Long> getDg1490749384886DeletedIds(){
		if(null == dg1490749384886DeletedIds){
			dg1490749384886DeletedIds = new ArrayList<Long>();
		}
		return dg1490749384886DeletedIds;
	}

	private Page<WOMProduceTaskProcess> dg1490749384962Page;
	public Page<WOMProduceTaskProcess> getDg1490749384962Page(){
		if(null == dg1490749384962Page){
			dg1490749384962Page = new Page<WOMProduceTaskProcess>(1,20);
		}
		return dg1490749384962Page;
	}
	
	private Class dg1490749384962Clazz = WOMProduceTaskProcess.class;
	
	public Class getDg1490749384962Clazz() {
		return dg1490749384962Clazz;
	}
	
	private List<WOMProduceTaskProcess> dg1490749384962List;
	public List<WOMProduceTaskProcess> getDg1490749384962List(){
		if(null == dg1490749384962List){
			dg1490749384962List = new ArrayList<WOMProduceTaskProcess>();
		}
		return dg1490749384962List;
	}
	public void setDg1490749384962ListJson(String json) {
		//dg1490749384962List = (List<WOMProduceTaskProcess>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskProcess.class);
	}
	
	private List<Long> dg1490749384962DeletedIds;
	public List<Long> getDg1490749384962DeletedIds(){
		if(null == dg1490749384962DeletedIds){
			dg1490749384962DeletedIds = new ArrayList<Long>();
		}
		return dg1490749384962DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505802969630Page;
	public Page<WOMProduceTaskActive> getDg1505802969630Page(){
		if(null == dg1505802969630Page){
			dg1505802969630Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505802969630Page;
	}
	
	private Class dg1505802969630Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505802969630Clazz() {
		return dg1505802969630Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505802969630List;
	public List<WOMProduceTaskActive> getDg1505802969630List(){
		if(null == dg1505802969630List){
			dg1505802969630List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505802969630List;
	}
	public void setDg1505802969630ListJson(String json) {
		//dg1505802969630List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505802969630DeletedIds;
	public List<Long> getDg1505802969630DeletedIds(){
		if(null == dg1505802969630DeletedIds){
			dg1505802969630DeletedIds = new ArrayList<Long>();
		}
		return dg1505802969630DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505802969738Page;
	public Page<WOMProduceMaterialSum> getDg1505802969738Page(){
		if(null == dg1505802969738Page){
			dg1505802969738Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505802969738Page;
	}
	
	private Class dg1505802969738Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505802969738Clazz() {
		return dg1505802969738Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505802969738List;
	public List<WOMProduceMaterialSum> getDg1505802969738List(){
		if(null == dg1505802969738List){
			dg1505802969738List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505802969738List;
	}
	public void setDg1505802969738ListJson(String json) {
		//dg1505802969738List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505802969738DeletedIds;
	public List<Long> getDg1505802969738DeletedIds(){
		if(null == dg1505802969738DeletedIds){
			dg1505802969738DeletedIds = new ArrayList<Long>();
		}
		return dg1505802969738DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505804201833Page;
	public Page<WOMProduceTaskActive> getDg1505804201833Page(){
		if(null == dg1505804201833Page){
			dg1505804201833Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505804201833Page;
	}
	
	private Class dg1505804201833Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505804201833Clazz() {
		return dg1505804201833Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505804201833List;
	public List<WOMProduceTaskActive> getDg1505804201833List(){
		if(null == dg1505804201833List){
			dg1505804201833List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505804201833List;
	}
	public void setDg1505804201833ListJson(String json) {
		//dg1505804201833List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505804201833DeletedIds;
	public List<Long> getDg1505804201833DeletedIds(){
		if(null == dg1505804201833DeletedIds){
			dg1505804201833DeletedIds = new ArrayList<Long>();
		}
		return dg1505804201833DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505804201918Page;
	public Page<WOMProduceMaterialSum> getDg1505804201918Page(){
		if(null == dg1505804201918Page){
			dg1505804201918Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505804201918Page;
	}
	
	private Class dg1505804201918Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505804201918Clazz() {
		return dg1505804201918Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505804201918List;
	public List<WOMProduceMaterialSum> getDg1505804201918List(){
		if(null == dg1505804201918List){
			dg1505804201918List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505804201918List;
	}
	public void setDg1505804201918ListJson(String json) {
		//dg1505804201918List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505804201918DeletedIds;
	public List<Long> getDg1505804201918DeletedIds(){
		if(null == dg1505804201918DeletedIds){
			dg1505804201918DeletedIds = new ArrayList<Long>();
		}
		return dg1505804201918DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1495850751698Page;
	public Page<WOMProduceTaskActive> getDg1495850751698Page(){
		if(null == dg1495850751698Page){
			dg1495850751698Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1495850751698Page;
	}
	
	private Class dg1495850751698Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1495850751698Clazz() {
		return dg1495850751698Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1495850751698List;
	public List<WOMProduceTaskActive> getDg1495850751698List(){
		if(null == dg1495850751698List){
			dg1495850751698List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1495850751698List;
	}
	public void setDg1495850751698ListJson(String json) {
		//dg1495850751698List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1495850751698DeletedIds;
	public List<Long> getDg1495850751698DeletedIds(){
		if(null == dg1495850751698DeletedIds){
			dg1495850751698DeletedIds = new ArrayList<Long>();
		}
		return dg1495850751698DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1495850751757Page;
	public Page<WOMProduceMaterialSum> getDg1495850751757Page(){
		if(null == dg1495850751757Page){
			dg1495850751757Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1495850751757Page;
	}
	
	private Class dg1495850751757Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1495850751757Clazz() {
		return dg1495850751757Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1495850751757List;
	public List<WOMProduceMaterialSum> getDg1495850751757List(){
		if(null == dg1495850751757List){
			dg1495850751757List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1495850751757List;
	}
	public void setDg1495850751757ListJson(String json) {
		//dg1495850751757List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1495850751757DeletedIds;
	public List<Long> getDg1495850751757DeletedIds(){
		if(null == dg1495850751757DeletedIds){
			dg1495850751757DeletedIds = new ArrayList<Long>();
		}
		return dg1495850751757DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1495850751807Page;
	public Page<WOMProduceTaskActive> getDg1495850751807Page(){
		if(null == dg1495850751807Page){
			dg1495850751807Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1495850751807Page;
	}
	
	private Class dg1495850751807Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1495850751807Clazz() {
		return dg1495850751807Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1495850751807List;
	public List<WOMProduceTaskActive> getDg1495850751807List(){
		if(null == dg1495850751807List){
			dg1495850751807List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1495850751807List;
	}
	public void setDg1495850751807ListJson(String json) {
		//dg1495850751807List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1495850751807DeletedIds;
	public List<Long> getDg1495850751807DeletedIds(){
		if(null == dg1495850751807DeletedIds){
			dg1495850751807DeletedIds = new ArrayList<Long>();
		}
		return dg1495850751807DeletedIds;
	}

	private Page<WOMProduceTaskProcess> dg1495850751863Page;
	public Page<WOMProduceTaskProcess> getDg1495850751863Page(){
		if(null == dg1495850751863Page){
			dg1495850751863Page = new Page<WOMProduceTaskProcess>(1,20);
		}
		return dg1495850751863Page;
	}
	
	private Class dg1495850751863Clazz = WOMProduceTaskProcess.class;
	
	public Class getDg1495850751863Clazz() {
		return dg1495850751863Clazz;
	}
	
	private List<WOMProduceTaskProcess> dg1495850751863List;
	public List<WOMProduceTaskProcess> getDg1495850751863List(){
		if(null == dg1495850751863List){
			dg1495850751863List = new ArrayList<WOMProduceTaskProcess>();
		}
		return dg1495850751863List;
	}
	public void setDg1495850751863ListJson(String json) {
		//dg1495850751863List = (List<WOMProduceTaskProcess>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskProcess.class);
	}
	
	private List<Long> dg1495850751863DeletedIds;
	public List<Long> getDg1495850751863DeletedIds(){
		if(null == dg1495850751863DeletedIds){
			dg1495850751863DeletedIds = new ArrayList<Long>();
		}
		return dg1495850751863DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1496389818499Page;
	public Page<WOMProduceTaskActive> getDg1496389818499Page(){
		if(null == dg1496389818499Page){
			dg1496389818499Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1496389818499Page;
	}
	
	private Class dg1496389818499Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1496389818499Clazz() {
		return dg1496389818499Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1496389818499List;
	public List<WOMProduceTaskActive> getDg1496389818499List(){
		if(null == dg1496389818499List){
			dg1496389818499List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1496389818499List;
	}
	public void setDg1496389818499ListJson(String json) {
		//dg1496389818499List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1496389818499DeletedIds;
	public List<Long> getDg1496389818499DeletedIds(){
		if(null == dg1496389818499DeletedIds){
			dg1496389818499DeletedIds = new ArrayList<Long>();
		}
		return dg1496389818499DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1496389818610Page;
	public Page<WOMProduceMaterialSum> getDg1496389818610Page(){
		if(null == dg1496389818610Page){
			dg1496389818610Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1496389818610Page;
	}
	
	private Class dg1496389818610Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1496389818610Clazz() {
		return dg1496389818610Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1496389818610List;
	public List<WOMProduceMaterialSum> getDg1496389818610List(){
		if(null == dg1496389818610List){
			dg1496389818610List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1496389818610List;
	}
	public void setDg1496389818610ListJson(String json) {
		//dg1496389818610List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1496389818610DeletedIds;
	public List<Long> getDg1496389818610DeletedIds(){
		if(null == dg1496389818610DeletedIds){
			dg1496389818610DeletedIds = new ArrayList<Long>();
		}
		return dg1496389818610DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1496389818686Page;
	public Page<WOMProduceTaskActive> getDg1496389818686Page(){
		if(null == dg1496389818686Page){
			dg1496389818686Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1496389818686Page;
	}
	
	private Class dg1496389818686Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1496389818686Clazz() {
		return dg1496389818686Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1496389818686List;
	public List<WOMProduceTaskActive> getDg1496389818686List(){
		if(null == dg1496389818686List){
			dg1496389818686List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1496389818686List;
	}
	public void setDg1496389818686ListJson(String json) {
		//dg1496389818686List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1496389818686DeletedIds;
	public List<Long> getDg1496389818686DeletedIds(){
		if(null == dg1496389818686DeletedIds){
			dg1496389818686DeletedIds = new ArrayList<Long>();
		}
		return dg1496389818686DeletedIds;
	}

	private Page<WOMProduceTaskProcess> dg1496389818751Page;
	public Page<WOMProduceTaskProcess> getDg1496389818751Page(){
		if(null == dg1496389818751Page){
			dg1496389818751Page = new Page<WOMProduceTaskProcess>(1,20);
		}
		return dg1496389818751Page;
	}
	
	private Class dg1496389818751Clazz = WOMProduceTaskProcess.class;
	
	public Class getDg1496389818751Clazz() {
		return dg1496389818751Clazz;
	}
	
	private List<WOMProduceTaskProcess> dg1496389818751List;
	public List<WOMProduceTaskProcess> getDg1496389818751List(){
		if(null == dg1496389818751List){
			dg1496389818751List = new ArrayList<WOMProduceTaskProcess>();
		}
		return dg1496389818751List;
	}
	public void setDg1496389818751ListJson(String json) {
		//dg1496389818751List = (List<WOMProduceTaskProcess>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskProcess.class);
	}
	
	private List<Long> dg1496389818751DeletedIds;
	public List<Long> getDg1496389818751DeletedIds(){
		if(null == dg1496389818751DeletedIds){
			dg1496389818751DeletedIds = new ArrayList<Long>();
		}
		return dg1496389818751DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505285519431Page;
	public Page<WOMProduceMaterialSum> getDg1505285519431Page(){
		if(null == dg1505285519431Page){
			dg1505285519431Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505285519431Page;
	}
	
	private Class dg1505285519431Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505285519431Clazz() {
		return dg1505285519431Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505285519431List;
	public List<WOMProduceMaterialSum> getDg1505285519431List(){
		if(null == dg1505285519431List){
			dg1505285519431List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505285519431List;
	}
	public void setDg1505285519431ListJson(String json) {
		//dg1505285519431List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505285519431DeletedIds;
	public List<Long> getDg1505285519431DeletedIds(){
		if(null == dg1505285519431DeletedIds){
			dg1505285519431DeletedIds = new ArrayList<Long>();
		}
		return dg1505285519431DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505285519610Page;
	public Page<WOMProduceTaskActive> getDg1505285519610Page(){
		if(null == dg1505285519610Page){
			dg1505285519610Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505285519610Page;
	}
	
	private Class dg1505285519610Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505285519610Clazz() {
		return dg1505285519610Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505285519610List;
	public List<WOMProduceTaskActive> getDg1505285519610List(){
		if(null == dg1505285519610List){
			dg1505285519610List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505285519610List;
	}
	public void setDg1505285519610ListJson(String json) {
		//dg1505285519610List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505285519610DeletedIds;
	public List<Long> getDg1505285519610DeletedIds(){
		if(null == dg1505285519610DeletedIds){
			dg1505285519610DeletedIds = new ArrayList<Long>();
		}
		return dg1505285519610DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505456701981Page;
	public Page<WOMProduceTaskActive> getDg1505456701981Page(){
		if(null == dg1505456701981Page){
			dg1505456701981Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505456701981Page;
	}
	
	private Class dg1505456701981Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505456701981Clazz() {
		return dg1505456701981Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505456701981List;
	public List<WOMProduceTaskActive> getDg1505456701981List(){
		if(null == dg1505456701981List){
			dg1505456701981List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505456701981List;
	}
	public void setDg1505456701981ListJson(String json) {
		//dg1505456701981List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505456701981DeletedIds;
	public List<Long> getDg1505456701981DeletedIds(){
		if(null == dg1505456701981DeletedIds){
			dg1505456701981DeletedIds = new ArrayList<Long>();
		}
		return dg1505456701981DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505456702135Page;
	public Page<WOMProduceMaterialSum> getDg1505456702135Page(){
		if(null == dg1505456702135Page){
			dg1505456702135Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505456702135Page;
	}
	
	private Class dg1505456702135Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505456702135Clazz() {
		return dg1505456702135Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505456702135List;
	public List<WOMProduceMaterialSum> getDg1505456702135List(){
		if(null == dg1505456702135List){
			dg1505456702135List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505456702135List;
	}
	public void setDg1505456702135ListJson(String json) {
		//dg1505456702135List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505456702135DeletedIds;
	public List<Long> getDg1505456702135DeletedIds(){
		if(null == dg1505456702135DeletedIds){
			dg1505456702135DeletedIds = new ArrayList<Long>();
		}
		return dg1505456702135DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505974050406Page;
	public Page<WOMProduceTaskActive> getDg1505974050406Page(){
		if(null == dg1505974050406Page){
			dg1505974050406Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505974050406Page;
	}
	
	private Class dg1505974050406Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505974050406Clazz() {
		return dg1505974050406Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505974050406List;
	public List<WOMProduceTaskActive> getDg1505974050406List(){
		if(null == dg1505974050406List){
			dg1505974050406List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505974050406List;
	}
	public void setDg1505974050406ListJson(String json) {
		//dg1505974050406List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505974050406DeletedIds;
	public List<Long> getDg1505974050406DeletedIds(){
		if(null == dg1505974050406DeletedIds){
			dg1505974050406DeletedIds = new ArrayList<Long>();
		}
		return dg1505974050406DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505983284775Page;
	public Page<WOMProduceMaterialSum> getDg1505983284775Page(){
		if(null == dg1505983284775Page){
			dg1505983284775Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505983284775Page;
	}
	
	private Class dg1505983284775Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505983284775Clazz() {
		return dg1505983284775Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505983284775List;
	public List<WOMProduceMaterialSum> getDg1505983284775List(){
		if(null == dg1505983284775List){
			dg1505983284775List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505983284775List;
	}
	public void setDg1505983284775ListJson(String json) {
		//dg1505983284775List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505983284775DeletedIds;
	public List<Long> getDg1505983284775DeletedIds(){
		if(null == dg1505983284775DeletedIds){
			dg1505983284775DeletedIds = new ArrayList<Long>();
		}
		return dg1505983284775DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505975951232Page;
	public Page<WOMProduceTaskActive> getDg1505975951232Page(){
		if(null == dg1505975951232Page){
			dg1505975951232Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505975951232Page;
	}
	
	private Class dg1505975951232Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505975951232Clazz() {
		return dg1505975951232Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505975951232List;
	public List<WOMProduceTaskActive> getDg1505975951232List(){
		if(null == dg1505975951232List){
			dg1505975951232List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505975951232List;
	}
	public void setDg1505975951232ListJson(String json) {
		//dg1505975951232List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505975951232DeletedIds;
	public List<Long> getDg1505975951232DeletedIds(){
		if(null == dg1505975951232DeletedIds){
			dg1505975951232DeletedIds = new ArrayList<Long>();
		}
		return dg1505975951232DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505983664771Page;
	public Page<WOMProduceMaterialSum> getDg1505983664771Page(){
		if(null == dg1505983664771Page){
			dg1505983664771Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505983664771Page;
	}
	
	private Class dg1505983664771Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505983664771Clazz() {
		return dg1505983664771Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505983664771List;
	public List<WOMProduceMaterialSum> getDg1505983664771List(){
		if(null == dg1505983664771List){
			dg1505983664771List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505983664771List;
	}
	public void setDg1505983664771ListJson(String json) {
		//dg1505983664771List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505983664771DeletedIds;
	public List<Long> getDg1505983664771DeletedIds(){
		if(null == dg1505983664771DeletedIds){
			dg1505983664771DeletedIds = new ArrayList<Long>();
		}
		return dg1505983664771DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1504926238926Page;
	public Page<WOMProduceTaskActive> getDg1504926238926Page(){
		if(null == dg1504926238926Page){
			dg1504926238926Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1504926238926Page;
	}
	
	private Class dg1504926238926Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1504926238926Clazz() {
		return dg1504926238926Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1504926238926List;
	public List<WOMProduceTaskActive> getDg1504926238926List(){
		if(null == dg1504926238926List){
			dg1504926238926List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1504926238926List;
	}
	public void setDg1504926238926ListJson(String json) {
		//dg1504926238926List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1504926238926DeletedIds;
	public List<Long> getDg1504926238926DeletedIds(){
		if(null == dg1504926238926DeletedIds){
			dg1504926238926DeletedIds = new ArrayList<Long>();
		}
		return dg1504926238926DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505176886273Page;
	public Page<WOMProduceMaterialSum> getDg1505176886273Page(){
		if(null == dg1505176886273Page){
			dg1505176886273Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505176886273Page;
	}
	
	private Class dg1505176886273Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505176886273Clazz() {
		return dg1505176886273Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505176886273List;
	public List<WOMProduceMaterialSum> getDg1505176886273List(){
		if(null == dg1505176886273List){
			dg1505176886273List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505176886273List;
	}
	public void setDg1505176886273ListJson(String json) {
		//dg1505176886273List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505176886273DeletedIds;
	public List<Long> getDg1505176886273DeletedIds(){
		if(null == dg1505176886273DeletedIds){
			dg1505176886273DeletedIds = new ArrayList<Long>();
		}
		return dg1505176886273DeletedIds;
	}

	private Page<WOMProduceTaskActive> dg1505100155794Page;
	public Page<WOMProduceTaskActive> getDg1505100155794Page(){
		if(null == dg1505100155794Page){
			dg1505100155794Page = new Page<WOMProduceTaskActive>(1,20);
		}
		return dg1505100155794Page;
	}
	
	private Class dg1505100155794Clazz = WOMProduceTaskActive.class;
	
	public Class getDg1505100155794Clazz() {
		return dg1505100155794Clazz;
	}
	
	private List<WOMProduceTaskActive> dg1505100155794List;
	public List<WOMProduceTaskActive> getDg1505100155794List(){
		if(null == dg1505100155794List){
			dg1505100155794List = new ArrayList<WOMProduceTaskActive>();
		}
		return dg1505100155794List;
	}
	public void setDg1505100155794ListJson(String json) {
		//dg1505100155794List = (List<WOMProduceTaskActive>) produceTaskService.generateObjectFromJson(json, WOMProduceTaskActive.class);
	}
	
	private List<Long> dg1505100155794DeletedIds;
	public List<Long> getDg1505100155794DeletedIds(){
		if(null == dg1505100155794DeletedIds){
			dg1505100155794DeletedIds = new ArrayList<Long>();
		}
		return dg1505100155794DeletedIds;
	}

	private Page<WOMProduceMaterialSum> dg1505178110802Page;
	public Page<WOMProduceMaterialSum> getDg1505178110802Page(){
		if(null == dg1505178110802Page){
			dg1505178110802Page = new Page<WOMProduceMaterialSum>(1,20);
		}
		return dg1505178110802Page;
	}
	
	private Class dg1505178110802Clazz = WOMProduceMaterialSum.class;
	
	public Class getDg1505178110802Clazz() {
		return dg1505178110802Clazz;
	}
	
	private List<WOMProduceMaterialSum> dg1505178110802List;
	public List<WOMProduceMaterialSum> getDg1505178110802List(){
		if(null == dg1505178110802List){
			dg1505178110802List = new ArrayList<WOMProduceMaterialSum>();
		}
		return dg1505178110802List;
	}
	public void setDg1505178110802ListJson(String json) {
		//dg1505178110802List = (List<WOMProduceMaterialSum>) produceTaskService.generateObjectFromJson(json, WOMProduceMaterialSum.class);
	}
	
	private List<Long> dg1505178110802DeletedIds;
	public List<Long> getDg1505178110802DeletedIds(){
		if(null == dg1505178110802DeletedIds){
			dg1505178110802DeletedIds = new ArrayList<Long>();
		}
		return dg1505178110802DeletedIds;
	}

	private Page<WOMProdTaskProcExelog> dg1495780442464Page;
	public Page<WOMProdTaskProcExelog> getDg1495780442464Page(){
		if(null == dg1495780442464Page){
			dg1495780442464Page = new Page<WOMProdTaskProcExelog>(1,20);
		}
		return dg1495780442464Page;
	}
	
	private Class dg1495780442464Clazz = WOMProdTaskProcExelog.class;
	
	public Class getDg1495780442464Clazz() {
		return dg1495780442464Clazz;
	}
	
	private List<WOMProdTaskProcExelog> dg1495780442464List;
	public List<WOMProdTaskProcExelog> getDg1495780442464List(){
		if(null == dg1495780442464List){
			dg1495780442464List = new ArrayList<WOMProdTaskProcExelog>();
		}
		return dg1495780442464List;
	}
	public void setDg1495780442464ListJson(String json) {
		//dg1495780442464List = (List<WOMProdTaskProcExelog>) produceTaskService.generateObjectFromJson(json, WOMProdTaskProcExelog.class);
	}
	
	private List<Long> dg1495780442464DeletedIds;
	public List<Long> getDg1495780442464DeletedIds(){
		if(null == dg1495780442464DeletedIds){
			dg1495780442464DeletedIds = new ArrayList<Long>();
		}
		return dg1495780442464DeletedIds;
	}

	private Page<WOMProdTaskActiExelog> dg1495781791731Page;
	public Page<WOMProdTaskActiExelog> getDg1495781791731Page(){
		if(null == dg1495781791731Page){
			dg1495781791731Page = new Page<WOMProdTaskActiExelog>(1,20);
		}
		return dg1495781791731Page;
	}
	
	private Class dg1495781791731Clazz = WOMProdTaskActiExelog.class;
	
	public Class getDg1495781791731Clazz() {
		return dg1495781791731Clazz;
	}
	
	private List<WOMProdTaskActiExelog> dg1495781791731List;
	public List<WOMProdTaskActiExelog> getDg1495781791731List(){
		if(null == dg1495781791731List){
			dg1495781791731List = new ArrayList<WOMProdTaskActiExelog>();
		}
		return dg1495781791731List;
	}
	public void setDg1495781791731ListJson(String json) {
		//dg1495781791731List = (List<WOMProdTaskActiExelog>) produceTaskService.generateObjectFromJson(json, WOMProdTaskActiExelog.class);
	}
	
	private List<Long> dg1495781791731DeletedIds;
	public List<Long> getDg1495781791731DeletedIds(){
		if(null == dg1495781791731DeletedIds){
			dg1495781791731DeletedIds = new ArrayList<Long>();
		}
		return dg1495781791731DeletedIds;
	}

	private Page<WOMAdjustOrTempHead> dg1542351151648Page;
	public Page<WOMAdjustOrTempHead> getDg1542351151648Page(){
		if(null == dg1542351151648Page){
			dg1542351151648Page = new Page<WOMAdjustOrTempHead>(1,20);
		}
		return dg1542351151648Page;
	}
	
	private Class dg1542351151648Clazz = WOMAdjustOrTempHead.class;
	
	public Class getDg1542351151648Clazz() {
		return dg1542351151648Clazz;
	}
	
	private List<WOMAdjustOrTempHead> dg1542351151648List;
	public List<WOMAdjustOrTempHead> getDg1542351151648List(){
		if(null == dg1542351151648List){
			dg1542351151648List = new ArrayList<WOMAdjustOrTempHead>();
		}
		return dg1542351151648List;
	}
	public void setDg1542351151648ListJson(String json) {
		//dg1542351151648List = (List<WOMAdjustOrTempHead>) produceTaskService.generateObjectFromJson(json, WOMAdjustOrTempHead.class);
	}
	
	private List<Long> dg1542351151648DeletedIds;
	public List<Long> getDg1542351151648DeletedIds(){
		if(null == dg1542351151648DeletedIds){
			dg1542351151648DeletedIds = new ArrayList<Long>();
		}
		return dg1542351151648DeletedIds;
	}

	private Page<WOMAdjustOrTempRecords> dg1542351151777Page;
	public Page<WOMAdjustOrTempRecords> getDg1542351151777Page(){
		if(null == dg1542351151777Page){
			dg1542351151777Page = new Page<WOMAdjustOrTempRecords>(1,20);
		}
		return dg1542351151777Page;
	}
	
	private Class dg1542351151777Clazz = WOMAdjustOrTempRecords.class;
	
	public Class getDg1542351151777Clazz() {
		return dg1542351151777Clazz;
	}
	
	private List<WOMAdjustOrTempRecords> dg1542351151777List;
	public List<WOMAdjustOrTempRecords> getDg1542351151777List(){
		if(null == dg1542351151777List){
			dg1542351151777List = new ArrayList<WOMAdjustOrTempRecords>();
		}
		return dg1542351151777List;
	}
	public void setDg1542351151777ListJson(String json) {
		//dg1542351151777List = (List<WOMAdjustOrTempRecords>) produceTaskService.generateObjectFromJson(json, WOMAdjustOrTempRecords.class);
	}
	
	private List<Long> dg1542351151777DeletedIds;
	public List<Long> getDg1542351151777DeletedIds(){
		if(null == dg1542351151777DeletedIds){
			dg1542351151777DeletedIds = new ArrayList<Long>();
		}
		return dg1542351151777DeletedIds;
	}

	@Actions({
		
		@Action(value = "/WOM/produceTask/produceTask/data-dg1542100691662", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.processId.name,result.activeName,result.activeType.id,result.activeType.value,result.dataSource.id,result.dataSource.value,result.isAgile,result.product.productCode,result.product.productName,result.qualityStandard.name,result.remark,result.id,result.version,result.processId.id,result.adjustHeadID.id,result.qualityStandard.id,result.product.id,result.formulaProcessActive.id,result.processActiveID.id" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1542100691662-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1542100691662.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1542100698339", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.processName,result.acticeName,result.activeType.id,result.activeType.value,result.activeRecordState.id,result.activeRecordState.value,result.recordDataSource.id,result.recordDataSource.value,result.recordProduct.productCode,result.recordProduct.productName,result.actualUse,result.recordProduct.productBaseUnit.name,result.startTime,result.endTime,result.remark,result.processID,result.id,result.version,result.headerID.id,result.formularActive.id,result.activeRecordBatchState.id,result.recordProduct.id" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1542100698339-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1542100698339.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505983091921", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.phase,result.sequence,result.needWeigh,result.isMixQuality,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.formulaBom.productId.id,result.formulaBom.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_changePackageViewdg1505983091921" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505983091921-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505983091921.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505983091997", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_reWorkEditdg1505176886273_DATAGRID_CUSTOM_dab132bf_eb70_4a92_82d3_483946a5bb9d,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_changePackageViewdg1505983091997" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505983091997-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505983091997.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1506060049547", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.activeType.id,result.activeType.value,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_chPackageEditdg1506060049547" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1506060049547-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1506060049547.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1506060049644", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_chPackageEditdg1506060049644" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1506060049644-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1506060049644.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1506306746525", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.activeType.id,result.activeType.value,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1506306746525-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1506306746525.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1506306746606", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1506306746606-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1506306746606.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1498733248586", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.taskProcessID.name,result.taskProcessID.processType.name,result.taskProcessID.factoryId.name,result.taskProcessID.longTime,result.taskProcessID.processState.id,result.taskProcessID.processState.value,result.state.id,result.state.value,result.startTime,result.endTime,result.id,result.version,result.taskID.id,result.taskProcessID.id,result.formularProcess.id,result.factoryID.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1498733248586-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1498733248586.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1498733279732", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.taskProcessID.name,result.activeName,result.activeType.id,result.activeType.value,result.isPassCheck,result.finalInspection,result.dataSource.id,result.dataSource.value,result.activeSource.id,result.activeSource.value,result.productID.productCode,result.productID.productName,result.productNum,result.planNum,result.actualNum,result.taskActiveID.activeState.id,result.taskActiveID.activeState.value,result.activeBatchStateID.name,result.checkResult,result.checkResultID,result.rejectsDealID,result.startTime,result.endTime,result.isFinish,result.formularActice.isAnaly,result.isAnaly,result.remark,result.WOM_7_5_0_0_produceTask_makeExcutViewdg1498733279732_DATAGRID_CUSTOM_775d5af5_522d_433b_8bd8_3d572ba07ae4,result.id,result.version,result.taskID.id,result.productID.id,result.waitPutinRecordID.id,result.taskProcessID.id,result.taskActiveID.id,result.activeBatchStateID.id,result.staffID.id,result.formularActice.id,result.factoryID.id,result.processExeLog.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1498733279732-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1498733279732.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1489730796226", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.orderProcessId.name,result.name,result.activeType.id,result.activeType.value,result.exeSystem.id,result.exeSystem.value,result.isReplace,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489730796226_DATAGRID_CUSTOM_2d1619b8_0d37_4a40_80ad_a8e9b028c289,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.offerOrder,result.actOrder,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditdg1489730796226" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1489730796226-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1489730796226.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1489731937175", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.name,result.processType.name,result.isFirstProcess,result.isLastProcess,result.longTime,result.factoryId.name,result.afterRatio,result.beforeRatio,result.exeOrder,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489731937175_DATAGRID_CUSTOM_c94d06fe_3b74_4b54_8041_198dcb376be1,result.remark,result.formularProcess.id,result.id,result.version,result.processType.id,result.formulaId.id,result.factoryId.id,result.headId.id,result.formularProcess.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditdg1489731937175" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1489731937175-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1489731937175.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1489732429091", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489732429091_DATAGRID_CUSTOM_46396f21_30ea_46ae_a9f8_add9c4e474d8,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditdg1489732429091" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1489732429091-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1489732429091.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1489736028416", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.oprate,result.orderProcessId.name,result.activeId.occurTurn.id,result.activeId.occurTurn.value,result.name,result.activeType.id,result.activeType.value,result.isBackMix,result.activeSource.id,result.activeSource.value,result.activeId.fromContainer.id,result.activeId.fromContainer.value,result.activeId.container,result.productId.productCode,result.productId.productName,result.isReplace,result.isMixQuality,result.standardNum,result.minQuality,result.maxQuality,result.planNum,result.lossRate,result.activeId.longTime,result.activeId.auto,result.execSort,result.actOrder,result.offerOrder,result.activeId.batchSite.id,result.activeId.batchSite.value,result.exeSystem.id,result.exeSystem.value,result.mobileTerminal,result.activeId.qualityStandard.name,result.activeId.testProduct.name,result.activeId.pickSite.name,result.activeId.finalInspection,result.activeId.isAnaly,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489736028416_DATAGRID_CUSTOM_4f3d9533_934b_48fd_99a4_2dd7bf43aa6f,result.remark,result.parentActive,result.parentActiveId,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditdg1489736028416" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1489736028416-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1489736028416.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1572513055658", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.orderProcessId.name,result.name,result.activeType.id,result.activeType.value,result.exeSystem.id,result.exeSystem.value,result.isReplace,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489730796226_DATAGRID_CUSTOM_2d1619b8_0d37_4a40_80ad_a8e9b028c289,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.offerOrder,result.actOrder,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditforJSdg1572513055658" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1572513055658-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1572513055658.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1572513055772", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.name,result.processType.name,result.isFirstProcess,result.isLastProcess,result.longTime,result.factoryId.name,result.afterRatio,result.beforeRatio,result.exeOrder,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489731937175_DATAGRID_CUSTOM_c94d06fe_3b74_4b54_8041_198dcb376be1,result.remark,result.formularProcess.id,result.id,result.version,result.processType.id,result.formulaId.id,result.factoryId.id,result.headId.id,result.formularProcess.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditforJSdg1572513055772" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1572513055772-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1572513055772.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1572513055825", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489732429091_DATAGRID_CUSTOM_46396f21_30ea_46ae_a9f8_add9c4e474d8,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditforJSdg1572513055825" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1572513055825-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1572513055825.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1572513055910", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.oprate,result.orderProcessId.name,result.activeId.occurTurn.id,result.activeId.occurTurn.value,result.name,result.activeType.id,result.activeType.value,result.isBackMix,result.activeSource.id,result.activeSource.value,result.activeId.fromContainer.id,result.activeId.fromContainer.value,result.activeId.container,result.productId.productCode,result.productId.productName,result.isReplace,result.isMixQuality,result.standardNum,result.minQuality,result.maxQuality,result.planNum,result.lossRate,result.activeId.longTime,result.activeId.auto,result.execSort,result.actOrder,result.offerOrder,result.activeId.batchSite.id,result.activeId.batchSite.value,result.exeSystem.id,result.exeSystem.value,result.mobileTerminal,result.activeId.qualityStandard.name,result.activeId.testProduct.name,result.activeId.pickSite.name,result.activeId.finalInspection,result.activeId.isAnaly,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489736028416_DATAGRID_CUSTOM_4f3d9533_934b_48fd_99a4_2dd7bf43aa6f,result.remark,result.parentActive,result.parentActiveId,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskEditforJSdg1572513055910" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1572513055910-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1572513055910.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1540191119508", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.orderProcessId.name,result.name,result.activeType.id,result.activeType.value,result.exeSystem.id,result.exeSystem.value,result.isReplace,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.WOM_7_5_0_0_produceTask_makeTaskViewdg1490749384698_DATAGRID_CUSTOM_8e477609_0c6b_4b66_801a_0a5eef1b1adc,result.remark,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskOperaViewdg1540191119508" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1540191119508-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1540191119508.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1540191119680", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_makeTaskViewdg1490749384787_DATAGRID_CUSTOM_fb06dda4_37e2_4202_8e74_b5f5351115c3,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskOperaViewdg1540191119680" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1540191119680-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1540191119680.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1540191119773", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.oprate,result.orderProcessId.name,result.activeId.occurTurn.id,result.activeId.occurTurn.value,result.name,result.activeType.id,result.activeType.value,result.activeState.id,result.activeState.value,result.execSort,result.startTime,result.endTime,result.isBackMix,result.activeSource.id,result.activeSource.value,result.activeId.fromContainer.id,result.activeId.fromContainer.value,result.activeId.container,result.productId.productCode,result.productId.productName,result.isReplace,result.isMixQuality,result.standardNum,result.productId.productBaseUnit.name,result.minQuality,result.maxQuality,result.planNum,result.actualNum,result.outputNum,result.lossRate,result.activeId.longTime,result.activeId.auto,result.activeId.batchSite.id,result.activeId.batchSite.value,result.exeSystem.id,result.exeSystem.value,result.mobileTerminal,result.inspectResult,result.activeBatchState.name,result.rejectsDeal,result.activeId.testProduct.name,result.activeId.pickSite.name,result.activeId.qualityStandard.name,result.activeId.finalInspection,result.activeId.isAnaly,result.WOM_7_5_0_0_produceTask_makeTaskViewdg1490749384886_DATAGRID_CUSTOM_153e8bba_061f_446b_8842_3e531917b26b,result.remark,result.parentActive,result.parentActiveId,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskOperaViewdg1540191119773" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1540191119773-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1540191119773.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1540191119898", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.name,result.processType.name,result.longTime,result.processState.id,result.processState.value,result.startTime,result.endTime,result.isFirstProcess,result.isLastProcess,result.factoryId.name,result.afterRatio,result.exeOrder,result.WOM_7_5_0_0_produceTask_makeTaskViewdg1490749384962_DATAGRID_CUSTOM_dff2fbe8_6f04_4ec9_a8eb_33db8494c3e5,result.remark,result.formularProcess.id,result.id,result.version,result.processType.id,result.formulaId.id,result.factoryId.id,result.headId.id,result.formularProcess.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskOperaViewdg1540191119898" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1540191119898-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1540191119898.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1490749384698", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.orderProcessId.name,result.name,result.activeType.id,result.activeType.value,result.exeSystem.id,result.exeSystem.value,result.isReplace,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.WOM_7_5_0_0_produceTask_makeTaskViewdg1490749384698_DATAGRID_CUSTOM_8e477609_0c6b_4b66_801a_0a5eef1b1adc,result.remark,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskViewdg1490749384698" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1490749384698-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1490749384698.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1490749384787", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_makeTaskViewdg1490749384787_DATAGRID_CUSTOM_fb06dda4_37e2_4202_8e74_b5f5351115c3,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskViewdg1490749384787" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1490749384787-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1490749384787.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1490749384886", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.orderProcessId.name,result.activeId.occurTurn.id,result.activeId.occurTurn.value,result.name,result.activeType.id,result.activeType.value,result.isBackMix,result.activeSource.id,result.activeSource.value,result.activeId.fromContainer.id,result.activeId.fromContainer.value,result.activeId.container,result.productId.productCode,result.productId.productName,result.isReplace,result.isMixQuality,result.standardNum,result.minQuality,result.maxQuality,result.planNum,result.lossRate,result.activeId.longTime,result.activeId.auto,result.execSort,result.actOrder,result.offerOrder,result.activeId.batchSite.id,result.activeId.batchSite.value,result.exeSystem.id,result.exeSystem.value,result.mobileTerminal,result.activeId.testProduct.name,result.activeId.pickSite.name,result.activeId.qualityStandard.name,result.activeId.finalInspection,result.activeId.isAnaly,result.parentActive,result.parentActiveId,result.remark,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskViewdg1490749384886" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1490749384886-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1490749384886.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1490749384962", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.name,result.processType.name,result.longTime,result.isFirstProcess,result.isLastProcess,result.factoryId.name,result.afterRatio,result.exeOrder,result.remark,result.formularProcess.id,result.id,result.version,result.processType.id,result.formulaId.id,result.factoryId.id,result.headId.id,result.formularProcess.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_makeTaskViewdg1490749384962" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1490749384962-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1490749384962.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505802969630", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.activeType.id,result.activeType.value,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505802969630-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505802969630.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505802969738", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505802969738-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505802969738.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505804201833", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.activeType.id,result.activeType.value,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489730796226_DATAGRID_CUSTOM_8c1dab9f_bc56_430c_a704_57f72bc4d55b,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_otherTaskViewdg1505804201833" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505804201833-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505804201833.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505804201918", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_otherTaskViewdg1505804201918" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505804201918-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505804201918.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1495850751698", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.orderProcessId.name,result.name,result.activeType.id,result.activeType.value,result.exeSystem.id,result.exeSystem.value,result.isReplace,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.offerOrder,result.actOrder,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskEditdg1495850751698" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1495850751698-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1495850751698.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1495850751757", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_packageTaskEditdg1495850751757_DATAGRID_CUSTOM_85a281ff_6df7_41eb_a600_71fc0d9a31da,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskEditdg1495850751757" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1495850751757-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1495850751757.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1495850751807", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.orderProcessId.name,result.activeId.occurTurn.id,result.activeId.occurTurn.value,result.name,result.activeType.id,result.activeType.value,result.activeId.fromContainer.id,result.activeId.fromContainer.value,result.activeId.container,result.productId.productCode,result.productId.productName,result.isReplace,result.isMixQuality,result.standardNum,result.minQuality,result.maxQuality,result.planNum,result.lossRate,result.activeId.longTime,result.activeId.auto,result.actOrder,result.offerOrder,result.activeId.batchSite.id,result.activeId.batchSite.value,result.exeSystem.id,result.exeSystem.value,result.mobileTerminal,result.activeId.testProduct.name,result.activeId.pickSite.name,result.activeId.qualityStandard.name,result.activeId.finalInspection,result.remark,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskEditdg1495850751807" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1495850751807-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1495850751807.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1495850751863", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.name,result.processType.name,result.longTime,result.isLastProcess,result.factoryId.name,result.remark,result.formularProcess.id,result.id,result.version,result.processType.id,result.formulaId.id,result.factoryId.id,result.headId.id,result.formularProcess.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskEditdg1495850751863" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1495850751863-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1495850751863.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1496389818499", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.orderProcessId.name,result.name,result.activeType.id,result.activeType.value,result.exeSystem.id,result.exeSystem.value,result.isReplace,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.WOM_7_5_0_0_produceTask_packageTaskViewdg1496389818499_DATAGRID_CUSTOM_34273a64_2a3f_4c96_a9a0_b96424a050c1,result.remark,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskViewdg1496389818499" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1496389818499-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1496389818499.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1496389818610", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_packageTaskViewdg1496389818610_DATAGRID_CUSTOM_fc98280c_cc1e_45d5_a8e1_deda16d93423,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskViewdg1496389818610" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1496389818610-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1496389818610.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1496389818686", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.orderProcessId.name,result.activeId.occurTurn.id,result.activeId.occurTurn.value,result.name,result.activeType.id,result.activeType.value,result.activeId.fromContainer.id,result.activeId.fromContainer.value,result.activeId.container,result.productId.productCode,result.productId.productName,result.isReplace,result.isMixQuality,result.standardNum,result.minQuality,result.maxQuality,result.planNum,result.lossRate,result.activeId.longTime,result.activeId.auto,result.actOrder,result.offerOrder,result.activeId.batchSite.id,result.activeId.batchSite.value,result.activeId.exeSystem.id,result.activeId.exeSystem.value,result.mobileTerminal,result.activeId.testProduct.name,result.activeId.pickSite.name,result.activeId.qualityStandard.name,result.activeId.finalInspection,result.WOM_7_5_0_0_produceTask_packageTaskViewdg1496389818686_DATAGRID_CUSTOM_e35c3c11_2e6d_41a5_81e0_13cf54c0fca6,result.remark,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskViewdg1496389818686" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1496389818686-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1496389818686.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1496389818751", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.name,result.processType.name,result.longTime,result.isLastProcess,result.factoryId.name,result.WOM_7_5_0_0_produceTask_packageTaskViewdg1496389818751_DATAGRID_CUSTOM_fa9650b7_1922_4dd5_90d4_ed2666e238fa,result.remark,result.formularProcess.id,result.id,result.version,result.processType.id,result.formulaId.id,result.factoryId.id,result.headId.id,result.formularProcess.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_packageTaskViewdg1496389818751" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1496389818751-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1496389818751.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505285519431", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_recycleTaskEditdg1505285519431" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505285519431-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505285519431.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505285519610", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.activeType.id,result.activeType.value,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_recycleTaskEditdg1505285519610" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505285519610-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505285519610.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505456701981", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.activeType.id,result.activeType.value,result.property.id,result.property.value,result.standardNum,result.planNum,result.productId.productBaseUnit.name,result.isMixQuality,result.phase,result.sequence,result.needWeigh,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.WOM_7_5_0_0_produceTask_makeTaskEditdg1489730796226_DATAGRID_CUSTOM_8c1dab9f_bc56_430c_a704_57f72bc4d55b,result.remark,result.batchNumObj.id,result.orderProcessId.id,result.activeId.id,result.formulaId.id,result.processId.id,result.putBatMateId.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_recycleTaskViewdg1505456701981" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505456701981-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505456701981.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505456702135", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.headId.formularId.setProcess.id,result.headId.formularId.setProcess.value,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_recycleTaskViewdg1505456702135" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505456702135-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505456702135.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505974050406", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.formulaBom.productId.productCode,result.productId.productCode,result.productId.id,result.productId.productName,result.property.id,result.property.value,result.productId.productBaseUnit.name,result.planNum,result.phase,result.sequence,result.needWeigh,result.isMixQuality,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.formulaBom.productId.id,result.formulaBom.id,result.batchNumObj.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reProcessEditdg1505974050406" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505974050406-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505974050406.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505983284775", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reProcessEditdg1505983284775" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505983284775-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505983284775.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505975951232", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.formulaBom.productId.productCode,result.productId.productCode,result.productId.id,result.productId.productName,result.property.id,result.property.value,result.productId.productBaseUnit.name,result.planNum,result.phase,result.sequence,result.needWeigh,result.isMixQuality,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.formulaBom.productId.id,result.formulaBom.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reProcessViewdg1505975951232" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505975951232-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505975951232.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505983664771", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reProcessViewdg1505983664771" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505983664771-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505983664771.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1504926238926", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.formulaBom.productId.productCode,result.productId.productCode,result.productId.id,result.productId.productName,result.property.id,result.property.value,result.productId.productBaseUnit.name,result.planNum,result.phase,result.sequence,result.needWeigh,result.isMixQuality,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.formulaBom.productId.id,result.formulaBom.id,result.batchNumObj.id,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reWorkEditdg1504926238926" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1504926238926-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1504926238926.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505176886273", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_reWorkEditdg1505176886273_DATAGRID_CUSTOM_dab132bf_eb70_4a92_82d3_483946a5bb9d,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reWorkEditdg1505176886273" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505176886273-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505176886273.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505100155794", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.id,result.productId.productName,result.property.id,result.property.value,result.productId.productBaseUnit.name,result.planNum,result.phase,result.sequence,result.needWeigh,result.isMixQuality,result.batchNumObj.batchText,result.minQuality,result.maxQuality,result.lossRate,result.remark,result.id,result.version,result.processId.id,result.formulaBom.id,result.activeId.id,result.activeBatchState.id,result.orderProcessId.id,result.headID.id,result.putBatMateId.id,result.formulaId.id,result.productId.id,result.factoryId.id,result.batchNumObj.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reWorkViewdg1505100155794" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505100155794-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505100155794.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1505178110802", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.productId.productCode,result.productId.productName,result.property.id,result.property.value,result.planNum,result.productId.productBaseUnit.name,result.batchNum,result.WOM_7_5_0_0_produceTask_reWorkViewdg1505178110802_DATAGRID_CUSTOM_c35cf5ab_02ea_47a1_bcf7_41394534ea0a,result.id,result.version,result.productId.id,result.headId.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_reWorkViewdg1505178110802" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1505178110802-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1505178110802.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1495780442464", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.taskProcessID.name,result.taskProcessID.processType.name,result.taskProcessID.longTime,result.taskID.factoryId.name,result.startTime,result.endTime,result.state.id,result.state.value,result.WOM_7_5_0_0_produceTask_taskExecRecordViewdg1495780442464_DATAGRID_CUSTOM_43a16894_c1bf_4b01_9d1e_7bbc7f242b17,result.id,result.version,result.taskID.id,result.taskProcessID.id,result.formularProcess.id,result.factoryID.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_taskExecRecordViewdg1495780442464" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1495780442464-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1495780442464.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1495781791731", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.taskProcessID.name,result.taskActiveID.name,result.taskActiveID.activeType.id,result.taskActiveID.activeType.value,result.taskActiveID.exeSystem.id,result.taskActiveID.exeSystem.value,result.productID.productName,result.productNum,result.planNum,result.actualNum,result.startTime,result.endTime,result.WOM_7_5_0_0_produceTask_taskExecRecordViewdg1495781791731_DATAGRID_CUSTOM_9a8cff02_c5d1_473f_b06b_b33ee664bce3,result.id,result.version,result.taskID.id,result.productID.id,result.waitPutinRecordID.id,result.taskProcessID.id,result.taskActiveID.id,result.activeBatchStateID.id,result.staffID.id,result.formularActice.id,result.factoryID.id,result.processExeLog.id" , "dataGridCode", "WOM_7.5.0.0_produceTask_taskExecRecordViewdg1495781791731" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1495781791731-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1495781791731.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1542351151648", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.processId.name,result.activeName,result.activeType.id,result.activeType.value,result.dataSource.id,result.dataSource.value,result.isAgile,result.product.productCode,result.product.productName,result.qualityStandard.name,result.remark,result.id,result.version,result.processId.id,result.adjustHeadID.id,result.qualityStandard.id,result.product.id,result.formulaProcessActive.id,result.processActiveID.id" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1542351151648-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1542351151648.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/WOM/produceTask/produceTask/data-dg1542351151777", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.sort,result.processName,result.acticeName,result.activeType.id,result.activeType.value,result.activeRecordState.id,result.activeRecordState.value,result.recordDataSource.id,result.recordDataSource.value,result.recordProduct.productCode,result.recordProduct.productName,result.actualUse,result.recordProduct.productBaseUnit.name,result.startTime,result.endTime,result.inspectResult,result.inspectRecordId,result.activeRecordBatchState.name,result.rejectsDeal,result.remark,result.processID,result.id,result.version,result.headerID.id,result.formularActive.id,result.activeRecordBatchState.id,result.recordProduct.id" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1542351151777-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1542351151777.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
	})
	public String dataGridData() throws Exception{
		DataGrid dg = null;
		if (!com.supcon.orchid.utils.StringUtils.isEmpty(datagridCode)) {
			dg = ViewServiceFoundation.getDataGrid(datagridCode, "runtime");
		} else {
			String dataGridName = request.getRequestURI().replaceAll("^.*/data-", "").replaceAll(".action$", "");
			dg = ViewServiceFoundation.getDataGridByName(dataGridName, "runtime");
			datagridCode = dg.getCode();
		}
		if(null == dg){
			throw new BAPException("未找到DataGrid" + datagridCode);
		}
		Model model=dg.getTargetModel();
		bapBeforeCustomMethod(datagridCode,dg.getName());
		if (refId != null && refId > 0) {
			dataGridRefCopy(dg);
		} else {
			setFieldPermissionModelCode(model.getCode());
			String searchCondition = "";
			List<Object> params = new ArrayList<Object>();
			CustomerCondition ccon = viewServiceFoundation.findCustomerConditionByDatagridCode(datagridCode);
			if(null != ccon && ccon.getSql()!=null && ccon.getSql().length()>0){
				String customerSql = ccon.getSql();
				if(customerSql.indexOf("return")>-1){
					Map<String, Object> variables = new HashMap<String, Object>(); 
					Map<String, String[]> parameters =request.getParameterMap();
					variables.put("parameters", parameters);
					customerSql=EngineScriptExecutor.eval(customerSql, variables).toString();
				}
				Pattern p = Pattern.compile("\\$\\{(.+?),(.+?)\\}");
				Matcher m =	p.matcher(customerSql);
				List<Object> list = new ArrayList<Object>();
				while(m.find()){
					String str = m.group();
					//String[] strs = str.substring(2, str.length()-1).split(",");
					String value = request.getParameter(m.group(1)); //request.getParameter(str.substring(2, str.length()-1));
					String type = m.group(2);
					if("int".equals(type)){
						Integer integer = new Integer(value);
						list.add(integer);
					}else if("date".equals(type)){
						Date date = new Date(value);
						list.add(date);
					}else if("double".equals(type)){
						Double doubles = new Double(value);
						list.add(doubles);
					}else if("long".equals(type)){
						Long longs = new Long(value);
						list.add(longs);
					}else if("string".equals(type)){
						list.add(value);
					}else if("method".equals(type)){
						value = m.group(1);
						try {
							list.add(Ognl.getValue(value, this));
						} catch (Exception e) {
							logger.info(e.getMessage());
						}
					}else{
						list.add(value);
					}
					customerSql = customerSql.replace(str, "?");
				}
				searchCondition += customerSql;
				params.addAll(list);
			}else if(null != ccon && ccon.getJsonCondition()!=null && ccon.getJsonCondition().length()>0){
				String jsonString = ccon.getJsonCondition();
				Pattern p = Pattern.compile("\\$\\{(.*?)\\}");
				Matcher m =	p.matcher(jsonString);
				while(m.find()){
					String str = m.group();
					String value = request.getParameter(m.group(1));
					if(value != null){
						jsonString = jsonString.replace(str, value);
					}else{
						jsonString = jsonString.replace(str, "");
					}
				}
				AdvQueryCondition advQuery = conditionService.toSql(jsonString);
				String s = advQuery.getSql();
				if(advQuery.getSql()!=null){
					searchCondition += advQuery.getSql();
				}
				params.addAll(advQuery.getValues());
			}
			String artifact=model.getEntity().getModule().getArtifact();
			Class dgclass=Class.forName("com.supcon.orchid."+artifact+".entities."+model.getJpaName());
			if(produceTask.getId() != null && produceTask.getId() != -1){
				produceTask = produceTaskService.getProduceTask(produceTask.getId());
			}
			produceTaskService.findDataGridPage(dg,dgclass,getDgPage(),produceTask,searchCondition,params);
			if(null != dgPage && null != dgPage.getResult() && !dgPage.getResult().isEmpty()){
				List<String> attachKey =new ArrayList<String>();
				Map confMap=dg.getConfigMap();
				Map layoutMap = (Map) confMap.get("layout");
				List<Map> ls = (List<Map>) layoutMap.get("sections");
				for(Map lm:ls){
					if(lm.get("regionType").equals("DATAGRID")){
						List<Map> lc = (List<Map>) lm.get("cells");
						for(Map lk:lc){
							if("PROPERTYATTACHMENT".equals(lk.get("columnType"))&&lk.get("key")!=null){
								attachKey.add(lk.get("key").toString());
							}
						}
					}
				}
				if(attachKey.size()>0){
					Map<String,String> param=new HashMap<String, String>();
					for(Object item : dgPage.getResult()){
						String docType=dgclass.getDeclaredField("DOC_TYPE").get(null).toString();
						Long itemid=(Long)dgclass.getMethod("getId").invoke(item);
						List<Document> documents = documentService.getByLinkIdAndType(itemid, docType);
						if(null != documents){
							for(String key:attachKey){
								Object orgIds=dgclass.getMethod("get"+fLTU(key)+"MultiFileIds").invoke(item);
								Object orgNames=dgclass.getMethod("get"+fLTU(key)+"MultiFileNames").invoke(item);
								if(orgIds==null){
									param.put(key+"MultiFileIds",null);
								}else{
									param.put(key+"MultiFileIds",orgIds.toString());
								}
								if(orgNames==null){
									param.put(key+"MultiFileNames",null);
								}else{
									param.put(key+"MultiFileNames",orgNames.toString());
								}
							}
							for(Document doc : documents){
								for(String key:attachKey){
									if(null != doc.getPropertyCode()){
										if(dgclass.getDeclaredField(key.toUpperCase()+"_PROPERTY_CODE").get(null).equals(doc.getPropertyCode())){
											if(null == param.get(key+"MultiFileIds")){
												param.put(key+"MultiFileIds",doc.getId().toString());
												param.put(key+"MultiFileNames",doc.getName());
											} else {
												param.put(key+"MultiFileIds",param.get(key+"MultiFileIds")+","+doc.getId().toString());
												param.put(key+"MultiFileNames",param.get(key+"MultiFileNames")+","+doc.getName());
											}
										}
									}
								}
							}
							for(String key:attachKey){
								dgclass.getDeclaredMethod("set"+fLTU(key)+"MultiFileIds", String.class).invoke(item, param.get(key+"MultiFileIds"));
								dgclass.getDeclaredMethod("set"+fLTU(key)+"MultiFileNames", String.class).invoke(item, param.get(key+"MultiFileNames"));
							}
						}
					}
				}
			}
		}
		Field[] fields = this.getClass().getDeclaredFields();
		for (Field f : fields) {
			if (f.getName().equals(dg.getName() + "Page")) {
				f.set(this, getDgPage());
			}
		}
		bapAfterCustomMethod(datagridCode, dg.getName());
		if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
		if(getDgPage().isExportFlag()) {
			Map<String, List> maps = generateShowCusPros(DATAGRIDSHOWTYPE,datagridCode);
          	String modelName = model.getModelName();
			for (Map.Entry<String, List> entry : maps.entrySet()) {
				String key = entry.getKey();
				if(!key.equals(modelName.substring(0, 1).toLowerCase() + modelName.substring(1)) ){
					List values = entry.getValue();
					for(int i=0; i<values.size() ; i++){
						CustomPropertyViewMapping cpvm = (CustomPropertyViewMapping) values.get(i);
						Property prop = cpvm.getProperty();
                      	prop.setName(cpvm.getPropertyLayRec());
					}
				}
			}
			getDgPage().setShowCusProps(maps);
			//getDgPage().setShowCusProps(generateShowCusPros(DATAGRIDSHOWTYPE,datagridCode));
			produceTaskService.excelExport();
			return "excel";
		}else{
			if(dg.getEx()){
				return "xml";
			}else{
				return SUCCESS;
			}
		}
	}
	// =============================================================================================
	private String operateType;
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	private void save() throws Exception {
		if(null == produceTask.getId()) {
			responseMap.put("operate", "add");
		} else {
			responseMap.put("operate", "edit");
		}
		produceTaskService.save(produceTask,deploymentId,pendingId,workFlowVar, dgLists,dgDeletedIds,(Map<String, Object>)request.getAttribute("__orchid_ass_fileuploads__"), viewCode);
		
		//将临时处理意见存入cookie
		String comments = workFlowVar.getComment();
		if(comments != null && !comments.isEmpty()){
			Pending p = null;
			if(pendingId != null){
				p = taskService.getPending(pendingId);
			}else{
				p = taskService.getPendingByTableId(produceTask.getTableInfoId());
			}
			String ctype = "TEMP_DEALINFO_" + produceTask.getProcessKey() + "_" + p.getActivityName() + "_WOM_7.5.0.0_produceTask_" + produceTask.getId();
			List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("type", ctype), Restrictions.eq("user", getCurrentUser()));
			Cookie dc = null;
			if(cookies != null && !cookies.isEmpty()){
				dc = (Cookie) cookies.get(0);
			}else{
				dc = new Cookie();
				dc.setUser(getCurrentUser());
				dc.setType(ctype);
			}
			dc.setValue(comments);
			cookieService.save(dc);
		}
		
		responseMap.put("dealSuccessFlag", true);
		if (pendingId != null && pendingId > 0) {
			responseMap.put("pendingId", pendingId);
		} else {
			responseMap.put("pendingId", taskService.getPendingId(produceTask.getTableInfoId(), getCurrentUser().getId()));
		}
		responseMap.put("operateType", "save");
		responseMap.put("viewselect", viewselect);
	}
	//弃审action
	@Action(value = "/WOM/produceTask/produceTask/retrial", results = { @Result(type ="text" , params = { "root", "responseMap" }) })
	public String retrial() throws Exception {
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "retrial");
		SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
		produceTaskService.retrialThisTable(produceTask,tableInfoId,scriptCode,signatureLog);
		responseMap.put("dealSuccessFlag", true);
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "retrial");
		return SUCCESS;
	}
	@Actions({
		@Action(value = "/WOM/produceTask/produceTask/adjustActiveEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/changePackageView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/chPackageEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/chPackageView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/makeExcutView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/makeTaskEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/makeTaskEditforJS/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/makeTaskOperaView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/makeTaskView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/otherTaskEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/otherTaskView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/packageTaskEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/packageTaskView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/recycleTaskEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/recycleTaskView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/reProcessEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/reProcessView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/reWorkEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/reWorkView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/taskExecRecordView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/tempActiveEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
	})
	public String submit() throws Exception{
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "submit");
		bap_validate_datagrids=produceTaskService.findValidateDatagrids(getDgClassMap(),viewCode);
		if (produceTask != null && produceTask.getStatus() != null && produceTask.getStatus() == 77) {
			throw new BAPException(Code.PENDING_HAS_HANGUP);
		}
		if (pendingId != null && taskService.getPending(pendingId) == null) {
			String mess = InternationalResource.get("ec.workflow.pending.isnotnull", getCurrentUser().getLanguage());
			throw new BAPException(mess);
		}

		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setOperateType(operateType);
		workFlowVar.setActivityType(pendingActivityType);
		if ("submit".equals(operateType)){
			workFlowVar.setWebSignetFlag(webSignetFlag);
			SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
			if (superEdit != null && superEdit) {
				produceTaskService.saveSuperEditProduceTask(produceTask, workFlowVar, dgLists,dgDeletedIds,(Map<String, Object>)request.getAttribute("__orchid_ass_fileuploads__"), viewCode,signatureLog);
			} else {
				if(null != signatureLog) {
					Task task=taskService.getTask(activityName, deploymentId);
					Long taskId=task.getId();
					String taskName=task.getName();
					taskName=InternationalResource.get(taskName, this.getLocale().toString());
					signatureLog.setTaskId(taskId);
					signatureLog.setProcessId(deploymentId);
					signatureLog.setTaskName(taskName);
				}
				produceTaskService.submit(produceTask,deploymentId,pendingId,workFlowVar,dgLists,dgDeletedIds,(Map<String, Object>)request.getAttribute("__orchid_ass_fileuploads__"), viewCode,signatureLog);
			}
			responseMap.put("dealSuccessFlag", true);
			responseMap.put("operateType", "submit");
		} else {
			save();
		}
		// 保存本次路由上的指定人员
		saveLastAssignUser();
		responseMap.put("tableInfoId", produceTask.getTableInfoId());
		responseMap.put("id", produceTask.getId());

		Map<String, Object> fileuploads = (Map<String, Object>) request.getAttribute("__orchid_fileuploads__");
		if(null == fileuploads){
			fileuploads = new HashMap<String, Object>();
		}
		fileuploads.put("linkId", produceTask.getTableInfoId());
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "submit");
		return SUCCESS;
	}
	@Action(value = "/WOM/produceTask/produceTask/bulkSubmit", results = { @Result(type = JSON, params = { "root", "responseMap" }) })
	public String bulkSubmit() throws Exception{
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "bulkSubmit");
		produceTaskService.bulkSubmit(ids,deploymentId,pendingIds,outcomeStr);
		responseMap.put("dealSuccessFlag", true);
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "bulkSubmit");
		return SUCCESS;
	}

	@Action(value = "/WOM/produceTask/produceTask/delete", results = { @Result(type = JSON, params = { "root", "responseMap" }) })
	public String delete() throws Exception {
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "delete");
		SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
		produceTaskService.deleteProduceTask(ids,signatureLog);
		responseMap.put("dealSuccessFlag", true);
		responseMap.put("operateType", "delete");
		responseMap.put("operate", "delete");
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "delete");
		return SUCCESS;
	}
	
	@Action(value = "/WOM/produceTask/produceTask/restore", results = { @Result(type = JSON, params = { "root", "msg" }) })
	public String restore() throws Exception {
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "restore");
		produceTaskService.restoreProduceTask(ids);
		msg = new ResponseMsg(true);
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "restore");
		return SUCCESS;
	}	
	
	@Actions({
			@Action(value = "/WOM/produceTask/produceTask/dealInfo-list", results = { @Result(name = "success", type = "json", params = { "root", "dealInfoData" }) })
			,@Action(value = "/WOM/produceTask/produceTask/dealInfo-listGroup", results = { @Result(name = "success", type = "json", params = { "deep", "true", "root", "dealInfoDataMap" }) })
	})
	public String showDealInfoData() throws Exception {
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "showDealInfoData");
		if (null != tableInfoId) {
			int count=produceTaskService.getDealInfoCount(tableInfoId);
			if(!getIsMobile() && count < dealDefaulCount && expandDealInof == true){
				expandDealInof=false;
			}
			if(groupByTask) {
				dealInfoDataMap = produceTaskService.findDealInfosGroup(tableInfoId, expandDealInof);
				for(Map.Entry<String, List<Object[]>> entry : dealInfoDataMap.entrySet()) {
					for(Object[] map : entry.getValue()) {
						String activityName=(map[0]!=null)?map[0].toString():"";
						String transitionName=(map[5]!=null)?map[5].toString():"";
						map[0]=InternationalResource.get(activityName, getLocale().toString());
						map[5]=InternationalResource.get(transitionName, getLocale().toString());
					}
				}
			} else {
				dealInfoData = produceTaskService.findDealInfos(tableInfoId, expandDealInof);
				for(Object[] map:dealInfoData){
					String activityName=(map[0]!=null)?map[0].toString():"";
					String transitionName=(map[5]!=null)?map[5].toString():"";
					map[0]=InternationalResource.get(activityName, getLocale().toString());
					map[5]=InternationalResource.get(transitionName, getLocale().toString());
				}
			}
		}  
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "showDealInfoData");
		return SUCCESS;
	}	
	
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private FieldService fieldService;
	Integer findExportDataInfosCount = 1;//findExportDataInfos执行次数，导出时，只有第一次需要添加样式
	@Override
	public Page<WOMProduceTask> findExportDataInfos(Page<WOMProduceTask> page) {
		String language = getCurrentUser().getLanguage();
		Map<String,Object> exportMap = new HashMap<String,Object>();
		if(page.isExportFlag())  {
			View view=viewServiceFoundation.getView(viewCode);
			List<Property> properties= null;
			if( excelProperties !=null && excelProperties.get(view.getAssModel().getCode()) != null){
				properties = (List<Property>) excelProperties.get(view.getAssModel().getCode());
			}else{
				properties = modelServiceFoundation.findProperties(view.getAssModel());
				this.excelProperties.put(view.getAssModel().getCode(), properties);
			}
			
			for(Property p : properties){
				if(p.getIsBussinessKey()){
					exportMap.put("businessKey", p);
				}
				if(p.getIsMainDisplay()){
					exportMap.put("mainDisplay", p);
				}
			}
			if(queryConfig.trim().isEmpty())  {
				return getPage();
			}
			if(!generateFlag)  {
				List<Map> exportMaps =new ArrayList<Map>();
				
				String supplyConfig = "";
				Boolean bkIsInherent = false;
				Boolean bkIsId = false;//用于判断id是否为主键
				Property idProp = null;
				
				List<String> runningCustomPropertyCode = null;
				if( excelRunningCustomPropertyCode!=null && excelRunningCustomPropertyCode.get(view.getAssModel().getCode()) !=null ){
					runningCustomPropertyCode = (List<String>) excelRunningCustomPropertyCode.get(view.getAssModel().getCode());//已启用的自定义字段
				}else{
					runningCustomPropertyCode = produceTaskService.getRunningCustomProperties(view.getAssModel().getCode());//已启用的自定义字段
					this.excelRunningCustomPropertyCode.put(view.getAssModel().getCode(), runningCustomPropertyCode);
				}
				
				if(!useForImportFlag && queryConfig!=null && !queryConfig.contains("item")){//不勾选用于导入，且在设置中没有选中任何字段时
					List<DataGrid> dgs = view.getDataGrids();
					String fullConfig = ecConfigService.getEcFullConfig(view);
					//view.getExtraView().setConfig(fullConfig);
					view.getExtraView().setConfigMap((Map) SerializeUitls.deserialize(fullConfig));
					Map cmap = view.getExtraView().getConfigMap();
					Map l = (Map) cmap.get("layout");
					List<Map> ss = (List) l.get("sections");
					List<Map> col = null;

					Map<Integer, DbColumnType> typeMap = new LinkedHashMap<>();
					Map<Integer, Model> objectMap = new LinkedHashMap<>();
					for (Map cells : ss) {
						if ("LISTPT".equals(cells.get("regionType"))) {
							col = (List<Map>) cells.get("cells");
							break;
						}
					}
					
					List<Property> needExportProps = new ArrayList<Property>();
					if (col != null) {
						//视图配置中的数据信息
						for (Map cell : col) {
							String cellCode = (String) cell.get("cellCode");
							com.supcon.orchid.ec.entities.Field f = fieldService.findFieldByCellCode(cellCode, view);
							if (null != f) {
								Property p = f.getProperty();
								Map config = (Map) SerializeUitls.deserialize(f.getConfig());
								//Map field = (Map) SerializeUitls.deserialize(config.get("field"));
								Map field = (Map) config.get("field");
								String none = (String) field.get("none");
								String propertyLayRec = (String) field.get("propertyLayRec");
								if(p != null && (none==null || none.length()==0 ) ){//非自定义字段
									if(field.get("propertyCode")!=null && !field.get("propertyCode").toString().contains("||")){//本模型下
										supplyConfig += generteAuxXml(p);
									}else{//非本模型，即通过对象字段
										supplyConfig += "<list-item>";
										supplyConfig += "<name><![CDATA[" + (field.get("key")!=null?field.get("key").toString():"undefined") + "]]></name>";
										String propertyCode = field.get("propertyCode").toString();
										String[] propertyCodes = propertyCode.split("\\|\\|");
										String displayName = "";
										for(String str : propertyCodes){
											System.out.println();
											Property p3 = modelServiceFoundation.getProperty(str); 
											displayName += p3.getDisplayName() + ",";
										}
										displayName = displayName.substring(0, displayName.length()-1);
										supplyConfig += "<dispalyName><![CDATA[" + displayName + "]]></dispalyName>";
										supplyConfig += "<propertyCode><![CDATA[" + (field.get("propertyCode")!=null?field.get("propertyCode").toString():"undefined") + "]]></propertyCode>";
										supplyConfig += "<namekey><![CDATA[" + displayName + "]]></namekey>";
										if(p.getMultable()){
											supplyConfig += "<multable><![CDATA[true]]></multable>";
										}else{
											supplyConfig += "<multable><![CDATA[false]]></multable>";
										}
										if(p.getSeniorSystemCode()){
											supplyConfig += "<seniorsystemcode><![CDATA[true]]></seniorsystemcode>";
										}else{
											supplyConfig += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
										}
										supplyConfig += "<propshowformat><![CDATA[" + (p.getFormat()!=null?p.getFormat():"undefined") + "]]></propshowformat>";
										supplyConfig += "<assPropertyName><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "]]></assPropertyName>";
										supplyConfig += "<modelCode><![CDATA[" + (p.getModel().getCode()!=null?p.getModel().getCode():"undefined") + "]]></modelCode>";
										supplyConfig += "<columnName><![CDATA[" + (p.getColumnName()!=null?p.getColumnName():"undefined") + "]]></columnName>";
										supplyConfig += "<layRec><![CDATA[" + (field.get("layRec")!=null?field.get("layRec").toString():"undefined") + "]]></layRec>";
										supplyConfig += "<key><![CDATA[" + (field.get("key")!=null?field.get("key").toString():"undefined") + "]]></key>";
										if(p.getNullable()){
											supplyConfig += "<nullable><![CDATA[true]]></nullable>";
										}else{
											supplyConfig += "<nullable><![CDATA[false]]></nullable>";
										}
										supplyConfig += "<columntype><![CDATA[" + (p.getType()!=null?p.getType():"undefined") + "]]></columntype>";
										if(p.getDecimalNum()!=null && p.getDecimalNum()>0){
											supplyConfig += "<decimalNum><![CDATA[" + p.getDecimalNum().toString() + "]]></decimalNum>";
										}else{
											supplyConfig += "<decimalNum><![CDATA[0]]></decimalNum>";
										}
										supplyConfig += "<isCustom><![CDATA[" + p.getIsCustom() + "]]></isCustom>";
										supplyConfig += "</list-item>";
									}
								}else if(p ==null&& propertyLayRec!=null && propertyLayRec.length() >0 && (none==null || none.length()==0 ) ){
									List<CustomPropertyViewMapping> customPropertyViewMappings = viewServiceFoundation.findShowedViewMappingList(viewCode, propertyLayRec);
									for(CustomPropertyViewMapping customPropertyViewMapping : customPropertyViewMappings){
										if(customPropertyViewMapping.getShowCustom() && customPropertyViewMapping.getProperty()!=null){
											Property p2 = customPropertyViewMapping.getProperty();
											if(p2.getModel().getCode().equals(view.getAssModel().getCode())){//本模型下的自定义字段
												supplyConfig += generteAuxXml(p2);
											}else{
												Model assModel = modelServiceFoundation.getModel(field.get("customModelCode").toString());
												
												List<Property> assProperties;
												if(excelProperties != null && excelProperties.get(assModel.getCode()) != null ){
													assProperties = (List<Property>) excelProperties.get(assModel.getCode());
												}else{
													assProperties = modelServiceFoundation.findProperties(assModel);
													this.excelProperties.put(assModel.getCode(), assProperties);
												}
													
												//获取模型中Id对应的数据库列名
												String idColumnName = "ID";
												for(Property ap : assProperties){
													if(ap.getName()!=null && ap.getName().equals("id")){
														idColumnName = ap.getColumnName();
													}
												}
												
												//获取关联字段
												List<Property> mainProperties;
												if(excelProperties != null && excelProperties.get(view.getAssModel().getCode()) != null ){
													mainProperties = (List<Property>) excelProperties.get(view.getAssModel().getCode());
												}else{
													mainProperties = modelServiceFoundation.findProperties(view.getAssModel());
													this.excelProperties.put(view.getAssModel().getCode(), mainProperties);
												}
												String ogPropName = field.get("propertyLayRec").toString();
												if(ogPropName.contains("||")){
													ogPropName = ogPropName.substring(0, ogPropName.indexOf("||"));
													if(ogPropName.contains(".")){
														ogPropName = ogPropName.substring( ogPropName.lastIndexOf(".")+1, ogPropName.length());
													}
												}
												Property ogProp = null;
												for(Property mainProp : mainProperties){
													if(mainProp.getName().equals(ogPropName)){
														ogProp = mainProp;
														break;
													}
												}
												
												supplyConfig += generteAuxObjXml(ogProp, customPropertyViewMapping.getProperty(), assModel, idColumnName, view.getAssModel());
												
											}
										}
									}
								}
							}
						}
					}	
				}else if(useForImportFlag){//用于导入时条件过滤
					for(Property p : properties){
						this.excelProperty.put(p.getCode(), p);
						if(p.getIsBussinessKey() && p.getName().equals("version") && !queryConfig.contains(p.getCode()) ){//较早版本的业务包可能version字段作为业务主键，此种情况通过id管理
				       		bkIsInherent = true;
				       	}
						if(p.getName().equals("id")){
							idProp = p;
							if(p.getIsBussinessKey()){//用于id作为业务主键为空则新增需求
								bkIsId=true;
							}
						}
						if( (p.getIsBussinessKey() || p.getIsMainDisplay()) && !p.getName().equals("id") && !queryConfig.contains(p.getCode()) ){
							supplyConfig += generteAuxXml(p);
						}else if( p.getIsCustom() && runningCustomPropertyCode.contains(p.getCode()) && !p.getNullable() && !queryConfig.contains(p.getCode())){
							supplyConfig += generteAuxXml(p);
						}else if(!p.getMultable() && !p.getNullable() && !p.getName().equals("id") && !queryConfig.contains(p.getCode()) &&
								((p.getIsCustom() && runningCustomPropertyCode.contains(p.getCode())) || !p.getIsCustom())  ){//用于导入时非空字段必导
							if(p.getType() != null && !p.getType().toString().equals("OBJECT")){
								supplyConfig += generteAuxXml(p);
							}
							if(p.getType() != null && p.getType().toString().equals("OBJECT") ){
								Model assModel = null;
								if(!p.getIsCustom()){
									//String assProperty = produceTaskService.getAssProperty(p.getCode());	
									//String assModelCode = produceTaskService.getPropertyModelCode(assProperty);
									//assModel = modelServiceFoundation.getModel(assModelCode);
									assModel = p.getAssociatedProperty().getModel();
								}else{
									List<CustomPropertyModelMapping> modelMappings = null;
									if(excelModelMappings!=null && excelModelMappings.get(p.getModel().getCode())!=null ){
										modelMappings = (List<CustomPropertyModelMapping>) excelModelMappings.get(p.getModel().getCode());
									}else{
										modelMappings = viewServiceFoundation.findCustomPropertyForAsso(p.getModel().getCode(), p.getCode());
										this.excelModelMappings.put(p.getCode(), modelMappings);
									}
									
									//List<CustomPropertyModelMapping> modelMappings = viewServiceFoundation.findCustomPropertyForAsso(p.getModel().getCode(), p.getCode());
									if(modelMappings != null && modelMappings.size()>0){
										assModel = modelMappings.get(0).getAssociatedProperty().getModel();
									}
								}
								//List<Property> assProperties = modelServiceFoundation.findProperties(assModel);
								List<Property> assProperties;
								if(excelProperties != null && excelProperties.get(assModel.getCode()) != null ){
									assProperties = (List<Property>) excelProperties.get(assModel.getCode());
								}else{
									assProperties = modelServiceFoundation.findProperties(assModel);
									this.excelProperties.put(assModel.getCode(), assProperties);
								}
									
								//获取模型中Id对应的数据库列名
								String idColumnName = "ID";
								for(Property ap : assProperties){
									if(ap.getName()!=null && ap.getName().equals("id")){
										idColumnName = ap.getColumnName();
									}
								}
									
								for(Property ap : assProperties){
									if((ap.getIsMainDisplay() && !ap.getName().equals("id")) || ap.getIsBussinessKey()){
										supplyConfig += generteAuxObjXml(p, ap, assModel, idColumnName, view.getAssModel());
									}
								}
							}
						}else if( p.getName().equals("tableNo") && !queryConfig.contains(p.getCode()) ){
							supplyConfig += generteAuxXml(p);
						}else if( p.getName().equals("ownerStaff") ){//用于导出时，基础表单必导所有者
							//String assProperty = produceTaskService.getAssProperty(p.getCode());	
							//String assModelCode = produceTaskService.getPropertyModelCode(assProperty);
							//Model assModel = modelServiceFoundation.getModel(assModelCode);
							Model assModel = p.getAssociatedProperty().getModel();
							if(!queryConfig.contains("ownerStaff.code")){
								supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerStaffCode");
							}
							if(!queryConfig.contains("ownerStaff.name")){
								supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerStaffName");
							}
						}else if( p.getName().equals("ownerPosition") && !p.getModel().getEntity().getIsBase() ){//用于导出时，流程表单导出拥有者岗位
							//String assProperty = produceTaskService.getAssProperty(p.getCode());	
							//String assModelCode = produceTaskService.getPropertyModelCode(assProperty);
							//Model assModel = modelServiceFoundation.getModel(assModelCode);
							Model assModel = p.getAssociatedProperty().getModel();
							if(!queryConfig.contains("ownerPosition.code")){
								supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerPositionCode");
							}
							if(!queryConfig.contains("ownerPosition.name")){
								supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerPositionName");
							}
						}
					}
				}
		       	
				if(supplyConfig.length()>0){
					queryConfig = queryConfig.substring(0, queryConfig.lastIndexOf("</list>")) + supplyConfig + "</list>";
				}
				
				//解析xml
				exportMaps=parseXml(queryConfig);
				//存储cookie
				if(exportMaps.size()>0)  {
					page.setCustomerExport(true);
				}else {
					page.setCustomerExport(false);
				}
				page.setUseForImportFlag(useForImportFlag);
				page.setExportAuxiliaryModelFlag(exportAuxiliaryModelFlag);
				if(isNeedSaveCookie){
					saveExportCookie(viewCode,queryConfig);
				}
				page.setProperties(exportMaps);
				for(Map m : exportMaps){
					if( m.get("name").toString().equals("ownerStaff.name") || m.get("name").toString().equals("ownerStaff.code")){
						m.put("nullable", "false");
					}else if( (m.get("name").toString().equals("ownerPosition.name")	|| m.get("name").toString().equals("ownerPosition.code") ) 
							&& !view.getAssModel().getEntity().getIsBase()){//流程拥有者岗位要求非空
						m.put("nullable", "false");
					} else if( m.get("name").toString().equals("tableNo") && !view.getAssModel().getEntity().getIsBase()){//单据编码要求可空
						m.put("nullable", "true");
					}
					//Property p = modelServiceFoundation.findPropertyByCode(m.get("propertyCode").toString(),null);
					if(m.get("columntype") != null && m.get("columntype").toString().equals("DECIMAL") ){
						for(Property p : properties){
							if(m.get("propertyCode").equals(p.getCode()) && p.getDecimalNum() != null && p.getDecimalNum() > 0){
								m.put("decimalNum", p.getDecimalNum());
							}else{
								m.put("decimalNum", 0);
							}
						}
					}else if(m.get("columntype") != null && m.get("columntype").toString().equals("ENUMERATE") ){
						Property p = modelServiceFoundation.findPropertyByCode(m.get("propertyCode").toString());
						Map<String, Object> contentMap=com.supcon.orchid.ec.utils.ConditionUtil.deserializeJson(p.getFillcontent());
						m.put("fillContent", contentMap.get("fillContent"));
					}
				}
				List<Map> thisStyleFormats = generateStyleFormats(exportMaps,null);
				if(findExportDataInfosCount == 1){
					styleFormats.addAll(thisStyleFormats);
				}
				page.setStyleFormats(styleFormats);
				exportSql=generteCustomerSql(view,exportMaps);
				
				if(bkIsInherent||bkIsId){//较早版本的业务包可能version字段作为业务主键，此种情况通过id管理
					Map<Object, Object> m = new HashMap<Object, Object>();
					m.put("namekey", idProp.getDisplayName().toString());
					m.put("nullable", bkIsId?"true":"false");//id作为业务主键若空则新增
					m.put("propshowformat", "TEXT");
					m.put("dispalyName", idProp.getDisplayName().toString());
					m.put("propertyCode", idProp.getCode().toString());
					m.put("multable", "false");
					m.put("seniorsystemcode", "false");
					m.put("name", idProp.getName().toString());
					m.put("containLower", "false");
					m.put("columnName", idProp.getColumnName().toString());
					m.put("columntype", idProp.getType().toString().toString());
					m.put("key", idProp.getName().toString());
					page.getProperties().add(m);
					
					Map<String, String> m1 = new HashMap<String, String>();
					m1.put("key",idProp.getName());
					m1.put("propType", "id");
					thisStyleFormats.add(m1);
					if(findExportDataInfosCount == 1){
						page.getStyleFormats().add(m1);
					}
				}
				
				if(bkIsId){//若主模型业务主键为id，则新增虚拟关联字段字段用于关联的辅模型中做新增的主模型数据的关联
					Map<String, String> m = new HashMap<String, String>();
					m.put("showWidth", "70");
					m.put("nullable", "true");
					m.put("dispalyName", "虚拟关联字段");
					m.put("propertyCode", "virtual:Main:"+idProp.getCode());
					m.put("name", "mainVisualId");
					m.put("columntype","TEXT");
					//m.put("styleId",model.get("modelName") + ".mainVisualId");
					page.getProperties().add(m);
					
					//styleFormats.removeAll(thisStyleFormats);
					Map<String, String> m1 = new HashMap<String, String>();
					m1.put("key", view.getAssModel().getModelName() + ".mainVisualId");
					m1.put("propType", "visualId");
					thisStyleFormats.add(m1);
					if(findExportDataInfosCount == 1){
						page.getStyleFormats().add(m1);
					}
				}
				
			}
		}
		if(exportAuxiliaryModelFlag){
			this.generateFlag = false;
		}
		if(null != datagridCode && !datagridCode.equals("")){
			viewCode = viewCode + "," + datagridCode; 	//增强型视图中，列表ptcode
		}
		if(null != searchObjects && searchObjects.length > 0) {
			produceTaskService.findProduceTasks(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap, searchObjects);
		} else {
			produceTaskService.findProduceTasks(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
		}
		if(getPage().isExportFlag() && getPage().getResult() != null && getPage().getResult().size() > 0) {//主模型查询结果存到一个list中，用于辅模型的过滤
			List<WOMProduceTask> results = getPage().getResult(); 
			if(results != null && results.size()>0){
				for(WOMProduceTask result : results){
					this.queryResults.add(result);
				}
			}
		}
		this.findExportDataInfosCount++;
		return getPage();
	}
	
	/**
	 * 生成用于导出的自定义区域信息
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, List> generateShowCusPros(String showType, String... datagridCode) {
		String dgCode = null;
		boolean isDatagird = false;
		DataGrid datagrid = null;
		View view = null;
		if (null != datagridCode && datagridCode.length > 0) {
			dgCode = datagridCode[0].toString();
			isDatagird = true;
		}
		if (!isDatagird) {
			view = viewServiceFoundation.getView(viewCode, true);
		} else {
			datagrid = viewServiceFoundation.getDataGrid(dgCode);
		}
		Map<String, List> cusShowProps = new HashMap<String, List>();
		if (null != view && !showType.isEmpty() & !isDatagird) {
			if (view.getExtraView() != null) {
				Map<String, Object> configMap = (Map<String, Object>) SerializeUitls.deserialize(view.getExtraView().getConfig());
				if (null != configMap) {
					cusShowProps = generateDetailCusShowProp(showType, view.getCode(), configMap);
				}
			}
		} else if (null != datagrid && !showType.isEmpty() & isDatagird) {
			String fullConfig = datagrid.getFullConfig();
			if(com.supcon.orchid.utils.StringUtils.isEmpty(fullConfig)){
				fullConfig = ecConfigService.getEcFullConfig(datagrid);
			}
			Map<String, Object>  configMap = (Map<String, Object>) SerializeUitls.deserialize(fullConfig);
			if (null != configMap) {
				cusShowProps = generateDetailCusShowProp(showType, dgCode, configMap);
			}
		}
		return cusShowProps;
	}
	
	
	/**
	 * 生成用于导出的自定义区域的详细信息
	 * @param showType   datagird or listpt
	 * @param associateCode		viewCode  or  dgCode
	 * @param configMap			the config map of  the  view Or  the conif map of  the datagird
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	private Map<String, List> generateDetailCusShowProp(String showType, String associateCode,Map<String, Object> configMap) {
		Map<String, List> cusShowProps = new HashMap<String, List>();
		Map<String, Object> layOutConfig = (Map<String, Object>) configMap.get("layout");
		if (null != layOutConfig) {
			List<Map<String, Object>> sections = (ArrayList<Map<String, Object>>) layOutConfig.get("sections");
			for (Map<String, Object> section : sections) {
				if (null != section) {
					if (null != section.get("regionType") && showType.equals(section.get("regionType").toString())) {
						if (null != section.get("cells")) {
							List<Map<String, Object>> cells = (ArrayList<Map<String, Object>>) section.get("cells");
							for (Map<String, Object> cell : cells) {
								if (null != cell.get("customSection") && "true".equals(cell.get("customSection").toString())) {
									String propRec = null;
									String customModelCode = null;
									List<String> argList = new ArrayList<String>();
									if (null != cell.get("customModelCode")) {
										customModelCode = cell.get("customModelCode").toString();
										argList.add(customModelCode);
									}
									if (null != cell.get("propertyLayRec")) {
										propRec = cell.get("propertyLayRec").toString();
										argList.add(propRec);
									}
									String viewType = showType;
									argList.add(viewType);
									argList.add(associateCode);
									if (argList.size() >= 3) {
										List<CustomPropertyViewMapping> rs = new ArrayList<CustomPropertyViewMapping>();
										rs = iViewServiceFoundation.findShowedCustomProps(customModelCode, associateCode, viewType, propRec);
										cusShowProps.put(propRec, rs);
									}
								}
							}
							return cusShowProps;
						}
					}
				}
			}
		}
		return Collections.EMPTY_MAP;
	}
	
	/**
	 * 生成excel导出中字段的样式
	 * @param exportMaps
	 * @return
	 */
	public List<Map>  generateStyleFormats(List<Map> exportMaps, String modelName)  {
		List<Map> columns = new ArrayList<Map>();
		for(Map<String, Object> fieldMap:exportMaps)   {
			Map<String, Object> formatMap = new HashMap<String, Object>();
			if (fieldMap != null && !fieldMap.isEmpty() && fieldMap.get("propertyCode") != null
					&& fieldMap.get("propertyCode").toString().length() > 0) {
				if ("DECIMAL".equals(fieldMap.get("columntype"))) {
					String decimalNum = null;
					if (fieldMap.get("decimalNum") != null) {
						decimalNum = (fieldMap.get("decimalNum")).toString();
					}
					int number = 2;
					if (decimalNum != null && decimalNum.length() > 0) {
						try {
							number = Integer.parseInt(decimalNum);
						} catch (NumberFormatException e) {
							log.warn(e.getMessage());
							number = 2;
						}
					}
					String showFormat = (String) fieldMap.get("propshowformat");
					if ("PERCENT".equals(showFormat)) {
						number = number - 2;
					}
	
					StringBuffer sb = new StringBuffer();
					if (number == 0) {
						sb.append("0");
					} else if (number > 0) {
						sb.append("0.");
					} else if (number < 0) {
						sb.append("0");
					}
					for (int i = 0; i < number; i++) {
						sb.append("0");
					}
					if ("PERCENT".equals(showFormat)) {
						sb.append("%");
					} else {
						sb.append("");
					}
					formatMap.put("format", sb.toString());
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
				}else if("DATETIME".equals(fieldMap.get("columntype"))||"DATE".equals(fieldMap.get("columntype")))  {
					if(fieldMap.get("propshowformat")!=null)  {
						String dateFormat=fieldMap.get("propshowformat").toString();
						String  sb =new String();
						switch(dateFormat)  {
							case "Y":
							{
								sb="yyyy";
								break;
							}
							case "YM":{
								sb="yyyy-mm";
								break;
							}
							case "YMD":{
								sb="yyyy-mm-dd";
								break;
							}
							case "YMD_H":{
								sb="yyyy-mm-dd\\ HH";
								break;
							}
							case "YMD_HM":{
								sb="yyyy-mm-dd\\ HH:mm";
								break;
							}case "YMD_HMS":{
								sb="yyyy-mm-dd\\ HH:mm:ss";
								break;
							}default:{
								sb="yyyy-mm-dd\\ HH:mm:ss";
								break;
							}
						}
						formatMap.put("format", sb.toString());
						formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
					}
					
				}else if ("INTEGER".equals(fieldMap.get("columntype"))) {
					String showFormat = (String) fieldMap.get("propshowformat");
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
					if ("PERCENT".equals(showFormat)) {
						formatMap.put("format", "0%");
					}
				} else if ("MONEY".equals(fieldMap.get("columntype"))) {
					String decimalNum = null;
					if (fieldMap.get("propPrecision") != null) {
						decimalNum = (fieldMap.get("propPrecision")).toString();
					}
					int number = 2;
					if (decimalNum != null && decimalNum.length() > 0) {
						try {
							number = Integer.parseInt(decimalNum);
						} catch (NumberFormatException e) {
							log.warn(e.getMessage());
							number = 2;
						}
					}
	
					String showFormat = (String) fieldMap.get("propshowformat");
					StringBuffer sb = new StringBuffer();
					if ("THOUSAND".equals(showFormat)) {
						sb.append("#,##");
					}
					sb.append("0");
					if (number > 0) {
						sb.append(".");
					}
					for (int i = 0; i < number; i++) {
						sb.append("0");
					}
					formatMap.put("format", sb.toString());
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
				} else {
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
				}
				formatMap.put("propType", fieldMap.get("columntype"));
				columns.add(formatMap);
			}
		}
		return columns;
	}
	
	
	
	
	/**
	 * 保存cookie
	 * @param p
	 * @return
	 */
	public void saveExportCookie(String viewCode,String queryConfig)  {
		if(!useForImportFlag){
			String  cookieType="EXPORT_" + viewCode;
			Cookie cookie = null;
			cookie = (Cookie) cookieService.getCookie(cookieType, getCurrentUser().getId(), getCurrentCompany());
		    if(cookie!=null)  {
				cookie.setValue(queryConfig);
				cookieService.update(cookie);
			}else {
				cookie = new Cookie();
				cookie.setType("EXPORT_" + viewCode);
				cookie.setUser(getCurrentUser());
				cookie.setValue(queryConfig);
				cookieService.save(cookie);
			}
		}
	}
	
	
	public List<Map>   parseXml(String xmlSource)  {
		 List<Map>  maps=new ArrayList<Map>();
		 try {  
             org.dom4j.Document doc=(org.dom4j.Document)DocumentHelper.parseText(xmlSource);  
             Element root = doc.getRootElement();  
             Iterator elements=root.elementIterator();
             for (Iterator iterator = elements; iterator.hasNext();) {
            	 Element element=(Element) iterator.next();
            	 Iterator   innerIntertor=element.elementIterator();
            	 Map map = new HashMap();
            	 for(Iterator iterator2=innerIntertor;innerIntertor.hasNext();)  {
            		 Element type2 = (Element) iterator2.next();
            		 map.put(type2.getName(), type2.getText());
            	 }
            	 maps.add(map);		
			}
            this.generateFlag=true;
            
         } catch (Exception e) {  
             e.printStackTrace();  
         } 
		 return maps;
	}
	
	public static String firstLatterToLowerCase(String key) {
		char fl = ((String) key).charAt(0);
		return Character.toLowerCase(fl) + ((String) key).substring(1);
	}
	
	/**
	 * 
	 * @param view  相关视图
	 * @param mapDatas		参数
	 * @return
	 */
	public String  generteCustomerSql(View view,List<Map> mapDatas)   {
		//是否表单类型
		Boolean isFormObject=view.getAssModel().getEntity().getWorkflowEnabled();
		Model  model = view.getAssModel();
		StringBuilder sb=new StringBuilder();
		StringBuilder join =  new StringBuilder();
		if(mapDatas==null||mapDatas.size()==0)  {
			return "";
		}
		sb.append("SELECT ");
		if(isFormObject) {
			if(currentSqlType==Sql.TYPE_LIST_PENDING)  {
				sb.append("\"p\".ID AS \"pending.id\",\"p\".PROCESS_KEY AS \"pending.processKey\",\"p\".PROCESS_VERSION AS \"pending.processVersion\",\"p\".TABLE_INFO_ID AS \"pending.tableInfoId\",\"p\".ACTIVITY_NAME AS \"pending.activityName\",\"p\".PROCESS_ID AS \"pending.processId\",\"p\".ACTIVITY_TYPE AS \"pending.activityType\",\"p\".DEPLOYMENT_ID AS \"pending.deploymentId\",\"p\".USER_ID AS \"pending.userId\",\"p\".OPEN_URL AS \"pending.openUrl\",\"p\".TASK_DESCRIPTION AS \"pending.taskDescription\",\"p\".PROCESS_NAME AS \"pending.processName\",\"p\".PROCESS_DESCRIPTION AS \"pending.processDescription\",\"p\".PROXY_SOURCE AS \"pending.proxySource\",\"p\".SOURCE_STAFF AS \"pending.sourceStaff\",\"p\".MOBILE_APPROVE AS \"pending.mobileApprove\"");
				sb.append(",");
			}
		}
		//组合map
		//实体简称
		String modelAlias = "\"" + firstLatterToLowerCase(view.getAssModel().getModelName()) + "\"";
		Boolean notHasId = true;
		for(Map m : mapDatas){
			if(m.get("key").toString().equals("id")){
				notHasId = false;
			}
		}
		if(notHasId){
			sb.append(modelAlias + ".ID AS \"id\", ");
		}
		join.append(viewServiceFoundation.joinSQL(view, sb, modelAlias,mapDatas));
		if(isFormObject) {
			sb.append(",");
			String pendingTableInfoId=modelAlias+".TABLE_INFO_ID AS \"tableInfoId\"";
			if(sb.indexOf(pendingTableInfoId)==-1)  {
				if(!sb.toString().endsWith(","))  {
					sb.append(",");
				}
				sb.append(pendingTableInfoId).append(",");
			}
			if(null!=model.getIsMain()&&model.getIsMain())  {
				String pendingStatus=modelAlias+".STATUS AS \"status\"";
				String pendingTableNo=modelAlias+".TABLE_NO AS \"tableNo\"";
				if(sb.indexOf(pendingStatus)==-1)  {
					if(!sb.toString().endsWith(","))  {
						sb.append(",");
					}
					sb.append(pendingStatus).append(",");
				}
				if(sb.indexOf(pendingTableNo)==-1)  {
					if(!sb.toString().endsWith(","))  {
						sb.append(",");
					}
					sb.append(pendingTableNo).append(",");
				}
			}
			if(sb.toString().endsWith(","))  {
				sb=sb.deleteCharAt(sb.length()-1);
			}
			if(currentSqlType==Sql.TYPE_LIST_PENDING) {
				sb.append(" FROM WF_PENDING \"p\"  INNER JOIN ");
				sb.append(view.getAssModel().getTableName()).append(" ").append(modelAlias);
				sb.append(" ON \"p\".TABLE_INFO_ID=");
				sb.append(modelAlias).append(".").append("TABLE_INFO_ID");
				sb.append(" ").append(join);		
			}else if(currentSqlType==Sql.TYPE_LIST_QUERY)  {
				sb.append(" FROM ").append(view.getAssModel().getTableName()).append(" ").append(modelAlias);
				sb.append(join);
			}
		}else {
			sb.append(" FROM ").append(view.getAssModel().getTableName()).append(" ").append(modelAlias);
			sb.append(join);
		}
		return sb.toString();
	}


	public boolean isEditNew(){
		//return null == this.produceTask || null == this.produceTask.getId();
		return null == this.id;
	}
	public CreatorInfo getCreatorInfo(){
		return this.creatorInfo;
	}
	
	@Resource
	private ProcessService processService;
	@Resource
	private TaskService taskService;
	
	private Long pendingId;
	private Pending pending;
	private Long deploymentId;
	private List<Transition> transitions;
	private List<Transition> rejectTransitions;
	private List<Transition> nomalTransitions;
	private WorkFlowVar workFlowVar;
	private String processKey;
	
	private Long userId;
	private String mainViewPath;
	public String getMainViewPath() {
		return mainViewPath;
	}
	public Long getUserId() {
		return userId;
	}
	public Pending getPending(){return this.pending;}
	public void setPending(Pending pending){this.pending = pending;}
	public void setProcessKey(String processKey) {
		this.processKey = processKey;
	}
	
	public String getProcessKey() {
		return processKey;
	}
	
	public WorkFlowVar getWorkFlowVar(){return this.workFlowVar;}
	public void setWorkFlowVar(WorkFlowVar workFlowVar){
		this.workFlowVar = workFlowVar;
	}
	public List<Transition> getTransitions() {
		return transitions;
	}
	
	public List<Transition> getRejectTransitions() {
		return rejectTransitions;
	}
	
	public List<Transition> getNomalTransitions() {
		return nomalTransitions;
	}
	public Map<String, Map<String, String>> getLastAssignUserMap() {
		if (lastAssignUserMap == null && produceTask != null && produceTask.getProcessKey() != null) {
			lastAssignUserMap = new HashMap<>();
			Map<String, String> temp = null;
			if (transitions == null) {
				return null;
			}
			List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("user", getCurrentUser()),
					Restrictions.like("type", "DEFAULT_SELECTSTAFF_" + produceTask.getProcessKey(), MatchMode.START));
			if (cookies != null && !cookies.isEmpty()) {
				for (Transition transition : transitions) {
					for (ICookie cookie : cookies) {
						if (cookie != null && cookie.getType().endsWith("_" + transition.getName())) {
							String ids = "";
							String names = "";
							List<Long> userIds = new ArrayList<>();
							for (String item : cookie.getValue().split(",")) {
								if (item != null && !item.isEmpty()) {
									userIds.add(Long.valueOf(item));
								}
							}
							List<Staff> staffs = _staffService.findByCriteria(Restrictions.in("user.id", userIds),
									Restrictions.sqlRestriction("WORK_STATUS != 'STAFFSTATUSE_NATURE/STAFFSTATUTS_03'"),
									Restrictions.eq("valid", true), Restrictions.eq("sysFlag", false));
							if (staffs != null && !staffs.isEmpty()) {
								for (Staff s : staffs) {
									if (!ids.isEmpty()) {
										ids += ",";
										names += ",";
									}
									ids += s.getUser().getId();
									names += s.getName();
								}
							}
							temp = new HashMap<>();
							temp.put("ids", ids);
							temp.put("names", names);
							lastAssignUserMap.put(transition.getName(), temp);
						}
					}
				}
			}
		}
		return lastAssignUserMap;
	}

	public boolean getRecallAble() {
		return produceTaskService.isRecallAble(tableInfoId);
	}

	@Action(value = "/WOM/produceTask/produceTask/common/recall", results = { @Result(type = JSON, params = { "root", "msg" }) })
	public String recall() {
		Pending p = produceTaskService.recall(tableInfoId);
		msg = new ResponseMsg(true);
		msg.setData(p);
		return SUCCESS;
	}

	protected void saveLastAssignUser() {
		if (workFlowVar != null && workFlowVar.getOutcomeMap() != null && workFlowVar.getOutcomeMap().size() > 0) {
			for (Map<String, ?> map : workFlowVar.getOutcomeMap()) {
				String outcome = (map.get("outcome") != null) ? map.get("outcome").toString() : "";
				String assignUser = (map.get("assignUser") != null) ? map.get("assignUser").toString() : "";

				if (assignUser != null && !assignUser.isEmpty()) {

					List<ICookie> cookies = cookieService.findCookieByCriteria(Restrictions.eq("user", getCurrentUser()),
							Restrictions.eq("type", "DEFAULT_SELECTSTAFF_" + produceTask.getProcessKey() + "_" + outcome));
					Cookie cookie = null;
					if (cookies == null || cookies.isEmpty()) {
						cookie = new Cookie();
						cookie.setType("DEFAULT_SELECTSTAFF_" + produceTask.getProcessKey() + "_" + outcome);
						cookie.setUser(getCurrentUser());
					} else {
						cookie = (Cookie) cookies.get(0);
					}
					cookie.setValue(assignUser);
					cookieService.save(cookie);

				}
			}
		}
	}

	public Long getPendingId() {
		return pendingId;
	}

	public void setPendingId(Long pendingId) {
		this.pendingId = pendingId;
	}

	public Long getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(Long deploymentId) {
		this.deploymentId = deploymentId;
	}
	private String processId;
	private String activityName;
	private String processVersion;
	private String activityType;
	private String des;
	private String isApproval;
	private String taskDescription;
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getActivityType() {
		return activityType;
	}
	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getIsApproval() {
		return isApproval;
	}
	public void setIsApproval(String isApproval) {
		this.isApproval = isApproval;
	}
	public String getProcessVersion() {
		return processVersion;
	}

	public void setProcessVersion(String processVersion) {
		this.processVersion = processVersion;
	}
	
	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	
	private Boolean webSignetFlag; 
	
	public Boolean getWebSignetFlag() {
		return webSignetFlag;
	}

	public void setWebSignetFlag(Boolean webSignetFlag) {
		this.webSignetFlag = webSignetFlag;
	}
	
	/**
	 * 批量处理
	 * @return
	 * @throws Exception
	 */
	@Action(value="/WOM/produceTask/produceTask/approval",results={@Result(name="success",type=FREEMARKER,location="approval.ftl")})
	public String batchApproval() throws Exception{
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "batchApproval");
		if(null!=processId&&null!=activityName){
			setIsApproval("true");
			des = URLDecoder.decode(des,"UTF-8");
			Long pid = Long.parseLong(pendingIds.split(",")[0]);
			pending = taskService.getPending(pid);
			if(pending == null) {
				throw new BAPException(Code.PENDING_NOT_FOUND);
			}
			transitions = processService.getActivityOutTransition(processId, activityName);
			Map<String,Object> activeMap=processService.getActivityMap(pending.getProcessId(), pending.getActivityName());
			dealFlag=(Boolean)activeMap.get("dealFlag");
			dealSet=(Integer)activeMap.get("dealSet");
			activityName = (String) activeMap.get("activityName");
			taskDescription = (String) activeMap.get("taskDescription");
			webSignetFlag = (Boolean)activeMap.get("webSignetFlag");
			if (activeMap.get("loopFlag") != null) {
				pending.setLoop((Integer) activeMap.get("loopFlag"));
			}
		}
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "batchApproval");
		return SUCCESS;
	}
	
	
	@Resource
	private DocumentService documentService;
	
	private String linkId;
	private String type;
	private Page<Document> attachments;

	public String getLinkId() {
		return linkId;
	}

	public void setLinkId(String linkId) {
		this.linkId = linkId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Page<Document> getAttachments() {
		if(attachments == null) {
			attachments = new Page<Document>(Integer.MAX_VALUE);
		}
		return attachments;
	}

	public void setAttachments(Page<Document> attachments) {
		this.attachments = attachments;
	}
	
	@Action(value = "/WOM/produceTask/produceTask/attachment-init", interceptorRefs = { @InterceptorRef("fileUpload"), @InterceptorRef("orchidStack") }, results = { @Result(location = "list-attachment.ftl", type = FREEMARKER) })
	public String attachmentInit() throws Exception {
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "attachmentInit");
		if (linkId != null && linkId.length() > 0 && type != null && type.length() > 0) {
			if(propertyCode != null && propertyCode.length() > 0){
				documentService.getByLinkIdAndTypePage(getAttachments(), Long.valueOf(linkId), type, propertyCode);
			}else{
				documentService.getByLinkIdAndTypePage(getAttachments(), Long.valueOf(linkId), type);
			}
			if (attachments.getResult() != null) {
				for (Document doc : attachments.getResult()) {
					doc.setSizeDis(DocumentUtils.sizeConversion(doc.getSize()));
				}
			}
		}
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "attachmentInit");
		return SUCCESS;
	}
	
	/**
	 * excel导入页面
	 * @return
	 * @throws Exception
	 */
	@Action(value="/WOM/produceTask/produceTask/initImport",results={@Result(name="success",type=FREEMARKER,location="excelImport.ftl")})
	public String initImport() throws Exception{
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "initImport");
		return SUCCESS;
	}
	
	@Action(value="/WOM/produceTask/produceTask/initMainImport",results={@Result(name="success",type=FREEMARKER,location="mainImportDialog.ftl")})
	public String initMainImport() throws Exception{
		return SUCCESS;
	}
	
	@Action(value = "/WOM/produceTask/produceTask/importxls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "response.ftl", type = FREEMARKER) })
	public String imports() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.WOM.services.WOMProduceTaskService"
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"      
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"      
						, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"      
						, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"      
						, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"      
						, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"      
						, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"      
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
						, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
						, "com.supcon.orchid.MESBasic.services.MESBasicProductService"
						, "com.supcon.orchid.RM.services.RMStandService"
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
						, "com.supcon.orchid.X6Basic.services.X6BasicBaseUnitService"
						, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
						, "com.supcon.orchid.WOM.services.WOMStandingcropRefService"
						, "com.supcon.orchid.RM.services.RMFormulaBomService"
						, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
						, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
						, "com.supcon.orchid.RM.services.RMFormulaService"
						, "com.supcon.orchid.RM.services.RMFormulaProcessService"
						, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
						, "com.supcon.orchid.RM.services.RMProcessTypeService"
						, "com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService"
						, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
						, "com.supcon.orchid.publicSet.services.PublicSetActBatStateService"
						, "com.supcon.orchid.RM.services.RMSampleProjService"
						, "com.supcon.orchid.RM.services.RMPickSiteService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
		};
		//过滤重复的Service
		List<Object> objects = new ArrayList<Object>();
		for (int i=0; i<importServices.length; i++) { 
			if(!objects.contains(importServices[i])){
				objects.add(importServices[i]);  
			}
        } 
        
        List<CustomPropertyModelMapping> list = modelServiceFoundation.getCustomPropertiesWithType("WOM_7.5.0.0_produceTask", DbColumnType.OBJECT);
		if(null != list && !list.isEmpty()){
			for(CustomPropertyModelMapping mapping : list){
				if(null != mapping.getAssociatedProperty() && null != mapping.getAssociatedProperty().getModel()){
					String moduleArtifact = mapping.getAssociatedProperty().getModel().getEntity().getModule().getArtifact();
					String serviceName = "com.supcon.orchid." + moduleArtifact + ".services.";
					if("1.0".equals(mapping.getAssociatedProperty().getModel().getEcVersion())){
						serviceName += mapping.getAssociatedProperty().getModel().getModelName() + "Service";
					} else {
						serviceName += mapping.getAssociatedProperty().getModel().getJpaName() + "Service";
					}
					if(!objects.contains(serviceName)){
						objects.add(serviceName);
					}
				}
			}
		}
        
		List<Model> models = modelServiceFoundation.getModels("WOM_7.5.0.0_produceTask");
		for(Model m : models){
			//if(!m.getCode().equals(mainModel.getCode())){
				List<Property> props = modelServiceFoundation.findProperties(m);
				for(Property p : props){
					if(!p.getIsInherent() && !p.getIsCustom() && p.getType().toString().equals("OBJECT")){
						String moduleName = p.getAssociatedProperty().getModel().getModuleCode();
						if(p.getAssociatedProperty().getModel().getModuleCode().indexOf("_") != -1){
							moduleName = p.getAssociatedProperty().getModel().getModuleCode().substring(0,p.getAssociatedProperty().getModel().getModuleCode().indexOf("_"));
						}
						String serviceStr = "com.supcon.orchid."+ moduleName + ".services." + moduleName + p.getAssociatedProperty().getModel().getModelName() + "Service";
						if(!objects.contains(serviceStr)){
							objects.add(serviceStr);
						}
					}else if(p.getIsCustom() && p.getType().toString().equals("OBJECT")){
						List<CustomPropertyModelMapping> modelMappings = viewServiceFoundation.findCustomPropertyForAsso(p.getModel().getCode(), p.getCode());
						if(modelMappings != null && modelMappings.size()>0){
							String moduleName = modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode();
							if(modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().indexOf("_") != -1){
								moduleName = modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().substring(0,modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().indexOf("_"));
							}
							String serviceStr = null;
							if(moduleName.equals("sysbase")){
								serviceStr = "com.supcon.orchid.foundation.services." + modelMappings.get(0).getAssociatedProperty().getModel().getModelName() + "Service";
							}else{
								serviceStr = "com.supcon.orchid."+ moduleName + ".services." + moduleName + modelMappings.get(0).getAssociatedProperty().getModel().getModelName() + "Service";
							}
							if(!objects.contains(serviceStr)){
								objects.add(serviceStr);
							}
						}
					}
				}
			//}
		}
		Iterator<Object> it = objects.iterator();
		while(it.hasNext()){
		    Object obj = it.next();
		    if(obj == null){
		        it.remove();
		    }
		}
		Object[] newService = new Object[objects.size()];
		objects.toArray(newService);
        
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "imports");
		long startTime = System.currentTimeMillis();
		try {
			if(dataFile != null && datagridCode != null && datagridCode.length() > 0){
			
			
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS"); 
				time = sdFormat.format(new Date());
				String[] name = (String[]) ActionContext.getContext().getParameters().get("dataFileFileName");
				if(name == null || name.length == 0){
					name = new String[]{"default"};
				}
				orgName = name[0];
				SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
				xlsResult = importService.imports(tid, dataFile, datagridCode, time, name[0], fileType, signatureLog,newService);
				if(null != xlsResult && xlsResult.trim().length() > 0 && xlsResult.startsWith("repeat")){
					isReplace = true;
					isIgnore = false;
					xlsResult = xlsResult.substring(7);
				} else {
					isReplace = false;
					isIgnore = false;
				}
			}
		} catch (Exception e) {
			xlsResult = "exception|" + getText("import.error.failure") + e.getMessage();
			for(StackTraceElement ele : e.getStackTrace()){
				xlsResult += ele.toString();
				logger.warn(ele.toString());
			}
			return SUCCESS;
		}
		long endTime = System.currentTimeMillis();
		logger.info("action upload cast {} ms", (endTime - startTime));
		bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "imports");
		return SUCCESS;
	}
	
	@Action(value = "/WOM/produceTask/produceTask/importMainXls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "mainImportResponse.ftl", type = FREEMARKER) })
	public String importMainXls() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.WOM.services.WOMProduceTaskService"
						, "com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService"       
						, "com.supcon.orchid.MESBasic.services.MESBasicProductService"       
						, "com.supcon.orchid.publicSet.services.PublicSetBatchInfoService"       
						, "com.supcon.orchid.RM.services.RMFormulaService"       
						, "com.supcon.orchid.foundation.services.DepartmentService"       
						, "com.supcon.orchid.foundation.services.PositionService"       
						, "com.supcon.orchid.foundation.services.StaffService"       
						, "com.supcon.orchid.WOM.services.WOMBatchNumRuleService"       
						, "com.supcon.orchid.WOM.services.WOMManulOrderMainService"       
						, "com.supcon.orchid.WOM.services.WOMDayBatchPlanPartsService"       
						, "com.supcon.orchid.WOM.services.WOMStandingcropRefService"       
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"      
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"      
						, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"      
						, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"      
						, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"      
						, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"      
						, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"      
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
						, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
						, "com.supcon.orchid.MESBasic.services.MESBasicProductService"
						, "com.supcon.orchid.RM.services.RMStandService"
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
						, "com.supcon.orchid.X6Basic.services.X6BasicBaseUnitService"
						, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
						, "com.supcon.orchid.WOM.services.WOMStandingcropRefService"
						, "com.supcon.orchid.RM.services.RMFormulaBomService"
						, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
						, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
						, "com.supcon.orchid.RM.services.RMFormulaService"
						, "com.supcon.orchid.RM.services.RMFormulaProcessService"
						, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
						, "com.supcon.orchid.RM.services.RMProcessTypeService"
						, "com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService"
						, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
						, "com.supcon.orchid.publicSet.services.PublicSetActBatStateService"
						, "com.supcon.orchid.RM.services.RMSampleProjService"
						, "com.supcon.orchid.RM.services.RMPickSiteService"
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
						, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
						, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
						, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
						, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
						, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
						, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
						, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
						, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
						, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
						, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempHeadService"
					, "com.supcon.orchid.WOM.services.WOMAdjustOrTempRecordsService"
					, "com.supcon.orchid.WOM.services.WOMBatchChargeDetailsService"
					, "com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService"
					, "com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService"
					, "com.supcon.orchid.WOM.services.WOMProduceMaterialSumService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskActiveService"
					, "com.supcon.orchid.WOM.services.WOMProduceTaskProcessService"
					, "com.supcon.orchid.WOM.services.WOMProductNumIndexService"
					, "com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService"
		};
		
		//过滤重复的Service
		List<Object> objects = new ArrayList<Object>();
		for (int i=0; i<importServices.length; i++) { 
			if(!objects.contains(importServices[i])){
				objects.add(importServices[i]);  
			}
        }
        
        List<CustomPropertyModelMapping> list = modelServiceFoundation.getCustomPropertiesWithType("WOM_7.5.0.0_produceTask", DbColumnType.OBJECT);
		if(null != list && !list.isEmpty()){
			for(CustomPropertyModelMapping mapping : list){
				if(null != mapping.getAssociatedProperty() && null != mapping.getAssociatedProperty().getModel()){
					String moduleArtifact = mapping.getAssociatedProperty().getModel().getEntity().getModule().getArtifact();
					String serviceName = "com.supcon.orchid." + moduleArtifact + ".services.";
					if("1.0".equals(mapping.getAssociatedProperty().getModel().getEcVersion())){
						serviceName += mapping.getAssociatedProperty().getModel().getModelName() + "Service";
					} else {
						serviceName += mapping.getAssociatedProperty().getModel().getJpaName() + "Service";
					}
					if(!objects.contains(serviceName)){
						objects.add(serviceName);
					}
				}
			}
		}
        
		View mainView = viewServiceFoundation.getView(viewCode);
		Model mainModel = mainView.getAssModel();
		List<Model> models = modelServiceFoundation.getModels("WOM_7.5.0.0_produceTask");
		for(Model m : models){
			if(!m.getCode().equals(mainModel.getCode())){
				List<Property> props = modelServiceFoundation.findProperties(m);
				for(Property p : props){
					if(!p.getIsInherent() && !p.getIsCustom() && p.getType().toString().equals("OBJECT")){
						String moduleName = p.getAssociatedProperty().getModel().getModuleCode();
						if(p.getAssociatedProperty().getModel().getModuleCode().indexOf("_") != -1){
							moduleName = p.getAssociatedProperty().getModel().getModuleCode().substring(0,p.getAssociatedProperty().getModel().getModuleCode().indexOf("_"));
						}
						String serviceStr = "com.supcon.orchid."+ moduleName + ".services." + moduleName + p.getAssociatedProperty().getModel().getModelName() + "Service";
						if(!objects.contains(serviceStr)){
							objects.add(serviceStr);
						}
					}
				}
			}
		}
		Iterator<Object> it = objects.iterator();
		while(it.hasNext()){
		    Object obj = it.next();
		    if(obj == null){
		        it.remove();
		    }
		}
		Object[] newService = new Object[objects.size()];
		objects.toArray(newService);
		
		long startTime = System.currentTimeMillis();
		try {
			if(dataFile != null){
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS"); 
				time = sdFormat.format(new Date());
				String[] name = (String[]) ActionContext.getContext().getParameters().get("dataFileFileName");
				if(name == null || name.length == 0){
					name = new String[]{"default"};
				}
				orgName = name[0];
				//xlsResult = importService.imports(viewCode, "WOM_7.5.0.0_produceTask_ProduceTask", dataFile, time, name[0], isReplace, isIgnore, fileType, importServices);
				SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
				xlsResult = importService.batchImports(viewCode, "WOM_7.5.0.0_produceTask_ProduceTask", dataFile, time, name[0], isReplace, isIgnore, isBatch, fileType, signatureLog,newService);
				if(null != xlsResult && xlsResult.trim().length() > 0 && xlsResult.startsWith("repeat")){
					isReplace = true;
					isIgnore = false;
					xlsResult = xlsResult.substring(7);
					viewCode = getViewCode();
				} else {
					isReplace = false;
					isIgnore = false;
					viewCode = getViewCode();
				}
			}
		} catch (Exception e) {
			xlsResult = "exception|" + getText("import.error.failure") + e.getMessage();
			for(StackTraceElement ele : e.getStackTrace()){
				//xlsResult += ele.toString();
				logger.warn(ele.toString());
			}
			return SUCCESS;
		}
		long endTime = System.currentTimeMillis();
		logger.info("action upload cast {} ms", (endTime - startTime));
		return SUCCESS;
	}
	
	
	
	@Action(value = "/WOM/produceTask/produceTask/downLoad",  results = { 
		@Result(name="templateExcel",type="templateExcel",location="${fileName}", params = { "root", "templateRelatedModelCode", "defaultAmount", "50000", "defaultSize", "1000" }),
		@Result(type = "stream", params = {"contentType", "application/excel", "inputName", "inputStream","contentDisposition", "attachment;filename=\"${fileName}\"", "bufferSize", "4096" }) 
		})
	public String downLoadXls() throws Exception {
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "downLoadXls");
		if ("template".equals(downloadType)) {
			if (null == templateRelatedModelCode || templateRelatedModelCode.isEmpty()) {
				DataGrid dg = viewServiceFoundation.getDataGrid(datagridCode);
				if (null != dg) {
					templateRelatedModelCode = dg.getCode();
				}
			}
			this.customPropData = findCustomPropData(templateRelatedModelCode,false);
			return "templateExcel";
		}  else if ("mainError".equals(downloadType)) {
			return SUCCESS;
		} else {
			return SUCCESS;
		}
	}
	
	@Action(value = "/WOM/produceTask/produceTask/templateDownLoad",  results = { @Result(name="templateExcel",type="templateExcel",location="${fileName}", params = { "root", "templateRelatedModelCode", "defaultAmount", "50000", "defaultSize", "1000" }) })
	public String templateDownLoad() throws Exception {
		templateRelatedModelCode="WOM_7.5.0.0_produceTask_ProduceTask";
		this.customPropData = findCustomPropData(templateRelatedModelCode,true);
		bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "templateDownLoad");
		return "templateExcel";
	}
	
	
	public Map<String,Object>  findCustomPropData(String modelCode,Boolean isModelRelated)  {
		DataGrid dg = viewServiceFoundation.getDataGrid(datagridCode);
		Model mainModel = dg.getTargetModel();
		Map<String, Object> customDataInfo = new HashMap<String, Object>();
		List<Property> props = new ArrayList<Property>();
		if (isModelRelated != null && isModelRelated) {
			//列表视图的自定义字段
			props = viewServiceFoundation.getEnabledCustomProps(modelCode);
		} else {
			//datgrid关联的列表视图中自定义字段
			props = viewServiceFoundation.getEnabledCustomPropsByDatagirdCode(modelCode);
		}
		if (null != props && props.size() > 0) {
			List<String> styleCodes = new ArrayList<String>();
			List<Map> styleFormates = new ArrayList<Map>();
			List<Map<String, Object>> importMaps = new ArrayList<Map<String, Object>>();
			for (Property p : props) {
				if(!p.getModel().getCode().equals(mainModel.getCode()) ){
					if(p.getIsBussinessKey()){
						styleCodes.add(p.getCode());
						styleFormates.add(modelServiceFoundation.generateStyle(p));
						Map<String, Object> item = new HashMap<String, Object>();
						item.put("nullAble", p.getNullable());
						item.put("columnName", InternationalResource.get(p.getDisplayName(), getLocale().toString()));
						if (DbColumnType.OBJECT.equals(p.getType())  && !p.getIsCustom() ) {
							Property bussiness = modelServiceFoundation.getBussinessProperty(p.getAssociatedProperty().getModel().getCode());
							item.put("propertyCode", p.getCode() + "||" + bussiness.getCode());
						} else {
							item.put("propertyCode", p.getCode());
						}
						importMaps.add(item);
					}
				}else{
					styleCodes.add(p.getCode());
					styleFormates.add(modelServiceFoundation.generateStyle(p));
					Map<String, Object> item = new HashMap<String, Object>();
					item.put("nullAble", p.getNullable());
					item.put("columnName", InternationalResource.get(p.getDisplayName(), getLocale().toString()));
					if (DbColumnType.OBJECT.equals(p.getType())  && !p.getIsCustom() ) {
						Property bussiness = modelServiceFoundation.getBussinessProperty(p.getAssociatedProperty().getModel().getCode());
						item.put("propertyCode", p.getCode() + "||" + bussiness.getCode());
					} else {
						item.put("propertyCode", p.getCode());
					}
					importMaps.add(item);
				}
			}
			customDataInfo.put("styleFormats", styleFormates);
			customDataInfo.put("styleCodes", styleCodes);
			customDataInfo.put("properties", importMaps);
			return customDataInfo;
		}
		return Collections.EMPTY_MAP;
	}
	
	public String getContentDisposition() {
		String retStr = "attachment;filename=error.xls";
		try {
			retStr = "attachment;filename=" + encode(getFileName(), Struts2Utils.getRequest());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retStr;
	}
	public List<Staff> getDefaultSupervisions() {
		List<Staff> list=null;
		if(deploymentId!=null){
			list=processService.getSupervises(deploymentId);
		}
		return list;
	}
	private String encode(String fileName, HttpServletRequest request)
			throws Exception {
		String agent = request.getHeader("User-Agent");
		String returnFileName = fileName;
		if (null != agent) {
			if (agent.indexOf("MSIE") > -1) { // is IE browser
				returnFileName = StringUtils.replace(URLEncoder.encode(
						fileName, "UTF-8"), "+", "%20");
				if (returnFileName.length() > 150) {// 处理超长文件名，IE的bug。
					//%E9%87%8D%E5%91%BD%E5%90%8D
					returnFileName = new String(fileName
							.getBytes(getClientCharacterEncoding(request)),
							"ISO8859_1");
					returnFileName = StringUtils.replace(returnFileName, " ",
							"%20");
				}
			} else if (agent.indexOf("Firefox") > -1 || agent.indexOf("AppleWebKit") > -1) { // is Firefox
				returnFileName = new String(fileName.getBytes(request
						.getCharacterEncoding()), "ISO8859_1");
			}
		}
		return returnFileName;
	}
	
	private String getClientCharacterEncoding(HttpServletRequest request) {
		String language = request.getHeader("Accept-Language");
		if (language != null) {
			if (language.toLowerCase().indexOf("zh-cn") > -1) {
				return "GBK";
			} else if (language.toLowerCase().indexOf("zh-tw") > -1) {
				return "BIG5";
			}
		}
		return "ISO8859_1";
	}
	
	@Autowired
	private PrintService printService;
	
	private Map<String, Object> printXmlInfo = new HashMap<String, Object>();
	
	/**
	 * @return the printXmlInfo
	 */
	public Map<String, Object> getPrintXmlInfo() {
		return printXmlInfo;
	}

	/**
	 * @param printXmlInfo
	 *            the printXmlInfo to set
	 */
	public void setPrintXmlInfo(Map<String, Object> printXmlInfo) {
		this.printXmlInfo = printXmlInfo;
	}

	@Action(value = "/WOM/produceTask/produceTask/loadXMLRefOrData", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String loadXMLRefOrData() throws Exception {
		String xmlRefernece = null, xmlData = null;
		
		WOMProduceTask produceTask = null;
		if(null != id) {
			produceTask = produceTaskService.getProduceTask(id);
		}
		String templateCode = request.getParameter("templateCode");
		SignatureLog signatureLog = (SignatureLog)request.getAttribute("signatureLog");
		OperationAuditLog _auditLog = new OperationAuditLog();
		_auditLog.setUuid(UUIDUtil.getUUID());
		_auditLog.setRoot(_auditLog.getUuid());
		_auditLog.setLayRec(_auditLog.getUuid());
		_auditLog.setLayNo(1);
		_auditLog.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
		_auditLog.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
		_auditLog.setColumnStringC(produceTask.getId().toString());
		_auditLog.setColumnStringD(WOMProduceTask.MODEL_CODE);
		_auditLog.setColumnLong(0L);
		_auditLog.setCid(OrchidUtils.getCurrentCompanyId());
		_auditLog.set_code(_auditLog.getUuid());
		_auditLog.setIsParent(false);
		_auditLog.set_parentCode("-1");
		_auditLog.setModule("WOM");
		_auditLog.setEntity("WOM_7.5.0.0_produceTask");
		_auditLog.setMethodName("loadXMLRefOrData");
		_auditLog.setClasspath("com.supcon.orchid.WOM.actions.WOMProduceTaskAction");
		_auditLog.setOperationDesc("打印");
		_auditLog.setOperType("8");
		_auditLog.setLoginIp(OrchidUtils.getLoginIP());
		_auditLog.setUserId(OrchidUtils.getCurrentUserId().toString());
		_auditLog.setCreateDate(new Date());
		// 获取打印模板信息
		PrintTemplate printTemplate = printService.getRuntimePrintTemplateByCode(templateCode);
		// 获取打印插件XML
		xmlRefernece = printService.getPrintXmlRef(printTemplate, produceTask,  tableInfoId, viewCode, false);
		// 获取打印插件XML对应的数据信息
		if(null != signatureLog){
			signatureLog.setOperateLogUuid(_auditLog.getUuid());
		}
		xmlData = printService.getPrintXmlRef(printTemplate, produceTask,  tableInfoId, viewCode, true,signatureLog);
		
		printXmlInfo.put("xmlRefernece", xmlRefernece);
		printXmlInfo.put("xmlData", xmlData);
		String recordFile=printService.recordPrintOnServer(printTemplate.getTemplate(),xmlRefernece,xmlData,printTemplate,viewCode,produceTask);
		printService.savePrintDataAuditLog(printTemplate);
		dataAuditLogService.saveOperationAuditLog(_auditLog);
		PrintRecordLog printlog=new PrintRecordLog();
		printlog.setUuid(UUIDUtil.getUUID());
		printlog.setCid(OrchidUtils.getCurrentCompanyId());
		printlog.setCreateDate(new Date());
		printlog.setEntity("WOM_7.5.0.0_produceTask");
		printlog.setFilePath(recordFile);
		printlog.setLoginIp(OrchidUtils.getLoginIP());
		printlog.setOperationAuditLog(_auditLog);
		printlog.setUserId(OrchidUtils.getCurrentUserId());
		printlog.setBusinessId(produceTask.getId());
		printlog.setBussinessKey(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
		printlog.setMainDisplay(null == produceTask.getId() ? "" : produceTask.getId().toString());
		dataAuditLogService.savePrintRecordLog(printlog);
		return SUCCESS;	
	}
	
	@Action(value = "/WOM/produceTask/produceTask/printOnServer", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String printOnServer() throws Exception {
		WOMProduceTask produceTask = null;
		if(null != id) {
			produceTask = produceTaskService.getProduceTask(id);
		}
		String templateCode = request.getParameter("templateCode");
		SignatureLog signatureLog = (SignatureLog)request.getAttribute("signatureLog");
		String pdfFileName=printService.printOnServer(produceTask,templateCode,viewCode, tableInfoId,signatureLog);
		printXmlInfo.put("pdfFileName", pdfFileName);
		return SUCCESS;
	}
	
	@Action(value = "/WOM/produceTask/produceTask/batchPrintOnServer", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String batchPrintOnServer() throws Exception {
		List<Object> objs = new ArrayList<Object>();
		List<Long> tableIds = new ArrayList<Long>();
		String tableInfoIdsStr = request.getParameter("tableInfoIds");
		String[] tableInfoIds = null;
		if(tableInfoIdsStr != null && !"".equals(tableInfoIdsStr))
		{
			tableInfoIds = tableInfoIdsStr.split(",");
		}
		if(ids != null && ids.length() > 0){
			String[] arrId = ids.split(",");
			for (int i = 0; i < arrId.length; i++) {
				objs.add(produceTaskService.getProduceTask(Long.parseLong(arrId[i])));
				tableIds.add(Long.parseLong(tableInfoIds[i]));
			}
		}
		String templateCode = request.getParameter("templateCode");
		SignatureLog signatureLog = (SignatureLog)request.getAttribute("signatureLog");
		String pdfFileName=printService.batchPrintOnServer(objs,templateCode,viewCode, tableIds,signatureLog);
		printXmlInfo.put("pdfFileName", pdfFileName);
		return SUCCESS;
	}
	
	private Map<String, Object>  batchPrintXmlInfo;
	
	public void setBatchPrintXmlInfo(Map<String, Object> batchPrintXmlInfo){
		this.batchPrintXmlInfo = batchPrintXmlInfo;
	}
	
	public Map<String, Object> getBatchPrintXmlInfo(){
		return batchPrintXmlInfo;
	}
	
	@Action(value = "/WOM/produceTask/produceTask/loadBatchXmlRefer",
			results = {@Result(name = SUCCESS, type = JSON, params = {"root", "batchPrintXmlInfo"})})
	public String loadBatchXmlRefer() throws Exception{
		batchPrintXmlInfo = new HashMap<String, Object>();
		String xmlRefer = printService.buildPrintXmlRef(viewCode, null, null, null, false, null);
		batchPrintXmlInfo.put("xmlRefer", xmlRefer);
		return SUCCESS;
	}
	
	@Action(value = "/WOM/produceTask/produceTask/loadBatchXmlRefAndData",
			results = {@Result(name = SUCCESS, type = JSON, params = {"root", "batchPrintXmlInfo", "excludes", "*", "includes", "xmlRefer,xmlDataList"})})
	public String loadBatchXmlRefAndData() throws Exception{
		batchPrintXmlInfo = new HashMap<String, Object>();
		String tableInfoIdsStr = request.getParameter("tableInfoIds");
		String[] tableInfoIds = null;
		if(tableInfoIdsStr != null && !"".equals(tableInfoIdsStr)){
			tableInfoIds = tableInfoIdsStr.split(",");
			tableInfoId = Long.parseLong(tableInfoIds[0]);
		}
		// 获取打印模板信息
		String templateCode = request.getParameter("templateCode");
		// 获取打印模板信息
		PrintTemplate printTemplate = printService.getPrintTemplateByCode(templateCode);
		// 获取打印插件XML
		String xmlRefer = printService.getPrintXmlRef(printTemplate, produceTask,  tableInfoId, viewCode, false);
		View printView = viewServiceFoundation.getView(viewCode);
		String printViewModel = printView.getAssModel().getCode();
		batchPrintXmlInfo.put("xmlRefer", xmlRefer);
		List<String> xmlDataList = new ArrayList<String>();
		
		SignatureLog signatureLog = (SignatureLog)request.getAttribute("signatureLog");
		List<SignatureLog> signatureLogs_send=null;
		if(signatureLog != null) {
			signatureLogs_send=new ArrayList<SignatureLog>();
		}
		if(ids != null && ids.length() > 0){
			String[] arrId = ids.split(",");
			OperationAuditLog _auditLog = new OperationAuditLog();
			_auditLog.setUuid(UUIDUtil.getUUID());
			_auditLog.setRoot(_auditLog.getUuid());
			_auditLog.setLayRec(_auditLog.getUuid());
			_auditLog.setLayNo(1);
			_auditLog.setColumnStringD(WOMProduceTask.MODEL_CODE);
			_auditLog.setColumnLong(0L);
			_auditLog.setCid(OrchidUtils.getCurrentCompanyId());
			_auditLog.set_code(_auditLog.getUuid());
			_auditLog.setIsParent(false);
			_auditLog.set_parentCode("-1");
			_auditLog.setModule("WOM");
			_auditLog.setEntity("WOM_7.5.0.0_produceTask");
			_auditLog.setMethodName("loadXMLRefOrData");
			_auditLog.setClasspath("com.supcon.orchid.WOM.actions.WOMProduceTaskAction");
			_auditLog.setOperationDesc("批量打印，共打印记录" + arrId.length + "条");
			_auditLog.setOperType("9");
			_auditLog.setLoginIp(OrchidUtils.getLoginIP());
			_auditLog.setUserId(OrchidUtils.getCurrentUserId().toString());
			_auditLog.setCreateDate(new Date());
			List<PrintRecordLog> prList=new ArrayList<PrintRecordLog>();
			for (int i = 0; i < arrId.length; i++) {
				produceTask = produceTaskService.getProduceTask(Long.parseLong(arrId[i]));
				if(null != produceTask){
					if(!com.supcon.orchid.utils.StringUtils.isEmpty(_auditLog.getColumnStringA())){
						_auditLog.setColumnStringA(_auditLog.getColumnStringA() + (null == produceTask.getId() ? "" : "," + produceTask.getId().toString()));
					} else {
						_auditLog.setColumnStringA(null == produceTask.getId() ? "" : produceTask.getId().toString());
					}
					if(!com.supcon.orchid.utils.StringUtils.isEmpty(_auditLog.getColumnStringB())){
						_auditLog.setColumnStringB(_auditLog.getColumnStringB() + (null == produceTask.getTableNo() ? "" : "," + produceTask.getTableNo().toString()));
					} else {
						_auditLog.setColumnStringB(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
					}
					if(!com.supcon.orchid.utils.StringUtils.isEmpty(_auditLog.getColumnStringC())){
						_auditLog.setColumnStringC(_auditLog.getColumnStringC() + (null == produceTask.getId() ? "" : "," + produceTask.getId().toString()));
					} else {
						_auditLog.setColumnStringC(null == produceTask.getId() ? "" : produceTask.getId().toString());
					}
					if(tableInfoIds != null && tableInfoIds.length > 0){
						tableInfoId = Long.parseLong(tableInfoIds[i]);
					}
					// 获取打印插件XML对应的数据信息
					String xmlData = printService.getPrintXmlRef(printTemplate, produceTask,printViewModel, tableInfoId, true,false,signatureLog);
					xmlDataList.add(xmlData);
					String recordFile=printService.recordPrintOnServer(printTemplate.getTemplate(),xmlRefer,xmlData,printTemplate,viewCode,produceTask);
					PrintRecordLog printlog=new PrintRecordLog();
					printlog.setUuid(UUIDUtil.getUUID());
					printlog.setCid(OrchidUtils.getCurrentCompanyId());
					printlog.setCreateDate(new Date());
					printlog.setEntity("WOM_7.5.0.0_produceTask");
					printlog.setFilePath(recordFile);
					printlog.setLoginIp(OrchidUtils.getLoginIP());
					printlog.setOperationAuditLog(_auditLog);
					printlog.setUserId(OrchidUtils.getCurrentUserId());
					printlog.setBusinessId(produceTask.getId());
					printlog.setMainDisplay(null == produceTask.getId() ? "" : produceTask.getId().toString());
					printlog.setBussinessKey(null == produceTask.getTableNo() ? "" : produceTask.getTableNo().toString());
					prList.add(printlog);
				}
			}
			dataAuditLogService.saveOperationAuditLog(_auditLog);
			dataAuditLogService.savePrintRecordLog(prList);
			if(signatureLog != null && null != _auditLog) {
				signatureLog.setOperateLogUuid(_auditLog.getUuid());
				signatureLog.setBusinessKey(_auditLog.getColumnStringB());
				signatureLogs_send.add(signatureLog);
			}
		}
		if(signatureLogs_send != null && signatureLogs_send.size() > 0) {
			String moduleCode=signatureLog.getModuleCode();
			String entityCode=signatureLog.getEntityCode();
			String modelCode1=signatureLog.getModelCode();
			String msgId="moduleCode:"+moduleCode+"#entityCode:"+entityCode+"#modelCode:"+modelCode1+"#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLogs_send);
		}
		batchPrintXmlInfo.put("xmlDataList", xmlDataList);
		//produceTaskService.print(1);
		printService.savePrintDataAuditLog(printTemplate);
		return SUCCESS;
	}
	
	@Resource
	private EchartsDataService echartsDataService;
	private String echartsCode;
	private EchartsData echartsData;
	
	@Action(value = "/WOM/produceTask/produceTask/echartsData", results = { @Result(name = "success", type = JSON, params = { "root", "echartsData",
			"includes", "*.echartCode, *.legendData, *.xAxisData, *.seriesList, *.data" }) })
	public String echartsData() throws Exception {
		if (echartsCode == null || "".equals(echartsCode)) {
			return null;
		}
		bapBeforeCustomMethod(echartsCode, "echarts");			
		echartsData = echartsDataService.getEchartsWithData(echartsCode);
		bapAfterCustomMethod(echartsCode, "echarts");
		return SUCCESS;
	}
	
	public String getEchartsCode() {return echartsCode;}
	public void setEchartsCode(String echartsCode) {this.echartsCode = echartsCode;}
	public EchartsData getEchartsData() {return echartsData;}
	public void setEchartsData(EchartsData echartsData) {this.echartsData = echartsData;}
	
	/**
	 * 查询DataGrid时，获取JsonResult需要include的自定义字段
	 * @param dataGridCode
	 * @return
	 */
	public String getCustomPropertyIncludes(String dataGridCode) {
		return viewServiceFoundation.getCustomPropertyIncludes(dataGridCode);
	}
	
	
	List<Map<Property,Model>> modelLinkList = new ArrayList<Map<Property,Model>>();
	List<Property> linkedProperty = new ArrayList<Property>();
	Boolean needAdd = false;
	Boolean linked = false;
	private List<Map<Property,Model>> getModelLink(Model model, Model mainModel, List<String> assModelNames){
		//List<Property> properties = modelServiceFoundation.findProperties(model);
		List<Property> properties = null;
		if(excelProperties !=null && excelProperties.get(model.getCode())!=null ){
			properties = (List<Property>) excelProperties.get(model.getCode());
		}else{
			properties = modelServiceFoundation.findProperties(model);
			this.excelProperties.put(model.getCode(), properties);
		}
		for(Property p : properties){
       		if(p.getType().toString().equals("OBJECT")  && !p.getIsCustom() && p.getIsMainAssociated()){
       			//String objProperty = ceShiGuanService.getAssProperty(p.getCode());	
				//String objModelCode = ceShiGuanService.getPropertyModelCode(objProperty);
				//Model objModel = modelServiceFoundation.getModel(objModelCode);
       			Model objModel = p.getAssociatedProperty().getModel();
				if(objModel.getName().equals(mainModel.getName())){
					if(needAdd){
						Map<Property,Model> m = new HashMap<Property, Model>();
						m.put(p, model);
						modelLinkList.add(m);
					}
					this.linked = true;
					break;
				}
       		}
		}
		if(!linked){ //没有主关联的情况
			for(Property p : properties){
	       		if(p.getType().toString().equals("OBJECT")  && !p.getIsCustom()){
	       			Model objModel = p.getAssociatedProperty().getModel();
					if(objModel.getName().equals(mainModel.getName())){
						if(needAdd){
							Map<Property,Model> m = new HashMap<Property, Model>();
							m.put(p, model);
							modelLinkList.add(m);
						}
						this.linked = true;
						break;
					}
	       		}
			}
		}
		if(linked){
			return modelLinkList;
		}else{
			needAdd = true;
			for(Property p : properties){
				if(p.getType().toString().equals("OBJECT")  && !p.getIsCustom() ){
					//String objProperty = ceShiGuanService.getAssProperty(p.getCode());	
					//String objModelCode = ceShiGuanService.getPropertyModelCode(objProperty);
					//Model objModel = modelServiceFoundation.getModel(objModelCode);
	       			Model objModel = p.getAssociatedProperty().getModel();
					if(assModelNames.contains(objModel.getName())){
						linkedProperty.add(p);
						getModelLink(objModel,mainModel,assModelNames);
					}
				}
			}		
		}
		return null;
	}
	
	/**
	 * 获取辅模型的相关数据
	 * @param page
	 * @param model 主模型的相关信息
	 * @return
	 */
	public Page<WOMProduceTask> findExportPageInfos(Page<WOMProduceTask> page,Map<String,String> model,Integer count) throws Exception {		
		Boolean assHasNoBussinessKey = false;//查看该模型是否有业务主键
		String visualIdCode = null;
		String language = getCurrentUser().getLanguage();
		Boolean assRefModelHasNoBussinessKey = false;//该模型引用的模型是否有业务主键
		List<Map<String,String>> refs = new ArrayList<Map<String,String>>();//引用模型的信息
		
		int ogSqlType = currentSqlType;
		currentSqlType = Sql.TYPE_LIST_QUERY;
		String auxiliaryViewCode = "WOM_7.5.0.0_produceTask" + "_" + model.get("viewName");	
		List<Param> auxiliaryParams = new ArrayList<Param>();
		char[] chars=new char[1];  
		String modelName = model.get("modelName");
		chars[0] = modelName.charAt(0);
        String temp = new String(chars);
		auxiliaryParams.add(new Param("\""+modelName.replaceFirst(temp, temp.toLowerCase())+"\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		View mainView = viewServiceFoundation.getView(viewCode);
		Model mainModel = mainView.getAssModel();
		this.excelExportModels.put("mainModel", mainModel);
		/*if(params != null && params.size()>0){
			for(Param  p : params){
				auxiliaryParams.add(p);
			}
		}*/
		
		Model realmodel = null;//当前的辅模型
		//根据主模型获取与其关联的所有辅模型
		List<Model> assModels = modelServiceFoundation.findModels(mainModel.getEntity());
		List<String> assModelNames = new ArrayList<String>();
		for(Model assModel : assModels){
			this.excelExportModels.put(assModel.getCode(), assModel);
			if(!assModel.getIsMain()){
				assModelNames.add(assModel.getName());
			}
			if(model.get("modelCode").equals(assModel.getCode())){
				realmodel = assModel;
			}
		}
		
		//组织用于生成sql的xml
		String fullQueryConfig = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><list>";
		
		List<Property> properties = null;
		if(excelProperties != null && excelProperties.get(realmodel.getCode())!=null ){
			properties = (List<Property>) excelProperties.get(realmodel.getCode());
		}else{
			properties = modelServiceFoundation.findProperties(realmodel);
			this.excelProperties.put(realmodel.getCode(), properties);
		}
       	
       	List<String> runningCustomPropertyCode = null;
       	if(excelRunningCustomPropertyCode != null && excelRunningCustomPropertyCode.get(model.get("modelCode")) !=null ){
       		runningCustomPropertyCode = (List<String>) excelRunningCustomPropertyCode.get(model.get("modelCode"));
       	}else{
       		runningCustomPropertyCode = produceTaskService.getRunningCustomProperties(model.get("modelCode"));//已启用的自定义字段
       		this.excelRunningCustomPropertyCode.put(model.get("modelCode"), runningCustomPropertyCode);
       	}
       	
       	//导入导出模板配置里面的property的code取出来用于后面过滤，并且防止parseXml中将generateFlag修改掉
		if(useForImportFlag){
       	boolean generateFlagTemp=this.generateFlag;
       	//List<String> importTemplateCodeList=new ArrayList<String>();
		ImportTemplate importTemplate=importTemplateServiceFoundation.getImportTemplateByCode(realmodel.getCode());
		if(importTemplate!=null){
			//List<Map> importTemplateMaps=parseXml(importTemplate.getValue());
			//Iterator<Map> iter = importTemplateMaps.iterator();
			//while(iter.hasNext()){
			//	importTemplateCodeList.add(String.valueOf(iter.next().get("propertyCode")));
			//}
			fullQueryConfig=importTemplate.getValue();
		}
		this.generateFlag=generateFlagTemp;
		}
       	
       	String bussinessKeyConfig = "";//业务主键的xml
      	String auxQueryConfig = "";//除业务主键和自定义字段，辅模型需要导出的其他excel的xml
      	String customConfig = "";//自定义字段的xml
      	Boolean mainWrongBussineKey = false;//业务主键是否为配置字段或者id
      	Property mainIdProp = null;
		Property mainBkProp = null;
		Property mainMdProp = null;
		for(Property p : properties){
			this.excelProperty.put(p.getCode(), p);
			if(p.getType() != null && p.getType().toString().equals("PROPERTYATTACHMENT")){//附件类型字段不用导出
				continue;
			}
			if(p.getIsMainDisplay()){
				mainMdProp = p;
				this.excelTotal.put("mainDisplay", p);
			}
			if(p.getName()!=null && p.getName().equals("id")){
				mainIdProp = p;
			}
			if(p.getIsBussinessKey()){
				this.excelTotal.put("businessKey", p);
				mainBkProp = p;
				//if( p.getIsMainDisplay() && (!p.getIsInherent() || p.getName().equals("id") ) ){//主显示只有非固有 或者 id时才显示
				if(!p.getName().equals("version") ){//过滤veresion
					String code = p.getCode();
					code = code.substring(code.length()-2,code.length());
					if(code.equals("id")){
						assHasNoBussinessKey = true;
						visualIdCode = p.getCode();
						if(useForImportFlag){
							//把id放到excel里
							if(!fullQueryConfig.contains(p.getCode())){
							bussinessKeyConfig += generteAuxXml(p);
							}
						}
					}else{
						if(!fullQueryConfig.contains(p.getCode())){
						bussinessKeyConfig += generteAuxXml(p);
						}
					}
				}else{
					if(!fullQueryConfig.contains(p.getCode())){
					bussinessKeyConfig += generteAuxXml(p);
					}
					mainWrongBussineKey = true;
				}
			}else if(p.getIsCustom() && runningCustomPropertyCode.contains(p.getCode())){//自定义字段已启用
				if((!fullQueryConfig.contains(p.getCode()) && !p.getNullable()) || !useForImportFlag){//在模板中已配置导出或者非空字段
					customConfig += generteAuxXml(p);
				}
			}else if((!p.getIsInherent() && !p.getIsCustom() && !p.getIsBussinessKey()) || (p.getIsInherent() && !p.getNullable() && !p.getName().equals("id"))){//非空的固有字段
				if(p.getType() != null && !p.getType().toString().equals("OBJECT")){
					if((!fullQueryConfig.contains(p.getCode()) && !p.getNullable()) || !useForImportFlag){//在模板中已配置导出或者非空字段
						auxQueryConfig += generteAuxXml(p);
					}
				}else if(p.getType() != null && p.getType().toString().equals("OBJECT")){
					if((!fullQueryConfig.contains(p.getCode()) && p.getIsMainAssociated()) || !useForImportFlag){
					//String assProperty = expenseBilService.getAssProperty(p.getCode());	
					//String assModelCode = expenseBilService.getPropertyModelCode(assProperty);
					//Model assModel = modelServiceFoundation.getModel(assModelCode);
					//List<Property> assProperties = modelServiceFoundation.findProperties(assModel);
					
					Model assModel = p.getAssociatedProperty().getModel();
					List<Property> assProperties = null;
					if(excelProperties != null && excelProperties.get(assModel.getCode())!=null ){
						assProperties = (List<Property>) excelProperties.get(assModel.getCode());
					}else{
						assProperties = modelServiceFoundation.findProperties(assModel);
						this.excelProperties.put(assModel.getCode(), assProperties);
					}
					
					//获取模型中Id对应的数据库列名
					String idColumnName = "ID";
					for(Property ap : assProperties){
						if(ap.getName()!=null && ap.getName().equals("id")){
							idColumnName = ap.getColumnName();
						}
					}
					
					Boolean wrongBussineKey = false;//业务主键是否为配置字段或者id
					Property idProp = null;
					Property bkProp = null;
					Property mdProp = null;
					
					for(Property ap : assProperties){
						if(ap.getName().equals("id")){
							idProp = ap;
						}
						if(ap.getIsBussinessKey()){
							/*String code = ap.getCode();
							code = code.substring(code.length()-2,code.length());
							if(code.equals("id") && ap.getEntityCode().equals(p.getEntityCode())){
								assRefModelHasNoBussinessKey = true;
								Map<String,String> m = new HashMap<String, String>();
								m.put("mainCode", p.getCode());
								m.put("refCode", ap.getCode());
								m.put("mainDisplayName", p.getDisplayName());
								refs.add(m);
							}*/
							bkProp = ap;
							if(ap.getIsInherent() && "id".equals(ap.getName())){
								String code = ap.getCode();
								code = code.substring(code.length()-2,code.length());
								if(code.equals("id") && ap.getEntityCode().equals(p.getEntityCode())){
									assRefModelHasNoBussinessKey = true;
									Map<String,String> m = new HashMap<String, String>();
									m.put("mainCode", p.getCode());
									m.put("refCode", ap.getCode());
									m.put("mainDisplayName", p.getDisplayName());
									refs.add(m);
								}
							}else{
								wrongBussineKey = true;
							}
						}
						//if((ap.getIsMainDisplay() && !ap.getName().equals("id")) || ap.getIsBussinessKey()){
						//	auxQueryConfig += generteAuxObjXml(p, ap, assModel, idColumnName, realmodel);
						//}
						if( ap.getIsMainDisplay() && (!ap.getIsInherent() || "id".equals(ap.getName()))){//主显示只有非固有 或者 id时才显示
							mdProp = ap;
						}
					}
					if(!wrongBussineKey && idProp != null){
						auxQueryConfig += generteAuxObjXml(p, idProp, assModel, idColumnName, realmodel);
					}else if(bkProp != null){
						auxQueryConfig += generteAuxObjXml(p, bkProp, assModel, idColumnName, realmodel);
					}
					if(null != mdProp && null != bkProp && !mdProp.getCode().equals(bkProp.getCode())){
						if(null == idProp || !mdProp.getCode().equals(idProp.getCode()) ){		//如果id是主显示字段，则不重复拼接  for fix qc-1941
							auxQueryConfig += generteAuxObjXml(p, mdProp, assModel, idColumnName, realmodel);
						}						
					}
				}
				}
			}
		}
		
		if(mainWrongBussineKey && mainIdProp != null && !fullQueryConfig.contains(mainIdProp.getCode())){
			bussinessKeyConfig += generteAuxXml(mainIdProp);
		}
		
		if(fullQueryConfig.lastIndexOf("</list>")>0){
			fullQueryConfig = fullQueryConfig.substring(0, fullQueryConfig.lastIndexOf("</list>")) + auxQueryConfig + customConfig + bussinessKeyConfig + "</list>";//业务主键放最前，自定义字段放最后
		}else{
			fullQueryConfig += auxQueryConfig + customConfig + bussinessKeyConfig + "</list>";//业务主键放最前，自定义字段放最后
		}
			
		String fullModelName = null;
		if (realmodel.getEcVersion() != null && realmodel.getEcVersion().equals("1.0")) {
			fullModelName = realmodel.getModelName();
		} else {
			fullModelName = realmodel.getJpaName();
		}
		
		Object[] objs = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid." + "WOM" + ".services." + fullModelName + "Service"};
		Map<String, Object> serviceObjs = getRealServiceByServiceRef(objs);
		
		List<Map> thisStyleFormats = new ArrayList<Map>();
		List<Object> paramMain = new ArrayList<Object>();//主模型的过滤条件
		Map<String, Object> assosiatedKey = new HashMap<String, Object>();//主模型中，辅模型用于关联主模型的字段的集合
		if(page.isExportFlag())  {
			//if(auxQueryConfig.trim().isEmpty())  {
			//	return page;
			//}
			if(!generateFlag)  {
				List<Map> exportMaps =new ArrayList<Map>();
				//解析xml
				exportMaps=parseXml(fullQueryConfig);
				
				if(exportMaps.size()>0)  {
					page.setCustomerExport(true);
				}else {
					page.setCustomerExport(false);
				}
				page.setUseForImportFlag(useForImportFlag);
				page.setExportAuxiliaryModelFlag(exportAuxiliaryModelFlag);
				page.setProperties(exportMaps);
				thisStyleFormats = generateStyleFormats(exportMaps,model.get("modelName"));//生成单元格样式
				if(count == 1){//第一次执行时才生成样式，否则会导致样式重复生成，office2010无法打开
					styleFormats.addAll(thisStyleFormats);
				}
				page.setStyleFormats(styleFormats);
				exportSql=generteAuxCustomerSql(mainView,realmodel,exportMaps);
				
				List<Long> keys = new ArrayList<Long>();
				for(WOMProduceTask queryResult : queryResults){
					Long key = queryResult.getId();
					keys.add(key);
				}
				String idColName = "";
				List<Property> pros = modelServiceFoundation.findProperties(mainModel);
				for(Property property: pros){
					if(property.getName().equals("id")){
						idColName = property.getColumnName();
					}
				}
				if(keys != null && keys.size() > 0){
					assosiatedKey.put("keyName", "\"" + mainModel.getModelName().substring(0, 1).toLowerCase() + mainModel.getModelName().substring(1) + "\"." + idColName + "" );
					assosiatedKey.put("keyValue", keys);
				}	
				
				this.modelLinkList = new ArrayList<Map<Property,Model>>();
				this.linkedProperty = new ArrayList<Property>();
				getModelLink(realmodel, mainModel, assModelNames);
				String s = "";
				if(modelLinkList.size()>0){
					for(int i = 0; i < modelLinkList.size(); i++){
						s = " LEFT OUTER JOIN ";
						if(i == 0){
							Map<Property,Model> linkModel = modelLinkList.get(i);
							for(Entry<Property, Model> entry: linkModel.entrySet()){    
								Property p = entry.getKey();
								//Property ap = modelServiceFoundation.findPropertyByCode(p.getAssociatedProperty().getCode(), null);
								Property ap = null;
								if(excelProperty !=null && excelProperty.get(p.getAssociatedProperty().getCode()) !=null ){
									ap = (Property) excelProperty.get(p.getAssociatedProperty().getCode());
								}else{
									ap = modelServiceFoundation.findPropertyByCode(p.getAssociatedProperty().getCode(), null);
									this.excelProperty.put(p.getAssociatedProperty().getCode(), ap);
								}
								Model m = entry.getValue();
								if(linkedProperty != null && linkedProperty.size() > i){
									Property lp = linkedProperty.get(i);
									s += mainModel.getTableName() + " \"" + mainModel.getModelName().substring(0, 1).toLowerCase() + mainModel.getModelName().substring(1) + "\"" + " ON \"" 
											+ mainModel.getModelName().substring(0, 1).toLowerCase() + mainModel.getModelName().substring(1) + "\"." + ap.getColumnName()
											+ "= \"" + realmodel.getModelName().substring(0, 1).toLowerCase() + realmodel.getModelName().substring(1) + "_" 
											+ lp.getName() + "\"." + p.getColumnName();
											//+ "= \"" + m.getModelName().substring(0, 1).toLowerCase() + m.getModelName().substring(1) + "\"." + p.getColumnName();
								}else{
									s += mainModel.getTableName() + " \"" + mainModel.getModelName().substring(0, 1).toLowerCase() + mainModel.getModelName().substring(1) + "\"" + " ON \"" 
											+ mainModel.getModelName().substring(0, 1).toLowerCase() + mainModel.getModelName().substring(1) + "\"." + ap.getColumnName() 
											+ "= \"" + m.getModelName().substring(0, 1).toLowerCase() + m.getModelName().substring(1) + "\"." + p.getColumnName();
								}	
								/*String keys = "";
								for(WOMProduceTask queryResult : queryResults){
									Method method = queryResult.getClass().getMethod("get" + ap.getName().substring(0, 1).toUpperCase() + ap.getName().substring(1));
									if(ap.getType().equals("TEXT") || ap.getType().equals("BAPCODE") ){
										String key = (String) method.invoke(queryResult);
										keys += "'" + key + "',";
									}else{
										Long key = (Long) method.invoke(queryResult);
										keys += key.toString() + ",";
									}
								}
								if(keys != null && keys.length() > 0){
									assosiatedKey.put("keyName", mainModel.getModelName().substring(0, 1).toLowerCase() + mainModel.getModelName().substring(1) + "\"." + ap.getName());
									assosiatedKey.put("keyValue", keys.substring(0, keys.length() - 1));
								}	*/	
							}  
						}
					}
				}
				exportSql = exportSql + s; 
				
				if(params != null && params.size()>0){	
					for(int i = 0; i<params.size(); i++){
						Param param = params.get(i);
						if(param.getName().contains(".USER_ID")){
							exportSql = exportSql + " LEFT OUTER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID = \"" + firstLatterToLowerCase(realmodel.getModelName()) + "\".TABLE_INFO_ID AND \"p\".USER_ID =  "+param.getValue();
						}
					}
					if(linked){
						paramMain = produceTaskService.generateParamExcelSql(params, Sql.TYPE_LIST_QUERY, layoutViewCode);
						this.linked = false;
					}
				}
			}
		}
		this.generateFlag=false;
		
		Object mainService = null;
		for (Object obj : objs) {
			if (obj.toString().contains("services." + fullModelName)) {
				mainService = serviceObjs.get(obj);
				break;
			}
		}
		
		if(assHasNoBussinessKey && useForImportFlag){//没有业务主键且用于导出，加上虚拟关联字段
			Map<String, String> m = new HashMap<String, String>();
			m.put("showWidth", "70");
			m.put("nullable", "true");
			m.put("dispalyName", "虚拟关联字段");
			m.put("propertyCode", "virtual:Main:"+visualIdCode);
			m.put("name", "mainVisualId");
			m.put("columntype","TEXT");
			//m.put("styleId",model.get("modelName") + ".mainVisualId");
			page.getProperties().add(m);
			
			//styleFormats.removeAll(thisStyleFormats);
			Map<String, String> m1 = new HashMap<String, String>();
			m1.put("key", model.get("modelName") + ".mainVisualId");
			m1.put("propType", "visualId");
			thisStyleFormats.add(m1);
			if(count == 1){
				page.getStyleFormats().add(m1);
			}
		}
		
		if(realmodel.getDataType() == 2 && useForImportFlag){//树型结构且用于导出，加上父节点
			String[] exportSqls = exportSql.split("FROM");
			String exportSqlPart1 = exportSqls[0];
			String exportSqlPart2 = exportSqls[1];
			String newExportSql = "";
			String sqlModelName = realmodel.getModelName().substring(0, 1).toLowerCase() + realmodel.getModelName().substring(1);
			StringBuilder exportSqlPart1Add = new StringBuilder();
			exportSqlPart1Add.append(", \"");
			exportSqlPart1Add.append(sqlModelName);
			exportSqlPart1Add.append("\".LAY_NO AS \"layNo\", ");
			exportSqlPart1Add.append("\"");
			exportSqlPart1Add.append(sqlModelName);
			exportSqlPart1Add.append("\".LAY_REC AS \"layRec\", ");
			exportSqlPart1Add.append("\"");
			exportSqlPart1Add.append(sqlModelName);
			exportSqlPart1Add.append("\".PARENT_ID AS \"parentId\", ");
			exportSqlPart1Add.append("\"");
			exportSqlPart1Add.append(sqlModelName);
			exportSqlPart1Add.append("\".SORT AS \"sort\", ");
			exportSqlPart1Add.append("\"");
			exportSqlPart1Add.append(sqlModelName);
			exportSqlPart1Add.append("\".LEAF AS \"leaf\" ");
			String idSql = "\"" + sqlModelName + "\".ID AS \"id\"";
			if(!exportSql.contains(idSql)){
				exportSqlPart1Add.append(", ");
				exportSqlPart1Add.append(idSql);
			}
			exportSqlPart1 = exportSqlPart1 + exportSqlPart1Add.toString();
			newExportSql = exportSqlPart1 + " FROM " + exportSqlPart2;
			exportSql = newExportSql;
		
			if(excelTotal.get("businessKey")!=null){
				Property p = (Property) excelTotal.get("businessKey");
				Map<String, String> m = new HashMap<String, String>();
				m.put("showWidth", "70");
				m.put("nullable", "true");
				m.put("dispalyName", "父节点." + InternationalResource.get(p.getDisplayName(), language) );
				m.put("propertyCode", "parentNode:businessKey");
				m.put("name", "parentNodeBusinessKey");
				m.put("columntype","TEXT");
				page.getProperties().add(m);
				
				Map<String, String> m1 = new HashMap<String, String>();
				m1.put("key", model.get("modelName") + ".parentNodeBusinessKey");
				m1.put("propType", "parentNode");
				thisStyleFormats.add(m1);
				if(count == 1){
					page.getStyleFormats().add(m1);
				}
			}
			if(excelTotal.get("mainDisplay")!=null && excelTotal.get("mainDisplay") != excelTotal.get("businessKey")){
				Property p = (Property) excelTotal.get("mainDisplay");
				Map<String, String> m2 = new HashMap<String, String>();
				m2.put("showWidth", "70");
				m2.put("nullable", "true");
				m2.put("dispalyName", "父节点." + InternationalResource.get(p.getDisplayName(), language) );
				m2.put("propertyCode", "parentNode:mainDisplay");
				m2.put("name", "parentNodeMainDisplay");
				m2.put("columntype","TEXT");
				page.getProperties().add(m2);
				
				Map<String, String> m3 = new HashMap<String, String>();
				m3.put("key", model.get("modelName") + ".parentNodeMainDisplay");
				m3.put("propType", "parentNode");
				thisStyleFormats.add(m3);
				if(count == 1){
					page.getStyleFormats().add(m3);
				}
			}
		}
		
		Method method = mainService.getClass().getMethod("excelAuxModelQuery",
              new Class[] { Page.class, String.class, int.class, String.class, Boolean.class, Boolean.class, List.class, String.class, Boolean.class, String.class, List.class, Map.class, Model.class, Map.class});
		if( queryResults != null && queryResults.size() > 0 ){//当主模型非空时，才需需要查询辅模型
			this.excelTotal.put("excelModelMappings", this.excelModelMappings);
			this.excelTotal.put("excelModels", this.excelExportModels);
			this.excelTotal.put("excelProperties", this.excelProperties);
			this.excelTotal.put("excelProperty", this.excelProperty);
			this.excelTotal.put("excelRunningCustomPropertyCode", this.excelRunningCustomPropertyCode);
			method.invoke(mainService, getPage(), auxiliaryViewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, 
				auxiliaryParams, permissionCode, noQueryFlag, exportSql, paramMain, assosiatedKey, realmodel, excelTotal);
		}
		if(assRefModelHasNoBussinessKey && useForImportFlag){
			for(Map<String,String> map : refs){
				Map<String, String> m = new HashMap<String, String>();
				m.put("showWidth", "140");
				m.put("nullable", "true");
				m.put("dispalyName", map.get("mainDisplayName")+",虚拟关联字段");
				m.put("propertyCode", "virtual:Ref:"+map.get("refCode"));
				m.put("name", "refVisualId");
				m.put("columntype","TEXT");
				//m.put("styleId",model.get("modelName") + ".refVisualId");
				page.getProperties().add(m);
				
				//styleFormats.removeAll(thisStyleFormats);
				Map<String, String> m1 = new HashMap<String, String>();
				m1.put("key", model.get("modelName") + ".refVisualId");
				m1.put("propType", "visualId");
				thisStyleFormats.add(m1);
				if(count == 1){
					page.getStyleFormats().add(m1);
				}
			}
		}
		
		if(page.getProperties() != null && page.getProperties().size()>0){
			List<Map> pros = page.getProperties();
			for(int i = 0; i< pros.size(); i++){
				for(int j = 0; j< thisStyleFormats.size(); j++){
					if(i == j){
						pros.get(i).put("styleId", thisStyleFormats.get(j).get("key"));
					}
				}
			}
		}
		
		currentSqlType = ogSqlType;
		return page;
	}
	
	
	/**
	 * 拼接辅模型的sql
	 * @param mapDatas		参数
	 * @return
	 */
	public String generteAuxCustomerSql(View view, Model model,List<Map> mapDatas)   {
		//是否表单类型
		Boolean isFormObject=model.getEntity().getWorkflowEnabled();
		StringBuilder sb=new StringBuilder();
		StringBuilder join =  new StringBuilder();
		if(mapDatas==null||mapDatas.size()==0)  {
			return "";
		}
		sb.append("SELECT ");
		if(isFormObject) {
			if(currentSqlType==Sql.TYPE_LIST_PENDING)  {
				sb.append("\"p\".ID AS \"pending.id\",\"p\".PROCESS_KEY AS \"pending.processKey\",\"p\".PROCESS_VERSION AS \"pending.processVersion\",\"p\".TABLE_INFO_ID AS \"pending.tableInfoId\",\"p\".ACTIVITY_NAME AS \"pending.activityName\",\"p\".PROCESS_ID AS \"pending.processId\",\"p\".ACTIVITY_TYPE AS \"pending.activityType\",\"p\".DEPLOYMENT_ID AS \"pending.deploymentId\",\"p\".USER_ID AS \"pending.userId\",\"p\".OPEN_URL AS \"pending.openUrl\",\"p\".TASK_DESCRIPTION AS \"pending.taskDescription\",\"p\".PROCESS_NAME AS \"pending.processName\",\"p\".PROCESS_DESCRIPTION AS \"pending.processDescription\",\"p\".PROXY_SOURCE AS \"pending.proxySource\",\"p\".SOURCE_STAFF AS \"pending.sourceStaff\",\"p\".MOBILE_APPROVE AS \"pending.mobileApprove\"");
				sb.append(",");
			}
		}
		//组合map
		//实体简称
		String modelAlias = "\"" + firstLatterToLowerCase(model.getModelName()) + "\"";
		join.append(joinAuxSQL(view, sb, modelAlias,mapDatas,model));
		if(isFormObject) {
			sb.append(",");
			String pendingTableInfoId=modelAlias+".TABLE_INFO_ID AS \"tableInfoId\"";
			if(sb.indexOf(pendingTableInfoId)==-1)  {
				if(!sb.toString().endsWith(","))  {
					sb.append(",");
				}
				sb.append(pendingTableInfoId).append(",");
			}
			if(null!=model.getIsMain()&&model.getIsMain())  {
				String pendingStatus=modelAlias+".STATUS AS \"status\"";
				String pendingTableNo=modelAlias+".TABLE_NO AS \"tableNo\"";
				if(sb.indexOf(pendingStatus)==-1)  {
					if(!sb.toString().endsWith(","))  {
						sb.append(",");
					}
					sb.append(pendingStatus).append(",");
				}
				if(sb.indexOf(pendingTableNo)==-1)  {
					if(!sb.toString().endsWith(","))  {
						sb.append(",");
					}
					sb.append(pendingTableNo).append(",");
				}
			}
			if(sb.toString().endsWith(","))  {
				sb=sb.deleteCharAt(sb.length()-1);
			}
			if(currentSqlType==Sql.TYPE_LIST_PENDING) {
				sb.append(" FROM WF_PENDING \"p\"  INNER JOIN ");
				sb.append(model.getTableName()).append(" ").append(modelAlias);
				sb.append(" ON \"p\".TABLE_INFO_ID=");
				sb.append(modelAlias).append(".").append("TABLE_INFO_ID");
				sb.append(" ").append(join);		
			}else if(currentSqlType==Sql.TYPE_LIST_QUERY)  {
				sb.append(" FROM ").append(model.getTableName()).append(" ").append(modelAlias);
				sb.append(join);
			}
		}else {
			sb.append(" FROM ").append(model.getTableName()).append(" ").append(modelAlias);
			sb.append(join);
		}
		return sb.toString();
	}
	
	private String joinAuxSQL(View view, StringBuilder builder, String modelAlias,List<Map>  mapDatas, Model model){
		StringBuilder join = new StringBuilder();
		if (null == view.getExtraView()) {
			return null;
		}
		// Map map = view.getExtraView().getConfigMap();
		List<String> CurrentEntityModelsName = new ArrayList<String>();
//		List<Model> models = modelServiceFoundation.findModels(view.getEntity());
//		for (Model m : models) {
//			CurrentEntityModelsName.add(m.getTableName());
//		}
		CurrentEntityModelsName.add(model.getTableName());
		if (null != mapDatas && !mapDatas.isEmpty()) {
			List<Map> cells = mapDatas;
			for (int i=0; i<mapDatas.size(); i++) {
				Map m1 = mapDatas.get(i);
            	for (int j=i+1; j<mapDatas.size(); j++) {
            		if (m1.get("key").equals(mapDatas.get(j).get("key"))) {
            			cells.remove(j);
            			continue;
            		}
            	}
            }
			if (null != cells && !cells.isEmpty()) {
				Set<String> tmpAssSet = new LinkedHashSet<String>();// 防止重复
				int i = 0;
				for (Map column : cells) {
					if (null != column.get("key") && column.get("key").toString().length() > 0) {
						String key = (String) column.get("key");
						// 存在.操作符的为关联key
						int lastDotPos = key.lastIndexOf('.');
						String propertyCode = (String) column.get("propertyCode");
						if (null != propertyCode && propertyCode.indexOf("||") > -1) {
							propertyCode = propertyCode.substring(propertyCode.lastIndexOf("||") + 2);
						}

						// FIXME 关联模型处理id问题，目前列表字段拖关联的字段，则会记下该关联模型id，但是存储的还是原来拖出来字段的propertyCode 处理id
						if (key.substring(lastDotPos + 1).equalsIgnoreCase("id")) {
							String modelCode = null;
							if (null != column.get("modelCode") && column.get("modelCode").toString().length() > 0) {
								modelCode = column.get("modelCode").toString();
							}
							if (null != modelCode && !modelCode.startsWith("sysbase_1.0")) {
								propertyCode = modelCode + "_id";
							} else {
								propertyCode = propertyCode.substring(0, propertyCode.lastIndexOf("_") + 1) + "id";
							}
						}

						Property property = modelServiceFoundation.getProperty(propertyCode);
						if (null != property && DbColumnType.OBJECT.equals(property.getType())) {
							String associatedProperty = property.getAssociatedProperty().getName();
							key = key+"."+associatedProperty;
						}
						String columnName = "";
						if (key.substring(lastDotPos + 1).equalsIgnoreCase("id")) {
							String columnNameMap = (String) column.get("columnName");
							columnName = property == null ? Inflector.getInstance().columnize(columnNameMap.substring(lastDotPos + 1)) : property.getColumnName();
						}else{
							columnName = property == null ? Inflector.getInstance().columnize(key.substring(lastDotPos + 1)) : property.getColumnName();
						}
						String tableAlias = lastDotPos < 0 ? modelAlias : "\"" + modelAlias.substring(1, modelAlias.length()-1) + "_" 
												+ key.substring(0, lastDotPos) + "\"";
						//String tableAlias = lastDotPos < 0 ? modelAlias : "\"" + key.substring(0, lastDotPos) + "\"";
						//String colAlias = "\"" + modelAlias.substring(1, modelAlias.length()-1) + "_" + key + "\"";
						String colAlias = "\"" + key + "\"";
						if (i == 0) {
							builder.append(tableAlias).append(".").append(columnName).append(" AS ").append(colAlias);
						} else {
							builder.append(",").append(tableAlias).append(".").append(columnName).append(" AS ").append(colAlias);
						}
						if (lastDotPos >= 0) {
							String assKey = key.substring(0, lastDotPos);
							/* 处理关联 */
							propertyCode = (String) column.get("propertyCode");
							if (null != propertyCode && propertyCode.indexOf("||") > -1) {
								String[] assKeyTuple = assKey.split("\\.");
								String layRec = (String) column.get("layRec");
								if (null != layRec && layRec.length() > 0 && layRec.indexOf("-") > -1) {
									int aPos = layRec.lastIndexOf("-");
									String assRec = layRec.substring(0, aPos);
									String[] assRecTuple = assRec.split("-");
									String keyAlias = "";
									String parentAlias = "";
									for (int j = 0; j < assKeyTuple.length; j++) {
										StringBuilder joinPart = new StringBuilder();
										parentAlias = j == 0 ? modelAlias : "\"" + keyAlias + "\"";
										keyAlias += j == 0 ? assKeyTuple[j] : "." + assKeyTuple[j];
										if (!tmpAssSet.contains(keyAlias)) {
											String[] assTNames = assRecTuple[j].split(",");
											joinPart.append(" LEFT OUTER JOIN ");
											joinPart.append(assTNames[0]).append(" \"");
											if (assTNames[0].equalsIgnoreCase(FlowStatus.TABLE_NAME)) {
												keyAlias = "flowStatus";
											}
											joinPart.append(modelAlias.substring(1, modelAlias.length()-1)).append("_").append(keyAlias).append("\"");
											//joinPart.append(keyAlias).append("\"");
											joinPart.append(" ON \"");
											joinPart.append(modelAlias.substring(1, modelAlias.length()-1)).append("_").append(keyAlias).append("\".").append(assTNames[1]);
											//joinPart.append(keyAlias).append("\".").append(assTNames[1]);
											joinPart.append(" = ");
											String parentAssTName = assTNames[3];
											if (assTNames[0].equals("BASE_COMPANY")
													&& (assTNames[2].equals("BASE_DEPARTMENT") || assTNames[2].equals("BASE_POSITION"))) {
												parentAssTName = "CID";
											}
											joinPart.append(parentAlias).append(".").append(parentAssTName);
											if (null != CurrentEntityModelsName && !CurrentEntityModelsName.isEmpty()) {
												if (CurrentEntityModelsName.contains(assTNames[0])) {
													joinPart.append(" AND \"");
													joinPart.append(modelAlias.substring(1, modelAlias.length()-1)).append("_").append(keyAlias).append("\".VALID = 1");
													//joinPart.append(keyAlias).append("\".VALID = 1");
												}
											}
											tmpAssSet.add(keyAlias);
											join.append(joinPart);
										}
									}
								}
							}
						}
						i++;
					}
				}
			}
		}
		return join.toString();
	}
	
	/**
	 * 通过service获取serviceImpl
	 * @param objs service
	 * @return
	 */
	private Map<String, Object> getRealServiceByServiceRef(Object[] objs) {
		if (null != objs && objs.length > 0) {
			BundleContext bundleContext = (BundleContext) objs[0];
			Map<String, Object> serviceList = new HashMap<String, Object>(objs.length - 1);
			for (int i = 1; i < objs.length; i++) {
				String objStr = objs[i].toString();
				ServiceReference ref = bundleContext.getServiceReference(objStr);
				if (null != ref) {
					Object realService = bundleContext.getService(ref);
					serviceList.put(objStr, realService);
				}
			}
			return serviceList;
		}
		return Collections.EMPTY_MAP;
	}
	
	/**
	 * 获取该模型的辅模型相关信息
	 * @return
	 */
	public List<Map<String,String>> getAuxiliaryModel(){
		List<Model> models = modelServiceFoundation.getModels("WOM_7.5.0.0_produceTask");
		List<Map<String,String>> objs = new ArrayList<Map<String,String>>();
		if(models.size()>0){
			for(Model model : models){
				if(!model.getIsMain()){
				Map<String,String> m = new HashMap<String, String>();
				m.put("modelName", model.getModelName());
				m.put("modelCode", model.getCode());
				m.put("entityCode", model.getEntity().getCode());
				m.put("name", InternationalResource.get(model.getName(), getCurrentUser().getLanguage()));		
				String viewName = produceTaskService.getViewName(model.getCode());
				m.put("viewName", viewName);
				objs.add(m);
				}
			}
		}
		return objs;
    }
    
    /**
	 * 获取该模型的辅模型相关信息，当辅模型未配置导入模板则不导出辅模型信息（供导入使用）
	 * @return
	 */
	public List<Map<String,String>> getImportAuxiliaryModel(){
		List<Model> models = modelServiceFoundation.getModels("WOM_7.5.0.0_produceTask");
		List<Map<String,String>> objs = new ArrayList<Map<String,String>>();
		if(models.size()>0){
			ImportTemplate importTemplate =null;
			for(Model model : models){
				if(!model.getIsMain()){
				importTemplate=importTemplateServiceFoundation.getImportTemplateByCode(model.getCode());
				Map<String,String> m = new HashMap<String, String>();
				m.put("modelName", model.getModelName());
				m.put("modelCode", model.getCode());
				m.put("entityCode", model.getEntity().getCode());
				m.put("name", InternationalResource.get(model.getName(), getCurrentUser().getLanguage()));		
				String viewName = produceTaskService.getViewName(model.getCode());
				m.put("viewName", viewName);
				if(importTemplate!=null){
				objs.add(m);
				}
				}
			}
		}
		return objs;
    }
	
	/**
	 * 获取主模型每页
	 * @return
	 */
	public Integer getMainPageNum(){
		return getPage().getPageSize();
	}
	
	/**
	 * 获取主模型Sheet的名称
	 * @return
	 */
	public String getMainSheetName(){		
		//Model model = modelServiceFoundation.getModel("WOM_7.5.0.0_produceTask_ProduceTask");
		Model model= null;
		if(excelExportModels != null && excelExportModels.get("WOM_7.5.0.0_produceTask_ProduceTask")!=null  ){
			model = (Model) excelExportModels.get("WOM_7.5.0.0_produceTask_ProduceTask");
		}else{
			model = modelServiceFoundation.getModel("WOM_7.5.0.0_produceTask_ProduceTask");
		}
		String sheetName = InternationalResource.get(model.getName(), getCurrentUser().getLanguage());
		return sheetName;
    }
	
	//获取系统编码的value
	public String getSystemCodeValue(String code,String isCustom){
		if(code.contains("||")){
			code = code.substring(code.lastIndexOf("||")+2, code.length());
		}
		String selectValue = "";
		String fillContent = null;
		if(isCustom != null && isCustom.equals("true")){
			//Property property = modelServiceFoundation.getProperty(code);
			Property property = null;
			if( excelProperty!=null && excelProperty.get(code)!=null ){
				property = (Property) excelProperty.get(code);
			}else{
				property = modelServiceFoundation.getProperty(code);
			}
			//List<CustomPropertyModelMapping> modelMappings = viewServiceFoundation.findCustomPropertyForAsso(property.getModel().getCode(), property.getCode());
			List<CustomPropertyModelMapping> modelMappings = null;
			if(excelModelMappings!=null && excelModelMappings.get(property.getCode())!=null ){
				modelMappings = (List<CustomPropertyModelMapping>) excelModelMappings.get(property.getCode());
			}else{
				modelMappings = viewServiceFoundation.findCustomPropertyForAsso(property.getModel().getCode(), property.getCode());
				this.excelModelMappings.put(property.getCode(), modelMappings);
			}
			if(modelMappings != null && modelMappings.size()>0){
				fillContent = modelMappings.get(0).getFillContent();
			}
		}else{
			//Property prop = modelServiceFoundation.findPropertyByCode(code, null);
			Property prop = null;
			if(excelProperty!=null && excelProperty.get(code) != null ){
				prop = (Property) excelProperty.get(code);
			}else{
				prop = modelServiceFoundation.findPropertyByCode(code);
			}
			fillContent = prop.getFillcontent();
		}
		if(fillContent != null){
			String[] str = fillContent.split(",");
			String[] str2 = str[2].split(":");
			String scEntityCode = str2[1].substring(1, str2[1].length()-2);
			List<String> values = produceTaskService.getSystemCodeFullPathNameByEntityCode(scEntityCode);
			
			if(values!=null && values.size()>0){
				for(String value : values){
					if(value != null && value.length()>0){
						Boolean flag = false;
						char[] ch = value.toCharArray();
				        for (int i = 0; i < ch.length; i++) {//判断系统编码是不是中文，如果不是，则从国际化编码里面找对应的中文
				            char c = ch[i];
				            if (isChinese(c)) {
				            	flag = true;
				            } else {
				            	break;
				            }
				        }
				        
				        if(flag){
				        	selectValue += value + ",";
				        }else{
				        	selectValue += (InternationalResource.get(value, getCurrentUser().getLanguage())!=null?InternationalResource.get(value, getCurrentUser().getLanguage()):"") + ",";
				        }
					}
				}
				if(selectValue.length()>0){
					selectValue = selectValue.substring(0, selectValue.length()-1);
				}
			}
		}	
		return selectValue;
	}
	
	// 根据Unicode编码完美的判断中文汉字和符号
    private static boolean isChinese(char c) {
        Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
        if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS || ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
                || ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A || ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B
                || ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION || ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS
                || ub == Character.UnicodeBlock.GENERAL_PUNCTUATION) {
            return true;
        }
        return false;
    }
	
	/**
	 * 拼接用于生产sql的xml
	 * @return
	 */
	private String generteAuxXml(Property p)   {
		String queryConfigAux = "<list-item>";
		queryConfigAux += "<name><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "]]></name>";
		queryConfigAux += "<dispalyName><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "]]></dispalyName>";
		queryConfigAux += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "]]></propertyCode>";
		queryConfigAux += "<namekey><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "]]></namekey>";
		if(p.getMultable()){
			queryConfigAux += "<multable><![CDATA[true]]></multable>";
		}else{
			queryConfigAux += "<multable><![CDATA[false]]></multable>";
		}
		if(p.getSeniorSystemCode()){
			queryConfigAux += "<seniorsystemcode><![CDATA[true]]></seniorsystemcode>";
		}else{
			queryConfigAux += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
		}
		queryConfigAux += "<propshowformat><![CDATA[" + (p.getFormat()!=null?p.getFormat():"undefined") + "]]></propshowformat>";
		queryConfigAux += "<assPropertyName><![CDATA[undefined]]></assPropertyName>";
		queryConfigAux += "<modelCode><![CDATA[undefined]]></modelCode>";
		queryConfigAux += "<columnName><![CDATA[" + (p.getColumnName()!=null?p.getColumnName():"undefined") + "]]></columnName>";
		queryConfigAux += "<layRec><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "]]></layRec>";
		queryConfigAux += "<key><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "]]></key>";
		if(p.getNullable()||p.getName().equals("id")){
			queryConfigAux += "<nullable><![CDATA[true]]></nullable>";
		}else{
			queryConfigAux += "<nullable><![CDATA[false]]></nullable>";
		}
		queryConfigAux += "<columntype><![CDATA[" + (p.getType()!=null?p.getType():"undefined") + "]]></columntype>";
		if(p.getDecimalNum()!=null && p.getDecimalNum()>0){
			queryConfigAux += "<decimalNum><![CDATA[" + p.getDecimalNum().toString() + "]]></decimalNum>";
		}else{
			queryConfigAux += "<decimalNum><![CDATA[0]]></decimalNum>";
		}
		queryConfigAux += "<isCustom><![CDATA[" + p.getIsCustom() + "]]></isCustom>";
		queryConfigAux += "</list-item>";
		return queryConfigAux;
	}
	private String generteAuxObjXml(Property p, Property ap, Model assModel, String idColumnName, Model realmodel){
		String targetColumnName = null;
		if(null != p.getAssociatedProperty() && null != p.getAssociatedProperty().getName() && !"".equals(p.getAssociatedProperty().getName())){
			   targetColumnName = p.getAssociatedProperty().getColumnName().toUpperCase();
		} else {
			   targetColumnName = idColumnName;
		}
		String queryConfigAuxObj = "<list-item>";
		queryConfigAuxObj += "<name><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "." +
				(ap.getName()!=null?ap.getName():"undefined") + "]]></name>";
		queryConfigAuxObj += "<dispalyName><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "," +
				(ap.getDisplayName()!=null?ap.getDisplayName():"undefined") + "]]></dispalyName>";
		queryConfigAuxObj += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "||" +
				(ap.getCode()!=null?ap.getCode():"undefined") + "]]></propertyCode>";
		queryConfigAuxObj += "<namekey><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "," +
				(ap.getDisplayName()!=null?ap.getDisplayName():"undefined") + "]]></namekey>";
		if(p.getMultable()){
			queryConfigAuxObj += "<multable><![CDATA[true]]></multable>";
		}else{
			queryConfigAuxObj += "<multable><![CDATA[false]]></multable>";
		}
		if(p.getSeniorSystemCode()){
			queryConfigAuxObj += "<seniorsystemcode><![CDATA[true]]></seniorsystemcode>";
		}else{
			queryConfigAuxObj += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
		}
		queryConfigAuxObj += "<propshowformat><![CDATA[" + (ap.getFormat()!=null?ap.getFormat():"undefined") + "]]></propshowformat>";
		queryConfigAuxObj += "<assPropertyName><![CDATA[" + (ap.getName()!=null?ap.getName():"undefined") + "]]></assPropertyName>";
		queryConfigAuxObj += "<modelCode><![CDATA["+ assModel.getCode() +"]]></modelCode>";
		queryConfigAuxObj += "<columnName><![CDATA[" + (ap.getColumnName()!=null?ap.getColumnName():"undefined") + "]]></columnName>";
		queryConfigAuxObj += "<layRec><![CDATA[" + assModel.getTableName() + "," + targetColumnName + "," + realmodel.getTableName() + "," + p.getColumnName() + "-" +
				(ap.getName()!=null?ap.getName():"undefined") + "]]></layRec>";
		queryConfigAuxObj += "<key><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "." +
				(ap.getName()!=null?ap.getName():"undefined") + "]]></key>";
		//queryConfigAuxObj += "<key><![CDATA[" + assModel.getModelName().substring(0, 1).toLowerCase() + assModel.getModelName().substring(1) + "." +
		//		(ap.getName()!=null?ap.getName():"undefined") + "]]></key>";
		if(!p.getNullable() || ( (p.getCode().contains("_ownerStaff") ||  p.getCode().contains("_ownerPosition")) && ap.getIsBussinessKey())){
			queryConfigAuxObj += "<nullable><![CDATA[false]]></nullable>";
		}else{
			queryConfigAuxObj += "<nullable><![CDATA[true]]></nullable>";
		}
		queryConfigAuxObj += "<columntype><![CDATA[" + (ap.getType()!=null?ap.getType():"undefined") + "]]></columntype>";
		if(ap.getDecimalNum()!=null && ap.getDecimalNum()>0){//如果是小数类型，记录小数的位数
			queryConfigAuxObj += "<decimalNum><![CDATA[" + ap.getDecimalNum().toString() + "]]></decimalNum>";
		}else{
			queryConfigAuxObj += "<decimalNum><![CDATA[0]]></decimalNum>";
		}
		queryConfigAuxObj += "<isCustom><![CDATA[" + ap.getIsCustom() + "]]></isCustom>";
		queryConfigAuxObj += "</list-item>";
		return queryConfigAuxObj;
	}
	private String generteStaffOrPositionXml(Property p, Model model, String type){
		String supplyConfig = "<list-item>";
		if(type.equals("ownerStaffCode")){
			supplyConfig += "<name><![CDATA[ownerStaff.code]]></name>";
			supplyConfig += "<dispalyName><![CDATA[ec.common.ownerStaff,foundation.ec.entity.staff.code]]></dispalyName>";
			supplyConfig += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "||base_staff_code]]></propertyCode>";
			supplyConfig += "<namekey><![CDATA[ec.common.ownerStaff,foundation.ec.entity.staff.code]]></namekey>";
			supplyConfig += "<multable><![CDATA[false]]></multable>";
			supplyConfig += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
			supplyConfig += "<propshowformat><![CDATA[TEXT]]></propshowformat>";
			supplyConfig += "<columnName><![CDATA[OWNER_STAFF_ID]]></columnName>";
			supplyConfig += "<layRec><![CDATA[base_staff,ID,"+ model.getTableName() +",OWNER_STAFF_ID-code]]></layRec>";
			supplyConfig += "<key><![CDATA[ownerStaff.code]]></key>";
			supplyConfig += "<nullable><![CDATA[false]]></nullable>";
			supplyConfig += "<columntype><![CDATA[TEXT]]></columntype>";
			supplyConfig += "<isCustom><![CDATA[false]]></isCustom>";
			supplyConfig += "<customPropImportCode><![CDATA[undefined]]></customPropImportCode>";
		}else if(type.equals("ownerStaffName")){
			supplyConfig += "<name><![CDATA[ownerStaff.name]]></name>";
			supplyConfig += "<dispalyName><![CDATA[ec.common.ownerStaff,foundation.staff.dimissionStaff_xls.staffName]]></dispalyName>";
			supplyConfig += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "||base_staff_name]]></propertyCode>";
			supplyConfig += "<namekey><![CDATA[ec.common.ownerStaff,foundation.staff.dimissionStaff_xls.staffName]]></namekey>";
			supplyConfig += "<multable><![CDATA[false]]></multable>";
			supplyConfig += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
			supplyConfig += "<propshowformat><![CDATA[TEXT]]></propshowformat>";
			supplyConfig += "<columnName><![CDATA[OWNER_STAFF_ID]]></columnName>";
			supplyConfig += "<layRec><![CDATA[base_staff,ID,"+ model.getTableName() +",OWNER_STAFF_ID-name]]></layRec>";
			supplyConfig += "<key><![CDATA[ownerStaff.name]]></key>";
			supplyConfig += "<nullable><![CDATA[false]]></nullable>";
			supplyConfig += "<columntype><![CDATA[TEXT]]></columntype>";
			supplyConfig += "<isCustom><![CDATA[false]]></isCustom>";
			supplyConfig += "<customPropImportCode><![CDATA[undefined]]></customPropImportCode>";
		}else if(type.equals("ownerPositionCode")){
			supplyConfig += "<name><![CDATA[ownerPosition.code]]></name>";
			supplyConfig += "<dispalyName><![CDATA[ec.common.ownerPosition,foundation.position.code]]></dispalyName>";
			supplyConfig += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "||base_position_code]]></propertyCode>";
			supplyConfig += "<namekey><![CDATA[ec.common.ownerPosition,foundation.position.code]]></namekey>";
			supplyConfig += "<multable><![CDATA[false]]></multable>";
			supplyConfig += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
			supplyConfig += "<propshowformat><![CDATA[TEXT]]></propshowformat>";
			supplyConfig += "<columnName><![CDATA[OWNER_POSITION_ID]]></columnName>";
			supplyConfig += "<layRec><![CDATA[BASE_POSITION,ID,"+ model.getTableName() +",OWNER_POSITION_ID-code]]></layRec>";
			supplyConfig += "<key><![CDATA[ownerPosition.code]]></key>";
			supplyConfig += "<nullable><![CDATA[false]]></nullable>";
			supplyConfig += "<columntype><![CDATA[TEXT]]></columntype>";
			supplyConfig += "<isCustom><![CDATA[false]]></isCustom>";
			supplyConfig += "<customPropImportCode><![CDATA[undefined]]></customPropImportCode>";
		}else if(type.equals("ownerPositionName")){
			supplyConfig += "<name><![CDATA[ownerPosition.name]]></name>";
			supplyConfig += "<dispalyName><![CDATA[ec.common.ownerPosition,foundation.position.name]]></dispalyName>";
			supplyConfig += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "||base_position_name]]></propertyCode>";
			supplyConfig += "<namekey><![CDATA[ec.common.ownerPosition,foundation.position.name]]></namekey>";
			supplyConfig += "<multable><![CDATA[false]]></multable>";
			supplyConfig += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
			supplyConfig += "<propshowformat><![CDATA[TEXT]]></propshowformat>";
			supplyConfig += "<columnName><![CDATA[OWNER_POSITION_ID]]></columnName>";
			supplyConfig += "<layRec><![CDATA[BASE_POSITION,ID,"+ model.getTableName() +",OWNER_POSITION_ID-name]]></layRec>";
			supplyConfig += "<key><![CDATA[ownerPosition.name]]></key>";
			supplyConfig += "<nullable><![CDATA[false]]></nullable>";
			supplyConfig += "<columntype><![CDATA[TEXT]]></columntype>";
			supplyConfig += "<isCustom><![CDATA[false]]></isCustom>";
			supplyConfig += "<customPropImportCode><![CDATA[undefined]]></customPropImportCode>";
		}
		supplyConfig += "</list-item>";
		return supplyConfig;
	}
	
	public Boolean linkMain(String modelCode, String entityCode){
		//Model mainModel = modelServiceFoundation.getMainModel(entityCode);
		//Model model = modelServiceFoundation.getModel(modelCode);
		//List<Property> props = modelServiceFoundation.findProperties(model);
		Model mainModel = null;
		if(excelExportModels != null && excelExportModels.get("mainModel")!=null  ){
			mainModel = (Model) excelExportModels.get("mainModel");
		}else{
			mainModel = modelServiceFoundation.getMainModel(entityCode);
		}		
		Model model = null;
		if(excelExportModels != null && excelExportModels.get(modelCode)!=null  ){
			model = (Model) excelExportModels.get(modelCode);
		}else{
			model = modelServiceFoundation.getModel(modelCode);
		}		
		List<Property> props= null;
		if( excelProperties !=null && excelProperties.get(model.getCode()) != null){
			props = (List<Property>) excelProperties.get(model.getCode());
		}else{
			props = modelServiceFoundation.findProperties(model);
			this.excelProperties.put(model.getCode(), props);
		}		
		for(Property p : props){
			if(!p.getIsCustom() && p.getType().toString().equals("OBJECT") && p.getAssociatedProperty() != null){
				if(p.getAssociatedProperty().getModel().getCode().equals(mainModel.getCode())){
					return true;
				}else{
					//List<Property> props2 = modelServiceFoundation.findProperties(p.getAssociatedProperty().getModel());
					List<Property> props2= null;
					if( excelProperties !=null && excelProperties.get(p.getAssociatedProperty().getModel().getCode()) != null){
						props2 = (List<Property>) excelProperties.get(p.getAssociatedProperty().getModel().getCode());
					}else{
						props2 = modelServiceFoundation.findProperties(p.getAssociatedProperty().getModel());
						this.excelProperties.put(model.getCode(), props);
					}	
					for(Property p2 : props2){
						if(!p2.getIsCustom() && p2.getType().toString().equals("OBJECT") && p2.getAssociatedProperty() != null
								&& p2.getAssociatedProperty().getModel().getCode().equals(mainModel.getCode())){
							return true;
						}
					}	
				}
			}
		}
		return false;
	}
	
	Map<String, String> tmpArgumentsMap = new HashMap<String, String>(); // 用做自定义代码临时变量返回前台
	Map<String, Object> tmpArgumentsObjMap = new HashMap<String, Object>(); // 用做自定义代码临时变量返回前台
	
	public Map<String, String> getTmpArgumentsMap() {
		return tmpArgumentsMap;
	}
	public void setTmpArgumentsMap(Map<String, String> tmpArgumentsMap) {
		this.tmpArgumentsMap = tmpArgumentsMap;
	}
	public Map<String, Object> getTmpArgumentsObjMap() {
		return tmpArgumentsObjMap;
	}
	public void setTmpArgumentsObjMap(Map<String, Object> tmpArgumentsObjMap) {
		this.tmpArgumentsObjMap = tmpArgumentsObjMap;
	}
	
	private void bapBeforeCustomMethod(String code, String methodName) throws Exception {
	/* CUSTOM CODE START(action,beforeMethods,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
		//放到service中处理
      	/*if(code.equals("WOM_7.5.0.0_produceTask_ProduceTask") && methodName.equals("retrial")){
			if(produceTask.getTasksID()!=null){
				throw new BAPException("由批量指令单生成的指令单，不能弃审");
			}
		}

		if(code.equals("WOM_7.5.0.0_produceTask_ProduceTask") && methodName.equals("retrial")){
			//当制造指令单状态为待执行时，该指令单可启用弃审功能，否则弃审功能不可用
			if(produceTask.getTaskState().equals(systemCodeService.getSystemCode("womTaskState/01"))){
				//弃审
				//添加批次处理信息
				produceTaskService.addDealBatch(produceTask,(SystemCode) systemCodeService.getSystemCode("publicSetTableState/04"),"指令单弃审操作");
				//删除指令单生成的配料需求单   指令单活动有配料才生成配料需求清单
				womBatchingMaterialNeedService.deleteBytaskId(produceTask.getId());
			}else{
				//该指令单状态不为待执行，弃审功能不可用！
				throw new BAPException("WOM.retrialTaskException0811");
			}
		}*/
      
		if(code.equals("WOM_7.5.0.0_produceTask_ProduceTask") && methodName.equals("submit")){
			if( workFlowVar!=null  &&  "cancel".equals(workFlowVar.getOutcomeType()) ){
				//作废处理
				//判断是否弃审 已经历弃审返回false
				if(produceTaskService.checkRecall(produceTask)){
					//作废时执行  如果存在批次，则删除批次信息
					WOMProduceTask pTask = produceTaskService.getProduceTask(produceTask.getId());
					//当上一次保存batchNum不为空时，删除原先记录
					if(pTask.getProductBatchNum()!=null && !"".equals(pTask.getProductBatchNum())){
						//删除之前批次记录
						produceTaskService.delBatch(pTask.getProductBatchNum());
						produceTaskService.addDealBatch(pTask, (SystemCode) systemCodeService.getSystemCode("publicSetTableState/03"), "指令单作废操作");
					}
				}else{
					//添加批次处理信息
					produceTaskService.addDealBatch(produceTask,(SystemCode) systemCodeService.getSystemCode("publicSetTableState/03"),"指令单作废操作");
				}
			}else {
				//生成批號
				if("".equals(produceTask.getProductBatchNum()) || produceTask.getProductBatchNum()==null){
					produceTaskService.batchNumCodes(produceTask);
				}
				//每次保存时调用
				if(produceTask.getId() == null){
					addNew = true;
				} else{
					//非首次保存
					WOMProduceTask pTask = produceTaskService.getProduceTask(produceTask.getId());
					//获得原批号，验证批号是否相同
					if(pTask.getProductBatchNum()!=null && !"".equals(pTask.getProductBatchNum())){
						if(produceTask.getProductBatchNum()!=null && !"".equals(produceTask.getProductBatchNum())){
							//原批号与当前批号都存在时
							if(pTask.getProductBatchNum().equals(produceTask.getProductBatchNum())){
								//批号相同  跟新数据
								if(((pTask.getProductNum()==null && produceTask.getProductNum()==null) || (pTask.getProductNum()!=null && produceTask.getProductNum()!=null && pTask.getProductNum().compareTo(produceTask.getProductNum())==0)) && ((pTask.getProductId()==null && produceTask.getProductId()==null) || (pTask.getProductId()!=null && produceTask.getProductId()!=null && produceTask.getProductId().getId()!=null && pTask.getProductId().getId()!=null && produceTask.getProductId().getId().equals(pTask.getProductId().getId())))){
									produceTaskService.updateBatch(produceTask);
								}else{
									produceTaskService.updateBatch(produceTask);
									produceTaskService.addDealBatch(produceTask, (SystemCode) systemCodeService.getSystemCode("publicSetTableState/01"), "指令单修改");
								}
							}else{
								//批号冲突  删除原批号数据 添加新批号
								produceTaskService.delBatch(pTask.getProductBatchNum());
								produceTaskService.addDealBatch(pTask, (SystemCode) systemCodeService.getSystemCode("publicSetTableState/01"), "指令单跟换批号，删除该批号");
								produceTaskService.setBatch(produceTask);
							}
						}else{
							//原批号存在  当前批号为空
							// 删除原批号数据
							produceTaskService.delBatch(pTask.getProductBatchNum());
						}
					}else{
						if(produceTask.getProductBatchNum()!=null && !"".equals(produceTask.getProductBatchNum())){
							//原批号为空  当前批号存在
							// 添加新批号
							produceTaskService.setBatch(produceTask);
						}else{
							//原批号为空  当前批号为空
							//TODO
                          	addNew = true;
						}
					}
				}
			}
		}
/* CUSTOM CODE END */
	}
	
	private void bapAfterCustomMethod(String code, String methodName) throws Exception {
	/* CUSTOM CODE START(action,methods,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
		if(code.equals("WOM_7.5.0.0_produceTask_ProduceTask") && methodName.equals("submit")){
			if(addNew){
				//存在批号时 添加批号数据
              	produceTask = produceTaskService.reloadProduceTask(produceTask.getId());
				if(produceTask.getProductBatchNum()!=null && !"".equals(produceTask.getProductBatchNum())){
					//生成批次信息
					produceTaskService.setBatch(produceTask);
				}
			}
          	if(produceTask.getStatus() == 99){
				//添加批次处理信息
				produceTaskService.addDealBatch(produceTask,(SystemCode) systemCodeService.getSystemCode("publicSetTableState/02"),"指令单生效");
			}
		}
/* CUSTOM CODE END */
	}
	
	/* CUSTOM CODE START(action,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

    @Resource
    private ConsulService consulService;
	@Resource
	private WOMBatchingMaterialNeedService womBatchingMaterialNeedService;
   	private Long productID;
	private Long exeOrderStaff;
    private Long batchPlanId;
    private String remark;
    private boolean addNew = false;//是否第一次保存
    private Long batchTaskId;
    private String batchNum;//批号
    private String taskType;
    private String productBatchNum;//生产批号
    private String taskId;//指令单id
    
    
	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getProductBatchNum() {
		return productBatchNum;
	}

	public void setProductBatchNum(String productBatchNum) {
		this.productBatchNum = productBatchNum;
	}
	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}
	public Long getExeOrderStaff() {
		return exeOrderStaff;
	}

	public void setExeOrderStaff(Long exeOrderStaff) {
		this.exeOrderStaff = exeOrderStaff;
	}

	public Long getBatchPlanId() {
		return batchPlanId;
	}

	public void setBatchPlanId(Long batchPlanId) {
		this.batchPlanId = batchPlanId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Long getProductID() {
		return productID;
	}
	public void setProductID(Long productID) {
		this.productID = productID;
	}

	public Long getBatchTaskId() {
		return batchTaskId;
	}

	public void setBatchTaskId(Long batchTaskId) {
		this.batchTaskId = batchTaskId;
	}

	public String getBatchNum() {
		return batchNum;
	}

	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}
	/**
	  * 通过样品id查找默认配方
	  * @return
	  * @throws Exception
	  */
	@Action(value = "/WOM/produceTask/produceTask/getDefaultFormular", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag,formularID,formularCode,formularName,supportEbr,processId,edition,isAnaly,workTypeId,workTypeValue,batchContral" }) })
	public String getFormular() throws Exception{
		RMFormula formular = produceTaskService.getDefaultFormular(productID,taskType);
		if(formular!= null){
			responseMap.put("dealSuccessFlag", true);
			responseMap.put("formularID",formular.getId() );
			responseMap.put("formularCode", formular.getCode());
			responseMap.put("formularName", formular.getName());
            responseMap.put("supportEbr", formular.getSupportEbr());
			responseMap.put("processId", formular.getSetProcess().getId());
         	responseMap.put("edition", formular.getEdition());     
          	//赋值工艺
         	responseMap.put("isAnaly", formular.getIsAnaly());   
         	//指令单类型
         	responseMap.put("workTypeId", formular.getProduceType().getId());
         	responseMap.put("workTypeValue", formular.getProduceType().getValue());
         	//批控
         	responseMap.put("batchContral", formular.getBatchContral());   
		}else{
			responseMap.put("dealSuccessFlag", false);
		}
		return SUCCESS;
	}
     //是否启用物料批号设置
    @Action(value = "/WOM/produceTask/produceTask/getIsProBatch", results = { @Result(type = JSON, params = {
    		"root", "responseMap" }) })
    public String getIsProBatch() {
    	Boolean isProBatch=consulService.getValueAsBoolean("platform/bap/WOM/WOM.proBatch");
    	responseMap.put("result", isProBatch);
    	return SUCCESS;
    }


	//创建指令单
	@Action(value = "/WOM/produceTask/produceTask/makeProduceOrder", results = { @Result(type = JSON, params = {"root", "responseMap" }) })
	public String makeBatchingOrder() {
		produceTaskService.makeProduceOrder(exeOrderStaff,batchPlanId,remark); 	
		responseMap.put("dealSuccessFlag", false);
		return SUCCESS;
	}

     /**
	  * 通过批量指令单的明显ID获取指令单
	  * @return
	  * @throws Exception
	  */
	@Action(value = "/WOM/produceTask/produceTask/getProduceTaskByBatchID", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag,taskId,taskTableInfoId" }) })
	public String getProduceTaskByBatchID() throws Exception{
		WOMProduceTask task = produceTaskService.getProduceTaskByBatchID(batchTaskId);
		if(task!= null){
			responseMap.put("dealSuccessFlag", true);
			responseMap.put("taskId",task.getId());
			responseMap.put("taskTableInfoId", task.getTableInfoId());
		}else{
			responseMap.put("dealSuccessFlag", false);
		}
		return SUCCESS;
	}
    
     /**
	 * 批量指令单生成的指令不需要有代办的特殊处理
	 */
	@Actions({
		 @Action(value = "/WOM/produceTask/produceTask/makeTaskEdit/batchTaskSubmit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/WOM/produceTask/produceTask/packageTaskEdit/batchTaskSubmit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
	})
	public String batchTaskSubmit() throws Exception{
		//bapBeforeCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "batchTaskSubmit");
		bap_validate_datagrids=produceTaskService.findValidateDatagrids(getDgClassMap());
		if (produceTask != null && produceTask.getStatus() != null && produceTask.getStatus() == 77) {
			throw new BAPException(Code.PENDING_HAS_HANGUP);
		}
		if (null == workFlowVar) {
			workFlowVar = new WorkFlowVar();
		}
		workFlowVar.setOperateType(operateType);
		if(null == produceTask.getId()) {
			responseMap.put("operate", "add");
		} else {
			responseMap.put("operate", "edit");
		}
		
		produceTaskService.save(produceTask,deploymentId,null,workFlowVar, dgLists,dgDeletedIds,(Map<String, Object>)request.getAttribute("__orchid_ass_fileuploads__"), viewCode);
		responseMap.put("dealSuccessFlag", true);

		responseMap.put("operateType", "save");
		responseMap.put("viewselect", viewselect);
		
		responseMap.put("tableInfoId", produceTask.getTableInfoId());
		responseMap.put("id", produceTask.getId());
		
		//bapAfterCustomMethod("WOM_7.5.0.0_produceTask_ProduceTask", "batchTaskSubmit");
		return SUCCESS;
	}

	//工单错误日志手工处理
	String mesid="";
	String objectType="";
	String operationType="";
	String logid="";
	boolean returnSuccess=false;

	public String getObjectType() {
		return objectType;
	}

	public void setObjectType(String objectType) {
		this.objectType = objectType;
	}

	public String getLogid() {
		return logid;
	}

	public void setLogid(String logid) {
		this.logid = logid;
	}

	public boolean isReturnSuccess() {
		return returnSuccess;
	}

	public void setReturnSuccess(boolean returnSuccess) {
		this.returnSuccess = returnSuccess;
	}

	public String getMesid() {
		return mesid;
	}

	public void setMesid(String mesid) {
		this.mesid = mesid;
	}

	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

	@Resource
	private RMMQDealinfoService rMMQDealinfoService;
	
	@Resource
	private RMInterfaceSyncLogService interfaceSyncLogService;
	
	@Action(value = "/public/WOM/produceTask/produceTask/sync", results = { @Result(type = JSON, params = { "root","returnSuccess"
	})
	})
	public String sync() throws Exception{
		if(null!=objectType && !"".equals(objectType)){
			if("workOrder".equals(objectType)){
				if(null!=operationType&&!"".equals(operationType)){
					if(mesid.contains(",")){
						mesid = mesid.substring(0,mesid.length()-1);
					}
					if(logid.contains(",")){
						logid = logid.substring(0,logid.length()-1);
					}
					if(operationType.equals("produceTaskAdd")){//mes新增工单
						returnSuccess=produceTaskService.addProduceTaskSync(mesid,logid);
					}else if(operationType.equals("produceTaskUpdate")){//mes修改工单
						returnSuccess=produceTaskService.updateProdTaskSync(mesid,logid,4);
					}else if(operationType.equals("produceTaskDelete")){//mes删除工单
						returnSuccess=produceTaskService.deleteProdTaskSync(mesid,logid);
					}else if(operationType.equals("stopPhase")){//mes停止Phase
						mesid = getLogData(logid);
						returnSuccess=produceTaskService.stopPhaseSync(mesid,logid);
						if(returnSuccess){
							dealMqLog(logid);
						}
					}else if(operationType.equals("unitStatus")){//批控启停unit
						//String data = getLogData(logid);
						//returnSuccess =produceTaskService.dealMqUnitDate(data,true);
						RMMQDealinfo di = rMMQDealinfoService.getMQDealinfo(Long.valueOf(mesid));
						returnSuccess =produceTaskService.dealMqUnitDate(di,true);
						if(returnSuccess){
							dealMqLog(logid);
						}
					}else if(operationType.equals("activeStatus")){
						//String data = getLogData(logid);
						//returnSuccess =produceTaskService.dealMqPhaseDate(data,true);
						RMMQDealinfo di = rMMQDealinfoService.getMQDealinfo(Long.valueOf(mesid));
						returnSuccess =produceTaskService.dealMqPhaseDate(di,true);
						if(returnSuccess){
							dealMqLog(logid);
						}
					}else if(operationType.equals("mesStopPhaseFault")){
						String data = getLogData(logid);
						returnSuccess =produceTaskService.endPhaseActive(data,true);
						if(returnSuccess){
							dealMqLog(logid);
						}
					}else if(operationType.equals("produceTaskSyn")){
						RMMQDealinfo di = rMMQDealinfoService.getMQDealinfo(Long.valueOf(mesid));
						returnSuccess =produceTaskService.dealMqPhaseDateChange(di,true);
						if(returnSuccess){
							dealMqLog(logid);
						}
					}else if(operationType.equals("batchStatus")){//批控启停工单
						//String data = getLogData(logid);
						//returnSuccess =produceTaskService.dealMqBatchDate(data,true);
						RMMQDealinfo di = rMMQDealinfoService.getMQDealinfo(Long.valueOf(mesid));
						returnSuccess =produceTaskService.dealMqBatchDate(di,true);
						if(returnSuccess){
							dealMqLog(logid);
						}
					}
				}
			}
		}
		return SUCCESS;
	}
	
	private String getLogData(String logid){
		String data = null;
		RMInterfaceSyncLog log = interfaceSyncLogService.getInterfaceSyncLog(Long.valueOf(logid));
		String logFault = log.getLogFault();
		if(logFault.contains("jsonData:")){
			data = logFault.substring( logFault.indexOf("jsonData:")+9 ,logFault.length());
		}
		return data;
	}
	
	private void dealMqLog(String logid){
		RMInterfaceSyncLog interfaceLog=null;
		if(null!=logid&&!"".equals(logid)){
			interfaceLog=interfaceSyncLogService.getInterfaceSyncLog(Long.parseLong(logid));
		}
		interfaceLog.setLogSynFlag(true);
		interfaceLog.setLogFault("success");
		interfaceSyncLogService.saveLog(interfaceLog);
	}
	

            
            
    /**
	  * 通过批号查找指令单
	  * @return
	  * @throws Exception
	  */
	@Action(value = "/WOM/produceTask/produceTask/getBybatchNum", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes", "dealSuccessFlag,productId,productCode,prodcutName,productSpecif,productModel,productBaseUnitName,quantity,factoryId,factoryName,formularId,formularCode,formularName,supportEbr" }) })
	public String getBybatchNum() throws Exception{
		WOMProduceTask task = produceTaskService.getBybatchNum(batchNum);
		if(task!= null){
			responseMap.put("dealSuccessFlag", true);
			responseMap.put("productId",task.getProductId().getId());
			responseMap.put("productCode",task.getProductId().getProductCode());
			responseMap.put("prodcutName",task.getProductId().getProductName());
			//规格型号单位productSpecif  productModel   productBaseUnit.name
			responseMap.put("productSpecif",task.getProductId().getProductSpecif());
			responseMap.put("productModel",task.getProductId().getProductModel());
			responseMap.put("productBaseUnitName",task.getProductId().getProductBaseUnit().getName());
			responseMap.put("quantity",task.getFinishNum());//默认完成数量报工单回填	
			responseMap.put("factoryId",task.getFactoryId().getId());
			responseMap.put("factoryName",task.getFactoryId().getName());
			responseMap.put("formularId",task.getFormularId().getId());
			responseMap.put("formularCode",task.getFormularId().getCode());
			responseMap.put("formularName",task.getFormularId().getName());
			responseMap.put("supportEbr",task.getFormularId().getSupportEbr());	
		}else{
			responseMap.put("dealSuccessFlag", false);
		}
		return SUCCESS;
	}




	/**
	 * 根据返工前批号查找最新检验报告单
	 * @param srcID
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/findManuCheckBybatchNum", results = { @Result(type = JSON, params = {
			"root", "responseMap" }) })
	public String findManuCheckBybatchNum(){
		
		String result=produceTaskService.findManuCheckBybatchNum(batchNum);
		responseMap.put("result", result);
		return SUCCESS;
	}
	private Long headerProcessId;

	private Long selectedActiveId;

	private Long headerId;

    public Long getHeaderId() {
        return headerId;
    }

    public void setHeaderId(Long headerId) {
        this.headerId = headerId;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getHeaderProcessId() {
        return headerProcessId;
    }

    public void setHeaderProcessId(Long headerProcessId) {
        this.headerProcessId = headerProcessId;
    }

    public Long getSelectedActiveId() {
        return selectedActiveId;
    }

    public void setSelectedActiveId(Long selectedActiveId) {
        this.selectedActiveId = selectedActiveId;
    }

    /**
	 * 开始活动
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/startActive", results = { @Result(type = JSON, params = {
			"root", "responseMap" }) })
	public String startActive(){
        ProcedureReport activeProcessor = choseHandler.choseProcfeedWay(DealsEnum.MES);
        Map<String,Object> map = new HashMap<>();
        if (selectedActiveId != null) {
            map.put("selectedActiveId",selectedActiveId);
            map.put("inComeType","people");
        }
        WOMResult womResult = activeProcessor.startActive(map);
        responseMap.put("result", womResult.getMsg());
        return SUCCESS;
	}
	/**
	 * 结束活动
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/endActive", results = { @Result(type = JSON, params = {
			"root", "responseMap" }) })
	public String endActive(){
        ProcedureReport activeProcessor = choseHandler.choseProcfeedWay(DealsEnum.MES);
        Map<String,Object> map = new HashMap<>();
        if (selectedActiveId != null) {
            map.put("selectedActiveId",selectedActiveId);
            map.put("inComeType","people");
        }
        WOMResult womResult = activeProcessor.endActive(map);
        responseMap.put("result", womResult.getMsg());
		return SUCCESS;
	}
	    private Long activeId;

    public Long getActiveId() {
        return activeId;
    }

    public void setActiveId(Long activeId) {
        this.activeId = activeId;
    }

    /**
	 * 双击工序活动行时，判断有没有报工页面，如果没有 就新建 ， 如果有就回传页面ID
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/toProcFeedbackPage", results = { @Result(type = JSON, params = {
			"root", "responseMap" }) })
	public String toProcFeedbackPage(){
        Long result = null;
        if (activeId != null) {
            result=produceTaskService.toProcFeedbackPage(activeId);
        }
        responseMap.put("result", result);
        return SUCCESS;
	}
	
	private String activeType;

    public String getActiveType() {
        return activeType;
    }

    public void setActiveType(String activeType) {
        this.activeType = activeType;
    }

    /**
	 * 双击工序活动行时，判断有没有报工页面，如果没有 就新建 ， 如果有就回传页面ID
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/searchProcFeedbackPage", results = { @Result(type = JSON, params = {
			"root", "responseMap" }) })
	public String searchProcFeedbackPage(){
        Long result = null;
        if (activeId != null) {
            result=produceTaskService.searchProcFeedbackPage(activeId,activeType);
        }
        responseMap.put("result", result);
        return SUCCESS;
	}

		private Long produceTaskId;

    public Long getProduceTaskId() {
        return produceTaskId;
    }

    public void setProduceTaskId(Long produceTaskId) {
        this.produceTaskId = produceTaskId;
    }

  	/**
	 * 返回Step对象
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/getProcessesData", results = { @Result(type = JSON, params = {
	        "root", "responseMap","excludes", "*", "includes", "processSteps,processSteps.id,processSteps.step,processSteps.name,processSteps.status,processSteps.childStep,processSteps.childStep.parentId,processSteps.childStep.id,processSteps.activeHeaderId,processSteps.childStep.activeHeaderId,processSteps.processStep,processSteps.childStep.processStep,processSteps.processType,processSteps.childStep.processType,processSteps.childStep.name,processSteps.childStep.status,processSteps.childStep.step,processSteps.childStep.childStep.id,processSteps.childStep.childStep.name,processSteps.childStep.childStep.step,processSteps.childStep.childStep.status"
	    })
	})
	public String getProcessesData(){
        if (produceTaskId != null) {
            List<ProcessStep> processSteps=produceTaskService.getProcessesData(produceTaskId);
            responseMap.put("processSteps", processSteps);
        }
        return SUCCESS;
	}
	/**
	 * 查找工序活动处理单的页面ID
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/searchAdjustPage", results = { @Result(type = JSON, params = {
			"root", "responseMap" }) })
	public String searchAdjustPage(){
		Long result = null;
		if (activeId != null) {
			result=produceTaskService.searchAdjustPage(activeId,processId);
		}
		responseMap.put("result", result);
		return SUCCESS;
	}
	@Autowired
    private ActiveChoseHandler handler;
	/**
	 * 活动调整之后，重新发起质检
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/toInspect", results = { @Result(type = JSON, params = {
			"root", "responseMap" }) })
	public String toInspect(){
        Map<String,Object> map = new HashMap<>();
		if (activeId != null) {
            map.put("activeId",activeId);
            map.put("activeType",activeType);
            WOMResult womResult = handler.choseProcfeedWay(DealsEnum.MES).addInspect(map);
            responseMap.put("result", womResult.getMsg());
        }
		return SUCCESS;
	}
	/**
     * 活动执行记录中查询投料明细
     * @return
     */
    @Action(value = "/WOM/produceTask/produceTask/getBatchingRecordByProcessAndActive", results = { @Result(type = JSON, params = {
            "root", "responseMap","excludes", "*", "includes", "chargeDetails,chargeDetails.taskActiExelog.taskProcessID.name,chargeDetails.taskActiExelog.activeName,chargeDetails.taskActiExelog.activeType.id,chargeDetails.taskActiExelog.activeType.value,chargeDetails.taskActiExelog.activeSource.id,chargeDetails.taskActiExelog.activeSource.value,chargeDetails.taskActiExelog.dataSource.id,chargeDetails.taskActiExelog.dataSource.value,chargeDetails.good.productCode,chargeDetails.good.productName,chargeDetails.batch,chargeDetails.actualUseNum,chargeDetails.good.productBaseUnit.name,chargeDetails.wareID.wareCode,chargeDetails.wareID.wareName,chargeDetails.placeSet.placeSetCode,chargeDetails.placeSet.placeSetName,chargeDetails.putinDate,chargeDetails.putinEndDate,chargeDetails.remark,chargeDetails.id,chargeDetails.version,chargeDetails.good.id,chargeDetails.wareID.id,chargeDetails.taskActiExelog.id,chargeDetails.placeSet.id,chargeDetails.taskObj.id,chargeDetails.putinStaff.name"
    })
    })
    public String getBatchingRecordByProcessAndActive(){
        if (activeId != null || processId != null) {
            List<WOMBatchChargeDetails> chargeDetails = produceTaskService.getBatchingRecordByProcessAndActive(activeId,processId);
            responseMap.put("chargeDetails", chargeDetails);
        }
        return SUCCESS;
    }

	/**
     * 活动执行记录中查询投料明细
     * @return
     */
    @Action(value = "/WOM/produceTask/produceTask/getBatchingRecordByActive", results = { @Result(type = JSON, params = {
            "root", "responseMap","excludes", "*", "includes", "chargeDetails,chargeDetails.taskActiExelog.taskProcessID.name,chargeDetails.taskActiExelog.activeName,chargeDetails.taskActiExelog.activeType.id,chargeDetails.taskActiExelog.activeType.value,chargeDetails.taskActiExelog.activeSource.id,chargeDetails.taskActiExelog.activeSource.value,chargeDetails.taskActiExelog.dataSource.id,chargeDetails.taskActiExelog.dataSource.value,chargeDetails.good.productCode,chargeDetails.good.productName,chargeDetails.batch,chargeDetails.actualUseNum,chargeDetails.good.productBaseUnit.name,chargeDetails.wareID.wareCode,chargeDetails.wareID.wareName,chargeDetails.placeSet.placeSetCode,chargeDetails.placeSet.placeSetName,chargeDetails.putinDate,chargeDetails.putinEndDate,chargeDetails.remark,chargeDetails.id,chargeDetails.version,chargeDetails.good.id,chargeDetails.wareID.id,chargeDetails.taskActiExelog.id,chargeDetails.placeSet.id,chargeDetails.taskObj.id,chargeDetails.putinStaff.name"
    })
    })
    public String getBatchingRecordByActive(){
        if (activeId != null) {
            List<WOMBatchChargeDetails> chargeDetails = produceTaskService.getBatchingRecordByActive(activeId);
            responseMap.put("chargeDetails", chargeDetails);
        }
        return SUCCESS;
    }
	/**
     * 根据指令单查找投料汇总
     * @return
     */
    @Action(value = "/WOM/produceTask/produceTask/getBatchingRecordByProduceTaskId", results = { @Result(type = JSON, params = {
            "root", "responseMap","excludes", "*", "includes", "chargeGather,chargeGather.good,chargeGather.totalUseNum,chargeGather.baseUnit,chargeGather.active,chargeGather.process" })
    })
    public String getBatchingRecordByProduceTaskId(){
        if (produceTaskId != null) {
            List<Map<String,Object>> map = produceTaskService.getBatchingRecordByProduceTaskId(produceTaskId);
            responseMap.put("chargeGather", map);
        }
        return SUCCESS;
    }
	/**
     * 根据活动查找请检单
     * @return
     */
    @Action(value = "/WOM/produceTask/produceTask/getInspectDetails", results = { @Result(type = JSON, params = {
            "root", "responseMap","excludes", "*", "includes", "inspects,inspects.QM_BUSINESS_TYPE,inspects.QUANTITY,inspects.INSPECT_DATE,inspects.BATCH_NUM,inspects.SITE_NAME,inspects.STAFF_NAME,inspects.PRODUCT_UNIT,inspects.PRODUCT_CODE,inspects.PRODUCT_NAME,inspects.DEPARTMENT_NAME,inspects.ACTIVE_NAME,inspects.REMARK,inspects.PART_CODE" })
    })
    public String getInspectDetails(){
        if (activeId != null) {
            List<Map<String,Object>> map = produceTaskService.getInspectDetails(activeId,activeType);
            responseMap.put("inspects", map);
        }
        return SUCCESS;
    }
	/**
	 * 根据批号寻找批次所有的操作记录
	 * @return
	 */
	@Action(value = "/WOM/produceTask/produceTask/getBatchInfo", results = { @Result(type = JSON, params = {
			"root", "responseMap","excludes", "*", "includes", "batchInfo,batchInfo.events.exeDate,batchInfo.events.exeStaff.name,batchInfo.events.doneNum,batchInfo.events.receiveDate,batchInfo.events.receiveStaff.name,batchInfo.events.ware.wareName,batchInfo.events.store.placeSetName,batchInfo.events.state,batchInfo.events.remark,batchInfo.events.QM_BUSINESS_TYPE,batchInfo.events.QUANTITY,batchInfo.events.INSPECT_DATE,batchInfo.events.REMARK,batchInfo.events.ACTIVE_NAME,batchInfo.events.DEPARTMENT_NAME,batchInfo.events.STAFF_NAME,batchInfo.events.SITE_NAME,batchInfo.events,batchInfo.product.productCode,batchInfo.product.productName,batchInfo.product.productCode,batchInfo.product.unitGroup.name,batchInfo.product.productSpecif,batchInfo.basicBaseVendor.vendorCode,batchInfo.basicBaseVendor.vendorName,batchInfo.basicBaseVendor.vendorIntroduce,batchInfo.basicBaseVendor.vendorMobile,batchInfo.basicBaseVendor.vendorPhone,batchInfo.basicBaseVendor.vendorShortName,batchInfo.basicBaseVendor.vendorAddress,batchInfo.basicBaseVendor.vendorEmail,batchInfo.taskReporting.taskID,batchInfo.taskReporting.taskID.actStartTime,batchInfo.taskReporting.taskID.actEndTime,batchInfo.taskReporting.reportDate," })
	})
	public String getBatchInfo(){
		if (batchNum != null) {
			BatchAnalyze batchInfo = produceTaskService.getBatchInfo(batchNum);
			responseMap.put("batchInfo", batchInfo);
		}
		return SUCCESS;
	}

 ////////////////////////////////////////////////////////////////////////////////////   
    /**
	 * 开始工单
	 * 
	 */                
    @Action(value = "/public/WOM/produceTask/produceTask/startBatch", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","ProductBatchNum,Flag,Message" }) })
	public String startBatch(){
		Map<String,Object> message =new HashMap<String, Object>();
		if(null!=taskId&&!"".equals(taskId)){
			message=produceTaskService.startBatchSync(productBatchNum, logid);
			responseMap.put("ProductBatchNum", message.get("productBatchNum"));
			responseMap.put("Flag", message.get("Flag"));
			responseMap.put("Message", message.get("Message"));
		}else{
			responseMap.put("ProductBatchNum", null);
	        responseMap.put("Flag", null);
	        responseMap.put("Message", null);
		}
        
		return SUCCESS;
	
	}
    
    /**
	 * 结束工单
	 * 
	 */                
    @Action(value = "/public/WOM/produceTask/produceTask/stopBatch", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","ProductBatchNum,Flag,Message" }) })
	public String stopBatch(){
		Map<String,Object> message =new HashMap<String, Object>();
		if(null!=productBatchNum&&!"".equals(productBatchNum)){
			message=produceTaskService.stopBatchSync(productBatchNum, logid);
			responseMap.put("ProductBatchNum", message.get("productBatchNum"));
			responseMap.put("Flag", message.get("Flag"));
			responseMap.put("Message", message.get("Message"));
		}else{
			responseMap.put("ProductBatchNum", null);
	        responseMap.put("Flag", null);
	        responseMap.put("Message", null);
		}
        
		return SUCCESS;
	}
    
    /**
	 * 中止工单
	 * 
	 */                
    @Action(value = "/public/WOM/produceTask/produceTask/pauseBatch", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","ProductBatchNum,Flag,Message" }) })
	public String pauseBatch() {
		Map<String, Object> message = new HashMap<String, Object>();
		if (null != productBatchNum && !"".equals(productBatchNum)) {
			message = produceTaskService.pauseBatchSync(productBatchNum, logid);
			responseMap.put("ProductBatchNum", message.get("productBatchNum"));
			responseMap.put("Flag", message.get("Flag"));
			responseMap.put("Message", message.get("Message"));
		} else {
			responseMap.put("ProductBatchNum", null);
			responseMap.put("Flag", null);
			responseMap.put("Message", null);
		}
		return SUCCESS;
	}
    
    /**
	 * 恢复工单
	 * 
	 */                
    @Action(value = "/public/WOM/produceTask/produceTask/resumeBatch", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","ProductBatchNum,Flag,Message" }) })
	public String resumeBatch(){
		Map<String,Object> message =new HashMap<String, Object>();
		if(null!=productBatchNum&&!"".equals(productBatchNum)){
			message=produceTaskService.resumeBatchSync(productBatchNum, logid);
			responseMap.put("ProductBatchNum", message.get("productBatchNum"));
			responseMap.put("Flag", message.get("Flag"));
			responseMap.put("Message", message.get("Message"));
		}else{
			responseMap.put("ProductBatchNum", null);
	        responseMap.put("Flag", null);
	        responseMap.put("Message", null);
		}
		return SUCCESS;
	}
    
    
    /**
	 * 废弃工单
	 * 
	 */                
    @Action(value = "/public/WOM/produceTask/produceTask/abortBatch", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","ProductBatchNum,Flag,Message" }) })
	public String abortBatch(){
		Map<String,Object> message =new HashMap<String, Object>();
		if(null!=productBatchNum&&!"".equals(productBatchNum)){
			message=produceTaskService.abortBatchSync(productBatchNum, logid);
			responseMap.put("ProductBatchNum", message.get("productBatchNum"));
			responseMap.put("Flag", message.get("Flag"));
			responseMap.put("Message", message.get("Message"));
		}else{
			responseMap.put("ProductBatchNum", null);
	        responseMap.put("Flag", null);
	        responseMap.put("Message", null);
		}
		return SUCCESS;
	}


    @Autowired
    private ActiveChoseHandler  choseHandler;


 

	/**
	 * 开始活动时检测开始顺序
	 *
	 */
	@Action(value = "/WOM/produceTask/produceTask/checkSort", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","result" }) })
	public String checkSort(){
		ProcedureReport activeProcessor = choseHandler.choseProcfeedWay(DealsEnum.MES);
        WOMResult result =  activeProcessor.checkSort(activeId);
        responseMap.put("result", result.getMsg());
		return SUCCESS;
	}
	private Long forluma;

	private Long factoryLineId;

    public Long getForluma() {
        return forluma;
    }

    public void setForluma(Long forluma) {
        this.forluma = forluma;
    }

    public Long getFactoryLineId() {
        return factoryLineId;
    }

    public void setFactoryLineId(Long factoryLineId) {
        this.factoryLineId = factoryLineId;
    }

    /**
	 * 开始活动时检测开始顺序
	 *
	 */
	@Action(value = "/WOM/produceTask/produceTask/getAutoFinishReporting", results = { @Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","result" }) })
	public String getAutoFinishReporting(){
        WOMResult result =  produceTaskService.getAutoFinishReporting(forluma,factoryLineId);
        if (result.getCode().equals(200)) {
            responseMap.put("result", result.getData());
        }else {
            throw new BAPException(result.getMsg());
        }
		return SUCCESS;
	}

	private String formulaCode;

	public String getFormulaCode() {
		return formulaCode;
	}

	public void setFormulaCode(String formulaCode) {
		this.formulaCode = formulaCode;
	}
	@Action(value = "/public/WOM/produceTask/produceTask/getFormulaId", results = {@Result(type = JSON, params = {
			"root", "responseMap"})})
	public String getFormulaId(){
		List formulas = produceTaskService.getFormulaIdByformulaCode(formulaCode);
		if (formulas.size()>0){
			responseMap.put("hasFormula", "1");//存在
			responseMap.put("formulaId", formulas.get(0));
		}else{
			responseMap.put("hasFormula", "0");//不存在
		}
		return SUCCESS;
	}
/* CUSTOM CODE END */
}