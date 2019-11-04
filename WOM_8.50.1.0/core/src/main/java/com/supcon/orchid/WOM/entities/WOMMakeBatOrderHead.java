package com.supcon.orchid.WOM.entities;

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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 创建配料指令表头.
 */
@javax.persistence.Entity(name=WOMMakeBatOrderHead.JPA_NAME)
@Table(name = WOMMakeBatOrderHead.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_batchingMaterialNeed")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMMakeBatOrderHeadConvertor.class})
public class WOMMakeBatOrderHead extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_batchingMaterialNeed";
	public static final String MODEL_CODE = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead";
	public static final String DOC_TYPE = "WOM_batchingMaterialNeed_makeBatOrderHead";
	public static final String TABLE_NAME = "wom_make_bat_order_heads";
	public static final String JPA_NAME = "WOMMakeBatOrderHead";
	private Staff doneStaff;
	private Staff makeStaff;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date needDate ; // 需送达时间
	
	private List<WOMMakeBatOrderPart> makeBatOrderPartList;
	
	public void setMakeBatOrderPartList(List<WOMMakeBatOrderPart> makeBatOrderPartList){
		this.makeBatOrderPartList = makeBatOrderPartList;
	}
	@Transient
	public List<WOMMakeBatOrderPart> getMakeBatOrderPartList(){
		return makeBatOrderPartList;
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
	
	@OneToOne
	@JoinColumn(name = "DONE_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getDoneStaff() {
        return doneStaff;
    }
    public void setDoneStaff(Staff doneStaff) {
        this.doneStaff = doneStaff;
    }
	@OneToOne
	@JoinColumn(name = "MAKE_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getMakeStaff() {
        return makeStaff;
    }
    public void setMakeStaff(Staff makeStaff) {
        this.makeStaff = makeStaff;
    }
	/**
	 * 获取需送达时间.
	 * 
	 * @return 需送达时间
	 */
	@Column(nullable=true

		,name="NEED_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getNeedDate() {
        return needDate;
    }
	/**
	 * 设置需送达时间.
	 * @param needDate 需送达时间
	 */
    public void setNeedDate(java.util.Date needDate) {
        this.needDate = needDate;
    }
	
	
	protected String _getEntityName() {
		return WOMMakeBatOrderHead.class.getName();
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
	private String headIDNeedIDDeleteIds;
	private String headIDNeedIDAddIds;
	private String headIDNeedIDmultiselectIDs;
	private String headIDNeedIDmultiselectNames;

	@javax.persistence.Transient
	public String getHeadIDNeedIDDeleteIds(){
		return this.headIDNeedIDDeleteIds;
	}

	public void setHeadIDNeedIDDeleteIds(String deleteIds){
		this.headIDNeedIDDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getHeadIDNeedIDmultiselectIDs(){
		return this.headIDNeedIDmultiselectIDs;
	}

	public void setHeadIDNeedIDmultiselectIDs(String multiselectIDs){
		this.headIDNeedIDmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getHeadIDNeedIDmultiselectNames(){
		return this.headIDNeedIDmultiselectNames;
	}

	public void setHeadIDNeedIDmultiselectNames(String multiselectNames){
		this.headIDNeedIDmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getHeadIDNeedIDAddIds(){
		return this.headIDNeedIDAddIds;
	}

	public void setHeadIDNeedIDAddIds(String addIds){
		this.headIDNeedIDAddIds = addIds;
	}

	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
