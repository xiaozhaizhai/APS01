package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1449628207713.
 * 
 */
@javax.persistence.Entity(name=MESBasicBaseCustomerClassMneCode.JPA_NAME)
@Table(name = MESBasicBaseCustomerClassMneCode.TABLE_NAME)
@BAPMneField(name="baseCustomerClass")
public class MESBasicBaseCustomerClassMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "S2BASE_CUSTOMERCLASS_MC";
	public static final String JPA_NAME = "MESBasicBaseCustomerClassMneCode";
	
	private String mneCode;
	
	private MESBasicBaseCustomerClass baseCustomerClass;
	
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
    public MESBasicBaseCustomerClass getBaseCustomerClass() {
        return baseCustomerClass;
    }
    
    public void setBaseCustomerClass(MESBasicBaseCustomerClass baseCustomerClass) {
        this.baseCustomerClass = baseCustomerClass;
    }
	
	protected String _getEntityName() {
		return MESBasicBaseCustomerClassMneCode.class.getName();
	}

}