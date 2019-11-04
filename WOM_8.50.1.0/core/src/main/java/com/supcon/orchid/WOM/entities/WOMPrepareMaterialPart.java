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
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;		
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 备料明细.
 */
@javax.persistence.Entity(name=WOMPrepareMaterialPart.JPA_NAME)
@Table(name = WOMPrepareMaterialPart.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_prepareMaterial")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMPrepareMaterialPartConvertor.class})
public class WOMPrepareMaterialPart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_prepareMaterial";
	public static final String MODEL_CODE = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart";
	public static final String DOC_TYPE = "WOM_prepareMaterial_prepareMaterialPart";
	public static final String TABLE_NAME = "wom_prepare_material_parts";
	public static final String JPA_NAME = "WOMPrepareMaterialPart";


		private String batchNum ; // 物料批号
	private WOMStandingcropRef batchNumObj;


		private String code ; // 物料编码


		private String edition ; // 特殊库存标志
	private WOMPrepareMaterial formulaId;


		private java.math.BigDecimal hasDoneNum ; // 已备数量
	private WOMManulOrderMaterial manuOrder;


		private String materialBatchNum ; // 原料批号（文本）


		private String name ; // 物料名称


		private java.math.BigDecimal prepareNum ; // 数量
	private MESBasicProduct productId;


		private String remark ; // 备注


		private String rsnum ; // 预留号


		private String rspos ; // 预留行项目
	private MESBasicStoreSet storeID;
	private X6BasicBaseUnit unit;


		private java.math.BigDecimal useNeed ; // 现存量
	private WOMStandingcropRef useNeedRef;


		private java.math.BigDecimal useNum ; // 使用量
	private MESBasicWare ware;


		private String wareCode ; // 仓库编码（文本）
	private MESBasicWare wareId;
	
	
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
	
	
	@Index(name="IDX_PREPAREMATERIAL_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取物料批号.
	 * 
	 * @return 物料批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置物料批号.
	 * @param batchNum 物料批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	@OneToOne
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
	 * 获取物料编码.
	 * 
	 * @return 物料编码
	 */
	@Column(nullable=true

		,length = 256
		,name="CODE"
	)
    public String getCode() {
        return code;
    }
	/**
	 * 设置物料编码.
	 * @param code 物料编码
	 */
    public void setCode(String code) {
        this.code = code;
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
	@JoinColumn(name = "FORMULA_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public WOMPrepareMaterial getFormulaId() {
        return formulaId;
    }
    public void setFormulaId(WOMPrepareMaterial formulaId) {
        this.formulaId = formulaId;
    }
	/**
	 * 获取已备数量.
	 * 
	 * @return 已备数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="HAS_DONE_NUM"
	)
    public java.math.BigDecimal getHasDoneNum() {
        return hasDoneNum;
    }
	/**
	 * 设置已备数量.
	 * @param hasDoneNum 已备数量
	 */
    public void setHasDoneNum(java.math.BigDecimal hasDoneNum) {
        this.hasDoneNum = hasDoneNum;
    }
	@OneToOne
	@JoinColumn(name = "MANU_ORDER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMManulOrderMaterial getManuOrder() {
        return manuOrder;
    }
    public void setManuOrder(WOMManulOrderMaterial manuOrder) {
        this.manuOrder = manuOrder;
    }
	/**
	 * 获取原料批号（文本）.
	 * 
	 * @return 原料批号（文本）
	 */
	@Column(nullable=true

		,length = 200
		,name="MATERIAL_BATCH_NUM"
	)
    public String getMaterialBatchNum() {
        return materialBatchNum;
    }
	/**
	 * 设置原料批号（文本）.
	 * @param materialBatchNum 原料批号（文本）
	 */
    public void setMaterialBatchNum(String materialBatchNum) {
        this.materialBatchNum = materialBatchNum;
    }
	/**
	 * 获取物料名称.
	 * 
	 * @return 物料名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置物料名称.
	 * @param name 物料名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取数量.
	 * 
	 * @return 数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PREPARE_NUM"
	)
    public java.math.BigDecimal getPrepareNum() {
        return prepareNum;
    }
	/**
	 * 设置数量.
	 * @param prepareNum 数量
	 */
    public void setPrepareNum(java.math.BigDecimal prepareNum) {
        this.prepareNum = prepareNum;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public MESBasicProduct getProductId() {
        return productId;
    }
    public void setProductId(MESBasicProduct productId) {
        this.productId = productId;
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
	 * 获取预留号.
	 * 
	 * @return 预留号
	 */
	@Column(nullable=true

		,length = 256
		,name="RSNUM"
	)
    public String getRsnum() {
        return rsnum;
    }
	/**
	 * 设置预留号.
	 * @param rsnum 预留号
	 */
    public void setRsnum(String rsnum) {
        this.rsnum = rsnum;
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
    public String getRspos() {
        return rspos;
    }
	/**
	 * 设置预留行项目.
	 * @param rspos 预留行项目
	 */
    public void setRspos(String rspos) {
        this.rspos = rspos;
    }
	@OneToOne
	@JoinColumn(name = "STOREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public MESBasicStoreSet getStoreID() {
        return storeID;
    }
    public void setStoreID(MESBasicStoreSet storeID) {
        this.storeID = storeID;
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
	/**
	 * 获取现存量.
	 * 
	 * @return 现存量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="USE_NEED"
	)
    public java.math.BigDecimal getUseNeed() {
        return useNeed;
    }
	/**
	 * 设置现存量.
	 * @param useNeed 现存量
	 */
    public void setUseNeed(java.math.BigDecimal useNeed) {
        this.useNeed = useNeed;
    }
	@OneToOne
	@JoinColumn(name = "USE_NEED_REF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMStandingcropRef getUseNeedRef() {
        return useNeedRef;
    }
    public void setUseNeedRef(WOMStandingcropRef useNeedRef) {
        this.useNeedRef = useNeedRef;
    }
	/**
	 * 获取使用量.
	 * 
	 * @return 使用量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="USE_NUM"
	)
    public java.math.BigDecimal getUseNum() {
        return useNum;
    }
	/**
	 * 设置使用量.
	 * @param useNum 使用量
	 */
    public void setUseNum(java.math.BigDecimal useNum) {
        this.useNum = useNum;
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
	/**
	 * 获取仓库编码（文本）.
	 * 
	 * @return 仓库编码（文本）
	 */
	@Column(nullable=true

		,length = 200
		,name="WARE_CODE"
	)
    public String getWareCode() {
        return wareCode;
    }
	/**
	 * 设置仓库编码（文本）.
	 * @param wareCode 仓库编码（文本）
	 */
    public void setWareCode(String wareCode) {
        this.wareCode = wareCode;
    }
	@OneToOne
	@JoinColumn(name = "WARE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWareId() {
        return wareId;
    }
    public void setWareId(MESBasicWare wareId) {
        this.wareId = wareId;
    }
	
	
	protected String _getEntityName() {
		return WOMPrepareMaterialPart.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
