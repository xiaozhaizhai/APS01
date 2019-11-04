/**
 * 
 */
package com.supcon.orchid.X6Basic.services.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.osgi.framework.BundleContext;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.ServiceReference;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.security.AuthenticationCustomer;
import com.supcon.orchid.services.FileUploadService;

/**
 * @author liuming
 * 
 */
@Service("x6baseAuthenticationCustomer")
@Transactional
public class X6baseAuthenticationCustomerImpl implements AuthenticationCustomer {

	@Override
	public boolean afterLogin(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		Staff staff = (Staff) session.getAttribute("staff");
//		Map<String, Object> param = new HashMap<>();
//		param.put("staff_id", staff.getId());
//		param.put("user_id", staff.getUser().getId());
//		BapKey bapKey = bapKeyService.generateKey(param, null);
//		session.setAttribute("BI_AUTHENTICATION_KEY", bapKey);
		return true;
	}

	@Override
	public boolean beforeLogout(HttpSession session) {
//		BapKey bapKey = (BapKey) session.getAttribute("BI_AUTHENTICATION_KEY");
//		if(null != bapKey) bapKeyService.delete(bapKey.getId());
//		return true;
		BundleContext bundleContext = FrameworkUtil.getBundle(getClass()).getBundleContext();
		ServiceReference ref = bundleContext.getServiceReference(FileUploadService.class.getName());
		if (null != ref) {
			String userName = null;
			if (null != session.getAttribute("username")) {
				userName = session.getAttribute("username").toString();
			}
			FileUploadService fileUploadService = (FileUploadService) bundleContext.getService(ref);
			fileUploadService.clearAllDocumentOpenInfoByCurrentUser(userName);
		}
		return true;
	}
}
