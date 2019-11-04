package com.supcon.orchid.MESBasic.services;

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

import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndex;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEamType;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicObjEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicObjPostion;
import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicObjTeam;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicPositionDeal;
import com.supcon.orchid.MESBasic.entities.MESBasicDepartmentWare;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProdattrel;
import com.supcon.orchid.MESBasic.entities.MESBasicCommDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;
import com.supcon.orchid.MESBasic.entities.MESBasicProdDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicProdLevel;
import com.supcon.orchid.MESBasic.entities.MESBasicProdResetDaily;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicProductCost;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroup;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroupMember;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClass;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;

/* CUSTOM CODE START(wsservice,import,MESBasic_1_eamType_EamType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

@WebService(name="MESBasicEamType",targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({
ArrayList.class,PageValueDTO.class,HashMap.class,SimulationMap.class})
public interface MESBasicEamTypeWSService{
//-------------------主模型WS--------------------
		/**
		 * 根据业务主键获取设备类型数据
		 * @param 业务主键
		 * @return jws返回对象
		 */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getEamTypeByBusinessKey(
	    		@WebParam(name="businessKey")String businessKey);
	    		
	    /**
	     * 根据id获取设备类型数据
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO getEamTypeByPk(
	    		@WebParam(name="pk")String pk);
	    
	    /**
	     * 修改设备类型数据
	     * @param 设备类型对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO updateEamType(
	    			@WebParam(name="eamType")MESBasicEamType eamType,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 创建设备类型数据
	     * @param 设备类型对象
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO addEamType(
	    		@WebParam(name="eamType")MESBasicEamType eamType,
	    		@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
	    /**
	     * 根据业务主键删除设备类型
	     * @param 业务主键
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteEamTypeByBusinessKey(
	    			@WebParam(name="businessKey")String businessKey,
					@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

	    /**
	     * 根据id删除设备类型
	     * @param primary key
	     * @return jws返回对象
	     */
	    @WebMethod
	    @WebResult(name="jwsResult")public JWSResultDTO deleteEamTypeByPk(
	    		@WebParam(name="pk")String pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		
		/**
		 * 批量新增设备类型
		 * @param 设备类型对象，每个设备类型对象必须包含ownerStaffUUID
		 * @return jws返回对象
		 */
		@WebMethod
		public  @WebResult(name="jwsResult")JWSListResultDTO batchAddEamType(
				@WebParam(name="eamTypeList")List<MESBasicEamType> eamTypeList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);

		/**
		 * 批量修改设备类型
		 * @param 设备类型对象列表，每个贩卖机对象必须包含ownerStaffUUID,业务主键或者id
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchUpdateEamType(
				@WebParam(name="eamTypeList")List<MESBasicEamType> eamTypeList,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
	    
		/**
		 * 根据id批量删除设备类型
		 * @param 设备类型id列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteEamTypeByPk(
				@WebParam(name="pk")List<String> pk,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);


		/**
		 * 根据业务主键批量删除设备类型
		 * @param 设备类型业务主键列表
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO batchDeleteEamTypeByBusinessKey(
				@WebParam(name="businessKey")List<String> businessKey,
				@WebParam(name="ownerStaffUUID")String ownerStaffUUID);
		
		/**
		 * 分页查询所有设备类型
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSResultDTO getEamTypePage(
				@WebParam(name="pageParam")PageParamDTO pageParam);
		
		/**
		 * 根据设备类型业务主键查询设备类型下所有辅模型
		 * @param 设备类型业务主键
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		             @WebParam(name="businessKey")String businessKey);

		/**
		 * 根据设备类型id查询设备类型下所有辅模型
		 * @param 设备类型id
		 * @param 分页查询参数
		 * @return jws返回对象
		 */
		@WebMethod
		@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
				@WebParam(name="pk")String pk);
		
		//-----------------------辅模型WS------------------------------------------------------------

	
	/* CUSTOM CODE START(wsservice,functions,MESBasic_1_eamType_EamType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}