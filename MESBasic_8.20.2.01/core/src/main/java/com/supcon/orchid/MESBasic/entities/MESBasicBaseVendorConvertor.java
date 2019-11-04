package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBaseVendorConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBaseVendorConvertor {
	
	public MESBasicBaseVendorConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBaseVendor.class.getName();
	}
	
	private String vendorCode;
	
	public String getVendorCode(){
		return vendorCode;
	}
	
	public void setVendorCode(String vendorCode){
		this.vendorCode = vendorCode;
	}

	private String vendorName;
	
	public String getVendorName(){
		return vendorName;
	}
	
	public void setVendorName(String vendorName){
		this.vendorName = vendorName;
	}
	
	
	public MESBasicBaseVendorConvertor(String vendorCode, String vendorName) {
		super();
		this.vendorCode = vendorCode;
		this.vendorName = vendorName;
	}
	

	
}
