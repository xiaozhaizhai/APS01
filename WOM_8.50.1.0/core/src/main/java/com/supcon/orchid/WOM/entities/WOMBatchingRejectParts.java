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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 退料记录.
 */
@javax.persistence.Entity(name=WOMBatchingRejectParts.JPA_NAME)
@Table(name = WOMBatchingRejectParts.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_batchingMaterial")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_batchingMaterial_BatchingRejectParts,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMBatchingRejectPartsConvertor.class})
public class WOMBatchingRejectParts extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_batchingMaterial";
	public static final String MODEL_CODE = "WOM_7.5.0.0_batchingMaterial_BatchingRejectParts";
	public static final String DOC_TYPE = "WOM_batchingMaterial_batchingRejectParts";
	public static final String TABLE_NAME = "wom_batching_reject_parts";
	public static final String JPA_NAME = "WOMBatchingRejectParts";
	private WOMBatchingMaterial batchingId;
	private WOMBatchingMaterialPart batchingPartId;


		private String batchNum ; // 生产批号


		private Boolean isReceived = false; // 是否签收
	private WOMProduceTask produceTaskId;


		private String productBatchNum ; // 物料批号

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date receiveDate ; // 接收时间
	private Staff rejectExeStaff;


		private java.math.BigDecimal rejectNum ; // 退料数量
	private MESBasicProduct rejectProduct;
	private WOMRejectReason rejectReasonId;
	private Staff rejectReceiveStaff;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date rejectTime ; // 退料时间


		private String remark ; // 备注
	private MESBasicStoreSet store;


		private String storeText ; // 货位
	private MESBasicWare ware;


		private String wareText ; // 仓库
	
	
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
	
	
	@Index(name="IDX_BATCHINGREJECTP_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@ManyToOne
	@JoinColumn(name = "BATCHING_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMBatchingMaterial getBatchingId() {
        return batchingId;
    }
    public void setBatchingId(WOMBatchingMaterial batchingId) {
        this.batchingId = batchingId;
    }
	@ManyToOne
	@JoinColumn(name = "BATCHING_PART_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMBatchingMaterialPart getBatchingPartId() {
        return batchingPartId;
    }
    public void setBatchingPartId(WOMBatchingMaterialPart batchingPartId) {
        this.batchingPartId = batchingPartId;
    }
	/**
	 * 获取生产批号.
	 * 
	 * @return 生产批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置生产批号.
	 * @param batchNum 生产批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取是否签收.
	 * 
	 * @return 是否签收
	 */
	@Column(nullable=true

		,name="IS_RECEIVED"
	)
    public Boolean getIsReceived() {
        return null == isReceived ? false : isReceived;
    }
	/**
	 * 设置是否签收.
	 * @param isReceived 是否签收
	 */
    public void setIsReceived(Boolean isReceived) {
        this.isReceived = isReceived;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCE_TASK_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getProduceTaskId() {
        return produceTaskId;
    }
    public void setProduceTaskId(WOMProduceTask produceTaskId) {
        this.produceTaskId = produceTaskId;
    }
	/**
	 * 获取物料批号.
	 * 
	 * @return 物料批号
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODUCT_BATCH_NUM"
	)
    public String getProductBatchNum() {
        return productBatchNum;
    }
	/**
	 * 设置物料批号.
	 * @param productBatchNum 物料批号
	 */
    public void setProductBatchNum(String productBatchNum) {
        this.productBatchNum = productBatchNum;
    }
	/**
	 * 获取接收时间.
	 * 
	 * @return 接收时间
	 */
	@Column(nullable=true

		,name="RECEIVE_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getReceiveDate() {
        return receiveDate;
    }
	/**
	 * 设置接收时间.
	 * @param receiveDate 接收时间
	 */
    public void setReceiveDate(java.util.Date receiveDate) {
        this.receiveDate = receiveDate;
    }
	@ManyToOne
	@JoinColumn(name = "REJECT_EXE_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getRejectExeStaff() {
        return rejectExeStaff;
    }
    public void setRejectExeStaff(Staff rejectExeStaff) {
        this.rejectExeStaff = rejectExeStaff;
    }
	/**
	 * 获取退料数量.
	 * 
	 * @return 退料数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="REJECT_NUM"
	)
    public java.math.BigDecimal getRejectNum() {
        return rejectNum;
    }
	/**
	 * 设置退料数量.
	 * @param rejectNum 退料数量
	 */
    public void setRejectNum(java.math.BigDecimal rejectNum) {
        this.rejectNum = rejectNum;
    }
	@ManyToOne
	@JoinColumn(name = "REJECT_PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getRejectProduct() {
        return rejectProduct;
    }
    public void setRejectProduct(MESBasicProduct rejectProduct) {
        this.rejectProduct = rejectProduct;
    }
	@ManyToOne
	@JoinColumn(name = "REJECT_REASON_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMRejectReason getRejectReasonId() {
        return rejectReasonId;
    }
    public void setRejectReasonId(WOMRejectReason rejectReasonId) {
        this.rejectReasonId = rejectReasonId;
    }
	@ManyToOne
	@JoinColumn(name = "REJECT_RECEIVE_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getRejectReceiveStaff() {
        return rejectReceiveStaff;
    }
    public void setRejectReceiveStaff(Staff rejectReceiveStaff) {
        this.rejectReceiveStaff = rejectReceiveStaff;
    }
	/**
	 * 获取退料时间.
	 * 
	 * @return 退料时间
	 */
	@Column(nullable=true

		,name="REJECT_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getRejectTime() {
        return rejectTime;
    }
	/**
	 * 设置退料时间.
	 * @param rejectTime 退料时间
	 */
    public void setRejectTime(java.util.Date rejectTime) {
        this.rejectTime = rejectTime;
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
	@JoinColumn(name = "STORE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicStoreSet getStore() {
        return store;
    }
    public void setStore(MESBasicStoreSet store) {
        this.store = store;
    }
	/**
	 * 获取货位.
	 * 
	 * @return 货位
	 */
	@Column(nullable=true

		,length = 256
		,name="STORE_TEXT"
	)
    public String getStoreText() {
        return storeText;
    }
	/**
	 * 设置货位.
	 * @param storeText 货位
	 */
    public void setStoreText(String storeText) {
        this.storeText = storeText;
    }
	@ManyToOne
	@JoinColumn(name = "WARE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWare() {
        return ware;
    }
    public void setWare(MESBasicWare ware) {
        this.ware = ware;
    }
	/**
	 * 获取仓库.
	 * 
	 * @return 仓库
	 */
	@Column(nullable=true

		,length = 256
		,name="WARE_TEXT"
	)
    public String getWareText() {
        return wareText;
    }
	/**
	 * 设置仓库.
	 * @param wareText 仓库
	 */
    public void setWareText(String wareText) {
        this.wareText = wareText;
    }
	
	
	protected String _getEntityName() {
		return WOMBatchingRejectParts.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_batchingMaterial_BatchingRejectParts,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
