package com.supcon.orchid.RM.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * RM.modelname.randon1490317715550.
 * 
 */
@javax.persistence.Entity(name=RMSampleProjMneCode.JPA_NAME)
@Table(name = RMSampleProjMneCode.TABLE_NAME)
@BAPMneField(name="sampleProj")
public class RMSampleProjMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "LIMSBASIC_SAMPLE_PROJS_MC";
	public static final String JPA_NAME = "RMSampleProjMneCode";
	
	private String mneCode;
	
	private RMSampleProj sampleProj;
	
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
    public RMSampleProj getSampleProj() {
        return sampleProj;
    }
    
    public void setSampleProj(RMSampleProj sampleProj) {
        this.sampleProj = sampleProj;
    }
	
	protected String _getEntityName() {
		return RMSampleProjMneCode.class.getName();
	}

}