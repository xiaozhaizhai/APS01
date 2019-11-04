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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 单位组.
 */
@javax.persistence.Entity(name=X6BasicUnitGroups.JPA_NAME)
@Table(name = X6BasicUnitGroups.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_unitGroup")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_unitGroup_UnitGroups")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "UNITGROUP_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_unitGroup_UnitGroups,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicUnitGroupsConvertor.class})
public class X6BasicUnitGroups extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_unitGroup";
	public static final String MODEL_CODE = "X6Basic_1.0_unitGroup_UnitGroups";
	public static final String DOC_TYPE = "X6Basic_unitGroup_unitGroups";
	public static final String TABLE_NAME = "s2base_unitgroup";
	public static final String JPA_NAME = "X6BasicUnitGroups";


		private String code ; // 单位组代码
	private SystemCode groupBapType
; //  单位组类型


		private String groupMemo ; // 备注
	@BAPSeniorSystemCode(code="UnitType")
	private String groupType
; // 单位组类型
	private String groupTypeForDisplay;
	@BAPIsMainDisplay

		private String name ; // 单位组名称
	
	private List<X6BasicBaseUnit> baseUnitList;
	
	public void setBaseUnitList(List<X6BasicBaseUnit> baseUnitList){
		this.baseUnitList = baseUnitList;
	}
	@Transient
	public List<X6BasicBaseUnit> getBaseUnitList(){
		return baseUnitList;
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
	 * 获取单位组代码.
	 * 
	 * @return 单位组代码
	 */
	@Column(

		length = 256
		,name="UNITGROUP_CODE"
	)
	@Index(name="index_UnitGroups_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置单位组代码.
	 * @param code 单位组代码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取 单位组类型.
	 * 
	 * @return  单位组类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="UNITGROUP_BAPTYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getGroupBapType() {
		return groupBapType;
	}
	/**
	 * 设置 单位组类型.
	 * @param groupBapType  单位组类型
	 */
	public void setGroupBapType(SystemCode groupBapType) {
		this.groupBapType = (SystemCode) groupBapType;
	}
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="UNITGROUP_MEMO"
	)
    @javax.persistence.Lob
    public String getGroupMemo() {
        return groupMemo;
    }
	/**
	 * 设置备注.
	 * @param groupMemo 备注
	 */
    public void setGroupMemo(String groupMemo) {
        this.groupMemo = groupMemo;
    }
	/**
	 * 获取单位组类型.
	 * 
	 * @return 单位组类型
	 */
	@Column(name="UNITGROUP_TYPE")
	public String getGroupType() {
		return groupType;
	}
	/**
	 * 设置单位组类型.
	 * @param groupType 单位组类型
	 */
	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}
	
	@javax.persistence.Transient
	public String getGroupTypeForDisplay() {
		return groupTypeForDisplay;
	}
	
	public void setGroupTypeForDisplay(String groupTypeForDisplay) {
		this.groupTypeForDisplay = groupTypeForDisplay;
	}
	/**
	 * 获取单位组名称.
	 * 
	 * @return 单位组名称
	 */
	@Column(

		length = 256
		,name="UNITGROUP_NAME"
	)
	@Index(name="index_UnitGroups_name")	
    public String getName() {
        return name;
    }
	/**
	 * 设置单位组名称.
	 * @param name 单位组名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	
	
	protected String _getEntityName() {
		return X6BasicUnitGroups.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_unitGroup_UnitGroups,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
