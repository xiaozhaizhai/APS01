package com.supcon.orchid.X6Basic.actions;
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
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.services.X6BasicSyncConfigsService;
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
/* CUSTOM CODE START(action,import,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class X6BasicSyncConfigsAction extends BAPEntityConfGenericActionSupport implements Preparable, ExportExcelAble<X6BasicSyncConfigs> {
	private static final long serialVersionUID = 1L;
	@Resource
	protected SystemCodeService systemCodeService;
	@Resource
	ViewServiceFoundation viewServiceFoundation;
	@Resource
	ConditionService conditionService;
	@Resource
	private X6BasicSyncConfigsService syncConfigsService;
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
	private X6BasicSyncConfigs syncConfigs;
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
	List<X6BasicSyncConfigs> queryResults = new ArrayList<X6BasicSyncConfigs>();
	
	//导入导出时常用的属性
	Map<String, Object> excelExportModels = new HashMap<String, Object>();//modelCode,Model
	Map<String, Object> excelProperty = new HashMap<String, Object>();//propertyCode,Property
	Map<String, Object> excelProperties = new HashMap<String, Object>();//modelCode,List<Property>
	Map<String, Object> excelRunningCustomPropertyCode = new HashMap<String, Object>();//modelCode,RunningCustomPropertyCode
	Map<String, Object> excelModelMappings = new HashMap<String, Object>();//modelCode,CustomPropertyModelMapping
	Map<String, Object> excelTotal = new HashMap<String, Object>();//上面五个变量的集合
	
	
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
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/X6Basic/syncConfig/syncConfigs/" + getFileName()));
		}else if("mainTemplate".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/X6Basic/syncConfig/syncConfigs/" + getFileName()));
		}else if("mainError".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "error/X6Basic_1.0_syncConfig_SyncConfigs" + File.separator + viewCode + File.separator + time + File.separator + getFileName()));
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


	public void setWorkFlowVarStatus(String workFlowVarStatus) {
		this.workFlowVarStatus = workFlowVarStatus;
	}

	private String workFlowMenuCode;
	
	public String getWorkFlowMenuCode() {
		return workFlowMenuCode;
	}

	public void setWorkFlowMenuCode(String workFlowMenuCode) {
		this.workFlowMenuCode = workFlowMenuCode;
	}
	private String entityCode;
	private List<X6BasicSyncConfigs> syncConfigss;
	
	public List<X6BasicSyncConfigs> getSyncConfigss() {
		return syncConfigss;
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

	private Page<X6BasicSyncConfigs> page;
	
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
			syncConfigs = new X6BasicSyncConfigs();
		} else {
			if(id > 0){
				syncConfigs = syncConfigsService.getSyncConfigs(id, viewCode);
			}
		}
		if(null!=businessCenterCode){
			businessCenter=businessCenterService.getBusinessCenter(businessCenterCode);
		}
	}
	
	public Page<X6BasicSyncConfigs> getPage() {
		if (null == page) {
			page = new Page<X6BasicSyncConfigs>(1, (getIsMobile() ? 10 : 20));
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
	public X6BasicSyncConfigs getSyncConfigs() {
		return syncConfigs;
	}		

	public void setSyncConfigs(X6BasicSyncConfigs syncConfigs) {
		this.syncConfigs = syncConfigs;
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
	@Action(value = "/X6Basic/syncConfig/syncConfigs/get", results = { @Result(type = JSON_PLAIN, params = { "root", "retJson" }) })
	public String _get() throws Exception{
		if(id == null) {
			return SUCCESS;
		}
		retJson = syncConfigsService.getSyncConfigsAsJSON(id, includes);
		return SUCCESS;
	}
	/**
	 * 根据ID，返回大字段内容
	 * 
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
	@Action(value = "/X6Basic/syncConfig/syncConfigs/edit-extra-col")
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
	 * X6Basic.modelname.radion1409053271008
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
		public String syncConfigsReferenceCopy() throws Exception{
			X6BasicSyncConfigs oldSyncConfigs = null;
			if(isEditNew()){
				this.creatorInfo = creatorService.getCurrent();
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						bc.setUrl("");
						bc.setCount(0);
					}
				}
				oldSyncConfigs = new X6BasicSyncConfigs();
			}else{
			if(null!=entityCode){
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						//String url=businessCenterService.getBusinessUrl(bc,syncConfigs.getId().toString());
						String url = bc.getAssview().getUrl();
						int count=businessCenterService.getBusinessCount(bc, syncConfigs.getId());
						//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
						bc.setViewCode(bc.getAssview().getCode());
						bc.setUrl(url);
						bc.setCount(count);
					}
				}
				}
				oldSyncConfigs = syncConfigsService.getSyncConfigs(id);
			}
			
			
			syncConfigs = syncConfigsService.getSyncConfigs(refId);
			Model model = modelServiceFoundation.getModel("X6Basic_1.0_syncConfig_SyncConfigs");
			List<Property> pros = modelServiceFoundation.findProperties(model);
			for(Property p : pros){
				if((p.getIsBussinessKey()!=null&&p.getIsBussinessKey())||(p.getIsInherent()!=null&&p.getIsInherent())){
					String setMethod = "set" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					String getMethod = "get" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					try{
						Method getValue = X6BasicSyncConfigs.class.getMethod(getMethod, null);
						Class returnType = getValue.getReturnType();
						Object gValue = getValue.invoke(oldSyncConfigs, null);
						Method setValue = X6BasicSyncConfigs.class.getMethod(setMethod, new Class[]{returnType});
						setValue.invoke(syncConfigs, gValue);
					}catch(Exception e){
						logger.debug(e.getMessage());
					}
				}
			}
			syncConfigs.setCreateDepartmentId(oldSyncConfigs.getCreateDepartmentId());
			syncConfigs.setCreatePositionId(oldSyncConfigs.getCreatePositionId());
			syncConfigs.setCreateStaffId(oldSyncConfigs.getCreateStaffId());
			syncConfigs.setOwnerDepartmentId(oldSyncConfigs.getOwnerDepartmentId());
			syncConfigs.setOwnerPositionId(oldSyncConfigs.getOwnerPositionId());
			syncConfigs.setOwnerStaffId(oldSyncConfigs.getOwnerStaffId());
			syncConfigs.setId(null);	//参考复制时，将上游id去掉
			bapAfterCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "referenceCopy");
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
		
		@Action(value = "/X6Basic/syncConfig/syncConfigs/edit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "edit.ftl") }),
		@Action(value = "/X6Basic/syncConfig/syncConfigs/editPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "editPrint.ftl")})
	})
	public String viewEdit() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View printView = viewServiceFoundation.getView(viewCode);
		String printName=request.getRequestURI().replaceAll("^.*/"+printView.getName(),"").replaceAll(".action$", "");
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=syncConfigsService.findValidateDatagrids(getDgClassMap(),viewCode);
		if (null != entityCode) {
			businessCenterList = businessCenterService.getBusinessCenters(entityCode);
		}
		if(refId !=null && refId > 0){
			return syncConfigsReferenceCopy();
		}
		if(isEditNew()){
			this.creatorInfo = creatorService.getCurrent();
			if (null != businessCenterList && !businessCenterList.isEmpty()) {
				for(BusinessCenter bc:businessCenterList){
					bc.setUrl("");
					bc.setCount(0);
				}
			}
		} else {
			syncConfigs = syncConfigsService.getSyncConfigs(this.syncConfigs.getId(), viewCode);
			if(null!=entityCode){
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						//String url=businessCenterService.getBusinessUrl(bc,syncConfigs.getId().toString());
						String url = bc.getAssview().getUrl();
						int count=businessCenterService.getBusinessCount(bc, syncConfigs.getId());
						//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
						bc.setViewCode(bc.getAssview().getCode());
						bc.setUrl(url);
						bc.setCount(count);
					}
				}
			}
			
		}
		bapAfterCustomMethod(viewCode, viewName);
		if(null != printName && !printName.equals("")){
			syncConfigsService.print(0);
		}
		return SUCCESS;
	}
	
	
	/**
	 *  查看视图公用主方法
	 */
	@Actions({
		
		@Action(value = "/X6Basic/syncConfig/syncConfigs/mainView",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "mainView.ftl") }),
		@Action(value = "/X6Basic/syncConfig/syncConfigs/mainViewPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "mainViewPrint.ftl")})
	})
	public String viewView() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View printView = viewServiceFoundation.getView(viewCode);
		String printName=request.getRequestURI().replaceAll("^.*/"+printView.getName(),"").replaceAll(".action$", "");
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=syncConfigsService.findValidateDatagrids(getDgClassMap(),viewCode);
		if(null!=entityCode){
			businessCenterList = businessCenterService.getBusinessCenters(entityCode);
			for(BusinessCenter bc:businessCenterList){
				//String url=businessCenterService.getBusinessUrl(bc,syncConfigs.getId().toString());
				String url = bc.getAssview().getUrl();
				int count=businessCenterService.getBusinessCount(bc, syncConfigs.getId());
				//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
				bc.setViewCode(bc.getAssview().getCode());
				bc.setUrl(url);
				bc.setCount(count);
			}
		}
		bapAfterCustomMethod(viewCode, viewName);
		if(null != printName && !printName.equals("")){
			syncConfigsService.print(0);
		}
		return SUCCESS;
	}
	
	/**
	 *  列表视图公用主方法
	 */
	@Actions({
		
		@Action(value = "/X6Basic/syncConfig/syncConfigs/list", results = { @Result(type = FREEMARKER, location = "list.ftl") })
	})
	public String viewList() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=syncConfigsService.findValidateDatagrids(getDgClassMap(),viewCode);
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
				list = syncConfigsService.mneCodeSearch(mneViewCode,showNumber,cross,this.params,refViewCode,currentViewCode,currentSqlType,realPermissionCode);
			} else {
				List<Param> searchStep2Param=new ArrayList<Param>();
				searchStep2Param.addAll(this.params);
				List<Param> searchStep3Param=new ArrayList<Param>();
				searchStep3Param.addAll(this.params);
				this.params.add(new Param("mneValues", searchContent));
				list = syncConfigsService.mneCodeSearch(mneViewCode,showNumber,cross,this.params,refViewCode,currentViewCode,currentSqlType,realPermissionCode);
				if(showNumber>list.size()){
					int showNumStep2=showNumber-list.size();
					searchStep2Param.add(new Param("mneValues", searchContent + "%"));
					searchStep2Param.add(new Param("notinValue", getMneIDs(list)));
					list.addAll(syncConfigsService.mneCodeSearch(mneViewCode,showNumStep2,cross,searchStep2Param,refViewCode,currentViewCode,currentSqlType,realPermissionCode));
					if(showNumber>list.size()){
						int showNumStep3=showNumber-list.size();
						searchStep3Param.add(new Param("mneValues", "%" + searchContent + "%"));
						searchStep3Param.add(new Param("notinValue", getMneIDs(list)));
						list.addAll(syncConfigsService.mneCodeSearch(mneViewCode,showNumStep3,cross,searchStep3Param,refViewCode,currentViewCode,currentSqlType,realPermissionCode));
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
						if(userFieldPermissionService.findFieldPermission("X6Basic_1.0_syncConfig_SyncConfigs", columns[j], null) != 0) {
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
	public String viewOther() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		bapBeforeCustomMethod(viewCode, viewName);
		bapAfterCustomMethod(viewCode, viewName);
		return SUCCESS;
	}
	
	
	
	
	/**
	 *  列表视图公用数据查询方法
	 */
	@Actions({
	
		@Action(value = "/X6Basic/syncConfig/syncConfigs/list-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.valid,result.cid,result.layRec,result.status,result.tableNo,result.syncEmailFlag,result.syncBBSFlag,result.syncPandionFlag,result.pending.processDescription,result.pending.processId,result.pending.deploymentId,result.pending.bulkDealFlag,result.pending.activityType,result.pending.activityName,result.pending.processKey,result.pending.processVersion,result.attrMap.*"})  
			
			,@Result(name="excel",type="excel",location="list-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
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
		params.add(new Param("\"syncConfigs\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		if(datagridCode!=null&&!"".equals(datagridCode)){
			bapBeforeCustomMethod(datagridCode, viewName+"Query");
		}else{
			bapBeforeCustomMethod(viewCode, viewName+"Query");
		}
		setFieldPermissionModelCode(listView.getAssModel().getCode());
		Map<String,String> oneToManyParams = new HashMap<String,String>();
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
					if (null != request.getParameter("fastQueryCond") && request.getParameter("fastQueryCond").trim().length() > 0) {
				params.add(new Param("fastQueryCond", request.getParameter("fastQueryCond"), Param.LIKE_ALL));
			}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			Param pm=businessCenterService.businessSql("\"syncConfigs\"",businessCenterCode, mainBusinessId);
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
			params.add(new Param("\"ownerDepartment\".LAY_REC", request.getParameter("department.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("position.layRec") && request.getParameter("position.layRec").trim().length() > 0) {
			params.add(new Param("\"ownerPosition\".LAY_REC", request.getParameter("position.layRec"), Param.EQUAL_LIKELEFT));	
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
			if(param.toString().indexOf("\"syncConfigs\".VALID = true") != -1){
				validPosition = i;
			}
			if(param.toString().indexOf("\"columnName\":\"VALID\"")>0||param.toString().indexOf("\"syncConfigs\".VALID = ?")>0){
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
			syncConfigsService.excelExport();
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
	
		@Action(value = "/X6Basic/syncConfig/syncConfigs/list-getRequireData", results = { @Result(type = JSON, params = { "root", "map" , "deep", "true"})})
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
		params.add(new Param("\"syncConfigs\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		bapBeforeCustomMethod(viewCode, viewName+"Query");
		setFieldPermissionModelCode(listView.getAssModel().getCode());
		Map<String,String> oneToManyParams = new HashMap<String,String>();
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
					if (null != request.getParameter("fastQueryCond") && request.getParameter("fastQueryCond").trim().length() > 0) {
				params.add(new Param("fastQueryCond", request.getParameter("fastQueryCond"), Param.LIKE_ALL));
			}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			Param pm=businessCenterService.businessSql("\"syncConfigs\"",businessCenterCode, mainBusinessId);
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
			params.add(new Param("\"ownerDepartment\".LAY_REC", request.getParameter("department.layRec"), Param.EQUAL_LIKELEFT));	
		}
		if (null != request.getParameter("position.layRec") && request.getParameter("position.layRec").trim().length() > 0) {
			params.add(new Param("\"ownerPosition\".LAY_REC", request.getParameter("position.layRec"), Param.EQUAL_LIKELEFT));	
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
			if(param.toString().indexOf("\"syncConfigs\".VALID = true") != -1){
				validPosition = i;
			}
			if(param.toString().indexOf("\"columnName\":\"VALID\"")>0||param.toString().indexOf("\"syncConfigs\".VALID = ?")>0){
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
			syncConfigsService.excelExport();
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
	@Action(value = "/X6Basic/syncConfig/syncConfigs/allTempleteDownload", results = { @Result(name="excel",type="excel",location="list-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
	})
	public String allTempleteDownload() throws Exception{
		useForImportFlag = true;
		isNeedSaveCookie = false;
		// 导出模板前先组织好主模型的queryconfig
		Model realmodel = modelServiceFoundation.getModel("X6Basic_1.0_syncConfig_SyncConfigs");
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
		syncConfigsService.findDataGridPage(dg,dgclass,getDgPage(),syncConfigs,"", null);
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
			if(syncConfigs.getId() != null && syncConfigs.getId() != -1){
				syncConfigs = syncConfigsService.getSyncConfigs(syncConfigs.getId());
			}
			syncConfigsService.findDataGridPage(dg,dgclass,getDgPage(),syncConfigs,searchCondition,params);
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
			syncConfigsService.excelExport();
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
		if(null == syncConfigs.getId()) {
			responseMap.put("operate", "add");
		} else {
			responseMap.put("operate", "edit");
		}
		SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
		syncConfigsService.saveSyncConfigs(syncConfigs,dgLists,dgDeletedIds,(Map<String, Object>)request.getAttribute("__orchid_ass_fileuploads__"),viewCode,null,signatureLog);
		
		
		responseMap.put("dealSuccessFlag", true);
		responseMap.put("operateType", "save");
		responseMap.put("viewselect", viewselect);
	}
	@Actions({
		@Action(value = "/X6Basic/syncConfig/syncConfigs/edit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/X6Basic/syncConfig/syncConfigs/mainView/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
	})
	public String submit() throws Exception{
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "submit");
		bap_validate_datagrids=syncConfigsService.findValidateDatagrids(getDgClassMap(),viewCode);
		save();
		responseMap.put("id", syncConfigs.getId());

		Map<String, Object> fileuploads = (Map<String, Object>) request.getAttribute("__orchid_fileuploads__");
		if(null == fileuploads){
			fileuploads = new HashMap<String, Object>();
		}
		fileuploads.put("linkId", syncConfigs.getId());
		bapAfterCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "submit");
		return SUCCESS;
	}

	@Action(value = "/X6Basic/syncConfig/syncConfigs/delete", results = { @Result(type = JSON, params = { "root", "responseMap" }) })
	public String delete() throws Exception {
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "delete");
		SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
		syncConfigsService.deleteSyncConfigs(ids,signatureLog);
		responseMap.put("dealSuccessFlag", true);
		responseMap.put("operateType", "delete");
		responseMap.put("operate", "delete");
		bapAfterCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "delete");
		return SUCCESS;
	}
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/restore", results = { @Result(type = JSON, params = { "root", "responseMap" }) })
	public String restore() throws Exception {
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "restore");
		syncConfigsService.restoreSyncConfigs(ids);
		responseMap.put("dealSuccessFlag", true);
		responseMap.put("operateType", "restore");
		responseMap.put("operate", "restore");
		bapAfterCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "restore");
		return SUCCESS;
	}	
	
	@Actions({
			@Action(value = "/X6Basic/syncConfig/syncConfigs/dealInfo-list", results = { @Result(name = "success", type = "json", params = { "root", "dealInfoData" }) })
			,@Action(value = "/X6Basic/syncConfig/syncConfigs/dealInfo-listGroup", results = { @Result(name = "success", type = "json", params = { "deep", "true", "root", "dealInfoDataMap" }) })
	})
	public String showDealInfoData() throws Exception {
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "showDealInfoData");
		if (null != tableInfoId) {
			int count=syncConfigsService.getDealInfoCount(tableInfoId);
			if(!getIsMobile() && count < dealDefaulCount && expandDealInof == true){
				expandDealInof=false;
			}
			if(groupByTask) {
				dealInfoDataMap = syncConfigsService.findDealInfosGroup(tableInfoId, expandDealInof);
				for(Map.Entry<String, List<Object[]>> entry : dealInfoDataMap.entrySet()) {
					for(Object[] map : entry.getValue()) {
						String activityName=(map[0]!=null)?map[0].toString():"";
						String transitionName=(map[5]!=null)?map[5].toString():"";
						map[0]=InternationalResource.get(activityName, getLocale().toString());
						map[5]=InternationalResource.get(transitionName, getLocale().toString());
					}
				}
			} else {
				dealInfoData = syncConfigsService.findDealInfos(tableInfoId, expandDealInof);
				for(Object[] map:dealInfoData){
					String activityName=(map[0]!=null)?map[0].toString():"";
					String transitionName=(map[5]!=null)?map[5].toString():"";
					map[0]=InternationalResource.get(activityName, getLocale().toString());
					map[5]=InternationalResource.get(transitionName, getLocale().toString());
				}
			}
		}  
		bapAfterCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "showDealInfoData");
		return SUCCESS;
	}	
	
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private FieldService fieldService;
	Integer findExportDataInfosCount = 1;//findExportDataInfos执行次数，导出时，只有第一次需要添加样式
	@Override
	public Page<X6BasicSyncConfigs> findExportDataInfos(Page<X6BasicSyncConfigs> page) {
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
					runningCustomPropertyCode = syncConfigsService.getRunningCustomProperties(view.getAssModel().getCode());//已启用的自定义字段
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
									//String assProperty = syncConfigsService.getAssProperty(p.getCode());	
									//String assModelCode = syncConfigsService.getPropertyModelCode(assProperty);
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
							//String assProperty = syncConfigsService.getAssProperty(p.getCode());	
							//String assModelCode = syncConfigsService.getPropertyModelCode(assProperty);
							//Model assModel = modelServiceFoundation.getModel(assModelCode);
							Model assModel = p.getAssociatedProperty().getModel();
							if(!queryConfig.contains("ownerStaff.code")){
								supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerStaffCode");
							}
							if(!queryConfig.contains("ownerStaff.name")){
								supplyConfig += generteStaffOrPositionXml(p, assModel, "ownerStaffName");
							}
						}else if( p.getName().equals("ownerPosition") && !p.getModel().getEntity().getIsBase() ){//用于导出时，流程表单导出拥有者岗位
							//String assProperty = syncConfigsService.getAssProperty(p.getCode());	
							//String assModelCode = syncConfigsService.getPropertyModelCode(assProperty);
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
			syncConfigsService.findSyncConfigss(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap, searchObjects);
		} else {
			syncConfigsService.findSyncConfigss(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
		}
		if(getPage().isExportFlag() && getPage().getResult() != null && getPage().getResult().size() > 0) {//主模型查询结果存到一个list中，用于辅模型的过滤
			List<X6BasicSyncConfigs> results = getPage().getResult(); 
			if(results != null && results.size()>0){
				for(X6BasicSyncConfigs result : results){
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
		//return null == this.syncConfigs || null == this.syncConfigs.getId();
		return null == this.id;
	}
	public CreatorInfo getCreatorInfo(){
		return this.creatorInfo;
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
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/attachment-init", interceptorRefs = { @InterceptorRef("fileUpload"), @InterceptorRef("orchidStack") }, results = { @Result(location = "list-attachment.ftl", type = FREEMARKER) })
	public String attachmentInit() throws Exception {
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "attachmentInit");
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
		bapAfterCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "attachmentInit");
		return SUCCESS;
	}
	
	/**
	 * excel导入页面
	 * @return
	 * @throws Exception
	 */
	@Action(value="/X6Basic/syncConfig/syncConfigs/initImport",results={@Result(name="success",type=FREEMARKER,location="excelImport.ftl")})
	public String initImport() throws Exception{
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "initImport");
		return SUCCESS;
	}
	
	@Action(value="/X6Basic/syncConfig/syncConfigs/initMainImport",results={@Result(name="success",type=FREEMARKER,location="mainImportDialog.ftl")})
	public String initMainImport() throws Exception{
		return SUCCESS;
	}
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/importxls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "response.ftl", type = FREEMARKER) })
	public String imports() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.X6Basic.services.X6BasicSyncConfigsService"
		};
		//过滤重复的Service
		List<Object> objects = new ArrayList<Object>();
		for (int i=0; i<importServices.length; i++) { 
			if(!objects.contains(importServices[i])){
				objects.add(importServices[i]);  
			}
        } 
        
        List<CustomPropertyModelMapping> list = modelServiceFoundation.getCustomPropertiesWithType("X6Basic_1.0_syncConfig", DbColumnType.OBJECT);
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
        
		List<Model> models = modelServiceFoundation.getModels("X6Basic_1.0_syncConfig");
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
        
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "imports");
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
		bapAfterCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "imports");
		return SUCCESS;
	}
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/importMainXls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "mainImportResponse.ftl", type = FREEMARKER) })
	public String importMainXls() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.X6Basic.services.X6BasicSyncConfigsService"
						, "com.supcon.orchid.foundation.services.DepartmentService"       
						, "com.supcon.orchid.foundation.services.PositionService"       
						, "com.supcon.orchid.foundation.services.StaffService"       
		};
		
		//过滤重复的Service
		List<Object> objects = new ArrayList<Object>();
		for (int i=0; i<importServices.length; i++) { 
			if(!objects.contains(importServices[i])){
				objects.add(importServices[i]);  
			}
        }
        
        List<CustomPropertyModelMapping> list = modelServiceFoundation.getCustomPropertiesWithType("X6Basic_1.0_syncConfig", DbColumnType.OBJECT);
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
		List<Model> models = modelServiceFoundation.getModels("X6Basic_1.0_syncConfig");
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
				//xlsResult = importService.imports(viewCode, "X6Basic_1.0_syncConfig_SyncConfigs", dataFile, time, name[0], isReplace, isIgnore, fileType, importServices);
				SignatureLog signatureLog=(SignatureLog)request.getAttribute("signatureLog");
				xlsResult = importService.batchImports(viewCode, "X6Basic_1.0_syncConfig_SyncConfigs", dataFile, time, name[0], isReplace, isIgnore, isBatch, fileType, signatureLog,newService);
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
	
	
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/downLoad",  results = { 
		@Result(name="templateExcel",type="templateExcel",location="${fileName}", params = { "root", "templateRelatedModelCode", "defaultAmount", "50000", "defaultSize", "1000" }),
		@Result(type = "stream", params = {"contentType", "application/excel", "inputName", "inputStream","contentDisposition", "attachment;filename=\"${fileName}\"", "bufferSize", "4096" }) 
		})
	public String downLoadXls() throws Exception {
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "downLoadXls");
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
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/templateDownLoad",  results = { @Result(name="templateExcel",type="templateExcel",location="${fileName}", params = { "root", "templateRelatedModelCode", "defaultAmount", "50000", "defaultSize", "1000" }) })
	public String templateDownLoad() throws Exception {
		templateRelatedModelCode="X6Basic_1.0_syncConfig_SyncConfigs";
		this.customPropData = findCustomPropData(templateRelatedModelCode,true);
		bapBeforeCustomMethod("X6Basic_1.0_syncConfig_SyncConfigs", "templateDownLoad");
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

	@Action(value = "/X6Basic/syncConfig/syncConfigs/loadXMLRefOrData", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String loadXMLRefOrData() throws Exception {
		String xmlRefernece = null, xmlData = null;
		
		X6BasicSyncConfigs syncConfigs = null;
		if(null != id) {
			syncConfigs = syncConfigsService.getSyncConfigs(id);
		}
		String templateCode = request.getParameter("templateCode");
		SignatureLog signatureLog = (SignatureLog)request.getAttribute("signatureLog");
		OperationAuditLog _auditLog = new OperationAuditLog();
		_auditLog.setUuid(UUIDUtil.getUUID());
		_auditLog.setRoot(_auditLog.getUuid());
		_auditLog.setLayRec(_auditLog.getUuid());
		_auditLog.setLayNo(1);
		_auditLog.setColumnStringB(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
		_auditLog.setColumnStringA(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
		_auditLog.setColumnStringC(syncConfigs.getId().toString());
		_auditLog.setColumnStringD(X6BasicSyncConfigs.MODEL_CODE);
		_auditLog.setColumnLong(0L);
		_auditLog.setCid(OrchidUtils.getCurrentCompanyId());
		_auditLog.set_code(_auditLog.getUuid());
		_auditLog.setIsParent(false);
		_auditLog.set_parentCode("-1");
		_auditLog.setModule("X6Basic");
		_auditLog.setEntity("X6Basic_1.0_syncConfig");
		_auditLog.setMethodName("loadXMLRefOrData");
		_auditLog.setClasspath("com.supcon.orchid.X6Basic.actions.X6BasicSyncConfigsAction");
		_auditLog.setOperationDesc("打印");
		_auditLog.setOperType("8");
		_auditLog.setLoginIp(OrchidUtils.getLoginIP());
		_auditLog.setUserId(OrchidUtils.getCurrentUserId().toString());
		_auditLog.setCreateDate(new Date());
		// 获取打印模板信息
		PrintTemplate printTemplate = printService.getRuntimePrintTemplateByCode(templateCode);
		// 获取打印插件XML
		xmlRefernece = printService.getPrintXmlRef(printTemplate, syncConfigs,  null, viewCode, false);
		// 获取打印插件XML对应的数据信息
		if(null != signatureLog){
			signatureLog.setOperateLogUuid(_auditLog.getUuid());
		}
		xmlData = printService.getPrintXmlRef(printTemplate, syncConfigs,  null, viewCode, true,signatureLog);
		
		printXmlInfo.put("xmlRefernece", xmlRefernece);
		printXmlInfo.put("xmlData", xmlData);
		String recordFile=printService.recordPrintOnServer(printTemplate.getTemplate(),xmlRefernece,xmlData,printTemplate,viewCode,syncConfigs);
		printService.savePrintDataAuditLog(printTemplate);
		dataAuditLogService.saveOperationAuditLog(_auditLog);
		PrintRecordLog printlog=new PrintRecordLog();
		printlog.setUuid(UUIDUtil.getUUID());
		printlog.setCid(OrchidUtils.getCurrentCompanyId());
		printlog.setCreateDate(new Date());
		printlog.setEntity("X6Basic_1.0_syncConfig");
		printlog.setFilePath(recordFile);
		printlog.setLoginIp(OrchidUtils.getLoginIP());
		printlog.setOperationAuditLog(_auditLog);
		printlog.setUserId(OrchidUtils.getCurrentUserId());
		printlog.setBusinessId(syncConfigs.getId());
		printlog.setBussinessKey(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
		printlog.setMainDisplay(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
		dataAuditLogService.savePrintRecordLog(printlog);
		return SUCCESS;	
	}
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/printOnServer", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String printOnServer() throws Exception {
		X6BasicSyncConfigs syncConfigs = null;
		if(null != id) {
			syncConfigs = syncConfigsService.getSyncConfigs(id);
		}
		String templateCode = request.getParameter("templateCode");
		SignatureLog signatureLog = (SignatureLog)request.getAttribute("signatureLog");
		String pdfFileName=printService.printOnServer(syncConfigs,templateCode,viewCode, null,signatureLog);
		printXmlInfo.put("pdfFileName", pdfFileName);
		return SUCCESS;
	}
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/batchPrintOnServer", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String batchPrintOnServer() throws Exception {
		List<Object> objs = new ArrayList<Object>();
		if(ids != null && ids.length() > 0){
			String[] arrId = ids.split(",");
			for (int i = 0; i < arrId.length; i++) {
				objs.add(syncConfigsService.getSyncConfigs(Long.parseLong(arrId[i])));
			}
		}
		String templateCode = request.getParameter("templateCode");
		SignatureLog signatureLog = (SignatureLog)request.getAttribute("signatureLog");
		String pdfFileName=printService.batchPrintOnServer(objs,templateCode,viewCode, null,signatureLog);
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
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/loadBatchXmlRefer",
			results = {@Result(name = SUCCESS, type = JSON, params = {"root", "batchPrintXmlInfo"})})
	public String loadBatchXmlRefer() throws Exception{
		batchPrintXmlInfo = new HashMap<String, Object>();
		String xmlRefer = printService.buildPrintXmlRef(viewCode, null, null, null, false, null);
		batchPrintXmlInfo.put("xmlRefer", xmlRefer);
		return SUCCESS;
	}
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/loadBatchXmlRefAndData",
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
		String xmlRefer = printService.getPrintXmlRef(printTemplate, syncConfigs,  null, viewCode, false);
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
			_auditLog.setColumnStringD(X6BasicSyncConfigs.MODEL_CODE);
			_auditLog.setColumnLong(0L);
			_auditLog.setCid(OrchidUtils.getCurrentCompanyId());
			_auditLog.set_code(_auditLog.getUuid());
			_auditLog.setIsParent(false);
			_auditLog.set_parentCode("-1");
			_auditLog.setModule("X6Basic");
			_auditLog.setEntity("X6Basic_1.0_syncConfig");
			_auditLog.setMethodName("loadXMLRefOrData");
			_auditLog.setClasspath("com.supcon.orchid.X6Basic.actions.X6BasicSyncConfigsAction");
			_auditLog.setOperationDesc("批量打印，共打印记录" + arrId.length + "条");
			_auditLog.setOperType("9");
			_auditLog.setLoginIp(OrchidUtils.getLoginIP());
			_auditLog.setUserId(OrchidUtils.getCurrentUserId().toString());
			_auditLog.setCreateDate(new Date());
			List<PrintRecordLog> prList=new ArrayList<PrintRecordLog>();
			for (int i = 0; i < arrId.length; i++) {
				syncConfigs = syncConfigsService.getSyncConfigs(Long.parseLong(arrId[i]));
				if(null != syncConfigs){
					if(!com.supcon.orchid.utils.StringUtils.isEmpty(_auditLog.getColumnStringA())){
						_auditLog.setColumnStringA(_auditLog.getColumnStringA() + (null == syncConfigs.getId() ? "" : "," + syncConfigs.getId().toString()));
					} else {
						_auditLog.setColumnStringA(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
					}
					if(!com.supcon.orchid.utils.StringUtils.isEmpty(_auditLog.getColumnStringB())){
						_auditLog.setColumnStringB(_auditLog.getColumnStringB() + (null == syncConfigs.getId() ? "" : "," + syncConfigs.getId().toString()));
					} else {
						_auditLog.setColumnStringB(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
					}
					if(!com.supcon.orchid.utils.StringUtils.isEmpty(_auditLog.getColumnStringC())){
						_auditLog.setColumnStringC(_auditLog.getColumnStringC() + (null == syncConfigs.getId() ? "" : "," + syncConfigs.getId().toString()));
					} else {
						_auditLog.setColumnStringC(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
					}
					if(tableInfoIds != null && tableInfoIds.length > 0){
						tableInfoId = Long.parseLong(tableInfoIds[i]);
					}
					// 获取打印插件XML对应的数据信息
					String xmlData = printService.getPrintXmlRef(printTemplate, syncConfigs,printViewModel, null, true,false,signatureLog);
					xmlDataList.add(xmlData);
					String recordFile=printService.recordPrintOnServer(printTemplate.getTemplate(),xmlRefer,xmlData,printTemplate,viewCode,syncConfigs);
					PrintRecordLog printlog=new PrintRecordLog();
					printlog.setUuid(UUIDUtil.getUUID());
					printlog.setCid(OrchidUtils.getCurrentCompanyId());
					printlog.setCreateDate(new Date());
					printlog.setEntity("X6Basic_1.0_syncConfig");
					printlog.setFilePath(recordFile);
					printlog.setLoginIp(OrchidUtils.getLoginIP());
					printlog.setOperationAuditLog(_auditLog);
					printlog.setUserId(OrchidUtils.getCurrentUserId());
					printlog.setBusinessId(syncConfigs.getId());
					printlog.setMainDisplay(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
					printlog.setBussinessKey(null == syncConfigs.getId() ? "" : syncConfigs.getId().toString());
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
		//syncConfigsService.print(1);
		printService.savePrintDataAuditLog(printTemplate);
		return SUCCESS;
	}
	
	@Resource
	private EchartsDataService echartsDataService;
	private String echartsCode;
	private EchartsData echartsData;
	
	@Action(value = "/X6Basic/syncConfig/syncConfigs/echartsData", results = { @Result(name = "success", type = JSON, params = { "root", "echartsData",
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
	public Page<X6BasicSyncConfigs> findExportPageInfos(Page<X6BasicSyncConfigs> page,Map<String,String> model,Integer count) throws Exception {		
		Boolean assHasNoBussinessKey = false;//查看该模型是否有业务主键
		String visualIdCode = null;
		String language = getCurrentUser().getLanguage();
		Boolean assRefModelHasNoBussinessKey = false;//该模型引用的模型是否有业务主键
		List<Map<String,String>> refs = new ArrayList<Map<String,String>>();//引用模型的信息
		
		int ogSqlType = currentSqlType;
		currentSqlType = Sql.TYPE_LIST_QUERY;
		String auxiliaryViewCode = "X6Basic_1.0_syncConfig" + "_" + model.get("viewName");	
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
       		runningCustomPropertyCode = syncConfigsService.getRunningCustomProperties(model.get("modelCode"));//已启用的自定义字段
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
		
		Object[] objs = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid." + "X6Basic" + ".services." + fullModelName + "Service"};
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
				for(X6BasicSyncConfigs queryResult : queryResults){
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
								for(X6BasicSyncConfigs queryResult : queryResults){
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
						paramMain = syncConfigsService.generateParamExcelSql(params, Sql.TYPE_LIST_QUERY, layoutViewCode);
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
		List<Model> models = modelServiceFoundation.getModels("X6Basic_1.0_syncConfig");
		List<Map<String,String>> objs = new ArrayList<Map<String,String>>();
		if(models.size()>0){
			for(Model model : models){
				if(!model.getIsMain()){
				Map<String,String> m = new HashMap<String, String>();
				m.put("modelName", model.getModelName());
				m.put("modelCode", model.getCode());
				m.put("entityCode", model.getEntity().getCode());
				m.put("name", InternationalResource.get(model.getName(), getCurrentUser().getLanguage()));		
				String viewName = syncConfigsService.getViewName(model.getCode());
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
		List<Model> models = modelServiceFoundation.getModels("X6Basic_1.0_syncConfig");
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
				String viewName = syncConfigsService.getViewName(model.getCode());
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
		//Model model = modelServiceFoundation.getModel("X6Basic_1.0_syncConfig_SyncConfigs");
		Model model= null;
		if(excelExportModels != null && excelExportModels.get("X6Basic_1.0_syncConfig_SyncConfigs")!=null  ){
			model = (Model) excelExportModels.get("X6Basic_1.0_syncConfig_SyncConfigs");
		}else{
			model = modelServiceFoundation.getModel("X6Basic_1.0_syncConfig_SyncConfigs");
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
			List<String> values = syncConfigsService.getSystemCodeFullPathNameByEntityCode(scEntityCode);
			
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
	/* CUSTOM CODE START(action,beforeMethods,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void bapAfterCustomMethod(String code, String methodName) throws Exception {
	/* CUSTOM CODE START(action,methods,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	/* CUSTOM CODE START(action,functions,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}