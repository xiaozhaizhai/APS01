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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.RM.entities.RMStand;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 活动处理表.
 */
@javax.persistence.Entity(name=WOMAdjustOrTempHead.JPA_NAME)
@Table(name = WOMAdjustOrTempHead.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_AdjustOrTempHead")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_AdjustOrTempHead,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMAdjustOrTempHeadConvertor.class})
public class WOMAdjustOrTempHead extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_AdjustOrTempHead";
	public static final String DOC_TYPE = "WOM_produceTask_adjustOrTempHead";
	public static final String TABLE_NAME = "wom_adjust_or_temp_heads";
	public static final String JPA_NAME = "WOMAdjustOrTempHead";
	private SystemCode activeMissonType
; // 活动任务类型


		private String activeName ; // 活动名称
	private SystemCode activeType
; // 活动类型
	private WOMProduceTask adjustHeadID;
	private SystemCode dataSource
; // 活动来源
	private RMFormulaProcessActive formulaProcessActive;


		private Boolean isAdjust = false; // 是否调整


		private Boolean isAgile = false; // 灵活投料
	private WOMProduceTaskActive processActiveID;
	private WOMProduceTaskProcess processId;
	private MESBasicProduct product;
	private RMStand qualityStandard;


		private String remark ; // 备注
	
	
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
	
	
	@Index(name="IDX_ADJUSTORTEMPHEA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取活动任务类型.
	 * 
	 * @return 活动任务类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_MISSON_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveMissonType() {
		return activeMissonType;
	}
	/**
	 * 设置活动任务类型.
	 * @param activeMissonType 活动任务类型
	 */
	public void setActiveMissonType(SystemCode activeMissonType) {
		this.activeMissonType = (SystemCode) activeMissonType;
	}
	/**
	 * 获取活动名称.
	 * 
	 * @return 活动名称
	 */
	@Column(nullable=true

		,length = 256
		,name="ACTIVE_NAME"
	)
    public String getActiveName() {
        return activeName;
    }
	/**
	 * 设置活动名称.
	 * @param activeName 活动名称
	 */
    public void setActiveName(String activeName) {
        this.activeName = activeName;
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
	@ManyToOne
	@JoinColumn(name = "ADJUST_HEADID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getAdjustHeadID() {
        return adjustHeadID;
    }
    public void setAdjustHeadID(WOMProduceTask adjustHeadID) {
        this.adjustHeadID = adjustHeadID;
    }
	/**
	 * 获取活动来源.
	 * 
	 * @return 活动来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DATA_SOURCE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDataSource() {
		return dataSource;
	}
	/**
	 * 设置活动来源.
	 * @param dataSource 活动来源
	 */
	public void setDataSource(SystemCode dataSource) {
		this.dataSource = (SystemCode) dataSource;
	}
	@OneToOne
	@JoinColumn(name = "FORMULA_PROCESS_ACTIVE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getFormulaProcessActive() {
        return formulaProcessActive;
    }
    public void setFormulaProcessActive(RMFormulaProcessActive formulaProcessActive) {
        this.formulaProcessActive = formulaProcessActive;
    }
	/**
	 * 获取是否调整.
	 * 
	 * @return 是否调整
	 */
	@Column(nullable=true

		,name="IS_ADJUST"
	)
    public Boolean getIsAdjust() {
        return null == isAdjust ? false : isAdjust;
    }
	/**
	 * 设置是否调整.
	 * @param isAdjust 是否调整
	 */
    public void setIsAdjust(Boolean isAdjust) {
        this.isAdjust = isAdjust;
    }
	/**
	 * 获取灵活投料.
	 * 
	 * @return 灵活投料
	 */
	@Column(nullable=true

		,name="IS_AGILE"
	)
    public Boolean getIsAgile() {
        return null == isAgile ? false : isAgile;
    }
	/**
	 * 设置灵活投料.
	 * @param isAgile 灵活投料
	 */
    public void setIsAgile(Boolean isAgile) {
        this.isAgile = isAgile;
    }
	@OneToOne
	@JoinColumn(name = "PROCESS_ACTIVEID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskActive getProcessActiveID() {
        return processActiveID;
    }
    public void setProcessActiveID(WOMProduceTaskActive processActiveID) {
        this.processActiveID = processActiveID;
    }
	@OneToOne
	@JoinColumn(name = "PROCESS_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskProcess getProcessId() {
        return processId;
    }
    public void setProcessId(WOMProduceTaskProcess processId) {
        this.processId = processId;
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
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
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
	
	
	protected String _getEntityName() {
		return WOMAdjustOrTempHead.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_AdjustOrTempHead,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
