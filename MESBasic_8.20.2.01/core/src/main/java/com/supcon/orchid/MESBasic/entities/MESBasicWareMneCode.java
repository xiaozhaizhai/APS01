package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1484031011977.
 * 
 */
@javax.persistence.Entity(name=MESBasicWareMneCode.JPA_NAME)
@Table(name = MESBasicWareMneCode.TABLE_NAME)
@BAPMneField(name="ware")
public class MESBasicWareMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MATERIAL_WARES_MC";
	public static final String JPA_NAME = "MESBasicWareMneCode";
	
	private String mneCode;
	
	private MESBasicWare ware;
	
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
    public MESBasicWare getWare() {
        return ware;
    }
    
    public void setWare(MESBasicWare ware) {
        this.ware = ware;
    }
	
	protected String _getEntityName() {
		return MESBasicWareMneCode.class.getName();
	}

}