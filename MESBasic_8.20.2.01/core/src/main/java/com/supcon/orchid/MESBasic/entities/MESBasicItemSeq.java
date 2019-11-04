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
 * 测点处理标示.
 */
@javax.persistence.Entity(name=MESBasicItemSeq.JPA_NAME)
@Table(name = MESBasicItemSeq.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_thirdDataHandler")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_thirdDataHandler_ItemSeq")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_thirdDataHandler_ItemSeq,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicItemSeqConvertor.class})
public class MESBasicItemSeq extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_thirdDataHandler";
	public static final String MODEL_CODE = "MESBasic_1_thirdDataHandler_ItemSeq";
	public static final String DOC_TYPE = "MESBasic_thirdDataHandler_itemSeq";
	public static final String TABLE_NAME = "mesbasic_item_seqs";
	public static final String JPA_NAME = "MESBasicItemSeq";


		private Boolean errorFlag = false; // 异常标识


		private Long maxId ; // 测点ID


		private String seqType ; // 类型
	
	
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
	 * 获取异常标识.
	 * 
	 * @return 异常标识
	 */
	@Column(nullable=true

		,name="ERROR_FLAG"
	)
    public Boolean getErrorFlag() {
        return null == errorFlag ? false : errorFlag;
    }
	/**
	 * 设置异常标识.
	 * @param errorFlag 异常标识
	 */
    public void setErrorFlag(Boolean errorFlag) {
        this.errorFlag = errorFlag;
    }
	/**
	 * 获取测点ID.
	 * 
	 * @return 测点ID
	 */
	@Column(nullable=true

		,name="MAX_ID"
	)
    public Long getMaxId() {
        return maxId;
    }
	/**
	 * 设置测点ID.
	 * @param maxId 测点ID
	 */
    public void setMaxId(Long maxId) {
        this.maxId = maxId;
    }
	/**
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@Column(nullable=true

		,length = 400
		,name="SEQ_TYPE"
	)
    public String getSeqType() {
        return seqType;
    }
	/**
	 * 设置类型.
	 * @param seqType 类型
	 */
    public void setSeqType(String seqType) {
        this.seqType = seqType;
    }
	
	
	protected String _getEntityName() {
		return MESBasicItemSeq.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_thirdDataHandler_ItemSeq,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
