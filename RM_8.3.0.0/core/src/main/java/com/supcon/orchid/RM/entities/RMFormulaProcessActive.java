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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 工序活动.
 */
@javax.persistence.Entity(name=RMFormulaProcessActive.JPA_NAME)
@Table(name = RMFormulaProcessActive.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_FormulaProcessActive")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaProcessActiveConvertor.class})
public class RMFormulaProcessActive extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_FormulaProcessActive";
	public static final String DOC_TYPE = "RM_formula_formulaProcessActive";
	public static final String TABLE_NAME = "rm_formula_process_actives";
	public static final String JPA_NAME = "RMFormulaProcessActive";


		private Long activeHiddenId ; // 活动隐藏Id
	private SystemCode activeType
; // 类型
	private SystemCode activeTypeForBatch
; // 活动类型


		private Integer actOrder ; // 投料顺序


		private Boolean auto = false; // 控制系统执行


		private String batchPhaseID ; // 批控PhaseID


		private String batchPhaseName ; // 批控活动名称
	private SystemCode batchSite
; // 配料方式


		private Boolean channelOrManual = false; // 管道手工


		private String chcekTip ; // 确认提示


		private String container ; // 容器


		private Boolean copy = false; // 是否复制


		private String exeBillName ; // 处理表单


		private String exeBillUrl ; // 处理表单url


		private String execSort ; // 执行顺序


		private Integer exeOrder ; // 执行顺序
	private SystemCode exeSystem
; // 系统


		private Boolean finalInspection = false; // 完工检验


		private Long formulaHiddenId ; // 配方隐藏Id
	private RMFormula formulaId;
	private SystemCode fromContainer
; // 来自容器


		private java.math.BigDecimal hiddenSort ; // 隐藏顺序


		private Integer ingredientsOrder ; // 配料顺序


		private Boolean isAgile = false; // 是否机动投料


		private Boolean isAnaly = false; // 统计标识


		private Boolean isForAdjust = false; // 可用于调整


		private Boolean isForTemp = false; // 可机动执行


		private Boolean isMixQuality = false; // 固定数量


		private Boolean isMoreOther = false; // 是否其它活动


		private Boolean isPassCheck = false; // 是否放行检验


		private Boolean isReplace = false; // 替代料


		private Boolean isWatchActive = false; // 工艺监测
	private SystemCode itemClass
; // 位号属性


		private java.math.BigDecimal longTime ; // 标准时长(分)


		private java.math.BigDecimal lossRate ; // 损耗率(%)


		private Boolean mainActive = false; // 主要活动


		private java.math.BigDecimal maxQuality ; // 区间上限


		private String meno ; // 备注


		private java.math.BigDecimal minQuality ; // 区间下限


		private Long mixtureId ; // 工艺Id


		private Boolean mobileTerminal = false; // 移动端执行


		private String name ; // 活动名称


		private String ncActiveIndexs ; // 序号


		private String ncProcessCode ; // 工序编码


		private String ncProcessIndex ; // 工序号


		private String ncProcessName ; // 工序名称
	private SystemCode occurTurn
; // 发生于
	private RMPickSite pickSite;


		private Long processHiddenId ; // 工序Id
	private RMFormulaProcess processId;


		private Long processTableId ; // 表单号
	private MESBasicProduct product;
	private MESBasicProduct product2BOM;


		private String putinOrder ; // 投料顺序
	private RMStand qualityStandard;


		private java.math.BigDecimal standardQuantity ; // 单位数量


		private Integer subActiveNum ; // 子活动数量
	private RMSampleProj testProduct;


		private String typeName ; // 类型名称


		private Long upVersionId ; // 升版前Id
	
	
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
	
	
	@Index(name="IDX_FORMULAPROCESSA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取活动隐藏Id.
	 * 
	 * @return 活动隐藏Id
	 */
	@Column(nullable=true

		,name="ACTIVE_HIDDEN_ID"
	)
    public Long getActiveHiddenId() {
        return activeHiddenId;
    }
	/**
	 * 设置活动隐藏Id.
	 * @param activeHiddenId 活动隐藏Id
	 */
    public void setActiveHiddenId(Long activeHiddenId) {
        this.activeHiddenId = activeHiddenId;
    }
	/**
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveType() {
		return activeType;
	}
	/**
	 * 设置类型.
	 * @param activeType 类型
	 */
	public void setActiveType(SystemCode activeType) {
		this.activeType = (SystemCode) activeType;
	}
	/**
	 * 获取活动类型.
	 * 
	 * @return 活动类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_TYPE_FOR_BATCH", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveTypeForBatch() {
		return activeTypeForBatch;
	}
	/**
	 * 设置活动类型.
	 * @param activeTypeForBatch 活动类型
	 */
	public void setActiveTypeForBatch(SystemCode activeTypeForBatch) {
		this.activeTypeForBatch = (SystemCode) activeTypeForBatch;
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
	 * 获取控制系统执行.
	 * 
	 * @return 控制系统执行
	 */
	@Column(nullable=true

		,name="AUTO"
	)
    public Boolean getAuto() {
        return null == auto ? false : auto;
    }
	/**
	 * 设置控制系统执行.
	 * @param auto 控制系统执行
	 */
    public void setAuto(Boolean auto) {
        this.auto = auto;
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
	 * 获取批控活动名称.
	 * 
	 * @return 批控活动名称
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_PHASE_NAME"
	)
    public String getBatchPhaseName() {
        return batchPhaseName;
    }
	/**
	 * 设置批控活动名称.
	 * @param batchPhaseName 批控活动名称
	 */
    public void setBatchPhaseName(String batchPhaseName) {
        this.batchPhaseName = batchPhaseName;
    }
	/**
	 * 获取配料方式.
	 * 
	 * @return 配料方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BATCH_SITE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBatchSite() {
		return batchSite;
	}
	/**
	 * 设置配料方式.
	 * @param batchSite 配料方式
	 */
	public void setBatchSite(SystemCode batchSite) {
		this.batchSite = (SystemCode) batchSite;
	}
	/**
	 * 获取管道手工.
	 * 
	 * @return 管道手工
	 */
	@Column(nullable=true

		,name="CHANNEL_OR_MANUAL"
	)
    public Boolean getChannelOrManual() {
        return null == channelOrManual ? false : channelOrManual;
    }
	/**
	 * 设置管道手工.
	 * @param channelOrManual 管道手工
	 */
    public void setChannelOrManual(Boolean channelOrManual) {
        this.channelOrManual = channelOrManual;
    }
	/**
	 * 获取确认提示.
	 * 
	 * @return 确认提示
	 */
	@Column(nullable=true

		,length = 256
		,name="CHCEK_TIP"
	)
    public String getChcekTip() {
        return chcekTip;
    }
	/**
	 * 设置确认提示.
	 * @param chcekTip 确认提示
	 */
    public void setChcekTip(String chcekTip) {
        this.chcekTip = chcekTip;
    }
	/**
	 * 获取容器.
	 * 
	 * @return 容器
	 */
	@Column(nullable=true

		,length = 256
		,name="CONTAINER"
	)
    public String getContainer() {
        return container;
    }
	/**
	 * 设置容器.
	 * @param container 容器
	 */
    public void setContainer(String container) {
        this.container = container;
    }
	/**
	 * 获取是否复制.
	 * 
	 * @return 是否复制
	 */
	@Column(nullable=true

		,name="COPY"
	)
    public Boolean getCopy() {
        return null == copy ? false : copy;
    }
	/**
	 * 设置是否复制.
	 * @param copy 是否复制
	 */
    public void setCopy(Boolean copy) {
        this.copy = copy;
    }
	/**
	 * 获取处理表单.
	 * 
	 * @return 处理表单
	 */
	@Column(nullable=true

		,length = 256
		,name="EXE_BILL_NAME"
	)
    public String getExeBillName() {
        return exeBillName;
    }
	/**
	 * 设置处理表单.
	 * @param exeBillName 处理表单
	 */
    public void setExeBillName(String exeBillName) {
        this.exeBillName = exeBillName;
    }
	/**
	 * 获取处理表单url.
	 * 
	 * @return 处理表单url
	 */
	@Column(nullable=true

		,length = 256
		,name="EXE_BILL_URL"
	)
    public String getExeBillUrl() {
        return exeBillUrl;
    }
	/**
	 * 设置处理表单url.
	 * @param exeBillUrl 处理表单url
	 */
    public void setExeBillUrl(String exeBillUrl) {
        this.exeBillUrl = exeBillUrl;
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
	 * 获取系统.
	 * 
	 * @return 系统
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="EXE_SYSTEM", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getExeSystem() {
		return exeSystem;
	}
	/**
	 * 设置系统.
	 * @param exeSystem 系统
	 */
	public void setExeSystem(SystemCode exeSystem) {
		this.exeSystem = (SystemCode) exeSystem;
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
	/**
	 * 获取配方隐藏Id.
	 * 
	 * @return 配方隐藏Id
	 */
	@Column(nullable=true

		,name="FORMULA_HIDDEN_ID"
	)
    public Long getFormulaHiddenId() {
        return formulaHiddenId;
    }
	/**
	 * 设置配方隐藏Id.
	 * @param formulaHiddenId 配方隐藏Id
	 */
    public void setFormulaHiddenId(Long formulaHiddenId) {
        this.formulaHiddenId = formulaHiddenId;
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
	 * 获取来自容器.
	 * 
	 * @return 来自容器
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="FROM_CONTAINER", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getFromContainer() {
		return fromContainer;
	}
	/**
	 * 设置来自容器.
	 * @param fromContainer 来自容器
	 */
	public void setFromContainer(SystemCode fromContainer) {
		this.fromContainer = (SystemCode) fromContainer;
	}
	/**
	 * 获取隐藏顺序.
	 * 
	 * @return 隐藏顺序
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="HIDDEN_SORT"
	)
    public java.math.BigDecimal getHiddenSort() {
        return hiddenSort;
    }
	/**
	 * 设置隐藏顺序.
	 * @param hiddenSort 隐藏顺序
	 */
    public void setHiddenSort(java.math.BigDecimal hiddenSort) {
        this.hiddenSort = hiddenSort;
    }
	/**
	 * 获取配料顺序.
	 * 
	 * @return 配料顺序
	 */
	@Column(nullable=true

		,name="INGREDIENTS_ORDER"
	)
    public Integer getIngredientsOrder() {
        return ingredientsOrder;
    }
	/**
	 * 设置配料顺序.
	 * @param ingredientsOrder 配料顺序
	 */
    public void setIngredientsOrder(Integer ingredientsOrder) {
        this.ingredientsOrder = ingredientsOrder;
    }
	/**
	 * 获取是否机动投料.
	 * 
	 * @return 是否机动投料
	 */
	@Column(nullable=true

		,name="IS_AGILE"
	)
    public Boolean getIsAgile() {
        return null == isAgile ? false : isAgile;
    }
	/**
	 * 设置是否机动投料.
	 * @param isAgile 是否机动投料
	 */
    public void setIsAgile(Boolean isAgile) {
        this.isAgile = isAgile;
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
	 * 获取可用于调整.
	 * 
	 * @return 可用于调整
	 */
	@Column(nullable=true

		,name="IS_FOR_ADJUST"
	)
    public Boolean getIsForAdjust() {
        return null == isForAdjust ? false : isForAdjust;
    }
	/**
	 * 设置可用于调整.
	 * @param isForAdjust 可用于调整
	 */
    public void setIsForAdjust(Boolean isForAdjust) {
        this.isForAdjust = isForAdjust;
    }
	/**
	 * 获取可机动执行.
	 * 
	 * @return 可机动执行
	 */
	@Column(nullable=true

		,name="IS_FOR_TEMP"
	)
    public Boolean getIsForTemp() {
        return null == isForTemp ? false : isForTemp;
    }
	/**
	 * 设置可机动执行.
	 * @param isForTemp 可机动执行
	 */
    public void setIsForTemp(Boolean isForTemp) {
        this.isForTemp = isForTemp;
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
	 * 获取是否其它活动.
	 * 
	 * @return 是否其它活动
	 */
	@Column(nullable=true

		,name="IS_MORE_OTHER"
	)
    public Boolean getIsMoreOther() {
        return null == isMoreOther ? false : isMoreOther;
    }
	/**
	 * 设置是否其它活动.
	 * @param isMoreOther 是否其它活动
	 */
    public void setIsMoreOther(Boolean isMoreOther) {
        this.isMoreOther = isMoreOther;
    }
	/**
	 * 获取是否放行检验.
	 * 
	 * @return 是否放行检验
	 */
	@Column(nullable=true

		,name="IS_PASS_CHECK"
	)
    public Boolean getIsPassCheck() {
        return null == isPassCheck ? false : isPassCheck;
    }
	/**
	 * 设置是否放行检验.
	 * @param isPassCheck 是否放行检验
	 */
    public void setIsPassCheck(Boolean isPassCheck) {
        this.isPassCheck = isPassCheck;
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
	 * 获取工艺监测.
	 * 
	 * @return 工艺监测
	 */
	@Column(nullable=true

		,name="IS_WATCH_ACTIVE"
	)
    public Boolean getIsWatchActive() {
        return null == isWatchActive ? false : isWatchActive;
    }
	/**
	 * 设置工艺监测.
	 * @param isWatchActive 工艺监测
	 */
    public void setIsWatchActive(Boolean isWatchActive) {
        this.isWatchActive = isWatchActive;
    }
	/**
	 * 获取位号属性.
	 * 
	 * @return 位号属性
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ITEM_CLASS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getItemClass() {
		return itemClass;
	}
	/**
	 * 设置位号属性.
	 * @param itemClass 位号属性
	 */
	public void setItemClass(SystemCode itemClass) {
		this.itemClass = (SystemCode) itemClass;
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
	 * 获取主要活动.
	 * 
	 * @return 主要活动
	 */
	@Column(nullable=true

		,name="MAIN_ACTIVE"
	)
    public Boolean getMainActive() {
        return null == mainActive ? false : mainActive;
    }
	/**
	 * 设置主要活动.
	 * @param mainActive 主要活动
	 */
    public void setMainActive(Boolean mainActive) {
        this.mainActive = mainActive;
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
	 * 获取工艺Id.
	 * 
	 * @return 工艺Id
	 */
	@Column(nullable=true

		,name="MIXTURE_ID"
	)
    public Long getMixtureId() {
        return mixtureId;
    }
	/**
	 * 设置工艺Id.
	 * @param mixtureId 工艺Id
	 */
    public void setMixtureId(Long mixtureId) {
        this.mixtureId = mixtureId;
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
	 * 获取序号.
	 * nc
	 * @return 序号
	 */
	@Column(nullable=true

		,length = 256
		,name="NC_ACTIVE_INDEXS"
	)
    public String getNcActiveIndexs() {
        return ncActiveIndexs;
    }
	/**
	 * 设置序号.
	 * @param ncActiveIndexs 序号
	 */
    public void setNcActiveIndexs(String ncActiveIndexs) {
        this.ncActiveIndexs = ncActiveIndexs;
    }
	/**
	 * 获取工序编码.
	 * nc
	 * @return 工序编码
	 */
	@Column(nullable=true

		,length = 256
		,name="NC_PROCESS_CODE"
	)
    public String getNcProcessCode() {
        return ncProcessCode;
    }
	/**
	 * 设置工序编码.
	 * @param ncProcessCode 工序编码
	 */
    public void setNcProcessCode(String ncProcessCode) {
        this.ncProcessCode = ncProcessCode;
    }
	/**
	 * 获取工序号.
	 * nc
	 * @return 工序号
	 */
	@Column(nullable=true

		,length = 256
		,name="NC_PROCESS_INDEX"
	)
    public String getNcProcessIndex() {
        return ncProcessIndex;
    }
	/**
	 * 设置工序号.
	 * @param ncProcessIndex 工序号
	 */
    public void setNcProcessIndex(String ncProcessIndex) {
        this.ncProcessIndex = ncProcessIndex;
    }
	/**
	 * 获取工序名称.
	 * 
	 * @return 工序名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NC_PROCESS_NAME"
	)
    public String getNcProcessName() {
        return ncProcessName;
    }
	/**
	 * 设置工序名称.
	 * @param ncProcessName 工序名称
	 */
    public void setNcProcessName(String ncProcessName) {
        this.ncProcessName = ncProcessName;
    }
	/**
	 * 获取发生于.
	 * 
	 * @return 发生于
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="OCCUR_TURN", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOccurTurn() {
		return occurTurn;
	}
	/**
	 * 设置发生于.
	 * @param occurTurn 发生于
	 */
	public void setOccurTurn(SystemCode occurTurn) {
		this.occurTurn = (SystemCode) occurTurn;
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
	 * 获取工序Id.
	 * 开发时使用
	 * @return 工序Id
	 */
	@Column(nullable=true

		,name="PROCESS_HIDDEN_ID"
	)
    public Long getProcessHiddenId() {
        return processHiddenId;
    }
	/**
	 * 设置工序Id.
	 * @param processHiddenId 工序Id
	 */
    public void setProcessHiddenId(Long processHiddenId) {
        this.processHiddenId = processHiddenId;
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
	@OneToOne
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
	@JoinColumn(name = "PRODUCT2BOM", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct2BOM() {
        return product2BOM;
    }
    public void setProduct2BOM(MESBasicProduct product2BOM) {
        this.product2BOM = product2BOM;
    }
	/**
	 * 获取投料顺序.
	 * nc
	 * @return 投料顺序
	 */
	@Column(nullable=true

		,length = 256
		,name="PUTIN_ORDER"
	)
    public String getPutinOrder() {
        return putinOrder;
    }
	/**
	 * 设置投料顺序.
	 * @param putinOrder 投料顺序
	 */
    public void setPutinOrder(String putinOrder) {
        this.putinOrder = putinOrder;
    }
	@ManyToOne
	@JoinColumn(name = "QUALITY_STANDARD", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMStand getQualityStandard() {
        return qualityStandard;
    }
    public void setQualityStandard(RMStand qualityStandard) {
        this.qualityStandard = qualityStandard;
    }
	/**
	 * 获取单位数量.
	 * 
	 * @return 单位数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="STANDARD_QUANTITY"
	)
    public java.math.BigDecimal getStandardQuantity() {
        return standardQuantity;
    }
	/**
	 * 设置单位数量.
	 * @param standardQuantity 单位数量
	 */
    public void setStandardQuantity(java.math.BigDecimal standardQuantity) {
        this.standardQuantity = standardQuantity;
    }
	/**
	 * 获取子活动数量.
	 * 
	 * @return 子活动数量
	 */
	@Column(nullable=true

		,name="SUB_ACTIVE_NUM"
	)
    public Integer getSubActiveNum() {
        return subActiveNum;
    }
	/**
	 * 设置子活动数量.
	 * @param subActiveNum 子活动数量
	 */
    public void setSubActiveNum(Integer subActiveNum) {
        this.subActiveNum = subActiveNum;
    }
	@ManyToOne
	@JoinColumn(name = "TEST_PRODUCT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMSampleProj getTestProduct() {
        return testProduct;
    }
    public void setTestProduct(RMSampleProj testProduct) {
        this.testProduct = testProduct;
    }
	/**
	 * 获取类型名称.
	 * 
	 * @return 类型名称
	 */
	@Column(nullable=true

		,length = 256
		,name="TYPE_NAME"
	)
    public String getTypeName() {
        return typeName;
    }
	/**
	 * 设置类型名称.
	 * @param typeName 类型名称
	 */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
	/**
	 * 获取升版前Id.
	 * 
	 * @return 升版前Id
	 */
	@Column(nullable=true

		,name="UP_VERSION_ID"
	)
    public Long getUpVersionId() {
        return upVersionId;
    }
	/**
	 * 设置升版前Id.
	 * @param upVersionId 升版前Id
	 */
    public void setUpVersionId(Long upVersionId) {
        this.upVersionId = upVersionId;
    }
	
	
	protected String _getEntityName() {
		return RMFormulaProcessActive.class.getName();
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

	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaProcessActive_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
