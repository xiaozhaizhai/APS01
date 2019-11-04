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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
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
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;		
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 物品.
 * 引用自S2的物品表
 */
@javax.persistence.Entity(name=MESBasicProduct.JPA_NAME)
@Table(name = MESBasicProduct.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_product")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_product_Product")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "PRODUCT_CREATETIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "PRODUCT_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFYTIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicProductConvertor.class})
public class MESBasicProduct extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_product";
	public static final String MODEL_CODE = "MESBasic_1_product_Product";
	public static final String DOC_TYPE = "MESBasic_product_product";
	public static final String TABLE_NAME = "s2base_product";
	public static final String JPA_NAME = "MESBasicProduct";
	@BAPSeniorSystemCode(code="ABC_CLASS")
	private String abcClass
; // ABC分类
	private String abcClassForDisplay;


		private String abcClassS2 ; // ABC分类S2


		private Integer approachTime ; // 近效期
	private SystemCode approachUnit
; // 近效期单位


		private String attachExplain ; // 附加说明
	private SystemCode autoSupply
; // 自动补充标志


		private Boolean avbCODE = false; // 是否有效
	private SystemCode bapValueType
; // 计价方式
	private SystemCode batch
; // 批次启用

		private Long batchcode = 
			Long.valueOf("1000")
		; // 批号流水号, 


		private String beUnique ; // 批次启用S2


		private String cad ; // 包装规格型号
	private MESBasicQACheckIndex checkIndex;
	private SystemCode checkMethodbap
; // 检验方式


		private String cmemo ; // s2备注


		private java.math.BigDecimal costPriceOri ; // 参考采购价原值

	@XmlJavaTypeAdapter(DateAdapter.class)
		private java.util.Date createDate = 
			new java.util.Date();
		; // 建档日期, 
	private Staff creator;


		private Integer ctlEffectiveDateCount ; // 有效期控制天数


		private String dcontent ; // 维护内容及原因


		private java.math.BigDecimal desity ; // 密度(kg/m3)
	private MESBasicFactoryModel factory;


		private Integer frequency ; // 最大复验次数
	@BAPSeniorSystemCode(code="goodState")
	private String goodState
; // 物品状态
	private String goodStateForDisplay;
	private SystemCode interfaceUrl
; // 批控服务地址


		private Boolean isauto = false; // 自动生成批号


		private Boolean isContainer = false; // 容器启用


		private Boolean isCtrlPass = false; // 放行控制


		private Boolean isItemLevel = false; // 启用等级品管理


		private Boolean isKeepDate = false; // 保质期管理


		private Boolean isNeedConvert = false; // 是否折算


		private Boolean isNeedWeigh = false; // 是否计量


		private Boolean isPack = false; // 是否包材


		private Boolean isProReset = false; // 是否复验


		private Boolean isSparePart = false; // 是否备件


		private Integer keepDay ; // 保质期
	private SystemCode keepReckon
; // 有效期推算


		private Integer keepReckonS2 ; // 有效期推算S2
	private SystemCode keepUnit
; // 保质期单位


		private Integer keepUnitS2 ; // 保质期单位S2

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date lastDate ; // 上次盘点日期
	private X6BasicBaseUnit limsUnit;


		private java.math.BigDecimal lowNum ; // 最低库存
	private SystemCode mfgStockMode
; // 备料方式


		private java.math.BigDecimal minOrderQuantity ; // 最小订货量


		private String minTargetStock ; // 安全库存

		@BAPIsMneCode
		private String mnecode ; // 物品助记码
	private Staff modifyPerson;


		private java.math.BigDecimal mrpNum ; // 经济批量


		private Integer notifyDays ; // 提前提醒（天）


		private java.math.BigDecimal numberParamF ; // 折算率


		private String paRKINGSYS ; // 包装形式


		private java.math.BigDecimal pieceNum ; // 件重量


		private java.math.BigDecimal planPrice ; // 计划价


		private java.math.BigDecimal pointNum ; // 批量增量


		private java.math.BigDecimal precentPrice ; // 最近采购价

	@XmlJavaTypeAdapter(DateAdapter.class)
		private java.util.Date prodModifyTime = 
			new java.util.Date();
		; // 最近维护时间, 
	@BAPSeniorSystemCode(code="ProductType")
	private String prodType
; // 物品类别
	private String prodTypeForDisplay;


		private String productAccmonth ; // 财务月份


		private String productAllas ; // 别名


		private String productAttribute ; // 物品一级属性


		private java.math.BigDecimal productBalancePrice ; // 结存价
	private X6BasicBaseUnit productBaseUnit;


		private Integer productBeasset ; // 是否固定资产


		private Integer productBebatch ; // 是否批次管理


		private Integer productBeConsume ; // 是否消耗品


		private Integer productBeMass ; // 是否保质期管理


		private Integer productBeProducing ; // 是否在制品


		private Boolean productBePropCheck = false; // 是否质检


		private Integer productBepuchase ; // 是否采购品


		private Boolean productBeSale = false; // 是否销售品


		private Integer productBeSelf ; // 是否自产品


		private Boolean productBeService = false; // 是否仓库物品


		private Integer productBeVerstock ; // 是否挤压控制
	private X6BasicBaseUnit productBuyUnit;


		private java.math.BigDecimal productBuyUnitRate ; // 采购单位换算


		private String productChartCode ; // 图号


		private Integer productCheckDays ; // 检验期（天）


		private Integer productCheckFreq ; // 盘点周期


		private Integer productCheckMethod ; // 检验方式s2

		@BAPIsMneCode
		private String productCode ; // 物品编码


		private String productComment ; // 备注


		private java.math.BigDecimal productCostPrice ; // 参考采购价
	private X6BasicBaseUnit productCostUnit;


		private java.math.BigDecimal productCostunitRate ; // 成本单位换算
	private MESBasicBaseProdList productListID;


		private String productModel ; // 型号
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String productName ; // 物品名称


		private String productSpecif ; // 规格


		private String protoType ; // 物品属性
	private MESBasicPurchGroup purchGroupId;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date purDeliverDate ; // 配送提前期


		private String purGroupMark ; // 采购组原有字段值

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date purMoveUpDate ; // 采购提前期


		private java.math.BigDecimal purPoint ; // 订货点


		private java.math.BigDecimal recCost ; // 最新库存成本


		private java.math.BigDecimal recCostOri ; // 最近库存成本原值


		private Integer receiveDate ; // 固定提前期


		private java.math.BigDecimal recentPrice ; // 最近结算价


		private java.math.BigDecimal refCostPrice ; // 参考成本
	private MESBasicProduct replaceItem;
	private SystemCode reqType
; // 物料需求分析方法


		private Integer reqTypeS2 ; // 物料需求分析方法S2


		private String resetDaily ; // 复验周期
	private SystemCode resetMark
; // 复验期推算


		private Integer resetMarkS2 ; // 复验期推算S2


		private java.math.BigDecimal safeNum ; // 安全库存


		private java.math.BigDecimal salePrice ; // 参考售价


		private java.math.BigDecimal salePriceOri ; // 参考售价原值


		private java.math.BigDecimal saleRecentPrice ; // 最近销售价
	private X6BasicBaseUnit saleUnit;


		private Boolean selectFlag = false; // 勾选


		private java.math.BigDecimal standardPercent ; // 标准含量系数


		private java.math.BigDecimal standardPrice ; // 基准价


		private Integer storeDeadline ; // 最长贮存期限
	private SystemCode storeDeadlineUnit
; // 最长贮存期限单位
	private MESBasicStoreSet storeSet;
	private X6BasicBaseUnit storeUnit;


		private java.math.BigDecimal taxRate ; // 税率


		private java.math.BigDecimal topNum ; // 最高库存


		private String unit ; // 计量单位
	private X6BasicUnitGroups unitGroup;


		private Integer valueType ; // 计价方式S2
	private MESBasicWare ware;
	
	private List<MESBasicProdResetDaily> prodResetDailyList;
	
	public void setProdResetDailyList(List<MESBasicProdResetDaily> prodResetDailyList){
		this.prodResetDailyList = prodResetDailyList;
	}
	@Transient
	public List<MESBasicProdResetDaily> getProdResetDailyList(){
		return prodResetDailyList;
	}
	private List<MESBasicProdSecUnit> prodSecUnitList;
	
	public void setProdSecUnitList(List<MESBasicProdSecUnit> prodSecUnitList){
		this.prodSecUnitList = prodSecUnitList;
	}
	@Transient
	public List<MESBasicProdSecUnit> getProdSecUnitList(){
		return prodSecUnitList;
	}
	private List<MESBasicProdLevel> prodLevelList;
	
	public void setProdLevelList(List<MESBasicProdLevel> prodLevelList){
		this.prodLevelList = prodLevelList;
	}
	@Transient
	public List<MESBasicProdLevel> getProdLevelList(){
		return prodLevelList;
	}
	private List<MESBasicCprodAtt> cprodAttList;
	
	public void setCprodAttList(List<MESBasicCprodAtt> cprodAttList){
		this.cprodAttList = cprodAttList;
	}
	@Transient
	public List<MESBasicCprodAtt> getCprodAttList(){
		return cprodAttList;
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
	 * 获取ABC分类.
	 * 
	 * @return ABC分类
	 */
	@Column(name="PRODUCT_BAPABC")
	public String getAbcClass() {
		return abcClass;
	}
	/**
	 * 设置ABC分类.
	 * @param abcClass ABC分类
	 */
	public void setAbcClass(String abcClass) {
		this.abcClass = abcClass;
	}
	
	@javax.persistence.Transient
	public String getAbcClassForDisplay() {
		return abcClassForDisplay;
	}
	
	public void setAbcClassForDisplay(String abcClassForDisplay) {
		this.abcClassForDisplay = abcClassForDisplay;
	}
	/**
	 * 获取ABC分类S2.
	 * 
	 * @return ABC分类S2
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_ABC"
	)
    public String getAbcClassS2() {
        return abcClassS2;
    }
	/**
	 * 设置ABC分类S2.
	 * @param abcClassS2 ABC分类S2
	 */
    public void setAbcClassS2(String abcClassS2) {
        this.abcClassS2 = abcClassS2;
    }
	/**
	 * 获取近效期.
	 * 
	 * @return 近效期
	 */
	@Column(nullable=true

		,name="APPROACH_TIME"
	)
    public Integer getApproachTime() {
        return approachTime;
    }
	/**
	 * 设置近效期.
	 * @param approachTime 近效期
	 */
    public void setApproachTime(Integer approachTime) {
        this.approachTime = approachTime;
    }
	/**
	 * 获取近效期单位.
	 * 
	 * @return 近效期单位
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="APPROACH_UNIT", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getApproachUnit() {
		return approachUnit;
	}
	/**
	 * 设置近效期单位.
	 * @param approachUnit 近效期单位
	 */
	public void setApproachUnit(SystemCode approachUnit) {
		this.approachUnit = (SystemCode) approachUnit;
	}
	/**
	 * 获取附加说明.
	 * 
	 * @return 附加说明
	 */
	@Column(nullable=true

		,length = 200
		,name="ATTACH_EXPLAIN"
	)
    public String getAttachExplain() {
        return attachExplain;
    }
	/**
	 * 设置附加说明.
	 * @param attachExplain 附加说明
	 */
    public void setAttachExplain(String attachExplain) {
        this.attachExplain = attachExplain;
    }
	/**
	 * 获取自动补充标志.
	 * 
	 * @return 自动补充标志
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="AUTO_SUPPLY", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getAutoSupply() {
		return autoSupply;
	}
	/**
	 * 设置自动补充标志.
	 * @param autoSupply 自动补充标志
	 */
	public void setAutoSupply(SystemCode autoSupply) {
		this.autoSupply = (SystemCode) autoSupply;
	}
	/**
	 * 获取是否有效.
	 * 
	 * @return 是否有效
	 */
	@Column(nullable=true

		,name="AVBCODE"
	)
    public Boolean getAvbCODE() {
        return null == avbCODE ? false : avbCODE;
    }
	/**
	 * 设置是否有效.
	 * @param avbCODE 是否有效
	 */
    public void setAvbCODE(Boolean avbCODE) {
        this.avbCODE = avbCODE;
    }
	/**
	 * 获取计价方式.
	 * 
	 * @return 计价方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PRODUCT_BAPVALUETYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBapValueType() {
		return bapValueType;
	}
	/**
	 * 设置计价方式.
	 * @param bapValueType 计价方式
	 */
	public void setBapValueType(SystemCode bapValueType) {
		this.bapValueType = (SystemCode) bapValueType;
	}
	/**
	 * 获取批次启用.
	 * 
	 * @return 批次启用
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="BATCH", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getBatch() {
		return batch;
	}
	/**
	 * 设置批次启用.
	 * @param batch 批次启用
	 */
	public void setBatch(SystemCode batch) {
		this.batch = (SystemCode) batch;
	}
	/**
	 * 获取批号流水号.
	 * 
	 * @return 批号流水号
	 */
	@Column(nullable=true

		,name="BATCHCODE"
	)
    public Long getBatchcode() {
        return batchcode;
    }
	/**
	 * 设置批号流水号.
	 * @param batchcode 批号流水号
	 */
    public void setBatchcode(Long batchcode) {
        this.batchcode = batchcode;
    }
	/**
	 * 获取批次启用S2.
	 * 
	 * @return 批次启用S2
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_BEUNIQUE"
	)
    public String getBeUnique() {
        return beUnique;
    }
	/**
	 * 设置批次启用S2.
	 * @param beUnique 批次启用S2
	 */
    public void setBeUnique(String beUnique) {
        this.beUnique = beUnique;
    }
	/**
	 * 获取包装规格型号.
	 * 
	 * @return 包装规格型号
	 */
	@Column(nullable=true

		,length = 256
		,name="CAD"
	)
    public String getCad() {
        return cad;
    }
	/**
	 * 设置包装规格型号.
	 * @param cad 包装规格型号
	 */
    public void setCad(String cad) {
        this.cad = cad;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_CHECKINDEX", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicQACheckIndex getCheckIndex() {
        return checkIndex;
    }
    public void setCheckIndex(MESBasicQACheckIndex checkIndex) {
        this.checkIndex = checkIndex;
    }
	/**
	 * 获取检验方式.
	 * 
	 * @return 检验方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PRODUCT_BAPCHECKMETHOD", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getCheckMethodbap() {
		return checkMethodbap;
	}
	/**
	 * 设置检验方式.
	 * @param checkMethodbap 检验方式
	 */
	public void setCheckMethodbap(SystemCode checkMethodbap) {
		this.checkMethodbap = (SystemCode) checkMethodbap;
	}
	/**
	 * 获取s2备注.
	 * 
	 * @return s2备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="PRODUCT_MEMO"
	)
    public String getCmemo() {
        return cmemo;
    }
	/**
	 * 设置s2备注.
	 * @param cmemo s2备注
	 */
    public void setCmemo(String cmemo) {
        this.cmemo = cmemo;
    }
	/**
	 * 获取参考采购价原值.
	 * 
	 * @return 参考采购价原值
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="COST_PRICE_ORI"
	)
    public java.math.BigDecimal getCostPriceOri() {
        return costPriceOri;
    }
	/**
	 * 设置参考采购价原值.
	 * @param costPriceOri 参考采购价原值
	 */
    public void setCostPriceOri(java.math.BigDecimal costPriceOri) {
        this.costPriceOri = costPriceOri;
    }
	/**
	 * 获取建档日期.
	 * 
	 * @return 建档日期
	 */
	@Column(nullable=true

		,name="PRODUCT_CREATETIMENEW"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getCreateDate() {
        return createDate;
    }
	/**
	 * 设置建档日期.
	 * @param createDate 建档日期
	 */
    public void setCreateDate(java.util.Date createDate) {
        this.createDate = createDate;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_CREATEPERSON", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getCreator() {
        return creator;
    }
    public void setCreator(Staff creator) {
        this.creator = creator;
    }
	/**
	 * 获取有效期控制天数.
	 * 
	 * @return 有效期控制天数
	 */
	@Column(nullable=true

		,name="CTLEFFECTIVEDATECOUNT"
	)
    public Integer getCtlEffectiveDateCount() {
        return ctlEffectiveDateCount;
    }
	/**
	 * 设置有效期控制天数.
	 * @param ctlEffectiveDateCount 有效期控制天数
	 */
    public void setCtlEffectiveDateCount(Integer ctlEffectiveDateCount) {
        this.ctlEffectiveDateCount = ctlEffectiveDateCount;
    }
	/**
	 * 获取维护内容及原因.
	 * 
	 * @return 维护内容及原因
	 */
	@Column(nullable=true

		,length = 2000
		,name="DCONTENT"
	)
    public String getDcontent() {
        return dcontent;
    }
	/**
	 * 设置维护内容及原因.
	 * @param dcontent 维护内容及原因
	 */
    public void setDcontent(String dcontent) {
        this.dcontent = dcontent;
    }
	/**
	 * 获取密度(kg/m3).
	 * 
	 * @return 密度(kg/m3)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="DESITY"
	)
    public java.math.BigDecimal getDesity() {
        return desity;
    }
	/**
	 * 设置密度(kg/m3).
	 * @param desity 密度(kg/m3)
	 */
    public void setDesity(java.math.BigDecimal desity) {
        this.desity = desity;
    }
	@OneToOne
	@JoinColumn(name = "FACTORY", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getFactory() {
        return factory;
    }
    public void setFactory(MESBasicFactoryModel factory) {
        this.factory = factory;
    }
	/**
	 * 获取最大复验次数.
	 * 
	 * @return 最大复验次数
	 */
	@Column(nullable=true

		,name="FREQUENCY"
	)
    public Integer getFrequency() {
        return frequency;
    }
	/**
	 * 设置最大复验次数.
	 * @param frequency 最大复验次数
	 */
    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }
	/**
	 * 获取物品状态.
	 * 
	 * @return 物品状态
	 */
	@Column(name="GOOD_STATE")
	public String getGoodState() {
		return goodState;
	}
	/**
	 * 设置物品状态.
	 * @param goodState 物品状态
	 */
	public void setGoodState(String goodState) {
		this.goodState = goodState;
	}
	
	@javax.persistence.Transient
	public String getGoodStateForDisplay() {
		return goodStateForDisplay;
	}
	
	public void setGoodStateForDisplay(String goodStateForDisplay) {
		this.goodStateForDisplay = goodStateForDisplay;
	}
	/**
	 * 获取批控服务地址.
	 * 
	 * @return 批控服务地址
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="INTERFACE_URL", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getInterfaceUrl() {
		return interfaceUrl;
	}
	/**
	 * 设置批控服务地址.
	 * @param interfaceUrl 批控服务地址
	 */
	public void setInterfaceUrl(SystemCode interfaceUrl) {
		this.interfaceUrl = (SystemCode) interfaceUrl;
	}
	/**
	 * 获取自动生成批号.
	 * 
	 * @return 自动生成批号
	 */
	@Column(nullable=true

		,name="ISAUTO"
	)
    public Boolean getIsauto() {
        return null == isauto ? false : isauto;
    }
	/**
	 * 设置自动生成批号.
	 * @param isauto 自动生成批号
	 */
    public void setIsauto(Boolean isauto) {
        this.isauto = isauto;
    }
	/**
	 * 获取容器启用.
	 * 
	 * @return 容器启用
	 */
	@Column(nullable=true

		,name="PRODUCT_ISCONTAINER"
	)
    public Boolean getIsContainer() {
        return null == isContainer ? false : isContainer;
    }
	/**
	 * 设置容器启用.
	 * @param isContainer 容器启用
	 */
    public void setIsContainer(Boolean isContainer) {
        this.isContainer = isContainer;
    }
	/**
	 * 获取放行控制.
	 * 
	 * @return 放行控制
	 */
	@Column(nullable=true

		,name="PRODUCT_ISCTRLPASS"
	)
    public Boolean getIsCtrlPass() {
        return null == isCtrlPass ? false : isCtrlPass;
    }
	/**
	 * 设置放行控制.
	 * @param isCtrlPass 放行控制
	 */
    public void setIsCtrlPass(Boolean isCtrlPass) {
        this.isCtrlPass = isCtrlPass;
    }
	/**
	 * 获取启用等级品管理.
	 * 
	 * @return 启用等级品管理
	 */
	@Column(nullable=true

		,name="PRODUCT_ISITEMLEVEL"
	)
    public Boolean getIsItemLevel() {
        return null == isItemLevel ? false : isItemLevel;
    }
	/**
	 * 设置启用等级品管理.
	 * @param isItemLevel 启用等级品管理
	 */
    public void setIsItemLevel(Boolean isItemLevel) {
        this.isItemLevel = isItemLevel;
    }
	/**
	 * 获取保质期管理.
	 * 
	 * @return 保质期管理
	 */
	@Column(nullable=true

		,name="PRODUCT_ISKEEPDATE"
	)
    public Boolean getIsKeepDate() {
        return null == isKeepDate ? false : isKeepDate;
    }
	/**
	 * 设置保质期管理.
	 * @param isKeepDate 保质期管理
	 */
    public void setIsKeepDate(Boolean isKeepDate) {
        this.isKeepDate = isKeepDate;
    }
	/**
	 * 获取是否折算.
	 * 
	 * @return 是否折算
	 */
	@Column(nullable=true

		,name="PRODUCT_ISNEEDCONVERT"
	)
    public Boolean getIsNeedConvert() {
        return null == isNeedConvert ? false : isNeedConvert;
    }
	/**
	 * 设置是否折算.
	 * @param isNeedConvert 是否折算
	 */
    public void setIsNeedConvert(Boolean isNeedConvert) {
        this.isNeedConvert = isNeedConvert;
    }
	/**
	 * 获取是否计量.
	 * 
	 * @return 是否计量
	 */
	@Column(nullable=true

		,name="PRODUCT_ISNEEDWEIGH"
	)
    public Boolean getIsNeedWeigh() {
        return null == isNeedWeigh ? false : isNeedWeigh;
    }
	/**
	 * 设置是否计量.
	 * @param isNeedWeigh 是否计量
	 */
    public void setIsNeedWeigh(Boolean isNeedWeigh) {
        this.isNeedWeigh = isNeedWeigh;
    }
	/**
	 * 获取是否包材.
	 * 
	 * @return 是否包材
	 */
	@Column(nullable=true

		,name="IS_PACK"
	)
    public Boolean getIsPack() {
        return null == isPack ? false : isPack;
    }
	/**
	 * 设置是否包材.
	 * @param isPack 是否包材
	 */
    public void setIsPack(Boolean isPack) {
        this.isPack = isPack;
    }
	/**
	 * 获取是否复验.
	 * 
	 * @return 是否复验
	 */
	@Column(nullable=true

		,name="ISPRORESET"
	)
    public Boolean getIsProReset() {
        return null == isProReset ? false : isProReset;
    }
	/**
	 * 设置是否复验.
	 * @param isProReset 是否复验
	 */
    public void setIsProReset(Boolean isProReset) {
        this.isProReset = isProReset;
    }
	/**
	 * 获取是否备件.
	 * 
	 * @return 是否备件
	 */
	@Column(nullable=true

		,name="IS_SPARE_PART"
	)
    public Boolean getIsSparePart() {
        return null == isSparePart ? false : isSparePart;
    }
	/**
	 * 设置是否备件.
	 * @param isSparePart 是否备件
	 */
    public void setIsSparePart(Boolean isSparePart) {
        this.isSparePart = isSparePart;
    }
	/**
	 * 获取保质期.
	 * 
	 * @return 保质期
	 */
	@Column(nullable=true

		,name="PRODUCT_KEEPDAY"
	)
    public Integer getKeepDay() {
        return keepDay;
    }
	/**
	 * 设置保质期.
	 * @param keepDay 保质期
	 */
    public void setKeepDay(Integer keepDay) {
        this.keepDay = keepDay;
    }
	/**
	 * 获取有效期推算.
	 * 
	 * @return 有效期推算
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PRODUCT_BAPKEEPRECKON", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getKeepReckon() {
		return keepReckon;
	}
	/**
	 * 设置有效期推算.
	 * @param keepReckon 有效期推算
	 */
	public void setKeepReckon(SystemCode keepReckon) {
		this.keepReckon = (SystemCode) keepReckon;
	}
	/**
	 * 获取有效期推算S2.
	 * 
	 * @return 有效期推算S2
	 */
	@Column(nullable=true

		,name="PRODUCT_KEEPRECKON"
	)
    public Integer getKeepReckonS2() {
        return keepReckonS2;
    }
	/**
	 * 设置有效期推算S2.
	 * @param keepReckonS2 有效期推算S2
	 */
    public void setKeepReckonS2(Integer keepReckonS2) {
        this.keepReckonS2 = keepReckonS2;
    }
	/**
	 * 获取保质期单位.
	 * 
	 * @return 保质期单位
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PRODUCT_BAPKEEPUNIT", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getKeepUnit() {
		return keepUnit;
	}
	/**
	 * 设置保质期单位.
	 * @param keepUnit 保质期单位
	 */
	public void setKeepUnit(SystemCode keepUnit) {
		this.keepUnit = (SystemCode) keepUnit;
	}
	/**
	 * 获取保质期单位S2.
	 * 
	 * @return 保质期单位S2
	 */
	@Column(nullable=true

		,name="PRODUCT_KEEPUNIT"
	)
    public Integer getKeepUnitS2() {
        return keepUnitS2;
    }
	/**
	 * 设置保质期单位S2.
	 * @param keepUnitS2 保质期单位S2
	 */
    public void setKeepUnitS2(Integer keepUnitS2) {
        this.keepUnitS2 = keepUnitS2;
    }
	/**
	 * 获取上次盘点日期.
	 * 
	 * @return 上次盘点日期
	 */
	@Column(nullable=true

		,name="PRODUCT_LASTDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getLastDate() {
        return lastDate;
    }
	/**
	 * 设置上次盘点日期.
	 * @param lastDate 上次盘点日期
	 */
    public void setLastDate(java.util.Date lastDate) {
        this.lastDate = lastDate;
    }
	@OneToOne
	@JoinColumn(name = "LIMS_UNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getLimsUnit() {
        return limsUnit;
    }
    public void setLimsUnit(X6BasicBaseUnit limsUnit) {
        this.limsUnit = limsUnit;
    }
	/**
	 * 获取最低库存.
	 * 
	 * @return 最低库存
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRODUCT_LOWNUM"
	)
    public java.math.BigDecimal getLowNum() {
        return lowNum;
    }
	/**
	 * 设置最低库存.
	 * @param lowNum 最低库存
	 */
    public void setLowNum(java.math.BigDecimal lowNum) {
        this.lowNum = lowNum;
    }
	/**
	 * 获取备料方式.
	 * 
	 * @return 备料方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="MFG_STOCK_MODE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getMfgStockMode() {
		return mfgStockMode;
	}
	/**
	 * 设置备料方式.
	 * @param mfgStockMode 备料方式
	 */
	public void setMfgStockMode(SystemCode mfgStockMode) {
		this.mfgStockMode = (SystemCode) mfgStockMode;
	}
	/**
	 * 获取最小订货量.
	 * 
	 * @return 最小订货量
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRODUCT_MINORDERQUANTITY"
	)
    public java.math.BigDecimal getMinOrderQuantity() {
        return minOrderQuantity;
    }
	/**
	 * 设置最小订货量.
	 * @param minOrderQuantity 最小订货量
	 */
    public void setMinOrderQuantity(java.math.BigDecimal minOrderQuantity) {
        this.minOrderQuantity = minOrderQuantity;
    }
	/**
	 * 获取安全库存.
	 * 
	 * @return 安全库存
	 */
	@Column(nullable=true

		,length = 256
		,name="MIN_TARGET_STOCK"
	)
    public String getMinTargetStock() {
        return minTargetStock;
    }
	/**
	 * 设置安全库存.
	 * @param minTargetStock 安全库存
	 */
    public void setMinTargetStock(String minTargetStock) {
        this.minTargetStock = minTargetStock;
    }
	/**
	 * 获取物品助记码.
	 * 
	 * @return 物品助记码
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_MNECODE"
	)
    public String getMnecode() {
        return mnecode;
    }
	/**
	 * 设置物品助记码.
	 * @param mnecode 物品助记码
	 */
    public void setMnecode(String mnecode) {
        this.mnecode = mnecode;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_MODIFYPERSON", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getModifyPerson() {
        return modifyPerson;
    }
    public void setModifyPerson(Staff modifyPerson) {
        this.modifyPerson = modifyPerson;
    }
	/**
	 * 获取经济批量.
	 * 
	 * @return 经济批量
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRODUCT_MRPNUM"
	)
    public java.math.BigDecimal getMrpNum() {
        return mrpNum;
    }
	/**
	 * 设置经济批量.
	 * @param mrpNum 经济批量
	 */
    public void setMrpNum(java.math.BigDecimal mrpNum) {
        this.mrpNum = mrpNum;
    }
	/**
	 * 获取提前提醒（天）.
	 * 
	 * @return 提前提醒（天）
	 */
	@Column(nullable=true

		,name="PRODUCT_NOTIFYDAYS"
	)
    public Integer getNotifyDays() {
        return notifyDays;
    }
	/**
	 * 设置提前提醒（天）.
	 * @param notifyDays 提前提醒（天）
	 */
    public void setNotifyDays(Integer notifyDays) {
        this.notifyDays = notifyDays;
    }
	/**
	 * 获取折算率.
	 * 
	 * @return 折算率
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_NUMBERPARAMF"
	)
    public java.math.BigDecimal getNumberParamF() {
        return numberParamF;
    }
	/**
	 * 设置折算率.
	 * @param numberParamF 折算率
	 */
    public void setNumberParamF(java.math.BigDecimal numberParamF) {
        this.numberParamF = numberParamF;
    }
	/**
	 * 获取包装形式.
	 * 
	 * @return 包装形式
	 */
	@Column(nullable=true

		,length = 256
		,name="PARKINGSYS"
	)
    public String getPaRKINGSYS() {
        return paRKINGSYS;
    }
	/**
	 * 设置包装形式.
	 * @param paRKINGSYS 包装形式
	 */
    public void setPaRKINGSYS(String paRKINGSYS) {
        this.paRKINGSYS = paRKINGSYS;
    }
	/**
	 * 获取件重量.
	 * 
	 * @return 件重量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PIECE_NUM"
	)
    public java.math.BigDecimal getPieceNum() {
        return pieceNum;
    }
	/**
	 * 设置件重量.
	 * @param pieceNum 件重量
	 */
    public void setPieceNum(java.math.BigDecimal pieceNum) {
        this.pieceNum = pieceNum;
    }
	/**
	 * 获取计划价.
	 * 
	 * @return 计划价
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_PLANPRICE"
	)
    public java.math.BigDecimal getPlanPrice() {
        return planPrice;
    }
	/**
	 * 设置计划价.
	 * @param planPrice 计划价
	 */
    public void setPlanPrice(java.math.BigDecimal planPrice) {
        this.planPrice = planPrice;
    }
	/**
	 * 获取批量增量.
	 * 
	 * @return 批量增量
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRODUCT_POINTNUM"
	)
    public java.math.BigDecimal getPointNum() {
        return pointNum;
    }
	/**
	 * 设置批量增量.
	 * @param pointNum 批量增量
	 */
    public void setPointNum(java.math.BigDecimal pointNum) {
        this.pointNum = pointNum;
    }
	/**
	 * 获取最近采购价.
	 * 
	 * @return 最近采购价
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_PRECENTPRICE"
	)
    public java.math.BigDecimal getPrecentPrice() {
        return precentPrice;
    }
	/**
	 * 设置最近采购价.
	 * @param precentPrice 最近采购价
	 */
    public void setPrecentPrice(java.math.BigDecimal precentPrice) {
        this.precentPrice = precentPrice;
    }
	/**
	 * 获取最近维护时间.
	 * 
	 * @return 最近维护时间
	 */
	@Column(nullable=true

		,name="PRODUCT_MODIFYTIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getProdModifyTime() {
        return prodModifyTime;
    }
	/**
	 * 设置最近维护时间.
	 * @param prodModifyTime 最近维护时间
	 */
    public void setProdModifyTime(java.util.Date prodModifyTime) {
        this.prodModifyTime = prodModifyTime;
    }
	/**
	 * 获取物品类别.
	 * 
	 * @return 物品类别
	 */
	@Column(name="PROD_TYPE")
	public String getProdType() {
		return prodType;
	}
	/**
	 * 设置物品类别.
	 * @param prodType 物品类别
	 */
	public void setProdType(String prodType) {
		this.prodType = prodType;
	}
	
	@javax.persistence.Transient
	public String getProdTypeForDisplay() {
		return prodTypeForDisplay;
	}
	
	public void setProdTypeForDisplay(String prodTypeForDisplay) {
		this.prodTypeForDisplay = prodTypeForDisplay;
	}
	/**
	 * 获取财务月份.
	 * 
	 * @return 财务月份
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODUCT_ACCMONTH"
	)
    public String getProductAccmonth() {
        return productAccmonth;
    }
	/**
	 * 设置财务月份.
	 * @param productAccmonth 财务月份
	 */
    public void setProductAccmonth(String productAccmonth) {
        this.productAccmonth = productAccmonth;
    }
	/**
	 * 获取别名.
	 * 
	 * @return 别名
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_ALIAS"
	)
    public String getProductAllas() {
        return productAllas;
    }
	/**
	 * 设置别名.
	 * @param productAllas 别名
	 */
    public void setProductAllas(String productAllas) {
        this.productAllas = productAllas;
    }
	/**
	 * 获取物品一级属性.
	 * 
	 * @return 物品一级属性
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODUCT_ATTRIBUTE"
	)
    public String getProductAttribute() {
        return productAttribute;
    }
	/**
	 * 设置物品一级属性.
	 * @param productAttribute 物品一级属性
	 */
    public void setProductAttribute(String productAttribute) {
        this.productAttribute = productAttribute;
    }
	/**
	 * 获取结存价.
	 * 
	 * @return 结存价
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_BALANCEPRICE"
	)
    public java.math.BigDecimal getProductBalancePrice() {
        return productBalancePrice;
    }
	/**
	 * 设置结存价.
	 * @param productBalancePrice 结存价
	 */
    public void setProductBalancePrice(java.math.BigDecimal productBalancePrice) {
        this.productBalancePrice = productBalancePrice;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_BASEUNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getProductBaseUnit() {
        return productBaseUnit;
    }
    public void setProductBaseUnit(X6BasicBaseUnit productBaseUnit) {
        this.productBaseUnit = productBaseUnit;
    }
	/**
	 * 获取是否固定资产.
	 * 
	 * @return 是否固定资产
	 */
	@Column(nullable=true

		,name="PRODUCT_BEASSET"
	)
    public Integer getProductBeasset() {
        return productBeasset;
    }
	/**
	 * 设置是否固定资产.
	 * @param productBeasset 是否固定资产
	 */
    public void setProductBeasset(Integer productBeasset) {
        this.productBeasset = productBeasset;
    }
	/**
	 * 获取是否批次管理.
	 * 
	 * @return 是否批次管理
	 */
	@Column(nullable=true

		,name="PRODUCT_BEBATCH"
	)
    public Integer getProductBebatch() {
        return productBebatch;
    }
	/**
	 * 设置是否批次管理.
	 * @param productBebatch 是否批次管理
	 */
    public void setProductBebatch(Integer productBebatch) {
        this.productBebatch = productBebatch;
    }
	/**
	 * 获取是否消耗品.
	 * 
	 * @return 是否消耗品
	 */
	@Column(nullable=true

		,name="PRODUCT_BECONSUME"
	)
    public Integer getProductBeConsume() {
        return productBeConsume;
    }
	/**
	 * 设置是否消耗品.
	 * @param productBeConsume 是否消耗品
	 */
    public void setProductBeConsume(Integer productBeConsume) {
        this.productBeConsume = productBeConsume;
    }
	/**
	 * 获取是否保质期管理.
	 * 
	 * @return 是否保质期管理
	 */
	@Column(nullable=true

		,name="PRODUCT_BEMASS"
	)
    public Integer getProductBeMass() {
        return productBeMass;
    }
	/**
	 * 设置是否保质期管理.
	 * @param productBeMass 是否保质期管理
	 */
    public void setProductBeMass(Integer productBeMass) {
        this.productBeMass = productBeMass;
    }
	/**
	 * 获取是否在制品.
	 * 
	 * @return 是否在制品
	 */
	@Column(nullable=true

		,name="PRODUCT_BEPRODUCING"
	)
    public Integer getProductBeProducing() {
        return productBeProducing;
    }
	/**
	 * 设置是否在制品.
	 * @param productBeProducing 是否在制品
	 */
    public void setProductBeProducing(Integer productBeProducing) {
        this.productBeProducing = productBeProducing;
    }
	/**
	 * 获取是否质检.
	 * 
	 * @return 是否质检
	 */
	@Column(nullable=true

		,name="PRODUCT_BEPROPCHECK"
	)
    public Boolean getProductBePropCheck() {
        return null == productBePropCheck ? false : productBePropCheck;
    }
	/**
	 * 设置是否质检.
	 * @param productBePropCheck 是否质检
	 */
    public void setProductBePropCheck(Boolean productBePropCheck) {
        this.productBePropCheck = productBePropCheck;
    }
	/**
	 * 获取是否采购品.
	 * 
	 * @return 是否采购品
	 */
	@Column(nullable=true

		,name="PRODUCT_BEPURCHASE"
	)
    public Integer getProductBepuchase() {
        return productBepuchase;
    }
	/**
	 * 设置是否采购品.
	 * @param productBepuchase 是否采购品
	 */
    public void setProductBepuchase(Integer productBepuchase) {
        this.productBepuchase = productBepuchase;
    }
	/**
	 * 获取是否销售品.
	 * 
	 * @return 是否销售品
	 */
	@Column(nullable=true

		,name="PRODUCT_BESALE"
	)
    public Boolean getProductBeSale() {
        return null == productBeSale ? false : productBeSale;
    }
	/**
	 * 设置是否销售品.
	 * @param productBeSale 是否销售品
	 */
    public void setProductBeSale(Boolean productBeSale) {
        this.productBeSale = productBeSale;
    }
	/**
	 * 获取是否自产品.
	 * 
	 * @return 是否自产品
	 */
	@Column(nullable=true

		,name="PRODUCT_BESELF"
	)
    public Integer getProductBeSelf() {
        return productBeSelf;
    }
	/**
	 * 设置是否自产品.
	 * @param productBeSelf 是否自产品
	 */
    public void setProductBeSelf(Integer productBeSelf) {
        this.productBeSelf = productBeSelf;
    }
	/**
	 * 获取是否仓库物品.
	 * 
	 * @return 是否仓库物品
	 */
	@Column(nullable=true

		,name="PRODUCT_BESERVICE"
	)
    public Boolean getProductBeService() {
        return null == productBeService ? false : productBeService;
    }
	/**
	 * 设置是否仓库物品.
	 * @param productBeService 是否仓库物品
	 */
    public void setProductBeService(Boolean productBeService) {
        this.productBeService = productBeService;
    }
	/**
	 * 获取是否挤压控制.
	 * 
	 * @return 是否挤压控制
	 */
	@Column(nullable=true

		,name="PRODUCT_BEOVERSTOCK"
	)
    public Integer getProductBeVerstock() {
        return productBeVerstock;
    }
	/**
	 * 设置是否挤压控制.
	 * @param productBeVerstock 是否挤压控制
	 */
    public void setProductBeVerstock(Integer productBeVerstock) {
        this.productBeVerstock = productBeVerstock;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_BUYUNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getProductBuyUnit() {
        return productBuyUnit;
    }
    public void setProductBuyUnit(X6BasicBaseUnit productBuyUnit) {
        this.productBuyUnit = productBuyUnit;
    }
	/**
	 * 获取采购单位换算.
	 * 
	 * @return 采购单位换算
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_BUYUNITRATE"
	)
    public java.math.BigDecimal getProductBuyUnitRate() {
        return productBuyUnitRate;
    }
	/**
	 * 设置采购单位换算.
	 * @param productBuyUnitRate 采购单位换算
	 */
    public void setProductBuyUnitRate(java.math.BigDecimal productBuyUnitRate) {
        this.productBuyUnitRate = productBuyUnitRate;
    }
	/**
	 * 获取图号.
	 * 
	 * @return 图号
	 */
	@Column(nullable=true

		,length = 256
		,name="PRODUCT_CHARTCODE"
	)
    public String getProductChartCode() {
        return productChartCode;
    }
	/**
	 * 设置图号.
	 * @param productChartCode 图号
	 */
    public void setProductChartCode(String productChartCode) {
        this.productChartCode = productChartCode;
    }
	/**
	 * 获取检验期（天）.
	 * 
	 * @return 检验期（天）
	 */
	@Column(nullable=true

		,name="PRODUCT_CHECKDAYS"
	)
    public Integer getProductCheckDays() {
        return productCheckDays;
    }
	/**
	 * 设置检验期（天）.
	 * @param productCheckDays 检验期（天）
	 */
    public void setProductCheckDays(Integer productCheckDays) {
        this.productCheckDays = productCheckDays;
    }
	/**
	 * 获取盘点周期.
	 * 
	 * @return 盘点周期
	 */
	@Column(nullable=true

		,name="PRODUCT_CHECKFREQ"
	)
    public Integer getProductCheckFreq() {
        return productCheckFreq;
    }
	/**
	 * 设置盘点周期.
	 * @param productCheckFreq 盘点周期
	 */
    public void setProductCheckFreq(Integer productCheckFreq) {
        this.productCheckFreq = productCheckFreq;
    }
	/**
	 * 获取检验方式s2.
	 * 
	 * @return 检验方式s2
	 */
	@Column(nullable=true

		,name="PRODUCT_CHECKMETHOD"
	)
    public Integer getProductCheckMethod() {
        return productCheckMethod;
    }
	/**
	 * 设置检验方式s2.
	 * @param productCheckMethod 检验方式s2
	 */
    public void setProductCheckMethod(Integer productCheckMethod) {
        this.productCheckMethod = productCheckMethod;
    }
	/**
	 * 获取物品编码.
	 * 去除业务主键和唯一限制 modify by yy 2019-04-24
	 * @return 物品编码
	 */
	@Column(

		length = 200
		,name="PRODUCT_CODE"
	)
	@Index(name="index_Product_productCode")	
    public String getProductCode() {
        return productCode;
    }
	/**
	 * 设置物品编码.
	 * @param productCode 物品编码
	 */
    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="PRODUCT_COMMENT"
	)
    public String getProductComment() {
        return productComment;
    }
	/**
	 * 设置备注.
	 * @param productComment 备注
	 */
    public void setProductComment(String productComment) {
        this.productComment = productComment;
    }
	/**
	 * 获取参考采购价.
	 * 
	 * @return 参考采购价
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_COSTPRICE"
	)
    public java.math.BigDecimal getProductCostPrice() {
        return productCostPrice;
    }
	/**
	 * 设置参考采购价.
	 * @param productCostPrice 参考采购价
	 */
    public void setProductCostPrice(java.math.BigDecimal productCostPrice) {
        this.productCostPrice = productCostPrice;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_COSTUNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getProductCostUnit() {
        return productCostUnit;
    }
    public void setProductCostUnit(X6BasicBaseUnit productCostUnit) {
        this.productCostUnit = productCostUnit;
    }
	/**
	 * 获取成本单位换算.
	 * 
	 * @return 成本单位换算
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_COSTUNITRATE"
	)
    public java.math.BigDecimal getProductCostunitRate() {
        return productCostunitRate;
    }
	/**
	 * 设置成本单位换算.
	 * @param productCostunitRate 成本单位换算
	 */
    public void setProductCostunitRate(java.math.BigDecimal productCostunitRate) {
        this.productCostunitRate = productCostunitRate;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCT_PRODLISTID", referencedColumnName="PRODLIST_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicBaseProdList getProductListID() {
        return productListID;
    }
    public void setProductListID(MESBasicBaseProdList productListID) {
        this.productListID = productListID;
    }
	/**
	 * 获取型号.
	 * 
	 * @return 型号
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_MODEL"
	)
    public String getProductModel() {
        return productModel;
    }
	/**
	 * 设置型号.
	 * @param productModel 型号
	 */
    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }
	/**
	 * 获取物品名称.
	 * 
	 * @return 物品名称
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_NAME"
	)
    public String getProductName() {
        return productName;
    }
	/**
	 * 设置物品名称.
	 * @param productName 物品名称
	 */
    public void setProductName(String productName) {
        this.productName = productName;
    }
	/**
	 * 获取规格.
	 * 
	 * @return 规格
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_SPECIF"
	)
    public String getProductSpecif() {
        return productSpecif;
    }
	/**
	 * 设置规格.
	 * @param productSpecif 规格
	 */
    public void setProductSpecif(String productSpecif) {
        this.productSpecif = productSpecif;
    }
	/**
	 * 获取物品属性.
	 * 
	 * @return 物品属性
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_PROTOTYPE"
	)
    public String getProtoType() {
        return protoType;
    }
	/**
	 * 设置物品属性.
	 * @param protoType 物品属性
	 */
    public void setProtoType(String protoType) {
        this.protoType = protoType;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCT_PURCHGROUPID", referencedColumnName="USERREPORT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicPurchGroup getPurchGroupId() {
        return purchGroupId;
    }
    public void setPurchGroupId(MESBasicPurchGroup purchGroupId) {
        this.purchGroupId = purchGroupId;
    }
	/**
	 * 获取配送提前期.
	 * 
	 * @return 配送提前期
	 */
	@Column(nullable=true

		,name="PUR_DELIVER_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPurDeliverDate() {
        return purDeliverDate;
    }
	/**
	 * 设置配送提前期.
	 * @param purDeliverDate 配送提前期
	 */
    public void setPurDeliverDate(java.util.Date purDeliverDate) {
        this.purDeliverDate = purDeliverDate;
    }
	/**
	 * 获取采购组原有字段值.
	 * 
	 * @return 采购组原有字段值
	 */
	@Column(nullable=true

		,length = 200
		,name="PUR_GROUP_MARK"
	)
    public String getPurGroupMark() {
        return purGroupMark;
    }
	/**
	 * 设置采购组原有字段值.
	 * @param purGroupMark 采购组原有字段值
	 */
    public void setPurGroupMark(String purGroupMark) {
        this.purGroupMark = purGroupMark;
    }
	/**
	 * 获取采购提前期.
	 * 
	 * @return 采购提前期
	 */
	@Column(nullable=true

		,name="PUR_MOVE_UP_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getPurMoveUpDate() {
        return purMoveUpDate;
    }
	/**
	 * 设置采购提前期.
	 * @param purMoveUpDate 采购提前期
	 */
    public void setPurMoveUpDate(java.util.Date purMoveUpDate) {
        this.purMoveUpDate = purMoveUpDate;
    }
	/**
	 * 获取订货点.
	 * 
	 * @return 订货点
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRODUCT_PURPOINT"
	)
    public java.math.BigDecimal getPurPoint() {
        return purPoint;
    }
	/**
	 * 设置订货点.
	 * @param purPoint 订货点
	 */
    public void setPurPoint(java.math.BigDecimal purPoint) {
        this.purPoint = purPoint;
    }
	/**
	 * 获取最新库存成本.
	 * 
	 * @return 最新库存成本
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_RECCOST"
	)
    public java.math.BigDecimal getRecCost() {
        return recCost;
    }
	/**
	 * 设置最新库存成本.
	 * @param recCost 最新库存成本
	 */
    public void setRecCost(java.math.BigDecimal recCost) {
        this.recCost = recCost;
    }
	/**
	 * 获取最近库存成本原值.
	 * 
	 * @return 最近库存成本原值
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="REC_COST_ORI"
	)
    public java.math.BigDecimal getRecCostOri() {
        return recCostOri;
    }
	/**
	 * 设置最近库存成本原值.
	 * @param recCostOri 最近库存成本原值
	 */
    public void setRecCostOri(java.math.BigDecimal recCostOri) {
        this.recCostOri = recCostOri;
    }
	/**
	 * 获取固定提前期.
	 * 
	 * @return 固定提前期
	 */
	@Column(nullable=true

		,name="PRODUCT_RECIEVEDATE"
	)
    public Integer getReceiveDate() {
        return receiveDate;
    }
	/**
	 * 设置固定提前期.
	 * @param receiveDate 固定提前期
	 */
    public void setReceiveDate(Integer receiveDate) {
        this.receiveDate = receiveDate;
    }
	/**
	 * 获取最近结算价.
	 * 
	 * @return 最近结算价
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_RECENTPRICE"
	)
    public java.math.BigDecimal getRecentPrice() {
        return recentPrice;
    }
	/**
	 * 设置最近结算价.
	 * @param recentPrice 最近结算价
	 */
    public void setRecentPrice(java.math.BigDecimal recentPrice) {
        this.recentPrice = recentPrice;
    }
	/**
	 * 获取参考成本.
	 * 
	 * @return 参考成本
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_REFCOSTPRICE"
	)
    public java.math.BigDecimal getRefCostPrice() {
        return refCostPrice;
    }
	/**
	 * 设置参考成本.
	 * @param refCostPrice 参考成本
	 */
    public void setRefCostPrice(java.math.BigDecimal refCostPrice) {
        this.refCostPrice = refCostPrice;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCT_REPLACEITEM", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getReplaceItem() {
        return replaceItem;
    }
    public void setReplaceItem(MESBasicProduct replaceItem) {
        this.replaceItem = replaceItem;
    }
	/**
	 * 获取物料需求分析方法.
	 * 
	 * @return 物料需求分析方法
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PRODUCT_BAPREQTYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getReqType() {
		return reqType;
	}
	/**
	 * 设置物料需求分析方法.
	 * @param reqType 物料需求分析方法
	 */
	public void setReqType(SystemCode reqType) {
		this.reqType = (SystemCode) reqType;
	}
	/**
	 * 获取物料需求分析方法S2.
	 * 
	 * @return 物料需求分析方法S2
	 */
	@Column(nullable=true

		,name="PRODUCT_REQTYPE"
	)
    public Integer getReqTypeS2() {
        return reqTypeS2;
    }
	/**
	 * 设置物料需求分析方法S2.
	 * @param reqTypeS2 物料需求分析方法S2
	 */
    public void setReqTypeS2(Integer reqTypeS2) {
        this.reqTypeS2 = reqTypeS2;
    }
	/**
	 * 获取复验周期.
	 * 
	 * @return 复验周期
	 */
	@Column(nullable=true

		,length = 2000
		,name="PRODUCT_RESETDAILY"
	)
    public String getResetDaily() {
        return resetDaily;
    }
	/**
	 * 设置复验周期.
	 * @param resetDaily 复验周期
	 */
    public void setResetDaily(String resetDaily) {
        this.resetDaily = resetDaily;
    }
	/**
	 * 获取复验期推算.
	 * 
	 * @return 复验期推算
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PRODUCT_BAPRESETMARK", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getResetMark() {
		return resetMark;
	}
	/**
	 * 设置复验期推算.
	 * @param resetMark 复验期推算
	 */
	public void setResetMark(SystemCode resetMark) {
		this.resetMark = (SystemCode) resetMark;
	}
	/**
	 * 获取复验期推算S2.
	 * 
	 * @return 复验期推算S2
	 */
	@Column(nullable=true

		,name="PRODUCT_RESETMARK"
	)
    public Integer getResetMarkS2() {
        return resetMarkS2;
    }
	/**
	 * 设置复验期推算S2.
	 * @param resetMarkS2 复验期推算S2
	 */
    public void setResetMarkS2(Integer resetMarkS2) {
        this.resetMarkS2 = resetMarkS2;
    }
	/**
	 * 获取安全库存.
	 * 
	 * @return 安全库存
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRODUCT_SAFENUM"
	)
    public java.math.BigDecimal getSafeNum() {
        return safeNum;
    }
	/**
	 * 设置安全库存.
	 * @param safeNum 安全库存
	 */
    public void setSafeNum(java.math.BigDecimal safeNum) {
        this.safeNum = safeNum;
    }
	/**
	 * 获取参考售价.
	 * 
	 * @return 参考售价
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_SALEPRICE"
	)
    public java.math.BigDecimal getSalePrice() {
        return salePrice;
    }
	/**
	 * 设置参考售价.
	 * @param salePrice 参考售价
	 */
    public void setSalePrice(java.math.BigDecimal salePrice) {
        this.salePrice = salePrice;
    }
	/**
	 * 获取参考售价原值.
	 * 
	 * @return 参考售价原值
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="SALE_PRICE_ORI"
	)
    public java.math.BigDecimal getSalePriceOri() {
        return salePriceOri;
    }
	/**
	 * 设置参考售价原值.
	 * @param salePriceOri 参考售价原值
	 */
    public void setSalePriceOri(java.math.BigDecimal salePriceOri) {
        this.salePriceOri = salePriceOri;
    }
	/**
	 * 获取最近销售价.
	 * 
	 * @return 最近销售价
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="PRODUCT_SALERECENTPRICE"
	)
    public java.math.BigDecimal getSaleRecentPrice() {
        return saleRecentPrice;
    }
	/**
	 * 设置最近销售价.
	 * @param saleRecentPrice 最近销售价
	 */
    public void setSaleRecentPrice(java.math.BigDecimal saleRecentPrice) {
        this.saleRecentPrice = saleRecentPrice;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCT_SALEUNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getSaleUnit() {
        return saleUnit;
    }
    public void setSaleUnit(X6BasicBaseUnit saleUnit) {
        this.saleUnit = saleUnit;
    }
	/**
	 * 获取勾选.
	 * 
	 * @return 勾选
	 */
	@Column(nullable=true

		,name="SELECT_FLAG"
	)
    public Boolean getSelectFlag() {
        return null == selectFlag ? false : selectFlag;
    }
	/**
	 * 设置勾选.
	 * @param selectFlag 勾选
	 */
    public void setSelectFlag(Boolean selectFlag) {
        this.selectFlag = selectFlag;
    }
	/**
	 * 获取标准含量系数.
	 * 
	 * @return 标准含量系数
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_STANDARDPERCENT"
	)
    public java.math.BigDecimal getStandardPercent() {
        return standardPercent;
    }
	/**
	 * 设置标准含量系数.
	 * @param standardPercent 标准含量系数
	 */
    public void setStandardPercent(java.math.BigDecimal standardPercent) {
        this.standardPercent = standardPercent;
    }
	/**
	 * 获取基准价.
	 * 
	 * @return 基准价
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_STANDARDPRICE"
	)
    public java.math.BigDecimal getStandardPrice() {
        return standardPrice;
    }
	/**
	 * 设置基准价.
	 * @param standardPrice 基准价
	 */
    public void setStandardPrice(java.math.BigDecimal standardPrice) {
        this.standardPrice = standardPrice;
    }
	/**
	 * 获取最长贮存期限.
	 * 
	 * @return 最长贮存期限
	 */
	@Column(nullable=true

		,name="STOREDEADLINE"
	)
    public Integer getStoreDeadline() {
        return storeDeadline;
    }
	/**
	 * 设置最长贮存期限.
	 * @param storeDeadline 最长贮存期限
	 */
    public void setStoreDeadline(Integer storeDeadline) {
        this.storeDeadline = storeDeadline;
    }
	/**
	 * 获取最长贮存期限单位.
	 * 
	 * @return 最长贮存期限单位
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="STOREDEADLINEUNIT", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getStoreDeadlineUnit() {
		return storeDeadlineUnit;
	}
	/**
	 * 设置最长贮存期限单位.
	 * @param storeDeadlineUnit 最长贮存期限单位
	 */
	public void setStoreDeadlineUnit(SystemCode storeDeadlineUnit) {
		this.storeDeadlineUnit = (SystemCode) storeDeadlineUnit;
	}
	@ManyToOne
	@JoinColumn(name = "STORE_SET", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicStoreSet getStoreSet() {
        return storeSet;
    }
    public void setStoreSet(MESBasicStoreSet storeSet) {
        this.storeSet = storeSet;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCT_STOREUNIT", referencedColumnName="UNIT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicBaseUnit getStoreUnit() {
        return storeUnit;
    }
    public void setStoreUnit(X6BasicBaseUnit storeUnit) {
        this.storeUnit = storeUnit;
    }
	/**
	 * 获取税率.
	 * 
	 * @return 税率
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="PRODUCT_TAXRATE"
	)
    public java.math.BigDecimal getTaxRate() {
        return taxRate;
    }
	/**
	 * 设置税率.
	 * @param taxRate 税率
	 */
    public void setTaxRate(java.math.BigDecimal taxRate) {
        this.taxRate = taxRate;
    }
	/**
	 * 获取最高库存.
	 * 
	 * @return 最高库存
	 */
	@Column(nullable=true
			,precision=19,scale=3
		,name="PRODUCT_TOPNUM"
	)
    public java.math.BigDecimal getTopNum() {
        return topNum;
    }
	/**
	 * 设置最高库存.
	 * @param topNum 最高库存
	 */
    public void setTopNum(java.math.BigDecimal topNum) {
        this.topNum = topNum;
    }
	/**
	 * 获取计量单位.
	 * 
	 * @return 计量单位
	 */
	@Column(nullable=true

		,length = 20
		,name="UNIT"
	)
    public String getUnit() {
        return unit;
    }
	/**
	 * 设置计量单位.
	 * @param unit 计量单位
	 */
    public void setUnit(String unit) {
        this.unit = unit;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCT_UNITGROUPID", referencedColumnName="UNITGROUP_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicUnitGroups getUnitGroup() {
        return unitGroup;
    }
    public void setUnitGroup(X6BasicUnitGroups unitGroup) {
        this.unitGroup = unitGroup;
    }
	/**
	 * 获取计价方式S2.
	 * 
	 * @return 计价方式S2
	 */
	@Column(nullable=true

		,name="PRODUCT_VALUETYPE"
	)
    public Integer getValueType() {
        return valueType;
    }
	/**
	 * 设置计价方式S2.
	 * @param valueType 计价方式S2
	 */
    public void setValueType(Integer valueType) {
        this.valueType = valueType;
    }
	@ManyToOne
	@JoinColumn(name = "WARE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWare() {
        return ware;
    }
    public void setWare(MESBasicWare ware) {
        this.ware = ware;
    }
	
	
	protected String _getEntityName() {
		return MESBasicProduct.class.getName();
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
	private String productidProdAttrIdDeleteIds;
	private String productidProdAttrIdAddIds;
	private String productidProdAttrIdmultiselectIDs;
	private String productidProdAttrIdmultiselectNames;

	@javax.persistence.Transient
	public String getProductidProdAttrIdDeleteIds(){
		return this.productidProdAttrIdDeleteIds;
	}

	public void setProductidProdAttrIdDeleteIds(String deleteIds){
		this.productidProdAttrIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getProductidProdAttrIdmultiselectIDs(){
		return this.productidProdAttrIdmultiselectIDs;
	}

	public void setProductidProdAttrIdmultiselectIDs(String multiselectIDs){
		this.productidProdAttrIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getProductidProdAttrIdmultiselectNames(){
		return this.productidProdAttrIdmultiselectNames;
	}

	public void setProductidProdAttrIdmultiselectNames(String multiselectNames){
		this.productidProdAttrIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getProductidProdAttrIdAddIds(){
		return this.productidProdAttrIdAddIds;
	}

	public void setProductidProdAttrIdAddIds(String addIds){
		this.productidProdAttrIdAddIds = addIds;
	}
	private String productIDCompareIDDeleteIds;
	private String productIDCompareIDAddIds;
	private String productIDCompareIDmultiselectIDs;
	private String productIDCompareIDmultiselectNames;

	@javax.persistence.Transient
	public String getProductIDCompareIDDeleteIds(){
		return this.productIDCompareIDDeleteIds;
	}

	public void setProductIDCompareIDDeleteIds(String deleteIds){
		this.productIDCompareIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getProductIDCompareIDmultiselectIDs(){
		return this.productIDCompareIDmultiselectIDs;
	}

	public void setProductIDCompareIDmultiselectIDs(String multiselectIDs){
		this.productIDCompareIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getProductIDCompareIDmultiselectNames(){
		return this.productIDCompareIDmultiselectNames;
	}

	public void setProductIDCompareIDmultiselectNames(String multiselectNames){
		this.productIDCompareIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getProductIDCompareIDAddIds(){
		return this.productIDCompareIDAddIds;
	}

	public void setProductIDCompareIDAddIds(String addIds){
		this.productIDCompareIDAddIds = addIds;
	}
	private String productSecUnitDeleteIds;
	private String productSecUnitAddIds;
	private String productSecUnitmultiselectIDs;
	private String productSecUnitmultiselectNames;

	@javax.persistence.Transient
	public String getProductSecUnitDeleteIds(){
		return this.productSecUnitDeleteIds;
	}

	public void setProductSecUnitDeleteIds(String deleteIds){
		this.productSecUnitDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getProductSecUnitmultiselectIDs(){
		return this.productSecUnitmultiselectIDs;
	}

	public void setProductSecUnitmultiselectIDs(String multiselectIDs){
		this.productSecUnitmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getProductSecUnitmultiselectNames(){
		return this.productSecUnitmultiselectNames;
	}

	public void setProductSecUnitmultiselectNames(String multiselectNames){
		this.productSecUnitmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getProductSecUnitAddIds(){
		return this.productSecUnitAddIds;
	}

	public void setProductSecUnitAddIds(String addIds){
		this.productSecUnitAddIds = addIds;
	}
	private String productBaseUnitDeleteIds;
	private String productBaseUnitAddIds;
	private String productBaseUnitmultiselectIDs;
	private String productBaseUnitmultiselectNames;

	@javax.persistence.Transient
	public String getProductBaseUnitDeleteIds(){
		return this.productBaseUnitDeleteIds;
	}

	public void setProductBaseUnitDeleteIds(String deleteIds){
		this.productBaseUnitDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getProductBaseUnitmultiselectIDs(){
		return this.productBaseUnitmultiselectIDs;
	}

	public void setProductBaseUnitmultiselectIDs(String multiselectIDs){
		this.productBaseUnitmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getProductBaseUnitmultiselectNames(){
		return this.productBaseUnitmultiselectNames;
	}

	public void setProductBaseUnitmultiselectNames(String multiselectNames){
		this.productBaseUnitmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getProductBaseUnitAddIds(){
		return this.productBaseUnitAddIds;
	}

	public void setProductBaseUnitAddIds(String addIds){
		this.productBaseUnitAddIds = addIds;
	}

	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparama")
	private Integer productBigintparama;
	
	@Column
    public Integer getProductBigintparama() {
        return productBigintparama;
    }
	
    public void setProductBigintparama(Integer productBigintparama) {
        this.productBigintparama = productBigintparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamb")
	private Integer productBigintparamb;
	
	@Column
    public Integer getProductBigintparamb() {
        return productBigintparamb;
    }
	
    public void setProductBigintparamb(Integer productBigintparamb) {
        this.productBigintparamb = productBigintparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamc")
	private Integer productBigintparamc;
	
	@Column
    public Integer getProductBigintparamc() {
        return productBigintparamc;
    }
	
    public void setProductBigintparamc(Integer productBigintparamc) {
        this.productBigintparamc = productBigintparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamd")
	private Integer productBigintparamd;
	
	@Column
    public Integer getProductBigintparamd() {
        return productBigintparamd;
    }
	
    public void setProductBigintparamd(Integer productBigintparamd) {
        this.productBigintparamd = productBigintparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparame")
	private Integer productBigintparame;
	
	@Column
    public Integer getProductBigintparame() {
        return productBigintparame;
    }
	
    public void setProductBigintparame(Integer productBigintparame) {
        this.productBigintparame = productBigintparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamf")
	private Integer productBigintparamf;
	
	@Column
    public Integer getProductBigintparamf() {
        return productBigintparamf;
    }
	
    public void setProductBigintparamf(Integer productBigintparamf) {
        this.productBigintparamf = productBigintparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamg")
	private Integer productBigintparamg;
	
	@Column
    public Integer getProductBigintparamg() {
        return productBigintparamg;
    }
	
    public void setProductBigintparamg(Integer productBigintparamg) {
        this.productBigintparamg = productBigintparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamh")
	private Integer productBigintparamh;
	
	@Column
    public Integer getProductBigintparamh() {
        return productBigintparamh;
    }
	
    public void setProductBigintparamh(Integer productBigintparamh) {
        this.productBigintparamh = productBigintparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparami")
	private Integer productBigintparami;
	
	@Column
    public Integer getProductBigintparami() {
        return productBigintparami;
    }
	
    public void setProductBigintparami(Integer productBigintparami) {
        this.productBigintparami = productBigintparami;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamj")
	private Integer productBigintparamj;
	
	@Column
    public Integer getProductBigintparamj() {
        return productBigintparamj;
    }
	
    public void setProductBigintparamj(Integer productBigintparamj) {
        this.productBigintparamj = productBigintparamj;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparamk")
	private Integer productBigintparamk;
	
	@Column
    public Integer getProductBigintparamk() {
        return productBigintparamk;
    }
	
    public void setProductBigintparamk(Integer productBigintparamk) {
        this.productBigintparamk = productBigintparamk;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productBigintparaml")
	private Integer productBigintparaml;
	
	@Column
    public Integer getProductBigintparaml() {
        return productBigintparaml;
    }
	
    public void setProductBigintparaml(Integer productBigintparaml) {
        this.productBigintparaml = productBigintparaml;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparama")
	private String productCharparama;
	
	@Column
    public String getProductCharparama() {
        return productCharparama;
    }
	
    public void setProductCharparama(String productCharparama) {
        this.productCharparama = productCharparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamb")
	private String productCharparamb;
	
	@Column
    public String getProductCharparamb() {
        return productCharparamb;
    }
	
    public void setProductCharparamb(String productCharparamb) {
        this.productCharparamb = productCharparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamc")
	private String productCharparamc;
	
	@Column
    public String getProductCharparamc() {
        return productCharparamc;
    }
	
    public void setProductCharparamc(String productCharparamc) {
        this.productCharparamc = productCharparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamd")
	private String productCharparamd;
	
	@Column
    public String getProductCharparamd() {
        return productCharparamd;
    }
	
    public void setProductCharparamd(String productCharparamd) {
        this.productCharparamd = productCharparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparame")
	private String productCharparame;
	
	@Column
    public String getProductCharparame() {
        return productCharparame;
    }
	
    public void setProductCharparame(String productCharparame) {
        this.productCharparame = productCharparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamf")
	private String productCharparamf;
	
	@Column
    public String getProductCharparamf() {
        return productCharparamf;
    }
	
    public void setProductCharparamf(String productCharparamf) {
        this.productCharparamf = productCharparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamg")
	private String productCharparamg;
	
	@Column
    public String getProductCharparamg() {
        return productCharparamg;
    }
	
    public void setProductCharparamg(String productCharparamg) {
        this.productCharparamg = productCharparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamh")
	private String productCharparamh;
	
	@Column
    public String getProductCharparamh() {
        return productCharparamh;
    }
	
    public void setProductCharparamh(String productCharparamh) {
        this.productCharparamh = productCharparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparami")
	private String productCharparami;
	
	@Column
    public String getProductCharparami() {
        return productCharparami;
    }
	
    public void setProductCharparami(String productCharparami) {
        this.productCharparami = productCharparami;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamj")
	private String productCharparamj;
	
	@Column
    public String getProductCharparamj() {
        return productCharparamj;
    }
	
    public void setProductCharparamj(String productCharparamj) {
        this.productCharparamj = productCharparamj;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamk")
	private String productCharparamk;
	
	@Column
    public String getProductCharparamk() {
        return productCharparamk;
    }
	
    public void setProductCharparamk(String productCharparamk) {
        this.productCharparamk = productCharparamk;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparaml")
	private String productCharparaml;
	
	@Column
    public String getProductCharparaml() {
        return productCharparaml;
    }
	
    public void setProductCharparaml(String productCharparaml) {
        this.productCharparaml = productCharparaml;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamm")
	private String productCharparamm;
	
	@Column
    public String getProductCharparamm() {
        return productCharparamm;
    }
	
    public void setProductCharparamm(String productCharparamm) {
        this.productCharparamm = productCharparamm;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamn")
	private String productCharparamn;
	
	@Column
    public String getProductCharparamn() {
        return productCharparamn;
    }
	
    public void setProductCharparamn(String productCharparamn) {
        this.productCharparamn = productCharparamn;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamo")
	private String productCharparamo;
	
	@Column
    public String getProductCharparamo() {
        return productCharparamo;
    }
	
    public void setProductCharparamo(String productCharparamo) {
        this.productCharparamo = productCharparamo;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamp")
	private String productCharparamp;
	
	@Column
    public String getProductCharparamp() {
        return productCharparamp;
    }
	
    public void setProductCharparamp(String productCharparamp) {
        this.productCharparamp = productCharparamp;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamq")
	private String productCharparamq;
	
	@Column
    public String getProductCharparamq() {
        return productCharparamq;
    }
	
    public void setProductCharparamq(String productCharparamq) {
        this.productCharparamq = productCharparamq;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamr")
	private String productCharparamr;
	
	@Column
    public String getProductCharparamr() {
        return productCharparamr;
    }
	
    public void setProductCharparamr(String productCharparamr) {
        this.productCharparamr = productCharparamr;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparams")
	private String productCharparams;
	
	@Column
    public String getProductCharparams() {
        return productCharparams;
    }
	
    public void setProductCharparams(String productCharparams) {
        this.productCharparams = productCharparams;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamt")
	private String productCharparamt;
	
	@Column
    public String getProductCharparamt() {
        return productCharparamt;
    }
	
    public void setProductCharparamt(String productCharparamt) {
        this.productCharparamt = productCharparamt;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamu")
	private String productCharparamu;
	
	@Column
    public String getProductCharparamu() {
        return productCharparamu;
    }
	
    public void setProductCharparamu(String productCharparamu) {
        this.productCharparamu = productCharparamu;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamv")
	private String productCharparamv;
	
	@Column
    public String getProductCharparamv() {
        return productCharparamv;
    }
	
    public void setProductCharparamv(String productCharparamv) {
        this.productCharparamv = productCharparamv;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamw")
	private String productCharparamw;
	
	@Column
    public String getProductCharparamw() {
        return productCharparamw;
    }
	
    public void setProductCharparamw(String productCharparamw) {
        this.productCharparamw = productCharparamw;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamx")
	private String productCharparamx;
	
	@Column
    public String getProductCharparamx() {
        return productCharparamx;
    }
	
    public void setProductCharparamx(String productCharparamx) {
        this.productCharparamx = productCharparamx;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamy")
	private String productCharparamy;
	
	@Column
    public String getProductCharparamy() {
        return productCharparamy;
    }
	
    public void setProductCharparamy(String productCharparamy) {
        this.productCharparamy = productCharparamy;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productCharparamz")
	private String productCharparamz;
	
	@Column
    public String getProductCharparamz() {
        return productCharparamz;
    }
	
    public void setProductCharparamz(String productCharparamz) {
        this.productCharparamz = productCharparamz;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productDateparama")
	private java.util.Date productDateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getProductDateparama() {
        return productDateparama;
    }
	
    public void setProductDateparama(java.util.Date productDateparama) {
        this.productDateparama = productDateparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productDateparamb")
	private java.util.Date productDateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getProductDateparamb() {
        return productDateparamb;
    }
	
    public void setProductDateparamb(java.util.Date productDateparamb) {
        this.productDateparamb = productDateparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productDateparamc")
	private java.util.Date productDateparamc;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getProductDateparamc() {
        return productDateparamc;
    }
	
    public void setProductDateparamc(java.util.Date productDateparamc) {
        this.productDateparamc = productDateparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productDateparamd")
	private java.util.Date productDateparamd;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getProductDateparamd() {
        return productDateparamd;
    }
	
    public void setProductDateparamd(java.util.Date productDateparamd) {
        this.productDateparamd = productDateparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productNumberparamg")
	private java.math.BigDecimal productNumberparamg;
	
	@Column
    public java.math.BigDecimal getProductNumberparamg() {
        return productNumberparamg;
    }
	
    public void setProductNumberparamg(java.math.BigDecimal productNumberparamg) {
        this.productNumberparamg = productNumberparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productNumberparamh")
	private java.math.BigDecimal productNumberparamh;
	
	@Column
    public java.math.BigDecimal getProductNumberparamh() {
        return productNumberparamh;
    }
	
    public void setProductNumberparamh(java.math.BigDecimal productNumberparamh) {
        this.productNumberparamh = productNumberparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productNumberparami")
	private java.math.BigDecimal productNumberparami;
	
	@Column
    public java.math.BigDecimal getProductNumberparami() {
        return productNumberparami;
    }
	
    public void setProductNumberparami(java.math.BigDecimal productNumberparami) {
        this.productNumberparami = productNumberparami;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productNumberparamj")
	private java.math.BigDecimal productNumberparamj;
	
	@Column
    public java.math.BigDecimal getProductNumberparamj() {
        return productNumberparamj;
    }
	
    public void setProductNumberparamj(java.math.BigDecimal productNumberparamj) {
        this.productNumberparamj = productNumberparamj;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productNumberparamk")
	private java.math.BigDecimal productNumberparamk;
	
	@Column
    public java.math.BigDecimal getProductNumberparamk() {
        return productNumberparamk;
    }
	
    public void setProductNumberparamk(java.math.BigDecimal productNumberparamk) {
        this.productNumberparamk = productNumberparamk;
    }
	@BAPCustomComponent(code = "MESBasic_1_product_Product_productNumberparaml")
	private java.math.BigDecimal productNumberparaml;
	
	@Column
    public java.math.BigDecimal getProductNumberparaml() {
        return productNumberparaml;
    }
	
    public void setProductNumberparaml(java.math.BigDecimal productNumberparaml) {
        this.productNumberparaml = productNumberparaml;
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof MESBasicProduct){
			return ((MESBasicProduct) obj).id.equals(this.id);
		}else{
			return false;
		}
    }
	
	@Override
	public int hashCode(){
		return id.intValue();
	}
/* CUSTOM CODE END */
}
