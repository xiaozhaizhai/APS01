package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMDayBatchPlanPartsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMDayBatchPlanPartsConvertor {
	
	public WOMDayBatchPlanPartsConvertor() {
	}
	
	public String getClassName() {
		return WOMDayBatchPlanParts.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMDayBatchPlanPartsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
