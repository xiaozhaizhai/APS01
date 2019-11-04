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
import com.supcon.orchid.MESBasic.entities.MESBasicTagProperty;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;

/* CUSTOM CODE START(cxfservice,import,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */

@Path("/tagProperty")
public interface MESBasicTagPropertyCxfService {

	@GET
	@Path("/{id}")
	public MESBasicTagProperty getTagProperty(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateTagProperty(@PathParam("id") long id, MESBasicTagProperty tagProperty);
	
	@POST
	public void createTagProperty(MESBasicTagProperty tagProperty);
	
	@DELETE
	@Path("/{id}")
	public void deleteTagProperty(@PathParam("id") long id);
	
	@PUT
	@Path("/getTagPropertys")
	public ArrayList<MESBasicTagProperty> getTagPropertyList(String condition);
	
	@PUT
	@Path("/saveTagPropertys")
	public void TagPropertyList(ArrayList<MESBasicTagProperty> tagPropertys);
	
	@PUT
	@Path("/getTagPropertys/{pageNo}/{pageSize}")
	public Page<MESBasicTagProperty> getTagPropertyPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getTagPropertys/{pageNo}/{pageSize}/{sortCondition}")
	public Page<MESBasicTagProperty> getTagPropertyPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}