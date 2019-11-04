package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicSwitcherModelConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicSwitcherModelConvertor {
	
	public MESBasicSwitcherModelConvertor() {
	}
	
	public String getClassName() {
		return MESBasicSwitcherModel.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicSwitcherModelConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
