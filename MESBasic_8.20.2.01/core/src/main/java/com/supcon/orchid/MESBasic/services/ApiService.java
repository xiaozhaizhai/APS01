/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.MESBasic.services;

/**
 * 
 * 
 * @author zhuyuyin
 * @version $Id$
 */
public interface ApiService {
	
	/**
	 * 工厂模型API
	 * @param method 方法
	 * @param id 工厂模型ID
	 * @param start_parent_id TODO
	 * @param node_type_ids TODO
	 * @param tree_show TODO
	 * @return
	 */
	public String api(String method, Long id, Long start_parent_id, String node_type_ids, Long tree_show);
	
	/**
	 * 获取接口说明
	 * @return
	 */
	String getRegisterXml();
  public void clearCache();
}
