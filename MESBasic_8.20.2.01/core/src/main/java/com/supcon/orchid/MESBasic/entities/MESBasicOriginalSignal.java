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
 * 检测信号表.
 */
@javax.persistence.Entity(name=MESBasicOriginalSignal.JPA_NAME)
@Table(name = MESBasicOriginalSignal.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_originalSignal")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_originalSignal_OriginalSignal")
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
		@AttributeOverride(name="valid", column=@Column(name = "VALID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_originalSignal_OriginalSignal,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicOriginalSignalConvertor.class})
public class MESBasicOriginalSignal extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_originalSignal";
	public static final String MODEL_CODE = "MESBasic_1_originalSignal_OriginalSignal";
	public static final String DOC_TYPE = "MESBasic_originalSignal_originalSignal";
	public static final String TABLE_NAME = "mesbasic_original_signals";
	public static final String JPA_NAME = "MESBasicOriginalSignal";


		private String col1 ; // 列1


		private Long col2 ; // 列2


		private Long col3 ; // 列3


		private String flag ; // 特征字段


		private String fv ; // FV


		private Integer mark ; // 处理标记

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date occurTime ; // 时间


		private String qc ; // 质量变化


		private Long quality ; // 质量码
	private SystemCode source
; // 来源


		private String tagName ; // 位号名


		private Long tagType ; // 位号类型


		private String tvalue ; // 位号值
	
	
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
	 * 获取列1.
	 * 
	 * @return 列1
	 */
	@Column(nullable=true

		,length = 100
		,name="COL1"
	)
    public String getCol1() {
        return col1;
    }
	/**
	 * 设置列1.
	 * @param col1 列1
	 */
    public void setCol1(String col1) {
        this.col1 = col1;
    }
	/**
	 * 获取列2.
	 * 
	 * @return 列2
	 */
	@Column(nullable=true

		,name="COL2"
	)
    public Long getCol2() {
        return col2;
    }
	/**
	 * 设置列2.
	 * @param col2 列2
	 */
    public void setCol2(Long col2) {
        this.col2 = col2;
    }
	/**
	 * 获取列3.
	 * 
	 * @return 列3
	 */
	@Column(nullable=true

		,name="COL3"
	)
    public Long getCol3() {
        return col3;
    }
	/**
	 * 设置列3.
	 * @param col3 列3
	 */
    public void setCol3(Long col3) {
        this.col3 = col3;
    }
	/**
	 * 获取特征字段.
	 * 
	 * @return 特征字段
	 */
	@Column(nullable=true

		,length = 50
		,name="FLAG"
	)
    public String getFlag() {
        return flag;
    }
	/**
	 * 设置特征字段.
	 * @param flag 特征字段
	 */
    public void setFlag(String flag) {
        this.flag = flag;
    }
	/**
	 * 获取FV.
	 * 
	 * @return FV
	 */
	@Column(nullable=true

		,length = 80
		,name="FV"
	)
    public String getFv() {
        return fv;
    }
	/**
	 * 设置FV.
	 * @param fv FV
	 */
    public void setFv(String fv) {
        this.fv = fv;
    }
	/**
	 * 获取处理标记.
	 * 
	 * @return 处理标记
	 */
	@Column(nullable=true

		,name="MARK"
	)
    public Integer getMark() {
        return mark;
    }
	/**
	 * 设置处理标记.
	 * @param mark 处理标记
	 */
    public void setMark(Integer mark) {
        this.mark = mark;
    }
	/**
	 * 获取时间.
	 * 
	 * @return 时间
	 */
	@Column(nullable=true

		,name="OCCUR_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getOccurTime() {
        return occurTime;
    }
	/**
	 * 设置时间.
	 * @param occurTime 时间
	 */
    public void setOccurTime(java.util.Date occurTime) {
        this.occurTime = occurTime;
    }
	/**
	 * 获取质量变化.
	 * 
	 * @return 质量变化
	 */
	@Column(nullable=true

		,length = 100
		,name="QC"
	)
    public String getQc() {
        return qc;
    }
	/**
	 * 设置质量变化.
	 * @param qc 质量变化
	 */
    public void setQc(String qc) {
        this.qc = qc;
    }
	/**
	 * 获取质量码.
	 * 
	 * @return 质量码
	 */
	@Column(nullable=true

		,name="QUALITY"
	)
    public Long getQuality() {
        return quality;
    }
	/**
	 * 设置质量码.
	 * @param quality 质量码
	 */
    public void setQuality(Long quality) {
        this.quality = quality;
    }
	/**
	 * 获取来源.
	 * 
	 * @return 来源
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="SOURCE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getSource() {
		return source;
	}
	/**
	 * 设置来源.
	 * @param source 来源
	 */
	public void setSource(SystemCode source) {
		this.source = (SystemCode) source;
	}
	/**
	 * 获取位号名.
	 * 
	 * @return 位号名
	 */
	@Column(nullable=true

		,length = 300
		,name="TAG_NAME"
	)
    public String getTagName() {
        return tagName;
    }
	/**
	 * 设置位号名.
	 * @param tagName 位号名
	 */
    public void setTagName(String tagName) {
        this.tagName = tagName;
    }
	/**
	 * 获取位号类型.
	 * 
	 * @return 位号类型
	 */
	@Column(nullable=true

		,name="TAG_TYPE"
	)
    public Long getTagType() {
        return tagType;
    }
	/**
	 * 设置位号类型.
	 * @param tagType 位号类型
	 */
    public void setTagType(Long tagType) {
        this.tagType = tagType;
    }
	/**
	 * 获取位号值.
	 * 
	 * @return 位号值
	 */
	@Column(nullable=true

		,length = 200
		,name="TVALUE"
	)
    public String getTvalue() {
        return tvalue;
    }
	/**
	 * 设置位号值.
	 * @param tvalue 位号值
	 */
    public void setTvalue(String tvalue) {
        this.tvalue = tvalue;
    }
	
	
	protected String _getEntityName() {
		return MESBasicOriginalSignal.class.getName();
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

	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_bigintparamc")
	private Integer bigintparamc;
	
	@Column
    public Integer getBigintparamc() {
        return bigintparamc;
    }
	
    public void setBigintparamc(Integer bigintparamc) {
        this.bigintparamc = bigintparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_bigintparamd")
	private Integer bigintparamd;
	
	@Column
    public Integer getBigintparamd() {
        return bigintparamd;
    }
	
    public void setBigintparamd(Integer bigintparamd) {
        this.bigintparamd = bigintparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_bigintparame")
	private Integer bigintparame;
	
	@Column
    public Integer getBigintparame() {
        return bigintparame;
    }
	
    public void setBigintparame(Integer bigintparame) {
        this.bigintparame = bigintparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_bigintparamf")
	private Integer bigintparamf;
	
	@Column
    public Integer getBigintparamf() {
        return bigintparamf;
    }
	
    public void setBigintparamf(Integer bigintparamf) {
        this.bigintparamf = bigintparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparamc")
	private String charparamc;
	
	@Column
    public String getCharparamc() {
        return charparamc;
    }
	
    public void setCharparamc(String charparamc) {
        this.charparamc = charparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparamd")
	private String charparamd;
	
	@Column
    public String getCharparamd() {
        return charparamd;
    }
	
    public void setCharparamd(String charparamd) {
        this.charparamd = charparamd;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparame")
	private String charparame;
	
	@Column
    public String getCharparame() {
        return charparame;
    }
	
    public void setCharparame(String charparame) {
        this.charparame = charparame;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparamf")
	private String charparamf;
	
	@Column
    public String getCharparamf() {
        return charparamf;
    }
	
    public void setCharparamf(String charparamf) {
        this.charparamf = charparamf;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparamg")
	private String charparamg;
	
	@Column
    public String getCharparamg() {
        return charparamg;
    }
	
    public void setCharparamg(String charparamg) {
        this.charparamg = charparamg;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_charparamh")
	private String charparamh;
	
	@Column
    public String getCharparamh() {
        return charparamh;
    }
	
    public void setCharparamh(String charparamh) {
        this.charparamh = charparamh;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_dateparamc")
	private java.util.Date dateparamc;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamc() {
        return dateparamc;
    }
	
    public void setDateparamc(java.util.Date dateparamc) {
        this.dateparamc = dateparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_numberparamc")
	private java.math.BigDecimal numberparamc;
	
	@Column
    public java.math.BigDecimal getNumberparamc() {
        return numberparamc;
    }
	
    public void setNumberparamc(java.math.BigDecimal numberparamc) {
        this.numberparamc = numberparamc;
    }
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_objparama", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_objparamb", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_objparamc", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_objparamd", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_scparama", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_scparamb", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_scparamc", complex = true)
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
	@BAPCustomComponent(code = "MESBasic_1_originalSignal_OriginalSignal_scparamd", complex = true)
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_originalSignal_OriginalSignal,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
