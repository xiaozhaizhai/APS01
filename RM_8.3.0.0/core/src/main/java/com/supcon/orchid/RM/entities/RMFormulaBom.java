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
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 物品清单.
 */
@javax.persistence.Entity(name=RMFormulaBom.JPA_NAME)
@Table(name = RMFormulaBom.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_FormulaBom")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_FormulaBom,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaBomConvertor.class})
public class RMFormulaBom extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_FormulaBom";
	public static final String DOC_TYPE = "RM_formula_formulaBom";
	public static final String TABLE_NAME = "rm_formula_boms";
	public static final String JPA_NAME = "RMFormulaBom";
	private RMFormula formulaId;


		private Boolean isMixQuality = false; // 固定数量


		private java.math.BigDecimal lossRate ; // 损耗率(%)


		private java.math.BigDecimal maxQuality ; // 区间上限


		private String meno ; // 备注


		private java.math.BigDecimal minQuality ; // 区间下限


		private Boolean needWeigh = false; // 是否需要称重


		private Integer phase ; // 阶段
	private MESBasicProduct productId;
	private SystemCode property
; // 性质


		private Integer sequence ; // 次序


		private java.math.BigDecimal unitQuality ; // 单位数量
	
	
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
	
	
	@Index(name="IDX_FORMULABOM_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
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
	 * 获取是否需要称重.
	 * 
	 * @return 是否需要称重
	 */
	@Column(nullable=true

		,name="NEED_WEIGH"
	)
    public Boolean getNeedWeigh() {
        return null == needWeigh ? false : needWeigh;
    }
	/**
	 * 设置是否需要称重.
	 * @param needWeigh 是否需要称重
	 */
    public void setNeedWeigh(Boolean needWeigh) {
        this.needWeigh = needWeigh;
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
	 * 获取单位数量.
	 * 
	 * @return 单位数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="UNIT_QUALITY"
	)
    public java.math.BigDecimal getUnitQuality() {
        return unitQuality;
    }
	/**
	 * 设置单位数量.
	 * @param unitQuality 单位数量
	 */
    public void setUnitQuality(java.math.BigDecimal unitQuality) {
        this.unitQuality = unitQuality;
    }
	
	
	protected String _getEntityName() {
		return RMFormulaBom.class.getName();
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

	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_FormulaBom_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_FormulaBom,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
