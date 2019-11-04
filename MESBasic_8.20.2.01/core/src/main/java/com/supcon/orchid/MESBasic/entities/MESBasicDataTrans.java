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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 数据接口.
 * 第三方数据接口。 第三方系统将把与本系统交互的数据填写到这张表里与本系统进行交互。
 */
@javax.persistence.Entity(name=MESBasicDataTrans.JPA_NAME)
@Table(name = MESBasicDataTrans.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_thirdDataHandler")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_thirdDataHandler_DataTrans")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicDataTransConvertor.class})
public class MESBasicDataTrans extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_thirdDataHandler";
	public static final String MODEL_CODE = "MESBasic_1_thirdDataHandler_DataTrans";
	public static final String DOC_TYPE = "MESBasic_thirdDataHandler_dataTrans";
	public static final String TABLE_NAME = "mesbasic_data_trans";
	public static final String JPA_NAME = "MESBasicDataTrans";
	private SystemCode businessType
; // 业务类型


		private String content ; // 业务数据

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date dataTime ; // 数据时间


		private Boolean processed = false; // 处理标记


		private String tag ; // 位号


		private java.math.BigDecimal tvalue ; // 位号值
	
	
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
	 * 获取业务类型.
	 * 
	 * @return 业务类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BUSINESS_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBusinessType() {
		return businessType;
	}
	/**
	 * 设置业务类型.
	 * @param businessType 业务类型
	 */
	public void setBusinessType(SystemCode businessType) {
		this.businessType = (SystemCode) businessType;
	}
	/**
	 * 获取业务数据.
	 * 用于通用接口。 所有由除PIMS以外的系统需要与MES交互的时候，都通过这个字段进行。
	 * @return 业务数据
	 */
	@Column(nullable=true

		,length = 2000
		,name="CONTENT"
	)
    public String getContent() {
        return content;
    }
	/**
	 * 设置业务数据.
	 * @param content 业务数据
	 */
    public void setContent(String content) {
        this.content = content;
    }
	/**
	 * 获取数据时间.
	 * 由PIMS插入到接口表时，PIMS位号对应的数值的时间
	 * @return 数据时间
	 */
	@Column(nullable=true

		,name="DATA_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDataTime() {
        return dataTime;
    }
	/**
	 * 设置数据时间.
	 * @param dataTime 数据时间
	 */
    public void setDataTime(java.util.Date dataTime) {
        this.dataTime = dataTime;
    }
	/**
	 * 获取处理标记.
	 * 标记当前数据记录是否已经被相应的业务模块代码处理。
	 * @return 处理标记
	 */
	@Column(nullable=true

		,name="PROCESSED"
	)
	@Index(name="index_DataTrans_processed")	
    public Boolean getProcessed() {
        return null == processed ? false : processed;
    }
	/**
	 * 设置处理标记.
	 * @param processed 处理标记
	 */
    public void setProcessed(Boolean processed) {
        this.processed = processed;
    }
	/**
	 * 获取位号.
	 * PIMS中的一个位号点。
	 * @return 位号
	 */
	@Column(nullable=true

		,length = 500
		,name="TAG"
	)
    public String getTag() {
        return tag;
    }
	/**
	 * 设置位号.
	 * @param tag 位号
	 */
    public void setTag(String tag) {
        this.tag = tag;
    }
	/**
	 * 获取位号值.
	 * 
	 * @return 位号值
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="TVALUE"
	)
    public java.math.BigDecimal getTvalue() {
        return tvalue;
    }
	/**
	 * 设置位号值.
	 * @param tvalue 位号值
	 */
    public void setTvalue(java.math.BigDecimal tvalue) {
        this.tvalue = tvalue;
    }
	
	
	protected String _getEntityName() {
		return MESBasicDataTrans.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
