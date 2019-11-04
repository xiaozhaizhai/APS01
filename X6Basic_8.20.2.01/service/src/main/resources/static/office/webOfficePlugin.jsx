/**
 * office plugin for GoldGrid
 * 
 * @author fangzhibin
 * @since version 2.7
 */
var WebOfficeControl = CUI.WebOfficeControl = function(config) {
	
	var Sys = {}; 
	var ua = navigator.userAgent.toLowerCase();
	var s;
	(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
	(s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
	(s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
	(s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
	(s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
	
	var OFFICE_CONTROL_OBJ, _officeEx;

	var classid = '8B23EA28-2009-402F-92C4-59BE0E063499';
	
	var copyright = config.productKey;

	if (typeof config.id == "string") {
		OFFICE_CONTROL_OBJ = $("#officeControl_" + config.id);
	}

	/**
	 * @method 初始化
	 */
	this.init = function() {
		var officeEx;
      	var ieEnable = (!!window.ActiveXObject || "ActiveXObject" in window);
		if (ieEnable){
			officeEx = $('<object id="office_'
					+ config.id
					+ '" classid="clsid:'
					+ classid
					+ '" '
					+ 'codebase="'+ config.cabPath +'iWebOffice2009.cab#version='+ config.cabVersion +'" width="'
					+ config.width
					+ '" height="'
					+ config.height
					+ '"> '
					+ '<SPAN STYLE="color:red">不能装载Office文档控件。请检查浏览器的安全设置。	推荐使用IE8及以上版本。	</SPAN>'
					+ '</object>');
		} else if (Sys.chrome || Sys.firefox || Sys.safari) {
			officeEx = $('<object id="office_'
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
					+ config.id + '_WOC_onMenuClick" '
					+ 'event_OnToolsClick="'
					+ config.id + '_WOC_onToolsClick" '
					+ '>'
					+ '<SPAN STYLE="color:red">尚未安装Office Web跨浏览器插件。请点击<a href=\"/bap/struts/office/iWebPlugin.exe\">安装组件</a></SPAN>'
					+ '</object>');
		} else {
			
		}
		_officeEx = officeEx[0];
		OFFICE_CONTROL_OBJ.append(_officeEx);
		this.onCustomMenuCmdEvent();
		this.onCustomButtonOnMenuCmdEvent();
		// this.resizeOffice();
	}

	this.getOfficeObject = function() {
		return _officeEx;
	}

	this.getSignVar = function() {
		if (eval(config.id + "_WebSignControl")) {
			return eval(config.id + "_WebSignControl");
		} else {
			this.webOfficeAlert("this is no signature plugin");
		}
	}

	/**
	 * 往office文档控件注册事件公用方法
	 */
	this.addOfficeExEvent = function(o, sEventName, sEventDeal) {
		if (null == o)
			return;
		var oScript = document.createElement("script");
		oScript.language = "javascript";
		oScript.event = sEventName;
		oScript.htmlFor = "office_" + config.id;
		oScript.text = sEventDeal;
		document.body.appendChild(oScript);
	}

	/**
	 * 自定义菜单响应事件注册
	 */
	this.onCustomMenuCmdEvent = function() {
		var sEventName = "OnMenuClick(vIndex,vCaption)";
		var sEventDeal = config.id
				+ "_WebOfficeControl.onMenuClick(vIndex,vCaption);";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	/**
	 * 自定义按钮响应事件注册
	 */
	this.onCustomButtonOnMenuCmdEvent = function() {
		var sEventName = "OnToolsClick(vIndex,vCaption)";
		var sEventDeal = config.id
				+ "_WebOfficeControl.onToolsClick(vIndex,vCaption);";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}

	/**
	 * 自定义菜单响应事件
	 */
	this.onMenuClick = function(vIndex, vCaption) {
		if (vIndex == 1) {
			if (this.getSignVar()) {
				var signControl = this.getSignVar();
				if (signControl.signatureInstalled()) {
					signControl.createSignature(0);
				}
			}
			if(eval("typeof(" + config.id + "_customSign) != 'undefined'")) {
				eval(config.id + "_customSign()");
			}
		} else if (vIndex == 2) {
			if(config.handSignRefMethod) {
				eval(config.handSignRefMethod);
			} else {
				this.webUsePicToHandSign(config.handSignMark);
			}
			if(eval("typeof(" + config.id + "_customHandSign) != 'undefined'")) {
				eval(config.id + "_customHandSign()");
			}
		} else if (vIndex == 3) {
			if (this.getSignVar()) {
				var signControl = this.getSignVar();
				if (signControl.signatureInstalled()) {
					signControl.createSignature(2);
				}
			}
		}
	}

	/**
	 * 自定义按钮响应事件
	 */
	this.onToolsClick = function(vIndex, vCaption) {
		if (vIndex == -1 && vCaption == "返回_BEGIN") {
		} else if (vIndex == 10) {
			this.setSmallSize();
		} else if (vIndex == 11) {
			if (this.getSignVar()) {
				var signControl = this.getSignVar();
				if (signControl.signatureInstalled()) {
					signControl.createSignature(0);
				}
			}
			if(eval("typeof(" + config.id + "_customSign) != 'undefined'")) {
				eval(config.id + "_customSign()");
			}
		} else if (vIndex == 12) {
			if(config.handSignRefMethod) {
				eval(config.handSignRefMethod);
			} else {
				this.webUsePicToHandSign(config.handSignMark);
			}
			if(eval("typeof(" + config.id + "_customHandSign) != 'undefined'")) {
				eval(config.id + "_customHandSign()");
			}
		} else if (vIndex == 17) {
			if (this.getSignVar()) {
				var signControl = this.getSignVar();
				if (signControl.signatureInstalled()) {
					signControl.createSignature(2);
				}
			}
		} else if (vIndex == 13) {
			this.showRevision(true);
		} else if (vIndex == 14) {
			this.showRevision(false);
		} else if (vIndex == 15) {
			this.webGetRevisions();
		} else if (vIndex == 16) {
			this.webAcceptAllRevisions();
		} else if (vIndex == 18) {
			this.webOpenPrint();
		} else if (vIndex == 19) {
			this.webSaveLocal();
		} else  if(vIndex == 20) {
			if(_officeEx.Confirm("此操作会覆盖掉文档正文，确定要添加模板吗？")) {
				if(!loadTemplate()) {
					_officeEx.Alert("添加模板失败，请先选择模板");
				}
			}
		}
	}

	/**
	 * 添加自定义菜单
	 */
	this.addMyMenuItems = function(index, caption) {
		try {
			_officeEx.AppendMenu(index, caption);
		} catch (err) {
			//this.webOfficeAlert(_officeEx.Status);
		} finally {
		}
	}

	/**
	 * 添加自定义按钮
	 */
	this.addMyMenuButtons = function(index, caption, icon) {
		try {
			_officeEx.AppendTools(index, caption, icon);
		} catch (err) {
			//this.webOfficeAlert(_officeEx.Status);
		} finally {
		}
	}

	/**
	 * 自定义工具栏按钮是否显示
	 */
	this.visibleTools = function(caption, flag) {
		_officeEx.VisibleTools(caption, flag);
	}

	/**
	 * 自定义工具栏按钮是否禁用
	 */
	this.disableTools = function(caption, flag) {
		_officeEx.DisableTools(caption, flag);
	}

	/**
	 * 禁止指定菜单项
	 */
	this.disableMenu = function(menuName) {
		_officeEx.DisableMenu(menuName);
	}

	/**
	 * 允许菜单项有效
	 */
	this.enableMenu = function(menuName) {
		_officeEx.EnableMenu(menuName);
	}

	/**
	 * 弹出提示对话框
	 */
	this.webOfficeAlert = function(message) {
		if(message) {
			try {
				_officeEx.Alert(message);
			} catch (e) {
				//alert(message);
			} 
		}
			
	}

	/**
	 * 弹出确认对话框并返回选择信息
	 */
	this.webOfficeConfirm = function(message) {
		_officeEx.Confirm(message);
	}

	/**
	 * 控制控件强制得到或失去焦点
	 */
	this.active = function(value) {
		_officeEx.Active(value);
	}

	/**
	 * 设置showType 0为文档核稿 1为文字批注 2为手写批注
	 */
	this.setShowType = function(type) {
		_officeEx.ShowType = type;
	}

	/**
	 * 使当前编辑区全屏显示
	 */
	this.setFullSize = function() {
		if(this.GetEditer()){
			if (config.view == "readonly" || config.isReadonly) {
				_officeEx.EditType = "0,0";
			} else {
				if(config.isRevision) {
					if(config.acceptRevisions) {
						_officeEx.EditType = "3,1";
					} else {
						_officeEx.EditType = "2,1";
					}
				} else {
					_officeEx.EditType = "1,1";
				}
			}	
         	 _officeEx.FullSize();
		}
	}

	/**
	 * 从全屏状态返回原窗口状态
	 */
	this.setSmallSize = function() {
		_officeEx.SmallSize();
	}

	/**
	 * 选择模板方法
	 */
	this.selectTemplate = function() {
		eval(config.templateRefMethod);
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
	 * 初始化文档
	 */
	this.loadDoc = function(url, linkId) {
		try {
			_officeEx.WebUrl = url;
			_officeEx.RecordID = (linkId != null) ? linkId : ""; // 文档记录号
			_officeEx.Template = ""; // 模板记录号
			_officeEx.FileName = (config.fileName) ? config.fileName
					: "officeDoc";
			_officeEx.Compatible = true;
			_officeEx.FileType = "." + config.openType; // 文档类型 .doc .xls .wps
			_officeEx.UserName = config.currentStaffName;
			// 编辑状态:第一位可以为0,1,2,3其中:0不可编辑;1可以编辑,无痕迹;2可以编辑,有痕迹,不能修订;3可以编辑,有痕迹,能修订
			// 第二位可以为0,1其中:0不可批注,1可以批注。
			//if (config.view == "readonly" || config.isReadonly) {
				_officeEx.EditType = "0,0";
			//} else {
			//	if(config.isRevision) {
			//		if(config.acceptRevisions) {
			//			_officeEx.EditType = "3,1";
			//		} else {
			//			_officeEx.EditType = "2,1";
			//		}
			//	} else {
			//		_officeEx.EditType = "1,1";
			//	}
			//}
			_officeEx.MaxFileSize = config.maxFileSize * 1024;
			// Language:多语言支持显示选择 CH 简体 TW繁体 EN英文
			_officeEx.Language = config.language;
			//_officeEx.ShowWindow = true;
			if(config.isCreateNew) {
				this.visibleTools("新建文件", true);
				this.visibleTools("打开文件", true);
                if(config.entityCode == "knowledge_1.0_documentManage") {
					this.addMyMenuButtons("20", "添加模板", 20);
				}
			} else {
				this.visibleTools("新建文件", false);
				this.visibleTools("打开文件", false);
			}
			this.visibleTools("保存文件", false);
			this.visibleTools("文字批注", false);
			this.visibleTools("手写批注", false);
			this.visibleTools("文档清稿", false);
			this.visibleTools("重新批注", false);
			
			if(config.officePrint) {
				_officeEx.EnablePrint = "1";
				this.addMyMenuButtons("18", "打印文档", 18); 
			}
			
			if (config.isSign) { 
				//this.addMyMenuItems("1", "签章");
				//this.addMyMenuButtons("11", "签章", 11); 
			} 
			if (config.isHandSign) {
				//this.addMyMenuItems("2", "手写签名"); 
				this.addMyMenuButtons("12", "手写签名", 12); 
			} 
			if (config.isSign) { 
				//this.addMyMenuItems("3", "验证签章"); 
				//this.addMyMenuButtons("17", "验证签章", 10); 
			}
			if (config.showRevision) {
				this.addMyMenuButtons("13", "显示痕迹", 13);
			}
			if (config.hideRevision) {
				this.addMyMenuButtons("14", "隐藏痕迹", 14);
			}
			if (config.getRevisions) {
				this.addMyMenuButtons("15", "获取痕迹", 15);
			}
			if (config.acceptRevisions) {
				this.addMyMenuButtons("16", "清除痕迹", 16);
			}
			if(config.downloadDoc) {
				this.addMyMenuButtons("19", "下载文件", 19);
			} 
			// this.addMyMenuButtons("10", "退出", 10);
			/*if(config.openType == "pdf") {
				if (this.getSignVar()) {
					var signControl = this.getSignVar();
					if (config.isSign || config.isHandSign) {
						signControl.setSignatureParamBar('AddinCommandBar', 'TRUE');
					} else {
						signControl.setSignatureParamBar('AddinCommandBar', 'FALSE');
					}
				}
			} else {
				if (this.getSignVar()) {
					var signControl = this.getSignVar();
					//signControl.setSignatureParamBar('AddinCommandBar', 'FALSE');
				}
			}*/
			var type;
			if (config.saveTemplate) {
				type = "bapTemplate__";
			} else {
				type = "bapOffice__";
			}
			type += config.fileuploadType;
			_officeEx.WebSetMsgByName("type", type);
			_officeEx.WebSetMsgByName("propertyCode", config.propertyCode);
			_officeEx.WebSetMsgByName("entityCode", config.entityCode);
			_officeEx.WebSetMsgByName("showType", config.openType);
			_officeEx.WebSetMsgByName("editUserName", config.currentUserName);
			if (config.view != "readonly" && !config.isReadonly) {
				if(!this.isFirst(linkId)) {
					CUI.Dialog.alert("你所打开的文档已有人在编辑，目前只可以查看！");
					_officeEx.EditType = "0,0";
				}
			}
          	if (config.view == "readonly" && config.pendingId && config.status != 99 && config.entityCode == "knowledge_1.0_documentManage") {
				if(!this.isFirst(linkId)) {
					CUI.Dialog.alert("你所打开的文档已有人在编辑，目前只可以查看！");
					_officeEx.EditType = "0,0";
				}
			}
			// 打开该文档
			if(this.GetEditer()){
				_officeEx.WebOpen(false);
				_officeEx.ShowType = config.officeShowType;
			}
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}
	
	/**
	 * 文档是否只打开一次
	 */
	this.isFirst = function(linkId) {
		var type;
		if (config.saveTemplate) {
			type = "bapTemplate__";
		} else {
			type = "bapOffice__";
		}
		type += config.fileuploadType;
		_officeEx.WebSetMsgByName("type", type);
		_officeEx.WebSetMsgByName("propertyCode", config.propertyCode);
		_officeEx.WebSetMsgByName("entityCode", config.entityCode);
		_officeEx.WebSetMsgByName("showType", config.openType);
		_officeEx.WebSetMsgByName("command", "isFirst");
		_officeEx.WebSetMsgByName("fileId", (linkId != null) ? linkId : "");
		_officeEx.WebSetMsgByName("editUserName", config.currentUserName);
		if(_officeEx.WebSendMessage()) {
			var mEditType = _officeEx.WebGetMsgByName("editType");
			if(mEditType == '0') {
				return false;
			}
		}
		return true;
	}
	
	this.updateOpenTime = function(linkId) {
		$.ajax({
			data:{},// 参数
			dataType:"json", //一般就给json， 以json格式传递参数，包括返回数据
			type:"post", //post， get，一般就用post好了
			url:"/knowledge/documentManage/docManage/judgeSession.action",// 调用的url
			async:false, //是否异步调用，如果true，则表示是异步调用，如果是false，则表示是同步调用。
			success:function(re){
				if(re.sessionValid) {
					var type;
					if (config.saveTemplate) {
						type = "bapTemplate__";
					} else {
						type = "bapOffice__";
					}
					type += config.fileuploadType;
					_officeEx.WebSetMsgByName("type", type);
					_officeEx.WebSetMsgByName("propertyCode", config.propertyCode);
					_officeEx.WebSetMsgByName("entityCode", config.entityCode);
					_officeEx.WebSetMsgByName("showType", config.openType);
					_officeEx.WebSetMsgByName("command", "updateTime");
					_officeEx.WebSetMsgByName("fileId", (linkId != null) ? linkId : "");
					_officeEx.WebSetMsgByName("editUserName", config.currentUserName);
					_officeEx.WebSendMessage();
				}
			}, //正确返回时，调用的函数
			error:function(p1, p2, p3){
				console.log(p1);
				console.log(p2);
				console.log(p3);
			} //如果请求发生错误，则调用这个函数
		});
	}
	
	/**
	 * 设置文档编辑状态
	 */
	this.setEditType = function(first, second) {
		_officeEx.EditType = first + "," + second;
	}
	
	/**
	 * 打开默认文档
	 */
	this.loadDefaultDoc = function(linkId, type, propertyCode, entityCode) {
		try {
			_officeEx.RecordID = (linkId != null) ? linkId : ""; 
			_officeEx.WebSetMsgByName("type", type);
			_officeEx.WebSetMsgByName("propertyCode", propertyCode);
			_officeEx.WebSetMsgByName("entityCode", entityCode);
			_officeEx.WebSetMsgByName("showType", config.openType);
			_officeEx.WebSetMsgByName("editUserName", config.currentUserName);
			_officeEx.WebOpen(false);
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 调用模板
	 */
	this.loadTemplate = function(linkId, type, propertyCode, entityCode) {
		try {
			if (linkId != null && linkId != undefined && linkId != "") {
				var fileEntityCode = (entityCode == null) ? config.entityCode
						: entityCode;
				_officeEx.Template = linkId;
				var type = "bapTemplate__" + type;
				_officeEx.WebSetMsgByName("type", type);
				_officeEx.WebSetMsgByName("entityCode", fileEntityCode);
				_officeEx.WebSetMsgByName("propertyCode", propertyCode);
				_officeEx.WebSetMsgByName("showType", config.openType);
				_officeEx.WebLoadTemplate();
			}
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 退出office控件
	 */
	this.unload = function(linkId) {
		$.ajax({
           data:{},// 参数
           dataType:"json", //一般就给json， 以json格式传递参数，包括返回数据
           type:"post", //post， get，一般就用post好了
           url:"/knowledge/documentManage/docManage/judgeSession.action",// 调用的url
           async:false, //是否异步调用，如果true，则表示是异步调用，如果是false，则表示是同步调用。
           success:function(re){
               if(re.sessionValid) {
                  try {
                      var type;
                      if (config.saveTemplate) {
                          type = "bapTemplate__";
                      } else {
                          type = "bapOffice__";
                      }
                      type += config.fileuploadType;
                      _officeEx.WebSetMsgByName("type", type);
                      _officeEx.WebSetMsgByName("propertyCode", config.propertyCode);
                      _officeEx.WebSetMsgByName("entityCode", config.entityCode);
                      _officeEx.WebSetMsgByName("showType", config.openType);
                      _officeEx.WebSetMsgByName("command", "closeFirst");
                      _officeEx.WebSetMsgByName("fileId", (linkId != null) ? linkId : "");
                      _officeEx.WebSetMsgByName("editUserName", config.currentUserName);
                      _officeEx.WebSendMessage();
                      _officeEx.WebClose();
                  } catch (e) {
                      //this.webOfficeAlert(_officeEx.Status);
                  }
               }
           }, //正确返回时，调用的函数
           error:function(p1, p2, p3){
               console.log(p1);
               console.log(p2);
               console.log(p3);
           } //如果请求发生错误，则调用这个函数
		});
	}

	/**
	 * 是否显示工具栏
	 */
	this.setShowToolBar = function(value) {
		_officeEx.ShowToolBar = value;
	}

	/**
	 * 判断控件是否修改过
	 */
	this.getIsModify = function() {
		return _officeEx.Modify;
	}

	/**
	 * 打开文档 打开该文档 交互OfficeServer的OPTION="LOADFILE"
	 */
	this.loadDocument = function() {
		_officeEx.WebOpen();
	}

	/**
	 * 保存文档 设置变量MyDefine1="自定义变量值1"，变量可以设置多个 在WebSave()时，一起提交到后台中
	 * _officeEx.WebSetMsgByName("MyDefine1","自定义变量值1"); 交互OPTION="SAVEFILE"
	 * 注：WebSave()是保存复合格式文件，包括OFFICE内容和手写批注文档；如只保存成OFFICE文档格式，那么就设WebSave(true)
	 */
	this.saveDocument = function(boolvalue) {
		// 不验证文档空及文档内容格式 张慧东 2017-09-04
		_officeEx.AllowEmpty = true;
		if (!_officeEx.WebSave(boolvalue)) {
			this.webOfficeAlert(_officeEx.Status);
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 取得服务器返回字段域信息的值
	 */
	this.webGetMsgByName = function(fieldName) {
		var value = _officeEx.WebGetMsgByName(fieldName);
		return value;
	}

	/**
	 * 设置相应字段域值，等待发送给服务器
	 */
	this.webSetMsgByName = function(fieldName, fieldValue) {
		var value = _officeEx.WebSetMsgByName(fieldName, fieldValue);
		return value;
	}

	/**
	 * 清除由WebSetMsgByName设置的值
	 */
	this.webClearMessage = function() {
		_officeEx.WebClearMessage();
	}

	/**
	 * 显示或隐藏痕迹[隐藏痕迹时修改文档没有痕迹保留] true表示隐藏痕迹 false表示显示痕迹
	 */
	this.showRevision = function(mValue) {
		if (mValue) {
			_officeEx.WebShow(true);
		} else {
			_officeEx.WebShow(false);
		}
	}

	/**
	 * 显示或隐藏痕迹[隐藏痕迹时修改文档没有痕迹保留] true表示隐藏痕迹 false表示显示痕迹
	 */
	this.showRevision2 = function(mValue) {
		if (mValue) {
			_officeEx.WebObject.ShowRevisions = true; // 显示痕迹
		} else {
			_officeEx.WebObject.ShowRevisions = false; // 隐藏痕迹
		}
	}

	/**
	 * 获取痕迹
	 */
	this.webGetRevisions = function() {
		var rev = _officeEx.WebObject.Revisions; // 获取痕迹对象
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
		this.webOfficeAlert(text);
		return text;
	}

	/**
	 * 刷新文档
	 */
	this.webReFresh = function() {
		_officeEx.WebReFresh();
	}

	/**
	 * 获取处理意见
	 */
	this.getUserComment = function() {
		var mDialogUrl = "/bap/struts/office/comment.htm";
		var mObject = new Object();
		mObject.comment = "";
		window.showModalDialog(mDialogUrl, mObject,
						"dialogHeight:200px; dialogWidth:360px;center:yes;scroll:no;status:no;");
		var commentValue = mObject.comment;
		if(commentValue != "") {
			this.setBookmarks(config.commentMark, commentValue);
		}

	}

	/**
	 * 打开版本 交互列出版本OPTION="LISTVERSION" 调出版本OPTION="LOADVERSION"
	 */
	this.webOpenVersion = function() {
		_officeEx.WebOpenVersion();
	}

	/**
	 * 保存版本 交互OPTION="SAVEVERSION"
	 */
	this.webSaveVersion = function() {
		_officeEx.WebSaveVersion();
	}

	/**
	 * 保存当前版本 交互OPTION="SAVEVERSION" 同时带FileID值
	 */
	this.webSaveVersionByFileID = function(mText) {
		if (mText == null) {
			mText = "已修改版本.";
		}
		_officeEx.WebSaveVersionByFileID(mText);
	}

	/**
	 * 填充模板 交互OPTION="LOADBOOKMARKS"
	 */
	this.loadBookmarks = function() {
		try {
			_officeEx.WebLoadBookmarks();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 标签管理 交互OPTION="LISTBOOKMARKS"
	 */
	this.webOpenBookMarks = function() {
		try {
			_officeEx.WebOpenBookmarks();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 设置书签值 vbmName:标签名称，vbmValue:标签值 标签名称注意大小写
	 */
	this.setBookmarks = function(vbmName, vbmValue) {
		if(vbmName != null) {
			_officeEx.WebSetBookmarks(vbmName, vbmValue);
		}
	}

	/**
	 * 根据标签名称获取标签值 vbmName:标签名称
	 */
	this.getBookmarks = function(vbmName) {
		var vbmValue;
		vbmValue = _officeEx.WebGetBookmarks(vbmName);
		return vbmValue;
	}
	
	/**
	 * 定位书签
	 * @param bookMarkName
	 */
	this.goToBookMark = function(bookMarkName) {
		try {
			if(bookMarkName) {
				var ntkodoc = _officeEx.WebObject;
				ntkodoc.Application.Selection.Goto(-1, 0, 0, bookMarkName);
			}
		} catch(e) {
		}
	}

	/**
	 * 打印文档
	 */
	this.webOpenPrint = function() {
		var permitFlag = true;
		if(eval("typeof(" + config.id + "_officePrintPermit) != 'undefined'")) {
			permitFlag = eval(config.id + "_officePrintPermit()");
		}
		if(!permitFlag) {
			alert('您没有打印该文档的权限，请联系管理员！');
			return false;
		} 
		try {
			_officeEx.WebOpenPrint();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 页面设置
	 */
	this.webOpenPageSetup = function() {
		try {
			if (_officeEx.FileType == ".doc") {
				_officeEx.WebObject.Application.Dialogs(178).Show();
			}
			if (_officeEx.FileType == ".xls") {
				_officeEx.WebObject.Application.Dialogs(7).Show();
			}
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 插入图片
	 */
	this.webOpenPicture = function() {
		try {
			_officeEx.WebOpenPicture();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}
	
	/**
	 * 插入图片似的签名
	 */
	this.webUsePicToHandSign = function(bookMarkName) {
		try {
			if(this.webDocIsReadonly()) {
				this.webProtect(false);
			}
			this.goToBookMark(bookMarkName);
			_officeEx.WebOpenPicture();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		} finally {
			if(this.webDocIsReadonly()) {
				this.webProtect(true);
			}
		}
	}
	
	/**
	 * 参照插入图片似的签名
	 */
	this.webUsePicToHandSignByRef = function(imgId, type, propertyCode) {
		try {
			if(this.webDocIsReadonly()) {
				this.webProtect(false);
			}
			_officeEx.WebSetMsgByName("imgId", imgId);
			_officeEx.WebSetMsgByName("type", type);
			_officeEx.WebSetMsgByName("propertyCode", propertyCode);
			var bookMark = "bap";
			//方法第二个参数必须要传值，不传就浏览器崩溃
			if(config.handSignMark) {
				bookMark = config.handSignMark;
			}
			//方法第二个参数必须要传值，默认传,反正后台这个数据使用不到，bap能返回正确的文件路径
			_officeEx.WebInsertImage(bookMark, "bap.jpg", true, 4);
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		} finally {
			if(this.webDocIsReadonly()) {
				this.webProtect(true);
			}
		}
	}
	
	/**
	 * 签名印章 A签章列表OPTION="LOADMARKLIST" B签章调出OPTION="LOADMARKIMAGE"
	 * C确定签章OPTION="SAVESIGNATURE"
	 */
	this.webOpenSignature = function(type) {
		try {
			_officeEx.WebOpenSignature(type);
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 验证印章 交互的OPTION="LOADSIGNATURE"
	 */
	this.webShowSignature = function() {
		try {
			_officeEx.WebShowSignature();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 检测印章 交互的OPTION="LOADSIGNATURE" (=-1 有非法印章) (=0 没有任何印章) (>=1 有多个合法印章)
	 */
	this.webCheckSignature = function() {
		try {
			var i = _officeEx.WebCheckSignature();
			return i;
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 存为本地文件
	 */
	this.webSaveLocal = function() {
		var permitFlag = true;
		if(eval("typeof(" + config.id + "_downloadLocalPermit) != 'undefined'")) {
			permitFlag = eval(config.id + "_downloadLocalPermit()");
		}
		if(!permitFlag) {
			alert('您没有下载该文档的权限，请联系管理员！');
			return false;
		}
		try {
			if(this.webDocIsReadonly()) {
				this.webProtect(false);
			}
			_officeEx.WebSaveLocal();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		} finally {
			if(this.webDocIsReadonly()) {
				this.webProtect(true);
			}
		}
	}

	/**
	 * 打开本地文件
	 */
	this.webOpenLocal = function() {
		try {
			_officeEx.WebOpenLocal();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 保存为HTML文档 交互的OPTION="SAVEASHTML"
	 */
	this.webSaveAsHtml = function() {
		try {
			_officeEx.WebSaveAsHtml();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 保存为HTML文档 交互的OPTION="SAVEPDF"
	 */
	this.webSaveAsPdf = function() {
		try {
			return _officeEx.WebSavePDF();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
			return false;
		}
	}

	/**
	 * 保存为文档图片 交互OfficeServer的OPTION="SAVEIMAGE"
	 */
	this.webSaveAsPage = function() {
		try {
			_officeEx.WebSaveImage();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 关闭或显示工具 参数1表示工具条名称 参数2为false时，表示关闭 （名称均可查找VBA帮助） 参数2为true时，表示显示
	 */
	this.webToolsVisible = function(ToolName, Visible) {
		try {
			_officeEx.WebToolsVisible(ToolName, Visible);
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 禁止或启用工具 参数1表示工具条名称 参数2表示工具条铵钮的编号 （名称和编号均可查找VBA帮助） 参数3为false时，表示禁止
	 * 参数3为true时，表示启用
	 */
	this.webToolsEnable = function(ToolName, ToolIndex, Enable) {
		try {
			_officeEx.WebToolsEnable(ToolName, ToolIndex, Enable);
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 保护与解除 参数1为true表示保护文档 false表示解除保护
	 */
	this.webProtect = function(value, password) {
		try {
			_officeEx.WebSetProtect(value, (password == undefined ? "" : password)); // ""表示密码为空
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}
	
	/**
	 * 保护与解除 参数1为true表示保护文档 false表示解除保护
	 */
	this.webDocIsReadonly = function() {
		if(_officeEx.EditType == '0,0' || _officeEx.EditType == '0,1') {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 允许与禁止拷贝功能 参数1为true表示允许拷贝 false表示禁止拷贝
	 */
	this.webEnableCopy = function(value) {
		try {
			_officeEx.CopyType = value;
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 插入远程服务器图片 交互的OPTION="INSERTIMAGE" 参数1表示标签名称 参数2表示图片文件名 参数3为true透明
	 * false表示不透明 参数4为4表示浮于文字上方5表示衬于文字下方
	 */
	this.webInsertImage = function(vbmName, picName) {
		try {
			_officeEx.WebInsertImage(vbmName, picName, true, 4);
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 下载服务器文件到本地 参数1表示本地路径 参数2表示服务器文件名称 交互的OPTION="GETFILE"
	 */
	this.webGetFile = function(path, docName) {
		_officeEx.WebGetFile(path, docName);
	}

	/**
	 * 上传本地文件到服务器 参数1表示本地路径，可以任何格式文件 参数2表示服务器文件名称
	 * 交互OfficeServer的OPTION="PUTFILE"
	 */
	this.webPutFile = function(docName) {
		var mLocalFile = _officeEx.WebOpenLocalDialog();
		if (mLocalFile != "") {
			_officeEx.WebPutFile(mLocalFile, docName);
		}
	}

	/**
	 * 打开远程文件
	 */
	this.webDownLoadFile = function(serverPath, localPath) {
		var mResult = _officeEx.WebDownLoadFile(serverPath, localPath);
		if (mResult) {
			_officeEx.WebOpenLocalFile(localPath);
		}
	}

	/**
	 * 取得服务器端时间，设置本地时间 [V6.0.1.5以上支持] 交互的OPTION="DATETIME" 该功能主要用于在痕迹保留时读取服务器时间
	 * true表示返回并设置本地时间为服务器时间；false表示仅返回服务器时间
	 */
	this.webDateTime = function() {
		var mResult = _officeEx.WebDateTime(false);
		return mResult;
	}

	/**
	 * 表格生成及填充 交互的OPTION="SENDMESSAGE"
	 */
	this.webSetWordTable = function() {
		var mText = "", mName = "", iColumns, iCells, iTable;
		// 设置COMMAND为WORDTABLE
		// 设置变量COMMAND="WORDTABLE"，在WebSendMessage()时，一起提交到后台中
		_officeEx.WebSetMsgByName("COMMAND", "WORDTABLE");
		// 发送到服务器上
		if (_officeEx.WebSendMessage()) {
			iColumns = _officeEx.WebGetMsgByName("COLUMNS"); // 取得列
			iCells = _officeEx.WebGetMsgByName("CELLS"); // 取得行
			iTable = _officeEx.WebObject.Tables.Add(
					_officeEx.WebObject.Application.Selection.Range, iCells,
					iColumns); // 生成表格
			for ( var i = 1; i <= iColumns; i++) {
				for ( var j = 1; j <= iCells; j++) {
					mName = i.toString() + j.toString();
					mText = _officeEx.WebGetMsgByName(mName);
					iTable.Columns(i).Cells(j).Range.Text = mText; // 填充单元值
				}
			}
		}
	}

	/**
	 * 获取文档正文
	 */
	this.webGetWordContent = function() {
		try {
			return _officeEx.WebObject.Content.Text;
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 写Word内容
	 */
	this.webSetWordContent = function(mText) {
		if (mText == null) {
			return (false);
		} else {
			// 下面为显示选中的文本
			// this.webOfficeAlert(_officeEx.WebObject.Application.Selection.Range.Text);
			// 下面为在当前光标出插入文本
			_officeEx.WebObject.Application.Selection.Range.Text = mText + "\n";
			// 下面为在第一段后插入文本
			// _officeEx.WebObject.Application.ActiveDocument.Range(1).Text=(mText);
		}
	}

	/**
	 * 打印黑白文档
	 */
	this.webWordPrintBlackAndWhile = function() {
		var i, n;
		// 图片变黑白
		i = 0;
		n = _officeEx.WebObject.Shapes.Count;
		for ( var i = 1; i <= n; i++) {
			_officeEx.WebObject.Shapes.Item(i).PictureFormat.ColorType = 3;
		}
		i = 0;
		n = _officeEx.WebObject.InlineShapes.Count;
		for ( var i = 1; i <= n; i++) {
			_officeEx.WebObject.InlineShapes.Item(i).PictureFormat.ColorType = 3;
		}
		// 文字变黑白
		_officeEx.WebObject.Application.Selection.WholeStory();
		_officeEx.WebObject.Application.Selection.Range.Font.Color = 0;
	}

	/**
	 * 模版套红功能
	 * 
	 */
	this.webUseTemplate = function(template, type, propertyCode, entityCode,
			bookMarkName) {
		// 判断用户是否选择模板
		if (template == "") {
			return false;
		} else {
			// 清除正文痕迹的目的是为了避免痕迹状态下出现内容异常问题。
			if (this.webAcceptAllRevisions() == false) {
				this.webOfficeAlert("清除正文痕迹失败，套红中止");
				return false;
			}
			// 保存当前编辑的文档
			this.saveDocument(true);
			var contentPath = _officeEx.WebGetMsgByName("officeFilePath");
			if (entityCode != null && entityCode != undefined
					&& entityCode != "") {
				var type = "bapTemplate__" + type;
				_officeEx.WebSetMsgByName("type", type);
				_officeEx.WebSetMsgByName("entityCode", entityCode);
				_officeEx.WebSetMsgByName("propertyCode", propertyCode);
				_officeEx.WebSetMsgByName("showType", config.openType);
			}
			_officeEx.Template = template;
			_officeEx.WebSetMsgByName("contentPath", contentPath);
			_officeEx.WebSetMsgByName("bookMarkName",
					(bookMarkName != null) ? bookMarkName : "Content");
			_officeEx.EditType = "1"; // 控制为不保留痕迹的状态
			// 交互的OPTION="LOADTEMPLATE"
			if (_officeEx.WebLoadTemplate()) {
				// SetBookmarks("Title","title");
				// 填充公文正文 交互的OPTION="INSERTFILE"
				if (_officeEx.WebInsertFile()) {
				} else {
					this.webOfficeAlert(_officeEx.Status);
					return false;
				}
			} else {
				this.webOfficeAlert(_officeEx.Status);
				return false;
			}
		}
	}

	/**
	 * 保存定稿文件 交互的OPTION="UPDATEFILE"，类似WebSave()或WebSaveVersion()方法
	 */
	this.webUpdateFile = function() {
		_officeEx.WebUpdateFile();
	}

	/**
	 * 打印份数控制 交互的OPTION="SENDMESSAGE"
	 */
	this.webCopysCtrlPrint = function() {
		var mCopies, objPrint;
		// 打印设置对话框
		objPrint = _officeEx.WebObject.Application.Dialogs(88);
		if (objPrint.Display == -1) {
			// 取得需要打印份数
			mCopies = objPrint.NumCopies;
			_officeEx.WebSetMsgByName("COMMAND", "COPIES");
			// 设置变量OFFICEPRINTS的值，在WebSendMessage()时，一起提交到后台中
			_officeEx.WebSetMsgByName("OFFICEPRINTS", mCopies.toString());
			_officeEx.WebSendMessage();
			if (_officeEx.Status == "1") {
				objPrint.Execute;
			} else {
				this.webOfficeAlert("已超出允许的打印份数");
				return false;
			}
		}
	}

	/**
	 * 导入Text 交互的OPTION="SENDMESSAGE"
	 */
	this.webInportText = function() {
		var mText;
		// 设置变量COMMAND="INPORTTEXT"，在WebSendMessage()时，一起提交到后台中
		_officeEx.WebSetMsgByName("COMMAND", "INPORTTEXT");
		if (_officeEx.WebSendMessage()) {
			// 取得后台传递的变量CONTENT值
			mText = _officeEx.WebGetMsgByName("CONTENT");
			_officeEx.WebObject.Application.Selection.Range.Text = mText;
		}
	}

	/**
	 * 导出Text 交互的OPTION="SENDMESSAGE"
	 */
	this.webExportText = function() {
		var mText = _officeEx.WebObject.Content.Text;
		// 设置变量COMMAND="EXPORTTEXT"，在WebSendMessage()时，一起提交到后台中
		_officeEx.WebSetMsgByName("COMMAND", "EXPORTTEXT");
		// 设置变量CONTENT="mText"，在WebSendMessage()时，一起提交到后台中，可用于实现全文检索功能，对WORD的TEXT内容进行检索
		_officeEx.WebSetMsgByName("CONTENT", mText);
		_officeEx.WebSendMessage();
	}

	/**
	 * 获取文档页数
	 */
	this.webDocumentPageCount = function() {
		var pageTotal;
		if (_officeEx.FileType == ".doc") {
			pageTotal = _officeEx.WebObject.Application.ActiveDocument
					.BuiltInDocumentProperties(14);
		}
		if (_officeEx.FileType == ".wps") {
			pageTotal = _officeEx.WebObject.PagesCount();
		}
		return pageTotal;
	}

	/**
	 * 参数1:不显示痕迹 true显示痕迹，false不显示痕迹 参数2:不保留痕迹 true保留痕迹，false不保留痕迹 参数3:不打印时有痕迹
	 * 参数4:是否显示审阅工具栏，true显示，false不显示
	 */
	this.webSetRevision = function(show, track, print, tool) {
		_officeEx.WebSetRevision(show, track, print, tool);
	}

	/**
	 * 签章锁定文件功能 交互的 A签章列表OPTION="LOADMARKLIST" B签章调出OPTION="LOADMARKIMAGE"
	 * C确定签章OPTION="SAVESIGNATURE"
	 */
	this.webSignatureAtReadonly = function() {
		// 解除文档保护
		this.webProtect(false);
		// 设置文档痕迹保留的状态

		_officeEx.WebSetRevision(false, false, false, false);
		try {
			_officeEx.WebOpenSignature();
		} catch (e) {
			//this.webOfficeAlert(_officeEx.Status);
		}
		this.webProtect(true); // 锁定文档
	}

	/**
	 * 客户端和服务器端信息信息交互 向后台发信息包。交互的OPTION="SENDMESSAGE"
	 */
	this.webSendInformation = function(info) {
		if (info == null) {
			return false;
		}
		// 设置变量COMMAND="SELFINFO"，用来在服务器端做判断，以进入处理自定义参数传递的代码。
		_officeEx.WebSetMsgByName("COMMAND", "SELFINFO");
		// 自定义的一个参数"TESTINFO"，将info变量的信息设置到信息包中，以便传到后台。
		_officeEx.WebSetMsgByName("TESTINFO", info);
		if (_officeEx.WebSendMessage()) {
			// 如果交互成功，接受服务器端返回的信息。
			info = _officeEx.WebGetMsgByName("RETURNINFO");
			return info;
		}
	}

	/**
	 * 设置OFFICE2007的选项卡显示 最常用的内置选项卡名称 选项卡名称 idMso（Excel） idMso（Word）
	 * idMso（Access） 开始 TabHome TabHome TabHomeAccess 插入 TabInsert TabInsert
	 * （none） 页面布局 TabPageLayoutExcel TabPageLayoutWord （none） 公式 TabFormulas
	 * （none） （none） 数据 TabData （none） （none） 视图 TabReview TabReviewWord （none）
	 * 创建 （none） （none） TabCreate 外部数据 （none） （none） TabExternalData 数据库工具
	 * （none） （none） TabDatabaseTools
	 * iWebOffice控件的RibbonUIXML属性，是基于OFFICE2007的RibbonX的应用。关于RibbonX的相关资料，需要自己另行查询。
	 */
	this.webSetRibbonUIXML = function() {
		_officeEx.RibbonUIXML = ''
				+ '<customUI xmlns="http://schemas.microsoft.com/office/2006/01/customui">'
				+ '  <ribbon startFromScratch="false">' + // 不显示所有选项卡控制
				// false显示选项卡；true不显示选项卡
				'    <tabs>'
				+ '      <tab idMso="TabReviewWord" visible="false">' + // 关闭视图工具栏
				'      </tab>'
				+ '      <tab idMso="TabInsert" visible="false">' + // 关闭插入工具栏
				'      </tab>' + '      <tab idMso="TabHome" visible="false">' + // 关闭开始工具栏
				'      </tab>' + '    </tabs>' + '  </ribbon>' + '</customUI>';
	}

	/**
	 * 接受文档中全部痕迹
	 */
	this.webAcceptAllRevisions = function() {
		_officeEx.WebObject.Application.ActiveDocument.AcceptAllRevisions();
		var mCount = _officeEx.WebObject.Application.ActiveDocument.Revisions.Count;
		if (mCount > 0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 打开的服务器上的文档并修复
	 */
	this.webOpenAndRepair = function() {
		_officeEx.WebRepairMode = true; // 打开修复模式
		_officeEx.WebOpen(); // 重调刚才打开的服务器上的文档
		_officeEx.WebRepairMode = false; // 关闭修复模式
	}

	/**
	 * 打开本机上的文档并修复
	 */
	this.webOpenLocalAndRepair = function() {
		_officeEx.WebRepairMode = true; // 打开修复模式
		_officeEx.WebOpenLocal(); // 打开本机上的文档
		_officeEx.WebRepairMode = false; // 关闭修复模式
	}
	this.GetEditer = function(){
		if(!(_officeEx.WebApplication(".doc") && _officeEx.WebApplication(".docx"))){     //WORD
			CUI.Dialog.alert("不存在打开该文件的应用软件！");
			return false;
		}
		return true;
	}
    
	this.init();

}