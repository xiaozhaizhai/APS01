package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicProdLevelConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicProdLevelConvertor {
	
	public MESBasicProdLevelConvertor() {
	}
	
	public String getClassName() {
		return MESBasicProdLevel.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicProdLevelConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
