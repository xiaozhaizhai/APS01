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
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicProducttype;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;

/* CUSTOM CODE START(cxfservice,import,MESBasic_1_product_type_Producttype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

@Path("/producttype")
public interface MESBasicProducttypeCxfService {

	@GET
	@Path("/{id}")
	public MESBasicProducttype getProducttype(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateProducttype(@PathParam("id") long id, MESBasicProducttype producttype);
	
	@POST
	public void createProducttype(MESBasicProducttype producttype);
	
	@DELETE
	@Path("/{id}")
	public void deleteProducttype(@PathParam("id") long id);
	
	@PUT
	@Path("/getProducttypes")
	public ArrayList<MESBasicProducttype> getProducttypeList(String condition);
	
	@PUT
	@Path("/saveProducttypes")
	public void ProducttypeList(ArrayList<MESBasicProducttype> producttypes);
	
	@PUT
	@Path("/getProducttypes/{pageNo}/{pageSize}")
	public Page<MESBasicProducttype> getProducttypePage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getProducttypes/{pageNo}/{pageSize}/{sortCondition}")
	public Page<MESBasicProducttype> getProducttypePageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,MESBasic_1_product_type_Producttype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}