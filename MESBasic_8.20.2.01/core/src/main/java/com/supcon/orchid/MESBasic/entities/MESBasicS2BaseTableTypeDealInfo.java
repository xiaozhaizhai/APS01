package com.supcon.orchid.MESBasic.entities;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;

import com.supcon.orchid.foundation.entities.Staff;

/**
 * MESBasic.modelname.randon1451285573502.
 * 
 */
@javax.persistence.Entity(name=MESBasicS2BaseTableTypeDealInfo.JPA_NAME)
@Table(name = MESBasicS2BaseTableTypeDealInfo.TABLE_NAME)
public class MESBasicS2BaseTableTypeDealInfo extends com.supcon.orchid.orm.entities.AbstractDealInfoEntity implements com.supcon.orchid.orm.entities.IDealInfo {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "S2BASE_TABLETYPE_DI";
	public static final String JPA_NAME = "MESBasicS2BaseTableTypeDealInfo";
	
	protected MESBasicS2BaseTableType mainObj;
    protected Integer sort;

	@ManyToOne(fetch = FetchType.EAGER)
    public MESBasicS2BaseTableType getMainObj() {
        return mainObj;
    }
    public void setMainObj(MESBasicS2BaseTableType mainObj) {
        this.mainObj = mainObj;
    }
    
    /**
	 * @return the sort
	 */
	public Integer getSort() {
		return sort;
	}

	/**
	 * @param sort the sort to set
	 */
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	protected Staff staff;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Staff.class)
	@Fetch(FetchMode.SELECT)
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	protected Boolean recalledFlag = false;

	public void setRecalledFlag(Boolean recalledFlag) {
		this.recalledFlag = recalledFlag;
	}

	public Boolean getRecalledFlag() {
		return recalledFlag;
	}

	protected String userAgent;

	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	protected String _getEntityName() {
		return MESBasicS2BaseTableTypeDealInfo.class.getName();
	}

	@Override
	@Index(name="IDX_S2BASETABLETYP_DiTABLEID")
	public Long getTableInfoId() {
		return tableInfoId;
	}
}