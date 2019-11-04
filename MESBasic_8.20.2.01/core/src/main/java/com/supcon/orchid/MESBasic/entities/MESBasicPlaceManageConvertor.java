package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicPlaceManageConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicPlaceManageConvertor {
	
	public MESBasicPlaceManageConvertor() {
	}
	
	public String getClassName() {
		return MESBasicPlaceManage.class.getName();
	}
	
	private String placeCode;
	
	public String getPlaceCode(){
		return placeCode;
	}
	
	public void setPlaceCode(String placeCode){
		this.placeCode = placeCode;
	}

	private String placeName;
	
	public String getPlaceName(){
		return placeName;
	}
	
	public void setPlaceName(String placeName){
		this.placeName = placeName;
	}
	
	
	public MESBasicPlaceManageConvertor(String placeCode, String placeName) {
		super();
		this.placeCode = placeCode;
		this.placeName = placeName;
	}
	

	
}
