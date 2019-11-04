package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchTraceConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchTraceConvertor {
	
	public WOMBatchTraceConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchTrace.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchTraceConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
