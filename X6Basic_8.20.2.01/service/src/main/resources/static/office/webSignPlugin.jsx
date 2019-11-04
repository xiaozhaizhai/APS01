/**
 * sign plugin for GoldGrid
 * 
 * @author fangzhibin
 * @since version 2.7
 */
var WebSignControl = CUI.WebSignControl = function(config) {

	var ie = navigator.userAgent.indexOf("MSIE") != -1;
	var SIGN_CONTROL_OBJ, _signEx;
	var classid = '79F9A6F8-7DBE-4098-A040-E6E0C3CF2001';

	if (typeof config.id == "string") {
		SIGN_CONTROL_OBJ = $("#signControl_" + config.id);
	}

	/*
	 * CreateSignature参数值列表
	 */
	var stSign = 0x00000001; // 电子签章
	var stHand = 0x00000002; // 手写签名
	var stGroup = 0x00000003; // 批量验证
	var stBarCode = 0x00000005; // 二维条码
	var Comments = 1; // 锁定批注
	var FormFields = 2; // 锁定窗体
	/*
	 * SelectionState返回值列表
	 */
	var ssFailed = -1; // 未知状态
	var ssSucceeded = 0x0000; // 成功
	var ssNoInstall = 0x0001; // 电脑未正确安装电子签章软件！
	var ssNoActiveDocument = 0x0002; // 不存在活动的文档或者未设置ActiveDocument！
	var ssDocumentLocked = 0x0003; // 文档已经锁定
	var ssDocumentInObject = 0x0004; // 光标置于对象之上，请处于编辑状态
	var ssDocumentInHFooter = 0x0005; // 光标在页眉面脚上，不能签章。
	var ssDocumentInTextbox = 0x0006; // 光标不能在文档框内签章
	var ssDocumentInEdit = 0x0007; // EXCEL不能在编译模式下进行签章。

	this.init = function() {
		var signEx;
		if (ie) {
			signEx = $('<object id="'
					+ config.id
					+ '" classid="clsid:'
					+ classid
					+ '" '
					+ 'codebase="'+ config.cabPath +'iSignatureAPI.ocx#version='+ config.cabVersion +'" width="'
					+ config.width
					+ '" height="'
					+ config.height
					+ '"> '
					+ '<SPAN STYLE="color:red">${getJsText("js.cui.sign.sec")}</SPAN>'
					+ '</object>');
		} else {
			//alert("${getJsText('js.cui.sign.ieonly')}");
		}
		_signEx = signEx[0];
		SIGN_CONTROL_OBJ.append(_signEx);
	}

	this.getSignatureObject = function() {
		return _signEx;
	}

	this.getOfficeVar = function() {
		if (eval(config.id + "_WebOfficeControl")) {
			return eval(config.id + "_WebOfficeControl");
		} else {
			alert("this is no office plugin");
		}
	}
	
	this.getPdfVar = function() {
		if (eval(config.id + "_WebPdfControl")) {
			return eval(config.id + "_WebPdfControl");
		} else {
			alert("this is no pdf plugin");
		}
	}

	/**
	 * 检测客户端是否安装电子签章
	 */
	this.signatureInstalled = function() {
		var b = _signEx.SignatureInstalled(); // 检测电子签章是否安装在本机上。
		if (b) {
			// alert("iSignature installed");
			return true;
		} else {
			// alert("iSignature not installed");
			return false;
		}
	}

	/**
	 * 设置文档编号及文档名称
	 */
	this.webSetDocumentID = function(documentId, documentName) {
		if (this.getOfficeVar()) {
			var officeControl = this.getOfficeVar();
			officeControl.getOfficeObject().WebObject.Application.ActiveDocument.Variables
					.Item("DocumentID").Value = documentId; // 定义文档编号
			officeControl.getOfficeObject().WebObject.Application.ActiveDocument.Variables
					.Item("DocumentName").Value = documentName; // 定义文档编号
		}
	}

	/**
	 * 设置活动文档对象
	 */
	this.setActiveDocument = function() {
		if (this.getOfficeVar()) {
			var officeControl = this.getOfficeVar();
			if (officeControl.getOfficeObject().FileType == ".doc") {
				_signEx.ActiveDocument = officeControl.getOfficeObject().WebObject; // 设置WORD对象
			}
			if (officeControl.getOfficeObject().FileType == ".xls") {
				_signEx.ActiveDocument = officeControl.getOfficeObject().WebObject.Application.ActiveWorkbook.ActiveSheet; // 设置EXCEL对象
			}
		}
	}

	/**
	 * 初始签章数据
	 */
	this.initSignatureItems = function() {
		this.setActiveDocument(); // 设置活动文档
		_signEx.InitSignatureItems(); // 当签章数据发生变化时，请重新执行该方法
	}

	/**
	 * 创建电子签章
	 */
	this.createSignature = function(id) {
		this.setActiveDocument(); // 设置活动文档
		if (id == 0) {
			// 当前光标状态
			if (_signEx.SelectionState == ssSucceeded) {
				_signEx.CreateSignature(stSign); // 建立电子签章
			}
		}
		if (id == 1) {
			if (_signEx.SelectionState == ssSucceeded) {
				_signEx.CreateSignature(stHand); // 建立手写签名
			}
		}
		if (id == 2) {
			_signEx.DoAction(3, ""); // 建立批量验证
		}
		if (id == 3) {
			_signEx.DoAction(4, ""); // 建立参数设置
		}
		if (id == 5) {
			if (_signEx.SelectionState == ssSucceeded) {
				_signEx.CreateSignature(stBarCode); // 建立二维条码
			}
		}
	}

	/**
	 * 获取状态返回值
	 */
	this.getSelectionState = function() {
		return _signEx.SelectionState;
	}

	/**
	 * 获取签章数量
	 */
	this.getSignatureCount = function() {
		alert(_signEx.SignatureCount); // 调用InitSignatureItems后有效，获取签章数量
	}

	/**
	 * 脱密文档中签章
	 */
	this.shedCryto = function() {
		this.setActiveDocument(); // 设置活动文档
		if (ssSucceeded == _signEx.ShedCryptoDocument()) {
			alert("成功");
		} else {
			alert("失败");
		}
	}

	/**
	 * 文档锁定
	 */
	this.lockDocument = function() {
		if (_signEx.LockDocument(Comments)) {
			alert("锁定成功");
		} else {
			alert("锁定失败");
		}
	}

	/**
	 * 文档解锁
	 */
	this.unLockDocument = function() {
		if (_signEx.UnLockDocument()) {
			alert("解锁成功");
		} else {
			alert("解锁失败");
		}
	}

	/**
	 * 查询文档是否存在无效签章
	 */
	this.hasError = function() {
		if (_signEx.HasErrorSignature()) {
			alert("存在无效签章");
		} else {
			alert("不存在无效签章");
		}
	}

	/**
	 * 禁止或者激活文档内签章移动
	 */
	this.enabledSignaturesMove = function(value) {
		if ("0" == value) {
			_signEx.EnabledSignaturesMove(true);
		} else {
			_signEx.EnabledSignaturesMove(false);
		}
	}

	/**
	 * 向电子签章系统增加批注内容
	 */
	this.createComment = function(comment) {
		var mResult = _signEx.CreateComment(comment);
		if (mResult) {
			alert("增加批注文字内容成功");
			alert(_signEx.ReadComment());
		} else {
			alert("增加批注文字内容失败，请先执行删除批注方法DeleteComment()");
		}
	}

	/**
	 * 删除批注内容
	 */
	this.deleteComment = function() {
		_signEx.DeleteComment();
	}

	/**
	 * 获取批注内容
	 */
	this.readComment = function() {
		var comment = _signEx.ReadComment();
		alert(_signEx.ReadComment());
		return comment;
	}

	/**
	 * 设置签章日期时间格式
	 */
	this.webSetDateTime = function() {
		var mResult = _signEx
				.SetSignatureParam("ShowDateTime", "TRUE",
						" FormatType=\"yyyy-mm-dd\" FontName=\"宋体\" FontSize=\"24\" FontColor=\"0\" ");
		if (mResult) {
			alert("签章日期格式设置成功");
		} else {
			alert("签章日期格式设置失败");
		}
	}

	/**
	 * 设置签章参数[工具栏] paramName AddinCommandBar paramValue true 显示签章工具栏 paramName
	 * AddinCommandBar paramValue false 隐藏签章工具栏
	 */
	this.setSignatureParamBar = function(paramName, paramValue) {
		if (_signEx.SetSignatureParam(paramName, paramValue)) {
			return true;
		} else {
			alert("电子签章工具栏设置失败");
			return false;
		}
	}

	/**
	 * 设置签章参数 paramName ProtectDocument 保护文档内容 paramName AutoDigital paramValue
	 * true 自动数字签名 paramName AutoDigital paramValue false 手动数字签名 paramName
	 * EnabledMove paramValue true 自动禁止移动 paramName EnabledMove paramValue false
	 * 手动禁止移动
	 */
	this.setSignatureParam = function(paramName, paramValue) {
		if (_signEx.SetSignatureParam(paramName, paramValue)) {
			alert("参数设置成功");
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 获取本地打印机名称列表
	 */
	this.webLocalPrinterNameList = function() {
		return _signEx.LocalPrinterNameList;
	}

	/**
	 * 获取本地打印机驱动列表
	 */
	this.webLocalPrinterDriverList = function() {
		_signEx.GetLocalPrinterInfo(); // 获取本地打印机信息
		alert(_signEx.LocalPrinterDriverList);
	}

	/**
	 * 获取网卡物理地址 0为第一个启用的网卡
	 */
	this.webGetLocalAdapterMac = function(id) {
		return _signEx.GetLocalAdapterMac(id);
	}

	/**
	 * 将文档保存到本地，但没有印章
	 */
	this.saveLocalNoSign = function() {
		this.setActiveDocument();
		if (ssSucceeded == _signEx.SaveToFileNoSignature()) {
			alert("成功");
		} else {
			alert("失败");
		}
	}

	/**
	 * 判断是否设置打印份数
	 */
	this.getPrintSelect = function() {
		this.setActiveDocument();
		if (_signEx.GetPrintSelect()) {
			alert("设置了打印份数");
		} else {
			alert("没有设置了打印份数");
		}
	}

	/**
	 * 设置公共参数
	 */
	this.webSetPublicParam = function(paramName, paramValue) {
		if (_signEx.SetPublicParam(paramName, paramValue)) {
			alert("公共参数设置成功");
		} else {
			alert("公共参数设置失败");
		}
	}

	/**
	 * 对文档中签章进行刷新（WORD生效）
	 */
	this.webRefreshSignature = function() {
		if (this.getOfficeVar()) {
			var officeControl = this.getOfficeVar();
			if (officeControl.getOfficeObject.FileType == ".doc") {
				this.setActiveDocument(); // 设置活动文档
				if (ssSucceeded == _signEx.RefreshSignature()) {
					alert("成功");
				} else {
					alert("失败");
				}
			}
		}
	}

	/**
	 * 脱密签章并撤保护
	 */
	this.webResetShedCryptProtectState = function() {
		this.setActiveDocument(); // 设置活动文档
		_signEx.ShedCryptoDocument(); // 脱密文档签章
		if (ssSucceeded == _signEx.ResetShedCryptProtectState()) {
			alert("成功");
		} else {
			alert("失败");
		}
	}

	/**
	 * 获取文档HASH值
	 */
	this.getDocumentHash = function() {
		this.setActiveDocument(); // 设置活动文档
		var hash = _signEx.GetDocumentHash();
		_signEx.ReleaseActiveDocument();
		return hash;
	}

	/**
	 * 设置常用语
	 */
	this.webSetUsually = function(value) {
		var mResult = _signEx.SetSignatureParam("USUALLYS", "<Usually>" + value
				+ "</Usually>");
		if (mResult) {
			alert("设置成功");
		} else {
			alert("设置失败");
		}
	}

	this.init();

}