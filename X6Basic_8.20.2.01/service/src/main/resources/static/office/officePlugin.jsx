/**
 * office plugin for NTKO
 * 
 * @author fangzhibin
 * @since version 2.5
 */
var OfficeControl = CUI.OfficeControl = function(config) {
	var Sys = {}, OFFICE_CONTROL_OBJ, _officeEx, fileType, fileTypeSimple, IsFileOpened;
	var ua = navigator.userAgent.toLowerCase();
	var s;
	(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] : (s = ua
			.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] : (s = ua
			.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] : (s = ua
			.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] : (s = ua
			.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

	var classid = 'C9BC4DFF-4248-4a3c-8A49-63A7D317F404';

	if (typeof config.id == "string") {
		OFFICE_CONTROL_OBJ = $("#officeControl_" + config.id);
	}

	/**
	 * @method 初始化
	 */
	this.init = function() {
		var officeEx;
		if (Sys.ie) {
			officeEx = $('<object id="'
					+ config.id
					+ '" classid="clsid:'
					+ classid
					+ '" '
					+ 'codebase="'
					+ config.cabPath
					+ 'OfficeControl.cab#version='
					+ config.cabVersion
					+ '" width="'
					+ config.width
					+ '" height="'
					+ config.height
					+ '"> '
					+ '<param name="IsUseUTF8URL" value="-1"> '
					+ '<param name="IsUseUTF8Data" value="-1"> '
					+ '<param name="BorderStyle" value="1"> '
					+ '<param name="BorderColor" value="14402205"> '
					+ '<param name="TitlebarColor" value="15658734"> '
					+ '<param name="TitlebarTextColor" value="0"> '
					+ '<param name="MenubarColor" value="14402205"> '
					+ '<param name="MenuButtonColor" VALUE="16180947"> '
					+ '<param name="MenuBarStyle" value="3"> '
					+ '<param name="MenuButtonStyle" value="7"> '
					+ '<param name="WebUserName" value="'
					+ config.currentStaffName
					+ '"> '
					+ '<param name="ProductCaption" value="'
					+ config.productCaption
					+ '"> '
					+ '<param name="ProductKey" value="'
					+ config.productKey
					+ '"> '
					+ '<param name="Caption" value="'
					+ config.caption
					+ '"> '
					+ '<SPAN STYLE="color:red">${getJsText("js.cui.office.sec")}</SPAN>'
					+ '</object>');
		} else if (Sys.firefox) {
			officeEx = $('<object id="'
					+ config.id
					+ '" type="application/ntko-plug"  codebase="'
					+ config.cabPath
					+ 'officeControl.cab#version='
					+ config.cabVersion
					+ '" width="'
					+ config.width
					+ '" height="'
					+ config.height
					+ '" '
					+ 'clsid="{'
					+ classid
					+ '}" ForOnDocumentClosed="'
					+ config.id
					+ '_OC_OnDocumentClosed" ForOnDocumentOpened="'
					+ config.id
					+ '_OC_onDocumentOpened" ForOnCustomMenuCmd2="'
					+ config.id
					+ '_OC_onCustomMenuCmd" ForAfterOpenFromURL="'
					+ config.id
					+ '_OC_afterOpenFromURL" ForAfterPublishAsPDFToURL="'
					+ config.id
					+ '_OC_afterPublishAsPDFToURL" ForOnSaveToURL="'
					+ config.id
					+ '_OC_afterSaveFileToURL" ForOnCustomButtonOnMenuCmd="'
					+ config.id
					+ '_OC_onCustomButtonOnMenuCmd" '
					+ '_IsUseUTF8URL="-1" '
					+ '_IsUseUTF8Data="-1" '
					+ '_ForeColor="16777215" '
					+ '_TitlebarColor="15658734" '
					+ '_TitlebarTextColor="0" '
					+ '_MenubarColor="14402205" '
					+ '_MenuButtonColor="16180947" '
					+ '_MenuBarStyle="3" '
					+ '_MenuButtonStyle="7" '
					+ '_WebUserName="'
					+ config.currentStaffName
					+ '" '
					+ '_ProductCaption="'
					+ config.productCaption
					+ '" '
					+ '_ProductKey="'
					+ config.productKey
					+ '" '
					+ '_Caption="'
					+ config.caption
					+ '"> '
					+ '<SPAN STYLE="color:red">${getJsText("js.cui.office.firefox")}</SPAN>'
					+ '</object>');
		} else if (Sys.chrome) {
			officeEx = $('<object id="'
					+ config.id
					+ '" type="application/ntko-plug"  codebase="'
					+ config.cabPath
					+ 'officeControl.cab#version='
					+ config.cabVersion
					+ '" width="'
					+ config.width
					+ '" height="'
					+ config.height
					+ '" '
					+ 'clsid="{'
					+ classid
					+ '}" ForOnDocumentClosed="'
					+ config.id
					+ '_OC_OnDocumentClosed" ForOnDocumentOpened="'
					+ config.id
					+ '_OC_onDocumentOpened" ForOnCustomMenuCmd2="'
					+ config.id
					+ '_OC_onCustomMenuCmd" ForAfterOpenFromURL="'
					+ config.id
					+ '_OC_afterOpenFromURL" ForAfterPublishAsPDFToURL="'
					+ config.id
					+ '_OC_afterPublishAsPDFToURL" ForOnSaveToURL="'
					+ config.id
					+ '_OC_afterSaveFileToURL" ForOnCustomButtonOnMenuCmd="'
					+ config.id
					+ '_OC_onCustomButtonOnMenuCmd" '
					+ '_IsUseUTF8URL="-1" '
					+ '_IsUseUTF8Data="-1" '
					+ '_ForeColor="16777215" '
					+ '_TitlebarColor="15658734" '
					+ '_TitlebarTextColor="0" '
					+ '_MenubarColor="14402205" '
					+ '_MenuButtonColor="16180947" '
					+ '_MenuBarStyle="3" '
					+ '_MenuButtonStyle="7" '
					+ '_WebUserName="'
					+ config.currentStaffName
					+ '" '
					+ '_ProductCaption="'
					+ config.productCaption
					+ '" '
					+ '_ProductKey="'
					+ config.productKey
					+ '" '
					+ '_Caption="'
					+ config.caption
					+ '"> '
					+ '<SPAN STYLE="color:red">${getJsText("js.cui.office.chrome")}</SPAN>'
					+ '</object>');
		}
		_officeEx = officeEx[0];
		OFFICE_CONTROL_OBJ.append(_officeEx);
		this.regOnDocumentOpenedEvent();
		this.regOnDocumentClosedEvent();
		if (!config.fileOpen) {
			this.regAfterOpenFromURLEvent();
			this.regAfterPublishAsPDFToURLEvent();
		}
		this.onCustomMenuCmdEvent();
		this.onCustomButtonOnMenuCmdEvent();
		/*
		 * this.addMyMenu(0, config.customMenuCaption); if(config.isSign) {
		 * this.addMyMenuItems(0, 0, "${getJsText('js.cui.office.sign')}",
		 * false); } if(config.isHandSign) { this.addMyMenuItems(0, 1,
		 * "${getJsText('js.cui.office.handSign')}", false); }
		 */
		this.setFilePrint(config.officePrint);
		this.setFilePrintPreview(config.officePrint);
		if (config.isSign && config.status != 99) {
			this.addMyMenuButtons(0, " ${getJsText('js.cui.office.sign')}  ");
		}
		if (config.isHandSign && config.status != 99) {
			this
					.addMyMenuButtons(1,
							" ${getJsText('js.cui.office.handSign')} ");
		}
		if (config.showRevision) {
			this.addMyMenuButtons(2,
					" ${getJsText('js.cui.office.showRevision')} ");
		}
		if (config.hideRevision) {
			this.addMyMenuButtons(3,
					" ${getJsText('js.cui.office.hideRevision')} ");
		}
		if (config.getRevisions) {
			this.addMyMenuButtons(4,
					" ${getJsText('js.cui.office.getRevisions')} ");
		}
		if (config.acceptRevisions) {
			this.addMyMenuButtons(5,
					" ${getJsText('js.cui.office.acceptRevisions')} ");
		}
		if (config.officePrint) {
			this.addMyMenuButtons(6,
					" ${getJsText('js.cui.office.officePrint')} ");
		}
		if (config.openType == 'doc' && config.saveType == 'pdf') {
			this.addMyMenuButtons(7,
					" ${getJsText('js.cui.office.convertPdf')} ");
		}
		this.addPdfSupport();
		// this.resizeOffice();
		this.addDomainToTrustSite();
	}

	this.activateOfficeEx = function() {
		if (Sys.firefox || Sys.chrome) {
			_officeEx.activate(true);
		}
	}

	/**
	 * 假如你使用了office控件，那就加入信任站点吧
	 */
	this.addDomainToTrustSite = function() {
		var site = document.location.host;
		_officeEx.AddDomainToTrustSite(site);
	}

	/**
	 * 加载文档
	 */
	this.initalizeOfficeDoc = function(fileUrl, view, type) {
		if (fileUrl !== "") {
			this.openFileFromURL(fileUrl);
			this.setFileNew(config.isCreateNew);
			this.setIsNoCopy(config.isNoCopy);
		} else {
			try {
				if (type == 'excel') {
					_officeEx.CreateNew("Excel.Sheet");
				} else if (type == 'ppt') {
					_officeEx.CreateNew("PowerPoint.Show");
				} else if (type == 'pdf') {
					this.addPdfSupport();
					_officeEx.CreateNew("PDF.NtkoDocument");
				} else {
					_officeEx.CreateNew("Word.Document");
				}
			} catch (error) {
				if (type == 'excel') {
					_officeEx.CreateNew("ET.WorkBook");
				} else {
					_officeEx.CreateNew("WPS.Document");
				}
			}
		}

		// this.enabledMenuItem(0, 0, config.isSign ? true : false);
		// this.enabledMenuItem(0, 1, config.isHandSign ? true : false);

		if (!config.isSign || config.status == 99) {
			this.removeMyMenuButtons(0);
		}
		if (!config.isHandSign || config.status == 99) {
			this.removeMyMenuButtons(1);
		}
	}

	/**
	 * 退出office控件
	 */
	this.unload = function(linkId) {
		_officeEx.Close();
	}

	/**
	 * 获取文档控件中打开的文档的文档类型
	 */
	this.onDocumentOpened = function(str, doc) {
		switch (_officeEx.doctype) {
		case 1:
			fileType = "Word.Document";
			fileTypeSimple = "word";
			break;
		case 2:
			fileType = "Excel.Sheet";
			fileTypeSimple = "excel";
			break;
		case 3:
			fileType = "PowerPoint.Show";
			fileTypeSimple = "ppt";
			break;
		case 4:
			fileType = "Visio.Drawing";
			fileTypeSimple = "visio";
			break;
		case 5:
			fileType = "MSProject.Project";
			fileTypeSimple = "msp";
			break;
		case 6:
			fileType = "WPS Doc";
			fileTypeSimple = "wps";
			break;
		case 7:
			fileType = "Kingsoft Sheet";
			fileTypeSimple = "et";
			break;
		case 51:
			fileType = "PDF.NtkoDocument";
			fileTypeSimple = "pdf";
			break;
		default:
			fileType = "unkownfiletype";
			fileTypeSimple = "unkownfiletype";
		}
		this.setFileOpenedOrClosed(true);
		this.setReviewMode(config.isRevision);
	}

	/**
	 * 文档关闭事件
	 */
	this.onDocumentClosed = function() {
		this.setFileOpenedOrClosed(false);
	}

	/**
	 * 从URL打开文档后事件
	 */
	this.afterOpenFromURL = function(doc) {
		this.setFileSaveAs(false);
		this.setFileSave(false);
		this.setFileOpened(false);
		this.setFileClose(false);
		this.setFilePrint(config.officePrint);
		this.setFilePrintPreview(config.officePrint);
		this.setFilePageSetup(false);
		this.setFileProperties(false);

		if (config.view == "readonly" || config.isReadonly) {
			this.setReadOnly(true);
			if (fileTypeSimple != 'excel' && fileTypeSimple != 'et') {
				this.setToolBar(false);
			}
			this.setAllEditMenu(false);
		} else {
			this.setReadOnly(false);
			this.setToolBar(true);
			this.setAllEditMenu(true);
		}
	}

	/**
	 * doc转pdf保存之后的事件
	 */
	this.afterPublishAsPDFToURL = function(ret, code) {
		if (code == 0) {
			var type = (config.saveTemplate) ? "bapTemplate" : "bapOffice";
			$(OFFICE_CONTROL_OBJ + ' input[name^="' + config.id+ 'Files."][fileType="pdf"]').remove();
			OFFICE_CONTROL_OBJ.append('<input type="hidden" fileType="pdf" name="' + config.id + 'Files.filePath" value="' + ret + '"/>');
			OFFICE_CONTROL_OBJ.append('<input type="hidden" fileType="pdf" name="' + config.id + 'Files.fileType" value="office"/>');
			OFFICE_CONTROL_OBJ.append('<input type="hidden" fileType="pdf" name="' + config.id + 'Files.showType" value="pdf"/>');
			OFFICE_CONTROL_OBJ.append('<input type="hidden" fileType="pdf" name="' + config.id + 'Files.type" value="' + type + '__' + config.fileuploadType + '"/>');
			OFFICE_CONTROL_OBJ.append('<input type="hidden" fileType="pdf" name="' + config.id + 'Files.propertyCode" value="' + config.propertyCode + '" />');
			if (config.executeFunc) {
				eval(config.executeFunc);
			}
		} else {
			if (config.executeFunc) {
				eval(config.executeFunc + "Error");
			}
		}
	}

	/**
	 * 自定义菜单事件
	 */
	this.onCustomMenuCmd = function(menuPos, submenuPos, subsubmenuPos,
			menuCaption, menuID) {
		if (menuID == 0 || menuID == 41000) {
			if (config.signRefMethod) {
				eval(config.signRefMethod);
			} else {
				this.addLocalSign();
			}
		} else if (menuID == 1 || menuID == 41050) {
			if (config.handSignRefMethod) {
				eval(config.handSignRefMethod);
			} else {
				this.addLocalHandSign();
			}
		} else if (btnCmdid == 2 || btnCmdid == 41100) {
			this.setShowRevisions(true);
		} else if (btnCmdid == 3 || btnCmdid == 41150) {
			this.setShowRevisions(false);
		} else if (btnCmdid == 4 || btnCmdid == 41200) {
			this.getRevisions();
		} else if (btnCmdid == 5 || btnCmdid == 41250) {
			this.acceptAllRevisions();
		} else if (btnCmdid == 6 || btnCmdid == 41300) {
			this.officePrint(false);
		} else if (btnCmdid == 7 || btnCmdid == 41350) {
			this.saveOfficeToPdfToUrl();
		}
	}

	this.onCustomButtonOnMenuCmd = function(btnPos, btnCaption, btnCmdid) {
		if (btnCmdid == 0 || btnCmdid == 41000) {
			if (config.signRefMethod) {
				eval(config.signRefMethod);
			} else {
				this.addLocalSign();
			}
		} else if (btnCmdid == 1 || btnCmdid == 41050) {
			if (config.handSignRefMethod) {
				eval(config.handSignRefMethod);
			} else {
				this.addLocalHandSign();
			}
		} else if (btnCmdid == 2 || btnCmdid == 41100) {
			this.setShowRevisions(true);
		} else if (btnCmdid == 3 || btnCmdid == 41150) {
			this.setShowRevisions(false);
		} else if (btnCmdid == 4 || btnCmdid == 41200) {
			this.getRevisions();
		} else if (btnCmdid == 5 || btnCmdid == 41250) {
			this.acceptAllRevisions();
		} else if (btnCmdid == 6 || btnCmdid == 41300) {
			this.officePrint(false);
		} else if (btnCmdid == 7 || btnCmdid == 41350) {
			this.saveOfficeToPdfToUrl();
		}
	}

	/**
	 * 往office文档控件注册事件公用方法
	 */
	this.addOfficeExEvent = function(o, sEnentName, sEventDeal) {
		if (null == o)
			return;
		var oScript = document.createElement("script");
		oScript.language = "javascript";
		oScript.event = sEnentName;
		oScript.htmlFor = config.id;
		oScript.text = sEventDeal;
		document.body.appendChild(oScript);
	}

	this.regOnDocumentClosedEvent = function() {
		var sEventName = "OnDocumentClosed()";
		var sEventDeal = config.id + "_OfficeControl.onDocumentOpened();";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	this.regOnDocumentOpenedEvent = function() {
		var sEventName = "OnDocumentOpened(" + config.id + "_str," + config.id
				+ "_obj)";
		var sEventDeal = config.id + '_OfficeControl.onDocumentOpened('
				+ config.id + '_str,' + config.id + '_obj)';
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	this.regAfterOpenFromURLEvent = function() {
		var sEventName = "AfterOpenFromURL(doc)";
		var sEventDeal = config.id + "_OfficeControl.afterOpenFromURL(doc);";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	this.regAfterPublishAsPDFToURLEvent = function() {
		var sEventName = "AfterPublishAsPDFToURL(ret, code)";
		var sEventDeal = config.id
				+ "_OfficeControl.afterPublishAsPDFToURL(ret, code);";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	this.onCustomMenuCmdEvent = function() {
		var sEventName = "OnCustomMenuCmd2(menuPos,submenuPos,subsubmenuPos,menuCaption,menuID)";
		var sEventDeal = config.id
				+ "_OfficeControl.onCustomMenuCmd(menuPos,submenuPos,subsubmenuPos,menuCaption,menuID);";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	this.onCustomButtonOnMenuCmdEvent = function() {
		var sEventName = "OnCustomButtonOnMenuCmd(btnPos,btnCaption,btnCmdid)";
		var sEventDeal = config.id
				+ "_OfficeControl.onCustomButtonOnMenuCmd(btnPos,btnCaption,btnCmdid);";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	/**
	 * 控件样式调整
	 */
	this.resizeOffice = function() {
		// 当office控件的高度较大时，由于控件的层级高，会挡住下面的元素；为下面的元素增加iframe以提高层级
		var $footIframe = $('<iframe frameborder="0" class="foot-iframe" style="display:block;"/>');
		if (_officeEx) {
			$footIframe.insertAfter($(".edit-workflow"));
			var h = $(window).height();
			var conHeight = h - $(".edit-head").height()
					- $(".edit-workflow").height();
			var hpanesHeight = $('.edit-panes-s').height();
			_officeEx.height = ($.browser.msie6) ? (conHeight - hpanesHeight - 80)
					: (conHeight - hpanesHeight - 60) + 'px';
		}
	}

	/**
	 * 动态是设置高度
	 */
	this.setHeight = function(height) {
		_officeEx.height = height + 'px';
	}

	/**
	 * 获取高度
	 */
	this.getHeight = function() {
		return _officeEx.height;
	}

	/**
	 * 使当前编辑区全屏显示
	 */
	this.setFullSize = function() {
		_officeEx.FullScreenMode = true;
	}

	/**
	 * 从全屏状态返回原窗口状态
	 */
	this.setSmallSize = function() {
		_officeEx.FullScreenMode = false;
	}

	/**
	 * 关闭页面
	 * 
	 * @param linkId
	 */
	this.onPageClose = function(linkId) {
		if (!_officeEx.activeDocument.Saved) {
			if (confirm("${getJsText('js.cui.office.updateDoc')}")) {
				this.saveFileToUrl(linkId);
			}
		}
		window.opener.location.reload();
	}

	/**
	 * 打开文档
	 * 
	 * @param fileUrl
	 */
	this.openFileFromURL = function(fileUrl) {
		_officeEx.BeginOpenFromURL(fileUrl, false);
	}

	/**
	 * 设置文件是否打开
	 * 
	 * @param bool
	 */
	this.setFileOpenedOrClosed = function(bool) {
		IsFileOpened = bool;
	}

	/**
	 * 整合BAP的保存方式，一并提交
	 */
	this.saveFileToUrlNew = function(submitUrl, formId, params) {
		var result;
		try {
			var fileName = config.id + ".doc";
			if (fileTypeSimple == "word" || fileTypeSimple == "wps") {
				fileName = config.id + ".doc";
			}
			if (fileTypeSimple == "excel" || fileTypeSimple == "et") {
				fileName = config.id + ".xls";
			}
			if (fileTypeSimple == "ppt") {
				fileName = config.id + ".ppt";
			}
			if (fileTypeSimple == "pdf") {
				fileName = config.id + ".pdf";
			}
			if (IsFileOpened) {
				var type = (config.saveTemplate) ? "bapTemplate" : "bapOffice";
				result = _officeEx.saveToURL(submitUrl + "?" + params,// 提交到的url地址
				config.id + "Files", config.id + "Files.type=" + type + "__" + config.fileuploadType + "&" + config.id + "Files.propertyCode=" + config.propertyCode + "&" + config.id + "Files.fileType=office&" + config.id + "Files.showType=doc", fileName, formId, false);
			}
		} catch (error) {
		}
		return result;
	}

	/**
	 * 保存文件 统一使用上传附件的方式进行提交
	 * 
	 * @since 2.7 saveToURL
	 */
	this.saveOfficeDocToUrl = function(submitUrl, params) {
		var saveDoc = false;
		var fileName = config.id + ".doc";
		if (fileTypeSimple == "word" || fileTypeSimple == "wps") {
			fileName = config.id + ".doc";
		}
		if (fileTypeSimple == "excel" || fileTypeSimple == "et") {
			fileName = config.id + ".xls";
		}
		if (fileTypeSimple == "ppt") {
			fileName = config.id + ".ppt";
		}
		if (fileTypeSimple == "pdf") {
			fileName = config.id + ".pdf";
		}
		if (IsFileOpened) {
			try {
				var result = _officeEx.saveToURL(submitUrl, "files", null, fileName, null, false);
				if (result) {
					saveDoc = true;
					var type = (config.saveTemplate) ? "bapTemplate" : "bapOffice";
					var showType = "doc";
					if (config.openType == 'pdf' && config.saveType == 'pdf') {
						showType = "pdf";
					}
					OFFICE_CONTROL_OBJ.append('<input type="hidden" name="' + config.id + 'Files.filePath" value="' + result + '"/>');
					OFFICE_CONTROL_OBJ.append('<input type="hidden" name="' + config.id + 'Files.fileType" value="office"/>');
					OFFICE_CONTROL_OBJ.append('<input type="hidden" name="' + config.id + 'Files.showType" value="' + showType + '"/>');
					OFFICE_CONTROL_OBJ.append('<input type="hidden" name="' + config.id + 'Files.type" value="' + type + '__' + config.fileuploadType + '"/>');
					OFFICE_CONTROL_OBJ.append('<input type="hidden" name="' + config.id + 'Files.propertyCode" value="' + config.propertyCode + '" />');
				}
			} catch (e) {
			}
		}
		return saveDoc;
	}

	/**
	 * 保存文件为PDF格式 统一使用上传附件的方式进行提交
	 * 
	 * @since 2.7 PublishAsPDFToURL
	 */
	this.saveOfficeToPdfToUrl = function() {
		var fileName = config.id + ".pdf";
		if (IsFileOpened) {
			try {
				_officeEx.PublishAsPDFToURL( CUI_CONFIG_URL.uploadFile, "files", null, fileName, null, null, false, false);
			} catch (e) {
			}
		}
	}

	/**
	 * 保存文件为HMTL格式 //FIXME 方法需要改动
	 */
	this.saveFileAsHtmlToUrl = function() {
		var myUrl = CUI_CONFIG_URL.officeUpload;
		var htmlFileName = document.getElementById("fileName").value + ".html";
		var result;
		if (IsFileOpened) {
			result = _officeEx.PublishAsHTMLToURL(myUrl, "uploadHtml", "htmlFileName=" + htmlFileName, htmlFileName);
			result = result.replace(/(^\s*)|(\s*$)/g, "");
			document.getElementById("statusBar").innerHTML = "the result:" + result;
			window.close();
		}
	}

	/**
	 * 添加服务器印章
	 * 
	 * @param signUrl
	 */
	this.addServerSign = function(signUrl) {
		if (IsFileOpened) {
			this.activateOfficeEx();
			var readOnlyFlag = this.docIsReadOnly();
			if (readOnlyFlag) {
				this.setReadOnly(false);
			}
			try {
				this.goToBookMarkForDoc(config.signMark);
				_officeEx.AddSignFromURL(config.currentUserName,// 印章的用户名
				signUrl,// 印章所在服务器相对url
				5,// 左边距
				5,// 上边距 根据Relative的设定选择不同参照对象
				config.id,// 调用DoCheckSign函数签名印章信息,用来验证印章的字符串
				1, // Relative,取值1-4。设置左边距和上边距相对以下对象所在的位置 1：光标位置；2：页边距；3：页面距离
				// 4：默认设置栏，段落
				100,// 缩放印章,默认100%
				1); // 0印章位于文字下方,1位于上方
			} catch (error) {
			}
			if (readOnlyFlag && config.signMark) {
				this.setReadOnly(true);
			}
		}
	}

	/**
	 * 添加服务器签名
	 * 
	 * @param signUrl
	 */
	this.addServerHandSign = function(signUrl) {
		if (IsFileOpened) {
			this.activateOfficeEx();
			var readOnlyFlag = this.docIsReadOnly();
			if (readOnlyFlag) {
				this.setReadOnly(false);
			}
			try {
				this.goToBookMarkForDoc(config.handSignMark);
				_officeEx.AddSignFromURL(config.currentUserName,// 印章的用户名
				signUrl,// 印章所在服务器相对url
				5,// 左边距
				5,// 上边距 根据Relative的设定选择不同参照对象
				config.id,// 调用DoCheckSign函数签名印章信息,用来验证印章的字符串
				1, // Relative,取值1-4。设置左边距和上边距相对以下对象所在的位置 1：光标位置；2：页边距；3：页面距离
				// 4：默认设置栏，段落
				100,// 缩放印章,默认100%
				1); // 0印章位于文字下方,1位于上方
			} catch (error) {
			}
			if (readOnlyFlag && config.handSignMark) {
				this.setReadOnly(true);
			}
		}
	}

	/**
	 * 添加本地印章
	 */
	this.addLocalSign = function() {
		if (IsFileOpened) {
			var readOnlyFlag = this.docIsReadOnly();
			if (readOnlyFlag) {
				this.setReadOnly(false);
			}
			try {
				this.goToBookMarkForDoc(config.signMark);
				_officeEx.AddSignFromLocal(config.currentUserName,// 印章的用户名
				"",// 缺省文件名
				true,// 是否提示选择
				5,// 左边距
				5,// 上边距 根据Relative的设定选择不同参照对象
				config.id,// 调用DoCheckSign函数签名印章信息,用来验证印章的字符串
				1, // Relative,取值1-4。设置左边距和上边距相对以下对象所在的位置
				// 1：光标位置；2：页边距；3：页面距离；4：默认设置栏，段落
				100,// 缩放印章,默认100%
				1); // 0印章位于文字下方,1位于上方
			} catch (error) {
			}
			if (readOnlyFlag && config.signMark) {
				this.setReadOnly(true);
			}
		}
	}

	/**
	 * 添加本地签名
	 */
	this.addLocalHandSign = function() {
		if (IsFileOpened) {
			var readOnlyFlag = this.docIsReadOnly();
			if (readOnlyFlag) {
				this.setReadOnly(false);
			}
			try {
				this.goToBookMarkForDoc(config.handSignMark);
				_officeEx.AddSignFromLocal(config.currentUserName,// 印章的用户名
				"",// 缺省文件名
				true,// 是否提示选择
				5,// 左边距
				5,// 上边距 根据Relative的设定选择不同参照对象
				config.id,// 调用DoCheckSign函数签名印章信息,用来验证印章的字符串
				1, // Relative,取值1-4。设置左边距和上边距相对以下对象所在的位置
				// 1：光标位置；2：页边距；3：页面距离；4：默认设置栏，段落
				100,// 缩放印章,默认100%
				1); // 0印章位于文字下方,1位于上方
			} catch (error) {
			}
			if (readOnlyFlag && config.handSignMark) {
				this.setReadOnly(true);
			}
		}
	}

	/**
	 * 添加网络图片
	 * 
	 * @param picURL
	 */
	this.addPicFromUrl = function(picURL) {
		if (IsFileOpened) {
			var readOnlyFlag = this.docIsReadOnly();
			if (readOnlyFlag) {
				this.setReadOnly(false);
			}
			if (_officeEx.doctype == 1 || _officeEx.doctype == 2) {
				try {
					this.goToBookMarkForDoc(config.handSignMark);
					_officeEx.AddPicFromURL(picURL,// 图片的url地址可以时相对或者绝对地址
					false,// 是否浮动,此参数设置为false时,top和left无效
					5,// left 左边距
					5,// top 上边距 根据Relative的设定选择不同参照对象
					1, // Relative,取值1-4。设置左边距和上边距相对以下对象所在的位置
					// 1：光标位置；2：页边距；3：页面距离
					// 4：默认设置栏，段落
					100,// 缩放印章,默认100%
					1); // 0印章位于文字下方,1位于上方

				} catch (error) {
				}
			} else {
				alert("${getJsText('js.cui.office.notSign')}");
			}
			if (readOnlyFlag && config.handSignMark) {
				this.setReadOnly(true);
			}
		}
	}

	/**
	 * 添加本地图片
	 */
	this.addPicFromLocal = function() {
		if (IsFileOpened) {
			var readOnlyFlag = this.docIsReadOnly();
			if (readOnlyFlag) {
				this.setReadOnly(false);
			}
			try {
				this.goToBookMarkForDoc(config.handSignMark);
				_officeEx.AddPicFromLocal("",// 缺省文件名
				true,// 是否提示选择
				false,// 是否浮动,此参数设置为false时,top和left无效
				5,// 左边距
				5,// 上边距 根据Relative的设定选择不同参照对象
				1, // Relative,取值1-4。设置左边距和上边距相对以下对象所在的位置 1：光标位置；2：页边距；3：页面距离
				// 4：默认设置栏，段落
				100,// 缩放印章,默认100%
				1); // 0印章位于文字下方,1位于上方
			} catch (error) {
			}
			if (readOnlyFlag && config.handSignMark) {
				this.setReadOnly(true);
			}
		}
	}

	/**
	 * 根据Id打开模板
	 * 
	 * @param id
	 */
	this.openTemplateFileFromUrl = function(id, type, propertyCode, entityCode) {
		if (id != null && id != undefined && id != "") {
			var fileEntityCode = (entityCode == null) ? config.entityCode
					: entityCode;
			_officeEx.BeginOpenFromURL( CUI_CONFIG_URL.officeDownload + "?linkId=" + id + "&type=bapTemplate__" + type + "&propertyCode=" + propertyCode + "&entityCode=" + fileEntityCode, false);
		}
	}

	/**
	 * 普通手写签名
	 */
	this.doHandSign = function() {
		if (IsFileOpened) {
			var readOnlyFlag = this.docIsReadOnly();
			if (readOnlyFlag) {
				this.setReadOnly(false);
			}
			_officeEx.DoHandSign2(config.currentUserName, config.id, 0, 0, 1,
					100);
		}
	}

	/**
	 * 验证文档控件自带印章功能盖的章 1.IsSilent缺省为FAlSE，表示弹出验证对话框,否则，只是返回验证结果到返回值;
	 * 2.使用盖章时的signkey,这里为"ntko";返回值，验证结果字符串
	 */
	this.doCheckSign = function() {
		if (IsFileOpened) {
			var ret = _officeEx.DoCheckSign(false, config.id);
		}
	}

	/**
	 * 设置是否保留痕迹
	 * 
	 * @param boolvalue
	 */
	this.setReviewMode = function(boolvalue) {
		if (_officeEx.doctype == 1) {
			try {
				_officeEx.ActiveDocument.TrackRevisions = boolvalue;
			} catch (error) {
			}
		}
	}

	/**
	 * 设置是否显示痕迹
	 * 
	 * @param boolevalue
	 */
	this.setShowRevisions = function(boolevalue) {
		if (_officeEx.doctype == 1) {
			_officeEx.ActiveDocument.ShowRevisions = boolevalue;
		}
	}

	/**
	 * 获取痕迹
	 */
	this.getRevisions = function() {
		var rev = _officeEx.ActiveDocument.Revisions; // 获取痕迹对象
		var text = "";
		for (i = 1; i <= rev.Count; i++) {
			text = text + "“" + rev.Item(i).Author + "”";
			if (rev.Item(i).Type == "1") {
				text = text + '进行插入：' + rev.Item(i).Range.Text + "\r\n";
			} else if (rev.Item(i).Type == "2") {
				text = text + '进行删除：' + rev.Item(i).Range.Text + "\r\n";
			} else {
				text = text + '进行其他操作，操作内容：“' + rev.Item(i).Range.Text
						+ '”；操作：“' + rev.Item(i).FormatDescription + "”。\r\n";
			}
		}
		if (text != "") {
			alert(text);
		}
		return text;
	}

	/**
	 * 设置接受所有痕迹
	 * 
	 * @param boolevalue
	 */
	this.acceptAllRevisions = function() {
		if (_officeEx.doctype == 1) {
			_officeEx.ActiveDocument.AcceptAllRevisions();
		}
	}

	/**
	 * 从书签取值到表单域
	 * 
	 * @param inputName
	 * @param bookMarkName
	 */
	this.readDocToForm = function(inputName, bookMarkName) {
		this.activateOfficeEx();
		var readOnlyFlag = this.docIsReadOnly();
		if (readOnlyFlag) {
			this.setReadOnly(false);
		}
		var inputObj = $('#' + inputName);
		if (inputObj.length == 0) {
			inputObj = $('*[name="' + inputName + '"]');
		}
		if (inputObj.length > 0) {
			if (bookMarkName) {
				var bkmkObj = _officeEx.ActiveDocument.BookMarks(bookMarkName);
				if (bkmkObj) {
					inputObj.val(bkmkObj.Range.Text);
				}
			} else {
				inputObj.val(_officeEx.ActiveDocument.Content.Text);
			}
		}
		if (readOnlyFlag) {
			this.setReadOnly(true);
		}
	}

	/**
	 * 从表单域取值到书签
	 * 
	 * @param inputName
	 * @param bookMarkName
	 */
	this.readFormToDoc = function(inputName, bookMarkName) {
		this.activateOfficeEx();
		var readOnlyFlag = this.docIsReadOnly();
		if (readOnlyFlag) {
			this.setReadOnly(false);
		}
		var inputObj = $('#' + inputName);
		if (inputObj.length == 0) {
			inputObj = $('*[name="' + inputName + '"]');
		}
		if (inputObj.length > 0) {
			var inputValue = inputObj.val();
			if (bookMarkName && inputValue) {
				var bkmkObj = _officeEx.ActiveDocument.BookMarks(bookMarkName);
				if (bkmkObj) {
					var saveRange = bkmkObj.Range;
					saveRange.Text = inputValue;
					_officeEx.ActiveDocument.Bookmarks.Add(bookMarkName,
							saveRange);
				}
			}
		}
		if (readOnlyFlag) {
			this.setReadOnly(true);
		}
	}

	/**
	 * 直接赋值到书签
	 * 
	 * @param inputName
	 * @param bookMarkName
	 */
	this.readValueToDoc = function(bookMarkName, value) {
		this.activateOfficeEx();
		var readOnlyFlag = this.docIsReadOnly();
		if (readOnlyFlag) {
			this.setReadOnly(false);
		}
		if (value && value.length > 0) {
			if (bookMarkName) {
				var bkmkObj = _officeEx.ActiveDocument.BookMarks(bookMarkName);
				if (bkmkObj) {
					var saveRange = bkmkObj.Range;
					saveRange.Text = value;
					_officeEx.ActiveDocument.Bookmarks.Add(bookMarkName,
							saveRange);
				}
			}
		}
		if (readOnlyFlag) {
			this.setReadOnly(true);
		}
	}

	/**
	 * 设置只有某个书签范围可编辑 //FIXME office支持，wps需要2012版
	 * 
	 * @param bookMarkName
	 */
	this.setBookMarkEditOnly = function(bookMarkName) {
		this.activateOfficeEx();
		var readOnlyFlag = this.docIsReadOnly();
		if (readOnlyFlag) {
			var ntkodoc = _officeEx.ActiveDocument;
			var B = ntkodoc.application;
			ntkodoc.Bookmarks(bookMarkName).Select();
			B.selection.editors.add(-1);// 书签范围可编辑
			ntkodoc.protect(3, 0, "1");
		}
	}

	/**
	 * 定位书签
	 * 
	 * @param bookMarkName
	 */
	this.goToBookMarkForDoc = function(bookMarkName) {
		if (bookMarkName) {
			this.activateOfficeEx();
			var ntkodoc = _officeEx.ActiveDocument;
			ntkodoc.application.selection.Goto(-1, 0, 0, bookMarkName);
		}
	}

	/**
	 * 在某个选中的范围插入书签
	 * 
	 * @param bookMarkName
	 */
	this.addBookMarkForDoc = function(bookMarkName) {
		if (bookMarkName) {
			this.activateOfficeEx();
			var ntkodoc = _officeEx.ActiveDocument;
			var range = ntkodoc.range(
					ntkodoc.Application.Selection.range.Start,
					ntkodoc.Application.Selection.range.End);
			ntkodoc.Bookmarks.Add("bookMarkName",
					ntkodoc.Application.Selection.range); // 在某个范围插入书签
		}
	}

	/**
	 * 查看文档是否被保护（只读）
	 */
	this.docIsReadOnly = function() {
		return _officeEx.ActiveDocument.protectionType != -1;
	}

	/**
	 * 设置文档只读
	 */
	this.setReadOnly = function(boolvalue, password) {
		_officeEx.SetReadOnly(boolvalue, (password == undefined ? "" : password));
	}

	/**
	 * 是否允许打印
	 * 
	 * @param boolvalue
	 */
	this.setFilePrint = function(boolvalue) {
		_officeEx.FilePrint = boolvalue;
	}

	/**
	 * 是否允许打印预览
	 * 
	 * @param boolvalue
	 */
	this.setFilePrintPreview = function(boolvalue) {
		_officeEx.FilePrintPreview = boolvalue;
	}

	/**
	 * 是否允许打印设置
	 * 
	 * @param boolvalue
	 */
	this.setFilePageSetup = function(boolvalue) {
		_officeEx.FilePageSetup = boolvalue;
	}

	/**
	 * 打印
	 */
	this.officePrint = function(isBackground) {
		var permitFlag = true;
		if(eval("typeof(" + config.id + "_officePrintPermit) != 'undefined'")) {
			permitFlag = eval(config.id + "_officePrintPermit()");
		}
		if(!permitFlag) {
			alert('${getJsText("js.cui.office.printNoPermit")}');
			return false;
		} 
		try {
			var objOptions = _officeEx.ActiveDocument.Application.Options;
			var oldOption = objOptions.PrintBackground;
			objOptions.PrintBackground = isBackground;
			_officeEx.PrintOut(!isBackground);
			objOptions.PrintBackground = oldOption;
		} catch (err) {
		} 
	}

	/**
	 * 是否编辑过
	 */
	this.getIsEdit = function() {
		if (_officeEx && _officeEx.ActiveDocument) {
			return !(_officeEx.ActiveDocument.Saved);
		}
		return false;
	}

	/**
	 * 文档是否为空（包括空格输入）
	 */
	this.getIsEmpty = function() {
		_officeEx.ActiveDocument.application.selection.homekey(6);
		var start = _officeEx.ActiveDocument.application.selection.start;
		_officeEx.ActiveDocument.application.selection.endKey(6);
		var end = _officeEx.ActiveDocument.application.selection.end;
		if (start == end) {
			alert("doc is null");
		} else {
			alert("doc is not null");
		}
	}

	/**
	 * 获取文档正文
	 */
	this.getWordContent = function() {
		try {
			return _officeEx.ActiveDocument.Content.Text;
		} catch (e) {
		}
	}

	/**
	 * 是否属性
	 * 
	 * @param boolvalue
	 */
	this.setFileProperties = function(boolvalue) {
		_officeEx.FileProperties = boolvalue;
	}

	/**
	 * 设置是否打开
	 */
	this.setFileOpened = function(boolvalue) {
		_officeEx.FileOpen = boolvalue;
	}

	/**
	 * 设置是否关闭
	 */
	this.setFileClose = function(boolvalue) {
		_officeEx.FileClose = boolvalue;
	}

	/**
	 * 是否允许新建
	 * 
	 * @param boolvalue
	 */
	this.setFileNew = function(boolvalue) {
		_officeEx.FileNew = boolvalue;
	}

	/**
	 * 是否允许另存为
	 * 
	 * @param boolvalue
	 */
	this.setFileSaveAs = function(boolvalue) {
		_officeEx.FileSaveAs = boolvalue;
	}

	/**
	 * 是否允许保存
	 * 
	 * @param boolvalue
	 */
	this.setFileSave = function(boolvalue) {
		_officeEx.FileSave = boolvalue;
	}

	/**
	 * 是否禁止粘贴
	 * 
	 * @param boolvalue
	 */
	this.setIsNoCopy = function(boolvalue) {
		_officeEx.IsNoCopy = boolvalue;
	}

	/**
	 * 严禁粘贴
	 */
	this.setIsStrictNoCopy = function(boolvalue) {
		_officeEx.IsStrictNoCopy = boolvalue;
	}

	/**
	 * 设置工具栏
	 */
	this.setToolBar = function(boolvalue) {
		_officeEx.ToolBars = boolvalue;
	}

	/**
	 * 控制是否显示所有菜单
	 */
	this.setMenubar = function(boolvalue) {
		_officeEx.Menubar = boolvalue;
	}

	/**
	 * 控制”插入“菜单栏
	 */
	this.setInsertMemu = function(boolvalue) {
		_officeEx.IsShowInsertMenu = boolvalue;
	}

	/**
	 * 控制”编辑“菜单栏
	 */
	this.setEditMenu = function(boolvalue) {
		_officeEx.IsShowEditMenu = boolvalue;
	}

	/**
	 * 控制”工具“菜单栏
	 */
	this.setToolMenu = function(boolvalue) {
		_officeEx.IsShowToolMenu = boolvalue;
	}

	/**
	 * 控制”帮助“菜单栏
	 */
	this.setHelpMenu = function(boolvalue) {
		_officeEx.IsShowHelpMenu = boolvalue;
	}

	/**
	 * 控制菜单栏
	 */
	this.setAllEditMenu = function(boolvalue) {
		this.setInsertMemu(boolvalue);
		this.setEditMenu(boolvalue);
		this.setToolMenu(boolvalue);
		this.setHelpMenu(boolvalue);
	}

	/**
	 * 增加父级菜单
	 */
	this.addMyMenu = function(menuPos, caption) {
		try {
			_officeEx.AddCustomMenu2(menuPos, caption);
		} catch (err) {
		} finally {
		}
	}

	/**
	 * 在自定义主菜单中增加菜单项目
	 */
	this.addMyMenuItems = function(menuPos, itemPos, caption, isSeparator) {
		try {
			_officeEx.AddCustomMenuItem2(menuPos, itemPos, -1, false, caption,
					isSeparator, itemPos);
		} catch (err) {
		} finally {
		}
	}

	/**
	 * 控制自定义菜单的使用和禁用
	 */
	this.enabledMenuItem = function(menuPos, pos, bool) {
		_officeEx.EnableCustomMenuItem2(menuPos, pos, -1, bool);
	}

	/**
	 * 删除菜单
	 */
	this.removeMyMenus = function(pos) {
		_officeEx.RemoveCustomMenu2(pos);
	}

	/**
	 * 添加菜单按钮
	 */
	this.addMyMenuButtons = function(pos, caption) {
		try {
			_officeEx.AddCustomButtonOnMenu(pos, caption, true, pos);
		} catch (err) {
		} finally {
		}
	}

	this.addPdfSupport = function() {
		try {
			_officeEx.AddDocTypePlugin(".pdf", "PDF.NtkoDocument",
					config.pdfVersion, config.cabPath + "ntkooledocall.cab",
					51, true);
		} catch (err) {
		} finally {
		}
	}

	/**
	 * 动态生成头文件
	 * 
	 * @param strHeader
	 */
	this.TANGER_OCX_AddDocHeader = function(strHeader) {
		if (!IsFileOpened) {
			return;
		}
		var i, cNum = 30;
		var lineStr = "";
		try {
			for (i = 0; i < cNum; i++)
				lineStr += "_"; // 生成下划线
			with (_officeEx.ActiveDocument.Application) {
				Selection.HomeKey(6, 0); // go home
				Selection.TypeText(strHeader);
				Selection.TypeParagraph(); // 换行
				Selection.TypeText(lineStr); // 插入下划线
				// Selection.InsertSymbol(95,"",true); //插入下划线
				Selection.TypeText("★");
				Selection.TypeText(lineStr); // 插入下划线
				Selection.TypeParagraph();
				// Selection.MoveUp(5, 2, 1); //上移两行，且按住Shift键，相当于选择两行
				Selection.HomeKey(6, 1); // 选择到文件头部所有文本
				Selection.ParagraphFormat.Alignment = 1; // 居中对齐
				with (Selection.Font) {
					NameFarEast = "宋体";
					Name = "宋体";
					Size = 12;
					Bold = false;
					Italic = false;
					Underline = 0;
					UnderlineColor = 0;
					StrikeThrough = false;
					DoubleStrikeThrough = false;
					Outline = false;
					Emboss = false;
					Shadow = false;
					Hidden = false;
					SmallCaps = false;
					AllCaps = false;
					Color = 255;
					Engrave = false;
					Superscript = false;
					Subscript = false;
					Spacing = 0;
					Scaling = 100;
					Position = 0;
					Kerning = 0;
					Animation = 0;
					DisableCharacterSpaceGrid = false;
					EmphasisMark = 0;
				}
				Selection.MoveDown(5, 3, 0); // 下移3行
			}
		} catch (err) {
			alert(err.number + ":" + err.description);
		} finally {
		}
	}

	/**
	 * 插入红头文件
	 * 
	 * @param headFileURL
	 */
	this.insertRedHeadFromUrl = function(headFileURL) {
		// _officeEx.doctype=1为word文档
		if (_officeEx.doctype != 1) {
			return;
		}
		_officeEx.ActiveDocument.Application.Selection.HomeKey(6, 0);// 光标移动到文档开头
		_officeEx.addtemplatefromurl(headFileURL);// 在光标位置插入红头文档
	}

	/**
	 * 删除菜单按钮
	 */
	this.removeMyMenuButtons = function(pos) {
		_officeEx.RemoveCustomButtonOnMenu(pos);
	}

	/**
	 * 从服务器盖章 //FIXME 方法用于电子签章
	 */
	this.addServerSecSign = function() {
		var signUrl = document.getElementById("secSignFileUrl").options[document
				.getElementById("secSignFileUrl").selectedIndex].value;
		if (IsFileOpened) {
			if (_officeEx.doctype == 1 || _officeEx.doctype == 2) {
				try {
					_officeEx
							.AddSecSignFromURL(config.currentUserName, signUrl);
				} catch (error) {
				}
			}
		}
	}

	/**
	 * 从本地盖章 //FIXME 方法用于电子签章
	 */
	this.addLocalSecSign = function() {
		if (IsFileOpened) {
			try {
				_officeEx.AddSecSignFromLocal(config.currentUserName, "");
			} catch (error) {
			}
		}
	}

	/**
	 * 添加ekey盖章 //FIXME 方法用于电子签章
	 */
	this.addEkeySecSign = function() {
		if (IsFileOpened) {
			if (_officeEx.doctype == 1 || _officeEx.doctype == 2) {
				try {
					_officeEx.AddSecSignFromEkey(config.currentUserName);
				} catch (error) {
				}
			} else {
				alert("${getJsText('js.cui.office.notSign')}");
			}
		}
	}

	/**
	 * 手写认证签名 //FIXME 方法用于电子签名
	 */
	this.addHandSecSign = function() {
		if (IsFileOpened) {
			try {
				_officeEx.AddSecHandSign(config.currentUserName);
			} catch (error) {
			}
		}
	}
	/**
	 * 判断文档是否打开
	 */
	this.getFileOpenedStatus = function() {
		return IsFileOpened;
	}

	this.init();

}