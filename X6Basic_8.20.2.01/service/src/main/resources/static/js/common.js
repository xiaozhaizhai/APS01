//注册命名空间
CUI.ns("foundation.common");

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
		new Array("getReference","/ec/workflow/referenceListFrame.action"),//参照
		new Array("getInterFrame","/foundation/international/editListFrame.action"),//国际化
		new Array("company","/foundation/company/common/companyListFrame.action"),//公司
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
		windowStyle = "width=800,height=600,scrollbars=yes,resizable=yes,toolbar=no,menubar=no,location=no,status=yes";
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
		new Array("other",settings.url)//其他
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
	o_params += "&openType=dialog";
	
	if (settings.title == undefined || String(settings.title) == "" || settings.title == null){
		settings.title = "公选";
	}
	for(var i=0;i<o_arr.length;i++){
		if(settings.pageType == o_arr[i][0]){
			var url = o_arr[i][1] + (o_arr[i][1].indexOf('?')==-1?"?":"&") + o_params;
			var nsParam = '';
			if(url != null && url != undefined && String(url) != "") {
				var url_namespace = url.split('.action')[0];
				nsParam = url_namespace.replace(/\//g, '_');
			}
			var _dialog;
			var title;
			_dialog = new CUI.Dialog({
				title: settings.title,
				url: url,
				modal:true,
				height: settings.height || 489,
				width: settings.width || 876,
				buttons:[{	name:"选择",
							handler:function(){
								try{
									var retFlag = true;
									retFlag = eval('foundation.common.' + nsParam + '__callbackFunction()');
									if(retFlag==false) return;
								}catch(e){}
								if(settings.closePage && settings.closePage!='false') {
									if(this && this._dialog)
										this.close();
								}
							}
						},
						{	name:"关闭",
							handler:function(){this.close()}
						}]
			});
			_dialog.show();
		}
	}
	return _dialog;
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
						console.log(item);
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
	if(!values.id || values.id=='请选择') {
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
		if(prefix.length!=null && prefix.length > 0) {
			includes += currObj.attr('name').substr(prefix.length + 1) + ",";
		} else {
			includes += currObj.attr('name') + ",";
		}
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
				CUI.each(msg, function(msgKey, msgValue){
					values[msgKey] = msgValue;
				});
				// values = msg;
			}
		});
	}
	return values;
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
        return '1分钟';
    }
    if(workTime<60){  //转换的时间小于1个分钟，以1分钟返回
    	return 1+'分钟';
    }
    day=parseInt((workTime)/fixDayTime,10);
    if(day>0){
    	str+=day+'天';
    }else{
    	day=0;
    }
    hours=parseInt((workTime-fixDayTime*day)/3600,10);
    if(hours>0){
    	str+=hours+'小时';
    }else{
    	hours=0;
    }
    mins=parseInt((workTime-fixDayTime*day-hours*3600)/60,10);
    
    if(mins>0){
    	str+=mins+'分钟';
    }
    
    if(str==''){str='1分钟';}
    
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
           
        reg= /^\d+\.*\d*$/;    
       
        if(!reg.test(thevalue)){   
             return false;     
        }else{   
            return true;
        }   
    }  
    
     function isDate(thevalue){   
        reg=/^\d{4}(-|\/)\d{1,2}(-|\/)\d{1,2}$/;    
        if(!reg.test(thevalue)){   
             return false;     
        }else{   
            return true;
        }   
       return true;
    }   
     
     function isDateTime(thevalue){   
         reg=/^\d{4}(-|\/)\d{1,2}(-|\/)\d{1,2} (\d{2})(:|\/)(\d{2})(:|\/)(\d{2})$/;    
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
				buttons:[{	name:"保存",
							handler:handler
						},
						{	name:"取消",
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
		var window_height = height || window.screen.availHeight;
		var window_width  = width || window.screen.availWidth;
		
		if(window.navigator.userAgent.indexOf('MSIE 8.0') > -1){
			window_height = window_height - 45;
			window_width = window_width - 20;
		} else if(window.navigator.userAgent.indexOf('MSIE 7.0') > -1){
			window_height = window_height - 50;
			window_width = window_width - 15;
		} else if(window.navigator.userAgent.indexOf('AppleWebKit') > -1){
			window_height = window_height - 70;
			window_width = window_width - 20;
		} else if(window.navigator.userAgent.indexOf('Firefox') > -1){
			window_height = window_height - 70;
			window_width = window_width - 20;
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
			CUI.Dialog.alert("请选择需要操作的记录！");
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
			CUI.Dialog.alert("不能对多行进行操作！");
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
	String.prototype.urlAddParam = function(param) {
		if(param == null || param.length == 0) {
			return this;
		}
		//2017.1.9 this is readonly pointer which can not be left-hand opeartor.
		var mark = '';
		var lastStr = this[this.length-1];
		if(this.indexOf('?') == -1) {//question mark
			mark = "?";
		} else if ( lastStr!=='&' && lastStr !=='?') {//no question mark
	      mark = '&';
	    }
	    return (this + mark + param);
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
	
	function autoTextarea(id,minHeight,maxHeight){
		if(CUI[id+"completeFlag"] === "first" || CUI[id+"completeFlag"] ==="over"){
			CUI[id+"completeFlag"] = "not first";
			var t = document.getElementById(id);
			if(!minHeight){
				minHeight = parseInt(t.style.height,10) || t.clientHeight;
			}
			h = t.scrollHeight;
			h = h > minHeight ? h : minHeight;
			if(maxHeight){
				h = h > maxHeight ? maxHeight : h;
			}
			t.style.height = h + "px";
			CUI[id+"completeFlag"] = "over";
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
	/*
	 *用于刷新portlet页面及我的流程页面 
	 *
	 */
	 function WorkFlowCallbackRefresh(){
	   		var url;
	   		var div=CUI("div [url^='/ec/workflow/remind/myflow-info.action']")[0];
	   		var workflowOnList=CUI("#myworkflowOnListPage")[0];
	   		var workflowPendingList=CUI("#myworkflowPendingListPage")[0];
	   		if(workflowOnList== undefined && workflowPendingList== undefined && div == undefined){
	   			throw "undefined";
	   		}
	   		if(workflowOnList!= undefined ||workflowPendingList!= undefined){
			   	if(typeof(myworkflowPendingListWidget)!='undefined'){
			   		url="/ec/myWorkflow/workflowPendingList.action";
			   		myworkflowPendingListWidget.setRequestDataUrl(url);
			   	}
			   	if(typeof(myworkflowOnListWidget)!='undefined'){
			   		url="/ec/myWorkflow/workflowOnList.action";
			   		myworkflowOnListWidget.setRequestDataUrl(url);
			   	}
			 }
	  	//刷新主页portlet
	  	if(div!=null && div != undefined){
	  		CUI(".portlet-content",div).load('/ec/workflow/remind/myflow-info.action');
	  	}
	   }