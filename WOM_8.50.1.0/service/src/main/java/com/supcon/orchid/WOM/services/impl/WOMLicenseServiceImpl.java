package com.supcon.orchid.WOM.services.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.bap.kernel.license.LicenseAdminFactory;
import com.supcon.orchid.WOM.services.WOMLicenseService;


@Service("wOM_licenseService")
@Transactional
public class WOMLicenseServiceImpl implements WOMLicenseService,InitializingBean, DisposableBean {

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
		LicenseAdminFactory.getInstance().getLicenseAdmin().registerModuleKey("EdrvXM2VSop2R4TChCrLg3D1tHNmftd+3HOkrltncTNpK1c3VApgzbZ0dGRWd+8Mm1HLgQ==","WOM","{'zh_CN':'VxMES工单管理软件','en_US':'VxMES-WOM','zh_TW':'VxMES工單管理軟件'}","VxMES-WOM");
		
	}
	
	@Override
	public Map<Serializable, Serializable> getBusinessKeyMap(
			Serializable businessKeyName, List<Serializable> businessKeys) {
		// TODO Auto-generated method stub
		return null;
	}




}
