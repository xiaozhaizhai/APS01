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
import com.supcon.orchid.annotation.BAPEntity;
import javax.persistence.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Where;
import com.supcon.orchid.audit.annotation.DataAudit;
import com.supcon.orchid.orm.entities.IAuditEntity;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.orm.entities.ICompany;
import com.supcon.orchid.orm.entities.ICId;
import com.supcon.orchid.annotation.BAPCustomComponent;
import com.supcon.orchid.annotation.BAPIsMainDisplay;
import com.supcon.orchid.annotation.BAPIsMneCode;
import com.supcon.orchid.annotation.BAPModelCode;
import com.supcon.orchid.annotation.BAPPicture;
import com.supcon.orchid.annotation.BAPSystemCodeMultable;
import com.supcon.orchid.annotation.BAPSeniorSystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 活动执行待办表.
 */
@javax.persistence.Entity(name=WOMTaskActivePending.JPA_NAME)
@Table(name = WOMTaskActivePending.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_TaskActivePending")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_TaskActivePending,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
public class WOMTaskActivePending extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_TaskActivePending";
	public static final String DOC_TYPE = "WOM_produceTask_taskActivePending";
	public static final String TABLE_NAME = "wom_task_active_pendings";
	public static final String JPA_NAME = "WOMTaskActivePending";
	private SystemCode activeType
; // 活动类型


		private String batchNum ; // 生产批号


		private String batchPhaseID ; // 批控.phaseID


		private java.util.Date endTime ; // 结束时间
	private MESBasicFactoryModel factoryID;


		private String pdaCode ; // PDA编码
	private WOMProdTaskProcExelog processExeLog;


		private String remark ; // 备注
	private Staff staffID;


		private java.util.Date startTime ; // 开始时间
	private SystemCode state
; // 状态
	private WOMProduceTaskActive taskActiveID;
	private WOMProduceTask taskID;
	private WOMProduceTaskProcess taskProcessID;
	
	
	private Document document;
	
	private String bapAttachmentInfo;
	
	@javax.persistence.Transient
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
	
	
	@Index(name="IDX_TASKACTIVEPENDI_TABLE_ID")
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
	 * 获取批控.phaseID.
	 * 
	 * @return 批控.phaseID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_PHASEID"
	)
    public String getBatchPhaseID() {
        return batchPhaseID;
    }
	/**
	 * 设置批控.phaseID.
	 * @param batchPhaseID 批控.phaseID
	 */
    public void setBatchPhaseID(String batchPhaseID) {
        this.batchPhaseID = batchPhaseID;
    }
	/**
	 * 获取结束时间.
	 * 
	 * @return 结束时间
	 */
	@Column(nullable=true

		,name="END_TIME"
	)
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
	@OneToOne
	@JoinColumn(name = "FACTORYID", referencedColumnName="ID")
	
						
    public MESBasicFactoryModel getFactoryID() {
        return factoryID;
    }
    public void setFactoryID(MESBasicFactoryModel factoryID) {
        this.factoryID = factoryID;
    }
	/**
	 * 获取PDA编码.
	 * 
	 * @return PDA编码
	 */
	@Column(nullable=true

		,length = 256
		,name="PDA_CODE"
	)
    public String getPdaCode() {
        return pdaCode;
    }
	/**
	 * 设置PDA编码.
	 * @param pdaCode PDA编码
	 */
    public void setPdaCode(String pdaCode) {
        this.pdaCode = pdaCode;
    }
	@ManyToOne
	@JoinColumn(name = "PROCESS_EXE_LOG", referencedColumnName="ID")
	
						
    public WOMProdTaskProcExelog getProcessExeLog() {
        return processExeLog;
    }
    public void setProcessExeLog(WOMProdTaskProcExelog processExeLog) {
        this.processExeLog = processExeLog;
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
	@OneToOne
	@JoinColumn(name = "STAFFID", referencedColumnName="ID")
	
						
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
	@JoinColumn(name = "TASK_ACTIVEID", referencedColumnName="ID")
	
						
    public WOMProduceTaskActive getTaskActiveID() {
        return taskActiveID;
    }
    public void setTaskActiveID(WOMProduceTaskActive taskActiveID) {
        this.taskActiveID = taskActiveID;
    }
	@ManyToOne
	@JoinColumn(name = "TASKID", referencedColumnName="ID")
	
						
    public WOMProduceTask getTaskID() {
        return taskID;
    }
    public void setTaskID(WOMProduceTask taskID) {
        this.taskID = taskID;
    }
	@ManyToOne
	@JoinColumn(name = "TASK_PROCESSID", referencedColumnName="ID")
	
						
    public WOMProduceTaskProcess getTaskProcessID() {
        return taskProcessID;
    }
    public void setTaskProcessID(WOMProduceTaskProcess taskProcessID) {
        this.taskProcessID = taskProcessID;
    }
	
	
	protected String _getEntityName() {
		return WOMTaskActivePending.class.getName();
	}
	
	
	private ICompany company;
	
	@Override
	@OneToOne(fetch=FetchType.EAGER, targetEntity=Company.class, optional=true)
    @JoinColumn(name=ICId.P_CID, insertable=false, updatable=false)
    @Fetch(FetchMode.SELECT)
	public ICompany getCompany() {
		return this.company;
	}
	
	@Override
	public void setCompany(ICompany company) {
		this.company =company;
	}


	// 在此区域内自行添加JAVA代码,此处添加的JAVA代码必须不涉及持久化操作,
	// 如果加入get方法,请添加@javax.persistence.Transient注解
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_TaskActivePending,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
