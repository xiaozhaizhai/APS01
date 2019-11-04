package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBatchRelationshipConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBatchRelationshipConvertor {
	
	public MESBasicBatchRelationshipConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBatchRelationship.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicBatchRelationshipConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
