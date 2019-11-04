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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 位号配置.
 */
@javax.persistence.Entity(name=MESBasicTagProperty.JPA_NAME)
@org.hibernate.annotations.Table(appliesTo=MESBasicTagProperty.TABLE_NAME,indexes={@Index(columnNames = IAuditEntity.P_CREATE_STAFF_ID, name = "IDX_TAGPROPERTY_CREATESTAFF"),
		@Index(columnNames = IAuditEntity.POSITION_LAY_REC, name = "IDX_TAGPROPERTY_POST_REC"),@Index(columnNames = IAuditEntity.P_OWNER_STAFF_ID, name = "IDX_TAGPROPERTY_OWNER_ID"),
		@Index(columnNames = IAuditEntity.P_CREATE_TIME, name = "IDX_TAGPROPERTY_CREATETIME")})
@Table(name = MESBasicTagProperty.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_tagProperty")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_tagProperty_TagProperty")
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
public class MESBasicTagProperty extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_tagProperty";
	public static final String MODEL_CODE = "MESBasic_1_tagProperty_TagProperty";
	public static final String DOC_TYPE = "MESBasic_tagProperty_tagProperty";
	public static final String TABLE_NAME = "mesbasic_tag_properties";
	public static final String JPA_NAME = "MESBasicTagProperty";

		private Boolean active = 
			Boolean.valueOf("true")
		; // 启用, 
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String code ; // 编码


		private java.math.BigDecimal crtValue ; // 位号当前值

		private java.math.BigDecimal delay = 
			java.math.BigDecimal.valueOf(Double.valueOf("0"))
		; // 时延, 


		private String expression ; // 计算公式


		private String factor ; // 修正公式

		@BAPIsMneCode
		private String name ; // 名称


		private String remark ; // 备注

		@BAPIsMneCode
		private String tag ; // 位号
	private SystemCode tagType
; // 类型
	private SystemCode tattribute
; // 属性


		private java.util.Date updateTime ; // 更新时间


		private Boolean virtualTag = false; // 虚拟位号
	
	
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
	 * 获取启用.
	 * 位号是否启用的标记，对于不启用的位号，系统不对该位号进行数据采集和公式计算。
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
	 * 获取编码.
	 * 位号在系统中的编码，系统唯一
	 * @return 编码
	 */
	@Column(unique=true

		,length = 2000
		,name="CODE"
	)
	@Index(name="index_TagProperty_code")	
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
	 * 获取位号当前值.
	 * 位号最近一次更新后的值
	 * @return 位号当前值
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="CRT_VALUE"
	)
    public java.math.BigDecimal getCrtValue() {
        return crtValue;
    }
	/**
	 * 设置位号当前值.
	 * @param crtValue 位号当前值
	 */
    public void setCrtValue(java.math.BigDecimal crtValue) {
        this.crtValue = crtValue;
    }
	/**
	 * 获取时延.
	 * 针对虚拟位号，它的值是有其他位号通过计算公式计算得到的，但公式中的每一个位号的值采集时间不一定一致，因此系统认为在采集时间不超过时延量的数据，都认为是同一批数据，即可以进行运算的数据。
	 * @return 时延
	 */
	@Column(nullable=true
			,precision=19,scale=1
		,name="DELAY"
	)
    public java.math.BigDecimal getDelay() {
        return delay;
    }
	/**
	 * 设置时延.
	 * @param delay 时延
	 */
    public void setDelay(java.math.BigDecimal delay) {
        this.delay = delay;
    }
	/**
	 * 获取计算公式.
	 * 计算公式中涉及到的代码，使用的是位号的编码，不是位号，例如[a]+[b],其中a和b是系统中位号的编码。
	 * @return 计算公式
	 */
	@Column(nullable=true

		,length = 2000
		,name="EXPRESSION"
	)
    public String getExpression() {
        return expression;
    }
	/**
	 * 设置计算公式.
	 * @param expression 计算公式
	 */
    public void setExpression(String expression) {
        this.expression = expression;
    }
	/**
	 * 获取修正公式.
	 * 位号的修正公式，由于PIMS此埃及数据与管理系统的显示单位不一致，或者仪表的检验修正数量，需要修正采集的数据。在修正公式中，使用n代表原始值，且仅允许一个字母参数n。该公式是一个四则运算公式，例如1.2*n+0.5，如果位号是一个累计值，则修正的是指定时间段内的累积量，如果是瞬时值，修正的是瞬时量，对于开关量，不进行修正。
	 * @return 修正公式
	 */
	@Column(nullable=true

		,length = 200
		,name="FACTOR"
	)
    public String getFactor() {
        return factor;
    }
	/**
	 * 设置修正公式.
	 * @param factor 修正公式
	 */
    public void setFactor(String factor) {
        this.factor = factor;
    }
	/**
	 * 获取名称.
	 * 位号的业务名称，例如乙醇储罐罐内压力
	 * @return 名称
	 */
	@Column(

		length = 100
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置名称.
	 * @param name 名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取备注.
	 * 系统位号的说明信息。
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
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
	/**
	 * 获取位号.
	 * 对应PIMS中的一个位号
	 * @return 位号
	 */
	@Column(nullable=true

		,length = 2000
		,name="TAG"
	)
    public String getTag() {
        return tag;
    }
	/**
	 * 设置位号.
	 * @param tag 位号
	 */
    public void setTag(String tag) {
        this.tag = tag;
    }
	/**
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="TAG_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getTagType() {
		return tagType;
	}
	/**
	 * 设置类型.
	 * @param tagType 类型
	 */
	public void setTagType(SystemCode tagType) {
		this.tagType = (SystemCode) tagType;
	}
	/**
	 * 获取属性.
	 * 
	 * @return 属性
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="TATTRIBUTE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getTattribute() {
		return tattribute;
	}
	/**
	 * 设置属性.
	 * @param tattribute 属性
	 */
	public void setTattribute(SystemCode tattribute) {
		this.tattribute = (SystemCode) tattribute;
	}
	/**
	 * 获取更新时间.
	 * 位号当前值的更新时间
	 * @return 更新时间
	 */
	@Column(nullable=true

		,name="UPDATE_TIME"
	)
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getUpdateTime() {
        return updateTime;
    }
	/**
	 * 设置更新时间.
	 * @param updateTime 更新时间
	 */
    public void setUpdateTime(java.util.Date updateTime) {
        this.updateTime = updateTime;
    }
	/**
	 * 获取虚拟位号.
	 * 如果是虚拟位号，则显示计算公式，不允许编码为空，隐藏位号；如果不是虚拟位号，则显示修正公式，显示位号。
	 * @return 虚拟位号
	 */
	@Column(nullable=true

		,name="VIRTUAL_TAG"
	)
    public Boolean getVirtualTag() {
        return null == virtualTag ? false : virtualTag;
    }
	/**
	 * 设置虚拟位号.
	 * @param virtualTag 虚拟位号
	 */
    public void setVirtualTag(Boolean virtualTag) {
        this.virtualTag = virtualTag;
    }
	
	
	protected String _getEntityName() {
		return MESBasicTagProperty.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}