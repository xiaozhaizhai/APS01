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
/* CUSTOM CODE START(cxfservice,import,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Path("/baseUnit")
public interface X6BasicBaseUnitCxfService {

	@GET
	@Path("/{id}")
	public X6BasicBaseUnit getBaseUnit(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateBaseUnit(@PathParam("id") long id, X6BasicBaseUnit baseUnit);
	
	@POST
	public void createBaseUnit(X6BasicBaseUnit baseUnit);
	
	@DELETE
	@Path("/{id}")
	public void deleteBaseUnit(@PathParam("id") long id);
	
	@PUT
	@Path("/getBaseUnits")
	public ArrayList<X6BasicBaseUnit> getBaseUnitList(String condition);
	
	@PUT
	@Path("/saveBaseUnits")
	public void BaseUnitList(ArrayList<X6BasicBaseUnit> baseUnits);
	
	@PUT
	@Path("/getBaseUnits/{pageNo}/{pageSize}")
	public Page<X6BasicBaseUnit> getBaseUnitPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getBaseUnits/{pageNo}/{pageSize}/{sortCondition}")
	public Page<X6BasicBaseUnit> getBaseUnitPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);
	/* CUSTOM CODE START(cxfservice,functions,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}