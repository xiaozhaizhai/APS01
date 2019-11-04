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
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 位号数据统计.
 */
@javax.persistence.Entity(name=MESBasicItemRecord.JPA_NAME)
@Table(name = MESBasicItemRecord.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_itemRecord")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_itemRecord_ItemRecord")
@AttributeOverrides({
		@AttributeOverride(name="createStaffId", column=@Column(name = "CREATE_STAFF_ID")),
		@AttributeOverride(name="createTime", column=@Column(name = "CREATE_TIME")),
		@AttributeOverride(name="deleteStaffId", column=@Column(name = "DELETE_STAFF_ID")),
		@AttributeOverride(name="deleteTime", column=@Column(name = "DELETE_TIME")),
		@AttributeOverride(name="effectStaffId", column=@Column(name = "EFFECT_STAFF_ID")),
		@AttributeOverride(name="effectTime", column=@Column(name = "EFFECT_TIME")),
		@AttributeOverride(name="extraCol", column=@Column(name = "EXTRA_COL")),
		@AttributeOverride(name="id", column=@Column(name = "IR_ID")),
		@AttributeOverride(name="modifyStaffId", column=@Column(name = "MODIFY_STAFF_ID")),
		@AttributeOverride(name="modifyTime", column=@Column(name = "MODIFY_TIME")),
		@AttributeOverride(name="ownerDepartmentId", column=@Column(name = "OWNER_DEPARTMENT_ID")),
		@AttributeOverride(name="ownerPositionId", column=@Column(name = "OWNER_POSITION_ID")),
		@AttributeOverride(name="ownerStaffId", column=@Column(name = "OWNER_STAFF_ID")),
		@AttributeOverride(name="status", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicItemRecordConvertor.class})
public class MESBasicItemRecord extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_itemRecord";
	public static final String MODEL_CODE = "MESBasic_1_itemRecord_ItemRecord";
	public static final String DOC_TYPE = "MESBasic_itemRecord_itemRecord";
	public static final String TABLE_NAME = "pellet_itemrecord";
	public static final String JPA_NAME = "MESBasicItemRecord";


		private java.math.BigDecimal averageValue ; // 平均值


		private java.math.BigDecimal balanceValue ; // 平衡值


		private Integer count ; // 记录条数
	private X6BasicPlanDaily daily;


		private String itemNumber ; // 位号


		private java.math.BigDecimal maxValue ; // 最大值


		private java.math.BigDecimal minValue ; // 最小值


		private String planNo ; // 计划编号


		private java.math.BigDecimal realValue ; // 瞬时值


		private Boolean reaultValue = false; // 质检结果

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date recordDate ; // 记录日期

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date recordTime ; // 记录时间
	private X6BasicTeamInfo team;


		private java.math.BigDecimal totalValue ; // 累计值
	@BAPSeniorSystemCode(code="WorkArea")
	private String workLine
; // 作业区
	private String workLineForDisplay;


		private Integer zoneMonth ; // 分区字段
	
	
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
	 * 获取平均值.
	 * 
	 * @return 平均值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="IR_AVERAGEVALUE"
	)
    public java.math.BigDecimal getAverageValue() {
        return averageValue;
    }
	/**
	 * 设置平均值.
	 * @param averageValue 平均值
	 */
    public void setAverageValue(java.math.BigDecimal averageValue) {
        this.averageValue = averageValue;
    }
	/**
	 * 获取平衡值.
	 * 
	 * @return 平衡值
	 */
	@Column(nullable=true
			,precision=19,scale=2
		,name="IR_TOTALVALUE_BALANCE"
	)
    public java.math.BigDecimal getBalanceValue() {
        return balanceValue;
    }
	/**
	 * 设置平衡值.
	 * @param balanceValue 平衡值
	 */
    public void setBalanceValue(java.math.BigDecimal balanceValue) {
        this.balanceValue = balanceValue;
    }
	/**
	 * 获取记录条数.
	 * 
	 * @return 记录条数
	 */
	@Column(nullable=true

		,name="IR_COUNT"
	)
    public Integer getCount() {
        return count;
    }
	/**
	 * 设置记录条数.
	 * @param count 记录条数
	 */
    public void setCount(Integer count) {
        this.count = count;
    }
	@OneToOne
	@JoinColumn(name = "IR_DAILYID", referencedColumnName="RPD_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicPlanDaily getDaily() {
        return daily;
    }
    public void setDaily(X6BasicPlanDaily daily) {
        this.daily = daily;
    }
	/**
	 * 获取位号.
	 * 
	 * @return 位号
	 */
	@Column(nullable=true

		,length = 200
		,name="IR_ITEMNUMBER"
	)
    public String getItemNumber() {
        return itemNumber;
    }
	/**
	 * 设置位号.
	 * @param itemNumber 位号
	 */
    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
    }
	/**
	 * 获取最大值.
	 * 
	 * @return 最大值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="IR_MAXVALUE"
	)
    public java.math.BigDecimal getMaxValue() {
        return maxValue;
    }
	/**
	 * 设置最大值.
	 * @param maxValue 最大值
	 */
    public void setMaxValue(java.math.BigDecimal maxValue) {
        this.maxValue = maxValue;
    }
	/**
	 * 获取最小值.
	 * 
	 * @return 最小值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="IR_MINVALUE"
	)
    public java.math.BigDecimal getMinValue() {
        return minValue;
    }
	/**
	 * 设置最小值.
	 * @param minValue 最小值
	 */
    public void setMinValue(java.math.BigDecimal minValue) {
        this.minValue = minValue;
    }
	/**
	 * 获取计划编号.
	 * 
	 * @return 计划编号
	 */
	@Column(nullable=true

		,length = 200
		,name="IR_PLANNO"
	)
    public String getPlanNo() {
        return planNo;
    }
	/**
	 * 设置计划编号.
	 * @param planNo 计划编号
	 */
    public void setPlanNo(String planNo) {
        this.planNo = planNo;
    }
	/**
	 * 获取瞬时值.
	 * 
	 * @return 瞬时值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="IR_REALVALUE"
	)
    public java.math.BigDecimal getRealValue() {
        return realValue;
    }
	/**
	 * 设置瞬时值.
	 * @param realValue 瞬时值
	 */
    public void setRealValue(java.math.BigDecimal realValue) {
        this.realValue = realValue;
    }
	/**
	 * 获取质检结果.
	 * 
	 * @return 质检结果
	 */
	@Column(nullable=true

		,name="IR_RESULTVALUE"
	)
    public Boolean getReaultValue() {
        return null == reaultValue ? false : reaultValue;
    }
	/**
	 * 设置质检结果.
	 * @param reaultValue 质检结果
	 */
    public void setReaultValue(Boolean reaultValue) {
        this.reaultValue = reaultValue;
    }
	/**
	 * 获取记录日期.
	 * 
	 * @return 记录日期
	 */
	@Column(nullable=true

		,name="IR_RECORDDATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.DATE)
    public java.util.Date getRecordDate() {
        return recordDate;
    }
	/**
	 * 设置记录日期.
	 * @param recordDate 记录日期
	 */
    public void setRecordDate(java.util.Date recordDate) {
        this.recordDate = recordDate;
    }
	/**
	 * 获取记录时间.
	 * 
	 * @return 记录时间
	 */
	@Column(nullable=true

		,name="IR_RECORDTIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getRecordTime() {
        return recordTime;
    }
	/**
	 * 设置记录时间.
	 * @param recordTime 记录时间
	 */
    public void setRecordTime(java.util.Date recordTime) {
        this.recordTime = recordTime;
    }
	@OneToOne
	@JoinColumn(name = "IR_TEAMID", referencedColumnName="TEAM_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public X6BasicTeamInfo getTeam() {
        return team;
    }
    public void setTeam(X6BasicTeamInfo team) {
        this.team = team;
    }
	/**
	 * 获取累计值.
	 * 
	 * @return 累计值
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="IR_TOTALVALUE"
	)
    public java.math.BigDecimal getTotalValue() {
        return totalValue;
    }
	/**
	 * 设置累计值.
	 * @param totalValue 累计值
	 */
    public void setTotalValue(java.math.BigDecimal totalValue) {
        this.totalValue = totalValue;
    }
	/**
	 * 获取作业区.
	 * 
	 * @return 作业区
	 */
	@Column(name="IR_WORKLINE")
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
	/**
	 * 获取分区字段.
	 * 分区字段，记录年月
	 * @return 分区字段
	 */
	@Column(nullable=true

		,name="IR_ZONEMONTH"
	)
    public Integer getZoneMonth() {
        return zoneMonth;
    }
	/**
	 * 设置分区字段.
	 * @param zoneMonth 分区字段
	 */
    public void setZoneMonth(Integer zoneMonth) {
        this.zoneMonth = zoneMonth;
    }
	
	
	protected String _getEntityName() {
		return MESBasicItemRecord.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
