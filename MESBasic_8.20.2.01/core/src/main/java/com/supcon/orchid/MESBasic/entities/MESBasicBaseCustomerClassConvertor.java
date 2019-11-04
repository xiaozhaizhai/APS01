package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBaseCustomerClassConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBaseCustomerClassConvertor {
	
	public MESBasicBaseCustomerClassConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBaseCustomerClass.class.getName();
	}
	
	private String ccCode;
	
	public String getCcCode(){
		return ccCode;
	}
	
	public void setCcCode(String ccCode){
		this.ccCode = ccCode;
	}

	private String ccName;
	
	public String getCcName(){
		return ccName;
	}
	
	public void setCcName(String ccName){
		this.ccName = ccName;
	}
	
	
	public MESBasicBaseCustomerClassConvertor(String ccCode, String ccName) {
		super();
		this.ccCode = ccCode;
		this.ccName = ccName;
	}
	

	
}
