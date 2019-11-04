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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 货位档案.
 */
@javax.persistence.Entity(name=MESBasicStoreSet.JPA_NAME)
@Table(name = MESBasicStoreSet.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_storeSet")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_storeSet_StoreSet")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="fullPathName", column=@Column(name = "FULL_PATH_NAME")),
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="layNo", column=@Column(name = "LAY_NO")),
		@AttributeOverride(name="layRec", column=@Column(name = "LAY_REC")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_storeSet_StoreSet,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicStoreSetConvertor.class})
public class MESBasicStoreSet extends com.supcon.orchid.orm.entities.AbstractEcTreeFullEntity<MESBasicStoreSet> {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_storeSet";
	public static final String MODEL_CODE = "MESBasic_1_storeSet_StoreSet";
	public static final String DOC_TYPE = "MESBasic_storeSet_storeSet";
	public static final String TABLE_NAME = "material_store_sets";
	public static final String JPA_NAME = "MESBasicStoreSet";


		private Integer inPriority ; // 入库优先级


		private java.math.BigDecimal limtQuantity ; // 最大数量


		private java.math.BigDecimal limtVolumn ; // 最大体积


		private java.math.BigDecimal limtWeight ; // 最大重量


		private Integer outPriority ; // 出库优先级
	private Staff owner;


		private String placeSetCode ; // 货位编码
	@BAPIsMainDisplay

		private String placeSetName ; // 货位名称


		private String remark ; // 备注
	private MESBasicWare wareId;
	
	
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
	 * 获取入库优先级.
	 * 
	 * @return 入库优先级
	 */
	@Column(nullable=true

		,name="IN_PRIORITY"
	)
    public Integer getInPriority() {
        return inPriority;
    }
	/**
	 * 设置入库优先级.
	 * @param inPriority 入库优先级
	 */
    public void setInPriority(Integer inPriority) {
        this.inPriority = inPriority;
    }
	/**
	 * 获取最大数量.
	 * 
	 * @return 最大数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LIMT_QUANTITY"
	)
    public java.math.BigDecimal getLimtQuantity() {
        return limtQuantity;
    }
	/**
	 * 设置最大数量.
	 * @param limtQuantity 最大数量
	 */
    public void setLimtQuantity(java.math.BigDecimal limtQuantity) {
        this.limtQuantity = limtQuantity;
    }
	/**
	 * 获取最大体积.
	 * 
	 * @return 最大体积
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LIMT_VOLUMN"
	)
    public java.math.BigDecimal getLimtVolumn() {
        return limtVolumn;
    }
	/**
	 * 设置最大体积.
	 * @param limtVolumn 最大体积
	 */
    public void setLimtVolumn(java.math.BigDecimal limtVolumn) {
        this.limtVolumn = limtVolumn;
    }
	/**
	 * 获取最大重量.
	 * 
	 * @return 最大重量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LIMT_WEIGHT"
	)
    public java.math.BigDecimal getLimtWeight() {
        return limtWeight;
    }
	/**
	 * 设置最大重量.
	 * @param limtWeight 最大重量
	 */
    public void setLimtWeight(java.math.BigDecimal limtWeight) {
        this.limtWeight = limtWeight;
    }
	/**
	 * 获取出库优先级.
	 * 
	 * @return 出库优先级
	 */
	@Column(nullable=true

		,name="OUT_PRIORITY"
	)
    public Integer getOutPriority() {
        return outPriority;
    }
	/**
	 * 设置出库优先级.
	 * @param outPriority 出库优先级
	 */
    public void setOutPriority(Integer outPriority) {
        this.outPriority = outPriority;
    }
	@ManyToOne
	@JoinColumn(name = "OWNER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	
						
    public Staff getOwner() {
        return owner;
    }
    public void setOwner(Staff owner) {
        this.owner = owner;
    }
	/**
	 * 获取货位编码.
	 * 
	 * @return 货位编码
	 */
	@Column(

		length = 256
		,name="PLACE_SET_CODE"
	)
	@Index(name="index_StoreSet_placeSetCode")	
    public String getPlaceSetCode() {
        return placeSetCode;
    }
	/**
	 * 设置货位编码.
	 * @param placeSetCode 货位编码
	 */
    public void setPlaceSetCode(String placeSetCode) {
        this.placeSetCode = placeSetCode;
    }
	/**
	 * 获取货位名称.
	 * 
	 * @return 货位名称
	 */
	@Column(nullable=true

		,length = 256
		,name="PLACE_SET_NAME"
	)
    public String getPlaceSetName() {
        return placeSetName;
    }
	/**
	 * 设置货位名称.
	 * @param placeSetName 货位名称
	 */
    public void setPlaceSetName(String placeSetName) {
        this.placeSetName = placeSetName;
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
	@JoinColumn(name = "WARE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWareId() {
        return wareId;
    }
    public void setWareId(MESBasicWare wareId) {
        this.wareId = wareId;
    }
	
	
	protected String _getEntityName() {
		return MESBasicStoreSet.class.getName();
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

	
	private String parentNodeBusinessKey;
	@javax.persistence.Transient
	public String getParentNodeBusinessKey() {
		return parentNodeBusinessKey;
	}

	public void setParentNodeBusinessKey(String parentNodeBusinessKey) {
		this.parentNodeBusinessKey = parentNodeBusinessKey;
	}
	
	private String parentNodeMainDisplay;
	@javax.persistence.Transient
	public String getParentNodeMainDisplay() {
		return parentNodeMainDisplay;
	}

	public void setParentNodeMainDisplay(String parentNodeMainDisplay) {
		this.parentNodeMainDisplay = parentNodeMainDisplay;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_storeSet_StoreSet,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
