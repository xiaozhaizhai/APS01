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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 批次关系信息表.
 */
@javax.persistence.Entity(name=MESBasicBatchRelationship.JPA_NAME)
@Table(name = MESBasicBatchRelationship.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_batchInfo")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_batchInfo_BatchRelationship")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_batchInfo_BatchRelationship,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicBatchRelationshipConvertor.class})
public class MESBasicBatchRelationship extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_batchInfo";
	public static final String MODEL_CODE = "MESBasic_1_batchInfo_BatchRelationship";
	public static final String DOC_TYPE = "MESBasic_batchInfo_batchRelationship";
	public static final String TABLE_NAME = "batch_relationship";
	public static final String JPA_NAME = "MESBasicBatchRelationship";
	private SystemCode batchType
; // 类型


		private String mainBatch ; // 主批次
	private MESBasicProduct mainProduct;


		private String partBatch ; // 料批次
	private MESBasicProduct partProduct;
	
	
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
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BATCH_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBatchType() {
		return batchType;
	}
	/**
	 * 设置类型.
	 * @param batchType 类型
	 */
	public void setBatchType(SystemCode batchType) {
		this.batchType = (SystemCode) batchType;
	}
	/**
	 * 获取主批次.
	 * 
	 * @return 主批次
	 */
	@Column(nullable=true

		,length = 256
		,name="MAIN_BATCH"
	)
    public String getMainBatch() {
        return mainBatch;
    }
	/**
	 * 设置主批次.
	 * @param mainBatch 主批次
	 */
    public void setMainBatch(String mainBatch) {
        this.mainBatch = mainBatch;
    }
	@OneToOne
	@JoinColumn(name = "MAIN_PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getMainProduct() {
        return mainProduct;
    }
    public void setMainProduct(MESBasicProduct mainProduct) {
        this.mainProduct = mainProduct;
    }
	/**
	 * 获取料批次.
	 * 
	 * @return 料批次
	 */
	@Column(nullable=true

		,length = 256
		,name="PART_BATCH"
	)
    public String getPartBatch() {
        return partBatch;
    }
	/**
	 * 设置料批次.
	 * @param partBatch 料批次
	 */
    public void setPartBatch(String partBatch) {
        this.partBatch = partBatch;
    }
	@OneToOne
	@JoinColumn(name = "PART_PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getPartProduct() {
        return partProduct;
    }
    public void setPartProduct(MESBasicProduct partProduct) {
        this.partProduct = partProduct;
    }
	
	
	protected String _getEntityName() {
		return MESBasicBatchRelationship.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_batchInfo_BatchRelationship,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
