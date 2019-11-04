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
import com.supcon.orchid.RM.entities.RMPrecessStandards;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 工艺标准.
 */
@javax.persistence.Entity(name=WOMCraftStandards.JPA_NAME)
@Table(name = WOMCraftStandards.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_procFeedback")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_procFeedback_CraftStandards")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_procFeedback_CraftStandards,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMCraftStandardsConvertor.class})
public class WOMCraftStandards extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_procFeedback";
	public static final String MODEL_CODE = "WOM_7.5.0.0_procFeedback_CraftStandards";
	public static final String DOC_TYPE = "WOM_procFeedback_craftStandards";
	public static final String TABLE_NAME = "wom_craft_standards";
	public static final String JPA_NAME = "WOMCraftStandards";
	private RMPrecessStandards craft;


		private String craftName ; // 工艺名称
	private WOMProcFeedbackHead procFeedbackID;


		private String remark ; // 备注


		private java.math.BigDecimal standardValue ; // 标准值
	
	
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
	@JoinColumn(name = "CRAFT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMPrecessStandards getCraft() {
        return craft;
    }
    public void setCraft(RMPrecessStandards craft) {
        this.craft = craft;
    }
	/**
	 * 获取工艺名称.
	 * 
	 * @return 工艺名称
	 */
	@Column(nullable=true

		,length = 256
		,name="CRAFT_NAME"
	)
    public String getCraftName() {
        return craftName;
    }
	/**
	 * 设置工艺名称.
	 * @param craftName 工艺名称
	 */
    public void setCraftName(String craftName) {
        this.craftName = craftName;
    }
	@ManyToOne
	@JoinColumn(name = "PROC_FEEDBACKID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProcFeedbackHead getProcFeedbackID() {
        return procFeedbackID;
    }
    public void setProcFeedbackID(WOMProcFeedbackHead procFeedbackID) {
        this.procFeedbackID = procFeedbackID;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 256
		,name="REMARK"
	)
    public String getRemark() {
        return remark;
    }
	/**
	 * 设置备注.
	 * @param remark 备注
	 */
    public void setRemark(String remark) {
        this.remark = remark;
    }
	/**
	 * 获取标准值.
	 * 
	 * @return 标准值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="STANDARD_VALUE"
	)
    public java.math.BigDecimal getStandardValue() {
        return standardValue;
    }
	/**
	 * 设置标准值.
	 * @param standardValue 标准值
	 */
    public void setStandardValue(java.math.BigDecimal standardValue) {
        this.standardValue = standardValue;
    }
	
	
	protected String _getEntityName() {
		return WOMCraftStandards.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_procFeedback_CraftStandards,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
