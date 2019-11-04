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
import com.supcon.orchid.MESBasic.entities.MESBasicVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;

/* CUSTOM CODE START(cxfservice,import,MESBasic_1_baseVendor_VendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

@Path("/vendorClass")
public interface MESBasicVendorClassCxfService {

	@GET
	@Path("/{id}")
	public MESBasicVendorClass getVendorClass(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateVendorClass(@PathParam("id") long id, MESBasicVendorClass vendorClass);
	
	@POST
	public void createVendorClass(MESBasicVendorClass vendorClass);
	
	@DELETE
	@Path("/{id}")
	public void deleteVendorClass(@PathParam("id") long id);
	
	@PUT
	@Path("/getVendorClasss")
	public ArrayList<MESBasicVendorClass> getVendorClassList(String condition);
	
	@PUT
	@Path("/saveVendorClasss")
	public void VendorClassList(ArrayList<MESBasicVendorClass> vendorClasss);
	
	@PUT
	@Path("/getVendorClasss/{pageNo}/{pageSize}")
	public Page<MESBasicVendorClass> getVendorClassPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getVendorClasss/{pageNo}/{pageSize}/{sortCondition}")
	public Page<MESBasicVendorClass> getVendorClassPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,MESBasic_1_baseVendor_VendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}