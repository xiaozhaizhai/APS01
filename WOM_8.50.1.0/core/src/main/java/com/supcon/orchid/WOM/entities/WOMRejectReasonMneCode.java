package com.supcon.orchid.WOM.entities;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

import com.supcon.orchid.annotation.BAPMneField;
/**
 * WOM.modelname.randon1543218738977.
 * 
 */
@javax.persistence.Entity(name=WOMRejectReasonMneCode.JPA_NAME)
@Table(name = WOMRejectReasonMneCode.TABLE_NAME)
@BAPMneField(name="rejectReason")
public class WOMRejectReasonMneCode extends com.supcon.orchid.orm.entities.IdEntity {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "WOM_REJECT_REASONS_MC";
	public static final String JPA_NAME = "WOMRejectReasonMneCode";
	
	private String mneCode;
	
	private WOMRejectReason rejectReason;
	
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
    public WOMRejectReason getRejectReason() {
        return rejectReason;
    }
    
    public void setRejectReason(WOMRejectReason rejectReason) {
        this.rejectReason = rejectReason;
    }
	
	protected String _getEntityName() {
		return WOMRejectReasonMneCode.class.getName();
	}

}