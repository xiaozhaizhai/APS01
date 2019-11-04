package com.supcon.orchid.X6Basic.daos.impl;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.BeanUtils;
import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import org.springframework.stereotype.Repository;
import com.supcon.orchid.orm.enums.DealInfoType;
import com.supcon.orchid.X6Basic.daos.UsedRecordDao;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.orm.dao.hibernate.ExtendedGenericDaoImpl;
import com.supcon.orchid.tree.TreeDaoImpl;

@Repository
public class UsedRecordDaoImpl extends ExtendedGenericDaoImpl<UsedRecord, Long> implements UsedRecordDao {
	
	@Override
	public DataClassific getDataClassific(String code) {
		return (DataClassific) getSession().createQuery("from DataClassific where code = ?").setParameter(0, code).uniqueResult();
	}
	/* CUSTOM CODE START(daoimpl,functions,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}