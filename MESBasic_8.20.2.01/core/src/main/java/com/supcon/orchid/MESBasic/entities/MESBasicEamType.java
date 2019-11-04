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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 设备类型.
 */
@javax.persistence.Entity(name=MESBasicEamType.JPA_NAME)
@Table(name = MESBasicEamType.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_eamType")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_eamType_EamType")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="fullPathName", column=@Column(name = "FULL_PATH_NAME")),
		@AttributeOverride(name="id", column=@Column(name = "EAMTYPE_ID")),
		@AttributeOverride(name="layNo", column=@Column(name = "EAMTYPE_LAYNO")),
		@AttributeOverride(name="layRec", column=@Column(name = "EAMTYPE_LAYREC")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_eamType_EamType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicEamTypeConvertor.class})
public class MESBasicEamType extends com.supcon.orchid.orm.entities.AbstractEcTreeFullEntity<MESBasicEamType> {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_eamType";
	public static final String MODEL_CODE = "MESBasic_1_eamType_EamType";
	public static final String DOC_TYPE = "MESBasic_eamType_eamType";
	public static final String TABLE_NAME = "eam_eamtype";
	public static final String JPA_NAME = "MESBasicEamType";

		@BAPIsMneCode
		private String code ; // 编码


		private Boolean eamtypeAttribute = false; // 末级


		private Boolean isMea = false; // 测量设备


		private Boolean isspecial = false; // 特种设备
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String name ; // 设备类型
	private SystemCode otherspecial
; // 其他特殊设备


		private String typeMemo ; // 备注
	
	
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
	 * 获取编码.
	 * 
	 * @return 编码
	 */
	@Column(unique=true
		,length=200

		,name="EAMTYPE_CODE"
	)
	@Index(name="index_EamType_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置编码.
	 * @param code 编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取末级.
	 * 
	 * @return 末级
	 */
	@Column(nullable=true

		,name="EAMTYPE_ATTRIBUTE"
	)
    public Boolean getEamtypeAttribute() {
        return null == eamtypeAttribute ? false : eamtypeAttribute;
    }
	/**
	 * 设置末级.
	 * @param eamtypeAttribute 末级
	 */
    public void setEamtypeAttribute(Boolean eamtypeAttribute) {
        this.eamtypeAttribute = eamtypeAttribute;
    }
	/**
	 * 获取测量设备.
	 * 
	 * @return 测量设备
	 */
	@Column(nullable=true

		,name="EAMTYPE_ISMEA"
	)
    public Boolean getIsMea() {
        return null == isMea ? false : isMea;
    }
	/**
	 * 设置测量设备.
	 * @param isMea 测量设备
	 */
    public void setIsMea(Boolean isMea) {
        this.isMea = isMea;
    }
	/**
	 * 获取特种设备.
	 * 
	 * @return 特种设备
	 */
	@Column(nullable=true

		,name="EAMTYPE_ISSPECIAL"
	)
    public Boolean getIsspecial() {
        return null == isspecial ? false : isspecial;
    }
	/**
	 * 设置特种设备.
	 * @param isspecial 特种设备
	 */
    public void setIsspecial(Boolean isspecial) {
        this.isspecial = isspecial;
    }
	/**
	 * 获取设备类型.
	 * 
	 * @return 设备类型
	 */
	@Column(

		length = 200
		,name="EAMTYPE_NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置设备类型.
	 * @param name 设备类型
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取其他特殊设备.
	 * 
	 * @return 其他特殊设备
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="EAMTYPE_OTHERSPECIAL", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOtherspecial() {
		return otherspecial;
	}
	/**
	 * 设置其他特殊设备.
	 * @param otherspecial 其他特殊设备
	 */
	public void setOtherspecial(SystemCode otherspecial) {
		this.otherspecial = (SystemCode) otherspecial;
	}
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true
		,length=2000

		,name="EAMTYPE_MEMO"
	)
    @javax.persistence.Lob
    public String getTypeMemo() {
        return typeMemo;
    }
	/**
	 * 设置备注.
	 * @param typeMemo 备注
	 */
    public void setTypeMemo(String typeMemo) {
        this.typeMemo = typeMemo;
    }
	
	
	protected String _getEntityName() {
		return MESBasicEamType.class.getName();
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

	
	private String parentNodeBusinessKey;
	@javax.persistence.Transient
	public String getParentNodeBusinessKey() {
		return parentNodeBusinessKey;
	}

	public void setParentNodeBusinessKey(String parentNodeBusinessKey) {
		this.parentNodeBusinessKey = parentNodeBusinessKey;
	}
	
	private String parentNodeMainDisplay;
	@javax.persistence.Transient
	public String getParentNodeMainDisplay() {
		return parentNodeMainDisplay;
	}

	public void setParentNodeMainDisplay(String parentNodeMainDisplay) {
		this.parentNodeMainDisplay = parentNodeMainDisplay;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_eamType_EamType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
