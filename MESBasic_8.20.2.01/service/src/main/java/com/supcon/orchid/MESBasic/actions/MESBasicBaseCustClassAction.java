package com.supcon.orchid.MESBasic.actions;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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
import com.supcon.orchid.utils.OrchidUtils;
import com.supcon.orchid.utils.Param;
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
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustClass;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustClassService;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.entities.Cookie;
import com.supcon.orchid.notification.NotificationService;
import com.supcon.orchid.orm.entities.ICookie;
import com.supcon.orchid.foundation.entities.Document;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.foundation.services.CookieService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.DocumentService;
import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.ec.services.BusinessCenterService;
import com.supcon.orchid.ec.services.CreatorService;
import com.supcon.orchid.ec.services.ConditionService;
import com.supcon.orchid.ec.services.ModelServiceFoundation;
import com.supcon.orchid.ec.services.PrintService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.entities.CustomerCondition;
import com.supcon.orchid.ec.entities.BusinessCenter;
import com.supcon.orchid.ec.entities.Model;
import com.supcon.orchid.ec.entities.Property;
import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.orm.enums.CompanyType;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BAPException.Code;
import com.supcon.orchid.services.ExportExcelAble;
import com.supcon.orchid.services.IUserFieldPermissionService;
import com.supcon.orchid.foundation.services.ImportService;
import com.supcon.orchid.services.Page;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.supcon.orchid.foundation.entities.UploadInfo;
import com.supcon.orchid.foundation.exceptions.ImportValidateException;
import com.supcon.orchid.foundation.exceptions.ImportSaveException;
 
/* CUSTOM CODE START(action,import,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class MESBasicBaseCustClassAction extends BAPEntityConfGenericActionSupport implements Preparable, ExportExcelAble<MESBasicBaseCustClass> {
	private static final long serialVersionUID = 1L;
	@Resource
	protected SystemCodeService systemCodeService;
	@Resource
	ViewServiceFoundation viewServiceFoundation;
	@Resource
	ConditionService conditionService;
	@Resource
	private MESBasicBaseCustClassService baseCustClassService;
	@Resource
	private CreatorService creatorService;
	@Resource
	private CookieService cookieService;
    @Resource
	private StaffService _staffService;
	@Resource
	private SessionFactory sessionFactory;
	private IUserFieldPermissionService userFieldPermissionService;
	
	@Resource
	private ImportService importService;
	@Resource
	private NotificationService notificationService;

	private Long id;
	private String exportFetchDataMethod;
	private String dealInfoGroup;
	private String ids;
	private String retJson;
	private String includes;
	private String callBackFuncName;
	private String condition;
	private MESBasicBaseCustClass baseCustClass;
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
	
	private String sortResult;
	
	private Boolean graduallyReject;
	
	
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
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/MESBasic/baseCustomer/baseCustClass/" + getFileName()));
		}else if("mainTemplate".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/MESBasic/baseCustomer/baseCustClass/" + getFileName()));
		}else if("mainError".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "error/MESBasic_1_baseCustomer_BaseCustClass" + File.separator + viewCode + File.separator + time + File.separator + getFileName()));
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
	private List<MESBasicBaseCustClass> baseCustClasss;
	
	public List<MESBasicBaseCustClass> getBaseCustClasss() {
		return baseCustClasss;
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

	private Page<MESBasicBaseCustClass> page;
	
	private Long tableInfoId;
	private Integer dealDefaulCount=50;
	
	private Boolean expandDealInof=true;
	
	 @Resource
	 private BusinessCenterService businessCenterService;
	 
	 @Resource
	 private ModelServiceFoundation modelServiceFoundation;
	 
	 @Resource
	 private ViewServiceFoundation ViewServiceFoundation;
	 
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
			baseCustClass = new MESBasicBaseCustClass();
		} else {
			if(id > 0){
				baseCustClass = baseCustClassService.getBaseCustClass(id, viewCode);
			}
		}
		if(null!=businessCenterCode){
			businessCenter=businessCenterService.getBusinessCenter(businessCenterCode);
		}
		
	}
	
	public Page<MESBasicBaseCustClass> getPage() {
		if (null == page) {
			page = new Page<MESBasicBaseCustClass>(1, (getIsMobile() ? 10 : 20));
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
	public MESBasicBaseCustClass getBaseCustClass() {
		return baseCustClass;
	}		

	public void setBaseCustClass(MESBasicBaseCustClass baseCustClass) {
		this.baseCustClass = baseCustClass;
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
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/get", results = { @Result(type = JSON_PLAIN, params = { "root", "retJson" }) })
	public String _get() throws Exception{
		if(id == null) {
			return SUCCESS;
		}
		retJson = baseCustClassService.getBaseCustClassAsJSON(id, includes);
		return SUCCESS;
	}
	/**
	 * 根据ID，返回大字段内容
	 * 
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/edit-extra-col")
	public String _editExtraCol() throws Exception{
		Struts2Utils.renderXml("");
	
		return null;
	}
	
	/**
	 * MESBasic.modelname.randon1436841787569
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
		public String baseCustClassReferenceCopy() throws Exception{
			MESBasicBaseCustClass oldBaseCustClass = null;
			if(isEditNew()){
				this.creatorInfo = creatorService.getCurrent();
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						bc.setUrl("");
						bc.setCount(0);
					}
				}
				oldBaseCustClass = new MESBasicBaseCustClass();
			}else{
			if(null!=entityCode){
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						//String url=businessCenterService.getBusinessUrl(bc,baseCustClass.getId().toString());
						String url = bc.getAssview().getUrl();
						int count=businessCenterService.getBusinessCount(bc, baseCustClass.getId());
						//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
						bc.setViewCode(bc.getAssview().getCode());
						bc.setUrl(url);
						bc.setCount(count);
					}
				}
				}
				oldBaseCustClass = baseCustClassService.getBaseCustClass(id);
			}
			
			
			baseCustClass = baseCustClassService.getBaseCustClass(refId);
			Model model = modelServiceFoundation.getModel("MESBasic_1_baseCustomer_BaseCustClass");
			List<Property> pros = modelServiceFoundation.findProperties(model);
			for(Property p : pros){
				if((p.getIsBussinessKey()!=null&&p.getIsBussinessKey())||(p.getIsInherent()!=null&&p.getIsInherent())){
					String setMethod = "set" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					String getMethod = "get" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					try{
						Method getValue = MESBasicBaseCustClass.class.getMethod(getMethod, null);
						Class returnType = getValue.getReturnType();
						Object gValue = getValue.invoke(oldBaseCustClass, null);
						Method setValue = MESBasicBaseCustClass.class.getMethod(setMethod, new Class[]{returnType});
						setValue.invoke(baseCustClass, gValue);
					}catch(Exception e){
						logger.debug(e.getMessage());
					}
				}
			}
			bapAfterCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "referenceCopy");
			return SUCCESS;
		}
	
	private String parseSqlCondition(String sql, List<Object> list){
		Pattern p = Pattern.compile("\\$\\{(.+?),(.+?)\\}");
		Matcher m =	p.matcher(sql);
		while(m.find()){
			String str = m.group();
			String value = request.getParameter(m.group(1));
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
	
	
	private void generateCustomerCondition(String viewCode){
		View v = viewServiceFoundation.getView(viewCode);
		if(v!= null && v.getIsShadow()!=null && v.getIsShadow()){
			View shadow = v.getShadowView();
			if(shadow != null){
				viewCode = shadow.getCode();
			}
		}
		CustomerCondition ccon = viewServiceFoundation.findCustomerConditionByViewCode(viewCode);
		if(ccon!=null && ccon.getSql()!=null && ccon.getSql().length()>0){
			String customerSql = ccon.getSql();
			List<Object> list = new ArrayList<Object>();
			customerSql = parseSqlCondition(customerSql, list);
			params.add(new Param("customerSql", customerSql));
			params.add(new Param("customerSqlValues", list));
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
						customerSql = parseSqlCondition(customerSql, list);
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
				if(null != advCondition.getValues() && !advCondition.getValues().isEmpty()) {
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
	
	@Override
	public int findFieldPermission(String modelCode, String propertyKey) {
		return userFieldPermissionService.findFieldPermission(modelCode, propertyKey, null);
	}	
	
	private String bap_validate_datagrids;
		
	public String getBap_validate_datagrids() {
		return bap_validate_datagrids;
	}
	
	// =============================================================================================
	private String operateType;
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	private void save(DataGridService dataGridService) throws Exception {
		if(null == baseCustClass.getId()) {
			responseMap.put("operate", "add");
		} else {
			responseMap.put("operate", "edit");
		}
		baseCustClassService.saveBaseCustClass(baseCustClass, dataGridService, viewCode);
		
		
		responseMap.put("dealSuccessFlag", true);
		responseMap.put("operateType", "save");
		responseMap.put("viewselect", viewselect);
	}
	@Actions({ 
	})
	public String submit() throws Exception{
		bapBeforeCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "submit");
		DataGridService dataGridService = null;
		
			save(dataGridService);
			responseMap.put("id", baseCustClass.getId());

		Map<String, Object> fileuploads = (Map<String, Object>) request.getAttribute("__orchid_fileuploads__");
		if(null == fileuploads){
			fileuploads = new HashMap<String, Object>();
		}
		fileuploads.put("linkId", baseCustClass.getId());
		bapAfterCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "submit");
		return SUCCESS;
	}
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/delete", results = { @Result(type = JSON, params = { "root", "responseMap" }) })
	public String delete() throws Exception {
		bapBeforeCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "delete");
		baseCustClassService.deleteBaseCustClass(ids);
		responseMap.put("dealSuccessFlag", true);
		responseMap.put("operateType", "delete");
		responseMap.put("operate", "delete");
		bapAfterCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "delete");
		return SUCCESS;
	}
	
	

	@Override
	public Page<MESBasicBaseCustClass> findExportDataInfos(Page<MESBasicBaseCustClass> page) {
		if(null != searchObjects && searchObjects.length > 0) {
			baseCustClassService.findBaseCustClasss(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode, searchObjects);
		} else {
			baseCustClassService.findBaseCustClasss(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode);
		}
		return getPage();
	}

	public boolean isEditNew(){
		//return null == this.baseCustClass || null == this.baseCustClass.getId();
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
	
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/attachment-init", interceptorRefs = { @InterceptorRef("fileUpload"), @InterceptorRef("orchidStack") }, results = { @Result(location = "list-attachment.ftl", type = FREEMARKER) })
	public String attachmentInit() throws Exception {
		bapBeforeCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "attachmentInit");
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
		bapAfterCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "attachmentInit");
		return SUCCESS;
	}
	
	/**
	 * excel导入页面
	 * @return
	 * @throws Exception
	 */
	@Action(value="/MESBasic/baseCustomer/baseCustClass/initImport",results={@Result(name="success",type=FREEMARKER,location="excelImport.ftl")})
	public String initImport() throws Exception{
		bapBeforeCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "initImport");
		return SUCCESS;
	}
	
	@Action(value="/MESBasic/baseCustomer/baseCustClass/initMainImport",results={@Result(name="success",type=FREEMARKER,location="mainImportDialog.ftl")})
	public String initMainImport() throws Exception{
		return SUCCESS;
	}
	
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/importxls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "response.ftl", type = FREEMARKER) })
	public String imports() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.MESBasic.services.MESBasicBaseCustClassService"
		};
		bapBeforeCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "imports");
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
				xlsResult = importService.imports(tid, dataFile, datagridCode, time, name[0], importServices);
				
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
		bapAfterCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "imports");
		return SUCCESS;
	}
	
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/importMainXls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "mainImportResponse.ftl", type = FREEMARKER) })
	public String importMainXls() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.MESBasic.services.MESBasicBaseCustClassService"
						, "com.supcon.orchid.MESBasic.services.MESBasicBaseCustomerService"       
		};
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
				xlsResult = importService.imports(viewCode, "MESBasic_1_baseCustomer_BaseCustClass", dataFile, time, name[0], isReplace, isIgnore, importServices);
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
		return SUCCESS;
	}
	
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/downLoad", results = { @Result(type = "stream", params = {
			"contentType", "application/excel", "inputName", "inputStream",
			"contentDisposition", 
  "attachment;filename=\"${fileName}\"", "bufferSize", "4096" }) })
	public String downLoadXls() throws Exception {
		bapBeforeCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "downLoadXls");
		return SUCCESS;
	}
	
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/templateDownLoad", results = { @Result(type = "stream", params = {
			"contentType", "application/excel", "inputName", "inputStream",
			"contentDisposition", 
  "attachment;filename=\"${fileName}\"", "bufferSize", "4096" }) })
	public String templateDownLoad() throws Exception {
		bapBeforeCustomMethod("MESBasic_1_baseCustomer_BaseCustClass", "templateDownLoad");
		return SUCCESS;
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

	@Action(value = "/MESBasic/baseCustomer/baseCustClass/loadXMLRefOrData", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String loadXMLRefOrData() throws Exception {
		String xmlRefernece = null, xmlData = null;
		MESBasicBaseCustClass baseCustClass = null;
		if(null != id) {
			baseCustClass = baseCustClassService.getBaseCustClass(id);
		}
		xmlRefernece = printService.buildPrintXmlRef(viewCode, baseCustClass, null, null, false, this);
		xmlData = printService.buildPrintXmlRef(viewCode, baseCustClass, null, null, true, this);
		printXmlInfo.put("xmlRefernece", xmlRefernece);
		printXmlInfo.put("xmlData", xmlData);
		return SUCCESS;
	}
	
	private Map<String, Object>  batchPrintXmlInfo;
	
	public void setBatchPrintXmlInfo(Map<String, Object> batchPrintXmlInfo){
		this.batchPrintXmlInfo = batchPrintXmlInfo;
	}
	
	public Map<String, Object> getBatchPrintXmlInfo(){
		return batchPrintXmlInfo;
	}
	
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/loadBatchXmlRefer",
			results = {@Result(name = SUCCESS, type = JSON, params = {"root", "batchPrintXmlInfo"})})
	public String loadBatchXmlRefer() throws Exception{
		batchPrintXmlInfo = new HashMap<String, Object>();
		String xmlRefer = printService.buildPrintXmlRef(viewCode, null, null, null, false, null);
		batchPrintXmlInfo.put("xmlRefer", xmlRefer);
		return SUCCESS;
	}
	
	@Action(value = "/MESBasic/baseCustomer/baseCustClass/loadBatchXmlRefAndData",
			results = {@Result(name = SUCCESS, type = JSON, params = {"root", "batchPrintXmlInfo", "excludes", "*", "includes", "xmlRefer,xmlDataList"})})
	public String loadBatchXmlRefAndData() throws Exception{
		batchPrintXmlInfo = new HashMap<String, Object>();
		String xmlRefer = printService.buildPrintXmlRef(viewCode, null, null, null, false, null);
		batchPrintXmlInfo.put("xmlRefer", xmlRefer);
		List<String> xmlDataList = new ArrayList<String>();
		if(ids != null && ids.length() > 0){
			String[] arrId = ids.split(",");
			for(String id : arrId){
				baseCustClass = baseCustClassService.getBaseCustClass(Integer.parseInt(id));
				if(baseCustClass != null){
					String xmlData = printService.buildPrintXmlRef(viewCode, baseCustClass, null, null, true, this);
					xmlDataList.add(xmlData);
				}
			}
		}
		batchPrintXmlInfo.put("xmlDataList", xmlDataList);
		return SUCCESS;
	}
	
	private void bapBeforeCustomMethod(String code, String methodName) throws Exception {
	/* CUSTOM CODE START(action,beforeMethods,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	private void bapAfterCustomMethod(String code, String methodName) throws Exception {
	/* CUSTOM CODE START(action,methods,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	/* CUSTOM CODE START(action,functions,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}