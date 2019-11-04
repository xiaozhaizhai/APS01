package com.supcon.orchid.MESBasic.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * MESBasic.modelname.randon1460947310555.
 * 
 */
@javax.persistence.Entity(name=MESBasicNodeTypeMneCode.JPA_NAME)
@Table(name = MESBasicNodeTypeMneCode.TABLE_NAME)
@BAPMneField(name="nodeType")
public class MESBasicNodeTypeMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "factory_tbnodetype_MC";
	public static final String JPA_NAME = "MESBasicNodeTypeMneCode";
	
	private String mneCode;
	
	private MESBasicNodeType nodeType;
	
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
    public MESBasicNodeType getNodeType() {
        return nodeType;
    }
    
    public void setNodeType(MESBasicNodeType nodeType) {
        this.nodeType = nodeType;
    }
	
	protected String _getEntityName() {
		return MESBasicNodeTypeMneCode.class.getName();
	}

}