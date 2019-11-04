package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1414982248486.
 * 
 */
@javax.persistence.Entity(name=MESBasicTagPropertyMneCode.JPA_NAME)
@Table(name = MESBasicTagPropertyMneCode.TABLE_NAME)
@BAPMneField(name="tagProperty")
public class MESBasicTagPropertyMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MESBASIC_TAG_PROPERTIES_MC";
	public static final String JPA_NAME = "MESBasicTagPropertyMneCode";
	
	private String mneCode;
	
	private MESBasicTagProperty tagProperty;
	
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
    public MESBasicTagProperty getTagProperty() {
        return tagProperty;
    }
    
    public void setTagProperty(MESBasicTagProperty tagProperty) {
        this.tagProperty = tagProperty;
    }
	
	protected String _getEntityName() {
		return MESBasicTagPropertyMneCode.class.getName();
	}

}