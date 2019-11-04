package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialDealInfo;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMPrepareMaterialDao extends
	ExtendedGenericDao<WOMPrepareMaterial, Long>
 {
    void saveDealInfo(WOMPrepareMaterialDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMPrepareMaterial mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMPrepareMaterialSupervision> findSupervision(Long tableInfoId);
	List<WOMPrepareMaterialSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMPrepareMaterialDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMPrepareMaterialDealInfo copyAndSaveDealInfo(DealInfo di, WOMPrepareMaterial mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}