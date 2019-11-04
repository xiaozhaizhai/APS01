package com.supcon.orchid.X6Basic.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;

import com.supcon.orchid.foundation.ws.entities.JWSListResultDTO;
import com.supcon.orchid.foundation.ws.entities.JWSResultDTO;
import com.supcon.orchid.foundation.ws.entities.PageParamDTO;
import com.supcon.orchid.foundation.ws.entities.PageValueDTO;
import com.supcon.orchid.foundation.ws.entities.SimulationMap;

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
/* CUSTOM CODE START(wsservice,import,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="X6BasicRangePlan",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface X6BasicRangePlanWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取排班计划数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getRangePlanByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取排班计划数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getRangePlanByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改排班计划数据
	     * @param 排班计划对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateRangePlan(
	    			@WebParam(name="rangePlan")X6BasicRangePlan rangePlan,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建排班计划数据
	     * @param 排班计划对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addRangePlan(
	    		@WebParam(name="rangePlan")X6BasicRangePlan rangePlan,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除排班计划
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteRangePlanByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除排班计划
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteRangePlanByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增排班计划
		 * @param 排班计划对象，每个排班计划对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddRangePlan(
				@WebParam(name="rangePlanList")List<X6BasicRangePlan> rangePlanList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改排班计划
		 * @param 排班计划对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateRangePlan(
				@WebParam(name="rangePlanList")List<X6BasicRangePlan> rangePlanList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除排班计划
		 * @param 排班计划id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteRangePlanByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除排班计划
		 * @param 排班计划业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteRangePlanByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有排班计划
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据排班计划业务主键查询排班计划下所有辅模型
		 * @param 排班计划业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据排班计划id查询排班计划下所有辅模型
		 * @param 排班计划id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------
	//----------------------------排班结果 WS--------------------------------
		/**
		 * 根据排班计划业务主键分页查询排班结果数据
		 * @param 排班计划业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPlanDailyPageByRangePlanBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据排班计划id分页查询排班结果数据
		 * @param 排班计划id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPlanDailyPageByRangePlanPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据排班结果id分获取排班结果数据
		 * @param 排班结果id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPlanDaily(
				@WebParam(name="pk")String pk);

		/**
		 * 根据排班结果业务id修改排班结果数据
		 * @param 排班结果对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updatePlanDaily(
					@WebParam(name="planDaily")X6BasicPlanDaily planDaily,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增排班结果
		 * @param 排班结果对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addPlanDaily(
					@WebParam(name="planDaily")X6BasicPlanDaily planDaily,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据排班结果id删除排班结果
		 * @param 排班结果id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deletePlanDaily(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改排班结果数据，排班结果id不能为空
		 * @param 排班结果列表，每个排班计划必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePlanDaily(
					@WebParam(name="planDailyList")List<X6BasicPlanDaily> planDailyList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增排班结果数据
		 * @param 排班结果列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddPlanDaily(
				@WebParam(name="planDailyList")List<X6BasicPlanDaily> planDailyList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据排班结果id，批量删除排班结果数据
		 * @param 排班结果id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelPlanDaily(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有排班结果数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPlanDailyPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------排班明细 WS--------------------------------
		/**
		 * 根据排班计划业务主键分页查询排班明细数据
		 * @param 排班计划业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPartPageByRangePlanBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据排班计划id分页查询排班明细数据
		 * @param 排班计划id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPartPageByRangePlanPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据排班明细id分获取排班明细数据
		 * @param 排班明细id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPart(
				@WebParam(name="pk")String pk);

		/**
		 * 根据排班明细业务id修改排班明细数据
		 * @param 排班明细对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateRangePlanPart(
					@WebParam(name="rangePlanPart")X6BasicRangePlanPart rangePlanPart,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增排班明细
		 * @param 排班明细对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addRangePlanPart(
					@WebParam(name="rangePlanPart")X6BasicRangePlanPart rangePlanPart,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据排班明细id删除排班明细
		 * @param 排班明细id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteRangePlanPart(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改排班明细数据，排班明细id不能为空
		 * @param 排班明细列表，每个排班计划必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateRangePlanPart(
					@WebParam(name="rangePlanPartList")List<X6BasicRangePlanPart> rangePlanPartList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增排班明细数据
		 * @param 排班明细列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddRangePlanPart(
				@WebParam(name="rangePlanPartList")List<X6BasicRangePlanPart> rangePlanPartList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据排班明细id，批量删除排班明细数据
		 * @param 排班明细id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelRangePlanPart(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有排班明细数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPartPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);



	/* CUSTOM CODE START(wsservice,functions,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}