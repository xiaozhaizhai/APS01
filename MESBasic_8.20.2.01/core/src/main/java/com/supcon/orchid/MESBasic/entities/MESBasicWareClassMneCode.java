package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1516252171050.
 * 
 */
@javax.persistence.Entity(name=MESBasicWareClassMneCode.JPA_NAME)
@Table(name = MESBasicWareClassMneCode.TABLE_NAME)
@BAPMneField(name="wareClass")
public class MESBasicWareClassMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MATERIAL_WARE_CLASSES_MC";
	public static final String JPA_NAME = "MESBasicWareClassMneCode";
	
	private String mneCode;
	
	private MESBasicWareClass wareClass;
	
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
    public MESBasicWareClass getWareClass() {
        return wareClass;
    }
    
    public void setWareClass(MESBasicWareClass wareClass) {
        this.wareClass = wareClass;
    }
	
	protected String _getEntityName() {
		return MESBasicWareClassMneCode.class.getName();
	}

}