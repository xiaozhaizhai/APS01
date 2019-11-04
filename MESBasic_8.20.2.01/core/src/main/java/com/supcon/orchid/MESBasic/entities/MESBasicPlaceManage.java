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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 测点位置管理.
 */
@javax.persistence.Entity(name=MESBasicPlaceManage.JPA_NAME)
@Table(name = MESBasicPlaceManage.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_placeManage")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_placeManage_PlaceManage")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_placeManage_PlaceManage,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicPlaceManageConvertor.class})
public class MESBasicPlaceManage extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_placeManage";
	public static final String MODEL_CODE = "MESBasic_1_placeManage_PlaceManage";
	public static final String DOC_TYPE = "MESBasic_placeManage_placeManage";
	public static final String TABLE_NAME = "mesbasic_place_menage";
	public static final String JPA_NAME = "MESBasicPlaceManage";
	private MESBasicFactoryModel factoryNode;


		private Boolean isAll = false; // 总表位置

		@BAPIsMneCode
		private String placeCode ; // 位置编码
	private Staff placeManager;


		private String placeMemo ; // 备注
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String placeName ; // 位置名称
	
	
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
	@JoinColumn(name = "FACTORY_NODE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getFactoryNode() {
        return factoryNode;
    }
    public void setFactoryNode(MESBasicFactoryModel factoryNode) {
        this.factoryNode = factoryNode;
    }
	/**
	 * 获取总表位置.
	 * 
	 * @return 总表位置
	 */
	@Column(nullable=true

		,name="IS_ALL"
	)
    public Boolean getIsAll() {
        return null == isAll ? false : isAll;
    }
	/**
	 * 设置总表位置.
	 * @param isAll 总表位置
	 */
    public void setIsAll(Boolean isAll) {
        this.isAll = isAll;
    }
	/**
	 * 获取位置编码.
	 * 
	 * @return 位置编码
	 */
	@Column(unique=true

		,length = 256
		,name="PLACE_CODE"
	)
	@Index(name="index_PlaceManage_placeCode")	
    public String getPlaceCode() {
        return placeCode;
    }
	/**
	 * 设置位置编码.
	 * @param placeCode 位置编码
	 */
    public void setPlaceCode(String placeCode) {
        this.placeCode = placeCode;
    }
	@ManyToOne
	@JoinColumn(name = "PLACE_MANAGER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getPlaceManager() {
        return placeManager;
    }
    public void setPlaceManager(Staff placeManager) {
        this.placeManager = placeManager;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
		,name="PLACE_MEMO"
	)
    public String getPlaceMemo() {
        return placeMemo;
    }
	/**
	 * 设置备注.
	 * @param placeMemo 备注
	 */
    public void setPlaceMemo(String placeMemo) {
        this.placeMemo = placeMemo;
    }
	/**
	 * 获取位置名称.
	 * 
	 * @return 位置名称
	 */
	@Column(

		length = 256
		,name="PLACE_NAME"
	)
    public String getPlaceName() {
        return placeName;
    }
	/**
	 * 设置位置名称.
	 * @param placeName 位置名称
	 */
    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }
	
	
	protected String _getEntityName() {
		return MESBasicPlaceManage.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_placeManage_PlaceManage,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
