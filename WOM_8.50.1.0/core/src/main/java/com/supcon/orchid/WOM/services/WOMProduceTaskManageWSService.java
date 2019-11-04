package com.supcon.orchid.WOM.services;

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

/* CUSTOM CODE START(wsservice,import,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

@WebService(name="WOMProduceTaskManage",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface WOMProduceTaskManageWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取指令单数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getProduceTaskManageByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取指令单数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getProduceTaskManageByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改指令单数据
	     * @param 指令单对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateProduceTaskManage(
	    			@WebParam(name="produceTaskManage")WOMProduceTaskManage produceTaskManage,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建指令单数据
	     * @param 指令单对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addProduceTaskManage(
	    		@WebParam(name="produceTaskManage")WOMProduceTaskManage produceTaskManage,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除指令单
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskManageByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除指令单
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskManageByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增指令单
		 * @param 指令单对象，每个指令单对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddProduceTaskManage(
				@WebParam(name="produceTaskManageList")List<WOMProduceTaskManage> produceTaskManageList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改指令单
		 * @param 指令单对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTaskManage(
				@WebParam(name="produceTaskManageList")List<WOMProduceTaskManage> produceTaskManageList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除指令单
		 * @param 指令单id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskManageByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除指令单
		 * @param 指令单业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskManageByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有指令单
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskManagePage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据指令单业务主键查询指令单下所有辅模型
		 * @param 指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据指令单id查询指令单下所有辅模型
		 * @param 指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------
	//----------------------------检验记录业签 WS--------------------------------
		/**
		 * 根据指令单业务主键分页查询检验记录业签数据
		 * @param 指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckManagePageByProduceTaskManageBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据指令单id分页查询检验记录业签数据
		 * @param 指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckManagePageByProduceTaskManagePk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据检验记录业签id分获取检验记录业签数据
		 * @param 检验记录业签id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckManage(
				@WebParam(name="pk")String pk);

		/**
		 * 根据检验记录业签业务id修改检验记录业签数据
		 * @param 检验记录业签对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateCheckManage(
					@WebParam(name="checkManage")WOMCheckManage checkManage,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增检验记录业签
		 * @param 检验记录业签对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addCheckManage(
					@WebParam(name="checkManage")WOMCheckManage checkManage,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据检验记录业签id删除检验记录业签
		 * @param 检验记录业签id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteCheckManage(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改检验记录业签数据，检验记录业签id不能为空
		 * @param 检验记录业签列表，每个指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateCheckManage(
					@WebParam(name="checkManageList")List<WOMCheckManage> checkManageList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增检验记录业签数据
		 * @param 检验记录业签列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddCheckManage(
				@WebParam(name="checkManageList")List<WOMCheckManage> checkManageList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据检验记录业签id，批量删除检验记录业签数据
		 * @param 检验记录业签id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelCheckManage(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有检验记录业签数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckManagePage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------请检单 WS--------------------------------
		/**
		 * 根据指令单业务主键分页查询请检单数据
		 * @param 指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getInspectPageByProduceTaskManageBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据指令单id分页查询请检单数据
		 * @param 指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getInspectPageByProduceTaskManagePk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据请检单id分获取请检单数据
		 * @param 请检单id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getInspect(
				@WebParam(name="pk")String pk);

		/**
		 * 根据请检单业务id修改请检单数据
		 * @param 请检单对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateInspect(
					@WebParam(name="inspect")WOMInspect inspect,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增请检单
		 * @param 请检单对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addInspect(
					@WebParam(name="inspect")WOMInspect inspect,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据请检单id删除请检单
		 * @param 请检单id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteInspect(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改请检单数据，请检单id不能为空
		 * @param 请检单列表，每个指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateInspect(
					@WebParam(name="inspectList")List<WOMInspect> inspectList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增请检单数据
		 * @param 请检单列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddInspect(
				@WebParam(name="inspectList")List<WOMInspect> inspectList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据请检单id，批量删除请检单数据
		 * @param 请检单id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelInspect(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有请检单数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getInspectPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------投料记录业签 WS--------------------------------
		/**
		 * 根据指令单业务主键分页查询投料记录业签数据
		 * @param 指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPutInManagePageByProduceTaskManageBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据指令单id分页查询投料记录业签数据
		 * @param 指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPutInManagePageByProduceTaskManagePk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据投料记录业签id分获取投料记录业签数据
		 * @param 投料记录业签id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPutInManage(
				@WebParam(name="pk")String pk);

		/**
		 * 根据投料记录业签业务id修改投料记录业签数据
		 * @param 投料记录业签对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updatePutInManage(
					@WebParam(name="putInManage")WOMPutInManage putInManage,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增投料记录业签
		 * @param 投料记录业签对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addPutInManage(
					@WebParam(name="putInManage")WOMPutInManage putInManage,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据投料记录业签id删除投料记录业签
		 * @param 投料记录业签id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deletePutInManage(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改投料记录业签数据，投料记录业签id不能为空
		 * @param 投料记录业签列表，每个指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePutInManage(
					@WebParam(name="putInManageList")List<WOMPutInManage> putInManageList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增投料记录业签数据
		 * @param 投料记录业签列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddPutInManage(
				@WebParam(name="putInManageList")List<WOMPutInManage> putInManageList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据投料记录业签id，批量删除投料记录业签数据
		 * @param 投料记录业签id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelPutInManage(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有投料记录业签数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPutInManagePage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------报工记录业签 WS--------------------------------
		/**
		 * 根据指令单业务主键分页查询报工记录业签数据
		 * @param 指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManagePageByProduceTaskManageBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据指令单id分页查询报工记录业签数据
		 * @param 指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManagePageByProduceTaskManagePk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据报工记录业签id分获取报工记录业签数据
		 * @param 报工记录业签id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManage(
				@WebParam(name="pk")String pk);

		/**
		 * 根据报工记录业签业务id修改报工记录业签数据
		 * @param 报工记录业签对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateTaskReportManage(
					@WebParam(name="taskReportManage")WOMTaskReportManage taskReportManage,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增报工记录业签
		 * @param 报工记录业签对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addTaskReportManage(
					@WebParam(name="taskReportManage")WOMTaskReportManage taskReportManage,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据报工记录业签id删除报工记录业签
		 * @param 报工记录业签id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteTaskReportManage(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改报工记录业签数据，报工记录业签id不能为空
		 * @param 报工记录业签列表，每个指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateTaskReportManage(
					@WebParam(name="taskReportManageList")List<WOMTaskReportManage> taskReportManageList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增报工记录业签数据
		 * @param 报工记录业签列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddTaskReportManage(
				@WebParam(name="taskReportManageList")List<WOMTaskReportManage> taskReportManageList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据报工记录业签id，批量删除报工记录业签数据
		 * @param 报工记录业签id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelTaskReportManage(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有报工记录业签数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManagePage(
					@WebParam(name="pageParam")PageParamDTO pageParam);



	
	/* CUSTOM CODE START(wsservice,functions,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}