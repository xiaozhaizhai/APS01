package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMAdjustOrTempRecordsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMAdjustOrTempRecordsConvertor {
	
	public WOMAdjustOrTempRecordsConvertor() {
	}
	
	public String getClassName() {
		return WOMAdjustOrTempRecords.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMAdjustOrTempRecordsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
