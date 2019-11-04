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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTaskSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 指令批量.
 */
@javax.persistence.Entity(name=WOMBatchProduceTask.JPA_NAME)
@Table(name = WOMBatchProduceTask.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_batchProduceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_batchProduceTask_BatchProduceTask")
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
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMBatchProduceTaskConvertor.class})
public class WOMBatchProduceTask extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_batchProduceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "wom_batch_produce_tasks";
	public static final String JPA_NAME = "WOMBatchProduceTask";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date makeTime ; // 制单时间
	private SystemCode orderType
; // 生产性质


		private String remark ; // 备注
	private Staff staffID;
	private SystemCode taskType
; // 指令单类型
	
	private List<WOMBatchProdTaskPart> batchProdTaskPartList;
	
	public void setBatchProdTaskPartList(List<WOMBatchProdTaskPart> batchProdTaskPartList){
		this.batchProdTaskPartList = batchProdTaskPartList;
	}
	@Transient
	public List<WOMBatchProdTaskPart> getBatchProdTaskPartList(){
		return batchProdTaskPartList;
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
	
	@Index(name="IDX_BATCHPRODUCETAS_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	/**
	 * 获取制单时间.
	 * 
	 * @return 制单时间
	 */
	@Column(nullable=true

		,name="MAKE_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getMakeTime() {
        return makeTime;
    }
	/**
	 * 设置制单时间.
	 * @param makeTime 制单时间
	 */
    public void setMakeTime(java.util.Date makeTime) {
        this.makeTime = makeTime;
    }
	/**
	 * 获取生产性质.
	 * 
	 * @return 生产性质
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ORDER_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOrderType() {
		return orderType;
	}
	/**
	 * 设置生产性质.
	 * @param orderType 生产性质
	 */
	public void setOrderType(SystemCode orderType) {
		this.orderType = (SystemCode) orderType;
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
	@OneToOne
	@JoinColumn(name = "STAFFID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getStaffID() {
        return staffID;
    }
    public void setStaffID(Staff staffID) {
        this.staffID = staffID;
    }
	/**
	 * 获取指令单类型.
	 * 
	 * @return 指令单类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="TASK_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getTaskType() {
		return taskType;
	}
	/**
	 * 设置指令单类型.
	 * @param taskType 指令单类型
	 */
	public void setTaskType(SystemCode taskType) {
		this.taskType = (SystemCode) taskType;
	}
	
	
	protected String _getEntityName() {
		return WOMBatchProduceTask.class.getName();
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
	private String headIdFactoryIdDeleteIds;
	private String headIdFactoryIdAddIds;
	private String headIdFactoryIdmultiselectIDs;
	private String headIdFactoryIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdFactoryIdDeleteIds(){
		return this.headIdFactoryIdDeleteIds;
	}

	public void setHeadIdFactoryIdDeleteIds(String deleteIds){
		this.headIdFactoryIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdFactoryIdmultiselectIDs(){
		return this.headIdFactoryIdmultiselectIDs;
	}

	public void setHeadIdFactoryIdmultiselectIDs(String multiselectIDs){
		this.headIdFactoryIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdFactoryIdmultiselectNames(){
		return this.headIdFactoryIdmultiselectNames;
	}

	public void setHeadIdFactoryIdmultiselectNames(String multiselectNames){
		this.headIdFactoryIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdFactoryIdAddIds(){
		return this.headIdFactoryIdAddIds;
	}

	public void setHeadIdFactoryIdAddIds(String addIds){
		this.headIdFactoryIdAddIds = addIds;
	}
	private String headIdProductIdDeleteIds;
	private String headIdProductIdAddIds;
	private String headIdProductIdmultiselectIDs;
	private String headIdProductIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdProductIdDeleteIds(){
		return this.headIdProductIdDeleteIds;
	}

	public void setHeadIdProductIdDeleteIds(String deleteIds){
		this.headIdProductIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIdmultiselectIDs(){
		return this.headIdProductIdmultiselectIDs;
	}

	public void setHeadIdProductIdmultiselectIDs(String multiselectIDs){
		this.headIdProductIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIdmultiselectNames(){
		return this.headIdProductIdmultiselectNames;
	}

	public void setHeadIdProductIdmultiselectNames(String multiselectNames){
		this.headIdProductIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIdAddIds(){
		return this.headIdProductIdAddIds;
	}

	public void setHeadIdProductIdAddIds(String addIds){
		this.headIdProductIdAddIds = addIds;
	}
	private String headIdFormularIdDeleteIds;
	private String headIdFormularIdAddIds;
	private String headIdFormularIdmultiselectIDs;
	private String headIdFormularIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdFormularIdDeleteIds(){
		return this.headIdFormularIdDeleteIds;
	}

	public void setHeadIdFormularIdDeleteIds(String deleteIds){
		this.headIdFormularIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdFormularIdmultiselectIDs(){
		return this.headIdFormularIdmultiselectIDs;
	}

	public void setHeadIdFormularIdmultiselectIDs(String multiselectIDs){
		this.headIdFormularIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdFormularIdmultiselectNames(){
		return this.headIdFormularIdmultiselectNames;
	}

	public void setHeadIdFormularIdmultiselectNames(String multiselectNames){
		this.headIdFormularIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdFormularIdAddIds(){
		return this.headIdFormularIdAddIds;
	}

	public void setHeadIdFormularIdAddIds(String addIds){
		this.headIdFormularIdAddIds = addIds;
	}
	private String headIdBulkBatchNumDeleteIds;
	private String headIdBulkBatchNumAddIds;
	private String headIdBulkBatchNummultiselectIDs;
	private String headIdBulkBatchNummultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdBulkBatchNumDeleteIds(){
		return this.headIdBulkBatchNumDeleteIds;
	}

	public void setHeadIdBulkBatchNumDeleteIds(String deleteIds){
		this.headIdBulkBatchNumDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdBulkBatchNummultiselectIDs(){
		return this.headIdBulkBatchNummultiselectIDs;
	}

	public void setHeadIdBulkBatchNummultiselectIDs(String multiselectIDs){
		this.headIdBulkBatchNummultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdBulkBatchNummultiselectNames(){
		return this.headIdBulkBatchNummultiselectNames;
	}

	public void setHeadIdBulkBatchNummultiselectNames(String multiselectNames){
		this.headIdBulkBatchNummultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdBulkBatchNumAddIds(){
		return this.headIdBulkBatchNumAddIds;
	}

	public void setHeadIdBulkBatchNumAddIds(String addIds){
		this.headIdBulkBatchNumAddIds = addIds;
	}
	private String headIdBulkProductDeleteIds;
	private String headIdBulkProductAddIds;
	private String headIdBulkProductmultiselectIDs;
	private String headIdBulkProductmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdBulkProductDeleteIds(){
		return this.headIdBulkProductDeleteIds;
	}

	public void setHeadIdBulkProductDeleteIds(String deleteIds){
		this.headIdBulkProductDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdBulkProductmultiselectIDs(){
		return this.headIdBulkProductmultiselectIDs;
	}

	public void setHeadIdBulkProductmultiselectIDs(String multiselectIDs){
		this.headIdBulkProductmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdBulkProductmultiselectNames(){
		return this.headIdBulkProductmultiselectNames;
	}

	public void setHeadIdBulkProductmultiselectNames(String multiselectNames){
		this.headIdBulkProductmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdBulkProductAddIds(){
		return this.headIdBulkProductAddIds;
	}

	public void setHeadIdBulkProductAddIds(String addIds){
		this.headIdBulkProductAddIds = addIds;
	}
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<WOMBatchProduceTaskSupervision> supervisionList;

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

	public void setSupervisionList(List<WOMBatchProduceTaskSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<WOMBatchProduceTaskSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProduceTask_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
