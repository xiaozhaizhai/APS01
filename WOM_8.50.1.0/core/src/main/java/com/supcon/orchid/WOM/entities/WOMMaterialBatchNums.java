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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 物料批号(废需删除).
 */
@javax.persistence.Entity(name=WOMMaterialBatchNums.JPA_NAME)
@Table(name = WOMMaterialBatchNums.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_MaterialBatchNums")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_MaterialBatchNums,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMMaterialBatchNumsConvertor.class})
public class WOMMaterialBatchNums extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_MaterialBatchNums";
	public static final String DOC_TYPE = "WOM_produceTask_materialBatchNums";
	public static final String TABLE_NAME = "wom_material_batch_nums";
	public static final String JPA_NAME = "WOMMaterialBatchNums";
	private WOMProduceTaskActive activeId;
	private WOMStandingcropRef batchNum;


		private java.math.BigDecimal planNum ; // 数量


		private String proNum ; // 批号
	private MESBasicProduct productId;
	
	
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
	
	
	@Index(name="IDX_MATERIALBATCHNU_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@ManyToOne
	@JoinColumn(name = "ACTIVE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskActive getActiveId() {
        return activeId;
    }
    public void setActiveId(WOMProduceTaskActive activeId) {
        this.activeId = activeId;
    }
	@ManyToOne
	@JoinColumn(name = "BATCH_NUM", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMStandingcropRef getBatchNum() {
        return batchNum;
    }
    public void setBatchNum(WOMStandingcropRef batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取数量.
	 * 
	 * @return 数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PLAN_NUM"
	)
    public java.math.BigDecimal getPlanNum() {
        return planNum;
    }
	/**
	 * 设置数量.
	 * @param planNum 数量
	 */
    public void setPlanNum(java.math.BigDecimal planNum) {
        this.planNum = planNum;
    }
	/**
	 * 获取批号.
	 * 
	 * @return 批号
	 */
	@Column(nullable=true

		,length = 256
		,name="PRO_NUM"
	)
    public String getProNum() {
        return proNum;
    }
	/**
	 * 设置批号.
	 * @param proNum 批号
	 */
    public void setProNum(String proNum) {
        this.proNum = proNum;
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
	
	
	protected String _getEntityName() {
		return WOMMaterialBatchNums.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_MaterialBatchNums_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_MaterialBatchNums,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}
