package com.supcon.orchid.RM.entities;

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
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 批控主配方.
 */
@javax.persistence.Entity(name=RMBatchFormulaMain.JPA_NAME)
@Table(name = RMBatchFormulaMain.TABLE_NAME)
@BAPEntity(entityCode="RM_7.5.0.0_batchFormula")
@XmlRootElement
@BAPModelCode(code="RM_7.5.0.0_batchFormula_BatchFormulaMain")
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
		@AttributeOverride(name="valid", column=@Column(name = "VALID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({RMBatchFormulaMainConvertor.class})
public class RMBatchFormulaMain extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "RM_7.5.0.0";
	public static final String ENTITY_CODE = "RM_7.5.0.0_batchFormula";
	public static final String MODEL_CODE = "RM_7.5.0.0_batchFormula_BatchFormulaMain";
	public static final String DOC_TYPE = "RM_batchFormula_batchFormulaMain";
	public static final String TABLE_NAME = "rm_batch_formula_mains";
	public static final String JPA_NAME = "RMBatchFormulaMain";


		private String batchFormulaId ; // 批控主配方ID


		private String cells ; // 候选生产线


		private Integer edition ; // 版本


		private String formulaCode ; // 配方编码

	@XmlJavaTypeAdapter(DateAdapter.class)

		private java.util.Date modTime ; // 修改时间
	private SystemCode origin
; // 批控服务器地址


		private String productName ; // 产品名称


		private String remark ; // 备注


		private String runMode ; // 运行模式
	
	
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
	 * 获取批控主配方ID.
	 * 
	 * @return 批控主配方ID
	 */
	@Column(unique=true

		,length = 200
		,name="BATCH_FORMULA_ID"
	)
	@Index(name="index_BatchFormulaMain_batchFormulaId")	
    public String getBatchFormulaId() {
        return batchFormulaId;
    }
	/**
	 * 设置批控主配方ID.
	 * @param batchFormulaId 批控主配方ID
	 */
    public void setBatchFormulaId(String batchFormulaId) {
        this.batchFormulaId = batchFormulaId;
    }
	/**
	 * 获取候选生产线.
	 * 
	 * @return 候选生产线
	 */
	@Column(nullable=true

		,length = 200
		,name="CELLS"
	)
    public String getCells() {
        return cells;
    }
	/**
	 * 设置候选生产线.
	 * @param cells 候选生产线
	 */
    public void setCells(String cells) {
        this.cells = cells;
    }
	/**
	 * 获取版本.
	 * 
	 * @return 版本
	 */
	@Column(nullable=true

		,name="EDITION"
	)
    public Integer getEdition() {
        return edition;
    }
	/**
	 * 设置版本.
	 * @param edition 版本
	 */
    public void setEdition(Integer edition) {
        this.edition = edition;
    }
	/**
	 * 获取配方编码.
	 * 
	 * @return 配方编码
	 */
	@Column(nullable=true

		,length = 200
		,name="FORMULA_CODE"
	)
    public String getFormulaCode() {
        return formulaCode;
    }
	/**
	 * 设置配方编码.
	 * @param formulaCode 配方编码
	 */
    public void setFormulaCode(String formulaCode) {
        this.formulaCode = formulaCode;
    }
	/**
	 * 获取修改时间.
	 * 
	 * @return 修改时间
	 */
	@Column(nullable=true

		,name="MOD_TIME"
	)
	@XmlTransient
    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    public java.util.Date getModTime() {
        return modTime;
    }
	/**
	 * 设置修改时间.
	 * @param modTime 修改时间
	 */
    public void setModTime(java.util.Date modTime) {
        this.modTime = modTime;
    }
	/**
	 * 获取批控服务器地址.
	 * 
	 * @return 批控服务器地址
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ORIGIN", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getOrigin() {
		return origin;
	}
	/**
	 * 设置批控服务器地址.
	 * @param origin 批控服务器地址
	 */
	public void setOrigin(SystemCode origin) {
		this.origin = (SystemCode) origin;
	}
	/**
	 * 获取产品名称.
	 * 
	 * @return 产品名称
	 */
	@Column(nullable=true

		,length = 200
		,name="PRODUCT_NAME"
	)
    public String getProductName() {
        return productName;
    }
	/**
	 * 设置产品名称.
	 * @param productName 产品名称
	 */
    public void setProductName(String productName) {
        this.productName = productName;
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
	 * 获取运行模式.
	 * （分量模式：1，总量模式：0）
	 * @return 运行模式
	 */
	@Column(nullable=true

		,length = 200
		,name="RUN_MODE"
	)
    public String getRunMode() {
        return runMode;
    }
	/**
	 * 设置运行模式.
	 * @param runMode 运行模式
	 */
    public void setRunMode(String runMode) {
        this.runMode = runMode;
    }
	
	
	protected String _getEntityName() {
		return RMBatchFormulaMain.class.getName();
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
	/* CUSTOM CODE START(entity,functions,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
