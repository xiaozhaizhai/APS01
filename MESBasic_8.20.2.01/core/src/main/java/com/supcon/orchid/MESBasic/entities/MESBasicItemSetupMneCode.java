package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1415258423663.
 * 
 */
@javax.persistence.Entity(name=MESBasicItemSetupMneCode.JPA_NAME)
@Table(name = MESBasicItemSetupMneCode.TABLE_NAME)
@BAPMneField(name="itemSetup")
public class MESBasicItemSetupMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "PELLET_ITEMSETUP_MC";
	public static final String JPA_NAME = "MESBasicItemSetupMneCode";
	
	private String mneCode;
	
	private MESBasicItemSetup itemSetup;
	
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
    public MESBasicItemSetup getItemSetup() {
        return itemSetup;
    }
    
    public void setItemSetup(MESBasicItemSetup itemSetup) {
        this.itemSetup = itemSetup;
    }
	
	protected String _getEntityName() {
		return MESBasicItemSetupMneCode.class.getName();
	}

}