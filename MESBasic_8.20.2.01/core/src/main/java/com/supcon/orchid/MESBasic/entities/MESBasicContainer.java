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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 容器.
 */
@javax.persistence.Entity(name=MESBasicContainer.JPA_NAME)
@Table(name = MESBasicContainer.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_container")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_container_Container")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicContainerConvertor.class})
public class MESBasicContainer extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_container";
	public static final String MODEL_CODE = "MESBasic_1_container_Container";
	public static final String DOC_TYPE = "MESBasic_container_container";
	public static final String TABLE_NAME = "mesbasic_containers";
	public static final String JPA_NAME = "MESBasicContainer";

		@BAPIsMneCode
		private String code ; // 编码
	private SystemCode containerShape
; // 容器形状
	private SystemCode containerStatus
		= new SystemCode("CONTAINER_STATUS/0")
		; // 容器状态
	private SystemCode containerType
; // 容器类型


		private java.math.BigDecimal density ; // 储料密度
	private Department department;
	private MESBasicEquipment equip;


		private String factorDisplay ; // 体积计算公式(展示用)


		private String gasDensityFactor ; // 气相密度修正公式


		private java.math.BigDecimal hlevel ; // 最大工作液位(m)


		private java.math.BigDecimal levelDeviation ; // 实际液位偏差(m)


		private String liquidDensityFactor ; // 液相密度修正公式


		private java.math.BigDecimal llevel ; // 最低工作液位(m)
	private MESBasicTankModel model;
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String name ; // 容器名称
	private Staff person;


		private String pimsurl ; // 监控页面


		private Boolean produceMgr = false; // 生产区容器
	private MESBasicProduct product;
	private MESBasicItemSetup propertyTags;


		private java.math.BigDecimal radius ; // 半径(m)


		private String remark ; // 备注


		private java.math.BigDecimal stdDensity ; // 标准密度


		private java.math.BigDecimal tankCapacity ; // 罐总量


		private java.math.BigDecimal tankHeight ; // 罐高(m)


		private Boolean tankMgr = false; // 罐区容器


		private String volumneCalc ; // 体积计算公式


		private String warehouse ; // 仓库


		private String warePosition ; // 库位
	
	private List<MESBasicPropertyTags> propertyTagsList;
	
	public void setPropertyTagsList(List<MESBasicPropertyTags> propertyTagsList){
		this.propertyTagsList = propertyTagsList;
	}
	@Transient
	public List<MESBasicPropertyTags> getPropertyTagsList(){
		return propertyTagsList;
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
	 * 获取编码.
	 * 储料罐的编号，系统唯一
	 * @return 编码
	 */
	@Column(

		length = 200
		,name="CODE"
	)
	@Index(name="index_Container_code")	
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
	 * 获取容器形状.
	 * 
	 * @return 容器形状
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CONTAINER_SHAPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getContainerShape() {
		return containerShape;
	}
	/**
	 * 设置容器形状.
	 * @param containerShape 容器形状
	 */
	public void setContainerShape(SystemCode containerShape) {
		this.containerShape = (SystemCode) containerShape;
	}
	/**
	 * 获取容器状态.
	 * 
	 * @return 容器状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CONTAINER_STATUS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getContainerStatus() {
		return containerStatus;
	}
	/**
	 * 设置容器状态.
	 * @param containerStatus 容器状态
	 */
	public void setContainerStatus(SystemCode containerStatus) {
		this.containerStatus = (SystemCode) containerStatus;
	}
	/**
	 * 获取容器类型.
	 * 
	 * @return 容器类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="CONTAINER_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getContainerType() {
		return containerType;
	}
	/**
	 * 设置容器类型.
	 * @param containerType 容器类型
	 */
	public void setContainerType(SystemCode containerType) {
		this.containerType = (SystemCode) containerType;
	}
	/**
	 * 获取储料密度.
	 * 用来计算储罐内物料的重量。
	 * @return 储料密度
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="DENSITY"
	)
    public java.math.BigDecimal getDensity() {
        return density;
    }
	/**
	 * 设置储料密度.
	 * @param density 储料密度
	 */
    public void setDensity(java.math.BigDecimal density) {
        this.density = density;
    }
	@OneToOne
	@JoinColumn(name = "DEPARTMENT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getDepartment() {
        return department;
    }
    public void setDepartment(Department department) {
        this.department = department;
    }
	@OneToOne
	@JoinColumn(name = "EQUIP", referencedColumnName="EAM_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicEquipment getEquip() {
        return equip;
    }
    public void setEquip(MESBasicEquipment equip) {
        this.equip = equip;
    }
	/**
	 * 获取体积计算公式(展示用).
	 * 
	 * @return 体积计算公式(展示用)
	 */
	@Column(nullable=true

		,length = 2000
		,name="FACTOR_DISPLAY"
	)
    public String getFactorDisplay() {
        return factorDisplay;
    }
	/**
	 * 设置体积计算公式(展示用).
	 * @param factorDisplay 体积计算公式(展示用)
	 */
    public void setFactorDisplay(String factorDisplay) {
        this.factorDisplay = factorDisplay;
    }
	/**
	 * 获取气相密度修正公式.
	 * 用于计算气体的实际密度值，密度修正公式为空时，直接采用查表密度。比如，气体的密度计算公式为：实际密度=查表密度*（压力*10+1）。
	 * @return 气相密度修正公式
	 */
	@Column(nullable=true

		,length = 2000
		,name="GAS_DENSITY_FACTOR"
	)
    public String getGasDensityFactor() {
        return gasDensityFactor;
    }
	/**
	 * 设置气相密度修正公式.
	 * @param gasDensityFactor 气相密度修正公式
	 */
    public void setGasDensityFactor(String gasDensityFactor) {
        this.gasDensityFactor = gasDensityFactor;
    }
	/**
	 * 获取最大工作液位(m).
	 * 
	 * @return 最大工作液位(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="HLEVEL"
	)
    public java.math.BigDecimal getHlevel() {
        return hlevel;
    }
	/**
	 * 设置最大工作液位(m).
	 * @param hlevel 最大工作液位(m)
	 */
    public void setHlevel(java.math.BigDecimal hlevel) {
        this.hlevel = hlevel;
    }
	/**
	 * 获取实际液位偏差(m).
	 * 该字段若不为空，则计算“实际液位(m)”时要加上该字段的数值，该字段可以填入正值或负值。
	 * @return 实际液位偏差(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LEVEL_DEVIATION"
	)
    public java.math.BigDecimal getLevelDeviation() {
        return levelDeviation;
    }
	/**
	 * 设置实际液位偏差(m).
	 * @param levelDeviation 实际液位偏差(m)
	 */
    public void setLevelDeviation(java.math.BigDecimal levelDeviation) {
        this.levelDeviation = levelDeviation;
    }
	/**
	 * 获取液相密度修正公式.
	 * 用于计算液体的实际密度值，密度修正公式为空时，直接采用查表密度。比如，气体的密度计算公式为：实际密度=查表密度*（压力*10+1）。
	 * @return 液相密度修正公式
	 */
	@Column(nullable=true

		,length = 2000
		,name="LIQUID_DENSITY_FACTOR"
	)
    public String getLiquidDensityFactor() {
        return liquidDensityFactor;
    }
	/**
	 * 设置液相密度修正公式.
	 * @param liquidDensityFactor 液相密度修正公式
	 */
    public void setLiquidDensityFactor(String liquidDensityFactor) {
        this.liquidDensityFactor = liquidDensityFactor;
    }
	/**
	 * 获取最低工作液位(m).
	 * 
	 * @return 最低工作液位(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LLEVEL"
	)
    public java.math.BigDecimal getLlevel() {
        return llevel;
    }
	/**
	 * 设置最低工作液位(m).
	 * @param llevel 最低工作液位(m)
	 */
    public void setLlevel(java.math.BigDecimal llevel) {
        this.llevel = llevel;
    }
	@OneToOne
	@JoinColumn(name = "MODEL", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicTankModel getModel() {
        return model;
    }
    public void setModel(MESBasicTankModel model) {
        this.model = model;
    }
	/**
	 * 获取容器名称.
	 * 容器的名称
	 * @return 容器名称
	 */
	@Column(

		length = 200
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置容器名称.
	 * @param name 容器名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	@OneToOne
	@JoinColumn(name = "PERSON", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getPerson() {
        return person;
    }
    public void setPerson(Staff person) {
        this.person = person;
    }
	/**
	 * 获取监控页面.
	 * PIMS的一个页面链接
	 * @return 监控页面
	 */
	@Column(nullable=true

		,length = 2000
		,name="PIMSURL"
	)
    public String getPimsurl() {
        return pimsurl;
    }
	/**
	 * 设置监控页面.
	 * @param pimsurl 监控页面
	 */
    public void setPimsurl(String pimsurl) {
        this.pimsurl = pimsurl;
    }
	/**
	 * 获取生产区容器.
	 * 选中时，表示是生产区使用的容器
	 * @return 生产区容器
	 */
	@Column(nullable=true

		,name="PRODUCE_MGR"
	)
    public Boolean getProduceMgr() {
        return null == produceMgr ? false : produceMgr;
    }
	/**
	 * 设置生产区容器.
	 * @param produceMgr 生产区容器
	 */
    public void setProduceMgr(Boolean produceMgr) {
        this.produceMgr = produceMgr;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct() {
        return product;
    }
    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }
	@ManyToOne
	@JoinColumn(name = "PROPERTY_TAGS", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getPropertyTags() {
        return propertyTags;
    }
    public void setPropertyTags(MESBasicItemSetup propertyTags) {
        this.propertyTags = propertyTags;
    }
	/**
	 * 获取半径(m).
	 * 
	 * @return 半径(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="RADIUS"
	)
    public java.math.BigDecimal getRadius() {
        return radius;
    }
	/**
	 * 设置半径(m).
	 * @param radius 半径(m)
	 */
    public void setRadius(java.math.BigDecimal radius) {
        this.radius = radius;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
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
	 * 获取标准密度.
	 * 
	 * @return 标准密度
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="STD_DENSITY"
	)
    public java.math.BigDecimal getStdDensity() {
        return stdDensity;
    }
	/**
	 * 设置标准密度.
	 * @param stdDensity 标准密度
	 */
    public void setStdDensity(java.math.BigDecimal stdDensity) {
        this.stdDensity = stdDensity;
    }
	/**
	 * 获取罐总量.
	 * 
	 * @return 罐总量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="TANK_CAPACITY"
	)
    public java.math.BigDecimal getTankCapacity() {
        return tankCapacity;
    }
	/**
	 * 设置罐总量.
	 * @param tankCapacity 罐总量
	 */
    public void setTankCapacity(java.math.BigDecimal tankCapacity) {
        this.tankCapacity = tankCapacity;
    }
	/**
	 * 获取罐高(m).
	 * 
	 * @return 罐高(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="TANK_HEIGHT"
	)
    public java.math.BigDecimal getTankHeight() {
        return tankHeight;
    }
	/**
	 * 设置罐高(m).
	 * @param tankHeight 罐高(m)
	 */
    public void setTankHeight(java.math.BigDecimal tankHeight) {
        this.tankHeight = tankHeight;
    }
	/**
	 * 获取罐区容器.
	 * 选中时，说明这个容器是使用在罐区管理中的。
	 * @return 罐区容器
	 */
	@Column(nullable=true

		,name="TANK_MGR"
	)
    public Boolean getTankMgr() {
        return null == tankMgr ? false : tankMgr;
    }
	/**
	 * 设置罐区容器.
	 * @param tankMgr 罐区容器
	 */
    public void setTankMgr(Boolean tankMgr) {
        this.tankMgr = tankMgr;
    }
	/**
	 * 获取体积计算公式.
	 * 体积计算公式；如果配置了型号，则该公式引用型号上的体积计算公式，用户可以手工修改该公式。如果没有配置型号，则用户手工录入一个体积的计算公式。公式中有未知参数，使用param0，param1等代替，作为动态传入的参数。
	 * @return 体积计算公式
	 */
	@Column(nullable=true

		,length = 2000
		,name="VOLUMNE_CALC"
	)
    public String getVolumneCalc() {
        return volumneCalc;
    }
	/**
	 * 设置体积计算公式.
	 * @param volumneCalc 体积计算公式
	 */
    public void setVolumneCalc(String volumneCalc) {
        this.volumneCalc = volumneCalc;
    }
	/**
	 * 获取仓库.
	 * 仓库编码
	 * @return 仓库
	 */
	@Column(nullable=true

		,length = 200
		,name="WAREHOUSE"
	)
    public String getWarehouse() {
        return warehouse;
    }
	/**
	 * 设置仓库.
	 * @param warehouse 仓库
	 */
    public void setWarehouse(String warehouse) {
        this.warehouse = warehouse;
    }
	/**
	 * 获取库位.
	 * 
	 * @return 库位
	 */
	@Column(nullable=true

		,length = 200
		,name="WARE_POSITION"
	)
    public String getWarePosition() {
        return warePosition;
    }
	/**
	 * 设置库位.
	 * @param warePosition 库位
	 */
    public void setWarePosition(String warePosition) {
        this.warePosition = warePosition;
    }
	
	
	protected String _getEntityName() {
		return MESBasicContainer.class.getName();
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
	private String containerPropertyDeleteIds;
	private String containerPropertyAddIds;
	private String containerPropertymultiselectIDs;
	private String containerPropertymultiselectNames;

	@javax.persistence.Transient
	public String getContainerPropertyDeleteIds(){
		return this.containerPropertyDeleteIds;
	}

	public void setContainerPropertyDeleteIds(String deleteIds){
		this.containerPropertyDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getContainerPropertymultiselectIDs(){
		return this.containerPropertymultiselectIDs;
	}

	public void setContainerPropertymultiselectIDs(String multiselectIDs){
		this.containerPropertymultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getContainerPropertymultiselectNames(){
		return this.containerPropertymultiselectNames;
	}

	public void setContainerPropertymultiselectNames(String multiselectNames){
		this.containerPropertymultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getContainerPropertyAddIds(){
		return this.containerPropertyAddIds;
	}

	public void setContainerPropertyAddIds(String addIds){
		this.containerPropertyAddIds = addIds;
	}

	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparamc")
	private Integer bigintparamc;
	
	@Column
    public Integer getBigintparamc() {
        return bigintparamc;
    }
	
    public void setBigintparamc(Integer bigintparamc) {
        this.bigintparamc = bigintparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparamd")
	private Integer bigintparamd;
	
	@Column
    public Integer getBigintparamd() {
        return bigintparamd;
    }
	
    public void setBigintparamd(Integer bigintparamd) {
        this.bigintparamd = bigintparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparame")
	private Integer bigintparame;
	
	@Column
    public Integer getBigintparame() {
        return bigintparame;
    }
	
    public void setBigintparame(Integer bigintparame) {
        this.bigintparame = bigintparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparamf")
	private Integer bigintparamf;
	
	@Column
    public Integer getBigintparamf() {
        return bigintparamf;
    }
	
    public void setBigintparamf(Integer bigintparamf) {
        this.bigintparamf = bigintparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparamg")
	private Integer bigintparamg;
	
	@Column
    public Integer getBigintparamg() {
        return bigintparamg;
    }
	
    public void setBigintparamg(Integer bigintparamg) {
        this.bigintparamg = bigintparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparamh")
	private Integer bigintparamh;
	
	@Column
    public Integer getBigintparamh() {
        return bigintparamh;
    }
	
    public void setBigintparamh(Integer bigintparamh) {
        this.bigintparamh = bigintparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparami")
	private Integer bigintparami;
	
	@Column
    public Integer getBigintparami() {
        return bigintparami;
    }
	
    public void setBigintparami(Integer bigintparami) {
        this.bigintparami = bigintparami;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_bigintparamj")
	private Integer bigintparamj;
	
	@Column
    public Integer getBigintparamj() {
        return bigintparamj;
    }
	
    public void setBigintparamj(Integer bigintparamj) {
        this.bigintparamj = bigintparamj;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparamc")
	private String charparamc;
	
	@Column
    public String getCharparamc() {
        return charparamc;
    }
	
    public void setCharparamc(String charparamc) {
        this.charparamc = charparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparamd")
	private String charparamd;
	
	@Column
    public String getCharparamd() {
        return charparamd;
    }
	
    public void setCharparamd(String charparamd) {
        this.charparamd = charparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparame")
	private String charparame;
	
	@Column
    public String getCharparame() {
        return charparame;
    }
	
    public void setCharparame(String charparame) {
        this.charparame = charparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparamf")
	private String charparamf;
	
	@Column
    public String getCharparamf() {
        return charparamf;
    }
	
    public void setCharparamf(String charparamf) {
        this.charparamf = charparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparamg")
	private String charparamg;
	
	@Column
    public String getCharparamg() {
        return charparamg;
    }
	
    public void setCharparamg(String charparamg) {
        this.charparamg = charparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparamh")
	private String charparamh;
	
	@Column
    public String getCharparamh() {
        return charparamh;
    }
	
    public void setCharparamh(String charparamh) {
        this.charparamh = charparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparami")
	private String charparami;
	
	@Column
    public String getCharparami() {
        return charparami;
    }
	
    public void setCharparami(String charparami) {
        this.charparami = charparami;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_charparamj")
	private String charparamj;
	
	@Column
    public String getCharparamj() {
        return charparamj;
    }
	
    public void setCharparamj(String charparamj) {
        this.charparamj = charparamj;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparamc")
	private java.util.Date dateparamc;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamc() {
        return dateparamc;
    }
	
    public void setDateparamc(java.util.Date dateparamc) {
        this.dateparamc = dateparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparamd")
	private java.util.Date dateparamd;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamd() {
        return dateparamd;
    }
	
    public void setDateparamd(java.util.Date dateparamd) {
        this.dateparamd = dateparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparame")
	private java.util.Date dateparame;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparame() {
        return dateparame;
    }
	
    public void setDateparame(java.util.Date dateparame) {
        this.dateparame = dateparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparamf")
	private java.util.Date dateparamf;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamf() {
        return dateparamf;
    }
	
    public void setDateparamf(java.util.Date dateparamf) {
        this.dateparamf = dateparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparamg")
	private java.util.Date dateparamg;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamg() {
        return dateparamg;
    }
	
    public void setDateparamg(java.util.Date dateparamg) {
        this.dateparamg = dateparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_dateparamh")
	private java.util.Date dateparamh;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamh() {
        return dateparamh;
    }
	
    public void setDateparamh(java.util.Date dateparamh) {
        this.dateparamh = dateparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_numberparamc")
	private java.math.BigDecimal numberparamc;
	
	@Column
    public java.math.BigDecimal getNumberparamc() {
        return numberparamc;
    }
	
    public void setNumberparamc(java.math.BigDecimal numberparamc) {
        this.numberparamc = numberparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_numberparamd")
	private java.math.BigDecimal numberparamd;
	
	@Column
    public java.math.BigDecimal getNumberparamd() {
        return numberparamd;
    }
	
    public void setNumberparamd(java.math.BigDecimal numberparamd) {
        this.numberparamd = numberparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_numberparame")
	private java.math.BigDecimal numberparame;
	
	@Column
    public java.math.BigDecimal getNumberparame() {
        return numberparame;
    }
	
    public void setNumberparame(java.math.BigDecimal numberparame) {
        this.numberparame = numberparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_numberparamf")
	private java.math.BigDecimal numberparamf;
	
	@Column
    public java.math.BigDecimal getNumberparamf() {
        return numberparamf;
    }
	
    public void setNumberparamf(java.math.BigDecimal numberparamf) {
        this.numberparamf = numberparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_container_Container_objparama", complex = true)
	private Long objparama;
	
	@Column
	public Long getObjparama() {
		return objparama;
	}
	
	public void setObjparama(Long objparama) {
		this.objparama = objparama;
	}

	private String objparamaMainDisplay;
	
	@Transient
	public String getObjparamaMainDisplay() {
		return objparamaMainDisplay;
	}
	
	public void setObjparamaMainDisplay(String objparamaMainDisplay) {
		this.objparamaMainDisplay = objparamaMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_Container_objparamb", complex = true)
	private Long objparamb;
	
	@Column
	public Long getObjparamb() {
		return objparamb;
	}
	
	public void setObjparamb(Long objparamb) {
		this.objparamb = objparamb;
	}

	private String objparambMainDisplay;
	
	@Transient
	public String getObjparambMainDisplay() {
		return objparambMainDisplay;
	}
	
	public void setObjparambMainDisplay(String objparambMainDisplay) {
		this.objparambMainDisplay = objparambMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_Container_objparamc", complex = true)
	private Long objparamc;
	
	@Column
	public Long getObjparamc() {
		return objparamc;
	}
	
	public void setObjparamc(Long objparamc) {
		this.objparamc = objparamc;
	}

	private String objparamcMainDisplay;
	
	@Transient
	public String getObjparamcMainDisplay() {
		return objparamcMainDisplay;
	}
	
	public void setObjparamcMainDisplay(String objparamcMainDisplay) {
		this.objparamcMainDisplay = objparamcMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_Container_objparamd", complex = true)
	private Long objparamd;
	
	@Column
	public Long getObjparamd() {
		return objparamd;
	}
	
	public void setObjparamd(Long objparamd) {
		this.objparamd = objparamd;
	}

	private String objparamdMainDisplay;
	
	@Transient
	public String getObjparamdMainDisplay() {
		return objparamdMainDisplay;
	}
	
	public void setObjparamdMainDisplay(String objparamdMainDisplay) {
		this.objparamdMainDisplay = objparamdMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_Container_scparama", complex = true)
	private String scparama;
	
	@Column
	public String getScparama() {
		return scparama;
	}
	
	public void setScparama(String scparama) {
		this.scparama = scparama;
	}

	private String scparamaMainDisplay;
	
	@Transient
	public String getScparamaMainDisplay() {
		return scparamaMainDisplay;
	}
	
	public void setScparamaMainDisplay(String scparamaMainDisplay) {
		this.scparamaMainDisplay = scparamaMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_Container_scparamb", complex = true)
	private String scparamb;
	
	@Column
	public String getScparamb() {
		return scparamb;
	}
	
	public void setScparamb(String scparamb) {
		this.scparamb = scparamb;
	}

	private String scparambMainDisplay;
	
	@Transient
	public String getScparambMainDisplay() {
		return scparambMainDisplay;
	}
	
	public void setScparambMainDisplay(String scparambMainDisplay) {
		this.scparambMainDisplay = scparambMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_Container_scparamc", complex = true)
	private String scparamc;
	
	@Column
	public String getScparamc() {
		return scparamc;
	}
	
	public void setScparamc(String scparamc) {
		this.scparamc = scparamc;
	}

	private String scparamcMainDisplay;
	
	@Transient
	public String getScparamcMainDisplay() {
		return scparamcMainDisplay;
	}
	
	public void setScparamcMainDisplay(String scparamcMainDisplay) {
		this.scparamcMainDisplay = scparamcMainDisplay;
	}
	@BAPCustomComponent(code = "MESBasic_1_container_Container_scparamd", complex = true)
	private String scparamd;
	
	@Column
	public String getScparamd() {
		return scparamd;
	}
	
	public void setScparamd(String scparamd) {
		this.scparamd = scparamd;
	}

	private String scparamdMainDisplay;
	
	@Transient
	public String getScparamdMainDisplay() {
		return scparamdMainDisplay;
	}
	
	public void setScparamdMainDisplay(String scparamdMainDisplay) {
		this.scparamdMainDisplay = scparamdMainDisplay;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码
	
    /**
     * 根据液位的高度计算容器内物料的体积
     *
     * @param level 实时液位值
     * @return 将未知数代入公式计算出的体积
     */
    public double calculateVolumeByLevel(double level) {
        if (this.getVolumneCalc() != null && this.getVolumneCalc().trim().length() > 0) {
            String formula = this.getVolumneCalc().trim();

            /* 定义L、R、H变量 */
            // 实际液位
            String params = "var L=" + level;
            // 半径
            java.math.BigDecimal radius = getRadius();
            if (radius != null && radius.compareTo(java.math.BigDecimal.ZERO) != 0) {
                params += ",R=" + radius;
            }
            // 罐高
            java.math.BigDecimal height = getTankHeight();
            if (height != null && height.compareTo(java.math.BigDecimal.ZERO) != 0) {
                params += ",H=" + height;
            }

            /* 定义变量π、函数asin()、函数pow() */
            params += ";var π = Math.PI; var asin = function(arg){return Math.asin(arg);}; var pow = function(arg1, arg2){return Math.pow(arg1, arg2);};";

            double result = 0d;
            try {
                // 调用JS的eval()来执行计算
                result = com.supcon.mlp.lib.math.Calculator.scalculateJS(params + formula);
            } catch (javax.script.ScriptException e) {
                return 0d;
            }
            return result;
        }
        return 0d;
    }


    /**
     * 根据密度修正公式计算实际密度值
     *
     * @param type     0液体 1气体
     * @param density  查表密度
     * @param pressure 压强
     * @return double
     */
    public double calculateRevisedDensity(int type, String density, String pressure) {
        com.supcon.mlp.lib.math.Calculator calculator = new com.supcon.mlp.lib.math.Calculator();
        String factor = "";
        if (type == 0) {
            // 液相密度修约公式
            if (this.getLiquidDensityFactor() != null && this.getLiquidDensityFactor().trim().length() > 0) {
                factor = this.getLiquidDensityFactor();
            }
        } else if (type == 1) {
            // 气相密度修约公式
            if (this.getGasDensityFactor() != null && this.getGasDensityFactor().trim().length() > 0) {
                factor = this.getGasDensityFactor();
            }
        }

        if (factor.length() > 0){
            return calculator.calculate(factor, new String[]{"D", "P"}, new String[]{density, pressure});
        } else {
            return 0d;
        }
    }
/* CUSTOM CODE END */
}
