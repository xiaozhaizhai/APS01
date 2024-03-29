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
 * 同步日志.
 */
@javax.persistence.Entity(name=RMSynchroLog.JPA_NAME)
@Table(name = RMSynchroLog.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_batchFormula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_batchFormula_SynchroLog")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_batchFormula_SynchroLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMSynchroLogConvertor.class})
public class RMSynchroLog extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_batchFormula";
	public static final String MODEL_CODE = "RM_7.5.0.0_batchFormula_SynchroLog";
	public static final String DOC_TYPE = "RM_batchFormula_synchroLog";
	public static final String TABLE_NAME = "rm_synchro_logs";
	public static final String JPA_NAME = "RMSynchroLog";


		private String batchFormulaId ; // 批控主配方ID


		private Boolean flag = false; // 状态


		private String message ; // 消息

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date modiTime ; // 修改时间
	
	
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
	 * 获取批控主配方ID.
	 * 
	 * @return 批控主配方ID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_FORMULA_ID"
	)
    public String getBatchFormulaId() {
        return batchFormulaId;
    }
	/**
	 * 设置批控主配方ID.
	 * @param batchFormulaId 批控主配方ID
	 */
    public void setBatchFormulaId(String batchFormulaId) {
        this.batchFormulaId = batchFormulaId;
    }
	/**
	 * 获取状态.
	 * 
	 * @return 状态
	 */
	@Column(nullable=true

		,name="FLAG"
	)
    public Boolean getFlag() {
        return null == flag ? false : flag;
    }
	/**
	 * 设置状态.
	 * @param flag 状态
	 */
    public void setFlag(Boolean flag) {
        this.flag = flag;
    }
	/**
	 * 获取消息.
	 * 
	 * @return 消息
	 */
	@Column(nullable=true

		,length = 2000
		,name="MESSAGE"
	)
    public String getMessage() {
        return message;
    }
	/**
	 * 设置消息.
	 * @param message 消息
	 */
    public void setMessage(String message) {
        this.message = message;
    }
	/**
	 * 获取修改时间.
	 * 
	 * @return 修改时间
	 */
	@Column(nullable=true

		,name="MODI_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getModiTime() {
        return modiTime;
    }
	/**
	 * 设置修改时间.
	 * @param modiTime 修改时间
	 */
    public void setModiTime(java.util.Date modiTime) {
        this.modiTime = modiTime;
    }
	
	
	protected String _getEntityName() {
		return RMSynchroLog.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_batchFormula_SynchroLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
