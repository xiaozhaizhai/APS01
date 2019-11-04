package com.supcon.orchid.RM.services.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.bap.kernel.license.LicenseAdminFactory;
import com.supcon.orchid.RM.services.RMLicenseService;

@Service("rM_licenseService")
@Transactional
public class RMLicenseServiceImpl implements RMLicenseService,InitializingBean, DisposableBean {

	@Override
	public void destroy() throws Exception {

	}

	
	@Override
	public void afterPropertiesSet() throws Exception {
		
		/**
		 * 业务模块在注册授权key
		 * 调用方法LicenseAdmin.registeModuleKey(String key, String moduleCode, String moduleName,String module) 
		 * @param key 是产品经理申请下来的授权码
		 * @param moduleCode 为该模块在实体配置中的模块code； 
		 * @param moduleName是该模块的名称，需按照国际化结构定义;
		 * @param module 是产品经理申请的模块授权型号。
		 * 
		 */
		LicenseAdminFactory.getInstance().getLicenseAdmin().registerModuleKey("EdrvXM2VSop2R4TChCrLg2UPWiHlC1Ht3HOkrltncTPzzIMAgZmxqYEf7g47OmvXCO3u1g==","RM","{'zh_CN':'VxMES配方管理软件','en_US':'VxMES-RM','zh_TW':'VxMES配方管理軟件'}","VxMES-RM");

	}
	@Override
	public Map<Serializable, Serializable> getBusinessKeyMap(
			Serializable businessKeyName, List<Serializable> businessKeys) {
		// TODO Auto-generated method stub
		return null;
	}




}
