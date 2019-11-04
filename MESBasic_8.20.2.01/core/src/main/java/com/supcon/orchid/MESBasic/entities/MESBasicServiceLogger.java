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
 * 服务日志.
 */
@javax.persistence.Entity(name=MESBasicServiceLogger.JPA_NAME)
@Table(name = MESBasicServiceLogger.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_backgroundServiceMonitor")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_backgroundServiceMonitor_ServiceLogger")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_backgroundServiceMonitor_ServiceLogger,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicServiceLoggerConvertor.class})
public class MESBasicServiceLogger extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_backgroundServiceMonitor";
	public static final String MODEL_CODE = "MESBasic_1_backgroundServiceMonitor_ServiceLogger";
	public static final String DOC_TYPE = "MESBasic_backgroundServiceMonitor_serviceLogger";
	public static final String TABLE_NAME = "mesbasic_service_loggers";
	public static final String JPA_NAME = "MESBasicServiceLogger";


		private String logContent ; // 日志内容

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date logTime ; // 记录时间
	private MESBasicMESServices mesService;
	
	
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
	 * 获取日志内容.
	 * 
	 * @return 日志内容
	 */
	@Column(nullable=true

		,length = 4000
		,name="LOG_CONTENT"
	)
    public String getLogContent() {
        return logContent;
    }
	/**
	 * 设置日志内容.
	 * @param logContent 日志内容
	 */
    public void setLogContent(String logContent) {
        this.logContent = logContent;
    }
	/**
	 * 获取记录时间.
	 * 日志记录的时间
	 * @return 记录时间
	 */
	@Column(nullable=true

		,name="LOG_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getLogTime() {
        return logTime;
    }
	/**
	 * 设置记录时间.
	 * @param logTime 记录时间
	 */
    public void setLogTime(java.util.Date logTime) {
        this.logTime = logTime;
    }
	@ManyToOne
	@JoinColumn(name = "MES_SERVICE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicMESServices getMesService() {
        return mesService;
    }
    public void setMesService(MESBasicMESServices mesService) {
        this.mesService = mesService;
    }
	
	
	protected String _getEntityName() {
		return MESBasicServiceLogger.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_backgroundServiceMonitor_ServiceLogger,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
