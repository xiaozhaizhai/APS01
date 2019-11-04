package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicObjBatContainerConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicObjBatContainerConvertor {
	
	public MESBasicObjBatContainerConvertor() {
	}
	
	public String getClassName() {
		return MESBasicObjBatContainer.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicObjBatContainerConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
