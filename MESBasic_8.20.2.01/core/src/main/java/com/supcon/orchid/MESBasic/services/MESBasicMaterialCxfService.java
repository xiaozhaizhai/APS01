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
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;

/* CUSTOM CODE START(cxfservice,import,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */

@Path("/material")
public interface MESBasicMaterialCxfService {

	@GET
	@Path("/{id}")
	public MESBasicMaterial getMaterial(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateMaterial(@PathParam("id") long id, MESBasicMaterial material);
	
	@POST
	public void createMaterial(MESBasicMaterial material);
	
	@DELETE
	@Path("/{id}")
	public void deleteMaterial(@PathParam("id") long id);
	
	@PUT
	@Path("/getMaterials")
	public ArrayList<MESBasicMaterial> getMaterialList(String condition);
	
	@PUT
	@Path("/saveMaterials")
	public void MaterialList(ArrayList<MESBasicMaterial> materials);
	
	@PUT
	@Path("/getMaterials/{pageNo}/{pageSize}")
	public Page<MESBasicMaterial> getMaterialPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getMaterials/{pageNo}/{pageSize}/{sortCondition}")
	public Page<MESBasicMaterial> getMaterialPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}