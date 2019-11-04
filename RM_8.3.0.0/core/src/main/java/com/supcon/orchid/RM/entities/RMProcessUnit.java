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
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 工序-工作单元表.
 */
@javax.persistence.Entity(name=RMProcessUnit.JPA_NAME)
@Table(name = RMProcessUnit.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_suitedLine")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_suitedLine_ProcessUnit")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMProcessUnitConvertor.class})
public class RMProcessUnit extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_suitedLine";
	public static final String MODEL_CODE = "RM_7.5.0.0_suitedLine_ProcessUnit";
	public static final String DOC_TYPE = "RM_suitedLine_processUnit";
	public static final String TABLE_NAME = "rm_process_units";
	public static final String JPA_NAME = "RMProcessUnit";
	private RMFormula formulaId;
	private RMLineFormula headId;
	private MESBasicFactoryModel lineId;


		private String pmemo ; // 备注
	private RMFormulaProcess processId;
	private MESBasicFactoryModel unitId;
	
	private List<RMProcessUnitChoice> processUnitChoiceList;
	
	public void setProcessUnitChoiceList(List<RMProcessUnitChoice> processUnitChoiceList){
		this.processUnitChoiceList = processUnitChoiceList;
	}
	@Transient
	public List<RMProcessUnitChoice> getProcessUnitChoiceList(){
		return processUnitChoiceList;
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
	
	@ManyToOne
	@JoinColumn(name = "FORMULA_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormula getFormulaId() {
        return formulaId;
    }
    public void setFormulaId(RMFormula formulaId) {
        this.formulaId = formulaId;
    }
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMLineFormula getHeadId() {
        return headId;
    }
    public void setHeadId(RMLineFormula headId) {
        this.headId = headId;
    }
	@ManyToOne
	@JoinColumn(name = "LINE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getLineId() {
        return lineId;
    }
    public void setLineId(MESBasicFactoryModel lineId) {
        this.lineId = lineId;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
		,name="PMEMO"
	)
    public String getPmemo() {
        return pmemo;
    }
	/**
	 * 设置备注.
	 * @param pmemo 备注
	 */
    public void setPmemo(String pmemo) {
        this.pmemo = pmemo;
    }
	@ManyToOne
	@JoinColumn(name = "PROCESS_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcess getProcessId() {
        return processId;
    }
    public void setProcessId(RMFormulaProcess processId) {
        this.processId = processId;
    }
	@ManyToOne
	@JoinColumn(name = "UNIT_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getUnitId() {
        return unitId;
    }
    public void setUnitId(MESBasicFactoryModel unitId) {
        this.unitId = unitId;
    }
	
	
	protected String _getEntityName() {
		return RMProcessUnit.class.getName();
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
	private String processUnitIDUnitIdDeleteIds;
	private String processUnitIDUnitIdAddIds;
	private String processUnitIDUnitIdmultiselectIDs;
	private String processUnitIDUnitIdmultiselectNames;

	@javax.persistence.Transient
	public String getProcessUnitIDUnitIdDeleteIds(){
		return this.processUnitIDUnitIdDeleteIds;
	}

	public void setProcessUnitIDUnitIdDeleteIds(String deleteIds){
		this.processUnitIDUnitIdDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getProcessUnitIDUnitIdmultiselectIDs(){
		return this.processUnitIDUnitIdmultiselectIDs;
	}

	public void setProcessUnitIDUnitIdmultiselectIDs(String multiselectIDs){
		this.processUnitIDUnitIdmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getProcessUnitIDUnitIdmultiselectNames(){
		return this.processUnitIDUnitIdmultiselectNames;
	}

	public void setProcessUnitIDUnitIdmultiselectNames(String multiselectNames){
		this.processUnitIDUnitIdmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getProcessUnitIDUnitIdAddIds(){
		return this.processUnitIDUnitIdAddIds;
	}

	public void setProcessUnitIDUnitIdAddIds(String addIds){
		this.processUnitIDUnitIdAddIds = addIds;
	}

	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_objparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_objparamb", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_scparama", complex = true)
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
	@BAPCustomComponent(code = "RM_7.5.0.0_suitedLine_ProcessUnit_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
