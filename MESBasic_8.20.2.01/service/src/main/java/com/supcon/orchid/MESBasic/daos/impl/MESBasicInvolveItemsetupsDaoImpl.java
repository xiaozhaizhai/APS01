package com.supcon.orchid.MESBasic.daos.impl;
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
import com.supcon.orchid.MESBasic.daos.MESBasicInvolveItemsetupsDao;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.orm.dao.hibernate.ExtendedGenericDaoImpl;
import com.supcon.orchid.tree.TreeDaoImpl;

@Repository
public class MESBasicInvolveItemsetupsDaoImpl extends ExtendedGenericDaoImpl<MESBasicInvolveItemsetups, Long> implements MESBasicInvolveItemsetupsDao {
	
	@Override
	public DataClassific getDataClassific(String code) {
		return (DataClassific) getSession().createQuery("from DataClassific where code = ?").setParameter(0, code).uniqueResult();
	}
	/* CUSTOM CODE START(daoimpl,functions,MESBasic_1_routine_InvolveItemsetups,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}