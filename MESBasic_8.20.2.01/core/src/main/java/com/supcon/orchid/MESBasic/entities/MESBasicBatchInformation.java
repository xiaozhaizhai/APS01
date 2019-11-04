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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 批次信息表.
 */
@javax.persistence.Entity(name=MESBasicBatchInformation.JPA_NAME)
@Table(name = MESBasicBatchInformation.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_batchInfo")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_batchInfo_BatchInformation")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_batchInfo_BatchInformation,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicBatchInformationConvertor.class})
public class MESBasicBatchInformation extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_batchInfo";
	public static final String MODEL_CODE = "MESBasic_1_batchInfo_BatchInformation";
	public static final String DOC_TYPE = "MESBasic_batchInfo_batchInformation";
	public static final String TABLE_NAME = "batch_information";
	public static final String JPA_NAME = "MESBasicBatchInformation";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date arriveDate ; // 到货日期


		private String batchNum ; // 批号

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date checkDate ; // 检验日期
	private SystemCode checkState
; // 检验状态


		private Boolean isAvailable = false; // 是否可用


		private String manufacture ; // 生产厂商
	private SystemCode passState
; // 放行状态
	private MESBasicProduct product;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date productionDate ; // 生产日期


		private String provider ; // 供应商

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date purchaseDate ; // 采购日期

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date recheckDate ; // 复检时间


		private Integer reNotify ; // 复检提前提醒(天)
	private SystemCode sourceType
; // 生成源头


		private String supplierBatch ; // 供方批号

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date validDate ; // 有效期
	
	private List<MESBasicBatchDealInfo> batchDealInfoList;
	
	public void setBatchDealInfoList(List<MESBasicBatchDealInfo> batchDealInfoList){
		this.batchDealInfoList = batchDealInfoList;
	}
	@Transient
	public List<MESBasicBatchDealInfo> getBatchDealInfoList(){
		return batchDealInfoList;
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
	 * 获取到货日期.
	 * 
	 * @return 到货日期
	 */
	@Column(nullable=true

		,name="ARRIVE_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getArriveDate() {
        return arriveDate;
    }
	/**
	 * 设置到货日期.
	 * @param arriveDate 到货日期
	 */
    public void setArriveDate(java.util.Date arriveDate) {
        this.arriveDate = arriveDate;
    }
	/**
	 * 获取批号.
	 * 
	 * @return 批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置批号.
	 * @param batchNum 批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取检验日期.
	 * (最近一次检验日期)
	 * @return 检验日期
	 */
	@Column(nullable=true

		,name="CHECK_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getCheckDate() {
        return checkDate;
    }
	/**
	 * 设置检验日期.
	 * @param checkDate 检验日期
	 */
    public void setCheckDate(java.util.Date checkDate) {
        this.checkDate = checkDate;
    }
	/**
	 * 获取检验状态.
	 * 
	 * @return 检验状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CHECK_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getCheckState() {
		return checkState;
	}
	/**
	 * 设置检验状态.
	 * @param checkState 检验状态
	 */
	public void setCheckState(SystemCode checkState) {
		this.checkState = (SystemCode) checkState;
	}
	/**
	 * 获取是否可用.
	 * 
	 * @return 是否可用
	 */
	@Column(nullable=true

		,name="IS_AVAILABLE"
	)
    public Boolean getIsAvailable() {
        return null == isAvailable ? false : isAvailable;
    }
	/**
	 * 设置是否可用.
	 * @param isAvailable 是否可用
	 */
    public void setIsAvailable(Boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
	/**
	 * 获取生产厂商.
	 * 
	 * @return 生产厂商
	 */
	@Column(nullable=true

		,length = 256
		,name="MANUFACTURE"
	)
    public String getManufacture() {
        return manufacture;
    }
	/**
	 * 设置生产厂商.
	 * @param manufacture 生产厂商
	 */
    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }
	/**
	 * 获取放行状态.
	 * 
	 * @return 放行状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PASS_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getPassState() {
		return passState;
	}
	/**
	 * 设置放行状态.
	 * @param passState 放行状态
	 */
	public void setPassState(SystemCode passState) {
		this.passState = (SystemCode) passState;
	}
	@OneToOne
	@JoinColumn(name = "PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct() {
        return product;
    }
    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }
	/**
	 * 获取生产日期.
	 * 
	 * @return 生产日期
	 */
	@Column(nullable=true

		,name="PRODUCTION_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getProductionDate() {
        return productionDate;
    }
	/**
	 * 设置生产日期.
	 * @param productionDate 生产日期
	 */
    public void setProductionDate(java.util.Date productionDate) {
        this.productionDate = productionDate;
    }
	/**
	 * 获取供应商.
	 * 
	 * @return 供应商
	 */
	@Column(nullable=true

		,length = 256
		,name="PROVIDER"
	)
    public String getProvider() {
        return provider;
    }
	/**
	 * 设置供应商.
	 * @param provider 供应商
	 */
    public void setProvider(String provider) {
        this.provider = provider;
    }
	/**
	 * 获取采购日期.
	 * 
	 * @return 采购日期
	 */
	@Column(nullable=true

		,name="PURCHASE_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPurchaseDate() {
        return purchaseDate;
    }
	/**
	 * 设置采购日期.
	 * @param purchaseDate 采购日期
	 */
    public void setPurchaseDate(java.util.Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
	/**
	 * 获取复检时间.
	 * 
	 * @return 复检时间
	 */
	@Column(nullable=true

		,name="RECHECK_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getRecheckDate() {
        return recheckDate;
    }
	/**
	 * 设置复检时间.
	 * @param recheckDate 复检时间
	 */
    public void setRecheckDate(java.util.Date recheckDate) {
        this.recheckDate = recheckDate;
    }
	/**
	 * 获取复检提前提醒(天).
	 * 
	 * @return 复检提前提醒(天)
	 */
	@Column(nullable=true

		,name="RE_NOTIFY"
	)
    public Integer getReNotify() {
        return reNotify;
    }
	/**
	 * 设置复检提前提醒(天).
	 * @param reNotify 复检提前提醒(天)
	 */
    public void setReNotify(Integer reNotify) {
        this.reNotify = reNotify;
    }
	/**
	 * 获取生成源头.
	 * 
	 * @return 生成源头
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="SOURCE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getSourceType() {
		return sourceType;
	}
	/**
	 * 设置生成源头.
	 * @param sourceType 生成源头
	 */
	public void setSourceType(SystemCode sourceType) {
		this.sourceType = (SystemCode) sourceType;
	}
	/**
	 * 获取供方批号.
	 * 
	 * @return 供方批号
	 */
	@Column(nullable=true

		,length = 256
		,name="SUPPLIER_BATCH"
	)
    public String getSupplierBatch() {
        return supplierBatch;
    }
	/**
	 * 设置供方批号.
	 * @param supplierBatch 供方批号
	 */
    public void setSupplierBatch(String supplierBatch) {
        this.supplierBatch = supplierBatch;
    }
	/**
	 * 获取有效期.
	 * 
	 * @return 有效期
	 */
	@Column(nullable=true

		,name="VALID_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getValidDate() {
        return validDate;
    }
	/**
	 * 设置有效期.
	 * @param validDate 有效期
	 */
    public void setValidDate(java.util.Date validDate) {
        this.validDate = validDate;
    }
	
	
	protected String _getEntityName() {
		return MESBasicBatchInformation.class.getName();
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
	private String batchInfoIDDealDeptDeleteIds;
	private String batchInfoIDDealDeptAddIds;
	private String batchInfoIDDealDeptmultiselectIDs;
	private String batchInfoIDDealDeptmultiselectNames;

	@javax.persistence.Transient
	public String getBatchInfoIDDealDeptDeleteIds(){
		return this.batchInfoIDDealDeptDeleteIds;
	}

	public void setBatchInfoIDDealDeptDeleteIds(String deleteIds){
		this.batchInfoIDDealDeptDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getBatchInfoIDDealDeptmultiselectIDs(){
		return this.batchInfoIDDealDeptmultiselectIDs;
	}

	public void setBatchInfoIDDealDeptmultiselectIDs(String multiselectIDs){
		this.batchInfoIDDealDeptmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getBatchInfoIDDealDeptmultiselectNames(){
		return this.batchInfoIDDealDeptmultiselectNames;
	}

	public void setBatchInfoIDDealDeptmultiselectNames(String multiselectNames){
		this.batchInfoIDDealDeptmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getBatchInfoIDDealDeptAddIds(){
		return this.batchInfoIDDealDeptAddIds;
	}

	public void setBatchInfoIDDealDeptAddIds(String addIds){
		this.batchInfoIDDealDeptAddIds = addIds;
	}
	private String batchInfoIDDealStaffDeleteIds;
	private String batchInfoIDDealStaffAddIds;
	private String batchInfoIDDealStaffmultiselectIDs;
	private String batchInfoIDDealStaffmultiselectNames;

	@javax.persistence.Transient
	public String getBatchInfoIDDealStaffDeleteIds(){
		return this.batchInfoIDDealStaffDeleteIds;
	}

	public void setBatchInfoIDDealStaffDeleteIds(String deleteIds){
		this.batchInfoIDDealStaffDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getBatchInfoIDDealStaffmultiselectIDs(){
		return this.batchInfoIDDealStaffmultiselectIDs;
	}

	public void setBatchInfoIDDealStaffmultiselectIDs(String multiselectIDs){
		this.batchInfoIDDealStaffmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getBatchInfoIDDealStaffmultiselectNames(){
		return this.batchInfoIDDealStaffmultiselectNames;
	}

	public void setBatchInfoIDDealStaffmultiselectNames(String multiselectNames){
		this.batchInfoIDDealStaffmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getBatchInfoIDDealStaffAddIds(){
		return this.batchInfoIDDealStaffAddIds;
	}

	public void setBatchInfoIDDealStaffAddIds(String addIds){
		this.batchInfoIDDealStaffAddIds = addIds;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_batchInfo_BatchInformation,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
