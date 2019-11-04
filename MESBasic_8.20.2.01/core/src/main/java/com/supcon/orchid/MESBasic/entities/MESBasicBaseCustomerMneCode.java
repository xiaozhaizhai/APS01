package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1449638984644.
 * 
 */
@javax.persistence.Entity(name=MESBasicBaseCustomerMneCode.JPA_NAME)
@Table(name = MESBasicBaseCustomerMneCode.TABLE_NAME)
@BAPMneField(name="baseCustomer")
public class MESBasicBaseCustomerMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "S2BASE_CUSTOMER_MC";
	public static final String JPA_NAME = "MESBasicBaseCustomerMneCode";
	
	private String mneCode;
	
	private MESBasicBaseCustomer baseCustomer;
	
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
    public MESBasicBaseCustomer getBaseCustomer() {
        return baseCustomer;
    }
    
    public void setBaseCustomer(MESBasicBaseCustomer baseCustomer) {
        this.baseCustomer = baseCustomer;
    }
	
	protected String _getEntityName() {
		return MESBasicBaseCustomerMneCode.class.getName();
	}

}