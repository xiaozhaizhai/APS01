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
import com.supcon.orchid.foundation.entities.Document;
/**
 * MQ处理信息表.
 */
@javax.persistence.Entity(name=RMMQDealinfo.JPA_NAME)
@Table(name = RMMQDealinfo.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_interfaceService")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_interfaceService_MQDealinfo")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_interfaceService_MQDealinfo,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMMQDealinfoConvertor.class})
public class RMMQDealinfo extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_interfaceService";
	public static final String MODEL_CODE = "RM_7.5.0.0_interfaceService_MQDealinfo";
	public static final String DOC_TYPE = "RM_interfaceService_mQDealinfo";
	public static final String TABLE_NAME = "rm_mqdealinfos";
	public static final String JPA_NAME = "RMMQDealinfo";


		private Boolean hasDealed = false; // 是否处理过


		private String mqValue ; // MQ传递值


		private String objectType ; // 对象类型


		private String origin ; // 数据来源
	
	
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
	 * 获取是否处理过.
	 * 
	 * @return 是否处理过
	 */
	@Column(nullable=true

		,name="HAS_DEALED"
	)
    public Boolean getHasDealed() {
        return null == hasDealed ? false : hasDealed;
    }
	/**
	 * 设置是否处理过.
	 * @param hasDealed 是否处理过
	 */
    public void setHasDealed(Boolean hasDealed) {
        this.hasDealed = hasDealed;
    }
	/**
	 * 获取MQ传递值.
	 * 
	 * @return MQ传递值
	 */
	@Column(nullable=true

		,name="MQ_VALUE"
	)
    @javax.persistence.Lob
    public String getMqValue() {
        return mqValue;
    }
	/**
	 * 设置MQ传递值.
	 * @param mqValue MQ传递值
	 */
    public void setMqValue(String mqValue) {
        this.mqValue = mqValue;
    }
	/**
	 * 获取对象类型.
	 * 
	 * @return 对象类型
	 */
	@Column(nullable=true

		,length = 256
		,name="OBJECT_TYPE"
	)
    public String getObjectType() {
        return objectType;
    }
	/**
	 * 设置对象类型.
	 * @param objectType 对象类型
	 */
    public void setObjectType(String objectType) {
        this.objectType = objectType;
    }
	/**
	 * 获取数据来源.
	 * 
	 * @return 数据来源
	 */
	@Column(nullable=true

		,length = 256
		,name="ORIGIN"
	)
    public String getOrigin() {
        return origin;
    }
	/**
	 * 设置数据来源.
	 * @param origin 数据来源
	 */
    public void setOrigin(String origin) {
        this.origin = origin;
    }
	
	
	protected String _getEntityName() {
		return RMMQDealinfo.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_interfaceService_MQDealinfo,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
