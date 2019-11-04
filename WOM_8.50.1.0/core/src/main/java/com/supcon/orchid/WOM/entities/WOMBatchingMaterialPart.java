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
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
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
 * 配料记录.
 */
@javax.persistence.Entity(name=WOMBatchingMaterialPart.JPA_NAME)
@Table(name = WOMBatchingMaterialPart.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_batchingMaterial")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMBatchingMaterialPartConvertor.class})
public class WOMBatchingMaterialPart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_batchingMaterial";
	public static final String MODEL_CODE = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart";
	public static final String DOC_TYPE = "WOM_batchingMaterial_batchingMaterialPart";
	public static final String TABLE_NAME = "wom_batching_material_parts";
	public static final String JPA_NAME = "WOMBatchingMaterialPart";
	private SystemCode activeType
; // 活动类型


		private Integer actOrder ; // 投料顺序
	private MESBasicStoreSet armStoreID;
	private MESBasicWare armWareID;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date batchDate ; // 配送时间


		private String batchNum ; // 物料批号
	private WOMStandingcropRef batchNumObj;
	private SystemCode batchSite
; // 配料方式


		private String container ; // 容器


		private String dataSourceID ; // 配料系统的配料记录ID


		private java.math.BigDecimal doneNum ; // 配料数量

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date exeDate ; // 配料时间
	private Staff exeStaff;
	private MESBasicFactoryModel factoryId;
	private WOMBatchingMaterial headId;


		private String lableCode ; // 标签编号
	private WOMBatchingMaterialNeed needPartId;


		private Integer offerOrder ; // 配料顺序
	private SystemCode offerSystem
; // 配料系统


		private String phaseID ; // phaseID


		private Integer printCount ; // 打印次数
	private MESBasicProduct productId;
	private RMFormulaProcessActive putBatMateId;


		private java.math.BigDecimal putinNum ; // 已投数量

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date receiveDate ; // 配料接收时间
	private Staff receiveStaff;


		private java.math.BigDecimal rejectNum ; // 退料数量
	private WOMRejectReason rejectReason;


		private String remark ; // 备注
	private SystemCode state
; // 状态
	private MESBasicStoreSet storeID;
	private WOMProduceTaskActive taskActiveId;


		private String taskBatch ; // 生产批号
	private WOMProduceTask taskID;
	private WOMProduceTaskProcess taskProcessId;
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
	
	
	@Index(name="IDX_BATCHINGMATERIA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
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
	@OneToOne
	@JoinColumn(name = "ARM_STOREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicStoreSet getArmStoreID() {
        return armStoreID;
    }
    public void setArmStoreID(MESBasicStoreSet armStoreID) {
        this.armStoreID = armStoreID;
    }
	@OneToOne
	@JoinColumn(name = "ARM_WAREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getArmWareID() {
        return armWareID;
    }
    public void setArmWareID(MESBasicWare armWareID) {
        this.armWareID = armWareID;
    }
	/**
	 * 获取配送时间.
	 * 
	 * @return 配送时间
	 */
	@Column(nullable=true

		,name="BATCH_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getBatchDate() {
        return batchDate;
    }
	/**
	 * 设置配送时间.
	 * @param batchDate 配送时间
	 */
    public void setBatchDate(java.util.Date batchDate) {
        this.batchDate = batchDate;
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
	 * 获取配料方式.
	 * 
	 * @return 配料方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BATCH_SITE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBatchSite() {
		return batchSite;
	}
	/**
	 * 设置配料方式.
	 * @param batchSite 配料方式
	 */
	public void setBatchSite(SystemCode batchSite) {
		this.batchSite = (SystemCode) batchSite;
	}
	/**
	 * 获取容器.
	 * 
	 * @return 容器
	 */
	@Column(nullable=true

		,length = 256
		,name="CONTAINER"
	)
    public String getContainer() {
        return container;
    }
	/**
	 * 设置容器.
	 * @param container 容器
	 */
    public void setContainer(String container) {
        this.container = container;
    }
	/**
	 * 获取配料系统的配料记录ID.
	 * 
	 * @return 配料系统的配料记录ID
	 */
	@Column(nullable=true

		,length = 256
		,name="DATA_SOURCEID"
	)
    public String getDataSourceID() {
        return dataSourceID;
    }
	/**
	 * 设置配料系统的配料记录ID.
	 * @param dataSourceID 配料系统的配料记录ID
	 */
    public void setDataSourceID(String dataSourceID) {
        this.dataSourceID = dataSourceID;
    }
	/**
	 * 获取配料数量.
	 * 
	 * @return 配料数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="DONE_NUM"
	)
    public java.math.BigDecimal getDoneNum() {
        return doneNum;
    }
	/**
	 * 设置配料数量.
	 * @param doneNum 配料数量
	 */
    public void setDoneNum(java.math.BigDecimal doneNum) {
        this.doneNum = doneNum;
    }
	/**
	 * 获取配料时间.
	 * 
	 * @return 配料时间
	 */
	@Column(nullable=true

		,name="EXE_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getExeDate() {
        return exeDate;
    }
	/**
	 * 设置配料时间.
	 * @param exeDate 配料时间
	 */
    public void setExeDate(java.util.Date exeDate) {
        this.exeDate = exeDate;
    }
	@OneToOne
	@JoinColumn(name = "EXE_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getExeStaff() {
        return exeStaff;
    }
    public void setExeStaff(Staff exeStaff) {
        this.exeStaff = exeStaff;
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
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMBatchingMaterial getHeadId() {
        return headId;
    }
    public void setHeadId(WOMBatchingMaterial headId) {
        this.headId = headId;
    }
	/**
	 * 获取标签编号.
	 * 
	 * @return 标签编号
	 */
	@Column(nullable=true

		,length = 2000
		,name="LABLE_CODE"
	)
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
	@OneToOne
	@JoinColumn(name = "NEED_PART_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMBatchingMaterialNeed getNeedPartId() {
        return needPartId;
    }
    public void setNeedPartId(WOMBatchingMaterialNeed needPartId) {
        this.needPartId = needPartId;
    }
	/**
	 * 获取配料顺序.
	 * 
	 * @return 配料顺序
	 */
	@Column(nullable=true

		,name="OFFER_ORDER"
	)
    public Integer getOfferOrder() {
        return offerOrder;
    }
	/**
	 * 设置配料顺序.
	 * @param offerOrder 配料顺序
	 */
    public void setOfferOrder(Integer offerOrder) {
        this.offerOrder = offerOrder;
    }
	/**
	 * 获取配料系统.
	 * 
	 * @return 配料系统
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="OFFER_SYSTEM", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOfferSystem() {
		return offerSystem;
	}
	/**
	 * 设置配料系统.
	 * @param offerSystem 配料系统
	 */
	public void setOfferSystem(SystemCode offerSystem) {
		this.offerSystem = (SystemCode) offerSystem;
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
	/**
	 * 获取打印次数.
	 * 
	 * @return 打印次数
	 */
	@Column(nullable=true

		,name="PRINT_COUNT"
	)
    public Integer getPrintCount() {
        return printCount;
    }
	/**
	 * 设置打印次数.
	 * @param printCount 打印次数
	 */
    public void setPrintCount(Integer printCount) {
        this.printCount = printCount;
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
	@OneToOne
	@JoinColumn(name = "PUT_BAT_MATE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getPutBatMateId() {
        return putBatMateId;
    }
    public void setPutBatMateId(RMFormulaProcessActive putBatMateId) {
        this.putBatMateId = putBatMateId;
    }
	/**
	 * 获取已投数量.
	 * 
	 * @return 已投数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PUTIN_NUM"
	)
    public java.math.BigDecimal getPutinNum() {
        return putinNum;
    }
	/**
	 * 设置已投数量.
	 * @param putinNum 已投数量
	 */
    public void setPutinNum(java.math.BigDecimal putinNum) {
        this.putinNum = putinNum;
    }
	/**
	 * 获取配料接收时间.
	 * 
	 * @return 配料接收时间
	 */
	@Column(nullable=true

		,name="RECEIVE_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getReceiveDate() {
        return receiveDate;
    }
	/**
	 * 设置配料接收时间.
	 * @param receiveDate 配料接收时间
	 */
    public void setReceiveDate(java.util.Date receiveDate) {
        this.receiveDate = receiveDate;
    }
	@OneToOne
	@JoinColumn(name = "RECEIVE_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getReceiveStaff() {
        return receiveStaff;
    }
    public void setReceiveStaff(Staff receiveStaff) {
        this.receiveStaff = receiveStaff;
    }
	/**
	 * 获取退料数量.
	 * 
	 * @return 退料数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="REJECT_NUM"
	)
    public java.math.BigDecimal getRejectNum() {
        return rejectNum;
    }
	/**
	 * 设置退料数量.
	 * @param rejectNum 退料数量
	 */
    public void setRejectNum(java.math.BigDecimal rejectNum) {
        this.rejectNum = rejectNum;
    }
	@ManyToOne
	@JoinColumn(name = "REJECT_REASON", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMRejectReason getRejectReason() {
        return rejectReason;
    }
    public void setRejectReason(WOMRejectReason rejectReason) {
        this.rejectReason = rejectReason;
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
	 * 获取状态.
	 * 
	 * @return 状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getState() {
		return state;
	}
	/**
	 * 设置状态.
	 * @param state 状态
	 */
	public void setState(SystemCode state) {
		this.state = (SystemCode) state;
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
	/**
	 * 获取生产批号.
	 * 
	 * @return 生产批号
	 */
	@Column(nullable=true

		,length = 256
		,name="TASK_BATCH"
	)
    public String getTaskBatch() {
        return taskBatch;
    }
	/**
	 * 设置生产批号.
	 * @param taskBatch 生产批号
	 */
    public void setTaskBatch(String taskBatch) {
        this.taskBatch = taskBatch;
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
		return WOMBatchingMaterialPart.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
