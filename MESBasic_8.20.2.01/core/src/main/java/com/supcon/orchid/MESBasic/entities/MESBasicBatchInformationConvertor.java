package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBatchInformationConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBatchInformationConvertor {
	
	public MESBasicBatchInformationConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBatchInformation.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicBatchInformationConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
