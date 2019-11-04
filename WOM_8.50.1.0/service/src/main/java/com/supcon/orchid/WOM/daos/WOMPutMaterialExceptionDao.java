package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMPutMaterialExceptionDealInfo;
import com.supcon.orchid.WOM.entities.WOMPutMaterialExceptionSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMPutMaterialExceptionDao extends
	ExtendedGenericDao<WOMPutMaterialException, Long>
 {
    void saveDealInfo(WOMPutMaterialExceptionDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMPutMaterialException mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMPutMaterialExceptionSupervision> findSupervision(Long tableInfoId);
	List<WOMPutMaterialExceptionSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMPutMaterialExceptionDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMPutMaterialExceptionDealInfo copyAndSaveDealInfo(DealInfo di, WOMPutMaterialException mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}