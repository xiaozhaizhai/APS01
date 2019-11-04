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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 价格记录表.
 */
@javax.persistence.Entity(name=MESBasicProductCost.JPA_NAME)
@Table(name = MESBasicProductCost.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_product")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_product_ProductCost")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "PC_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_product_ProductCost,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicProductCostConvertor.class})
public class MESBasicProductCost extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_product";
	public static final String MODEL_CODE = "MESBasic_1_product_ProductCost";
	public static final String DOC_TYPE = "MESBasic_product_productCost";
	public static final String TABLE_NAME = "s2base_productcost";
	public static final String JPA_NAME = "MESBasicProductCost";
	private SystemCode baptype
; // 价格类型


		private String cmemo ; // 备注


		private java.math.BigDecimal cost ; // 价格
	private Staff inputStaffID;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date inputTime ; // 更新时间
	private MESBasicProduct productID;


		private Integer typeS2 ; // 价格类型S2
	
	
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
	 * 获取价格类型.
	 * 
	 * @return 价格类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PC_BAPTYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBaptype() {
		return baptype;
	}
	/**
	 * 设置价格类型.
	 * @param baptype 价格类型
	 */
	public void setBaptype(SystemCode baptype) {
		this.baptype = (SystemCode) baptype;
	}
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true
		,length=2000

		,name="PC_MEMO"
	)
    @javax.persistence.Lob
    public String getCmemo() {
        return cmemo;
    }
	/**
	 * 设置备注.
	 * @param cmemo 备注
	 */
    public void setCmemo(String cmemo) {
        this.cmemo = cmemo;
    }
	/**
	 * 获取价格.
	 * 
	 * @return 价格
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PC_COST"
	)
    public java.math.BigDecimal getCost() {
        return cost;
    }
	/**
	 * 设置价格.
	 * @param cost 价格
	 */
    public void setCost(java.math.BigDecimal cost) {
        this.cost = cost;
    }
	@ManyToOne
	@JoinColumn(name = "PC_INPUTSTAFFID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getInputStaffID() {
        return inputStaffID;
    }
    public void setInputStaffID(Staff inputStaffID) {
        this.inputStaffID = inputStaffID;
    }
	/**
	 * 获取更新时间.
	 * 
	 * @return 更新时间
	 */
	@Column(nullable=true

		,name="PC_INPUTTIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getInputTime() {
        return inputTime;
    }
	/**
	 * 设置更新时间.
	 * @param inputTime 更新时间
	 */
    public void setInputTime(java.util.Date inputTime) {
        this.inputTime = inputTime;
    }
	@OneToOne
	@JoinColumn(name = "PC_PRODUCTID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductID() {
        return productID;
    }
    public void setProductID(MESBasicProduct productID) {
        this.productID = productID;
    }
	/**
	 * 获取价格类型S2.
	 * 
	 * @return 价格类型S2
	 */
	@Column(nullable=true

		,name="PC_TYPE"
	)
    public Integer getTypeS2() {
        return typeS2;
    }
	/**
	 * 设置价格类型S2.
	 * @param typeS2 价格类型S2
	 */
    public void setTypeS2(Integer typeS2) {
        this.typeS2 = typeS2;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProductCost.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_product_ProductCost,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
