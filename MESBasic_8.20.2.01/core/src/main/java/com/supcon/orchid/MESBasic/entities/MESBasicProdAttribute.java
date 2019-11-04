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
 * 物品属性表.
 */
@javax.persistence.Entity(name=MESBasicProdAttribute.JPA_NAME)
@Table(name = MESBasicProdAttribute.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_prodAttribute")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_prodAttribute_ProdAttribute")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="fullPathName", column=@Column(name = "FULL_PATH_NAME")),
		@AttributeOverride(name="id", column=@Column(name = "PRODATT_ID")),
		@AttributeOverride(name="layNo", column=@Column(name = "PRODATT_LAYNO")),
		@AttributeOverride(name="layRec", column=@Column(name = "PRODATT_LAYREC")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_prodAttribute_ProdAttribute,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicProdAttributeConvertor.class})
public class MESBasicProdAttribute extends com.supcon.orchid.orm.entities.AbstractEcTreeFullEntity<MESBasicProdAttribute> {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_prodAttribute";
	public static final String MODEL_CODE = "MESBasic_1_prodAttribute_ProdAttribute";
	public static final String DOC_TYPE = "MESBasic_prodAttribute_prodAttribute";
	public static final String TABLE_NAME = "s2base_prodattribute";
	public static final String JPA_NAME = "MESBasicProdAttribute";


		private String cmemo ; // 备注


		private String code ; // 属性编码
	@BAPIsMainDisplay

		private String name ; // 属性名称


		private String playno ; // 物品属性级别代码(弃用)


		private String playrec ; // 物品属性级别记录（弃用）
	
	
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
		,name="PRODATT_MEMO"
	)
    public String getCmemo() {
        return cmemo;
    }
	/**
	 * 设置备注.
	 * @param cmemo 备注
	 */
    public void setCmemo(String cmemo) {
        this.cmemo = cmemo;
    }
	/**
	 * 获取属性编码.
	 * 
	 * @return 属性编码
	 */
	@Column(

		length = 2000
		,name="PRODATT_CODE"
	)
	@Index(name="index_ProdAttribute_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置属性编码.
	 * @param code 属性编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取属性名称.
	 * 
	 * @return 属性名称
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODATT_NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置属性名称.
	 * @param name 属性名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取物品属性级别代码(弃用).
	 * 
	 * @return 物品属性级别代码(弃用)
	 */
	@Column(nullable=true

		,length = 200
		,name="PLAYNO"
	)
    public String getPlayno() {
        return playno;
    }
	/**
	 * 设置物品属性级别代码(弃用).
	 * @param playno 物品属性级别代码(弃用)
	 */
    public void setPlayno(String playno) {
        this.playno = playno;
    }
	/**
	 * 获取物品属性级别记录（弃用）.
	 * 
	 * @return 物品属性级别记录（弃用）
	 */
	@Column(nullable=true

		,length = 200
		,name="PLAYREC"
	)
    public String getPlayrec() {
        return playrec;
    }
	/**
	 * 设置物品属性级别记录（弃用）.
	 * @param playrec 物品属性级别记录（弃用）
	 */
    public void setPlayrec(String playrec) {
        this.playrec = playrec;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProdAttribute.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_prodAttribute_ProdAttribute,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
