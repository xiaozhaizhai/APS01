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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.RM.entities.RMFormula;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.publicSet.entities.PublicSetBatchInfo;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.WOM.entities.WOMProduceTaskSupervision;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产指令单.
 */
@javax.persistence.Entity(name=WOMProduceTask.JPA_NAME)
@Table(name = WOMProduceTask.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_ProduceTask")
@AttributeOverrides({
		@AttributeOverride(name="createDepartmentId", column=@Column(name = "CREATE_DEPARTMENT_ID")),
		@AttributeOverride(name="createPositionId", column=@Column(name = "CREATE_POSITION_ID")),
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectiveState", column=@Column(name = "EFFECTIVE_STATE")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="groupId", column=@Column(name = "GROUP_ID")),
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="positionLayRec", column=@Column(name = "POSITION_LAY_REC")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="tableNo", column=@Column(name = "TABLE_NO")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMProduceTaskConvertor.class})
public class WOMProduceTask extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_ProduceTask";
	public static final String DOC_TYPE = "Table";
	public static final String TABLE_NAME = "wom_produce_tasks";
	public static final String JPA_NAME = "WOMProduceTask";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date actEndTime ; // 实际完成时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date actStartTime ; // 实际开始时间


		private Boolean advanceCharge = false; // 通知放料
	private SystemCode autoReportOnFinish
; // 完成后自动报工


		private Boolean batchContral = false; // 批控
	private WOMBatchNumRule batchNumRule;


		private String batchProdTaskID ; // 批控控制配方ID


		private java.math.BigDecimal batchProduceNum ; // 制造数量
	private SystemCode batchTaskState
; // 批控状态
	private WOMStandingcropRef bulkBatchNum;


		private java.math.BigDecimal bulkNum ; // 待包装数量
	private MESBasicProduct bulkProduct;


		private String changePackageForm ; // 换包装审批单
	private MESBasicFactoryModel factoryId;


		private java.math.BigDecimal finishNum ; // 完成数量
	private RMFormula formularId;


		private String interfaceUrl ; // 批控接口服务器地址


		private Boolean isAnaly = false; // 是否统计工艺


		private Boolean isHasMaterial = false; // 是否已配料


		private java.math.BigDecimal lossRate ; // 损耗率
	private WOMManulOrderMain manuOrderMain;
	private SystemCode packageType
; // 包装类型

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planEndTime ; // 计划结束时间
	private WOMDayBatchPlanParts planParId;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date planStartTime ; // 计划开始时间


		private String productBatchNum ; // 生产批号
	private MESBasicProduct productId;


		private java.math.BigDecimal productNum ; // 生产数量


		private Integer recycleTime ; // 回收次数


		private String remark ; // 备注
	private PublicSetBatchInfo reWorkBatchNum;


		private Boolean staticFlag = false; // 统计标识


		private Boolean supportEbr = false; // 支持EBR


		private Long tasksID ; // 批量指令单明细ID
	private SystemCode taskState
; // 执行状态
	private SystemCode taskType
; // 指令单类型
	private SystemCode team
; // 班组


		private String workCode ; // APS工单号
	private SystemCode workType
; // 类型
	
	private List<WOMProduceTaskActive> produceTaskActiveList;
	
	public void setProduceTaskActiveList(List<WOMProduceTaskActive> produceTaskActiveList){
		this.produceTaskActiveList = produceTaskActiveList;
	}
	@Transient
	public List<WOMProduceTaskActive> getProduceTaskActiveList(){
		return produceTaskActiveList;
	}
	private List<WOMBatchPhaseExelog> batchPhaseExelogList;
	
	public void setBatchPhaseExelogList(List<WOMBatchPhaseExelog> batchPhaseExelogList){
		this.batchPhaseExelogList = batchPhaseExelogList;
	}
	@Transient
	public List<WOMBatchPhaseExelog> getBatchPhaseExelogList(){
		return batchPhaseExelogList;
	}
	private List<WOMProdTaskActiExelog> prodTaskActiExelogList;
	
	public void setProdTaskActiExelogList(List<WOMProdTaskActiExelog> prodTaskActiExelogList){
		this.prodTaskActiExelogList = prodTaskActiExelogList;
	}
	@Transient
	public List<WOMProdTaskActiExelog> getProdTaskActiExelogList(){
		return prodTaskActiExelogList;
	}
	private List<WOMProduceMaterialSum> produceMaterialSumList;
	
	public void setProduceMaterialSumList(List<WOMProduceMaterialSum> produceMaterialSumList){
		this.produceMaterialSumList = produceMaterialSumList;
	}
	@Transient
	public List<WOMProduceMaterialSum> getProduceMaterialSumList(){
		return produceMaterialSumList;
	}
	private List<WOMProduceTaskProcess> produceTaskProcessList;
	
	public void setProduceTaskProcessList(List<WOMProduceTaskProcess> produceTaskProcessList){
		this.produceTaskProcessList = produceTaskProcessList;
	}
	@Transient
	public List<WOMProduceTaskProcess> getProduceTaskProcessList(){
		return produceTaskProcessList;
	}
	private List<WOMProdTaskProcExelog> prodTaskProcExelogList;
	
	public void setProdTaskProcExelogList(List<WOMProdTaskProcExelog> prodTaskProcExelogList){
		this.prodTaskProcExelogList = prodTaskProcExelogList;
	}
	@Transient
	public List<WOMProdTaskProcExelog> getProdTaskProcExelogList(){
		return prodTaskProcExelogList;
	}
	
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
	
	@XmlTransient
	private WorkFlowVar workFlowVar;

	public void setWorkFlowVar(WorkFlowVar workFlowVar) {
		this.workFlowVar = workFlowVar;
	}

	@javax.persistence.Transient
	@XmlTransient
	public WorkFlowVar getWorkFlowVar() {
		return workFlowVar;
	}

	private Pending pending;
	@javax.persistence.Transient
	public Pending getPending() {
		return pending;
	}
	
	@Index(name="IDX_PRODUCETASK_TABLE_ID")
	@Column(unique=true,nullable=true)
	public Long getTableInfoId() {
		return tableInfoId;
	}
	
	public void setPending(Pending pending) {
		this.pending = pending;
	}
	/**
	 * 获取实际完成时间.
	 * 
	 * @return 实际完成时间
	 */
	@Column(nullable=true

		,name="ACT_END_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getActEndTime() {
        return actEndTime;
    }
	/**
	 * 设置实际完成时间.
	 * @param actEndTime 实际完成时间
	 */
    public void setActEndTime(java.util.Date actEndTime) {
        this.actEndTime = actEndTime;
    }
	/**
	 * 获取实际开始时间.
	 * 
	 * @return 实际开始时间
	 */
	@Column(nullable=true

		,name="ACT_START_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getActStartTime() {
        return actStartTime;
    }
	/**
	 * 设置实际开始时间.
	 * @param actStartTime 实际开始时间
	 */
    public void setActStartTime(java.util.Date actStartTime) {
        this.actStartTime = actStartTime;
    }
	/**
	 * 获取通知放料.
	 * 
	 * @return 通知放料
	 */
	@Column(nullable=true

		,name="ADVANCE_CHARGE"
	)
    public Boolean getAdvanceCharge() {
        return null == advanceCharge ? false : advanceCharge;
    }
	/**
	 * 设置通知放料.
	 * @param advanceCharge 通知放料
	 */
    public void setAdvanceCharge(Boolean advanceCharge) {
        this.advanceCharge = advanceCharge;
    }
	/**
	 * 获取完成后自动报工.
	 * 
	 * @return 完成后自动报工
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="AUTO_REPORT_ON_FINISH", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getAutoReportOnFinish() {
		return autoReportOnFinish;
	}
	/**
	 * 设置完成后自动报工.
	 * @param autoReportOnFinish 完成后自动报工
	 */
	public void setAutoReportOnFinish(SystemCode autoReportOnFinish) {
		this.autoReportOnFinish = (SystemCode) autoReportOnFinish;
	}
	/**
	 * 获取批控.
	 * 
	 * @return 批控
	 */
	@Column(nullable=true

		,name="BATCH_CONTRAL"
	)
    public Boolean getBatchContral() {
        return null == batchContral ? false : batchContral;
    }
	/**
	 * 设置批控.
	 * @param batchContral 批控
	 */
    public void setBatchContral(Boolean batchContral) {
        this.batchContral = batchContral;
    }
	@OneToOne
	@JoinColumn(name = "BATCH_NUM_RULE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public WOMBatchNumRule getBatchNumRule() {
        return batchNumRule;
    }
    public void setBatchNumRule(WOMBatchNumRule batchNumRule) {
        this.batchNumRule = batchNumRule;
    }
	/**
	 * 获取批控控制配方ID.
	 * 
	 * @return 批控控制配方ID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_PROD_TASKID"
	)
    public String getBatchProdTaskID() {
        return batchProdTaskID;
    }
	/**
	 * 设置批控控制配方ID.
	 * @param batchProdTaskID 批控控制配方ID
	 */
    public void setBatchProdTaskID(String batchProdTaskID) {
        this.batchProdTaskID = batchProdTaskID;
    }
	/**
	 * 获取制造数量.
	 * 保存批控反馈的产量
	 * @return 制造数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="BATCH_PRODUCE_NUM"
	)
    public java.math.BigDecimal getBatchProduceNum() {
        return batchProduceNum;
    }
	/**
	 * 设置制造数量.
	 * @param batchProduceNum 制造数量
	 */
    public void setBatchProduceNum(java.math.BigDecimal batchProduceNum) {
        this.batchProduceNum = batchProduceNum;
    }
	/**
	 * 获取批控状态.
	 * 
	 * @return 批控状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BATCH_TASK_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBatchTaskState() {
		return batchTaskState;
	}
	/**
	 * 设置批控状态.
	 * @param batchTaskState 批控状态
	 */
	public void setBatchTaskState(SystemCode batchTaskState) {
		this.batchTaskState = (SystemCode) batchTaskState;
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
	 * 获取换包装审批单.
	 * 目前没有这个单子，后期需要更换为对象型
	 * @return 换包装审批单
	 */
	@Column(nullable=true

		,length = 256
		,name="CHANGE_PACKAGE_FORM"
	)
    public String getChangePackageForm() {
        return changePackageForm;
    }
	/**
	 * 设置换包装审批单.
	 * @param changePackageForm 换包装审批单
	 */
    public void setChangePackageForm(String changePackageForm) {
        this.changePackageForm = changePackageForm;
    }
	@OneToOne
	@JoinColumn(name = "FACTORY_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public MESBasicFactoryModel getFactoryId() {
        return factoryId;
    }
    public void setFactoryId(MESBasicFactoryModel factoryId) {
        this.factoryId = factoryId;
    }
	/**
	 * 获取完成数量.
	 * 
	 * @return 完成数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="FINISH_NUM"
	)
    public java.math.BigDecimal getFinishNum() {
        return finishNum;
    }
	/**
	 * 设置完成数量.
	 * @param finishNum 完成数量
	 */
    public void setFinishNum(java.math.BigDecimal finishNum) {
        this.finishNum = finishNum;
    }
	@OneToOne
	@JoinColumn(name = "FORMULAR_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public RMFormula getFormularId() {
        return formularId;
    }
    public void setFormularId(RMFormula formularId) {
        this.formularId = formularId;
    }
	/**
	 * 获取批控接口服务器地址.
	 * 
	 * @return 批控接口服务器地址
	 */
	@Column(nullable=true

		,length = 256
		,name="INTERFACE_URL"
	)
    public String getInterfaceUrl() {
        return interfaceUrl;
    }
	/**
	 * 设置批控接口服务器地址.
	 * @param interfaceUrl 批控接口服务器地址
	 */
    public void setInterfaceUrl(String interfaceUrl) {
        this.interfaceUrl = interfaceUrl;
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
	 * 获取是否已配料.
	 * 
	 * @return 是否已配料
	 */
	@Column(nullable=true

		,name="IS_HAS_MATERIAL"
	)
    public Boolean getIsHasMaterial() {
        return null == isHasMaterial ? false : isHasMaterial;
    }
	/**
	 * 设置是否已配料.
	 * @param isHasMaterial 是否已配料
	 */
    public void setIsHasMaterial(Boolean isHasMaterial) {
        this.isHasMaterial = isHasMaterial;
    }
	/**
	 * 获取损耗率.
	 * 
	 * @return 损耗率
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LOSS_RATE"
	)
    public java.math.BigDecimal getLossRate() {
        return lossRate;
    }
	/**
	 * 设置损耗率.
	 * @param lossRate 损耗率
	 */
    public void setLossRate(java.math.BigDecimal lossRate) {
        this.lossRate = lossRate;
    }
	@OneToOne
	@JoinColumn(name = "MANU_ORDER_MAIN", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMManulOrderMain getManuOrderMain() {
        return manuOrderMain;
    }
    public void setManuOrderMain(WOMManulOrderMain manuOrderMain) {
        this.manuOrderMain = manuOrderMain;
    }
	/**
	 * 获取包装类型.
	 * 
	 * @return 包装类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PACKAGE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getPackageType() {
		return packageType;
	}
	/**
	 * 设置包装类型.
	 * @param packageType 包装类型
	 */
	public void setPackageType(SystemCode packageType) {
		this.packageType = (SystemCode) packageType;
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
	@OneToOne
	@JoinColumn(name = "PLAN_PAR_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMDayBatchPlanParts getPlanParId() {
        return planParId;
    }
    public void setPlanParId(WOMDayBatchPlanParts planParId) {
        this.planParId = planParId;
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
	 * 获取回收次数.
	 * 
	 * @return 回收次数
	 */
	@Column(nullable=true

		,name="RECYCLE_TIME"
	)
    public Integer getRecycleTime() {
        return recycleTime;
    }
	/**
	 * 设置回收次数.
	 * @param recycleTime 回收次数
	 */
    public void setRecycleTime(Integer recycleTime) {
        this.recycleTime = recycleTime;
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
	@JoinColumn(name = "RE_WORK_BATCH_NUM", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public PublicSetBatchInfo getReWorkBatchNum() {
        return reWorkBatchNum;
    }
    public void setReWorkBatchNum(PublicSetBatchInfo reWorkBatchNum) {
        this.reWorkBatchNum = reWorkBatchNum;
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
	/**
	 * 获取支持EBR.
	 * 
	 * @return 支持EBR
	 */
	@Column(nullable=true

		,name="SUPPORT_EBR"
	)
    public Boolean getSupportEbr() {
        return null == supportEbr ? false : supportEbr;
    }
	/**
	 * 设置支持EBR.
	 * @param supportEbr 支持EBR
	 */
    public void setSupportEbr(Boolean supportEbr) {
        this.supportEbr = supportEbr;
    }
	/**
	 * 获取批量指令单明细ID.
	 * 
	 * @return 批量指令单明细ID
	 */
	@Column(nullable=true

		,name="TASKSID"
	)
    public Long getTasksID() {
        return tasksID;
    }
	/**
	 * 设置批量指令单明细ID.
	 * @param tasksID 批量指令单明细ID
	 */
    public void setTasksID(Long tasksID) {
        this.tasksID = tasksID;
    }
	/**
	 * 获取执行状态.
	 * 
	 * @return 执行状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="TASK_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getTaskState() {
		return taskState;
	}
	/**
	 * 设置执行状态.
	 * @param taskState 执行状态
	 */
	public void setTaskState(SystemCode taskState) {
		this.taskState = (SystemCode) taskState;
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
	/**
	 * 获取班组.
	 * 
	 * @return 班组
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="TEAM", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getTeam() {
		return team;
	}
	/**
	 * 设置班组.
	 * @param team 班组
	 */
	public void setTeam(SystemCode team) {
		this.team = (SystemCode) team;
	}
	/**
	 * 获取APS工单号.
	 * 
	 * @return APS工单号
	 */
	@Column(nullable=true

		,length = 256
		,name="WORK_CODE"
	)
    public String getWorkCode() {
        return workCode;
    }
	/**
	 * 设置APS工单号.
	 * @param workCode APS工单号
	 */
    public void setWorkCode(String workCode) {
        this.workCode = workCode;
    }
	/**
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="WORK_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getWorkType() {
		return workType;
	}
	/**
	 * 设置类型.
	 * @param workType 类型
	 */
	public void setWorkType(SystemCode workType) {
		this.workType = (SystemCode) workType;
	}
	
	
	protected String _getEntityName() {
		return WOMProduceTask.class.getName();
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
	private String taskIDTaskProcessIDDeleteIds;
	private String taskIDTaskProcessIDAddIds;
	private String taskIDTaskProcessIDmultiselectIDs;
	private String taskIDTaskProcessIDmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDTaskProcessIDDeleteIds(){
		return this.taskIDTaskProcessIDDeleteIds;
	}

	public void setTaskIDTaskProcessIDDeleteIds(String deleteIds){
		this.taskIDTaskProcessIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDTaskProcessIDmultiselectIDs(){
		return this.taskIDTaskProcessIDmultiselectIDs;
	}

	public void setTaskIDTaskProcessIDmultiselectIDs(String multiselectIDs){
		this.taskIDTaskProcessIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDTaskProcessIDmultiselectNames(){
		return this.taskIDTaskProcessIDmultiselectNames;
	}

	public void setTaskIDTaskProcessIDmultiselectNames(String multiselectNames){
		this.taskIDTaskProcessIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDTaskProcessIDAddIds(){
		return this.taskIDTaskProcessIDAddIds;
	}

	public void setTaskIDTaskProcessIDAddIds(String addIds){
		this.taskIDTaskProcessIDAddIds = addIds;
	}
	private String taskIDFactoryIdDeleteIds;
	private String taskIDFactoryIdAddIds;
	private String taskIDFactoryIdmultiselectIDs;
	private String taskIDFactoryIdmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDFactoryIdDeleteIds(){
		return this.taskIDFactoryIdDeleteIds;
	}

	public void setTaskIDFactoryIdDeleteIds(String deleteIds){
		this.taskIDFactoryIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDFactoryIdmultiselectIDs(){
		return this.taskIDFactoryIdmultiselectIDs;
	}

	public void setTaskIDFactoryIdmultiselectIDs(String multiselectIDs){
		this.taskIDFactoryIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDFactoryIdmultiselectNames(){
		return this.taskIDFactoryIdmultiselectNames;
	}

	public void setTaskIDFactoryIdmultiselectNames(String multiselectNames){
		this.taskIDFactoryIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDFactoryIdAddIds(){
		return this.taskIDFactoryIdAddIds;
	}

	public void setTaskIDFactoryIdAddIds(String addIds){
		this.taskIDFactoryIdAddIds = addIds;
	}
	private String taskIDStaffIDDeleteIds;
	private String taskIDStaffIDAddIds;
	private String taskIDStaffIDmultiselectIDs;
	private String taskIDStaffIDmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDStaffIDDeleteIds(){
		return this.taskIDStaffIDDeleteIds;
	}

	public void setTaskIDStaffIDDeleteIds(String deleteIds){
		this.taskIDStaffIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDStaffIDmultiselectIDs(){
		return this.taskIDStaffIDmultiselectIDs;
	}

	public void setTaskIDStaffIDmultiselectIDs(String multiselectIDs){
		this.taskIDStaffIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDStaffIDmultiselectNames(){
		return this.taskIDStaffIDmultiselectNames;
	}

	public void setTaskIDStaffIDmultiselectNames(String multiselectNames){
		this.taskIDStaffIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDStaffIDAddIds(){
		return this.taskIDStaffIDAddIds;
	}

	public void setTaskIDStaffIDAddIds(String addIds){
		this.taskIDStaffIDAddIds = addIds;
	}
	private String taskIDFormularActiceDeleteIds;
	private String taskIDFormularActiceAddIds;
	private String taskIDFormularActicemultiselectIDs;
	private String taskIDFormularActicemultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDFormularActiceDeleteIds(){
		return this.taskIDFormularActiceDeleteIds;
	}

	public void setTaskIDFormularActiceDeleteIds(String deleteIds){
		this.taskIDFormularActiceDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDFormularActicemultiselectIDs(){
		return this.taskIDFormularActicemultiselectIDs;
	}

	public void setTaskIDFormularActicemultiselectIDs(String multiselectIDs){
		this.taskIDFormularActicemultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDFormularActicemultiselectNames(){
		return this.taskIDFormularActicemultiselectNames;
	}

	public void setTaskIDFormularActicemultiselectNames(String multiselectNames){
		this.taskIDFormularActicemultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDFormularActiceAddIds(){
		return this.taskIDFormularActiceAddIds;
	}

	public void setTaskIDFormularActiceAddIds(String addIds){
		this.taskIDFormularActiceAddIds = addIds;
	}
	private String taskIDWaitPutinRecordIDDeleteIds;
	private String taskIDWaitPutinRecordIDAddIds;
	private String taskIDWaitPutinRecordIDmultiselectIDs;
	private String taskIDWaitPutinRecordIDmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDWaitPutinRecordIDDeleteIds(){
		return this.taskIDWaitPutinRecordIDDeleteIds;
	}

	public void setTaskIDWaitPutinRecordIDDeleteIds(String deleteIds){
		this.taskIDWaitPutinRecordIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDWaitPutinRecordIDmultiselectIDs(){
		return this.taskIDWaitPutinRecordIDmultiselectIDs;
	}

	public void setTaskIDWaitPutinRecordIDmultiselectIDs(String multiselectIDs){
		this.taskIDWaitPutinRecordIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDWaitPutinRecordIDmultiselectNames(){
		return this.taskIDWaitPutinRecordIDmultiselectNames;
	}

	public void setTaskIDWaitPutinRecordIDmultiselectNames(String multiselectNames){
		this.taskIDWaitPutinRecordIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDWaitPutinRecordIDAddIds(){
		return this.taskIDWaitPutinRecordIDAddIds;
	}

	public void setTaskIDWaitPutinRecordIDAddIds(String addIds){
		this.taskIDWaitPutinRecordIDAddIds = addIds;
	}
	private String taskIDProductIDDeleteIds;
	private String taskIDProductIDAddIds;
	private String taskIDProductIDmultiselectIDs;
	private String taskIDProductIDmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDProductIDDeleteIds(){
		return this.taskIDProductIDDeleteIds;
	}

	public void setTaskIDProductIDDeleteIds(String deleteIds){
		this.taskIDProductIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDProductIDmultiselectIDs(){
		return this.taskIDProductIDmultiselectIDs;
	}

	public void setTaskIDProductIDmultiselectIDs(String multiselectIDs){
		this.taskIDProductIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDProductIDmultiselectNames(){
		return this.taskIDProductIDmultiselectNames;
	}

	public void setTaskIDProductIDmultiselectNames(String multiselectNames){
		this.taskIDProductIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDProductIDAddIds(){
		return this.taskIDProductIDAddIds;
	}

	public void setTaskIDProductIDAddIds(String addIds){
		this.taskIDProductIDAddIds = addIds;
	}
	private String taskIDActiveBatchStateIDDeleteIds;
	private String taskIDActiveBatchStateIDAddIds;
	private String taskIDActiveBatchStateIDmultiselectIDs;
	private String taskIDActiveBatchStateIDmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDActiveBatchStateIDDeleteIds(){
		return this.taskIDActiveBatchStateIDDeleteIds;
	}

	public void setTaskIDActiveBatchStateIDDeleteIds(String deleteIds){
		this.taskIDActiveBatchStateIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDActiveBatchStateIDmultiselectIDs(){
		return this.taskIDActiveBatchStateIDmultiselectIDs;
	}

	public void setTaskIDActiveBatchStateIDmultiselectIDs(String multiselectIDs){
		this.taskIDActiveBatchStateIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDActiveBatchStateIDmultiselectNames(){
		return this.taskIDActiveBatchStateIDmultiselectNames;
	}

	public void setTaskIDActiveBatchStateIDmultiselectNames(String multiselectNames){
		this.taskIDActiveBatchStateIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDActiveBatchStateIDAddIds(){
		return this.taskIDActiveBatchStateIDAddIds;
	}

	public void setTaskIDActiveBatchStateIDAddIds(String addIds){
		this.taskIDActiveBatchStateIDAddIds = addIds;
	}
	private String taskIDTaskActiveIDDeleteIds;
	private String taskIDTaskActiveIDAddIds;
	private String taskIDTaskActiveIDmultiselectIDs;
	private String taskIDTaskActiveIDmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDTaskActiveIDDeleteIds(){
		return this.taskIDTaskActiveIDDeleteIds;
	}

	public void setTaskIDTaskActiveIDDeleteIds(String deleteIds){
		this.taskIDTaskActiveIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDTaskActiveIDmultiselectIDs(){
		return this.taskIDTaskActiveIDmultiselectIDs;
	}

	public void setTaskIDTaskActiveIDmultiselectIDs(String multiselectIDs){
		this.taskIDTaskActiveIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDTaskActiveIDmultiselectNames(){
		return this.taskIDTaskActiveIDmultiselectNames;
	}

	public void setTaskIDTaskActiveIDmultiselectNames(String multiselectNames){
		this.taskIDTaskActiveIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDTaskActiveIDAddIds(){
		return this.taskIDTaskActiveIDAddIds;
	}

	public void setTaskIDTaskActiveIDAddIds(String addIds){
		this.taskIDTaskActiveIDAddIds = addIds;
	}
	private String taskIDIdDeleteIds;
	private String taskIDIdAddIds;
	private String taskIDIdmultiselectIDs;
	private String taskIDIdmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDIdDeleteIds(){
		return this.taskIDIdDeleteIds;
	}

	public void setTaskIDIdDeleteIds(String deleteIds){
		this.taskIDIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDIdmultiselectIDs(){
		return this.taskIDIdmultiselectIDs;
	}

	public void setTaskIDIdmultiselectIDs(String multiselectIDs){
		this.taskIDIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDIdmultiselectNames(){
		return this.taskIDIdmultiselectNames;
	}

	public void setTaskIDIdmultiselectNames(String multiselectNames){
		this.taskIDIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDIdAddIds(){
		return this.taskIDIdAddIds;
	}

	public void setTaskIDIdAddIds(String addIds){
		this.taskIDIdAddIds = addIds;
	}
	private String taskIDProcessExeLogDeleteIds;
	private String taskIDProcessExeLogAddIds;
	private String taskIDProcessExeLogmultiselectIDs;
	private String taskIDProcessExeLogmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDProcessExeLogDeleteIds(){
		return this.taskIDProcessExeLogDeleteIds;
	}

	public void setTaskIDProcessExeLogDeleteIds(String deleteIds){
		this.taskIDProcessExeLogDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDProcessExeLogmultiselectIDs(){
		return this.taskIDProcessExeLogmultiselectIDs;
	}

	public void setTaskIDProcessExeLogmultiselectIDs(String multiselectIDs){
		this.taskIDProcessExeLogmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDProcessExeLogmultiselectNames(){
		return this.taskIDProcessExeLogmultiselectNames;
	}

	public void setTaskIDProcessExeLogmultiselectNames(String multiselectNames){
		this.taskIDProcessExeLogmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDProcessExeLogAddIds(){
		return this.taskIDProcessExeLogAddIds;
	}

	public void setTaskIDProcessExeLogAddIds(String addIds){
		this.taskIDProcessExeLogAddIds = addIds;
	}
	private String taskIDFactoryIDDeleteIds;
	private String taskIDFactoryIDAddIds;
	private String taskIDFactoryIDmultiselectIDs;
	private String taskIDFactoryIDmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDFactoryIDDeleteIds(){
		return this.taskIDFactoryIDDeleteIds;
	}

	public void setTaskIDFactoryIDDeleteIds(String deleteIds){
		this.taskIDFactoryIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDFactoryIDmultiselectIDs(){
		return this.taskIDFactoryIDmultiselectIDs;
	}

	public void setTaskIDFactoryIDmultiselectIDs(String multiselectIDs){
		this.taskIDFactoryIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDFactoryIDmultiselectNames(){
		return this.taskIDFactoryIDmultiselectNames;
	}

	public void setTaskIDFactoryIDmultiselectNames(String multiselectNames){
		this.taskIDFactoryIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDFactoryIDAddIds(){
		return this.taskIDFactoryIDAddIds;
	}

	public void setTaskIDFactoryIDAddIds(String addIds){
		this.taskIDFactoryIDAddIds = addIds;
	}
	private String taskIDFormularProcessDeleteIds;
	private String taskIDFormularProcessAddIds;
	private String taskIDFormularProcessmultiselectIDs;
	private String taskIDFormularProcessmultiselectNames;

	@javax.persistence.Transient
	public String getTaskIDFormularProcessDeleteIds(){
		return this.taskIDFormularProcessDeleteIds;
	}

	public void setTaskIDFormularProcessDeleteIds(String deleteIds){
		this.taskIDFormularProcessDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getTaskIDFormularProcessmultiselectIDs(){
		return this.taskIDFormularProcessmultiselectIDs;
	}

	public void setTaskIDFormularProcessmultiselectIDs(String multiselectIDs){
		this.taskIDFormularProcessmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getTaskIDFormularProcessmultiselectNames(){
		return this.taskIDFormularProcessmultiselectNames;
	}

	public void setTaskIDFormularProcessmultiselectNames(String multiselectNames){
		this.taskIDFormularProcessmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getTaskIDFormularProcessAddIds(){
		return this.taskIDFormularProcessAddIds;
	}

	public void setTaskIDFormularProcessAddIds(String addIds){
		this.taskIDFormularProcessAddIds = addIds;
	}
	private String headIdProductIdDeleteIds;
	private String headIdProductIdAddIds;
	private String headIdProductIdmultiselectIDs;
	private String headIdProductIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdProductIdDeleteIds(){
		return this.headIdProductIdDeleteIds;
	}

	public void setHeadIdProductIdDeleteIds(String deleteIds){
		this.headIdProductIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIdmultiselectIDs(){
		return this.headIdProductIdmultiselectIDs;
	}

	public void setHeadIdProductIdmultiselectIDs(String multiselectIDs){
		this.headIdProductIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIdmultiselectNames(){
		return this.headIdProductIdmultiselectNames;
	}

	public void setHeadIdProductIdmultiselectNames(String multiselectNames){
		this.headIdProductIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdProductIdAddIds(){
		return this.headIdProductIdAddIds;
	}

	public void setHeadIdProductIdAddIds(String addIds){
		this.headIdProductIdAddIds = addIds;
	}
	private String headIDFactoryIdDeleteIds;
	private String headIDFactoryIdAddIds;
	private String headIDFactoryIdmultiselectIDs;
	private String headIDFactoryIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDFactoryIdDeleteIds(){
		return this.headIDFactoryIdDeleteIds;
	}

	public void setHeadIDFactoryIdDeleteIds(String deleteIds){
		this.headIDFactoryIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDFactoryIdmultiselectIDs(){
		return this.headIDFactoryIdmultiselectIDs;
	}

	public void setHeadIDFactoryIdmultiselectIDs(String multiselectIDs){
		this.headIDFactoryIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDFactoryIdmultiselectNames(){
		return this.headIDFactoryIdmultiselectNames;
	}

	public void setHeadIDFactoryIdmultiselectNames(String multiselectNames){
		this.headIDFactoryIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDFactoryIdAddIds(){
		return this.headIDFactoryIdAddIds;
	}

	public void setHeadIDFactoryIdAddIds(String addIds){
		this.headIDFactoryIdAddIds = addIds;
	}
	private String headIDPutBatMateIdDeleteIds;
	private String headIDPutBatMateIdAddIds;
	private String headIDPutBatMateIdmultiselectIDs;
	private String headIDPutBatMateIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDPutBatMateIdDeleteIds(){
		return this.headIDPutBatMateIdDeleteIds;
	}

	public void setHeadIDPutBatMateIdDeleteIds(String deleteIds){
		this.headIDPutBatMateIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDPutBatMateIdmultiselectIDs(){
		return this.headIDPutBatMateIdmultiselectIDs;
	}

	public void setHeadIDPutBatMateIdmultiselectIDs(String multiselectIDs){
		this.headIDPutBatMateIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDPutBatMateIdmultiselectNames(){
		return this.headIDPutBatMateIdmultiselectNames;
	}

	public void setHeadIDPutBatMateIdmultiselectNames(String multiselectNames){
		this.headIDPutBatMateIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDPutBatMateIdAddIds(){
		return this.headIDPutBatMateIdAddIds;
	}

	public void setHeadIDPutBatMateIdAddIds(String addIds){
		this.headIDPutBatMateIdAddIds = addIds;
	}
	private String headIDIdDeleteIds;
	private String headIDIdAddIds;
	private String headIDIdmultiselectIDs;
	private String headIDIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDIdDeleteIds(){
		return this.headIDIdDeleteIds;
	}

	public void setHeadIDIdDeleteIds(String deleteIds){
		this.headIDIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDIdmultiselectIDs(){
		return this.headIDIdmultiselectIDs;
	}

	public void setHeadIDIdmultiselectIDs(String multiselectIDs){
		this.headIDIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDIdmultiselectNames(){
		return this.headIDIdmultiselectNames;
	}

	public void setHeadIDIdmultiselectNames(String multiselectNames){
		this.headIDIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDIdAddIds(){
		return this.headIDIdAddIds;
	}

	public void setHeadIDIdAddIds(String addIds){
		this.headIDIdAddIds = addIds;
	}
	private String headIDActiveBatchStateDeleteIds;
	private String headIDActiveBatchStateAddIds;
	private String headIDActiveBatchStatemultiselectIDs;
	private String headIDActiveBatchStatemultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDActiveBatchStateDeleteIds(){
		return this.headIDActiveBatchStateDeleteIds;
	}

	public void setHeadIDActiveBatchStateDeleteIds(String deleteIds){
		this.headIDActiveBatchStateDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDActiveBatchStatemultiselectIDs(){
		return this.headIDActiveBatchStatemultiselectIDs;
	}

	public void setHeadIDActiveBatchStatemultiselectIDs(String multiselectIDs){
		this.headIDActiveBatchStatemultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDActiveBatchStatemultiselectNames(){
		return this.headIDActiveBatchStatemultiselectNames;
	}

	public void setHeadIDActiveBatchStatemultiselectNames(String multiselectNames){
		this.headIDActiveBatchStatemultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDActiveBatchStateAddIds(){
		return this.headIDActiveBatchStateAddIds;
	}

	public void setHeadIDActiveBatchStateAddIds(String addIds){
		this.headIDActiveBatchStateAddIds = addIds;
	}
	private String headIDFormulaBomDeleteIds;
	private String headIDFormulaBomAddIds;
	private String headIDFormulaBommultiselectIDs;
	private String headIDFormulaBommultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDFormulaBomDeleteIds(){
		return this.headIDFormulaBomDeleteIds;
	}

	public void setHeadIDFormulaBomDeleteIds(String deleteIds){
		this.headIDFormulaBomDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDFormulaBommultiselectIDs(){
		return this.headIDFormulaBommultiselectIDs;
	}

	public void setHeadIDFormulaBommultiselectIDs(String multiselectIDs){
		this.headIDFormulaBommultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDFormulaBommultiselectNames(){
		return this.headIDFormulaBommultiselectNames;
	}

	public void setHeadIDFormulaBommultiselectNames(String multiselectNames){
		this.headIDFormulaBommultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDFormulaBomAddIds(){
		return this.headIDFormulaBomAddIds;
	}

	public void setHeadIDFormulaBomAddIds(String addIds){
		this.headIDFormulaBomAddIds = addIds;
	}
	private String headIDFormulaIdDeleteIds;
	private String headIDFormulaIdAddIds;
	private String headIDFormulaIdmultiselectIDs;
	private String headIDFormulaIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDFormulaIdDeleteIds(){
		return this.headIDFormulaIdDeleteIds;
	}

	public void setHeadIDFormulaIdDeleteIds(String deleteIds){
		this.headIDFormulaIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDFormulaIdmultiselectIDs(){
		return this.headIDFormulaIdmultiselectIDs;
	}

	public void setHeadIDFormulaIdmultiselectIDs(String multiselectIDs){
		this.headIDFormulaIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDFormulaIdmultiselectNames(){
		return this.headIDFormulaIdmultiselectNames;
	}

	public void setHeadIDFormulaIdmultiselectNames(String multiselectNames){
		this.headIDFormulaIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDFormulaIdAddIds(){
		return this.headIDFormulaIdAddIds;
	}

	public void setHeadIDFormulaIdAddIds(String addIds){
		this.headIDFormulaIdAddIds = addIds;
	}
	private String headIDProductIdDeleteIds;
	private String headIDProductIdAddIds;
	private String headIDProductIdmultiselectIDs;
	private String headIDProductIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDProductIdDeleteIds(){
		return this.headIDProductIdDeleteIds;
	}

	public void setHeadIDProductIdDeleteIds(String deleteIds){
		this.headIDProductIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDProductIdmultiselectIDs(){
		return this.headIDProductIdmultiselectIDs;
	}

	public void setHeadIDProductIdmultiselectIDs(String multiselectIDs){
		this.headIDProductIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDProductIdmultiselectNames(){
		return this.headIDProductIdmultiselectNames;
	}

	public void setHeadIDProductIdmultiselectNames(String multiselectNames){
		this.headIDProductIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDProductIdAddIds(){
		return this.headIDProductIdAddIds;
	}

	public void setHeadIDProductIdAddIds(String addIds){
		this.headIDProductIdAddIds = addIds;
	}
	private String headIDOrderProcessIdDeleteIds;
	private String headIDOrderProcessIdAddIds;
	private String headIDOrderProcessIdmultiselectIDs;
	private String headIDOrderProcessIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDOrderProcessIdDeleteIds(){
		return this.headIDOrderProcessIdDeleteIds;
	}

	public void setHeadIDOrderProcessIdDeleteIds(String deleteIds){
		this.headIDOrderProcessIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDOrderProcessIdmultiselectIDs(){
		return this.headIDOrderProcessIdmultiselectIDs;
	}

	public void setHeadIDOrderProcessIdmultiselectIDs(String multiselectIDs){
		this.headIDOrderProcessIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDOrderProcessIdmultiselectNames(){
		return this.headIDOrderProcessIdmultiselectNames;
	}

	public void setHeadIDOrderProcessIdmultiselectNames(String multiselectNames){
		this.headIDOrderProcessIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDOrderProcessIdAddIds(){
		return this.headIDOrderProcessIdAddIds;
	}

	public void setHeadIDOrderProcessIdAddIds(String addIds){
		this.headIDOrderProcessIdAddIds = addIds;
	}
	private String headIDBatchNumObjDeleteIds;
	private String headIDBatchNumObjAddIds;
	private String headIDBatchNumObjmultiselectIDs;
	private String headIDBatchNumObjmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDBatchNumObjDeleteIds(){
		return this.headIDBatchNumObjDeleteIds;
	}

	public void setHeadIDBatchNumObjDeleteIds(String deleteIds){
		this.headIDBatchNumObjDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDBatchNumObjmultiselectIDs(){
		return this.headIDBatchNumObjmultiselectIDs;
	}

	public void setHeadIDBatchNumObjmultiselectIDs(String multiselectIDs){
		this.headIDBatchNumObjmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDBatchNumObjmultiselectNames(){
		return this.headIDBatchNumObjmultiselectNames;
	}

	public void setHeadIDBatchNumObjmultiselectNames(String multiselectNames){
		this.headIDBatchNumObjmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDBatchNumObjAddIds(){
		return this.headIDBatchNumObjAddIds;
	}

	public void setHeadIDBatchNumObjAddIds(String addIds){
		this.headIDBatchNumObjAddIds = addIds;
	}
	private String headIDActiveIdDeleteIds;
	private String headIDActiveIdAddIds;
	private String headIDActiveIdmultiselectIDs;
	private String headIDActiveIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDActiveIdDeleteIds(){
		return this.headIDActiveIdDeleteIds;
	}

	public void setHeadIDActiveIdDeleteIds(String deleteIds){
		this.headIDActiveIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDActiveIdmultiselectIDs(){
		return this.headIDActiveIdmultiselectIDs;
	}

	public void setHeadIDActiveIdmultiselectIDs(String multiselectIDs){
		this.headIDActiveIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDActiveIdmultiselectNames(){
		return this.headIDActiveIdmultiselectNames;
	}

	public void setHeadIDActiveIdmultiselectNames(String multiselectNames){
		this.headIDActiveIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDActiveIdAddIds(){
		return this.headIDActiveIdAddIds;
	}

	public void setHeadIDActiveIdAddIds(String addIds){
		this.headIDActiveIdAddIds = addIds;
	}
	private String headIDProcessIdDeleteIds;
	private String headIDProcessIdAddIds;
	private String headIDProcessIdmultiselectIDs;
	private String headIDProcessIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDProcessIdDeleteIds(){
		return this.headIDProcessIdDeleteIds;
	}

	public void setHeadIDProcessIdDeleteIds(String deleteIds){
		this.headIDProcessIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDProcessIdmultiselectIDs(){
		return this.headIDProcessIdmultiselectIDs;
	}

	public void setHeadIDProcessIdmultiselectIDs(String multiselectIDs){
		this.headIDProcessIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDProcessIdmultiselectNames(){
		return this.headIDProcessIdmultiselectNames;
	}

	public void setHeadIDProcessIdmultiselectNames(String multiselectNames){
		this.headIDProcessIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDProcessIdAddIds(){
		return this.headIDProcessIdAddIds;
	}

	public void setHeadIDProcessIdAddIds(String addIds){
		this.headIDProcessIdAddIds = addIds;
	}
	private String headIdIdDeleteIds;
	private String headIdIdAddIds;
	private String headIdIdmultiselectIDs;
	private String headIdIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdIdDeleteIds(){
		return this.headIdIdDeleteIds;
	}

	public void setHeadIdIdDeleteIds(String deleteIds){
		this.headIdIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdIdmultiselectIDs(){
		return this.headIdIdmultiselectIDs;
	}

	public void setHeadIdIdmultiselectIDs(String multiselectIDs){
		this.headIdIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdIdmultiselectNames(){
		return this.headIdIdmultiselectNames;
	}

	public void setHeadIdIdmultiselectNames(String multiselectNames){
		this.headIdIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdIdAddIds(){
		return this.headIdIdAddIds;
	}

	public void setHeadIdIdAddIds(String addIds){
		this.headIdIdAddIds = addIds;
	}
	private String headIdFormulaIdDeleteIds;
	private String headIdFormulaIdAddIds;
	private String headIdFormulaIdmultiselectIDs;
	private String headIdFormulaIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdFormulaIdDeleteIds(){
		return this.headIdFormulaIdDeleteIds;
	}

	public void setHeadIdFormulaIdDeleteIds(String deleteIds){
		this.headIdFormulaIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdFormulaIdmultiselectIDs(){
		return this.headIdFormulaIdmultiselectIDs;
	}

	public void setHeadIdFormulaIdmultiselectIDs(String multiselectIDs){
		this.headIdFormulaIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdFormulaIdmultiselectNames(){
		return this.headIdFormulaIdmultiselectNames;
	}

	public void setHeadIdFormulaIdmultiselectNames(String multiselectNames){
		this.headIdFormulaIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdFormulaIdAddIds(){
		return this.headIdFormulaIdAddIds;
	}

	public void setHeadIdFormulaIdAddIds(String addIds){
		this.headIdFormulaIdAddIds = addIds;
	}
	private String headIdProcessTypeDeleteIds;
	private String headIdProcessTypeAddIds;
	private String headIdProcessTypemultiselectIDs;
	private String headIdProcessTypemultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdProcessTypeDeleteIds(){
		return this.headIdProcessTypeDeleteIds;
	}

	public void setHeadIdProcessTypeDeleteIds(String deleteIds){
		this.headIdProcessTypeDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdProcessTypemultiselectIDs(){
		return this.headIdProcessTypemultiselectIDs;
	}

	public void setHeadIdProcessTypemultiselectIDs(String multiselectIDs){
		this.headIdProcessTypemultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdProcessTypemultiselectNames(){
		return this.headIdProcessTypemultiselectNames;
	}

	public void setHeadIdProcessTypemultiselectNames(String multiselectNames){
		this.headIdProcessTypemultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdProcessTypeAddIds(){
		return this.headIdProcessTypeAddIds;
	}

	public void setHeadIdProcessTypeAddIds(String addIds){
		this.headIdProcessTypeAddIds = addIds;
	}
	private String headIdFormularProcessDeleteIds;
	private String headIdFormularProcessAddIds;
	private String headIdFormularProcessmultiselectIDs;
	private String headIdFormularProcessmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdFormularProcessDeleteIds(){
		return this.headIdFormularProcessDeleteIds;
	}

	public void setHeadIdFormularProcessDeleteIds(String deleteIds){
		this.headIdFormularProcessDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdFormularProcessmultiselectIDs(){
		return this.headIdFormularProcessmultiselectIDs;
	}

	public void setHeadIdFormularProcessmultiselectIDs(String multiselectIDs){
		this.headIdFormularProcessmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdFormularProcessmultiselectNames(){
		return this.headIdFormularProcessmultiselectNames;
	}

	public void setHeadIdFormularProcessmultiselectNames(String multiselectNames){
		this.headIdFormularProcessmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdFormularProcessAddIds(){
		return this.headIdFormularProcessAddIds;
	}

	public void setHeadIdFormularProcessAddIds(String addIds){
		this.headIdFormularProcessAddIds = addIds;
	}
	private String headIdFactoryIdDeleteIds;
	private String headIdFactoryIdAddIds;
	private String headIdFactoryIdmultiselectIDs;
	private String headIdFactoryIdmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIdFactoryIdDeleteIds(){
		return this.headIdFactoryIdDeleteIds;
	}

	public void setHeadIdFactoryIdDeleteIds(String deleteIds){
		this.headIdFactoryIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIdFactoryIdmultiselectIDs(){
		return this.headIdFactoryIdmultiselectIDs;
	}

	public void setHeadIdFactoryIdmultiselectIDs(String multiselectIDs){
		this.headIdFactoryIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIdFactoryIdmultiselectNames(){
		return this.headIdFactoryIdmultiselectNames;
	}

	public void setHeadIdFactoryIdmultiselectNames(String multiselectNames){
		this.headIdFactoryIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIdFactoryIdAddIds(){
		return this.headIdFactoryIdAddIds;
	}

	public void setHeadIdFactoryIdAddIds(String addIds){
		this.headIdFactoryIdAddIds = addIds;
	}
	private String supervisionDeleteIds;
	private String supervisionAddIds;
	private String supervisionmultiselectIDs;
	private String supervisionmultiselectNames;
	private List<WOMProduceTaskSupervision> supervisionList;

	@javax.persistence.Transient
	public String getSupervisionDeleteIds(){
		return this.supervisionDeleteIds;
	}

	public void setSupervisionDeleteIds(String deleteIds){
		this.supervisionDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getSupervisionmultiselectIDs(){
		return this.supervisionmultiselectIDs;
	}

	public void setSupervisionmultiselectIDs(String multiselectIDs){
		this.supervisionmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getSupervisionmultiselectNames(){
		return this.supervisionmultiselectNames;
	}

	public void setSupervisionmultiselectNames(String multiselectNames){
		this.supervisionmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getSupervisionAddIds(){
		return this.supervisionAddIds;
	}

	public void setSupervisionAddIds(String addIds){
		this.supervisionAddIds = addIds;
	}

	public void setSupervisionList(List<WOMProduceTaskSupervision> supervisionList){
		this.supervisionList = supervisionList;
	}

	@Transient
	public List<WOMProduceTaskSupervision> getSupervisionList(){
		return supervisionList;
	}

	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTask_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
