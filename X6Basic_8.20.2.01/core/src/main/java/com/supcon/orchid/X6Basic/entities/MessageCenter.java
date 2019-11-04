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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 消息提醒.
 */
@javax.persistence.Entity(name=MessageCenter.JPA_NAME)
@Table(name = MessageCenter.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_messageManage")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_messageManage_MessageCenter")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_messageManage_MessageCenter,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MessageCenterConvertor.class})
public class MessageCenter extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_messageManage";
	public static final String MODEL_CODE = "X6Basic_1.0_messageManage_MessageCenter";
	public static final String DOC_TYPE = "X6Basic_messageManage_messageCenter";
	public static final String TABLE_NAME = "x6basic_message_centers";
	public static final String JPA_NAME = "MessageCenter";
	private Staff accepter;


		private String emailContent ; // 邮件提醒内容
	@BAPIsMainDisplay

		private String emailTitle ; // 邮件标题


		private String messageContent ; // 短信提醒内容


		private Long modelId ; // 实体ID


		private String pandionContent ; // Pandion提醒内容


		private String resModelCode ; // 关联模型CODE
	private Staff sender;


		private String stationContent ; // 站内信提醒内容

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date warnTime ; // 提醒时间
	
	
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
	
	@OneToOne
	@JoinColumn(name = "ACCEPTER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getAccepter() {
        return accepter;
    }
    public void setAccepter(Staff accepter) {
        this.accepter = accepter;
    }
	/**
	 * 获取邮件提醒内容.
	 * 
	 * @return 邮件提醒内容
	 */
	@Column(nullable=true

		,name="EMAIL_CONTENT"
	)
    @javax.persistence.Lob
    public String getEmailContent() {
        return emailContent;
    }
	/**
	 * 设置邮件提醒内容.
	 * @param emailContent 邮件提醒内容
	 */
    public void setEmailContent(String emailContent) {
        this.emailContent = emailContent;
    }
	/**
	 * 获取邮件标题.
	 * 
	 * @return 邮件标题
	 */
	@Column(nullable=true

		,length = 256
		,name="EMAIL_TITLE"
	)
    public String getEmailTitle() {
        return emailTitle;
    }
	/**
	 * 设置邮件标题.
	 * @param emailTitle 邮件标题
	 */
    public void setEmailTitle(String emailTitle) {
        this.emailTitle = emailTitle;
    }
	/**
	 * 获取短信提醒内容.
	 * 
	 * @return 短信提醒内容
	 */
	@Column(nullable=true

		,name="MESSAGE_CONTENT"
	)
    @javax.persistence.Lob
    public String getMessageContent() {
        return messageContent;
    }
	/**
	 * 设置短信提醒内容.
	 * @param messageContent 短信提醒内容
	 */
    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }
	/**
	 * 获取实体ID.
	 * 
	 * @return 实体ID
	 */
	@Column(nullable=true

		,name="MODEL_ID"
	)
    public Long getModelId() {
        return modelId;
    }
	/**
	 * 设置实体ID.
	 * @param modelId 实体ID
	 */
    public void setModelId(Long modelId) {
        this.modelId = modelId;
    }
	/**
	 * 获取Pandion提醒内容.
	 * 
	 * @return Pandion提醒内容
	 */
	@Column(nullable=true

		,name="PANDION_CONTENT"
	)
    @javax.persistence.Lob
    public String getPandionContent() {
        return pandionContent;
    }
	/**
	 * 设置Pandion提醒内容.
	 * @param pandionContent Pandion提醒内容
	 */
    public void setPandionContent(String pandionContent) {
        this.pandionContent = pandionContent;
    }
	/**
	 * 获取关联模型CODE.
	 * 
	 * @return 关联模型CODE
	 */
	@Column(nullable=true

		,length = 256
		,name="RES_MODEL_CODE"
	)
    public String getResModelCode() {
        return resModelCode;
    }
	/**
	 * 设置关联模型CODE.
	 * @param resModelCode 关联模型CODE
	 */
    public void setResModelCode(String resModelCode) {
        this.resModelCode = resModelCode;
    }
	@OneToOne
	@JoinColumn(name = "SENDER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getSender() {
        return sender;
    }
    public void setSender(Staff sender) {
        this.sender = sender;
    }
	/**
	 * 获取站内信提醒内容.
	 * 
	 * @return 站内信提醒内容
	 */
	@Column(nullable=true

		,name="STATION_CONTENT"
	)
    @javax.persistence.Lob
    public String getStationContent() {
        return stationContent;
    }
	/**
	 * 设置站内信提醒内容.
	 * @param stationContent 站内信提醒内容
	 */
    public void setStationContent(String stationContent) {
        this.stationContent = stationContent;
    }
	/**
	 * 获取提醒时间.
	 * 
	 * @return 提醒时间
	 */
	@Column(nullable=true

		,name="WARN_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getWarnTime() {
        return warnTime;
    }
	/**
	 * 设置提醒时间.
	 * @param warnTime 提醒时间
	 */
    public void setWarnTime(java.util.Date warnTime) {
        this.warnTime = warnTime;
    }
	
	
	protected String _getEntityName() {
		return MessageCenter.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_messageManage_MessageCenter,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
