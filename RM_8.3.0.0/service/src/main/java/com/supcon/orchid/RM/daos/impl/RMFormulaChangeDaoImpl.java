package com.supcon.orchid.RM.daos.impl;
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
import com.supcon.orchid.RM.daos.RMFormulaChangeDao;
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.entities.RMFormulaChangeDealInfo;
import com.supcon.orchid.RM.entities.RMFormulaChangeSupervision;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.orm.dao.hibernate.ExtendedGenericDaoImpl;
import com.supcon.orchid.tree.TreeDaoImpl;

@Repository
public class RMFormulaChangeDaoImpl extends ExtendedGenericDaoImpl<RMFormulaChange, Long> implements RMFormulaChangeDao {
	@Override
	public void saveDealInfo(RMFormulaChangeDealInfo dealInfo){
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
	public RMFormulaChangeDealInfo copyAndSaveDealInfo(DealInfo di) {
		RMFormulaChangeDealInfo dealInfo = new RMFormulaChangeDealInfo();
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
	public RMFormulaChangeDealInfo copyAndSaveDealInfo(DealInfo di, RMFormulaChange mainObj, Staff dealStaff) {
		RMFormulaChangeDealInfo dealInfo = copyAndSaveDealInfo(di);
		dealInfo.setMainObj(mainObj);
		dealInfo.setStaff(dealStaff);
		saveDealInfo(dealInfo);
		return dealInfo;
	}
	
	@Override
	public Date findLastDealInfo(Long tableInfoId, String activityName) {
		Criteria criteria = getSession().createCriteria(RMFormulaChangeDealInfo.class);
		criteria.add(Restrictions.eq("tableInfoId", tableInfoId));
		criteria.add(Restrictions.eq("activityName", activityName));
		criteria.add(Restrictions.eq("dealInfoType", DealInfoType.NORMAL));
		criteria.setMaxResults(1);
		criteria.addOrder(Order.desc("createTime"));
		List<RMFormulaChangeDealInfo> dealinfo = criteria.list();
		return (dealinfo!=null&&!dealinfo.isEmpty()) ? dealinfo.get(0).getCreateTime() : null;
	}

	@Override
	public void addSupervision(Supervision supervision) {
		getSession().save(supervision);
		RMFormulaChangeSupervision RMFormulaChangeSupervision = new RMFormulaChangeSupervision();
		BeanUtils.copyProperties(supervision, RMFormulaChangeSupervision);
		RMFormulaChangeSupervision.setValid(true);
		getSession().save(RMFormulaChangeSupervision);
	}

	@Override
	public void addSupervision(Supervision supervision, RMFormulaChange mainObj) {
		getSession().save(supervision);
		RMFormulaChangeSupervision localSupervision = new RMFormulaChangeSupervision();
		BeanUtils.copyProperties(supervision, localSupervision);
		localSupervision.setValid(true);
		localSupervision.setMainObj(mainObj);
		getSession().save(localSupervision);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deleteSupervision(Long tableInfoId, List<Long> idList) {
		// getSession().delete(supervision);
		List<RMFormulaChangeSupervision> _supervisions = getSession().createCriteria(RMFormulaChangeSupervision.class)
				.add(Restrictions.eq("tableInfoId", tableInfoId)).add(Restrictions.in("staff.id", idList))
				.add(Restrictions.eq("valid", true)).list();
		for (RMFormulaChangeSupervision item : _supervisions) {
			item.setValid(false);
			getSession().save(item);
		}
		List<Supervision> supervisions = getSession().createCriteria(Supervision.class).add(Restrictions.eq("tableInfoId", tableInfoId))
				.add(Restrictions.in("staff.id", idList)).list();
		for (Supervision item : supervisions) {
			getSession().delete(item);
		}
	}
	@Override
	public void deleteSupervision(Long tableInfoId) {
		List<Supervision> supervisions = getSession().createCriteria(Supervision.class).add(Restrictions.eq("tableInfoId", tableInfoId))
				.list();
		for (Supervision item : supervisions) {
			getSession().delete(item);
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<RMFormulaChangeSupervision> findSupervision(Long tableInfoId) {
		List<RMFormulaChangeSupervision> supervisions = getSession().createCriteria(RMFormulaChangeSupervision.class)
				.add(Restrictions.eq("tableInfoId", tableInfoId)).add(Restrictions.eq("valid", true)).addOrder(Order.asc("id")).list();
		return supervisions;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<RMFormulaChangeSupervision> findSupervision(Long tableInfoId, Long StaffId) {
		List<RMFormulaChangeSupervision> supervisions = getSession().createCriteria(RMFormulaChangeSupervision.class)
				.add(Restrictions.eq("tableInfoId", tableInfoId)).add(Restrictions.eq("staff.id", StaffId)).add(Restrictions.eq("valid", true)).list();
		return supervisions;
	}
	/* CUSTOM CODE START(daoimpl,functions,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}