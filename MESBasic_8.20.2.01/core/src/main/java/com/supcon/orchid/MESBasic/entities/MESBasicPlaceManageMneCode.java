package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1418607150650.
 * 
 */
@javax.persistence.Entity(name=MESBasicPlaceManageMneCode.JPA_NAME)
@Table(name = MESBasicPlaceManageMneCode.TABLE_NAME)
@BAPMneField(name="placeManage")
public class MESBasicPlaceManageMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MESBASIC_PLACE_MENAGE_MC";
	public static final String JPA_NAME = "MESBasicPlaceManageMneCode";
	
	private String mneCode;
	
	private MESBasicPlaceManage placeManage;
	
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
    public MESBasicPlaceManage getPlaceManage() {
        return placeManage;
    }
    
    public void setPlaceManage(MESBasicPlaceManage placeManage) {
        this.placeManage = placeManage;
    }
	
	protected String _getEntityName() {
		return MESBasicPlaceManageMneCode.class.getName();
	}

}