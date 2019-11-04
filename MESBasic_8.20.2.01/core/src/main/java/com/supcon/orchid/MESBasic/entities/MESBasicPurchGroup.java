package com.supcon.orchid.MESBasic.entities;

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
 * 采购组.
 */
@javax.persistence.Entity(name=MESBasicPurchGroup.JPA_NAME)
@Table(name = MESBasicPurchGroup.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_purch_Group")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_purch_Group_PurchGroup")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "USERREPORT_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_purch_Group_PurchGroup,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicPurchGroupConvertor.class})
public class MESBasicPurchGroup extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_purch_Group";
	public static final String MODEL_CODE = "MESBasic_1_purch_Group_PurchGroup";
	public static final String DOC_TYPE = "MESBasic_purch_Group_purchGroup";
	public static final String TABLE_NAME = "s2base_userreport";
	public static final String JPA_NAME = "MESBasicPurchGroup";


		private String purchGroupMemo ; // 备注
	@BAPIsMainDisplay

		private String purchGroupName ; // 采购组名称


		private Long purchParamA ; // 列表过滤参数A


		private String purchUserReportState ; // 状态
	
	
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
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="USERREPORT_MEMO"
	)
    public String getPurchGroupMemo() {
        return purchGroupMemo;
    }
	/**
	 * 设置备注.
	 * @param purchGroupMemo 备注
	 */
    public void setPurchGroupMemo(String purchGroupMemo) {
        this.purchGroupMemo = purchGroupMemo;
    }
	/**
	 * 获取采购组名称.
	 * 
	 * @return 采购组名称
	 */
	@Column(nullable=true

		,length = 200
		,name="USERREPORT_PARAMC"
	)
    public String getPurchGroupName() {
        return purchGroupName;
    }
	/**
	 * 设置采购组名称.
	 * @param purchGroupName 采购组名称
	 */
    public void setPurchGroupName(String purchGroupName) {
        this.purchGroupName = purchGroupName;
    }
	/**
	 * 获取列表过滤参数A.
	 * 
	 * @return 列表过滤参数A
	 */
	@Column(nullable=true

		,name="USERREPORT_PARAMA"
	)
    public Long getPurchParamA() {
        return purchParamA;
    }
	/**
	 * 设置列表过滤参数A.
	 * @param purchParamA 列表过滤参数A
	 */
    public void setPurchParamA(Long purchParamA) {
        this.purchParamA = purchParamA;
    }
	/**
	 * 获取状态.
	 * 
	 * @return 状态
	 */
	@Column(nullable=true

		,length = 200
		,name="USERREPORT_STATE"
	)
    public String getPurchUserReportState() {
        return purchUserReportState;
    }
	/**
	 * 设置状态.
	 * @param purchUserReportState 状态
	 */
    public void setPurchUserReportState(String purchUserReportState) {
        this.purchUserReportState = purchUserReportState;
    }
	
	
	protected String _getEntityName() {
		return MESBasicPurchGroup.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_purch_Group_PurchGroup,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
