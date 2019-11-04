package com.supcon.orchid.WOM.services;

import java.util.List;
import java.util.Map;

public interface WOMEBRService {
	/**
	 * EBR同步生成投料单数据
	 * @param map   
	 * @param mapList  
	 * @return
	 */
	void addputinMaterialDatas(Map<String, Object> map,List<Map<String, Object>> mapList);
  	/**
	 * MES接收EBR报工数据
	 * @param map   
	 * @return
	 */
  	void addTaskReportinglDatas(Map<String, Object> map);
  	/**
	 * EBR接收工单参数
	 * @param produceTaskId   工单id
	 * @return
	 */
	String getDetail(String produceTaskId);
}
