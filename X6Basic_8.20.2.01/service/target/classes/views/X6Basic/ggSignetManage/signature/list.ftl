<!-- X6Basic_1.0/ggSignetManage/list -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1385014433654')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_ggSignetManage_list,head,X6Basic_1.0_ggSignetManage_Signature,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.ggSignetManage.signature','X6Basic.ggSignetManage.signature.list');
</script>
<@frameset id="ec_X6Basic_ggSignetManage_signature_list_container" border=0>
	<@frame id="ec_X6Basic_ggSignetManage_signature_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_ggSignetManage_list,html,X6Basic_1.0_ggSignetManage_Signature,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.ggSignetManage.signature.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.ggSignetManage.signature.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.ggSignetManage.signature.list._prefix += '.';
			}
			X6Basic.ggSignetManage.signature.list._prefix += arr[i];
		}
		X6Basic.ggSignetManage.signature.list._suffix = arr[arr.length -1];
		if(X6Basic.ggSignetManage.signature.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.ggSignetManage.signature.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.ggSignetManage.signature.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.ggSignetManage.signature.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.ggSignetManage.signature.list.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name="'+X6Basic.ggSignetManage.signature.list._prefix + '.' + X6Basic.ggSignetManage.signature.list._suffix +'"]').val(obj[0][X6Basic.ggSignetManage.signature.list._suffix]);
		CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name="'+X6Basic.ggSignetManage.signature.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name^="'+X6Basic.ggSignetManage.signature.list._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name="'+X6Basic.ggSignetManage.signature.list._prefix + '.' + X6Basic.ggSignetManage.signature.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.ggSignetManage.signature.list._dialog) {
			X6Basic.ggSignetManage.signature.list._dialog.close();
		}
	};
	
	X6Basic.ggSignetManage.signature.list._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.ggSignetManage.signature.list.query_"+obj+")!='undefined'") ? eval('X6Basic.ggSignetManage.signature.list.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
X6Basic_ggSignetManage_signature_list_refresh = function(node){
X6Basic.ggSignetManage.signature.list.node = node;
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
	X6Basic.ggSignetManage.signature.list.query("query");
}

X6Basic_ggSignetManage_signature_list_getList = function() {
	return "X6Basic.ggSignetManage.signature.list";
}
X6Basic.ggSignetManage.signature.list.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.X6Basic_ggSignetManage_signature_listErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

X6Basic.ggSignetManage.signature.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.ggSignetManage.signature.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_ggSignetManage_signature_list_fileupload_button",
		handler:function(){
				list_operate_ggSignetManage_list.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.ggSignetManage.signature.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_ggSignetManage_list.X6Basic.ggSignetManage.signature." + params.viewName + ".referenceCopy");
			funcName('signature', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.ggSignetManage.signature.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_ggSignetManage_list.X6Basic.ggSignetManage.signature." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.ggSignetManage.signature.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_ggSignetManage_list.X6Basic.ggSignetManage.signature." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('X6Basic_1.0_ggSignetManage_edit')>
			/**
			 * 列表新增
			 * @method X6Basic.ggSignetManage.signature.list.addlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.ggSignetManage.signature.list.addlist = function() {
				var buttonCode='X6Basic_1.0_ggSignetManage_list_BUTTON_signetAdd';
					var treeParam = "";
					if(typeof X6Basic_ggSignetManage_signature_list_getLayout == "function"){
						var layout = X6Basic_ggSignetManage_signature_list_getLayout();
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
							if(modelCode == 'X6Basic_1.0_ggSignetManage_Signature'.replace(/\./g, '\_')){
								treeParam = '&signature.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&signature.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = X6Basic.ggSignetManage.signature.list.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = X6Basic.ggSignetManage.signature.list.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						X6Basic.ggSignetManage.signature.list.otherParams = otherParams;

						var url='${editView.url}?entityCode=X6Basic_1.0_ggSignetManage' + "&${getPowerCode('${buttonPerfix!}list_signetAdd_add_X6Basic_1.0_ggSignetManage_list')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_ggSignetManage_list';
						X6Basic.ggSignetManage.signature.list.showDialog(url,'X6Basic_ggSignetManage_signature_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=X6Basic_1.0_ggSignetManage' + "&${getPowerCode('${buttonPerfix!}list_signetAdd_add_X6Basic_1.0_ggSignetManage_list')}";
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
			
			<#assign editView = getViewByCode('X6Basic_1.0_ggSignetManage_edit')>
			/**
			 * 列表编辑
			 * @method X6Basic.ggSignetManage.signature.list.modifylist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.ggSignetManage.signature.list.modifylist = function() {
				var buttonCode='X6Basic_1.0_ggSignetManage_list_BUTTON_signetModify';
				if(X6Basic.ggSignetManage.signature.list.checkSelectedAny()){
					if(X6Basic.ggSignetManage.signature.list.checkSelectedMore()) {
						var cid = ec_X6Basic_ggSignetManage_signature_list_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = X6Basic.ggSignetManage.signature.list.getOperateRecordId();
							otherParams.uploadBtn = X6Basic.ggSignetManage.signature.list.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = X6Basic.ggSignetManage.signature.list.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = X6Basic.ggSignetManage.signature.list.createPrintBtn('${editView.name}','${editView.url}?entityCode=X6Basic_1.0_ggSignetManage&id=' + X6Basic.ggSignetManage.signature.list.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}list_signetModify_modify_X6Basic_1.0_ggSignetManage_list')}");
							otherParams.printSettingBtn = X6Basic.ggSignetManage.signature.list.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							X6Basic.ggSignetManage.signature.list.otherParams = otherParams;

							X6Basic.ggSignetManage.signature.list.showDialog('${editView.url}?entityCode=X6Basic_1.0_ggSignetManage&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_ggSignetManage_list'+'&id=' + X6Basic.ggSignetManage.signature.list.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}list_signetModify_modify_X6Basic_1.0_ggSignetManage_list')}",'X6Basic_ggSignetManage_signature_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=X6Basic_1.0_ggSignetManage'+signatureStr+'&id=' + X6Basic.ggSignetManage.signature.list.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}list_signetModify_modify_X6Basic_1.0_ggSignetManage_list')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method X6Basic.ggSignetManage.signature.list.dbmodifylist
			 */
			X6Basic.ggSignetManage.signature.list.dbmodifylist =function(event,oRow){
				var buttonCode='X6Basic_1.0_ggSignetManage_list_BUTTON_signetModify';
				var cid = ec_X6Basic_ggSignetManage_signature_list_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}list_signetModify_modify_X6Basic_1.0_ggSignetManage_list&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}list_signetModify_modify_X6Basic_1.0_ggSignetManage_list";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}list_signetModify_modify_X6Basic_1.0_ggSignetManage_list'] == true) {
					var url = "${editView.url}?entityCode=X6Basic_1.0_ggSignetManage&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_ggSignetManage_list'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}list_signetModify_modify_X6Basic_1.0_ggSignetManage_list')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = X6Basic.ggSignetManage.signature.list.getOperateRecordId();
					otherParams.uploadBtn = X6Basic.ggSignetManage.signature.list.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = X6Basic.ggSignetManage.signature.list.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = X6Basic.ggSignetManage.signature.list.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = X6Basic.ggSignetManage.signature.list.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					X6Basic.ggSignetManage.signature.list.otherParams = otherParams;

					X6Basic.ggSignetManage.signature.list.showDialog(url,'X6Basic_ggSignetManage_signature_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '/X6Basic/ggSignetManage/signature/view.action';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							var otherParams = {};
							otherParams.viewShowType = 'VIEW';
							otherParams.dialogType = '3';
							X6Basic.ggSignetManage.signature.list.otherParams = otherParams;
							X6Basic.ggSignetManage.signature.list.showDialog(viewUrl + "?entityCode=X6Basic_1.0_ggSignetManage&id=" + oRow.id,'X6Basic_ggSignetManage_signature_view_form','${getText('X6Basic.viewtitle.radion1385014821904')}',500,260,'X6Basic_1.0_ggSignetManage_view',buttonCode);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/X6Basic/ggSignetManage/signature/delete.action?ids=" + X6Basic.ggSignetManage.signature.list.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}list_signetDelete_del_X6Basic_1.0_ggSignetManage_list')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,X6Basic.ggSignetManage.signature.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method X6Basic.ggSignetManage.signature.list.dellist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.ggSignetManage.signature.list.dellist = function(param) {
				var buttonCode='X6Basic_1.0_ggSignetManage_list_BUTTON_signetDelete';
				if(X6Basic.ggSignetManage.signature.list.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows.length ; i++){
                        var cid = datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
					CUI.Dialog.confirm("${getText('X6Basic.confirmcontent.radion1385014734158')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/X6Basic/ggSignetManage/signature/delete.action?ids=" + X6Basic.ggSignetManage.signature.list.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}list_signetDelete_del_X6Basic_1.0_ggSignetManage_list')}", X6Basic.ggSignetManage.signature.callBackInfo, "json");
					}
				});
				}
			};
			
	
	/**
	 * 保存完毕回调
	 * @method X6Basic.ggSignetManage.signature.callBackInfo
	 */
	X6Basic.ggSignetManage.signature.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('X6Basic_ggSignetManage_signature_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{X6Basic.ggSignetManage.signature.list.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_X6Basic_ggSignetManage_signature_list_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_ggSignetManage_signature_list_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof X6Basic_ggSignetManage_signature_list_getLayout == "function"){
							    		var layout = X6Basic_ggSignetManage_signature_list_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	X6Basic.ggSignetManage.signature.list.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'X6Basic_1.0_ggSignetManage_Signature'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false;
									if(typeof X6Basic_ggSignetManage_signature_list_getLayout == "function"){
										var layout = X6Basic_ggSignetManage_signature_list_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	X6Basic.ggSignetManage.signature.list.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		X6Basic.ggSignetManage.signature.list.query('query',_Current_PageNo,needSort);
								    	} else {
								    		X6Basic.ggSignetManage.signature.list.query('query');
								    	}
										if(modelCode == 'X6Basic_1.0_ggSignetManage_Signature'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		X6Basic.ggSignetManage.signature.list.query('query',_Current_PageNo,needSort);
								    	} else {
								    		X6Basic.ggSignetManage.signature.list.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_X6Basic_ggSignetManage_signature_list_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_ggSignetManage_signature_list_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof X6Basic_ggSignetManage_signature_list_getLayout == "function"){
								    		var layout = X6Basic_ggSignetManage_signature_list_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.ggSignetManage.signature.list.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'X6Basic_1.0_ggSignetManage_Signature'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.ggSignetManage.signature.list.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false;
										if(typeof X6Basic_ggSignetManage_signature_list_getLayout == "function"){
											var layout = X6Basic_ggSignetManage_signature_list_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.ggSignetManage.signature.list.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.ggSignetManage.signature.list.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.ggSignetManage.signature.list.query('query');
									    	}
											if(modelCode == 'X6Basic_1.0_ggSignetManage_Signature'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.ggSignetManage.signature.list.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.ggSignetManage.signature.list.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.ggSignetManage.signature.list.query('query');
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
	 * @method X6Basic.ggSignetManage.signature.list.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	X6Basic.ggSignetManage.signature.list.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method X6Basic.ggSignetManage.signature.list.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	X6Basic.ggSignetManage.signature.list.checkSelectedValid = function(type) {
		if(X6Basic.ggSignetManage.signature.list.checkSelectedAny()){
			for(var i=0;i<datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows[i].valid === false){
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
	 * @method X6Basic.ggSignetManage.signature.list.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.ggSignetManage.signature.list.checkSelectedAny = function() {
		if(datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method X6Basic.ggSignetManage.signature.list.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.ggSignetManage.signature.list.checkSelectedMore = function() {
		if(datatable_ec_X6Basic_ggSignetManage_signature_list_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method X6Basic.ggSignetManage.signature.list.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.ggSignetManage.signature.list.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = X6Basic.ggSignetManage.signature.list.otherParams || {};
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
				<#assign editView = getViewByCode('X6Basic_1.0_ggSignetManage_edit')>
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
												list_operate_ggSignetManage_list.${funcname};
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
					list_operate_ggSignetManage_list.CUI('#'+formId).submit();
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
		if ( X6Basic.ggSignetManage.signature.list.Dlg ) {
			X6Basic.ggSignetManage.signature.list.Dlg._config.url = url;
			X6Basic.ggSignetManage.signature.list.Dlg._config.formId = formId;
			X6Basic.ggSignetManage.signature.list.Dlg.setTitle( title )
			X6Basic.ggSignetManage.signature.list.Dlg.setButtonbar( buttons );
		}else{
			X6Basic.ggSignetManage.signature.list.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_ggSignetManage_list',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		X6Basic.ggSignetManage.signature.list.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		X6Basic.ggSignetManage.signature.list.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_ggSignetManage_signature', element : $('#X6Basic_ggSignetManage_signature_list_fileupload_button a:eq(1)')});
		}
		X6Basic.ggSignetManage.signature.list.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.ggSignetManage.signature.list.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.ggSignetManage.signature.list.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.ggSignetManage.signature.list.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{X6Basic.ggSignetManage.signature.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.ggSignetManage.signature.list.AppDlg.show();
	};

	X6Basic.ggSignetManage.signature.list.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof X6Basic.ggSignetManage.signature.list.beforeCommonQuery === 'function') {
	   		var ret = X6Basic.ggSignetManage.signature.list.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof X6Basic.ggSignetManage.signature.list.cancelSelectedNode == 'function') {
	   X6Basic.ggSignetManage.signature.list.cancelSelectedNode();
	   X6Basic.ggSignetManage.signature.list.node = null;
	  }
	  if(typeof X6Basic_ggSignetManage_signature_list_cancelSelectedNode == 'function') {
	   X6Basic_ggSignetManage_signature_list_cancelSelectedNode();
	   X6Basic.ggSignetManage.signature.list.node = null;
	  }
	  X6Basic.ggSignetManage.signature.list.query(type);
	 };
	
	/**
	 * 查询
	 * @method X6Basic.ggSignetManage.signature.list.query
	 */
	X6Basic.ggSignetManage.signature.list.query = function(type,pageNo,sortFlag){
		var node = X6Basic.ggSignetManage.signature.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//X6Basic.ggSignetManage.signature.list.node = null;
		if(!checkListValid("ec_X6Basic_ggSignetManage_signature_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_X6Basic_ggSignetManage_signature_list_query._sortKey && datatable_ec_X6Basic_ggSignetManage_signature_list_query._sortMethod){
			CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_ggSignetManage_signature_list_query._sortKey);
			CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_ggSignetManage_signature_list_query._sortColumnName);
			CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_ggSignetManage_signature_list_query._sortMethod);
		}else{
			datatable_ec_X6Basic_ggSignetManage_signature_list_query._sortKey = '';
			CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_X6Basic_ggSignetManage_signature_list_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "X6Basic.ggSignetManage.signature.list.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/X6Basic/ggSignetManage/signature/list-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/X6Basic/ggSignetManage/signature/list-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_ggSignetManage_signature_list_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="X6Basic_1.0_ggSignetManage_list";
		condobj.modelAlias="signature";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_X6Basic_ggSignetManage_signature_list_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_X6Basic_ggSignetManage_signature_list_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_X6Basic_ggSignetManage_signature_list_quickquery_info[fieldName].dbColumnType;
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
							if(ec_X6Basic_ggSignetManage_signature_list_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name="'+ec_X6Basic_ggSignetManage_signature_list_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_X6Basic_ggSignetManage_signature_list_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_X6Basic_ggSignetManage_signature_list_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_X6Basic_ggSignetManage_signature_list_quickquery_info["MainTableName"];
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
						var layrec=ec_X6Basic_ggSignetManage_signature_list_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_X6Basic_ggSignetManage_signature_list_query_PageLink_PageCount"]').val();
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
			permissionCode = 'X6Basic_1.0_ggSignetManage_list';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_X6Basic_ggSignetManage_signature_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_X6Basic_ggSignetManage_signature_list_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	X6Basic.ggSignetManage.signature.list.signatureShowAttachment = function(row) {
		X6Basic.ggSignetManage.signature.list.signatureDlg =	new CUI.Dialog({
			title: "${getText("foundation.upload.attachment")}",
			url :"/X6Basic/ggSignetManage/signature/attachment-init.action?linkId=" + row.id + "&type=X6Basic_ggSignetManage_signature&propertyCode=X6Basic_1.0_ggSignetManage_Signature_signature",
			elementId: "X6Basic_ggSignetManage_signature_list_attachment",
			modal:true,
			width:530,
			height: 320,
			buttons:[
					{	name:"${getText('foundation.common.closed')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.ggSignetManage.signature.list.signatureDlg.show();
	};
	
	X6Basic.ggSignetManage.signature.list.signatureDownAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.signatureDocument.id + "&entityCode=X6Basic_1.0_ggSignetManage";
		openExportFrame(url);
	}
	
	
	X6Basic.ggSignetManage.signature.list.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_ggSignetManage";
		openExportFrame(url);
	}
X6Basic.ggSignetManage.signature.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	X6Basic.ggSignetManage.signature.list.otherParams = {};
	X6Basic.ggSignetManage.signature.list.otherParams.dialogType = dialogType;
	X6Basic.ggSignetManage.signature.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.ggSignetManage.signature.list.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.ggSignetManage.signature.editCallBackInfo
 */
X6Basic.ggSignetManage.signature.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_X6Basic_ggSignetManage_signature_list_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_ggSignetManage_signature_list_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_ggSignetManage_signature_list_getLayout == "function"){
    		var layout = X6Basic_ggSignetManage_signature_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.ggSignetManage.signature.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'X6Basic_1.0_ggSignetManage_Signature'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortKey && ec_X6Basic_ggSignetManage_signature_list_queryWidget._sortMethod ? true : false;
		if(typeof X6Basic_ggSignetManage_signature_list_getLayout == "function"){
			var layout = X6Basic_ggSignetManage_signature_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.ggSignetManage.signature.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.ggSignetManage.signature.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.ggSignetManage.signature.list.query('query');
	    	}
			if(modelCode == 'X6Basic_1.0_ggSignetManage_Signature'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.ggSignetManage.signature.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.ggSignetManage.signature.list.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-X6Basic_1.0_ggSignetManage_list,js,X6Basic_1.0_ggSignetManage_Signature,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='X6Basic_1.0_ggSignetManage_list' idprefix='ec_X6Basic_ggSignetManage_signature_list' queryUrl='/X6Basic/ggSignetManage/signature/list-query.action' queryFunc="X6Basic.ggSignetManage.signature.list.query" ns="X6Basic.ggSignetManage.signature.list" />
<@exportexcel action="/X6Basic/ggSignetManage/signature/list-query.action"   getRequireDataAction="/X6Basic/ggSignetManage/signature/list-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=X6Basic_1.0_ggSignetManage_Signature&&viewCode=X6Basic_1.0_ggSignetManage_list" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_ggSignetManage_list')}" prefix="ec_X6Basic_ggSignetManage_signature_list_query" modelCode="X6Basic_1.0_ggSignetManage_Signature"  importFlag="false" viewCode="X6Basic_1.0_ggSignetManage_list" />
