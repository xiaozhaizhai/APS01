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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 路径.
 */
@javax.persistence.Entity(name=MESBasicRoutine.JPA_NAME)
@Table(name = MESBasicRoutine.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_routine")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_routine_Routine")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicRoutineConvertor.class})
public class MESBasicRoutine extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_routine";
	public static final String MODEL_CODE = "MESBasic_1_routine_Routine";
	public static final String DOC_TYPE = "MESBasic_routine_routine";
	public static final String TABLE_NAME = "mesbasic_routines";
	public static final String JPA_NAME = "MESBasicRoutine";
	private SystemCode businessType
; // 业务类型


		private String code ; // 路径编码


		private java.math.BigDecimal density ; // 密度


		private String desCode ; // 目的容器编码
	private MESBasicContainer desContainer;
	private MESBasicEquipment destEqp;
	private MESBasicObjEquipment destEquObj;


		private String destination ; // 目的
	private SystemCode desType
; // 目的类型
	@BAPIsMainDisplay

		private String name ; // 路径名称
	private MESBasicProduct product;
	private SystemCode rootineUse
; // 路径状态
	private SystemCode rootType
; // 路径类型
	private SystemCode routineStatus
; // 工作状态
	private SystemCode routineStrategy
		= new SystemCode("ROUTINE_STRATEGY/0")
		; // 工作模式
	private SystemCode sourceType
; // 源类型


		private String srcCode ; // 源容器编码
	private MESBasicContainer srcContainer;


		private String srouce ; // 源头
	private MESBasicEquipment srouceEqp;
	private MESBasicObjEquipment srouceEqpObj;
	private MESBasicItemSetup switcher;
	
	private List<MESBasicConfig> configList;
	
	public void setConfigList(List<MESBasicConfig> configList){
		this.configList = configList;
	}
	@Transient
	public List<MESBasicConfig> getConfigList(){
		return configList;
	}
	private List<MESBasicSwitcherModel> switcherModelList;
	
	public void setSwitcherModelList(List<MESBasicSwitcherModel> switcherModelList){
		this.switcherModelList = switcherModelList;
	}
	@Transient
	public List<MESBasicSwitcherModel> getSwitcherModelList(){
		return switcherModelList;
	}
	private List<MESBasicInvolveItemsetups> involveItemsetupsList;
	
	public void setInvolveItemsetupsList(List<MESBasicInvolveItemsetups> involveItemsetupsList){
		this.involveItemsetupsList = involveItemsetupsList;
	}
	@Transient
	public List<MESBasicInvolveItemsetups> getInvolveItemsetupsList(){
		return involveItemsetupsList;
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
	 * 获取业务类型.
	 * 
	 * @return 业务类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BUSINESS_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBusinessType() {
		return businessType;
	}
	/**
	 * 设置业务类型.
	 * @param businessType 业务类型
	 */
	public void setBusinessType(SystemCode businessType) {
		this.businessType = (SystemCode) businessType;
	}
	/**
	 * 获取路径编码.
	 * 
	 * @return 路径编码
	 */
	@Column(

		length = 200
		,name="CODE"
	)
	@Index(name="index_Routine_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置路径编码.
	 * @param code 路径编码
	 */
    public void setCode(String code) {
        this.code = code;
    }
	/**
	 * 获取密度.
	 * 
	 * @return 密度
	 */
	@Column(nullable=true
			,precision=19,scale=2
		,name="DENSITY"
	)
    public java.math.BigDecimal getDensity() {
        return density;
    }
	/**
	 * 设置密度.
	 * @param density 密度
	 */
    public void setDensity(java.math.BigDecimal density) {
        this.density = density;
    }
	/**
	 * 获取目的容器编码.
	 * 
	 * @return 目的容器编码
	 */
	@Column(nullable=true

		,length = 256
		,name="DES_CODE"
	)
    public String getDesCode() {
        return desCode;
    }
	/**
	 * 设置目的容器编码.
	 * @param desCode 目的容器编码
	 */
    public void setDesCode(String desCode) {
        this.desCode = desCode;
    }
	@OneToOne
	@JoinColumn(name = "DES_CONTAINER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicContainer getDesContainer() {
        return desContainer;
    }
    public void setDesContainer(MESBasicContainer desContainer) {
        this.desContainer = desContainer;
    }
	@OneToOne
	@JoinColumn(name = "DEST_EQP", referencedColumnName="EAM_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicEquipment getDestEqp() {
        return destEqp;
    }
    public void setDestEqp(MESBasicEquipment destEqp) {
        this.destEqp = destEqp;
    }
	@OneToOne
	@JoinColumn(name = "DEST_EQU_OBJ", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicObjEquipment getDestEquObj() {
        return destEquObj;
    }
    public void setDestEquObj(MESBasicObjEquipment destEquObj) {
        this.destEquObj = destEquObj;
    }
	/**
	 * 获取目的.
	 * 路径目的地的编码
	 * @return 目的
	 */
	@Column(nullable=true

		,length = 200
		,name="DESTINATION"
	)
    public String getDestination() {
        return destination;
    }
	/**
	 * 设置目的.
	 * @param destination 目的
	 */
    public void setDestination(String destination) {
        this.destination = destination;
    }
	/**
	 * 获取目的类型.
	 * 
	 * @return 目的类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="DES_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getDesType() {
		return desType;
	}
	/**
	 * 设置目的类型.
	 * @param desType 目的类型
	 */
	public void setDesType(SystemCode desType) {
		this.desType = (SystemCode) desType;
	}
	/**
	 * 获取路径名称.
	 * 
	 * @return 路径名称
	 */
	@Column(

		length = 200
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置路径名称.
	 * @param name 路径名称
	 */
    public void setName(String name) {
        this.name = name;
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
	/**
	 * 获取路径状态.
	 * 
	 * @return 路径状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ROOTINE_USE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getRootineUse() {
		return rootineUse;
	}
	/**
	 * 设置路径状态.
	 * @param rootineUse 路径状态
	 */
	public void setRootineUse(SystemCode rootineUse) {
		this.rootineUse = (SystemCode) rootineUse;
	}
	/**
	 * 获取路径类型.
	 * 
	 * @return 路径类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ROOT_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getRootType() {
		return rootType;
	}
	/**
	 * 设置路径类型.
	 * @param rootType 路径类型
	 */
	public void setRootType(SystemCode rootType) {
		this.rootType = (SystemCode) rootType;
	}
	/**
	 * 获取工作状态.
	 * 
	 * @return 工作状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ROUTINE_STATUS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getRoutineStatus() {
		return routineStatus;
	}
	/**
	 * 设置工作状态.
	 * @param routineStatus 工作状态
	 */
	public void setRoutineStatus(SystemCode routineStatus) {
		this.routineStatus = (SystemCode) routineStatus;
	}
	/**
	 * 获取工作模式.
	 * 
	 * @return 工作模式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ROUTINE_STRATEGY", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getRoutineStrategy() {
		return routineStrategy;
	}
	/**
	 * 设置工作模式.
	 * @param routineStrategy 工作模式
	 */
	public void setRoutineStrategy(SystemCode routineStrategy) {
		this.routineStrategy = (SystemCode) routineStrategy;
	}
	/**
	 * 获取源类型.
	 * 
	 * @return 源类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="SOURCE_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getSourceType() {
		return sourceType;
	}
	/**
	 * 设置源类型.
	 * @param sourceType 源类型
	 */
	public void setSourceType(SystemCode sourceType) {
		this.sourceType = (SystemCode) sourceType;
	}
	/**
	 * 获取源容器编码.
	 * 
	 * @return 源容器编码
	 */
	@Column(nullable=true

		,length = 256
		,name="SRC_CODE"
	)
    public String getSrcCode() {
        return srcCode;
    }
	/**
	 * 设置源容器编码.
	 * @param srcCode 源容器编码
	 */
    public void setSrcCode(String srcCode) {
        this.srcCode = srcCode;
    }
	@OneToOne
	@JoinColumn(name = "SRC_CONTAINER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicContainer getSrcContainer() {
        return srcContainer;
    }
    public void setSrcContainer(MESBasicContainer srcContainer) {
        this.srcContainer = srcContainer;
    }
	/**
	 * 获取源头.
	 * 路径源头的编码
	 * @return 源头
	 */
	@Column(nullable=true

		,length = 500
		,name="SROUCE"
	)
    public String getSrouce() {
        return srouce;
    }
	/**
	 * 设置源头.
	 * @param srouce 源头
	 */
    public void setSrouce(String srouce) {
        this.srouce = srouce;
    }
	@OneToOne
	@JoinColumn(name = "SROUCE_EQP", referencedColumnName="EAM_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicEquipment getSrouceEqp() {
        return srouceEqp;
    }
    public void setSrouceEqp(MESBasicEquipment srouceEqp) {
        this.srouceEqp = srouceEqp;
    }
	@OneToOne
	@JoinColumn(name = "SROUCE_EQP_OBJ", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicObjEquipment getSrouceEqpObj() {
        return srouceEqpObj;
    }
    public void setSrouceEqpObj(MESBasicObjEquipment srouceEqpObj) {
        this.srouceEqpObj = srouceEqpObj;
    }
	@OneToOne
	@JoinColumn(name = "SWITCHER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getSwitcher() {
        return switcher;
    }
    public void setSwitcher(MESBasicItemSetup switcher) {
        this.switcher = switcher;
    }
	
	
	protected String _getEntityName() {
		return MESBasicRoutine.class.getName();
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
	private String routinePumpDeleteIds;
	private String routinePumpAddIds;
	private String routinePumpmultiselectIDs;
	private String routinePumpmultiselectNames;

	@javax.persistence.Transient
	public String getRoutinePumpDeleteIds(){
		return this.routinePumpDeleteIds;
	}

	public void setRoutinePumpDeleteIds(String deleteIds){
		this.routinePumpDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getRoutinePumpmultiselectIDs(){
		return this.routinePumpmultiselectIDs;
	}

	public void setRoutinePumpmultiselectIDs(String multiselectIDs){
		this.routinePumpmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getRoutinePumpmultiselectNames(){
		return this.routinePumpmultiselectNames;
	}

	public void setRoutinePumpmultiselectNames(String multiselectNames){
		this.routinePumpmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getRoutinePumpAddIds(){
		return this.routinePumpAddIds;
	}

	public void setRoutinePumpAddIds(String addIds){
		this.routinePumpAddIds = addIds;
	}
	private String routineSwitcherDeleteIds;
	private String routineSwitcherAddIds;
	private String routineSwitchermultiselectIDs;
	private String routineSwitchermultiselectNames;

	@javax.persistence.Transient
	public String getRoutineSwitcherDeleteIds(){
		return this.routineSwitcherDeleteIds;
	}

	public void setRoutineSwitcherDeleteIds(String deleteIds){
		this.routineSwitcherDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getRoutineSwitchermultiselectIDs(){
		return this.routineSwitchermultiselectIDs;
	}

	public void setRoutineSwitchermultiselectIDs(String multiselectIDs){
		this.routineSwitchermultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getRoutineSwitchermultiselectNames(){
		return this.routineSwitchermultiselectNames;
	}

	public void setRoutineSwitchermultiselectNames(String multiselectNames){
		this.routineSwitchermultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getRoutineSwitcherAddIds(){
		return this.routineSwitcherAddIds;
	}

	public void setRoutineSwitcherAddIds(String addIds){
		this.routineSwitcherAddIds = addIds;
	}
	private String routineMeterDeleteIds;
	private String routineMeterAddIds;
	private String routineMetermultiselectIDs;
	private String routineMetermultiselectNames;

	@javax.persistence.Transient
	public String getRoutineMeterDeleteIds(){
		return this.routineMeterDeleteIds;
	}

	public void setRoutineMeterDeleteIds(String deleteIds){
		this.routineMeterDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getRoutineMetermultiselectIDs(){
		return this.routineMetermultiselectIDs;
	}

	public void setRoutineMetermultiselectIDs(String multiselectIDs){
		this.routineMetermultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getRoutineMetermultiselectNames(){
		return this.routineMetermultiselectNames;
	}

	public void setRoutineMetermultiselectNames(String multiselectNames){
		this.routineMetermultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getRoutineMeterAddIds(){
		return this.routineMeterAddIds;
	}

	public void setRoutineMeterAddIds(String addIds){
		this.routineMeterAddIds = addIds;
	}
	private String routineItemSetupDeleteIds;
	private String routineItemSetupAddIds;
	private String routineItemSetupmultiselectIDs;
	private String routineItemSetupmultiselectNames;

	@javax.persistence.Transient
	public String getRoutineItemSetupDeleteIds(){
		return this.routineItemSetupDeleteIds;
	}

	public void setRoutineItemSetupDeleteIds(String deleteIds){
		this.routineItemSetupDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getRoutineItemSetupmultiselectIDs(){
		return this.routineItemSetupmultiselectIDs;
	}

	public void setRoutineItemSetupmultiselectIDs(String multiselectIDs){
		this.routineItemSetupmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getRoutineItemSetupmultiselectNames(){
		return this.routineItemSetupmultiselectNames;
	}

	public void setRoutineItemSetupmultiselectNames(String multiselectNames){
		this.routineItemSetupmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getRoutineItemSetupAddIds(){
		return this.routineItemSetupAddIds;
	}

	public void setRoutineItemSetupAddIds(String addIds){
		this.routineItemSetupAddIds = addIds;
	}
	private String configSwitcherDeleteIds;
	private String configSwitcherAddIds;
	private String configSwitchermultiselectIDs;
	private String configSwitchermultiselectNames;

	@javax.persistence.Transient
	public String getConfigSwitcherDeleteIds(){
		return this.configSwitcherDeleteIds;
	}

	public void setConfigSwitcherDeleteIds(String deleteIds){
		this.configSwitcherDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getConfigSwitchermultiselectIDs(){
		return this.configSwitchermultiselectIDs;
	}

	public void setConfigSwitchermultiselectIDs(String multiselectIDs){
		this.configSwitchermultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getConfigSwitchermultiselectNames(){
		return this.configSwitchermultiselectNames;
	}

	public void setConfigSwitchermultiselectNames(String multiselectNames){
		this.configSwitchermultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getConfigSwitcherAddIds(){
		return this.configSwitcherAddIds;
	}

	public void setConfigSwitcherAddIds(String addIds){
		this.configSwitcherAddIds = addIds;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
