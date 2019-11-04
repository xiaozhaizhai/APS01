package com.supcon.orchid.X6Basic.entities;

import javax.persistence.Table;
import org.apache.solr.client.solrj.beans.Field;
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
import com.supcon.orchid.foundation.entities.Department;		
import com.supcon.orchid.foundation.entities.Position;		
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.orm.entities.ISystemCode;
import com.supcon.orchid.foundation.entities.Staff;		
import com.supcon.orchid.foundation.entities.Document;
/**
 * 会议室管理.
 */
@javax.persistence.Entity(name=MeetingRoom.JPA_NAME)
@Table(name = MeetingRoom.TABLE_NAME)
@BAPEntity(entityCode="X6Basic_1.0_meetingroom")
@XmlRootElement
@BAPModelCode(code="X6Basic_1.0_meetingroom_MeetingRoom")
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
		/* CUSTOM CODE START(entity,attribute_overrides,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
})
@BAPCustomComponent
@DataAudit
@XmlSeeAlso({MeetingRoomConvertor.class})
public class MeetingRoom extends com.supcon.orchid.orm.entities.AbstractEcFullEntity {
	private static final long serialVersionUID = 1L;
	public static final String MODULE_CODE = "X6Basic_1.0";
	public static final String ENTITY_CODE = "X6Basic_1.0_meetingroom";
	public static final String MODEL_CODE = "X6Basic_1.0_meetingroom_MeetingRoom";
	public static final String DOC_TYPE = "X6Basic_meetingroom_meetingRoom";
	public static final String TABLE_NAME = "x6basic_meeting_rooms";
	public static final String JPA_NAME = "MeetingRoom";
	private AttMachine attMatching;
	private AttMachine attMatching2;


		private String attMatchingAddress ; // 入口考勤机


		private String attMatchingAddress2 ; // 出口考勤机


		private Boolean audio = false; // 音响设备


		private Boolean camera = false; // 摄像机


		private Boolean matching = false; // 考勤机


		private String memos ; // 备注
	@BAPIsMainDisplay
		@BAPIsMneCode
		private String name ; // 会议室名称


		private Boolean network = false; // 网络


		private Boolean projector = false; // 投影仪
	private SystemCode roomSize
; // 规模
	private Staff staff;


		private Boolean useFlag = false; // 启用


		private Boolean whiteBoard = false; // 白板
	
	private List<UsedRecord> usedRecordList;
	
	public void setUsedRecordList(List<UsedRecord> usedRecordList){
		this.usedRecordList = usedRecordList;
	}
	@Transient
	public List<UsedRecord> getUsedRecordList(){
		return usedRecordList;
	}
	
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
	@JoinColumn(name = "ATT_MATCHING", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public AttMachine getAttMatching() {
        return attMatching;
    }
    public void setAttMatching(AttMachine attMatching) {
        this.attMatching = attMatching;
    }
	@ManyToOne
	@JoinColumn(name = "ATT_MATCHING2", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public AttMachine getAttMatching2() {
        return attMatching2;
    }
    public void setAttMatching2(AttMachine attMatching2) {
        this.attMatching2 = attMatching2;
    }
	/**
	 * 获取入口考勤机.
	 * 
	 * @return 入口考勤机
	 */
	@Column(nullable=true

		,length = 256
		,name="ATT_MATCHING_ADDRESS"
	)
    public String getAttMatchingAddress() {
        return attMatchingAddress;
    }
	/**
	 * 设置入口考勤机.
	 * @param attMatchingAddress 入口考勤机
	 */
    public void setAttMatchingAddress(String attMatchingAddress) {
        this.attMatchingAddress = attMatchingAddress;
    }
	/**
	 * 获取出口考勤机.
	 * 
	 * @return 出口考勤机
	 */
	@Column(nullable=true

		,length = 256
		,name="ATT_MATCHING_ADDRESS2"
	)
    public String getAttMatchingAddress2() {
        return attMatchingAddress2;
    }
	/**
	 * 设置出口考勤机.
	 * @param attMatchingAddress2 出口考勤机
	 */
    public void setAttMatchingAddress2(String attMatchingAddress2) {
        this.attMatchingAddress2 = attMatchingAddress2;
    }
	/**
	 * 获取音响设备.
	 * 
	 * @return 音响设备
	 */
	@Column(nullable=true

		,name="AUDIO"
	)
    public Boolean getAudio() {
        return null == audio ? false : audio;
    }
	/**
	 * 设置音响设备.
	 * @param audio 音响设备
	 */
    @Field("audio_bapBoolean")
    public void setAudio(Boolean audio) {
        this.audio = audio;
    }
	/**
	 * 获取摄像机.
	 * 
	 * @return 摄像机
	 */
	@Column(nullable=true

		,name="CAMERA"
	)
    public Boolean getCamera() {
        return null == camera ? false : camera;
    }
	/**
	 * 设置摄像机.
	 * @param camera 摄像机
	 */
    @Field("camera_bapBoolean")
    public void setCamera(Boolean camera) {
        this.camera = camera;
    }
	/**
	 * 获取考勤机.
	 * 
	 * @return 考勤机
	 */
	@Column(nullable=true

		,name="MATCHING"
	)
    public Boolean getMatching() {
        return null == matching ? false : matching;
    }
	/**
	 * 设置考勤机.
	 * @param matching 考勤机
	 */
    @Field("matching_bapBoolean")
    public void setMatching(Boolean matching) {
        this.matching = matching;
    }
	/**
	 * 获取备注.
	 * 
	 * @return 备注
	 */
	@Column(nullable=true
		,length=256

		,name="MEMOS"
	)
    @javax.persistence.Lob
    public String getMemos() {
        return memos;
    }
	/**
	 * 设置备注.
	 * @param memos 备注
	 */
    @Field("memos_bapContent")
    public void setMemos(String memos) {
        this.memos = memos;
    }
	/**
	 * 获取会议室名称.
	 * 
	 * @return 会议室名称
	 */
	@Column(nullable=true

		,length = 256
		,name="NAME"
	)
    public String getName() {
        return name;
    }
	/**
	 * 设置会议室名称.
	 * @param name 会议室名称
	 */
    @Field("name_bapText")
    public void setName(String name) {
        this.name = name;
    }
	/**
	 * 获取网络.
	 * 
	 * @return 网络
	 */
	@Column(nullable=true

		,name="NETWORK"
	)
    public Boolean getNetwork() {
        return null == network ? false : network;
    }
	/**
	 * 设置网络.
	 * @param network 网络
	 */
    @Field("network_bapBoolean")
    public void setNetwork(Boolean network) {
        this.network = network;
    }
	/**
	 * 获取投影仪.
	 * 
	 * @return 投影仪
	 */
	@Column(nullable=true

		,name="PROJECTOR"
	)
    public Boolean getProjector() {
        return null == projector ? false : projector;
    }
	/**
	 * 设置投影仪.
	 * @param projector 投影仪
	 */
    @Field("projector_bapBoolean")
    public void setProjector(Boolean projector) {
        this.projector = projector;
    }
	/**
	 * 获取规模.
	 * 
	 * @return 规模
	 */
	@ManyToOne(fetch=FetchType.EAGER, targetEntity = SystemCode.class)
	@JoinColumn(name="ROOM_SIZE", nullable=true)
    @Fetch(FetchMode.SELECT)
	public SystemCode getRoomSize() {
		return roomSize;
	}
	/**
	 * 设置规模.
	 * @param roomSize 规模
	 */
	public void setRoomSize(SystemCode roomSize) {
		this.roomSize = (SystemCode) roomSize;
	}
	@OneToOne
	@JoinColumn(name = "STAFF", referencedColumnName="ID")
	@XmlJavaTypeAdapter(BAPFoundationAdapter.class)
	@Fetch(FetchMode.SELECT)
						
    public Staff getStaff() {
        return staff;
    }
    public void setStaff(Staff staff) {
        this.staff = staff;
    }
	/**
	 * 获取启用.
	 * 
	 * @return 启用
	 */
	@Column(nullable=true

		,name="USE_FLAG"
	)
    public Boolean getUseFlag() {
        return null == useFlag ? false : useFlag;
    }
	/**
	 * 设置启用.
	 * @param useFlag 启用
	 */
    @Field("useFlag_bapBoolean")
    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }
	/**
	 * 获取白板.
	 * 
	 * @return 白板
	 */
	@Column(nullable=true

		,name="WHITE_BOARD"
	)
    public Boolean getWhiteBoard() {
        return null == whiteBoard ? false : whiteBoard;
    }
	/**
	 * 设置白板.
	 * @param whiteBoard 白板
	 */
    @Field("whiteBoard_bapBoolean")
    public void setWhiteBoard(Boolean whiteBoard) {
        this.whiteBoard = whiteBoard;
    }
	
	
	protected String _getEntityName() {
		return MeetingRoom.class.getName();
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
	private String meetingStaffDeleteIds;
	private String meetingStaffAddIds;
	private String meetingStaffmultiselectIDs;
	private String meetingStaffmultiselectNames;

	@javax.persistence.Transient
	public String getMeetingStaffDeleteIds(){
		return this.meetingStaffDeleteIds;
	}

	public void setMeetingStaffDeleteIds(String deleteIds){
		this.meetingStaffDeleteIds = deleteIds;
	}

	@javax.persistence.Transient
	public String getMeetingStaffmultiselectIDs(){
		return this.meetingStaffmultiselectIDs;
	}

	public void setMeetingStaffmultiselectIDs(String multiselectIDs){
		this.meetingStaffmultiselectIDs = multiselectIDs;
	}

	@javax.persistence.Transient
	public String getMeetingStaffmultiselectNames(){
		return this.meetingStaffmultiselectNames;
	}

	public void setMeetingStaffmultiselectNames(String multiselectNames){
		this.meetingStaffmultiselectNames = multiselectNames;
	}

	@javax.persistence.Transient
	public String getMeetingStaffAddIds(){
		return this.meetingStaffAddIds;
	}

	public void setMeetingStaffAddIds(String addIds){
		this.meetingStaffAddIds = addIds;
	}
	/**
	 * @return the bapSearchUrl
	 */
	@Transient
	public String getBapSearchUrl() {
		if(null == bapSearchUrl) {
			bapSearchUrl = "/X6Basic/meetingroom/meetingRoom/view.action?entityCode=X6Basic_1.0_meetingroom&id=";
		}
		return bapSearchUrl;
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
	/* CUSTOM CODE START(entity,functions,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}
