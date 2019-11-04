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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 现存量.
 */
@javax.persistence.Entity(name=WOMStandingcropRef.JPA_NAME)
@Table(name = WOMStandingcropRef.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_standingcropRef")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_standingcropRef_StandingcropRef")
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
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_standingcropRef_StandingcropRef,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMStandingcropRefConvertor.class})
public class WOMStandingcropRef extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_standingcropRef";
	public static final String MODEL_CODE = "WOM_7.5.0.0_standingcropRef_StandingcropRef";
	public static final String DOC_TYPE = "WOM_standingcropRef_standingcropRef";
	public static final String TABLE_NAME = "material_standingcrops";
	public static final String JPA_NAME = "WOMStandingcropRef";


		private java.math.BigDecimal availiQuantity ; // 可用量


		private java.math.BigDecimal backQuantity ; // 退料量
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String batchText ; // 物料批号


		private java.math.BigDecimal frozenQuantity ; // 冻结量
	private MESBasicProduct good;
	private WOMManulOrderMain manulOrder;


		private java.math.BigDecimal onhand ; // 现存量
	private MESBasicStoreSet placeSet;
	private WOMPrepareMaterial prepareMaterial;
	private WOMPrepareMaterial prepareOrder;
	private MESBasicWare wareID;
	
	
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
	 * 获取可用量.
	 * 
	 * @return 可用量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="AVAILI_QUANTITY"
	)
    public java.math.BigDecimal getAvailiQuantity() {
        return availiQuantity;
    }
	/**
	 * 设置可用量.
	 * @param availiQuantity 可用量
	 */
    public void setAvailiQuantity(java.math.BigDecimal availiQuantity) {
        this.availiQuantity = availiQuantity;
    }
	/**
	 * 获取退料量.
	 * 
	 * @return 退料量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="BACK_QUANTITY"
	)
    public java.math.BigDecimal getBackQuantity() {
        return backQuantity;
    }
	/**
	 * 设置退料量.
	 * @param backQuantity 退料量
	 */
    public void setBackQuantity(java.math.BigDecimal backQuantity) {
        this.backQuantity = backQuantity;
    }
	/**
	 * 获取物料批号.
	 * 
	 * @return 物料批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_TEXT"
	)
    public String getBatchText() {
        return batchText;
    }
	/**
	 * 设置物料批号.
	 * @param batchText 物料批号
	 */
    public void setBatchText(String batchText) {
        this.batchText = batchText;
    }
	/**
	 * 获取冻结量.
	 * 
	 * @return 冻结量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="FROZEN_QUANTITY"
	)
    public java.math.BigDecimal getFrozenQuantity() {
        return frozenQuantity;
    }
	/**
	 * 设置冻结量.
	 * @param frozenQuantity 冻结量
	 */
    public void setFrozenQuantity(java.math.BigDecimal frozenQuantity) {
        this.frozenQuantity = frozenQuantity;
    }
	@OneToOne
	@JoinColumn(name = "GOOD", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
	@Index(name="index_StandingcropRef_good")
    public MESBasicProduct getGood() {
        return good;
    }
    public void setGood(MESBasicProduct good) {
        this.good = good;
    }
	@ManyToOne
	@JoinColumn(name = "MANUL_ORDER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
	@Index(name="index_StandingcropRef_manulOrder")
    public WOMManulOrderMain getManulOrder() {
        return manulOrder;
    }
    public void setManulOrder(WOMManulOrderMain manulOrder) {
        this.manulOrder = manulOrder;
    }
	/**
	 * 获取现存量.
	 * 
	 * @return 现存量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ONHAND"
	)
    public java.math.BigDecimal getOnhand() {
        return onhand;
    }
	/**
	 * 设置现存量.
	 * @param onhand 现存量
	 */
    public void setOnhand(java.math.BigDecimal onhand) {
        this.onhand = onhand;
    }
	@OneToOne
	@JoinColumn(name = "PLACESET", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public MESBasicStoreSet getPlaceSet() {
        return placeSet;
    }
    public void setPlaceSet(MESBasicStoreSet placeSet) {
        this.placeSet = placeSet;
    }
	@OneToOne
	@JoinColumn(name = "PREPARE_MATERIAL", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMPrepareMaterial getPrepareMaterial() {
        return prepareMaterial;
    }
    public void setPrepareMaterial(WOMPrepareMaterial prepareMaterial) {
        this.prepareMaterial = prepareMaterial;
    }
	@OneToOne
	@JoinColumn(name = "PREPARE_ORDER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
	@Index(name="index_StandingcropRef_prepareOrder")
    public WOMPrepareMaterial getPrepareOrder() {
        return prepareOrder;
    }
    public void setPrepareOrder(WOMPrepareMaterial prepareOrder) {
        this.prepareOrder = prepareOrder;
    }
	@OneToOne
	@JoinColumn(name = "WAREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWareID() {
        return wareID;
    }
    public void setWareID(MESBasicWare wareID) {
        this.wareID = wareID;
    }
	
	
	protected String _getEntityName() {
		return WOMStandingcropRef.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_standingcropRef_StandingcropRef_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_standingcropRef_StandingcropRef,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
