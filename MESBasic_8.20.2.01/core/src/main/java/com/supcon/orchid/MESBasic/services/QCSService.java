package com.supcon.orchid.MESBasic.services;

import java.util.List;
import java.util.Map;

public interface QCSService {
	
	/**
	 * 根据参数生成请检单，物品在表体
	 * @param paramMap
	 * @return
	 */
	public Map<String,Object> createInspect(Map<String,Object> paramMap);
	
	/**
	 * 根据参数生成请检单，物品在表头
	 * @param paramMap
	 * @return
	 */
	public Map<String,Object> createInspectNew(Map<String, Object> paramMap);
	
	/**
	 * 按批号获取最新检验报告信息
	 * @param batchCode 批号
	 * @return
	 */
	public Map<String,Object> getCheckInfo(String batchCode);
	
	/**
	 * 按批号获取所以检验报告信息
	 * @param batchCode 批号
	 * @return
	 */
	public List<Map<String,Object>> getCheckInfoAll(String batchCode);
	
	/**
	 * 按批号获取检验结论
	 * @param tableNo 单据编号
	 * @return
	 */
	public String getCheckResultByTableNo(String tableNo);
	
	/**
	 * 按批号获取检验结论是否合格
	 * @param tableNo 单据编号
	 * @return
	 */
	public Boolean isCheckQualifiedByTableNo(String tableNo);

	/**
	 * 按批号获取检验信息
	 * @param tableNo 单据编号
	 * @return
	 */
	public Map<String,Object> getCheckInfoByTableNo(String tableNo);
	
}
