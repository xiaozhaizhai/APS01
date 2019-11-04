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
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.WOM.entities.WOMTaskReportingSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产报工.
 */
@javax.persistence.Entity(name=WOMTaskReporting.JPA_NAME)
@Table(name = WOMTaskReporting.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_taskReporting")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_taskReporting_TaskReporting")
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
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMTaskReportingConvertor.class})
public class WOMTaskReporting extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_taskReporting";
	public static final String MODEL_CODE = "WOM_7.5.0.0_taskReporting_TaskReporting";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "wom_task_reportings";
	public static final String JPA_NAME = "WOMTaskReporting";


		private Boolean backFlag = false; // 退库标记


		private String batchNum ; // 生产批号


		private String inCode ; // 内部编码


		private String inputCode ; // 入库单号
	private WOMProduceTaskActive produceActive;
	private MESBasicProduct productID;


		private String proof ; // 物料凭证


		private String proofNum ; // 凭证编号


		private String remark ; // 备注

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date reportDate ; // 报工时间
	private Staff reportStaff;
	private SystemCode reportType
; // 报工类型
	private WOMProduceTask taskID;
	private MESBasicWare wareID;


		private String writeOffId ; // 冲销ID
	
	private List<WOMTaskReportingPart> taskReportingPartList;
	
	public void setTaskReportingPartList(List<WOMTaskReportingPart> taskReportingPartList){
		this.taskReportingPartList = taskReportingPartList;
	}
	@Transient
	public List<WOMTaskReportingPart> getTaskReportingPartList(){
		return taskReportingPartList;
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
	
	@Index(name="IDX_TASKREPORTING_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	/**
	 * 获取退库标记.
	 * 
	 * @return 退库标记
	 */
	@Column(nullable=true

		,name="BACK_FLAG"
	)
    public Boolean getBackFlag() {
        return null == backFlag ? false : backFlag;
    }
	/**
	 * 设置退库标记.
	 * @param backFlag 退库标记
	 */
    public void setBackFlag(Boolean backFlag) {
        this.backFlag = backFlag;
    }
	/**
	 * 获取生产批号.
	 * 
	 * @return 生产批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置生产批号.
	 * @param batchNum 生产批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取内部编码.
	 * 
	 * @return 内部编码
	 */
	@Column(nullable=true

		,length = 256
		,name="IN_CODE"
	)
    public String getInCode() {
        return inCode;
    }
	/**
	 * 设置内部编码.
	 * @param inCode 内部编码
	 */
    public void setInCode(String inCode) {
        this.inCode = inCode;
    }
	/**
	 * 获取入库单号.
	 * 
	 * @return 入库单号
	 */
	@Column(nullable=true

		,length = 256
		,name="INPUT_CODE"
	)
    public String getInputCode() {
        return inputCode;
    }
	/**
	 * 设置入库单号.
	 * @param inputCode 入库单号
	 */
    public void setInputCode(String inputCode) {
        this.inputCode = inputCode;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCE_ACTIVE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskActive getProduceActive() {
        return produceActive;
    }
    public void setProduceActive(WOMProduceTaskActive produceActive) {
        this.produceActive = produceActive;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCTID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductID() {
        return productID;
    }
    public void setProductID(MESBasicProduct productID) {
        this.productID = productID;
    }
	/**
	 * 获取物料凭证.
	 * 
	 * @return 物料凭证
	 */
	@Column(nullable=true

		,length = 256
		,name="PROOF"
	)
    public String getProof() {
        return proof;
    }
	/**
	 * 设置物料凭证.
	 * @param proof 物料凭证
	 */
    public void setProof(String proof) {
        this.proof = proof;
    }
	/**
	 * 获取凭证编号.
	 * 
	 * @return 凭证编号
	 */
	@Column(nullable=true

		,length = 256
		,name="PROOF_NUM"
	)
    public String getProofNum() {
        return proofNum;
    }
	/**
	 * 设置凭证编号.
	 * @param proofNum 凭证编号
	 */
    public void setProofNum(String proofNum) {
        this.proofNum = proofNum;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
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
	/**
	 * 获取报工时间.
	 * 
	 * @return 报工时间
	 */
	@Column(nullable=true

		,name="REPORT_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getReportDate() {
        return reportDate;
    }
	/**
	 * 设置报工时间.
	 * @param reportDate 报工时间
	 */
    public void setReportDate(java.util.Date reportDate) {
        this.reportDate = reportDate;
    }
	@OneToOne
	@JoinColumn(name = "REPORT_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getReportStaff() {
        return reportStaff;
    }
    public void setReportStaff(Staff reportStaff) {
        this.reportStaff = reportStaff;
    }
	/**
	 * 获取报工类型.
	 * 
	 * @return 报工类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="REPORT_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getReportType() {
		return reportType;
	}
	/**
	 * 设置报工类型.
	 * @param reportType 报工类型
	 */
	public void setReportType(SystemCode reportType) {
		this.reportType = (SystemCode) reportType;
	}
	@OneToOne
	@JoinColumn(name = "TASKID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getTaskID() {
        return taskID;
    }
    public void setTaskID(WOMProduceTask taskID) {
        this.taskID = taskID;
    }
	@OneToOne
	@JoinColumn(name = "WAREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWareID() {
        return wareID;
    }
    public void setWareID(MESBasicWare wareID) {
        this.wareID = wareID;
    }
	/**
	 * 获取冲销ID.
	 * 
	 * @return 冲销ID
	 */
	@Column(nullable=true

		,length = 256
		,name="WRITE_OFF_ID"
	)
    public String getWriteOffId() {
        return writeOffId;
    }
	/**
	 * 设置冲销ID.
	 * @param writeOffId 冲销ID
	 */
    public void setWriteOffId(String writeOffId) {
        this.writeOffId = writeOffId;
    }
	
	
	protected String _getEntityName() {
		return WOMTaskReporting.class.getName();
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
	private String headIdTaskIDDeleteIds;
	private String headIdTaskIDAddIds;
	private String headIdTaskIDmultiselectIDs;
	private String headIdTaskIDmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdTaskIDDeleteIds(){
		return this.headIdTaskIDDeleteIds;
	}

	public void setHeadIdTaskIDDeleteIds(String deleteIds){
		this.headIdTaskIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskIDmultiselectIDs(){
		return this.headIdTaskIDmultiselectIDs;
	}

	public void setHeadIdTaskIDmultiselectIDs(String multiselectIDs){
		this.headIdTaskIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskIDmultiselectNames(){
		return this.headIdTaskIDmultiselectNames;
	}

	public void setHeadIdTaskIDmultiselectNames(String multiselectNames){
		this.headIdTaskIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskIDAddIds(){
		return this.headIdTaskIDAddIds;
	}

	public void setHeadIdTaskIDAddIds(String addIds){
		this.headIdTaskIDAddIds = addIds;
	}
	private String headIdWareIdDeleteIds;
	private String headIdWareIdAddIds;
	private String headIdWareIdmultiselectIDs;
	private String headIdWareIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdWareIdDeleteIds(){
		return this.headIdWareIdDeleteIds;
	}

	public void setHeadIdWareIdDeleteIds(String deleteIds){
		this.headIdWareIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdWareIdmultiselectIDs(){
		return this.headIdWareIdmultiselectIDs;
	}

	public void setHeadIdWareIdmultiselectIDs(String multiselectIDs){
		this.headIdWareIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdWareIdmultiselectNames(){
		return this.headIdWareIdmultiselectNames;
	}

	public void setHeadIdWareIdmultiselectNames(String multiselectNames){
		this.headIdWareIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdWareIdAddIds(){
		return this.headIdWareIdAddIds;
	}

	public void setHeadIdWareIdAddIds(String addIds){
		this.headIdWareIdAddIds = addIds;
	}
	private String headIdProductIDDeleteIds;
	private String headIdProductIDAddIds;
	private String headIdProductIDmultiselectIDs;
	private String headIdProductIDmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdProductIDDeleteIds(){
		return this.headIdProductIDDeleteIds;
	}

	public void setHeadIdProductIDDeleteIds(String deleteIds){
		this.headIdProductIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIDmultiselectIDs(){
		return this.headIdProductIDmultiselectIDs;
	}

	public void setHeadIdProductIDmultiselectIDs(String multiselectIDs){
		this.headIdProductIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIDmultiselectNames(){
		return this.headIdProductIDmultiselectNames;
	}

	public void setHeadIdProductIDmultiselectNames(String multiselectNames){
		this.headIdProductIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIDAddIds(){
		return this.headIdProductIDAddIds;
	}

	public void setHeadIdProductIDAddIds(String addIds){
		this.headIdProductIDAddIds = addIds;
	}
	private String headIdIdDeleteIds;
	private String headIdIdAddIds;
	private String headIdIdmultiselectIDs;
	private String headIdIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdIdDeleteIds(){
		return this.headIdIdDeleteIds;
	}

	public void setHeadIdIdDeleteIds(String deleteIds){
		this.headIdIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdIdmultiselectIDs(){
		return this.headIdIdmultiselectIDs;
	}

	public void setHeadIdIdmultiselectIDs(String multiselectIDs){
		this.headIdIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdIdmultiselectNames(){
		return this.headIdIdmultiselectNames;
	}

	public void setHeadIdIdmultiselectNames(String multiselectNames){
		this.headIdIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdIdAddIds(){
		return this.headIdIdAddIds;
	}

	public void setHeadIdIdAddIds(String addIds){
		this.headIdIdAddIds = addIds;
	}
	private String headIdReportStaffDeleteIds;
	private String headIdReportStaffAddIds;
	private String headIdReportStaffmultiselectIDs;
	private String headIdReportStaffmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdReportStaffDeleteIds(){
		return this.headIdReportStaffDeleteIds;
	}

	public void setHeadIdReportStaffDeleteIds(String deleteIds){
		this.headIdReportStaffDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdReportStaffmultiselectIDs(){
		return this.headIdReportStaffmultiselectIDs;
	}

	public void setHeadIdReportStaffmultiselectIDs(String multiselectIDs){
		this.headIdReportStaffmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdReportStaffmultiselectNames(){
		return this.headIdReportStaffmultiselectNames;
	}

	public void setHeadIdReportStaffmultiselectNames(String multiselectNames){
		this.headIdReportStaffmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdReportStaffAddIds(){
		return this.headIdReportStaffAddIds;
	}

	public void setHeadIdReportStaffAddIds(String addIds){
		this.headIdReportStaffAddIds = addIds;
	}
	private String headIdStoreIDDeleteIds;
	private String headIdStoreIDAddIds;
	private String headIdStoreIDmultiselectIDs;
	private String headIdStoreIDmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdStoreIDDeleteIds(){
		return this.headIdStoreIDDeleteIds;
	}

	public void setHeadIdStoreIDDeleteIds(String deleteIds){
		this.headIdStoreIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdStoreIDmultiselectIDs(){
		return this.headIdStoreIDmultiselectIDs;
	}

	public void setHeadIdStoreIDmultiselectIDs(String multiselectIDs){
		this.headIdStoreIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdStoreIDmultiselectNames(){
		return this.headIdStoreIDmultiselectNames;
	}

	public void setHeadIdStoreIDmultiselectNames(String multiselectNames){
		this.headIdStoreIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdStoreIDAddIds(){
		return this.headIdStoreIDAddIds;
	}

	public void setHeadIdStoreIDAddIds(String addIds){
		this.headIdStoreIDAddIds = addIds;
	}
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<WOMTaskReportingSupervision> supervisionList;

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

	public void setSupervisionList(List<WOMTaskReportingSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<WOMTaskReportingSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReporting_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
