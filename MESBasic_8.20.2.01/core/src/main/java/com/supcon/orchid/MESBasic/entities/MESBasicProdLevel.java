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
 * 物品等级设置表.
 */
@javax.persistence.Entity(name=MESBasicProdLevel.JPA_NAME)
@Table(name = MESBasicProdLevel.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_product")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_product_ProdLevel")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "PRODLEVEL_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_product_ProdLevel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicProdLevelConvertor.class})
public class MESBasicProdLevel extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_product";
	public static final String MODEL_CODE = "MESBasic_1_product_ProdLevel";
	public static final String DOC_TYPE = "MESBasic_product_prodLevel";
	public static final String TABLE_NAME = "s2base_prodlevel";
	public static final String JPA_NAME = "MESBasicProdLevel";


		private String clevel ; // 等级
	private MESBasicProduct compareID;


		private Integer corder ; // 顺序


		private Boolean isUsed = false; // 等级引用标志


		private Boolean itemChange = false; // 变更物品


		private String levelMemo ; // 备注
	private MESBasicProduct productID;


		private Boolean rejectLvl = false; // 不合格
	
	
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
	 * 获取等级.
	 * 
	 * @return 等级
	 */
	@Column(

		length = 200
		,name="PRODLEVEL_LEVEL"
	)
    public String getClevel() {
        return clevel;
    }
	/**
	 * 设置等级.
	 * @param clevel 等级
	 */
    public void setClevel(String clevel) {
        this.clevel = clevel;
    }
	@OneToOne
	@JoinColumn(name = "PRODLEVEL_COMPAREID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getCompareID() {
        return compareID;
    }
    public void setCompareID(MESBasicProduct compareID) {
        this.compareID = compareID;
    }
	/**
	 * 获取顺序.
	 * 
	 * @return 顺序
	 */
	@Column(nullable=true

		,name="PRODLEVEL_ORDER"
	)
    public Integer getCorder() {
        return corder;
    }
	/**
	 * 设置顺序.
	 * @param corder 顺序
	 */
    public void setCorder(Integer corder) {
        this.corder = corder;
    }
	/**
	 * 获取等级引用标志.
	 * 
	 * @return 等级引用标志
	 */
	@Column(nullable=true

		,name="IS_USED"
	)
    public Boolean getIsUsed() {
        return null == isUsed ? false : isUsed;
    }
	/**
	 * 设置等级引用标志.
	 * @param isUsed 等级引用标志
	 */
    public void setIsUsed(Boolean isUsed) {
        this.isUsed = isUsed;
    }
	/**
	 * 获取变更物品.
	 * 
	 * @return 变更物品
	 */
	@Column(nullable=true

		,name="PRODLEVEL_ITEMCHAGE"
	)
    public Boolean getItemChange() {
        return null == itemChange ? false : itemChange;
    }
	/**
	 * 设置变更物品.
	 * @param itemChange 变更物品
	 */
    public void setItemChange(Boolean itemChange) {
        this.itemChange = itemChange;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="PRODLEVEL_LEVELMEMO"
	)
    public String getLevelMemo() {
        return levelMemo;
    }
	/**
	 * 设置备注.
	 * @param levelMemo 备注
	 */
    public void setLevelMemo(String levelMemo) {
        this.levelMemo = levelMemo;
    }
	@ManyToOne
	@JoinColumn(name = "PRODLEVEL_PRODUCTID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductID() {
        return productID;
    }
    public void setProductID(MESBasicProduct productID) {
        this.productID = productID;
    }
	/**
	 * 获取不合格.
	 * 
	 * @return 不合格
	 */
	@Column(nullable=true

		,name="PRODLEVEL_REJECTLVL"
	)
    public Boolean getRejectLvl() {
        return null == rejectLvl ? false : rejectLvl;
    }
	/**
	 * 设置不合格.
	 * @param rejectLvl 不合格
	 */
    public void setRejectLvl(Boolean rejectLvl) {
        this.rejectLvl = rejectLvl;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProdLevel.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_product_ProdLevel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
