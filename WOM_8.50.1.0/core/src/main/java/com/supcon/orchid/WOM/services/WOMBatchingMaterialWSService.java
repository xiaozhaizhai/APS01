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

/* CUSTOM CODE START(wsservice,import,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

@WebService(name="WOMBatchingMaterial",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface WOMBatchingMaterialWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取配料指令数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取配料指令数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改配料指令数据
	     * @param 配料指令对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateBatchingMaterial(
	    			@WebParam(name="batchingMaterial")WOMBatchingMaterial batchingMaterial,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建配料指令数据
	     * @param 配料指令对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addBatchingMaterial(
	    		@WebParam(name="batchingMaterial")WOMBatchingMaterial batchingMaterial,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除配料指令
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除配料指令
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增配料指令
		 * @param 配料指令对象，每个配料指令对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddBatchingMaterial(
				@WebParam(name="batchingMaterialList")List<WOMBatchingMaterial> batchingMaterialList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改配料指令
		 * @param 配料指令对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchingMaterial(
				@WebParam(name="batchingMaterialList")List<WOMBatchingMaterial> batchingMaterialList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除配料指令
		 * @param 配料指令id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchingMaterialByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除配料指令
		 * @param 配料指令业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchingMaterialByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有配料指令
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据配料指令业务主键查询配料指令下所有辅模型
		 * @param 配料指令业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据配料指令id查询配料指令下所有辅模型
		 * @param 配料指令id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------
	//----------------------------配料记录 WS--------------------------------
		/**
		 * 根据配料指令业务主键分页查询配料记录数据
		 * @param 配料指令业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPartPageByBatchingMaterialBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配料指令id分页查询配料记录数据
		 * @param 配料指令id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPartPageByBatchingMaterialPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配料记录id分获取配料记录数据
		 * @param 配料记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPart(
				@WebParam(name="pk")String pk);

		/**
		 * 根据配料记录业务id修改配料记录数据
		 * @param 配料记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateBatchingMaterialPart(
					@WebParam(name="batchingMaterialPart")WOMBatchingMaterialPart batchingMaterialPart,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增配料记录
		 * @param 配料记录对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addBatchingMaterialPart(
					@WebParam(name="batchingMaterialPart")WOMBatchingMaterialPart batchingMaterialPart,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据配料记录id删除配料记录
		 * @param 配料记录id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialPart(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改配料记录数据，配料记录id不能为空
		 * @param 配料记录列表，每个配料指令必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchingMaterialPart(
					@WebParam(name="batchingMaterialPartList")List<WOMBatchingMaterialPart> batchingMaterialPartList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增配料记录数据
		 * @param 配料记录列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddBatchingMaterialPart(
				@WebParam(name="batchingMaterialPartList")List<WOMBatchingMaterialPart> batchingMaterialPartList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据配料记录id，批量删除配料记录数据
		 * @param 配料记录id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelBatchingMaterialPart(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有配料记录数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPartPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);



	
	/* CUSTOM CODE START(wsservice,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}