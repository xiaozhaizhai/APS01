package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMPrepareMaterialConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMPrepareMaterialConvertor {
	
	public WOMPrepareMaterialConvertor() {
	}
	
	public String getClassName() {
		return WOMPrepareMaterial.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	
	private String tableNo;
	
	public String getTableNo(){
		return tableNo;
	}
	
	public void setTableNo(String tableNo){
		this.tableNo = tableNo;
	}

	
	public WOMPrepareMaterialConvertor(String tableNo, Long id) {
		super();
		this.tableNo = tableNo;
		this.id = id;
	}
	

	
}
