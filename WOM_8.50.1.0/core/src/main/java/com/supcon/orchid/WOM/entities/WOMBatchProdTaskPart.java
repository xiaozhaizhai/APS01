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
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.RM.entities.RMFormula;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 批量明细.
 */
@javax.persistence.Entity(name=WOMBatchProdTaskPart.JPA_NAME)
@Table(name = WOMBatchProdTaskPart.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_batchProduceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMBatchProdTaskPartConvertor.class})
public class WOMBatchProdTaskPart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_batchProduceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart";
	public static final String DOC_TYPE = "WOM_batchProduceTask_batchProdTaskPart";
	public static final String TABLE_NAME = "wom_batch_prod_task_parts";
	public static final String JPA_NAME = "WOMBatchProdTaskPart";


		private Integer amount ; // 设置数量
	private WOMStandingcropRef bulkBatchNum;


		private java.math.BigDecimal bulkNum ; // 待包装数量
	private MESBasicProduct bulkProduct;
	private SystemCode bulkType
; // 包装类型
	private MESBasicFactoryModel factoryId;
	private RMFormula formularId;
	private WOMBatchProduceTask headId;


		private Boolean isAddTask = false; // 已生成指令
	private SystemCode orderType
; // 类型

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planEndTime ; // 计划结束时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planStartTime ; // 计划开始时间


		private String productBatchNum ; // 生产批号
	private MESBasicProduct productId;


		private java.math.BigDecimal productNum ; // 生产数量


		private String remark ; // 备注
	private SystemCode taskType
; // 指令单类型
	
	
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
	
	
	@Index(name="IDX_BATCHPRODTASKPA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取设置数量.
	 * 
	 * @return 设置数量
	 */
	@Column(nullable=true

		,name="AMOUNT"
	)
    public Integer getAmount() {
        return amount;
    }
	/**
	 * 设置设置数量.
	 * @param amount 设置数量
	 */
    public void setAmount(Integer amount) {
        this.amount = amount;
    }
	@OneToOne
	@JoinColumn(name = "BULK_BATCH_NUM", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMStandingcropRef getBulkBatchNum() {
        return bulkBatchNum;
    }
    public void setBulkBatchNum(WOMStandingcropRef bulkBatchNum) {
        this.bulkBatchNum = bulkBatchNum;
    }
	/**
	 * 获取待包装数量.
	 * 
	 * @return 待包装数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="BULK_NUM"
	)
    public java.math.BigDecimal getBulkNum() {
        return bulkNum;
    }
	/**
	 * 设置待包装数量.
	 * @param bulkNum 待包装数量
	 */
    public void setBulkNum(java.math.BigDecimal bulkNum) {
        this.bulkNum = bulkNum;
    }
	@OneToOne
	@JoinColumn(name = "BULK_PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getBulkProduct() {
        return bulkProduct;
    }
    public void setBulkProduct(MESBasicProduct bulkProduct) {
        this.bulkProduct = bulkProduct;
    }
	/**
	 * 获取包装类型.
	 * 
	 * @return 包装类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BULK_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBulkType() {
		return bulkType;
	}
	/**
	 * 设置包装类型.
	 * @param bulkType 包装类型
	 */
	public void setBulkType(SystemCode bulkType) {
		this.bulkType = (SystemCode) bulkType;
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
	@JoinColumn(name = "FORMULAR_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormula getFormularId() {
        return formularId;
    }
    public void setFormularId(RMFormula formularId) {
        this.formularId = formularId;
    }
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMBatchProduceTask getHeadId() {
        return headId;
    }
    public void setHeadId(WOMBatchProduceTask headId) {
        this.headId = headId;
    }
	/**
	 * 获取已生成指令.
	 * 
	 * @return 已生成指令
	 */
	@Column(nullable=true

		,name="IS_ADD_TASK"
	)
    public Boolean getIsAddTask() {
        return null == isAddTask ? false : isAddTask;
    }
	/**
	 * 设置已生成指令.
	 * @param isAddTask 已生成指令
	 */
    public void setIsAddTask(Boolean isAddTask) {
        this.isAddTask = isAddTask;
    }
	/**
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ORDER_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOrderType() {
		return orderType;
	}
	/**
	 * 设置类型.
	 * @param orderType 类型
	 */
	public void setOrderType(SystemCode orderType) {
		this.orderType = (SystemCode) orderType;
	}
	/**
	 * 获取计划结束时间.
	 * 
	 * @return 计划结束时间
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
	 * 设置计划结束时间.
	 * @param planEndTime 计划结束时间
	 */
    public void setPlanEndTime(java.util.Date planEndTime) {
        this.planEndTime = planEndTime;
    }
	/**
	 * 获取计划开始时间.
	 * 
	 * @return 计划开始时间
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
	 * 设置计划开始时间.
	 * @param planStartTime 计划开始时间
	 */
    public void setPlanStartTime(java.util.Date planStartTime) {
        this.planStartTime = planStartTime;
    }
	/**
	 * 获取生产批号.
	 * 
	 * @return 生产批号
	 */
	@Column(nullable=true

		,name="PRODUCT_BATCH_NUM"
	)
    public String getProductBatchNum() {
        return productBatchNum;
    }
	/**
	 * 设置生产批号.
	 * @param productBatchNum 生产批号
	 */
    public void setProductBatchNum(String productBatchNum) {
        this.productBatchNum = productBatchNum;
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
	 * 获取生产数量.
	 * 
	 * @return 生产数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_NUM"
	)
    public java.math.BigDecimal getProductNum() {
        return productNum;
    }
	/**
	 * 设置生产数量.
	 * @param productNum 生产数量
	 */
    public void setProductNum(java.math.BigDecimal productNum) {
        this.productNum = productNum;
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
	 * 获取指令单类型.
	 * 
	 * @return 指令单类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="TASK_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getTaskType() {
		return taskType;
	}
	/**
	 * 设置指令单类型.
	 * @param taskType 指令单类型
	 */
	public void setTaskType(SystemCode taskType) {
		this.taskType = (SystemCode) taskType;
	}
	
	
	protected String _getEntityName() {
		return WOMBatchProdTaskPart.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
