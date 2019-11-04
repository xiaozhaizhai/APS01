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

/* CUSTOM CODE START(wsservice,import,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

@WebService(name="RMInterfaceSyncLog",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface RMInterfaceSyncLogWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取接口同步日志数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getInterfaceSyncLogByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取接口同步日志数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getInterfaceSyncLogByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改接口同步日志数据
	     * @param 接口同步日志对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateInterfaceSyncLog(
	    			@WebParam(name="interfaceSyncLog")RMInterfaceSyncLog interfaceSyncLog,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建接口同步日志数据
	     * @param 接口同步日志对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addInterfaceSyncLog(
	    		@WebParam(name="interfaceSyncLog")RMInterfaceSyncLog interfaceSyncLog,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除接口同步日志
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteInterfaceSyncLogByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除接口同步日志
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteInterfaceSyncLogByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增接口同步日志
		 * @param 接口同步日志对象，每个接口同步日志对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddInterfaceSyncLog(
				@WebParam(name="interfaceSyncLogList")List<RMInterfaceSyncLog> interfaceSyncLogList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改接口同步日志
		 * @param 接口同步日志对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateInterfaceSyncLog(
				@WebParam(name="interfaceSyncLogList")List<RMInterfaceSyncLog> interfaceSyncLogList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除接口同步日志
		 * @param 接口同步日志id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteInterfaceSyncLogByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除接口同步日志
		 * @param 接口同步日志业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteInterfaceSyncLogByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有接口同步日志
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getInterfaceSyncLogPage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据接口同步日志业务主键查询接口同步日志下所有辅模型
		 * @param 接口同步日志业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据接口同步日志id查询接口同步日志下所有辅模型
		 * @param 接口同步日志id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------
	//----------------------------MQ处理信息表 WS--------------------------------
		/**
		 * 根据接口同步日志业务主键分页查询MQ处理信息表数据
		 * @param 接口同步日志业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfoPageByInterfaceSyncLogBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据接口同步日志id分页查询MQ处理信息表数据
		 * @param 接口同步日志id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfoPageByInterfaceSyncLogPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据MQ处理信息表id分获取MQ处理信息表数据
		 * @param MQ处理信息表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfo(
				@WebParam(name="pk")String pk);

		/**
		 * 根据MQ处理信息表业务id修改MQ处理信息表数据
		 * @param MQ处理信息表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateMQDealinfo(
					@WebParam(name="mQDealinfo")RMMQDealinfo mQDealinfo,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增MQ处理信息表
		 * @param MQ处理信息表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addMQDealinfo(
					@WebParam(name="mQDealinfo")RMMQDealinfo mQDealinfo,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据MQ处理信息表id删除MQ处理信息表
		 * @param MQ处理信息表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteMQDealinfo(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改MQ处理信息表数据，MQ处理信息表id不能为空
		 * @param MQ处理信息表列表，每个接口同步日志必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateMQDealinfo(
					@WebParam(name="mQDealinfoList")List<RMMQDealinfo> mQDealinfoList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增MQ处理信息表数据
		 * @param MQ处理信息表列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddMQDealinfo(
				@WebParam(name="mQDealinfoList")List<RMMQDealinfo> mQDealinfoList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据MQ处理信息表id，批量删除MQ处理信息表数据
		 * @param MQ处理信息表id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelMQDealinfo(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有MQ处理信息表数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfoPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);


	//----------------------------工厂模型映射表 WS--------------------------------
		/**
		 * 根据接口同步日志业务主键分页查询工厂模型映射表数据
		 * @param 接口同步日志业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOtherPageByInterfaceSyncLogBusinessKey(
				@WebParam(name="businessKey")String businessKey,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据接口同步日志id分页查询工厂模型映射表数据
		 * @param 接口同步日志id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOtherPageByInterfaceSyncLogPk(
				@WebParam(name="pk")String pk,
				@WebParam(name="pageParam")PageParamDTO pageParam);

		/**
		 * 根据工厂模型映射表id分获取工厂模型映射表数据
		 * @param 工厂模型映射表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOther(
				@WebParam(name="pk")String pk);

		/**
		 * 根据工厂模型映射表业务id修改工厂模型映射表数据
		 * @param 工厂模型映射表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO updateFactoryMapOther(
					@WebParam(name="factoryMapOther")RMFactoryMapOther factoryMapOther,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 新增工厂模型映射表
		 * @param 工厂模型映射表对象
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO addFactoryMapOther(
					@WebParam(name="factoryMapOther")RMFactoryMapOther factoryMapOther,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 根据工厂模型映射表id删除工厂模型映射表
		 * @param 工厂模型映射表id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO deleteFactoryMapOther(
				@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 批量修改工厂模型映射表数据，工厂模型映射表id不能为空
		 * @param 工厂模型映射表列表，每个接口同步日志必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFactoryMapOther(
					@WebParam(name="factoryMapOtherList")List<RMFactoryMapOther> factoryMapOtherList,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量新增工厂模型映射表数据
		 * @param 工厂模型映射表列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchAddFactoryMapOther(
				@WebParam(name="factoryMapOtherList")List<RMFactoryMapOther> factoryMapOtherList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 根据工厂模型映射表id，批量删除工厂模型映射表数据
		 * @param 工厂模型映射表id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDelFactoryMapOther(
					@WebParam(name="pk")List<String> pk,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有工厂模型映射表数据
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOtherPage(
					@WebParam(name="pageParam")PageParamDTO pageParam);



	
	/* CUSTOM CODE START(wsservice,functions,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}