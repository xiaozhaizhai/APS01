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
import com.supcon.orchid.X6Basic.daos.X6BasicSpellRuleDao;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRuleDealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.orm.dao.hibernate.ExtendedGenericDaoImpl;
import com.supcon.orchid.tree.TreeDaoImpl;

@Repository
public class X6BasicSpellRuleDaoImpl extends ExtendedGenericDaoImpl<X6BasicSpellRule, Long> implements X6BasicSpellRuleDao {
	@Override
	public void saveDealInfo(X6BasicSpellRuleDealInfo dealInfo){
		getSession().save(dealInfo);
	}
	@Override
	public void saveTableInfo(EntityTableInfo tableInfo) {
		getSession().save(tableInfo);
	}
	@Override
	public EntityTableInfo getTableInfo(Long tableInfoId) {
		return (EntityTableInfo) getSession().get(EntityTableInfo.class, tableInfoId);
	}
	
	@Override
	public DataClassific getDataClassific(String code) {
		return (DataClassific) getSession().createQuery("from DataClassific where code = ?").setParameter(0, code).uniqueResult();
	}
	@Override
	public X6BasicSpellRuleDealInfo copyAndSaveDealInfo(DealInfo di) {
		X6BasicSpellRuleDealInfo dealInfo = new X6BasicSpellRuleDealInfo();
		dealInfo.setActivityName(di.getActivityName());
		dealInfo.setComments(di.getComments());
		dealInfo.setCreateTime(di.getCreateTime());
		dealInfo.setEntityCode(di.getEntityCode());
		dealInfo.setInstanceId(di.getInstanceId());
		dealInfo.setOutcome(di.getOutcome());
		dealInfo.setOutcomeDes(di.getOutcomeDes());
		dealInfo.setProcessKey(di.getProcessKey());
		dealInfo.setProcessVersion(di.getProcessVersion());
		dealInfo.setTableInfoId(di.getTableInfoId());
		dealInfo.setTaskDescription(di.getTaskDescription());
		dealInfo.setUserId(di.getUserId());
		dealInfo.setCreateTime(new Date());
		dealInfo.setDealInfoType(di.getDealInfoType());
		dealInfo.setAssignStaff(di.getAssignStaff());
		dealInfo.setAssignStaffId(di.getAssignStaffId());
		dealInfo.setProxyStaff(di.getProxyStaff());
		dealInfo.setProxyStaffIds(di.getProxyStaffIds());
		dealInfo.setPendingCreateTime(di.getPendingCreateTime());
		dealInfo.setSignature(di.getSignature());
		saveDealInfo(dealInfo);
		return dealInfo;
	}

	@Override
	public X6BasicSpellRuleDealInfo copyAndSaveDealInfo(DealInfo di, X6BasicSpellRule mainObj, Staff dealStaff) {
		X6BasicSpellRuleDealInfo dealInfo = copyAndSaveDealInfo(di);
		dealInfo.setMainObj(mainObj);
		dealInfo.setStaff(dealStaff);
		saveDealInfo(dealInfo);
		return dealInfo;
	}
	
	@Override
	public Date findLastDealInfo(Long tableInfoId, String activityName) {
		Criteria criteria = getSession().createCriteria(X6BasicSpellRuleDealInfo.class);
		criteria.add(Restrictions.eq("tableInfoId", tableInfoId));
		criteria.add(Restrictions.eq("activityName", activityName));
		criteria.add(Restrictions.eq("dealInfoType", DealInfoType.NORMAL));
		criteria.setMaxResults(1);
		criteria.addOrder(Order.desc("createTime"));
		List<X6BasicSpellRuleDealInfo> dealinfo = criteria.list();
		return (dealinfo!=null&&!dealinfo.isEmpty()) ? dealinfo.get(0).getCreateTime() : null;
	}

	/* CUSTOM CODE START(daoimpl,functions,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}