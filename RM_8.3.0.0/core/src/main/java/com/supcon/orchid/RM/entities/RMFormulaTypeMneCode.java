package com.supcon.orchid.RM.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * RM.modelname.randon1497578145747.
 * 
 */
@javax.persistence.Entity(name=RMFormulaTypeMneCode.JPA_NAME)
@Table(name = RMFormulaTypeMneCode.TABLE_NAME)
@BAPMneField(name="formulaType")
public class RMFormulaTypeMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "RM_FORMULA_TYPES_MC";
	public static final String JPA_NAME = "RMFormulaTypeMneCode";
	
	private String mneCode;
	
	private RMFormulaType formulaType;
	
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
    public RMFormulaType getFormulaType() {
        return formulaType;
    }
    
    public void setFormulaType(RMFormulaType formulaType) {
        this.formulaType = formulaType;
    }
	
	protected String _getEntityName() {
		return RMFormulaTypeMneCode.class.getName();
	}

}