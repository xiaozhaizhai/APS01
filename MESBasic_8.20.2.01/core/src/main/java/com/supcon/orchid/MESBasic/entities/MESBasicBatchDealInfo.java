package com.supcon.orchid.MESBasic.entities;

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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 批次处理信息表.
 */
@javax.persistence.Entity(name=MESBasicBatchDealInfo.JPA_NAME)
@Table(name = MESBasicBatchDealInfo.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_batchInfo")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_batchInfo_BatchDealInfo")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_batchInfo_BatchDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicBatchDealInfoConvertor.class})
public class MESBasicBatchDealInfo extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_batchInfo";
	public static final String MODEL_CODE = "MESBasic_1_batchInfo_BatchDealInfo";
	public static final String DOC_TYPE = "MESBasic_batchInfo_batchDealInfo";
	public static final String TABLE_NAME = "batch_dealinfo";
	public static final String JPA_NAME = "MESBasicBatchDealInfo";


		private Long activeID ; // 活动ID


		private java.math.BigDecimal amount ; // 数量
	private MESBasicBatchInformation batchInfoID;


		private String batchNum ; // 批号

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date dealDate ; // 处理时间
	private Department dealDept;


		private Long dealFromID ; // 处理单据ID
	private Staff dealStaff;


		private String dealTableNo ; // 处理单据编号
	private SystemCode dealType
; // 处理类型


		private Long processID ; // 工序ID 


		private String sourceBatch ; // 源批号


		private Long workOrderID ; // 指令单ID 
	
	
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
	 * 获取活动ID.
	 * 
	 * @return 活动ID
	 */
	@Column(nullable=true

		,name="ACTIVEID"
	)
    public Long getActiveID() {
        return activeID;
    }
	/**
	 * 设置活动ID.
	 * @param activeID 活动ID
	 */
    public void setActiveID(Long activeID) {
        this.activeID = activeID;
    }
	/**
	 * 获取数量.
	 * 
	 * @return 数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="AMOUNT"
	)
    public java.math.BigDecimal getAmount() {
        return amount;
    }
	/**
	 * 设置数量.
	 * @param amount 数量
	 */
    public void setAmount(java.math.BigDecimal amount) {
        this.amount = amount;
    }
	@ManyToOne
	@JoinColumn(name = "BATCH_INFOID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicBatchInformation getBatchInfoID() {
        return batchInfoID;
    }
    public void setBatchInfoID(MESBasicBatchInformation batchInfoID) {
        this.batchInfoID = batchInfoID;
    }
	/**
	 * 获取批号.
	 * 
	 * @return 批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置批号.
	 * @param batchNum 批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取处理时间.
	 * 
	 * @return 处理时间
	 */
	@Column(nullable=true

		,name="DEAL_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDealDate() {
        return dealDate;
    }
	/**
	 * 设置处理时间.
	 * @param dealDate 处理时间
	 */
    public void setDealDate(java.util.Date dealDate) {
        this.dealDate = dealDate;
    }
	@OneToOne
	@JoinColumn(name = "DEAL_DEPT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getDealDept() {
        return dealDept;
    }
    public void setDealDept(Department dealDept) {
        this.dealDept = dealDept;
    }
	/**
	 * 获取处理单据ID.
	 * 
	 * @return 处理单据ID
	 */
	@Column(nullable=true

		,name="DEAL_FROMID"
	)
    public Long getDealFromID() {
        return dealFromID;
    }
	/**
	 * 设置处理单据ID.
	 * @param dealFromID 处理单据ID
	 */
    public void setDealFromID(Long dealFromID) {
        this.dealFromID = dealFromID;
    }
	@OneToOne
	@JoinColumn(name = "DEAL_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getDealStaff() {
        return dealStaff;
    }
    public void setDealStaff(Staff dealStaff) {
        this.dealStaff = dealStaff;
    }
	/**
	 * 获取处理单据编号.
	 * 
	 * @return 处理单据编号
	 */
	@Column(nullable=true

		,length = 256
		,name="DEAL_TABLE_NO"
	)
    public String getDealTableNo() {
        return dealTableNo;
    }
	/**
	 * 设置处理单据编号.
	 * @param dealTableNo 处理单据编号
	 */
    public void setDealTableNo(String dealTableNo) {
        this.dealTableNo = dealTableNo;
    }
	/**
	 * 获取处理类型.
	 * 
	 * @return 处理类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DEAL_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDealType() {
		return dealType;
	}
	/**
	 * 设置处理类型.
	 * @param dealType 处理类型
	 */
	public void setDealType(SystemCode dealType) {
		this.dealType = (SystemCode) dealType;
	}
	/**
	 * 获取工序ID .
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
	 * 设置工序ID .
	 * @param processID 工序ID 
	 */
    public void setProcessID(Long processID) {
        this.processID = processID;
    }
	/**
	 * 获取源批号.
	 * 
	 * @return 源批号
	 */
	@Column(nullable=true

		,length = 256
		,name="SOURCE_BATCH"
	)
    public String getSourceBatch() {
        return sourceBatch;
    }
	/**
	 * 设置源批号.
	 * @param sourceBatch 源批号
	 */
    public void setSourceBatch(String sourceBatch) {
        this.sourceBatch = sourceBatch;
    }
	/**
	 * 获取指令单ID .
	 * 
	 * @return 指令单ID 
	 */
	@Column(nullable=true

		,name="WORK_ORDERID"
	)
    public Long getWorkOrderID() {
        return workOrderID;
    }
	/**
	 * 设置指令单ID .
	 * @param workOrderID 指令单ID 
	 */
    public void setWorkOrderID(Long workOrderID) {
        this.workOrderID = workOrderID;
    }
	
	
	protected String _getEntityName() {
		return MESBasicBatchDealInfo.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_batchInfo_BatchDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
