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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 后台服务.
 * 服务模型，记录运行的后台服务。
 */
@javax.persistence.Entity(name=MESBasicMESServices.JPA_NAME)
@Table(name = MESBasicMESServices.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_backgroundServiceMonitor")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_backgroundServiceMonitor_MESServices")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_backgroundServiceMonitor_MESServices,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicMESServicesConvertor.class})
public class MESBasicMESServices extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_backgroundServiceMonitor";
	public static final String MODEL_CODE = "MESBasic_1_backgroundServiceMonitor_MESServices";
	public static final String DOC_TYPE = "MESBasic_backgroundServiceMonitor_mESServices";
	public static final String TABLE_NAME = "mesbasic_messervices";
	public static final String JPA_NAME = "MESBasicMESServices";


		private Boolean active = false; // 运行状态

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date lastRunningTime ; // 上一次运行时间


		private String serviceCode ; // 服务编码
	@BAPIsMainDisplay

		private String serviceName ; // 服务名称
	
	private List<MESBasicServiceLogger> serviceLoggerList;
	
	public void setServiceLoggerList(List<MESBasicServiceLogger> serviceLoggerList){
		this.serviceLoggerList = serviceLoggerList;
	}
	@Transient
	public List<MESBasicServiceLogger> getServiceLoggerList(){
		return serviceLoggerList;
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
	 * 获取运行状态.
	 * true表示可以运行，false表示不可以运行
	 * @return 运行状态
	 */
	@Column(nullable=true

		,name="ACTIVE"
	)
    public Boolean getActive() {
        return null == active ? false : active;
    }
	/**
	 * 设置运行状态.
	 * @param active 运行状态
	 */
    public void setActive(Boolean active) {
        this.active = active;
    }
	/**
	 * 获取上一次运行时间.
	 * 服务上一次运行的时间
	 * @return 上一次运行时间
	 */
	@Column(nullable=true

		,name="LAST_RUNNING_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getLastRunningTime() {
        return lastRunningTime;
    }
	/**
	 * 设置上一次运行时间.
	 * @param lastRunningTime 上一次运行时间
	 */
    public void setLastRunningTime(java.util.Date lastRunningTime) {
        this.lastRunningTime = lastRunningTime;
    }
	/**
	 * 获取服务编码.
	 * 服务的编码
	 * @return 服务编码
	 */
	@Column(

		length = 200
		,name="SERVICE_CODE"
	)
	@Index(name="index_MESServices_serviceCode")	
    public String getServiceCode() {
        return serviceCode;
    }
	/**
	 * 设置服务编码.
	 * @param serviceCode 服务编码
	 */
    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }
	/**
	 * 获取服务名称.
	 * 用于描述的服务的名称。
	 * @return 服务名称
	 */
	@Column(nullable=true

		,length = 400
		,name="SERVICE_NAME"
	)
    public String getServiceName() {
        return serviceName;
    }
	/**
	 * 设置服务名称.
	 * @param serviceName 服务名称
	 */
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
	
	
	protected String _getEntityName() {
		return MESBasicMESServices.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_backgroundServiceMonitor_MESServices,MESBasic_1) */
// 自定义代码
	
	public static String DISPATCH_SERVICE_NAME = "批次管理调度服务";
	public static String DISPATCH_SERVICE_CODE = "BatchManageDispatcher";
/* CUSTOM CODE END */
}
