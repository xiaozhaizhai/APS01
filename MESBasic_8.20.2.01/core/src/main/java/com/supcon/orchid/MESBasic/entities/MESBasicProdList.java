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
import com.supcon.orchid.annotation.BAPEntity;
import javax.persistence.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Where;

import com.supcon.orchid.orm.entities.IAuditEntity;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.orm.entities.ICompany;
import com.supcon.orchid.orm.entities.ICId;
import com.supcon.orchid.annotation.BAPIsMainDisplay;
import com.supcon.orchid.annotation.BAPIsMneCode;
import com.supcon.orchid.annotation.BAPModelCode;
import com.supcon.orchid.annotation.BAPPicture;
import com.supcon.orchid.annotation.BAPSystemCodeMultable;
import com.supcon.orchid.annotation.BAPSeniorSystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 物品目录.
 */
@javax.persistence.Entity(name=MESBasicProdList.JPA_NAME)
@Table(name = MESBasicProdList.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_prodList")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_prodList_ProdList")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "PRODLIST_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_prodList_ProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
public class MESBasicProdList extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_prodList";
	public static final String MODEL_CODE = "MESBasic_1_prodList_ProdList";
	public static final String DOC_TYPE = "MESBasic_prodList_prodList";
	public static final String TABLE_NAME = "s2base_prodlist";
	public static final String JPA_NAME = "MESBasicProdList";


		private Integer category ; // 目录类别


		private String code ; // 目录代码


		private java.math.BigDecimal fun ; // 资金占用规划
	private MESBasicProduct inheritProdID;


		private Integer prodListEnd ; // 是否最末级


		private Integer prodListLayNo ; // 目录层次级别


		private String prodListLayRec ; // 目录层次记录


		private String prodListMeno ; // 目录说明


		private String prodListName ; // 目录名称

		private Integer prodListState = 
			Integer.valueOf("1")
		; // 目录状态, 


		private Integer prodListType ; // 目录类型
	private MESBasicProduct productID;
	
	
	private Document document;
	
	private String bapAttachmentInfo;
	
	@javax.persistence.Transient
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
	 * 获取目录类别.
	 * 
	 * @return 目录类别
	 */
	@Column(nullable=true

		,name="PRODLIST_CATEGORY"
	)
    public Integer getCategory() {
        return category;
    }
	/**
	 * 设置目录类别.
	 * @param category 目录类别
	 */
    public void setCategory(Integer category) {
        this.category = category;
    }
	/**
	 * 获取目录代码.
	 * 
	 * @return 目录代码
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODLIST_CODE"
	)
    public String getCode() {
        return code;
    }
	/**
	 * 设置目录代码.
	 * @param code 目录代码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取资金占用规划.
	 * 
	 * @return 资金占用规划
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODLIST_FUN"
	)
    public java.math.BigDecimal getFun() {
        return fun;
    }
	/**
	 * 设置资金占用规划.
	 * @param fun 资金占用规划
	 */
    public void setFun(java.math.BigDecimal fun) {
        this.fun = fun;
    }
	@OneToOne
	@JoinColumn(name = "PRODLIST_INHERITPRODID", referencedColumnName="PRODUCT_ID")
	
						
    public MESBasicProduct getInheritProdID() {
        return inheritProdID;
    }
    public void setInheritProdID(MESBasicProduct inheritProdID) {
        this.inheritProdID = inheritProdID;
    }
	/**
	 * 获取是否最末级.
	 * 
	 * @return 是否最末级
	 */
	@Column(nullable=true

		,name="PRODLIST_END"
	)
    public Integer getProdListEnd() {
        return prodListEnd;
    }
	/**
	 * 设置是否最末级.
	 * @param prodListEnd 是否最末级
	 */
    public void setProdListEnd(Integer prodListEnd) {
        this.prodListEnd = prodListEnd;
    }
	/**
	 * 获取目录层次级别.
	 * 
	 * @return 目录层次级别
	 */
	@Column(nullable=true

		,name="PRODLIST_LAYNO"
	)
    public Integer getProdListLayNo() {
        return prodListLayNo;
    }
	/**
	 * 设置目录层次级别.
	 * @param prodListLayNo 目录层次级别
	 */
    public void setProdListLayNo(Integer prodListLayNo) {
        this.prodListLayNo = prodListLayNo;
    }
	/**
	 * 获取目录层次记录.
	 * 
	 * @return 目录层次记录
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODLIST_LAYREC"
	)
    public String getProdListLayRec() {
        return prodListLayRec;
    }
	/**
	 * 设置目录层次记录.
	 * @param prodListLayRec 目录层次记录
	 */
    public void setProdListLayRec(String prodListLayRec) {
        this.prodListLayRec = prodListLayRec;
    }
	/**
	 * 获取目录说明.
	 * 
	 * @return 目录说明
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODLIST_MEMO"
	)
    public String getProdListMeno() {
        return prodListMeno;
    }
	/**
	 * 设置目录说明.
	 * @param prodListMeno 目录说明
	 */
    public void setProdListMeno(String prodListMeno) {
        this.prodListMeno = prodListMeno;
    }
	/**
	 * 获取目录名称.
	 * 
	 * @return 目录名称
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODLIST_NAME"
	)
    public String getProdListName() {
        return prodListName;
    }
	/**
	 * 设置目录名称.
	 * @param prodListName 目录名称
	 */
    public void setProdListName(String prodListName) {
        this.prodListName = prodListName;
    }
	/**
	 * 获取目录状态.
	 * 
	 * @return 目录状态
	 */
	@Column(nullable=true

		,name="PRODLIST_STATE"
	)
    public Integer getProdListState() {
        return prodListState;
    }
	/**
	 * 设置目录状态.
	 * @param prodListState 目录状态
	 */
    public void setProdListState(Integer prodListState) {
        this.prodListState = prodListState;
    }
	/**
	 * 获取目录类型.
	 * 
	 * @return 目录类型
	 */
	@Column(nullable=true

		,name="PRODLIST_TYPE"
	)
    public Integer getProdListType() {
        return prodListType;
    }
	/**
	 * 设置目录类型.
	 * @param prodListType 目录类型
	 */
    public void setProdListType(Integer prodListType) {
        this.prodListType = prodListType;
    }
	@OneToOne
	@JoinColumn(name = "PRODLIST_PRODUCTID", referencedColumnName="PRODUCT_ID")
	
						
    public MESBasicProduct getProductID() {
        return productID;
    }
    public void setProductID(MESBasicProduct productID) {
        this.productID = productID;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProdList.class.getName();
	}
	
	
	private ICompany company;
	
	@Override
	@OneToOne(fetch=FetchType.EAGER, targetEntity=Company.class, optional=true)
    @JoinColumn(name=ICId.P_CID, insertable=false, updatable=false)
    @Fetch(FetchMode.SELECT)
	public ICompany getCompany() {
		return this.company;
	}
	
	@Override
	public void setCompany(ICompany company) {
		this.company =company;
	}
	// 在此区域内自行添加JAVA代码,此处添加的JAVA代码必须不涉及持久化操作,
	// 如果加入get方法,请添加@javax.persistence.Transient注解
	/* CUSTOM CODE START(entity,functions,MESBasic_1_prodList_ProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
