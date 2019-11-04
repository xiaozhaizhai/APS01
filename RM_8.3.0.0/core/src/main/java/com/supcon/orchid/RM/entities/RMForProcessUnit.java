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
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 工序-工作单元表.
 */
@javax.persistence.Entity(name=RMForProcessUnit.JPA_NAME)
@Table(name = RMForProcessUnit.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_ForProcessUnit")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_ForProcessUnit,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMForProcessUnitConvertor.class})
public class RMForProcessUnit extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_ForProcessUnit";
	public static final String DOC_TYPE = "RM_formula_forProcessUnit";
	public static final String TABLE_NAME = "rm_process_units";
	public static final String JPA_NAME = "RMForProcessUnit";
	private RMForLineFormula headId;


		private Long headTempId ; // 产线配方临时Id
	private MESBasicFactoryModel lineId;


		private String pmemo ; // 备注
	private RMFormula puformulaId;
	private RMFormulaProcess puprocessId;
	private MESBasicFactoryModel puunitId;
	
	private List<RMForProcessUnitChoice> forProcessUnitChoiceList;
	
	public void setForProcessUnitChoiceList(List<RMForProcessUnitChoice> forProcessUnitChoiceList){
		this.forProcessUnitChoiceList = forProcessUnitChoiceList;
	}
	@Transient
	public List<RMForProcessUnitChoice> getForProcessUnitChoiceList(){
		return forProcessUnitChoiceList;
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
	
	
	@Index(name="IDX_FORPROCESSUNIT_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMForLineFormula getHeadId() {
        return headId;
    }
    public void setHeadId(RMForLineFormula headId) {
        this.headId = headId;
    }
	/**
	 * 获取产线配方临时Id.
	 * 
	 * @return 产线配方临时Id
	 */
	@Column(nullable=true

		,name="HEAD_TEMP_ID"
	)
    public Long getHeadTempId() {
        return headTempId;
    }
	/**
	 * 设置产线配方临时Id.
	 * @param headTempId 产线配方临时Id
	 */
    public void setHeadTempId(Long headTempId) {
        this.headTempId = headTempId;
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
		,length=2000

		,name="PMEMO"
	)
    @javax.persistence.Lob
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
	@JoinColumn(name = "FORMULA_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormula getPuformulaId() {
        return puformulaId;
    }
    public void setPuformulaId(RMFormula puformulaId) {
        this.puformulaId = puformulaId;
    }
	@ManyToOne
	@JoinColumn(name = "PROCESS_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcess getPuprocessId() {
        return puprocessId;
    }
    public void setPuprocessId(RMFormulaProcess puprocessId) {
        this.puprocessId = puprocessId;
    }
	@ManyToOne
	@JoinColumn(name = "UNIT_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getPuunitId() {
        return puunitId;
    }
    public void setPuunitId(MESBasicFactoryModel puunitId) {
        this.puunitId = puunitId;
    }
	
	
	protected String _getEntityName() {
		return RMForProcessUnit.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_ForProcessUnit,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
