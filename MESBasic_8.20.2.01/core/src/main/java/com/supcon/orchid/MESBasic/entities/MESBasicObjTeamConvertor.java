package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicObjTeamConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicObjTeamConvertor {
	
	public MESBasicObjTeamConvertor() {
	}
	
	public String getClassName() {
		return MESBasicObjTeam.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicObjTeamConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
