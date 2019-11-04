package com.supcon.orchid.MESBasic.services;

public interface MeasureService {
	
	/**
	 * 计量委托请检单作废
	 * @param InspectID 请检单ID 
	 * @param MeasureTalbeID 计量委托单TableID
	 */
	public void mecancalInsepect(Long InspectID,Long MeasureTalbeID);
	
	/**
	 * 检验单结果回填计量委托
	 * @param result 检验单检验结论
	 * @param dispValue 检验单对应物品指标检验结果值
	 * @param InspectID 请检单ID
	 * @param MeasureTalbeID 计量委托单TableID
	 */
	public void meotherCheck(String result,String dispValue,Long InspectID,Long MeasureTalbeID);
	
	/**
	 * 不良品处理单回填计量委托
	 * @param result 不良品处理结果
	 * @param InspectID 请检单ID
	 * @param MeasureTalbeID 计量委托单TableID
	 */
	public void meotherDeal(String result,Long InspectID,Long MeasureTalbeID);
		
}
