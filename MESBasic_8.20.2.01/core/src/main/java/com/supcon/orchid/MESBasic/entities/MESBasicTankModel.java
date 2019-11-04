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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 容器型号.
 * 储罐的型号配置，提供针对一个储罐的液位差与体积的换算关系。
 */
@javax.persistence.Entity(name=MESBasicTankModel.JPA_NAME)
@Table(name = MESBasicTankModel.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_tankModel")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_tankModel_TankModel")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_tankModel_TankModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicTankModelConvertor.class})
public class MESBasicTankModel extends com.supcon.orchid.orm.entities.AbstractEcTreeFullEntity<MESBasicTankModel> {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_tankModel";
	public static final String MODEL_CODE = "MESBasic_1_tankModel_TankModel";
	public static final String DOC_TYPE = "MESBasic_tankModel_tankModel";
	public static final String TABLE_NAME = "mesbasic_tank_models";
	public static final String JPA_NAME = "MESBasicTankModel";

		@BAPIsMneCode
		private String code ; // 编码


		private java.math.BigDecimal hlevel ; // 最大工作液位


		private java.math.BigDecimal llevel ; // 最低工作液位
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String name ; // 型号名称
	private SystemCode shape
		= new SystemCode("TANK_SHAPE/0")
		; // 储罐形状


		private String volume ; // 储量计算公式
	
	
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
	 * 获取编码.
	 * 储罐型号的编码。
	 * @return 编码
	 */
	@Column(

		length = 200
		,name="CODE"
	)
	@Index(name="index_TankModel_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置编码.
	 * @param code 编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取最大工作液位.
	 * 储罐工作的最高液位
	 * @return 最大工作液位
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="HLEVEL"
	)
    public java.math.BigDecimal getHlevel() {
        return hlevel;
    }
	/**
	 * 设置最大工作液位.
	 * @param hlevel 最大工作液位
	 */
    public void setHlevel(java.math.BigDecimal hlevel) {
        this.hlevel = hlevel;
    }
	/**
	 * 获取最低工作液位.
	 * 储罐工作的最低液位
	 * @return 最低工作液位
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="LLEVEL"
	)
    public java.math.BigDecimal getLlevel() {
        return llevel;
    }
	/**
	 * 设置最低工作液位.
	 * @param llevel 最低工作液位
	 */
    public void setLlevel(java.math.BigDecimal llevel) {
        this.llevel = llevel;
    }
	/**
	 * 获取型号名称.
	 * 储罐型号的名称
	 * @return 型号名称
	 */
	@Column(

		length = 200
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置型号名称.
	 * @param name 型号名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取储罐形状.
	 * 
	 * @return 储罐形状
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="SHAPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getShape() {
		return shape;
	}
	/**
	 * 设置储罐形状.
	 * @param shape 储罐形状
	 */
	public void setShape(SystemCode shape) {
		this.shape = (SystemCode) shape;
	}
	/**
	 * 获取储量计算公式.
	 * 根据储罐内液体的液位，计算储罐内的液体体积。罐体在可用工作液位时，罐内液体体积的计算公式，公式中有未知参数，使用param0，param1等代替，作为动态传入的参数，一般仅包含param0，表示液位。
	 * @return 储量计算公式
	 */
	@Column(nullable=true

		,length = 2000
		,name="VOLUME"
	)
    public String getVolume() {
        return volume;
    }
	/**
	 * 设置储量计算公式.
	 * @param volume 储量计算公式
	 */
    public void setVolume(String volume) {
        this.volume = volume;
    }
	
	
	protected String _getEntityName() {
		return MESBasicTankModel.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_tankModel_TankModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
