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
 * 物料.
 */
@javax.persistence.Entity(name=MESBasicMaterial.JPA_NAME)
@org.hibernate.annotations.Table(appliesTo=MESBasicMaterial.TABLE_NAME,indexes={@Index(columnNames = IAuditEntity.P_CREATE_STAFF_ID, name = "IDX_MATERIAL_CREATESTAFF"),
		@Index(columnNames = IAuditEntity.POSITION_LAY_REC, name = "IDX_MATERIAL_POST_REC"),@Index(columnNames = IAuditEntity.P_OWNER_STAFF_ID, name = "IDX_MATERIAL_OWNER_ID"),
		@Index(columnNames = IAuditEntity.P_CREATE_TIME, name = "IDX_MATERIAL_CREATETIME")})
@Table(name = MESBasicMaterial.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_material")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_material_Material")
@AttributeOverrides({
		@AttributeOverride(name="createStaff", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaff", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaff", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="modifyStaff", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartment", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPosition", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaff", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))

})
public class MESBasicMaterial extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_material";
	public static final String MODEL_CODE = "MESBasic_1_material_Material";
	public static final String DOC_TYPE = "MESBasic_material_material";
	public static final String TABLE_NAME = "mesbasic_materials";
	public static final String JPA_NAME = "MESBasicMaterial";


		private String code ; // 物料编码


		private String name ; // 物料名称


		private String remark ; // 备注
	
	
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
	 * 获取物料编码.
	 * 
	 * @return 物料编码
	 */
	@Column(

		length = 200
		,name="CODE"
	)
	@Index(name="index_Material_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置物料编码.
	 * @param code 物料编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取物料名称.
	 * 
	 * @return 物料名称
	 */
	@Column(

		length = 200
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置物料名称.
	 * @param name 物料名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 4000
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
	
	
	protected String _getEntityName() {
		return MESBasicMaterial.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}