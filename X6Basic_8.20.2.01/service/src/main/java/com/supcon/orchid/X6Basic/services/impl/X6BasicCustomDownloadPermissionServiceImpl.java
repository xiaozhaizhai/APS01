/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.X6Basic.services.impl;

import org.springframework.stereotype.Service;

import com.supcon.orchid.services.CustomDownloadPermissionService;

/**
 * 
 * 用户自定义的下载附件的权限控制
 * @author zhuyuyin
 * @version 1.0
 */
@Service("x6Basic_customDownloadPermissionService")
public class X6BasicCustomDownloadPermissionServiceImpl implements CustomDownloadPermissionService {
	private static final String ENTITY_CODE = "X6Basic_1.0_ggSignetManage";
	/* (non-Javadoc)
	 * @see com.supcon.orchid.services.CustomDownloadPermissionService#needCheckPermission(java.lang.String, java.lang.Long, java.lang.String, java.lang.String)
	 */
	@Override
	public boolean needCheckPermission(String entityCode, Long linkId, String id, String linkType) {
		boolean flag = false;
		if(entityCode.equals(ENTITY_CODE)){
			flag = true;
		}
		return flag;
	}

	/* (non-Javadoc)
	 * @see com.supcon.orchid.services.CustomDownloadPermissionService#checkPermission(java.lang.String, java.lang.Long, java.lang.String, java.lang.String)
	 */
	@Override
	public boolean checkPermission(String entityCode, Long linkId, String id, String linkType) {
		boolean flag = false;
		if(entityCode.equals(ENTITY_CODE)){
			flag = true;
		}
		return flag;
	}

}
