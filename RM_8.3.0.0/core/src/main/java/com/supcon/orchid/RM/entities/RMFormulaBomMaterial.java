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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 配方BOM物料表.
 */
@javax.persistence.Entity(name=RMFormulaBomMaterial.JPA_NAME)
@Table(name = RMFormulaBomMaterial.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formulaBOM")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formulaBOM_FormulaBomMaterial")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formulaBOM_FormulaBomMaterial,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaBomMaterialConvertor.class})
public class RMFormulaBomMaterial extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formulaBOM";
	public static final String MODEL_CODE = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial";
	public static final String DOC_TYPE = "RM_formulaBOM_formulaBomMaterial";
	public static final String TABLE_NAME = "rm_formula_bom_materials";
	public static final String JPA_NAME = "RMFormulaBomMaterial";


		private String demo ; // 备注
	private RMFormulaBomMain formulaBom;


		private Boolean isMaxNum = false; // 固定数量
	private MESBasicProduct material;


		private java.math.BigDecimal maxNum ; // 区间上限


		private java.math.BigDecimal minNum ; // 区间下限


		private String ncActiveIndex ; // 序号


		private String ncProcessCode ; // 工序编码


		private String ncProcessIndex ; // 工序号


		private String ncProcessName ; // 工序名称


		private java.math.BigDecimal preNum ; // 单重


		private String putinOrder ; // 投料顺序
	
	
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
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="DEMO"
	)
    public String getDemo() {
        return demo;
    }
	/**
	 * 设置备注.
	 * @param demo 备注
	 */
    public void setDemo(String demo) {
        this.demo = demo;
    }
	@ManyToOne
	@JoinColumn(name = "FORMULA_BOM", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaBomMain getFormulaBom() {
        return formulaBom;
    }
    public void setFormulaBom(RMFormulaBomMain formulaBom) {
        this.formulaBom = formulaBom;
    }
	/**
	 * 获取固定数量.
	 * 
	 * @return 固定数量
	 */
	@Column(nullable=true

		,name="IS_MAX_NUM"
	)
    public Boolean getIsMaxNum() {
        return null == isMaxNum ? false : isMaxNum;
    }
	/**
	 * 设置固定数量.
	 * @param isMaxNum 固定数量
	 */
    public void setIsMaxNum(Boolean isMaxNum) {
        this.isMaxNum = isMaxNum;
    }
	@ManyToOne
	@JoinColumn(name = "MATERIAL", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getMaterial() {
        return material;
    }
    public void setMaterial(MESBasicProduct material) {
        this.material = material;
    }
	/**
	 * 获取区间上限.
	 * 
	 * @return 区间上限
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="MAX_NUM"
	)
    public java.math.BigDecimal getMaxNum() {
        return maxNum;
    }
	/**
	 * 设置区间上限.
	 * @param maxNum 区间上限
	 */
    public void setMaxNum(java.math.BigDecimal maxNum) {
        this.maxNum = maxNum;
    }
	/**
	 * 获取区间下限.
	 * 
	 * @return 区间下限
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="MIN_NUM"
	)
    public java.math.BigDecimal getMinNum() {
        return minNum;
    }
	/**
	 * 设置区间下限.
	 * @param minNum 区间下限
	 */
    public void setMinNum(java.math.BigDecimal minNum) {
        this.minNum = minNum;
    }
	/**
	 * 获取序号.
	 * 
	 * @return 序号
	 */
	@Column(nullable=true

		,length = 256
		,name="NC_ACTIVE_INDEX"
	)
    public String getNcActiveIndex() {
        return ncActiveIndex;
    }
	/**
	 * 设置序号.
	 * @param ncActiveIndex 序号
	 */
    public void setNcActiveIndex(String ncActiveIndex) {
        this.ncActiveIndex = ncActiveIndex;
    }
	/**
	 * 获取工序编码.
	 * 配方BOM表同步
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
	 * 
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
	 * 获取单重.
	 * 
	 * @return 单重
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRE_NUM"
	)
    public java.math.BigDecimal getPreNum() {
        return preNum;
    }
	/**
	 * 设置单重.
	 * @param preNum 单重
	 */
    public void setPreNum(java.math.BigDecimal preNum) {
        this.preNum = preNum;
    }
	/**
	 * 获取投料顺序.
	 * 根据工序号+序号计算
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
	
	
	protected String _getEntityName() {
		return RMFormulaBomMaterial.class.getName();
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

	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_bigintparamc")
	private Integer bigintparamc;
	
	@Column
    public Integer getBigintparamc() {
        return bigintparamc;
    }
	
    public void setBigintparamc(Integer bigintparamc) {
        this.bigintparamc = bigintparamc;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_bigintparamd")
	private Integer bigintparamd;
	
	@Column
    public Integer getBigintparamd() {
        return bigintparamd;
    }
	
    public void setBigintparamd(Integer bigintparamd) {
        this.bigintparamd = bigintparamd;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_bigintparame")
	private Integer bigintparame;
	
	@Column
    public Integer getBigintparame() {
        return bigintparame;
    }
	
    public void setBigintparame(Integer bigintparame) {
        this.bigintparame = bigintparame;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparamc")
	private String charparamc;
	
	@Column
    public String getCharparamc() {
        return charparamc;
    }
	
    public void setCharparamc(String charparamc) {
        this.charparamc = charparamc;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparamd")
	private String charparamd;
	
	@Column
    public String getCharparamd() {
        return charparamd;
    }
	
    public void setCharparamd(String charparamd) {
        this.charparamd = charparamd;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparame")
	private String charparame;
	
	@Column
    public String getCharparame() {
        return charparame;
    }
	
    public void setCharparame(String charparame) {
        this.charparame = charparame;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparamf")
	private String charparamf;
	
	@Column
    public String getCharparamf() {
        return charparamf;
    }
	
    public void setCharparamf(String charparamf) {
        this.charparamf = charparamf;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparamg")
	private String charparamg;
	
	@Column
    public String getCharparamg() {
        return charparamg;
    }
	
    public void setCharparamg(String charparamg) {
        this.charparamg = charparamg;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_charparamh")
	private String charparamh;
	
	@Column
    public String getCharparamh() {
        return charparamh;
    }
	
    public void setCharparamh(String charparamh) {
        this.charparamh = charparamh;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_dateparamc")
	private java.util.Date dateparamc;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamc() {
        return dateparamc;
    }
	
    public void setDateparamc(java.util.Date dateparamc) {
        this.dateparamc = dateparamc;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_dateparamd")
	private java.util.Date dateparamd;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamd() {
        return dateparamd;
    }
	
    public void setDateparamd(java.util.Date dateparamd) {
        this.dateparamd = dateparamd;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_numberparamc")
	private java.math.BigDecimal numberparamc;
	
	@Column
    public java.math.BigDecimal getNumberparamc() {
        return numberparamc;
    }
	
    public void setNumberparamc(java.math.BigDecimal numberparamc) {
        this.numberparamc = numberparamc;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_formulaBOM_FormulaBomMaterial_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formulaBOM_FormulaBomMaterial,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
