package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1524635769096.
 * 
 */
@javax.persistence.Entity(name=MESBasicAreaMneCode.JPA_NAME)
@Table(name = MESBasicAreaMneCode.TABLE_NAME)
@BAPMneField(name="area")
public class MESBasicAreaMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "BEAM_AREAS_MC";
	public static final String JPA_NAME = "MESBasicAreaMneCode";
	
	private String mneCode;
	
	private MESBasicArea area;
	
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
    public MESBasicArea getArea() {
        return area;
    }
    
    public void setArea(MESBasicArea area) {
        this.area = area;
    }
	
	protected String _getEntityName() {
		return MESBasicAreaMneCode.class.getName();
	}

}