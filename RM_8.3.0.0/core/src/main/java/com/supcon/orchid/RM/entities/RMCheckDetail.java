package com.supcon.orchid.RM.entities;

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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 检查明细.
 * 人工确认活动检查指标
 */
@javax.persistence.Entity(name=RMCheckDetail.JPA_NAME)
@Table(name = RMCheckDetail.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_CheckDetail")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_CheckDetail,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMCheckDetailConvertor.class})
public class RMCheckDetail extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_CheckDetail";
	public static final String DOC_TYPE = "RM_formula_checkDetail";
	public static final String TABLE_NAME = "rm_check_details";
	public static final String JPA_NAME = "RMCheckDetail";
	private RMFormulaProcessActive activeId;


		private String checkItems ; // 检查项
	private SystemCode itemClass
; // 位号属性（废）
	private SystemCode itemClassNew
; // 位号属性


		private String standrad ; // 标准值
	
	private List<RMCheckDetailItemSetups> checkDetailItemSetupsList;
	
	public void setCheckDetailItemSetupsList(List<RMCheckDetailItemSetups> checkDetailItemSetupsList){
		this.checkDetailItemSetupsList = checkDetailItemSetupsList;
	}
	@Transient
	public List<RMCheckDetailItemSetups> getCheckDetailItemSetupsList(){
		return checkDetailItemSetupsList;
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
	
	
	@Index(name="IDX_CHECKDETAIL_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@ManyToOne
	@JoinColumn(name = "ACTIVE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcessActive getActiveId() {
        return activeId;
    }
    public void setActiveId(RMFormulaProcessActive activeId) {
        this.activeId = activeId;
    }
	/**
	 * 获取检查项.
	 * 
	 * @return 检查项
	 */
	@Column(nullable=true

		,length = 2000
		,name="CHECK_ITEMS"
	)
    public String getCheckItems() {
        return checkItems;
    }
	/**
	 * 设置检查项.
	 * @param checkItems 检查项
	 */
    public void setCheckItems(String checkItems) {
        this.checkItems = checkItems;
    }
	/**
	 * 获取位号属性（废）.
	 * 
	 * @return 位号属性（废）
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ITEM_CLASS", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getItemClass() {
		return itemClass;
	}
	/**
	 * 设置位号属性（废）.
	 * @param itemClass 位号属性（废）
	 */
	public void setItemClass(SystemCode itemClass) {
		this.itemClass = (SystemCode) itemClass;
	}
	/**
	 * 获取位号属性.
	 * 
	 * @return 位号属性
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ITEM_CLASS_NEW", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getItemClassNew() {
		return itemClassNew;
	}
	/**
	 * 设置位号属性.
	 * @param itemClassNew 位号属性
	 */
	public void setItemClassNew(SystemCode itemClassNew) {
		this.itemClassNew = (SystemCode) itemClassNew;
	}
	/**
	 * 获取标准值.
	 * 
	 * @return 标准值
	 */
	@Column(nullable=true

		,length = 2000
		,name="STANDRAD"
	)
    public String getStandrad() {
        return standrad;
    }
	/**
	 * 设置标准值.
	 * @param standrad 标准值
	 */
    public void setStandrad(String standrad) {
        this.standrad = standrad;
    }
	
	
	protected String _getEntityName() {
		return RMCheckDetail.class.getName();
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
	private String checkDetailIdItemSetupIdDeleteIds;
	private String checkDetailIdItemSetupIdAddIds;
	private String checkDetailIdItemSetupIdmultiselectIDs;
	private String checkDetailIdItemSetupIdmultiselectNames;

	@javax.persistence.Transient
	public String getCheckDetailIdItemSetupIdDeleteIds(){
		return this.checkDetailIdItemSetupIdDeleteIds;
	}

	public void setCheckDetailIdItemSetupIdDeleteIds(String deleteIds){
		this.checkDetailIdItemSetupIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getCheckDetailIdItemSetupIdmultiselectIDs(){
		return this.checkDetailIdItemSetupIdmultiselectIDs;
	}

	public void setCheckDetailIdItemSetupIdmultiselectIDs(String multiselectIDs){
		this.checkDetailIdItemSetupIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getCheckDetailIdItemSetupIdmultiselectNames(){
		return this.checkDetailIdItemSetupIdmultiselectNames;
	}

	public void setCheckDetailIdItemSetupIdmultiselectNames(String multiselectNames){
		this.checkDetailIdItemSetupIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getCheckDetailIdItemSetupIdAddIds(){
		return this.checkDetailIdItemSetupIdAddIds;
	}

	public void setCheckDetailIdItemSetupIdAddIds(String addIds){
		this.checkDetailIdItemSetupIdAddIds = addIds;
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_CheckDetail,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
