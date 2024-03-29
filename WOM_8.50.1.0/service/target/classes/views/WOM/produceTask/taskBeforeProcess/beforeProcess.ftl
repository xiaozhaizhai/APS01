<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1489735212863')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("WOM.produceTask.taskBeforeProcess.beforeProcess");
</script>
<input type="hidden" name="WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName" id="WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="WOM_produceTask_taskBeforeProcess_beforeProcessErrorbar" />
<@frameset id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_container" border=0>
	<@frame id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_container_main"  offsetH=4 region="center" class="center_in">
	<#include "beforeProcess-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_produceTask_beforeProcess,html,WOM_7.5.0.0_produceTask_TaskBeforeProcess,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return WOM.produceTask.taskBeforeProcess.beforeProcess.sendBackbeforeProcess(null,datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method WOM.produceTask.taskBeforeProcess.beforeProcess.query
	 */
	WOM.produceTask.taskBeforeProcess.beforeProcess.query = function(type,pageNo){
		if(!checkListValid("ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm")) {
				return false;
		}
		var node = WOM.produceTask.taskBeforeProcess.beforeProcess.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action";
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_produceTask_beforeProcess";
		condobj.modelAlias="taskBeforeProcess";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].dbColumnType;
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
							fieldObj.operator=">=";
							fieldObj.paramStr="?";
						}else if(fastCol.endsWith('_end')) {
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
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["MainTableName"];
								}
								fieldObj.operator="=includeCustSub#"+tableName;
								fieldObj.paramStr="?";
							}else{
								var exp=CUI(this).attr('exp');
								var caseSensitive=CUI(this).attr('caseSensitive');
								if(exp=="equal"){
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}else if(exp=="unequal"){
									fieldObj.operator="<>";
									fieldObj.paramStr="?";
								}else if(exp=="llike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="?%";
								}else if(exp=="rlike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?";
								}else if(exp=="like"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?%";
								}else{
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}
							}
						}
						fieldObj.value=fastColValue;
						var layrec=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].layRec;
						if(layrec.indexOf("-")>1){
							generateChainCond(condobj,layrec.split("-"),fieldObj);						
						}else{
							condobj.subconds.push(fieldObj);
						}
					}else{
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
					}
				}
			}
		});
		if(type != "adv") {
			dataPost += "&fastQueryCond="+encodeURIComponent(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_produceTask_taskBeforeProcess_beforeProcess_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_produceTask_beforeProcess';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	WOM.produceTask.taskBeforeProcess.beforeProcess._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.produceTask.taskBeforeProcess.beforeProcess._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.produceTask.taskBeforeProcess.beforeProcess._prefix += '.';
			}
			WOM.produceTask.taskBeforeProcess.beforeProcess._prefix += arr[i];
		}
		WOM.produceTask.taskBeforeProcess.beforeProcess._suffix = arr[arr.length -1];
		if(WOM.produceTask.taskBeforeProcess.beforeProcess._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceTask.taskBeforeProcess.beforeProcess._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.produceTask.taskBeforeProcess.beforeProcess._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.produceTask.taskBeforeProcess.beforeProcess.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.produceTask.taskBeforeProcess.beforeProcess.getcallBackInfo = function(obj){
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '.' + WOM.produceTask.taskBeforeProcess.beforeProcess._suffix +'"]').val(obj[0][WOM.produceTask.taskBeforeProcess.beforeProcess._suffix]);
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name^="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '."]').unbind("change");
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '.' + WOM.produceTask.taskBeforeProcess.beforeProcess._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.produceTask.taskBeforeProcess.beforeProcess._dialog) {
			WOM.produceTask.taskBeforeProcess.beforeProcess._dialog.close();
		}
	};
	
	WOM.produceTask.taskBeforeProcess.beforeProcess._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceTask.taskBeforeProcess.beforeProcess.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.taskBeforeProcess.beforeProcess.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.produceTask.taskBeforeProcess.beforeProcess.sendBackbeforeProcess(null,datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.produceTask.taskBeforeProcess.beforeProcess.sendBackbeforeProcess(null,datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method WOM.produceTask.taskBeforeProcess.beforeProcess.sendBackbeforeProcess
	 */
	WOM.produceTask.taskBeforeProcess.beforeProcess.sendBackbeforeProcess = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('WOM.taskBeforeProcess.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() + "(arrObj)");
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
			WOM_produceTask_taskBeforeProcess_beforeProcessErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			WOM_produceTask_taskBeforeProcess_beforeProcessErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
WOM_produceTask_taskBeforeProcess_beforeProcess_refresh = function(node){
	//var url = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.setRequestDataUrl(url,'',false);
	//}
	WOM.produceTask.taskBeforeProcess.beforeProcess.node = node;
	WOM.produceTask.taskBeforeProcess.beforeProcess.query("query");
}

WOM_produceTask_taskBeforeProcess_beforeProcess_getList = function() {
	return "WOM.produceTask.taskBeforeProcess.beforeProcess";
}
WOM.produceTask.taskBeforeProcess.beforeProcess.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method WOM.produceTask.taskBeforeProcess.beforeProcess.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.produceTask.taskBeforeProcess.beforeProcess.showDialog = function(url,formId,title,width,height,viewCode) {
		var buttons = [];
		var otherParams = WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams || {};
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
				handler:function(){list_operate_produceTask_beforeProcess.CUI('#'+formId).submit();}
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
		if ( WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg ) {
			WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg._config.url = url;
			WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg._config.formId = formId;
			WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg.setTitle( title )
			WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg.setButtonbar( buttons );
		}else{
			WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_produceTask_beforeProcess',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.produceTask.taskBeforeProcess.beforeProcess.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_produceTask_taskBeforeProcess', element : $('#WOM_produceTask_taskBeforeProcess_beforeProcess_fileupload_button a:eq(1)')});
		}
		WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams = {};
	};
	WOM.produceTask.taskBeforeProcess.beforeProcess.commonQuery = function(type) {
	  if(typeof WOM.produceTask.taskBeforeProcess.beforeProcess.cancelSelectedNode == 'function') {
	   WOM.produceTask.taskBeforeProcess.beforeProcess.cancelSelectedNode();
	   WOM.produceTask.taskBeforeProcess.beforeProcess.node = null;
	  }
	  if(typeof WOM_produceTask_taskBeforeProcess_beforeProcess_cancelSelectedNode == 'function') {
	   WOM_produceTask_taskBeforeProcess_beforeProcess_cancelSelectedNode();
	   WOM.produceTask.taskBeforeProcess.beforeProcess.node = null;
	  }
	  WOM.produceTask.taskBeforeProcess.beforeProcess.query(type);
	 };
	
	
	
	WOM.produceTask.taskBeforeProcess.beforeProcess.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_produceTask";
		openExportFrame(url);
	}
WOM.produceTask.taskBeforeProcess.beforeProcess.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams = {};
	WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams.dialogType = dialogType;
	WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.produceTask.taskBeforeProcess.beforeProcess.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_produceTask_beforeProcess,js,WOM_7.5.0.0_produceTask_TaskBeforeProcess,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@exportexcel action="/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action"   getRequireDataAction="/WOM/produceTask/taskBeforeProcess/beforeProcess-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_produceTask_TaskBeforeProcess&&viewCode=WOM_7.5.0.0_produceTask_beforeProcess" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_produceTask_beforeProcess')}" prefix="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query" modelCode="WOM_7.5.0.0_produceTask_TaskBeforeProcess"  importFlag="false" viewCode="WOM_7.5.0.0_produceTask_beforeProcess" />
