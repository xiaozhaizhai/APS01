package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MessageCenterConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MessageCenterConvertor {
	
	public MessageCenterConvertor() {
	}
	
	public String getClassName() {
		return MessageCenter.class.getName();
	}
	
	private String emailTitle;
	
	public String getEmailTitle(){
		return emailTitle;
	}
	
	public void setEmailTitle(String emailTitle){
		this.emailTitle = emailTitle;
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MessageCenterConvertor(Long id, String emailTitle) {
		super();
		this.id = id;
		this.emailTitle = emailTitle;
	}
	

	
}
