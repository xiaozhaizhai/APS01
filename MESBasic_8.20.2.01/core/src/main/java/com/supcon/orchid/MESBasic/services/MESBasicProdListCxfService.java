package com.supcon.orchid.MESBasic.services;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;

/* CUSTOM CODE START(cxfservice,import,MESBasic_1_prodList_ProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

@Path("/prodList")
public interface MESBasicProdListCxfService {

	@GET
	@Path("/{id}")
	public MESBasicProdList getProdList(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateProdList(@PathParam("id") long id, MESBasicProdList prodList);
	
	@POST
	public void createProdList(MESBasicProdList prodList);
	
	@DELETE
	@Path("/{id}")
	public void deleteProdList(@PathParam("id") long id);
	
	@PUT
	@Path("/getProdLists")
	public ArrayList<MESBasicProdList> getProdListList(String condition);
	
	@PUT
	@Path("/saveProdLists")
	public void ProdListList(ArrayList<MESBasicProdList> prodLists);
	
	@PUT
	@Path("/getProdLists/{pageNo}/{pageSize}")
	public Page<MESBasicProdList> getProdListPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getProdLists/{pageNo}/{pageSize}/{sortCondition}")
	public Page<MESBasicProdList> getProdListPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,MESBasic_1_prodList_ProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}