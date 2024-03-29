package com.supcon.orchid.WOM.services;

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
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;

/* CUSTOM CODE START(cxfservice,import,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */

@Path("/dayBatchPlanParts")
public interface WOMDayBatchPlanPartsCxfService {

	@GET
	@Path("/{id}")
	public WOMDayBatchPlanParts getDayBatchPlanParts(@PathParam("id") long id);
	
	
	@PUT
	@Path("/{id}")
	public void updateDayBatchPlanParts(@PathParam("id") long id, WOMDayBatchPlanParts dayBatchPlanParts);
	
	@POST
	public void createDayBatchPlanParts(WOMDayBatchPlanParts dayBatchPlanParts);
	
	@DELETE
	@Path("/{id}")
	public void deleteDayBatchPlanParts(@PathParam("id") long id);
	
	@PUT
	@Path("/getDayBatchPlanPartss")
	public ArrayList<WOMDayBatchPlanParts> getDayBatchPlanPartsList(String condition);
	
	@PUT
	@Path("/saveDayBatchPlanPartss")
	public void DayBatchPlanPartsList(ArrayList<WOMDayBatchPlanParts> dayBatchPlanPartss);
	
	@PUT
	@Path("/getDayBatchPlanPartss/{pageNo}/{pageSize}")
	public Page<WOMDayBatchPlanParts> getDayBatchPlanPartsPage(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, String condition);
	
	@PUT
	@Path("/getDayBatchPlanPartss/{pageNo}/{pageSize}/{sortCondition}")
	public Page<WOMDayBatchPlanParts> getDayBatchPlanPartsPageSort(@PathParam("pageNo") int pageNo, @PathParam("pageSize")int pageSize, @PathParam("sortCondition")String sort, String condition);

	/* CUSTOM CODE START(cxfservice,functions,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}