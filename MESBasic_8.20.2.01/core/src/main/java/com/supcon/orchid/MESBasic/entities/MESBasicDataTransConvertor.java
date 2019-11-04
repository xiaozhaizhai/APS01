package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicDataTransConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicDataTransConvertor {
	
	public MESBasicDataTransConvertor() {
	}
	
	public String getClassName() {
		return MESBasicDataTrans.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicDataTransConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
