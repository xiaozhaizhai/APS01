package com.supcon.orchid.WOM.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * WOM.modelname.randon1490064355590.
 * 
 */
@javax.persistence.Entity(name=WOMStandingcropRefMneCode.JPA_NAME)
@Table(name = WOMStandingcropRefMneCode.TABLE_NAME)
@BAPMneField(name="standingcropRef")
public class WOMStandingcropRefMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MATERIAL_STANDINGCROPS_MC";
	public static final String JPA_NAME = "WOMStandingcropRefMneCode";
	
	private String mneCode;
	
	private WOMStandingcropRef standingcropRef;
	
	/**
	 * 获取助记码数据.
	 * @return 助记码数据
	 */
	@Column(nullable=true)
    public String getMneCode() {
        return mneCode;
    }
	/**
	 *  设置助记码数据.
	 * @param name 助记码数据
	 */
    public void setMneCode(String mneCode) {
        this.mneCode = mneCode;
    }		
			
	@ManyToOne	
    public WOMStandingcropRef getStandingcropRef() {
        return standingcropRef;
    }
    
    public void setStandingcropRef(WOMStandingcropRef standingcropRef) {
        this.standingcropRef = standingcropRef;
    }
	
	protected String _getEntityName() {
		return WOMStandingcropRefMneCode.class.getName();
	}

}