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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 会计期.
 */
@javax.persistence.Entity(name=X6BasicAccountPeriod.JPA_NAME)
@Table(name = X6BasicAccountPeriod.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_accountingPeriod")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_accountingPeriod_AccountPeriod")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicAccountPeriodConvertor.class})
public class X6BasicAccountPeriod extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_accountingPeriod";
	public static final String MODEL_CODE = "X6Basic_1.0_accountingPeriod_AccountPeriod";
	public static final String DOC_TYPE = "X6Basic_accountingPeriod_accountPeriod";
	public static final String TABLE_NAME = "x6basic_account_periods";
	public static final String JPA_NAME = "X6BasicAccountPeriod";
	private SystemCode year
; // 年度
	
	private List<X6BasicAccountPeriodPart> accountPeriodPartList;
	
	public void setAccountPeriodPartList(List<X6BasicAccountPeriodPart> accountPeriodPartList){
		this.accountPeriodPartList = accountPeriodPartList;
	}
	@Transient
	public List<X6BasicAccountPeriodPart> getAccountPeriodPartList(){
		return accountPeriodPartList;
	}
	
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
	 * 获取年度.
	 * 
	 * @return 年度
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="YEAR", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getYear() {
		return year;
	}
	/**
	 * 设置年度.
	 * @param year 年度
	 */
	public void setYear(SystemCode year) {
		this.year = (SystemCode) year;
	}
	
	
	protected String _getEntityName() {
		return X6BasicAccountPeriod.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码
	private java.util.Date startDate ; // 开始日期
	private java.util.Date endDate ; // 结束日期
	/**
	 * 获取结束日期.
	 * 
	 * @return 结束日期
	 */
	@javax.persistence.Transient
    public java.util.Date getEndDate() {
        return endDate;
    }
	/**
	 * 设置结束日期.
	 * @param endDate 结束日期
	 */
    public void setEndDate(java.util.Date endDate) {
        this.endDate = endDate;
    }
    /**
	 * 获取开始日期.
	 * 
	 * @return 开始日期
	 */
    @javax.persistence.Transient
    public java.util.Date getStartDate() {
        return startDate;
    }
	/**
	 * 设置开始日期.
	 * @param startDate 开始日期
	 */
    public void setStartDate(java.util.Date startDate) {
        this.startDate = startDate;
    }
/* CUSTOM CODE END */
}
