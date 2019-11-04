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
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;

/* CUSTOM CODE START(cxfservice,import,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */

@Path("/testMappingSet")
public interface MESBasicTestMappingSetCxfService {

	@GET
	@Path("/{id}")
	public MESBasicTestMappingSet getTestMappingSet(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateTestMappingSet(@PathParam("id") long id, MESBasicTestMappingSet testMappingSet);
	
	@POST
	public void createTestMappingSet(MESBasicTestMappingSet testMappingSet);
	
	@DELETE
	@Path("/{id}")
	public void deleteTestMappingSet(@PathParam("id") long id);
	
	@PUT
	@Path("/getTestMappingSets")
	public ArrayList<MESBasicTestMappingSet> getTestMappingSetList(String condition);
	
	@PUT
	@Path("/saveTestMappingSets")
	public void TestMappingSetList(ArrayList<MESBasicTestMappingSet> testMappingSets);
	
	@PUT
	@Path("/getTestMappingSets/{pageNo}/{pageSize}")
	public Page<MESBasicTestMappingSet> getTestMappingSetPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getTestMappingSets/{pageNo}/{pageSize}/{sortCondition}")
	public Page<MESBasicTestMappingSet> getTestMappingSetPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}