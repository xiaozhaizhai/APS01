package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicPropertyTagsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicPropertyTagsConvertor {
	
	public MESBasicPropertyTagsConvertor() {
	}
	
	public String getClassName() {
		return MESBasicPropertyTags.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicPropertyTagsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
