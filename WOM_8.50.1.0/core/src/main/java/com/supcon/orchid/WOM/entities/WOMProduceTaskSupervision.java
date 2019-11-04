package com.supcon.orchid.WOM.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;

import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.orm.entities.AbstractSupervisionEntity;
import com.supcon.orchid.orm.entities.IStaff;
/**
 * WOM.modelname.randon1489657901718.
 *
 */
@Entity(name=WOMProduceTaskSupervision.JPA_NAME)
@Table(name = WOMProduceTaskSupervision.TABLE_NAME)
public class WOMProduceTaskSupervision extends AbstractSupervisionEntity implements com.supcon.orchid.orm.entities.IValid {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "WOM_PRODUCE_TASKS_SV";
	public static final String JPA_NAME = "WOMProduceTaskSupervision";

	private boolean valid = true;

	protected String _getEntityName() {
		return WOMProduceTaskSupervision.class.getName();
	}

	protected WOMProduceTask mainObj;

	@ManyToOne(fetch = FetchType.EAGER)
    public WOMProduceTask getMainObj() {
        return mainObj;
    }
    public void setMainObj(WOMProduceTask mainObj) {
        this.mainObj = mainObj;
    }

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Staff.class)
	@JoinColumn(name = "staff", nullable = false)
	@Fetch(FetchMode.SELECT)
	public IStaff getStaff() {
		return staff;
	}

	@Index(name="IDX_PRODUCETASK_SuTABLEID")
	public Long getTableInfoId() {
		return tableInfoId;
	}

	@Override
	@Column(name = P_VALID, columnDefinition = P_VALID_TYPE, length=1, nullable=false)
	public boolean isValid() {
		return this.valid;
	}

	@Override
	public void setValid(boolean isValid) {
		this.valid = isValid;
	}
}