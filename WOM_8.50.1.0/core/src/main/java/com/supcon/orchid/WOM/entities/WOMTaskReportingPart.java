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
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;		
import com.supcon.orchid.MESBasic.entities.MESBasicWare;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 生产报工明细.
 */
@javax.persistence.Entity(name=WOMTaskReportingPart.JPA_NAME)
@Table(name = WOMTaskReportingPart.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_taskReporting")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_taskReporting_TaskReportingPart")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_taskReporting_TaskReportingPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMTaskReportingPartConvertor.class})
public class WOMTaskReportingPart extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_taskReporting";
	public static final String MODEL_CODE = "WOM_7.5.0.0_taskReporting_TaskReportingPart";
	public static final String DOC_TYPE = "WOM_taskReporting_taskReportingPart";
	public static final String TABLE_NAME = "wom_task_reporting_parts";
	public static final String JPA_NAME = "WOMTaskReportingPart";


		private String batchNum ; // 入库批号


		private java.math.BigDecimal content ; // 含量
	private WOMTaskReporting headId;


		private java.math.BigDecimal modifyCont ; // 修改的含量


		private java.math.BigDecimal modifyNum ; // 修改的数量


		private String proBatchNum ; // 生产批号
	private MESBasicProduct productID;


		private String remark ; // 备注

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date reportDate ; // 报工时间


		private java.math.BigDecimal reportNum ; // 数量
	private Staff reportStaff;
	private SystemCode reportType
; // 报工类型
	private MESBasicStoreSet storeID;
	private WOMProduceTask taskID;
	private MESBasicWare wareId;
	
	
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
	
	
	@Index(name="IDX_TASKREPORTINGPA_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	/**
	 * 获取入库批号.
	 * 
	 * @return 入库批号
	 */
	@Column(nullable=true

		,length = 200
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置入库批号.
	 * @param batchNum 入库批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	/**
	 * 获取含量.
	 * 
	 * @return 含量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="CONTENT"
	)
    public java.math.BigDecimal getContent() {
        return content;
    }
	/**
	 * 设置含量.
	 * @param content 含量
	 */
    public void setContent(java.math.BigDecimal content) {
        this.content = content;
    }
	@ManyToOne
	@JoinColumn(name = "HEAD_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMTaskReporting getHeadId() {
        return headId;
    }
    public void setHeadId(WOMTaskReporting headId) {
        this.headId = headId;
    }
	/**
	 * 获取修改的含量.
	 * 
	 * @return 修改的含量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="MODIFY_CONT"
	)
    public java.math.BigDecimal getModifyCont() {
        return modifyCont;
    }
	/**
	 * 设置修改的含量.
	 * @param modifyCont 修改的含量
	 */
    public void setModifyCont(java.math.BigDecimal modifyCont) {
        this.modifyCont = modifyCont;
    }
	/**
	 * 获取修改的数量.
	 * 
	 * @return 修改的数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="MODIFY_NUM"
	)
    public java.math.BigDecimal getModifyNum() {
        return modifyNum;
    }
	/**
	 * 设置修改的数量.
	 * @param modifyNum 修改的数量
	 */
    public void setModifyNum(java.math.BigDecimal modifyNum) {
        this.modifyNum = modifyNum;
    }
	/**
	 * 获取生产批号.
	 * 
	 * @return 生产批号
	 */
	@Column(nullable=true

		,length = 256
		,name="PRO_BATCH_NUM"
	)
    public String getProBatchNum() {
        return proBatchNum;
    }
	/**
	 * 设置生产批号.
	 * @param proBatchNum 生产批号
	 */
    public void setProBatchNum(String proBatchNum) {
        this.proBatchNum = proBatchNum;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCTID", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProductID() {
        return productID;
    }
    public void setProductID(MESBasicProduct productID) {
        this.productID = productID;
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
	 * 获取报工时间.
	 * 
	 * @return 报工时间
	 */
	@Column(nullable=true

		,name="REPORT_DATE"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getReportDate() {
        return reportDate;
    }
	/**
	 * 设置报工时间.
	 * @param reportDate 报工时间
	 */
    public void setReportDate(java.util.Date reportDate) {
        this.reportDate = reportDate;
    }
	/**
	 * 获取数量.
	 * 
	 * @return 数量
	 */
	@Column(nullable=true
			,precision=19,scale=6
		,name="REPORT_NUM"
	)
    public java.math.BigDecimal getReportNum() {
        return reportNum;
    }
	/**
	 * 设置数量.
	 * @param reportNum 数量
	 */
    public void setReportNum(java.math.BigDecimal reportNum) {
        this.reportNum = reportNum;
    }
	@OneToOne
	@JoinColumn(name = "REPORT_STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getReportStaff() {
        return reportStaff;
    }
    public void setReportStaff(Staff reportStaff) {
        this.reportStaff = reportStaff;
    }
	/**
	 * 获取报工类型.
	 * 
	 * @return 报工类型
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="REPORT_TYPE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getReportType() {
		return reportType;
	}
	/**
	 * 设置报工类型.
	 * @param reportType 报工类型
	 */
	public void setReportType(SystemCode reportType) {
		this.reportType = (SystemCode) reportType;
	}
	@OneToOne
	@JoinColumn(name = "STOREID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicStoreSet getStoreID() {
        return storeID;
    }
    public void setStoreID(MESBasicStoreSet storeID) {
        this.storeID = storeID;
    }
	@OneToOne
	@JoinColumn(name = "TASKID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTask getTaskID() {
        return taskID;
    }
    public void setTaskID(WOMProduceTask taskID) {
        this.taskID = taskID;
    }
	@OneToOne
	@JoinColumn(name = "WARE_ID", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicWare getWareId() {
        return wareId;
    }
    public void setWareId(MESBasicWare wareId) {
        this.wareId = wareId;
    }
	
	
	protected String _getEntityName() {
		return WOMTaskReportingPart.class.getName();
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

	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_bigintparama")
	private Integer bigintparama;
	
	@Column
    public Integer getBigintparama() {
        return bigintparama;
    }
	
    public void setBigintparama(Integer bigintparama) {
        this.bigintparama = bigintparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_bigintparamb")
	private Integer bigintparamb;
	
	@Column
    public Integer getBigintparamb() {
        return bigintparamb;
    }
	
    public void setBigintparamb(Integer bigintparamb) {
        this.bigintparamb = bigintparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_charparama")
	private String charparama;
	
	@Column
    public String getCharparama() {
        return charparama;
    }
	
    public void setCharparama(String charparama) {
        this.charparama = charparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_charparamb")
	private String charparamb;
	
	@Column
    public String getCharparamb() {
        return charparamb;
    }
	
    public void setCharparamb(String charparamb) {
        this.charparamb = charparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_dateparama")
	private java.util.Date dateparama;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparama() {
        return dateparama;
    }
	
    public void setDateparama(java.util.Date dateparama) {
        this.dateparama = dateparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_dateparamb")
	private java.util.Date dateparamb;
	
	@Column
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getDateparamb() {
        return dateparamb;
    }
	
    public void setDateparamb(java.util.Date dateparamb) {
        this.dateparamb = dateparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_numberparama")
	private java.math.BigDecimal numberparama;
	
	@Column
    public java.math.BigDecimal getNumberparama() {
        return numberparama;
    }
	
    public void setNumberparama(java.math.BigDecimal numberparama) {
        this.numberparama = numberparama;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_numberparamb")
	private java.math.BigDecimal numberparamb;
	
	@Column
    public java.math.BigDecimal getNumberparamb() {
        return numberparamb;
    }
	
    public void setNumberparamb(java.math.BigDecimal numberparamb) {
        this.numberparamb = numberparamb;
    }
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_objparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_objparamb", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_scparama", complex = true)
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
	@BAPCustomComponent(code = "WOM_7.5.0.0_taskReporting_TaskReportingPart_scparamb", complex = true)
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_taskReporting_TaskReportingPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
