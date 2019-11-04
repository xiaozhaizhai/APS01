package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicItemRecordConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicItemRecordConvertor {
	
	public MESBasicItemRecordConvertor() {
	}
	
	public String getClassName() {
		return MESBasicItemRecord.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicItemRecordConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
