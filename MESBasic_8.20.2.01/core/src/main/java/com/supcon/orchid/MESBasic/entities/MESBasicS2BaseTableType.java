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
 * 业务表单.
 */
@javax.persistence.Entity(name=MESBasicS2BaseTableType.JPA_NAME)
@Table(name = MESBasicS2BaseTableType.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_tableType")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_tableType_S2BaseTableType")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="fullPathName", column=@Column(name = "FULL_PATH_NAME")),
		@AttributeOverride(name="id", column=@Column(name = "TABTYPE_ID")),
		@AttributeOverride(name="layNo", column=@Column(name = "TABTYPE_LAYNO")),
		@AttributeOverride(name="layRec", column=@Column(name = "TABTYPE_LAYREC")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_tableType_S2BaseTableType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
public class MESBasicS2BaseTableType extends com.supcon.orchid.orm.entities.AbstractEcTreeFullEntity<MESBasicS2BaseTableType> {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_tableType";
	public static final String MODEL_CODE = "MESBasic_1_tableType_S2BaseTableType";
	public static final String DOC_TYPE = "MESBasic_tableType_s2BaseTableType";
	public static final String TABLE_NAME = "s2base_tabletype";
	public static final String JPA_NAME = "MESBasicS2BaseTableType";


		private String tabTypeDesc ; // 表单说明


		private String tabTypeHead ; // 表单头部信息


		private String tabTypeMemo ; // 备注


		private String tabTypeName ; // 业务表单名称


		private String tabTypeType ; // 业务表单编码
	
	
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
	 * 获取表单说明.
	 * 
	 * @return 表单说明
	 */
	@Column(nullable=true

		,length = 200
		,name="TABTYPE_DESCRIPTION"
	)
    public String getTabTypeDesc() {
        return tabTypeDesc;
    }
	/**
	 * 设置表单说明.
	 * @param tabTypeDesc 表单说明
	 */
    public void setTabTypeDesc(String tabTypeDesc) {
        this.tabTypeDesc = tabTypeDesc;
    }
	/**
	 * 获取表单头部信息.
	 * 
	 * @return 表单头部信息
	 */
	@Column(nullable=true

		,length = 100
		,name="TABTYPE_HEAD"
	)
    public String getTabTypeHead() {
        return tabTypeHead;
    }
	/**
	 * 设置表单头部信息.
	 * @param tabTypeHead 表单头部信息
	 */
    public void setTabTypeHead(String tabTypeHead) {
        this.tabTypeHead = tabTypeHead;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 100
		,name="TABTYPE_MEMO"
	)
    public String getTabTypeMemo() {
        return tabTypeMemo;
    }
	/**
	 * 设置备注.
	 * @param tabTypeMemo 备注
	 */
    public void setTabTypeMemo(String tabTypeMemo) {
        this.tabTypeMemo = tabTypeMemo;
    }
	/**
	 * 获取业务表单名称.
	 * 
	 * @return 业务表单名称
	 */
	@Column(

		length = 100
		,name="TABTYPE_NAME"
	)
    public String getTabTypeName() {
        return tabTypeName;
    }
	/**
	 * 设置业务表单名称.
	 * @param tabTypeName 业务表单名称
	 */
    public void setTabTypeName(String tabTypeName) {
        this.tabTypeName = tabTypeName;
    }
	/**
	 * 获取业务表单编码.
	 * 
	 * @return 业务表单编码
	 */
	@Column(unique=true

		,length = 100
		,name="TABTYPE_TYPE"
	)
    public String getTabTypeType() {
        return tabTypeType;
    }
	/**
	 * 设置业务表单编码.
	 * @param tabTypeType 业务表单编码
	 */
    public void setTabTypeType(String tabTypeType) {
        this.tabTypeType = tabTypeType;
    }
	
	
	protected String _getEntityName() {
		return MESBasicS2BaseTableType.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_tableType_S2BaseTableType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
