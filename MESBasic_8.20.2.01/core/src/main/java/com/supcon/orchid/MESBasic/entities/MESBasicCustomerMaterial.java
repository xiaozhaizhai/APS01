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
 * 客户物品.
 */
@javax.persistence.Entity(name=MESBasicCustomerMaterial.JPA_NAME)
@Table(name = MESBasicCustomerMaterial.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_customerMaterial")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_customerMaterial_CustomerMaterial")
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
		@AttributeOverride(name="valid", column=@Column(name = "VALID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_customerMaterial_CustomerMaterial,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicCustomerMaterialConvertor.class})
public class MESBasicCustomerMaterial extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_customerMaterial";
	public static final String MODEL_CODE = "MESBasic_1_customerMaterial_CustomerMaterial";
	public static final String DOC_TYPE = "MESBasic_customerMaterial_customerMaterial";
	public static final String TABLE_NAME = "mesbasic_customer_materials";
	public static final String JPA_NAME = "MESBasicCustomerMaterial";


		private String code ; // 客户物料编码
	private MESBasicBaseCustomer customer;


		private String customerMaterialMemo ; // 备注


		private Boolean isUse = false; // 是否启用
	private MESBasicProduct material;


		private String name ; // 客户物料名称
	
	
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
	 * 获取客户物料编码.
	 * 
	 * @return 客户物料编码
	 */
	@Column(nullable=true

		,length = 256
		,name="CODE"
	)
    public String getCode() {
        return code;
    }
	/**
	 * 设置客户物料编码.
	 * @param code 客户物料编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	@ManyToOne
	@JoinColumn(name = "CUSTOMER", referencedColumnName="CUSTOMER_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicBaseCustomer getCustomer() {
        return customer;
    }
    public void setCustomer(MESBasicBaseCustomer customer) {
        this.customer = customer;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="CUSTOMER_MATERIAL_MEMO"
	)
    @javax.persistence.Lob
    public String getCustomerMaterialMemo() {
        return customerMaterialMemo;
    }
	/**
	 * 设置备注.
	 * @param customerMaterialMemo 备注
	 */
    public void setCustomerMaterialMemo(String customerMaterialMemo) {
        this.customerMaterialMemo = customerMaterialMemo;
    }
	/**
	 * 获取是否启用.
	 * 
	 * @return 是否启用
	 */
	@Column(nullable=true

		,name="IS_USE"
	)
    public Boolean getIsUse() {
        return null == isUse ? false : isUse;
    }
	/**
	 * 设置是否启用.
	 * @param isUse 是否启用
	 */
    public void setIsUse(Boolean isUse) {
        this.isUse = isUse;
    }
	@ManyToOne
	@JoinColumn(name = "MATERIAL", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getMaterial() {
        return material;
    }
    public void setMaterial(MESBasicProduct material) {
        this.material = material;
    }
	/**
	 * 获取客户物料名称.
	 * 
	 * @return 客户物料名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置客户物料名称.
	 * @param name 客户物料名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	
	
	protected String _getEntityName() {
		return MESBasicCustomerMaterial.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_customerMaterial_CustomerMaterial,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
