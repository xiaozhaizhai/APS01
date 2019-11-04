package com.supcon.orchid.WOM.services.testing;

import java.util.Map; 
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Collections;

import junit.framework.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.transaction.BeforeTransaction;

import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.security.OrchidAuthenticationToken;
import com.supcon.orchid.testing.unittesting.AbstractOrchidServiceTests;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.WOM.services.PrepareMaterialService;

import org.easymock.EasyMock;
import org.easymock.IMocksControl;
/* CUSTOM CODE START(serviceTests,import,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */

public class PrepareMaterialServiceTests extends AbstractOrchidServiceTests {

	@Autowired
	private PrepareMaterialService prepareMaterialService;
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private StaffService staffService;
	
	private IMocksControl control = EasyMock.createControl();
	
	@BeforeTransaction
	public void setUpData() throws Exception {
		//初始化测试数据
		this.testDataPopulator.populate("classpath:/dropSql.sql");
		
		/* CUSTOM CODE START(serviceTests,beforeSetUp,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	/**
	 * 模拟登录过程
	 *
	 * */
	@SuppressWarnings("unchecked")
	@Before
	public void setUp() {
		// 获取当前公司
		User user = userService.load(3506L);
		OrchidAuthenticationToken token = new OrchidAuthenticationToken(user,
				null, null, companyService.load(1001L),
				staffService.load(2491L), Collections.EMPTY_LIST,
				Collections.EMPTY_LIST);
		SecurityContextHolder.clearContext();
		SecurityContextHolder.getContext().setAuthentication(token);
		// 创建树
		// List<Department> getTreeChildren = departmentservice.getTreeChildren(null);
	}
	/* CUSTOM CODE START(serviceTests,functions,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}