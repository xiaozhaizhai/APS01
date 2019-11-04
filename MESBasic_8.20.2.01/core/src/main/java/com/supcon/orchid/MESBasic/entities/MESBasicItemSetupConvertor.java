package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicItemSetupConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicItemSetupConvertor {
	
	public MESBasicItemSetupConvertor() {
	}
	
	public String getClassName() {
		return MESBasicItemSetup.class.getName();
	}
	
	private String code;
	
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}

	private String itemName;
	
	public String getItemName(){
		return itemName;
	}
	
	public void setItemName(String itemName){
		this.itemName = itemName;
	}
	
	
	public MESBasicItemSetupConvertor(String code, String itemName) {
		super();
		this.code = code;
		this.itemName = itemName;
	}
	

	
}
