package com.supcon.orchid.X6Basic.entities;

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
 * X6Basic.modelname.radion1379485695460.
 *
 * @author 1002
 * 
 */
@Entity(name=X6BasicDocumentClassesSupervision.JPA_NAME)
@Table(name = X6BasicDocumentClassesSupervision.TABLE_NAME)
public class X6BasicDocumentClassesSupervision extends AbstractSupervisionEntity implements com.supcon.orchid.orm.entities.IValid {
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "X6BASIC_DOCUMENT_CLASSES_SV";
	public static final String JPA_NAME = "X6BasicDocumentClassesSupervision";

	private boolean valid = true;

	protected String _getEntityName() {
		return X6BasicDocumentClassesSupervision.class.getName();
	}

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Staff.class)
	@JoinColumn(name = "staff", nullable = false)
	@Fetch(FetchMode.SELECT)
	public IStaff getStaff() {
		return staff;
	}

	@Index(name="IDX_DOCUMENTCLASSE_SuTABLEID")
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