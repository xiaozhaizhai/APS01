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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 供应商.
 */
@javax.persistence.Entity(name=MESBasicBaseVendor.JPA_NAME)
@Table(name = MESBasicBaseVendor.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_baseVendor")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_baseVendor_BaseVendor")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "VENDOR_CREATEPERSON")),
		@AttributeOverride(name="createTime", column=@Column(name = "VENDOR_CREATETIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "VENDOR_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "VENDOR_MODIFYPERSON")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "VENDOR_MODIFYTIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicBaseVendorConvertor.class})
public class MESBasicBaseVendor extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_baseVendor";
	public static final String MODEL_CODE = "MESBasic_1_baseVendor_BaseVendor";
	public static final String DOC_TYPE = "MESBasic_baseVendor_baseVendor";
	public static final String TABLE_NAME = "s2base_vendor";
	public static final String JPA_NAME = "MESBasicBaseVendor";


		private java.math.BigDecimal lossRate ; // 途耗率(‰)


		private String vendorAccount ; // 银行账号


		private String vendorAddress ; // 地址

		private Integer vendorAheadDays = 
			Integer.valueOf("0")
		; // 到货提醒周期, 


		private java.math.BigDecimal vendorAPMoney ; // 上期应付余额


		private String vendorBank ; // 开户银行

		@BAPIsMneCode
		private String vendorCode ; // 供应商编码


		private String vendorCorpopation ; // 法人
	private MESBasicBaseCustomer vendorCustomerID;
	@BAPSeniorSystemCode(code="1003")
	private String vendorDCCode
; // 地区
	private String vendorDCCodeForDisplay;
	@BAPSeniorSystemCode(code="1007")
	private String vendorDegreeCode
; // 供应商等级
	private String vendorDegreeCodeForDisplay;
	@BAPSeniorSystemCode(code="1002")
	private String vendorDeliveryCode
; // 发运方式
	private String vendorDeliveryCodeForDisplay;
	private Department vendorDepartID;


		private String vendorEmail ; // Email地址

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date vendorEvDate ; // 评估日期
	@BAPSeniorSystemCode(code="VendorEvState")
	private String vendorEvState
		= "5"
		; // 评估状态
	private String vendorEvStateForDisplay;


		private String vendorFax ; // 传真


		private String vendorIntroduce ; // 企业简介


		private String vendorMemo ; // 备注


		private String vendorMobile ; // 手机
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String vendorName ; // 供应商名称


		private String vendorPayCondition ; // 付款条件


		private Integer vendorPayTerm ; // 账期（天）


		private String vendorPhone ; // 电话


		private String vendorPostCode ; // 邮编
	@BAPSeniorSystemCode(code="1005")
	private String vendorProperty
; // 企业性质
	private String vendorPropertyForDisplay;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date vendorRecentSupplyDate ; // 最近供货日期


		private String vendorRegFund ; // 注册资金

		@BAPIsMneCode
		private String vendorShortName ; // 供应商简称
	private Staff vendorStaffID;
	@BAPSeniorSystemCode(code="BaseState")
	private String vendorState
		= "2"
		; // 启用状态
	private String vendorStateForDisplay;


		private String vendorTaxCode ; // 税务登记号

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date vendorTempPeriodF ; // 临时交易开始时间

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date vendorTempPeriodT ; // 临时交易结束时间


		private String vendorTradeCode ; // 工商登记号
	private MESBasicBaseVendorClass vendorVCCode;
	@BAPSeniorSystemCode(code="1004")
	private String vendorVocation
; // 行业
	private String vendorVocationForDisplay;


		private String vendorWeb ; // 主页
	
	
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
	 * 获取途耗率(‰).
	 * 
	 * @return 途耗率(‰)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LOSS_RATE"
	)
    public java.math.BigDecimal getLossRate() {
        return lossRate;
    }
	/**
	 * 设置途耗率(‰).
	 * @param lossRate 途耗率(‰)
	 */
    public void setLossRate(java.math.BigDecimal lossRate) {
        this.lossRate = lossRate;
    }
	/**
	 * 获取银行账号.
	 * 
	 * @return 银行账号
	 */
	@Column(nullable=true

		,length = 50
		,name="VENDOR_ACCOUNT"
	)
    public String getVendorAccount() {
        return vendorAccount;
    }
	/**
	 * 设置银行账号.
	 * @param vendorAccount 银行账号
	 */
    public void setVendorAccount(String vendorAccount) {
        this.vendorAccount = vendorAccount;
    }
	/**
	 * 获取地址.
	 * 
	 * @return 地址
	 */
	@Column(nullable=true

		,length = 200
		,name="VENDOR_ADDRESS"
	)
    public String getVendorAddress() {
        return vendorAddress;
    }
	/**
	 * 设置地址.
	 * @param vendorAddress 地址
	 */
    public void setVendorAddress(String vendorAddress) {
        this.vendorAddress = vendorAddress;
    }
	/**
	 * 获取到货提醒周期.
	 * 
	 * @return 到货提醒周期
	 */
	@Column(nullable=true

		,name="VENDOR_AHEADDAYS"
	)
    public Integer getVendorAheadDays() {
        return vendorAheadDays;
    }
	/**
	 * 设置到货提醒周期.
	 * @param vendorAheadDays 到货提醒周期
	 */
    public void setVendorAheadDays(Integer vendorAheadDays) {
        this.vendorAheadDays = vendorAheadDays;
    }
	/**
	 * 获取上期应付余额.
	 * 
	 * @return 上期应付余额
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="VENDOR_APMONEY"
	)
    public java.math.BigDecimal getVendorAPMoney() {
        return vendorAPMoney;
    }
	/**
	 * 设置上期应付余额.
	 * @param vendorAPMoney 上期应付余额
	 */
    public void setVendorAPMoney(java.math.BigDecimal vendorAPMoney) {
        this.vendorAPMoney = vendorAPMoney;
    }
	/**
	 * 获取开户银行.
	 * 
	 * @return 开户银行
	 */
	@Column(nullable=true

		,length = 100
		,name="VENDOR_BANK"
	)
    public String getVendorBank() {
        return vendorBank;
    }
	/**
	 * 设置开户银行.
	 * @param vendorBank 开户银行
	 */
    public void setVendorBank(String vendorBank) {
        this.vendorBank = vendorBank;
    }
	/**
	 * 获取供应商编码.
	 * 
	 * @return 供应商编码
	 */
	@Column(

		length = 20
		,name="VENDOR_CODE"
	)
	@Index(name="index_BaseVendor_vendorCode")	
    public String getVendorCode() {
        return vendorCode;
    }
	/**
	 * 设置供应商编码.
	 * @param vendorCode 供应商编码
	 */
    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }
	/**
	 * 获取法人.
	 * 
	 * @return 法人
	 */
	@Column(nullable=true

		,length = 60
		,name="VENDOR_CORPORATION"
	)
    public String getVendorCorpopation() {
        return vendorCorpopation;
    }
	/**
	 * 设置法人.
	 * @param vendorCorpopation 法人
	 */
    public void setVendorCorpopation(String vendorCorpopation) {
        this.vendorCorpopation = vendorCorpopation;
    }
	@OneToOne
	@JoinColumn(name = "VENDOR_CUSTOMERID", referencedColumnName="CUSTOMER_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicBaseCustomer getVendorCustomerID() {
        return vendorCustomerID;
    }
    public void setVendorCustomerID(MESBasicBaseCustomer vendorCustomerID) {
        this.vendorCustomerID = vendorCustomerID;
    }
	/**
	 * 获取地区.
	 * 
	 * @return 地区
	 */
	@Column(name="VENDOR_DCCODE")
	public String getVendorDCCode() {
		return vendorDCCode;
	}
	/**
	 * 设置地区.
	 * @param vendorDCCode 地区
	 */
	public void setVendorDCCode(String vendorDCCode) {
		this.vendorDCCode = vendorDCCode;
	}
	
	@javax.persistence.Transient
	public String getVendorDCCodeForDisplay() {
		return vendorDCCodeForDisplay;
	}
	
	public void setVendorDCCodeForDisplay(String vendorDCCodeForDisplay) {
		this.vendorDCCodeForDisplay = vendorDCCodeForDisplay;
	}
	/**
	 * 获取供应商等级.
	 * 
	 * @return 供应商等级
	 */
	@Column(name="VENDOR_DEGREECODE")
	public String getVendorDegreeCode() {
		return vendorDegreeCode;
	}
	/**
	 * 设置供应商等级.
	 * @param vendorDegreeCode 供应商等级
	 */
	public void setVendorDegreeCode(String vendorDegreeCode) {
		this.vendorDegreeCode = vendorDegreeCode;
	}
	
	@javax.persistence.Transient
	public String getVendorDegreeCodeForDisplay() {
		return vendorDegreeCodeForDisplay;
	}
	
	public void setVendorDegreeCodeForDisplay(String vendorDegreeCodeForDisplay) {
		this.vendorDegreeCodeForDisplay = vendorDegreeCodeForDisplay;
	}
	/**
	 * 获取发运方式.
	 * 
	 * @return 发运方式
	 */
	@Column(name="VENDOR_DELIVERYCODE")
	public String getVendorDeliveryCode() {
		return vendorDeliveryCode;
	}
	/**
	 * 设置发运方式.
	 * @param vendorDeliveryCode 发运方式
	 */
	public void setVendorDeliveryCode(String vendorDeliveryCode) {
		this.vendorDeliveryCode = vendorDeliveryCode;
	}
	
	@javax.persistence.Transient
	public String getVendorDeliveryCodeForDisplay() {
		return vendorDeliveryCodeForDisplay;
	}
	
	public void setVendorDeliveryCodeForDisplay(String vendorDeliveryCodeForDisplay) {
		this.vendorDeliveryCodeForDisplay = vendorDeliveryCodeForDisplay;
	}
	@OneToOne
	@JoinColumn(name = "VENDOR_DEPARTID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getVendorDepartID() {
        return vendorDepartID;
    }
    public void setVendorDepartID(Department vendorDepartID) {
        this.vendorDepartID = vendorDepartID;
    }
	/**
	 * 获取Email地址.
	 * 
	 * @return Email地址
	 */
	@Column(nullable=true

		,length = 30
		,name="VENDOR_EMAIL"
	)
    public String getVendorEmail() {
        return vendorEmail;
    }
	/**
	 * 设置Email地址.
	 * @param vendorEmail Email地址
	 */
    public void setVendorEmail(String vendorEmail) {
        this.vendorEmail = vendorEmail;
    }
	/**
	 * 获取评估日期.
	 * 
	 * @return 评估日期
	 */
	@Column(nullable=true

		,name="VENDOR_EVDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getVendorEvDate() {
        return vendorEvDate;
    }
	/**
	 * 设置评估日期.
	 * @param vendorEvDate 评估日期
	 */
    public void setVendorEvDate(java.util.Date vendorEvDate) {
        this.vendorEvDate = vendorEvDate;
    }
	/**
	 * 获取评估状态.
	 * 
	 * @return 评估状态
	 */
	@Column(name="VENDOR_EVSTATE")
	public String getVendorEvState() {
		return vendorEvState;
	}
	/**
	 * 设置评估状态.
	 * @param vendorEvState 评估状态
	 */
	public void setVendorEvState(String vendorEvState) {
		this.vendorEvState = vendorEvState;
	}
	
	@javax.persistence.Transient
	public String getVendorEvStateForDisplay() {
		return vendorEvStateForDisplay;
	}
	
	public void setVendorEvStateForDisplay(String vendorEvStateForDisplay) {
		this.vendorEvStateForDisplay = vendorEvStateForDisplay;
	}
	/**
	 * 获取传真.
	 * 
	 * @return 传真
	 */
	@Column(nullable=true

		,length = 20
		,name="VENDOR_FAX"
	)
    public String getVendorFax() {
        return vendorFax;
    }
	/**
	 * 设置传真.
	 * @param vendorFax 传真
	 */
    public void setVendorFax(String vendorFax) {
        this.vendorFax = vendorFax;
    }
	/**
	 * 获取企业简介.
	 * 
	 * @return 企业简介
	 */
	@Column(nullable=true

		,length = 2000
		,name="VENDOR_INTRODUCE"
	)
    public String getVendorIntroduce() {
        return vendorIntroduce;
    }
	/**
	 * 设置企业简介.
	 * @param vendorIntroduce 企业简介
	 */
    public void setVendorIntroduce(String vendorIntroduce) {
        this.vendorIntroduce = vendorIntroduce;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 500
		,name="VENDOR_MEMO"
	)
    public String getVendorMemo() {
        return vendorMemo;
    }
	/**
	 * 设置备注.
	 * @param vendorMemo 备注
	 */
    public void setVendorMemo(String vendorMemo) {
        this.vendorMemo = vendorMemo;
    }
	/**
	 * 获取手机.
	 * 
	 * @return 手机
	 */
	@Column(nullable=true

		,length = 50
		,name="VENDOR_MOBILE"
	)
    public String getVendorMobile() {
        return vendorMobile;
    }
	/**
	 * 设置手机.
	 * @param vendorMobile 手机
	 */
    public void setVendorMobile(String vendorMobile) {
        this.vendorMobile = vendorMobile;
    }
	/**
	 * 获取供应商名称.
	 * 
	 * @return 供应商名称
	 */
	@Column(nullable=true

		,length = 200
		,name="VENDOR_NAME"
	)
    public String getVendorName() {
        return vendorName;
    }
	/**
	 * 设置供应商名称.
	 * @param vendorName 供应商名称
	 */
    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }
	/**
	 * 获取付款条件.
	 * 
	 * @return 付款条件
	 */
	@Column(nullable=true

		,length = 100
		,name="VENDOR_PAYCONDITION"
	)
    public String getVendorPayCondition() {
        return vendorPayCondition;
    }
	/**
	 * 设置付款条件.
	 * @param vendorPayCondition 付款条件
	 */
    public void setVendorPayCondition(String vendorPayCondition) {
        this.vendorPayCondition = vendorPayCondition;
    }
	/**
	 * 获取账期（天）.
	 * 
	 * @return 账期（天）
	 */
	@Column(nullable=true

		,name="VENDOR_PAYTERM"
	)
    public Integer getVendorPayTerm() {
        return vendorPayTerm;
    }
	/**
	 * 设置账期（天）.
	 * @param vendorPayTerm 账期（天）
	 */
    public void setVendorPayTerm(Integer vendorPayTerm) {
        this.vendorPayTerm = vendorPayTerm;
    }
	/**
	 * 获取电话.
	 * 
	 * @return 电话
	 */
	@Column(nullable=true

		,length = 50
		,name="VENDOR_PHONE"
	)
    public String getVendorPhone() {
        return vendorPhone;
    }
	/**
	 * 设置电话.
	 * @param vendorPhone 电话
	 */
    public void setVendorPhone(String vendorPhone) {
        this.vendorPhone = vendorPhone;
    }
	/**
	 * 获取邮编.
	 * 
	 * @return 邮编
	 */
	@Column(nullable=true

		,length = 8
		,name="VENDOR_POSTCODE"
	)
    public String getVendorPostCode() {
        return vendorPostCode;
    }
	/**
	 * 设置邮编.
	 * @param vendorPostCode 邮编
	 */
    public void setVendorPostCode(String vendorPostCode) {
        this.vendorPostCode = vendorPostCode;
    }
	/**
	 * 获取企业性质.
	 * 
	 * @return 企业性质
	 */
	@Column(name="VENDOR_PROPERTY")
	public String getVendorProperty() {
		return vendorProperty;
	}
	/**
	 * 设置企业性质.
	 * @param vendorProperty 企业性质
	 */
	public void setVendorProperty(String vendorProperty) {
		this.vendorProperty = vendorProperty;
	}
	
	@javax.persistence.Transient
	public String getVendorPropertyForDisplay() {
		return vendorPropertyForDisplay;
	}
	
	public void setVendorPropertyForDisplay(String vendorPropertyForDisplay) {
		this.vendorPropertyForDisplay = vendorPropertyForDisplay;
	}
	/**
	 * 获取最近供货日期.
	 * 
	 * @return 最近供货日期
	 */
	@Column(nullable=true

		,name="VENDOR_RECENTSUPPLYDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getVendorRecentSupplyDate() {
        return vendorRecentSupplyDate;
    }
	/**
	 * 设置最近供货日期.
	 * @param vendorRecentSupplyDate 最近供货日期
	 */
    public void setVendorRecentSupplyDate(java.util.Date vendorRecentSupplyDate) {
        this.vendorRecentSupplyDate = vendorRecentSupplyDate;
    }
	/**
	 * 获取注册资金.
	 * 
	 * @return 注册资金
	 */
	@Column(nullable=true

		,length = 50
		,name="VENDOR_REGFUND"
	)
    public String getVendorRegFund() {
        return vendorRegFund;
    }
	/**
	 * 设置注册资金.
	 * @param vendorRegFund 注册资金
	 */
    public void setVendorRegFund(String vendorRegFund) {
        this.vendorRegFund = vendorRegFund;
    }
	/**
	 * 获取供应商简称.
	 * 
	 * @return 供应商简称
	 */
	@Column(nullable=true

		,length = 200
		,name="VENDOR_SHORTNAME"
	)
    public String getVendorShortName() {
        return vendorShortName;
    }
	/**
	 * 设置供应商简称.
	 * @param vendorShortName 供应商简称
	 */
    public void setVendorShortName(String vendorShortName) {
        this.vendorShortName = vendorShortName;
    }
	@OneToOne
	@JoinColumn(name = "VENDOR_STAFFID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getVendorStaffID() {
        return vendorStaffID;
    }
    public void setVendorStaffID(Staff vendorStaffID) {
        this.vendorStaffID = vendorStaffID;
    }
	/**
	 * 获取启用状态.
	 * 
	 * @return 启用状态
	 */
	@Column(name="VENDOR_STATE")
	public String getVendorState() {
		return vendorState;
	}
	/**
	 * 设置启用状态.
	 * @param vendorState 启用状态
	 */
	public void setVendorState(String vendorState) {
		this.vendorState = vendorState;
	}
	
	@javax.persistence.Transient
	public String getVendorStateForDisplay() {
		return vendorStateForDisplay;
	}
	
	public void setVendorStateForDisplay(String vendorStateForDisplay) {
		this.vendorStateForDisplay = vendorStateForDisplay;
	}
	/**
	 * 获取税务登记号.
	 * 
	 * @return 税务登记号
	 */
	@Column(nullable=true

		,length = 20
		,name="VENDOR_TAXCODE"
	)
    public String getVendorTaxCode() {
        return vendorTaxCode;
    }
	/**
	 * 设置税务登记号.
	 * @param vendorTaxCode 税务登记号
	 */
    public void setVendorTaxCode(String vendorTaxCode) {
        this.vendorTaxCode = vendorTaxCode;
    }
	/**
	 * 获取临时交易开始时间.
	 * 
	 * @return 临时交易开始时间
	 */
	@Column(nullable=true

		,name="VENDOR_TEMPPERIODF"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getVendorTempPeriodF() {
        return vendorTempPeriodF;
    }
	/**
	 * 设置临时交易开始时间.
	 * @param vendorTempPeriodF 临时交易开始时间
	 */
    public void setVendorTempPeriodF(java.util.Date vendorTempPeriodF) {
        this.vendorTempPeriodF = vendorTempPeriodF;
    }
	/**
	 * 获取临时交易结束时间.
	 * 
	 * @return 临时交易结束时间
	 */
	@Column(nullable=true

		,name="VENDOR_TEMPPERIODT"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getVendorTempPeriodT() {
        return vendorTempPeriodT;
    }
	/**
	 * 设置临时交易结束时间.
	 * @param vendorTempPeriodT 临时交易结束时间
	 */
    public void setVendorTempPeriodT(java.util.Date vendorTempPeriodT) {
        this.vendorTempPeriodT = vendorTempPeriodT;
    }
	/**
	 * 获取工商登记号.
	 * 
	 * @return 工商登记号
	 */
	@Column(nullable=true

		,length = 20
		,name="VENDOR_TRADECODE"
	)
    public String getVendorTradeCode() {
        return vendorTradeCode;
    }
	/**
	 * 设置工商登记号.
	 * @param vendorTradeCode 工商登记号
	 */
    public void setVendorTradeCode(String vendorTradeCode) {
        this.vendorTradeCode = vendorTradeCode;
    }
	@ManyToOne
	@JoinColumn(name = "VENDOR_VCCODE", referencedColumnName="VC_CODE")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicBaseVendorClass getVendorVCCode() {
        return vendorVCCode;
    }
    public void setVendorVCCode(MESBasicBaseVendorClass vendorVCCode) {
        this.vendorVCCode = vendorVCCode;
    }
	/**
	 * 获取行业.
	 * 
	 * @return 行业
	 */
	@Column(name="VENDOR_VOCATION")
	public String getVendorVocation() {
		return vendorVocation;
	}
	/**
	 * 设置行业.
	 * @param vendorVocation 行业
	 */
	public void setVendorVocation(String vendorVocation) {
		this.vendorVocation = vendorVocation;
	}
	
	@javax.persistence.Transient
	public String getVendorVocationForDisplay() {
		return vendorVocationForDisplay;
	}
	
	public void setVendorVocationForDisplay(String vendorVocationForDisplay) {
		this.vendorVocationForDisplay = vendorVocationForDisplay;
	}
	/**
	 * 获取主页.
	 * 
	 * @return 主页
	 */
	@Column(nullable=true

		,length = 50
		,name="VENDOR_WEB"
	)
    public String getVendorWeb() {
        return vendorWeb;
    }
	/**
	 * 设置主页.
	 * @param vendorWeb 主页
	 */
    public void setVendorWeb(String vendorWeb) {
        this.vendorWeb = vendorWeb;
    }
	
	
	protected String _getEntityName() {
		return MESBasicBaseVendor.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
