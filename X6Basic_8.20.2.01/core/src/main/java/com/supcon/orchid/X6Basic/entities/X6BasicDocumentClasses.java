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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 文档分类.
 */
@javax.persistence.Entity(name=X6BasicDocumentClasses.JPA_NAME)
@Table(name = X6BasicDocumentClasses.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_documentClass")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_documentClass_DocumentClasses")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_documentClass_DocumentClasses,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicDocumentClassesConvertor.class})
public class X6BasicDocumentClasses extends com.supcon.orchid.orm.entities.AbstractEcTreeFullEntity<X6BasicDocumentClasses> {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_documentClass";
	public static final String MODEL_CODE = "X6Basic_1.0_documentClass_DocumentClasses";
	public static final String DOC_TYPE = "X6Basic_documentClass_documentClasses";
	public static final String TABLE_NAME = "x6basic_document_classes";
	public static final String JPA_NAME = "X6BasicDocumentClasses";


		private String code ; // 编码


		private String codeRule ; // 编码规则


		private String description ; // 描述
	@BAPIsMainDisplay

		private String name ; // 文档分类
	
	
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
	 * 
	 * @return 编码
	 */
	@Column(unique=true

		,length = 256
		,name="CODE"
	)
	@Index(name="index_DocumentClasses_code")	
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
	 * 获取编码规则.
	 * 
	 * @return 编码规则
	 */
	@Column(nullable=true
		,length=256

		,name="CODE_RULE"
	)
    public String getCodeRule() {
        return codeRule;
    }
	/**
	 * 设置编码规则.
	 * @param codeRule 编码规则
	 */
    public void setCodeRule(String codeRule) {
        this.codeRule = codeRule;
    }
	/**
	 * 获取描述.
	 * 
	 * @return 描述
	 */
	@Column(nullable=true

		,length = 2000
		,name="DESCRIPTION"
	)
    public String getDescription() {
        return description;
    }
	/**
	 * 设置描述.
	 * @param description 描述
	 */
    public void setDescription(String description) {
        this.description = description;
    }
	/**
	 * 获取文档分类.
	 * 
	 * @return 文档分类
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置文档分类.
	 * @param name 文档分类
	 */
    public void setName(String name) {
        this.name = name;
    }
	
	/**
	 * 大文本字段，用来保存OA类型的字段信息。
	 */
	protected String extraCol;

	@javax.persistence.Lob
	public String getExtraCol() {
		return extraCol;
	}

	public void setExtraCol(String extraCol) {
		this.extraCol = extraCol;
	}

	protected Map<String, String> extraColMap = new HashMap<>();

	@javax.persistence.Transient
	public Map<String, String> getExtraColMap() {
		return extraColMap;
	}

	public void setExtraColMap(Map<String, String> extraColMap) {
		this.extraColMap = extraColMap;
	}
	
	protected String _getEntityName() {
		return X6BasicDocumentClasses.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_documentClass_DocumentClasses,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
