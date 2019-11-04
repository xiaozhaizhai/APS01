package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchProduceTaskConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchProduceTaskConvertor {
	
	public WOMBatchProduceTaskConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchProduceTask.class.getName();
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

	
	public WOMBatchProduceTaskConvertor(String tableNo, Long id) {
		super();
		this.tableNo = tableNo;
		this.id = id;
	}
	

	
}
