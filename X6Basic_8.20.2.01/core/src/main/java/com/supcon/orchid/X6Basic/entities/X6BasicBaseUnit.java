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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 单位.
 */
@javax.persistence.Entity(name=X6BasicBaseUnit.JPA_NAME)
@Table(name = X6BasicBaseUnit.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_unitGroup")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_unitGroup_BaseUnit")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "UNIT_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicBaseUnitConvertor.class})
public class X6BasicBaseUnit extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_unitGroup";
	public static final String MODEL_CODE = "X6Basic_1.0_unitGroup_BaseUnit";
	public static final String DOC_TYPE = "X6Basic_unitGroup_baseUnit";
	public static final String TABLE_NAME = "s2base_unit";
	public static final String JPA_NAME = "X6BasicBaseUnit";


		private String code ; // 单位代码


		private String comments ; // 备注


		private Boolean isMain = false; // 主单位
	@BAPIsMainDisplay

		private String name ; // 单位名称


		private java.math.BigDecimal rate ; // 比率
	private X6BasicUnitGroups unitGroup;
	
	
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
	 * 获取单位代码.
	 * 
	 * @return 单位代码
	 */
	@Column(

		length = 256
		,name="UNIT_CODE"
	)
	@Index(name="index_BaseUnit_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置单位代码.
	 * @param code 单位代码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="UNIT_MEMO"
	)
    @javax.persistence.Lob
    public String getComments() {
        return comments;
    }
	/**
	 * 设置备注.
	 * @param comments 备注
	 */
    public void setComments(String comments) {
        this.comments = comments;
    }
	/**
	 * 获取主单位.
	 * 
	 * @return 主单位
	 */
	@Column(nullable=true

		,name="UNIT_MAIN"
	)
    public Boolean getIsMain() {
        return null == isMain ? false : isMain;
    }
	/**
	 * 设置主单位.
	 * @param isMain 主单位
	 */
    public void setIsMain(Boolean isMain) {
        this.isMain = isMain;
    }
	/**
	 * 获取单位名称.
	 * 
	 * @return 单位名称
	 */
	@Column(

		length = 256
		,name="UNIT_NAME"
	)
	@Index(name="index_BaseUnit_name")	
    public String getName() {
        return name;
    }
	/**
	 * 设置单位名称.
	 * @param name 单位名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取比率.
	 * 
	 * @return 比率
	 */
	@Column(
			precision=19,scale=6
		,name="UNIT_RATE"
	)
    public java.math.BigDecimal getRate() {
        return rate;
    }
	/**
	 * 设置比率.
	 * @param rate 比率
	 */
    public void setRate(java.math.BigDecimal rate) {
        this.rate = rate;
    }
	@ManyToOne
	@JoinColumn(name = "UNIT_GROUPID", referencedColumnName="UNITGROUP_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicUnitGroups getUnitGroup() {
        return unitGroup;
    }
    public void setUnitGroup(X6BasicUnitGroups unitGroup) {
        this.unitGroup = unitGroup;
    }
	
	
	protected String _getEntityName() {
		return X6BasicBaseUnit.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
