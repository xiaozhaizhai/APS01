package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicProductConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicProductConvertor {
	
	public MESBasicProductConvertor() {
	}
	
	public String getClassName() {
		return MESBasicProduct.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	private String productName;
	
	public String getProductName(){
		return productName;
	}
	
	public void setProductName(String productName){
		this.productName = productName;
	}
	
	
	public MESBasicProductConvertor(Long id, String productName) {
		super();
		this.id = id;
		this.productName = productName;
	}
	

	
}
