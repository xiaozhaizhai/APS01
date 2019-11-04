package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicWareConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicWareConvertor {
	
	public MESBasicWareConvertor() {
	}
	
	public String getClassName() {
		return MESBasicWare.class.getName();
	}
	
	private String wareCode;
	
	public String getWareCode(){
		return wareCode;
	}
	
	public void setWareCode(String wareCode){
		this.wareCode = wareCode;
	}

	private String wareName;
	
	public String getWareName(){
		return wareName;
	}
	
	public void setWareName(String wareName){
		this.wareName = wareName;
	}
	
	
	public MESBasicWareConvertor(String wareCode, String wareName) {
		super();
		this.wareCode = wareCode;
		this.wareName = wareName;
	}
	

	
}
