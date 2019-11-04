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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 开关量.
 */
@javax.persistence.Entity(name=MESBasicSwitcherModel.JPA_NAME)
@Table(name = MESBasicSwitcherModel.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_routine")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_routine_SwitcherModel")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_routine_SwitcherModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicSwitcherModelConvertor.class})
public class MESBasicSwitcherModel extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_routine";
	public static final String MODEL_CODE = "MESBasic_1_routine_SwitcherModel";
	public static final String DOC_TYPE = "MESBasic_routine_switcherModel";
	public static final String TABLE_NAME = "mesbasic_switcher_models";
	public static final String JPA_NAME = "MESBasicSwitcherModel";

		private Boolean backword = 
			Boolean.valueOf("true")
		; // 反向, 
	private MESBasicRoutine config;

		private Boolean forword = 
			Boolean.valueOf("true")
		; // 正向, 
	private SystemCode stype
; // 类型
	private MESBasicItemSetup switcher;
	
	
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
	 * 获取反向.
	 * 
	 * @return 反向
	 */
	@Column(nullable=true

		,name="BACKWORD"
	)
    public Boolean getBackword() {
        return null == backword ? false : backword;
    }
	/**
	 * 设置反向.
	 * @param backword 反向
	 */
    public void setBackword(Boolean backword) {
        this.backword = backword;
    }
	@ManyToOne
	@JoinColumn(name = "CONFIG", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicRoutine getConfig() {
        return config;
    }
    public void setConfig(MESBasicRoutine config) {
        this.config = config;
    }
	/**
	 * 获取正向.
	 * 
	 * @return 正向
	 */
	@Column(nullable=true

		,name="FORWORD"
	)
    public Boolean getForword() {
        return null == forword ? false : forword;
    }
	/**
	 * 设置正向.
	 * @param forword 正向
	 */
    public void setForword(Boolean forword) {
        this.forword = forword;
    }
	/**
	 * 获取类型.
	 * 
	 * @return 类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="STYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getStype() {
		return stype;
	}
	/**
	 * 设置类型.
	 * @param stype 类型
	 */
	public void setStype(SystemCode stype) {
		this.stype = (SystemCode) stype;
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
		return MESBasicSwitcherModel.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_routine_SwitcherModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
