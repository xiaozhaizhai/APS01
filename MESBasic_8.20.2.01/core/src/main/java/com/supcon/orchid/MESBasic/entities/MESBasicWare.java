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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 仓库表.
 */
@javax.persistence.Entity(name=MESBasicWare.JPA_NAME)
@Table(name = MESBasicWare.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_wareMan")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_wareMan_Ware")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_wareMan_Ware,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicWareConvertor.class})
public class MESBasicWare extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_wareMan";
	public static final String MODEL_CODE = "MESBasic_1_wareMan_Ware";
	public static final String DOC_TYPE = "MESBasic_wareMan_ware";
	public static final String TABLE_NAME = "material_wares";
	public static final String JPA_NAME = "MESBasicWare";
	private Department belongDept;
	private SystemCode cargoStatue
; // 货位状态


		private String contact ; // 联系方式


		private Boolean isCargo = false; // 是否货位管理
	private Staff storeKeeper;


		private String wareAddress ; // 仓库地址
	private MESBasicWareClass wareClass;

		@BAPIsMneCode
		private String wareCode ; // 仓库编码


		private String wareMemo ; // 备注
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String wareName ; // 仓库名称
	private SystemCode wareState
; // 仓库状态
	
	
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
	@JoinColumn(name = "BELONG_DEPT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getBelongDept() {
        return belongDept;
    }
    public void setBelongDept(Department belongDept) {
        this.belongDept = belongDept;
    }
	/**
	 * 获取货位状态.
	 * 
	 * @return 货位状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CARGO_STATUE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getCargoStatue() {
		return cargoStatue;
	}
	/**
	 * 设置货位状态.
	 * @param cargoStatue 货位状态
	 */
	public void setCargoStatue(SystemCode cargoStatue) {
		this.cargoStatue = (SystemCode) cargoStatue;
	}
	/**
	 * 获取联系方式.
	 * 
	 * @return 联系方式
	 */
	@Column(nullable=true

		,length = 500
		,name="CONTACT"
	)
    public String getContact() {
        return contact;
    }
	/**
	 * 设置联系方式.
	 * @param contact 联系方式
	 */
    public void setContact(String contact) {
        this.contact = contact;
    }
	/**
	 * 获取是否货位管理.
	 * 
	 * @return 是否货位管理
	 */
	@Column(nullable=true

		,name="IS_CARGO"
	)
    public Boolean getIsCargo() {
        return null == isCargo ? false : isCargo;
    }
	/**
	 * 设置是否货位管理.
	 * @param isCargo 是否货位管理
	 */
    public void setIsCargo(Boolean isCargo) {
        this.isCargo = isCargo;
    }
	@OneToOne
	@JoinColumn(name = "STORE_KEEPER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getStoreKeeper() {
        return storeKeeper;
    }
    public void setStoreKeeper(Staff storeKeeper) {
        this.storeKeeper = storeKeeper;
    }
	/**
	 * 获取仓库地址.
	 * 
	 * @return 仓库地址
	 */
	@Column(nullable=true

		,length = 200
		,name="WARE_ADDRESS"
	)
    public String getWareAddress() {
        return wareAddress;
    }
	/**
	 * 设置仓库地址.
	 * @param wareAddress 仓库地址
	 */
    public void setWareAddress(String wareAddress) {
        this.wareAddress = wareAddress;
    }
	@ManyToOne
	@JoinColumn(name = "WARE_CLASS", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWareClass getWareClass() {
        return wareClass;
    }
    public void setWareClass(MESBasicWareClass wareClass) {
        this.wareClass = wareClass;
    }
	/**
	 * 获取仓库编码.
	 * 
	 * @return 仓库编码
	 */
	@Column(

		length = 64
		,name="WARE_CODE"
	)
	@Index(name="index_Ware_wareCode")	
    public String getWareCode() {
        return wareCode;
    }
	/**
	 * 设置仓库编码.
	 * @param wareCode 仓库编码
	 */
    public void setWareCode(String wareCode) {
        this.wareCode = wareCode;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 1000
		,name="WARE_MEMO"
	)
    public String getWareMemo() {
        return wareMemo;
    }
	/**
	 * 设置备注.
	 * @param wareMemo 备注
	 */
    public void setWareMemo(String wareMemo) {
        this.wareMemo = wareMemo;
    }
	/**
	 * 获取仓库名称.
	 * 
	 * @return 仓库名称
	 */
	@Column(

		length = 100
		,name="WARE_NAME"
	)
    public String getWareName() {
        return wareName;
    }
	/**
	 * 设置仓库名称.
	 * @param wareName 仓库名称
	 */
    public void setWareName(String wareName) {
        this.wareName = wareName;
    }
	/**
	 * 获取仓库状态.
	 * 
	 * @return 仓库状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="WARE_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getWareState() {
		return wareState;
	}
	/**
	 * 设置仓库状态.
	 * @param wareState 仓库状态
	 */
	public void setWareState(SystemCode wareState) {
		this.wareState = (SystemCode) wareState;
	}
	
	
	protected String _getEntityName() {
		return MESBasicWare.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_wareMan_Ware,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
