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
import com.supcon.orchid.annotation.BAPEntity;
import javax.persistence.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Where;
import com.supcon.orchid.audit.annotation.DataAudit;
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
import com.supcon.orchid.foundation.entities.Document;
/**
 * 前置工序.
 */
@javax.persistence.Entity(name=WOMTaskBeforeProcess.JPA_NAME)
@Table(name = WOMTaskBeforeProcess.TABLE_NAME)
@BAPEntity(entityCode="WOM_7.5.0.0_produceTask")
@XmlRootElement
@BAPModelCode(code="WOM_7.5.0.0_produceTask_TaskBeforeProcess")
@AttributeOverrides({
		@AttributeOverride(name="id", column=@Column(name = "ID")),
		@AttributeOverride(name="tableInfoId", column=@Column(name = "TABLE_INFO_ID")),
		@AttributeOverride(name="version", column=@Column(name = "VERSION")),
		@AttributeOverride(name="cid", column=@Column(name = "CID")),
		@AttributeOverride(name="valid", column=@Column(name = "VALID"))
		/* CUSTOM CODE START(entity,attribute_overrides,WOM_7.5.0.0_produceTask_TaskBeforeProcess,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
public class WOMTaskBeforeProcess extends com.supcon.orchid.orm.entities.AbstractEcPartEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "WOM_7.5.0.0";
	public static final String ENTITY_CODE = "WOM_7.5.0.0_produceTask";
	public static final String MODEL_CODE = "WOM_7.5.0.0_produceTask_TaskBeforeProcess";
	public static final String DOC_TYPE = "WOM_produceTask_taskBeforeProcess";
	public static final String TABLE_NAME = "wom_task_before_processes";
	public static final String JPA_NAME = "WOMTaskBeforeProcess";
	private WOMProduceTaskProcess beforeProcessID;
	private WOMProduceTaskProcess processId;
	
	private List<WOMProduceTaskProcess> produceTaskProcessList;
	
	public void setProduceTaskProcessList(List<WOMProduceTaskProcess> produceTaskProcessList){
		this.produceTaskProcessList = produceTaskProcessList;
	}
	@Transient
	public List<WOMProduceTaskProcess> getProduceTaskProcessList(){
		return produceTaskProcessList;
	}
	
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
	
	
	@Index(name="IDX_TASKBEFOREPROCE_TABLE_ID")
	@Column
	public Long getTableInfoId() {
		return tableInfoId;
	}	
		
	@OneToOne
	@JoinColumn(name = "BEFORE_PROCESSID", referencedColumnName="ID")
	
						
    public WOMProduceTaskProcess getBeforeProcessID() {
        return beforeProcessID;
    }
    public void setBeforeProcessID(WOMProduceTaskProcess beforeProcessID) {
        this.beforeProcessID = beforeProcessID;
    }
	@ManyToOne
	@JoinColumn(name = "PROCESS_ID", referencedColumnName="ID")
	@Fetch(FetchMode.SELECT)
						
    public WOMProduceTaskProcess getProcessId() {
        return processId;
    }
    public void setProcessId(WOMProduceTaskProcess processId) {
        this.processId = processId;
    }
	
	
	protected String _getEntityName() {
		return WOMTaskBeforeProcess.class.getName();
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
	/* CUSTOM CODE START(entity,functions,WOM_7.5.0.0_produceTask_TaskBeforeProcess,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}
