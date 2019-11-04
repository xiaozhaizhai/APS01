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
 * 相关测点.
 */
@javax.persistence.Entity(name=MESBasicItemPart.JPA_NAME)
@Table(name = MESBasicItemPart.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_itemManage")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_itemManage_ItemPart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_itemManage_ItemPart,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicItemPartConvertor.class})
public class MESBasicItemPart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_itemManage";
	public static final String MODEL_CODE = "MESBasic_1_itemManage_ItemPart";
	public static final String DOC_TYPE = "MESBasic_itemManage_itemPart";
	public static final String TABLE_NAME = "pellet_itempart";
	public static final String JPA_NAME = "MESBasicItemPart";


		private Long ipID ; // 位号ID
	private MESBasicItemSetup item;


		private String itemMemo ; // 备注


		private String itemNumber ; // 生产位号


		private String itemRef ; // 对应位号
	private SystemCode itemStatus
; // 状态
	private MESBasicItemSetup itemView;
	
	
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
	 * 获取位号ID.
	 * 
	 * @return 位号ID
	 */
	@Column(nullable=true

		,name="IP_ID"
	)
    public Long getIpID() {
        return ipID;
    }
	/**
	 * 设置位号ID.
	 * @param ipID 位号ID
	 */
    public void setIpID(Long ipID) {
        this.ipID = ipID;
    }
	@ManyToOne
	@JoinColumn(name = "IP_ITEMID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getItem() {
        return item;
    }
    public void setItem(MESBasicItemSetup item) {
        this.item = item;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true
		,length=4000

		,name="IP_MEMO"
	)
    @javax.persistence.Lob
    public String getItemMemo() {
        return itemMemo;
    }
	/**
	 * 设置备注.
	 * @param itemMemo 备注
	 */
    public void setItemMemo(String itemMemo) {
        this.itemMemo = itemMemo;
    }
	/**
	 * 获取生产位号.
	 * 
	 * @return 生产位号
	 */
	@Column(nullable=true

		,length = 2000
		,name="IP_ITEMNUMBER"
	)
    public String getItemNumber() {
        return itemNumber;
    }
	/**
	 * 设置生产位号.
	 * @param itemNumber 生产位号
	 */
    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
    }
	/**
	 * 获取对应位号.
	 * 
	 * @return 对应位号
	 */
	@Column(nullable=true

		,length = 2000
		,name="IP_ITEMREFER"
	)
    public String getItemRef() {
        return itemRef;
    }
	/**
	 * 设置对应位号.
	 * @param itemRef 对应位号
	 */
    public void setItemRef(String itemRef) {
        this.itemRef = itemRef;
    }
	/**
	 * 获取状态.
	 * 
	 * @return 状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ITEM_STATUS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getItemStatus() {
		return itemStatus;
	}
	/**
	 * 设置状态.
	 * @param itemStatus 状态
	 */
	public void setItemStatus(SystemCode itemStatus) {
		this.itemStatus = (SystemCode) itemStatus;
	}
	@ManyToOne
	@JoinColumn(name = "ITEM_VIEW", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getItemView() {
        return itemView;
    }
    public void setItemView(MESBasicItemSetup itemView) {
        this.itemView = itemView;
    }
	
	
	protected String _getEntityName() {
		return MESBasicItemPart.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_itemManage_ItemPart,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
