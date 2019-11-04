package com.supcon.orchid.X6Basic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * X6Basic.modelname.radion1366792543468.
 * 
 */
@javax.persistence.Entity(name=MeetingRoomMneCode.JPA_NAME)
@Table(name = MeetingRoomMneCode.TABLE_NAME)
@BAPMneField(name="meetingRoom")
public class MeetingRoomMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "X6BASIC_MEETING_ROOMS_MC";
	public static final String JPA_NAME = "MeetingRoomMneCode";
	
	private String mneCode;
	
	private MeetingRoom meetingRoom;
	
	/**
	 * 获取助记码数据.
	 * @return 助记码数据
	 */
	@Column(nullable=true)
    public String getMneCode() {
        return mneCode;
    }
	/**
	 *  设置助记码数据.
	 * @param name 助记码数据
	 */
    public void setMneCode(String mneCode) {
        this.mneCode = mneCode;
    }		
			
	@ManyToOne	
    public MeetingRoom getMeetingRoom() {
        return meetingRoom;
    }
    
    public void setMeetingRoom(MeetingRoom meetingRoom) {
        this.meetingRoom = meetingRoom;
    }
	
	protected String _getEntityName() {
		return MeetingRoomMneCode.class.getName();
	}

}