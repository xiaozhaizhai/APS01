package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicObjPostionConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicObjPostionConvertor {
	
	public MESBasicObjPostionConvertor() {
	}
	
	public String getClassName() {
		return MESBasicObjPostion.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicObjPostionConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
