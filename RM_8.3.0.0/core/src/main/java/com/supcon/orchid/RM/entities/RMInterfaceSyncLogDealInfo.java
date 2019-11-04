package com.supcon.orchid.RM.entities;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;

import com.supcon.orchid.foundation.entities.Staff;

/**
 * RM.modelname.randon1493192745808.
 * 
 */
@javax.persistence.Entity(name=RMInterfaceSyncLogDealInfo.JPA_NAME)
@Table(name = RMInterfaceSyncLogDealInfo.TABLE_NAME)
public class RMInterfaceSyncLogDealInfo extends com.supcon.orchid.orm.entities.AbstractDealInfoEntity implements com.supcon.orchid.orm.entities.IDealInfo {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "INTERFACE_SYNC_LOG_DI";
	public static final String JPA_NAME = "RMInterfaceSyncLogDealInfo";
	
	protected RMInterfaceSyncLog mainObj;
    protected Integer sort;

	@ManyToOne(fetch = FetchType.EAGER)
    public RMInterfaceSyncLog getMainObj() {
        return mainObj;
    }
    public void setMainObj(RMInterfaceSyncLog mainObj) {
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
		return RMInterfaceSyncLogDealInfo.class.getName();
	}

	@Override
	@Index(name="IDX_INTERFACESYNCL_DiTABLEID")
	public Long getTableInfoId() {
		return tableInfoId;
	}
}