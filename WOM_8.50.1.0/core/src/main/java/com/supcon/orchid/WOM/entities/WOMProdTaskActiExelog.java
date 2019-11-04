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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 活动执行记录.
 */
@javax.persistence.Entity(name=WOMProdTaskActiExelog.JPA_NAME)
@Table(name = WOMProdTaskActiExelog.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_ProdTaskActiExelog")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_ProdTaskActiExelog,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMProdTaskActiExelogConvertor.class})
public class WOMProdTaskActiExelog extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog";
	public static final String DOC_TYPE = "WOM_produceTask_prodTaskActiExelog";
	public static final String TABLE_NAME = "wom_prod_task_acti_exelogs";
	public static final String JPA_NAME = "WOMProdTaskActiExelog";
	private PublicSetActBatState activeBatchStateID;


		private String activeName ; // 活动名称
	private SystemCode activeSource
; // 活动来源
	private SystemCode activeType
; // 活动类型


		private java.math.BigDecimal actualNum ; // 实际投料数量


		private Long adjustRecordID ; // 调整单ID


		private String batchNum ; // 生产批号


		private String checkResult ; // 检验结论


		private Long checkResultID ; // 检验报告单
	private SystemCode dataSource
; // 数据来源
	private SystemCode dataType
; // 数据性质(废)

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 结束时间
	private MESBasicFactoryModel factoryID;


		private Boolean finalInspection = false; // 完工检验
	private RMFormulaProcessActive formularActice;


		private Boolean isAdjust = false; // 调整记录


		private Boolean isAnaly = false; // 是否统计工艺


		private Boolean isFinish = false; // 执行结束


		private Boolean isPassCheck = false; // 放行检验


		private Boolean isPDA = false; // 移动端执行


		private String operartionID ; // operartionID


		private String phaseID ; // phaseID


		private java.math.BigDecimal planNum ; // 计划投料数量
	private WOMProdTaskProcExelog processExeLog;
	private MESBasicProduct productID;


		private String productNum ; // 物料批号


		private Long rejectsDealID ; // 不良品处理单


		private String remark ; // 备注
	private Staff staffID;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 开始时间
	private SystemCode state
; // 状态（作废）


		private Boolean staticFlag = false; // 统计标识
	private WOMProduceTaskActive taskActiveID;
	private WOMProduceTask taskID;
	private WOMProduceTaskProcess taskProcessID;
	private WOMWaitPutinRecords waitPutinRecordID;
	
	
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
	
	
	@Index(name="IDX_PRODTASKACTIEXE_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@ManyToOne
	@JoinColumn(name = "ACTIVE_BATCH_STATEID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public PublicSetActBatState getActiveBatchStateID() {
        return activeBatchStateID;
    }
    public void setActiveBatchStateID(PublicSetActBatState activeBatchStateID) {
        this.activeBatchStateID = activeBatchStateID;
    }
	/**
	 * 获取活动名称.
	 * 
	 * @return 活动名称
	 */
	@Column(nullable=true

		,length = 256
		,name="ACTIVE_NAME"
	)
    public String getActiveName() {
        return activeName;
    }
	/**
	 * 设置活动名称.
	 * @param activeName 活动名称
	 */
    public void setActiveName(String activeName) {
        this.activeName = activeName;
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
	/**
	 * 获取调整单ID.
	 * 
	 * @return 调整单ID
	 */
	@Column(nullable=true

		,name="ADJUST_RECORDID"
	)
    public Long getAdjustRecordID() {
        return adjustRecordID;
    }
	/**
	 * 设置调整单ID.
	 * @param adjustRecordID 调整单ID
	 */
    public void setAdjustRecordID(Long adjustRecordID) {
        this.adjustRecordID = adjustRecordID;
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
	 * 获取检验结论.
	 * 
	 * @return 检验结论
	 */
	@Column(nullable=true

		,length = 256
		,name="CHECK_RESULT"
	)
    public String getCheckResult() {
        return checkResult;
    }
	/**
	 * 设置检验结论.
	 * @param checkResult 检验结论
	 */
    public void setCheckResult(String checkResult) {
        this.checkResult = checkResult;
    }
	/**
	 * 获取检验报告单.
	 * 
	 * @return 检验报告单
	 */
	@Column(nullable=true

		,name="CHECK_RESULTID"
	)
    public Long getCheckResultID() {
        return checkResultID;
    }
	/**
	 * 设置检验报告单.
	 * @param checkResultID 检验报告单
	 */
    public void setCheckResultID(Long checkResultID) {
        this.checkResultID = checkResultID;
    }
	/**
	 * 获取数据来源.
	 * 
	 * @return 数据来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DATA_SOURCE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDataSource() {
		return dataSource;
	}
	/**
	 * 设置数据来源.
	 * @param dataSource 数据来源
	 */
	public void setDataSource(SystemCode dataSource) {
		this.dataSource = (SystemCode) dataSource;
	}
	/**
	 * 获取数据性质(废).
	 * 
	 * @return 数据性质(废)
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DATA_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDataType() {
		return dataType;
	}
	/**
	 * 设置数据性质(废).
	 * @param dataType 数据性质(废)
	 */
	public void setDataType(SystemCode dataType) {
		this.dataType = (SystemCode) dataType;
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
	@ManyToOne
	@JoinColumn(name = "FACTORYID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getFactoryID() {
        return factoryID;
    }
    public void setFactoryID(MESBasicFactoryModel factoryID) {
        this.factoryID = factoryID;
    }
	/**
	 * 获取完工检验.
	 * 
	 * @return 完工检验
	 */
	@Column(nullable=true

		,name="FINAL_INSPECTION"
	)
    public Boolean getFinalInspection() {
        return null == finalInspection ? false : finalInspection;
    }
	/**
	 * 设置完工检验.
	 * @param finalInspection 完工检验
	 */
    public void setFinalInspection(Boolean finalInspection) {
        this.finalInspection = finalInspection;
    }
	@ManyToOne
	@JoinColumn(name = "FORMULAR_ACTICE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getFormularActice() {
        return formularActice;
    }
    public void setFormularActice(RMFormulaProcessActive formularActice) {
        this.formularActice = formularActice;
    }
	/**
	 * 获取调整记录.
	 * 
	 * @return 调整记录
	 */
	@Column(nullable=true

		,name="IS_ADJUST"
	)
    public Boolean getIsAdjust() {
        return null == isAdjust ? false : isAdjust;
    }
	/**
	 * 设置调整记录.
	 * @param isAdjust 调整记录
	 */
    public void setIsAdjust(Boolean isAdjust) {
        this.isAdjust = isAdjust;
    }
	/**
	 * 获取是否统计工艺.
	 * 
	 * @return 是否统计工艺
	 */
	@Column(nullable=true

		,name="IS_ANALY"
	)
    public Boolean getIsAnaly() {
        return null == isAnaly ? false : isAnaly;
    }
	/**
	 * 设置是否统计工艺.
	 * @param isAnaly 是否统计工艺
	 */
    public void setIsAnaly(Boolean isAnaly) {
        this.isAnaly = isAnaly;
    }
	/**
	 * 获取执行结束.
	 * 
	 * @return 执行结束
	 */
	@Column(nullable=true

		,name="IS_FINISH"
	)
    public Boolean getIsFinish() {
        return null == isFinish ? false : isFinish;
    }
	/**
	 * 设置执行结束.
	 * @param isFinish 执行结束
	 */
    public void setIsFinish(Boolean isFinish) {
        this.isFinish = isFinish;
    }
	/**
	 * 获取放行检验.
	 * 
	 * @return 放行检验
	 */
	@Column(nullable=true

		,name="IS_PASS_CHECK"
	)
    public Boolean getIsPassCheck() {
        return null == isPassCheck ? false : isPassCheck;
    }
	/**
	 * 设置放行检验.
	 * @param isPassCheck 放行检验
	 */
    public void setIsPassCheck(Boolean isPassCheck) {
        this.isPassCheck = isPassCheck;
    }
	/**
	 * 获取移动端执行.
	 * 
	 * @return 移动端执行
	 */
	@Column(nullable=true

		,name="ISPDA"
	)
    public Boolean getIsPDA() {
        return null == isPDA ? false : isPDA;
    }
	/**
	 * 设置移动端执行.
	 * @param isPDA 移动端执行
	 */
    public void setIsPDA(Boolean isPDA) {
        this.isPDA = isPDA;
    }
	/**
	 * 获取operartionID.
	 * 
	 * @return operartionID
	 */
	@Column(nullable=true

		,length = 256
		,name="OPERARTIONID"
	)
    public String getOperartionID() {
        return operartionID;
    }
	/**
	 * 设置operartionID.
	 * @param operartionID operartionID
	 */
    public void setOperartionID(String operartionID) {
        this.operartionID = operartionID;
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
	 * 获取计划投料数量.
	 * 
	 * @return 计划投料数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PLAN_NUM"
	)
    public java.math.BigDecimal getPlanNum() {
        return planNum;
    }
	/**
	 * 设置计划投料数量.
	 * @param planNum 计划投料数量
	 */
    public void setPlanNum(java.math.BigDecimal planNum) {
        this.planNum = planNum;
    }
	@ManyToOne
	@JoinColumn(name = "PROCESS_EXE_LOG", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProdTaskProcExelog getProcessExeLog() {
        return processExeLog;
    }
    public void setProcessExeLog(WOMProdTaskProcExelog processExeLog) {
        this.processExeLog = processExeLog;
    }
	@ManyToOne
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
	 * 获取不良品处理单.
	 * 
	 * @return 不良品处理单
	 */
	@Column(nullable=true

		,name="REJECTS_DEALID"
	)
    public Long getRejectsDealID() {
        return rejectsDealID;
    }
	/**
	 * 设置不良品处理单.
	 * @param rejectsDealID 不良品处理单
	 */
    public void setRejectsDealID(Long rejectsDealID) {
        this.rejectsDealID = rejectsDealID;
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
	@ManyToOne
	@JoinColumn(name = "STAFFID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getStaffID() {
        return staffID;
    }
    public void setStaffID(Staff staffID) {
        this.staffID = staffID;
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
	/**
	 * 获取状态（作废）.
	 * 
	 * @return 状态（作废）
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getState() {
		return state;
	}
	/**
	 * 设置状态（作废）.
	 * @param state 状态（作废）
	 */
	public void setState(SystemCode state) {
		this.state = (SystemCode) state;
	}
	/**
	 * 获取统计标识.
	 * 
	 * @return 统计标识
	 */
	@Column(nullable=true

		,name="STATIC_FLAG"
	)
    public Boolean getStaticFlag() {
        return null == staticFlag ? false : staticFlag;
    }
	/**
	 * 设置统计标识.
	 * @param staticFlag 统计标识
	 */
    public void setStaticFlag(Boolean staticFlag) {
        this.staticFlag = staticFlag;
    }
	@ManyToOne
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
	@ManyToOne
	@JoinColumn(name = "TASK_PROCESSID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskProcess getTaskProcessID() {
        return taskProcessID;
    }
    public void setTaskProcessID(WOMProduceTaskProcess taskProcessID) {
        this.taskProcessID = taskProcessID;
    }
	@ManyToOne
	@JoinColumn(name = "WAIT_PUTIN_RECORDID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMWaitPutinRecords getWaitPutinRecordID() {
        return waitPutinRecordID;
    }
    public void setWaitPutinRecordID(WOMWaitPutinRecords waitPutinRecordID) {
        this.waitPutinRecordID = waitPutinRecordID;
    }
	
	
	protected String _getEntityName() {
		return WOMProdTaskActiExelog.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProdTaskActiExelog_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_ProdTaskActiExelog,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
