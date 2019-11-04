package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1449472699525.
 * 
 */
@javax.persistence.Entity(name=MESBasicBaseVendorClassMneCode.JPA_NAME)
@Table(name = MESBasicBaseVendorClassMneCode.TABLE_NAME)
@BAPMneField(name="baseVendorClass")
public class MESBasicBaseVendorClassMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "S2BASE_VENDORCLASS_MC";
	public static final String JPA_NAME = "MESBasicBaseVendorClassMneCode";
	
	private String mneCode;
	
	private MESBasicBaseVendorClass baseVendorClass;
	
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
    public MESBasicBaseVendorClass getBaseVendorClass() {
        return baseVendorClass;
    }
    
    public void setBaseVendorClass(MESBasicBaseVendorClass baseVendorClass) {
        this.baseVendorClass = baseVendorClass;
    }
	
	protected String _getEntityName() {
		return MESBasicBaseVendorClassMneCode.class.getName();
	}

}