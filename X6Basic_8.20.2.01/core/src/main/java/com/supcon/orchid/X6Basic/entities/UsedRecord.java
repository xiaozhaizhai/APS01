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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 会议室使用记录.
 */
@javax.persistence.Entity(name=UsedRecord.JPA_NAME)
@Table(name = UsedRecord.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_meetingroom")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_meetingroom_UsedRecord")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({UsedRecordConvertor.class})
public class UsedRecord extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_meetingroom";
	public static final String MODEL_CODE = "X6Basic_1.0_meetingroom_UsedRecord";
	public static final String DOC_TYPE = "X6Basic_meetingroom_usedRecord";
	public static final String TABLE_NAME = "x6basic_used_records";
	public static final String JPA_NAME = "UsedRecord";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 结束时间
	private MeetingRoom meeting;
	private Staff staff;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 开始时间


		private String title ; // 会议使用情况


		private String typeId ; // 使用对象id


		private String useType ; // 使用对象
	
	
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
	 * 获取结束时间.
	 * 
	 * @return 结束时间
	 */
	@Column(nullable=true

		,name="END_TIME"
	)
	@XmlTransient
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
	@ManyToOne
	@JoinColumn(name = "MEETING", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MeetingRoom getMeeting() {
        return meeting;
    }
    public void setMeeting(MeetingRoom meeting) {
        this.meeting = meeting;
    }
	@ManyToOne
	@JoinColumn(name = "STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getStaff() {
        return staff;
    }
    public void setStaff(Staff staff) {
        this.staff = staff;
    }
	/**
	 * 获取开始时间.
	 * 
	 * @return 开始时间
	 */
	@Column(nullable=true

		,name="START_TIME"
	)
	@XmlTransient
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
	 * 获取会议使用情况.
	 * 
	 * @return 会议使用情况
	 */
	@Column(nullable=true

		,length = 2000
		,name="TITLE"
	)
    public String getTitle() {
        return title;
    }
	/**
	 * 设置会议使用情况.
	 * @param title 会议使用情况
	 */
    public void setTitle(String title) {
        this.title = title;
    }
	/**
	 * 获取使用对象id.
	 * 
	 * @return 使用对象id
	 */
	@Column(

		length = 256
		,name="TYPE_ID"
	)
    public String getTypeId() {
        return typeId;
    }
	/**
	 * 设置使用对象id.
	 * @param typeId 使用对象id
	 */
    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }
	/**
	 * 获取使用对象.
	 * 
	 * @return 使用对象
	 */
	@Column(nullable=true

		,length = 256
		,name="USE_TYPE"
	)
    public String getUseType() {
        return useType;
    }
	/**
	 * 设置使用对象.
	 * @param useType 使用对象
	 */
    public void setUseType(String useType) {
        this.useType = useType;
    }
	
	
	protected String _getEntityName() {
		return UsedRecord.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
