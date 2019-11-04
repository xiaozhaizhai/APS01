package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMPutInMaterialConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMPutInMaterialConvertor {
	
	public WOMPutInMaterialConvertor() {
	}
	
	public String getClassName() {
		return WOMPutInMaterial.class.getName();
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

	
	public WOMPutInMaterialConvertor(String tableNo, Long id) {
		super();
		this.tableNo = tableNo;
		this.id = id;
	}
	

	
}
