package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMActiveExelogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMActiveExelogConvertor {
	
	public WOMActiveExelogConvertor() {
	}
	
	public String getClassName() {
		return WOMActiveExelog.class.getName();
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

	
	public WOMActiveExelogConvertor(String tableNo, Long id) {
		super();
		this.tableNo = tableNo;
		this.id = id;
	}
	

	
}
