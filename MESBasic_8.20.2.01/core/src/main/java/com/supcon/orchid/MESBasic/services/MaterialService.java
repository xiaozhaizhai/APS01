package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.Material2MaSReinspectResult;
import com.supcon.orchid.MESBasic.entities.ReInspectEnums;
import com.supcon.orchid.MESBasic.localException.LocalException;

import java.util.Date;
import java.util.List;
import java.util.Map;

/*
 * @author xiaqunfeng
 * 
 */
public interface MaterialService {
	/*
	 * 仓库接口
	 *  
	 * inOutString  出入库单关键字段 
	 * 1、Type	   otherInSingle		其它入库单
	 * 				otherOutSingle		其他出库单
	 *  			returnInSingle		归还入库单	
	 *  			borrowOutSingle 	借用出库单
	 *  			acquireOutSingle	领用出库单
	 * 2、
	 * 
	 */
	public String MaterialCreate(List<Map> inOutString);
  
  	/**
	 * 生产模块与物料管理接口
	 * @param inOutString
     *1、Type
     	appropriation		调拨单
        produceInSingles	生产入库
        produceOutSingle	生产出库
	 * @return
	 */
	//public String womMaterialCreate(List<Map> inOutString);
  	/**
	 * 复检发起接口
	 * @param reInspectEnums            发起类型
	 * @param checkDate                 复检时间
	 * @param materialStandingcrop      批对象
	 * @param <T>
	 */
	public <T> void reInspectRecord(ReInspectEnums reInspectEnums ,Date checkDate, T materialStandingcrop) throws LocalException;

	/**
	 *  * 更新复检状态
	 * @param reInspectEnums	类型
	 * @param batchText     	批次号
	 * @param wareCode      	仓库编号
	 * @param placeSetCode  	货位编号
	 * @return
	 * @throws LocalException
	 */
	public Material2MaSReinspectResult updateInspectRecordStatus(ReInspectEnums reInspectEnums,Long wareCode,Long placeSetCode,Long goodId,String batchText) throws LocalException;

	/**
	 *
	 * @param t 					更新对象
	 * @return
	 * @throws LocalException
	 */
	public <T> Material2MaSReinspectResult updateInspectRecordStatus(ReInspectEnums reInspectEnums,T t) throws LocalException;

	/**
	 * 检测当前批次仓库、货位 获取复检台账 查看是否正在进行复检
	 * @param batchText     批次号
	 * @return
	 * @throws LocalException
	 */
	public Material2MaSReinspectResult isInspecting(Long wareId,Long placeSetId,Long goodId,String batchText) throws LocalException;
	/**
	 * 检测当前批次仓库、货位 获取复检台账 查看是否正在进行复检
	 * @param batchId     批次ID
	 * @return
	 * @throws LocalException
	 */
	public Material2MaSReinspectResult isInspecting(Long batchId) throws LocalException;

    /**
     * 获取 是否需要提醒
     * @param wareId
     * @param goodId
     * @param batchText
     * @return
	 * 0        表示无需提醒
	 * 1        表示进入复检提醒范围
	 * 2        表示进入复检着重提醒范围
	 * 3        表示超出复检日期
	 * 4        表示进入有效期提醒范围
	 * 5        表示进入有效期提醒范围 且 进入复检提醒范围
	 * 6        表示进入有效期提醒范围 且 进入复检着重提醒范围
	 * 7        表示进入有效期提醒范围 且 超出复检时间
     */
	public int isNeedNotify(Long wareId,Long placeSetId,Long goodId,String batchText);
	public int isNeedNotify(Long wareId,String placeSetCode,Long goodId,String batchText);

	Map<Long,Integer> findExpireDaysIntervalByStandingCropIds(List<Long> standingCropIds);
  
  /**
	 * 置回正在验标识
	 * @param id
	 * @return
	 */
	public Boolean resetReinspect(long id);
	
	/**
	 * 更新复验次数
	 * @param id
	 * @return
	 */
	public Boolean updateReinspectCount(long id, String result);
	
	/**
	 * 更新复验日期
	 * @param id
	 * @return
	 */
	public Boolean updateReinspectDate(long id, String result);
	
	/**
	 * 作废
	 * @param id
	 * @return
	 */
	 
	public Boolean cancelReinspectDate(long id);
  
	/**
	 * 调拨单bap内部接口
	 * @author yaoyao
	 * @param inOutMap
	 * @return resultMap
	 *
	 * create by yy 2019-05-10
	 */
	Map<String, String> generateAppropriationBill(Map<String, Object> inOutMap);

	/**
	 * 调拨单web api
	 * @author yaoyao
	 * @param jsonStr
	 * @return resultMap
	 *
	 * create by yy 2019-05-10
	 */
	Map<String, String> generatAppropriationByJsonStr(String jsonStr);

	/**
	 * 货位调整单bap内部接口
	 * @author yaoyao
	 * @param inOutMap
	 * @return resultMap
	 *
	 * create by yy 2019-05-13
	 */
	Map<String, String> generatePlaceAdjustBill(Map<String, Object> inOutMap);

	/**
	 * 货位调整单web api
	 * @author yaoyao
	 * @param jsonStr
	 * @return resultMap
	 *
	 * create by yy 2019-05-13
	 */
	Map<String, String> generatePlaceAdjustByJsonStr(String jsonStr);

	/**
	 * 生产出库单bap内部接口
	 * @author yaoyao
	 * @param inOutMap
	 * @return resultMap
	 *
	 * create by yy 2019-05-13
	 */
	Map<String, String> generateProduceOutBill(Map<String, Object> inOutMap);

	/**
	 * 生产出库单web api
	 * @author yaoyao
	 * @param jsonStr
	 * @return resultMap
	 *
	 * create by yy 2019-05-13
	 */
	Map<String, String> generateProduceOutByJsonStr(String jsonStr);
	
  /**
	* 仓库接口  冻结单
	* @author wangkai
    * @param strMap Json字符串
	* @return Map
	* create by wk at 2019年5月09日
	*/		
	public Map<String,Object> materialCreatFrozenJson(String strMap);
  
  /**
	* 仓库接口  解冻单
	* @author wangkai
    * @param strMap Json字符串
	* @return Map
	* create by wk at 2019年5月09日
	*/		
	public Map<String,Object> materialCreatDefrostJson(String strMap);
  
   /**
	* 仓库接口  生产入库单
	* @author wangkai
    * @param strMap Json字符串
	* @return Map
	* create by wk at 2019年5月09日
	*/		
	public Map<String,Object> materialProductInJson(String strMap);
}
