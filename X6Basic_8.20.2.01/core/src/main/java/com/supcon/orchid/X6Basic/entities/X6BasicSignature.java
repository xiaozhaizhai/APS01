package com.supcon.orchid.X6Basic.entities;

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
 * 签名.
 */
@javax.persistence.Entity(name=X6BasicSignature.JPA_NAME)
@Table(name = X6BasicSignature.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_ggSignetManage")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_ggSignetManage_Signature")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_ggSignetManage_Signature,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicSignatureConvertor.class})
public class X6BasicSignature extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_ggSignetManage";
	public static final String MODEL_CODE = "X6Basic_1.0_ggSignetManage_Signature";
	public static final String DOC_TYPE = "X6Basic_ggSignetManage_signature";
	public static final String TABLE_NAME = "x6basic_signatures";
	public static final String JPA_NAME = "X6BasicSignature";
	public static final String SIGNATURE_PROPERTY_CODE = "X6Basic_1.0_ggSignetManage_Signature_signature";


		private String description ; // 备注
	
	private String signatureAttachementInfo;
	
	private Document signatureDocument;
	
	private String signatureFileAddPaths; //新添加附件的路径
	private String signatureFileDeleteIds;//已删除附件ID
	private String signatureMultiFileIds;//已添加附件ID
	private String signatureMultiFileNames;//已添加附件name
	
	@javax.persistence.Transient
	public String getSignatureFileAddPaths(){
		return this.signatureFileAddPaths;
	}
	
	public void setSignatureFileAddPaths(String signatureFileAddPaths){
		this.signatureFileAddPaths = signatureFileAddPaths;
	}
	
	@javax.persistence.Transient
	public String getSignatureFileDeleteIds(){
		return this.signatureFileDeleteIds;
	}
	
	public void setSignatureFileDeleteIds(String signatureFileDeleteIds){
		this.signatureFileDeleteIds = signatureFileDeleteIds;
	}
	
	@javax.persistence.Transient
	public String getSignatureMultiFileIds(){
		return this.signatureMultiFileIds;
	}
	
	public void setSignatureMultiFileIds(String signatureMultiFileIds){
		this.signatureMultiFileIds = signatureMultiFileIds;
	}
	
	@javax.persistence.Transient
	public String getSignatureMultiFileNames(){
		return this.signatureMultiFileNames;
	}
	
	public void setSignatureMultiFileNames(String signatureMultiFileNames){
		this.signatureMultiFileNames = signatureMultiFileNames;
	}
	
	
	@BAPPicture
	private String signaturePic; // 签名（图片）
	
	private Document signaturePicDocument;


		private String signaturePicByte ; // 签名（字节）
	private Staff staff;
	
	
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
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 4000
		,name="DESCRIPTION"
	)
    public String getDescription() {
        return description;
    }
	/**
	 * 设置备注.
	 * @param description 备注
	 */
    public void setDescription(String description) {
        this.description = description;
    }
	
	public void setSignatureAttachementInfo(String signatureAttachementInfo){
		this.signatureAttachementInfo = signatureAttachementInfo;
	}
	
	@javax.persistence.Transient
	public String getSignatureAttachementInfo(){
		return this.signatureAttachementInfo;
	}
	
	public void setSignatureDocument(Document signatureDocument){
		this.signatureDocument = signatureDocument;
	}
	
	@javax.persistence.Transient
	public Document getSignatureDocument(){
		return this.signatureDocument;
	}

	/**
	 * 获取签名（图片）.
	 * 
	 * @return 签名（图片）
	 */
	@Column(name="SIGNATURE_PIC")
	public String getSignaturePic() {
		return signaturePic;
	}
	/**
	 * 设置签名（图片）.
	 * @param signaturePic 签名（图片）
	 */
	public void setSignaturePic(String signaturePic) {
		this.signaturePic = signaturePic;
	}
	@javax.persistence.Transient
	public Document getSignaturePicDocument() {
		return signaturePicDocument;
	}
	
	public void setSignaturePicDocument(Document signaturePicDocument) {
		this.signaturePicDocument = signaturePicDocument;
	}
	
	/**
	 * 获取签名（字节）.
	 * 
	 * @return 签名（字节）
	 */
	@Column(nullable=true
		,length=2000

		,name="SIGNATURE_PIC_BYTE"
	)
    @javax.persistence.Lob
    public String getSignaturePicByte() {
        return signaturePicByte;
    }
	/**
	 * 设置签名（字节）.
	 * @param signaturePicByte 签名（字节）
	 */
    public void setSignaturePicByte(String signaturePicByte) {
        this.signaturePicByte = signaturePicByte;
    }
	@OneToOne
	@JoinColumn(name = "STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getStaff() {
        return staff;
    }
    public void setStaff(Staff staff) {
        this.staff = staff;
    }
	
	
	protected String _getEntityName() {
		return X6BasicSignature.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_ggSignetManage_Signature,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
