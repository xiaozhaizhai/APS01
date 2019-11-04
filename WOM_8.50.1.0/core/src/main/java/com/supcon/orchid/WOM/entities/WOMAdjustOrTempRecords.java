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
import com.supcon.orchid.publicSet.entities.PublicSetActBatState;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 活动处理记录表.
 */
@javax.persistence.Entity(name=WOMAdjustOrTempRecords.JPA_NAME)
@Table(name = WOMAdjustOrTempRecords.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_AdjustOrTempRecords")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_AdjustOrTempRecords,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMAdjustOrTempRecordsConvertor.class})
public class WOMAdjustOrTempRecords extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_AdjustOrTempRecords";
	public static final String DOC_TYPE = "WOM_produceTask_adjustOrTempRecords";
	public static final String TABLE_NAME = "wom_adjust_or_temp_records";
	public static final String JPA_NAME = "WOMAdjustOrTempRecords";


		private String acticeName ; // 活动名称
	private PublicSetActBatState activeRecordBatchState;
	private SystemCode activeRecordState
		= new SystemCode("processState/state02")
		; // 活动状态
	private SystemCode activeType
; // 活动类型


		private java.math.BigDecimal actualUse ; // 实际投料量

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 结束时间


		private Boolean finalInspection = false; // 是否完工检
	private RMFormulaProcessActive formularActive;
	private WOMProduceTask headerID;


		private Long inspectRecordId ; // 请检报告单ID


		private String inspectResult ; // 检验结果
	private SystemCode missonType
; // 任务类型


		private java.math.BigDecimal planNum ; // 计划投料量


		private Long processID ; // 工序ID


		private String processName ; // 工序名称
	private SystemCode recordDataSource
; // 活动来源


		private Boolean recordIsAdjust = false; // 是否调整
	private MESBasicProduct recordProduct;


		private Long rejectsDeal ; // 不良品处理单


		private String remark ; // 备注

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 开始时间
	
	
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
	
	
	@Index(name="IDX_ADJUSTORTEMPREC_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取活动名称.
	 * 
	 * @return 活动名称
	 */
	@Column(nullable=true

		,length = 256
		,name="ACTICE_NAME"
	)
    public String getActiceName() {
        return acticeName;
    }
	/**
	 * 设置活动名称.
	 * @param acticeName 活动名称
	 */
    public void setActiceName(String acticeName) {
        this.acticeName = acticeName;
    }
	@OneToOne
	@JoinColumn(name = "ACTIVE_RECORD_BATCH_STATE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public PublicSetActBatState getActiveRecordBatchState() {
        return activeRecordBatchState;
    }
    public void setActiveRecordBatchState(PublicSetActBatState activeRecordBatchState) {
        this.activeRecordBatchState = activeRecordBatchState;
    }
	/**
	 * 获取活动状态.
	 * 
	 * @return 活动状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_RECORD_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveRecordState() {
		return activeRecordState;
	}
	/**
	 * 设置活动状态.
	 * @param activeRecordState 活动状态
	 */
	public void setActiveRecordState(SystemCode activeRecordState) {
		this.activeRecordState = (SystemCode) activeRecordState;
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
	 * 获取实际投料量.
	 * 
	 * @return 实际投料量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ACTUAL_USE"
	)
    public java.math.BigDecimal getActualUse() {
        return actualUse;
    }
	/**
	 * 设置实际投料量.
	 * @param actualUse 实际投料量
	 */
    public void setActualUse(java.math.BigDecimal actualUse) {
        this.actualUse = actualUse;
    }
	/**
	 * 获取结束时间.
	 * 
	 * @return 结束时间
	 */
	@Column(nullable=true

		,name="END_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getEndTime() {
        return endTime;
    }
	/**
	 * 设置结束时间.
	 * @param endTime 结束时间
	 */
    public void setEndTime(java.util.Date endTime) {
        this.endTime = endTime;
    }
	/**
	 * 获取是否完工检.
	 * 
	 * @return 是否完工检
	 */
	@Column(nullable=true

		,name="FINAL_INSPECTION"
	)
    public Boolean getFinalInspection() {
        return null == finalInspection ? false : finalInspection;
    }
	/**
	 * 设置是否完工检.
	 * @param finalInspection 是否完工检
	 */
    public void setFinalInspection(Boolean finalInspection) {
        this.finalInspection = finalInspection;
    }
	@OneToOne
	@JoinColumn(name = "FORMULAR_ACTIVE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getFormularActive() {
        return formularActive;
    }
    public void setFormularActive(RMFormulaProcessActive formularActive) {
        this.formularActive = formularActive;
    }
	@ManyToOne
	@JoinColumn(name = "HEADERID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getHeaderID() {
        return headerID;
    }
    public void setHeaderID(WOMProduceTask headerID) {
        this.headerID = headerID;
    }
	/**
	 * 获取请检报告单ID.
	 * 
	 * @return 请检报告单ID
	 */
	@Column(nullable=true

		,name="INSPECT_RECORD_ID"
	)
    public Long getInspectRecordId() {
        return inspectRecordId;
    }
	/**
	 * 设置请检报告单ID.
	 * @param inspectRecordId 请检报告单ID
	 */
    public void setInspectRecordId(Long inspectRecordId) {
        this.inspectRecordId = inspectRecordId;
    }
	/**
	 * 获取检验结果.
	 * 
	 * @return 检验结果
	 */
	@Column(nullable=true

		,length = 256
		,name="INSPECT_RESULT"
	)
    public String getInspectResult() {
        return inspectResult;
    }
	/**
	 * 设置检验结果.
	 * @param inspectResult 检验结果
	 */
    public void setInspectResult(String inspectResult) {
        this.inspectResult = inspectResult;
    }
	/**
	 * 获取任务类型.
	 * 
	 * @return 任务类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="MISSON_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getMissonType() {
		return missonType;
	}
	/**
	 * 设置任务类型.
	 * @param missonType 任务类型
	 */
	public void setMissonType(SystemCode missonType) {
		this.missonType = (SystemCode) missonType;
	}
	/**
	 * 获取计划投料量.
	 * 
	 * @return 计划投料量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PLAN_NUM"
	)
    public java.math.BigDecimal getPlanNum() {
        return planNum;
    }
	/**
	 * 设置计划投料量.
	 * @param planNum 计划投料量
	 */
    public void setPlanNum(java.math.BigDecimal planNum) {
        this.planNum = planNum;
    }
	/**
	 * 获取工序ID.
	 * 
	 * @return 工序ID
	 */
	@Column(nullable=true

		,name="PROCESSID"
	)
    public Long getProcessID() {
        return processID;
    }
	/**
	 * 设置工序ID.
	 * @param processID 工序ID
	 */
    public void setProcessID(Long processID) {
        this.processID = processID;
    }
	/**
	 * 获取工序名称.
	 * 
	 * @return 工序名称
	 */
	@Column(nullable=true

		,length = 256
		,name="PROCESS_NAME"
	)
    public String getProcessName() {
        return processName;
    }
	/**
	 * 设置工序名称.
	 * @param processName 工序名称
	 */
    public void setProcessName(String processName) {
        this.processName = processName;
    }
	/**
	 * 获取活动来源.
	 * 
	 * @return 活动来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="RECORD_DATA_SOURCE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getRecordDataSource() {
		return recordDataSource;
	}
	/**
	 * 设置活动来源.
	 * @param recordDataSource 活动来源
	 */
	public void setRecordDataSource(SystemCode recordDataSource) {
		this.recordDataSource = (SystemCode) recordDataSource;
	}
	/**
	 * 获取是否调整.
	 * 
	 * @return 是否调整
	 */
	@Column(nullable=true

		,name="RECORD_IS_ADJUST"
	)
    public Boolean getRecordIsAdjust() {
        return null == recordIsAdjust ? false : recordIsAdjust;
    }
	/**
	 * 设置是否调整.
	 * @param recordIsAdjust 是否调整
	 */
    public void setRecordIsAdjust(Boolean recordIsAdjust) {
        this.recordIsAdjust = recordIsAdjust;
    }
	@OneToOne
	@JoinColumn(name = "RECORD_PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getRecordProduct() {
        return recordProduct;
    }
    public void setRecordProduct(MESBasicProduct recordProduct) {
        this.recordProduct = recordProduct;
    }
	/**
	 * 获取不良品处理单.
	 * 
	 * @return 不良品处理单
	 */
	@Column(nullable=true

		,name="REJECTS_DEAL"
	)
    public Long getRejectsDeal() {
        return rejectsDeal;
    }
	/**
	 * 设置不良品处理单.
	 * @param rejectsDeal 不良品处理单
	 */
    public void setRejectsDeal(Long rejectsDeal) {
        this.rejectsDeal = rejectsDeal;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
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
	 * 获取开始时间.
	 * 
	 * @return 开始时间
	 */
	@Column(nullable=true

		,name="START_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getStartTime() {
        return startTime;
    }
	/**
	 * 设置开始时间.
	 * @param startTime 开始时间
	 */
    public void setStartTime(java.util.Date startTime) {
        this.startTime = startTime;
    }
	
	
	protected String _getEntityName() {
		return WOMAdjustOrTempRecords.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_AdjustOrTempRecords,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
