//注册命名空间
CUI.ns("foundation.common");

CUI.createDialog = function( config ){
	var dialog = new CUI.Dialog( config );
	return dialog;
}

/**
 * 公用选择基础资料函数
 * @param pageType 功能类型
 * @param windowStyle 打开样式
 * @param windowName 窗口名称
 * @param multiSelect 是否多选
 * @param closePage 是否关闭
 * @param callBackFuncName 回调函数
 * @param parameters 其他自定义参数，按照URL的格式进行组织，如"a=1&b=3"
 */
foundation.common.callOpenWeb = function(pageType,windowStyle,windowName,multiSelect,closePage,callBackFuncName,parameters,url){
	var o_arr = new Array(
		new Array("department","/foundation/department/common/departmentListFrame.action"),//部门
		new Array("position","/foundation/position/common/positionListFrame.action"),//岗位
		new Array("role","/foundation/role/common/roleListFrame.action"),//角色
		new Array("staff","/foundation/staff/common/staffListFrameset.action"),//人员
		new Array("user","/foundation/user/common/userListFrameset.action"),//用户
		new Array("assignedStaff","/foundation/staff/common/assignStaffFrame.action"),//指定人员
		new Array("assignedPosition","/foundation/position/common/assignPosition.action"),//指定岗位
		new Array("viewList","/ec/entity/view-select.action"),//选择视图
		new Array("flowActiveList","/ec/workflow/flowList.action"),//选择工作流活动
		new Array("group","/foundation/group/common/groupList.action"),//选择工作组
		new Array("script","/scripts/select.action"),//选择脚本
		new Array("menuInfo","/foundation/menuInfo/pageFrame.action"),//管理菜单
		new Array("getInterFrame","/foundation/international/editListFrame.action"),//国际化
		new Array("getReference","/ec/workflow/referenceListFrame.action"),//参照
		new Array("company","/foundation/company/common/companyListFrame.action"),//公司
		new Array("addressBook","/foundation/addressBook/getAddressBook.action"),//通讯录
		new Array("other",url)//其他
		
	);
	var o_params = "";
	if (multiSelect != undefined && String(multiSelect) != "" && multiSelect != null){
		o_params += "&multiSelect=" + multiSelect;
	}
	
	if (closePage != undefined && String(closePage) != "" && closePage != null){
		o_params += "&closePage=" + closePage;
	}
	
	if (callBackFuncName != undefined && String(callBackFuncName) != "" && callBackFuncName != null){
		o_params += "&callBackFuncName=" + callBackFuncName;
	}
	
	if (parameters != undefined && String(parameters) != "" && parameters != null){
		o_params += "&" + parameters;
	}
	
	if (windowStyle == undefined || String(windowStyle) == "" || windowStyle == null){
		windowStyle = "width=800,height=600,scrollbars=yes,resizable=yes,Left=200,top=80,toolbar=no,menubar=no,location=no,status=yes";
	}
	if(o_params != "") o_params = o_params.substring(1);
	if(windowName == null) windowName = "";
	
	for(var i=0;i<o_arr.length;i++){
		if(pageType == o_arr[i][0]){
			var url = o_arr[i][1] + (o_arr[i][1].indexOf('?')==-1?"?":"&") + o_params;
			window.open(url,windowName,windowStyle);
			return false;
		}
	}
}

/**
 * 公用选择基础资料函数(dialog)
 * 
 * settings包含内容:
 * 		pageType 功能类型
 *		width 宽
 *		height 高
 *		multiSelect 是否多选
 *		closePage 是否关闭
 *		callBackFuncName 回调函数
 *		title 标题
 * 		url 当pageType为other时，使用该url
 */
foundation.common.select = function(settings){
	if( window != top && !window.frameElement.getAttribute( 'v3_tab_iframe' ) ){
		settings.callBackFuncName = window.frameElement.getAttribute( 'name' ) + '.' + settings.callBackFuncName
		return parent.foundation.common.select( settings );
	}
	var o_arr = new Array(
		new Array("department","/foundation/department/common/departmentListFrame.action"),//部门
		new Array("position","/foundation/position/common/positionListFrame.action"),//岗位
		new Array("role","/foundation/role/common/roleListFrame.action"),//角色
		new Array("staff","/foundation/staff/common/staffListFrameset.action"),//人员
		new Array("user","/foundation/user/common/userListFrameset.action"),//用户
		new Array("assignedStaff","/foundation/staff/common/assignStaffFrame.action"),//指定人员
		new Array("assignedPosition","/foundation/position/common/assignPosition.action"),//指定岗位
		new Array("viewList","/ec/entity/viewList.action"),//选择视图
		new Array("flowActiveList","/ec/workflow/flowList.action"),//选择工作流活动
		new Array("group","/foundation/group/common/groupList.action"),//选择工作组
		new Array("script","/scripts/select.action"),//选择脚本
		new Array("company","/foundation/company/common/companyListFrame.action"),//公司
		new Array("addressBook","/foundation/addressBook/getAddressBook.action"),//通讯录
		new Array("other",settings.url),//其他
		new Array("staffRange", settings.url),
		new Array("userRange", settings.url)
	);
	
	var o_params = "";
	if (settings.multiSelect != undefined && String(settings.multiSelect) != "" && settings.multiSelect != null){
		o_params += "&multiSelect=" + settings.multiSelect;
	}
	
	if (settings.closePage != undefined && String(settings.closePage) != "" && settings.closePage != null){
		o_params += "&closePage=" + settings.closePage;
	}
	
	if (settings.callBackFuncName != undefined && String(settings.callBackFuncName) != "" && settings.callBackFuncName != null){
		o_params += "&callBackFuncName=" + settings.callBackFuncName;
	}
	if (settings.params != undefined && String(settings.params) != "" && settings.params != null){
		o_params += "&" + settings.params;
	}
	var isFrame = false;
	if (settings.iframe != undefined && settings.iframe != null && settings.iframe != '') {
		isFrame = true;
		o_params += "&openType=frame";
	} else {
		o_params += "&openType=dialog";
	}
	
	if (settings.title == undefined || String(settings.title) == "" || settings.title == null){
		settings.title = "Option";
	}
	
	var nsParam = '';
	var url = '';
	for(var i=0;i<o_arr.length;i++){
		if(settings.pageType == o_arr[i][0]){
			url = o_arr[i][1] + (o_arr[i][1].indexOf('?')==-1?"?":"&") + o_params;
			if(url != null && url != undefined && String(url) != "") {
				if(url.indexOf('.action') != -1) {
					var url_namespace = url.split('.action')[0];
					nsParam = url_namespace.replace(/\//g, '_');
				} else {
					var url_namespace = url.split('?')[0];
					if(url_namespace.indexOf('.') != -1) {
						url_namespace = url_namespace.split('.')[0];
						nsParam = url_namespace.replace(/\//g, '_');
					} else {
						nsParam = url_namespace.replace(/\//g, '_');
					}
				}
			}
		}
	}
	
	var dialogName = settings.dialogName || settings.iframe || '';
	dialogName = dialogName ? dialogName + '_iframe' : '';
	var _dialog = dialogName ? window[ dialogName ] : null;
	//20170323 新增强制关闭dialog判断参数closeAlways
	if ( _dialog && !settings.closeAlways) {
		_dialog._config.url = url;
	}else{
		if( _dialog ){
			_dialog.close();
		}
		_dialog = new CUI.Dialog({
			title: settings.title,
			iframe: settings.iframe,
			closeAlways: settings.closeAlways,
			url: url,
			modal:true,
			afterCloseEvent : function(){
				if(isFrame && navigator.userAgent.indexOf('Firefox') > -1){
					eval("delete " + settings.iframe);
				}
			},
			type:5,
			//width: $(window).width() > 1024 ? 820 : 800,
			//height:$(window).height() > 591 ? 550 : 450,
			buttons:[{	name:"Select",
						handler:function(){
							var self = this;							
							//20161226 bugfree 23927传入对应dialog，防止设置错误按钮对象
							CUI.Dialog.toggleAllButton(self._dialog);
							setTimeout(function(){
								CUI.Dialog.toggleAllButton(self._dialog);/*20161227 bugfree23986清除loading界面以及恢复按钮dialog状态*/
								var retFlag = true;
								if(isFrame){
									retFlag = eval(settings.iframe + '.window.foundation.common.' + nsParam + '__callbackFunction()');
								}else{
									retFlag = eval('foundation.common.' + nsParam + '__callbackFunction()');
								}
								if(retFlag===false) return;
								if(settings.closePage && settings.closePage!='false') {
									if(self && self._dialog)
										self.close();
								}
							}, 300);
						}
					},
					{	name:"Close",
						handler:function(){
							this.close();
							if(isFrame && navigator.userAgent.indexOf('Firefox') > -1){
								eval("delete " + settings.iframe);
							}
						}
					}]
		});
		if ( dialogName ){
			window[ dialogName ] = _dialog;
		}
		
	}
	_dialog.setTitle( settings.title );
	_dialog.show();
	return _dialog;
}
/**
 * 公用执行按钮脚本方法
 * 
 * params包含内容:
 * 		module 模块名称
 *		entity 实体名称
 *		model 模型名称
 *		view 视图名称
 *		button 按钮名称
 *
 *		entityCode 实体code
 *		scriptCode 脚本code
 *
 *		param 参数
 */
foundation.common.executeScript = function(params){
	var retMsg = null;
	if(!params.param) {
		params.param = "";
	}
	if(params.module && params.entity && params.model && params.view && params.button) {
		var url = "/scripts/execute/" + params.module + "/" + params.entity + "/" + params.model + "/" + params.view + "/" + params.button + ".action?" + params.param;
		CUI.ajax({
			url: url,
			type: 'post',
			async: false,
			success: function(msg) {
				retMsg = msg;
			}
		});
	} else if(params.entityCode && params.scriptCode) {
		var url = "/scripts/exec.action?entityCode=" + params.entityCode + "&scriptCode=" + params.scriptCode + "&" + params.param;
		CUI.ajax({
			url: url,
			type: 'post',
			async: false,
			success: function(msg) {
				retMsg = msg;
			}
		});
	}
	return retMsg;
}
/**
 * 公用选择基础资料函数(参照下拉框)
 * 
 * settings包含内容:
 * 		pageType 功能类型
 *		multiSelect 是否多选
 *		callBackFuncName 回调函数
 *		fieldName 显示字段
 * 		url 当pageType为other时，使用该url
 */
foundation.common.createSelectComp = function(settings){
	var o_arr = new Array(
		new Array("department","/foundation/department/common/departmentListFrame.action"),//部门
		new Array("position","/foundation/position/common/positionListFrame.action"),//岗位
		new Array("role","/foundation/role/common/roleListFrame.action"),//角色
		new Array("staff","/foundation/staff/common/staffListFrameset.action"),//人员
		new Array("user","/foundation/user/common/userListFrameset.action"),//用户
		//new Array("assignedStaff","/foundation/staff/common/assignStaffFrame.action"),//指定人员
		//new Array("assignedPosition","/foundation/position/common/assignPosition.action"),//指定岗位
		//new Array("viewList","/ec/entity/viewList.action"),//选择视图
		//new Array("flowActiveList","/ec/workflow/flowList.action"),//选择工作流活动
		//new Array("group","/foundation/group/common/groupList.action"),//选择工作组
		//new Array("script","/scripts/select.action"),//选择脚本
		new Array("other",settings.url)//其他
	);
	var urlMapping = {
			"/foundation/department/common/departmentListFrame.action" : "/foundation/department/common/showDepartmentList.action?page.pageSize=100",
			"/foundation/position/common/positionListFrame.action" : "/foundation/position/common/showPositionList.action?page.pageSize=100",
			"/foundation/role/common/roleListFrame.action" : "/foundation/role/common/showRoleList.action?page.pageSize=100",
			"/foundation/staff/common/staffListFrameset.action" : "/foundation/staff/common/getDepartmentWorkList.action?departmentWorkPage.pageSize=100",
			"/foundation/user/common/userListFrameset.action" : "/foundation/user/common/getDepartmentUserList.action?userPage.pageSize=100"
	}
	var pageUrl = null, dataUrl = null;
	for(var i=0;i<o_arr.length;i++){
		if(settings.pageType == o_arr[i][0]){
			pageUrl = o_arr[i][1];
			break;
		}
	}
	dataUrl = urlMapping[pageUrl];
	if(dataUrl == null) {
		var urlArr = pageUrl.split('.action');
		if(urlArr.length == 2) {
			dataUrl = urlArr[0] + '-query.action?page.pageSize=100' + (urlArr[2]?urlArr[2]:""); 
		}
	}
	if(dataUrl) {
		CUI.ajax({
			url: dataUrl,
			type: 'post',
			async: false,
			success: function(msg) {
				if(msg.result) {
					$.each(msg.result, function(index, item){
						//console.log(item);
					});
				}
			}
		});
	}
}
/**
 * 公用获取数据方法，若当前需要的数据在参照页面返回的对象中已经存在，直接返回，
 * 否则，查询数据再返回
 * object 需要填充数据的范围
 * values 从参照页面返回的数据
 * prefix 前缀
 * sUrl	  获取数据的url
 */
foundation.common.getObject = function(object,values,prefix,sUrl){
	if(values.id == undefined || values.id === '' || values.id == "select") {
		return {"id" : ""};
	}
	var includes = "";
	var retFlag = true;
	if( typeof object =='string') {
		object = CUI('#'+object);
	} else {
		object = CUI(object);
	}
	var currObj;
	CUI('*[name^="'+prefix+'."]', object).each(function(){
		currObj = CUI(this);
		var name = null;
		if(prefix.length!=null && prefix.length > 0) {
			name = currObj.attr('name').substr(prefix.length + 1);
		} else {
			name = currObj.attr('name');
		}
		includes += name + ",";
		// 处理常规的json，如{def:{cc:'xxx'}}
		var value;
		try{value = eval('values.'+name);}catch(e){}
		if(value==null || value==undefined || value=='null') {
			// 处理非常规的json，json里的key包含'.',如{'def.cc':'yyy'}
			try{value = eval('values['+name+']');}catch(e){value='';}
		}
		if(retFlag && (value==null || value==undefined || value=='' || value=='null')) {
			retFlag = false;
		}
	});
	includes = includes.substr(0, includes.length - 1);
	if(!retFlag && sUrl != null) {
		var strArr = sUrl.split('.action');
		sUrl = strArr[0].substr(0, strArr[0].lastIndexOf('/')) + '/get.action' + strArr[1];
		if(sUrl.indexOf("?") > 0) {
			sUrl += "&id=" + values.id;
		} else {
			sUrl += "?id=" + values.id; 
		}
		sUrl += "&includes=" + includes;
		CUI.ajax({
			url: sUrl,
			type: 'post',
			async: false,
			success: function(msg) {
				if(msg && typeof msg == 'object') {
					CUI.each(msg, function(msgKey, msgValue){
						values[msgKey] = msgValue;
					});
				}
				// values = msg;
			}
		});
	}
	if(values.id == -1) {
		values.id = null;
	}
	return values;
}


foundation.common.getObjectIE = function(object,values,prefix,sUrl){
	if(values.id == undefined || values.id === '' || values.id== "Select") {
		return {"id" : ""};
	}
	var includes = "";
	var xmlHead = $(object.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
	for( var i = 0; i < xmlHead.children().length; i++ ){
		var tagName = xmlHead.children()[i].tagName;
		if(tagName.indexOf(prefix) === 0){
			includes += tagName.substring(prefix.length+1) + ",";
		}	
	}
	if (includes) {
		//去掉末尾的逗号
		includes = includes.substr(0, includes.length - 1);
		if(sUrl != null) {
			var strArr = sUrl.split('.action');
			sUrl = strArr[0].substr(0, strArr[0].lastIndexOf('/')) + '/get.action' + strArr[1];
			if(sUrl.indexOf("?") > 0) {
				sUrl += "&id=" + values.id;
			} else {
				sUrl += "?id=" + values.id; 
			}
			sUrl += "&includes=" + includes;
			CUI.ajax({
				url: sUrl,
				type: 'post',
				async: false,
				success: function(msg) {
					CUI.each(msg, function(msgKey, msgValue){
						values[msgKey] = msgValue;
					});
				}
			});
		}
	}
	return values;

}

/**
 * 控件版DataGrid对象类型自定义字段取值函数
 */
foundation.common.getObjectIE_CP_OBJ = function(object,values,prefix,sUrl,objCustomPropNames){
	if(values.id == undefined || values.id === '' || values.id== "Select") {
		return {"id" : ""};
	}
	var existFlag = false;
	var xmlHead = $(object.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
	for( var i = 0; i < xmlHead.children().length; i++ ){
		var tagName = xmlHead.children()[i].tagName;
		if(tagName.indexOf(prefix) === 0){
			existFlag = true;
		}
	}
	if (existFlag && objCustomPropNames) {
		var propNameArr = objCustomPropNames.split(',');
		var showValue = CUI.getValue(propNameArr[0], values);
		var trueValue = CUI.getValue(propNameArr[1], values);
		if (showValue && trueValue) {
			return values;
		}
		if(sUrl != null) {
			var strArr = sUrl.split('.action');
			sUrl = strArr[0].substr(0, strArr[0].lastIndexOf('/')) + '/get.action' + strArr[1];
			if(sUrl.indexOf("?") > 0) {
				sUrl += "&id=" + values.id;
			} else {
				sUrl += "?id=" + values.id; 
			}
			sUrl += "&includes=" + objCustomPropNames;
			CUI.ajax({
				url: sUrl,
				type: 'post',
				async: false,
				success: function(msg) {
					CUI.each(msg, function(msgKey, msgValue){
						values[msgKey] = msgValue;
					});
				}
			});
		}
	}
	return values;

}

// 清楚PT选人、助记码回填的值
CUI.clearCellValue_DG_IE = function(oGrid,nRow,sFieldName,isObjCustomProp){
	var rootKey = sFieldName.split('.')[0];
	var xmlHead = $(oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
	for( var i = 0; i < xmlHead.children().length; i++ ){
		var tagName = xmlHead.children()[i].tagName;
		if( tagName.indexOf(rootKey + '.') == 0 || tagName === sFieldName || (isObjCustomProp == true && rootKey == (tagName + 'MainDisplay')) ){
			oGrid.setCellValue(nRow-1, tagName ,'');	
			oGrid._DT._oGrid.cellSetProperty(nRow,tagName,'_selectValue',''); 
		}
	}
	// 重新设回焦点
	oGrid._DT._oGrid.CellSetFocus(nRow, sFieldName);
	oGrid._DT._oGrid.cellSetProperty(nRow,sFieldName,'clearbtnhasclick', 'true');
}

// 控件PT控制刷子按钮显示
CUI.toggleClearBtn_DG_IE = function(oGrid,nRow,sFieldName){
	// 简单处理，没有点击过刷子按钮的原有数据行显示刷子按钮
	if( oGrid._DT._oGrid.cellGetProperty(nRow,sFieldName,'_selectValue') || (oGrid._DT._oGrid.RowGetProperty(nRow,'isadd') !== "true" && oGrid._DT._oGrid.cellGetProperty(nRow,sFieldName,'clearbtnhasclick') !== 'true') ){
		oGrid._DT._oGrid.cellSetProperty(nRow,sFieldName,'buttonImg','Clear');
	}else{
		oGrid._DT._oGrid.cellSetProperty(nRow,sFieldName,'buttonImg',''); 
	}
}

/**
 * 公用转换时间格式
 * @param workTime 间隔时间（毫秒）
 * @param fixDayTime 一个工作日的时间
 * @returns x天x小时x分
 */
function traTimeFunc(workTime,fixDayTime){//workTime=工作时间，fixDayTime=一个工作日的时间，单位毫秒,,默认8个小时
	
	workTime=workTime/1000;//转为秒
	if(fixDayTime==null || fixDayTime=='' || fixDayTime==undefined){
        fixDayTime=86400;
    }
    var str='';
    var day=0;
    var hours=0;
    if(workTime==null || workTime=='' || workTime==undefined){      //如果不存在工作时间返回
        return '1 Minute';
    }
    if(workTime<60){  //转换的时间小于1个分钟，以1分钟返回
    	return 1+'&nbsp;Minutes&nbsp;';
    }
    day=parseInt((workTime)/fixDayTime,10);
    if(day>0){
    	str+=day+'&nbsp;Days&nbsp;';
    }else{
    	day=0;
    }
    hours=parseInt((workTime-fixDayTime*day)/3600,10);
    if(hours>0){
    	str+=hours+'&nbsp;Hours&nbsp;';
    }else{
    	hours=0;
    }
    mins=parseInt((workTime-fixDayTime*day-hours*3600)/60,10);
    
    if(mins>0){
    	str+=mins+'&nbsp;Minutes&nbsp;';
    }
    
    if(str==''){str='1 Minute';}
    
    return str;
    
  
}



/**
 * 公用有效性验证
 * @author zhaochengyao
 * 验证字符、数字、长度、日期类型的字段 
 *
 *
 *
 */

	function isInteger(thevalue){   
           
        reg=/^[-+]?\d+$/;    
        if(!reg.test(thevalue)){   
             return false;     
        }else{   
        	if(thevalue >= -Math.pow(2,31) && thevalue < Math.pow(2,31)){
        		return true;
        	}else{
        		return false;
        	}
        }   
    }  
	function isLong(thevalue){   
        reg=/^[-+]?\d+$/;    
        if(!reg.test(thevalue)){   
             return false;     
        }else{
        	if(thevalue >= -Math.pow(2,63) && thevalue < Math.pow(2,63)){
        		return true;
        	}else{
        		return false;
        	}
        }   
    }
	
    function isDecimal(thevalue){   
           
    	reg= /^[-+]?\d+\.*\d*$/;
       
        if(!reg.test(thevalue)){   
             return false;     
        }else{   
            return true;
        }   
    }  
    
     function isDate(thevalue){   
        reg=/^(\d{4})(-|\/)(\d{2})\2(\d{2})$/;    
        if(!reg.test(thevalue)){   
             return false;     
        }else{   
            return true;
        }   
       return true;
    }   
     
     function isDateTime(thevalue){   
         reg=/^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\-](?:0[1,3-9]|1[0-2])[\-](?:29|30))(?: (?:0\d|1\d|2[0-3]))?(?:\:(?:0\d|[1-5]\d))?(?:\:(?:0\d|[1-5]\d))?$|^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\-](?:0[1,3,5,7,8]|1[02])[\-]31)(?: (?:0\d|1\d|2[0-3]))?(?:\:(?:0\d|[1-5]\d))?(?:\:(?:0\d|[1-5]\d))?$|^(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])[\-]02[\-]29)(?: (?:0\d|1\d|2[0-3]))?(?:\:(?:0\d|[1-5]\d))?(?:\:(?:0\d|[1-5]\d))?$|^(?:(?:16|[2468][048]|[3579][26])00[\-]02[\-]29)(?: (?:0\d|1\d|2[0-3]))?(?:\:(?:0\d|[1-5]\d))?(?:\:(?:0\d|[1-5]\d))?$|^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\-](?:0[1-9]|1[0-2])[\-](?:0[1-9]|1\d|2[0-8]))(?: (?:0\d|1\d|2[0-3]))?(?:\:(?:0\d|[1-5]\d))?(?:\:(?:0\d|[1-5]\d))?$/;    
         if(!reg.test(thevalue)){   
              return false;     
         }else{   
             return true;
         }   
        return true;
     }  
     
    function checklong(thevalue,checklen){
    	  var iLen = 0;
          var tmpValue = thevalue.replace(/^\s+|\s+$/g,"");
          for(var j=0; j<tmpValue.length; j++){
              iLen += (tmpValue.charCodeAt(j) > 127) ? 3 : 1;
          }
          if(iLen > parseInt(checklen)){
        	  return false;
          }else{   
              return true;
          } 
          return true;
          
    }

    function isValidateIdentifier(thevalue){
    	var validate=/^[a-zA-Z_]{1}[a-zA-Z0-9_\.]+[a-zA-Z0-9_]+$/;
		if(validate.test(thevalue)){
			return true;
		}else{
			return false
		}
    }

    /**
     * 公用有效性验证
     * @author zhaochengyao
     * @param url 打开这个dialog调用的url
     * @param elementId 当前这个dialog中内容对应的div对象
     * @param formData 初始化当前div中的数据
     * @param title
     * @param handler 保存函数调用的方法
     * @param width height
     * @param onload 打开dialog调用的方法
     * @param prefix 根据value和需要填充的值来决定
     * 返回当前创建的dialog对象
     */
    var _thisDialog;
    function showEditDialog(url,elementId, formId,formData,title,handler, prefix, width, height,onload) {
    	// 复制当前初始form内容
    	if(null != formData){
    		CUI.initForm(elementId,'', formData);
    	}
		CUI.post(url, function(res){
			CUI.fillValues(elementId,prefix,res);
			_thisDialog = new CUI.Dialog({
				title: title,
				elementId: elementId,
				formId: formId,
				modal:true,
				width : width ? width : 450,
				height : height ? height : 260,
				errorBar: true,
				onload: onload,
				buttons:[{	name:"Save",
							handler:handler
						},
						{	name:"Cancel",
							handler:function(){this.close()}
						}]
			});
			_thisDialog.show();
		}, "json");
		return _thisDialog;
    };

    /**
	 * @method openFullScreen
	 * @description  打开页面全屏函数
	 * @return {string} 返回的是全屏的style属性
	 * @private
	 */
	var openFullScreen = function(url,height,width){
		var userAgent = window.navigator.userAgent;
		// Firefox 和 chorme 在新页签下打开
		if ( userAgent.indexOf('AppleWebKit') > -1 || userAgent.indexOf('Firefox') > -1 ) {
			window.open(url);
			return;
		}
	
		var window_height = height || window.screen.availHeight;
		var window_width  = width || window.screen.availWidth;
		
		if(window.navigator.userAgent.indexOf('MSIE 8.0') > -1){
			window_height = window_height - 45;
			window_width = window_width - 20;
		} else if(window.navigator.userAgent.indexOf('MSIE 7.0') > -1){
			window_height = window_height - 50;
			window_width = window_width - 15;
		}

		var ShowStyle = "width = " + window_width + ",height=" + window_height + ",scrollbars=yes,resizable =yes,top=0,left=0,toolbar=no,menubar=no,location=no,status=no";
	 	window.open(url,"",ShowStyle);
	 };

	 /**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	var getOperateRecordId = function(obj) {
		var id;
		if(obj.getSelectedNode() != null){
			id = obj.getSelectedNode().id;
		}else{
			id = obj.selectedRows[0].id;
		}
		return id;
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	var checkSelectedAny = function(obj) {
		if(obj.selectedRows.length==0){
			CUI.Dialog.alert("Please choose a record!");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	var checkSelectedMore = function(obj) {
		if(obj.selectedRows.length > 1){
			CUI.Dialog.alert("Please choose one row to modify at a time!");
			return false;
		}
		return true;
	};
	
	String.prototype.endsWith = function(pattern) {
	    var d = this.length - pattern.length;
	    return d >= 0 && this.lastIndexOf(pattern) === d;
	};
	String.prototype.startsWith = function(pattern) {
	    return this.indexOf(pattern) === 0;
	};
	String.prototype.cap_first = function(){
		if(this && this.length > 0) {
			return this.substring(0,1).toUpperCase() + this.substring(1);
		} else {
			return '';
		}
	};
	String.prototype.low_first = function(){
		if(this && this.length > 0) {
			return this.substring(0,1).toLowerCase() + this.substring(1);
		} else {
			return '';
		}
	};
	function getLocalMessage(key){
		var content = null;
		//var content = CUI('body').data('msg_' + key);
		if(content == null || content.length == 0) {
			CUI.ajax({
				url: "/foundation/international/common/getContent.action",
				type: 'post',
				async: false,
				data: {"key" : key},
				success: function(msg) {
					CUI('body').data('msg_' + key, msg);
					content = CUI('body').data('msg_' + key);
				}
			});
		}
		if(content == null || content.length == 0) {
			content = key;
		}
		return content;
	}
	
	/**
	 * 将日期对象格式化为字符串。
	 * @param format 支持以下格式：
	 *         y:  年
	 *         M: 月
	 *         d: 天
	 *         h: 小时
	 *         m: 分
	 *         s: 秒
	 *         S: 毫秒
	 *         q: 季度
	 *         
	 *   @returns 格式化后的日期字符串
	 */
	Date.prototype.format = function(format){
		var o = { 
			"M+" : this.getMonth()+1, //month 
			"d+" : this.getDate(), //day 
			"h+" : this.getHours(), //hour 
			"m+" : this.getMinutes(), //minute 
			"s+" : this.getSeconds(), //second 
			"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
			"S" : this.getMilliseconds() //millisecond 
		} 

		if(/(y+)/.test(format)) { 
			format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
		} 

		for(var k in o) { 
			if(new RegExp("("+ k +")").test(format)) { 
				format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
			}
		}
		if(format.indexOf('NaN-aN-aN') > -1) {
			return this;
		}
		return format;
	}
	function createOverLayer(){
		var mask = $('#load_mask_override')[0];
		if(!mask){
			mask = document.createElement("div");
			mask.id="load_mask_override";
			mask.className = "load_mask";
		}
		mask.style.zIndex = 10000;
		mask.style.display = 'block';
		$('body').append(mask);

		if (YAHOO.env.ua.ie == 6) {
			var overlayFrame = YUD.get('load_iframe_ie');
			if( !overlayFrame ){
				var overlayFrame = document.createElement("iframe");
				overlayFrame.id="load_iframe_ie";
				$('body').appendChild(overlayFrame);
				overlayFrame.className = "load_iframe_ie";
			}
			mask.style.zIndex = 199;
			this._overlayFrame = overlayFrame;
		}
	}

	function closeOverLayer(){
		$('#load_mask_override').remove();
	}

	function praseXmlString(xmlString) {
	   if (document.implementation.createDocument) {
	        var parser = new DOMParser();
	        xmlDoc = parser.parseFromString(xmlString, "application/xml");
	   } else if (window.ActiveXObject) {
	        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	        xmlDoc.async="false";
	        xmlDoc.loadXML(xmlString);
	    }
	 	return xmlDoc; 
	}
	
	function setAutoTextareaValue(id,valString,minHeight,maxHeight){
		document.getElementById(id).value = valString;
		autoTextarea(id,minHeight,maxHeight);
	}	
	
	function autoTextarea(id,minHeight,maxHeight,resize){
		var t = document.getElementById(id);
		if( t.value !== '' && (CUI[id+"completeFlag"] === "first" || CUI[id+"completeFlag"] ==="over") ){
			CUI[id+"completeFlag"] = "not first";
			if(t) {
				if(!minHeight){
					minHeight = parseInt(t.style.height,10) || t.clientHeight;
				}
				h = t.scrollHeight;
				h = h > minHeight ? h : minHeight;
				if(maxHeight){
					h = h > maxHeight ? maxHeight : h;
				}
				t.style.height = h + "px";
				// 500毫秒内只计算一次
				setTimeout(function(){CUI[id+"completeFlag"] = "over";},500);	
			}
			if(resize){
				$('body').trigger('resize');
				$('body').trigger('dialog.resize');
			}
			//setTimeout(function(){CUI[id+"completeFlag"] = "over";},100);		
		}
	}
	
	/**
	 * 按位数分割金额
	 * @param pos 位数
	 * @param decimal 金额
	 */
	function formatMoney(pos,decimal){
		decimal = decimal.replace(/\,/g,"");
		if(decimal!= undefined && decimal!=''){
			if(isDecimal(decimal)){
				var index = decimal.indexOf(".");
				var regax = /(\d{1,3})(?=(\d{3})+(?:$|\.))/g;
				if(pos===4){
					regax = /(\d{1,4})(?=(\d{4})+(?:$|\.))/g;
				}
				if(index===-1){
					return decimal.replace(regax,"$1,");
				}else{
					return decimal.slice(0,index).replace(regax,"$1,").concat(decimal.slice(index));
				}
			}else{
				return decimal;
			}
		}else{
			return decimal;
		}
	}
	
	function isFormChanged(id, datagirdname,fn) { 
		var container = id ? (typeof id == "string" ? $('#'+id) : $(id)) : document.body;
	    var changed = false;     
		$('input[originalvalue][mneType!="mnemonic"],select[originalvalue][selectType!="select"],textarea[originalvalue]', container).each(function(){
			if(!container.is('form') || (container.is('form') && $(this).parents('form').attr('id') == container.attr('id'))){
				var bakValue = this.getAttribute('originalvalue');
				var value;
				switch(this.type.toLowerCase()){
					case 'text': 
					case 'password':  
					case 'select': 
					case 'select-one':
					case 'select-multiple':
						value = this.value;
						break;
					case 'checkbox': 
					case 'radio': 
						value = this.checked ? "true" : "false";   
						break;
					case 'textarea':
						bakValue = bakValue.replace(/\r/g, '');
						value = this.value.replace(/\r/g, '');
						break;
					default:
						value = this.value;
				}
				if($.trim(value) !== $.trim(bakValue)){
					/*console.log(this);
					console.log("value:"+value);
					console.log("bak:"+bakValue);*/
					changed = true;
					return false;
				}
			}
		})
		$('div[multifileType="multifiles"]', container).each(function(){
			if($('input[type="file"]',$(this)).size() > 1) {
				changed = true;
				return false;
			}
		})
		if(container.is('form')){
			if(changed || ( fn && fn() ) || $('#selectedTable tr td[fieldtype="fileName"]',container).text() != "" ){
				return true; 
			}
		}else{
			var dialogId = $(container).parents('div[id^=dialog_]:first').attr('id');
			if(changed || ( fn && fn() ) || $('#selectedTable_' + dialogId + ' tr td[fieldtype="fileName"]',container).text() != "" ){
				return true; 
			}
		}
		
	   	var datagrids = $('body').data(datagirdname);
	   	if('undefined'!=typeof(datagrids)){
	   		for(var i = 0; i < datagrids.length; i++){
	   			var datagrid = datagrids[i];
	   			for(var j = 0; j < datagrid.length; j++){
					var dg = eval(datagrid[j]+"Widget");
	   				if(dg && dg.checkEdited && dg.checkEdited()){
	   					changed = true;
						return true; 
	   				}
	   			}
	   		}
	   	}
	    return changed;      
	}
	/**
	 * 获取附件数量方法
	 * 
	 * params包含内容:
	 * 		element 显示元素
	 * 		type 附件类别
	 *		linkId 业务主键ID
	 */
	foundation.common.uploadFileCount = function(params){
		if(params.linkId && params.linkId != '' && params.linkId > -1) {
			$.ajax({
				type : "POST",
				url : '/foundation/workbench/upload-count.action?linkId=' + (params.linkId ? params.linkId : -1) + '&type=' + params.type,
				success : function(msg){
					try{
						if(msg!=null) {
							var fileCount = parseInt(msg);
							$(params.element).html($(params.element).html() + '<label id="attcount">(' + fileCount + ')</label>');
						}
					} catch(e){}
				}
			});
		}
	}

	/**
	 * 获取附件展现图标
	 * 
	 * params包含内容:
	 * 		type 附件类别
	 * 		fileName 附件名称
	 */
	foundation.common.uploadFileType = function(params){
		var type = 'unknown';
		if(params.type && params.type !== '') {
			type = params.type.toLocaleLowerCase();
		} else if(params.fileName && params.fileName !== '' && params.fileName.indexOf('.') > 0) {
			type = params.fileName.substring(params.fileName.lastIndexOf('.') + 1).toLocaleLowerCase();
		}
		var imgFile = foundation.common.FILE_TYPE_IMAGE['.' + type];
		if(!imgFile) {
			imgFile = "unknown.gif";
		}
		return foundation.common.STATIC_BASE_PATH + imgFile;
	}
	foundation.common.STATIC_BASE_PATH = "/bap/static/foundation/images/icon/";
	//Dialog对话框的类型，dialog.jsx中会根据它构建指定类型的dialog
	foundation.common.DIALOG_TYPE = {
			"1": {width : 415, height : 243 }, //"1": {width : 415 + 8, height : 243 - 33 }, // "1": {width : 375, height : 164},
			"2": {width : 345, height : 282 },//"2": {width : 345 + 8, height : 282 - 33 }, // "2": {width : 280, height : 202},
			"3": {width : 510, height : 455 }, //"3": {width : 510 + 8, height : 455 - 33 }, // "3": {width : 460, height : 330},
			"4": {width : 745, height : 530 }, //"4": {width : 745 + 8, height : 530 - 33 }, // "4": {width : 700, height : 500},
			//"5": {width : 850 + 8, height : 710 - 33 }, // "5": {width : 820, height : 550},
			// 5号需要兼容 1024*768
			"5": {width : 850, height : 530 }, //"5": {width : 800, height : 520 }, // "5": {width : 747, height : 523}, 
			"OTHER": {}
	}
	foundation.common.FILE_TYPE_IMAGE = {
			".jpg": "image.gif",
			".jpeg": "image.gif",
			".gif": "image.gif",
			".bmp": "image.gif",
			".doc": "msword.gif",
			".xls": "msexcel.gif",
			".rar": "archive.gif",
			".zip": "archive.gif",
			".jar": "archive.gif",
			".tar": "archive.gif",
			".ppt": "mspowerpoint.gif",
			".html": "ie.gif",
			".htm": "ie.gif",
			".pdf": "pdf.gif",
			".exe": "system.gif",
			".bat": "system.gif",
			".txt": "text.gif",
			".xml": "xml.gif",
			".unknown": "unknown.gif"
	}
	/**
	 * 打开URL
	 * @param url
	 */
	foundation.common.openExportFrame = function(url) {
		var handle = null;
		var open_url= url;
		var window_height = window.screen.availHeight/3;
		var window_width  = window.screen.availWidth/3;
		ShowStyle = "width = " + window_width + ",height=" + window_height + ",scrollbars=no,resizable =no,top=0,left=0,toolbar=no,menubar=no,location=no,status=no";
		handle = window.open(open_url,"",ShowStyle);
		handle = null;
	}
	/**
	 * 单个附件下载
	 * @param id docId
	 * @param entityCode entityCode
	 */
	foundation.common.downloadSingle = function(id, entityCode){
		var url = "/foundation/workbench/download.action?id=" + id + "&entityCode=" + entityCode;
		foundation.common.openExportFrame(url);
	}
	/**
	 * 显示错误消息
	 */
	foundation.common.showErrorMsg = function(params) {
		if(params && CUI.Dialog && params._errorCode && params._errorCode != 200) {
			switch (params._errorCode) {
			case 403:
				CUI.Dialog.alert('No permission!');
				if(closeLoadPanel) {closeLoadPanel();}
				break;
			case 401:
				showLoginDialog();
				if(closeLoadPanel) {closeLoadPanel();}
				break;
			case 404:
				CUI.Dialog.alert('Page was not found!');
				if(closeLoadPanel) {closeLoadPanel();}
				break;
			case 500:
				//var msg = CUI.parseJSON(XMLHttpRequest.responseText);
				//CUI.showErrorInfos(msg);
				try {
					alert('System connection was interrupted,please wait...');
					if(closeLoadPanel) {closeLoadPanel();}
				} catch (e) {}
				break;
			default:
				CUI.Dialog.alert('System connection was interrupted,please wait...');
				if(closeLoadPanel) {closeLoadPanel();}
				break;
			}
		}
	}
	/*
	 *用于刷新portlet页面及我的流程页面 
	 *
	 */
	foundation.common.portletRefreshListeners = {};
	foundation.common.addPortletRefreshListener = function(portletName, refreshMethod){
		foundation.common.portletRefreshListeners[portletName] = refreshMethod;
	}
	function refreshPortal(event) {
		WorkFlowCallbackRefresh(event);
	}
	function WorkFlowCallbackRefresh(event){
	   		var url;
	   		var div=CUI("div [url^='/ec/workflow/remind/myflow-info.action']")[0];
	   		var workflowOnList=CUI("#myworkflowOnListPage")[0];
	   		var workflowPendingList=CUI("#myworkflowPendingListPage")[0];
	   		var workflowOverList=CUI("#myworkflowOverListPage")[0];
	   		var workflowHandleList=CUI("#myworkflowHandleListPage")[0];
	   		if($('#portlet_main').length == 0){
	   			throw "undefined";
	   		} else {
			  	//刷新主页portlet
			  	if(div!=null && div != undefined){
			  		CUI(".portlet-content",div).load('/ec/workflow/remind/myflow-info.action');
			  	} else {
			  		if(typeof(myworkflowPendingListWidget)!='undefined'){
				   		url="/ec/myWorkflow/workflowPendingList.action";
				   		myworkflowPendingListWidget.setRequestDataUrl(url);
				   	}
				   	if(typeof(myworkflowOnListWidget)!='undefined'){
				   		url="/ec/myWorkflow/workflowOnList.action";
				   		myworkflowOnListWidget.setRequestDataUrl(url);
				   	}
				   if(typeof(myworkflowOverListWidget)!='undefined'){
				   		url="/ec/myWorkflow/workflowOverList.action";
				   		myworkflowOverListWidget.setRequestDataUrl(url);
				   	}
				   	if(typeof(myworkflowHandleListWidget)!='undefined'){
				   		url="/ec/myWorkflow/workflowHandleList.action";
				   		myworkflowHandleListWidget.setRequestDataUrl(url);
				   	}
			  	}
			  	for (var key in foundation.common.portletRefreshListeners) {
			  		if(typeof(foundation.common.portletRefreshListeners[key]) == 'function') {
			   			foundation.common.portletRefreshListeners[key](event);
			   		}
			  	}
			}
	   }
	 
 /*---------------------------
 功能:停止事件冒泡
 ---------------------------*/
function stopBubble(e){
    // 如果提供了事件对象，则这是一个非IE浏览器
    if (e && e.stopPropagation) 
        // 因此它支持W3C的stopPropagation()方法
        e.stopPropagation();
    else 
        // 否则，我们需要使用IE的方式来取消事件冒泡
        window.event.cancelBubble = true;
}

// 阻止浏览器的默认行为
function stopDefault(e){
    // 阻止默认浏览器动作(W3C)
    if (e && e.preventDefault) 
        e.preventDefault();
    // IE中阻止函数器默认动作的方式
    else 
        window.event.returnValue = false;
    return false;
}
/**
 * 创建新iframe
 */
function createUploadIframe(id, uri) {
	// create frame
	var frameId = 'jUploadFrame' + id;
	var iframeHtml = '<iframe id="' + frameId + '" name="' + frameId + '" style="position:absolute; top:-9999px; left:-9999px"';
	if (window.ActiveXObject) {
		if (typeof uri == 'boolean') {
			iframeHtml += ' src="' + 'javascript:false' + '"';
		} else if (typeof uri == 'string') {
			iframeHtml += ' src="' + uri + '"';
		}
	}
	iframeHtml += ' />';
	jQuery(iframeHtml).appendTo(document.body);
	return jQuery('#' + frameId).get(0);
}
/**
 * 创建新form，并把旧form的内容拷贝到新form当中
 */
function createUploadForm(id, oldFormId) {
	var formId = 'jUploadForm' + id;
	var fileId = 'jUploadFile' + id;
	var form = jQuery('<form  action="" method="POST" name="' + formId + '" id="' + formId + '" enctype="multipart/form-data"></form>');

	//set attributes
	jQuery(form).css('position', 'absolute');
	jQuery(form).css('top', '-1200px');
	jQuery(form).css('left', '-1200px');
	jQuery(form).appendTo('body');
	var hiddenField = jQuery('#'+oldFormId).attr('hiddenField');
	jQuery('input[datatableinput!="true"],select,textarea', jQuery('#'+oldFormId)).each(function(i, objElement){
		if($(this).prop("disabled")) {
			return true;
		}
		if($(this).parents('form:first').attr('id')!=oldFormId){
			return true;
		}
		if($(this).parents('td:first').attr('nofieldPermission') == 'true') {
			return true;
		} else {
			if($(this).prop('type').toUpperCase() == 'HIDDEN') {
				var hiddenName = $(this).attr('name');
				if(hiddenName) {
					var propertyType = $(this).prop('property_type');
					if(names !=null && (names.length ==3 && (propertyType == undefined || propertyType == 'SYSTEMCODE' || (propertyType != "SYSTEMCODE" && hiddenField != null && hiddenField != "" && hiddenField.indexOf(hiddenName) > -1)))) {
						var objFlag = false;
						$('input:visible[name^="' + names[0] + '.' + names[1] + '."],select:visible[name^="' + names[0] + '.' + names[1] + '."],textarea:visible[name^="' + names[0] + '.' + names[1] + '."]').each(function(){
							if($(this).parents('td:first').attr('nofieldPermission') == 'true') {
								objFlag = true;
								return true;
							}
						});
						if(objFlag) {
							return true;
						}
					}
				}
			}
		}
		if(CUI(this).prop('type').toUpperCase()=='FILE') {
			var oldElement = jQuery(objElement);
			if(!oldElement.prop("disabled")) {
				var newElement = jQuery(oldElement).clone();
				jQuery(newElement).attr('id', fileId+i);
				jQuery(oldElement).before(newElement);
				jQuery(newElement).hide();
				jQuery(oldElement).appendTo(form);
			}
		} else {
			var objName = CUI(this).attr('name');
			if(objName) {
				var names = objName.split('.');
				var propertyType = $(this).prop('property_type');
				if(names !=null && (names.length <= 2 || (names.length ==3 && (propertyType == undefined || propertyType == 'SYSTEMCODE' || (propertyType != "SYSTEMCODE" && hiddenField != null && hiddenField != "" && hiddenField.indexOf(hiddenName) > -1))))) {
					if(CUI(this).prop('tagName').toUpperCase()=='SELECT') {
						jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
					} else if(CUI(this).prop('tagName').toUpperCase()=='TEXTAREA') {
						jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
					} else if(CUI(this).prop('type').toUpperCase()=='RADIO' || CUI(this).prop('type').toUpperCase()=='CHECKBOX'){
						if(this.checked) {
							jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
						}
					} else {
						jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
					}
				}
			}
		}
	});
	CUI('<input type="hidden" name="__file_upload" value="true" />').appendTo(form);
	return form;
}

/**
 * 创建新form，并把旧form的内容拷贝到新form当中
 */
function cloneForm(id, oldFormId) {
	var formId = 'jUploadForm' + id;
	var fileId = 'jUploadFile' + id;
	var form = jQuery('<form  action="" method="POST" name="' + formId + '" id="' + formId + '" enctype="multipart/form-data"></form>');
	 //set attributes
 	jQuery(form).css('position', 'absolute');
 	jQuery(form).css('top', '-1200px');
 	jQuery(form).css('left', '-1200px');
 	jQuery(form).appendTo('body');

 	jQuery('input[datatableinput!="true"],select,textarea', jQuery('#'+oldFormId)).each(function(i, objElement){
  		if(CUI(this).prop('tagName').toUpperCase()=='SELECT') {
  			jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
 		} else if(CUI(this).prop('tagName').toUpperCase()=='TEXTAREA') {
   			jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
  		} else if(CUI(this).prop('type').toUpperCase()=='RADIO' || CUI(this).prop('type').toUpperCase()=='CHECKBOX'){
   			if(this.checked) {
    			jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
   			}
  		} else {
  			jQuery('<input type="hidden" name="' + CUI(this).attr('name') + '"/>').val(this.value).appendTo(form);
  	}
 	});
 	return form;
}
function validateUploadFrom(formId) {
	var formObj = $('#' + formId);
	// 每次提交时先隐藏报错信息
	try{
		if(formObj.attr('errorBarId')) {
			var errorWidget = eval(formObj.attr('errorBarId') + "Widget");
			errorWidget.close();
		}
	}catch(e){}
	// 清除错误标红
	try{clearErrorLabels();}catch(e){}
	var ecFormFlag;
	if(formObj.attr('ecform') && formObj.attr('ecform') == 'true') {
		ecFormFlag = true;
	} else {
		ecFormFlag = false;
	}
	var retrialFormFlag;
	if(formObj.attr('retrialform') && formObj.attr('retrialform') == 'true') {
		retrialFormFlag = true;
	} else {
		retrialFormFlag = false;
	}
	if(ecFormFlag && $(this).parents('.ewc-dialog-blove').length > 0) {
		// dialog不出进度条
		ecFormFlag = false;
	}
	ecFormFlag = (ecFormFlag || retrialFormFlag);
	
	if(formObj.attr('ecform') && formObj.attr('ecform') == 'true') {
		var id = formId.replace(/[^a-zA-Z0-9_]/g, '_');
		var validateId = "validateForm_" + id;
		if(!eval(validateId)) {
			return false;
		}
	}
	
	formObj.trigger('beforeSubmit');
	if(formObj.attr('onsubmitMethod')) {
		var successFlag = eval(formObj.attr('onsubmitMethod'));
		if(successFlag!=null && !successFlag) {return false;}
	}
	// 前台验证通过之后出进度条
	CUI.Dialog.toggleAllButton(formId,true,ecFormFlag);
	var ecformflag = false;
	if(formObj.attr('ecform') && formObj.attr('ecform') == 'true') {
		ecformflag = true;
	}
	$('input[type="text"]', formObj).each(function(){
		var v=$.trim($(this).val());
		$(this).val(v);
	});

}

function callBackUploadForm(result, formId, callbackInfo) {
	if(result.startsWith("{")) {
		var msg = CUI.parseJSON(result);
		if(msg.dealSuccessFlag != null) {
			window.onbeforeunload = null;
			if(window.containerLoadPanelWidget) {
				setTimeout(function(){closeLoadPanel();}, 500);
			}
			if(callbackInfo) {
				eval(callbackInfo + "(msg)");
			}
		} else {
			var errorMsgs = "";
			CUI.each(msg.items,function(index,item){
				if(index.indexOf('.id') != -1 && index.indexOf('.id')+3 == index.length) {
					$("#" + formId + " *[name^='"+(index.substring(0,index.length -3))+"'][type!='hidden']").each(function(){
						if($(this).parents('td[nullable=false]').length > 0) {
							showErrorField($(this));
						}
					});
				} else {
					var field = CUI("#" + formId + " *[name='"+index+"']");
					if(field.prop('type') && field.prop('type').toUpperCase() == 'HIDDEN' && field.next() && field.next().length > 0) {
						showErrorField(field.next());
					} else {
						showErrorField(field);
					}
				}
				CUI("#" + formId + " *[name='"+index+"']").first().focus();
				for(var i = 0 ; i < item.length ; i++){
					errorMsgs += item[i] + '<br/>';
				}
			});
			CUI.each(msg.actionErrors,function(index,item){
				errorMsgs += item + '<br/>';
			});
			if(msg.exceptionMsg!=null&&msg.exceptionMsg!=""){
				errorMsgs += msg.exceptionMsg + '<br/>';
			}
			var oErrorWidget = null;
			if(CUI("#" + formId).attr("errorBarId")) {
				oErrorWidget = eval(CUI("#" + formId).attr("errorBarId") + "Widget");
			} else {
				oErrorWidget = eval(formId + "DialogErrorBarWidget");
			}
			oErrorWidget.showMessage(errorMsgs);
			if(CUI.Dialog){
				CUI.Dialog.toggleAllButton(formId, true);
			}
		}
	} else {
		if(result) {
		 	var arr1 = result.match('<span[\\s\\S^/]*>.+</span>');
		 	var msg = arr1[0].replace(/<span[^/>]*>/,'').replace('</span>','')
		 	workbenchErrorBarWidget.showMessage(msg, 'f');
		} else {
			status = "error";
		 	workbenchErrorBarWidget.showMessage(e,"f");
		}
		if(CUI.Dialog){
			CUI.Dialog.toggleAllButton(formId, true);
		}
	}
	
}

function copyFileUploadForm(formId, newFormId) {
	var form = CUI("#" + newFormId);
	var allfiles = jQuery('#' + formId + ' input[type="file"]');
	jQuery('input[type="file"]', form).each(function(ind){
		jQuery(allfiles[ind]).before(jQuery(this));
		jQuery(allfiles[ind]).remove();
	});
}
function getDisplayNamesByNamesAndModelCode(names, modelCode) {
	var url = "/ec/property/getDisplayNames.action?propertiesNames=" + names + "&model.code=" + modelCode;
	var retMsg = null;
	$.ajax({
		url: url,
		type: 'post',
		async: false,
		success: function(msg) {
			retMsg = msg;
		}
	});
	return retMsg;
}

foundation.common.getObjectForQuickQuery = function(suffix, id, sUrl){
	var returnValue = "";
	if(sUrl != null) {
		var strArr = sUrl.split('.action');
		sUrl = strArr[0].substr(0, strArr[0].lastIndexOf('/')) + '/get.action' + strArr[1];
		if(sUrl.indexOf("?") > 0) {
			sUrl += "&id=" + id;
		} else {
			sUrl += "?id=" + id; 
		}
		sUrl += "&includes=" + suffix;
		CUI.ajax({
			url: sUrl,
			type: 'post',
			async: false,
			success: function(msg) {
				if(msg && typeof msg == 'object') {
					CUI.each(msg, function(msgKey, msgValue){
						if(msgKey == suffix) {
							returnValue = msgValue;
						}
					});
				}
			}
		});
	}
	return returnValue;
}
