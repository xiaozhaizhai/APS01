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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 关联设备.
 */
@javax.persistence.Entity(name=MESBasicObjEquipment.JPA_NAME)
@Table(name = MESBasicObjEquipment.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_factoryModel")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_factoryModel_ObjEquipment")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_factoryModel_ObjEquipment,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicObjEquipmentConvertor.class})
public class MESBasicObjEquipment extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_factoryModel";
	public static final String MODEL_CODE = "MESBasic_1_factoryModel_ObjEquipment";
	public static final String DOC_TYPE = "MESBasic_factoryModel_objEquipment";
	public static final String TABLE_NAME = "mesbasic_obj_equipments";
	public static final String JPA_NAME = "MESBasicObjEquipment";
	private MESBasicItemSetup clearItem;
	private SystemCode clearType
; // 清空类型


		private String equipmentNum ; // 设备位号
	private SystemCode equipmentType
; // 设备类别


		private String equs ; // 设备记录


		private Boolean isContainer = false; // 是否容器


		private Boolean isFixed = false; // 固定安装
	private Department objDepartment;
	private MESBasicEquipment objEqu;
	private MESBasicFactoryModel objFactory;
	
	
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
	@JoinColumn(name = "CLEAR_ITEM", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public MESBasicItemSetup getClearItem() {
        return clearItem;
    }
    public void setClearItem(MESBasicItemSetup clearItem) {
        this.clearItem = clearItem;
    }
	/**
	 * 获取清空类型.
	 * 
	 * @return 清空类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CLEAR_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getClearType() {
		return clearType;
	}
	/**
	 * 设置清空类型.
	 * @param clearType 清空类型
	 */
	public void setClearType(SystemCode clearType) {
		this.clearType = (SystemCode) clearType;
	}
	/**
	 * 获取设备位号.
	 * 
	 * @return 设备位号
	 */
	@Column(nullable=true

		,length = 256
		,name="EQUIPMENT_NUM"
	)
    public String getEquipmentNum() {
        return equipmentNum;
    }
	/**
	 * 设置设备位号.
	 * @param equipmentNum 设备位号
	 */
    public void setEquipmentNum(String equipmentNum) {
        this.equipmentNum = equipmentNum;
    }
	/**
	 * 获取设备类别.
	 * 
	 * @return 设备类别
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="EQUIPMENT_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getEquipmentType() {
		return equipmentType;
	}
	/**
	 * 设置设备类别.
	 * @param equipmentType 设备类别
	 */
	public void setEquipmentType(SystemCode equipmentType) {
		this.equipmentType = (SystemCode) equipmentType;
	}
	/**
	 * 获取设备记录.
	 * 
	 * @return 设备记录
	 */
	@Column(nullable=true

		,length = 256
		,name="EQUS"
	)
    public String getEqus() {
        return equs;
    }
	/**
	 * 设置设备记录.
	 * @param equs 设备记录
	 */
    public void setEqus(String equs) {
        this.equs = equs;
    }
	/**
	 * 获取是否容器.
	 * 
	 * @return 是否容器
	 */
	@Column(nullable=true

		,name="IS_CONTAINER"
	)
    public Boolean getIsContainer() {
        return null == isContainer ? false : isContainer;
    }
	/**
	 * 设置是否容器.
	 * @param isContainer 是否容器
	 */
    public void setIsContainer(Boolean isContainer) {
        this.isContainer = isContainer;
    }
	/**
	 * 获取固定安装.
	 * 
	 * @return 固定安装
	 */
	@Column(nullable=true

		,name="IS_FIXED"
	)
    public Boolean getIsFixed() {
        return null == isFixed ? false : isFixed;
    }
	/**
	 * 设置固定安装.
	 * @param isFixed 固定安装
	 */
    public void setIsFixed(Boolean isFixed) {
        this.isFixed = isFixed;
    }
	@OneToOne
	@JoinColumn(name = "OBJ_DEPARTMENT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	
						
    public Department getObjDepartment() {
        return objDepartment;
    }
    public void setObjDepartment(Department objDepartment) {
        this.objDepartment = objDepartment;
    }
	@ManyToOne
	@JoinColumn(name = "OBJ_EQU", referencedColumnName="EAM_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicEquipment getObjEqu() {
        return objEqu;
    }
    public void setObjEqu(MESBasicEquipment objEqu) {
        this.objEqu = objEqu;
    }
	@ManyToOne
	@JoinColumn(name = "OBJ_FACTORY", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getObjFactory() {
        return objFactory;
    }
    public void setObjFactory(MESBasicFactoryModel objFactory) {
        this.objFactory = objFactory;
    }
	
	
	protected String _getEntityName() {
		return MESBasicObjEquipment.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_factoryModel_ObjEquipment,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
