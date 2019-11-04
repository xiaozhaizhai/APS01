package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1419849716922.
 * 
 */
@javax.persistence.Entity(name=MESBasicProducttypeMneCode.JPA_NAME)
@Table(name = MESBasicProducttypeMneCode.TABLE_NAME)
@BAPMneField(name="producttype")
public class MESBasicProducttypeMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MESBASIC_PRODUCTTYPES_MC";
	public static final String JPA_NAME = "MESBasicProducttypeMneCode";
	
	private String mneCode;
	
	private MESBasicProducttype producttype;
	
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
    public MESBasicProducttype getProducttype() {
        return producttype;
    }
    
    public void setProducttype(MESBasicProducttype producttype) {
        this.producttype = producttype;
    }
	
	protected String _getEntityName() {
		return MESBasicProducttypeMneCode.class.getName();
	}

}