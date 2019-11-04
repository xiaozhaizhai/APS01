package com.supcon.orchid.WOM.services.impl;

import java.util.Map;

import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.WOM.entities.WOMResult;

import org.springframework.stereotype.Component;

/**
 * Created By guding on 2019/2/22 15:40
 */
@Component("pdaProcedureReport")
public class PdaProcedureImpl extends ProcedureAbstract {

	/**
	 * 指令单开始
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult startTask(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 指令单结束
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult endTask(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 工序开始
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult startProcess(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 工序结束
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult endProcess(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 开始活动
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult startActive(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 结束活动
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult endActive(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 机动活动开始
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult adjustStartActive(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 机动活动结束
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult adjustEndActive(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 下推请检单
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult addInspect(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 下推待投料记录
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult addwaitPutInRecord(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 生成报工单
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult addTaskReport(Map<String, Object> resultMap) {
		return null;
	}

	/**
	 * 生成投料单
	 *
	 * @param resultMap
	 * @return
	 */
	@Override
	public WOMResult addPutInRecord(Map<String, Object> resultMap) {
		return null;
	}

	@Override
	public Boolean mqDealTaskBoolean(RMMQDealinfo di, Boolean dealError) {
		return null;
	}

	@Override
	public Boolean mqDealUnitBoolean(RMMQDealinfo di, Boolean dealError) {
		return null;
	}

	@Override
	public Boolean mqDealPhaseBoolean(RMMQDealinfo di, Boolean dealError) {
		return null;
	}

	@Override
	public Boolean mqEndOperationBoolean(RMMQDealinfo di, Boolean dealError) {
		return null;
	}

}
