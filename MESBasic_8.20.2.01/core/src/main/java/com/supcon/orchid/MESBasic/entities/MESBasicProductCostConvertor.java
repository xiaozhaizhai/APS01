package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicProductCostConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicProductCostConvertor {
	
	public MESBasicProductCostConvertor() {
	}
	
	public String getClassName() {
		return MESBasicProductCost.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicProductCostConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
