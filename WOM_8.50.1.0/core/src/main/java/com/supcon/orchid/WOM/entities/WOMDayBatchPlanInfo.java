package com.supcon.orchid.WOM.entities;

import javax.persistence.Table;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.Column;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import com.supcon.orchid.annotation.BAPEntity;
import javax.persistence.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Where;
import com.supcon.orchid.audit.annotation.DataAudit;
import com.supcon.orchid.orm.entities.IAuditEntity;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.ws.adapter.DateAdapter;
import com.supcon.orchid.foundation.adapter.BAPAdapter;
import com.supcon.orchid.foundation.adapter.DocumentAdaptor;
import com.supcon.orchid.orm.entities.ICompany;
import com.supcon.orchid.orm.entities.ICId;
import com.supcon.orchid.annotation.BAPCustomComponent;
import com.supcon.orchid.annotation.BAPIsMainDisplay;
import com.supcon.orchid.annotation.BAPIsMneCode;
import com.supcon.orchid.annotation.BAPModelCode;
import com.supcon.orchid.annotation.BAPPicture;
import com.supcon.orchid.annotation.BAPSystemCodeMultable;
import com.supcon.orchid.annotation.BAPSeniorSystemCode;
import com.supcon.orchid.orm.entities.jaxb.BAPFoundationAdapter;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfoSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产计划.
 * 天计划与批计划参照
 */
@javax.persistence.Entity(name=WOMDayBatchPlanInfo.JPA_NAME)
@Table(name = WOMDayBatchPlanInfo.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_producePlanRef")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo")
@AttributeOverrides({
		@AttributeOverride(name="createDepartmentId", column=@Column(name = "CREATE_DEPARTMENT_ID")),
		@AttributeOverride(name="createPositionId", column=@Column(name = "CREATE_POSITION_ID")),
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectiveState", column=@Column(name = "EFFECTIVE_STATE")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="groupId", column=@Column(name = "GROUP_ID")),
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="positionLayRec", column=@Column(name = "POSITION_LAY_REC")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="tableNo", column=@Column(name = "TABLE_NO")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMDayBatchPlanInfoConvertor.class})
public class WOMDayBatchPlanInfo extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_producePlanRef";
	public static final String MODEL_CODE = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "ppm_day_plan_infos";
	public static final String JPA_NAME = "WOMDayBatchPlanInfo";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planDate ; // 日期


		private String planType ; // 计划类型


		private String remark ; // 备注
	private Department reportDeptID;
	private Staff reportStaffID;
	
	private List<WOMDayBatchPlanParts> dayBatchPlanPartsList;
	
	public void setDayBatchPlanPartsList(List<WOMDayBatchPlanParts> dayBatchPlanPartsList){
		this.dayBatchPlanPartsList = dayBatchPlanPartsList;
	}
	@Transient
	public List<WOMDayBatchPlanParts> getDayBatchPlanPartsList(){
		return dayBatchPlanPartsList;
	}
	
	private Document document;
	
	private String bapAttachmentInfo;
	
	@javax.persistence.Transient
	@XmlJavaTypeAdapter(DocumentAdaptor.class)
	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	@javax.persistence.Transient
	public String getBapAttachmentInfo() {
		return bapAttachmentInfo;
	}

	public void setBapAttachmentInfo(String bapAttachmentInfo) {
		this.bapAttachmentInfo = bapAttachmentInfo;
	}
	
	@XmlTransient
	private WorkFlowVar workFlowVar;

	public void setWorkFlowVar(WorkFlowVar workFlowVar) {
		this.workFlowVar = workFlowVar;
	}

	@javax.persistence.Transient
	@XmlTransient
	public WorkFlowVar getWorkFlowVar() {
		return workFlowVar;
	}

	private Pending pending;
	@javax.persistence.Transient
	public Pending getPending() {
		return pending;
	}
	
	@Index(name="IDX_DAYBATCHPLANINF_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	/**
	 * 获取日期.
	 * 
	 * @return 日期
	 */
	@Column(nullable=true

		,name="PLAN_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getPlanDate() {
        return planDate;
    }
	/**
	 * 设置日期.
	 * @param planDate 日期
	 */
    public void setPlanDate(java.util.Date planDate) {
        this.planDate = planDate;
    }
	/**
	 * 获取计划类型.
	 * 
	 * @return 计划类型
	 */
	@Column(nullable=true

		,length = 256
		,name="PLAN_TYPE"
	)
    public String getPlanType() {
        return planType;
    }
	/**
	 * 设置计划类型.
	 * @param planType 计划类型
	 */
    public void setPlanType(String planType) {
        this.planType = planType;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
		,name="REMARK"
	)
    public String getRemark() {
        return remark;
    }
	/**
	 * 设置备注.
	 * @param remark 备注
	 */
    public void setRemark(String remark) {
        this.remark = remark;
    }
	@OneToOne
	@JoinColumn(name = "REPORT_DEPTID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getReportDeptID() {
        return reportDeptID;
    }
    public void setReportDeptID(Department reportDeptID) {
        this.reportDeptID = reportDeptID;
    }
	@OneToOne
	@JoinColumn(name = "REPORT_STAFFID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getReportStaffID() {
        return reportStaffID;
    }
    public void setReportStaffID(Staff reportStaffID) {
        this.reportStaffID = reportStaffID;
    }
	
	
	protected String _getEntityName() {
		return WOMDayBatchPlanInfo.class.getName();
	}
	
	
	private ICompany company;
	
	@Override
	@OneToOne(fetch=FetchType.EAGER, targetEntity=Company.class, optional=true)
    @JoinColumn(name=ICId.P_CID, insertable=false, updatable=false)
    @Fetch(FetchMode.SELECT)
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	public ICompany getCompany() {
		return this.company;
	}
	
	@Override
	public void setCompany(ICompany company) {
		this.company =company;
	}
	private String dayPlanInfoFactoryCodeDeleteIds;
	private String dayPlanInfoFactoryCodeAddIds;
	private String dayPlanInfoFactoryCodemultiselectIDs;
	private String dayPlanInfoFactoryCodemultiselectNames;

	@javax.persistence.Transient
	public String getDayPlanInfoFactoryCodeDeleteIds(){
		return this.dayPlanInfoFactoryCodeDeleteIds;
	}

	public void setDayPlanInfoFactoryCodeDeleteIds(String deleteIds){
		this.dayPlanInfoFactoryCodeDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoFactoryCodemultiselectIDs(){
		return this.dayPlanInfoFactoryCodemultiselectIDs;
	}

	public void setDayPlanInfoFactoryCodemultiselectIDs(String multiselectIDs){
		this.dayPlanInfoFactoryCodemultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoFactoryCodemultiselectNames(){
		return this.dayPlanInfoFactoryCodemultiselectNames;
	}

	public void setDayPlanInfoFactoryCodemultiselectNames(String multiselectNames){
		this.dayPlanInfoFactoryCodemultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoFactoryCodeAddIds(){
		return this.dayPlanInfoFactoryCodeAddIds;
	}

	public void setDayPlanInfoFactoryCodeAddIds(String addIds){
		this.dayPlanInfoFactoryCodeAddIds = addIds;
	}
	private String dayPlanInfoIdDeleteIds;
	private String dayPlanInfoIdAddIds;
	private String dayPlanInfoIdmultiselectIDs;
	private String dayPlanInfoIdmultiselectNames;

	@javax.persistence.Transient
	public String getDayPlanInfoIdDeleteIds(){
		return this.dayPlanInfoIdDeleteIds;
	}

	public void setDayPlanInfoIdDeleteIds(String deleteIds){
		this.dayPlanInfoIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoIdmultiselectIDs(){
		return this.dayPlanInfoIdmultiselectIDs;
	}

	public void setDayPlanInfoIdmultiselectIDs(String multiselectIDs){
		this.dayPlanInfoIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoIdmultiselectNames(){
		return this.dayPlanInfoIdmultiselectNames;
	}

	public void setDayPlanInfoIdmultiselectNames(String multiselectNames){
		this.dayPlanInfoIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoIdAddIds(){
		return this.dayPlanInfoIdAddIds;
	}

	public void setDayPlanInfoIdAddIds(String addIds){
		this.dayPlanInfoIdAddIds = addIds;
	}
	private String dayPlanInfoManudeptIdDeleteIds;
	private String dayPlanInfoManudeptIdAddIds;
	private String dayPlanInfoManudeptIdmultiselectIDs;
	private String dayPlanInfoManudeptIdmultiselectNames;

	@javax.persistence.Transient
	public String getDayPlanInfoManudeptIdDeleteIds(){
		return this.dayPlanInfoManudeptIdDeleteIds;
	}

	public void setDayPlanInfoManudeptIdDeleteIds(String deleteIds){
		this.dayPlanInfoManudeptIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoManudeptIdmultiselectIDs(){
		return this.dayPlanInfoManudeptIdmultiselectIDs;
	}

	public void setDayPlanInfoManudeptIdmultiselectIDs(String multiselectIDs){
		this.dayPlanInfoManudeptIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoManudeptIdmultiselectNames(){
		return this.dayPlanInfoManudeptIdmultiselectNames;
	}

	public void setDayPlanInfoManudeptIdmultiselectNames(String multiselectNames){
		this.dayPlanInfoManudeptIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoManudeptIdAddIds(){
		return this.dayPlanInfoManudeptIdAddIds;
	}

	public void setDayPlanInfoManudeptIdAddIds(String addIds){
		this.dayPlanInfoManudeptIdAddIds = addIds;
	}
	private String dayPlanInfoProductIdDeleteIds;
	private String dayPlanInfoProductIdAddIds;
	private String dayPlanInfoProductIdmultiselectIDs;
	private String dayPlanInfoProductIdmultiselectNames;

	@javax.persistence.Transient
	public String getDayPlanInfoProductIdDeleteIds(){
		return this.dayPlanInfoProductIdDeleteIds;
	}

	public void setDayPlanInfoProductIdDeleteIds(String deleteIds){
		this.dayPlanInfoProductIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoProductIdmultiselectIDs(){
		return this.dayPlanInfoProductIdmultiselectIDs;
	}

	public void setDayPlanInfoProductIdmultiselectIDs(String multiselectIDs){
		this.dayPlanInfoProductIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoProductIdmultiselectNames(){
		return this.dayPlanInfoProductIdmultiselectNames;
	}

	public void setDayPlanInfoProductIdmultiselectNames(String multiselectNames){
		this.dayPlanInfoProductIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoProductIdAddIds(){
		return this.dayPlanInfoProductIdAddIds;
	}

	public void setDayPlanInfoProductIdAddIds(String addIds){
		this.dayPlanInfoProductIdAddIds = addIds;
	}
	private String dayPlanInfoFormularIDDeleteIds;
	private String dayPlanInfoFormularIDAddIds;
	private String dayPlanInfoFormularIDmultiselectIDs;
	private String dayPlanInfoFormularIDmultiselectNames;

	@javax.persistence.Transient
	public String getDayPlanInfoFormularIDDeleteIds(){
		return this.dayPlanInfoFormularIDDeleteIds;
	}

	public void setDayPlanInfoFormularIDDeleteIds(String deleteIds){
		this.dayPlanInfoFormularIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoFormularIDmultiselectIDs(){
		return this.dayPlanInfoFormularIDmultiselectIDs;
	}

	public void setDayPlanInfoFormularIDmultiselectIDs(String multiselectIDs){
		this.dayPlanInfoFormularIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoFormularIDmultiselectNames(){
		return this.dayPlanInfoFormularIDmultiselectNames;
	}

	public void setDayPlanInfoFormularIDmultiselectNames(String multiselectNames){
		this.dayPlanInfoFormularIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getDayPlanInfoFormularIDAddIds(){
		return this.dayPlanInfoFormularIDAddIds;
	}

	public void setDayPlanInfoFormularIDAddIds(String addIds){
		this.dayPlanInfoFormularIDAddIds = addIds;
	}
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<WOMDayBatchPlanInfoSupervision> supervisionList;

	@javax.persistence.Transient
	public String getSupervisionDeleteIds(){
		return this.supervisionDeleteIds;
	}

	public void setSupervisionDeleteIds(String deleteIds){
		this.supervisionDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getSupervisionmultiselectIDs(){
		return this.supervisionmultiselectIDs;
	}

	public void setSupervisionmultiselectIDs(String multiselectIDs){
		this.supervisionmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getSupervisionmultiselectNames(){
		return this.supervisionmultiselectNames;
	}

	public void setSupervisionmultiselectNames(String multiselectNames){
		this.supervisionmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getSupervisionAddIds(){
		return this.supervisionAddIds;
	}

	public void setSupervisionAddIds(String addIds){
		this.supervisionAddIds = addIds;
	}

	public void setSupervisionList(List<WOMDayBatchPlanInfoSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<WOMDayBatchPlanInfoSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_objparama", complex = true)
	private Long objparama;
	
	@Column
	public Long getObjparama() {
		return objparama;
	}
	
	public void setObjparama(Long objparama) {
		this.objparama = objparama;
	}

	private String objparamaMainDisplay;
	
	@Transient
	public String getObjparamaMainDisplay() {
		return objparamaMainDisplay;
	}
	
	public void setObjparamaMainDisplay(String objparamaMainDisplay) {
		this.objparamaMainDisplay = objparamaMainDisplay;
	}
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_objparamb", complex = true)
	private Long objparamb;
	
	@Column
	public Long getObjparamb() {
		return objparamb;
	}
	
	public void setObjparamb(Long objparamb) {
		this.objparamb = objparamb;
	}

	private String objparambMainDisplay;
	
	@Transient
	public String getObjparambMainDisplay() {
		return objparambMainDisplay;
	}
	
	public void setObjparambMainDisplay(String objparambMainDisplay) {
		this.objparambMainDisplay = objparambMainDisplay;
	}
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_scparama", complex = true)
	private String scparama;
	
	@Column
	public String getScparama() {
		return scparama;
	}
	
	public void setScparama(String scparama) {
		this.scparama = scparama;
	}

	private String scparamaMainDisplay;
	
	@Transient
	public String getScparamaMainDisplay() {
		return scparamaMainDisplay;
	}
	
	public void setScparamaMainDisplay(String scparamaMainDisplay) {
		this.scparamaMainDisplay = scparamaMainDisplay;
	}
	@BAPCustomComponent(code = "WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_scparamb", complex = true)
	private String scparamb;
	
	@Column
	public String getScparamb() {
		return scparamb;
	}
	
	public void setScparamb(String scparamb) {
		this.scparamb = scparamb;
	}

	private String scparambMainDisplay;
	
	@Transient
	public String getScparambMainDisplay() {
		return scparambMainDisplay;
	}
	
	public void setScparambMainDisplay(String scparambMainDisplay) {
		this.scparambMainDisplay = scparambMainDisplay;
	}
	
	private String virtualId;
	@javax.persistence.Transient
	public String getVirtualId() {
		return virtualId;
	}

	public void setVirtualId(String virtualId) {
		this.virtualId = virtualId;
	}
	// 在此区域内自行添加JAVA代码,此处添加的JAVA代码必须不涉及持久化操作,
	// 如果加入get方法,请添加@javax.persistence.Transient注解
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
