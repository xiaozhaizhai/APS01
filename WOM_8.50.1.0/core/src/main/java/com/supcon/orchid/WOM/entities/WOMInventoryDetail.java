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
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 盘库记录表体.
 */
@javax.persistence.Entity(name=WOMInventoryDetail.JPA_NAME)
@Table(name = WOMInventoryDetail.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_inventoryRecords")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_inventoryRecords_InventoryDetail")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_inventoryRecords_InventoryDetail,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMInventoryDetailConvertor.class})
public class WOMInventoryDetail extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_inventoryRecords";
	public static final String MODEL_CODE = "WOM_7.5.0.0_inventoryRecords_InventoryDetail";
	public static final String DOC_TYPE = "WOM_inventoryRecords_inventoryDetail";
	public static final String TABLE_NAME = "wom_inventory_details";
	public static final String JPA_NAME = "WOMInventoryDetail";
	private Staff applyStaff;


		private String batchText ; // 物料批号


		private String edition ; // 特殊库存标志
	private WOMInventoryRecord head;


		private String inCode ; // 内部编码
	private WOMManulOrderMain manulOrder;
	private MESBasicProduct material;


		private java.math.BigDecimal onhand ; // 现存量


		private String outCode ; // 出库单号
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
	
	@OneToOne
	@JoinColumn(name = "APPLY_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getApplyStaff() {
        return applyStaff;
    }
    public void setApplyStaff(Staff applyStaff) {
        this.applyStaff = applyStaff;
    }
	/**
	 * 获取物料批号.
	 * 
	 * @return 物料批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_TEXT"
	)
    public String getBatchText() {
        return batchText;
    }
	/**
	 * 设置物料批号.
	 * @param batchText 物料批号
	 */
    public void setBatchText(String batchText) {
        this.batchText = batchText;
    }
	/**
	 * 获取特殊库存标志.
	 * 
	 * @return 特殊库存标志
	 */
	@Column(nullable=true

		,length = 256
		,name="EDITION"
	)
    public String getEdition() {
        return edition;
    }
	/**
	 * 设置特殊库存标志.
	 * @param edition 特殊库存标志
	 */
    public void setEdition(String edition) {
        this.edition = edition;
    }
	@ManyToOne
	@JoinColumn(name = "HEAD", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMInventoryRecord getHead() {
        return head;
    }
    public void setHead(WOMInventoryRecord head) {
        this.head = head;
    }
	/**
	 * 获取内部编码.
	 * 
	 * @return 内部编码
	 */
	@Column(nullable=true

		,length = 256
		,name="IN_CODE"
	)
    public String getInCode() {
        return inCode;
    }
	/**
	 * 设置内部编码.
	 * @param inCode 内部编码
	 */
    public void setInCode(String inCode) {
        this.inCode = inCode;
    }
	@ManyToOne
	@JoinColumn(name = "MANUL_ORDER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMManulOrderMain getManulOrder() {
        return manulOrder;
    }
    public void setManulOrder(WOMManulOrderMain manulOrder) {
        this.manulOrder = manulOrder;
    }
	@OneToOne
	@JoinColumn(name = "MATERIAL", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getMaterial() {
        return material;
    }
    public void setMaterial(MESBasicProduct material) {
        this.material = material;
    }
	/**
	 * 获取现存量.
	 * 
	 * @return 现存量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="ONHAND"
	)
    public java.math.BigDecimal getOnhand() {
        return onhand;
    }
	/**
	 * 设置现存量.
	 * @param onhand 现存量
	 */
    public void setOnhand(java.math.BigDecimal onhand) {
        this.onhand = onhand;
    }
	/**
	 * 获取出库单号.
	 * 
	 * @return 出库单号
	 */
	@Column(nullable=true

		,length = 256
		,name="OUT_CODE"
	)
    public String getOutCode() {
        return outCode;
    }
	/**
	 * 设置出库单号.
	 * @param outCode 出库单号
	 */
    public void setOutCode(String outCode) {
        this.outCode = outCode;
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
		return WOMInventoryDetail.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_inventoryRecords_InventoryDetail,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
