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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 工厂.
 * 与PIMS使用相同的数据结构。
 */
@javax.persistence.Entity(name=MESBasicFactoryModel.JPA_NAME)
@Table(name = MESBasicFactoryModel.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_factoryModel")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_factoryModel_FactoryModel")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicFactoryModelConvertor.class})
public class MESBasicFactoryModel extends com.supcon.orchid.orm.entities.AbstractEcTreeFullEntity<MESBasicFactoryModel> {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_factoryModel";
	public static final String MODEL_CODE = "MESBasic_1_factoryModel_FactoryModel";
	public static final String DOC_TYPE = "MESBasic_factoryModel_factoryModel";
	public static final String TABLE_NAME = "factory_tbcompanystructure";
	public static final String JPA_NAME = "MESBasicFactoryModel";
	private SystemCode area
; // 位置


		private String areaName ; // 区域名称
	private MESBasicItemSetup assignBatchNo;


		private Long belongLine ; // 所属生产线

		@BAPIsMneCode
		private String code ; // 节点编码
	private Department department;


		private Boolean emsFlag = false; // 参与能耗计划
	private MESBasicItemSetup endItem;


		private String fromSystemCode ; // 外部系统编号
	private SystemCode interfaceUrl
; // 中间接口服务地址


		private Boolean isEbr = false; // 是否同步EBR


		private Boolean isOnlyStore = false; // 多货位
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String name ; // 节点名称


		private String description ; // 节点描述
	private MESBasicNodeType nodeType;
	private SystemCode runState
; // 配料容器(组)状态


		private Long workArea ; // 生产区域
	
	private List<MESBasicObjBatContainer> objBatContainerList;
	
	public void setObjBatContainerList(List<MESBasicObjBatContainer> objBatContainerList){
		this.objBatContainerList = objBatContainerList;
	}
	@Transient
	public List<MESBasicObjBatContainer> getObjBatContainerList(){
		return objBatContainerList;
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
	 * 获取位置.
	 * 
	 * @return 位置
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="AREA", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getArea() {
		return area;
	}
	/**
	 * 设置位置.
	 * @param area 位置
	 */
	public void setArea(SystemCode area) {
		this.area = (SystemCode) area;
	}
	/**
	 * 获取区域名称.
	 * 
	 * @return 区域名称
	 */
	@Column(nullable=true

		,length = 256
		,name="AREA_NAME"
	)
    public String getAreaName() {
        return areaName;
    }
	/**
	 * 设置区域名称.
	 * @param areaName 区域名称
	 */
    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }
	@OneToOne
	@JoinColumn(name = "ASSIGN_BATCH_NO", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getAssignBatchNo() {
        return assignBatchNo;
    }
    public void setAssignBatchNo(MESBasicItemSetup assignBatchNo) {
        this.assignBatchNo = assignBatchNo;
    }
	/**
	 * 获取所属生产线.
	 * 
	 * @return 所属生产线
	 */
	@Column(nullable=true

		,name="BELONG_LINE"
	)
    public Long getBelongLine() {
        return belongLine;
    }
	/**
	 * 设置所属生产线.
	 * @param belongLine 所属生产线
	 */
    public void setBelongLine(Long belongLine) {
        this.belongLine = belongLine;
    }
	/**
	 * 获取节点编码.
	 * 
	 * @return 节点编码
	 */
	@Column(

		length = 200
		,name="CODE"
	)
	@Index(name="index_FactoryModel_code")	
    public String getCode() {
        return code;
    }
	/**
	 * 设置节点编码.
	 * @param code 节点编码
	 */
    public void setCode(String code) {
        this.code = code;
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
	/**
	 * 获取参与能耗计划.
	 * 
	 * @return 参与能耗计划
	 */
	@Column(nullable=true

		,name="EMS_FLAG"
	)
    public Boolean getEmsFlag() {
        return null == emsFlag ? false : emsFlag;
    }
	/**
	 * 设置参与能耗计划.
	 * @param emsFlag 参与能耗计划
	 */
    public void setEmsFlag(Boolean emsFlag) {
        this.emsFlag = emsFlag;
    }
	@OneToOne
	@JoinColumn(name = "END_ITEM", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getEndItem() {
        return endItem;
    }
    public void setEndItem(MESBasicItemSetup endItem) {
        this.endItem = endItem;
    }
	/**
	 * 获取外部系统编号.
	 * 配料容器组&配料容器，与之对应的其他系统的对应记录的编号
	 * @return 外部系统编号
	 */
	@Column(nullable=true

		,length = 256
		,name="FROM_SYSTEM_CODE"
	)
    public String getFromSystemCode() {
        return fromSystemCode;
    }
	/**
	 * 设置外部系统编号.
	 * @param fromSystemCode 外部系统编号
	 */
    public void setFromSystemCode(String fromSystemCode) {
        this.fromSystemCode = fromSystemCode;
    }
	/**
	 * 获取中间接口服务地址.
	 * 
	 * @return 中间接口服务地址
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="INTERFACE_URL", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getInterfaceUrl() {
		return interfaceUrl;
	}
	/**
	 * 设置中间接口服务地址.
	 * @param interfaceUrl 中间接口服务地址
	 */
	public void setInterfaceUrl(SystemCode interfaceUrl) {
		this.interfaceUrl = (SystemCode) interfaceUrl;
	}
	/**
	 * 获取是否同步EBR.
	 * 目前生产模块中有些生产线是需要和ebr进行数据交互，有些是不需要和ebr进行交互，工厂模型生产线中增加一个字段用来关联是否需要同步到ebr
	 * @return 是否同步EBR
	 */
	@Column(nullable=true

		,name="IS_EBR"
	)
    public Boolean getIsEbr() {
        return null == isEbr ? false : isEbr;
    }
	/**
	 * 设置是否同步EBR.
	 * @param isEbr 是否同步EBR
	 */
    public void setIsEbr(Boolean isEbr) {
        this.isEbr = isEbr;
    }
	/**
	 * 获取多货位.
	 * 按物料定义货位（多货位）
	 * @return 多货位
	 */
	@Column(nullable=true

		,name="IS_ONLY_STORE"
	)
    public Boolean getIsOnlyStore() {
        return null == isOnlyStore ? false : isOnlyStore;
    }
	/**
	 * 设置多货位.
	 * @param isOnlyStore 多货位
	 */
    public void setIsOnlyStore(Boolean isOnlyStore) {
        this.isOnlyStore = isOnlyStore;
    }
	/**
	 * 获取节点名称.
	 * 
	 * @return 节点名称
	 */
	@Column(nullable=true

		,length = 100
		,name="NODENAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置节点名称.
	 * @param name 节点名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取节点描述.
	 * 
	 * @return 节点描述
	 */
	@Column(nullable=true

		,length = 2000
		,name="NODEDESC"
	)
    public String getDescription() {
        return description;
    }
	/**
	 * 设置节点描述.
	 * @param description 节点描述
	 */
    public void setDescription(String description) {
        this.description = description;
    }
	@OneToOne
	@JoinColumn(name = "NODE_TYPE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.JOIN)
						
    public MESBasicNodeType getNodeType() {
        return nodeType;
    }
    public void setNodeType(MESBasicNodeType nodeType) {
        this.nodeType = nodeType;
    }
	/**
	 * 获取配料容器(组)状态.
	 * 
	 * @return 配料容器(组)状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="RUN_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getRunState() {
		return runState;
	}
	/**
	 * 设置配料容器(组)状态.
	 * @param runState 配料容器(组)状态
	 */
	public void setRunState(SystemCode runState) {
		this.runState = (SystemCode) runState;
	}
	/**
	 * 获取生产区域.
	 * 
	 * @return 生产区域
	 */
	@Column(nullable=true

		,name="WORK_AREA"
	)
    public Long getWorkArea() {
        return workArea;
    }
	/**
	 * 设置生产区域.
	 * @param workArea 生产区域
	 */
    public void setWorkArea(Long workArea) {
        this.workArea = workArea;
    }
	
	
	protected String _getEntityName() {
		return MESBasicFactoryModel.class.getName();
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
	private String objFactoryObjBatContainerDeleteIds;
	private String objFactoryObjBatContainerAddIds;
	private String objFactoryObjBatContainermultiselectIDs;
	private String objFactoryObjBatContainermultiselectNames;

	@javax.persistence.Transient
	public String getObjFactoryObjBatContainerDeleteIds(){
		return this.objFactoryObjBatContainerDeleteIds;
	}

	public void setObjFactoryObjBatContainerDeleteIds(String deleteIds){
		this.objFactoryObjBatContainerDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getObjFactoryObjBatContainermultiselectIDs(){
		return this.objFactoryObjBatContainermultiselectIDs;
	}

	public void setObjFactoryObjBatContainermultiselectIDs(String multiselectIDs){
		this.objFactoryObjBatContainermultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getObjFactoryObjBatContainermultiselectNames(){
		return this.objFactoryObjBatContainermultiselectNames;
	}

	public void setObjFactoryObjBatContainermultiselectNames(String multiselectNames){
		this.objFactoryObjBatContainermultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getObjFactoryObjBatContainerAddIds(){
		return this.objFactoryObjBatContainerAddIds;
	}

	public void setObjFactoryObjBatContainerAddIds(String addIds){
		this.objFactoryObjBatContainerAddIds = addIds;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
