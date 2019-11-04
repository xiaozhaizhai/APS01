package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicMESServicesConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicMESServicesConvertor {
	
	public MESBasicMESServicesConvertor() {
	}
	
	public String getClassName() {
		return MESBasicMESServices.class.getName();
	}
	
	private String serviceCode;
	
	public String getServiceCode(){
		return serviceCode;
	}
	
	public void setServiceCode(String serviceCode){
		this.serviceCode = serviceCode;
	}

	private String serviceName;
	
	public String getServiceName(){
		return serviceName;
	}
	
	public void setServiceName(String serviceName){
		this.serviceName = serviceName;
	}
	
	
	public MESBasicMESServicesConvertor(String serviceCode, String serviceName) {
		super();
		this.serviceCode = serviceCode;
		this.serviceName = serviceName;
	}
	

	
}
