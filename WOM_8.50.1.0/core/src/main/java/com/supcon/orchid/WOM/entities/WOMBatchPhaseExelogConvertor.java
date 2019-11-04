package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchPhaseExelogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchPhaseExelogConvertor {
	
	public WOMBatchPhaseExelogConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchPhaseExelog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchPhaseExelogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
