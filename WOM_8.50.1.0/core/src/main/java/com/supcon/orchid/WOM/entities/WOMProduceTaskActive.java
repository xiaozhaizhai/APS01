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
import com.supcon.orchid.publicSet.entities.PublicSetActBatState;		
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.RM.entities.RMFormulaBom;		
import com.supcon.orchid.RM.entities.RMFormula;		
import com.supcon.orchid.RM.entities.RMFormulaProcess;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 用料活动.
 */
@javax.persistence.Entity(name=WOMProduceTaskActive.JPA_NAME)
@Table(name = WOMProduceTaskActive.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_ProduceTaskActive")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMProduceTaskActiveConvertor.class})
public class WOMProduceTaskActive extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_ProduceTaskActive";
	public static final String DOC_TYPE = "WOM_produceTask_produceTaskActive";
	public static final String TABLE_NAME = "wom_produce_task_actives";
	public static final String JPA_NAME = "WOMProduceTaskActive";
	private PublicSetActBatState activeBatchState;
	private RMFormulaProcessActive activeId;
	private SystemCode activeSource
; // 活动来源
	private SystemCode activeState
		= new SystemCode("processState/state01")
		; // 活动状态
	private SystemCode activeType
; // 活动类型


		private Integer actOrder ; // 投料顺序


		private java.math.BigDecimal actualNum ; // 实际投料量
	private WOMStandingcropRef batchNumObj;


		private String batchPhaseID ; // 批控PhaseID

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 活动结束时间


		private String execSort ; // 执行顺序


		private Integer exeOrder ; // 执行顺序
	private SystemCode exeSystem
; // 执行系统
	private MESBasicFactoryModel factoryId;


		private Boolean finalInspection = false; // 完工检验
	private RMFormulaBom formulaBom;
	private RMFormula formulaId;
	private WOMProduceTask headID;


		private String inspectResult ; // 替代料


		private Boolean isBackMix = false; // 是否回掺活动


		private Boolean isBatchAna = false; // 工艺监测


		private Boolean isMixQuality = false; // 固定数量


		private Boolean isOtherActive = false; // 配方外活动(废)


		private Boolean isReplace = false; // 替代料


		private java.math.BigDecimal lossRate ; // 损耗率(%)


		private java.math.BigDecimal maxQuality ; // 区间上限


		private java.math.BigDecimal minQuality ; // 区间下限


		private Boolean mobileTerminal = false; // 移动端执行


		private String name ; // 活动名称


		private Boolean needWeigh = false; // 需要称重


		private Integer offerOrder ; // 配料顺序


		private String operartionID ; // operartionID


		private String oprate ; // 操作
	private WOMProduceTaskProcess orderProcessId;


		private java.math.BigDecimal outputNum ; // 产出量


		private Boolean parentActive = false; // 父活动


		private Long parentActiveId ; // 父活动ID


		private Integer phase ; // 阶段


		private java.math.BigDecimal planNum ; // 计划数量
	private RMFormulaProcess processId;
	private MESBasicProduct productId;
	private SystemCode property
; // 性质
	private RMFormulaProcessActive putBatMateId;


		private Long rejectsDeal ; // 不良品处理单


		private String remark ; // 备注


		private Integer sequence ; // 次序


		private java.math.BigDecimal standardNum ; // 理论数量

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 活动开始时间
	
	
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
	
	
	@Index(name="IDX_PRODUCETASKACTI_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@ManyToOne
	@JoinColumn(name = "ACTIVE_BATCH_STATE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public PublicSetActBatState getActiveBatchState() {
        return activeBatchState;
    }
    public void setActiveBatchState(PublicSetActBatState activeBatchState) {
        this.activeBatchState = activeBatchState;
    }
	@ManyToOne
	@JoinColumn(name = "ACTIVE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getActiveId() {
        return activeId;
    }
    public void setActiveId(RMFormulaProcessActive activeId) {
        this.activeId = activeId;
    }
	/**
	 * 获取活动来源.
	 * 
	 * @return 活动来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_SOURCE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveSource() {
		return activeSource;
	}
	/**
	 * 设置活动来源.
	 * @param activeSource 活动来源
	 */
	public void setActiveSource(SystemCode activeSource) {
		this.activeSource = (SystemCode) activeSource;
	}
	/**
	 * 获取活动状态.
	 * 
	 * @return 活动状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveState() {
		return activeState;
	}
	/**
	 * 设置活动状态.
	 * @param activeState 活动状态
	 */
	public void setActiveState(SystemCode activeState) {
		this.activeState = (SystemCode) activeState;
	}
	/**
	 * 获取活动类型.
	 * 
	 * @return 活动类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveType() {
		return activeType;
	}
	/**
	 * 设置活动类型.
	 * @param activeType 活动类型
	 */
	public void setActiveType(SystemCode activeType) {
		this.activeType = (SystemCode) activeType;
	}
	/**
	 * 获取投料顺序.
	 * 
	 * @return 投料顺序
	 */
	@Column(nullable=true

		,name="ACT_ORDER"
	)
    public Integer getActOrder() {
        return actOrder;
    }
	/**
	 * 设置投料顺序.
	 * @param actOrder 投料顺序
	 */
    public void setActOrder(Integer actOrder) {
        this.actOrder = actOrder;
    }
	/**
	 * 获取实际投料量.
	 * 
	 * @return 实际投料量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ACTUAL_NUM"
	)
    public java.math.BigDecimal getActualNum() {
        return actualNum;
    }
	/**
	 * 设置实际投料量.
	 * @param actualNum 实际投料量
	 */
    public void setActualNum(java.math.BigDecimal actualNum) {
        this.actualNum = actualNum;
    }
	@ManyToOne
	@JoinColumn(name = "BATCH_NUM_OBJ", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMStandingcropRef getBatchNumObj() {
        return batchNumObj;
    }
    public void setBatchNumObj(WOMStandingcropRef batchNumObj) {
        this.batchNumObj = batchNumObj;
    }
	/**
	 * 获取批控PhaseID.
	 * 
	 * @return 批控PhaseID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_PHASEID"
	)
    public String getBatchPhaseID() {
        return batchPhaseID;
    }
	/**
	 * 设置批控PhaseID.
	 * @param batchPhaseID 批控PhaseID
	 */
    public void setBatchPhaseID(String batchPhaseID) {
        this.batchPhaseID = batchPhaseID;
    }
	/**
	 * 获取活动结束时间.
	 * 
	 * @return 活动结束时间
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
	 * 设置活动结束时间.
	 * @param endTime 活动结束时间
	 */
    public void setEndTime(java.util.Date endTime) {
        this.endTime = endTime;
    }
	/**
	 * 获取执行顺序.
	 * 
	 * @return 执行顺序
	 */
	@Column(nullable=true

		,length = 256
		,name="EXEC_SORT"
	)
    public String getExecSort() {
        return execSort;
    }
	/**
	 * 设置执行顺序.
	 * @param execSort 执行顺序
	 */
    public void setExecSort(String execSort) {
        this.execSort = execSort;
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
	 * 获取执行系统.
	 * 
	 * @return 执行系统
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="EXE_SYSTEM", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getExeSystem() {
		return exeSystem;
	}
	/**
	 * 设置执行系统.
	 * @param exeSystem 执行系统
	 */
	public void setExeSystem(SystemCode exeSystem) {
		this.exeSystem = (SystemCode) exeSystem;
	}
	@ManyToOne
	@JoinColumn(name = "FACTORY_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getFactoryId() {
        return factoryId;
    }
    public void setFactoryId(MESBasicFactoryModel factoryId) {
        this.factoryId = factoryId;
    }
	/**
	 * 获取完工检验.
	 * 
	 * @return 完工检验
	 */
	@Column(nullable=true

		,name="FINAL_INSPECTION"
	)
    public Boolean getFinalInspection() {
        return null == finalInspection ? false : finalInspection;
    }
	/**
	 * 设置完工检验.
	 * @param finalInspection 完工检验
	 */
    public void setFinalInspection(Boolean finalInspection) {
        this.finalInspection = finalInspection;
    }
	@ManyToOne
	@JoinColumn(name = "FORMULA_BOM", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaBom getFormulaBom() {
        return formulaBom;
    }
    public void setFormulaBom(RMFormulaBom formulaBom) {
        this.formulaBom = formulaBom;
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
	@ManyToOne
	@JoinColumn(name = "HEADID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getHeadID() {
        return headID;
    }
    public void setHeadID(WOMProduceTask headID) {
        this.headID = headID;
    }
	/**
	 * 获取替代料.
	 * 
	 * @return 替代料
	 */
	@Column(nullable=true

		,length = 256
		,name="INSPECT_RESULT"
	)
    public String getInspectResult() {
        return inspectResult;
    }
	/**
	 * 设置替代料.
	 * @param inspectResult 替代料
	 */
    public void setInspectResult(String inspectResult) {
        this.inspectResult = inspectResult;
    }
	/**
	 * 获取是否回掺活动.
	 * 
	 * @return 是否回掺活动
	 */
	@Column(nullable=true

		,name="IS_BACK_MIX"
	)
    public Boolean getIsBackMix() {
        return null == isBackMix ? false : isBackMix;
    }
	/**
	 * 设置是否回掺活动.
	 * @param isBackMix 是否回掺活动
	 */
    public void setIsBackMix(Boolean isBackMix) {
        this.isBackMix = isBackMix;
    }
	/**
	 * 获取工艺监测.
	 * 
	 * @return 工艺监测
	 */
	@Column(nullable=true

		,name="IS_BATCH_ANA"
	)
    public Boolean getIsBatchAna() {
        return null == isBatchAna ? false : isBatchAna;
    }
	/**
	 * 设置工艺监测.
	 * @param isBatchAna 工艺监测
	 */
    public void setIsBatchAna(Boolean isBatchAna) {
        this.isBatchAna = isBatchAna;
    }
	/**
	 * 获取固定数量.
	 * 
	 * @return 固定数量
	 */
	@Column(nullable=true

		,name="IS_MIX_QUALITY"
	)
    public Boolean getIsMixQuality() {
        return null == isMixQuality ? false : isMixQuality;
    }
	/**
	 * 设置固定数量.
	 * @param isMixQuality 固定数量
	 */
    public void setIsMixQuality(Boolean isMixQuality) {
        this.isMixQuality = isMixQuality;
    }
	/**
	 * 获取配方外活动(废).
	 * 
	 * @return 配方外活动(废)
	 */
	@Column(nullable=true

		,name="IS_OTHER_ACTIVE"
	)
    public Boolean getIsOtherActive() {
        return null == isOtherActive ? false : isOtherActive;
    }
	/**
	 * 设置配方外活动(废).
	 * @param isOtherActive 配方外活动(废)
	 */
    public void setIsOtherActive(Boolean isOtherActive) {
        this.isOtherActive = isOtherActive;
    }
	/**
	 * 获取替代料.
	 * 
	 * @return 替代料
	 */
	@Column(nullable=true

		,name="IS_REPLACE"
	)
    public Boolean getIsReplace() {
        return null == isReplace ? false : isReplace;
    }
	/**
	 * 设置替代料.
	 * @param isReplace 替代料
	 */
    public void setIsReplace(Boolean isReplace) {
        this.isReplace = isReplace;
    }
	/**
	 * 获取损耗率(%).
	 * 
	 * @return 损耗率(%)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LOSS_RATE"
	)
    public java.math.BigDecimal getLossRate() {
        return lossRate;
    }
	/**
	 * 设置损耗率(%).
	 * @param lossRate 损耗率(%)
	 */
    public void setLossRate(java.math.BigDecimal lossRate) {
        this.lossRate = lossRate;
    }
	/**
	 * 获取区间上限.
	 * 
	 * @return 区间上限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="MAX_QUALITY"
	)
    public java.math.BigDecimal getMaxQuality() {
        return maxQuality;
    }
	/**
	 * 设置区间上限.
	 * @param maxQuality 区间上限
	 */
    public void setMaxQuality(java.math.BigDecimal maxQuality) {
        this.maxQuality = maxQuality;
    }
	/**
	 * 获取区间下限.
	 * 
	 * @return 区间下限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="MIN_QUALITY"
	)
    public java.math.BigDecimal getMinQuality() {
        return minQuality;
    }
	/**
	 * 设置区间下限.
	 * @param minQuality 区间下限
	 */
    public void setMinQuality(java.math.BigDecimal minQuality) {
        this.minQuality = minQuality;
    }
	/**
	 * 获取移动端执行.
	 * 
	 * @return 移动端执行
	 */
	@Column(nullable=true

		,name="MOBILE_TERMINAL"
	)
    public Boolean getMobileTerminal() {
        return null == mobileTerminal ? false : mobileTerminal;
    }
	/**
	 * 设置移动端执行.
	 * @param mobileTerminal 移动端执行
	 */
    public void setMobileTerminal(Boolean mobileTerminal) {
        this.mobileTerminal = mobileTerminal;
    }
	/**
	 * 获取活动名称.
	 * 
	 * @return 活动名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置活动名称.
	 * @param name 活动名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取需要称重.
	 * 
	 * @return 需要称重
	 */
	@Column(nullable=true

		,name="NEED_WEIGH"
	)
    public Boolean getNeedWeigh() {
        return null == needWeigh ? false : needWeigh;
    }
	/**
	 * 设置需要称重.
	 * @param needWeigh 需要称重
	 */
    public void setNeedWeigh(Boolean needWeigh) {
        this.needWeigh = needWeigh;
    }
	/**
	 * 获取配料顺序.
	 * 
	 * @return 配料顺序
	 */
	@Column(nullable=true

		,name="OFFER_ORDER"
	)
    public Integer getOfferOrder() {
        return offerOrder;
    }
	/**
	 * 设置配料顺序.
	 * @param offerOrder 配料顺序
	 */
    public void setOfferOrder(Integer offerOrder) {
        this.offerOrder = offerOrder;
    }
	/**
	 * 获取operartionID.
	 * 
	 * @return operartionID
	 */
	@Column(nullable=true

		,length = 256
		,name="OPERARTIONID"
	)
    public String getOperartionID() {
        return operartionID;
    }
	/**
	 * 设置operartionID.
	 * @param operartionID operartionID
	 */
    public void setOperartionID(String operartionID) {
        this.operartionID = operartionID;
    }
	/**
	 * 获取操作.
	 * 
	 * @return 操作
	 */
	@Column(nullable=true

		,length = 256
		,name="OPRATE"
	)
    public String getOprate() {
        return oprate;
    }
	/**
	 * 设置操作.
	 * @param oprate 操作
	 */
    public void setOprate(String oprate) {
        this.oprate = oprate;
    }
	@ManyToOne
	@JoinColumn(name = "ORDER_PROCESS_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskProcess getOrderProcessId() {
        return orderProcessId;
    }
    public void setOrderProcessId(WOMProduceTaskProcess orderProcessId) {
        this.orderProcessId = orderProcessId;
    }
	/**
	 * 获取产出量.
	 * 
	 * @return 产出量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="OUTPUT_NUM"
	)
    public java.math.BigDecimal getOutputNum() {
        return outputNum;
    }
	/**
	 * 设置产出量.
	 * @param outputNum 产出量
	 */
    public void setOutputNum(java.math.BigDecimal outputNum) {
        this.outputNum = outputNum;
    }
	/**
	 * 获取父活动.
	 * 
	 * @return 父活动
	 */
	@Column(nullable=true

		,name="PARENT_ACTIVE"
	)
    public Boolean getParentActive() {
        return null == parentActive ? false : parentActive;
    }
	/**
	 * 设置父活动.
	 * @param parentActive 父活动
	 */
    public void setParentActive(Boolean parentActive) {
        this.parentActive = parentActive;
    }
	/**
	 * 获取父活动ID.
	 * 
	 * @return 父活动ID
	 */
	@Column(nullable=true

		,name="PARENT_ACTIVE_ID"
	)
    public Long getParentActiveId() {
        return parentActiveId;
    }
	/**
	 * 设置父活动ID.
	 * @param parentActiveId 父活动ID
	 */
    public void setParentActiveId(Long parentActiveId) {
        this.parentActiveId = parentActiveId;
    }
	/**
	 * 获取阶段.
	 * 
	 * @return 阶段
	 */
	@Column(nullable=true

		,name="PHASE"
	)
    public Integer getPhase() {
        return phase;
    }
	/**
	 * 设置阶段.
	 * @param phase 阶段
	 */
    public void setPhase(Integer phase) {
        this.phase = phase;
    }
	/**
	 * 获取计划数量.
	 * 
	 * @return 计划数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PLAN_NUM"
	)
    public java.math.BigDecimal getPlanNum() {
        return planNum;
    }
	/**
	 * 设置计划数量.
	 * @param planNum 计划数量
	 */
    public void setPlanNum(java.math.BigDecimal planNum) {
        this.planNum = planNum;
    }
	@ManyToOne
	@JoinColumn(name = "PROCESS_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcess getProcessId() {
        return processId;
    }
    public void setProcessId(RMFormulaProcess processId) {
        this.processId = processId;
    }
	@ManyToOne
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
	 * 获取性质.
	 * 
	 * @return 性质
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PROPERTY", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getProperty() {
		return property;
	}
	/**
	 * 设置性质.
	 * @param property 性质
	 */
	public void setProperty(SystemCode property) {
		this.property = (SystemCode) property;
	}
	@ManyToOne
	@JoinColumn(name = "PUT_BAT_MATE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getPutBatMateId() {
        return putBatMateId;
    }
    public void setPutBatMateId(RMFormulaProcessActive putBatMateId) {
        this.putBatMateId = putBatMateId;
    }
	/**
	 * 获取不良品处理单.
	 * 
	 * @return 不良品处理单
	 */
	@Column(nullable=true

		,name="REJECTS_DEAL"
	)
    public Long getRejectsDeal() {
        return rejectsDeal;
    }
	/**
	 * 设置不良品处理单.
	 * @param rejectsDeal 不良品处理单
	 */
    public void setRejectsDeal(Long rejectsDeal) {
        this.rejectsDeal = rejectsDeal;
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
	 * 获取次序.
	 * 
	 * @return 次序
	 */
	@Column(nullable=true

		,name="SEQUENCE"
	)
    public Integer getSequence() {
        return sequence;
    }
	/**
	 * 设置次序.
	 * @param sequence 次序
	 */
    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }
	/**
	 * 获取理论数量.
	 * 
	 * @return 理论数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="STANDARD_NUM"
	)
    public java.math.BigDecimal getStandardNum() {
        return standardNum;
    }
	/**
	 * 设置理论数量.
	 * @param standardNum 理论数量
	 */
    public void setStandardNum(java.math.BigDecimal standardNum) {
        this.standardNum = standardNum;
    }
	/**
	 * 获取活动开始时间.
	 * 
	 * @return 活动开始时间
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
	 * 设置活动开始时间.
	 * @param startTime 活动开始时间
	 */
    public void setStartTime(java.util.Date startTime) {
        this.startTime = startTime;
    }
	
	
	protected String _getEntityName() {
		return WOMProduceTaskActive.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskActive_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
