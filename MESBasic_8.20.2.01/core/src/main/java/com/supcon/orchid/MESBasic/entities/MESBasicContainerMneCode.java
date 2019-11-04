package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.radion1415252141275.
 * 
 */
@javax.persistence.Entity(name=MESBasicContainerMneCode.JPA_NAME)
@Table(name = MESBasicContainerMneCode.TABLE_NAME)
@BAPMneField(name="container")
public class MESBasicContainerMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MESBASIC_CONTAINERS_MC";
	public static final String JPA_NAME = "MESBasicContainerMneCode";
	
	private String mneCode;
	
	private MESBasicContainer container;
	
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
    public MESBasicContainer getContainer() {
        return container;
    }
    
    public void setContainer(MESBasicContainer container) {
        this.container = container;
    }
	
	protected String _getEntityName() {
		return MESBasicContainerMneCode.class.getName();
	}

}