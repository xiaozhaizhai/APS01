package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicPurchGroupMemberConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicPurchGroupMemberConvertor {
	
	public MESBasicPurchGroupMemberConvertor() {
	}
	
	public String getClassName() {
		return MESBasicPurchGroupMember.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicPurchGroupMemberConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
