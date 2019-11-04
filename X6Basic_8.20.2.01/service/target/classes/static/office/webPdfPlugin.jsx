/**
 * pdf plugin for GoldGrid
 * 
 * @author fangzhibin
 * @since version 2.7
 */
var WebPdfControl = CUI.WebPdfControl = function(config) {

	var Sys = {}; 
	var ua = navigator.userAgent.toLowerCase();
	var s;
	(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
	(s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
	(s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
	(s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
	(s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
	
	var PDF_CONTROL_OBJ, _pdfEx;
	var classid = '39E08D82-C8AC-4934-BE07-F6E816FD47A1';
	var cus_printFn;
	var cus_twoDimension;
	var copyright = config.productKey;

	if (typeof config.id == "string") {
		PDF_CONTROL_OBJ = $("#pdfControl_" + config.id);
	}
	if (typeof config.cus_printFn == "function") {
		cus_printFn = config.cus_printFn;
	}
	if (typeof config.cus_twoDimension == "function") {
		cus_twoDimension = config.cus_twoDimension;
	}
	var opened = false;

	this.init = function() {
		var pdfEx;
        var ieEnable = (!!window.ActiveXObject || "ActiveXObject" in window);
		if (ieEnable){
			pdfEx = $('<object id="pdf_'
					+ config.id
					+ '" classid="clsid:'
					+ classid
					+ '" '
					+ 'codebase="'+ config.cabPath +'iWebPDF.cab#version='+ config.cabVersion +'" width="'
					+ config.width
					+ '" height="'
					+ config.height
					+ '"> '
					+ '<SPAN STYLE="color:red">不能装载PDF控件。请检查浏览器的安全设置。</SPAN>'
					+ '</object>');
		} else if (Sys.chrome || Sys.firefox || Sys.safari) {
			pdfEx = $('<object id="pdf_'
					+ config.id
					+ '" clsid="{'
					+ classid
					+ '}" '
					+ 'type="application/kg-activex" align="baseline" border="0" '
					+ 'width="'
					+ config.width
					+ '" height="'
					+ config.height
					+ '" copyright="'
					+ copyright
					+ '" '
					+ 'event_OnMenuClick="'
					+ config.id + '_WPC_onMenuClick" '
					+ 'event_OnToolsClick="'
					+ config.id + '_WPC_onToolsClick" '
					+ 'event_OnOpen="'
					+ config.id + '_WPC_onOpen" '
					+ 'event_OnClose="'
					+ config.id + '_WPC_onClose" '
					+ '>'
					+ '</object>');
		} else {
			alert("不能装载PDF控件。请检查浏览器的安全设置。");
		}
		_pdfEx = pdfEx[0];
		PDF_CONTROL_OBJ.append(_pdfEx);
		this.onCustomMenuCmdEvent();
		this.onCustomButtonOnMenuCmdEvent();
	}

	this.getSignatureObject = function() {
		return _pdfEx;
	}

	this.getOfficeVar = function() {
		if (eval(config.id + "_WebOfficeControl")) {
			return eval(config.id + "_WebOfficeControl");
		} else {
			this.webPdfAlert("this is no office plugin");
		}
	}

	this.getSignVar = function() {
		if (eval(config.id + "_WebSignControl")) {
			return eval(config.id + "_WebSignControl");
		} else {
			this.webPdfAlert("this is no signature plugin");
		}
	}

	/**
	 * 往pdf文档控件注册事件公用方法
	 */
	this.addPdfExEvent = function(o, sEnentName, sEventDeal) {
		if (null == o)
			return;
		var oScript = document.createElement("script");
		oScript.language = "javascript";
		oScript.event = sEnentName;
		oScript.htmlFor = "pdf_" + config.id;
		oScript.text = sEventDeal;
		document.body.appendChild(oScript);
	}

	/**
	 * 打开响应事件注册
	 */
	this.onOpenCmdEvent = function() {
		var sEventName = "OnOpen()";
		var sEventDeal = config.id + "_WebPdfControl.onOpen();";
		this.addPdfExEvent(_pdfEx, sEventName, sEventDeal);
	}

	/**
	 * 关闭响应事件注册
	 */
	this.onCloseCmdEvent = function() {
		var sEventName = "OnClose()";
		var sEventDeal = config.id + "_WebPdfControl.onClose();";
		this.addPdfExEvent(_pdfEx, sEventName, sEventDeal);
	}
	
	/**
	 * 自定义菜单响应事件注册
	 */
	this.onCustomMenuCmdEvent = function() {
		var sEventName = "OnMenuClick(vIndex,vCaption)";
		var sEventDeal = config.id
				+ "_WebPdfControl.onMenuClick(vIndex,vCaption);";
		this.addPdfExEvent(_pdfEx, sEventName, sEventDeal);
	}

	/**
	 * 自定义按钮响应事件注册
	 */
	this.onCustomButtonOnMenuCmdEvent = function() {
		var sEventName = "OnToolsClick(vIndex,vCaption)";
		var sEventDeal = config.id
				+ "_WebPdfControl.onToolsClick(vIndex,vCaption);";
		this.addPdfExEvent(_pdfEx, sEventName, sEventDeal);
	}

	/**
	 * 自定义菜单响应事件
	 */
	this.onMenuClick = function(vIndex, vCaption) {
	}

	/**
	 * 自定义按钮响应事件
	 */
	this.onToolsClick = function(vIndex, vCaption) {
		if (vIndex == 10) {
			this.setSmallSize();
		} else if(vIndex == 11){
			var allowPrint;
			if(cus_twoDimension != null && cus_twoDimension != undefined){
				allowPrint = cus_twoDimension.call(this);
			}
			if(allowPrint){
				this.webPrint();
			}
		} else if(vIndex == 12){
			this.webSaveLocal();
		}
	}

	/**
	 * 打开响应事件
	 */
	this.onOpen = function() {
	}

	/**
	 * 关闭响应事件
	 */
	this.OnClose = function() {
	}
	
	/**
	 * 添加自定义菜单
	 */
	this.addMyMenuItems = function(index, caption) {
		try {
			_pdfEx.AppendMenu(index, caption);
		} catch (err) {
		} finally {
		}
	}

	/**
	 * 添加自定义按钮
	 */
	this.addMyMenuButtons = function(index, caption, icon) {
		try {
			_pdfEx.AppendTools(index, caption, icon);
		} catch (err) {
		} finally {
		}
	}
	
	/**
	 * 弹出提示对话框
	 */
	this.webPdfAlert = function(message) {
		if(message) {
			alert(message);
		}
			
	}

	/**
	 * 载入iWebPDF
	 */
	this.loadPdf = function(url, linkId) {
		try {
			// 以下属性必须设置，实始化iWebPDF
			_pdfEx.WebUrl = url;
			_pdfEx.RecordID = (linkId != "") ? linkId : "-1"; // 文档记录号
			_pdfEx.FileName = (config.fileName) ? config.fileName
					: "officePdf";
			_pdfEx.UserName = config.currentStaffName;
			_pdfEx.FileType = ".pdf";
			_pdfEx.MaxFileSize = config.maxFileSize * 1024;
			_pdfEx.ShowTools = 1; // 工具栏可见（1,可见；0,不可见）
			_pdfEx.SaveRight = 1; // 是否允许保存当前文档（1,允许；0,不允许）
			_pdfEx.PrintRight = 1; // 是否允许打印当前文档（1,允许；0,不允许）
			_pdfEx.AlterUser = false; // 是否允许由控件弹出提示框 true表示允许false表示不允许
			_pdfEx.ShowBookMark = 1; // 是否显示书签树按钮（1,显示；0,不显示）
			_pdfEx.ShowSigns = 1; // 设置签章工具栏当前是否可见（1,可见；0,不可见）
			// alert(_pdfEx.SideWidth); //显示侧边栏的宽度
			_pdfEx.SideWidth = 100; // 设置侧边栏的宽度
			//this.addMyMenuButtons("10", "退出", 10);
			_pdfEx.ShowSchedule = false;

          	_pdfEx.TextCommentRight=2;
          	_pdfEx.UserID = config.currentUserName + config.activityName;
          	_pdfEx.AllowMoveAnnot=false;
          	_pdfEx.ImageAnnotDelRight=2;
			var type = "bapOffice__" + config.fileType;
			_pdfEx.WebSetMsgByName("type", type);
			_pdfEx.WebSetMsgByName("propertyCode", config.propertyCode);
			_pdfEx.WebSetMsgByName("entityCode", config.entityCode);
			_pdfEx.WebSetMsgByName("showType", config.openType);
			_pdfEx.WebOpen(); // 打开该文档
			_pdfEx.Zoom = 100; // 缩放比例
			_pdfEx.Rotate = 360; // 当显示页释放角度
			_pdfEx.CurPage = 1; // 当前显示的页码
			this.webEnableTools('打开文档;保存文档;打印文档;另存为;关闭文档;文档属性;文本选择;快照工具',0);
			if(config.officePrint) {
				this.addMyMenuButtons("11", "打印PDF", 11);
			} 
			if(config.downloadDoc) {
				this.addMyMenuButtons("12", "下载PDF", 12);
			}
			if(_pdfEx.WebGetMsgByName("pdfOpened") == 'opened') {
				this.setOpenStatus(true);
				if(eval("typeof(" + config.id + "_changeContentMain) != 'undefined'")) {
					eval(config.id + "_changeContentMain()");
				}
				if(eval("typeof(" + config.id + "_viewPageShowPdf) != 'undefined'")) {
					eval(config.id + "_viewPageShowPdf()");
				}
			}
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status); 
		}
	}

	/**
	 * 退出iWebPDF
	 */
	this.unLoad = function() {
		try {
			_pdfEx.WebClose();
			setOpenStatus(false);
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status); 
		}
	}

	/**
	 * 打开文档
	 */
	this.loadDocument = function() {
		_pdfEx.WebOpen();
	}

	/**
	 * 保存文档
	 */
	this.saveDocument = function() {
		if (!_pdfEx.WebSave()) {
			this.webPdfAlert(_pdfEx.Status);
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 取得服务器返回字段域信息的值
	 */
	this.webGetMsgByName = function(fieldName) {
		var value = _pdfEx.WebGetMsgByName(fieldName);
		return value;
	}

	/**
	 * 设置相应字段域值，等待发送给服务器
	 */
	this.webSetMsgByName = function(fieldName, fieldValue) {
		var value = _pdfEx.WebSetMsgByName(fieldName, fieldValue);
		return value;
	}

	/**
	 * 清除由WebSetMsgByName设置的值
	 */
	this.webClearMessage = function() {
		_pdfEx.WebClearMessage();
	}
	
	/**
	 * 使当前编辑区全屏显示
	 */
	this.setFullSize = function() {
		_pdfEx.FullSize();
	}

	/**
	 * 从全屏状态返回原窗口状态
	 */
	this.setSmallSize = function() {
		_pdfEx.SmallSize();
	}

	/**
	 * 保存本地文档
	 */
	this.webSaveLocal = function() {
		var permitFlag = true;
		if(eval("typeof(" + config.id + "_downloadPdfPermit) != 'undefined'")) {
			permitFlag = eval(config.id + "_downloadPdfPermit()");
		}
		if(!permitFlag) {
			alert('您没有下载该文档的权限，请联系管理员！');
			return false;
		}
		try {
			_pdfEx.WebSaveLocal();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 
	 */
	this.webOpenLocal = function() {
		try {
			var flag = _pdfEx.WebOpenLocal();
			return flag;
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
			return false;
		}
	}

	/**
	 * 打印文档
	 */
	this.webPrint = function() {
		var permitFlag = true;
		if(eval("typeof(" + config.id + "_pdfPrintPermit) != 'undefined'")) {
			permitFlag = eval(config.id + "_pdfPrintPermit()");
		}
		if(!permitFlag) {
			alert('您没有打印该文档的权限，请联系管理员！');
			return false;
		} 
		try {
			// 不需要记录打印份数以前的代码
			//_pdfEx.WebPrint(0, "", 0, 0, true);
			var printNum = _pdfEx.WebPrintControl("", 1, 1,"", true);
			// 回调业务代码
			if(cus_printFn != null && cus_printFn != undefined){
				cus_printFn.call(this,printNum);
			}
			
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 翻至第一页
	 */
	this.webGotoFirstPage = function() {
		try {
			_pdfEx.GotoFirstPage();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 翻至最后一页
	 */
	this.webGotoLastPage = function() {
		try {
			_pdfEx.GotoLastPage();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 翻至前一页
	 */
	this.webGotoPreviousPage = function() {
		try {
			_pdfEx.GotoPreviousPage();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 翻至后一页
	 */
	this.webGotoNextPage = function() {
		try {
			_pdfEx.GotoNextPage();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 获取当前文档页数
	 */
	this.webPageCount = function() {
		try {
			var mCount = _pdfEx.PageCount;
			this.webPdfAlert("当前文档总页数为：" + mCount);
			return mCount;
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 当前显示模式（1 单页 2 双页 3 连续单页(默认) 4 连续双页）
	 */
	this.webDisplayMode = function(mValue) {
		try {
			_pdfEx.DisplayMode = mValue;
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 禁用,启用全部功能按钮(参数ToolsName:按钮的名称;mValue:true启用 false禁用)
	 */
	this.webEnableTools = function(ToolNames, mValue) {
		try {
			_pdfEx.EnableTools(ToolNames, mValue);
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 通过Url打开文档
	 */
	this.webOpenUrlFile = function(mUrl) {
		try {
			_pdfEx.WebOpenUrlFile(mUrl);
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 客户端和服务器端信息交互
	 */
	this.webSendInformation = function(info) {
		if (info == null) {
			return false;
		}
		_pdfEx.WebSetMsgByName("COMMAND", "SELFINFO"); // 设置变量COMMAND="SELFINFO"，用来在服务器端做判断，以进入处理自定义参数传递的代码。
		_pdfEx.WebSetMsgByName("TESTINFO", info); // 自定义的一个参数"TESTINFO"，将info变量的信息设置到信息包中，以便传到后台。
		if (_pdfEx.WebSendMessage()) { // 向后台发信息包。交互OfficeServer的OPTION="SENDMESSAGE"。
			info = _pdfEx.WebGetMsgByName("RETURNINFO"); // 如果交互成功，接受服务器端返回的信息。
			this.webPdfAlert(info);
			return info;
		} else {
			this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 在PDF文档中增加水印
	 */
	this.webSetWateMark = function(mText) {
		try {
			// _pdfEx.PageCount获得当前总页数
			var mPageCount = _pdfEx.PageCount;
			// 获取当前PDF文档状态，可以允许更改的文档就可以执行水印写操作
			if (_pdfEx.EditStatus) {
				// 设置水印。参数一：开始页；参数二：结束页；参数三：水印文本；参数四：透明度；参数五：字体大小；参数六：旋转角度（逆时针）；参数七：水印位置；参数八：水印X坐标；参数九：水印Y坐标。
				_pdfEx
						.WateMark(1, mPageCount, mText, 25, 125, 45, true, -1,
								-1);
			} else {
				this.webPdfAlert("该PDF文档不允许编辑，无法增加水印");
			}
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * iSignature PDF电子签章相关接口 调用签章窗体
	 */
	this.webShowSignDlg = function() {
		try {
			_pdfEx.ShowSignDlg();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 调用批量验证
	 */
	this.webShowCheckDlg = function() {
		try {
			_pdfEx.ShowCheckDlg();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 调用参数设置窗体
	 */
	this.webShowParamDlg = function() {
		try {
			_pdfEx.ShowParamDlg();
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 获取签章XML数量（UTF-8码）
	 */
	this.webSignatureItem = function() {
		var count = _pdfEx.SignatureItem(-1);
		this.webPdfAlert(count);
		return count;

	}

	/**
	 * 将页面跳转至指定名称的书签位置(返回值为非零表示成功定位，零表示查找指定名称的书签失败)
	 */
	this.webGotoBookMark = function(mBookMark) {
		try {
			if (mBookMark == null) {
				return false;
			}
			_pdfEx.GotoBookMark(mBookMark);
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 控制页面是否显示(参数Pages:页面范围;Enable:true显示 false不显示;Text显示的文字)
	 */
	this.webEnablePages = function(page, enable, text) {
		try {
			_pdfEx.EnablePages(page, enable, text);// 可以禁止显示多页，如："1-10,15,20"。
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 获取指定代码所代表的错误文本
	 */
	this.webGetErrorString = function(mCode) {
		try {
			if (mCode == null) {
				return false;
			}
			var mError = _pdfEx.GetErrorString(mCode); // 通过错误代码获得错误信息。错误代码从“-1”到“32”，总共34个。
			this.webPdfAlert("代码对应的错误信息为：" + mError);
			return mError;
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 获取指定页的长度、宽度及角度
	 */
	this.webGetPageSize = function() {
		try {
			// 设置页面宽、高、角度。
			var mWidth = _pdfEx.GetPageSize(1, 0);
			// 参数一：开始页；参数二：返回值类型，0：宽度 1：高度 2：旋转角度
			var mHeight = _pdfEx.GetPageSize(1, 1);
			var meight = _pdfEx.GetPageSize(1, 2);

			this.webPdfAlert("本例中返回第一页的宽度：" + mWidth + "；高度：" + mHeight + "；旋转角度："
					+ meight);
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 判断文档是否打开
	 */
	this.fileIsOpen = function() {
		try {
			var mOpen = _pdfEx.isOpen; // 返回1为打开；0为没有打开
			if (mOpen == 1) {
				return true;
			} else {
				return false;
			}
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 获取当前文档中的所有文字内容，该内容可以用来做全文检索
	 */
	this.getContentText = function() {
		try {
			return _pdfEx.ContentText;
		} catch (e) {
			//this.webPdfAlert(_pdfEx.Status);
		}
	}

	/**
	 * 获取文档中签章数据XML
	 */
	this.wetSignatureItemsXML = function() {
		var i;
		var LoadOk;
		var ErrorObj;
		var XmlObj = new ActiveXObject("Microsoft.XMLDOM");
		var XmlText;
		XmlObj.async = false;
		LoadOk = XmlObj.loadXML(_pdfEx.SignatureItem(-1));
		// this.webPdfAlert(_pdfEx.SignatureItem());
		ErrorObj = XmlObj.parseError;
		if (ErrorObj.errorCode != 0) {
			this.webPdfAlert("返回信息错误..." + ErrorObj.reason);
		} else {
			var CurNodes = XmlObj.getElementsByTagName("Signature_PDF");
			if (1 == CurNodes.length) {
				var SignNode = CurNodes.item(0);
				if (SignNode.hasChildNodes()) {
					var SignNodes = SignNode.childNodes;
					for ( var iXml = 0; iXml < SignNodes.length; iXml++) {
						var signItem = SignNodes.item(iXml);
						XmlText = "签章是否保护文档："
								+ signItem.selectSingleNode("SignatureProtect").text
								+ ";    True: 文档改动签章会变化；False: 文档改动签章不会变化\r\n";
						XmlText = XmlText
								+ "文档是否完整："
								+ signItem.selectSingleNode("SignatureResult").text
								+ ";    True: 文档完整；False: 文档不完整\r\n";
						XmlText = XmlText
								+ "签章名称："
								+ signItem.selectSingleNode("SignatureName").text
								+ ";\r\n";
						XmlText = XmlText
								+ "签章应用程序："
								+ signItem.selectSingleNode("SignatureApp").text
								+ ";\r\n";
						XmlText = XmlText
								+ "签章单位："
								+ signItem.selectSingleNode("SignatureUnit").text
								+ ";\r\n";
						XmlText = XmlText
								+ "签章用户："
								+ signItem.selectSingleNode("SignatureUser").text
								+ ";\r\n";
						XmlText = XmlText
								+ "签章存在钥匙盘序列号："
								+ signItem.selectSingleNode("SignatureKeySN").text
								+ ";\r\n";
						XmlText = XmlText + "签章序列号："
								+ signItem.selectSingleNode("SignatureSN").text
								+ ";\r\n";
						XmlText = XmlText
								+ "签章时间："
								+ signItem.selectSingleNode("SignatureDate").text
								+ ";\r\n";
						XmlText = XmlText
								+ "签章类型："
								+ signItem.selectSingleNode("SignatureType").text
								+ ";    签章类型，0：没有进行签章，1：电子签章，2：手写签章，3：二维条码\r\n";
						XmlText = XmlText
								+ "文档锁定："
								+ signItem.selectSingleNode("SignatureLocked").text
								+ ";    True:如果文档处于锁定状态，是该签章执行的锁定功能; False:如果文档处于锁定状态，不是该签章执行的锁定功能\r\n";
						this.webPdfAlert(XmlText);
					}
				}
			}
		}
		delete XmlObj;
	}
	
	/**
	 * 向文档中插入图片
	 */
	this.InsertImageByPosition = function(positionName,mode,startPage,endPage,width,height,imagePath,isURL){
		_pdfEx.InsertImageByPosition(positionName,mode,startPage,endPage,width,height,imagePath,isURL);
	}
	
    /**
	 * 向文档中插入文字
	 */
	this.InsertText = function(pageNo,X,Y,Text,FontSize){
		_pdfEx.InsertText(pageNo,X,Y,Text,FontSize);
	}
    
	/**
	 * 设置是否有文件被打开
	 */
	this.setOpenStatus = function(boolValue) {
		opened = boolValue;
	}
	
	/**
	 * 获取是否有文件被打开
	 */
	this.getOpenStatus = function(boolValue) {
		return opened;
	}
    
    /**
	 * 获取文档中是否有批注信息
	 */
	this.GetAnnotString = function(){
		return _pdfEx.GetAnnotString ();
	}

	this.init();

}