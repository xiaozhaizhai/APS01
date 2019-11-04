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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 工艺标准.
 */
@javax.persistence.Entity(name=RMPrecessStandards.JPA_NAME)
@Table(name = RMPrecessStandards.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_PrecessStandards")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_PrecessStandards,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMPrecessStandardsConvertor.class})
public class RMPrecessStandards extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_PrecessStandards";
	public static final String DOC_TYPE = "RM_formula_precessStandards";
	public static final String TABLE_NAME = "rm_precess_standards";
	public static final String JPA_NAME = "RMPrecessStandards";
	private RMFormulaProcessActive activeId;


		private Integer flucInter ; // 波动扫描间隔(秒)


		private java.math.BigDecimal flucLowerLimit ; // 波动下限


		private Boolean fluctuateFlag = false; // 统计波动


		private java.math.BigDecimal flucUpperLimit ; // 波动上限


		private Integer limitInter ; // 扫描间隔（超限）


		private java.math.BigDecimal loweMxLimit ; // 下下限


		private java.math.BigDecimal lowerLimit ; // 下限


		private java.math.BigDecimal maxLimit ; // 上上限


		private Boolean overrunFlag = false; // 统计超限
	private RMFormulaProcess processId;
	@BAPIsMainDisplay

		private String quota ; // 指标


		private java.math.BigDecimal stValue ; // 标准值


		private java.math.BigDecimal upperLimit ; // 上限
	
	
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
	
	
	@Index(name="IDX_PRECESSSTANDARD_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
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
	 * 获取波动扫描间隔(秒).
	 * 
	 * @return 波动扫描间隔(秒)
	 */
	@Column(nullable=true

		,name="FLUC_INTER"
	)
    public Integer getFlucInter() {
        return flucInter;
    }
	/**
	 * 设置波动扫描间隔(秒).
	 * @param flucInter 波动扫描间隔(秒)
	 */
    public void setFlucInter(Integer flucInter) {
        this.flucInter = flucInter;
    }
	/**
	 * 获取波动下限.
	 * 
	 * @return 波动下限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="FLUC_LOWER_LIMIT"
	)
    public java.math.BigDecimal getFlucLowerLimit() {
        return flucLowerLimit;
    }
	/**
	 * 设置波动下限.
	 * @param flucLowerLimit 波动下限
	 */
    public void setFlucLowerLimit(java.math.BigDecimal flucLowerLimit) {
        this.flucLowerLimit = flucLowerLimit;
    }
	/**
	 * 获取统计波动.
	 * 
	 * @return 统计波动
	 */
	@Column(nullable=true

		,name="FLUCTUATE_FLAG"
	)
    public Boolean getFluctuateFlag() {
        return null == fluctuateFlag ? false : fluctuateFlag;
    }
	/**
	 * 设置统计波动.
	 * @param fluctuateFlag 统计波动
	 */
    public void setFluctuateFlag(Boolean fluctuateFlag) {
        this.fluctuateFlag = fluctuateFlag;
    }
	/**
	 * 获取波动上限.
	 * 
	 * @return 波动上限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="FLUC_UPPER_LIMIT"
	)
    public java.math.BigDecimal getFlucUpperLimit() {
        return flucUpperLimit;
    }
	/**
	 * 设置波动上限.
	 * @param flucUpperLimit 波动上限
	 */
    public void setFlucUpperLimit(java.math.BigDecimal flucUpperLimit) {
        this.flucUpperLimit = flucUpperLimit;
    }
	/**
	 * 获取扫描间隔（超限）.
	 * 
	 * @return 扫描间隔（超限）
	 */
	@Column(nullable=true

		,name="LIMIT_INTER"
	)
    public Integer getLimitInter() {
        return limitInter;
    }
	/**
	 * 设置扫描间隔（超限）.
	 * @param limitInter 扫描间隔（超限）
	 */
    public void setLimitInter(Integer limitInter) {
        this.limitInter = limitInter;
    }
	/**
	 * 获取下下限.
	 * 
	 * @return 下下限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LOWE_MX_LIMIT"
	)
    public java.math.BigDecimal getLoweMxLimit() {
        return loweMxLimit;
    }
	/**
	 * 设置下下限.
	 * @param loweMxLimit 下下限
	 */
    public void setLoweMxLimit(java.math.BigDecimal loweMxLimit) {
        this.loweMxLimit = loweMxLimit;
    }
	/**
	 * 获取下限.
	 * 
	 * @return 下限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LOWER_LIMIT"
	)
    public java.math.BigDecimal getLowerLimit() {
        return lowerLimit;
    }
	/**
	 * 设置下限.
	 * @param lowerLimit 下限
	 */
    public void setLowerLimit(java.math.BigDecimal lowerLimit) {
        this.lowerLimit = lowerLimit;
    }
	/**
	 * 获取上上限.
	 * 
	 * @return 上上限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="MAX_LIMIT"
	)
    public java.math.BigDecimal getMaxLimit() {
        return maxLimit;
    }
	/**
	 * 设置上上限.
	 * @param maxLimit 上上限
	 */
    public void setMaxLimit(java.math.BigDecimal maxLimit) {
        this.maxLimit = maxLimit;
    }
	/**
	 * 获取统计超限.
	 * 
	 * @return 统计超限
	 */
	@Column(nullable=true

		,name="OVERRUN_FLAG"
	)
    public Boolean getOverrunFlag() {
        return null == overrunFlag ? false : overrunFlag;
    }
	/**
	 * 设置统计超限.
	 * @param overrunFlag 统计超限
	 */
    public void setOverrunFlag(Boolean overrunFlag) {
        this.overrunFlag = overrunFlag;
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
	 * 获取指标.
	 * 
	 * @return 指标
	 */
	@Column(nullable=true

		,length = 256
		,name="QUOTA"
	)
    public String getQuota() {
        return quota;
    }
	/**
	 * 设置指标.
	 * @param quota 指标
	 */
    public void setQuota(String quota) {
        this.quota = quota;
    }
	/**
	 * 获取标准值.
	 * 
	 * @return 标准值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ST_VALUE"
	)
    public java.math.BigDecimal getStValue() {
        return stValue;
    }
	/**
	 * 设置标准值.
	 * @param stValue 标准值
	 */
    public void setStValue(java.math.BigDecimal stValue) {
        this.stValue = stValue;
    }
	/**
	 * 获取上限.
	 * 
	 * @return 上限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="UPPER_LIMIT"
	)
    public java.math.BigDecimal getUpperLimit() {
        return upperLimit;
    }
	/**
	 * 设置上限.
	 * @param upperLimit 上限
	 */
    public void setUpperLimit(java.math.BigDecimal upperLimit) {
        this.upperLimit = upperLimit;
    }
	
	
	protected String _getEntityName() {
		return RMPrecessStandards.class.getName();
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

	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formula_PrecessStandards_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_PrecessStandards,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
