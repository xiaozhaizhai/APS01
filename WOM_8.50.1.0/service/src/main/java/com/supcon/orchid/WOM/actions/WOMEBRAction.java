package com.supcon.orchid.WOM.actions;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.Preparable;
import com.supcon.orchid.WOM.services.WOMEBRService;
import com.supcon.orchid.container.mvc.struts2.support.BAPEntityConfGenericActionSupport;
import com.supcon.orchid.ec.utils.JSONUtil;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class WOMEBRAction extends BAPEntityConfGenericActionSupport implements Preparable {

	@Autowired
	private WOMEBRService eBRService;
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int findFieldPermission(String arg0, String arg1) {
		// TODO Auto-generated method stub
		return 0;
	}
	private String putinMaterialsJson;
	
	public String getPutinMaterialsJson() {
		return putinMaterialsJson;
	}

	public void setPutinMaterialsJson(String putinMaterialsJson) {
		this.putinMaterialsJson = putinMaterialsJson;
	}

	/**
	 * 生成投料记录单
	 * @author yj
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/addPutinMaterialRecords",
			results = {@Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" })})
	public String addPutinMaterialRecords() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(putinMaterialsJson);
		List<Map<String, Object>> mapList = (List<Map<String, Object>>)map.get("materials");
		eBRService.addputinMaterialDatas(map, mapList);
		responseMap.put("dealSuccessFlag", true);
		return SUCCESS;
	}
	
	
	private String taskReportinglJson;
	public String getTaskReportinglJson() {
		return taskReportinglJson;
	}

	public void setTaskReportinglJson(String taskReportinglJson) {
		this.taskReportinglJson = taskReportinglJson;
	}

	/**
	 * 生成投料报工单
	 * @author yj
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/addTaskReporting",
			results = {@Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag" })})
	public String addTaskReporting() throws Exception{
		Map<String, Object> map = (Map<String, Object>)JSONUtil.generateMapFromJson(taskReportinglJson);
		eBRService.addTaskReportinglDatas(map);
		responseMap.put("dealSuccessFlag", true);
		return SUCCESS;
	}
	
	private String taskID;
	
	public String getTaskID() {
		return taskID;
	}

	public void setTaskID(String taskID) {
		this.taskID = taskID;
	}

	/**
	 * 生成投料报工单
	 * @author yj
	 * @param 数据 json
	 * @return
	 */
	@Action(value = "/public/WOM/external/getTaskDetails",
			results = {@Result(type = JSON, params = { "root", "responseMap","excludes", "*", "includes","dealSuccessFlag,details" })})
	public String getTaskDetails() throws Exception{
		String details = eBRService.getDetail(taskID);
		responseMap.put("details", details);
		responseMap.put("dealSuccessFlag", true);
		return SUCCESS;
	}
}
