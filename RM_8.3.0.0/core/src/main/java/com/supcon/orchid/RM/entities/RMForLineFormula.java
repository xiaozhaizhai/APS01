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
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产线-配方表.
 */
@javax.persistence.Entity(name=RMForLineFormula.JPA_NAME)
@Table(name = RMForLineFormula.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_formula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_formula_ForLineFormula")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_formula_ForLineFormula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMForLineFormulaConvertor.class})
public class RMForLineFormula extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_formula";
	public static final String MODEL_CODE = "RM_7.5.0.0_formula_ForLineFormula";
	public static final String DOC_TYPE = "RM_formula_forLineFormula";
	public static final String TABLE_NAME = "rm_line_formulas";
	public static final String JPA_NAME = "RMForLineFormula";
	private SystemCode autoReportOnFinish
; // 完成后自动报工


		private Boolean ebr = false; // 启用EBR
	private RMFormula lfformulaId;
	private MESBasicFactoryModel lflineId;


		private java.math.BigDecimal longTime ; // 标准时长


		private java.math.BigDecimal maxCapacity ; // 最大产能


		private String meno ; // 备注


		private String tempId ; // 临时id


		private java.math.BigDecimal theoreYield ; // 理论收率
	
	
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
	
	
	@Index(name="IDX_FORLINEFORMULA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取完成后自动报工.
	 * 
	 * @return 完成后自动报工
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="AUTO_REPORT_ON_FINISH", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getAutoReportOnFinish() {
		return autoReportOnFinish;
	}
	/**
	 * 设置完成后自动报工.
	 * @param autoReportOnFinish 完成后自动报工
	 */
	public void setAutoReportOnFinish(SystemCode autoReportOnFinish) {
		this.autoReportOnFinish = (SystemCode) autoReportOnFinish;
	}
	/**
	 * 获取启用EBR.
	 * 
	 * @return 启用EBR
	 */
	@Column(nullable=true

		,name="EBR"
	)
    public Boolean getEbr() {
        return null == ebr ? false : ebr;
    }
	/**
	 * 设置启用EBR.
	 * @param ebr 启用EBR
	 */
    public void setEbr(Boolean ebr) {
        this.ebr = ebr;
    }
	@ManyToOne
	@JoinColumn(name = "FORMULA_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormula getLfformulaId() {
        return lfformulaId;
    }
    public void setLfformulaId(RMFormula lfformulaId) {
        this.lfformulaId = lfformulaId;
    }
	@ManyToOne
	@JoinColumn(name = "LINE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicFactoryModel getLflineId() {
        return lflineId;
    }
    public void setLflineId(MESBasicFactoryModel lflineId) {
        this.lflineId = lflineId;
    }
	/**
	 * 获取标准时长.
	 * 
	 * @return 标准时长
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LONG_TIME"
	)
    public java.math.BigDecimal getLongTime() {
        return longTime;
    }
	/**
	 * 设置标准时长.
	 * @param longTime 标准时长
	 */
    public void setLongTime(java.math.BigDecimal longTime) {
        this.longTime = longTime;
    }
	/**
	 * 获取最大产能.
	 * 
	 * @return 最大产能
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="MAX_CAPACITY"
	)
    public java.math.BigDecimal getMaxCapacity() {
        return maxCapacity;
    }
	/**
	 * 设置最大产能.
	 * @param maxCapacity 最大产能
	 */
    public void setMaxCapacity(java.math.BigDecimal maxCapacity) {
        this.maxCapacity = maxCapacity;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true
		,length=2000

		,name="MENO"
	)
    @javax.persistence.Lob
    public String getMeno() {
        return meno;
    }
	/**
	 * 设置备注.
	 * @param meno 备注
	 */
    public void setMeno(String meno) {
        this.meno = meno;
    }
	/**
	 * 获取临时id.
	 * 
	 * @return 临时id
	 */
	@Column(nullable=true

		,length = 256
		,name="TEMP_ID"
	)
    public String getTempId() {
        return tempId;
    }
	/**
	 * 设置临时id.
	 * @param tempId 临时id
	 */
    public void setTempId(String tempId) {
        this.tempId = tempId;
    }
	/**
	 * 获取理论收率.
	 * 
	 * @return 理论收率
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="THEORE_YIELD"
	)
    public java.math.BigDecimal getTheoreYield() {
        return theoreYield;
    }
	/**
	 * 设置理论收率.
	 * @param theoreYield 理论收率
	 */
    public void setTheoreYield(java.math.BigDecimal theoreYield) {
        this.theoreYield = theoreYield;
    }
	
	
	protected String _getEntityName() {
		return RMForLineFormula.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_formula_ForLineFormula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
