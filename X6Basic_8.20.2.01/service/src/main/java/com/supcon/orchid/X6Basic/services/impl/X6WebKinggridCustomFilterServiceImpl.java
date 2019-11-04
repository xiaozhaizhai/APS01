/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.X6Basic.services.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.osgi.framework.Bundle;
import org.osgi.framework.BundleContext;
import org.osgi.framework.Constants;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.InvalidSyntaxException;
import org.osgi.framework.ServiceReference;
import org.osgi.util.tracker.ServiceTracker;
import org.osgi.util.tracker.ServiceTrackerCustomizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import DBstep.iMsgServer2000;

import com.supcon.orchid.PropertyHolder;
import com.supcon.orchid.services.BAPDocumentValidateService;
import com.supcon.orchid.services.BAPWebCustomFilterService;
import com.supcon.orchid.services.FileUploadService;
import com.supcon.orchid.utils.FileUtil;

/**
 * 
 * 
 * @author LIUMING
 * @version $Id$
 */
@Service("x6WebKinggridCustomFilterService")
@Transactional
public class X6WebKinggridCustomFilterServiceImpl implements BAPWebCustomFilterService {

	private static final Logger LOGGER = LoggerFactory.getLogger(X6WebKinggridCustomFilterServiceImpl.class);

	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private BAPDocumentValidateService bapDocumentValidateService;
	
	private ServiceTracker serviceTracker;

	/**
	 * 
	 * @param fileUploadService
	 *            the fileUploadService to set
	 */
	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	/**
	 * @param bapDocumentValidateService
	 *            the bapDocumentValidateService to set
	 */
	public void setBapDocumentValidateService(BAPDocumentValidateService bapDocumentValidateService) {
		this.bapDocumentValidateService = bapDocumentValidateService;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig filterConfig) {
		if (null == fileUploadService || null == bapDocumentValidateService) {
			Bundle bundle = FrameworkUtil.getBundle(X6WebKinggridCustomFilterServiceImpl.class);
			if (null == bundle) {
				LOGGER.warn("Can not find the bundle object, is the X6WebKinggridCustomFilterServiceImpl running in the virgo server?");
				return;
			}
			BundleContext bundleContext = bundle.getBundleContext();
			try {
				org.osgi.framework.Filter filter = FrameworkUtil.createFilter("(|(" + Constants.OBJECTCLASS + "="
						+ FileUploadService.class.getName() + ")(" + Constants.OBJECTCLASS + "="
						+ BAPDocumentValidateService.class.getName() + "))");
				serviceTracker = new ServiceTracker(bundleContext, filter, new FileUploadTracker(bundleContext));
				serviceTracker.open();
			} catch (InvalidSyntaxException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse,
	 * javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {
		// TODO Auto-generated method stub
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		iMsgServer2000 iMsgServer2000 = new iMsgServer2000();
		iMsgServer2000.Load(httpRequest);
		if (null != iMsgServer2000.GetMsgByName("DBSTEP")) {
			try {
				if (iMsgServer2000.GetMsgByName("DBSTEP").equalsIgnoreCase("DBSTEP")) {
					String mOption = iMsgServer2000.GetMsgByName("OPTION");
					String mRecordID = iMsgServer2000.GetMsgByName("RECORDID");
					Long linkId = null;
					if (mRecordID != null && mRecordID.length() > 0) {
						linkId = Long.valueOf(mRecordID);
					}
					String mFileName = iMsgServer2000.GetMsgByName("FILENAME");
					String mFileType = iMsgServer2000.GetMsgByName("FILETYPE");
					String type = iMsgServer2000.GetMsgByName("type");
					String propertyCode = iMsgServer2000.GetMsgByName("propertyCode");
					String showType = iMsgServer2000.GetMsgByName("showType");
					String editUserName = iMsgServer2000.GetMsgByName("editUserName");
					if (null == mFileName || mFileName.length() == 0) {
						mFileName = type;
					}
					if (mOption.equalsIgnoreCase("LOADFILE")) {
						if (mRecordID != null && !mRecordID.isEmpty() && (type.startsWith("bapOffice") || type.startsWith("bapTemplate"))) {
							if (linkId != null && linkId != -1) {
								// bapDocumentValidateService.downloadValidate(entityCode, linkId, null, type);
								InputStream inputStream = fileUploadService.getOfficeDocInputStream(linkId, type, propertyCode, showType);
								if (inputStream != null) {
									byte[] mFileBody = getContent(inputStream);
									LOGGER.info("-----------the X6WebKinggridCustomFilterServiceImpl LOADFILE for linkId {} and showType {}", linkId,
											showType);
									iMsgServer2000.MsgFileBody(mFileBody);
									if (showType.equalsIgnoreCase("pdf")) {
										iMsgServer2000.SetMsgByName("pdfOpened", "opened");
									}
								}
							}
						}
					} else if (mOption.equalsIgnoreCase("LOADTEMPLATE")) {
						String mTemplate = iMsgServer2000.GetMsgByName("TEMPLATE");
						if (mTemplate != null && !mTemplate.isEmpty() && (type.startsWith("bapOffice") || type.startsWith("bapTemplate"))) {
							Long templateId = Long.valueOf(mTemplate);
							if (templateId != null) {
								// bapDocumentValidateService.downloadValidate(entityCode, templateId, null, type);
								InputStream inputStream = fileUploadService.getOfficeDocInputStream(templateId, type, propertyCode,
										showType);
								if (inputStream != null) {
									byte[] mFileBody = getContent(inputStream);
									LOGGER.info("-----------the X6WebKinggridCustomFilterServiceImpl LOADTEMPLATE for linkId {} and showType {}", linkId,
											showType);
									iMsgServer2000.MsgFileBody(mFileBody);
								}
							}
						}
					} else if (mOption.equalsIgnoreCase("SAVEFILE")) {
						byte[] mFileBody = iMsgServer2000.MsgFileBody();// 取得文档内容
						String tempPath = PropertyHolder.get().getWorkspacePath() + File.separator + "uploads" + File.separator + "temp"
								+ File.separator + new Date().getTime() + File.separator + Math.abs(new Random().nextLong());
						String docName = mFileName + mFileType;
						File webOfficeFile = getFile(mFileBody, tempPath, docName);
						iMsgServer2000.SetMsgByName("officeFilePath", webOfficeFile.getPath());
						LOGGER.info("-----------the X6WebKinggridCustomFilterServiceImpl SAVEFILE for path {}", webOfficeFile.getPath());
						iMsgServer2000.SetMsgByName("STATUS", "保存成功!");
						iMsgServer2000.MsgError("");
					} else if (mOption.equalsIgnoreCase("SAVEPDF")) {
						byte[] mFileBody = iMsgServer2000.MsgFileBody();// 取得文档内容
						String tempPath = PropertyHolder.get().getWorkspacePath() + File.separator + "uploads" + File.separator + "temp"
								+ File.separator + new Date().getTime() + File.separator + Math.abs(new Random().nextLong());
						String docName = mFileName + ".pdf";
						File webOfficeFile = getFile(mFileBody, tempPath, docName);
						iMsgServer2000.SetMsgByName("officeFilePath", webOfficeFile.getPath());
						LOGGER.info("-----------the X6WebKinggridCustomFilterServiceImpl SAVEPDF for path {}", webOfficeFile.getPath());
						iMsgServer2000.SetMsgByName("STATUS", "保存成功!");
						iMsgServer2000.MsgError("");
					} else if (mOption.equalsIgnoreCase("DATETIME")) {
						String pattern = "yyyy-MM-dd HH:mm:ss";
						Date date = new Date();
						String currentTime = new SimpleDateFormat(pattern).format(date);
						iMsgServer2000.SetMsgByName("DATETIME", currentTime);
					} else if (mOption.equalsIgnoreCase("INSERTFILE")) {
						String contentPath = iMsgServer2000.GetMsgByName("contentPath");
						String bookMarkName = iMsgServer2000.GetMsgByName("bookMarkName");
						File contentFile = new File(contentPath);
						if (null != contentFile) {
							InputStream is = new FileInputStream(contentFile.toString());
							byte[] mFileBody = getContent(is);
							iMsgServer2000.MsgFileBody(mFileBody);
							iMsgServer2000.SetMsgByName("POSITION", (null != bookMarkName) ? bookMarkName : "Content");
							LOGGER.info("-----------the X6WebKinggridCustomFilterServiceImpl INSERTFILE for contentPath {} and  bookMarkName {}",
									contentPath, (null != bookMarkName) ? bookMarkName : "Content");
							iMsgServer2000.SetMsgByName("STATUS", "插入正文成功!");
							iMsgServer2000.MsgError("");
						}
					} else if (mOption.equalsIgnoreCase("SENDMESSAGE")) {
						String command = iMsgServer2000.GetMsgByName("command");
						String mFileId = iMsgServer2000.GetMsgByName("fileId");
						if (null != mFileId && mFileId.length() > 0) {
							long fId = Long.valueOf(mFileId);
							if (null != command && command.length() > 0) {
								if (command.equalsIgnoreCase("isFirst")) {
									boolean flag = fileUploadService.isFirstOpenDoc(fId, type, propertyCode, showType, editUserName);
									iMsgServer2000.SetMsgByName("editType", flag ? "1" : "0");
									iMsgServer2000.MsgError("");
								} else if (command.equalsIgnoreCase("closeFirst")) {
									fileUploadService.clearDocumentOpenInfo(fId, type, propertyCode, showType, editUserName);
								} else if (command.equalsIgnoreCase("updateTime")) {
									fileUploadService.updateDocumentOpenTime(fId, type, propertyCode, showType, editUserName);
								}
							}
						}
					} else if (mOption.equalsIgnoreCase("INSERTIMAGE")) {
						String imgId = iMsgServer2000.GetMsgByName("imgId");
						if (null != imgId && imgId.length() > 0) {
							long fId = Long.valueOf(imgId);
							String mLabelName = iMsgServer2000.GetMsgByName("LABELNAME");
							String imagePath = fileUploadService.getOfficeSignPath(fId, type, propertyCode);
							if(null != imagePath) {
								String imageFileType = imagePath.substring(imagePath.lastIndexOf("."));
								if (iMsgServer2000.MsgFileLoad(imagePath)) {
									iMsgServer2000.SetMsgByName("IMAGETYPE", imageFileType);
									iMsgServer2000.SetMsgByName("POSITION", mLabelName);
									iMsgServer2000.SetMsgByName("STATUS", "手写签名成功!");
									iMsgServer2000.MsgError("");
								} else {
									iMsgServer2000.MsgError("手写签名失败!");
								}
							} else {
								iMsgServer2000.MsgError("手写签名失败!");
							}
						}
					}
				}
			} catch (Exception e) {
				iMsgServer2000.MsgError("保存失败!");
				LOGGER.error(e.getMessage(), e);
			} finally {
				iMsgServer2000.Send(httpResponse);
			}
		} else {
			try {
				chain.doFilter(httpRequest, httpResponse);
			} catch (IOException e) {
				LOGGER.info(e.getMessage(), e);
			} catch (ServletException e) {
				LOGGER.info(e.getMessage(), e);
			}
		}
	}

	/**
	 * 根据byte数组，生成文件
	 */
	private File getFile(byte[] bfile, String path, String fileName) {
		BufferedOutputStream bos = null;
		FileOutputStream fos = null;
		File file = null;
		try {
			File dir = new File(path);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			file = new File(path + File.separator + fileName);
			if (!FileUtil.isFileExist(fileName)) {
				file.createNewFile();
			}
			fos = new FileOutputStream(file);
			bos = new BufferedOutputStream(fos);
			bos.write(bfile);
		} catch (Exception e) {
			LOGGER.info(e.getMessage(), e);
		} finally {
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException e1) {
					LOGGER.info(e1.getMessage(), e1);
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e1) {
					LOGGER.info(e1.getMessage(), e1);
				}
			}
		}
		return file;
	}

	/**
	 * 
	 * @param fi
	 * @param doc
	 * @return
	 * @throws IOException
	 */
	private byte[] getContent(InputStream fi) throws IOException {
		int offset = 0;
		int numRead = 0;
		byte[] buffer = new byte[fi.available()];
		while (offset < buffer.length && (numRead = fi.read(buffer, offset, buffer.length - offset)) >= 0) {
			offset += numRead;
		}
		fi.close();
		return buffer;
	}

	class FileUploadTracker implements ServiceTrackerCustomizer {

		private BundleContext bundleContext;

		public FileUploadTracker(BundleContext bundleContext) {
			this.bundleContext = bundleContext;
		}

		@Override
		public Object addingService(ServiceReference reference) {
			Object service = bundleContext.getService(reference);
			if (null != service) {
				if (service instanceof FileUploadService) {
					fileUploadService = (FileUploadService) service;
					return service;
				} else if (service instanceof BAPDocumentValidateService) {
					bapDocumentValidateService = (BAPDocumentValidateService) service;
					return service;
				}
			}
			return null;
		}

		@Override
		public void modifiedService(ServiceReference reference, Object service) {
			if (null != service && service instanceof FileUploadService) {
				fileUploadService = (FileUploadService) service;
			}
			if (null != service && service instanceof BAPDocumentValidateService) {
				bapDocumentValidateService = (BAPDocumentValidateService) service;
			}

		}

		@Override
		public void removedService(ServiceReference reference, Object service) {
			if (service instanceof FileUploadService) {
				fileUploadService = null;
			} else if (service instanceof BAPDocumentValidateService) {
				bapDocumentValidateService = null;
			}
		}

	};

}
