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
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 投料记录.
 */
@javax.persistence.Entity(name=WOMPutInMaterialPart.JPA_NAME)
@Table(name = WOMPutInMaterialPart.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_putInMaterial")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_putInMaterial_PutInMaterialPart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_putInMaterial_PutInMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMPutInMaterialPartConvertor.class})
public class WOMPutInMaterialPart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_putInMaterial";
	public static final String MODEL_CODE = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart";
	public static final String DOC_TYPE = "WOM_putInMaterial_putInMaterialPart";
	public static final String TABLE_NAME = "wom_put_in_material_parts";
	public static final String JPA_NAME = "WOMPutInMaterialPart";
	private WOMAdjustOrTempRecords adjustActive;


		private String batchNum ; // 物料批号
	private MESBasicFactoryModel factoryId;
	private RMFormulaProcessActive formluActive;
	private WOMPutInMaterial headId;


		private java.math.BigDecimal lossNum ; // 损耗数量
	private WOMStandingcropRef proBatch;


		private String productCode ; // 物料编码
	private MESBasicProduct productId;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date putinDate ; // 投料时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date putinEndDate ; // 投料结束时间
	private Staff putinStaff;
	private SystemCode putinType
; // 投料方式


		private String remark ; // 备注
	private MESBasicStoreSet storeID;


		private Integer takeTime ; // 耗时（分钟）
	private WOMProduceTaskActive taskActiveId;
	private WOMProduceTask taskID;
	private WOMProduceTaskProcess taskProcessId;


		private java.math.BigDecimal useNum ; // 投料数量
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
	
	
	@Index(name="IDX_PUTINMATERIALPA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@OneToOne
	@JoinColumn(name = "ADJUST_ACTIVE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMAdjustOrTempRecords getAdjustActive() {
        return adjustActive;
    }
    public void setAdjustActive(WOMAdjustOrTempRecords adjustActive) {
        this.adjustActive = adjustActive;
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
	@JoinColumn(name = "FACTORY_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getFactoryId() {
        return factoryId;
    }
    public void setFactoryId(MESBasicFactoryModel factoryId) {
        this.factoryId = factoryId;
    }
	@OneToOne
	@JoinColumn(name = "FORMLU_ACTIVE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public RMFormulaProcessActive getFormluActive() {
        return formluActive;
    }
    public void setFormluActive(RMFormulaProcessActive formluActive) {
        this.formluActive = formluActive;
    }
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMPutInMaterial getHeadId() {
        return headId;
    }
    public void setHeadId(WOMPutInMaterial headId) {
        this.headId = headId;
    }
	/**
	 * 获取损耗数量.
	 * 
	 * @return 损耗数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LOSS_NUM"
	)
    public java.math.BigDecimal getLossNum() {
        return lossNum;
    }
	/**
	 * 设置损耗数量.
	 * @param lossNum 损耗数量
	 */
    public void setLossNum(java.math.BigDecimal lossNum) {
        this.lossNum = lossNum;
    }
	@OneToOne
	@JoinColumn(name = "PRO_BATCH", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMStandingcropRef getProBatch() {
        return proBatch;
    }
    public void setProBatch(WOMStandingcropRef proBatch) {
        this.proBatch = proBatch;
    }
	/**
	 * 获取物料编码.
	 * 
	 * @return 物料编码
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODUCT_CODE"
	)
    public String getProductCode() {
        return productCode;
    }
	/**
	 * 设置物料编码.
	 * @param productCode 物料编码
	 */
    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }
	@OneToOne
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
	 * 获取投料时间.
	 * 
	 * @return 投料时间
	 */
	@Column(nullable=true

		,name="PUTIN_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPutinDate() {
        return putinDate;
    }
	/**
	 * 设置投料时间.
	 * @param putinDate 投料时间
	 */
    public void setPutinDate(java.util.Date putinDate) {
        this.putinDate = putinDate;
    }
	/**
	 * 获取投料结束时间.
	 * 
	 * @return 投料结束时间
	 */
	@Column(nullable=true

		,name="PUTIN_END_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPutinEndDate() {
        return putinEndDate;
    }
	/**
	 * 设置投料结束时间.
	 * @param putinEndDate 投料结束时间
	 */
    public void setPutinEndDate(java.util.Date putinEndDate) {
        this.putinEndDate = putinEndDate;
    }
	@OneToOne
	@JoinColumn(name = "PUTIN_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getPutinStaff() {
        return putinStaff;
    }
    public void setPutinStaff(Staff putinStaff) {
        this.putinStaff = putinStaff;
    }
	/**
	 * 获取投料方式.
	 * 
	 * @return 投料方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PUTIN_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getPutinType() {
		return putinType;
	}
	/**
	 * 设置投料方式.
	 * @param putinType 投料方式
	 */
	public void setPutinType(SystemCode putinType) {
		this.putinType = (SystemCode) putinType;
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
	@OneToOne
	@JoinColumn(name = "STOREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicStoreSet getStoreID() {
        return storeID;
    }
    public void setStoreID(MESBasicStoreSet storeID) {
        this.storeID = storeID;
    }
	/**
	 * 获取耗时（分钟）.
	 * 
	 * @return 耗时（分钟）
	 */
	@Column(nullable=true

		,name="TAKE_TIME"
	)
    public Integer getTakeTime() {
        return takeTime;
    }
	/**
	 * 设置耗时（分钟）.
	 * @param takeTime 耗时（分钟）
	 */
    public void setTakeTime(Integer takeTime) {
        this.takeTime = takeTime;
    }
	@OneToOne
	@JoinColumn(name = "TASK_ACTIVE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskActive getTaskActiveId() {
        return taskActiveId;
    }
    public void setTaskActiveId(WOMProduceTaskActive taskActiveId) {
        this.taskActiveId = taskActiveId;
    }
	@OneToOne
	@JoinColumn(name = "TASKID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getTaskID() {
        return taskID;
    }
    public void setTaskID(WOMProduceTask taskID) {
        this.taskID = taskID;
    }
	@OneToOne
	@JoinColumn(name = "TASK_PROCESS_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskProcess getTaskProcessId() {
        return taskProcessId;
    }
    public void setTaskProcessId(WOMProduceTaskProcess taskProcessId) {
        this.taskProcessId = taskProcessId;
    }
	/**
	 * 获取投料数量.
	 * 
	 * @return 投料数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="USE_NUM"
	)
    public java.math.BigDecimal getUseNum() {
        return useNum;
    }
	/**
	 * 设置投料数量.
	 * @param useNum 投料数量
	 */
    public void setUseNum(java.math.BigDecimal useNum) {
        this.useNum = useNum;
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
		return WOMPutInMaterialPart.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_putInMaterial_PutInMaterialPart_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_putInMaterial_PutInMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
