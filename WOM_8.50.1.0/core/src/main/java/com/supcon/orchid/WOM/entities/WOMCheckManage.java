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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 检验记录业签.
 */
@javax.persistence.Entity(name=WOMCheckManage.JPA_NAME)
@Table(name = WOMCheckManage.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_generalManage")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_generalManage_CheckManage")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_generalManage_CheckManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMCheckManageConvertor.class})
public class WOMCheckManage extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_generalManage";
	public static final String MODEL_CODE = "WOM_7.5.0.0_generalManage_CheckManage";
	public static final String DOC_TYPE = "WOM_generalManage_checkManage";
	public static final String TABLE_NAME = "wom_check_menage";
	public static final String JPA_NAME = "WOMCheckManage";


		private String batchNum ; // 批号
	private Department checkDept;

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date checkTime ; // 检验时间


		private String chenkReportName ; // 检验报告单


		private String chenkReportUrl ; // 检验报告单url
	private Department inspectDept;


		private String inspectName ; // 请检单

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date inspectTime ; // 请检时间


		private String inspectUrl ; // 请检单url
	private WOMProduceTaskManage produceTask;
	private MESBasicProduct product;


		private String result ; // 检验结论


		private String standard ; // 质量标准
	
	
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
	 * 获取批号.
	 * 
	 * @return 批号
	 */
	@Column(nullable=true

		,length = 256
		,name="BATCH_NUM"
	)
    public String getBatchNum() {
        return batchNum;
    }
	/**
	 * 设置批号.
	 * @param batchNum 批号
	 */
    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }
	@OneToOne
	@JoinColumn(name = "CHECK_DEPT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getCheckDept() {
        return checkDept;
    }
    public void setCheckDept(Department checkDept) {
        this.checkDept = checkDept;
    }
	/**
	 * 获取检验时间.
	 * 
	 * @return 检验时间
	 */
	@Column(nullable=true

		,name="CHECK_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getCheckTime() {
        return checkTime;
    }
	/**
	 * 设置检验时间.
	 * @param checkTime 检验时间
	 */
    public void setCheckTime(java.util.Date checkTime) {
        this.checkTime = checkTime;
    }
	/**
	 * 获取检验报告单.
	 * 
	 * @return 检验报告单
	 */
	@Column(nullable=true

		,length = 256
		,name="CHENK_REPORT_NAME"
	)
    public String getChenkReportName() {
        return chenkReportName;
    }
	/**
	 * 设置检验报告单.
	 * @param chenkReportName 检验报告单
	 */
    public void setChenkReportName(String chenkReportName) {
        this.chenkReportName = chenkReportName;
    }
	/**
	 * 获取检验报告单url.
	 * 
	 * @return 检验报告单url
	 */
	@Column(nullable=true

		,length = 256
		,name="CHENK_REPORT_URL"
	)
    public String getChenkReportUrl() {
        return chenkReportUrl;
    }
	/**
	 * 设置检验报告单url.
	 * @param chenkReportUrl 检验报告单url
	 */
    public void setChenkReportUrl(String chenkReportUrl) {
        this.chenkReportUrl = chenkReportUrl;
    }
	@OneToOne
	@JoinColumn(name = "INSPECT_DEPT", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Department getInspectDept() {
        return inspectDept;
    }
    public void setInspectDept(Department inspectDept) {
        this.inspectDept = inspectDept;
    }
	/**
	 * 获取请检单.
	 * 
	 * @return 请检单
	 */
	@Column(nullable=true

		,length = 256
		,name="INSPECT_NAME"
	)
    public String getInspectName() {
        return inspectName;
    }
	/**
	 * 设置请检单.
	 * @param inspectName 请检单
	 */
    public void setInspectName(String inspectName) {
        this.inspectName = inspectName;
    }
	/**
	 * 获取请检时间.
	 * 
	 * @return 请检时间
	 */
	@Column(nullable=true

		,name="INSPECT_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getInspectTime() {
        return inspectTime;
    }
	/**
	 * 设置请检时间.
	 * @param inspectTime 请检时间
	 */
    public void setInspectTime(java.util.Date inspectTime) {
        this.inspectTime = inspectTime;
    }
	/**
	 * 获取请检单url.
	 * 
	 * @return 请检单url
	 */
	@Column(nullable=true

		,length = 256
		,name="INSPECT_URL"
	)
    public String getInspectUrl() {
        return inspectUrl;
    }
	/**
	 * 设置请检单url.
	 * @param inspectUrl 请检单url
	 */
    public void setInspectUrl(String inspectUrl) {
        this.inspectUrl = inspectUrl;
    }
	@ManyToOne
	@JoinColumn(name = "PRODUCE_TASK", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskManage getProduceTask() {
        return produceTask;
    }
    public void setProduceTask(WOMProduceTaskManage produceTask) {
        this.produceTask = produceTask;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT", referencedColumnName="PRODUCT_ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct() {
        return product;
    }
    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }
	/**
	 * 获取检验结论.
	 * 
	 * @return 检验结论
	 */
	@Column(nullable=true

		,length = 256
		,name="RESULT"
	)
    public String getResult() {
        return result;
    }
	/**
	 * 设置检验结论.
	 * @param result 检验结论
	 */
    public void setResult(String result) {
        this.result = result;
    }
	/**
	 * 获取质量标准.
	 * 
	 * @return 质量标准
	 */
	@Column(nullable=true

		,length = 256
		,name="STANDARD"
	)
    public String getStandard() {
        return standard;
    }
	/**
	 * 设置质量标准.
	 * @param standard 质量标准
	 */
    public void setStandard(String standard) {
        this.standard = standard;
    }
	
	
	protected String _getEntityName() {
		return WOMCheckManage.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_generalManage_CheckManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
