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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 客户.
 */
@javax.persistence.Entity(name=MESBasicBaseCustomer.JPA_NAME)
@Table(name = MESBasicBaseCustomer.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_baseCustomer")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_baseCustomer_BaseCustomer")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CUSTOMER_CREATEPERSON")),
		@AttributeOverride(name="createTime", column=@Column(name = "CUSTOMER_CREATETIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "CUSTOMER_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "CUSTOMER_MODIFYPERSON")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "CUSTOMER_MODIFYTIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "CUSTOMER_OWNER")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicBaseCustomerConvertor.class})
public class MESBasicBaseCustomer extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_baseCustomer";
	public static final String MODEL_CODE = "MESBasic_1_baseCustomer_BaseCustomer";
	public static final String DOC_TYPE = "MESBasic_baseCustomer_baseCustomer";
	public static final String TABLE_NAME = "s2base_customer";
	public static final String JPA_NAME = "MESBasicBaseCustomer";


		private String customerAccount ; // 银行账号


		private String customerAddress ; // 地址


		private String customerBank ; // 开户行
	private MESBasicBaseCustomerClass customerCCCode;

		@BAPIsMneCode
		private String customerCode ; // 客户编码


		private String customerCorporation ; // 法人

		private Integer customerCreditLimit = 
			Integer.valueOf("0")
		; // 信用期限, 

		private java.math.BigDecimal customerCreditLine = 
			java.math.BigDecimal.valueOf(Double.valueOf("0.00"))
		; // 信用额度, 


		private String customerCreditMemo ; // 信贷文本
	@BAPSeniorSystemCode(code="1003")
	private String customerDCCode
; // 地区
	private String customerDCCodeForDisplay;
	@BAPSeniorSystemCode(code="1006")
	private String customerDegreeCode
; // 客户等级
	private String customerDegreeCodeForDisplay;
	private Department customerDepartID;


		private String customerEmail ; // Email地址


		private String customerFax ; // 传真

		private Integer customerFreezen = 
			Integer.valueOf("0")
		; // 信贷冻结状态, 


		private String customerIntroduce ; // 企业简介


		private String customerInvoiceAddress ; // 开票地址


		private String customerInvoicePhone ; // 开票地点电话
	@BAPSeniorSystemCode(code="WhetherOrNot")
	private String customerIsBlack
		= "0"
		; // 是否黑名单
	private String customerIsBlackForDisplay;


		private String customerMemo ; // 备注


		private String customerMobile ; // 手机
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String customerName ; // 客户名称


		private String customerPayCondition ; // 付款条件


		private String customerPhone ; // 电话


		private String customerPostCode ; // 邮编
	@BAPSeniorSystemCode(code="1005")
	private String customerProperty
; // 企业性质
	private String customerPropertyForDisplay;


		private String customerRegFund ; // 注册资金


		private String customerShortName ; // 客户简称
	@BAPSeniorSystemCode(code="BaseState")
	private String customerState
		= "2"
		; // 启用状态
	private String customerStateForDisplay;


		private String customerTaxCode ; // 税务登记号


		private String customerTradeCode ; // 工商登记号
	@BAPSeniorSystemCode(code="1010")
	private String customerType
; // 客户类型
	private String customerTypeForDisplay;
	private MESBasicBaseVendor customerVendorID;
	@BAPSeniorSystemCode(code="1004")
	private String customerVocation
; // 行业
	private String customerVocationForDisplay;


		private String customerWeb ; // 主页地址
	
	
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
	 * 获取银行账号.
	 * 
	 * @return 银行账号
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_ACCOUNT"
	)
    public String getCustomerAccount() {
        return customerAccount;
    }
	/**
	 * 设置银行账号.
	 * @param customerAccount 银行账号
	 */
    public void setCustomerAccount(String customerAccount) {
        this.customerAccount = customerAccount;
    }
	/**
	 * 获取地址.
	 * 
	 * @return 地址
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_ADDRESS"
	)
    public String getCustomerAddress() {
        return customerAddress;
    }
	/**
	 * 设置地址.
	 * @param customerAddress 地址
	 */
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
	/**
	 * 获取开户行.
	 * 
	 * @return 开户行
	 */
	@Column(nullable=true

		,length = 100
		,name="CUSTOMER_BANK"
	)
    public String getCustomerBank() {
        return customerBank;
    }
	/**
	 * 设置开户行.
	 * @param customerBank 开户行
	 */
    public void setCustomerBank(String customerBank) {
        this.customerBank = customerBank;
    }
	@ManyToOne
	@JoinColumn(name = "CUSTOMER_CCCODE", referencedColumnName="CC_CODE")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicBaseCustomerClass getCustomerCCCode() {
        return customerCCCode;
    }
    public void setCustomerCCCode(MESBasicBaseCustomerClass customerCCCode) {
        this.customerCCCode = customerCCCode;
    }
	/**
	 * 获取客户编码.
	 * 
	 * @return 客户编码
	 */
	@Column(

		length = 20
		,name="CUSTOMER_CODE"
	)
	@Index(name="index_BaseCustomer_customerCode")	
    public String getCustomerCode() {
        return customerCode;
    }
	/**
	 * 设置客户编码.
	 * @param customerCode 客户编码
	 */
    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }
	/**
	 * 获取法人.
	 * 
	 * @return 法人
	 */
	@Column(nullable=true

		,length = 60
		,name="CUSTOMER_CORPORATION"
	)
    public String getCustomerCorporation() {
        return customerCorporation;
    }
	/**
	 * 设置法人.
	 * @param customerCorporation 法人
	 */
    public void setCustomerCorporation(String customerCorporation) {
        this.customerCorporation = customerCorporation;
    }
	/**
	 * 获取信用期限.
	 * 
	 * @return 信用期限
	 */
	@Column(nullable=true

		,name="CUSTOMER_CREDITLIMIT"
	)
    public Integer getCustomerCreditLimit() {
        return customerCreditLimit;
    }
	/**
	 * 设置信用期限.
	 * @param customerCreditLimit 信用期限
	 */
    public void setCustomerCreditLimit(Integer customerCreditLimit) {
        this.customerCreditLimit = customerCreditLimit;
    }
	/**
	 * 获取信用额度.
	 * 
	 * @return 信用额度
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="CUSTOMER_CREDITLINE"
	)
    public java.math.BigDecimal getCustomerCreditLine() {
        return customerCreditLine;
    }
	/**
	 * 设置信用额度.
	 * @param customerCreditLine 信用额度
	 */
    public void setCustomerCreditLine(java.math.BigDecimal customerCreditLine) {
        this.customerCreditLine = customerCreditLine;
    }
	/**
	 * 获取信贷文本.
	 * 
	 * @return 信贷文本
	 */
	@Column(nullable=true

		,length = 512
		,name="CUSTOMER_CREDITMEMO"
	)
    public String getCustomerCreditMemo() {
        return customerCreditMemo;
    }
	/**
	 * 设置信贷文本.
	 * @param customerCreditMemo 信贷文本
	 */
    public void setCustomerCreditMemo(String customerCreditMemo) {
        this.customerCreditMemo = customerCreditMemo;
    }
	/**
	 * 获取地区.
	 * 
	 * @return 地区
	 */
	@Column(name="CUSTOMER_DCCODE")
	public String getCustomerDCCode() {
		return customerDCCode;
	}
	/**
	 * 设置地区.
	 * @param customerDCCode 地区
	 */
	public void setCustomerDCCode(String customerDCCode) {
		this.customerDCCode = customerDCCode;
	}
	
	@javax.persistence.Transient
	public String getCustomerDCCodeForDisplay() {
		return customerDCCodeForDisplay;
	}
	
	public void setCustomerDCCodeForDisplay(String customerDCCodeForDisplay) {
		this.customerDCCodeForDisplay = customerDCCodeForDisplay;
	}
	/**
	 * 获取客户等级.
	 * 
	 * @return 客户等级
	 */
	@Column(name="CUSTOMER_DEGREECODE")
	public String getCustomerDegreeCode() {
		return customerDegreeCode;
	}
	/**
	 * 设置客户等级.
	 * @param customerDegreeCode 客户等级
	 */
	public void setCustomerDegreeCode(String customerDegreeCode) {
		this.customerDegreeCode = customerDegreeCode;
	}
	
	@javax.persistence.Transient
	public String getCustomerDegreeCodeForDisplay() {
		return customerDegreeCodeForDisplay;
	}
	
	public void setCustomerDegreeCodeForDisplay(String customerDegreeCodeForDisplay) {
		this.customerDegreeCodeForDisplay = customerDegreeCodeForDisplay;
	}
	@OneToOne
	@JoinColumn(name = "CUSTOMER_DEPARTID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getCustomerDepartID() {
        return customerDepartID;
    }
    public void setCustomerDepartID(Department customerDepartID) {
        this.customerDepartID = customerDepartID;
    }
	/**
	 * 获取Email地址.
	 * 
	 * @return Email地址
	 */
	@Column(nullable=true

		,length = 30
		,name="CUSTOMER_EMAIL"
	)
    public String getCustomerEmail() {
        return customerEmail;
    }
	/**
	 * 设置Email地址.
	 * @param customerEmail Email地址
	 */
    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }
	/**
	 * 获取传真.
	 * 
	 * @return 传真
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_FAX"
	)
    public String getCustomerFax() {
        return customerFax;
    }
	/**
	 * 设置传真.
	 * @param customerFax 传真
	 */
    public void setCustomerFax(String customerFax) {
        this.customerFax = customerFax;
    }
	/**
	 * 获取信贷冻结状态.
	 * 
	 * @return 信贷冻结状态
	 */
	@Column(nullable=true

		,name="CUSTOMER_FREEZEN"
	)
    public Integer getCustomerFreezen() {
        return customerFreezen;
    }
	/**
	 * 设置信贷冻结状态.
	 * @param customerFreezen 信贷冻结状态
	 */
    public void setCustomerFreezen(Integer customerFreezen) {
        this.customerFreezen = customerFreezen;
    }
	/**
	 * 获取企业简介.
	 * 
	 * @return 企业简介
	 */
	@Column(nullable=true

		,length = 2000
		,name="CUSTOMER_INTRODUCE"
	)
    public String getCustomerIntroduce() {
        return customerIntroduce;
    }
	/**
	 * 设置企业简介.
	 * @param customerIntroduce 企业简介
	 */
    public void setCustomerIntroduce(String customerIntroduce) {
        this.customerIntroduce = customerIntroduce;
    }
	/**
	 * 获取开票地址.
	 * 
	 * @return 开票地址
	 */
	@Column(nullable=true

		,length = 600
		,name="CUSTOMER_INVOICEADDRESS"
	)
    public String getCustomerInvoiceAddress() {
        return customerInvoiceAddress;
    }
	/**
	 * 设置开票地址.
	 * @param customerInvoiceAddress 开票地址
	 */
    public void setCustomerInvoiceAddress(String customerInvoiceAddress) {
        this.customerInvoiceAddress = customerInvoiceAddress;
    }
	/**
	 * 获取开票地点电话.
	 * 
	 * @return 开票地点电话
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_INVOICEPHONE"
	)
    public String getCustomerInvoicePhone() {
        return customerInvoicePhone;
    }
	/**
	 * 设置开票地点电话.
	 * @param customerInvoicePhone 开票地点电话
	 */
    public void setCustomerInvoicePhone(String customerInvoicePhone) {
        this.customerInvoicePhone = customerInvoicePhone;
    }
	/**
	 * 获取是否黑名单.
	 * 
	 * @return 是否黑名单
	 */
	@Column(name="CUSTOMER_ISBLACK")
	public String getCustomerIsBlack() {
		return customerIsBlack;
	}
	/**
	 * 设置是否黑名单.
	 * @param customerIsBlack 是否黑名单
	 */
	public void setCustomerIsBlack(String customerIsBlack) {
		this.customerIsBlack = customerIsBlack;
	}
	
	@javax.persistence.Transient
	public String getCustomerIsBlackForDisplay() {
		return customerIsBlackForDisplay;
	}
	
	public void setCustomerIsBlackForDisplay(String customerIsBlackForDisplay) {
		this.customerIsBlackForDisplay = customerIsBlackForDisplay;
	}
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="CUSTOMER_MEMO"
	)
    public String getCustomerMemo() {
        return customerMemo;
    }
	/**
	 * 设置备注.
	 * @param customerMemo 备注
	 */
    public void setCustomerMemo(String customerMemo) {
        this.customerMemo = customerMemo;
    }
	/**
	 * 获取手机.
	 * 
	 * @return 手机
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_MOBILE"
	)
    public String getCustomerMobile() {
        return customerMobile;
    }
	/**
	 * 设置手机.
	 * @param customerMobile 手机
	 */
    public void setCustomerMobile(String customerMobile) {
        this.customerMobile = customerMobile;
    }
	/**
	 * 获取客户名称.
	 * 
	 * @return 客户名称
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_NAME"
	)
    public String getCustomerName() {
        return customerName;
    }
	/**
	 * 设置客户名称.
	 * @param customerName 客户名称
	 */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
	/**
	 * 获取付款条件.
	 * 
	 * @return 付款条件
	 */
	@Column(nullable=true

		,length = 100
		,name="CUSTOMER_PAYCONDITION"
	)
    public String getCustomerPayCondition() {
        return customerPayCondition;
    }
	/**
	 * 设置付款条件.
	 * @param customerPayCondition 付款条件
	 */
    public void setCustomerPayCondition(String customerPayCondition) {
        this.customerPayCondition = customerPayCondition;
    }
	/**
	 * 获取电话.
	 * 
	 * @return 电话
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_PHONE"
	)
    public String getCustomerPhone() {
        return customerPhone;
    }
	/**
	 * 设置电话.
	 * @param customerPhone 电话
	 */
    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }
	/**
	 * 获取邮编.
	 * 
	 * @return 邮编
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_POSTCODE"
	)
    public String getCustomerPostCode() {
        return customerPostCode;
    }
	/**
	 * 设置邮编.
	 * @param customerPostCode 邮编
	 */
    public void setCustomerPostCode(String customerPostCode) {
        this.customerPostCode = customerPostCode;
    }
	/**
	 * 获取企业性质.
	 * 
	 * @return 企业性质
	 */
	@Column(name="CUSTOMER_PROPERTY")
	public String getCustomerProperty() {
		return customerProperty;
	}
	/**
	 * 设置企业性质.
	 * @param customerProperty 企业性质
	 */
	public void setCustomerProperty(String customerProperty) {
		this.customerProperty = customerProperty;
	}
	
	@javax.persistence.Transient
	public String getCustomerPropertyForDisplay() {
		return customerPropertyForDisplay;
	}
	
	public void setCustomerPropertyForDisplay(String customerPropertyForDisplay) {
		this.customerPropertyForDisplay = customerPropertyForDisplay;
	}
	/**
	 * 获取注册资金.
	 * 
	 * @return 注册资金
	 */
	@Column(nullable=true

		,length = 50
		,name="CUSTOMER_REGFUND"
	)
    public String getCustomerRegFund() {
        return customerRegFund;
    }
	/**
	 * 设置注册资金.
	 * @param customerRegFund 注册资金
	 */
    public void setCustomerRegFund(String customerRegFund) {
        this.customerRegFund = customerRegFund;
    }
	/**
	 * 获取客户简称.
	 * 
	 * @return 客户简称
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_SHORTNAME"
	)
    public String getCustomerShortName() {
        return customerShortName;
    }
	/**
	 * 设置客户简称.
	 * @param customerShortName 客户简称
	 */
    public void setCustomerShortName(String customerShortName) {
        this.customerShortName = customerShortName;
    }
	/**
	 * 获取启用状态.
	 * 
	 * @return 启用状态
	 */
	@Column(name="CUSTOMER_STATE")
	public String getCustomerState() {
		return customerState;
	}
	/**
	 * 设置启用状态.
	 * @param customerState 启用状态
	 */
	public void setCustomerState(String customerState) {
		this.customerState = customerState;
	}
	
	@javax.persistence.Transient
	public String getCustomerStateForDisplay() {
		return customerStateForDisplay;
	}
	
	public void setCustomerStateForDisplay(String customerStateForDisplay) {
		this.customerStateForDisplay = customerStateForDisplay;
	}
	/**
	 * 获取税务登记号.
	 * 
	 * @return 税务登记号
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_TAXCODE"
	)
    public String getCustomerTaxCode() {
        return customerTaxCode;
    }
	/**
	 * 设置税务登记号.
	 * @param customerTaxCode 税务登记号
	 */
    public void setCustomerTaxCode(String customerTaxCode) {
        this.customerTaxCode = customerTaxCode;
    }
	/**
	 * 获取工商登记号.
	 * 
	 * @return 工商登记号
	 */
	@Column(nullable=true

		,length = 200
		,name="CUSTOMER_TRADECODE"
	)
    public String getCustomerTradeCode() {
        return customerTradeCode;
    }
	/**
	 * 设置工商登记号.
	 * @param customerTradeCode 工商登记号
	 */
    public void setCustomerTradeCode(String customerTradeCode) {
        this.customerTradeCode = customerTradeCode;
    }
	/**
	 * 获取客户类型.
	 * 
	 * @return 客户类型
	 */
	@Column(name="CUSTOMER_TYPE")
	public String getCustomerType() {
		return customerType;
	}
	/**
	 * 设置客户类型.
	 * @param customerType 客户类型
	 */
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	
	@javax.persistence.Transient
	public String getCustomerTypeForDisplay() {
		return customerTypeForDisplay;
	}
	
	public void setCustomerTypeForDisplay(String customerTypeForDisplay) {
		this.customerTypeForDisplay = customerTypeForDisplay;
	}
	@OneToOne
	@JoinColumn(name = "CUSTOMER_VENDORID", referencedColumnName="VENDOR_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicBaseVendor getCustomerVendorID() {
        return customerVendorID;
    }
    public void setCustomerVendorID(MESBasicBaseVendor customerVendorID) {
        this.customerVendorID = customerVendorID;
    }
	/**
	 * 获取行业.
	 * 
	 * @return 行业
	 */
	@Column(name="CUSTOMER_VOCATION")
	public String getCustomerVocation() {
		return customerVocation;
	}
	/**
	 * 设置行业.
	 * @param customerVocation 行业
	 */
	public void setCustomerVocation(String customerVocation) {
		this.customerVocation = customerVocation;
	}
	
	@javax.persistence.Transient
	public String getCustomerVocationForDisplay() {
		return customerVocationForDisplay;
	}
	
	public void setCustomerVocationForDisplay(String customerVocationForDisplay) {
		this.customerVocationForDisplay = customerVocationForDisplay;
	}
	/**
	 * 获取主页地址.
	 * 
	 * @return 主页地址
	 */
	@Column(nullable=true

		,length = 50
		,name="CUSTOMER_WEB"
	)
    public String getCustomerWeb() {
        return customerWeb;
    }
	/**
	 * 设置主页地址.
	 * @param customerWeb 主页地址
	 */
    public void setCustomerWeb(String customerWeb) {
        this.customerWeb = customerWeb;
    }
	
	
	protected String _getEntityName() {
		return MESBasicBaseCustomer.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
