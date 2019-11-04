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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 班组.
 */
@javax.persistence.Entity(name=X6BasicTeamInfo.JPA_NAME)
@Table(name = X6BasicTeamInfo.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_teamManage")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_teamManage_TeamInfo")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "TEAM_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicTeamInfoConvertor.class})
public class X6BasicTeamInfo extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_teamManage";
	public static final String MODEL_CODE = "X6Basic_1.0_teamManage_TeamInfo";
	public static final String DOC_TYPE = "X6Basic_teamManage_teamInfo";
	public static final String TABLE_NAME = "s2base_teaminfo";
	public static final String JPA_NAME = "X6BasicTeamInfo";


		private String code ; // 班组编码

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date createDate ; // 成立日期
	private Department dept;
	@BAPIsMainDisplay

		private String name ; // 班组名称
	private Staff principal;


		private Boolean state = false; // 状态


		private String teamMemo ; // 备注
	@BAPSeniorSystemCode(code="WorkArea")
	private String workLine
; // 作业区
	private String workLineForDisplay;
	
	
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
	 * 获取班组编码.
	 * 
	 * @return 班组编码
	 */
	@Column(unique=true

		,length = 256
		,name="TEAM_CODE"
	)
	@Index(name="index_TeamInfo_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置班组编码.
	 * @param code 班组编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取成立日期.
	 * 
	 * @return 成立日期
	 */
	@Column(nullable=true

		,name="TEAM_CREATEDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getCreateDate() {
        return createDate;
    }
	/**
	 * 设置成立日期.
	 * @param createDate 成立日期
	 */
    public void setCreateDate(java.util.Date createDate) {
        this.createDate = createDate;
    }
	@OneToOne
	@JoinColumn(name = "TEAM_DEPTID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getDept() {
        return dept;
    }
    public void setDept(Department dept) {
        this.dept = dept;
    }
	/**
	 * 获取班组名称.
	 * 
	 * @return 班组名称
	 */
	@Column(

		length = 256
		,name="TEAM_NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置班组名称.
	 * @param name 班组名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	@OneToOne
	@JoinColumn(name = "TEAM_PRINCIPAL", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getPrincipal() {
        return principal;
    }
    public void setPrincipal(Staff principal) {
        this.principal = principal;
    }
	/**
	 * 获取状态.
	 * 
	 * @return 状态
	 */
	@Column(nullable=true

		,name="TEAM_STATE"
	)
    public Boolean getState() {
        return null == state ? false : state;
    }
	/**
	 * 设置状态.
	 * @param state 状态
	 */
    public void setState(Boolean state) {
        this.state = state;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="TEAM_MEMO"
	)
    @javax.persistence.Lob
    public String getTeamMemo() {
        return teamMemo;
    }
	/**
	 * 设置备注.
	 * @param teamMemo 备注
	 */
    public void setTeamMemo(String teamMemo) {
        this.teamMemo = teamMemo;
    }
	/**
	 * 获取作业区.
	 * 
	 * @return 作业区
	 */
	@Column(name="TEAM_WORKLINE")
	public String getWorkLine() {
		return workLine;
	}
	/**
	 * 设置作业区.
	 * @param workLine 作业区
	 */
	public void setWorkLine(String workLine) {
		this.workLine = workLine;
	}
	
	@javax.persistence.Transient
	public String getWorkLineForDisplay() {
		return workLineForDisplay;
	}
	
	public void setWorkLineForDisplay(String workLineForDisplay) {
		this.workLineForDisplay = workLineForDisplay;
	}
	
	
	protected String _getEntityName() {
		return X6BasicTeamInfo.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
