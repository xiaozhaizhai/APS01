package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBaseProdListConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBaseProdListConvertor {
	
	public MESBasicBaseProdListConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBaseProdList.class.getName();
	}
	
	private String prodListCode;
	
	public String getProdListCode(){
		return prodListCode;
	}
	
	public void setProdListCode(String prodListCode){
		this.prodListCode = prodListCode;
	}

	private String prodListName;
	
	public String getProdListName(){
		return prodListName;
	}
	
	public void setProdListName(String prodListName){
		this.prodListName = prodListName;
	}
	
	
	public MESBasicBaseProdListConvertor(String prodListCode, String prodListName) {
		super();
		this.prodListCode = prodListCode;
		this.prodListName = prodListName;
	}
	

	
}
