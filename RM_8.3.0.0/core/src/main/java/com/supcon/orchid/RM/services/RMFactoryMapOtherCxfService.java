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

/* CUSTOM CODE START(cxfservice,import,RM_7.5.0.0_interfaceService_FactoryMapOther,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */

@Path("/factoryMapOther")
public interface RMFactoryMapOtherCxfService {

	@GET
	@Path("/{id}")
	public RMFactoryMapOther getFactoryMapOther(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateFactoryMapOther(@PathParam("id") long id, RMFactoryMapOther factoryMapOther);
	
	@POST
	public void createFactoryMapOther(RMFactoryMapOther factoryMapOther);
	
	@DELETE
	@Path("/{id}")
	public void deleteFactoryMapOther(@PathParam("id") long id);
	
	@PUT
	@Path("/getFactoryMapOthers")
	public ArrayList<RMFactoryMapOther> getFactoryMapOtherList(String condition);
	
	@PUT
	@Path("/saveFactoryMapOthers")
	public void FactoryMapOtherList(ArrayList<RMFactoryMapOther> factoryMapOthers);
	
	@PUT
	@Path("/getFactoryMapOthers/{pageNo}/{pageSize}")
	public Page<RMFactoryMapOther> getFactoryMapOtherPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getFactoryMapOthers/{pageNo}/{pageSize}/{sortCondition}")
	public Page<RMFactoryMapOther> getFactoryMapOtherPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,RM_7.5.0.0_interfaceService_FactoryMapOther,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}