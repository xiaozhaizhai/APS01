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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 排班计划.
 */
@javax.persistence.Entity(name=X6BasicRangePlan.JPA_NAME)
@Table(name = X6BasicRangePlan.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_rangePlan")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_rangePlan_RangePlan")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "RP_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicRangePlanConvertor.class})
public class X6BasicRangePlan extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_rangePlan";
	public static final String MODEL_CODE = "X6Basic_1.0_rangePlan_RangePlan";
	public static final String DOC_TYPE = "X6Basic_rangePlan_rangePlan";
	public static final String TABLE_NAME = "s2base_rangeplan";
	public static final String JPA_NAME = "X6BasicRangePlan";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date beginDate ; // 生效日期

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endDate ; // 失效日期

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date rangeDate ; // 排班日期
	private Staff rangeStaff;


		private String rpMemo ; // 备注
	private X6BasicSpellRule spellRule;


		private Boolean state = false; // 启用
	@BAPSeniorSystemCode(code="WorkArea")
	private String workLine
; // 生产线
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
	 * 获取生效日期.
	 * 
	 * @return 生效日期
	 */
	@Column(nullable=true

		,name="RP_BEGINDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getBeginDate() {
        return beginDate;
    }
	/**
	 * 设置生效日期.
	 * @param beginDate 生效日期
	 */
    public void setBeginDate(java.util.Date beginDate) {
        this.beginDate = beginDate;
    }
	/**
	 * 获取失效日期.
	 * 
	 * @return 失效日期
	 */
	@Column(nullable=true

		,name="RP_ENDDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getEndDate() {
        return endDate;
    }
	/**
	 * 设置失效日期.
	 * @param endDate 失效日期
	 */
    public void setEndDate(java.util.Date endDate) {
        this.endDate = endDate;
    }
	/**
	 * 获取排班日期.
	 * 
	 * @return 排班日期
	 */
	@Column(

		name="RP_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getRangeDate() {
        return rangeDate;
    }
	/**
	 * 设置排班日期.
	 * @param rangeDate 排班日期
	 */
    public void setRangeDate(java.util.Date rangeDate) {
        this.rangeDate = rangeDate;
    }
	@OneToOne
	@JoinColumn(name = "RP_RANGEID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getRangeStaff() {
        return rangeStaff;
    }
    public void setRangeStaff(Staff rangeStaff) {
        this.rangeStaff = rangeStaff;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="RP_MEMO"
	)
    @javax.persistence.Lob
    public String getRpMemo() {
        return rpMemo;
    }
	/**
	 * 设置备注.
	 * @param rpMemo 备注
	 */
    public void setRpMemo(String rpMemo) {
        this.rpMemo = rpMemo;
    }
	@OneToOne
	@JoinColumn(name = "RP_RULEID", referencedColumnName="SR_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicSpellRule getSpellRule() {
        return spellRule;
    }
    public void setSpellRule(X6BasicSpellRule spellRule) {
        this.spellRule = spellRule;
    }
	/**
	 * 获取启用.
	 * 
	 * @return 启用
	 */
	@Column(nullable=true

		,name="RP_STATE"
	)
    public Boolean getState() {
        return null == state ? false : state;
    }
	/**
	 * 设置启用.
	 * @param state 启用
	 */
    public void setState(Boolean state) {
        this.state = state;
    }
	/**
	 * 获取生产线.
	 * 
	 * @return 生产线
	 */
	@Column(name="RP_WORKLINE")
	public String getWorkLine() {
		return workLine;
	}
	/**
	 * 设置生产线.
	 * @param workLine 生产线
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
		return X6BasicRangePlan.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
