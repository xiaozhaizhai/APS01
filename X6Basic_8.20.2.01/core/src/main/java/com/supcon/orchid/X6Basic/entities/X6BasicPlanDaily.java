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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 排班结果.
 */
@javax.persistence.Entity(name=X6BasicPlanDaily.JPA_NAME)
@Table(name = X6BasicPlanDaily.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_rangePlan")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_rangePlan_PlanDaily")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "RPD_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_rangePlan_PlanDaily,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicPlanDailyConvertor.class})
public class X6BasicPlanDaily extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_rangePlan";
	public static final String MODEL_CODE = "X6Basic_1.0_rangePlan_PlanDaily";
	public static final String DOC_TYPE = "X6Basic_rangePlan_planDaily";
	public static final String TABLE_NAME = "s2base_rangeplandaily";
	public static final String JPA_NAME = "X6BasicPlanDaily";

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 结束时间


		private Long factory ; // X6Basic.propertydisplayName.randon1512543328302

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date rangeDate ; // 排班日期


		private Integer rangePlanId ; // 排班计划
	private X6BasicRangePlanPart rangePlanPart;


		private String rpdMemo ; // 备注
	private X6BasicSpellRule rule;
	private X6BasicSpellRulePart rulePart;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 开始时间
	private X6BasicTeamInfo team;
	@BAPSeniorSystemCode(code="WorkArea")
	private String workLine
; // 作业区
	private String workLineForDisplay;
	
	
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
	@Column(nullable=true

		,name="RPD_ENDTIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getEndTime() {
        return endTime;
    }
	/**
	 * 设置结束时间.
	 * @param endTime 结束时间
	 */
    public void setEndTime(java.util.Date endTime) {
        this.endTime = endTime;
    }
	/**
	 * 获取X6Basic.propertydisplayName.randon1512543328302.
	 * 
	 * @return X6Basic.propertydisplayName.randon1512543328302
	 */
	@Column(nullable=true

		,name="WORKLINE"
	)
    public Long getFactory() {
        return factory;
    }
	/**
	 * 设置X6Basic.propertydisplayName.randon1512543328302.
	 * @param factory X6Basic.propertydisplayName.randon1512543328302
	 */
    public void setFactory(Long factory) {
        this.factory = factory;
    }
	/**
	 * 获取排班日期.
	 * 
	 * @return 排班日期
	 */
	@Column(

		name="RPD_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getRangeDate() {
        return rangeDate;
    }
	/**
	 * 设置排班日期.
	 * @param rangeDate 排班日期
	 */
    public void setRangeDate(java.util.Date rangeDate) {
        this.rangeDate = rangeDate;
    }
	/**
	 * 获取排班计划.
	 * 
	 * @return 排班计划
	 */
	@Column(

		name="RPD_PLANID"
	)
    public Integer getRangePlanId() {
        return rangePlanId;
    }
	/**
	 * 设置排班计划.
	 * @param rangePlanId 排班计划
	 */
    public void setRangePlanId(Integer rangePlanId) {
        this.rangePlanId = rangePlanId;
    }
	@OneToOne
	@JoinColumn(name = "RPD_PARTID", referencedColumnName="RPP_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicRangePlanPart getRangePlanPart() {
        return rangePlanPart;
    }
    public void setRangePlanPart(X6BasicRangePlanPart rangePlanPart) {
        this.rangePlanPart = rangePlanPart;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="RPD_MEMO"
	)
    @javax.persistence.Lob
    public String getRpdMemo() {
        return rpdMemo;
    }
	/**
	 * 设置备注.
	 * @param rpdMemo 备注
	 */
    public void setRpdMemo(String rpdMemo) {
        this.rpdMemo = rpdMemo;
    }
	@OneToOne
	@JoinColumn(name = "RPD_RULEID", referencedColumnName="SR_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicSpellRule getRule() {
        return rule;
    }
    public void setRule(X6BasicSpellRule rule) {
        this.rule = rule;
    }
	@OneToOne
	@JoinColumn(name = "RPD_RULEPARTID", referencedColumnName="SRP_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicSpellRulePart getRulePart() {
        return rulePart;
    }
    public void setRulePart(X6BasicSpellRulePart rulePart) {
        this.rulePart = rulePart;
    }
	/**
	 * 获取开始时间.
	 * 
	 * @return 开始时间
	 */
	@Column(nullable=true

		,name="RPD_STARTTIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getStartTime() {
        return startTime;
    }
	/**
	 * 设置开始时间.
	 * @param startTime 开始时间
	 */
    public void setStartTime(java.util.Date startTime) {
        this.startTime = startTime;
    }
	@OneToOne
	@JoinColumn(name = "RPD_TEAMID", referencedColumnName="TEAM_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicTeamInfo getTeam() {
        return team;
    }
    public void setTeam(X6BasicTeamInfo team) {
        this.team = team;
    }
	/**
	 * 获取作业区.
	 * 
	 * @return 作业区
	 */
	@Column(name="RPD_WORKLINE")
	public String getWorkLine() {
		return workLine;
	}
	/**
	 * 设置作业区.
	 * @param workLine 作业区
	 */
	public void setWorkLine(String workLine) {
		this.workLine = workLine;
	}
	
	@javax.persistence.Transient
	public String getWorkLineForDisplay() {
		return workLineForDisplay;
	}
	
	public void setWorkLineForDisplay(String workLineForDisplay) {
		this.workLineForDisplay = workLineForDisplay;
	}
	
	
	protected String _getEntityName() {
		return X6BasicPlanDaily.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_rangePlan_PlanDaily,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
