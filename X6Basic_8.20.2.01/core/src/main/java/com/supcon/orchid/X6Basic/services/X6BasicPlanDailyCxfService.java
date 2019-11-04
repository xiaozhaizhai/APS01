package com.supcon.orchid.X6Basic.services;

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
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.X6Basic.entities.X6BasicAbook;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.X6Basic.entities.ProductManage;
import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.X6Basic.entities.SignetSetting;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
/* CUSTOM CODE START(cxfservice,import,X6Basic_1.0_rangePlan_PlanDaily,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Path("/planDaily")
public interface X6BasicPlanDailyCxfService {

	@GET
	@Path("/{id}")
	public X6BasicPlanDaily getPlanDaily(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updatePlanDaily(@PathParam("id") long id, X6BasicPlanDaily planDaily);
	
	@POST
	public void createPlanDaily(X6BasicPlanDaily planDaily);
	
	@DELETE
	@Path("/{id}")
	public void deletePlanDaily(@PathParam("id") long id);
	
	@PUT
	@Path("/getPlanDailys")
	public ArrayList<X6BasicPlanDaily> getPlanDailyList(String condition);
	
	@PUT
	@Path("/savePlanDailys")
	public void PlanDailyList(ArrayList<X6BasicPlanDaily> planDailys);
	
	@PUT
	@Path("/getPlanDailys/{pageNo}/{pageSize}")
	public Page<X6BasicPlanDaily> getPlanDailyPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getPlanDailys/{pageNo}/{pageSize}/{sortCondition}")
	public Page<X6BasicPlanDaily> getPlanDailyPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);
	/* CUSTOM CODE START(cxfservice,functions,X6Basic_1.0_rangePlan_PlanDaily,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}