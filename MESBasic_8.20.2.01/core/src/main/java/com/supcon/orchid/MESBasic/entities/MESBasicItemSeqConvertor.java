package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicItemSeqConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicItemSeqConvertor {
	
	public MESBasicItemSeqConvertor() {
	}
	
	public String getClassName() {
		return MESBasicItemSeq.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicItemSeqConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
