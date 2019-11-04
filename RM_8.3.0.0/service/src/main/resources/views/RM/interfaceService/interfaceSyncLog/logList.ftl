<!-- RM_7.5.0.0/interfaceService/logList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1494999169699')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_interfaceService_logList,head,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">
	.ewc-dialog-el{height:100%;}
	
	#fast_select_elements .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements_bak .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	}
	#fast_select_elements_bak .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	} 
	
</style>  
<script type="text/javascript">
	CUI.ns('RM.interfaceService.interfaceSyncLog','RM.interfaceService.interfaceSyncLog.logList');
</script>
<@frameset id="ec_RM_interfaceService_interfaceSyncLog_logList_container" border=0>
	<@frame id="ec_RM_interfaceService_interfaceSyncLog_logList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "logList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_interfaceService_logList,html,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/RM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/RM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/RM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/RM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/RM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/RM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/RM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/RM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/RM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/RM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/RM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/RM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/RM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/RM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/RM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.interfaceService.interfaceSyncLog.logList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.interfaceService.interfaceSyncLog.logList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.interfaceService.interfaceSyncLog.logList._prefix += '.';
			}
			RM.interfaceService.interfaceSyncLog.logList._prefix += arr[i];
		}
		RM.interfaceService.interfaceSyncLog.logList._suffix = arr[arr.length -1];
		if(RM.interfaceService.interfaceSyncLog.logList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.interfaceService.interfaceSyncLog.logList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.interfaceService.interfaceSyncLog.logList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.interfaceService.interfaceSyncLog.logList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.interfaceService.interfaceSyncLog.logList.getcallBackInfo = function(obj){
		CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+RM.interfaceService.interfaceSyncLog.logList._prefix + '.' + RM.interfaceService.interfaceSyncLog.logList._suffix +'"]').val(obj[0][RM.interfaceService.interfaceSyncLog.logList._suffix]);
		CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+RM.interfaceService.interfaceSyncLog.logList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name^="'+RM.interfaceService.interfaceSyncLog.logList._prefix + '."]').unbind("change");
		CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+RM.interfaceService.interfaceSyncLog.logList._prefix + '.' + RM.interfaceService.interfaceSyncLog.logList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.interfaceService.interfaceSyncLog.logList._dialog) {
			RM.interfaceService.interfaceSyncLog.logList._dialog.close();
		}
	};
	
	RM.interfaceService.interfaceSyncLog.logList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.interfaceService.interfaceSyncLog.logList.query_"+obj+")!='undefined'") ? eval('RM.interfaceService.interfaceSyncLog.logList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
RM_interfaceService_interfaceSyncLog_logList_refresh = function(node){
RM.interfaceService.interfaceSyncLog.logList.node = node;
	//保存树状节点的参数，导出时用
	if(node!=null && node.layRec){
		$("#treeNodeSelected").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){
		$("#treeNodeSelected").removeAttr("value");
	}
	
	if(node!=null && node.layRec){
		$(".nodeInfo").attr("id", node.modelName+".layRec");
		$(".nodeInfo").attr("name", node.modelName+".layRec");
		$(".nodeInfo").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){	
		$(".nodeInfo").removeAttr("id");
		$(".nodeInfo").removeAttr("value");
		$(".nodeInfo").removeAttr("name");
	}
	RM.interfaceService.interfaceSyncLog.logList.query("query");
}

RM_interfaceService_interfaceSyncLog_logList_getList = function() {
	return "RM.interfaceService.interfaceSyncLog.logList";
}
RM.interfaceService.interfaceSyncLog.logList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_interfaceService_interfaceSyncLog_logListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.interfaceService.interfaceSyncLog.logList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.interfaceService.interfaceSyncLog.logList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_interfaceService_interfaceSyncLog_logList_fileupload_button",
		handler:function(){
				list_operate_interfaceService_logList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.interfaceService.interfaceSyncLog.logList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_interfaceService_logList.RM.interfaceService.interfaceSyncLog." + params.viewName + ".referenceCopy");
			funcName('interfaceSyncLog', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.interfaceService.interfaceSyncLog.logList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_interfaceService_logList.RM.interfaceService.interfaceSyncLog." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.interfaceService.interfaceSyncLog.logList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_interfaceService_logList.RM.interfaceService.interfaceSyncLog." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function sync(){ 
							 
							 		
	var arrselect=ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget.selectedRows;
	if(arrselect.length<1){
		workbenchErrorBarWidget.showMessage("${getText('foundation.infoSet.selectRow')}");
		return ;
	}
	var ids='';
	var logids='';
	var logOperate='';
	var logType='';
	var logTypeDes = '' ;
	if(arrselect[0].logSynFlag||arrselect[0].logIsIgnore){
		workbenchErrorBarWidget.showMessage("${getText('RM.interfaceService.notneedsync')}");
		return false;
	}
	logOperate=arrselect[0].logOperate;
	logType=arrselect[0].logType;
	logTypeDes=arrselect[0].logTypeDes;

	//配方和工单的相关id
	arrselect.forEach(function(obj) {
		ids+=obj.logID+",";
		logids+=obj.id+",";
	});

	//sap模块取的id跟配方和工单是反的，单独传一次参
	var sapIds='';
	var sapLogids='';
	arrselect.forEach(function(obj) {
		sapIds+=obj.id+",";
		sapLogids+=obj.logID+",";
	});
	
	if(logType == 'workOrder'){
		CUI.ajax({
			type:"POST",
			url:"/WOM/produceTask/produceTask/sync.action",
			data:{mesid:ids,operationType:logOperate,objectType:logType,logid:logids},          
			success:function(msg){
				if(msg){
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else if(logTypeDes.indexOf("工时报工") != -1){ 
		CUI.ajax({
			type:"POST",
			url:"/WOMTimePag/produceTaskRef/proTaskTime/taskReportingRec.action",
			data:{logId:sapLogids,id:sapIds},          
			success:function(msg){
				if(msg.dealSuccessFlag){
					console.log('suc:' + msg);
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{
					console.log('false:' + msg);
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else if(logTypeDes.indexOf("库存调拨") != -1){
		CUI.ajax({
			type:"POST",
			url:"/WOM/MaterAllot/MaterAllot/saveMaterAllot.action",
			data:{logId:sapLogids,id:sapIds},          
			success:function(msg){
				if(msg.dealSuccessFlag){
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else if(logTypeDes.indexOf("工单投料") != -1){
		CUI.ajax({
			type:"POST",
			url:"/WOM/PutInMaterial/PutInMaterial/savePutInMaterial.action",
			data:{logId:sapLogids,id:sapIds},          
			success:function(msg){
				if(msg.dealSuccessFlag){
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else if(logTypeDes.indexOf("制造检验结果") != -1){
		CUI.ajax({
			type:"POST",
			url:"/qualityMan/ManuCheck/ManuCheck/saveManuCheck.action",
			data:{logId:sapLogids,id:sapIds},          
			success:function(msg){
				if(msg.dealSuccessFlag){
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else if(logTypeDes.indexOf("工单缴库") != -1){ 
		CUI.ajax({
			type:"POST",
			url:"/WOM/TaskPay/TaskPay/saveTaskPay.action",
			data:{logId:sapLogids,id:sapIds},          
			success:function(msg){
				if(msg.dealSuccessFlag){ 
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{ 
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else if(logTypeDes.indexOf("采购检验结果") != -1){ 
		CUI.ajax({
			type:"POST",
			url:"/qualityMan/PurchCheck/PurchCheck/savePurchCheck.action",
			data:{logId:sapLogids,id:sapIds},          
			success:function(msg){
				if(msg.dealSuccessFlag){
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{ 
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else if(logTypeDes.indexOf("产品不良品") != -1){ 
	console.log('enter');
		CUI.ajax({
			type:"POST",
			url:"/qualityMan/ManuDeal/ManuDeal/saveManuDeal.action",
			data:{logId:sapLogids,id:sapIds},          
			success:function(msg){
				if(msg.dealSuccessFlag){
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{ 
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}else{
		CUI.ajax({
			type:"POST",
			url:"/RM/interfaceService/interfaceSyncLog/sync.action",
			data:{mesid:ids,operationType:logOperate,objectType:logType,logid:logids},          
			success:function(msg){
				if(msg){
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
				}else{
					workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
				}
				RM.interfaceService.interfaceSyncLog.logList.commonQuery('query');
			},
			error:function(msg){
				workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
		});
	}

				
				};;
	
	/**
	 * 保存完毕回调
	 * @method RM.interfaceService.interfaceSyncLog.callBackInfo
	 */
	RM.interfaceService.interfaceSyncLog.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_interfaceService_interfaceSyncLog_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.interfaceService.interfaceSyncLog.logList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method RM.interfaceService.interfaceSyncLog.logList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.interfaceService.interfaceSyncLog.logList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.interfaceService.interfaceSyncLog.logList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.interfaceService.interfaceSyncLog.logList.checkSelectedValid = function(type) {
		if(RM.interfaceService.interfaceSyncLog.logList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows[i].valid === false){
						CUI.Dialog.alert("${getText('ec.common.checkvalidfordelete')}");
						return false;
					}
				}
			}
		}else{
			return false;
		}
		return true;
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method RM.interfaceService.interfaceSyncLog.logList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.interfaceService.interfaceSyncLog.logList.checkSelectedAny = function() {
		if(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.interfaceService.interfaceSyncLog.logList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.interfaceService.interfaceSyncLog.logList.checkSelectedMore = function() {
		if(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	RM.interfaceService.interfaceSyncLog.logList.dbClickViewlogList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=RM_7.5.0.0_interfaceService&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method RM.interfaceService.interfaceSyncLog.logList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.interfaceService.interfaceSyncLog.logList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.interfaceService.interfaceSyncLog.logList.otherParams || {};
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
				handler:function(){
					list_operate_interfaceService_logList.CUI('#'+formId).submit();
				}
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
		if ( RM.interfaceService.interfaceSyncLog.logList.Dlg ) {
			RM.interfaceService.interfaceSyncLog.logList.Dlg._config.url = url;
			RM.interfaceService.interfaceSyncLog.logList.Dlg._config.formId = formId;
			RM.interfaceService.interfaceSyncLog.logList.Dlg.setTitle( title )
			RM.interfaceService.interfaceSyncLog.logList.Dlg.setButtonbar( buttons );
		}else{
			RM.interfaceService.interfaceSyncLog.logList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_interfaceService_logList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.interfaceService.interfaceSyncLog.logList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.interfaceService.interfaceSyncLog.logList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_interfaceService_interfaceSyncLog', element : $('#RM_interfaceService_interfaceSyncLog_logList_fileupload_button a:eq(1)')});
		}
		RM.interfaceService.interfaceSyncLog.logList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method RM.interfaceService.interfaceSyncLog.logList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	RM.interfaceService.interfaceSyncLog.logList.approvalDialog = function(url,formId,title,width,height) {
		RM.interfaceService.interfaceSyncLog.logList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{RM.interfaceService.interfaceSyncLog.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		RM.interfaceService.interfaceSyncLog.logList.AppDlg.show();
	};

	RM.interfaceService.interfaceSyncLog.logList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.interfaceService.interfaceSyncLog.logList.beforeCommonQuery === 'function') {
	   		var ret = RM.interfaceService.interfaceSyncLog.logList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.interfaceService.interfaceSyncLog.logList.cancelSelectedNode == 'function') {
	   RM.interfaceService.interfaceSyncLog.logList.cancelSelectedNode();
	   RM.interfaceService.interfaceSyncLog.logList.node = null;
	  }
	  if(typeof RM_interfaceService_interfaceSyncLog_logList_cancelSelectedNode == 'function') {
	   RM_interfaceService_interfaceSyncLog_logList_cancelSelectedNode();
	   RM.interfaceService.interfaceSyncLog.logList.node = null;
	  }
	  RM.interfaceService.interfaceSyncLog.logList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.interfaceService.interfaceSyncLog.logList.query
	 */
	RM.interfaceService.interfaceSyncLog.logList.query = function(type,pageNo,sortFlag){
		var node = RM.interfaceService.interfaceSyncLog.logList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.interfaceService.interfaceSyncLog.logList.node = null;
		if(!checkListValid("ec_RM_interfaceService_interfaceSyncLog_logList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortKey && datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortMethod){
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColKey').val(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortKey);
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColName').val(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortColumnName);
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortMethod);
		}else{
			datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortKey = '';
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.interfaceService.interfaceSyncLog.logList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/interfaceService/interfaceSyncLog/logList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/interfaceService/interfaceSyncLog/logList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_interfaceService_logList";
		condobj.modelAlias="interfaceSyncLog";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].dbColumnType;
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
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
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
									fastColValue += "-" + lastDay + " 23:59:59";
								}
							}
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].layRec;
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
			//把fastQueryCond的值赋到一个隐藏的对话框，导出的时候使用
			$('#excelQueryCond').val(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_RM_interfaceService_interfaceSyncLog_logList_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
			<#if mainBusinessId??>
		 		dataPost += "&mainBusinessId=${mainBusinessId}";	
		 	</#if>
		 	<#if businessCenterCode??>
		 		dataPost += "&businessCenterCode=${businessCenterCode}";	
		 	</#if>
		 	<#if flowBulkFlag??>
		 		dataPost += "&flowBulkFlag=${flowBulkFlag?string('true','false')}";	
		 	</#if>
		 	<#if listCustomCondition?? && listCustomCondition != "">
		 		dataPost += "&${listCustomCondition}";	
		 	</#if>
		
		if(type && type == 'goList') {
			dataPost += "&activityName=${activityName!}";
			dataPost += "&processKey=${processKey!}";
		}
		if(nodeParam!=""){
			if(url.indexOf(".action?")<0){
				url += "?1=1";
			}
			url += nodeParam;
		}
		var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_interfaceService_logList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.interfaceService.interfaceSyncLog.logList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_interfaceService";
		openExportFrame(url);
	}
RM.interfaceService.interfaceSyncLog.logList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.interfaceService.interfaceSyncLog.logList.otherParams = {};
	RM.interfaceService.interfaceSyncLog.logList.otherParams.dialogType = dialogType;
	RM.interfaceService.interfaceSyncLog.logList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.interfaceService.interfaceSyncLog.logList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.interfaceService.interfaceSyncLog.editCallBackInfo
 */
RM.interfaceService.interfaceSyncLog.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_interfaceService_interfaceSyncLog_logList_getLayout == "function"){
    		var layout = RM_interfaceService_interfaceSyncLog_logList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.interfaceService.interfaceSyncLog.logList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget._sortKey && ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_interfaceService_InterfaceSyncLog'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget._sortKey && ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget._sortKey && ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget._sortMethod ? true : false;
		if(typeof RM_interfaceService_interfaceSyncLog_logList_getLayout == "function"){
			var layout = RM_interfaceService_interfaceSyncLog_logList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.interfaceService.interfaceSyncLog.logList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.interfaceService.interfaceSyncLog.logList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.interfaceService.interfaceSyncLog.logList.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_interfaceService_InterfaceSyncLog'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.interfaceService.interfaceSyncLog.logList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.interfaceService.interfaceSyncLog.logList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_interfaceService_logList,js,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码
/**
	 * 查询
	 * @method RM.interfaceService.interfaceSyncLog.logList.query
	 */
	RM.interfaceService.interfaceSyncLog.logList.query = function(type,pageNo,sortFlag){
		var node = RM.interfaceService.interfaceSyncLog.logList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.interfaceService.interfaceSyncLog.logList.node = null;
		if(!checkListValid("ec_RM_interfaceService_interfaceSyncLog_logList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortKey && datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortMethod){
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColKey').val(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortKey);
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColName').val(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortColumnName);
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortMethod);
		}else{
			datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query._sortKey = '';
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.interfaceService.interfaceSyncLog.logList.query('query')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/interfaceService/interfaceSyncLog/logList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/interfaceService/interfaceSyncLog/logList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_interfaceService_logList";
		condobj.modelAlias="interfaceSyncLog";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+fastCol+'"]').val();
				
				if(fastCol != "" && fastColValue != "" && fastCol == "logType" && fastColValue == "配方"){
                    fastColValue = "RMFormula";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logType" && fastColValue == "工厂模型"){
                    fastColValue = "FactoryModel";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logType" && fastColValue == "工单"){
                    fastColValue = "workOrder";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logType" && fastColValue == "sap"){
                    fastColValue = "sapSyn";
                }

                if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "配方新增"){
                    fastColValue = "add";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "配方修改"){
                    fastColValue = "update";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "配方删除"){
                    fastColValue = "delete";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "配方获取"){
                    fastColValue = "get";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "设备单元新增"){
                    fastColValue = "unitadd";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "设备单元修改"){
                    fastColValue = "unitupdate";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "设备单元删除"){
                    fastColValue = "unitdelete";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "生产线新增"){
                    fastColValue = "processadd";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "生产线修改"){
                    fastColValue = "processupdate";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "生产线删除"){
                    fastColValue = "processdelete";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "工单同步"){
                    fastColValue = "produceTaskSyn";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "活动状态变更"){
                    fastColValue = "activeStatus";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "工序状态变更"){
                    fastColValue = "unitStatus";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "工单状态变更"){
                    fastColValue = "batchStatus";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "工单新增"){
                    fastColValue = "produceTaskAdd";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "工单修改"){
                    fastColValue = "produceTaskUpdate";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "工单删除"){
                    fastColValue = "produceTaskDelete";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "结束活动"){
                    fastColValue = "stopPhase";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "mes结束活动"){
                    fastColValue = "mesStopPhaseFault";
                }else if(fastCol != "" && fastColValue != "" && fastCol == "logOperate" && fastColValue == "sap同步"){
                    fastColValue = "sapSyn";
                }
				
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_interfaceService_interfaceSyncLog_logList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info[fieldName].layRec;
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
			//把fastQueryCond的值赋到一个隐藏的对话框，导出的时候使用
			$('#excelQueryCond').val(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_RM_interfaceService_interfaceSyncLog_logList_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
			<#if mainBusinessId??>
		 		dataPost += "&mainBusinessId=${mainBusinessId}";	
		 	</#if>
		 	<#if businessCenterCode??>
		 		dataPost += "&businessCenterCode=${businessCenterCode}";	
		 	</#if>
		 	<#if flowBulkFlag??>
		 		dataPost += "&flowBulkFlag=${flowBulkFlag?string('true','false')}";	
		 	</#if>
		 	<#if listCustomCondition?? && listCustomCondition != "">
		 		dataPost += "&${listCustomCondition}";	
		 	</#if>
		
		if(type && type == 'goList') {
			dataPost += "&activityName=${activityName!}";
			dataPost += "&processKey=${processKey!}";
		}
		if(nodeParam!=""){
			if(url.indexOf(".action?")<0){
				url += "?1=1";
			}
			url += nodeParam;
		}
		var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_interfaceService_logList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_interfaceService_interfaceSyncLog_logList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_interfaceService_logList' idprefix='ec_RM_interfaceService_interfaceSyncLog_logList' queryUrl='/RM/interfaceService/interfaceSyncLog/logList-query.action' queryFunc="RM.interfaceService.interfaceSyncLog.logList.query" ns="RM.interfaceService.interfaceSyncLog.logList" />
<@exportexcel action="/RM/interfaceService/interfaceSyncLog/logList-query.action"   getRequireDataAction="/RM/interfaceService/interfaceSyncLog/logList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_interfaceService_InterfaceSyncLog&&viewCode=RM_7.5.0.0_interfaceService_logList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_interfaceService_logList')}" prefix="ec_RM_interfaceService_interfaceSyncLog_logList_query" modelCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog"  importFlag="false" viewCode="RM_7.5.0.0_interfaceService_logList" />
