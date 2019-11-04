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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 设备.
 */
@javax.persistence.Entity(name=MESBasicEquipment.JPA_NAME)
@Table(name = MESBasicEquipment.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_equipManage")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_equipManage_Equipment")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "EAM_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_equipManage_Equipment,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicEquipmentConvertor.class})
public class MESBasicEquipment extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_equipManage";
	public static final String MODEL_CODE = "MESBasic_1_equipManage_Equipment";
	public static final String DOC_TYPE = "MESBasic_equipManage_equipment";
	public static final String TABLE_NAME = "eam_baseinfo";
	public static final String JPA_NAME = "MESBasicEquipment";


		private String areaNum ; // 设备位号


		private Boolean autoCreateContainer = false; // 自动生成容器

		@BAPIsMneCode
		private String code ; // 编码


		private String demo ; // 备注


		private String eamAbc ; // ABC分类


		private String eamAssetCode ; // 资产编码

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date eamBuyTime ; // 购入时间


		private String eamDesignFirm ; // 设计单位
	private Staff eamDutyStaffId;


		private String eamFigureNo ; // 图号


		private String eamHaveRunstate ; // 关注运行


		private String eamInstallFirm ; // 安装公司


		private String eamInstallPlace ; // 安装位置


		private Boolean eamIsSpecial = false; // 特种设备


		private String eamModel ; // 型号


		private java.math.BigDecimal eamNetsum ; // 净值


		private String eamParentCode ; // 归属编码


		private java.math.BigDecimal eamPeriodTime ; // 保养周期


		private Integer eamPeriodType ; // 周期类型


		private Integer eamPeriodUnit ; // 周期单位


		private String eamProduceCode ; // 出厂编号

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date eamProduceDate ; // 出厂日期


		private String eamProduceFirm ; // 制造单位
	private MESBasicProduct eamProductId;


		private String eamProperty ; // 设备属性


		private Integer eamRunStateId ; // 运行状态ID


		private String eamSpefic ; // 规格


		private String eamState ; // 设备状态


		private java.math.BigDecimal eamSum ; // 原值
	private MESBasicEamType eamType;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date eamUseDate ; // 启用日期
	private Department eamUseDeptId;


		private java.math.BigDecimal eamUseYear ; // 使用年限


		private String eamVendorName ; // 供应商

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date fileDate ; // 建档日期


		private String fileState ; // 建档标记
	private MESBasicArea installPlace;


		private Boolean isMea = false; // 是否测量设备


		private Boolean isRelateContainer = false; // 关联容器


		private Boolean isSpecialNew = false; // 是否特种设备
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String name ; // 设备名称


		private String otherspecia ; // 其他特殊设备
	private MESBasicContainer relateContainer;


		private String specialtyNew ; // 专业


		private String specialType ; // 特种设备类型
	private MESBasicFactoryModel workcenter;
	
	
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
	 * 获取设备位号.
	 * 
	 * @return 设备位号
	 */
	@Column(nullable=true

		,length = 256
		,name="AREA_NUM"
	)
    public String getAreaNum() {
        return areaNum;
    }
	/**
	 * 设置设备位号.
	 * @param areaNum 设备位号
	 */
    public void setAreaNum(String areaNum) {
        this.areaNum = areaNum;
    }
	/**
	 * 获取自动生成容器.
	 * 如果勾选了关联容器，并勾选了自动生成容器，则在保存设备的时候，自动创建一个编码和名称与设备相同的容器。
	 * @return 自动生成容器
	 */
	@Column(nullable=true

		,name="AUTO_CREATE_CONTAINER"
	)
    public Boolean getAutoCreateContainer() {
        return null == autoCreateContainer ? false : autoCreateContainer;
    }
	/**
	 * 设置自动生成容器.
	 * @param autoCreateContainer 自动生成容器
	 */
    public void setAutoCreateContainer(Boolean autoCreateContainer) {
        this.autoCreateContainer = autoCreateContainer;
    }
	/**
	 * 获取编码.
	 * 
	 * @return 编码
	 */
	@Column(unique=true

		,length = 400
		,name="EAM_CODE"
	)
	@Index(name="index_Equipment_code")	
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
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="EAM_MEMO"
	)
    public String getDemo() {
        return demo;
    }
	/**
	 * 设置备注.
	 * @param demo 备注
	 */
    public void setDemo(String demo) {
        this.demo = demo;
    }
	/**
	 * 获取ABC分类.
	 * ABC分类，关联系统编码EAM002
	 * @return ABC分类
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_ABC"
	)
    public String getEamAbc() {
        return eamAbc;
    }
	/**
	 * 设置ABC分类.
	 * @param eamAbc ABC分类
	 */
    public void setEamAbc(String eamAbc) {
        this.eamAbc = eamAbc;
    }
	/**
	 * 获取资产编码.
	 * 资产编码
	 * @return 资产编码
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_ASSETCODE"
	)
    public String getEamAssetCode() {
        return eamAssetCode;
    }
	/**
	 * 设置资产编码.
	 * @param eamAssetCode 资产编码
	 */
    public void setEamAssetCode(String eamAssetCode) {
        this.eamAssetCode = eamAssetCode;
    }
	/**
	 * 获取购入时间.
	 * 
	 * @return 购入时间
	 */
	@Column(nullable=true

		,name="EAM_BUY_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getEamBuyTime() {
        return eamBuyTime;
    }
	/**
	 * 设置购入时间.
	 * @param eamBuyTime 购入时间
	 */
    public void setEamBuyTime(java.util.Date eamBuyTime) {
        this.eamBuyTime = eamBuyTime;
    }
	/**
	 * 获取设计单位.
	 * 设计单位
	 * @return 设计单位
	 */
	@Column(nullable=true

		,length = 2000
		,name="EAM_DESIGNFIRM"
	)
    public String getEamDesignFirm() {
        return eamDesignFirm;
    }
	/**
	 * 设置设计单位.
	 * @param eamDesignFirm 设计单位
	 */
    public void setEamDesignFirm(String eamDesignFirm) {
        this.eamDesignFirm = eamDesignFirm;
    }
	@OneToOne
	@JoinColumn(name = "EAM_DUTYSTAFFID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getEamDutyStaffId() {
        return eamDutyStaffId;
    }
    public void setEamDutyStaffId(Staff eamDutyStaffId) {
        this.eamDutyStaffId = eamDutyStaffId;
    }
	/**
	 * 获取图号.
	 * 图号
	 * @return 图号
	 */
	@Column(nullable=true

		,length = 2000
		,name="EAM_FIGURENO"
	)
    public String getEamFigureNo() {
        return eamFigureNo;
    }
	/**
	 * 设置图号.
	 * @param eamFigureNo 图号
	 */
    public void setEamFigureNo(String eamFigureNo) {
        this.eamFigureNo = eamFigureNo;
    }
	/**
	 * 获取关注运行.
	 * 关注运行0:否1:是
	 * @return 关注运行
	 */
	@Column(nullable=true

		,length = 1
		,name="EAM_HAVERUNSTATE"
	)
    public String getEamHaveRunstate() {
        return eamHaveRunstate;
    }
	/**
	 * 设置关注运行.
	 * @param eamHaveRunstate 关注运行
	 */
    public void setEamHaveRunstate(String eamHaveRunstate) {
        this.eamHaveRunstate = eamHaveRunstate;
    }
	/**
	 * 获取安装公司.
	 * 
	 * @return 安装公司
	 */
	@Column(nullable=true

		,length = 2000
		,name="EAM_INSTALLFIRM"
	)
    public String getEamInstallFirm() {
        return eamInstallFirm;
    }
	/**
	 * 设置安装公司.
	 * @param eamInstallFirm 安装公司
	 */
    public void setEamInstallFirm(String eamInstallFirm) {
        this.eamInstallFirm = eamInstallFirm;
    }
	/**
	 * 获取安装位置.
	 * 安装位置，关联系统编码EAM007
	 * @return 安装位置
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_INSTALLPLACE"
	)
    public String getEamInstallPlace() {
        return eamInstallPlace;
    }
	/**
	 * 设置安装位置.
	 * @param eamInstallPlace 安装位置
	 */
    public void setEamInstallPlace(String eamInstallPlace) {
        this.eamInstallPlace = eamInstallPlace;
    }
	/**
	 * 获取特种设备.
	 * 是否特种设备，1是
	 * @return 特种设备
	 */
	@Column(nullable=true

		,name="EAM_ISSPECIAL"
	)
    public Boolean getEamIsSpecial() {
        return null == eamIsSpecial ? false : eamIsSpecial;
    }
	/**
	 * 设置特种设备.
	 * @param eamIsSpecial 特种设备
	 */
    public void setEamIsSpecial(Boolean eamIsSpecial) {
        this.eamIsSpecial = eamIsSpecial;
    }
	/**
	 * 获取型号.
	 * 
	 * @return 型号
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_MODEL"
	)
    public String getEamModel() {
        return eamModel;
    }
	/**
	 * 设置型号.
	 * @param eamModel 型号
	 */
    public void setEamModel(String eamModel) {
        this.eamModel = eamModel;
    }
	/**
	 * 获取净值.
	 * 
	 * @return 净值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="EAM_NETSUM"
	)
    public java.math.BigDecimal getEamNetsum() {
        return eamNetsum;
    }
	/**
	 * 设置净值.
	 * @param eamNetsum 净值
	 */
    public void setEamNetsum(java.math.BigDecimal eamNetsum) {
        this.eamNetsum = eamNetsum;
    }
	/**
	 * 获取归属编码.
	 * 
	 * @return 归属编码
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_PARENTCODE"
	)
    public String getEamParentCode() {
        return eamParentCode;
    }
	/**
	 * 设置归属编码.
	 * @param eamParentCode 归属编码
	 */
    public void setEamParentCode(String eamParentCode) {
        this.eamParentCode = eamParentCode;
    }
	/**
	 * 获取保养周期.
	 * 
	 * @return 保养周期
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="EAM_PERIODTIME"
	)
    public java.math.BigDecimal getEamPeriodTime() {
        return eamPeriodTime;
    }
	/**
	 * 设置保养周期.
	 * @param eamPeriodTime 保养周期
	 */
    public void setEamPeriodTime(java.math.BigDecimal eamPeriodTime) {
        this.eamPeriodTime = eamPeriodTime;
    }
	/**
	 * 获取周期类型.
	 * 
	 * @return 周期类型
	 */
	@Column(nullable=true

		,name="EAM_PERIODTYPE"
	)
    public Integer getEamPeriodType() {
        return eamPeriodType;
    }
	/**
	 * 设置周期类型.
	 * @param eamPeriodType 周期类型
	 */
    public void setEamPeriodType(Integer eamPeriodType) {
        this.eamPeriodType = eamPeriodType;
    }
	/**
	 * 获取周期单位.
	 * 1,7,30（绝对时间）3（小时）4次,5吨,6公里
	 * @return 周期单位
	 */
	@Column(nullable=true

		,name="EAM_PERIODUNIT"
	)
    public Integer getEamPeriodUnit() {
        return eamPeriodUnit;
    }
	/**
	 * 设置周期单位.
	 * @param eamPeriodUnit 周期单位
	 */
    public void setEamPeriodUnit(Integer eamPeriodUnit) {
        this.eamPeriodUnit = eamPeriodUnit;
    }
	/**
	 * 获取出厂编号.
	 * 
	 * @return 出厂编号
	 */
	@Column(nullable=true

		,length = 2000
		,name="EAM_PRODUCECODE"
	)
    public String getEamProduceCode() {
        return eamProduceCode;
    }
	/**
	 * 设置出厂编号.
	 * @param eamProduceCode 出厂编号
	 */
    public void setEamProduceCode(String eamProduceCode) {
        this.eamProduceCode = eamProduceCode;
    }
	/**
	 * 获取出厂日期.
	 * 
	 * @return 出厂日期
	 */
	@Column(nullable=true

		,name="EAM_PRODUCEDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getEamProduceDate() {
        return eamProduceDate;
    }
	/**
	 * 设置出厂日期.
	 * @param eamProduceDate 出厂日期
	 */
    public void setEamProduceDate(java.util.Date eamProduceDate) {
        this.eamProduceDate = eamProduceDate;
    }
	/**
	 * 获取制造单位.
	 * 
	 * @return 制造单位
	 */
	@Column(nullable=true

		,length = 2000
		,name="EAM_PRODUCEFIRM"
	)
    public String getEamProduceFirm() {
        return eamProduceFirm;
    }
	/**
	 * 设置制造单位.
	 * @param eamProduceFirm 制造单位
	 */
    public void setEamProduceFirm(String eamProduceFirm) {
        this.eamProduceFirm = eamProduceFirm;
    }
	@OneToOne
	@JoinColumn(name = "EAM_PRODUCTID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getEamProductId() {
        return eamProductId;
    }
    public void setEamProductId(MESBasicProduct eamProductId) {
        this.eamProductId = eamProductId;
    }
	/**
	 * 获取设备属性.
	 * 设备属性，关联系统编码EAM003
	 * @return 设备属性
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_PROPERTY"
	)
    public String getEamProperty() {
        return eamProperty;
    }
	/**
	 * 设置设备属性.
	 * @param eamProperty 设备属性
	 */
    public void setEamProperty(String eamProperty) {
        this.eamProperty = eamProperty;
    }
	/**
	 * 获取运行状态ID.
	 * 
	 * @return 运行状态ID
	 */
	@Column(nullable=true

		,name="EAM_RUNSTATEID"
	)
    public Integer getEamRunStateId() {
        return eamRunStateId;
    }
	/**
	 * 设置运行状态ID.
	 * @param eamRunStateId 运行状态ID
	 */
    public void setEamRunStateId(Integer eamRunStateId) {
        this.eamRunStateId = eamRunStateId;
    }
	/**
	 * 获取规格.
	 * 原列名来为EAM_SPEFIC，与设备模块的列名不一致EAM_SPECIF
	 * @return 规格
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_SPECIF"
	)
    public String getEamSpefic() {
        return eamSpefic;
    }
	/**
	 * 设置规格.
	 * @param eamSpefic 规格
	 */
    public void setEamSpefic(String eamSpefic) {
        this.eamSpefic = eamSpefic;
    }
	/**
	 * 获取设备状态.
	 * 设备状态，关联系统编码EAM001
	 * @return 设备状态
	 */
	@Column(nullable=true

		,length = 200
		,name="EAM_STATE"
	)
    public String getEamState() {
        return eamState;
    }
	/**
	 * 设置设备状态.
	 * @param eamState 设备状态
	 */
    public void setEamState(String eamState) {
        this.eamState = eamState;
    }
	/**
	 * 获取原值.
	 * 
	 * @return 原值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="EAM_SUM"
	)
    public java.math.BigDecimal getEamSum() {
        return eamSum;
    }
	/**
	 * 设置原值.
	 * @param eamSum 原值
	 */
    public void setEamSum(java.math.BigDecimal eamSum) {
        this.eamSum = eamSum;
    }
	@ManyToOne
	@JoinColumn(name = "EAM_TYPE", referencedColumnName="EAMTYPE_CODE")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public MESBasicEamType getEamType() {
        return eamType;
    }
    public void setEamType(MESBasicEamType eamType) {
        this.eamType = eamType;
    }
	/**
	 * 获取启用日期.
	 * 
	 * @return 启用日期
	 */
	@Column(nullable=true

		,name="EAM_USEDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getEamUseDate() {
        return eamUseDate;
    }
	/**
	 * 设置启用日期.
	 * @param eamUseDate 启用日期
	 */
    public void setEamUseDate(java.util.Date eamUseDate) {
        this.eamUseDate = eamUseDate;
    }
	@OneToOne
	@JoinColumn(name = "EAM_USEDEPTID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getEamUseDeptId() {
        return eamUseDeptId;
    }
    public void setEamUseDeptId(Department eamUseDeptId) {
        this.eamUseDeptId = eamUseDeptId;
    }
	/**
	 * 获取使用年限.
	 * 
	 * @return 使用年限
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="EAM_USEYEAR"
	)
    public java.math.BigDecimal getEamUseYear() {
        return eamUseYear;
    }
	/**
	 * 设置使用年限.
	 * @param eamUseYear 使用年限
	 */
    public void setEamUseYear(java.math.BigDecimal eamUseYear) {
        this.eamUseYear = eamUseYear;
    }
	/**
	 * 获取供应商.
	 * 
	 * @return 供应商
	 */
	@Column(nullable=true

		,length = 2000
		,name="EAM_VENDORNAME"
	)
    public String getEamVendorName() {
        return eamVendorName;
    }
	/**
	 * 设置供应商.
	 * @param eamVendorName 供应商
	 */
    public void setEamVendorName(String eamVendorName) {
        this.eamVendorName = eamVendorName;
    }
	/**
	 * 获取建档日期.
	 * 
	 * @return 建档日期
	 */
	@Column(nullable=true

		,name="FILE_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getFileDate() {
        return fileDate;
    }
	/**
	 * 设置建档日期.
	 * @param fileDate 建档日期
	 */
    public void setFileDate(java.util.Date fileDate) {
        this.fileDate = fileDate;
    }
	/**
	 * 获取建档标记.
	 * 建档标记，关联设备编码BEAM038
	 * @return 建档标记
	 */
	@Column(nullable=true

		,length = 2000
		,name="FILE_STATE"
	)
    public String getFileState() {
        return fileState;
    }
	/**
	 * 设置建档标记.
	 * @param fileState 建档标记
	 */
    public void setFileState(String fileState) {
        this.fileState = fileState;
    }
	@ManyToOne
	@JoinColumn(name = "INSTALL_PLACE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicArea getInstallPlace() {
        return installPlace;
    }
    public void setInstallPlace(MESBasicArea installPlace) {
        this.installPlace = installPlace;
    }
	/**
	 * 获取是否测量设备.
	 * 
	 * @return 是否测量设备
	 */
	@Column(nullable=true

		,name="EAM_ISMEA"
	)
    public Boolean getIsMea() {
        return null == isMea ? false : isMea;
    }
	/**
	 * 设置是否测量设备.
	 * @param isMea 是否测量设备
	 */
    public void setIsMea(Boolean isMea) {
        this.isMea = isMea;
    }
	/**
	 * 获取关联容器.
	 * 如果勾选关联容器，则允许用户选择一个被关联的容器对象。
	 * @return 关联容器
	 */
	@Column(nullable=true

		,name="IS_RELATE_CONTAINER"
	)
    public Boolean getIsRelateContainer() {
        return null == isRelateContainer ? false : isRelateContainer;
    }
	/**
	 * 设置关联容器.
	 * @param isRelateContainer 关联容器
	 */
    public void setIsRelateContainer(Boolean isRelateContainer) {
        this.isRelateContainer = isRelateContainer;
    }
	/**
	 * 获取是否特种设备.
	 * 
	 * @return 是否特种设备
	 */
	@Column(nullable=true

		,name="IS_SPECIAL_NEW"
	)
    public Boolean getIsSpecialNew() {
        return null == isSpecialNew ? false : isSpecialNew;
    }
	/**
	 * 设置是否特种设备.
	 * @param isSpecialNew 是否特种设备
	 */
    public void setIsSpecialNew(Boolean isSpecialNew) {
        this.isSpecialNew = isSpecialNew;
    }
	/**
	 * 获取设备名称.
	 * 
	 * @return 设备名称
	 */
	@Column(

		length = 800
		,name="EAM_NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置设备名称.
	 * @param name 设备名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取其他特殊设备.
	 * 设备冗余字段，为系统编码其他特殊设备BEAM043
	 * @return 其他特殊设备
	 */
	@Column(nullable=true

		,length = 256
		,name="EAM_OTHERSPECIA"
	)
    public String getOtherspecia() {
        return otherspecia;
    }
	/**
	 * 设置其他特殊设备.
	 * @param otherspecia 其他特殊设备
	 */
    public void setOtherspecia(String otherspecia) {
        this.otherspecia = otherspecia;
    }
	@OneToOne
	@JoinColumn(name = "RELATE_CONTAINER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicContainer getRelateContainer() {
        return relateContainer;
    }
    public void setRelateContainer(MESBasicContainer relateContainer) {
        this.relateContainer = relateContainer;
    }
	/**
	 * 获取专业.
	 * 设备字段冗余，为系统编码BEAM040
	 * @return 专业
	 */
	@Column(nullable=true

		,length = 256
		,name="SPECIALTY_NEW"
	)
    public String getSpecialtyNew() {
        return specialtyNew;
    }
	/**
	 * 设置专业.
	 * @param specialtyNew 专业
	 */
    public void setSpecialtyNew(String specialtyNew) {
        this.specialtyNew = specialtyNew;
    }
	/**
	 * 获取特种设备类型.
	 * 设备冗余字段，为系统编码特种设备类型BEAM039
	 * @return 特种设备类型
	 */
	@Column(nullable=true

		,length = 256
		,name="SPECIAL_TYPE"
	)
    public String getSpecialType() {
        return specialType;
    }
	/**
	 * 设置特种设备类型.
	 * @param specialType 特种设备类型
	 */
    public void setSpecialType(String specialType) {
        this.specialType = specialType;
    }
	@ManyToOne
	@JoinColumn(name = "WORKCENTER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getWorkcenter() {
        return workcenter;
    }
    public void setWorkcenter(MESBasicFactoryModel workcenter) {
        this.workcenter = workcenter;
    }
	
	
	protected String _getEntityName() {
		return MESBasicEquipment.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_equipManage_Equipment,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
