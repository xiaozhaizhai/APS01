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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 同步配置项.
 */
@javax.persistence.Entity(name=X6BasicSyncConfigs.JPA_NAME)
@Table(name = X6BasicSyncConfigs.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_syncConfig")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_syncConfig_SyncConfigs")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicSyncConfigsConvertor.class})
public class X6BasicSyncConfigs extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_syncConfig";
	public static final String MODEL_CODE = "X6Basic_1.0_syncConfig_SyncConfigs";
	public static final String DOC_TYPE = "X6Basic_syncConfig_syncConfigs";
	public static final String TABLE_NAME = "x6basic_sync_configs";
	public static final String JPA_NAME = "X6BasicSyncConfigs";


		private String bbsAlias ; // 别名


		private String bbsDataSourse ; // 数据库连接


		private Boolean bbsDeleteSync = false; // 删除时是否同步


		private String bbsPassword ; // 密码


		private String bbsUserName ; // 用户名


		private String des ; // 备注


		private String emailDataSourse ; // 数据库连接


		private Boolean emailDelSync = false; // 删除时是否同步


		private String emailDomain ; // 邮件域名


		private String emailHomedir ; // 邮件服务器目录


		private String emailMaildir ; // 邮件存放目录


		private String emailPassword ; // 密码


		private String emailUserName ; // 用户名


		private String pandionDataSourse ; // 数据库连接


		private Boolean pandionDelSync = false; // 删除时是否同步


		private String pandionPassword ; // 密码


		private String pandionUserName ; // 用户名


		private Boolean syncBBSFlag = false; // 同步BBS账户


		private Boolean syncEmailFlag = false; // 同步邮件账户


		private Boolean syncPandionFlag = false; // 同步聊天工具账户
	
	
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
	 * 获取别名.
	 * 
	 * @return 别名
	 */
	@Column(nullable=true

		,length = 255
		,name="BBS_ALIAS"
	)
    public String getBbsAlias() {
        return bbsAlias;
    }
	/**
	 * 设置别名.
	 * @param bbsAlias 别名
	 */
    public void setBbsAlias(String bbsAlias) {
        this.bbsAlias = bbsAlias;
    }
	/**
	 * 获取数据库连接.
	 * 
	 * @return 数据库连接
	 */
	@Column(nullable=true

		,length = 800
		,name="BBS_DATA_SOURSE"
	)
    public String getBbsDataSourse() {
        return bbsDataSourse;
    }
	/**
	 * 设置数据库连接.
	 * @param bbsDataSourse 数据库连接
	 */
    public void setBbsDataSourse(String bbsDataSourse) {
        this.bbsDataSourse = bbsDataSourse;
    }
	/**
	 * 获取删除时是否同步.
	 * 
	 * @return 删除时是否同步
	 */
	@Column(nullable=true

		,name="BBS_DELETE_SYNC"
	)
    public Boolean getBbsDeleteSync() {
        return null == bbsDeleteSync ? false : bbsDeleteSync;
    }
	/**
	 * 设置删除时是否同步.
	 * @param bbsDeleteSync 删除时是否同步
	 */
    public void setBbsDeleteSync(Boolean bbsDeleteSync) {
        this.bbsDeleteSync = bbsDeleteSync;
    }
	/**
	 * 获取密码.
	 * 
	 * @return 密码
	 */
	@Column(nullable=true

		,name="BBS_PASSWORD"
	)
    public String getBbsPassword() {
        return bbsPassword;
    }
	/**
	 * 设置密码.
	 * @param bbsPassword 密码
	 */
    public void setBbsPassword(String bbsPassword) {
        this.bbsPassword = bbsPassword;
    }
	/**
	 * 获取用户名.
	 * 
	 * @return 用户名
	 */
	@Column(nullable=true

		,length = 200
		,name="BBS_USER_NAME"
	)
    public String getBbsUserName() {
        return bbsUserName;
    }
	/**
	 * 设置用户名.
	 * @param bbsUserName 用户名
	 */
    public void setBbsUserName(String bbsUserName) {
        this.bbsUserName = bbsUserName;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="DES"
	)
    public String getDes() {
        return des;
    }
	/**
	 * 设置备注.
	 * @param des 备注
	 */
    public void setDes(String des) {
        this.des = des;
    }
	/**
	 * 获取数据库连接.
	 * 
	 * @return 数据库连接
	 */
	@Column(nullable=true

		,length = 800
		,name="EMAIL_DATA_SOURSE"
	)
    public String getEmailDataSourse() {
        return emailDataSourse;
    }
	/**
	 * 设置数据库连接.
	 * @param emailDataSourse 数据库连接
	 */
    public void setEmailDataSourse(String emailDataSourse) {
        this.emailDataSourse = emailDataSourse;
    }
	/**
	 * 获取删除时是否同步.
	 * 
	 * @return 删除时是否同步
	 */
	@Column(nullable=true

		,name="EMAIL_DEL_SYNC"
	)
    public Boolean getEmailDelSync() {
        return null == emailDelSync ? false : emailDelSync;
    }
	/**
	 * 设置删除时是否同步.
	 * @param emailDelSync 删除时是否同步
	 */
    public void setEmailDelSync(Boolean emailDelSync) {
        this.emailDelSync = emailDelSync;
    }
	/**
	 * 获取邮件域名.
	 * 
	 * @return 邮件域名
	 */
	@Column(nullable=true

		,length = 400
		,name="EMAIL_DOMAIN"
	)
    public String getEmailDomain() {
        return emailDomain;
    }
	/**
	 * 设置邮件域名.
	 * @param emailDomain 邮件域名
	 */
    public void setEmailDomain(String emailDomain) {
        this.emailDomain = emailDomain;
    }
	/**
	 * 获取邮件服务器目录.
	 * 
	 * @return 邮件服务器目录
	 */
	@Column(nullable=true

		,length = 400
		,name="EMAIL_HOMEDIR"
	)
    public String getEmailHomedir() {
        return emailHomedir;
    }
	/**
	 * 设置邮件服务器目录.
	 * @param emailHomedir 邮件服务器目录
	 */
    public void setEmailHomedir(String emailHomedir) {
        this.emailHomedir = emailHomedir;
    }
	/**
	 * 获取邮件存放目录.
	 * 
	 * @return 邮件存放目录
	 */
	@Column(nullable=true

		,length = 400
		,name="EMAIL_MAILDIR"
	)
    public String getEmailMaildir() {
        return emailMaildir;
    }
	/**
	 * 设置邮件存放目录.
	 * @param emailMaildir 邮件存放目录
	 */
    public void setEmailMaildir(String emailMaildir) {
        this.emailMaildir = emailMaildir;
    }
	/**
	 * 获取密码.
	 * 
	 * @return 密码
	 */
	@Column(nullable=true
		,length=400

		,name="EMAIL_PASSWORD"
	)
    public String getEmailPassword() {
        return emailPassword;
    }
	/**
	 * 设置密码.
	 * @param emailPassword 密码
	 */
    public void setEmailPassword(String emailPassword) {
        this.emailPassword = emailPassword;
    }
	/**
	 * 获取用户名.
	 * 
	 * @return 用户名
	 */
	@Column(nullable=true

		,length = 400
		,name="EMAIL_USER_NAME"
	)
    public String getEmailUserName() {
        return emailUserName;
    }
	/**
	 * 设置用户名.
	 * @param emailUserName 用户名
	 */
    public void setEmailUserName(String emailUserName) {
        this.emailUserName = emailUserName;
    }
	/**
	 * 获取数据库连接.
	 * 
	 * @return 数据库连接
	 */
	@Column(nullable=true

		,length = 800
		,name="PANDION_DATA_SOURSE"
	)
    public String getPandionDataSourse() {
        return pandionDataSourse;
    }
	/**
	 * 设置数据库连接.
	 * @param pandionDataSourse 数据库连接
	 */
    public void setPandionDataSourse(String pandionDataSourse) {
        this.pandionDataSourse = pandionDataSourse;
    }
	/**
	 * 获取删除时是否同步.
	 * 
	 * @return 删除时是否同步
	 */
	@Column(nullable=true

		,name="PANDION_DEL_SYNC"
	)
    public Boolean getPandionDelSync() {
        return null == pandionDelSync ? false : pandionDelSync;
    }
	/**
	 * 设置删除时是否同步.
	 * @param pandionDelSync 删除时是否同步
	 */
    public void setPandionDelSync(Boolean pandionDelSync) {
        this.pandionDelSync = pandionDelSync;
    }
	/**
	 * 获取密码.
	 * 
	 * @return 密码
	 */
	@Column(nullable=true
		,length=400

		,name="PANDION_PASSWORD"
	)
    public String getPandionPassword() {
        return pandionPassword;
    }
	/**
	 * 设置密码.
	 * @param pandionPassword 密码
	 */
    public void setPandionPassword(String pandionPassword) {
        this.pandionPassword = pandionPassword;
    }
	/**
	 * 获取用户名.
	 * 
	 * @return 用户名
	 */
	@Column(nullable=true

		,length = 400
		,name="PANDION_USER_NAME"
	)
    public String getPandionUserName() {
        return pandionUserName;
    }
	/**
	 * 设置用户名.
	 * @param pandionUserName 用户名
	 */
    public void setPandionUserName(String pandionUserName) {
        this.pandionUserName = pandionUserName;
    }
	/**
	 * 获取同步BBS账户.
	 * 
	 * @return 同步BBS账户
	 */
	@Column(nullable=true

		,name="SYNCBBSFLAG"
	)
    public Boolean getSyncBBSFlag() {
        return null == syncBBSFlag ? false : syncBBSFlag;
    }
	/**
	 * 设置同步BBS账户.
	 * @param syncBBSFlag 同步BBS账户
	 */
    public void setSyncBBSFlag(Boolean syncBBSFlag) {
        this.syncBBSFlag = syncBBSFlag;
    }
	/**
	 * 获取同步邮件账户.
	 * 
	 * @return 同步邮件账户
	 */
	@Column(nullable=true

		,name="SYNC_EMAIL_FLAG"
	)
    public Boolean getSyncEmailFlag() {
        return null == syncEmailFlag ? false : syncEmailFlag;
    }
	/**
	 * 设置同步邮件账户.
	 * @param syncEmailFlag 同步邮件账户
	 */
    public void setSyncEmailFlag(Boolean syncEmailFlag) {
        this.syncEmailFlag = syncEmailFlag;
    }
	/**
	 * 获取同步聊天工具账户.
	 * 
	 * @return 同步聊天工具账户
	 */
	@Column(nullable=true

		,name="SYNC_PANDION_FLAG"
	)
    public Boolean getSyncPandionFlag() {
        return null == syncPandionFlag ? false : syncPandionFlag;
    }
	/**
	 * 设置同步聊天工具账户.
	 * @param syncPandionFlag 同步聊天工具账户
	 */
    public void setSyncPandionFlag(Boolean syncPandionFlag) {
        this.syncPandionFlag = syncPandionFlag;
    }
	
	
	protected String _getEntityName() {
		return X6BasicSyncConfigs.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
