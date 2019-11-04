package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBaseCustomerConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBaseCustomerConvertor {
	
	public MESBasicBaseCustomerConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBaseCustomer.class.getName();
	}
	
	private String customerCode;
	
	public String getCustomerCode(){
		return customerCode;
	}
	
	public void setCustomerCode(String customerCode){
		this.customerCode = customerCode;
	}

	private String customerName;
	
	public String getCustomerName(){
		return customerName;
	}
	
	public void setCustomerName(String customerName){
		this.customerName = customerName;
	}
	
	
	public MESBasicBaseCustomerConvertor(String customerCode, String customerName) {
		super();
		this.customerCode = customerCode;
		this.customerName = customerName;
	}
	

	
}
