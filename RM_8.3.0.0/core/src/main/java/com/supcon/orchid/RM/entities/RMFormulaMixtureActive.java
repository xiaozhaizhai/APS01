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
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 配料.
 */
@javax.persistence.Entity(name=RMFormulaMixtureActive.JPA_NAME)
@Table(name = RMFormulaMixtureActive.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_FormulaMixtureActive")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_FormulaMixtureActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaMixtureActiveConvertor.class})
public class RMFormulaMixtureActive extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_FormulaMixtureActive";
	public static final String DOC_TYPE = "RM_formula_formulaMixtureActive";
	public static final String TABLE_NAME = "rm_formula_mixture_actives";
	public static final String JPA_NAME = "RMFormulaMixtureActive";


		private Long activeHiddenId ; // 活动隐藏Id(作废)


		private Integer actOrder ; // 投料顺序


		private Boolean addFlag = false; // 添加标识


		private Boolean auto = false; // 控制系统执行
	private SystemCode batchSite
; // 配料方式


		private Long batchUnitID ; // 批控活动(废)


		private Boolean channelOrManual = false; // 手工管道


		private String container ; // 容器


		private String execSort ; // 执行顺序


		private Integer exeOrder ; // 顺序
	private SystemCode exeSystem
; // 系统


		private Boolean finalInspection = false; // 完工检验


		private Long formulaHiddenId ; // 配方隐藏Id
	private SystemCode formulaType
; // 类型
	private SystemCode fromContainer
; // 来自容器


		private java.math.BigDecimal hiddenSort ; // 隐藏顺序


		private Integer ingredientsOrder ; // 配料顺序


		private Boolean isMixQuality = false; // 固定数量


		private Boolean isPlace = false; // 替代料


		private Boolean isWatchActive = false; // 是否监测工艺


		private java.math.BigDecimal longTime ; // 标准时长(分)


		private java.math.BigDecimal lossRate ; // 损耗率(%)


		private java.math.BigDecimal maxQuality ; // 区间上限


		private String meno ; // 备注


		private java.math.BigDecimal minQuality ; // 区间下限


		private Boolean mobileTerminal = false; // 移动端执行


		private String name ; // 活动名称
	private SystemCode occurTurn
; // 发生于
	private RMFormulaProcessActive processActiveId;


		private Long processHiddenId ; // 工序隐藏Id


		private Long processTableId ; // 表单号
	private MESBasicProduct product;


		private Boolean saveFlag = false; // 保存标识


		private java.math.BigDecimal standardQuantity ; // 单位数量
	
	
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
	
	
	@Index(name="IDX_FORMULAMIXTUREA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取活动隐藏Id(作废).
	 * 
	 * @return 活动隐藏Id(作废)
	 */
	@Column(nullable=true

		,name="ACTIVE_HIDDEN_ID"
	)
    public Long getActiveHiddenId() {
        return activeHiddenId;
    }
	/**
	 * 设置活动隐藏Id(作废).
	 * @param activeHiddenId 活动隐藏Id(作废)
	 */
    public void setActiveHiddenId(Long activeHiddenId) {
        this.activeHiddenId = activeHiddenId;
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
	 * 获取添加标识.
	 * 
	 * @return 添加标识
	 */
	@Column(nullable=true

		,name="ADD_FLAG"
	)
    public Boolean getAddFlag() {
        return null == addFlag ? false : addFlag;
    }
	/**
	 * 设置添加标识.
	 * @param addFlag 添加标识
	 */
    public void setAddFlag(Boolean addFlag) {
        this.addFlag = addFlag;
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
	 * 获取批控活动(废).
	 * 
	 * @return 批控活动(废)
	 */
	@Column(nullable=true

		,name="BATCH_UNITID"
	)
    public Long getBatchUnitID() {
        return batchUnitID;
    }
	/**
	 * 设置批控活动(废).
	 * @param batchUnitID 批控活动(废)
	 */
    public void setBatchUnitID(Long batchUnitID) {
        this.batchUnitID = batchUnitID;
    }
	/**
	 * 获取手工管道.
	 * 
	 * @return 手工管道
	 */
	@Column(nullable=true

		,name="CHANNEL_OR_MANUAL"
	)
    public Boolean getChannelOrManual() {
        return null == channelOrManual ? false : channelOrManual;
    }
	/**
	 * 设置手工管道.
	 * @param channelOrManual 手工管道
	 */
    public void setChannelOrManual(Boolean channelOrManual) {
        this.channelOrManual = channelOrManual;
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
	 * 获取顺序.
	 * 
	 * @return 顺序
	 */
	@Column(nullable=true

		,name="EXE_ORDER"
	)
    public Integer getExeOrder() {
        return exeOrder;
    }
	/**
	 * 设置顺序.
	 * @param exeOrder 顺序
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
	/**
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="FORMULA_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getFormulaType() {
		return formulaType;
	}
	/**
	 * 设置类型.
	 * @param formulaType 类型
	 */
	public void setFormulaType(SystemCode formulaType) {
		this.formulaType = (SystemCode) formulaType;
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
	 * 获取替代料.
	 * 
	 * @return 替代料
	 */
	@Column(nullable=true

		,name="IS_PLACE"
	)
    public Boolean getIsPlace() {
        return null == isPlace ? false : isPlace;
    }
	/**
	 * 设置替代料.
	 * @param isPlace 替代料
	 */
    public void setIsPlace(Boolean isPlace) {
        this.isPlace = isPlace;
    }
	/**
	 * 获取是否监测工艺.
	 * 
	 * @return 是否监测工艺
	 */
	@Column(nullable=true

		,name="IS_WATCH_ACTIVE"
	)
    public Boolean getIsWatchActive() {
        return null == isWatchActive ? false : isWatchActive;
    }
	/**
	 * 设置是否监测工艺.
	 * @param isWatchActive 是否监测工艺
	 */
    public void setIsWatchActive(Boolean isWatchActive) {
        this.isWatchActive = isWatchActive;
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

		,length = 200
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
	@ManyToOne
	@JoinColumn(name = "PROCESS_ACTIVE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getProcessActiveId() {
        return processActiveId;
    }
    public void setProcessActiveId(RMFormulaProcessActive processActiveId) {
        this.processActiveId = processActiveId;
    }
	/**
	 * 获取工序隐藏Id.
	 * 
	 * @return 工序隐藏Id
	 */
	@Column(nullable=true

		,name="PROCESS_HIDDEN_ID"
	)
    public Long getProcessHiddenId() {
        return processHiddenId;
    }
	/**
	 * 设置工序隐藏Id.
	 * @param processHiddenId 工序隐藏Id
	 */
    public void setProcessHiddenId(Long processHiddenId) {
        this.processHiddenId = processHiddenId;
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
	@JoinColumn(name = "PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct() {
        return product;
    }
    public void setProduct(MESBasicProduct product) {
        this.product = product;
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
	
	
	protected String _getEntityName() {
		return RMFormulaMixtureActive.class.getName();
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

	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaMixtureActive_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_FormulaMixtureActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
