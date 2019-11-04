<!-- WOM_7.5.0.0/materialReject/rejectReasonList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1543219445967')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_materialReject_rejectReasonList,head,WOM_7.5.0.0_materialReject_RejectReason,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.materialReject.rejectReason','WOM.materialReject.rejectReason.rejectReasonList');
</script>
<@frameset id="ec_WOM_materialReject_rejectReason_rejectReasonList_container" border=0>
	<@frame id="ec_WOM_materialReject_rejectReason_rejectReasonList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "rejectReasonList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_materialReject_rejectReasonList,html,WOM_7.5.0.0_materialReject_RejectReason,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.materialReject.rejectReason.rejectReasonList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.materialReject.rejectReason.rejectReasonList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.materialReject.rejectReason.rejectReasonList._prefix += '.';
			}
			WOM.materialReject.rejectReason.rejectReasonList._prefix += arr[i];
		}
		WOM.materialReject.rejectReason.rejectReasonList._suffix = arr[arr.length -1];
		if(WOM.materialReject.rejectReason.rejectReasonList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.materialReject.rejectReason.rejectReasonList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.materialReject.rejectReason.rejectReasonList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.materialReject.rejectReason.rejectReasonList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.materialReject.rejectReason.rejectReasonList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name="'+WOM.materialReject.rejectReason.rejectReasonList._prefix + '.' + WOM.materialReject.rejectReason.rejectReasonList._suffix +'"]').val(obj[0][WOM.materialReject.rejectReason.rejectReasonList._suffix]);
		CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name="'+WOM.materialReject.rejectReason.rejectReasonList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name^="'+WOM.materialReject.rejectReason.rejectReasonList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name="'+WOM.materialReject.rejectReason.rejectReasonList._prefix + '.' + WOM.materialReject.rejectReason.rejectReasonList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.materialReject.rejectReason.rejectReasonList._dialog) {
			WOM.materialReject.rejectReason.rejectReasonList._dialog.close();
		}
	};
	
	WOM.materialReject.rejectReason.rejectReasonList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.materialReject.rejectReason.rejectReasonList.query_"+obj+")!='undefined'") ? eval('WOM.materialReject.rejectReason.rejectReasonList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_materialReject_rejectReason_rejectReasonList_refresh = function(node){
WOM.materialReject.rejectReason.rejectReasonList.node = node;
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
	WOM.materialReject.rejectReason.rejectReasonList.query("query");
}

WOM_materialReject_rejectReason_rejectReasonList_getList = function() {
	return "WOM.materialReject.rejectReason.rejectReasonList";
}
WOM.materialReject.rejectReason.rejectReasonList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_materialReject_rejectReason_rejectReasonListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.materialReject.rejectReason.rejectReasonList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.materialReject.rejectReason.rejectReasonList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_materialReject_rejectReason_rejectReasonList_fileupload_button",
		handler:function(){
				list_operate_materialReject_rejectReasonList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.materialReject.rejectReason.rejectReasonList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_materialReject_rejectReasonList.WOM.materialReject.rejectReason." + params.viewName + ".referenceCopy");
			funcName('rejectReason', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.materialReject.rejectReason.rejectReasonList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_materialReject_rejectReasonList.WOM.materialReject.rejectReason." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.materialReject.rejectReason.rejectReasonList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_materialReject_rejectReasonList.WOM.materialReject.rejectReason." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('WOM_7.5.0.0_materialReject_rejectReasonEdit')>
			/**
			 * 列表新增
			 * @method WOM.materialReject.rejectReason.rejectReasonList.addrejectReasonList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.materialReject.rejectReason.rejectReasonList.addrejectReasonList = function() {
				var buttonCode='WOM_7.5.0.0_materialReject_rejectReasonList_BUTTON_add';
					var treeParam = "";
					if(typeof WOM_materialReject_rejectReason_rejectReasonList_getLayout == "function"){
						var layout = WOM_materialReject_rejectReason_rejectReasonList_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							if(node.cid!='${Session.company.id}'&&node.id!=-1){
								workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
								return;
							}
							var modelCode = node.modelCode.replace(/\./g, '\_');
							if(modelCode == 'WOM_7.5.0.0_materialReject_RejectReason'.replace(/\./g, '\_')){
								treeParam = '&rejectReason.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&rejectReason.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = WOM.materialReject.rejectReason.rejectReasonList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = WOM.materialReject.rejectReason.rejectReasonList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						WOM.materialReject.rejectReason.rejectReasonList.otherParams = otherParams;

						var url='${editView.url}?entityCode=WOM_7.5.0.0_materialReject' + "&${getPowerCode('${buttonPerfix!}rejectReasonList_add_add_WOM_7.5.0.0_materialReject_rejectReasonList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_materialReject_rejectReasonList';
						WOM.materialReject.rejectReason.rejectReasonList.showDialog(url,'WOM_materialReject_rejectReason_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=WOM_7.5.0.0_materialReject' + "&${getPowerCode('${buttonPerfix!}rejectReasonList_add_add_WOM_7.5.0.0_materialReject_rejectReasonList')}";
						if(treeParam!=""){
				 			url += treeParam;
				 		}
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
			 			if(signatureInfo[0] != '') {
			 				url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
			 			}
						openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
					</#if>
			};
			
			<#assign editView = getViewByCode('WOM_7.5.0.0_materialReject_rejectReasonEdit')>
			/**
			 * 列表编辑
			 * @method WOM.materialReject.rejectReason.rejectReasonList.modifyrejectReasonList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.materialReject.rejectReason.rejectReasonList.modifyrejectReasonList = function() {
				var buttonCode='WOM_7.5.0.0_materialReject_rejectReasonList_BUTTON_edit';
				if(WOM.materialReject.rejectReason.rejectReasonList.checkSelectedAny()){
					if(WOM.materialReject.rejectReason.rejectReasonList.checkSelectedMore()) {
						var cid = ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId();
							otherParams.uploadBtn = WOM.materialReject.rejectReason.rejectReasonList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = WOM.materialReject.rejectReason.rejectReasonList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = WOM.materialReject.rejectReason.rejectReasonList.createPrintBtn('${editView.name}','${editView.url}?entityCode=WOM_7.5.0.0_materialReject&id=' + WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}rejectReasonList_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonList')}");
							otherParams.printSettingBtn = WOM.materialReject.rejectReason.rejectReasonList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							WOM.materialReject.rejectReason.rejectReasonList.otherParams = otherParams;

							WOM.materialReject.rejectReason.rejectReasonList.showDialog('${editView.url}?entityCode=WOM_7.5.0.0_materialReject&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_materialReject_rejectReasonList'+'&id=' + WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}rejectReasonList_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonList')}",'WOM_materialReject_rejectReason_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=WOM_7.5.0.0_materialReject'+signatureStr+'&id=' + WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}rejectReasonList_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method WOM.materialReject.rejectReason.rejectReasonList.dbmodifyrejectReasonList
			 */
			WOM.materialReject.rejectReason.rejectReasonList.dbmodifyrejectReasonList =function(event,oRow){
				var buttonCode='WOM_7.5.0.0_materialReject_rejectReasonList_BUTTON_edit';
				var cid = ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}rejectReasonList_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}rejectReasonList_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}rejectReasonList_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonList'] == true) {
					var url = "${editView.url}?entityCode=WOM_7.5.0.0_materialReject&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_materialReject_rejectReasonList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}rejectReasonList_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId();
					otherParams.uploadBtn = WOM.materialReject.rejectReason.rejectReasonList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = WOM.materialReject.rejectReason.rejectReasonList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = WOM.materialReject.rejectReason.rejectReasonList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = WOM.materialReject.rejectReason.rejectReasonList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					WOM.materialReject.rejectReason.rejectReasonList.otherParams = otherParams;

					WOM.materialReject.rejectReason.rejectReasonList.showDialog(url,'WOM_materialReject_rejectReason_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_materialReject&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/WOM/materialReject/rejectReason/delete.action?ids=" + WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}rejectReasonList_delete_del_WOM_7.5.0.0_materialReject_rejectReasonList')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,WOM.materialReject.rejectReason.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method WOM.materialReject.rejectReason.rejectReasonList.delrejectReasonList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.materialReject.rejectReason.rejectReasonList.delrejectReasonList = function(param) {
				var buttonCode='WOM_7.5.0.0_materialReject_rejectReasonList_BUTTON_delete';
				if(WOM.materialReject.rejectReason.rejectReasonList.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows.length ; i++){
                        var cid = datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("WOM.buttonPropertyshowName.radion1543220063678")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/WOM/materialReject/rejectReason/delete.action?ids=" + WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}rejectReasonList_delete_del_WOM_7.5.0.0_materialReject_rejectReasonList')}", WOM.materialReject.rejectReason.callBackInfo, "json");
					}
				});
				}
			};
			
	
	/**
	 * 保存完毕回调
	 * @method WOM.materialReject.rejectReason.callBackInfo
	 */
	WOM.materialReject.rejectReason.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_materialReject_rejectReason_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.materialReject.rejectReason.rejectReasonList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof WOM_materialReject_rejectReason_rejectReasonList_getLayout == "function"){
							    		var layout = WOM_materialReject_rejectReason_rejectReasonList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.materialReject.rejectReason.rejectReasonList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'WOM_7.5.0.0_materialReject_RejectReason'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false;
									if(typeof WOM_materialReject_rejectReason_rejectReasonList_getLayout == "function"){
										var layout = WOM_materialReject_rejectReason_rejectReasonList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.materialReject.rejectReason.rejectReasonList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.materialReject.rejectReason.rejectReasonList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.materialReject.rejectReason.rejectReasonList.query('query');
								    	}
										if(modelCode == 'WOM_7.5.0.0_materialReject_RejectReason'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.materialReject.rejectReason.rejectReasonList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.materialReject.rejectReason.rejectReasonList.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof WOM_materialReject_rejectReason_rejectReasonList_getLayout == "function"){
								    		var layout = WOM_materialReject_rejectReason_rejectReasonList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	WOM.materialReject.rejectReason.rejectReasonList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'WOM_7.5.0.0_materialReject_RejectReason'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												WOM.materialReject.rejectReason.rejectReasonList.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false;
										if(typeof WOM_materialReject_rejectReason_rejectReasonList_getLayout == "function"){
											var layout = WOM_materialReject_rejectReason_rejectReasonList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	WOM.materialReject.rejectReason.rejectReasonList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		WOM.materialReject.rejectReason.rejectReasonList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		WOM.materialReject.rejectReason.rejectReasonList.query('query');
									    	}
											if(modelCode == 'WOM_7.5.0.0_materialReject_RejectReason'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												WOM.materialReject.rejectReason.rejectReasonList.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		WOM.materialReject.rejectReason.rejectReasonList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		WOM.materialReject.rejectReason.rejectReasonList.query('query');
									    	}
										}
									}
								}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.materialReject.rejectReason.rejectReasonList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.materialReject.rejectReason.rejectReasonList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.materialReject.rejectReason.rejectReasonList.checkSelectedValid = function(type) {
		if(WOM.materialReject.rejectReason.rejectReasonList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows[i].valid === false){
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
	 * @method WOM.materialReject.rejectReason.rejectReasonList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.materialReject.rejectReason.rejectReasonList.checkSelectedAny = function() {
		if(datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.materialReject.rejectReason.rejectReasonList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.materialReject.rejectReason.rejectReasonList.checkSelectedMore = function() {
		if(datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.materialReject.rejectReason.rejectReasonList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.materialReject.rejectReason.rejectReasonList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.materialReject.rejectReason.rejectReasonList.otherParams || {};
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
				<#assign editView = getViewByCode('WOM_7.5.0.0_materialReject_rejectReasonEdit')>
				<#if editView.extraView?? && editView.extraView.configMap?? && editView.extraView.configMap.layout?? && editView.extraView.configMap.layout.sections??>
				if(viewCode=='${editView.code}'||!viewCode){
					<#list editView.extraView.configMap.layout.sections as buttonSection>
						<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
								<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
									<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false' 
										|| checkUserPermisition('${editView.entity.code}_${operateBtn.permissionCode!}')>
										buttons.push({
											name:"${getText(operateBtn.namekey!)}",
											align:"${operateBtn.buttonAlign!'left'}",
											handler:function(){
												<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
												<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
												<#assign funcname = funcname?split('=')[1]>
												list_operate_materialReject_rejectReasonList.${funcname};
												</#if>
											}
										});
									</#if>
								</#if>
							</#list>
						</#if>
					</#list>
					}
				</#if>
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
					list_operate_materialReject_rejectReasonList.CUI('#'+formId).submit();
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
		if ( WOM.materialReject.rejectReason.rejectReasonList.Dlg ) {
			WOM.materialReject.rejectReason.rejectReasonList.Dlg._config.url = url;
			WOM.materialReject.rejectReason.rejectReasonList.Dlg._config.formId = formId;
			WOM.materialReject.rejectReason.rejectReasonList.Dlg.setTitle( title )
			WOM.materialReject.rejectReason.rejectReasonList.Dlg.setButtonbar( buttons );
		}else{
			WOM.materialReject.rejectReason.rejectReasonList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_materialReject_rejectReasonList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.materialReject.rejectReason.rejectReasonList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.materialReject.rejectReason.rejectReasonList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_materialReject_rejectReason', element : $('#WOM_materialReject_rejectReason_rejectReasonList_fileupload_button a:eq(1)')});
		}
		WOM.materialReject.rejectReason.rejectReasonList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.materialReject.rejectReason.rejectReasonList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.materialReject.rejectReason.rejectReasonList.approvalDialog = function(url,formId,title,width,height) {
		WOM.materialReject.rejectReason.rejectReasonList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.materialReject.rejectReason.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.materialReject.rejectReason.rejectReasonList.AppDlg.show();
	};

	WOM.materialReject.rejectReason.rejectReasonList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.materialReject.rejectReason.rejectReasonList.beforeCommonQuery === 'function') {
	   		var ret = WOM.materialReject.rejectReason.rejectReasonList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.materialReject.rejectReason.rejectReasonList.cancelSelectedNode == 'function') {
	   WOM.materialReject.rejectReason.rejectReasonList.cancelSelectedNode();
	   WOM.materialReject.rejectReason.rejectReasonList.node = null;
	  }
	  if(typeof WOM_materialReject_rejectReason_rejectReasonList_cancelSelectedNode == 'function') {
	   WOM_materialReject_rejectReason_rejectReasonList_cancelSelectedNode();
	   WOM.materialReject.rejectReason.rejectReasonList.node = null;
	  }
	  WOM.materialReject.rejectReason.rejectReasonList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.materialReject.rejectReason.rejectReasonList.query
	 */
	WOM.materialReject.rejectReason.rejectReasonList.query = function(type,pageNo,sortFlag){
		var node = WOM.materialReject.rejectReason.rejectReasonList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.materialReject.rejectReason.rejectReasonList.node = null;
		if(!checkListValid("ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query._sortKey && datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query._sortMethod){
			CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query._sortKey);
			CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm #dataTableSortColName').val(datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query._sortColumnName);
			CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query._sortMethod);
		}else{
			datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query._sortKey = '';
			CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.materialReject.rejectReason.rejectReasonList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/materialReject/rejectReason/rejectReasonList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/materialReject/rejectReason/rejectReasonList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_materialReject_rejectReasonList";
		condobj.modelAlias="rejectReason";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name="'+ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_materialReject_rejectReason_rejectReasonList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_materialReject_rejectReason_rejectReasonList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_materialReject_rejectReason_rejectReasonList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_materialReject_rejectReasonList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.materialReject.rejectReason.rejectReasonList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_materialReject";
		openExportFrame(url);
	}
WOM.materialReject.rejectReason.rejectReasonList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.materialReject.rejectReason.rejectReasonList.otherParams = {};
	WOM.materialReject.rejectReason.rejectReasonList.otherParams.dialogType = dialogType;
	WOM.materialReject.rejectReason.rejectReasonList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.materialReject.rejectReason.rejectReasonList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.materialReject.rejectReason.editCallBackInfo
 */
WOM.materialReject.rejectReason.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_materialReject_rejectReason_rejectReasonList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_materialReject_rejectReason_rejectReasonList_getLayout == "function"){
    		var layout = WOM_materialReject_rejectReason_rejectReasonList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.materialReject.rejectReason.rejectReasonList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_materialReject_RejectReason'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortKey && ec_WOM_materialReject_rejectReason_rejectReasonList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_materialReject_rejectReason_rejectReasonList_getLayout == "function"){
			var layout = WOM_materialReject_rejectReason_rejectReasonList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.materialReject.rejectReason.rejectReasonList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.materialReject.rejectReason.rejectReasonList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.materialReject.rejectReason.rejectReasonList.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_materialReject_RejectReason'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.materialReject.rejectReason.rejectReasonList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.materialReject.rejectReason.rejectReasonList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_materialReject_rejectReasonList,js,WOM_7.5.0.0_materialReject_RejectReason,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_materialReject_rejectReasonList' idprefix='ec_WOM_materialReject_rejectReason_rejectReasonList' queryUrl='/WOM/materialReject/rejectReason/rejectReasonList-query.action' queryFunc="WOM.materialReject.rejectReason.rejectReasonList.query" ns="WOM.materialReject.rejectReason.rejectReasonList" />
<@exportexcel action="/WOM/materialReject/rejectReason/rejectReasonList-query.action"   getRequireDataAction="/WOM/materialReject/rejectReason/rejectReasonList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_materialReject_RejectReason&&viewCode=WOM_7.5.0.0_materialReject_rejectReasonList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_materialReject_rejectReasonList')}" prefix="ec_WOM_materialReject_rejectReason_rejectReasonList_query" modelCode="WOM_7.5.0.0_materialReject_RejectReason"  importFlag="false" viewCode="WOM_7.5.0.0_materialReject_rejectReasonList" />
