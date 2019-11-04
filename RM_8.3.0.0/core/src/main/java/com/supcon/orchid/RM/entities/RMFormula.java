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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
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
import com.supcon.orchid.RM.entities.RMFormulaSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 配方表.
 */
@javax.persistence.Entity(name=RMFormula.JPA_NAME)
@Table(name = RMFormula.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_Formula")
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
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaConvertor.class})
public class RMFormula extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_Formula";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "rm_formulas";
	public static final String JPA_NAME = "RMFormula";


		private Boolean advanceCharge = false; // 允许提前放料
	private SystemCode autoReportOnFinish
; // 完成后自动报工


		private Boolean batchContral = false; // 批控
	private RMBatchFormulaMain batchFormula;


		private String batchFormulaCode ; // 批控配方编码


		private java.math.BigDecimal batchFormulaEdition ; // 批控版本


		private String batchFormulaID ; // 批控配方ID


		private Boolean batchOverOnFinish = false; // 批控结束即完成

		@BAPIsMneCode
		private String code ; // 配方编码


		private String description ; // 描述


		private java.math.BigDecimal edition ; // 版本


		private String editions ; // 配方版本

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 停用时间


		private String feedCondition ; // 放料条件
	private SystemCode feedingMode
; // 投料模式
	private RMFormulaType formulaType;
	private SystemCode interfaceUrl
; // 中间接口服务地址


		private Boolean isAnaly = false; // 统计标识

		private Boolean isDafault = 
			Boolean.valueOf("false")
		; // 默认配方, 


		private Boolean isForProduct = false; // 生产配方


		private Boolean isUseFormulaBom = false; // 启用配方BOM


		private java.math.BigDecimal longTime ; // 标准时长(分)
	private MESBasicProduct mainMetarial;

		@BAPIsMneCode
		private String name ; // 标识
	private RMPickSite pickSite;


		private Long processTableId ; // 表单号
	private SystemCode produceType
; // 生产性质
	private MESBasicProduct product;
	private RMStand qualityStandard;
	private RMSampleProj sampleProj;


		private Boolean saveFlag = false; // 保存标识
	private SystemCode setProcess
; // 配方属性

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 启用时间
	private SystemCode state
; // 状态


		private Boolean supportEbr = false; // 支持EBR


		private java.math.BigDecimal theoreYield ; // 理论收率(%)
	private SystemCode usedFor
; // 用途


		private String yieldFormula ; // 收率公式


		private String yieldRange ; // 批产范围
	
	private List<RMCheckDepartmentSet> checkDepartmentSetList;
	
	public void setCheckDepartmentSetList(List<RMCheckDepartmentSet> checkDepartmentSetList){
		this.checkDepartmentSetList = checkDepartmentSetList;
	}
	@Transient
	public List<RMCheckDepartmentSet> getCheckDepartmentSetList(){
		return checkDepartmentSetList;
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
	
	@Index(name="IDX_FORMULA_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	/**
	 * 获取允许提前放料.
	 * 
	 * @return 允许提前放料
	 */
	@Column(nullable=true

		,name="ADVANCE_CHARGE"
	)
    public Boolean getAdvanceCharge() {
        return null == advanceCharge ? false : advanceCharge;
    }
	/**
	 * 设置允许提前放料.
	 * @param advanceCharge 允许提前放料
	 */
    public void setAdvanceCharge(Boolean advanceCharge) {
        this.advanceCharge = advanceCharge;
    }
	/**
	 * 获取完成后自动报工.
	 * 
	 * @return 完成后自动报工
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="AUTO_REPORT_ON_FINISH", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getAutoReportOnFinish() {
		return autoReportOnFinish;
	}
	/**
	 * 设置完成后自动报工.
	 * @param autoReportOnFinish 完成后自动报工
	 */
	public void setAutoReportOnFinish(SystemCode autoReportOnFinish) {
		this.autoReportOnFinish = (SystemCode) autoReportOnFinish;
	}
	/**
	 * 获取批控.
	 * 
	 * @return 批控
	 */
	@Column(nullable=true

		,name="BATCH_CONTRAL"
	)
    public Boolean getBatchContral() {
        return null == batchContral ? false : batchContral;
    }
	/**
	 * 设置批控.
	 * @param batchContral 批控
	 */
    public void setBatchContral(Boolean batchContral) {
        this.batchContral = batchContral;
    }
	@OneToOne
	@JoinColumn(name = "BATCH_FORMULA", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMBatchFormulaMain getBatchFormula() {
        return batchFormula;
    }
    public void setBatchFormula(RMBatchFormulaMain batchFormula) {
        this.batchFormula = batchFormula;
    }
	/**
	 * 获取批控配方编码.
	 * 
	 * @return 批控配方编码
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_FORMULA_CODE"
	)
    public String getBatchFormulaCode() {
        return batchFormulaCode;
    }
	/**
	 * 设置批控配方编码.
	 * @param batchFormulaCode 批控配方编码
	 */
    public void setBatchFormulaCode(String batchFormulaCode) {
        this.batchFormulaCode = batchFormulaCode;
    }
	/**
	 * 获取批控版本.
	 * 
	 * @return 批控版本
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="BATCH_FORMULA_EDITION"
	)
    public java.math.BigDecimal getBatchFormulaEdition() {
        return batchFormulaEdition;
    }
	/**
	 * 设置批控版本.
	 * @param batchFormulaEdition 批控版本
	 */
    public void setBatchFormulaEdition(java.math.BigDecimal batchFormulaEdition) {
        this.batchFormulaEdition = batchFormulaEdition;
    }
	/**
	 * 获取批控配方ID.
	 * 
	 * @return 批控配方ID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_FORMULAID"
	)
    public String getBatchFormulaID() {
        return batchFormulaID;
    }
	/**
	 * 设置批控配方ID.
	 * @param batchFormulaID 批控配方ID
	 */
    public void setBatchFormulaID(String batchFormulaID) {
        this.batchFormulaID = batchFormulaID;
    }
	/**
	 * 获取批控结束即完成.
	 * 
	 * @return 批控结束即完成
	 */
	@Column(nullable=true

		,name="BATCH_OVER_ON_FINISH"
	)
    public Boolean getBatchOverOnFinish() {
        return null == batchOverOnFinish ? false : batchOverOnFinish;
    }
	/**
	 * 设置批控结束即完成.
	 * @param batchOverOnFinish 批控结束即完成
	 */
    public void setBatchOverOnFinish(Boolean batchOverOnFinish) {
        this.batchOverOnFinish = batchOverOnFinish;
    }
	/**
	 * 获取配方编码.
	 * 
	 * @return 配方编码
	 */
	@Column(nullable=true

		,name="CODE"
	)
    public String getCode() {
        return code;
    }
	/**
	 * 设置配方编码.
	 * @param code 配方编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取描述.
	 * 
	 * @return 描述
	 */
	@Column(nullable=true

		,length = 256
		,name="DESCRIPTION"
	)
    public String getDescription() {
        return description;
    }
	/**
	 * 设置描述.
	 * @param description 描述
	 */
    public void setDescription(String description) {
        this.description = description;
    }
	/**
	 * 获取版本.
	 * 
	 * @return 版本
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="EDITION"
	)
    public java.math.BigDecimal getEdition() {
        return edition;
    }
	/**
	 * 设置版本.
	 * @param edition 版本
	 */
    public void setEdition(java.math.BigDecimal edition) {
        this.edition = edition;
    }
	/**
	 * 获取配方版本.
	 * 
	 * @return 配方版本
	 */
	@Column(nullable=true

		,length = 256
		,name="EDITIONS"
	)
    public String getEditions() {
        return editions;
    }
	/**
	 * 设置配方版本.
	 * @param editions 配方版本
	 */
    public void setEditions(String editions) {
        this.editions = editions;
    }
	/**
	 * 获取停用时间.
	 * 
	 * @return 停用时间
	 */
	@Column(nullable=true

		,name="END_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getEndTime() {
        return endTime;
    }
	/**
	 * 设置停用时间.
	 * @param endTime 停用时间
	 */
    public void setEndTime(java.util.Date endTime) {
        this.endTime = endTime;
    }
	/**
	 * 获取放料条件.
	 * 
	 * @return 放料条件
	 */
	@Column(nullable=true

		,length = 2000
		,name="FEED_CONDITION"
	)
    public String getFeedCondition() {
        return feedCondition;
    }
	/**
	 * 设置放料条件.
	 * @param feedCondition 放料条件
	 */
    public void setFeedCondition(String feedCondition) {
        this.feedCondition = feedCondition;
    }
	/**
	 * 获取投料模式.
	 * 
	 * @return 投料模式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="FEEDING_MODE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getFeedingMode() {
		return feedingMode;
	}
	/**
	 * 设置投料模式.
	 * @param feedingMode 投料模式
	 */
	public void setFeedingMode(SystemCode feedingMode) {
		this.feedingMode = (SystemCode) feedingMode;
	}
	@OneToOne
	@JoinColumn(name = "FORMULA_TYPE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaType getFormulaType() {
        return formulaType;
    }
    public void setFormulaType(RMFormulaType formulaType) {
        this.formulaType = formulaType;
    }
	/**
	 * 获取中间接口服务地址.
	 * 
	 * @return 中间接口服务地址
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="INTERFACE_URL", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getInterfaceUrl() {
		return interfaceUrl;
	}
	/**
	 * 设置中间接口服务地址.
	 * @param interfaceUrl 中间接口服务地址
	 */
	public void setInterfaceUrl(SystemCode interfaceUrl) {
		this.interfaceUrl = (SystemCode) interfaceUrl;
	}
	/**
	 * 获取统计标识.
	 * 
	 * @return 统计标识
	 */
	@Column(nullable=true

		,name="IS_ANALY"
	)
    public Boolean getIsAnaly() {
        return null == isAnaly ? false : isAnaly;
    }
	/**
	 * 设置统计标识.
	 * @param isAnaly 统计标识
	 */
    public void setIsAnaly(Boolean isAnaly) {
        this.isAnaly = isAnaly;
    }
	/**
	 * 获取默认配方.
	 * 
	 * @return 默认配方
	 */
	@Column(nullable=true

		,name="IS_DAFAULT"
	)
    public Boolean getIsDafault() {
        return null == isDafault ? false : isDafault;
    }
	/**
	 * 设置默认配方.
	 * @param isDafault 默认配方
	 */
    public void setIsDafault(Boolean isDafault) {
        this.isDafault = isDafault;
    }
	/**
	 * 获取生产配方.
	 * 
	 * @return 生产配方
	 */
	@Column(nullable=true

		,name="IS_FOR_PRODUCT"
	)
    public Boolean getIsForProduct() {
        return null == isForProduct ? false : isForProduct;
    }
	/**
	 * 设置生产配方.
	 * @param isForProduct 生产配方
	 */
    public void setIsForProduct(Boolean isForProduct) {
        this.isForProduct = isForProduct;
    }
	/**
	 * 获取启用配方BOM.
	 * 
	 * @return 启用配方BOM
	 */
	@Column(nullable=true

		,name="IS_USE_FORMULA_BOM"
	)
    public Boolean getIsUseFormulaBom() {
        return null == isUseFormulaBom ? false : isUseFormulaBom;
    }
	/**
	 * 设置启用配方BOM.
	 * @param isUseFormulaBom 启用配方BOM
	 */
    public void setIsUseFormulaBom(Boolean isUseFormulaBom) {
        this.isUseFormulaBom = isUseFormulaBom;
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
	@ManyToOne
	@JoinColumn(name = "MAIN_METARIAL", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getMainMetarial() {
        return mainMetarial;
    }
    public void setMainMetarial(MESBasicProduct mainMetarial) {
        this.mainMetarial = mainMetarial;
    }
	/**
	 * 获取标识.
	 * 
	 * @return 标识
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置标识.
	 * @param name 标识
	 */
    public void setName(String name) {
        this.name = name;
    }
	@OneToOne
	@JoinColumn(name = "PICK_SITE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMPickSite getPickSite() {
        return pickSite;
    }
    public void setPickSite(RMPickSite pickSite) {
        this.pickSite = pickSite;
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
	/**
	 * 获取生产性质.
	 * 
	 * @return 生产性质
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PRODUCE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getProduceType() {
		return produceType;
	}
	/**
	 * 设置生产性质.
	 * @param produceType 生产性质
	 */
	public void setProduceType(SystemCode produceType) {
		this.produceType = (SystemCode) produceType;
	}
	@ManyToOne
	@JoinColumn(name = "PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct() {
        return product;
    }
    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }
	@OneToOne
	@JoinColumn(name = "QUALITY_STANDARD", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMStand getQualityStandard() {
        return qualityStandard;
    }
    public void setQualityStandard(RMStand qualityStandard) {
        this.qualityStandard = qualityStandard;
    }
	@OneToOne
	@JoinColumn(name = "SAMPLE_PROJ", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMSampleProj getSampleProj() {
        return sampleProj;
    }
    public void setSampleProj(RMSampleProj sampleProj) {
        this.sampleProj = sampleProj;
    }
	/**
	 * 获取保存标识.
	 * 
	 * @return 保存标识
	 */
	@Column(nullable=true

		,name="SAVE_FLAG"
	)
    public Boolean getSaveFlag() {
        return null == saveFlag ? false : saveFlag;
    }
	/**
	 * 设置保存标识.
	 * @param saveFlag 保存标识
	 */
    public void setSaveFlag(Boolean saveFlag) {
        this.saveFlag = saveFlag;
    }
	/**
	 * 获取配方属性.
	 * 
	 * @return 配方属性
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="SET_PROCESS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getSetProcess() {
		return setProcess;
	}
	/**
	 * 设置配方属性.
	 * @param setProcess 配方属性
	 */
	public void setSetProcess(SystemCode setProcess) {
		this.setProcess = (SystemCode) setProcess;
	}
	/**
	 * 获取启用时间.
	 * 
	 * @return 启用时间
	 */
	@Column(nullable=true

		,name="START_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getStartTime() {
        return startTime;
    }
	/**
	 * 设置启用时间.
	 * @param startTime 启用时间
	 */
    public void setStartTime(java.util.Date startTime) {
        this.startTime = startTime;
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
	 * 获取支持EBR.
	 * 
	 * @return 支持EBR
	 */
	@Column(nullable=true

		,name="SUPPORT_EBR"
	)
    public Boolean getSupportEbr() {
        return null == supportEbr ? false : supportEbr;
    }
	/**
	 * 设置支持EBR.
	 * @param supportEbr 支持EBR
	 */
    public void setSupportEbr(Boolean supportEbr) {
        this.supportEbr = supportEbr;
    }
	/**
	 * 获取理论收率(%).
	 * 
	 * @return 理论收率(%)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="THEORE_YIELD"
	)
    public java.math.BigDecimal getTheoreYield() {
        return theoreYield;
    }
	/**
	 * 设置理论收率(%).
	 * @param theoreYield 理论收率(%)
	 */
    public void setTheoreYield(java.math.BigDecimal theoreYield) {
        this.theoreYield = theoreYield;
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
	/**
	 * 获取收率公式.
	 * 
	 * @return 收率公式
	 */
	@Column(nullable=true

		,length = 256
		,name="YIELD_FORMULA"
	)
    public String getYieldFormula() {
        return yieldFormula;
    }
	/**
	 * 设置收率公式.
	 * @param yieldFormula 收率公式
	 */
    public void setYieldFormula(String yieldFormula) {
        this.yieldFormula = yieldFormula;
    }
	/**
	 * 获取批产范围.
	 * 
	 * @return 批产范围
	 */
	@Column(nullable=true

		,length = 256
		,name="YIELD_RANGE"
	)
    public String getYieldRange() {
        return yieldRange;
    }
	/**
	 * 设置批产范围.
	 * @param yieldRange 批产范围
	 */
    public void setYieldRange(String yieldRange) {
        this.yieldRange = yieldRange;
    }
	
	
	protected String _getEntityName() {
		return RMFormula.class.getName();
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
	private String formulaIDApplyCheckStaffDeleteIds;
	private String formulaIDApplyCheckStaffAddIds;
	private String formulaIDApplyCheckStaffmultiselectIDs;
	private String formulaIDApplyCheckStaffmultiselectNames;

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckStaffDeleteIds(){
		return this.formulaIDApplyCheckStaffDeleteIds;
	}

	public void setFormulaIDApplyCheckStaffDeleteIds(String deleteIds){
		this.formulaIDApplyCheckStaffDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckStaffmultiselectIDs(){
		return this.formulaIDApplyCheckStaffmultiselectIDs;
	}

	public void setFormulaIDApplyCheckStaffmultiselectIDs(String multiselectIDs){
		this.formulaIDApplyCheckStaffmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckStaffmultiselectNames(){
		return this.formulaIDApplyCheckStaffmultiselectNames;
	}

	public void setFormulaIDApplyCheckStaffmultiselectNames(String multiselectNames){
		this.formulaIDApplyCheckStaffmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckStaffAddIds(){
		return this.formulaIDApplyCheckStaffAddIds;
	}

	public void setFormulaIDApplyCheckStaffAddIds(String addIds){
		this.formulaIDApplyCheckStaffAddIds = addIds;
	}
	private String formulaIDFactoryIDDeleteIds;
	private String formulaIDFactoryIDAddIds;
	private String formulaIDFactoryIDmultiselectIDs;
	private String formulaIDFactoryIDmultiselectNames;

	@javax.persistence.Transient
	public String getFormulaIDFactoryIDDeleteIds(){
		return this.formulaIDFactoryIDDeleteIds;
	}

	public void setFormulaIDFactoryIDDeleteIds(String deleteIds){
		this.formulaIDFactoryIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getFormulaIDFactoryIDmultiselectIDs(){
		return this.formulaIDFactoryIDmultiselectIDs;
	}

	public void setFormulaIDFactoryIDmultiselectIDs(String multiselectIDs){
		this.formulaIDFactoryIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getFormulaIDFactoryIDmultiselectNames(){
		return this.formulaIDFactoryIDmultiselectNames;
	}

	public void setFormulaIDFactoryIDmultiselectNames(String multiselectNames){
		this.formulaIDFactoryIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getFormulaIDFactoryIDAddIds(){
		return this.formulaIDFactoryIDAddIds;
	}

	public void setFormulaIDFactoryIDAddIds(String addIds){
		this.formulaIDFactoryIDAddIds = addIds;
	}
	private String formulaIDActiveIDDeleteIds;
	private String formulaIDActiveIDAddIds;
	private String formulaIDActiveIDmultiselectIDs;
	private String formulaIDActiveIDmultiselectNames;

	@javax.persistence.Transient
	public String getFormulaIDActiveIDDeleteIds(){
		return this.formulaIDActiveIDDeleteIds;
	}

	public void setFormulaIDActiveIDDeleteIds(String deleteIds){
		this.formulaIDActiveIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getFormulaIDActiveIDmultiselectIDs(){
		return this.formulaIDActiveIDmultiselectIDs;
	}

	public void setFormulaIDActiveIDmultiselectIDs(String multiselectIDs){
		this.formulaIDActiveIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getFormulaIDActiveIDmultiselectNames(){
		return this.formulaIDActiveIDmultiselectNames;
	}

	public void setFormulaIDActiveIDmultiselectNames(String multiselectNames){
		this.formulaIDActiveIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getFormulaIDActiveIDAddIds(){
		return this.formulaIDActiveIDAddIds;
	}

	public void setFormulaIDActiveIDAddIds(String addIds){
		this.formulaIDActiveIDAddIds = addIds;
	}
	private String formulaIDApplyCheckDeptDeleteIds;
	private String formulaIDApplyCheckDeptAddIds;
	private String formulaIDApplyCheckDeptmultiselectIDs;
	private String formulaIDApplyCheckDeptmultiselectNames;

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckDeptDeleteIds(){
		return this.formulaIDApplyCheckDeptDeleteIds;
	}

	public void setFormulaIDApplyCheckDeptDeleteIds(String deleteIds){
		this.formulaIDApplyCheckDeptDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckDeptmultiselectIDs(){
		return this.formulaIDApplyCheckDeptmultiselectIDs;
	}

	public void setFormulaIDApplyCheckDeptmultiselectIDs(String multiselectIDs){
		this.formulaIDApplyCheckDeptmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckDeptmultiselectNames(){
		return this.formulaIDApplyCheckDeptmultiselectNames;
	}

	public void setFormulaIDApplyCheckDeptmultiselectNames(String multiselectNames){
		this.formulaIDApplyCheckDeptmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getFormulaIDApplyCheckDeptAddIds(){
		return this.formulaIDApplyCheckDeptAddIds;
	}

	public void setFormulaIDApplyCheckDeptAddIds(String addIds){
		this.formulaIDApplyCheckDeptAddIds = addIds;
	}
	private String formulaIDExeCheckDeptDeleteIds;
	private String formulaIDExeCheckDeptAddIds;
	private String formulaIDExeCheckDeptmultiselectIDs;
	private String formulaIDExeCheckDeptmultiselectNames;

	@javax.persistence.Transient
	public String getFormulaIDExeCheckDeptDeleteIds(){
		return this.formulaIDExeCheckDeptDeleteIds;
	}

	public void setFormulaIDExeCheckDeptDeleteIds(String deleteIds){
		this.formulaIDExeCheckDeptDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getFormulaIDExeCheckDeptmultiselectIDs(){
		return this.formulaIDExeCheckDeptmultiselectIDs;
	}

	public void setFormulaIDExeCheckDeptmultiselectIDs(String multiselectIDs){
		this.formulaIDExeCheckDeptmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getFormulaIDExeCheckDeptmultiselectNames(){
		return this.formulaIDExeCheckDeptmultiselectNames;
	}

	public void setFormulaIDExeCheckDeptmultiselectNames(String multiselectNames){
		this.formulaIDExeCheckDeptmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getFormulaIDExeCheckDeptAddIds(){
		return this.formulaIDExeCheckDeptAddIds;
	}

	public void setFormulaIDExeCheckDeptAddIds(String addIds){
		this.formulaIDExeCheckDeptAddIds = addIds;
	}
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<RMFormulaSupervision> supervisionList;

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

	public void setSupervisionList(List<RMFormulaSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<RMFormulaSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_Formula_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
