package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1449536448032.
 * 
 */
@javax.persistence.Entity(name=MESBasicBaseVendorMneCode.JPA_NAME)
@Table(name = MESBasicBaseVendorMneCode.TABLE_NAME)
@BAPMneField(name="baseVendor")
public class MESBasicBaseVendorMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "S2BASE_VENDOR_MC";
	public static final String JPA_NAME = "MESBasicBaseVendorMneCode";
	
	private String mneCode;
	
	private MESBasicBaseVendor baseVendor;
	
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
    public MESBasicBaseVendor getBaseVendor() {
        return baseVendor;
    }
    
    public void setBaseVendor(MESBasicBaseVendor baseVendor) {
        this.baseVendor = baseVendor;
    }
	
	protected String _getEntityName() {
		return MESBasicBaseVendorMneCode.class.getName();
	}

}