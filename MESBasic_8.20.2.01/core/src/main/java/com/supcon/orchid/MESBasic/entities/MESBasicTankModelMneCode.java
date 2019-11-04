package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1415150418847.
 * 储罐的型号配置，提供针对一个储罐的液位差与体积的换算关系。
 * 
 */
@javax.persistence.Entity(name=MESBasicTankModelMneCode.JPA_NAME)
@Table(name = MESBasicTankModelMneCode.TABLE_NAME)
@BAPMneField(name="tankModel")
public class MESBasicTankModelMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MESBASIC_TANK_MODELS_MC";
	public static final String JPA_NAME = "MESBasicTankModelMneCode";
	
	private String mneCode;
	
	private MESBasicTankModel tankModel;
	
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
    public MESBasicTankModel getTankModel() {
        return tankModel;
    }
    
    public void setTankModel(MESBasicTankModel tankModel) {
        this.tankModel = tankModel;
    }
	
	protected String _getEntityName() {
		return MESBasicTankModelMneCode.class.getName();
	}

}