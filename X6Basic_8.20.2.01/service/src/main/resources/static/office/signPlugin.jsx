/**
 * sign plugin for NTKO
 * @author fangzhibin
 * @since version 2.5
 */
var SignControl = CUI.SignControl = function(config) {
	
	var ie = navigator.userAgent.indexOf("MSIE") != -1;
	var sign_c = false;
	var SIGN_CONTROL_OBJ, _signEx;
	var classid = '3DFFFCF3-D78C-42b8-B5ED-44DC57B6FD4E';
	
	if (typeof config.id == "string") {
		SIGN_CONTROL_OBJ = $("#signControl_" + config.id);
	}
	
	this.init = function(){
		var signEx;
		if(ie) {
			signEx = $('<object id="'+ config.id +'" classid="clsid:' + classid + '" '
					+ 'codebase="'+ config.cabPath +'ntkosigntool.cab#version='+ config.cabVersion +'" width="'+ config.width +'" height="' + config.height + '"> '
					+ '<param name="IsUseUTF8URL" value="-1"> '
					+ '<param name="IsUseUTF8Data" value="-1"> '
					+ '<param name="BackColor" value="16744576"> '
					+ '<param name="ForeColor" value="16777215"> '
					+ '<param name="IsShowStatus" value="-1"> '
					+ '<SPAN STYLE="color:red">${getJsText("js.cui.sign.sec")}</SPAN>'
					+ '</object>');
		} else {
			alert("${getJsText('js.cui.sign.ieonly')}");
		}
		_signEx = signEx[0];
		SIGN_CONTROL_OBJ.append(_signEx);
	}
	
	/**
	 * 生成新印章文件
	 */
	this.createNewSign = function(SignName, SignUser, Password, SignFile) {
		_signEx.CreateNew(SignName, SignUser, Password, SignFile);
	    if (0 != _signEx.StatusCode) {
	        sign_c = false;
	        alert("${getJsText('js.cui.sign.fail')}");
	        return;
	    }
	    sign_c = true;
	    alert("${getJsText('js.cui.sign.success')}");
	}
	
	/**
	 * 对话框方式生成新的印章文件
	 */
	this.createNewWithDialog = function() {
		_signEx.CreateNew();
	    if (0 != _signEx.StatusCode) {
	        sign_c = false;
	        alert("${getJsText('js.cui.sign.fail')}");
	        return;
	    }
	    //正确，显示印章信息
	    sign_c = true;
	    alert("${getJsText('js.cui.sign.success')}");
	}
	
	this.openSignFromLocal = function() {
		_signEx.OpenFromLocal(config.currentUserName, true);
	    sign_c = (0 === _signEx.StatusCode);
	    if (sign_c === false) {
	        alert("${getJsText('js.cui.sign.openFail')}");
	        return;
	    }
	}
	
	this.openSignFromUrl = function(url, password) {
		try {
			_signEx.OpenFromURL(url, password);
		} catch(error){}
	}
	
	this.saveSignToLocal = function(signName) {
		_signEx.SaveToLocal(signName, true);
	    if (0 == _signEx.StatusCode) {
	    	alert("${getJsText('js.cui.sign.saveSuccess')}");
	    } else {
	    	alert("${getJsText('js.cui.sign.saveFail')}");
	    }
	}
	
	this.saveSignToUrl = function(signName, linkId) {
		try {
			var fileName = signName + ".esp";
			var result;
			var myUrl = CUI_CONFIG_URL.officeUpload;
			//FIXME 暂时先移除最后两个参数(form名称："",loading是否显示：false)
			result = _signEx.saveToURL(myUrl,// 提交到的url地址
					"officeFile", "linkId=" + linkId + "&type=" + signName + "&propertyCode=" + config.propertyCode, fileName);
	} catch(error){}
	}
	
	/**
	 * 整合BAP的保存方式，一并提交
	 */
	this.saveSignToUrlNew = function(submitUrl, signName, formId, params) {
		var result;
		try {
			var fileName = signName + ".esp";
			result = _signEx.saveToURL(submitUrl + "?" + params,// 提交到的url地址
					config.id + "Files", config.id + "Files.type=" + signName + "&" + config.id + "Files.propertyCode=" + config.propertyCode + "&" + config.id + "Files.fileType=office", fileName, formId);
		} catch(error){
		}
		return result;
	}
	
	this.getSignHeight = function() {
		return _signEx.SignHeight;
	}
	
	this.getSignWidth = function() {
		return _signEx.SignWidth;
	}
	
	this.getSignName = function() {
		return _signEx.SignName;
	}
	
	this.getSignUser = function() {
		return _signEx.SignUser;
	}
	
	this.getPassword = function() {
		return _signEx.Password;
	}
	
	this.getSignSN = function() {
		return _signEx.SignSN;
	}
	
	this.getSignc = function(){
		  return sign_c;
	 }
	
	this.init();
	
}	