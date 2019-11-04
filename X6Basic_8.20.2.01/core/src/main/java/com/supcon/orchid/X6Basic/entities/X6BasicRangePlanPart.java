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
 * 排班明细.
 */
@javax.persistence.Entity(name=X6BasicRangePlanPart.JPA_NAME)
@Table(name = X6BasicRangePlanPart.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_rangePlan")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_rangePlan_RangePlanPart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "RPP_ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_rangePlan_RangePlanPart,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({X6BasicRangePlanPartConvertor.class})
public class X6BasicRangePlanPart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_rangePlan";
	public static final String MODEL_CODE = "X6Basic_1.0_rangePlan_RangePlanPart";
	public static final String DOC_TYPE = "X6Basic_rangePlan_rangePlanPart";
	public static final String TABLE_NAME = "s2base_rangeplanpart";
	public static final String JPA_NAME = "X6BasicRangePlanPart";


		private Integer orders ; // 顺序
	private X6BasicRangePlan rangePlan;


		private String rppMemo ; // 备注
	private X6BasicTeamInfo team;
	
	
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
	 * 获取顺序.
	 * 
	 * @return 顺序
	 */
	@Column(nullable=true

		,name="RPP_ORDER"
	)
    public Integer getOrders() {
        return orders;
    }
	/**
	 * 设置顺序.
	 * @param orders 顺序
	 */
    public void setOrders(Integer orders) {
        this.orders = orders;
    }
	@ManyToOne
	@JoinColumn(name = "RPP_PLANID", referencedColumnName="RP_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicRangePlan getRangePlan() {
        return rangePlan;
    }
    public void setRangePlan(X6BasicRangePlan rangePlan) {
        this.rangePlan = rangePlan;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,name="RPP_MEMO"
	)
    @javax.persistence.Lob
    public String getRppMemo() {
        return rppMemo;
    }
	/**
	 * 设置备注.
	 * @param rppMemo 备注
	 */
    public void setRppMemo(String rppMemo) {
        this.rppMemo = rppMemo;
    }
	@OneToOne
	@JoinColumn(name = "RPP_TEAMID", referencedColumnName="TEAM_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicTeamInfo getTeam() {
        return team;
    }
    public void setTeam(X6BasicTeamInfo team) {
        this.team = team;
    }
	
	
	protected String _getEntityName() {
		return X6BasicRangePlanPart.class.getName();
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_rangePlan_RangePlanPart,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
