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
 * MESBasic.modelname.randon1455958797173.
 * 第三方数据接口。 第三方系统将把与本系统交互的数据填写到这张表里与本系统进行交互。
 * 
 */
@javax.persistence.Entity(name=MESBasicPotDataDealInfo.JPA_NAME)
@Table(name = MESBasicPotDataDealInfo.TABLE_NAME)
public class MESBasicPotDataDealInfo extends com.supcon.orchid.orm.entities.AbstractDealInfoEntity implements com.supcon.orchid.orm.entities.IDealInfo {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "MESBASIC_POT_DATAS_DI";
	public static final String JPA_NAME = "MESBasicPotDataDealInfo";
	
	protected MESBasicPotData mainObj;
    protected Integer sort;

	@ManyToOne(fetch = FetchType.EAGER)
    public MESBasicPotData getMainObj() {
        return mainObj;
    }
    public void setMainObj(MESBasicPotData mainObj) {
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
		return MESBasicPotDataDealInfo.class.getName();
	}

	@Override
	@Index(name="IDX_POTDATA_DiTABLEID")
	public Long getTableInfoId() {
		return tableInfoId;
	}
}