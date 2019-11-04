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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 待投料记录.
 */
@javax.persistence.Entity(name=WOMWaitPutinRecords.JPA_NAME)
@Table(name = WOMWaitPutinRecords.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_WaitPutinRecords")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_WaitPutinRecords,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMWaitPutinRecordsConvertor.class})
public class WOMWaitPutinRecords extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_WaitPutinRecords";
	public static final String DOC_TYPE = "WOM_produceTask_waitPutinRecords";
	public static final String TABLE_NAME = "wom_wait_putin_records";
	public static final String JPA_NAME = "WOMWaitPutinRecords";
	private SystemCode activeSource
; // 活动来源
	private SystemCode activeType
; // 活动类型


		private Integer actOrder ; // 投料顺序

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date actTime ; // 操作时间


		private java.math.BigDecimal actualNum ; // 实际投料数量
	private WOMBatchingMaterialPart batchMaterialID;


		private String batchNum ; // 生产批号


		private Boolean isFinish = false; // 已执行


		private String lableCode ; // 标签编号


		private java.math.BigDecimal materialNum ; // 计划投料数量


		private Boolean mobileTerminal = false; // 移动端执行


		private String phaseID ; // phaseID
	private MESBasicProduct productID;


		private String productNum ; // 物料批号


		private String remark ; // 备注


		private Boolean scanMaterial = false; // 扫码投料
	private Staff staffID;
	private WOMProduceTaskActive taskActiveID;
	private WOMProduceTask taskID;
	private WOMProduceTaskProcess taskProcessID;
	
	
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
	
	
	@Index(name="IDX_WAITPUTINRECORD_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取活动来源.
	 * 
	 * @return 活动来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_SOURCE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveSource() {
		return activeSource;
	}
	/**
	 * 设置活动来源.
	 * @param activeSource 活动来源
	 */
	public void setActiveSource(SystemCode activeSource) {
		this.activeSource = (SystemCode) activeSource;
	}
	/**
	 * 获取活动类型.
	 * 
	 * @return 活动类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveType() {
		return activeType;
	}
	/**
	 * 设置活动类型.
	 * @param activeType 活动类型
	 */
	public void setActiveType(SystemCode activeType) {
		this.activeType = (SystemCode) activeType;
	}
	/**
	 * 获取投料顺序.
	 * 
	 * @return 投料顺序
	 */
	@Column(nullable=true

		,name="ACT_ORDER"
	)
    public Integer getActOrder() {
        return actOrder;
    }
	/**
	 * 设置投料顺序.
	 * @param actOrder 投料顺序
	 */
    public void setActOrder(Integer actOrder) {
        this.actOrder = actOrder;
    }
	/**
	 * 获取操作时间.
	 * 
	 * @return 操作时间
	 */
	@Column(nullable=true

		,name="ACT_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getActTime() {
        return actTime;
    }
	/**
	 * 设置操作时间.
	 * @param actTime 操作时间
	 */
    public void setActTime(java.util.Date actTime) {
        this.actTime = actTime;
    }
	/**
	 * 获取实际投料数量.
	 * 
	 * @return 实际投料数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ACTUAL_NUM"
	)
    public java.math.BigDecimal getActualNum() {
        return actualNum;
    }
	/**
	 * 设置实际投料数量.
	 * @param actualNum 实际投料数量
	 */
    public void setActualNum(java.math.BigDecimal actualNum) {
        this.actualNum = actualNum;
    }
	@OneToOne
	@JoinColumn(name = "BATCH_MATERIALID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMBatchingMaterialPart getBatchMaterialID() {
        return batchMaterialID;
    }
    public void setBatchMaterialID(WOMBatchingMaterialPart batchMaterialID) {
        this.batchMaterialID = batchMaterialID;
    }
	/**
	 * 获取生产批号.
	 * 
	 * @return 生产批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置生产批号.
	 * @param batchNum 生产批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取已执行.
	 * 
	 * @return 已执行
	 */
	@Column(nullable=true

		,name="IS_FINISH"
	)
    public Boolean getIsFinish() {
        return null == isFinish ? false : isFinish;
    }
	/**
	 * 设置已执行.
	 * @param isFinish 已执行
	 */
    public void setIsFinish(Boolean isFinish) {
        this.isFinish = isFinish;
    }
	/**
	 * 获取标签编号.
	 * 
	 * @return 标签编号
	 */
	@Column(nullable=true

		,name="LABLE_CODE"
	)
    @javax.persistence.Lob
    public String getLableCode() {
        return lableCode;
    }
	/**
	 * 设置标签编号.
	 * @param lableCode 标签编号
	 */
    public void setLableCode(String lableCode) {
        this.lableCode = lableCode;
    }
	/**
	 * 获取计划投料数量.
	 * 
	 * @return 计划投料数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="MATERIAL_NUM"
	)
    public java.math.BigDecimal getMaterialNum() {
        return materialNum;
    }
	/**
	 * 设置计划投料数量.
	 * @param materialNum 计划投料数量
	 */
    public void setMaterialNum(java.math.BigDecimal materialNum) {
        this.materialNum = materialNum;
    }
	/**
	 * 获取移动端执行.
	 * 
	 * @return 移动端执行
	 */
	@Column(nullable=true

		,name="MOBILE_TERMINAL"
	)
    public Boolean getMobileTerminal() {
        return null == mobileTerminal ? false : mobileTerminal;
    }
	/**
	 * 设置移动端执行.
	 * @param mobileTerminal 移动端执行
	 */
    public void setMobileTerminal(Boolean mobileTerminal) {
        this.mobileTerminal = mobileTerminal;
    }
	/**
	 * 获取phaseID.
	 * 
	 * @return phaseID
	 */
	@Column(nullable=true

		,length = 256
		,name="PHASEID"
	)
    public String getPhaseID() {
        return phaseID;
    }
	/**
	 * 设置phaseID.
	 * @param phaseID phaseID
	 */
    public void setPhaseID(String phaseID) {
        this.phaseID = phaseID;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCTID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductID() {
        return productID;
    }
    public void setProductID(MESBasicProduct productID) {
        this.productID = productID;
    }
	/**
	 * 获取物料批号.
	 * 
	 * @return 物料批号
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODUCT_NUM"
	)
    public String getProductNum() {
        return productNum;
    }
	/**
	 * 设置物料批号.
	 * @param productNum 物料批号
	 */
    public void setProductNum(String productNum) {
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
	 * 获取扫码投料.
	 * 
	 * @return 扫码投料
	 */
	@Column(nullable=true

		,name="SCAN_MATERIAL"
	)
    public Boolean getScanMaterial() {
        return null == scanMaterial ? false : scanMaterial;
    }
	/**
	 * 设置扫码投料.
	 * @param scanMaterial 扫码投料
	 */
    public void setScanMaterial(Boolean scanMaterial) {
        this.scanMaterial = scanMaterial;
    }
	@OneToOne
	@JoinColumn(name = "STAFFID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getStaffID() {
        return staffID;
    }
    public void setStaffID(Staff staffID) {
        this.staffID = staffID;
    }
	@OneToOne
	@JoinColumn(name = "TASK_ACTIVEID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskActive getTaskActiveID() {
        return taskActiveID;
    }
    public void setTaskActiveID(WOMProduceTaskActive taskActiveID) {
        this.taskActiveID = taskActiveID;
    }
	@ManyToOne
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
	@JoinColumn(name = "TASK_PROCESSID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskProcess getTaskProcessID() {
        return taskProcessID;
    }
    public void setTaskProcessID(WOMProduceTaskProcess taskProcessID) {
        this.taskProcessID = taskProcessID;
    }
	
	
	protected String _getEntityName() {
		return WOMWaitPutinRecords.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_WaitPutinRecords_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_WaitPutinRecords,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
