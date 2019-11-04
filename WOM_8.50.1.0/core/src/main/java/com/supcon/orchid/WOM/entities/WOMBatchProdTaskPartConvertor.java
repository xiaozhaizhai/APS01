package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchProdTaskPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchProdTaskPartConvertor {
	
	public WOMBatchProdTaskPartConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchProdTaskPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchProdTaskPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
