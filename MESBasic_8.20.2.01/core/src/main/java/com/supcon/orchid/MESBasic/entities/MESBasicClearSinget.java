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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 清空信号.
 */
@javax.persistence.Entity(name=MESBasicClearSinget.JPA_NAME)
@Table(name = MESBasicClearSinget.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_clearSinget")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_clearSinget_ClearSinget")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_clearSinget_ClearSinget,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicClearSingetConvertor.class})
public class MESBasicClearSinget extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_clearSinget";
	public static final String MODEL_CODE = "MESBasic_1_clearSinget_ClearSinget";
	public static final String DOC_TYPE = "MESBasic_clearSinget_clearSinget";
	public static final String TABLE_NAME = "batchmanag_clear_singets";
	public static final String JPA_NAME = "MESBasicClearSinget";
	private Department bmDepartment;
	private SystemCode clearSinget
; // 清空


		private String demo ; // 备注


		private String proProduct ; // 备料类型
	private MESBasicItemSetup singet;
	private MESBasicObjEquipment toEquipment;
	
	
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
	@JoinColumn(name = "BM_DEPARTMENT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getBmDepartment() {
        return bmDepartment;
    }
    public void setBmDepartment(Department bmDepartment) {
        this.bmDepartment = bmDepartment;
    }
	/**
	 * 获取清空.
	 * 
	 * @return 清空
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CLEAR_SINGET", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getClearSinget() {
		return clearSinget;
	}
	/**
	 * 设置清空.
	 * @param clearSinget 清空
	 */
	public void setClearSinget(SystemCode clearSinget) {
		this.clearSinget = (SystemCode) clearSinget;
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
	 * 获取备料类型.
	 * 
	 * @return 备料类型
	 */
	@Column(nullable=true

		,length = 256
		,name="PRO_PRODUCT"
	)
    public String getProProduct() {
        return proProduct;
    }
	/**
	 * 设置备料类型.
	 * @param proProduct 备料类型
	 */
    public void setProProduct(String proProduct) {
        this.proProduct = proProduct;
    }
	@OneToOne
	@JoinColumn(name = "SINGET", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getSinget() {
        return singet;
    }
    public void setSinget(MESBasicItemSetup singet) {
        this.singet = singet;
    }
	@OneToOne
	@JoinColumn(name = "TO_EQUIPMENT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicObjEquipment getToEquipment() {
        return toEquipment;
    }
    public void setToEquipment(MESBasicObjEquipment toEquipment) {
        this.toEquipment = toEquipment;
    }
	
	
	protected String _getEntityName() {
		return MESBasicClearSinget.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_clearSinget_ClearSinget,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
