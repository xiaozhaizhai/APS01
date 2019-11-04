package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1516068385649.
 * 
 */
@javax.persistence.Entity(name=MESBasicEamTypeMneCode.JPA_NAME)
@Table(name = MESBasicEamTypeMneCode.TABLE_NAME)
@BAPMneField(name="eamType")
public class MESBasicEamTypeMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "EAM_EAMTYPE_MC";
	public static final String JPA_NAME = "MESBasicEamTypeMneCode";
	
	private String mneCode;
	
	private MESBasicEamType eamType;
	
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
    public MESBasicEamType getEamType() {
        return eamType;
    }
    
    public void setEamType(MESBasicEamType eamType) {
        this.eamType = eamType;
    }
	
	protected String _getEntityName() {
		return MESBasicEamTypeMneCode.class.getName();
	}

}