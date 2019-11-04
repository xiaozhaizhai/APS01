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
import com.supcon.orchid.publicSet.entities.PublicSetActBatState;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产活动与批状态.
 */
@javax.persistence.Entity(name=WOMProActAndBatState.JPA_NAME)
@Table(name = WOMProActAndBatState.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_proActiveAndBatchState")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState")
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
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMProActAndBatStateConvertor.class})
public class WOMProActAndBatState extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_proActiveAndBatchState";
	public static final String MODEL_CODE = "WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState";
	public static final String DOC_TYPE = "WOM_proActiveAndBatchState_proActAndBatState";
	public static final String TABLE_NAME = "wom_pro_act_and_bat_states";
	public static final String JPA_NAME = "WOMProActAndBatState";
	private PublicSetActBatState activeBatchStateID;
	private SystemCode activeEnd
; // 活动结束


		private Boolean qualifiedPass = false; // 合格放行意见


		private Boolean quaWithoutPass = false; // 合格且无需放行


		private Boolean regectsDeal = false; // 不良品处理意见


		private String remark ; // 备注
	
	
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
	@JoinColumn(name = "ACTIVE_BATCH_STATEID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public PublicSetActBatState getActiveBatchStateID() {
        return activeBatchStateID;
    }
    public void setActiveBatchStateID(PublicSetActBatState activeBatchStateID) {
        this.activeBatchStateID = activeBatchStateID;
    }
	/**
	 * 获取活动结束.
	 * 
	 * @return 活动结束
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ACTIVE_END", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getActiveEnd() {
		return activeEnd;
	}
	/**
	 * 设置活动结束.
	 * @param activeEnd 活动结束
	 */
	public void setActiveEnd(SystemCode activeEnd) {
		this.activeEnd = (SystemCode) activeEnd;
	}
	/**
	 * 获取合格放行意见.
	 * 
	 * @return 合格放行意见
	 */
	@Column(nullable=true

		,name="QUALIFIED_PASS"
	)
    public Boolean getQualifiedPass() {
        return null == qualifiedPass ? false : qualifiedPass;
    }
	/**
	 * 设置合格放行意见.
	 * @param qualifiedPass 合格放行意见
	 */
    public void setQualifiedPass(Boolean qualifiedPass) {
        this.qualifiedPass = qualifiedPass;
    }
	/**
	 * 获取合格且无需放行.
	 * 
	 * @return 合格且无需放行
	 */
	@Column(nullable=true

		,name="QUA_WITHOUT_PASS"
	)
    public Boolean getQuaWithoutPass() {
        return null == quaWithoutPass ? false : quaWithoutPass;
    }
	/**
	 * 设置合格且无需放行.
	 * @param quaWithoutPass 合格且无需放行
	 */
    public void setQuaWithoutPass(Boolean quaWithoutPass) {
        this.quaWithoutPass = quaWithoutPass;
    }
	/**
	 * 获取不良品处理意见.
	 * 
	 * @return 不良品处理意见
	 */
	@Column(nullable=true

		,name="REGECTS_DEAL"
	)
    public Boolean getRegectsDeal() {
        return null == regectsDeal ? false : regectsDeal;
    }
	/**
	 * 设置不良品处理意见.
	 * @param regectsDeal 不良品处理意见
	 */
    public void setRegectsDeal(Boolean regectsDeal) {
        this.regectsDeal = regectsDeal;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true

		,length = 2000
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
	
	
	protected String _getEntityName() {
		return WOMProActAndBatState.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
