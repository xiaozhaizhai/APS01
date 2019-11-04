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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 投料记录业签.
 */
@javax.persistence.Entity(name=WOMPutInManage.JPA_NAME)
@Table(name = WOMPutInManage.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_generalManage")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_generalManage_PutInManage")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_generalManage_PutInManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({WOMPutInManageConvertor.class})
public class WOMPutInManage extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_generalManage";
	public static final String MODEL_CODE = "WOM_7.5.0.0_generalManage_PutInManage";
	public static final String DOC_TYPE = "WOM_generalManage_putInManage";
	public static final String TABLE_NAME = "wom_put_in_menage";
	public static final String JPA_NAME = "WOMPutInManage";
	private WOMProduceTaskManage produceTask;
	private WOMPutInMaterialPart putInMetarialPart;


		private String putInUrl ; // 投料单Url
	
	
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
	@JoinColumn(name = "PUT_IN_METARIAL_PART", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public WOMPutInMaterialPart getPutInMetarialPart() {
        return putInMetarialPart;
    }
    public void setPutInMetarialPart(WOMPutInMaterialPart putInMetarialPart) {
        this.putInMetarialPart = putInMetarialPart;
    }
	/**
	 * 获取投料单Url.
	 * 
	 * @return 投料单Url
	 */
	@Column(nullable=true

		,length = 256
		,name="PUT_IN_URL"
	)
    public String getPutInUrl() {
        return putInUrl;
    }
	/**
	 * 设置投料单Url.
	 * @param putInUrl 投料单Url
	 */
    public void setPutInUrl(String putInUrl) {
        this.putInUrl = putInUrl;
    }
	
	
	protected String _getEntityName() {
		return WOMPutInManage.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_generalManage_PutInManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}
