package com.supcon.orchid.RM.services;

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
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMTestProj;

/* CUSTOM CODE START(cxfservice,import,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */

@Path("/processType")
public interface RMProcessTypeCxfService {

	@GET
	@Path("/{id}")
	public RMProcessType getProcessType(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateProcessType(@PathParam("id") long id, RMProcessType processType);
	
	@POST
	public void createProcessType(RMProcessType processType);
	
	@DELETE
	@Path("/{id}")
	public void deleteProcessType(@PathParam("id") long id);
	
	@PUT
	@Path("/getProcessTypes")
	public ArrayList<RMProcessType> getProcessTypeList(String condition);
	
	@PUT
	@Path("/saveProcessTypes")
	public void ProcessTypeList(ArrayList<RMProcessType> processTypes);
	
	@PUT
	@Path("/getProcessTypes/{pageNo}/{pageSize}")
	public Page<RMProcessType> getProcessTypePage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getProcessTypes/{pageNo}/{pageSize}/{sortCondition}")
	public Page<RMProcessType> getProcessTypePageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}