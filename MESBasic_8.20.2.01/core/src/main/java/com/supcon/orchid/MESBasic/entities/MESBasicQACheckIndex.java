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
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 检验指标.
 */
@javax.persistence.Entity(name=MESBasicQACheckIndex.JPA_NAME)
@Table(name = MESBasicQACheckIndex.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_checkIndex")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_checkIndex_QACheckIndex")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_checkIndex_QACheckIndex,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicQACheckIndexConvertor.class})
public class MESBasicQACheckIndex extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_checkIndex";
	public static final String MODEL_CODE = "MESBasic_1_checkIndex_QACheckIndex";
	public static final String DOC_TYPE = "MESBasic_checkIndex_qACheckIndex";
	public static final String TABLE_NAME = "limsbasic_check_indices";
	public static final String JPA_NAME = "MESBasicQACheckIndex";

		private Boolean active = 
			Boolean.valueOf("true")
		; // 启用, 


		private java.math.BigDecimal checkFee ; // 检验费用
	@BAPIsMainDisplay

		private String checkIndexCode ; // 指标编码


		private String checkIndexName ; // 指标名称


		private String code ; // 指标编码


		private String cstate ; // 启用状态


		private Integer decLength ; // 小数位数


		private String dispRule ; // 规则公式


		private String editType ; // 编辑方式


		private String memoField ; // 备注
	@BAPIsMainDisplay

		private String name ; // 指标名称


		private String showValues ; // 候选值
	private X6BasicBaseUnit unitID;


		private String valueKind ; // 值类型
	
	
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
	 * 获取启用.
	 * 
	 * @return 启用
	 */
	@Column(nullable=true

		,name="ACTIVE"
	)
    public Boolean getActive() {
        return null == active ? false : active;
    }
	/**
	 * 设置启用.
	 * @param active 启用
	 */
    public void setActive(Boolean active) {
        this.active = active;
    }
	/**
	 * 获取检验费用.
	 * 
	 * @return 检验费用
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="CHECKINDEX_CHECKFEE"
	)
    public java.math.BigDecimal getCheckFee() {
        return checkFee;
    }
	/**
	 * 设置检验费用.
	 * @param checkFee 检验费用
	 */
    public void setCheckFee(java.math.BigDecimal checkFee) {
        this.checkFee = checkFee;
    }
	/**
	 * 获取指标编码.
	 * 
	 * @return 指标编码
	 */
	@Column(nullable=true

		,length = 256
		,name="CHECKINDEX_CODE"
	)
    public String getCheckIndexCode() {
        return checkIndexCode;
    }
	/**
	 * 设置指标编码.
	 * @param checkIndexCode 指标编码
	 */
    public void setCheckIndexCode(String checkIndexCode) {
        this.checkIndexCode = checkIndexCode;
    }
	/**
	 * 获取指标名称.
	 * 
	 * @return 指标名称
	 */
	@Column(nullable=true

		,length = 256
		,name="CHECKINDEX_NAME"
	)
    public String getCheckIndexName() {
        return checkIndexName;
    }
	/**
	 * 设置指标名称.
	 * @param checkIndexName 指标名称
	 */
    public void setCheckIndexName(String checkIndexName) {
        this.checkIndexName = checkIndexName;
    }
	/**
	 * 获取指标编码.
	 * 
	 * @return 指标编码
	 */
	@Column(

		name="CODE"
	)
	@Index(name="index_QACheckIndex_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置指标编码.
	 * @param code 指标编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取启用状态.
	 * 
	 * @return 启用状态
	 */
	@Column(nullable=true

		,length = 256
		,name="CHECKINDEX_STATE"
	)
    public String getCstate() {
        return cstate;
    }
	/**
	 * 设置启用状态.
	 * @param cstate 启用状态
	 */
    public void setCstate(String cstate) {
        this.cstate = cstate;
    }
	/**
	 * 获取小数位数.
	 * 
	 * @return 小数位数
	 */
	@Column(nullable=true

		,name="DEC_LENGTH"
	)
    public Integer getDecLength() {
        return decLength;
    }
	/**
	 * 设置小数位数.
	 * @param decLength 小数位数
	 */
    public void setDecLength(Integer decLength) {
        this.decLength = decLength;
    }
	/**
	 * 获取规则公式.
	 * 
	 * @return 规则公式
	 */
	@Column(nullable=true

		,length = 2000
		,name="CHECKINDEX_DISPRULE"
	)
    public String getDispRule() {
        return dispRule;
    }
	/**
	 * 设置规则公式.
	 * @param dispRule 规则公式
	 */
    public void setDispRule(String dispRule) {
        this.dispRule = dispRule;
    }
	/**
	 * 获取编辑方式.
	 * 
	 * @return 编辑方式
	 */
	@Column(nullable=true

		,length = 200
		,name="EDIT_TYPE"
	)
    public String getEditType() {
        return editType;
    }
	/**
	 * 设置编辑方式.
	 * @param editType 编辑方式
	 */
    public void setEditType(String editType) {
        this.editType = editType;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="MEMO_FIELD"
	)
    public String getMemoField() {
        return memoField;
    }
	/**
	 * 设置备注.
	 * @param memoField 备注
	 */
    public void setMemoField(String memoField) {
        this.memoField = memoField;
    }
	/**
	 * 获取指标名称.
	 * 
	 * @return 指标名称
	 */
	@Column(nullable=true

		,length = 200
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置指标名称.
	 * @param name 指标名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取候选值.
	 * 
	 * @return 候选值
	 */
	@Column(nullable=true

		,length = 2000
		,name="SHOW_VALUES"
	)
    public String getShowValues() {
        return showValues;
    }
	/**
	 * 设置候选值.
	 * @param showValues 候选值
	 */
    public void setShowValues(String showValues) {
        this.showValues = showValues;
    }
	@OneToOne
	@JoinColumn(name = "UNITID", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getUnitID() {
        return unitID;
    }
    public void setUnitID(X6BasicBaseUnit unitID) {
        this.unitID = unitID;
    }
	/**
	 * 获取值类型.
	 * 
	 * @return 值类型
	 */
	@Column(nullable=true

		,length = 200
		,name="VALUE_KIND"
	)
    public String getValueKind() {
        return valueKind;
    }
	/**
	 * 设置值类型.
	 * @param valueKind 值类型
	 */
    public void setValueKind(String valueKind) {
        this.valueKind = valueKind;
    }
	
	
	protected String _getEntityName() {
		return MESBasicQACheckIndex.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_checkIndex_QACheckIndex,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
