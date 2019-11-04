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
 * 物料类别.
 */
@javax.persistence.Entity(name=MESBasicProdtype.JPA_NAME)
@org.hibernate.annotations.Table(appliesTo=MESBasicProdtype.TABLE_NAME,indexes={@Index(columnNames = IAuditEntity.P_CREATE_STAFF_ID, name = "IDX_PRODTYPE_CREATESTAFF"),
		@Index(columnNames = IAuditEntity.POSITION_LAY_REC, name = "IDX_PRODTYPE_POST_REC"),@Index(columnNames = IAuditEntity.P_OWNER_STAFF_ID, name = "IDX_PRODTYPE_OWNER_ID"),
		@Index(columnNames = IAuditEntity.P_CREATE_TIME, name = "IDX_PRODTYPE_CREATETIME")})
@Table(name = MESBasicProdtype.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_prodtype")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_prodtype_Prodtype")
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
public class MESBasicProdtype extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_prodtype";
	public static final String MODEL_CODE = "MESBasic_1_prodtype_Prodtype";
	public static final String DOC_TYPE = "MESBasic_prodtype_prodtype";
	public static final String TABLE_NAME = "mesbasic_prodtypes";
	public static final String JPA_NAME = "MESBasicProdtype";


		private String notes ; // 备注说明


		private String ptid ; // 类别编号


		private String ptname ; // 物料类别
	
	
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
	 * 获取备注说明.
	 * 
	 * @return 备注说明
	 */
	@Column(nullable=true

		,length = 256
		,name="NOTES"
	)
    public String getNotes() {
        return notes;
    }
	/**
	 * 设置备注说明.
	 * @param notes 备注说明
	 */
    public void setNotes(String notes) {
        this.notes = notes;
    }
	/**
	 * 获取类别编号.
	 * 
	 * @return 类别编号
	 */
	@Column(nullable=true

		,length = 256
		,name="PTID"
	)
    public String getPtid() {
        return ptid;
    }
	/**
	 * 设置类别编号.
	 * @param ptid 类别编号
	 */
    public void setPtid(String ptid) {
        this.ptid = ptid;
    }
	/**
	 * 获取物料类别.
	 * 
	 * @return 物料类别
	 */
	@Column(nullable=true

		,length = 256
		,name="PTNAME"
	)
    public String getPtname() {
        return ptname;
    }
	/**
	 * 设置物料类别.
	 * @param ptname 物料类别
	 */
    public void setPtname(String ptname) {
        this.ptname = ptname;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProdtype.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}