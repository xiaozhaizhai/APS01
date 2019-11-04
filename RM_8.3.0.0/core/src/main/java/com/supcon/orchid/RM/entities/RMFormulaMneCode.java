package com.supcon.orchid.RM.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * RM.modelname.randon1487075762209.
 * 
 */
@javax.persistence.Entity(name=RMFormulaMneCode.JPA_NAME)
@Table(name = RMFormulaMneCode.TABLE_NAME)
@BAPMneField(name="formula")
public class RMFormulaMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "RM_FORMULAS_MC";
	public static final String JPA_NAME = "RMFormulaMneCode";
	
	private String mneCode;
	
	private RMFormula formula;
	
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
    public RMFormula getFormula() {
        return formula;
    }
    
    public void setFormula(RMFormula formula) {
        this.formula = formula;
    }
	
	protected String _getEntityName() {
		return RMFormulaMneCode.class.getName();
	}

}