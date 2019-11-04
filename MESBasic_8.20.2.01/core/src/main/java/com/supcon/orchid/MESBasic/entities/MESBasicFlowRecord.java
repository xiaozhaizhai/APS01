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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 进出记录.
 * 用于显示当前储罐的进出罐记录，进出罐记录保存时就往这张表里插数据。
 */
@javax.persistence.Entity(name=MESBasicFlowRecord.JPA_NAME)
@Table(name = MESBasicFlowRecord.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_container")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_container_FlowRecord")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_container_FlowRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicFlowRecordConvertor.class})
public class MESBasicFlowRecord extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_container";
	public static final String MODEL_CODE = "MESBasic_1_container_FlowRecord";
	public static final String DOC_TYPE = "MESBasic_container_flowRecord";
	public static final String TABLE_NAME = "mesbasic_flow_records";
	public static final String JPA_NAME = "MESBasicFlowRecord";


		private String action ; // 进/出罐


		private String businessType ; // 业务类型
	private MESBasicContainer containerId;


		private String destination ; // 目的容器


		private String desType ; // 目的类型


		private java.math.BigDecimal endLevel ; // 结束液位(m)

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 结束时间


		private Long flowRecordId ; // 进出罐记录ID


		private java.math.BigDecimal gasVolume ; // 气体进/出罐体积(m³)


		private java.math.BigDecimal gasWeight ; // 气体进/出罐质量(t)


		private java.math.BigDecimal levelDiff ; // 液位差(m)


		private java.math.BigDecimal liquidVolume ; // 进/出罐体积(m³)


		private java.math.BigDecimal liquidWeight ; // 进/出罐重量(t)
	private MESBasicProduct productId;
	private MESBasicRoutine routineId;


		private String source ; // 源容器


		private String sourceType ; // 源类型


		private java.math.BigDecimal startLevel ; // 开始液位(m)

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date startTime ; // 开始时间
	
	
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
	 * 获取进/出罐.
	 * 
	 * @return 进/出罐
	 */
	@Column(nullable=true

		,length = 256
		,name="ACTION"
	)
    public String getAction() {
        return action;
    }
	/**
	 * 设置进/出罐.
	 * @param action 进/出罐
	 */
    public void setAction(String action) {
        this.action = action;
    }
	/**
	 * 获取业务类型.
	 * 
	 * @return 业务类型
	 */
	@Column(nullable=true

		,length = 256
		,name="BUSINESS_TYPE"
	)
    public String getBusinessType() {
        return businessType;
    }
	/**
	 * 设置业务类型.
	 * @param businessType 业务类型
	 */
    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }
	@ManyToOne
	@JoinColumn(name = "CONTAINER_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicContainer getContainerId() {
        return containerId;
    }
    public void setContainerId(MESBasicContainer containerId) {
        this.containerId = containerId;
    }
	/**
	 * 获取目的容器.
	 * 
	 * @return 目的容器
	 */
	@Column(nullable=true

		,length = 256
		,name="DESTINATION"
	)
    public String getDestination() {
        return destination;
    }
	/**
	 * 设置目的容器.
	 * @param destination 目的容器
	 */
    public void setDestination(String destination) {
        this.destination = destination;
    }
	/**
	 * 获取目的类型.
	 * 
	 * @return 目的类型
	 */
	@Column(nullable=true

		,length = 256
		,name="DES_TYPE"
	)
    public String getDesType() {
        return desType;
    }
	/**
	 * 设置目的类型.
	 * @param desType 目的类型
	 */
    public void setDesType(String desType) {
        this.desType = desType;
    }
	/**
	 * 获取结束液位(m).
	 * 
	 * @return 结束液位(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="END_LEVEL"
	)
    public java.math.BigDecimal getEndLevel() {
        return endLevel;
    }
	/**
	 * 设置结束液位(m).
	 * @param endLevel 结束液位(m)
	 */
    public void setEndLevel(java.math.BigDecimal endLevel) {
        this.endLevel = endLevel;
    }
	/**
	 * 获取结束时间.
	 * 
	 * @return 结束时间
	 */
	@Column(nullable=true

		,name="END_TIME"
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
	 * 获取进出罐记录ID.
	 * 
	 * @return 进出罐记录ID
	 */
	@Column(nullable=true

		,name="FLOW_RECORD_ID"
	)
    public Long getFlowRecordId() {
        return flowRecordId;
    }
	/**
	 * 设置进出罐记录ID.
	 * @param flowRecordId 进出罐记录ID
	 */
    public void setFlowRecordId(Long flowRecordId) {
        this.flowRecordId = flowRecordId;
    }
	/**
	 * 获取气体进/出罐体积(m³).
	 * 
	 * @return 气体进/出罐体积(m³)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="GAS_VOLUME"
	)
    public java.math.BigDecimal getGasVolume() {
        return gasVolume;
    }
	/**
	 * 设置气体进/出罐体积(m³).
	 * @param gasVolume 气体进/出罐体积(m³)
	 */
    public void setGasVolume(java.math.BigDecimal gasVolume) {
        this.gasVolume = gasVolume;
    }
	/**
	 * 获取气体进/出罐质量(t).
	 * 
	 * @return 气体进/出罐质量(t)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="GAS_WEIGHT"
	)
    public java.math.BigDecimal getGasWeight() {
        return gasWeight;
    }
	/**
	 * 设置气体进/出罐质量(t).
	 * @param gasWeight 气体进/出罐质量(t)
	 */
    public void setGasWeight(java.math.BigDecimal gasWeight) {
        this.gasWeight = gasWeight;
    }
	/**
	 * 获取液位差(m).
	 * 
	 * @return 液位差(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LEVEL_DIFF"
	)
    public java.math.BigDecimal getLevelDiff() {
        return levelDiff;
    }
	/**
	 * 设置液位差(m).
	 * @param levelDiff 液位差(m)
	 */
    public void setLevelDiff(java.math.BigDecimal levelDiff) {
        this.levelDiff = levelDiff;
    }
	/**
	 * 获取进/出罐体积(m³).
	 * 
	 * @return 进/出罐体积(m³)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LIQUID_VOLUME"
	)
    public java.math.BigDecimal getLiquidVolume() {
        return liquidVolume;
    }
	/**
	 * 设置进/出罐体积(m³).
	 * @param liquidVolume 进/出罐体积(m³)
	 */
    public void setLiquidVolume(java.math.BigDecimal liquidVolume) {
        this.liquidVolume = liquidVolume;
    }
	/**
	 * 获取进/出罐重量(t).
	 * 
	 * @return 进/出罐重量(t)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LIQUID_WEIGHT"
	)
    public java.math.BigDecimal getLiquidWeight() {
        return liquidWeight;
    }
	/**
	 * 设置进/出罐重量(t).
	 * @param liquidWeight 进/出罐重量(t)
	 */
    public void setLiquidWeight(java.math.BigDecimal liquidWeight) {
        this.liquidWeight = liquidWeight;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductId() {
        return productId;
    }
    public void setProductId(MESBasicProduct productId) {
        this.productId = productId;
    }
	@OneToOne
	@JoinColumn(name = "ROUTINE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicRoutine getRoutineId() {
        return routineId;
    }
    public void setRoutineId(MESBasicRoutine routineId) {
        this.routineId = routineId;
    }
	/**
	 * 获取源容器.
	 * 
	 * @return 源容器
	 */
	@Column(nullable=true

		,length = 256
		,name="SOURCE"
	)
    public String getSource() {
        return source;
    }
	/**
	 * 设置源容器.
	 * @param source 源容器
	 */
    public void setSource(String source) {
        this.source = source;
    }
	/**
	 * 获取源类型.
	 * 
	 * @return 源类型
	 */
	@Column(nullable=true

		,length = 256
		,name="SOURCE_TYPE"
	)
    public String getSourceType() {
        return sourceType;
    }
	/**
	 * 设置源类型.
	 * @param sourceType 源类型
	 */
    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }
	/**
	 * 获取开始液位(m).
	 * 
	 * @return 开始液位(m)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="START_LEVEL"
	)
    public java.math.BigDecimal getStartLevel() {
        return startLevel;
    }
	/**
	 * 设置开始液位(m).
	 * @param startLevel 开始液位(m)
	 */
    public void setStartLevel(java.math.BigDecimal startLevel) {
        this.startLevel = startLevel;
    }
	/**
	 * 获取开始时间.
	 * 
	 * @return 开始时间
	 */
	@Column(nullable=true

		,name="START_TIME"
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
	
	
	protected String _getEntityName() {
		return MESBasicFlowRecord.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_container_FlowRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
