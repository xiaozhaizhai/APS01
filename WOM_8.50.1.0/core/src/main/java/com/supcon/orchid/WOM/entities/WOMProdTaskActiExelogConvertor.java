package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMProdTaskActiExelogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMProdTaskActiExelogConvertor {
	
	public WOMProdTaskActiExelogConvertor() {
	}
	
	public String getClassName() {
		return WOMProdTaskActiExelog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMProdTaskActiExelogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
