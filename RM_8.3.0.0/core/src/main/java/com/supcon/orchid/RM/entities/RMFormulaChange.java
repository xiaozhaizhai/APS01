package com.supcon.orchid.RM.entities;

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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.RM.entities.RMFormulaChangeSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 配方变更表.
 */
@javax.persistence.Entity(name=RMFormulaChange.JPA_NAME)
@Table(name = RMFormulaChange.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_fomulaChange")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_fomulaChange_FormulaChange")
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
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaChangeConvertor.class})
public class RMFormulaChange extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_fomulaChange";
	public static final String MODEL_CODE = "RM_7.5.0.0_fomulaChange_FormulaChange";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "rm_formula_changes";
	public static final String JPA_NAME = "RMFormulaChange";
	private SystemCode changeType
; // 变更类型
	private RMFormula formulaId;


		private Boolean isForProduct = false; // 生产配方(新)


		private String meno ; // 备注


		private Boolean oldIsForProduct = false; // 原生产配方
	private SystemCode oldState
; // 原状态
	private SystemCode oldUsedFor
; // 原用途
	private SystemCode state
; // 状态
	private SystemCode usedFor
; // 用途
	
	
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
	
	@Index(name="IDX_FORMULACHANGE_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	/**
	 * 获取变更类型.
	 * 
	 * @return 变更类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CHANGE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getChangeType() {
		return changeType;
	}
	/**
	 * 设置变更类型.
	 * @param changeType 变更类型
	 */
	public void setChangeType(SystemCode changeType) {
		this.changeType = (SystemCode) changeType;
	}
	@ManyToOne
	@JoinColumn(name = "FORMULA_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormula getFormulaId() {
        return formulaId;
    }
    public void setFormulaId(RMFormula formulaId) {
        this.formulaId = formulaId;
    }
	/**
	 * 获取生产配方(新).
	 * 
	 * @return 生产配方(新)
	 */
	@Column(nullable=true

		,name="IS_FOR_PRODUCT"
	)
    public Boolean getIsForProduct() {
        return null == isForProduct ? false : isForProduct;
    }
	/**
	 * 设置生产配方(新).
	 * @param isForProduct 生产配方(新)
	 */
    public void setIsForProduct(Boolean isForProduct) {
        this.isForProduct = isForProduct;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="MENO"
	)
    public String getMeno() {
        return meno;
    }
	/**
	 * 设置备注.
	 * @param meno 备注
	 */
    public void setMeno(String meno) {
        this.meno = meno;
    }
	/**
	 * 获取原生产配方.
	 * 
	 * @return 原生产配方
	 */
	@Column(nullable=true

		,name="OLD_IS_FOR_PRODUCT"
	)
    public Boolean getOldIsForProduct() {
        return null == oldIsForProduct ? false : oldIsForProduct;
    }
	/**
	 * 设置原生产配方.
	 * @param oldIsForProduct 原生产配方
	 */
    public void setOldIsForProduct(Boolean oldIsForProduct) {
        this.oldIsForProduct = oldIsForProduct;
    }
	/**
	 * 获取原状态.
	 * 
	 * @return 原状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="OLD_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOldState() {
		return oldState;
	}
	/**
	 * 设置原状态.
	 * @param oldState 原状态
	 */
	public void setOldState(SystemCode oldState) {
		this.oldState = (SystemCode) oldState;
	}
	/**
	 * 获取原用途.
	 * 
	 * @return 原用途
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="OLD_USED_FOR", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOldUsedFor() {
		return oldUsedFor;
	}
	/**
	 * 设置原用途.
	 * @param oldUsedFor 原用途
	 */
	public void setOldUsedFor(SystemCode oldUsedFor) {
		this.oldUsedFor = (SystemCode) oldUsedFor;
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
	 * 获取用途.
	 * 
	 * @return 用途
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="USED_FOR", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getUsedFor() {
		return usedFor;
	}
	/**
	 * 设置用途.
	 * @param usedFor 用途
	 */
	public void setUsedFor(SystemCode usedFor) {
		this.usedFor = (SystemCode) usedFor;
	}
	
	
	protected String _getEntityName() {
		return RMFormulaChange.class.getName();
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
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<RMFormulaChangeSupervision> supervisionList;

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

	public void setSupervisionList(List<RMFormulaChangeSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<RMFormulaChangeSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_fomulaChange_FormulaChange_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
