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
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产订单物料.
 */
@javax.persistence.Entity(name=WOMManulOrderMaterial.JPA_NAME)
@Table(name = WOMManulOrderMaterial.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_manulOrder")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_manulOrder_ManulOrderMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMManulOrderMaterialConvertor.class})
public class WOMManulOrderMaterial extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_manulOrder";
	public static final String MODEL_CODE = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial";
	public static final String DOC_TYPE = "WOM_manulOrder_manulOrderMaterial";
	public static final String TABLE_NAME = "wom_menul_order_material";
	public static final String JPA_NAME = "WOMManulOrderMaterial";


		private Boolean ablePass = false; // 允许发料


		private Boolean bomDelFlag = false; // 物料删除标记


		private Boolean coOperation = false; // 是否联副产品


		private String edition ; // 特殊库存标志
	private WOMManulOrderMain manulOrderId;
	private MESBasicProduct material;


		private String materialBatchNum ; // 原料批次


		private java.math.BigDecimal needNumber ; // 需求数量

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planEndTime ; // 基本结束时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planStartTime ; // 基本开始时间


		private String reNum ; // 预留号


		private String rsNUM ; // 预留号


		private String rsPOS ; // 预留行项目


		private String saleOrderNum ; // 销售订单号


		private String saleOrderProject ; // 销售订单项目
	private X6BasicBaseUnit unit;
	private MESBasicWare ware;
	
	
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
	 * 获取允许发料.
	 * 
	 * @return 允许发料
	 */
	@Column(nullable=true

		,name="ABLE_PASS"
	)
    public Boolean getAblePass() {
        return null == ablePass ? false : ablePass;
    }
	/**
	 * 设置允许发料.
	 * @param ablePass 允许发料
	 */
    public void setAblePass(Boolean ablePass) {
        this.ablePass = ablePass;
    }
	/**
	 * 获取物料删除标记.
	 * 
	 * @return 物料删除标记
	 */
	@Column(nullable=true

		,name="BOM_DEL_FLAG"
	)
    public Boolean getBomDelFlag() {
        return null == bomDelFlag ? false : bomDelFlag;
    }
	/**
	 * 设置物料删除标记.
	 * @param bomDelFlag 物料删除标记
	 */
    public void setBomDelFlag(Boolean bomDelFlag) {
        this.bomDelFlag = bomDelFlag;
    }
	/**
	 * 获取是否联副产品.
	 * 
	 * @return 是否联副产品
	 */
	@Column(nullable=true

		,name="CO_OPERATION"
	)
    public Boolean getCoOperation() {
        return null == coOperation ? false : coOperation;
    }
	/**
	 * 设置是否联副产品.
	 * @param coOperation 是否联副产品
	 */
    public void setCoOperation(Boolean coOperation) {
        this.coOperation = coOperation;
    }
	/**
	 * 获取特殊库存标志.
	 * 
	 * @return 特殊库存标志
	 */
	@Column(nullable=true

		,length = 256
		,name="EDITION"
	)
    public String getEdition() {
        return edition;
    }
	/**
	 * 设置特殊库存标志.
	 * @param edition 特殊库存标志
	 */
    public void setEdition(String edition) {
        this.edition = edition;
    }
	@ManyToOne
	@JoinColumn(name = "MANUL_ORDER_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMManulOrderMain getManulOrderId() {
        return manulOrderId;
    }
    public void setManulOrderId(WOMManulOrderMain manulOrderId) {
        this.manulOrderId = manulOrderId;
    }
	@OneToOne
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
	 * 获取原料批次.
	 * 
	 * @return 原料批次
	 */
	@Column(nullable=true

		,length = 256
		,name="MATERIAL_BATCH_NUM"
	)
    public String getMaterialBatchNum() {
        return materialBatchNum;
    }
	/**
	 * 设置原料批次.
	 * @param materialBatchNum 原料批次
	 */
    public void setMaterialBatchNum(String materialBatchNum) {
        this.materialBatchNum = materialBatchNum;
    }
	/**
	 * 获取需求数量.
	 * 
	 * @return 需求数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="NEED_NUMBER"
	)
    public java.math.BigDecimal getNeedNumber() {
        return needNumber;
    }
	/**
	 * 设置需求数量.
	 * @param needNumber 需求数量
	 */
    public void setNeedNumber(java.math.BigDecimal needNumber) {
        this.needNumber = needNumber;
    }
	/**
	 * 获取基本结束时间.
	 * 
	 * @return 基本结束时间
	 */
	@Column(nullable=true

		,name="PLAN_END_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPlanEndTime() {
        return planEndTime;
    }
	/**
	 * 设置基本结束时间.
	 * @param planEndTime 基本结束时间
	 */
    public void setPlanEndTime(java.util.Date planEndTime) {
        this.planEndTime = planEndTime;
    }
	/**
	 * 获取基本开始时间.
	 * 
	 * @return 基本开始时间
	 */
	@Column(nullable=true

		,name="PLAN_START_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPlanStartTime() {
        return planStartTime;
    }
	/**
	 * 设置基本开始时间.
	 * @param planStartTime 基本开始时间
	 */
    public void setPlanStartTime(java.util.Date planStartTime) {
        this.planStartTime = planStartTime;
    }
	/**
	 * 获取预留号.
	 * 
	 * @return 预留号
	 */
	@Column(nullable=true

		,length = 256
		,name="RE_NUM"
	)
    public String getReNum() {
        return reNum;
    }
	/**
	 * 设置预留号.
	 * @param reNum 预留号
	 */
    public void setReNum(String reNum) {
        this.reNum = reNum;
    }
	/**
	 * 获取预留号.
	 * 
	 * @return 预留号
	 */
	@Column(nullable=true

		,length = 256
		,name="RSNUM"
	)
    public String getRsNUM() {
        return rsNUM;
    }
	/**
	 * 设置预留号.
	 * @param rsNUM 预留号
	 */
    public void setRsNUM(String rsNUM) {
        this.rsNUM = rsNUM;
    }
	/**
	 * 获取预留行项目.
	 * 
	 * @return 预留行项目
	 */
	@Column(nullable=true

		,length = 256
		,name="RSPOS"
	)
    public String getRsPOS() {
        return rsPOS;
    }
	/**
	 * 设置预留行项目.
	 * @param rsPOS 预留行项目
	 */
    public void setRsPOS(String rsPOS) {
        this.rsPOS = rsPOS;
    }
	/**
	 * 获取销售订单号.
	 * 
	 * @return 销售订单号
	 */
	@Column(nullable=true

		,length = 256
		,name="SALE_ORDER_NUM"
	)
    public String getSaleOrderNum() {
        return saleOrderNum;
    }
	/**
	 * 设置销售订单号.
	 * @param saleOrderNum 销售订单号
	 */
    public void setSaleOrderNum(String saleOrderNum) {
        this.saleOrderNum = saleOrderNum;
    }
	/**
	 * 获取销售订单项目.
	 * 
	 * @return 销售订单项目
	 */
	@Column(nullable=true

		,length = 256
		,name="SALE_ORDER_PROJECT"
	)
    public String getSaleOrderProject() {
        return saleOrderProject;
    }
	/**
	 * 设置销售订单项目.
	 * @param saleOrderProject 销售订单项目
	 */
    public void setSaleOrderProject(String saleOrderProject) {
        this.saleOrderProject = saleOrderProject;
    }
	@OneToOne
	@JoinColumn(name = "UNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getUnit() {
        return unit;
    }
    public void setUnit(X6BasicBaseUnit unit) {
        this.unit = unit;
    }
	@OneToOne
	@JoinColumn(name = "WARE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWare() {
        return ware;
    }
    public void setWare(MESBasicWare ware) {
        this.ware = ware;
    }
	
	
	protected String _getEntityName() {
		return WOMManulOrderMaterial.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_bigintparamc")
	private Integer bigintparamc;
	
	@Column
    public Integer getBigintparamc() {
        return bigintparamc;
    }
	
    public void setBigintparamc(Integer bigintparamc) {
        this.bigintparamc = bigintparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_charparamc")
	private String charparamc;
	
	@Column
    public String getCharparamc() {
        return charparamc;
    }
	
    public void setCharparamc(String charparamc) {
        this.charparamc = charparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_dateparamc")
	private java.util.Date dateparamc;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamc() {
        return dateparamc;
    }
	
    public void setDateparamc(java.util.Date dateparamc) {
        this.dateparamc = dateparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_numberparamc")
	private java.math.BigDecimal numberparamc;
	
	@Column
    public java.math.BigDecimal getNumberparamc() {
        return numberparamc;
    }
	
    public void setNumberparamc(java.math.BigDecimal numberparamc) {
        this.numberparamc = numberparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_objparamc", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_objparamd", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_scparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_scparamc", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMaterial_scparamd", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_manulOrder_ManulOrderMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
