package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface MESBasicCprodAttDao extends
	ExtendedGenericDao<MESBasicCprodAtt, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_product_CprodAtt,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}