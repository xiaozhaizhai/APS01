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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 邮件服务器.
 */
@javax.persistence.Entity(name=X6BasicMailServer.JPA_NAME)
@Table(name = X6BasicMailServer.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_mailServer")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_mailServer_MailServer")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicMailServerConvertor.class})
public class X6BasicMailServer extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_mailServer";
	public static final String MODEL_CODE = "X6Basic_1.0_mailServer_MailServer";
	public static final String DOC_TYPE = "X6Basic_mailServer_mailServer";
	public static final String TABLE_NAME = "x6basic_mail_servers";
	public static final String JPA_NAME = "X6BasicMailServer";


		private String code ; // 编号


		private String dbMemo ; // 备注


		private String dbName ; // 数据库名称
	private SystemCode dbType
; // 数据库类型


		private Boolean isLocal = false; // 本地数据库
	@BAPIsMainDisplay

		private String name ; // 名称


		private String psw ; // 密码


		private String url ; // 数据库地址


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
	 * 获取编号.
	 * 
	 * @return 编号
	 */
	@Column(

		length = 256
		,name="CODE"
	)
	@Index(name="index_MailServer_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置编号.
	 * @param code 编号
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="DB_MEMO"
	)
    @javax.persistence.Lob
    public String getDbMemo() {
        return dbMemo;
    }
	/**
	 * 设置备注.
	 * @param dbMemo 备注
	 */
    public void setDbMemo(String dbMemo) {
        this.dbMemo = dbMemo;
    }
	/**
	 * 获取数据库名称.
	 * 
	 * @return 数据库名称
	 */
	@Column(nullable=true

		,length = 256
		,name="DB_NAME"
	)
    public String getDbName() {
        return dbName;
    }
	/**
	 * 设置数据库名称.
	 * @param dbName 数据库名称
	 */
    public void setDbName(String dbName) {
        this.dbName = dbName;
    }
	/**
	 * 获取数据库类型.
	 * 
	 * @return 数据库类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DB_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDbType() {
		return dbType;
	}
	/**
	 * 设置数据库类型.
	 * @param dbType 数据库类型
	 */
	public void setDbType(SystemCode dbType) {
		this.dbType = (SystemCode) dbType;
	}
	/**
	 * 获取本地数据库.
	 * 
	 * @return 本地数据库
	 */
	@Column(nullable=true

		,name="IS_LOCAL"
	)
    public Boolean getIsLocal() {
        return null == isLocal ? false : isLocal;
    }
	/**
	 * 设置本地数据库.
	 * @param isLocal 本地数据库
	 */
    public void setIsLocal(Boolean isLocal) {
        this.isLocal = isLocal;
    }
	/**
	 * 获取名称.
	 * 
	 * @return 名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置名称.
	 * @param name 名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取密码.
	 * 
	 * @return 密码
	 */
	@Column(nullable=true

		,name="PSW"
	)
    public String getPsw() {
        return psw;
    }
	/**
	 * 设置密码.
	 * @param psw 密码
	 */
    public void setPsw(String psw) {
        this.psw = psw;
    }
	/**
	 * 获取数据库地址.
	 * 
	 * @return 数据库地址
	 */
	@Column(nullable=true

		,length = 256
		,name="URL"
	)
    public String getUrl() {
        return url;
    }
	/**
	 * 设置数据库地址.
	 * @param url 数据库地址
	 */
    public void setUrl(String url) {
        this.url = url;
    }
	/**
	 * 获取用户名.
	 * 
	 * @return 用户名
	 */
	@Column(nullable=true

		,length = 256
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
		return X6BasicMailServer.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
