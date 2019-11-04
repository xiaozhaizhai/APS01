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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 投料单.
 */
@javax.persistence.Entity(name=WOMPutInMaterial.JPA_NAME)
@Table(name = WOMPutInMaterial.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_putInMaterial")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_putInMaterial_PutInMaterial")
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
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMPutInMaterialConvertor.class})
public class WOMPutInMaterial extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_putInMaterial";
	public static final String MODEL_CODE = "WOM_7.5.0.0_putInMaterial_PutInMaterial";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "wom_put_in_materials";
	public static final String JPA_NAME = "WOMPutInMaterial";
	private Staff putinStaff;
	private SystemCode putinType
; // 投料方式


		private String remark ; // 备注
	private WOMProduceTask taskID;
	
	private List<WOMPutInMaterialPart> putInMaterialPartList;
	
	public void setPutInMaterialPartList(List<WOMPutInMaterialPart> putInMaterialPartList){
		this.putInMaterialPartList = putInMaterialPartList;
	}
	@Transient
	public List<WOMPutInMaterialPart> getPutInMaterialPartList(){
		return putInMaterialPartList;
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
	
	@Index(name="IDX_PUTINMATERIAL_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	@OneToOne
	@JoinColumn(name = "PUTIN_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getPutinStaff() {
        return putinStaff;
    }
    public void setPutinStaff(Staff putinStaff) {
        this.putinStaff = putinStaff;
    }
	/**
	 * 获取投料方式.
	 * 
	 * @return 投料方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PUTIN_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getPutinType() {
		return putinType;
	}
	/**
	 * 设置投料方式.
	 * @param putinType 投料方式
	 */
	public void setPutinType(SystemCode putinType) {
		this.putinType = (SystemCode) putinType;
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
		return WOMPutInMaterial.class.getName();
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
	private String headIdAdjustActiveDeleteIds;
	private String headIdAdjustActiveAddIds;
	private String headIdAdjustActivemultiselectIDs;
	private String headIdAdjustActivemultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdAdjustActiveDeleteIds(){
		return this.headIdAdjustActiveDeleteIds;
	}

	public void setHeadIdAdjustActiveDeleteIds(String deleteIds){
		this.headIdAdjustActiveDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdAdjustActivemultiselectIDs(){
		return this.headIdAdjustActivemultiselectIDs;
	}

	public void setHeadIdAdjustActivemultiselectIDs(String multiselectIDs){
		this.headIdAdjustActivemultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdAdjustActivemultiselectNames(){
		return this.headIdAdjustActivemultiselectNames;
	}

	public void setHeadIdAdjustActivemultiselectNames(String multiselectNames){
		this.headIdAdjustActivemultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdAdjustActiveAddIds(){
		return this.headIdAdjustActiveAddIds;
	}

	public void setHeadIdAdjustActiveAddIds(String addIds){
		this.headIdAdjustActiveAddIds = addIds;
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
	private String headIdFormluActiveDeleteIds;
	private String headIdFormluActiveAddIds;
	private String headIdFormluActivemultiselectIDs;
	private String headIdFormluActivemultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdFormluActiveDeleteIds(){
		return this.headIdFormluActiveDeleteIds;
	}

	public void setHeadIdFormluActiveDeleteIds(String deleteIds){
		this.headIdFormluActiveDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdFormluActivemultiselectIDs(){
		return this.headIdFormluActivemultiselectIDs;
	}

	public void setHeadIdFormluActivemultiselectIDs(String multiselectIDs){
		this.headIdFormluActivemultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdFormluActivemultiselectNames(){
		return this.headIdFormluActivemultiselectNames;
	}

	public void setHeadIdFormluActivemultiselectNames(String multiselectNames){
		this.headIdFormluActivemultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdFormluActiveAddIds(){
		return this.headIdFormluActiveAddIds;
	}

	public void setHeadIdFormluActiveAddIds(String addIds){
		this.headIdFormluActiveAddIds = addIds;
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
	private String headIdProBatchDeleteIds;
	private String headIdProBatchAddIds;
	private String headIdProBatchmultiselectIDs;
	private String headIdProBatchmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdProBatchDeleteIds(){
		return this.headIdProBatchDeleteIds;
	}

	public void setHeadIdProBatchDeleteIds(String deleteIds){
		this.headIdProBatchDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdProBatchmultiselectIDs(){
		return this.headIdProBatchmultiselectIDs;
	}

	public void setHeadIdProBatchmultiselectIDs(String multiselectIDs){
		this.headIdProBatchmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdProBatchmultiselectNames(){
		return this.headIdProBatchmultiselectNames;
	}

	public void setHeadIdProBatchmultiselectNames(String multiselectNames){
		this.headIdProBatchmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdProBatchAddIds(){
		return this.headIdProBatchAddIds;
	}

	public void setHeadIdProBatchAddIds(String addIds){
		this.headIdProBatchAddIds = addIds;
	}
	private String headIdPutinStaffDeleteIds;
	private String headIdPutinStaffAddIds;
	private String headIdPutinStaffmultiselectIDs;
	private String headIdPutinStaffmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdPutinStaffDeleteIds(){
		return this.headIdPutinStaffDeleteIds;
	}

	public void setHeadIdPutinStaffDeleteIds(String deleteIds){
		this.headIdPutinStaffDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdPutinStaffmultiselectIDs(){
		return this.headIdPutinStaffmultiselectIDs;
	}

	public void setHeadIdPutinStaffmultiselectIDs(String multiselectIDs){
		this.headIdPutinStaffmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdPutinStaffmultiselectNames(){
		return this.headIdPutinStaffmultiselectNames;
	}

	public void setHeadIdPutinStaffmultiselectNames(String multiselectNames){
		this.headIdPutinStaffmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdPutinStaffAddIds(){
		return this.headIdPutinStaffAddIds;
	}

	public void setHeadIdPutinStaffAddIds(String addIds){
		this.headIdPutinStaffAddIds = addIds;
	}
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<WOMPutInMaterialSupervision> supervisionList;

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

	public void setSupervisionList(List<WOMPutInMaterialSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<WOMPutInMaterialSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterial_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
