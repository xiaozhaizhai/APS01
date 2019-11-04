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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 配料指令.
 */
@javax.persistence.Entity(name=WOMBatchingMaterial.JPA_NAME)
@Table(name = WOMBatchingMaterial.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_batchingMaterial")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial")
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
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMBatchingMaterialConvertor.class})
public class WOMBatchingMaterial extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_batchingMaterial";
	public static final String MODEL_CODE = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "wom_batching_materials";
	public static final String JPA_NAME = "WOMBatchingMaterial";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date arriveTime ; // 需送达时间


		private String batchNum ; // 配料指令单


		private java.math.BigDecimal doneNum ; // 已配数量


		private java.math.BigDecimal needNum ; // 需配数量
	private WOMBatchingMaterialNeed needPartId;
	private Staff orderStaff;


		private String phaseID ; // phaseID
	private MESBasicProduct productId;


		private String remark ; // 备注
	private SystemCode state
; // 状态


		private Boolean sycnState = false; // 已向配料系统下指令
	private WOMProduceTask taskID;
	
	private List<WOMBatchingMaterialPart> batchingMaterialPartList;
	
	public void setBatchingMaterialPartList(List<WOMBatchingMaterialPart> batchingMaterialPartList){
		this.batchingMaterialPartList = batchingMaterialPartList;
	}
	@Transient
	public List<WOMBatchingMaterialPart> getBatchingMaterialPartList(){
		return batchingMaterialPartList;
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
	
	@Index(name="IDX_BATCHINGMATERIA_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	/**
	 * 获取需送达时间.
	 * 
	 * @return 需送达时间
	 */
	@Column(nullable=true

		,name="ARRIVE_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getArriveTime() {
        return arriveTime;
    }
	/**
	 * 设置需送达时间.
	 * @param arriveTime 需送达时间
	 */
    public void setArriveTime(java.util.Date arriveTime) {
        this.arriveTime = arriveTime;
    }
	/**
	 * 获取配料指令单.
	 * 
	 * @return 配料指令单
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置配料指令单.
	 * @param batchNum 配料指令单
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取已配数量.
	 * 
	 * @return 已配数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="DONE_NUM"
	)
    public java.math.BigDecimal getDoneNum() {
        return doneNum;
    }
	/**
	 * 设置已配数量.
	 * @param doneNum 已配数量
	 */
    public void setDoneNum(java.math.BigDecimal doneNum) {
        this.doneNum = doneNum;
    }
	/**
	 * 获取需配数量.
	 * 
	 * @return 需配数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="NEED_NUM"
	)
    public java.math.BigDecimal getNeedNum() {
        return needNum;
    }
	/**
	 * 设置需配数量.
	 * @param needNum 需配数量
	 */
    public void setNeedNum(java.math.BigDecimal needNum) {
        this.needNum = needNum;
    }
	@OneToOne
	@JoinColumn(name = "NEED_PART_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMBatchingMaterialNeed getNeedPartId() {
        return needPartId;
    }
    public void setNeedPartId(WOMBatchingMaterialNeed needPartId) {
        this.needPartId = needPartId;
    }
	@OneToOne
	@JoinColumn(name = "ORDER_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getOrderStaff() {
        return orderStaff;
    }
    public void setOrderStaff(Staff orderStaff) {
        this.orderStaff = orderStaff;
    }
	/**
	 * 获取phaseID.
	 * 
	 * @return phaseID
	 */
	@Column(nullable=true

		,length = 256
		,name="PHASEID"
	)
    public String getPhaseID() {
        return phaseID;
    }
	/**
	 * 设置phaseID.
	 * @param phaseID phaseID
	 */
    public void setPhaseID(String phaseID) {
        this.phaseID = phaseID;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductId() {
        return productId;
    }
    public void setProductId(MESBasicProduct productId) {
        this.productId = productId;
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
	 * 获取状态.
	 * 
	 * @return 状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getState() {
		return state;
	}
	/**
	 * 设置状态.
	 * @param state 状态
	 */
	public void setState(SystemCode state) {
		this.state = (SystemCode) state;
	}
	/**
	 * 获取已向配料系统下指令.
	 * 
	 * @return 已向配料系统下指令
	 */
	@Column(nullable=true

		,name="SYCN_STATE"
	)
    public Boolean getSycnState() {
        return null == sycnState ? false : sycnState;
    }
	/**
	 * 设置已向配料系统下指令.
	 * @param sycnState 已向配料系统下指令
	 */
    public void setSycnState(Boolean sycnState) {
        this.sycnState = sycnState;
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
	
	
	protected String _getEntityName() {
		return WOMBatchingMaterial.class.getName();
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
	private String headIdArmWareIDDeleteIds;
	private String headIdArmWareIDAddIds;
	private String headIdArmWareIDmultiselectIDs;
	private String headIdArmWareIDmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdArmWareIDDeleteIds(){
		return this.headIdArmWareIDDeleteIds;
	}

	public void setHeadIdArmWareIDDeleteIds(String deleteIds){
		this.headIdArmWareIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdArmWareIDmultiselectIDs(){
		return this.headIdArmWareIDmultiselectIDs;
	}

	public void setHeadIdArmWareIDmultiselectIDs(String multiselectIDs){
		this.headIdArmWareIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdArmWareIDmultiselectNames(){
		return this.headIdArmWareIDmultiselectNames;
	}

	public void setHeadIdArmWareIDmultiselectNames(String multiselectNames){
		this.headIdArmWareIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdArmWareIDAddIds(){
		return this.headIdArmWareIDAddIds;
	}

	public void setHeadIdArmWareIDAddIds(String addIds){
		this.headIdArmWareIDAddIds = addIds;
	}
	private String headIdNeedPartIdDeleteIds;
	private String headIdNeedPartIdAddIds;
	private String headIdNeedPartIdmultiselectIDs;
	private String headIdNeedPartIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdNeedPartIdDeleteIds(){
		return this.headIdNeedPartIdDeleteIds;
	}

	public void setHeadIdNeedPartIdDeleteIds(String deleteIds){
		this.headIdNeedPartIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdNeedPartIdmultiselectIDs(){
		return this.headIdNeedPartIdmultiselectIDs;
	}

	public void setHeadIdNeedPartIdmultiselectIDs(String multiselectIDs){
		this.headIdNeedPartIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdNeedPartIdmultiselectNames(){
		return this.headIdNeedPartIdmultiselectNames;
	}

	public void setHeadIdNeedPartIdmultiselectNames(String multiselectNames){
		this.headIdNeedPartIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdNeedPartIdAddIds(){
		return this.headIdNeedPartIdAddIds;
	}

	public void setHeadIdNeedPartIdAddIds(String addIds){
		this.headIdNeedPartIdAddIds = addIds;
	}
	private String headIdTaskProcessIdDeleteIds;
	private String headIdTaskProcessIdAddIds;
	private String headIdTaskProcessIdmultiselectIDs;
	private String headIdTaskProcessIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdTaskProcessIdDeleteIds(){
		return this.headIdTaskProcessIdDeleteIds;
	}

	public void setHeadIdTaskProcessIdDeleteIds(String deleteIds){
		this.headIdTaskProcessIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskProcessIdmultiselectIDs(){
		return this.headIdTaskProcessIdmultiselectIDs;
	}

	public void setHeadIdTaskProcessIdmultiselectIDs(String multiselectIDs){
		this.headIdTaskProcessIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskProcessIdmultiselectNames(){
		return this.headIdTaskProcessIdmultiselectNames;
	}

	public void setHeadIdTaskProcessIdmultiselectNames(String multiselectNames){
		this.headIdTaskProcessIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskProcessIdAddIds(){
		return this.headIdTaskProcessIdAddIds;
	}

	public void setHeadIdTaskProcessIdAddIds(String addIds){
		this.headIdTaskProcessIdAddIds = addIds;
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
	private String headIdWareIDDeleteIds;
	private String headIdWareIDAddIds;
	private String headIdWareIDmultiselectIDs;
	private String headIdWareIDmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdWareIDDeleteIds(){
		return this.headIdWareIDDeleteIds;
	}

	public void setHeadIdWareIDDeleteIds(String deleteIds){
		this.headIdWareIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdWareIDmultiselectIDs(){
		return this.headIdWareIDmultiselectIDs;
	}

	public void setHeadIdWareIDmultiselectIDs(String multiselectIDs){
		this.headIdWareIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdWareIDmultiselectNames(){
		return this.headIdWareIDmultiselectNames;
	}

	public void setHeadIdWareIDmultiselectNames(String multiselectNames){
		this.headIdWareIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdWareIDAddIds(){
		return this.headIdWareIDAddIds;
	}

	public void setHeadIdWareIDAddIds(String addIds){
		this.headIdWareIDAddIds = addIds;
	}
	private String headIdExeStaffDeleteIds;
	private String headIdExeStaffAddIds;
	private String headIdExeStaffmultiselectIDs;
	private String headIdExeStaffmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdExeStaffDeleteIds(){
		return this.headIdExeStaffDeleteIds;
	}

	public void setHeadIdExeStaffDeleteIds(String deleteIds){
		this.headIdExeStaffDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdExeStaffmultiselectIDs(){
		return this.headIdExeStaffmultiselectIDs;
	}

	public void setHeadIdExeStaffmultiselectIDs(String multiselectIDs){
		this.headIdExeStaffmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdExeStaffmultiselectNames(){
		return this.headIdExeStaffmultiselectNames;
	}

	public void setHeadIdExeStaffmultiselectNames(String multiselectNames){
		this.headIdExeStaffmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdExeStaffAddIds(){
		return this.headIdExeStaffAddIds;
	}

	public void setHeadIdExeStaffAddIds(String addIds){
		this.headIdExeStaffAddIds = addIds;
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
	private String headIdBatchNumObjDeleteIds;
	private String headIdBatchNumObjAddIds;
	private String headIdBatchNumObjmultiselectIDs;
	private String headIdBatchNumObjmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdBatchNumObjDeleteIds(){
		return this.headIdBatchNumObjDeleteIds;
	}

	public void setHeadIdBatchNumObjDeleteIds(String deleteIds){
		this.headIdBatchNumObjDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdBatchNumObjmultiselectIDs(){
		return this.headIdBatchNumObjmultiselectIDs;
	}

	public void setHeadIdBatchNumObjmultiselectIDs(String multiselectIDs){
		this.headIdBatchNumObjmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdBatchNumObjmultiselectNames(){
		return this.headIdBatchNumObjmultiselectNames;
	}

	public void setHeadIdBatchNumObjmultiselectNames(String multiselectNames){
		this.headIdBatchNumObjmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdBatchNumObjAddIds(){
		return this.headIdBatchNumObjAddIds;
	}

	public void setHeadIdBatchNumObjAddIds(String addIds){
		this.headIdBatchNumObjAddIds = addIds;
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
	private String headIdReceiveStaffDeleteIds;
	private String headIdReceiveStaffAddIds;
	private String headIdReceiveStaffmultiselectIDs;
	private String headIdReceiveStaffmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdReceiveStaffDeleteIds(){
		return this.headIdReceiveStaffDeleteIds;
	}

	public void setHeadIdReceiveStaffDeleteIds(String deleteIds){
		this.headIdReceiveStaffDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdReceiveStaffmultiselectIDs(){
		return this.headIdReceiveStaffmultiselectIDs;
	}

	public void setHeadIdReceiveStaffmultiselectIDs(String multiselectIDs){
		this.headIdReceiveStaffmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdReceiveStaffmultiselectNames(){
		return this.headIdReceiveStaffmultiselectNames;
	}

	public void setHeadIdReceiveStaffmultiselectNames(String multiselectNames){
		this.headIdReceiveStaffmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdReceiveStaffAddIds(){
		return this.headIdReceiveStaffAddIds;
	}

	public void setHeadIdReceiveStaffAddIds(String addIds){
		this.headIdReceiveStaffAddIds = addIds;
	}
	private String headIdTaskActiveIdDeleteIds;
	private String headIdTaskActiveIdAddIds;
	private String headIdTaskActiveIdmultiselectIDs;
	private String headIdTaskActiveIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdTaskActiveIdDeleteIds(){
		return this.headIdTaskActiveIdDeleteIds;
	}

	public void setHeadIdTaskActiveIdDeleteIds(String deleteIds){
		this.headIdTaskActiveIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskActiveIdmultiselectIDs(){
		return this.headIdTaskActiveIdmultiselectIDs;
	}

	public void setHeadIdTaskActiveIdmultiselectIDs(String multiselectIDs){
		this.headIdTaskActiveIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskActiveIdmultiselectNames(){
		return this.headIdTaskActiveIdmultiselectNames;
	}

	public void setHeadIdTaskActiveIdmultiselectNames(String multiselectNames){
		this.headIdTaskActiveIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdTaskActiveIdAddIds(){
		return this.headIdTaskActiveIdAddIds;
	}

	public void setHeadIdTaskActiveIdAddIds(String addIds){
		this.headIdTaskActiveIdAddIds = addIds;
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
	private String headIdRejectReasonDeleteIds;
	private String headIdRejectReasonAddIds;
	private String headIdRejectReasonmultiselectIDs;
	private String headIdRejectReasonmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdRejectReasonDeleteIds(){
		return this.headIdRejectReasonDeleteIds;
	}

	public void setHeadIdRejectReasonDeleteIds(String deleteIds){
		this.headIdRejectReasonDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdRejectReasonmultiselectIDs(){
		return this.headIdRejectReasonmultiselectIDs;
	}

	public void setHeadIdRejectReasonmultiselectIDs(String multiselectIDs){
		this.headIdRejectReasonmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdRejectReasonmultiselectNames(){
		return this.headIdRejectReasonmultiselectNames;
	}

	public void setHeadIdRejectReasonmultiselectNames(String multiselectNames){
		this.headIdRejectReasonmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdRejectReasonAddIds(){
		return this.headIdRejectReasonAddIds;
	}

	public void setHeadIdRejectReasonAddIds(String addIds){
		this.headIdRejectReasonAddIds = addIds;
	}
	private String headIdArmStoreIDDeleteIds;
	private String headIdArmStoreIDAddIds;
	private String headIdArmStoreIDmultiselectIDs;
	private String headIdArmStoreIDmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdArmStoreIDDeleteIds(){
		return this.headIdArmStoreIDDeleteIds;
	}

	public void setHeadIdArmStoreIDDeleteIds(String deleteIds){
		this.headIdArmStoreIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdArmStoreIDmultiselectIDs(){
		return this.headIdArmStoreIDmultiselectIDs;
	}

	public void setHeadIdArmStoreIDmultiselectIDs(String multiselectIDs){
		this.headIdArmStoreIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdArmStoreIDmultiselectNames(){
		return this.headIdArmStoreIDmultiselectNames;
	}

	public void setHeadIdArmStoreIDmultiselectNames(String multiselectNames){
		this.headIdArmStoreIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdArmStoreIDAddIds(){
		return this.headIdArmStoreIDAddIds;
	}

	public void setHeadIdArmStoreIDAddIds(String addIds){
		this.headIdArmStoreIDAddIds = addIds;
	}
	private String headIdPutBatMateIdDeleteIds;
	private String headIdPutBatMateIdAddIds;
	private String headIdPutBatMateIdmultiselectIDs;
	private String headIdPutBatMateIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdPutBatMateIdDeleteIds(){
		return this.headIdPutBatMateIdDeleteIds;
	}

	public void setHeadIdPutBatMateIdDeleteIds(String deleteIds){
		this.headIdPutBatMateIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdPutBatMateIdmultiselectIDs(){
		return this.headIdPutBatMateIdmultiselectIDs;
	}

	public void setHeadIdPutBatMateIdmultiselectIDs(String multiselectIDs){
		this.headIdPutBatMateIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdPutBatMateIdmultiselectNames(){
		return this.headIdPutBatMateIdmultiselectNames;
	}

	public void setHeadIdPutBatMateIdmultiselectNames(String multiselectNames){
		this.headIdPutBatMateIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdPutBatMateIdAddIds(){
		return this.headIdPutBatMateIdAddIds;
	}

	public void setHeadIdPutBatMateIdAddIds(String addIds){
		this.headIdPutBatMateIdAddIds = addIds;
	}
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<WOMBatchingMaterialSupervision> supervisionList;

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

	public void setSupervisionList(List<WOMBatchingMaterialSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<WOMBatchingMaterialSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterial_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
