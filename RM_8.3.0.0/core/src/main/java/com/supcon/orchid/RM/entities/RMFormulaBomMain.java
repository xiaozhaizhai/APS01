package com.supcon.orchid.RM.entities;

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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 配方BOM主表.
 */
@javax.persistence.Entity(name=RMFormulaBomMain.JPA_NAME)
@Table(name = RMFormulaBomMain.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formulaBOM")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formulaBOM_FormulaBomMain")
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
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formulaBOM_FormulaBomMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFormulaBomMainConvertor.class})
public class RMFormulaBomMain extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formulaBOM";
	public static final String MODEL_CODE = "RM_7.5.0.0_formulaBOM_FormulaBomMain";
	public static final String DOC_TYPE = "RM_formulaBOM_formulaBomMain";
	public static final String TABLE_NAME = "rm_formula_bom_mains";
	public static final String JPA_NAME = "RMFormulaBomMain";


		private String demo ; // 备注


		private String edtion ; // 版本


		private String formulaBomCode ; // 配方BOM编码
	private SystemCode interfaceUrl
; // 中间接口服务地址


		private Boolean isUse = false; // 是否使用


		private Boolean model = false; // 模式
	private MESBasicProduct product;
	
	
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
		,name="DEMO"
	)
    public String getDemo() {
        return demo;
    }
	/**
	 * 设置备注.
	 * @param demo 备注
	 */
    public void setDemo(String demo) {
        this.demo = demo;
    }
	/**
	 * 获取版本.
	 * 
	 * @return 版本
	 */
	@Column(

		length = 2000
		,name="EDTION"
	)
    public String getEdtion() {
        return edtion;
    }
	/**
	 * 设置版本.
	 * @param edtion 版本
	 */
    public void setEdtion(String edtion) {
        this.edtion = edtion;
    }
	/**
	 * 获取配方BOM编码.
	 * 
	 * @return 配方BOM编码
	 */
	@Column(

		length = 2000
		,name="FORMULA_BOM_CODE"
	)
    public String getFormulaBomCode() {
        return formulaBomCode;
    }
	/**
	 * 设置配方BOM编码.
	 * @param formulaBomCode 配方BOM编码
	 */
    public void setFormulaBomCode(String formulaBomCode) {
        this.formulaBomCode = formulaBomCode;
    }
	/**
	 * 获取中间接口服务地址.
	 * 
	 * @return 中间接口服务地址
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="INTERFACE_URL", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getInterfaceUrl() {
		return interfaceUrl;
	}
	/**
	 * 设置中间接口服务地址.
	 * @param interfaceUrl 中间接口服务地址
	 */
	public void setInterfaceUrl(SystemCode interfaceUrl) {
		this.interfaceUrl = (SystemCode) interfaceUrl;
	}
	/**
	 * 获取是否使用.
	 * 
	 * @return 是否使用
	 */
	@Column(nullable=true

		,name="IS_USE"
	)
    public Boolean getIsUse() {
        return null == isUse ? false : isUse;
    }
	/**
	 * 设置是否使用.
	 * @param isUse 是否使用
	 */
    public void setIsUse(Boolean isUse) {
        this.isUse = isUse;
    }
	/**
	 * 获取模式.
	 * 
	 * @return 模式
	 */
	@Column(nullable=true

		,name="MODEL"
	)
    public Boolean getModel() {
        return null == model ? false : model;
    }
	/**
	 * 设置模式.
	 * @param model 模式
	 */
    public void setModel(Boolean model) {
        this.model = model;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct() {
        return product;
    }
    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }
	
	
	protected String _getEntityName() {
		return RMFormulaBomMain.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formulaBOM_FormulaBomMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
