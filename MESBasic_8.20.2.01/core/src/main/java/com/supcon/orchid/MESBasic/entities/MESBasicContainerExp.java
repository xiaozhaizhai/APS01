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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 字段对应列表.
 */
@javax.persistence.Entity(name=MESBasicContainerExp.JPA_NAME)
@Table(name = MESBasicContainerExp.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_container")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_container_ContainerExp")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_container_ContainerExp,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicContainerExpConvertor.class})
public class MESBasicContainerExp extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_container";
	public static final String MODEL_CODE = "MESBasic_1_container_ContainerExp";
	public static final String DOC_TYPE = "MESBasic_container_containerExp";
	public static final String TABLE_NAME = "mesbasic_container_exps";
	public static final String JPA_NAME = "MESBasicContainerExp";


		private String code ; // 字段编码
	private MESBasicContainer headId;


		private String name ; // 字段名称


		private String representCode ; // 对应值
	
	
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
	 * 获取字段编码.
	 * 
	 * @return 字段编码
	 */
	@Column(nullable=true

		,length = 256
		,name="CODE"
	)
    public String getCode() {
        return code;
    }
	/**
	 * 设置字段编码.
	 * @param code 字段编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicContainer getHeadId() {
        return headId;
    }
    public void setHeadId(MESBasicContainer headId) {
        this.headId = headId;
    }
	/**
	 * 获取字段名称.
	 * 
	 * @return 字段名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置字段名称.
	 * @param name 字段名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取对应值.
	 * 
	 * @return 对应值
	 */
	@Column(nullable=true

		,length = 256
		,name="REPRESENT_CODE"
	)
    public String getRepresentCode() {
        return representCode;
    }
	/**
	 * 设置对应值.
	 * @param representCode 对应值
	 */
    public void setRepresentCode(String representCode) {
        this.representCode = representCode;
    }
	
	
	protected String _getEntityName() {
		return MESBasicContainerExp.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_container_ContainerExp,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
