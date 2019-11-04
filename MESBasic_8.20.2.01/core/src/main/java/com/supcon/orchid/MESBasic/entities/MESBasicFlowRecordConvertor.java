package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicFlowRecordConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicFlowRecordConvertor {
	
	public MESBasicFlowRecordConvertor() {
	}
	
	public String getClassName() {
		return MESBasicFlowRecord.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicFlowRecordConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
