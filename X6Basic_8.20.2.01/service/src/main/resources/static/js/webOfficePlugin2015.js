/**
 * office plugin for GoldGrid
 *
 * @author fangzhibin
 * @since version 2.7
 */
var WebOfficeControl = CUI.WebOfficeControl = function(config) {
	var Sys = {};
	var str;
	var SignatureAPI;
	var _SignatureAPI;
	var ua = navigator.userAgent.toLowerCase();
	var s;
	(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
	(s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
	(s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
	(s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
	(s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
	var OFFICE_CONTROL_OBJ, _officeEx;
    var classid = "D89F482C-5045-4DB5-8C53-D2C9EE71D025";
	var copyright ="中核建中核燃料元件有限公司[专用];V5.0S0xGAAEAAAAAAAAAEAAAAIIBAACQAQAALAAAADiOQKuXVY5OGPe1aKjoGSbZWkYJrQ37qCroBnWUYJEJITtPNPM6eDr5GV7+rQIw3iaJcFL3X2HtFqZM+yDZsv/4fyv3tX0CgdHXFvpwg66WZAU/AL5/ceMTeWjdYLclUnP6fPIs154xxEhXhc+UUuw4mxjjV3+LohSxt0uFtLK4CuSqUyEb7E8hbDAl3TLunbjl15y857bbAbrUY1I0glCgCkdYfz6Su6qqjvcBQbMmsosk10aRfc3fPLMdoYLN6TPjAoKbN3x7IAE6twp+fB6P6FdZD3xfDj3iafadEp1BcnpMSZLAYH3+28UrSQmjTkIJYePR64HmRUyG/w4vcaahgBG8mK/aRPIyxozSFCsiK+P3bTKho9jtlsrMVA6LtDEqtAwS41D3j502IvIYqTBDXSx+a9GGmXcDckKqbHqCkjWq1GdsPNr20P+1JZxrhanHI1j7ntLaEGuZvIuFbTYFPPJkD/buFT44uuQokzBQr668DkpTishXpz1Fmupz/WEZ4ADVxGMD8ZzJ/f/+7Yq0jlObZoLiWSvf+XM74/vV"
	if (typeof config.id == "string") {
		OFFICE_CONTROL_OBJ = $("#officeControl_" + config.id);
	}
		/*
	CreateSignature参数值列表
	*/
	var stSign = 0x00000001;     //电子签章
	var stHand = 0x00000002;     //手写签名
	var stGroup = 0x00000003;    //批量验证
	var stBarCode = 0x00000005;  //二维条码
	var Comments = 1;            //锁定批注
	var FormFields = 2;          //锁定窗体
	/*
	SelectionState返回值列表
	*/
	var  ssFailed            = -1;        //未知状态
	var  ssSucceeded         = 0x0000;     //成功
	var  ssNoInstall         = 0x0001;     //电脑未正确安装电子签章软件！
	var  ssNoActiveDocument  = 0x0002;     //不存在活动的文档或者未设置ActiveDocument！
	var  ssDocumentLocked    = 0x0003;     //文档已经锁定
	var  ssDocumentInObject  = 0x0004;     //光标置于对象之上，请处于编辑状态
	var  ssDocumentInHFooter = 0x0005;     //光标在页眉面脚上，不能签章。
	var  ssDocumentInTextbox = 0x0006;     //光标不能在文档框内签章
	var  ssDocumentInEdit    = 0x0007;     //EXCEL不能在编译模式下进行签章。
	/**
	 * @method 初始化
	 */
	var officeEx;
	this.init = function() {
		if (Sys.ie) {
		   officeEx = $('<object id="office_' + config.id + '" classid="clsid:' + classid + '" ' + 'codebase="' + config.cabPath + "iWebOffice2015.cab#version=" + "12.4.0.440" + '" width="' + config.width + '" height="' + config.height + '"> ' + '<param name="Copyright" value="' + copyright + '">' + '<SPAN STYLE="color:red">不能装载Office文档控件。请检查浏览器的安全设置。	推荐使用IE8及以上版本。	</SPAN>' + "</object>");
		   str += '<object id="SignatureAPI" width="0" height="0" classid="clsid:79F9A6F8-7DBE-4098-A040-E6E0C3CF2001" codebase=""iSignatureAPI.ocx#version=8,0,0,0">';
		   str += '</object>';
		  SignatureAPI=$(str);
		} else {
			if (Sys.chrome || Sys.firefox || Sys.safari) {
				officeEx = $('<object id="office_' + config.id + '" clsid="{' + classid + '}" ' + 'type="application/kg-activex" align="baseline" border="0" ' + 'width="' + config.width + '" height="' + config.height + '" copyright="' + copyright + '" ' + 'event_OnMenuClick="' + config.id + '_WOC_onMenuClick" ' + 'event_OnToolsClick="' + config.id + '_WOC_onToolsClick" ' + ">" + '<SPAN STYLE="color:red">尚未安装Office Web跨浏览器插件。请点击<a href=\"/bap/struts/office/iWebPlugin.exe\">安装组件</a></SPAN>' + "</object>");
			} else {}
		}  
		_SignatureAPI = SignatureAPI[0]
		_officeEx = officeEx[0];
		OFFICE_CONTROL_OBJ.append(_officeEx);
		this.onCustomMenuCmdEvent();
	};
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
	 * 自定义菜单响应事件注册sxa
	 */
	this.onCustomMenuCmdEvent = function() {
		var sEventName = "OnCommand(wID, bstrCaption, bCancel);";
		var sEventDeal = config.id
				+ "_WebOfficeControl.onMenuClick(wID, bstrCaption, bCancel);";
		this.addOfficeExEvent(_officeEx, sEventName, sEventDeal);
	}
	/**
	 * 自定义菜单响应事件sxa
	 */
	this.onMenuClick = function(wID, bstrCaption, bCancel) {
		switch(wID){
			case 1:
			this.showdialog(0);
			break;
			case 2:
			this.showdialog(1);
			break;
			case 5:
			this.saveDocument();
			break;
			case 6:
			this.showdialog(2);
			break;
			case 7:
			this.officeclose();
			break;
			case 301:
		    this.SignatureInstalled(0);
			break;
			case 303:
			this.showdialog(4);
			break;
			case 304:
			if(config.handSignRefMethod) {
				eval(config.handSignRefMethod);
			} else {
				this.webUsePicToHandSign(config.handSignMark);
			}
			if(eval("typeof(" + config.id + "_customHandSign) != 'undefined'")) {
				eval(config.id + "_customHandSign()");
			}
			break;
			case 305:
			this.WebShow(true);
			break;
			case 306:
			this.WebShow(false);
			break;
			case 307:
			this.webGetRevisions();
			break;
			case 308:
			this.WebAcceptAllRevisions();
			break;
			case 309:
			this.WebInsertVBA();
			break;
			case 310:
			alert("套红");
			break;
			case 311:
			_officeEx.FullSize=false;
			break;
			case 311:
			_officeEx.FullSize=false;
			break;
			case 312:
			this.SignatureInstalled(3);
			break;
		}
    }
	  this.InsertImageByBookMark = function () {
        _officeEx.ActiveDocument.Application.Selection.GoTo(-1, 0, 0, "aa");
        _officeEx.ActiveDocument.Application.Selection.InlineShapes.AddPicture("E:/1.png");
        _officeEx.ActiveDocument.InlineShapes.Item(1).ConvertToShape();   //转为浮动型
        _officeEx.ActiveDocument.Shapes.Item(1).WrapFormat.Type = 5;     //0:四周型  1：紧密型  2：穿越型环绕 3：浮于文字上方 4：上下型环绕 5：衬于文字下方  6：浮于文字上方
        return true;
    }

	/**
	 * 添加自定义菜单sxa
	 */
	this.addMyMenuItems = function() {
		try {
			var custommenu = _officeEx.CustomMenu;
			custommenu.Clear();
			//创建文件菜单的条目
			var menufile = custommenu.CreatePopupMenu();
			custommenu.AppendMenu(menufile, 1, false, "新建(&N)");
			custommenu.AppendMenu(menufile, 2, false, "打开(&O)");
			custommenu.AppendMenu(menufile, 0, false, "-");
			custommenu.AppendMenu(menufile, 5, false, "保存(&C)");
			custommenu.AppendMenu(menufile, 6, false, "另存为(&C)");
			custommenu.AppendMenu(menufile, 7, false, "关闭(&C)");
			//将文件菜单添加到顶级主菜单
			custommenu.Add(menufile, "文件(&F)");
		} catch (err) {
			this.webOfficeAlert(_officeEx.Status);
		} finally {
		}
	}

	/**
	 * 添加自定义按钮sxa
	 */
	this.addMyMenuButtons = function(index, bstrCaption, bstrIcon, bstrToolTip, nStyle) {
		try {
			var customtoolbar =  _officeEx.CustomToolbar;
            customtoolbar.AddToolButton(index,bstrCaption,bstrIcon, bstrToolTip, nStyle);
			} catch (err) {
				this.webOfficeAlert(_officeEx.Status);
		} finally {
		}
	}

	/**
	 * 自定义工具栏按钮是否显示 * 自定义工具栏按钮是否显示
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
	 * 弹出提示对话框sxa
	 */
		this.webOfficeAlert = function(message) {
			if(message) {
			try {
		 this.active(true);
		  alert(message);
			} catch (e) {
				alert(message);
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
		_officeEx.Activate(value);
	}

	/**
	 * 设置showType 0为文档核稿 1为文字批注 2为手写批注
	 */
	this.setShowType = function(type) {
		_officeEx.ShowType = type;
	}

	/**
	 * 使当前编辑区全屏显示sxa
	 */


	this.setFullSize = function() {
		_officeEx.FullSize=true;
	}


	/**
	 * 从全屏状态返回原窗口状态
	 */
	this.setSmallSize = function() {
		_officeEx.FullSize=false;

	}

	/**
	 * 保存打开的文档sxa
	 */
	this.save=function(){
		_officeEx.Save();

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
    ×××××××××××××××××××××××××××××××××××××××××××××××××××
    * 皮肤
    * ×××××××××××××××××××××××××××××××××××××××××××××××××××
    */
    this.Skin = function (typeColor) {//设置边框的演示，使得iWebOffice更好看
        switch (typeColor) {
            case "purple": this.setColor("purple"); _officeEx.Status = ("set pink success"); break;
            case "black": this.setColor("black"); _officeEx.Status = ("set black success"); break;
            case "white": this.setColor("white");_officeEx.Status = ("set black success"); break;
            case "blue": this.setColor("blue"); _officeEx.Status = ("set black success"); break;
            case "yellow": this.setColor("yellow"); _officeEx.Status = ("set black success"); break;
        }

    }
    this.setColor = function (typeColor) {   //设置边框演示
    	var titleBarColor;
        var menuBarStartColor;
        var menuBarButtonStartColor;
        var menuBarButtonEndColor;
        var menuBarButtonFrameColor;
        var CustomToolbarStartColor;
        switch (typeColor) {
            case "purple": titleBarColor = 0xCC99CC; CustomToolbarStartColor = 0xCC99CC;menuBarStartColor = 0xCC99CC; menuBarButtonStartColor = 0xFFFFFF; menuBarButtonEndColor = 0xAD8DAD; menuBarButtonFrameColor = 0x663366; break;
            case "black": titleBarColor = 0x646464; CustomToolbarStartColor = 0x646464;menuBarStartColor = 0xB7B5B4; menuBarButtonStartColor = 0xF2EAF5; menuBarButtonEndColor = 0xF2EAF5; menuBarButtonFrameColor = 0xF2EAF5; break;
            case "white": titleBarColor = 0xC6C1BE; CustomToolbarStartColor = 0xC6C1BE;menuBarStartColor = 0xF5F3F2; menuBarButtonStartColor = 0xF2EAF5; menuBarButtonEndColor = 0xF2EAF5; menuBarButtonFrameColor = 0xF2EAF5; break;
            case "blue": titleBarColor = 0xD5B69F; CustomToolbarStartColor = 0xD5B69F;menuBarStartColor = 0xFCF3EF; menuBarButtonStartColor = 0xF2EAF5; menuBarButtonEndColor = 0xF2EAF5; menuBarButtonFrameColor = 0xF2EAF5; break;
            case "yellow": titleBarColor = 0x00CCFF; CustomToolbarStartColor = 0x00CCFF;menuBarStartColor = 0x6AB9FF; menuBarButtonStartColor = 0xF2EAF5; menuBarButtonEndColor = 0xF2EAF5; menuBarButtonFrameColor = 0xF2EAF5; break;
        }
        var style = _officeEx.Style;
        style.TitleBarColor = titleBarColor;
        style.TitleBarTextColor = 0x000000;
        style.MenuBarStartColor = menuBarStartColor;
        style.MenuBarEndColor = 0xFFFFFF;
        style.MenuBarTextColor = 0x000000;
        style.MenuBarHighlightTextColor = 0x000000;
        style.MenuBarButtonStartColor = menuBarButtonStartColor;
        style.MenuBarButtonEndColor = menuBarButtonEndColor;
        style.MenuBarButtonFrameColor = menuBarButtonFrameColor;
        style.CustomToolbarStartColor=CustomToolbarStartColor;
        style.Invalidate();
    }
    /**
    ×××××××××××××××××××××××××××××××××××××××××××××××××××
    * End 皮肤
    * ×××××××××××××××××××××××××××××××××××××××××××××××××××
    */
	 this.weburl=function(){
		var url=location.href
		var num=url.indexOf("/",10);
		var weburl=url.substring(0,num)+"/office.office"; 
		return weburl;
	}
	/**
	 * 初始化文档
	 */ 
this.loadDoc = function(url, linkId) {
		try {
			_officeEx.FuncExtModule.WebUrl   = "http://192.168.90.99:8080/office.office";
			_officeEx.FuncExtModule.RecordID = (linkId != null) ? linkId: "";
			_officeEx.FuncExtModule.template = "";
			_officeEx.FuncExtModule.FileName = (config.fileName) ? config.fileName:"officeDoc";
		    _officeEx.FuncExtModule.FileType = "." + config.openType;
	        _officeEx.FuncExtModule.UserName = config.currentStaffName;
			_officeEx.Caption="";
			if (config.isCreateNew) {
				this.addMyMenuItems();
			}
			if (config.officePrint) {
				this.addMyMenuButtons(303,"打印文档","D:\\1.png","打印文档",0) ;
			}
			if (config.isHandSign) {
				this.addMyMenuButtons(304,"手写签名","D:\\1.png","手写签名",0) ;
			}
			if (config.showRevision) {
				this.addMyMenuButtons(305,"显示痕迹","D:\\1.png","显示痕迹",0) ;
			}
			if (config.hideRevision) {
				this.addMyMenuButtons(306,"隐藏痕迹","D:\\1.png","隐藏痕迹",0) ;
			}
			if (config.getRevisions) {
				this.addMyMenuButtons(307,"获取痕迹","D:\\1.png","获取痕迹",0) ;
			}
			if (config.acceptRevisions){
				this.addMyMenuButtons(308,"清除痕迹","D:\\1.png","清除痕迹",0) ;
			}
			if (config.downloadDoc) {	//	this.addMyMenuButtons("19", "下载文件", 19);
			this.addMyMenuButtons(309,"下载文件","D:\\1.png","下载文件",0) ;
			}
			if (config.isSign) {
			this.addMyMenuButtons(301,"电子签章","D:\\1.png","电子签章",0);
			this.addMyMenuButtons(312,"签章设置","D:\\1.png","签章设置",0) ;
			}
			this.addMyMenuButtons(310,"套红模板","D:\\1.png","套红模板",0) ;
			this.addMyMenuButtons(311,"返 回","D:\\1.png","返 回",0) ;
			var type;
			if (config.saveTemplate) {
				type = "bapTemplate__";
			} else {
				type = "bapOffice__";
			}
			this.Skin("blue");
			type += config.fileuploadType;
			_officeEx.FuncExtModule.WebSetMsgByName("type", type);
			_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", config.propertyCode);
			_officeEx.FuncExtModule.WebSetMsgByName("entityCode", config.entityCode);
			_officeEx.FuncExtModule.WebSetMsgByName("showType", config.openType);
			_officeEx.FuncExtModule.WebSetMsgByName("editUserName", config.currentUserName);
	        _officeEx.FuncExtModule.WebOpen();
		    _officeEx.FuncExtModule.SetDocument(_officeEx.ActiveDocument);
		    if (config.view != "readonly" && ! config.isReadonly) {
				if (!this.isFirst(linkId)) {
					CUI.Dialog.alert("你所打开的文档的正文已有人在编辑，目前只可以查看！");
					_officeEx.FuncExtModule.EditType = "0,0";
				}
			}
		    if (config.view == "readonly" || config.isReadonly) {
			 _officeEx.FuncExtModule.EditType = "0,0";
			} else {
				if(config.isRevision) {
					if(config.acceptRevisions) {
						_officeEx.FuncExtModule.EditType = "3,1";
					} else {
						_officeEx.FuncExtModule.EditType = "2,1";
					}
				} else{
					_officeEx.FuncExtModule.EditType = "1,1";
				}
			}
		} catch(e) {
			this.webOfficeAlert(_officeEx.FuncExtModule.Status);
		}
	};
	
	/**
	 * 显示对话框有关
	 */
	this.showdialog=function(kwoDialogNew){
	 _officeEx.ShowDialog(kwoDialogNew);
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
		type +=config.fileuploadType;
		_officeEx.FuncExtModule.WebSetMsgByName("type", type);
		_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", config.propertyCode);
		_officeEx.FuncExtModule.WebSetMsgByName("entityCode", config.entityCode);
		_officeEx.FuncExtModule.WebSetMsgByName("showType", config.openType);
		_officeEx.FuncExtModule.WebSetMsgByName("command", "isFirst");
		_officeEx.FuncExtModule.WebSetMsgByName("fileId", (linkId != null) ? linkId : "");
		_officeEx.FuncExtModule.WebSetMsgByName("editUserName", config.currentUserName);
		if( _officeEx.FuncExtModule.WebSendMessage()) {
			var mEditType = _officeEx.FuncExtModule.WebGetMsgByName("editType");
			if(mEditType == '0') {
				return false;
			}
		}
		return true;
	}
	this.updateOpenTime = function(linkId) {
		var type;
		if (config.saveTemplate) {
			type = "bapTemplate__";
		} else {
			type = "bapOffice__";
		}
		type += config.fileuploadType;
		_officeEx.FuncExtModule.WebSetMsgByName("type", type);
		_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", config.propertyCode);
		_officeEx.FuncExtModule.WebSetMsgByName("entityCode", config.entityCode);
		_officeEx.FuncExtModule.WebSetMsgByName("showType", config.openType);
		_officeEx.FuncExtModule.WebSetMsgByName("command", "updateTime");
		_officeEx.FuncExtModule.WebSetMsgByName("fileId", (linkId != null) ? linkId : "");
		_officeEx.FuncExtModule.WebSetMsgByName("editUserName", config.currentUserName);
		_officeEx.FuncExtModule.WebSendMessage();
	}
	/**
	 * 设置文档编辑状态
	 */
	this.setEditType = function(first, second) {

		_officeEx.FuncExtModule.EditType = first + "," + second;
	}
	/**
	 * 打开默认文档
	 */
	this.loadDefaultDoc = function(linkId, type, propertyCode, entityCode) {
		try {
			_officeEx.FuncExtModule.RecordID = (linkId != null) ? linkId : "";
			_officeEx.FuncExtModule.WebSetMsgByName("type", type);
			_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", propertyCode);
			_officeEx.FuncExtModule.WebSetMsgByName("entityCode", entityCode);
			_officeEx.FuncExtModule.WebSetMsgByName("showType", config.openType);
			_officeEx.FuncExtModule.WebSetMsgByName("editUserName", config.currentUserName);
			_officeEx.FuncExtModule.WebOpen(false);
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
				_officeEx.FuncExtModule.Template = linkId;
				var type = "bapTemplate__" + type;
				_officeEx.FuncExtModule.WebSetMsgByName("type", type);
				_officeEx.FuncExtModule.WebSetMsgByName("entityCode", fileEntityCode);
				_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", propertyCode);
				_officeEx.FuncExtModule.WebSetMsgByName("showType", config.openType);
				_officeEx.FuncExtModule.WebLoadTemplate();
			}
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
		}
	}
	/**
	 * 关闭文档sxa
	 */
	 this.officeclose=function(){
		 _officeEx.Close(0);
	 }
	/**
	 * 退出office控件sxa
		 */
	this.unload = function(linkId) {
		try {
			var type;
			if (config.saveTemplate) {
				type = "bapTemplate__";
			} else {
				type = "bapOffice__";
			}
			_SignatureAPI.ReleaseActiveDocument();
			type += config.fileuploadType;
			_officeEx.FuncExtModule.WebSetMsgByName("type",type);
			_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", config.propertyCode);
			_officeEx.FuncExtModule.WebSetMsgByName("entityCode", config.entityCode);
			_officeEx.FuncExtModule.WebSetMsgByName("showType", config.openType);
			_officeEx.FuncExtModule.WebSetMsgByName("command", "closeFirst");
			_officeEx.FuncExtModule.WebSetMsgByName("fileId", (linkId != null) ? linkId: "");
			_officeEx.FuncExtModule.WebSetMsgByName("editUserName", config.currentUserName);
			_officeEx.FuncExtModule.WebSendMessage();
			_officeEx.FuncExtModule.WebClose();
		} catch(e) {
			this.webOfficeAlert(_officeEx.Status);
		}
	};
	/**
	 * 是否显示工具栏
	 */
	this.setShowToolBar = function(value) {
	    _officeEx.Style.ShowToolBars = value;
	}
	/**
	 * 判断控件是否修改过
	 */
	this.getIsModify = function() {
		return   true;
	}
	/**
	 * 打开文档 打开该文档 交互OfficeServer的OPTION="LOADFILE"
	 */
	this.loadDocument = function() {
		_officeEx.FuncExtModule.WebOpen();
	}
	/**
	 * 打开书签管理sxa
	 */
	 this.WebOpenBookmarks= function() {
		_officeEx.FuncExtModule.SetDocument(_officeEx.ActiveDocument);
		_officeEx.FuncExtModule.WebOpenBookmarks();
	}
	/**
	 * 保存文档 设置变量MyDefine1="自定义变量值1"，变量可以设置多个 在WebSave()时，一起提交到后台中
	 * _officeEx.WebSetMsgByName("MyDefine1","自定义变量值1"); 交互OPTION="SAVEFILE"
	 * 注：WebSave()是保存复合格式文件，包括OFFICE内容和手写批注文档；如只保存成OFFICE文档格式，那么就设WebSave(true)
	 */
	this.saveDocument = function() {
		if (  _officeEx.FuncExtModule.WebSaveImage() ) {
			return true;
		} else {
			this.webOfficeAlert(_officeEx.FuncExtModule.Status);
			return false;
		}
	};
	
	this.webGetMsgByName = function(fieldname) {
		var value = _officeEx.FuncExtModule.WebGetMsgByName(fieldname);
		return value;
	};
	this.webSetMsgByName = function(fieldName, fieldValue) {
		var value = _officeEx.FuncExtModule.WebSetMsgByName(fieldName,fieldValue);
		return value;
	};
	this.webClearMessage = function() {
		_officeEx.FuncExtModule.WebClearMessage();
	};
	 //打印预览
    this.PrintPreview = function () {
       _officeEx.PrintPreview();
    }
    //退出打印预览
    this.PrintPreviewExit = function () {
       _officeEx.PrintPreviewExit();
    }
	  /*
    * 获取文档类型
    */
    this.getDocType = function (fileType) {
        if (fileType == ".doc" || fileType == ".docx" || fileType == ".wps") {// word
            return this.DocType.WOED;
        }
        if (fileType == ".xls" || fileType == ".xlsx" || fileType == ".et") {// execl
            return this.DocType.EXECL;
        }
    }
 /*
    * 显示和隐藏痕迹
    * 隐藏痕迹时之前的痕迹不受影响sxa
    */
    this.WebShow = function (blnValue) {
        if (config.openType == 'doc') {
            this.VBAShowRevisions(blnValue);
        }
    }
	  //显示痕迹和隐藏痕迹sxa
    this.VBAShowRevisions = function (mValue) {
    	if(config.openType== "doc"  &&  _officeEx.ActiveDocument.ProtectionType == "-1"){
         _officeEx.ActiveDocument.TrackRevisions = mValue; //显示标记和隐藏标记
         _officeEx.ActiveDocument.ShowRevisions = mValue; //显示痕迹或隐藏
	    return true;
    }else{
		return false;
	}
	}
	 //接受所有痕迹	sxa
    this.WebAcceptAllRevisions = function () {
        try {
           _officeEx.Activate(true);
            _officeEx.ActiveDocument.Revisions.AcceptAll();
            return _officeEx.ActiveDocument.Revisions.Count >= 0 ? true : false;
        } catch (e) {
            return false;
        }
    }
	/**
	 * 获取痕迹sxa
	 */
	this.webGetRevisions = function() {
		 var rev = _officeEx.ActiveDocument.Revisions; // 获取痕迹对象
		var text = "";
		for (i = 1; i <= rev.Count; i++) {
			text = text + "“" + config.currentUserName + "”";
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
			this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 标签管理 交互OPTION="LISTBOOKMARKS"
	 */
	this.webOpenBookMarks = function() {
		try {
			_officeEx.WebOpenBookmarks();
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
			alert('You do not have permission to print this document, please contact the administrator!');
			return false;
		}
		try {
			_officeEx.WebOpenPrint();
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
			this.webOfficeAlert(_officeEx.Status);
		}
	}
	/**
	 * 插入图片
	 */
	this.webOpenPicture = function() {
		try {
			_officeEx.WebOpenPicture();
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
			this.webOfficeAlert(_officeEx.Status);
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
             if (this.webDocIsReadonly()) {
				 this.webProtect(false);
			}
			_officeEx.FuncExtModule.WebSetMsgByName("imgId", imgId);
			_officeEx.FuncExtModule.WebSetMsgByName("type", type);
			_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", propertyCode);
			var bookMark = "bap";
			//方法第二个参数必须要传值，不传就浏览器崩溃
			if(config.handSignMark) {
				bookMark = config.handSignMark;
			}
			//方法第二个参数必须要传值，默认传,反正后台这个数据使用不到，bap能返回正确的文件路径z
			_officeEx.FuncExtModule.SetDocument(_officeEx.ActiveDocument);
			_officeEx.FuncExtModule.WebInsertImage(bookMark, "bap.jpg", true, 3);
		} catch (e) {
			this.webOfficeAlert(_officeEx.FuncExtModule.Status);
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
			this.webOfficeAlert(_officeEx.Status);
		}
	}
	/**
	 * 验证印章 交互的OPTION="LOADSIGNATURE"
	 */
	this.webShowSignature = function() {
		try {
			_officeEx.WebShowSignature();
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
			this.webOfficeAlert(_officeEx.Status);
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
			alert('You do not have permission to download this document, please contact the administrator!');
			return false;
		}
		try {
			if(this.webDocIsReadonly()) {
				this.webProtect(false);
			}
			_officeEx.Save();
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
			this.webOfficeAlert(_officeEx.Status);
		}
	}
	/**
	 * 保存为HTML文档 交互的OPTION="SAVEASHTML"
	 */
	this.webSaveAsHtml = function() {
		try {
			_officeEx.WebSaveAsHtml();
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
		}
	}
	/**
	 * 保存为HTML文档 交互的OPTION="SAVEPDF"sxa
	 */
	this.webSaveAsPdf = function() {
		try {
			return _officeEx.FuncExtModule.WebSavePDF();
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
			this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 关闭或显示工具 参数1表示工具条名称 参数2为false时，表示关闭 （名称均可查找VBA帮助） 参数2为true时，表示显示
	 */
	this.webToolsVisible = function(ToolName, Visible) {
		try {
			_officeEx.WebToolsVisible(ToolName, Visible);
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
			this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 保护与解除 参数1为true表示保护文档 false表示解除保护
	 */
	this.webProtect = function(value, password) {
		try {
			_officeEx.FuncExtModule.WebSetProtect(value, (password == undefined ? "" : password)); // ""表示密码为空
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
		}
	}

	/**
	 * 保护与解除 参数1为true表示保护文档 false表示解除保护
	 */
	this.webDocIsReadonly = function() {
		if(_officeEx.FuncExtModule.EditType == '0,0' ||  _officeEx.FuncExtModule.EditType == '0,1') {
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
			this.webOfficeAlert(_officeEx.Status);
		}
	}

	this.WebInsertVBA=function(){
		//画线
		try{
		var object=_officeEx.ActiveDocument;
		var myl=object.Shapes.AddLine(100,60,305,60);
		var myl1=object.Shapes.AddLine(326,60,520,60);
	   	var myRange=_officeEx.ActiveDocument.Range(0,0);
		myRange.Select();
		var mtext="★";
		_officeEx.ActiveDocument.Application.Selection.Range.InsertAfter (mtext+"\n");
	   	var myRange=_officeEx.ActiveDocument.Paragraphs(1).Range;
	   	myRange.ParagraphFormat.LineSpacingRule =1.5;
	   	myRange.font.ColorIndex=6;
	   	myRange.ParagraphFormat.Alignment=1;
	   	myRange=_officeEx.ActiveDocument.Range(0,0);
		myRange.Select();
		mtext="金格发[２０１２]１５４号";
		_officeEx.ActiveDocument.Application.Selection.Range.InsertAfter (mtext+"\n");
		myRange=_officeEx.ActiveDocument.Paragraphs(1).Range;
		myRange.ParagraphFormat.LineSpacingRule =1.5;
		myRange.ParagraphFormat.Alignment=1;
		myRange.font.ColorIndex=1;
		mtext="金格电子政务文件";
		_officeEx.ActiveDocument.Application.Selection.Range.InsertAfter (mtext+"\n");
		myRange=_officeEx.ActiveDocument.Paragraphs(1).Range;
		myRange.ParagraphFormat.LineSpacingRule =1.5;
		myRange.Font.ColorIndex=6;
		myRange.Font.Name="仿宋_GB2312";
		myRange.font.Bold=true;
		myRange.Font.Size=50;
		myRange.ParagraphFormat.Alignment=1;
		_officeEx.ActiveDocument.PageSetup.LeftMargin=70;
		_officeEx.ActiveDocument.PageSetup.RightMargin=70;
		_officeEx.ActiveDocument.PageSetup.TopMargin=70;
		_officeEx.ActiveDocument.PageSetup.BottomMargin=70;
		}catch(e){
		 alert(e);
		}
	}


		this.showtool=function(){
			_officeEx.FuncExtModule.ShowToolBar=2 ;
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
		_officeEx.FuncExtModule.WebSetMsgByName("COMMAND", "WORDTABLE");
		// 发送到服务器上
		if (_officeEx.FuncExtModule.WebSendMessage()) {
			iColumns = _officeEx.FuncExtModule.WebGetMsgByName("COLUMNS"); // 取得列
			iCells = _officeEx.FuncExtModule.WebGetMsgByName("CELLS"); // 取得行
			iTable = _officeEx.WebObject.Tables.Add(
					_officeEx.WebObject.Application.Selection.Range, iCells,
					iColumns); // 生成表格
			for ( var i = 1; i <= iColumns; i++) {
				for ( var j = 1; j <= iCells; j++) {
					mName = i.toString() + j.toString();
					mText = _officeEx.FuncExtModule.WebGetMsgByName(mName);
					iTable.Columns(i).Cells(j).Range.Text = mText; // 填充单元值
				}
			}
		}
	}
	/**
	 * 获取文档正文sxa
	 */
	this.webGetWordContent = function() {
		try {

			return _officeEx.ActiveDocument.Content.Text;
		} catch (e) {
			this.webOfficeAlert(_officeEx.Status);
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
	this.webUseTemplate = function(template, type, propertyCode,entityCode,bookMarkName) {
		// 判断用户是否选择模板
		if (template == "") {
			return false;
		} else {
			// 清除正文痕迹的目的是为了避免痕迹状态下出现内容异常问题。
			if (  this.WebAcceptAllRevisions()== false) {
				  this.webOfficeAlert("清除正文痕迹失败，套红中止");
				  return false;
			}
			// 保存当前编辑的文档
			this.saveDocument();
			if(!propertyCode){
				propertyCode = "document_1.0_templet_Templet_officePlus";
			}
			if(!entityCode){
				entityCode = "document_1.0_outgoing";
			}
			type = "document_templet_templet";
			var contentPath = _officeEx.FuncExtModule.WebGetMsgByName("officeFilePath");
			if (  entityCode != null && entityCode != undefined
					&& entityCode != "") {
						alert(4);
				var type = "bapTemplate__" + type;
				_officeEx.FuncExtModule.WebSetMsgByName("type", type);
				_officeEx.FuncExtModule.WebSetMsgByName("entityCode", entityCode);
				_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", propertyCode);
				_officeEx.FuncExtModule.WebSetMsgByName("showType", config.openType);
			}
			_officeEx.FuncExtModule.Template = template;
			_officeEx.FuncExtModule.WebSetMsgByName("contentPath", contentPath);
			_officeEx.FuncExtModule.WebSetMsgByName("bookMarkName",
					(bookMarkName != null) ? bookMarkName : "Content");
			_officeEx.FuncExtModule.EditType = "1"; // 控制为不保留痕迹的状态
			// 交互的OPTION="LOADTEMPLATE"
			if (_officeEx.FuncExtModule.WebLoadTemplate()  ) {
				_officeEx.FuncExtModule.SetDocument(_officeEx.ActiveDocument);
				// SetBookmarks("Title","title");
				// 填充公文正文 交互的OPTION="INSERTFILE"
				if ( _officeEx.FuncExtModule.WebInsertFile()) {
                  return true;
				} else {
					alert(6);
					this.webOfficeAlert(_officeEx.FuncExtModule.Status);
					return false;
				}
			} else {
				this.webOfficeAlert(_officeEx.FuncExtModule.Status);
				return false;
			}
		}
	}
	
	
      this.webLoadTemplate=function( type, propertyCode,entityCode,bookMarkName){
		  this.saveDocument();
		   _officeEx.FuncExtModule.WebSetMsgByName("COMMAND","INSERTFILE");
		  	if(!propertyCode){
				propertyCode = "document_1.0_templet_Templet_officePlus";
			}
			if(!entityCode){
				entityCode = "document_1.0_outgoing";
			}
			_officeEx.FuncExtModule.WebSetMsgByName("bookMarkName",
					(bookMarkName != null) ? bookMarkName : "Content");
			type = "document_templet_templet";
			if (entityCode != null && entityCode != undefined && entityCode != "") {
				var type = "bapTemplate__" + type;
				_officeEx.FuncExtModule.WebSetMsgByName("type", type);
				_officeEx.FuncExtModule.WebSetMsgByName("entityCode", entityCode);
				_officeEx.FuncExtModule.WebSetMsgByName("propertyCode", propertyCode);
				_officeEx.FuncExtModule.WebSetMsgByName("showType", 'doc');
			}
			_officeEx.FuncExtModule.Template = "Word公文模板.doc";
			if (_officeEx.FuncExtModule.WebLoadTemplate()) {
				alert(1);
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
			_officeEx.FuncExtModule.WebSetMsgByName("COMMAND", "COPIES");
			// 设置变量OFFICEPRINTS的值，在WebSendMessage()时，一起提交到后台中
			_officeEx.FuncExtModule.WebSetMsgByName("OFFICEPRINTS", mCopies.toString());
			_officeEx.FuncExtModule.WebSendMessage();
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
		_officeEx.FuncExtModule.WebSetMsgByName("COMMAND", "INPORTTEXT");
		if (_officeEx.FuncExtModule.WebSendMessage()) {
			// 取得后台传递的变量CONTENT值
			mText = _officeEx.FuncExtModule.WebGetMsgByName("CONTENT");
			_officeEx.WebObject.Application.Selection.Range.Text = mText;
		}
	}
	/**
	 * 导出Text 交互的OPTION="SENDMESSAGE"
	 */
	this.webExportText = function() {
		var mText = _officeEx.WebObject.Content.Text;
		// 设置变量COMMAND="EXPORTTEXT"，在WebSendMessage()时，一起提交到后台中
		_officeEx.FuncExtModule.WebSetMsgByName("COMMAND", "EXPORTTEXT");
		// 设置变量CONTENT="mText"，在WebSendMessage()时，一起提交到后台中，可用于实现全文检索功能，对WORD的TEXT内容进行检索
		_officeEx.FuncExtModule.WebSetMsgByName("CONTENT", mText);
		_officeEx.FuncExtModule.WebSendMessage();
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
			this.webOfficeAlert(_officeEx.Status);
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
		_officeEx.FuncExtModule.WebSetMsgByName("COMMAND", "SELFINFO");
		// 自定义的一个参数"TESTINFO"，将info变量的信息设置到信息包中，以便传到后台。
		_officeEx.FuncExtModule.WebSetMsgByName("TESTINFO", info);
		if (_officeEx.FuncExtModule.WebSendMessage()) {
			// 如果交互成功，接受服务器端返回的信息。
			info = _officeEx.FuncExtModule.WebGetMsgByName("RETURNINFO");
			return info;
		}
	}
	/**
	 * 判断编辑器
	 */
	this.getEditer = function(fileType) {
		return _officeEx.WebApplication(fileType);
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
	 * 打开的服务器上的文档并修复
	 */
	this.webOpenAndRepair = function() {
		_officeEx.WebRepairMode = true; // 打开修复模式
		_officeEx.WebOpen(); // 重调刚才打开的服务器上的文档
		_officeEx.WebRepairMode = false; // 关闭修复模式
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//作用：设置活动文档对象
	this.SetActiveDocument=function(){
	_SignatureAPI.ActiveDocument = _officeEx.ActiveDocument;
	}
	
	
	this.SignatureInstalled=function(id){
	  var b=_SignatureAPI.SignatureInstalled(); //检测电子签章是否安装在本机上。
	  if(b)
	  {
		this.CreateSignature(id);
	  }
	  else
	  {
		alert("签章软件未安装或未插入密钥");
	  }
   }
   
   
   //作用：设置签章参数[工具栏]
		this.SetSignatureParamBar=function(ParamName,ParamValue)
		{	
		  if(_SignatureAPI.SetSignatureParam(ParamName,ParamValue))
		  {
			alert("电子签章工具栏设置成功\r\n重新刷新页面，在OFFICE工具栏中右键选中iSignature显示出来");
		  }
		  else{
			alert("电子签章工具栏设置失败");
		  }
		}
   this.SetSignatureParam=function(ParamName,ParamValue)
		{
		_SignatureAPI.SetSignatureParam(ParamName,ParamValue);
		
		}
	this.EnabledSignaturesMove=function(boolea){
	    this.SetActiveDocument(); 
	  _SignatureAPI.EnabledSignaturesMove(boolea);		
	}	
		//作用：创建电子签章
	this.CreateSignature=function(id)
		{
		  this.SetActiveDocument();   //设置活动文档	 
		  if(id==0){
			if( _SignatureAPI.SelectionState == ssSucceeded)         //当前光标状态
			{
			  _SignatureAPI.CreateSignature(stSign);	//建立电子签章
			}
		  }
		  if(id==1){
			if(_SignatureAPI.SelectionState == ssSucceeded)
			{
				_SignatureAPI.CreateSignature(stHand);     //建立手写签名
			}
		  }
		  if (id==2){
			 _SignatureAPI.DoAction(3,"");   //建立批量验证
		  }
		  if (id==3){
			   _SignatureAPI.DoAction(4,"");   //建立参数设置
		  }
		  if (id==5){
			if(_SignatureAPI.SelectionState==ssSucceeded)
			{
				_SignatureAPI.CreateSignature(stBarCode);  //建立二维条码
			}
		  }
		}

this.init();

}
