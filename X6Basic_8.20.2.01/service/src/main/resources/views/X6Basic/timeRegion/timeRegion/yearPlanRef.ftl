<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.randon1442368691425')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("X6Basic.timeRegion.timeRegion.yearPlanRef");
</script>
<input type="hidden" name="X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName" id="X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="X6Basic_timeRegion_timeRegion_yearPlanRefErrorbar" />
<@frameset id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_container" border=0>
	<@frame id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "yearPlanRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_yearPlanRef,html,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return X6Basic.timeRegion.timeRegion.yearPlanRef.sendBackyearPlanRef(null,datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method X6Basic.timeRegion.timeRegion.yearPlanRef.query
	 */
	X6Basic.timeRegion.timeRegion.yearPlanRef.query = function(type,pageNo){
		if(!checkListValid("ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm")) {
				return false;
		}
		var node = X6Basic.timeRegion.timeRegion.yearPlanRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action";
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 00:00:00";
								} else if(dateType == 'year') {
									fastColValue += "-01-01 00:00:00";
								} else if(dateType == 'yearMonth') {
									fastColValue += "-01 00:00:00";
								}
							}
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
							}
						}
						var multable = CUI(this).attr('multable');
						if(multable && multable == "yes") {
							dataPost += "&" + fastCol + "=," + encodeURIComponent($.trim(fastColValue)) + ",";
						} else {
							dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
						}
					}
				}	
			}
		});
		var pageSize=CUI('input[name="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_timeRegion_timeRegion_yearPlanRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_timeRegion_yearPlanRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	X6Basic.timeRegion.timeRegion.yearPlanRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.timeRegion.timeRegion.yearPlanRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.timeRegion.timeRegion.yearPlanRef._prefix += '.';
			}
			X6Basic.timeRegion.timeRegion.yearPlanRef._prefix += arr[i];
		}
		X6Basic.timeRegion.timeRegion.yearPlanRef._suffix = arr[arr.length -1];
		if(X6Basic.timeRegion.timeRegion.yearPlanRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegion.yearPlanRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.timeRegion.timeRegion.yearPlanRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.timeRegion.timeRegion.yearPlanRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.timeRegion.timeRegion.yearPlanRef.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '.' + X6Basic.timeRegion.timeRegion.yearPlanRef._suffix +'"]').val(obj[0][X6Basic.timeRegion.timeRegion.yearPlanRef._suffix]);
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name^="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '.' + X6Basic.timeRegion.timeRegion.yearPlanRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.timeRegion.timeRegion.yearPlanRef._dialog) {
			X6Basic.timeRegion.timeRegion.yearPlanRef._dialog.close();
		}
	};
	
	X6Basic.timeRegion.timeRegion.yearPlanRef._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.timeRegion.timeRegion.yearPlanRef.query_"+obj+")!='undefined'") ? eval('X6Basic.timeRegion.timeRegion.yearPlanRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return X6Basic.timeRegion.timeRegion.yearPlanRef.sendBackyearPlanRef(null,datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method X6Basic.timeRegion.timeRegion.yearPlanRef.sendBackyearPlanRef
	 */
	X6Basic.timeRegion.timeRegion.yearPlanRef.sendBackyearPlanRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('X6Basic.timeRegion.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
				var flag = eval("opener." + CUI("#X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName").val() + "(arrObj)");
					<#else>
				var flag = eval("parent." + CUI("#X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName").val() + "(arrObj)");
				</#if>
				if(flag === false){
					return flag;
				}
			}else{
				getDepartmentInfo(arrObj);
			}
			<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'><#if (Parameters.closePage)?default('false') == 'true'>
			setTimeout(function(){
				try {
					top.opener.focus();
					CUI.closeWindow();
				}catch(e){}
			},1000);
			</#if></#if>
			X6Basic_timeRegion_timeRegion_yearPlanRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			X6Basic_timeRegion_timeRegion_yearPlanRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
X6Basic_timeRegion_timeRegion_yearPlanRef_refresh = function(node){
	//var url = "/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.timeRegion.timeRegion.yearPlanRef.node = node;
	X6Basic.timeRegion.timeRegion.yearPlanRef.query("query");
}

X6Basic_timeRegion_timeRegion_yearPlanRef_getList = function() {
	return "X6Basic.timeRegion.timeRegion.yearPlanRef";
}
X6Basic.timeRegion.timeRegion.yearPlanRef.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method X6Basic.timeRegion.timeRegion.yearPlanRef.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.timeRegion.timeRegion.yearPlanRef.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams || {};
		if(otherParams && otherParams.referenceCopyBtn) {
			buttons.push(otherParams.referenceCopyBtn);
		}
		if(otherParams && otherParams.uploadBtn) {
			buttons.push(otherParams.uploadBtn);
		}
		if(otherParams && otherParams.printBtn) {
			buttons.push(otherParams.printBtn);
		}
		if(otherParams && otherParams.printSettingBtn) {
			buttons.push(otherParams.printSettingBtn);
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
		}
		if(otherParams && otherParams.viewShowType == 'VIEW') {
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){list_operate.CUI('#'+formId).submit();}
			});
		}
		if(otherParams && otherParams.viewShowType == 'VIEW') {
			buttons.push({
				name:"${getText('foundation.common.closed')}",
				type:"cancel"
			});
		} else {
			buttons.push({
				name:"${getText('common.button.cancel')}",
				type:"cancel"
			});
		}
		
		if ( url.indexOf( "?" ) != -1 ) {
			url += "&openType=frame";
		} else {
			url += "?openType=frame";
		}	
		if ( X6Basic.timeRegion.timeRegion.yearPlanRef.Dlg ) {
			X6Basic.timeRegion.timeRegion.yearPlanRef.Dlg._config.url = url;
		}else{
			X6Basic.timeRegion.timeRegion.yearPlanRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		X6Basic.timeRegion.timeRegion.yearPlanRef.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_timeRegion_timeRegion', element : $('#X6Basic_timeRegion_timeRegion_yearPlanRef_fileupload_button a:eq(1)')});
		}
		X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams = {};
	};
	X6Basic.timeRegion.timeRegion.yearPlanRef.commonQuery = function(type) {
	  if(typeof X6Basic.timeRegion.timeRegion.yearPlanRef.cancelSelectedNode == 'function') {
	   X6Basic.timeRegion.timeRegion.yearPlanRef.cancelSelectedNode();
	   X6Basic.timeRegion.timeRegion.yearPlanRef.node = null;
	  }
	  if(typeof X6Basic_timeRegion_timeRegion_yearPlanRef_cancelSelectedNode == 'function') {
	   X6Basic_timeRegion_timeRegion_yearPlanRef_cancelSelectedNode();
	   X6Basic.timeRegion.timeRegion.yearPlanRef.node = null;
	  }
	  X6Basic.timeRegion.timeRegion.yearPlanRef.query(type);
	 };
	
	
	
	X6Basic.timeRegion.timeRegion.yearPlanRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_timeRegion";
		openExportFrame(url);
	}
X6Basic.timeRegion.timeRegion.yearPlanRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams = {};
	X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams.dialogType = dialogType;
	X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.timeRegion.timeRegion.yearPlanRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="setyear_start"]').val()!=null && $('#' + formId + ' input[name^="setyear_start"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="setyear_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name^="setyear_end"]').val()!=null && $('#' + formId + ' input[name^="setyear_end"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="setyear_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="setyear_start"]').val()!='' && $('#' + formId + ' input[name="setyear_end"]').val()!=''){if($('#' + formId + ' input[name="setyear_start"]').val() > $('#' + formId + ' input[name="setyear_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.start')}");return false;}}return true;};




	/* CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_yearPlanRef,js,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@exportexcel action="/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_timeRegion_yearPlanRef')}" prefix="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query"/>
