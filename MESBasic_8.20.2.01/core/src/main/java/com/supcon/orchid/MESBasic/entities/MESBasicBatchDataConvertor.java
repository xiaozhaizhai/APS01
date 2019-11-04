package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicBatchDataConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicBatchDataConvertor {
	
	public MESBasicBatchDataConvertor() {
	}
	
	public String getClassName() {
		return MESBasicBatchData.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	private String tag;
	
	public String getTag(){
		return tag;
	}
	
	public void setTag(String tag){
		this.tag = tag;
	}
	
	
	public MESBasicBatchDataConvertor(Long id, String tag) {
		super();
		this.id = id;
		this.tag = tag;
	}
	

	
}
