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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 复验周期.
 */
@javax.persistence.Entity(name=MESBasicProdResetDaily.JPA_NAME)
@Table(name = MESBasicProdResetDaily.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_product")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_product_ProdResetDaily")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_product_ProdResetDaily,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicProdResetDailyConvertor.class})
public class MESBasicProdResetDaily extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_product";
	public static final String MODEL_CODE = "MESBasic_1_product_ProdResetDaily";
	public static final String DOC_TYPE = "MESBasic_product_prodResetDaily";
	public static final String TABLE_NAME = "mesbasic_prod_reset_dailies";
	public static final String JPA_NAME = "MESBasicProdResetDaily";


		private String demo ; // 说明


		private Integer expireDaysForNotify ; // 到期天数(提醒)


		private Integer expireDaysInterval ; // 到期天数间隔


		private Integer notifyDays ; // 提前提醒(天)
	private MESBasicProduct productID;


		private Integer reinspect ; // 复验周期
	private SystemCode reinspectUnit
; // 复验周期单位


		private Integer resetCyc ; // 周期(天)
	
	
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
	 * 获取说明.
	 * 
	 * @return 说明
	 */
	@Column(nullable=true

		,length = 2000
		,name="DEMO"
	)
    public String getDemo() {
        return demo;
    }
	/**
	 * 设置说明.
	 * @param demo 说明
	 */
    public void setDemo(String demo) {
        this.demo = demo;
    }
	/**
	 * 获取到期天数(提醒).
	 * 
	 * @return 到期天数(提醒)
	 */
	@Column(

		name="EXPIREDAYSFORNOTIFY"
	)
    public Integer getExpireDaysForNotify() {
        return expireDaysForNotify;
    }
	/**
	 * 设置到期天数(提醒).
	 * @param expireDaysForNotify 到期天数(提醒)
	 */
    public void setExpireDaysForNotify(Integer expireDaysForNotify) {
        this.expireDaysForNotify = expireDaysForNotify;
    }
	/**
	 * 获取到期天数间隔.
	 * 
	 * @return 到期天数间隔
	 */
	@Column(

		name="EXPIREDAYSINTERVAL"
	)
    public Integer getExpireDaysInterval() {
        return expireDaysInterval;
    }
	/**
	 * 设置到期天数间隔.
	 * @param expireDaysInterval 到期天数间隔
	 */
    public void setExpireDaysInterval(Integer expireDaysInterval) {
        this.expireDaysInterval = expireDaysInterval;
    }
	/**
	 * 获取提前提醒(天).
	 * 
	 * @return 提前提醒(天)
	 */
	@Column(nullable=true

		,name="NOTIFY_DAYS"
	)
    public Integer getNotifyDays() {
        return notifyDays;
    }
	/**
	 * 设置提前提醒(天).
	 * @param notifyDays 提前提醒(天)
	 */
    public void setNotifyDays(Integer notifyDays) {
        this.notifyDays = notifyDays;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCTID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductID() {
        return productID;
    }
    public void setProductID(MESBasicProduct productID) {
        this.productID = productID;
    }
	/**
	 * 获取复验周期.
	 * 
	 * @return 复验周期
	 */
	@Column(

		name="REINSPECT"
	)
    public Integer getReinspect() {
        return reinspect;
    }
	/**
	 * 设置复验周期.
	 * @param reinspect 复验周期
	 */
    public void setReinspect(Integer reinspect) {
        this.reinspect = reinspect;
    }
	/**
	 * 获取复验周期单位.
	 * 
	 * @return 复验周期单位
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="REINSPECTUNIT", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getReinspectUnit() {
		return reinspectUnit;
	}
	/**
	 * 设置复验周期单位.
	 * @param reinspectUnit 复验周期单位
	 */
	public void setReinspectUnit(SystemCode reinspectUnit) {
		this.reinspectUnit = (SystemCode) reinspectUnit;
	}
	/**
	 * 获取周期(天).
	 * 
	 * @return 周期(天)
	 */
	@Column(nullable=true

		,name="RESET_CYC"
	)
    public Integer getResetCyc() {
        return resetCyc;
    }
	/**
	 * 设置周期(天).
	 * @param resetCyc 周期(天)
	 */
    public void setResetCyc(Integer resetCyc) {
        this.resetCyc = resetCyc;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProdResetDaily.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_product_ProdResetDaily,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
