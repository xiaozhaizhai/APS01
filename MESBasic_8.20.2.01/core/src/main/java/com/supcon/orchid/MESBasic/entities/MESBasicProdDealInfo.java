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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 物品维护记录.
 */
@javax.persistence.Entity(name=MESBasicProdDealInfo.JPA_NAME)
@Table(name = MESBasicProdDealInfo.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_product")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_product_ProdDealInfo")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "PDI_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_product_ProdDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicProdDealInfoConvertor.class})
public class MESBasicProdDealInfo extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_product";
	public static final String MODEL_CODE = "MESBasic_1_product_ProdDealInfo";
	public static final String DOC_TYPE = "MESBasic_product_prodDealInfo";
	public static final String TABLE_NAME = "s2base_proddealinfo";
	public static final String JPA_NAME = "MESBasicProdDealInfo";
	private MESBasicProduct assignID;


		private String content ; // 维护内容及原因


		private Integer ctype ; // 维护类型
	private Staff dealerID;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date dealTime ; // 维护时间


		private Integer directoryID ; // 自定义目录ID
	
	
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
	@JoinColumn(name = "PDI_ASSIGNID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getAssignID() {
        return assignID;
    }
    public void setAssignID(MESBasicProduct assignID) {
        this.assignID = assignID;
    }
	/**
	 * 获取维护内容及原因.
	 * 
	 * @return 维护内容及原因
	 */
	@Column(nullable=true

		,length = 2000
		,name="PDI_CONTENT"
	)
    public String getContent() {
        return content;
    }
	/**
	 * 设置维护内容及原因.
	 * @param content 维护内容及原因
	 */
    public void setContent(String content) {
        this.content = content;
    }
	/**
	 * 获取维护类型.
	 * 
	 * @return 维护类型
	 */
	@Column(nullable=true

		,name="PDI_TYPE"
	)
    public Integer getCtype() {
        return ctype;
    }
	/**
	 * 设置维护类型.
	 * @param ctype 维护类型
	 */
    public void setCtype(Integer ctype) {
        this.ctype = ctype;
    }
	@ManyToOne
	@JoinColumn(name = "PDI_DEALERID", referencedColumnName="ID")
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

		,name="PDI_DEALTIME"
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
	 * 获取自定义目录ID.
	 * 
	 * @return 自定义目录ID
	 */
	@Column(nullable=true

		,name="PDI_DIRECTORYID"
	)
    public Integer getDirectoryID() {
        return directoryID;
    }
	/**
	 * 设置自定义目录ID.
	 * @param directoryID 自定义目录ID
	 */
    public void setDirectoryID(Integer directoryID) {
        this.directoryID = directoryID;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProdDealInfo.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_product_ProdDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
