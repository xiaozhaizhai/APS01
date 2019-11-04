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
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 投料明细.
 */
@javax.persistence.Entity(name=WOMBatchChargeDetails.JPA_NAME)
@Table(name = WOMBatchChargeDetails.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_BatchChargeDetails")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_BatchChargeDetails,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMBatchChargeDetailsConvertor.class})
public class WOMBatchChargeDetails extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_BatchChargeDetails";
	public static final String DOC_TYPE = "WOM_produceTask_batchChargeDetails";
	public static final String TABLE_NAME = "wom_batch_charge_details";
	public static final String JPA_NAME = "WOMBatchChargeDetails";


		private java.math.BigDecimal actualUseNum ; // 实际投料量


		private String batch ; // 批号
	private MESBasicProduct good;
	private MESBasicStoreSet placeSet;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date putinDate ; // 投料时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date putinEndDate ; // 投料结束时间
	private Staff putinStaff;


		private String remark ; // 备注
	private WOMProdTaskActiExelog taskActiExelog;
	private WOMProduceTask taskObj;
	private MESBasicWare wareID;
	
	
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
	
	
	@Index(name="IDX_BATCHCHARGEDETA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取实际投料量.
	 * 
	 * @return 实际投料量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ACTUAL_USE_NUM"
	)
    public java.math.BigDecimal getActualUseNum() {
        return actualUseNum;
    }
	/**
	 * 设置实际投料量.
	 * @param actualUseNum 实际投料量
	 */
    public void setActualUseNum(java.math.BigDecimal actualUseNum) {
        this.actualUseNum = actualUseNum;
    }
	/**
	 * 获取批号.
	 * 
	 * @return 批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH"
	)
    public String getBatch() {
        return batch;
    }
	/**
	 * 设置批号.
	 * @param batch 批号
	 */
    public void setBatch(String batch) {
        this.batch = batch;
    }
	@OneToOne
	@JoinColumn(name = "GOOD", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getGood() {
        return good;
    }
    public void setGood(MESBasicProduct good) {
        this.good = good;
    }
	@OneToOne
	@JoinColumn(name = "PLACE_SET", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicStoreSet getPlaceSet() {
        return placeSet;
    }
    public void setPlaceSet(MESBasicStoreSet placeSet) {
        this.placeSet = placeSet;
    }
	/**
	 * 获取投料时间.
	 * 
	 * @return 投料时间
	 */
	@Column(nullable=true

		,name="PUTIN_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPutinDate() {
        return putinDate;
    }
	/**
	 * 设置投料时间.
	 * @param putinDate 投料时间
	 */
    public void setPutinDate(java.util.Date putinDate) {
        this.putinDate = putinDate;
    }
	/**
	 * 获取投料结束时间.
	 * 
	 * @return 投料结束时间
	 */
	@Column(nullable=true

		,name="PUTIN_END_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPutinEndDate() {
        return putinEndDate;
    }
	/**
	 * 设置投料结束时间.
	 * @param putinEndDate 投料结束时间
	 */
    public void setPutinEndDate(java.util.Date putinEndDate) {
        this.putinEndDate = putinEndDate;
    }
	@OneToOne
	@JoinColumn(name = "PUTIN_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getPutinStaff() {
        return putinStaff;
    }
    public void setPutinStaff(Staff putinStaff) {
        this.putinStaff = putinStaff;
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
	@JoinColumn(name = "TASK_ACTI_EXELOG", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProdTaskActiExelog getTaskActiExelog() {
        return taskActiExelog;
    }
    public void setTaskActiExelog(WOMProdTaskActiExelog taskActiExelog) {
        this.taskActiExelog = taskActiExelog;
    }
	@ManyToOne
	@JoinColumn(name = "TASK_OBJ", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getTaskObj() {
        return taskObj;
    }
    public void setTaskObj(WOMProduceTask taskObj) {
        this.taskObj = taskObj;
    }
	@OneToOne
	@JoinColumn(name = "WAREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWareID() {
        return wareID;
    }
    public void setWareID(MESBasicWare wareID) {
        this.wareID = wareID;
    }
	
	
	protected String _getEntityName() {
		return WOMBatchChargeDetails.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_BatchChargeDetails,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
