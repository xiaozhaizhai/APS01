package com.supcon.orchid.X6Basic.entities;

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
 * 时间区间明细.
 */
@javax.persistence.Entity(name=X6BasicTimeRegionPar.JPA_NAME)
@Table(name = X6BasicTimeRegionPar.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_timeRegion")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_timeRegion_TimeRegionPar")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicTimeRegionParConvertor.class})
public class X6BasicTimeRegionPar extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_timeRegion";
	public static final String MODEL_CODE = "X6Basic_1.0_timeRegion_TimeRegionPar";
	public static final String DOC_TYPE = "X6Basic_timeRegion_timeRegionPar";
	public static final String TABLE_NAME = "x6basic_time_region_pars";
	public static final String JPA_NAME = "X6BasicTimeRegionPar";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endDate ; // 结束时间


		private Integer month ; // 月
	@BAPIsMainDisplay

		private String name ; // 区间名称


		private Integer quarter ; // 季度


		private Integer recordNum ; // 生成数据

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date recordTine ; // 参照时间


		private String remark ; // 备注

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startDate ; // 开始时间
	private X6BasicTimeRegion timeRegionID;


		private Integer week ; // 周


		private Integer year ; // 年
	
	
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
	 * 获取结束时间.
	 * 
	 * @return 结束时间
	 */
	@Column(nullable=true

		,name="END_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getEndDate() {
        return endDate;
    }
	/**
	 * 设置结束时间.
	 * @param endDate 结束时间
	 */
    public void setEndDate(java.util.Date endDate) {
        this.endDate = endDate;
    }
	/**
	 * 获取月.
	 * 
	 * @return 月
	 */
	@Column(nullable=true

		,name="MONTH"
	)
    public Integer getMonth() {
        return month;
    }
	/**
	 * 设置月.
	 * @param month 月
	 */
    public void setMonth(Integer month) {
        this.month = month;
    }
	/**
	 * 获取区间名称.
	 * 
	 * @return 区间名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置区间名称.
	 * @param name 区间名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取季度.
	 * 
	 * @return 季度
	 */
	@Column(nullable=true

		,name="QUARTER"
	)
    public Integer getQuarter() {
        return quarter;
    }
	/**
	 * 设置季度.
	 * @param quarter 季度
	 */
    public void setQuarter(Integer quarter) {
        this.quarter = quarter;
    }
	/**
	 * 获取生成数据.
	 * 
	 * @return 生成数据
	 */
	@Column(nullable=true

		,name="RECORD_NUM"
	)
    public Integer getRecordNum() {
        return recordNum;
    }
	/**
	 * 设置生成数据.
	 * @param recordNum 生成数据
	 */
    public void setRecordNum(Integer recordNum) {
        this.recordNum = recordNum;
    }
	/**
	 * 获取参照时间.
	 * 
	 * @return 参照时间
	 */
	@Column(nullable=true

		,name="RECORD_TINE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getRecordTine() {
        return recordTine;
    }
	/**
	 * 设置参照时间.
	 * @param recordTine 参照时间
	 */
    public void setRecordTine(java.util.Date recordTine) {
        this.recordTine = recordTine;
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
	/**
	 * 获取开始时间.
	 * 
	 * @return 开始时间
	 */
	@Column(nullable=true

		,name="START_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getStartDate() {
        return startDate;
    }
	/**
	 * 设置开始时间.
	 * @param startDate 开始时间
	 */
    public void setStartDate(java.util.Date startDate) {
        this.startDate = startDate;
    }
	@ManyToOne
	@JoinColumn(name = "TIME_REGIONID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicTimeRegion getTimeRegionID() {
        return timeRegionID;
    }
    public void setTimeRegionID(X6BasicTimeRegion timeRegionID) {
        this.timeRegionID = timeRegionID;
    }
	/**
	 * 获取周.
	 * 
	 * @return 周
	 */
	@Column(nullable=true

		,name="WEEK"
	)
    public Integer getWeek() {
        return week;
    }
	/**
	 * 设置周.
	 * @param week 周
	 */
    public void setWeek(Integer week) {
        this.week = week;
    }
	/**
	 * 获取年.
	 * 
	 * @return 年
	 */
	@Column(nullable=true

		,name="YEAR"
	)
    public Integer getYear() {
        return year;
    }
	/**
	 * 设置年.
	 * @param year 年
	 */
    public void setYear(Integer year) {
        this.year = year;
    }
	
	
	protected String _getEntityName() {
		return X6BasicTimeRegionPar.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
