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
import com.supcon.orchid.MESBasic.entities.MESBasicProdtype;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;

/* CUSTOM CODE START(cxfservice,import,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

@Path("/prodtype")
public interface MESBasicProdtypeCxfService {

	@GET
	@Path("/{id}")
	public MESBasicProdtype getProdtype(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateProdtype(@PathParam("id") long id, MESBasicProdtype prodtype);
	
	@POST
	public void createProdtype(MESBasicProdtype prodtype);
	
	@DELETE
	@Path("/{id}")
	public void deleteProdtype(@PathParam("id") long id);
	
	@PUT
	@Path("/getProdtypes")
	public ArrayList<MESBasicProdtype> getProdtypeList(String condition);
	
	@PUT
	@Path("/saveProdtypes")
	public void ProdtypeList(ArrayList<MESBasicProdtype> prodtypes);
	
	@PUT
	@Path("/getProdtypes/{pageNo}/{pageSize}")
	public Page<MESBasicProdtype> getProdtypePage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getProdtypes/{pageNo}/{pageSize}/{sortCondition}")
	public Page<MESBasicProdtype> getProdtypePageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}