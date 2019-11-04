package com.supcon.orchid.MESBasic.entities;

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
 * 容器属性.
 */
@javax.persistence.Entity(name=MESBasicPropertyTags.JPA_NAME)
@Table(name = MESBasicPropertyTags.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_container")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_container_PropertyTags")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_container_PropertyTags,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicPropertyTagsConvertor.class})
public class MESBasicPropertyTags extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_container";
	public static final String MODEL_CODE = "MESBasic_1_container_PropertyTags";
	public static final String DOC_TYPE = "MESBasic_container_propertyTags";
	public static final String TABLE_NAME = "mesbasic_property_tags";
	public static final String JPA_NAME = "MESBasicPropertyTags";
	private MESBasicContainer container;


		private Boolean primary = false; // 主计量
	private MESBasicItemSetup property;


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
	
	@ManyToOne
	@JoinColumn(name = "CONTAINER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicContainer getContainer() {
        return container;
    }
    public void setContainer(MESBasicContainer container) {
        this.container = container;
    }
	/**
	 * 获取主计量.
	 * 
	 * @return 主计量
	 */
	@Column(nullable=true

		,name="IS_PRIMARY"
	)
    public Boolean getPrimary() {
        return null == primary ? false : primary;
    }
	/**
	 * 设置主计量.
	 * @param primary 主计量
	 */
    public void setPrimary(Boolean primary) {
        this.primary = primary;
    }
	@OneToOne
	@JoinColumn(name = "PROPERTY", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getProperty() {
        return property;
    }
    public void setProperty(MESBasicItemSetup property) {
        this.property = property;
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
		return MESBasicPropertyTags.class.getName();
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

	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparamc")
	private Integer bigintparamc;
	
	@Column
    public Integer getBigintparamc() {
        return bigintparamc;
    }
	
    public void setBigintparamc(Integer bigintparamc) {
        this.bigintparamc = bigintparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparamd")
	private Integer bigintparamd;
	
	@Column
    public Integer getBigintparamd() {
        return bigintparamd;
    }
	
    public void setBigintparamd(Integer bigintparamd) {
        this.bigintparamd = bigintparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparame")
	private Integer bigintparame;
	
	@Column
    public Integer getBigintparame() {
        return bigintparame;
    }
	
    public void setBigintparame(Integer bigintparame) {
        this.bigintparame = bigintparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparamf")
	private Integer bigintparamf;
	
	@Column
    public Integer getBigintparamf() {
        return bigintparamf;
    }
	
    public void setBigintparamf(Integer bigintparamf) {
        this.bigintparamf = bigintparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparamg")
	private Integer bigintparamg;
	
	@Column
    public Integer getBigintparamg() {
        return bigintparamg;
    }
	
    public void setBigintparamg(Integer bigintparamg) {
        this.bigintparamg = bigintparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparamh")
	private Integer bigintparamh;
	
	@Column
    public Integer getBigintparamh() {
        return bigintparamh;
    }
	
    public void setBigintparamh(Integer bigintparamh) {
        this.bigintparamh = bigintparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparami")
	private Integer bigintparami;
	
	@Column
    public Integer getBigintparami() {
        return bigintparami;
    }
	
    public void setBigintparami(Integer bigintparami) {
        this.bigintparami = bigintparami;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_bigintparamj")
	private Integer bigintparamj;
	
	@Column
    public Integer getBigintparamj() {
        return bigintparamj;
    }
	
    public void setBigintparamj(Integer bigintparamj) {
        this.bigintparamj = bigintparamj;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparamc")
	private String charparamc;
	
	@Column
    public String getCharparamc() {
        return charparamc;
    }
	
    public void setCharparamc(String charparamc) {
        this.charparamc = charparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparamd")
	private String charparamd;
	
	@Column
    public String getCharparamd() {
        return charparamd;
    }
	
    public void setCharparamd(String charparamd) {
        this.charparamd = charparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparame")
	private String charparame;
	
	@Column
    public String getCharparame() {
        return charparame;
    }
	
    public void setCharparame(String charparame) {
        this.charparame = charparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparamf")
	private String charparamf;
	
	@Column
    public String getCharparamf() {
        return charparamf;
    }
	
    public void setCharparamf(String charparamf) {
        this.charparamf = charparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparamg")
	private String charparamg;
	
	@Column
    public String getCharparamg() {
        return charparamg;
    }
	
    public void setCharparamg(String charparamg) {
        this.charparamg = charparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparamh")
	private String charparamh;
	
	@Column
    public String getCharparamh() {
        return charparamh;
    }
	
    public void setCharparamh(String charparamh) {
        this.charparamh = charparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparami")
	private String charparami;
	
	@Column
    public String getCharparami() {
        return charparami;
    }
	
    public void setCharparami(String charparami) {
        this.charparami = charparami;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_charparamj")
	private String charparamj;
	
	@Column
    public String getCharparamj() {
        return charparamj;
    }
	
    public void setCharparamj(String charparamj) {
        this.charparamj = charparamj;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparamc")
	private java.util.Date dateparamc;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamc() {
        return dateparamc;
    }
	
    public void setDateparamc(java.util.Date dateparamc) {
        this.dateparamc = dateparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparamd")
	private java.util.Date dateparamd;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamd() {
        return dateparamd;
    }
	
    public void setDateparamd(java.util.Date dateparamd) {
        this.dateparamd = dateparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparame")
	private java.util.Date dateparame;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparame() {
        return dateparame;
    }
	
    public void setDateparame(java.util.Date dateparame) {
        this.dateparame = dateparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparamf")
	private java.util.Date dateparamf;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamf() {
        return dateparamf;
    }
	
    public void setDateparamf(java.util.Date dateparamf) {
        this.dateparamf = dateparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparamg")
	private java.util.Date dateparamg;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamg() {
        return dateparamg;
    }
	
    public void setDateparamg(java.util.Date dateparamg) {
        this.dateparamg = dateparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_dateparamh")
	private java.util.Date dateparamh;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamh() {
        return dateparamh;
    }
	
    public void setDateparamh(java.util.Date dateparamh) {
        this.dateparamh = dateparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_numberparamc")
	private java.math.BigDecimal numberparamc;
	
	@Column
    public java.math.BigDecimal getNumberparamc() {
        return numberparamc;
    }
	
    public void setNumberparamc(java.math.BigDecimal numberparamc) {
        this.numberparamc = numberparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_numberparamd")
	private java.math.BigDecimal numberparamd;
	
	@Column
    public java.math.BigDecimal getNumberparamd() {
        return numberparamd;
    }
	
    public void setNumberparamd(java.math.BigDecimal numberparamd) {
        this.numberparamd = numberparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_numberparame")
	private java.math.BigDecimal numberparame;
	
	@Column
    public java.math.BigDecimal getNumberparame() {
        return numberparame;
    }
	
    public void setNumberparame(java.math.BigDecimal numberparame) {
        this.numberparame = numberparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_numberparamf")
	private java.math.BigDecimal numberparamf;
	
	@Column
    public java.math.BigDecimal getNumberparamf() {
        return numberparamf;
    }
	
    public void setNumberparamf(java.math.BigDecimal numberparamf) {
        this.numberparamf = numberparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_objparama", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_objparamb", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_objparamc", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_objparamd", complex = true)
	private Long objparamd;
	
	@Column
	public Long getObjparamd() {
		return objparamd;
	}
	
	public void setObjparamd(Long objparamd) {
		this.objparamd = objparamd;
	}

	private String objparamdMainDisplay;
	
	@Transient
	public String getObjparamdMainDisplay() {
		return objparamdMainDisplay;
	}
	
	public void setObjparamdMainDisplay(String objparamdMainDisplay) {
		this.objparamdMainDisplay = objparamdMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_scparama", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_scparamb", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_scparamc", complex = true)
	private String scparamc;
	
	@Column
	public String getScparamc() {
		return scparamc;
	}
	
	public void setScparamc(String scparamc) {
		this.scparamc = scparamc;
	}

	private String scparamcMainDisplay;
	
	@Transient
	public String getScparamcMainDisplay() {
		return scparamcMainDisplay;
	}
	
	public void setScparamcMainDisplay(String scparamcMainDisplay) {
		this.scparamcMainDisplay = scparamcMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_PropertyTags_scparamd", complex = true)
	private String scparamd;
	
	@Column
	public String getScparamd() {
		return scparamd;
	}
	
	public void setScparamd(String scparamd) {
		this.scparamd = scparamd;
	}

	private String scparamdMainDisplay;
	
	@Transient
	public String getScparamdMainDisplay() {
		return scparamdMainDisplay;
	}
	
	public void setScparamdMainDisplay(String scparamdMainDisplay) {
		this.scparamdMainDisplay = scparamdMainDisplay;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_container_PropertyTags,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
