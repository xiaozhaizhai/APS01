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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.User;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 印章管理.
 */
@javax.persistence.Entity(name=SignetSetting.JPA_NAME)
@Table(name = SignetSetting.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_signetManage")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_signetManage_SignetSetting")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({SignetSettingConvertor.class})
public class SignetSetting extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_signetManage";
	public static final String MODEL_CODE = "X6Basic_1.0_signetManage_SignetSetting";
	public static final String DOC_TYPE = "X6Basic_signetManage_signetSetting";
	public static final String TABLE_NAME = "x6basic_signet_settings";
	public static final String JPA_NAME = "SignetSetting";


		private String checkPassword ; // 确认口令
	@BAPIsMainDisplay

		private String name ; // 名称


		private String password ; // 口令
	private SystemCode singetType
; // 类别
	@BAPPicture
	private String url; // 图片路径
	
	private Document urlDocument;
	private User userinfo;


		private String userName ; // 用户
	
	
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
	 * 获取确认口令.
	 * 
	 * @return 确认口令
	 */
	@Column(nullable=true
		,length=256

		,name="CHECK_PASSWORD"
	)
    public String getCheckPassword() {
        return checkPassword;
    }
	/**
	 * 设置确认口令.
	 * @param checkPassword 确认口令
	 */
    public void setCheckPassword(String checkPassword) {
        this.checkPassword = checkPassword;
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
	 * 获取口令.
	 * 
	 * @return 口令
	 */
	@Column(nullable=true

		,length = 256
		,name="PASSWORD"
	)
    public String getPassword() {
        return password;
    }
	/**
	 * 设置口令.
	 * @param password 口令
	 */
    public void setPassword(String password) {
        this.password = password;
    }
	/**
	 * 获取类别.
	 * 
	 * @return 类别
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="SINGET_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getSingetType() {
		return singetType;
	}
	/**
	 * 设置类别.
	 * @param singetType 类别
	 */
	public void setSingetType(SystemCode singetType) {
		this.singetType = (SystemCode) singetType;
	}
	/**
	 * 获取图片路径.
	 * 
	 * @return 图片路径
	 */
	@Column(name="URL")
	public String getUrl() {
		return url;
	}
	/**
	 * 设置图片路径.
	 * @param url 图片路径
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	@javax.persistence.Transient
	public Document getUrlDocument() {
		return urlDocument;
	}
	
	public void setUrlDocument(Document urlDocument) {
		this.urlDocument = urlDocument;
	}
	
	@OneToOne
	@JoinColumn(name = "USERINFO", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public User getUserinfo() {
        return userinfo;
    }
    public void setUserinfo(User userinfo) {
        this.userinfo = userinfo;
    }
	/**
	 * 获取用户.
	 * 
	 * @return 用户
	 */
	@Column(nullable=true

		,length = 256
		,name="USER_NAME"
	)
    public String getUserName() {
        return userName;
    }
	/**
	 * 设置用户.
	 * @param userName 用户
	 */
    public void setUserName(String userName) {
        this.userName = userName;
    }
	
	
	protected String _getEntityName() {
		return SignetSetting.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
