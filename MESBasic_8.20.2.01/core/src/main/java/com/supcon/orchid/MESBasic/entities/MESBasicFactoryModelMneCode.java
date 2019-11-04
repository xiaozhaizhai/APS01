package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1419232346350.
 * 与PIMS使用相同的数据结构。
 * 
 */
@javax.persistence.Entity(name=MESBasicFactoryModelMneCode.JPA_NAME)
@Table(name = MESBasicFactoryModelMneCode.TABLE_NAME)
@BAPMneField(name="factoryModel")
public class MESBasicFactoryModelMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "factory_tbcompanystructure_MC";
	public static final String JPA_NAME = "MESBasicFactoryModelMneCode";
	
	private String mneCode;
	
	private MESBasicFactoryModel factoryModel;
	
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
    public MESBasicFactoryModel getFactoryModel() {
        return factoryModel;
    }
    
    public void setFactoryModel(MESBasicFactoryModel factoryModel) {
        this.factoryModel = factoryModel;
    }
	
	protected String _getEntityName() {
		return MESBasicFactoryModelMneCode.class.getName();
	}

}