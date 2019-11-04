package com.supcon.orchid.WOM.entities;

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
 * 工艺执行记录.
 */
@javax.persistence.Entity(name=WOMCraftRecords.JPA_NAME)
@Table(name = WOMCraftRecords.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_procFeedback")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_procFeedback_CraftRecords")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_procFeedback_CraftRecords,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMCraftRecordsConvertor.class})
public class WOMCraftRecords extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_procFeedback";
	public static final String MODEL_CODE = "WOM_7.5.0.0_procFeedback_CraftRecords";
	public static final String DOC_TYPE = "WOM_procFeedback_craftRecords";
	public static final String TABLE_NAME = "wom_craft_records";
	public static final String JPA_NAME = "WOMCraftRecords";


		private java.math.BigDecimal actualValue ; // 报出值
	private WOMProcFeedbackHead header;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date recordEndTime ; // 记录结束时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date recordStartTime ; // 记录开始时间


		private String remark ; // 备注
	private WOMCraftStandards standardCraft;


		private Long standardID ; // 工艺指标ID
	
	
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
	 * 获取报出值.
	 * 
	 * @return 报出值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ACTUAL_VALUE"
	)
    public java.math.BigDecimal getActualValue() {
        return actualValue;
    }
	/**
	 * 设置报出值.
	 * @param actualValue 报出值
	 */
    public void setActualValue(java.math.BigDecimal actualValue) {
        this.actualValue = actualValue;
    }
	@ManyToOne
	@JoinColumn(name = "HEADER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProcFeedbackHead getHeader() {
        return header;
    }
    public void setHeader(WOMProcFeedbackHead header) {
        this.header = header;
    }
	/**
	 * 获取记录结束时间.
	 * 
	 * @return 记录结束时间
	 */
	@Column(nullable=true

		,name="RECORD_END_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getRecordEndTime() {
        return recordEndTime;
    }
	/**
	 * 设置记录结束时间.
	 * @param recordEndTime 记录结束时间
	 */
    public void setRecordEndTime(java.util.Date recordEndTime) {
        this.recordEndTime = recordEndTime;
    }
	/**
	 * 获取记录开始时间.
	 * 
	 * @return 记录开始时间
	 */
	@Column(nullable=true

		,name="RECORD_START_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getRecordStartTime() {
        return recordStartTime;
    }
	/**
	 * 设置记录开始时间.
	 * @param recordStartTime 记录开始时间
	 */
    public void setRecordStartTime(java.util.Date recordStartTime) {
        this.recordStartTime = recordStartTime;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
		,name="REMARK"
	)
    public String getRemark() {
        return remark;
    }
	/**
	 * 设置备注.
	 * @param remark 备注
	 */
    public void setRemark(String remark) {
        this.remark = remark;
    }
	@ManyToOne
	@JoinColumn(name = "STANDARD_CRAFT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMCraftStandards getStandardCraft() {
        return standardCraft;
    }
    public void setStandardCraft(WOMCraftStandards standardCraft) {
        this.standardCraft = standardCraft;
    }
	/**
	 * 获取工艺指标ID.
	 * 
	 * @return 工艺指标ID
	 */
	@Column(nullable=true

		,name="STANDARDID"
	)
    public Long getStandardID() {
        return standardID;
    }
	/**
	 * 设置工艺指标ID.
	 * @param standardID 工艺指标ID
	 */
    public void setStandardID(Long standardID) {
        this.standardID = standardID;
    }
	
	
	protected String _getEntityName() {
		return WOMCraftRecords.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_procFeedback_CraftRecords,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
