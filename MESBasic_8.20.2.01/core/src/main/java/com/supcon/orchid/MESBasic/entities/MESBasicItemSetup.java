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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 测点.
 */
@javax.persistence.Entity(name=MESBasicItemSetup.JPA_NAME)
@Table(name = MESBasicItemSetup.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_itemManage")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_itemManage_ItemSetup")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_itemManage_ItemSetup,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicItemSetupConvertor.class})
public class MESBasicItemSetup extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_itemManage";
	public static final String MODEL_CODE = "MESBasic_1_itemManage_ItemSetup";
	public static final String DOC_TYPE = "MESBasic_itemManage_itemSetup";
	public static final String TABLE_NAME = "pellet_itemsetup";
	public static final String JPA_NAME = "MESBasicItemSetup";

		private Boolean active = 
			Boolean.valueOf("true")
		; // 启用, 
	private SystemCode calcType
; // 算法类型

		@BAPIsMneCode
		private String code ; // 测点编码


		private java.math.BigDecimal compareNumber ; // 比较数值


		private java.math.BigDecimal compareTime ; // 比较时间(分钟)


		private java.math.BigDecimal crtValue ; // 当前值
	private SystemCode dataSouceType
; // 数据来源
	private SystemCode dataType
		= new SystemCode("DataType/2")
		; // 数据类型（与老系统兼容）

		private Integer delay = 
			Integer.valueOf("0")
		; // 时延(s), 
	private Department department;
	private SystemCode energyType
; // 能源类型


		private String factor ; // 修正公式


		private String formula ; // 计算公式
	private SystemCode frequency
; // 数据频率
	private SystemCode gatherLevel
; // 统计级别


		private Long isId ; // 同步S2ID


		private Boolean isSystem = false; // 系统定义
	private SystemCode itemClass
; // 位号属性


		private String itemMemo ; // 备注
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String itemName ; // 测点名称

		@BAPIsMneCode
		private String itemNumber ; // 生产位号
	private MESBasicPlaceManage itemPlace;
	@BAPSeniorSystemCode(code="ItemRole")
	private String itemRole
; // 测点角色
	private String itemRoleForDisplay;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date lastEtime ; // 最近期末时间


		private java.math.BigDecimal lastEvalue ; // 最近期末值

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date lastStime ; // 最近期初时间


		private java.math.BigDecimal lastSvalue ; // 最近期初值


		private String machine ; // 装置名称


		private Boolean manuallySet = false; // 手动设置相关测点


		private String params ; // 参数


		private String procedure ; // 工序
	@BAPSeniorSystemCode(code="projectType")
	private String projectType
; // 项目类型
	private String projectTypeForDisplay;
	private SystemCode purpose
; // 测点用途


		private java.math.BigDecimal range ; // 量程
	private SystemCode tagType
; // 类型
	private X6BasicBaseUnit unit;


		private String unitCode ; // 单位编码

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date updatTime ; // 更新时间


		private Boolean virtualTag = false; // 虚拟位号
	private SystemCode workLine
; // 作业区
	
	private List<MESBasicItemPart> itemPartList;
	
	public void setItemPartList(List<MESBasicItemPart> itemPartList){
		this.itemPartList = itemPartList;
	}
	@Transient
	public List<MESBasicItemPart> getItemPartList(){
		return itemPartList;
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
	 * 获取启用.
	 * 标记位号是否继续采集数据。
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
	 * 获取算法类型.
	 * 
	 * @return 算法类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="IS_CALCTYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getCalcType() {
		return calcType;
	}
	/**
	 * 设置算法类型.
	 * @param calcType 算法类型
	 */
	public void setCalcType(SystemCode calcType) {
		this.calcType = (SystemCode) calcType;
	}
	/**
	 * 获取测点编码.
	 * 在系统内部的测点的编码
	 * @return 测点编码
	 */
	@Column(

		length = 2000
		,name="CODE"
	)
	@Index(name="index_ItemSetup_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置测点编码.
	 * @param code 测点编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取比较数值.
	 * 虚拟位号使用：当未填写计算公式时，必须填写该“比较数值”，表示和关联的测点数据进行差值比较。
	 * @return 比较数值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="COMPARE_NUMBER"
	)
    public java.math.BigDecimal getCompareNumber() {
        return compareNumber;
    }
	/**
	 * 设置比较数值.
	 * @param compareNumber 比较数值
	 */
    public void setCompareNumber(java.math.BigDecimal compareNumber) {
        this.compareNumber = compareNumber;
    }
	/**
	 * 获取比较时间(分钟).
	 * 虚拟位号使用：当未填写计算公式时，必须填写“比较时间”，表示和多久之前的测点数据进行比较。
	 * @return 比较时间(分钟)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="COMPARE_TIME"
	)
    public java.math.BigDecimal getCompareTime() {
        return compareTime;
    }
	/**
	 * 设置比较时间(分钟).
	 * @param compareTime 比较时间(分钟)
	 */
    public void setCompareTime(java.math.BigDecimal compareTime) {
        this.compareTime = compareTime;
    }
	/**
	 * 获取当前值.
	 * 位号最近一次数据更新时的数据值
	 * @return 当前值
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="CRT_VALUE"
	)
    public java.math.BigDecimal getCrtValue() {
        return crtValue;
    }
	/**
	 * 设置当前值.
	 * @param crtValue 当前值
	 */
    public void setCrtValue(java.math.BigDecimal crtValue) {
        this.crtValue = crtValue;
    }
	/**
	 * 获取数据来源.
	 * 
	 * @return 数据来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DATA_COME_FROM", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDataSouceType() {
		return dataSouceType;
	}
	/**
	 * 设置数据来源.
	 * @param dataSouceType 数据来源
	 */
	public void setDataSouceType(SystemCode dataSouceType) {
		this.dataSouceType = (SystemCode) dataSouceType;
	}
	/**
	 * 获取数据类型（与老系统兼容）.
	 * 
	 * @return 数据类型（与老系统兼容）
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="IS_DATATYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDataType() {
		return dataType;
	}
	/**
	 * 设置数据类型（与老系统兼容）.
	 * @param dataType 数据类型（与老系统兼容）
	 */
	public void setDataType(SystemCode dataType) {
		this.dataType = (SystemCode) dataType;
	}
	/**
	 * 获取时延(s).
	 * 针对虚拟位号，它的值是有其他位号通过计算公式计算得到的，但公式中的每一个位号的值采集时间不一定一致，因此系统认为在采集时间不超过时延量的数据，都认为是同一批数据，即可以进行运算的数据。
	 * @return 时延(s)
	 */
	@Column(nullable=true

		,name="DELAY"
	)
    public Integer getDelay() {
        return delay;
    }
	/**
	 * 设置时延(s).
	 * @param delay 时延(s)
	 */
    public void setDelay(Integer delay) {
        this.delay = delay;
    }
	@OneToOne
	@JoinColumn(name = "IS_DEPARTMENT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getDepartment() {
        return department;
    }
    public void setDepartment(Department department) {
        this.department = department;
    }
	/**
	 * 获取能源类型.
	 * 
	 * @return 能源类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="IS_ITEMCLASS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getEnergyType() {
		return energyType;
	}
	/**
	 * 设置能源类型.
	 * @param energyType 能源类型
	 */
	public void setEnergyType(SystemCode energyType) {
		this.energyType = (SystemCode) energyType;
	}
	/**
	 * 获取修正公式.
	 * 位号的修正公式，由于PIMS此埃及数据与管理系统的显示单位不一致，或者仪表的检验修正数量，需要修正采集的数据。在修正公式中，使用n代表原始值，且仅允许一个字母参数n。该公式是一个四则运算公式，例如1.2*n+0.5，如果位号是一个累计值，则修正的是指定时间段内的累积量，如果是瞬时值，修正的是瞬时量，对于开关量，不进行修正。
	 * @return 修正公式
	 */
	@Column(nullable=true
		,length=4000

		,name="FACTOR"
	)
    @javax.persistence.Lob
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
	 * 获取计算公式.
	 * 
	 * @return 计算公式
	 */
	@Column(nullable=true
		,length=4000

		,name="IS_FORMULA"
	)
    @javax.persistence.Lob
    public String getFormula() {
        return formula;
    }
	/**
	 * 设置计算公式.
	 * @param formula 计算公式
	 */
    public void setFormula(String formula) {
        this.formula = formula;
    }
	/**
	 * 获取数据频率.
	 * 
	 * @return 数据频率
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="IS_FREQUENCY", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getFrequency() {
		return frequency;
	}
	/**
	 * 设置数据频率.
	 * @param frequency 数据频率
	 */
	public void setFrequency(SystemCode frequency) {
		this.frequency = (SystemCode) frequency;
	}
	/**
	 * 获取统计级别.
	 * 
	 * @return 统计级别
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="IS_GATHERLVL", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getGatherLevel() {
		return gatherLevel;
	}
	/**
	 * 设置统计级别.
	 * @param gatherLevel 统计级别
	 */
	public void setGatherLevel(SystemCode gatherLevel) {
		this.gatherLevel = (SystemCode) gatherLevel;
	}
	/**
	 * 获取同步S2ID.
	 * 
	 * @return 同步S2ID
	 */
	@Column(nullable=true

		,name="IS_ID"
	)
    public Long getIsId() {
        return isId;
    }
	/**
	 * 设置同步S2ID.
	 * @param isId 同步S2ID
	 */
    public void setIsId(Long isId) {
        this.isId = isId;
    }
	/**
	 * 获取系统定义.
	 * 
	 * @return 系统定义
	 */
	@Column(nullable=true

		,name="IS_ISSYSTEM"
	)
    public Boolean getIsSystem() {
        return null == isSystem ? false : isSystem;
    }
	/**
	 * 设置系统定义.
	 * @param isSystem 系统定义
	 */
    public void setIsSystem(Boolean isSystem) {
        this.isSystem = isSystem;
    }
	/**
	 * 获取位号属性.
	 * 
	 * @return 位号属性
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="MEASURE_CLASS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getItemClass() {
		return itemClass;
	}
	/**
	 * 设置位号属性.
	 * @param itemClass 位号属性
	 */
	public void setItemClass(SystemCode itemClass) {
		this.itemClass = (SystemCode) itemClass;
	}
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true
		,length=4000

		,name="IS_MEMO"
	)
    @javax.persistence.Lob
    public String getItemMemo() {
        return itemMemo;
    }
	/**
	 * 设置备注.
	 * @param itemMemo 备注
	 */
    public void setItemMemo(String itemMemo) {
        this.itemMemo = itemMemo;
    }
	/**
	 * 获取测点名称.
	 * 
	 * @return 测点名称
	 */
	@Column(

		length = 500
		,name="IS_ITEMNAME"
	)
    public String getItemName() {
        return itemName;
    }
	/**
	 * 设置测点名称.
	 * @param itemName 测点名称
	 */
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
	/**
	 * 获取生产位号.
	 * 
	 * @return 生产位号
	 */
	@Column(nullable=true

		,length = 500
		,name="IS_ITEMNUMBER"
	)
    public String getItemNumber() {
        return itemNumber;
    }
	/**
	 * 设置生产位号.
	 * @param itemNumber 生产位号
	 */
    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
    }
	@ManyToOne
	@JoinColumn(name = "ITEM_PLACE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicPlaceManage getItemPlace() {
        return itemPlace;
    }
    public void setItemPlace(MESBasicPlaceManage itemPlace) {
        this.itemPlace = itemPlace;
    }
	/**
	 * 获取测点角色.
	 * 
	 * @return 测点角色
	 */
	@Column(name="IS_ITEMROLE")
	public String getItemRole() {
		return itemRole;
	}
	/**
	 * 设置测点角色.
	 * @param itemRole 测点角色
	 */
	public void setItemRole(String itemRole) {
		this.itemRole = itemRole;
	}
	
	@javax.persistence.Transient
	public String getItemRoleForDisplay() {
		return itemRoleForDisplay;
	}
	
	public void setItemRoleForDisplay(String itemRoleForDisplay) {
		this.itemRoleForDisplay = itemRoleForDisplay;
	}
	/**
	 * 获取最近期末时间.
	 * 该测点最后一次被统计时，统计记录的期末时间。
	 * @return 最近期末时间
	 */
	@Column(nullable=true

		,name="LAST_ETIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getLastEtime() {
        return lastEtime;
    }
	/**
	 * 设置最近期末时间.
	 * @param lastEtime 最近期末时间
	 */
    public void setLastEtime(java.util.Date lastEtime) {
        this.lastEtime = lastEtime;
    }
	/**
	 * 获取最近期末值.
	 * 该测点最后一次被统计时，统计记录的期末值
	 * @return 最近期末值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LAST_EVALUE"
	)
    public java.math.BigDecimal getLastEvalue() {
        return lastEvalue;
    }
	/**
	 * 设置最近期末值.
	 * @param lastEvalue 最近期末值
	 */
    public void setLastEvalue(java.math.BigDecimal lastEvalue) {
        this.lastEvalue = lastEvalue;
    }
	/**
	 * 获取最近期初时间.
	 * 该测点最后一次被统计时，统计记录的期初时间。
	 * @return 最近期初时间
	 */
	@Column(nullable=true

		,name="LAST_STIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getLastStime() {
        return lastStime;
    }
	/**
	 * 设置最近期初时间.
	 * @param lastStime 最近期初时间
	 */
    public void setLastStime(java.util.Date lastStime) {
        this.lastStime = lastStime;
    }
	/**
	 * 获取最近期初值.
	 * 该测点最后一次被统计时，统计记录的期初值
	 * @return 最近期初值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LAST_SVALUE"
	)
    public java.math.BigDecimal getLastSvalue() {
        return lastSvalue;
    }
	/**
	 * 设置最近期初值.
	 * @param lastSvalue 最近期初值
	 */
    public void setLastSvalue(java.math.BigDecimal lastSvalue) {
        this.lastSvalue = lastSvalue;
    }
	/**
	 * 获取装置名称.
	 * 
	 * @return 装置名称
	 */
	@Column(nullable=true

		,length = 500
		,name="IS_MACHINE"
	)
    public String getMachine() {
        return machine;
    }
	/**
	 * 设置装置名称.
	 * @param machine 装置名称
	 */
    public void setMachine(String machine) {
        this.machine = machine;
    }
	/**
	 * 获取手动设置相关测点.
	 * 若勾选该字段，相关测点PT可编辑并且显示增删行按钮；若不勾选，相关测点PT只读并隐藏增删行按钮。
	 * @return 手动设置相关测点
	 */
	@Column(nullable=true

		,name="MANUALLY_SET"
	)
    public Boolean getManuallySet() {
        return null == manuallySet ? false : manuallySet;
    }
	/**
	 * 设置手动设置相关测点.
	 * @param manuallySet 手动设置相关测点
	 */
    public void setManuallySet(Boolean manuallySet) {
        this.manuallySet = manuallySet;
    }
	/**
	 * 获取参数.
	 * 
	 * @return 参数
	 */
	@Column(nullable=true

		,length = 2000
		,name="IS_PARAMETER"
	)
    public String getParams() {
        return params;
    }
	/**
	 * 设置参数.
	 * @param params 参数
	 */
    public void setParams(String params) {
        this.params = params;
    }
	/**
	 * 获取工序.
	 * 
	 * @return 工序
	 */
	@Column(nullable=true

		,length = 200
		,name="IS_PROCEDURE"
	)
    public String getProcedure() {
        return procedure;
    }
	/**
	 * 设置工序.
	 * @param procedure 工序
	 */
    public void setProcedure(String procedure) {
        this.procedure = procedure;
    }
	/**
	 * 获取项目类型.
	 * 
	 * @return 项目类型
	 */
	@Column(name="IS_PROJECTTYPE")
	public String getProjectType() {
		return projectType;
	}
	/**
	 * 设置项目类型.
	 * @param projectType 项目类型
	 */
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	
	@javax.persistence.Transient
	public String getProjectTypeForDisplay() {
		return projectTypeForDisplay;
	}
	
	public void setProjectTypeForDisplay(String projectTypeForDisplay) {
		this.projectTypeForDisplay = projectTypeForDisplay;
	}
	/**
	 * 获取测点用途.
	 * 
	 * @return 测点用途
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PURPOSE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getPurpose() {
		return purpose;
	}
	/**
	 * 设置测点用途.
	 * @param purpose 测点用途
	 */
	public void setPurpose(SystemCode purpose) {
		this.purpose = (SystemCode) purpose;
	}
	/**
	 * 获取量程.
	 * 
	 * @return 量程
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="RANGE"
	)
    public java.math.BigDecimal getRange() {
        return range;
    }
	/**
	 * 设置量程.
	 * @param range 量程
	 */
    public void setRange(java.math.BigDecimal range) {
        this.range = range;
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
	@OneToOne
	@JoinColumn(name = "UNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getUnit() {
        return unit;
    }
    public void setUnit(X6BasicBaseUnit unit) {
        this.unit = unit;
    }
	/**
	 * 获取单位编码.
	 * 
	 * @return 单位编码
	 */
	@Column(nullable=true

		,length = 200
		,name="IS_MEASURE"
	)
    public String getUnitCode() {
        return unitCode;
    }
	/**
	 * 设置单位编码.
	 * @param unitCode 单位编码
	 */
    public void setUnitCode(String unitCode) {
        this.unitCode = unitCode;
    }
	/**
	 * 获取更新时间.
	 * 位号最近一次数据更新的时间
	 * @return 更新时间
	 */
	@Column(nullable=true

		,name="UPDAT_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getUpdatTime() {
        return updatTime;
    }
	/**
	 * 设置更新时间.
	 * @param updatTime 更新时间
	 */
    public void setUpdatTime(java.util.Date updatTime) {
        this.updatTime = updatTime;
    }
	/**
	 * 获取虚拟位号.
	 * 虚拟位号必须有计算公式，虚拟位号的值，是由计算公式中的各项计算得到的。
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
	/**
	 * 获取作业区.
	 * 
	 * @return 作业区
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="IS_WORKLINE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getWorkLine() {
		return workLine;
	}
	/**
	 * 设置作业区.
	 * @param workLine 作业区
	 */
	public void setWorkLine(SystemCode workLine) {
		this.workLine = (SystemCode) workLine;
	}
	
	
	protected String _getEntityName() {
		return MESBasicItemSetup.class.getName();
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
	private String itemItemViewDeleteIds;
	private String itemItemViewAddIds;
	private String itemItemViewmultiselectIDs;
	private String itemItemViewmultiselectNames;

	@javax.persistence.Transient
	public String getItemItemViewDeleteIds(){
		return this.itemItemViewDeleteIds;
	}

	public void setItemItemViewDeleteIds(String deleteIds){
		this.itemItemViewDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getItemItemViewmultiselectIDs(){
		return this.itemItemViewmultiselectIDs;
	}

	public void setItemItemViewmultiselectIDs(String multiselectIDs){
		this.itemItemViewmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getItemItemViewmultiselectNames(){
		return this.itemItemViewmultiselectNames;
	}

	public void setItemItemViewmultiselectNames(String multiselectNames){
		this.itemItemViewmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getItemItemViewAddIds(){
		return this.itemItemViewAddIds;
	}

	public void setItemItemViewAddIds(String addIds){
		this.itemItemViewAddIds = addIds;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_itemManage_ItemSetup,MESBasic_1) */
// 自定义代码
	/**
	 * 根据系统编码的值，返回定时器的执行周期， 
	 * 系统编码的编码值的含义，是多少分钟，例如编码值为1，则表示为1分钟，
	 * 返回值的单位是毫秒
	 * 如果返回了-1，表示该频率目前不支持
	 * 
	 * @param sc
	 * @return
	 */
   @javax.persistence.Transient
	public Long getFrequencySystemDefine() {
		String code = this.getFrequency().getCode();
		try{
			return Long.parseLong(code) * 60 * 1000L;
		}catch(Exception ex){
			return -1L;
		}
	}
/* CUSTOM CODE END */
}
