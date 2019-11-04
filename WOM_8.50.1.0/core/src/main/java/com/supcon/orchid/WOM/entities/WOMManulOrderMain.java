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
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产订单表.
 */
@javax.persistence.Entity(name=WOMManulOrderMain.JPA_NAME)
@Table(name = WOMManulOrderMain.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_manulOrder")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_manulOrder_ManulOrderMain")
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
		@AttributeOverride(name="valid", column=@Column(name = "VALID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMManulOrderMainConvertor.class})
public class WOMManulOrderMain extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_manulOrder";
	public static final String MODEL_CODE = "WOM_7.5.0.0_manulOrder_ManulOrderMain";
	public static final String DOC_TYPE = "WOM_manulOrder_manulOrderMain";
	public static final String TABLE_NAME = "wom_menul_order_main";
	public static final String JPA_NAME = "WOMManulOrderMain";


		private String edition ; // 生产版本
	private MESBasicFactoryModel factory;


		private java.math.BigDecimal hasManualNumber ; // 已生产数量

		private Boolean isFinshed = 
			Boolean.valueOf("false")
		; // 完成状态, 


		private String manulOrderNum ; // 生产订单号
	private Staff manulStaff;


		private java.math.BigDecimal orderNumber ; // 订单数量


		private String orderTyep ; // 订单类型

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planEndTime ; // 基本结束时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planStartTime ; // 基本开始时间
	private MESBasicProduct product;


		private String remarks ; // 备注


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
	 * 获取生产版本.
	 * 
	 * @return 生产版本
	 */
	@Column(nullable=true

		,length = 256
		,name="EDITION"
	)
    public String getEdition() {
        return edition;
    }
	/**
	 * 设置生产版本.
	 * @param edition 生产版本
	 */
    public void setEdition(String edition) {
        this.edition = edition;
    }
	@OneToOne
	@JoinColumn(name = "FACTORY", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getFactory() {
        return factory;
    }
    public void setFactory(MESBasicFactoryModel factory) {
        this.factory = factory;
    }
	/**
	 * 获取已生产数量.
	 * 
	 * @return 已生产数量
	 */
	@Column(nullable=true
			,precision=19,scale=2
		,name="HAS_MANUAL_NUMBER"
	)
    public java.math.BigDecimal getHasManualNumber() {
        return hasManualNumber;
    }
	/**
	 * 设置已生产数量.
	 * @param hasManualNumber 已生产数量
	 */
    public void setHasManualNumber(java.math.BigDecimal hasManualNumber) {
        this.hasManualNumber = hasManualNumber;
    }
	/**
	 * 获取完成状态.
	 * 
	 * @return 完成状态
	 */
	@Column(nullable=true

		,name="IS_FINSHED"
	)
    public Boolean getIsFinshed() {
        return null == isFinshed ? false : isFinshed;
    }
	/**
	 * 设置完成状态.
	 * @param isFinshed 完成状态
	 */
    public void setIsFinshed(Boolean isFinshed) {
        this.isFinshed = isFinshed;
    }
	/**
	 * 获取生产订单号.
	 * 
	 * @return 生产订单号
	 */
	@Column(nullable=true

		,length = 256
		,name="MANUL_ORDER_NUM"
	)
    public String getManulOrderNum() {
        return manulOrderNum;
    }
	/**
	 * 设置生产订单号.
	 * @param manulOrderNum 生产订单号
	 */
    public void setManulOrderNum(String manulOrderNum) {
        this.manulOrderNum = manulOrderNum;
    }
	@OneToOne
	@JoinColumn(name = "MANUL_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getManulStaff() {
        return manulStaff;
    }
    public void setManulStaff(Staff manulStaff) {
        this.manulStaff = manulStaff;
    }
	/**
	 * 获取订单数量.
	 * 
	 * @return 订单数量
	 */
	@Column(nullable=true
			,precision=19,scale=2
		,name="ORDER_NUMBER"
	)
    public java.math.BigDecimal getOrderNumber() {
        return orderNumber;
    }
	/**
	 * 设置订单数量.
	 * @param orderNumber 订单数量
	 */
    public void setOrderNumber(java.math.BigDecimal orderNumber) {
        this.orderNumber = orderNumber;
    }
	/**
	 * 获取订单类型.
	 * 
	 * @return 订单类型
	 */
	@Column(nullable=true

		,length = 256
		,name="ORDER_TYEP"
	)
    public String getOrderTyep() {
        return orderTyep;
    }
	/**
	 * 设置订单类型.
	 * @param orderTyep 订单类型
	 */
    public void setOrderTyep(String orderTyep) {
        this.orderTyep = orderTyep;
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
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
		,name="REMARKS"
	)
    public String getRemarks() {
        return remarks;
    }
	/**
	 * 设置备注.
	 * @param remarks 备注
	 */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
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
		return WOMManulOrderMain.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_bigintparamc")
	private Integer bigintparamc;
	
	@Column
    public Integer getBigintparamc() {
        return bigintparamc;
    }
	
    public void setBigintparamc(Integer bigintparamc) {
        this.bigintparamc = bigintparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_bigintparamd")
	private Integer bigintparamd;
	
	@Column
    public Integer getBigintparamd() {
        return bigintparamd;
    }
	
    public void setBigintparamd(Integer bigintparamd) {
        this.bigintparamd = bigintparamd;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_bigintparame")
	private Integer bigintparame;
	
	@Column
    public Integer getBigintparame() {
        return bigintparame;
    }
	
    public void setBigintparame(Integer bigintparame) {
        this.bigintparame = bigintparame;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_charparamc")
	private String charparamc;
	
	@Column
    public String getCharparamc() {
        return charparamc;
    }
	
    public void setCharparamc(String charparamc) {
        this.charparamc = charparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_charparamd")
	private String charparamd;
	
	@Column
    public String getCharparamd() {
        return charparamd;
    }
	
    public void setCharparamd(String charparamd) {
        this.charparamd = charparamd;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_charparame")
	private String charparame;
	
	@Column
    public String getCharparame() {
        return charparame;
    }
	
    public void setCharparame(String charparame) {
        this.charparame = charparame;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_dateparamc")
	private java.util.Date dateparamc;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamc() {
        return dateparamc;
    }
	
    public void setDateparamc(java.util.Date dateparamc) {
        this.dateparamc = dateparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_numberparamc")
	private java.math.BigDecimal numberparamc;
	
	@Column
    public java.math.BigDecimal getNumberparamc() {
        return numberparamc;
    }
	
    public void setNumberparamc(java.math.BigDecimal numberparamc) {
        this.numberparamc = numberparamc;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_objparamc", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_manulOrder_ManulOrderMain_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
