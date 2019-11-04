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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 时间区间.
 */
@javax.persistence.Entity(name=X6BasicTimeRegion.JPA_NAME)
@Table(name = X6BasicTimeRegion.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_timeRegion")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_timeRegion_TimeRegion")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicTimeRegionConvertor.class})
public class X6BasicTimeRegion extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_timeRegion";
	public static final String MODEL_CODE = "X6Basic_1.0_timeRegion_TimeRegion";
	public static final String DOC_TYPE = "X6Basic_timeRegion_timeRegion";
	public static final String TABLE_NAME = "x6basic_time_regions";
	public static final String JPA_NAME = "X6BasicTimeRegion";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 结束时间
	@BAPIsMainDisplay

		private String name ; // 名称


		private Integer recordNum ; // 生成数据


		private Integer setMon ; // 月


		private Integer setquater ; // 季度


		private Integer setyear ; // 年

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 开始时间
	private SystemCode unit
; // 单位
	private SystemCode useEntity
; // 使用实体
	
	private List<X6BasicTimeRegionPar> timeRegionParList;
	
	public void setTimeRegionParList(List<X6BasicTimeRegionPar> timeRegionParList){
		this.timeRegionParList = timeRegionParList;
	}
	@Transient
	public List<X6BasicTimeRegionPar> getTimeRegionParList(){
		return timeRegionParList;
	}
	
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

		,name="END_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getEndTime() {
        return endTime;
    }
	/**
	 * 设置结束时间.
	 * @param endTime 结束时间
	 */
    public void setEndTime(java.util.Date endTime) {
        this.endTime = endTime;
    }
	/**
	 * 获取名称.
	 * 
	 * @return 名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置名称.
	 * @param name 名称
	 */
    public void setName(String name) {
        this.name = name;
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
	 * 获取月.
	 * 
	 * @return 月
	 */
	@Column(nullable=true

		,name="SET_MON"
	)
    public Integer getSetMon() {
        return setMon;
    }
	/**
	 * 设置月.
	 * @param setMon 月
	 */
    public void setSetMon(Integer setMon) {
        this.setMon = setMon;
    }
	/**
	 * 获取季度.
	 * 
	 * @return 季度
	 */
	@Column(nullable=true

		,name="SETQUATER"
	)
    public Integer getSetquater() {
        return setquater;
    }
	/**
	 * 设置季度.
	 * @param setquater 季度
	 */
    public void setSetquater(Integer setquater) {
        this.setquater = setquater;
    }
	/**
	 * 获取年.
	 * 
	 * @return 年
	 */
	@Column(nullable=true

		,name="SETYEAR"
	)
    public Integer getSetyear() {
        return setyear;
    }
	/**
	 * 设置年.
	 * @param setyear 年
	 */
    public void setSetyear(Integer setyear) {
        this.setyear = setyear;
    }
	/**
	 * 获取开始时间.
	 * 
	 * @return 开始时间
	 */
	@Column(nullable=true

		,name="START_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getStartTime() {
        return startTime;
    }
	/**
	 * 设置开始时间.
	 * @param startTime 开始时间
	 */
    public void setStartTime(java.util.Date startTime) {
        this.startTime = startTime;
    }
	/**
	 * 获取单位.
	 * 
	 * @return 单位
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="UNIT", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getUnit() {
		return unit;
	}
	/**
	 * 设置单位.
	 * @param unit 单位
	 */
	public void setUnit(SystemCode unit) {
		this.unit = (SystemCode) unit;
	}
	/**
	 * 获取使用实体.
	 * 
	 * @return 使用实体
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="USE_ENTITY", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getUseEntity() {
		return useEntity;
	}
	/**
	 * 设置使用实体.
	 * @param useEntity 使用实体
	 */
	public void setUseEntity(SystemCode useEntity) {
		this.useEntity = (SystemCode) useEntity;
	}
	
	
	protected String _getEntityName() {
		return X6BasicTimeRegion.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
