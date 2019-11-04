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
import com.supcon.orchid.annotation.BAPEntity;
import javax.persistence.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Where;

import com.supcon.orchid.orm.entities.IAuditEntity;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.orm.entities.ICompany;
import com.supcon.orchid.orm.entities.ICId;
import com.supcon.orchid.annotation.BAPCustomComponent;
import com.supcon.orchid.annotation.BAPIsMainDisplay;
import com.supcon.orchid.annotation.BAPIsMneCode;
import com.supcon.orchid.annotation.BAPModelCode;
import com.supcon.orchid.annotation.BAPPicture;
import com.supcon.orchid.annotation.BAPSystemCodeMultable;
import com.supcon.orchid.annotation.BAPSeniorSystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 检验项映射.
 */
@javax.persistence.Entity(name=MESBasicTestMappingSet.JPA_NAME)
@Table(name = MESBasicTestMappingSet.TABLE_NAME)
@BAPEntity(entityCode="MESBasic_1_testMapping")
@XmlRootElement
@BAPModelCode(code="MESBasic_1_testMapping_TestMappingSet")
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
		/* CUSTOM CODE START(entity,attribute_overrides,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
})
@BAPCustomComponent
public class MESBasicTestMappingSet extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "MESBasic_1";
	public static final String ENTITY_CODE = "MESBasic_1_testMapping";
	public static final String MODEL_CODE = "MESBasic_1_testMapping_TestMappingSet";
	public static final String DOC_TYPE = "MESBasic_testMapping_testMappingSet";
	public static final String TABLE_NAME = "mesbasic_test_mapping_sets";
	public static final String JPA_NAME = "MESBasicTestMappingSet";


		private java.math.BigDecimal basicPure ; // 标准含量
	private MESBasicProduct product;


		private Long testId ; // 检测项
	@BAPIsMainDisplay

		private String testName ; // 检测项名称


		private String testShortName ; // 检测项简称
	
	
	private Document document;
	
	private String bapAttachmentInfo;
	
	@javax.persistence.Transient
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
	 * 获取标准含量.
	 * 
	 * @return 标准含量
	 */
	@Column(nullable=true
			,precision=19,scale=2
		,name="BASIC_PURE"
	)
    public java.math.BigDecimal getBasicPure() {
        return basicPure;
    }
	/**
	 * 设置标准含量.
	 * @param basicPure 标准含量
	 */
    public void setBasicPure(java.math.BigDecimal basicPure) {
        this.basicPure = basicPure;
    }
	@OneToOne
	@JoinColumn(name = "PRODUCT", referencedColumnName="PRODUCT_ID")
	@Fetch(FetchMode.SELECT)
						
    public MESBasicProduct getProduct() {
        return product;
    }
    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }
	/**
	 * 获取检测项.
	 * 
	 * @return 检测项
	 */
	@Column(nullable=true

		,name="TEST_ID"
	)
    public Long getTestId() {
        return testId;
    }
	/**
	 * 设置检测项.
	 * @param testId 检测项
	 */
    public void setTestId(Long testId) {
        this.testId = testId;
    }
	/**
	 * 获取检测项名称.
	 * 
	 * @return 检测项名称
	 */
	@Column(nullable=true

		,length = 400
		,name="TEST_NAME"
	)
    public String getTestName() {
        return testName;
    }
	/**
	 * 设置检测项名称.
	 * @param testName 检测项名称
	 */
    public void setTestName(String testName) {
        this.testName = testName;
    }
	/**
	 * 获取检测项简称.
	 * 
	 * @return 检测项简称
	 */
	@Column(nullable=true

		,length = 400
		,name="TEST_SHORT_NAME"
	)
    public String getTestShortName() {
        return testShortName;
    }
	/**
	 * 设置检测项简称.
	 * @param testShortName 检测项简称
	 */
    public void setTestShortName(String testShortName) {
        this.testShortName = testShortName;
    }
	
	
	protected String _getEntityName() {
		return MESBasicTestMappingSet.class.getName();
	}
	
	
	private ICompany company;
	
	@Override
	@OneToOne(fetch=FetchType.EAGER, targetEntity=Company.class, optional=true)
    @JoinColumn(name=ICId.P_CID, insertable=false, updatable=false)
    @Fetch(FetchMode.SELECT)
	public ICompany getCompany() {
		return this.company;
	}
	
	@Override
	public void setCompany(ICompany company) {
		this.company =company;
	}


	// 在此区域内自行添加JAVA代码,此处添加的JAVA代码必须不涉及持久化操作,
	// 如果加入get方法,请添加@javax.persistence.Transient注解
	/* CUSTOM CODE START(entity,functions,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}
