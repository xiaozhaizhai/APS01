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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 工序.
 */
@javax.persistence.Entity(name=RMFormulaProcess.JPA_NAME)
@Table(name = RMFormulaProcess.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_FormulaProcess")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
       , @AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL"))
/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaProcessConvertor.class})
public class RMFormulaProcess extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_FormulaProcess";
	public static final String DOC_TYPE = "RM_formula_formulaProcess";
	public static final String TABLE_NAME = "rm_formula_processes";
	public static final String JPA_NAME = "RMFormulaProcess";


		private String batchUnitID ; // 批控UnitID
	private SystemCode cmdType
		= new SystemCode("RM_cmdType/02")
		; // 指令类型


		private Integer exeOrder ; // 执行顺序


		private Long formId ; // 工序号


		private Long formulaHideId ; // 配方隐藏Id
	private RMFormula formulaId;


		private Boolean isFirstProcess = false; // 首道工序


		private Boolean isLastProcess = false; // 末道工序

		private Boolean isNewCreate = 
			Boolean.valueOf("true")
		; // 是否新建, 


		private java.math.BigDecimal longTime ; // 标准时长(分)


		private String meno ; // 备注
	@BAPIsMainDisplay

		private String name ; // 工序名称
	private SystemCode persistMode
; // 接续方式


		private String processCode ; // 工序编码


		private Long processTableId ; // 表单号
	private RMProcessType processType;


		private String procSort ; // 执行顺序


		private java.math.BigDecimal transTime ; // 工序间隔时间


		private Long upVersionId ; // 升版前ID
	
	private List<RMFormulaBeforeProcess> formulaBeforeProcessList;
	
	public void setFormulaBeforeProcessList(List<RMFormulaBeforeProcess> formulaBeforeProcessList){
		this.formulaBeforeProcessList = formulaBeforeProcessList;
	}
	@Transient
	public List<RMFormulaBeforeProcess> getFormulaBeforeProcessList(){
		return formulaBeforeProcessList;
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
	
	
	@Index(name="IDX_FORMULAPROCESS_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取批控UnitID.
	 * 
	 * @return 批控UnitID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_UNITID"
	)
    public String getBatchUnitID() {
        return batchUnitID;
    }
	/**
	 * 设置批控UnitID.
	 * @param batchUnitID 批控UnitID
	 */
    public void setBatchUnitID(String batchUnitID) {
        this.batchUnitID = batchUnitID;
    }
	/**
	 * 获取指令类型.
	 * 
	 * @return 指令类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CMD_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getCmdType() {
		return cmdType;
	}
	/**
	 * 设置指令类型.
	 * @param cmdType 指令类型
	 */
	public void setCmdType(SystemCode cmdType) {
		this.cmdType = (SystemCode) cmdType;
	}
	/**
	 * 获取执行顺序.
	 * 
	 * @return 执行顺序
	 */
	@Column(nullable=true

		,name="EXE_ORDER"
	)
    public Integer getExeOrder() {
        return exeOrder;
    }
	/**
	 * 设置执行顺序.
	 * @param exeOrder 执行顺序
	 */
    public void setExeOrder(Integer exeOrder) {
        this.exeOrder = exeOrder;
    }
	/**
	 * 获取工序号.
	 * 
	 * @return 工序号
	 */
	@Column(nullable=true

		,name="FORM_ID"
	)
    public Long getFormId() {
        return formId;
    }
	/**
	 * 设置工序号.
	 * @param formId 工序号
	 */
    public void setFormId(Long formId) {
        this.formId = formId;
    }
	/**
	 * 获取配方隐藏Id.
	 * 
	 * @return 配方隐藏Id
	 */
	@Column(nullable=true

		,name="FORMULA_HIDE_ID"
	)
    public Long getFormulaHideId() {
        return formulaHideId;
    }
	/**
	 * 设置配方隐藏Id.
	 * @param formulaHideId 配方隐藏Id
	 */
    public void setFormulaHideId(Long formulaHideId) {
        this.formulaHideId = formulaHideId;
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
	 * 获取首道工序.
	 * 
	 * @return 首道工序
	 */
	@Column(nullable=true

		,name="IS_FIRST_PROCESS"
	)
    public Boolean getIsFirstProcess() {
        return null == isFirstProcess ? false : isFirstProcess;
    }
	/**
	 * 设置首道工序.
	 * @param isFirstProcess 首道工序
	 */
    public void setIsFirstProcess(Boolean isFirstProcess) {
        this.isFirstProcess = isFirstProcess;
    }
	/**
	 * 获取末道工序.
	 * 
	 * @return 末道工序
	 */
	@Column(nullable=true

		,name="IS_LAST_PROCESS"
	)
    public Boolean getIsLastProcess() {
        return null == isLastProcess ? false : isLastProcess;
    }
	/**
	 * 设置末道工序.
	 * @param isLastProcess 末道工序
	 */
    public void setIsLastProcess(Boolean isLastProcess) {
        this.isLastProcess = isLastProcess;
    }
	/**
	 * 获取是否新建.
	 * 
	 * @return 是否新建
	 */
	@Column(nullable=true

		,name="IS_NEW_CREATE"
	)
    public Boolean getIsNewCreate() {
        return null == isNewCreate ? false : isNewCreate;
    }
	/**
	 * 设置是否新建.
	 * @param isNewCreate 是否新建
	 */
    public void setIsNewCreate(Boolean isNewCreate) {
        this.isNewCreate = isNewCreate;
    }
	/**
	 * 获取标准时长(分).
	 * 
	 * @return 标准时长(分)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LONG_TIME"
	)
    public java.math.BigDecimal getLongTime() {
        return longTime;
    }
	/**
	 * 设置标准时长(分).
	 * @param longTime 标准时长(分)
	 */
    public void setLongTime(java.math.BigDecimal longTime) {
        this.longTime = longTime;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
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
	 * 获取工序名称.
	 * 
	 * @return 工序名称
	 */
	@Column(

		length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置工序名称.
	 * @param name 工序名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取接续方式.
	 * 
	 * @return 接续方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PERSIST_MODE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getPersistMode() {
		return persistMode;
	}
	/**
	 * 设置接续方式.
	 * @param persistMode 接续方式
	 */
	public void setPersistMode(SystemCode persistMode) {
		this.persistMode = (SystemCode) persistMode;
	}
	/**
	 * 获取工序编码.
	 * 
	 * @return 工序编码
	 */
	@Column(nullable=true

		,length = 256
		,name="PROCESS_CODE"
	)
    public String getProcessCode() {
        return processCode;
    }
	/**
	 * 设置工序编码.
	 * @param processCode 工序编码
	 */
    public void setProcessCode(String processCode) {
        this.processCode = processCode;
    }
	/**
	 * 获取表单号.
	 * 
	 * @return 表单号
	 */
	@Column(nullable=true

		,name="PROCESS_TABLE_ID"
	)
    public Long getProcessTableId() {
        return processTableId;
    }
	/**
	 * 设置表单号.
	 * @param processTableId 表单号
	 */
    public void setProcessTableId(Long processTableId) {
        this.processTableId = processTableId;
    }
	@ManyToOne
	@JoinColumn(name = "PROCESS_TYPE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMProcessType getProcessType() {
        return processType;
    }
    public void setProcessType(RMProcessType processType) {
        this.processType = processType;
    }
	/**
	 * 获取执行顺序.
	 * 
	 * @return 执行顺序
	 */
	@Column(nullable=true

		,length = 256
		,name="PROC_SORT"
	)
    public String getProcSort() {
        return procSort;
    }
	/**
	 * 设置执行顺序.
	 * @param procSort 执行顺序
	 */
    public void setProcSort(String procSort) {
        this.procSort = procSort;
    }
	/**
	 * 获取工序间隔时间.
	 * 
	 * @return 工序间隔时间
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="TRANS_TIME"
	)
    public java.math.BigDecimal getTransTime() {
        return transTime;
    }
	/**
	 * 设置工序间隔时间.
	 * @param transTime 工序间隔时间
	 */
    public void setTransTime(java.math.BigDecimal transTime) {
        this.transTime = transTime;
    }
	/**
	 * 获取升版前ID.
	 * 
	 * @return 升版前ID
	 */
	@Column(nullable=true

		,name="UP_VERSION_ID"
	)
    public Long getUpVersionId() {
        return upVersionId;
    }
	/**
	 * 设置升版前ID.
	 * @param upVersionId 升版前ID
	 */
    public void setUpVersionId(Long upVersionId) {
        this.upVersionId = upVersionId;
    }
	
	
	protected String _getEntityName() {
		return RMFormulaProcess.class.getName();
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
	private String processIdBeforeProcessIDDeleteIds;
	private String processIdBeforeProcessIDAddIds;
	private String processIdBeforeProcessIDmultiselectIDs;
	private String processIdBeforeProcessIDmultiselectNames;

	@javax.persistence.Transient
	public String getProcessIdBeforeProcessIDDeleteIds(){
		return this.processIdBeforeProcessIDDeleteIds;
	}

	public void setProcessIdBeforeProcessIDDeleteIds(String deleteIds){
		this.processIdBeforeProcessIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getProcessIdBeforeProcessIDmultiselectIDs(){
		return this.processIdBeforeProcessIDmultiselectIDs;
	}

	public void setProcessIdBeforeProcessIDmultiselectIDs(String multiselectIDs){
		this.processIdBeforeProcessIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getProcessIdBeforeProcessIDmultiselectNames(){
		return this.processIdBeforeProcessIDmultiselectNames;
	}

	public void setProcessIdBeforeProcessIDmultiselectNames(String multiselectNames){
		this.processIdBeforeProcessIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getProcessIdBeforeProcessIDAddIds(){
		return this.processIdBeforeProcessIDAddIds;
	}

	public void setProcessIdBeforeProcessIDAddIds(String addIds){
		this.processIdBeforeProcessIDAddIds = addIds;
	}

	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_bigintparamc")
	private Integer bigintparamc;
	
	@Column
    public Integer getBigintparamc() {
        return bigintparamc;
    }
	
    public void setBigintparamc(Integer bigintparamc) {
        this.bigintparamc = bigintparamc;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_bigintparamd")
	private Integer bigintparamd;
	
	@Column
    public Integer getBigintparamd() {
        return bigintparamd;
    }
	
    public void setBigintparamd(Integer bigintparamd) {
        this.bigintparamd = bigintparamd;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_bigintparame")
	private Integer bigintparame;
	
	@Column
    public Integer getBigintparame() {
        return bigintparame;
    }
	
    public void setBigintparame(Integer bigintparame) {
        this.bigintparame = bigintparame;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_charparamc")
	private String charparamc;
	
	@Column
    public String getCharparamc() {
        return charparamc;
    }
	
    public void setCharparamc(String charparamc) {
        this.charparamc = charparamc;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_charparamd")
	private String charparamd;
	
	@Column
    public String getCharparamd() {
        return charparamd;
    }
	
    public void setCharparamd(String charparamd) {
        this.charparamd = charparamd;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_charparame")
	private String charparame;
	
	@Column
    public String getCharparame() {
        return charparame;
    }
	
    public void setCharparame(String charparame) {
        this.charparame = charparame;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_numberparamc")
	private java.math.BigDecimal numberparamc;
	
	@Column
    public java.math.BigDecimal getNumberparamc() {
        return numberparamc;
    }
	
    public void setNumberparamc(java.math.BigDecimal numberparamc) {
        this.numberparamc = numberparamc;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_objparamc", complex = true)
	private Long objparamc;
	
	@Column
	public Long getObjparamc() {
		return objparamc;
	}
	
	public void setObjparamc(Long objparamc) {
		this.objparamc = objparamc;
	}

	private String objparamcMainDisplay;
	
	@Transient
	public String getObjparamcMainDisplay() {
		return objparamcMainDisplay;
	}
	
	public void setObjparamcMainDisplay(String objparamcMainDisplay) {
		this.objparamcMainDisplay = objparamcMainDisplay;
	}
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcess_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
