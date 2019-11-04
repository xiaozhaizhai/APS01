package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicStoreSetConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicStoreSetConvertor {
	
	public MESBasicStoreSetConvertor() {
	}
	
	public String getClassName() {
		return MESBasicStoreSet.class.getName();
	}
	
	private String placeSetCode;
	
	public String getPlaceSetCode(){
		return placeSetCode;
	}
	
	public void setPlaceSetCode(String placeSetCode){
		this.placeSetCode = placeSetCode;
	}

	private String placeSetName;
	
	public String getPlaceSetName(){
		return placeSetName;
	}
	
	public void setPlaceSetName(String placeSetName){
		this.placeSetName = placeSetName;
	}
	
	
	public MESBasicStoreSetConvertor(String placeSetCode, String placeSetName) {
		super();
		this.placeSetCode = placeSetCode;
		this.placeSetName = placeSetName;
	}
	

	
}
