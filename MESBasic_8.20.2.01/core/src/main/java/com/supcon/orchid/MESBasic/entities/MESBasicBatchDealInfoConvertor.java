package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBatchDealInfoConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBatchDealInfoConvertor {
	
	public MESBasicBatchDealInfoConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBatchDealInfo.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicBatchDealInfoConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
