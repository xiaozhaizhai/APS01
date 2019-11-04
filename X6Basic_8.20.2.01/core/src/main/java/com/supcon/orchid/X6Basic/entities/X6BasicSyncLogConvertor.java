package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicSyncLogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicSyncLogConvertor {
	
	public X6BasicSyncLogConvertor() {
	}
	
	public String getClassName() {
		return X6BasicSyncLog.class.getName();
	}
	
	private String eventTopic;
	
	public String getEventTopic(){
		return eventTopic;
	}
	
	public void setEventTopic(String eventTopic){
		this.eventTopic = eventTopic;
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicSyncLogConvertor(Long id, String eventTopic) {
		super();
		this.id = id;
		this.eventTopic = eventTopic;
	}
	

	
}
