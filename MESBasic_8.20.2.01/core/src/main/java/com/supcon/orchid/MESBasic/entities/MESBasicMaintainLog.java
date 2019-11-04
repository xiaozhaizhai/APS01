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
 * 维护日志.
 * 记录储罐变更的日志，主要涉及常规信息、储罐换料、以及状态变更。
 */
@javax.persistence.Entity(name=MESBasicMaintainLog.JPA_NAME)
@Table(name = MESBasicMaintainLog.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_container")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_container_MaintainLog")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_container_MaintainLog,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicMaintainLogConvertor.class})
public class MESBasicMaintainLog extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_container";
	public static final String MODEL_CODE = "MESBasic_1_container_MaintainLog";
	public static final String DOC_TYPE = "MESBasic_container_maintainLog";
	public static final String TABLE_NAME = "mesbasic_maintain_logs";
	public static final String JPA_NAME = "MESBasicMaintainLog";


		private String jsonData ; // 数据


		private String logType ; // 日志类型


		private String maintainDept ; // 维护部门


		private String maintainStaff ; // 维护人

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date maintainTime ; // 创建时间


		private String operation ; // 操作


		private String remark ; // 备注
	private MESBasicContainer tank;
	
	
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
	 * 获取数据.
	 * 
	 * @return 数据
	 */
	@Column(nullable=true

		,length = 2000
		,name="JSON_DATA"
	)
    public String getJsonData() {
        return jsonData;
    }
	/**
	 * 设置数据.
	 * @param jsonData 数据
	 */
    public void setJsonData(String jsonData) {
        this.jsonData = jsonData;
    }
	/**
	 * 获取日志类型.
	 * 
	 * @return 日志类型
	 */
	@Column(nullable=true

		,length = 256
		,name="LOG_TYPE"
	)
    public String getLogType() {
        return logType;
    }
	/**
	 * 设置日志类型.
	 * @param logType 日志类型
	 */
    public void setLogType(String logType) {
        this.logType = logType;
    }
	/**
	 * 获取维护部门.
	 * 
	 * @return 维护部门
	 */
	@Column(nullable=true

		,length = 256
		,name="MAINTAIN_DEPT"
	)
    public String getMaintainDept() {
        return maintainDept;
    }
	/**
	 * 设置维护部门.
	 * @param maintainDept 维护部门
	 */
    public void setMaintainDept(String maintainDept) {
        this.maintainDept = maintainDept;
    }
	/**
	 * 获取维护人.
	 * 
	 * @return 维护人
	 */
	@Column(nullable=true

		,length = 256
		,name="MAINTAIN_STAFF"
	)
    public String getMaintainStaff() {
        return maintainStaff;
    }
	/**
	 * 设置维护人.
	 * @param maintainStaff 维护人
	 */
    public void setMaintainStaff(String maintainStaff) {
        this.maintainStaff = maintainStaff;
    }
	/**
	 * 获取创建时间.
	 * 
	 * @return 创建时间
	 */
	@Column(nullable=true

		,name="MAINTAIN_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getMaintainTime() {
        return maintainTime;
    }
	/**
	 * 设置创建时间.
	 * @param maintainTime 创建时间
	 */
    public void setMaintainTime(java.util.Date maintainTime) {
        this.maintainTime = maintainTime;
    }
	/**
	 * 获取操作.
	 * 
	 * @return 操作
	 */
	@Column(nullable=true

		,length = 256
		,name="OPERATION"
	)
    public String getOperation() {
        return operation;
    }
	/**
	 * 设置操作.
	 * @param operation 操作
	 */
    public void setOperation(String operation) {
        this.operation = operation;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
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
	@JoinColumn(name = "TANK", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicContainer getTank() {
        return tank;
    }
    public void setTank(MESBasicContainer tank) {
        this.tank = tank;
    }
	
	
	protected String _getEntityName() {
		return MESBasicMaintainLog.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_container_MaintainLog,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
