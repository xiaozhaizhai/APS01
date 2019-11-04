package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMProdTaskProcExelogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMProdTaskProcExelogConvertor {
	
	public WOMProdTaskProcExelogConvertor() {
	}
	
	public String getClassName() {
		return WOMProdTaskProcExelog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMProdTaskProcExelogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
