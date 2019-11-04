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

/* CUSTOM CODE START(wsservice,import,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

@WebService(name="WOMProduceTask",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface WOMProduceTaskWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取生产指令单数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getProduceTaskByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取生产指令单数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getProduceTaskByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改生产指令单数据
	     * @param 生产指令单对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateProduceTask(
	    			@WebParam(name="produceTask")WOMProduceTask produceTask,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建生产指令单数据
	     * @param 生产指令单对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addProduceTask(
	    		@WebParam(name="produceTask")WOMProduceTask produceTask,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除生产指令单
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除生产指令单
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增生产指令单
		 * @param 生产指令单对象，每个生产指令单对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddProduceTask(
				@WebParam(name="produceTaskList")List<WOMProduceTask> produceTaskList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改生产指令单
		 * @param 生产指令单对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTask(
				@WebParam(name="produceTaskList")List<WOMProduceTask> produceTaskList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除生产指令单
		 * @param 生产指令单id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除生产指令单
		 * @param 生产指令单业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有生产指令单
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskPage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据生产指令单业务主键查询生产指令单下所有辅模型
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据生产指令单id查询生产指令单下所有辅模型
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------
	//----------------------------phase执行记录 WS--------------------------------
		/**
		 * 根据生产指令单业务主键分页查询phase执行记录数据
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelogPageByProduceTaskBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产指令单id分页查询phase执行记录数据
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelogPageByProduceTaskPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据phase执行记录id分获取phase执行记录数据
		 * @param phase执行记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelog(
				@WebParam(name="pk")String pk);

		/**
		 * 根据phase执行记录业务id修改phase执行记录数据
		 * @param phase执行记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateBatchPhaseExelog(
					@WebParam(name="batchPhaseExelog")WOMBatchPhaseExelog batchPhaseExelog,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增phase执行记录
		 * @param phase执行记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addBatchPhaseExelog(
					@WebParam(name="batchPhaseExelog")WOMBatchPhaseExelog batchPhaseExelog,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据phase执行记录id删除phase执行记录
		 * @param phase执行记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteBatchPhaseExelog(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改phase执行记录数据，phase执行记录id不能为空
		 * @param phase执行记录列表，每个生产指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchPhaseExelog(
					@WebParam(name="batchPhaseExelogList")List<WOMBatchPhaseExelog> batchPhaseExelogList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增phase执行记录数据
		 * @param phase执行记录列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddBatchPhaseExelog(
				@WebParam(name="batchPhaseExelogList")List<WOMBatchPhaseExelog> batchPhaseExelogList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据phase执行记录id，批量删除phase执行记录数据
		 * @param phase执行记录id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelBatchPhaseExelog(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有phase执行记录数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelogPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------活动执行记录 WS--------------------------------
		/**
		 * 根据生产指令单业务主键分页查询活动执行记录数据
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelogPageByProduceTaskBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产指令单id分页查询活动执行记录数据
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelogPageByProduceTaskPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据活动执行记录id分获取活动执行记录数据
		 * @param 活动执行记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelog(
				@WebParam(name="pk")String pk);

		/**
		 * 根据活动执行记录业务id修改活动执行记录数据
		 * @param 活动执行记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProdTaskActiExelog(
					@WebParam(name="prodTaskActiExelog")WOMProdTaskActiExelog prodTaskActiExelog,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增活动执行记录
		 * @param 活动执行记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProdTaskActiExelog(
					@WebParam(name="prodTaskActiExelog")WOMProdTaskActiExelog prodTaskActiExelog,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据活动执行记录id删除活动执行记录
		 * @param 活动执行记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProdTaskActiExelog(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改活动执行记录数据，活动执行记录id不能为空
		 * @param 活动执行记录列表，每个生产指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProdTaskActiExelog(
					@WebParam(name="prodTaskActiExelogList")List<WOMProdTaskActiExelog> prodTaskActiExelogList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增活动执行记录数据
		 * @param 活动执行记录列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProdTaskActiExelog(
				@WebParam(name="prodTaskActiExelogList")List<WOMProdTaskActiExelog> prodTaskActiExelogList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据活动执行记录id，批量删除活动执行记录数据
		 * @param 活动执行记录id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProdTaskActiExelog(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有活动执行记录数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelogPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------工序执行记录 WS--------------------------------
		/**
		 * 根据生产指令单业务主键分页查询工序执行记录数据
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelogPageByProduceTaskBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产指令单id分页查询工序执行记录数据
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelogPageByProduceTaskPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工序执行记录id分获取工序执行记录数据
		 * @param 工序执行记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelog(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工序执行记录业务id修改工序执行记录数据
		 * @param 工序执行记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProdTaskProcExelog(
					@WebParam(name="prodTaskProcExelog")WOMProdTaskProcExelog prodTaskProcExelog,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工序执行记录
		 * @param 工序执行记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProdTaskProcExelog(
					@WebParam(name="prodTaskProcExelog")WOMProdTaskProcExelog prodTaskProcExelog,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工序执行记录id删除工序执行记录
		 * @param 工序执行记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProdTaskProcExelog(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工序执行记录数据，工序执行记录id不能为空
		 * @param 工序执行记录列表，每个生产指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProdTaskProcExelog(
					@WebParam(name="prodTaskProcExelogList")List<WOMProdTaskProcExelog> prodTaskProcExelogList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工序执行记录数据
		 * @param 工序执行记录列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProdTaskProcExelog(
				@WebParam(name="prodTaskProcExelogList")List<WOMProdTaskProcExelog> prodTaskProcExelogList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工序执行记录id，批量删除工序执行记录数据
		 * @param 工序执行记录id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProdTaskProcExelog(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工序执行记录数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelogPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------用料汇总 WS--------------------------------
		/**
		 * 根据生产指令单业务主键分页查询用料汇总数据
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSumPageByProduceTaskBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产指令单id分页查询用料汇总数据
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSumPageByProduceTaskPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据用料汇总id分获取用料汇总数据
		 * @param 用料汇总id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSum(
				@WebParam(name="pk")String pk);

		/**
		 * 根据用料汇总业务id修改用料汇总数据
		 * @param 用料汇总对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProduceMaterialSum(
					@WebParam(name="produceMaterialSum")WOMProduceMaterialSum produceMaterialSum,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增用料汇总
		 * @param 用料汇总对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProduceMaterialSum(
					@WebParam(name="produceMaterialSum")WOMProduceMaterialSum produceMaterialSum,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据用料汇总id删除用料汇总
		 * @param 用料汇总id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProduceMaterialSum(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改用料汇总数据，用料汇总id不能为空
		 * @param 用料汇总列表，每个生产指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceMaterialSum(
					@WebParam(name="produceMaterialSumList")List<WOMProduceMaterialSum> produceMaterialSumList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增用料汇总数据
		 * @param 用料汇总列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProduceMaterialSum(
				@WebParam(name="produceMaterialSumList")List<WOMProduceMaterialSum> produceMaterialSumList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据用料汇总id，批量删除用料汇总数据
		 * @param 用料汇总id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProduceMaterialSum(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有用料汇总数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSumPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------用料活动 WS--------------------------------
		/**
		 * 根据生产指令单业务主键分页查询用料活动数据
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActivePageByProduceTaskBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产指令单id分页查询用料活动数据
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActivePageByProduceTaskPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据用料活动id分获取用料活动数据
		 * @param 用料活动id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActive(
				@WebParam(name="pk")String pk);

		/**
		 * 根据用料活动业务id修改用料活动数据
		 * @param 用料活动对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProduceTaskActive(
					@WebParam(name="produceTaskActive")WOMProduceTaskActive produceTaskActive,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增用料活动
		 * @param 用料活动对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProduceTaskActive(
					@WebParam(name="produceTaskActive")WOMProduceTaskActive produceTaskActive,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据用料活动id删除用料活动
		 * @param 用料活动id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskActive(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改用料活动数据，用料活动id不能为空
		 * @param 用料活动列表，每个生产指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTaskActive(
					@WebParam(name="produceTaskActiveList")List<WOMProduceTaskActive> produceTaskActiveList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增用料活动数据
		 * @param 用料活动列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProduceTaskActive(
				@WebParam(name="produceTaskActiveList")List<WOMProduceTaskActive> produceTaskActiveList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据用料活动id，批量删除用料活动数据
		 * @param 用料活动id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProduceTaskActive(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有用料活动数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActivePage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------指令单工序 WS--------------------------------
		/**
		 * 根据生产指令单业务主键分页查询指令单工序数据
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcessPageByProduceTaskBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产指令单id分页查询指令单工序数据
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcessPageByProduceTaskPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据指令单工序id分获取指令单工序数据
		 * @param 指令单工序id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcess(
				@WebParam(name="pk")String pk);

		/**
		 * 根据指令单工序业务id修改指令单工序数据
		 * @param 指令单工序对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProduceTaskProcess(
					@WebParam(name="produceTaskProcess")WOMProduceTaskProcess produceTaskProcess,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增指令单工序
		 * @param 指令单工序对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProduceTaskProcess(
					@WebParam(name="produceTaskProcess")WOMProduceTaskProcess produceTaskProcess,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据指令单工序id删除指令单工序
		 * @param 指令单工序id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskProcess(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改指令单工序数据，指令单工序id不能为空
		 * @param 指令单工序列表，每个生产指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTaskProcess(
					@WebParam(name="produceTaskProcessList")List<WOMProduceTaskProcess> produceTaskProcessList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增指令单工序数据
		 * @param 指令单工序列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProduceTaskProcess(
				@WebParam(name="produceTaskProcessList")List<WOMProduceTaskProcess> produceTaskProcessList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据指令单工序id，批量删除指令单工序数据
		 * @param 指令单工序id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProduceTaskProcess(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有指令单工序数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcessPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------待投料记录 WS--------------------------------
		/**
		 * 根据生产指令单业务主键分页查询待投料记录数据
		 * @param 生产指令单业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecordsPageByProduceTaskBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产指令单id分页查询待投料记录数据
		 * @param 生产指令单id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecordsPageByProduceTaskPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据待投料记录id分获取待投料记录数据
		 * @param 待投料记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecords(
				@WebParam(name="pk")String pk);

		/**
		 * 根据待投料记录业务id修改待投料记录数据
		 * @param 待投料记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateWaitPutinRecords(
					@WebParam(name="waitPutinRecords")WOMWaitPutinRecords waitPutinRecords,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增待投料记录
		 * @param 待投料记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addWaitPutinRecords(
					@WebParam(name="waitPutinRecords")WOMWaitPutinRecords waitPutinRecords,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据待投料记录id删除待投料记录
		 * @param 待投料记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteWaitPutinRecords(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改待投料记录数据，待投料记录id不能为空
		 * @param 待投料记录列表，每个生产指令单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateWaitPutinRecords(
					@WebParam(name="waitPutinRecordsList")List<WOMWaitPutinRecords> waitPutinRecordsList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增待投料记录数据
		 * @param 待投料记录列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddWaitPutinRecords(
				@WebParam(name="waitPutinRecordsList")List<WOMWaitPutinRecords> waitPutinRecordsList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据待投料记录id，批量删除待投料记录数据
		 * @param 待投料记录id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelWaitPutinRecords(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有待投料记录数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecordsPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);



	
	/* CUSTOM CODE START(wsservice,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}