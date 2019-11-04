package com.supcon.orchid.RM.services;

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

/* CUSTOM CODE START(wsservice,import,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

@WebService(name="RMLineFormula",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface RMLineFormulaWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取生产线-配方表数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getLineFormulaByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取生产线-配方表数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getLineFormulaByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改生产线-配方表数据
	     * @param 生产线-配方表对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateLineFormula(
	    			@WebParam(name="lineFormula")RMLineFormula lineFormula,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建生产线-配方表数据
	     * @param 生产线-配方表对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addLineFormula(
	    		@WebParam(name="lineFormula")RMLineFormula lineFormula,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除生产线-配方表
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteLineFormulaByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除生产线-配方表
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteLineFormulaByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增生产线-配方表
		 * @param 生产线-配方表对象，每个生产线-配方表对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddLineFormula(
				@WebParam(name="lineFormulaList")List<RMLineFormula> lineFormulaList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改生产线-配方表
		 * @param 生产线-配方表对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateLineFormula(
				@WebParam(name="lineFormulaList")List<RMLineFormula> lineFormulaList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除生产线-配方表
		 * @param 生产线-配方表id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteLineFormulaByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除生产线-配方表
		 * @param 生产线-配方表业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteLineFormulaByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有生产线-配方表
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getLineFormulaPage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据生产线-配方表业务主键查询生产线-配方表下所有辅模型
		 * @param 生产线-配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据生产线-配方表id查询生产线-配方表下所有辅模型
		 * @param 生产线-配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------
	//----------------------------工序-工作单元表 WS--------------------------------
		/**
		 * 根据生产线-配方表业务主键分页查询工序-工作单元表数据
		 * @param 生产线-配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitPageByLineFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产线-配方表id分页查询工序-工作单元表数据
		 * @param 生产线-配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitPageByLineFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工序-工作单元表id分获取工序-工作单元表数据
		 * @param 工序-工作单元表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnit(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工序-工作单元表业务id修改工序-工作单元表数据
		 * @param 工序-工作单元表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProcessUnit(
					@WebParam(name="processUnit")RMProcessUnit processUnit,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工序-工作单元表
		 * @param 工序-工作单元表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProcessUnit(
					@WebParam(name="processUnit")RMProcessUnit processUnit,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工序-工作单元表id删除工序-工作单元表
		 * @param 工序-工作单元表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProcessUnit(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工序-工作单元表数据，工序-工作单元表id不能为空
		 * @param 工序-工作单元表列表，每个生产线-配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProcessUnit(
					@WebParam(name="processUnitList")List<RMProcessUnit> processUnitList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工序-工作单元表数据
		 * @param 工序-工作单元表列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProcessUnit(
				@WebParam(name="processUnitList")List<RMProcessUnit> processUnitList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工序-工作单元表id，批量删除工序-工作单元表数据
		 * @param 工序-工作单元表id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProcessUnit(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工序-工作单元表数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------工作单元多选表 WS--------------------------------
		/**
		 * 根据生产线-配方表业务主键分页查询工作单元多选表数据
		 * @param 生产线-配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoicePageByLineFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产线-配方表id分页查询工作单元多选表数据
		 * @param 生产线-配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoicePageByLineFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工作单元多选表id分获取工作单元多选表数据
		 * @param 工作单元多选表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoice(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工作单元多选表业务id修改工作单元多选表数据
		 * @param 工作单元多选表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProcessUnitChoice(
					@WebParam(name="processUnitChoice")RMProcessUnitChoice processUnitChoice,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工作单元多选表
		 * @param 工作单元多选表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProcessUnitChoice(
					@WebParam(name="processUnitChoice")RMProcessUnitChoice processUnitChoice,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工作单元多选表id删除工作单元多选表
		 * @param 工作单元多选表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProcessUnitChoice(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工作单元多选表数据，工作单元多选表id不能为空
		 * @param 工作单元多选表列表，每个生产线-配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProcessUnitChoice(
					@WebParam(name="processUnitChoiceList")List<RMProcessUnitChoice> processUnitChoiceList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工作单元多选表数据
		 * @param 工作单元多选表列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProcessUnitChoice(
				@WebParam(name="processUnitChoiceList")List<RMProcessUnitChoice> processUnitChoiceList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工作单元多选表id，批量删除工作单元多选表数据
		 * @param 工作单元多选表id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProcessUnitChoice(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工作单元多选表数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoicePage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------工序活动-测点表 WS--------------------------------
		/**
		 * 根据生产线-配方表业务主键分页查询工序活动-测点表数据
		 * @param 生产线-配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessPointPageByLineFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据生产线-配方表id分页查询工序活动-测点表数据
		 * @param 生产线-配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessPointPageByLineFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工序活动-测点表id分获取工序活动-测点表数据
		 * @param 工序活动-测点表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessPoint(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工序活动-测点表业务id修改工序活动-测点表数据
		 * @param 工序活动-测点表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateProcessPoint(
					@WebParam(name="processPoint")RMProcessPoint processPoint,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工序活动-测点表
		 * @param 工序活动-测点表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addProcessPoint(
					@WebParam(name="processPoint")RMProcessPoint processPoint,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工序活动-测点表id删除工序活动-测点表
		 * @param 工序活动-测点表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteProcessPoint(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工序活动-测点表数据，工序活动-测点表id不能为空
		 * @param 工序活动-测点表列表，每个生产线-配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProcessPoint(
					@WebParam(name="processPointList")List<RMProcessPoint> processPointList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工序活动-测点表数据
		 * @param 工序活动-测点表列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddProcessPoint(
				@WebParam(name="processPointList")List<RMProcessPoint> processPointList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工序活动-测点表id，批量删除工序活动-测点表数据
		 * @param 工序活动-测点表id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelProcessPoint(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工序活动-测点表数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getProcessPointPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);



	
	/* CUSTOM CODE START(wsservice,functions,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}