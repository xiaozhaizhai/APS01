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

/* CUSTOM CODE START(wsservice,import,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

@WebService(name="RMFormula",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface RMFormulaWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取配方表数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getFormulaByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取配方表数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getFormulaByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改配方表数据
	     * @param 配方表对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateFormula(
	    			@WebParam(name="formula")RMFormula formula,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建配方表数据
	     * @param 配方表对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addFormula(
	    		@WebParam(name="formula")RMFormula formula,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除配方表
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteFormulaByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除配方表
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteFormulaByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增配方表
		 * @param 配方表对象，每个配方表对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddFormula(
				@WebParam(name="formulaList")List<RMFormula> formulaList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改配方表
		 * @param 配方表对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormula(
				@WebParam(name="formulaList")List<RMFormula> formulaList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除配方表
		 * @param 配方表id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteFormulaByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除配方表
		 * @param 配方表业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteFormulaByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有配方表
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaPage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据配方表业务主键查询配方表下所有辅模型
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据配方表id查询配方表下所有辅模型
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------
	//----------------------------物品清单 WS--------------------------------
		/**
		 * 根据配方表业务主键分页查询物品清单数据
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBomPageByFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配方表id分页查询物品清单数据
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBomPageByFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据物品清单id分获取物品清单数据
		 * @param 物品清单id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBom(
				@WebParam(name="pk")String pk);

		/**
		 * 根据物品清单业务id修改物品清单数据
		 * @param 物品清单对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateFormulaBom(
					@WebParam(name="formulaBom")RMFormulaBom formulaBom,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增物品清单
		 * @param 物品清单对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addFormulaBom(
					@WebParam(name="formulaBom")RMFormulaBom formulaBom,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据物品清单id删除物品清单
		 * @param 物品清单id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaBom(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改物品清单数据，物品清单id不能为空
		 * @param 物品清单列表，每个配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaBom(
					@WebParam(name="formulaBomList")List<RMFormulaBom> formulaBomList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增物品清单数据
		 * @param 物品清单列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddFormulaBom(
				@WebParam(name="formulaBomList")List<RMFormulaBom> formulaBomList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据物品清单id，批量删除物品清单数据
		 * @param 物品清单id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaBom(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有物品清单数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBomPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------检验部门 WS--------------------------------
		/**
		 * 根据配方表业务主键分页查询检验部门数据
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSetPageByFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配方表id分页查询检验部门数据
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSetPageByFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据检验部门id分获取检验部门数据
		 * @param 检验部门id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSet(
				@WebParam(name="pk")String pk);

		/**
		 * 根据检验部门业务id修改检验部门数据
		 * @param 检验部门对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateCheckDepartmentSet(
					@WebParam(name="checkDepartmentSet")RMCheckDepartmentSet checkDepartmentSet,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增检验部门
		 * @param 检验部门对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addCheckDepartmentSet(
					@WebParam(name="checkDepartmentSet")RMCheckDepartmentSet checkDepartmentSet,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据检验部门id删除检验部门
		 * @param 检验部门id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteCheckDepartmentSet(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改检验部门数据，检验部门id不能为空
		 * @param 检验部门列表，每个配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateCheckDepartmentSet(
					@WebParam(name="checkDepartmentSetList")List<RMCheckDepartmentSet> checkDepartmentSetList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增检验部门数据
		 * @param 检验部门列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddCheckDepartmentSet(
				@WebParam(name="checkDepartmentSetList")List<RMCheckDepartmentSet> checkDepartmentSetList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据检验部门id，批量删除检验部门数据
		 * @param 检验部门id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelCheckDepartmentSet(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有检验部门数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSetPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------配料 WS--------------------------------
		/**
		 * 根据配方表业务主键分页查询配料数据
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActivePageByFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配方表id分页查询配料数据
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActivePageByFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配料id分获取配料数据
		 * @param 配料id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActive(
				@WebParam(name="pk")String pk);

		/**
		 * 根据配料业务id修改配料数据
		 * @param 配料对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateFormulaMixtureActive(
					@WebParam(name="formulaMixtureActive")RMFormulaMixtureActive formulaMixtureActive,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增配料
		 * @param 配料对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addFormulaMixtureActive(
					@WebParam(name="formulaMixtureActive")RMFormulaMixtureActive formulaMixtureActive,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据配料id删除配料
		 * @param 配料id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaMixtureActive(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改配料数据，配料id不能为空
		 * @param 配料列表，每个配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaMixtureActive(
					@WebParam(name="formulaMixtureActiveList")List<RMFormulaMixtureActive> formulaMixtureActiveList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增配料数据
		 * @param 配料列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddFormulaMixtureActive(
				@WebParam(name="formulaMixtureActiveList")List<RMFormulaMixtureActive> formulaMixtureActiveList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据配料id，批量删除配料数据
		 * @param 配料id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaMixtureActive(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有配料数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActivePage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------工艺标准 WS--------------------------------
		/**
		 * 根据配方表业务主键分页查询工艺标准数据
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandardsPageByFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配方表id分页查询工艺标准数据
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandardsPageByFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工艺标准id分获取工艺标准数据
		 * @param 工艺标准id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandards(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工艺标准业务id修改工艺标准数据
		 * @param 工艺标准对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updatePrecessStandards(
					@WebParam(name="precessStandards")RMPrecessStandards precessStandards,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工艺标准
		 * @param 工艺标准对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addPrecessStandards(
					@WebParam(name="precessStandards")RMPrecessStandards precessStandards,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工艺标准id删除工艺标准
		 * @param 工艺标准id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deletePrecessStandards(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工艺标准数据，工艺标准id不能为空
		 * @param 工艺标准列表，每个配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePrecessStandards(
					@WebParam(name="precessStandardsList")List<RMPrecessStandards> precessStandardsList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工艺标准数据
		 * @param 工艺标准列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddPrecessStandards(
				@WebParam(name="precessStandardsList")List<RMPrecessStandards> precessStandardsList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工艺标准id，批量删除工艺标准数据
		 * @param 工艺标准id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelPrecessStandards(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工艺标准数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandardsPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------工序 WS--------------------------------
		/**
		 * 根据配方表业务主键分页查询工序数据
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessPageByFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配方表id分页查询工序数据
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessPageByFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工序id分获取工序数据
		 * @param 工序id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcess(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工序业务id修改工序数据
		 * @param 工序对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateFormulaProcess(
					@WebParam(name="formulaProcess")RMFormulaProcess formulaProcess,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工序
		 * @param 工序对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addFormulaProcess(
					@WebParam(name="formulaProcess")RMFormulaProcess formulaProcess,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工序id删除工序
		 * @param 工序id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaProcess(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工序数据，工序id不能为空
		 * @param 工序列表，每个配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaProcess(
					@WebParam(name="formulaProcessList")List<RMFormulaProcess> formulaProcessList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工序数据
		 * @param 工序列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddFormulaProcess(
				@WebParam(name="formulaProcessList")List<RMFormulaProcess> formulaProcessList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工序id，批量删除工序数据
		 * @param 工序id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaProcess(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工序数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------前置工序 WS--------------------------------
		/**
		 * 根据配方表业务主键分页查询前置工序数据
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcessPageByFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配方表id分页查询前置工序数据
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcessPageByFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据前置工序id分获取前置工序数据
		 * @param 前置工序id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcess(
				@WebParam(name="pk")String pk);

		/**
		 * 根据前置工序业务id修改前置工序数据
		 * @param 前置工序对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateFormulaBeforeProcess(
					@WebParam(name="formulaBeforeProcess")RMFormulaBeforeProcess formulaBeforeProcess,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增前置工序
		 * @param 前置工序对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addFormulaBeforeProcess(
					@WebParam(name="formulaBeforeProcess")RMFormulaBeforeProcess formulaBeforeProcess,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据前置工序id删除前置工序
		 * @param 前置工序id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaBeforeProcess(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改前置工序数据，前置工序id不能为空
		 * @param 前置工序列表，每个配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaBeforeProcess(
					@WebParam(name="formulaBeforeProcessList")List<RMFormulaBeforeProcess> formulaBeforeProcessList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增前置工序数据
		 * @param 前置工序列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddFormulaBeforeProcess(
				@WebParam(name="formulaBeforeProcessList")List<RMFormulaBeforeProcess> formulaBeforeProcessList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据前置工序id，批量删除前置工序数据
		 * @param 前置工序id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaBeforeProcess(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有前置工序数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcessPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------工序活动 WS--------------------------------
		/**
		 * 根据配方表业务主键分页查询工序活动数据
		 * @param 配方表业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActivePageByFormulaBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据配方表id分页查询工序活动数据
		 * @param 配方表id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActivePageByFormulaPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工序活动id分获取工序活动数据
		 * @param 工序活动id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActive(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工序活动业务id修改工序活动数据
		 * @param 工序活动对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateFormulaProcessActive(
					@WebParam(name="formulaProcessActive")RMFormulaProcessActive formulaProcessActive,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工序活动
		 * @param 工序活动对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addFormulaProcessActive(
					@WebParam(name="formulaProcessActive")RMFormulaProcessActive formulaProcessActive,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工序活动id删除工序活动
		 * @param 工序活动id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaProcessActive(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工序活动数据，工序活动id不能为空
		 * @param 工序活动列表，每个配方表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaProcessActive(
					@WebParam(name="formulaProcessActiveList")List<RMFormulaProcessActive> formulaProcessActiveList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工序活动数据
		 * @param 工序活动列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddFormulaProcessActive(
				@WebParam(name="formulaProcessActiveList")List<RMFormulaProcessActive> formulaProcessActiveList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工序活动id，批量删除工序活动数据
		 * @param 工序活动id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaProcessActive(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工序活动数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActivePage(
					@WebParam(name="pageParam")PageParamDTO pageParam);



	
	/* CUSTOM CODE START(wsservice,functions,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}