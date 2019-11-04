/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;

import javax.print.Doc;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sun.xml.bind.v2.runtime.unmarshaller.XsiNilLoader.Single;
import com.supcon.orchid.X6Basic.daos.X6BasicSignatureDao;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.foundation.entities.Document;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.DocumentService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.services.BapDealInfoSignatureService;

/**
 * X6签名接口实现
 * 
 * @author zhuyuyin
 * @version 1.0
 */
@Service("x6Basic_dealInfoSignatureService")
@Transactional
public class X6BasicDealInfoSignatureServiceImpl implements BapDealInfoSignatureService {
	@Autowired
	private UserService userService;
	private StaffService staffService;
	@Autowired
	private X6BasicSignatureDao signatureDao;
	@Autowired
	private DocumentService documentService;
	private static final String DOWNLOADACTION = "/foundation/workbench/download.action?id=";
	private static final String DOC_TYPE = "X6Basic_ggSignetManage_signature";

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.supcon.orchid.services.BapDealInfoSignatureService#getSignatureUrl(java.lang.String)
	 */
	@Override
	public String getSignatureUrl(String username) {
		String url = null;
		if (null != username && username.trim().length() > 0) {
			User user = userService.getUser(username);
			if (null != user) {
				Staff staff = user.getStaff();
				if (null != staff) {
					List<X6BasicSignature> signatureList = signatureDao.findByCriteria(Restrictions.eq("staff", staff),
							Restrictions.eq("valid", true));
					if (null != signatureList && !signatureList.isEmpty()) {
						X6BasicSignature signature = signatureList.get(0);
						List<Document> documentList = documentService.getAllByLinkIdAndType(signature.getId(), DOC_TYPE);
						if (null != documentList && !documentList.isEmpty()) {
							Document document = documentList.get(0);
							url = DOWNLOADACTION + document.getId() + "&entityCode=X6Basic_1.0_ggSignetManage";
						}
					}
				}
			}
		}
		return url;
	}
}
