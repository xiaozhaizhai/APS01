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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 配料需求.
 */
@javax.persistence.Entity(name=WOMBatchingMaterialNeed.JPA_NAME)
@Table(name = WOMBatchingMaterialNeed.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_batchingMaterialNeed")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMBatchingMaterialNeedConvertor.class})
public class WOMBatchingMaterialNeed extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_batchingMaterialNeed";
	public static final String MODEL_CODE = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed";
	public static final String DOC_TYPE = "WOM_batchingMaterialNeed_batchingMaterialNeed";
	public static final String TABLE_NAME = "wom_batching_material_needs";
	public static final String JPA_NAME = "WOMBatchingMaterialNeed";
	private SystemCode activeType
; // 活动类型


		private Integer actOrder ; // 投料顺序


		private java.math.BigDecimal actualNum ; // 实际投料量
	private SystemCode batchSite
; // 配料方式


		private String container ; // 容器
	private MESBasicFactoryModel factoryId;


		private java.math.BigDecimal hasOrderNum ; // 已下达指令数量


		private Integer offerOrder ; // 配料顺序
	private SystemCode offerSystem
; // 配料系统


		private String phaseID ; // phaseID


		private java.math.BigDecimal planNum ; // 计划数量
	private MESBasicProduct productId;
	private RMFormulaProcessActive putBatMateId;
	private SystemCode state
; // 状态
	private WOMProduceTaskActive taskActive;
	private WOMProduceTask taskID;
	private WOMProduceTaskProcess taskProcess;


		private java.math.BigDecimal useNum ; // 已配数量
	
	
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
	@OneToOne
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
	 * 获取已下达指令数量.
	 * 
	 * @return 已下达指令数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="HAS_ORDER_NUM"
	)
    public java.math.BigDecimal getHasOrderNum() {
        return hasOrderNum;
    }
	/**
	 * 设置已下达指令数量.
	 * @param hasOrderNum 已下达指令数量
	 */
    public void setHasOrderNum(java.math.BigDecimal hasOrderNum) {
        this.hasOrderNum = hasOrderNum;
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
	 * 获取配料系统.
	 * 
	 * @return 配料系统
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="OFFER_SYSTEM", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOfferSystem() {
		return offerSystem;
	}
	/**
	 * 设置配料系统.
	 * @param offerSystem 配料系统
	 */
	public void setOfferSystem(SystemCode offerSystem) {
		this.offerSystem = (SystemCode) offerSystem;
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
	@OneToOne
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
	@OneToOne
	@JoinColumn(name = "TASK_ACTIVE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskActive getTaskActive() {
        return taskActive;
    }
    public void setTaskActive(WOMProduceTaskActive taskActive) {
        this.taskActive = taskActive;
    }
	@OneToOne
	@JoinColumn(name = "TASKID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public WOMProduceTask getTaskID() {
        return taskID;
    }
    public void setTaskID(WOMProduceTask taskID) {
        this.taskID = taskID;
    }
	@OneToOne
	@JoinColumn(name = "TASK_PROCESS", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskProcess getTaskProcess() {
        return taskProcess;
    }
    public void setTaskProcess(WOMProduceTaskProcess taskProcess) {
        this.taskProcess = taskProcess;
    }
	/**
	 * 获取已配数量.
	 * 
	 * @return 已配数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="USE_NUM"
	)
    public java.math.BigDecimal getUseNum() {
        return useNum;
    }
	/**
	 * 设置已配数量.
	 * @param useNum 已配数量
	 */
    public void setUseNum(java.math.BigDecimal useNum) {
        this.useNum = useNum;
    }
	
	
	protected String _getEntityName() {
		return WOMBatchingMaterialNeed.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
