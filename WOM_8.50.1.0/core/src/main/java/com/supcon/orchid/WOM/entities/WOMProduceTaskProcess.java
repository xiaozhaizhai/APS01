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
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;		
import com.supcon.orchid.RM.entities.RMFormula;		
import com.supcon.orchid.RM.entities.RMFormulaProcess;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.RM.entities.RMProcessType;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Document;
/**
 * 指令单工序.
 */
@javax.persistence.Entity(name=WOMProduceTaskProcess.JPA_NAME)
@Table(name = WOMProduceTaskProcess.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_ProduceTaskProcess")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_ProduceTaskProcess,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMProduceTaskProcessConvertor.class})
public class WOMProduceTaskProcess extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_ProduceTaskProcess";
	public static final String DOC_TYPE = "WOM_produceTask_produceTaskProcess";
	public static final String TABLE_NAME = "wom_produce_task_processes";
	public static final String JPA_NAME = "WOMProduceTaskProcess";


		private java.math.BigDecimal afterRatio ; // 投料比例(%)


		private String batchUnitID ; // 批控UnitID


		private java.math.BigDecimal beforeRatio ; // 前投料比例(%)

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date endTime ; // 结束时间


		private Integer exeOrder ; // 执行顺序
	private MESBasicFactoryModel factoryId;
	private RMFormula formulaId;
	private RMFormulaProcess formularProcess;
	private WOMProduceTask headId;


		private Boolean isFirstProcess = false; // 首道工序


		private Boolean isLastProcess = false; // 末道工序


		private java.math.BigDecimal longTime ; // 标准时长


		private String name ; // 工序名称
	private SystemCode processState
		= new SystemCode("processState/state01")
		; // 工序状态
	private RMProcessType processType;


		private String remark ; // 备注

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
	
	
	@Index(name="IDX_PRODUCETASKPROC_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取投料比例(%).
	 * 
	 * @return 投料比例(%)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="AFTER_RATIO"
	)
    public java.math.BigDecimal getAfterRatio() {
        return afterRatio;
    }
	/**
	 * 设置投料比例(%).
	 * @param afterRatio 投料比例(%)
	 */
    public void setAfterRatio(java.math.BigDecimal afterRatio) {
        this.afterRatio = afterRatio;
    }
	/**
	 * 获取批控UnitID.
	 * 
	 * @return 批控UnitID
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_UNITID"
	)
    public String getBatchUnitID() {
        return batchUnitID;
    }
	/**
	 * 设置批控UnitID.
	 * @param batchUnitID 批控UnitID
	 */
    public void setBatchUnitID(String batchUnitID) {
        this.batchUnitID = batchUnitID;
    }
	/**
	 * 获取前投料比例(%).
	 * 
	 * @return 前投料比例(%)
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="BEFORE_RATIO"
	)
    public java.math.BigDecimal getBeforeRatio() {
        return beforeRatio;
    }
	/**
	 * 设置前投料比例(%).
	 * @param beforeRatio 前投料比例(%)
	 */
    public void setBeforeRatio(java.math.BigDecimal beforeRatio) {
        this.beforeRatio = beforeRatio;
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
	 * 获取执行顺序.
	 * 
	 * @return 执行顺序
	 */
	@Column(nullable=true

		,name="EXE_ORDER"
	)
    public Integer getExeOrder() {
        return exeOrder;
    }
	/**
	 * 设置执行顺序.
	 * @param exeOrder 执行顺序
	 */
    public void setExeOrder(Integer exeOrder) {
        this.exeOrder = exeOrder;
    }
	@OneToOne
	@JoinColumn(name = "FACTORY_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public MESBasicFactoryModel getFactoryId() {
        return factoryId;
    }
    public void setFactoryId(MESBasicFactoryModel factoryId) {
        this.factoryId = factoryId;
    }
	@OneToOne
	@JoinColumn(name = "FORMULA_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public RMFormula getFormulaId() {
        return formulaId;
    }
    public void setFormulaId(RMFormula formulaId) {
        this.formulaId = formulaId;
    }
	@OneToOne
	@JoinColumn(name = "FORMULAR_PROCESS", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public RMFormulaProcess getFormularProcess() {
        return formularProcess;
    }
    public void setFormularProcess(RMFormulaProcess formularProcess) {
        this.formularProcess = formularProcess;
    }
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getHeadId() {
        return headId;
    }
    public void setHeadId(WOMProduceTask headId) {
        this.headId = headId;
    }
	/**
	 * 获取首道工序.
	 * 
	 * @return 首道工序
	 */
	@Column(nullable=true

		,name="IS_FIRST_PROCESS"
	)
    public Boolean getIsFirstProcess() {
        return null == isFirstProcess ? false : isFirstProcess;
    }
	/**
	 * 设置首道工序.
	 * @param isFirstProcess 首道工序
	 */
    public void setIsFirstProcess(Boolean isFirstProcess) {
        this.isFirstProcess = isFirstProcess;
    }
	/**
	 * 获取末道工序.
	 * 
	 * @return 末道工序
	 */
	@Column(nullable=true

		,name="IS_LAST_PROCESS"
	)
    public Boolean getIsLastProcess() {
        return null == isLastProcess ? false : isLastProcess;
    }
	/**
	 * 设置末道工序.
	 * @param isLastProcess 末道工序
	 */
    public void setIsLastProcess(Boolean isLastProcess) {
        this.isLastProcess = isLastProcess;
    }
	/**
	 * 获取标准时长.
	 * 
	 * @return 标准时长
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="LONG_TIME"
	)
    public java.math.BigDecimal getLongTime() {
        return longTime;
    }
	/**
	 * 设置标准时长.
	 * @param longTime 标准时长
	 */
    public void setLongTime(java.math.BigDecimal longTime) {
        this.longTime = longTime;
    }
	/**
	 * 获取工序名称.
	 * 
	 * @return 工序名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置工序名称.
	 * @param name 工序名称
	 */
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取工序状态.
	 * 
	 * @return 工序状态
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="PROCESS_STATE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getProcessState() {
		return processState;
	}
	/**
	 * 设置工序状态.
	 * @param processState 工序状态
	 */
	public void setProcessState(SystemCode processState) {
		this.processState = (SystemCode) processState;
	}
	@OneToOne
	@JoinColumn(name = "PROCESS_TYPE", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	
						
    public RMProcessType getProcessType() {
        return processType;
    }
    public void setProcessType(RMProcessType processType) {
        this.processType = processType;
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
		return WOMProduceTaskProcess.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_produceTask_ProduceTaskProcess_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_ProduceTaskProcess,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
