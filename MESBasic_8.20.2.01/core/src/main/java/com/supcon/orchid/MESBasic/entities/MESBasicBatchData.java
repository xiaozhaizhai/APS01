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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 数据接口.
 */
@javax.persistence.Entity(name=MESBasicBatchData.JPA_NAME)
@Table(name = MESBasicBatchData.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_batchDataHandler")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_batchDataHandler_BatchData")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_batchDataHandler_BatchData,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicBatchDataConvertor.class})
public class MESBasicBatchData extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_batchDataHandler";
	public static final String MODEL_CODE = "MESBasic_1_batchDataHandler_BatchData";
	public static final String DOC_TYPE = "MESBasic_batchDataHandler_batchData";
	public static final String TABLE_NAME = "mesbasic_batch_datas";
	public static final String JPA_NAME = "MESBasicBatchData";
	private SystemCode businessType
; // 业务类型


		private String content ; // 业务数据


		private String dataId ; // 信号ID

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date dataTime ; // 数据时间


		private Boolean insertCheck = false; // 插入标记


		private Long originalSignalId ; // 信号源Id


		private Boolean processed = false; // 处理标记


		private String purchaseCode ; // 原料批号


		private String qc ; // 质量变化
	private SystemCode signalSource
; // 来源
	@BAPIsMainDisplay

		private String tag ; // 位号


		private String tvalue ; // 位号值
	
	
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
	 * 获取业务类型.
	 * 
	 * @return 业务类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BUSINESS_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBusinessType() {
		return businessType;
	}
	/**
	 * 设置业务类型.
	 * @param businessType 业务类型
	 */
	public void setBusinessType(SystemCode businessType) {
		this.businessType = (SystemCode) businessType;
	}
	/**
	 * 获取业务数据.
	 * 
	 * @return 业务数据
	 */
	@Column(nullable=true

		,length = 200
		,name="CONTENT"
	)
    public String getContent() {
        return content;
    }
	/**
	 * 设置业务数据.
	 * @param content 业务数据
	 */
    public void setContent(String content) {
        this.content = content;
    }
	/**
	 * 获取信号ID.
	 * 
	 * @return 信号ID
	 */
	@Column(nullable=true

		,length = 200
		,name="DATA_ID"
	)
    public String getDataId() {
        return dataId;
    }
	/**
	 * 设置信号ID.
	 * @param dataId 信号ID
	 */
    public void setDataId(String dataId) {
        this.dataId = dataId;
    }
	/**
	 * 获取数据时间.
	 * 
	 * @return 数据时间
	 */
	@Column(nullable=true

		,name="DATA_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDataTime() {
        return dataTime;
    }
	/**
	 * 设置数据时间.
	 * @param dataTime 数据时间
	 */
    public void setDataTime(java.util.Date dataTime) {
        this.dataTime = dataTime;
    }
	/**
	 * 获取插入标记.
	 * 
	 * @return 插入标记
	 */
	@Column(nullable=true

		,name="INSERT_CHECK"
	)
    public Boolean getInsertCheck() {
        return null == insertCheck ? false : insertCheck;
    }
	/**
	 * 设置插入标记.
	 * @param insertCheck 插入标记
	 */
    public void setInsertCheck(Boolean insertCheck) {
        this.insertCheck = insertCheck;
    }
	/**
	 * 获取信号源Id.
	 * 
	 * @return 信号源Id
	 */
	@Column(nullable=true

		,name="ORIGINAL_SIGNAL_ID"
	)
    public Long getOriginalSignalId() {
        return originalSignalId;
    }
	/**
	 * 设置信号源Id.
	 * @param originalSignalId 信号源Id
	 */
    public void setOriginalSignalId(Long originalSignalId) {
        this.originalSignalId = originalSignalId;
    }
	/**
	 * 获取处理标记.
	 * 
	 * @return 处理标记
	 */
	@Column(nullable=true

		,name="PROCESSED"
	)
    public Boolean getProcessed() {
        return null == processed ? false : processed;
    }
	/**
	 * 设置处理标记.
	 * @param processed 处理标记
	 */
    public void setProcessed(Boolean processed) {
        this.processed = processed;
    }
	/**
	 * 获取原料批号.
	 * 
	 * @return 原料批号
	 */
	@Column(nullable=true

		,length = 256
		,name="PURCHASE_CODE"
	)
    public String getPurchaseCode() {
        return purchaseCode;
    }
	/**
	 * 设置原料批号.
	 * @param purchaseCode 原料批号
	 */
    public void setPurchaseCode(String purchaseCode) {
        this.purchaseCode = purchaseCode;
    }
	/**
	 * 获取质量变化.
	 * 
	 * @return 质量变化
	 */
	@Column(nullable=true

		,length = 50
		,name="QC"
	)
    public String getQc() {
        return qc;
    }
	/**
	 * 设置质量变化.
	 * @param qc 质量变化
	 */
    public void setQc(String qc) {
        this.qc = qc;
    }
	/**
	 * 获取来源.
	 * 
	 * @return 来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="SIGNAL_SOURCE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getSignalSource() {
		return signalSource;
	}
	/**
	 * 设置来源.
	 * @param signalSource 来源
	 */
	public void setSignalSource(SystemCode signalSource) {
		this.signalSource = (SystemCode) signalSource;
	}
	/**
	 * 获取位号.
	 * 
	 * @return 位号
	 */
	@Column(nullable=true

		,length = 200
		,name="TAG"
	)
    public String getTag() {
        return tag;
    }
	/**
	 * 设置位号.
	 * @param tag 位号
	 */
    public void setTag(String tag) {
        this.tag = tag;
    }
	/**
	 * 获取位号值.
	 * 
	 * @return 位号值
	 */
	@Column(nullable=true

		,length = 500
		,name="TVALUE"
	)
    public String getTvalue() {
        return tvalue;
    }
	/**
	 * 设置位号值.
	 * @param tvalue 位号值
	 */
    public void setTvalue(String tvalue) {
        this.tvalue = tvalue;
    }
	
	
	protected String _getEntityName() {
		return MESBasicBatchData.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_batchDataHandler_BatchData,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
