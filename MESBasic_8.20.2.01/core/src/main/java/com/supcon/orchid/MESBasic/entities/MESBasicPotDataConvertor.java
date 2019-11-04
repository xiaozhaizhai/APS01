package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicPotDataConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicPotDataConvertor {
	
	public MESBasicPotDataConvertor() {
	}
	
	public String getClassName() {
		return MESBasicPotData.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	private String tempID;
	
	public String getTempID(){
		return tempID;
	}
	
	public void setTempID(String tempID){
		this.tempID = tempID;
	}

	
	public MESBasicPotDataConvertor(String tempID) {
		super();
		this.tempID = tempID;
	}
	
	

	
}
