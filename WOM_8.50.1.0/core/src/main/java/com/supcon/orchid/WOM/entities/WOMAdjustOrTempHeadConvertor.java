package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMAdjustOrTempHeadConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMAdjustOrTempHeadConvertor {
	
	public WOMAdjustOrTempHeadConvertor() {
	}
	
	public String getClassName() {
		return WOMAdjustOrTempHead.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMAdjustOrTempHeadConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}