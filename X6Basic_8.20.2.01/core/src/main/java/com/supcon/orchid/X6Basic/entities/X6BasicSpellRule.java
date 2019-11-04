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
 * 轮班规则.
 */
@javax.persistence.Entity(name=X6BasicSpellRule.JPA_NAME)
@Table(name = X6BasicSpellRule.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_spellRule")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_spellRule_SpellRule")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "SR_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicSpellRuleConvertor.class})
public class X6BasicSpellRule extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_spellRule";
	public static final String MODEL_CODE = "X6Basic_1.0_spellRule_SpellRule";
	public static final String DOC_TYPE = "X6Basic_spellRule_spellRule";
	public static final String TABLE_NAME = "s2base_spellrule";
	public static final String JPA_NAME = "X6BasicSpellRule";


		private String code ; // 轮班编码
	@BAPIsMainDisplay

		private String name ; // 轮班名称


		private String srMemo ; // 备注


		private String times ; // 时间节点
	
	private List<X6BasicSpellRulePart> spellRulePartList;
	
	public void setSpellRulePartList(List<X6BasicSpellRulePart> spellRulePartList){
		this.spellRulePartList = spellRulePartList;
	}
	@Transient
	public List<X6BasicSpellRulePart> getSpellRulePartList(){
		return spellRulePartList;
	}
	
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
	 * 获取轮班编码.
	 * 
	 * @return 轮班编码
	 */
	@Column(unique=true

		,length = 256
		,name="SR_CODE"
	)
	@Index(name="index_SpellRule_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置轮班编码.
	 * @param code 轮班编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取轮班名称.
	 * 
	 * @return 轮班名称
	 */
	@Column(

		length = 256
		,name="SR_NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置轮班名称.
	 * @param name 轮班名称
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

		,name="SR_MEMO"
	)
    @javax.persistence.Lob
    public String getSrMemo() {
        return srMemo;
    }
	/**
	 * 设置备注.
	 * @param srMemo 备注
	 */
    public void setSrMemo(String srMemo) {
        this.srMemo = srMemo;
    }
	/**
	 * 获取时间节点.
	 * 
	 * @return 时间节点
	 */
	@Column(nullable=true

		,length = 256
		,name="SR_TIMES"
	)
    public String getTimes() {
        return times;
    }
	/**
	 * 设置时间节点.
	 * @param times 时间节点
	 */
    public void setTimes(String times) {
        this.times = times;
    }
	
	
	protected String _getEntityName() {
		return X6BasicSpellRule.class.getName();
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
	private String spellRuleIdDeleteIds;
	private String spellRuleIdAddIds;
	private String spellRuleIdmultiselectIDs;
	private String spellRuleIdmultiselectNames;

	@javax.persistence.Transient
	public String getSpellRuleIdDeleteIds(){
		return this.spellRuleIdDeleteIds;
	}

	public void setSpellRuleIdDeleteIds(String deleteIds){
		this.spellRuleIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getSpellRuleIdmultiselectIDs(){
		return this.spellRuleIdmultiselectIDs;
	}

	public void setSpellRuleIdmultiselectIDs(String multiselectIDs){
		this.spellRuleIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getSpellRuleIdmultiselectNames(){
		return this.spellRuleIdmultiselectNames;
	}

	public void setSpellRuleIdmultiselectNames(String multiselectNames){
		this.spellRuleIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getSpellRuleIdAddIds(){
		return this.spellRuleIdAddIds;
	}

	public void setSpellRuleIdAddIds(String addIds){
		this.spellRuleIdAddIds = addIds;
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
