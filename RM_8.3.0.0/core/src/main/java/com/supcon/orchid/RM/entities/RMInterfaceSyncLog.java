package com.supcon.orchid.RM.entities;

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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 接口同步日志.
 */
@javax.persistence.Entity(name=RMInterfaceSyncLog.JPA_NAME)
@Table(name = RMInterfaceSyncLog.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_interfaceService")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_interfaceService_InterfaceSyncLog")
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
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMInterfaceSyncLogConvertor.class})
public class RMInterfaceSyncLog extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_interfaceService";
	public static final String MODEL_CODE = "RM_7.5.0.0_interfaceService_InterfaceSyncLog";
	public static final String DOC_TYPE = "RM_interfaceService_interfaceSyncLog";
	public static final String TABLE_NAME = "interface_sync_log";
	public static final String JPA_NAME = "RMInterfaceSyncLog";


		private String logBillNo ; // 单据编号

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date logDate ; // 同步时间


		private String logFault ; // 同步信息


		private String logID ; // 数据PK值


		private Boolean logIsIgnore = false; // 是否忽视


		private String logOperate ; // 操作类型
	private Staff logStaff;


		private Boolean logSynFlag = false; // 数据同步状态


		private String logType ; // 数据类型


		private String logTypeDes ; // 数据类型描述
	
	
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
	 * 获取单据编号.
	 * 
	 * @return 单据编号
	 */
	@Column(nullable=true

		,length = 256
		,name="LOG_BILL_NO"
	)
    public String getLogBillNo() {
        return logBillNo;
    }
	/**
	 * 设置单据编号.
	 * @param logBillNo 单据编号
	 */
    public void setLogBillNo(String logBillNo) {
        this.logBillNo = logBillNo;
    }
	/**
	 * 获取同步时间.
	 * 
	 * @return 同步时间
	 */
	@Column(nullable=true

		,name="LOG_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getLogDate() {
        return logDate;
    }
	/**
	 * 设置同步时间.
	 * @param logDate 同步时间
	 */
    public void setLogDate(java.util.Date logDate) {
        this.logDate = logDate;
    }
	/**
	 * 获取同步信息.
	 * 
	 * @return 同步信息
	 */
	@Column(nullable=true

		,length = 2000
		,name="LOG_FAULT"
	)
    public String getLogFault() {
        return logFault;
    }
	/**
	 * 设置同步信息.
	 * @param logFault 同步信息
	 */
    public void setLogFault(String logFault) {
        this.logFault = logFault;
    }
	/**
	 * 获取数据PK值.
	 * 
	 * @return 数据PK值
	 */
	@Column(

		length = 256
		,name="LOGID"
	)
    public String getLogID() {
        return logID;
    }
	/**
	 * 设置数据PK值.
	 * @param logID 数据PK值
	 */
    public void setLogID(String logID) {
        this.logID = logID;
    }
	/**
	 * 获取是否忽视.
	 * 
	 * @return 是否忽视
	 */
	@Column(

		name="LOG_IS_IGNORE"
	)
    public Boolean getLogIsIgnore() {
        return null == logIsIgnore ? false : logIsIgnore;
    }
	/**
	 * 设置是否忽视.
	 * @param logIsIgnore 是否忽视
	 */
    public void setLogIsIgnore(Boolean logIsIgnore) {
        this.logIsIgnore = logIsIgnore;
    }
	/**
	 * 获取操作类型.
	 * 
	 * @return 操作类型
	 */
	@Column(nullable=true

		,length = 256
		,name="LOG_OPERATE"
	)
    public String getLogOperate() {
        return logOperate;
    }
	/**
	 * 设置操作类型.
	 * @param logOperate 操作类型
	 */
    public void setLogOperate(String logOperate) {
        this.logOperate = logOperate;
    }
	@OneToOne
	@JoinColumn(name = "LOG_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	
						
    public Staff getLogStaff() {
        return logStaff;
    }
    public void setLogStaff(Staff logStaff) {
        this.logStaff = logStaff;
    }
	/**
	 * 获取数据同步状态.
	 * 
	 * @return 数据同步状态
	 */
	@Column(

		name="LOG_SYN_FLAG"
	)
    public Boolean getLogSynFlag() {
        return null == logSynFlag ? false : logSynFlag;
    }
	/**
	 * 设置数据同步状态.
	 * @param logSynFlag 数据同步状态
	 */
    public void setLogSynFlag(Boolean logSynFlag) {
        this.logSynFlag = logSynFlag;
    }
	/**
	 * 获取数据类型.
	 * 
	 * @return 数据类型
	 */
	@Column(

		length = 256
		,name="LOG_TYPE"
	)
    public String getLogType() {
        return logType;
    }
	/**
	 * 设置数据类型.
	 * @param logType 数据类型
	 */
    public void setLogType(String logType) {
        this.logType = logType;
    }
	/**
	 * 获取数据类型描述.
	 * 
	 * @return 数据类型描述
	 */
	@Column(nullable=true

		,length = 256
		,name="LOG_TYPE_DES"
	)
    public String getLogTypeDes() {
        return logTypeDes;
    }
	/**
	 * 设置数据类型描述.
	 * @param logTypeDes 数据类型描述
	 */
    public void setLogTypeDes(String logTypeDes) {
        this.logTypeDes = logTypeDes;
    }
	
	
	protected String _getEntityName() {
		return RMInterfaceSyncLog.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
