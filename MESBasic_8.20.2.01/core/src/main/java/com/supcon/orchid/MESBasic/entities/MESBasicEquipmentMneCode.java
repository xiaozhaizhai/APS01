package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1423967194871.
 * 
 */
@javax.persistence.Entity(name=MESBasicEquipmentMneCode.JPA_NAME)
@Table(name = MESBasicEquipmentMneCode.TABLE_NAME)
@BAPMneField(name="equipment")
public class MESBasicEquipmentMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "EAM_BASEINFO_MC";
	public static final String JPA_NAME = "MESBasicEquipmentMneCode";
	
	private String mneCode;
	
	private MESBasicEquipment equipment;
	
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
    public MESBasicEquipment getEquipment() {
        return equipment;
    }
    
    public void setEquipment(MESBasicEquipment equipment) {
        this.equipment = equipment;
    }
	
	protected String _getEntityName() {
		return MESBasicEquipmentMneCode.class.getName();
	}

}