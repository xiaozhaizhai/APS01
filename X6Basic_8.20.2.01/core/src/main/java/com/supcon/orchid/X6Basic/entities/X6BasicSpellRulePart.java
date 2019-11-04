package com.supcon.orchid.X6Basic.entities;

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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 班次明细.
 */
@javax.persistence.Entity(name=X6BasicSpellRulePart.JPA_NAME)
@Table(name = X6BasicSpellRulePart.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_spellRule")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_spellRule_SpellRulePart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "SRP_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_spellRule_SpellRulePart,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicSpellRulePartConvertor.class})
public class X6BasicSpellRulePart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_spellRule";
	public static final String MODEL_CODE = "X6Basic_1.0_spellRule_SpellRulePart";
	public static final String DOC_TYPE = "X6Basic_spellRule_spellRulePart";
	public static final String TABLE_NAME = "s2base_spellrulepart";
	public static final String JPA_NAME = "X6BasicSpellRulePart";


		private String endTime ; // 结束时间
	private X6BasicSpellRule spellRule;


		private String srpMemo ; // 备注


		private String startTime ; // 开始时间
	@BAPIsMainDisplay

		private String teamOrder ; // 班次
	
	
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
	 * 获取结束时间.
	 * 
	 * @return 结束时间
	 */
	@Column(

		length = 256
		,name="SRP_ENDTIME"
	)
    public String getEndTime() {
        return endTime;
    }
	/**
	 * 设置结束时间.
	 * @param endTime 结束时间
	 */
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
	@ManyToOne
	@JoinColumn(name = "SRP_RULEID", referencedColumnName="SR_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicSpellRule getSpellRule() {
        return spellRule;
    }
    public void setSpellRule(X6BasicSpellRule spellRule) {
        this.spellRule = spellRule;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="SRP_MEMO"
	)
    @javax.persistence.Lob
    public String getSrpMemo() {
        return srpMemo;
    }
	/**
	 * 设置备注.
	 * @param srpMemo 备注
	 */
    public void setSrpMemo(String srpMemo) {
        this.srpMemo = srpMemo;
    }
	/**
	 * 获取开始时间.
	 * 
	 * @return 开始时间
	 */
	@Column(

		length = 256
		,name="SRP_STARTTIME"
	)
    public String getStartTime() {
        return startTime;
    }
	/**
	 * 设置开始时间.
	 * @param startTime 开始时间
	 */
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }
	/**
	 * 获取班次.
	 * 
	 * @return 班次
	 */
	@Column(

		length = 256
		,name="SRP_TEAMORDER"
	)
    public String getTeamOrder() {
        return teamOrder;
    }
	/**
	 * 设置班次.
	 * @param teamOrder 班次
	 */
    public void setTeamOrder(String teamOrder) {
        this.teamOrder = teamOrder;
    }
	
	
	protected String _getEntityName() {
		return X6BasicSpellRulePart.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_spellRule_SpellRulePart,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
