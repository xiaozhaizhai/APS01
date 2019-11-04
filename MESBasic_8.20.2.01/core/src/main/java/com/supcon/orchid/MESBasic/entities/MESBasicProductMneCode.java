package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1415772316600.
 * 引用自S2的物品表
 * 
 */
@javax.persistence.Entity(name=MESBasicProductMneCode.JPA_NAME)
@Table(name = MESBasicProductMneCode.TABLE_NAME)
@BAPMneField(name="product")
public class MESBasicProductMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "S2BASE_PRODUCT_MC";
	public static final String JPA_NAME = "MESBasicProductMneCode";
	
	private String mneCode;
	
	private MESBasicProduct product;
	
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
    public MESBasicProduct getProduct() {
        return product;
    }
    
    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }
	
	protected String _getEntityName() {
		return MESBasicProductMneCode.class.getName();
	}

}