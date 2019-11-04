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
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 路径配置.
 * 配置路径上的仪表、阀门、泵等等
 */
@javax.persistence.Entity(name=MESBasicConfig.JPA_NAME)
@Table(name = MESBasicConfig.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_routine")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_routine_Config")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="STATUS", column=@Column(name = "STATUS")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_routine_Config,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MESBasicConfigConvertor.class})
public class MESBasicConfig extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_routine";
	public static final String MODEL_CODE = "MESBasic_1_routine_Config";
	public static final String DOC_TYPE = "MESBasic_routine_config";
	public static final String TABLE_NAME = "mesbasic_configs";
	public static final String JPA_NAME = "MESBasicConfig";


		private Boolean forDestination = false; // 用于目的


		private String formula ; // 计算公式

		private Boolean forSource = 
			Boolean.valueOf("true")
		; // 用于源, 

		private Boolean isDefault = 
			Boolean.valueOf("true")
		; // 默认计量, 


		private Boolean keyAmount = false; // 关键数据


		private java.math.BigDecimal maxAggValue ; // 最大有效累积量
	private SystemCode measurement
; // 赋值方式
	private MESBasicItemSetup meter;
	@BAPIsMainDisplay

		private String name ; // 名称
	private MESBasicItemSetup pump;
	private SystemCode pumpBelong
; // 泵归属
	private MESBasicRoutine routine;
	private MESBasicItemSetup switcher;


		private String tankCode ; // 容器编码


		private String testFormula ; // 模拟公式
	
	
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
	 * 获取用于目的.
	 * 
	 * @return 用于目的
	 */
	@Column(nullable=true

		,name="FOR_DESTINATION"
	)
    public Boolean getForDestination() {
        return null == forDestination ? false : forDestination;
    }
	/**
	 * 设置用于目的.
	 * @param forDestination 用于目的
	 */
    public void setForDestination(Boolean forDestination) {
        this.forDestination = forDestination;
    }
	/**
	 * 获取计算公式.
	 * 批次管理中，路径上的每一个配置信息的值的获取方式，是通过该计算公式计算得到的，并不是直接从测点上获取的数值。
	 * @return 计算公式
	 */
	@Column(nullable=true

		,length = 2000
		,name="FORMULA"
	)
    public String getFormula() {
        return formula;
    }
	/**
	 * 设置计算公式.
	 * @param formula 计算公式
	 */
    public void setFormula(String formula) {
        this.formula = formula;
    }
	/**
	 * 获取用于源.
	 * 
	 * @return 用于源
	 */
	@Column(nullable=true

		,name="FOR_SOURCE"
	)
    public Boolean getForSource() {
        return null == forSource ? false : forSource;
    }
	/**
	 * 设置用于源.
	 * @param forSource 用于源
	 */
    public void setForSource(Boolean forSource) {
        this.forSource = forSource;
    }
	/**
	 * 获取默认计量.
	 * 
	 * @return 默认计量
	 */
	@Column(nullable=true

		,name="IS_DEFAULT"
	)
    public Boolean getIsDefault() {
        return null == isDefault ? false : isDefault;
    }
	/**
	 * 设置默认计量.
	 * @param isDefault 默认计量
	 */
    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }
	/**
	 * 获取关键数据.
	 * 
	 * @return 关键数据
	 */
	@Column(nullable=true

		,name="KEY_AMOUNT"
	)
    public Boolean getKeyAmount() {
        return null == keyAmount ? false : keyAmount;
    }
	/**
	 * 设置关键数据.
	 * @param keyAmount 关键数据
	 */
    public void setKeyAmount(Boolean keyAmount) {
        this.keyAmount = keyAmount;
    }
	/**
	 * 获取最大有效累积量.
	 * 如果该仪表生成记录的时候，累计值大于最大有效值，则在具体业务中可能会采用其他计量。例如在罐区管理中，如果该值达到最大有效值，则出罐/入罐量就会采用液位计来计量
	 * @return 最大有效累积量
	 */
	@Column(nullable=true
			,precision=19,scale=4
		,name="MAX_AGG_VALUE"
	)
    public java.math.BigDecimal getMaxAggValue() {
        return maxAggValue;
    }
	/**
	 * 设置最大有效累积量.
	 * @param maxAggValue 最大有效累积量
	 */
    public void setMaxAggValue(java.math.BigDecimal maxAggValue) {
        this.maxAggValue = maxAggValue;
    }
	/**
	 * 获取赋值方式.
	 * 
	 * @return 赋值方式
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="MEASUREMENT", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getMeasurement() {
		return measurement;
	}
	/**
	 * 设置赋值方式.
	 * @param measurement 赋值方式
	 */
	public void setMeasurement(SystemCode measurement) {
		this.measurement = (SystemCode) measurement;
	}
	@OneToOne
	@JoinColumn(name = "METER", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getMeter() {
        return meter;
    }
    public void setMeter(MESBasicItemSetup meter) {
        this.meter = meter;
    }
	/**
	 * 获取名称.
	 * 
	 * @return 名称
	 */
	@Column(nullable=true

		,length = 200
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置名称.
	 * @param name 名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	@OneToOne
	@JoinColumn(name = "PUMP", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicItemSetup getPump() {
        return pump;
    }
    public void setPump(MESBasicItemSetup pump) {
        this.pump = pump;
    }
	/**
	 * 获取泵归属.
	 * 
	 * @return 泵归属
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PUMP_BELONG", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getPumpBelong() {
		return pumpBelong;
	}
	/**
	 * 设置泵归属.
	 * @param pumpBelong 泵归属
	 */
	public void setPumpBelong(SystemCode pumpBelong) {
		this.pumpBelong = (SystemCode) pumpBelong;
	}
	@ManyToOne
	@JoinColumn(name = "ROUTINE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicRoutine getRoutine() {
        return routine;
    }
    public void setRoutine(MESBasicRoutine routine) {
        this.routine = routine;
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
	/**
	 * 获取容器编码.
	 * 
	 * @return 容器编码
	 */
	@Column(nullable=true

		,length = 256
		,name="TANK_CODE"
	)
    public String getTankCode() {
        return tankCode;
    }
	/**
	 * 设置容器编码.
	 * @param tankCode 容器编码
	 */
    public void setTankCode(String tankCode) {
        this.tankCode = tankCode;
    }
	/**
	 * 获取模拟公式.
	 * 批次非真实环境适用公式
	 * @return 模拟公式
	 */
	@Column(nullable=true

		,length = 200
		,name="TEST_FORMULA"
	)
    public String getTestFormula() {
        return testFormula;
    }
	/**
	 * 设置模拟公式.
	 * @param testFormula 模拟公式
	 */
    public void setTestFormula(String testFormula) {
        this.testFormula = testFormula;
    }
	
	
	protected String _getEntityName() {
		return MESBasicConfig.class.getName();
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
	/* CUSTOM CODE START(entity,functions,MESBasic_1_routine_Config,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}
