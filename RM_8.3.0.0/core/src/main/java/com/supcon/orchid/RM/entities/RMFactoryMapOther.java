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
 * 工厂模型映射表.
 */
@javax.persistence.Entity(name=RMFactoryMapOther.JPA_NAME)
@Table(name = RMFactoryMapOther.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_interfaceService")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_interfaceService_FactoryMapOther")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_interfaceService_FactoryMapOther,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMFactoryMapOtherConvertor.class})
public class RMFactoryMapOther extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_interfaceService";
	public static final String MODEL_CODE = "RM_7.5.0.0_interfaceService_FactoryMapOther";
	public static final String DOC_TYPE = "RM_interfaceService_factoryMapOther";
	public static final String TABLE_NAME = "rm_factory_map_others";
	public static final String JPA_NAME = "RMFactoryMapOther";


		private String batchFacID ; // 批控系统生产线ID


		private String mesFacID ; // MES生产线ID


		private String mone ; // 备注
	
	
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
	 * 获取批控系统生产线ID.
	 * 
	 * @return 批控系统生产线ID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_FACID"
	)
    public String getBatchFacID() {
        return batchFacID;
    }
	/**
	 * 设置批控系统生产线ID.
	 * @param batchFacID 批控系统生产线ID
	 */
    public void setBatchFacID(String batchFacID) {
        this.batchFacID = batchFacID;
    }
	/**
	 * 获取MES生产线ID.
	 * 
	 * @return MES生产线ID
	 */
	@Column(nullable=true

		,length = 256
		,name="MES_FACID"
	)
    public String getMesFacID() {
        return mesFacID;
    }
	/**
	 * 设置MES生产线ID.
	 * @param mesFacID MES生产线ID
	 */
    public void setMesFacID(String mesFacID) {
        this.mesFacID = mesFacID;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
		,name="MONE"
	)
    public String getMone() {
        return mone;
    }
	/**
	 * 设置备注.
	 * @param mone 备注
	 */
    public void setMone(String mone) {
        this.mone = mone;
    }
	
	
	protected String _getEntityName() {
		return RMFactoryMapOther.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_interfaceService_FactoryMapOther,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
