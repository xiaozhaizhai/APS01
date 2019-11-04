package com.supcon.orchid.X6Basic.entities;

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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 同步日志表.
 */
@javax.persistence.Entity(name=X6BasicSyncLog.JPA_NAME)
@Table(name = X6BasicSyncLog.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_syncLog")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_syncLog_SyncLog")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_syncLog_SyncLog,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicSyncLogConvertor.class})
public class X6BasicSyncLog extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_syncLog";
	public static final String MODEL_CODE = "X6Basic_1.0_syncLog_SyncLog";
	public static final String DOC_TYPE = "X6Basic_syncLog_syncLog";
	public static final String TABLE_NAME = "x6basic_sync_logs";
	public static final String JPA_NAME = "X6BasicSyncLog";


		private Boolean bbsFlag = false; // 同步bbs账号失败


		private Boolean emailFlag = false; // 同步邮件失败
	@BAPIsMainDisplay

		private String eventTopic ; // topic


		private String log ; // 日志


		private Boolean pandionFlag = false; // 同步pandion失败


		private String syncPassword ; // 同步密码
	private Staff syncStaff;


		private String userName ; // 用户名
	
	
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
	 * 获取同步bbs账号失败.
	 * 
	 * @return 同步bbs账号失败
	 */
	@Column(nullable=true

		,name="BBS_FLAG"
	)
    public Boolean getBbsFlag() {
        return null == bbsFlag ? false : bbsFlag;
    }
	/**
	 * 设置同步bbs账号失败.
	 * @param bbsFlag 同步bbs账号失败
	 */
    public void setBbsFlag(Boolean bbsFlag) {
        this.bbsFlag = bbsFlag;
    }
	/**
	 * 获取同步邮件失败.
	 * 
	 * @return 同步邮件失败
	 */
	@Column(nullable=true

		,name="EMAIL_FLAG"
	)
    public Boolean getEmailFlag() {
        return null == emailFlag ? false : emailFlag;
    }
	/**
	 * 设置同步邮件失败.
	 * @param emailFlag 同步邮件失败
	 */
    public void setEmailFlag(Boolean emailFlag) {
        this.emailFlag = emailFlag;
    }
	/**
	 * 获取topic.
	 * 
	 * @return topic
	 */
	@Column(nullable=true

		,length = 400
		,name="EVENT_TOPIC"
	)
    public String getEventTopic() {
        return eventTopic;
    }
	/**
	 * 设置topic.
	 * @param eventTopic topic
	 */
    public void setEventTopic(String eventTopic) {
        this.eventTopic = eventTopic;
    }
	/**
	 * 获取日志.
	 * 
	 * @return 日志
	 */
	@Column(nullable=true

		,name="LOG"
	)
    @javax.persistence.Lob
    public String getLog() {
        return log;
    }
	/**
	 * 设置日志.
	 * @param log 日志
	 */
    public void setLog(String log) {
        this.log = log;
    }
	/**
	 * 获取同步pandion失败.
	 * 
	 * @return 同步pandion失败
	 */
	@Column(nullable=true

		,name="PANDION_FLAG"
	)
    public Boolean getPandionFlag() {
        return null == pandionFlag ? false : pandionFlag;
    }
	/**
	 * 设置同步pandion失败.
	 * @param pandionFlag 同步pandion失败
	 */
    public void setPandionFlag(Boolean pandionFlag) {
        this.pandionFlag = pandionFlag;
    }
	/**
	 * 获取同步密码.
	 * 
	 * @return 同步密码
	 */
	@Column(nullable=true

		,length = 400
		,name="SYNC_PASSWORD"
	)
    public String getSyncPassword() {
        return syncPassword;
    }
	/**
	 * 设置同步密码.
	 * @param syncPassword 同步密码
	 */
    public void setSyncPassword(String syncPassword) {
        this.syncPassword = syncPassword;
    }
	@OneToOne
	@JoinColumn(name = "SYNC_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getSyncStaff() {
        return syncStaff;
    }
    public void setSyncStaff(Staff syncStaff) {
        this.syncStaff = syncStaff;
    }
	/**
	 * 获取用户名.
	 * 
	 * @return 用户名
	 */
	@Column(nullable=true

		,length = 200
		,name="USER_NAME"
	)
    public String getUserName() {
        return userName;
    }
	/**
	 * 设置用户名.
	 * @param userName 用户名
	 */
    public void setUserName(String userName) {
        this.userName = userName;
    }
	
	
	protected String _getEntityName() {
		return X6BasicSyncLog.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_syncLog_SyncLog,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
