package com.supcon.orchid.WOM.daos.impl;
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
import com.supcon.orchid.WOM.daos.WOMAdjustOrTempRecordsDao;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempRecords;
import com.supcon.orchid.orm.dao.hibernate.ExtendedGenericDaoImpl;
import com.supcon.orchid.tree.TreeDaoImpl;

@Repository
public class WOMAdjustOrTempRecordsDaoImpl extends ExtendedGenericDaoImpl<WOMAdjustOrTempRecords, Long> implements WOMAdjustOrTempRecordsDao {
	
	@Override
	public DataClassific getDataClassific(String code) {
		return (DataClassific) getSession().createQuery("from DataClassific where code = ?").setParameter(0, code).uniqueResult();
	}
	/* CUSTOM CODE START(daoimpl,functions,WOM_7.5.0.0_produceTask_AdjustOrTempRecords,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}