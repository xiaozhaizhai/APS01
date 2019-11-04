/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.MESBasic.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.supcon.orchid.MESBasic.services.ApiService;
import com.supcon.orchid.container.mvc.struts2.support.GenericActionSupport;

/**
 * 工厂模型API接口
 * 
 * @author zhuyuyin
 * @version 1.0
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ApiAction extends GenericActionSupport {
	private static final long serialVersionUID = -2715964637959730346L;
	@Resource
	private ApiService apiService;
	private Long id;
	private String method;
	private String resultXml;
	private Long start_parent_id;
	private String node_type_ids;
	private Long tree_show;
	
	@Action(value = "/public/factory/api")
	public void factoryApi() {
		if(null != method){
			resultXml = apiService.api(method, id, start_parent_id, node_type_ids, tree_show);
		} else {
			StringBuilder builder = new StringBuilder("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			builder.append("<error>").append("the param (method) is null").append("</error>");
			resultXml = builder.toString();
		}
		try {
			response.setContentType("text/xml;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(resultXml);
			out.flush();
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	@Action(value = "/public/factory/getRegister")
	public void factoryRegister(){
		resultXml = apiService.getRegisterXml();
		try {
			response.setContentType("text/xml;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(resultXml);
			out.flush();
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getResultXml() {
		return resultXml;
	}

	public void setResultXml(String resultXml) {
		this.resultXml = resultXml;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getStart_parent_id() {
		return start_parent_id;
	}

	public void setStart_parent_id(Long start_parent_id) {
		this.start_parent_id = start_parent_id;
	}

	public String getNode_type_ids() {
		return node_type_ids;
	}

	public void setNode_type_ids(String node_type_ids) {
		this.node_type_ids = node_type_ids;
	}

	public Long getTree_show() {
		return tree_show;
	}

	public void setTree_show(Long tree_show) {
		this.tree_show = tree_show;
	}

}
