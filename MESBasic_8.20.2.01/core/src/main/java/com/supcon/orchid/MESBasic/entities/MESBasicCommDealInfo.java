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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 更改记录(采购组).
 */
@javax.persistence.Entity(name=MESBasicCommDealInfo.JPA_NAME)
@Table(name = MESBasicCommDealInfo.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_product")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_product_CommDealInfo")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "DEALINFO_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_product_CommDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicCommDealInfoConvertor.class})
public class MESBasicCommDealInfo extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_product";
	public static final String MODEL_CODE = "MESBasic_1_product_CommDealInfo";
	public static final String DOC_TYPE = "MESBasic_product_commDealInfo";
	public static final String TABLE_NAME = "comm_dealinfo";
	public static final String JPA_NAME = "MESBasicCommDealInfo";
	private MESBasicProduct assignID;
	private SystemCode bapType
; // 维护类型


		private String dealContent ; // 维护内容
	private Staff dealerID;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date dealTime ; // 维护时间


		private Integer typeS2 ; // 维护类型S2
	
	
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
	
	@ManyToOne
	@JoinColumn(name = "DEALINFO_ASSIGNID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getAssignID() {
        return assignID;
    }
    public void setAssignID(MESBasicProduct assignID) {
        this.assignID = assignID;
    }
	/**
	 * 获取维护类型.
	 * 
	 * @return 维护类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DEALINFO_BAPTYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBapType() {
		return bapType;
	}
	/**
	 * 设置维护类型.
	 * @param bapType 维护类型
	 */
	public void setBapType(SystemCode bapType) {
		this.bapType = (SystemCode) bapType;
	}
	/**
	 * 获取维护内容.
	 * 
	 * @return 维护内容
	 */
	@Column(nullable=true

		,length = 2000
		,name="DEALINFO_CONTENT"
	)
    public String getDealContent() {
        return dealContent;
    }
	/**
	 * 设置维护内容.
	 * @param dealContent 维护内容
	 */
    public void setDealContent(String dealContent) {
        this.dealContent = dealContent;
    }
	@ManyToOne
	@JoinColumn(name = "DEALINFO_DEALERID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getDealerID() {
        return dealerID;
    }
    public void setDealerID(Staff dealerID) {
        this.dealerID = dealerID;
    }
	/**
	 * 获取维护时间.
	 * 
	 * @return 维护时间
	 */
	@Column(nullable=true

		,name="DEALINFO_DEALTIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDealTime() {
        return dealTime;
    }
	/**
	 * 设置维护时间.
	 * @param dealTime 维护时间
	 */
    public void setDealTime(java.util.Date dealTime) {
        this.dealTime = dealTime;
    }
	/**
	 * 获取维护类型S2.
	 * 
	 * @return 维护类型S2
	 */
	@Column(nullable=true

		,name="DEALINFO_TYPE"
	)
    public Integer getTypeS2() {
        return typeS2;
    }
	/**
	 * 设置维护类型S2.
	 * @param typeS2 维护类型S2
	 */
    public void setTypeS2(Integer typeS2) {
        this.typeS2 = typeS2;
    }
	
	
	protected String _getEntityName() {
		return MESBasicCommDealInfo.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_product_CommDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
