<!-- X6Basic_1.0/spellRule/list -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1398317071877')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_spellRule_list,head,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.spellRule.spellRule','X6Basic.spellRule.spellRule.list');
</script>
<@frameset id="ec_X6Basic_spellRule_spellRule_list_container" border=0>
	<@frame id="ec_X6Basic_spellRule_spellRule_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_spellRule_list,html,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.spellRule.spellRule.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.spellRule.spellRule.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.spellRule.spellRule.list._prefix += '.';
			}
			X6Basic.spellRule.spellRule.list._prefix += arr[i];
		}
		X6Basic.spellRule.spellRule.list._suffix = arr[arr.length -1];
		if(X6Basic.spellRule.spellRule.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.spellRule.spellRule.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.spellRule.spellRule.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.spellRule.spellRule.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.spellRule.spellRule.list.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name="'+X6Basic.spellRule.spellRule.list._prefix + '.' + X6Basic.spellRule.spellRule.list._suffix +'"]').val(obj[0][X6Basic.spellRule.spellRule.list._suffix]);
		CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name="'+X6Basic.spellRule.spellRule.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name^="'+X6Basic.spellRule.spellRule.list._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name="'+X6Basic.spellRule.spellRule.list._prefix + '.' + X6Basic.spellRule.spellRule.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.spellRule.spellRule.list._dialog) {
			X6Basic.spellRule.spellRule.list._dialog.close();
		}
	};
	
	X6Basic.spellRule.spellRule.list._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.spellRule.spellRule.list.query_"+obj+")!='undefined'") ? eval('X6Basic.spellRule.spellRule.list.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
X6Basic_spellRule_spellRule_list_refresh = function(node){
X6Basic.spellRule.spellRule.list.node = node;
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
	X6Basic.spellRule.spellRule.list.query("query");
}

X6Basic_spellRule_spellRule_list_getList = function() {
	return "X6Basic.spellRule.spellRule.list";
}
X6Basic.spellRule.spellRule.list.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.X6Basic_spellRule_spellRule_listErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

X6Basic.spellRule.spellRule.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.spellRule.spellRule.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_spellRule_spellRule_list_fileupload_button",
		handler:function(){
				list_operate_spellRule_list.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.spellRule.spellRule.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_spellRule_list.X6Basic.spellRule.spellRule." + params.viewName + ".referenceCopy");
			funcName('spellRule', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.spellRule.spellRule.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_spellRule_list.X6Basic.spellRule.spellRule." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.spellRule.spellRule.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_spellRule_list.X6Basic.spellRule.spellRule." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('X6Basic_1.0_spellRule_edit')>
			/**
			 * 列表新增
			 * @method X6Basic.spellRule.spellRule.list.addlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.spellRule.spellRule.list.addlist = function() {
				var buttonCode='X6Basic_1.0_spellRule_list_BUTTON_add';
					var treeParam = "";
					if(typeof X6Basic_spellRule_spellRule_list_getLayout == "function"){
						var layout = X6Basic_spellRule_spellRule_list_getLayout();
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
							if(modelCode == 'X6Basic_1.0_spellRule_SpellRule'.replace(/\./g, '\_')){
								treeParam = '&spellRule.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&spellRule.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = X6Basic.spellRule.spellRule.list.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = X6Basic.spellRule.spellRule.list.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						X6Basic.spellRule.spellRule.list.otherParams = otherParams;

						var url='${editView.url}?entityCode=X6Basic_1.0_spellRule' + "&${getPowerCode('${buttonPerfix!}list_add_add_X6Basic_1.0_spellRule_list')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_spellRule_list';
						X6Basic.spellRule.spellRule.list.showDialog(url,'X6Basic_spellRule_spellRule_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=X6Basic_1.0_spellRule' + "&${getPowerCode('${buttonPerfix!}list_add_add_X6Basic_1.0_spellRule_list')}";
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
			
			<#assign editView = getViewByCode('X6Basic_1.0_spellRule_edit')>
			/**
			 * 列表编辑
			 * @method X6Basic.spellRule.spellRule.list.modifylist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.spellRule.spellRule.list.modifylist = function() {
				var buttonCode='X6Basic_1.0_spellRule_list_BUTTON_modify';
				if(X6Basic.spellRule.spellRule.list.checkSelectedAny()){
					if(X6Basic.spellRule.spellRule.list.checkSelectedMore()) {
						var cid = ec_X6Basic_spellRule_spellRule_list_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = X6Basic.spellRule.spellRule.list.getOperateRecordId();
							otherParams.uploadBtn = X6Basic.spellRule.spellRule.list.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = X6Basic.spellRule.spellRule.list.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = X6Basic.spellRule.spellRule.list.createPrintBtn('${editView.name}','${editView.url}?entityCode=X6Basic_1.0_spellRule&id=' + X6Basic.spellRule.spellRule.list.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}list_modify_modify_X6Basic_1.0_spellRule_list')}");
							otherParams.printSettingBtn = X6Basic.spellRule.spellRule.list.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							X6Basic.spellRule.spellRule.list.otherParams = otherParams;

							X6Basic.spellRule.spellRule.list.showDialog('${editView.url}?entityCode=X6Basic_1.0_spellRule&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_spellRule_list'+'&id=' + X6Basic.spellRule.spellRule.list.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}list_modify_modify_X6Basic_1.0_spellRule_list')}",'X6Basic_spellRule_spellRule_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=X6Basic_1.0_spellRule'+signatureStr+'&id=' + X6Basic.spellRule.spellRule.list.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}list_modify_modify_X6Basic_1.0_spellRule_list')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method X6Basic.spellRule.spellRule.list.dbmodifylist
			 */
			X6Basic.spellRule.spellRule.list.dbmodifylist =function(event,oRow){
				var buttonCode='X6Basic_1.0_spellRule_list_BUTTON_modify';
				var cid = ec_X6Basic_spellRule_spellRule_list_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}list_modify_modify_X6Basic_1.0_spellRule_list&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}list_modify_modify_X6Basic_1.0_spellRule_list";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}list_modify_modify_X6Basic_1.0_spellRule_list'] == true) {
					var url = "${editView.url}?entityCode=X6Basic_1.0_spellRule&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_spellRule_list'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}list_modify_modify_X6Basic_1.0_spellRule_list')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = X6Basic.spellRule.spellRule.list.getOperateRecordId();
					otherParams.uploadBtn = X6Basic.spellRule.spellRule.list.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = X6Basic.spellRule.spellRule.list.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = X6Basic.spellRule.spellRule.list.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = X6Basic.spellRule.spellRule.list.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					X6Basic.spellRule.spellRule.list.otherParams = otherParams;

					X6Basic.spellRule.spellRule.list.showDialog(url,'X6Basic_spellRule_spellRule_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '/X6Basic/spellRule/spellRule/ruleView.action';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							var otherParams = {};
							otherParams.viewShowType = 'VIEW';
							otherParams.dialogType = '4';
							X6Basic.spellRule.spellRule.list.otherParams = otherParams;
							X6Basic.spellRule.spellRule.list.showDialog(viewUrl + "?entityCode=X6Basic_1.0_spellRule&id=" + oRow.id,'X6Basic_spellRule_spellRule_ruleView_form','${getText('X6Basic.viewtitle.radion1398317042085')}',500,260,'X6Basic_1.0_spellRule_ruleView',buttonCode);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/X6Basic/spellRule/spellRule/delete.action?ids=" + X6Basic.spellRule.spellRule.list.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}list_del_del_X6Basic_1.0_spellRule_list')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,X6Basic.spellRule.spellRule.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method X6Basic.spellRule.spellRule.list.dellist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.spellRule.spellRule.list.dellist = function(param) {
				var buttonCode='X6Basic_1.0_spellRule_list_BUTTON_del';
				if(X6Basic.spellRule.spellRule.list.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows.length ; i++){
                        var cid = datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
					CUI.Dialog.confirm("${getText('X6Basic.confirmcontent.radion1398317193187')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/X6Basic/spellRule/spellRule/delete.action?ids=" + X6Basic.spellRule.spellRule.list.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}list_del_del_X6Basic_1.0_spellRule_list')}", X6Basic.spellRule.spellRule.callBackInfo, "json");
					}
				});
				}
			};
			
	
	/**
	 * 保存完毕回调
	 * @method X6Basic.spellRule.spellRule.callBackInfo
	 */
	X6Basic.spellRule.spellRule.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('X6Basic_spellRule_spellRule_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{X6Basic.spellRule.spellRule.list.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_X6Basic_spellRule_spellRule_list_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_spellRule_spellRule_list_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof X6Basic_spellRule_spellRule_list_getLayout == "function"){
							    		var layout = X6Basic_spellRule_spellRule_list_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	X6Basic.spellRule.spellRule.list.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'X6Basic_1.0_spellRule_SpellRule'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false;
									if(typeof X6Basic_spellRule_spellRule_list_getLayout == "function"){
										var layout = X6Basic_spellRule_spellRule_list_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	X6Basic.spellRule.spellRule.list.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		X6Basic.spellRule.spellRule.list.query('query',_Current_PageNo,needSort);
								    	} else {
								    		X6Basic.spellRule.spellRule.list.query('query');
								    	}
										if(modelCode == 'X6Basic_1.0_spellRule_SpellRule'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		X6Basic.spellRule.spellRule.list.query('query',_Current_PageNo,needSort);
								    	} else {
								    		X6Basic.spellRule.spellRule.list.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_X6Basic_spellRule_spellRule_list_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_spellRule_spellRule_list_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof X6Basic_spellRule_spellRule_list_getLayout == "function"){
								    		var layout = X6Basic_spellRule_spellRule_list_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.spellRule.spellRule.list.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'X6Basic_1.0_spellRule_SpellRule'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.spellRule.spellRule.list.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false;
										if(typeof X6Basic_spellRule_spellRule_list_getLayout == "function"){
											var layout = X6Basic_spellRule_spellRule_list_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.spellRule.spellRule.list.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.spellRule.spellRule.list.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.spellRule.spellRule.list.query('query');
									    	}
											if(modelCode == 'X6Basic_1.0_spellRule_SpellRule'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.spellRule.spellRule.list.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.spellRule.spellRule.list.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.spellRule.spellRule.list.query('query');
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
	 * @method X6Basic.spellRule.spellRule.list.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	X6Basic.spellRule.spellRule.list.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method X6Basic.spellRule.spellRule.list.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	X6Basic.spellRule.spellRule.list.checkSelectedValid = function(type) {
		if(X6Basic.spellRule.spellRule.list.checkSelectedAny()){
			for(var i=0;i<datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows[i].valid === false){
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
	 * @method X6Basic.spellRule.spellRule.list.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.spellRule.spellRule.list.checkSelectedAny = function() {
		if(datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method X6Basic.spellRule.spellRule.list.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.spellRule.spellRule.list.checkSelectedMore = function() {
		if(datatable_ec_X6Basic_spellRule_spellRule_list_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method X6Basic.spellRule.spellRule.list.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.spellRule.spellRule.list.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = X6Basic.spellRule.spellRule.list.otherParams || {};
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
				<#assign editView = getViewByCode('X6Basic_1.0_spellRule_edit')>
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
												list_operate_spellRule_list.${funcname};
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
					list_operate_spellRule_list.CUI('#'+formId).submit();
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
		if ( X6Basic.spellRule.spellRule.list.Dlg ) {
			X6Basic.spellRule.spellRule.list.Dlg._config.url = url;
			X6Basic.spellRule.spellRule.list.Dlg._config.formId = formId;
			X6Basic.spellRule.spellRule.list.Dlg.setTitle( title )
			X6Basic.spellRule.spellRule.list.Dlg.setButtonbar( buttons );
		}else{
			X6Basic.spellRule.spellRule.list.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_spellRule_list',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		X6Basic.spellRule.spellRule.list.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		X6Basic.spellRule.spellRule.list.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_spellRule_spellRule', element : $('#X6Basic_spellRule_spellRule_list_fileupload_button a:eq(1)')});
		}
		X6Basic.spellRule.spellRule.list.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.spellRule.spellRule.list.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.spellRule.spellRule.list.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.spellRule.spellRule.list.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{X6Basic.spellRule.spellRule.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.spellRule.spellRule.list.AppDlg.show();
	};

	X6Basic.spellRule.spellRule.list.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof X6Basic.spellRule.spellRule.list.beforeCommonQuery === 'function') {
	   		var ret = X6Basic.spellRule.spellRule.list.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof X6Basic.spellRule.spellRule.list.cancelSelectedNode == 'function') {
	   X6Basic.spellRule.spellRule.list.cancelSelectedNode();
	   X6Basic.spellRule.spellRule.list.node = null;
	  }
	  if(typeof X6Basic_spellRule_spellRule_list_cancelSelectedNode == 'function') {
	   X6Basic_spellRule_spellRule_list_cancelSelectedNode();
	   X6Basic.spellRule.spellRule.list.node = null;
	  }
	  X6Basic.spellRule.spellRule.list.query(type);
	 };
	
	/**
	 * 查询
	 * @method X6Basic.spellRule.spellRule.list.query
	 */
	X6Basic.spellRule.spellRule.list.query = function(type,pageNo,sortFlag){
		var node = X6Basic.spellRule.spellRule.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//X6Basic.spellRule.spellRule.list.node = null;
		if(!checkListValid("ec_X6Basic_spellRule_spellRule_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_X6Basic_spellRule_spellRule_list_query._sortKey && datatable_ec_X6Basic_spellRule_spellRule_list_query._sortMethod){
			CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_spellRule_spellRule_list_query._sortKey);
			CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_spellRule_spellRule_list_query._sortColumnName);
			CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_spellRule_spellRule_list_query._sortMethod);
		}else{
			datatable_ec_X6Basic_spellRule_spellRule_list_query._sortKey = '';
			CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_X6Basic_spellRule_spellRule_list_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "X6Basic.spellRule.spellRule.list.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/X6Basic/spellRule/spellRule/list-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/X6Basic/spellRule/spellRule/list-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_spellRule_spellRule_list_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="X6Basic_1.0_spellRule_list";
		condobj.modelAlias="spellRule";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_X6Basic_spellRule_spellRule_list_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_X6Basic_spellRule_spellRule_list_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_X6Basic_spellRule_spellRule_list_quickquery_info[fieldName].dbColumnType;
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
							if(ec_X6Basic_spellRule_spellRule_list_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name="'+ec_X6Basic_spellRule_spellRule_list_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_X6Basic_spellRule_spellRule_list_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_X6Basic_spellRule_spellRule_list_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_X6Basic_spellRule_spellRule_list_quickquery_info["MainTableName"];
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
						var layrec=ec_X6Basic_spellRule_spellRule_list_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_X6Basic_spellRule_spellRule_list_query_PageLink_PageCount"]').val();
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
			permissionCode = 'X6Basic_1.0_spellRule_list';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_X6Basic_spellRule_spellRule_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_X6Basic_spellRule_spellRule_list_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	X6Basic.spellRule.spellRule.list.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_spellRule";
		openExportFrame(url);
	}
X6Basic.spellRule.spellRule.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	X6Basic.spellRule.spellRule.list.otherParams = {};
	X6Basic.spellRule.spellRule.list.otherParams.dialogType = dialogType;
	X6Basic.spellRule.spellRule.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.spellRule.spellRule.list.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.spellRule.spellRule.editCallBackInfo
 */
X6Basic.spellRule.spellRule.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_X6Basic_spellRule_spellRule_list_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_spellRule_spellRule_list_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_spellRule_spellRule_list_getLayout == "function"){
    		var layout = X6Basic_spellRule_spellRule_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.spellRule.spellRule.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'X6Basic_1.0_spellRule_SpellRule'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_X6Basic_spellRule_spellRule_list_queryWidget._sortKey && ec_X6Basic_spellRule_spellRule_list_queryWidget._sortMethod ? true : false;
		if(typeof X6Basic_spellRule_spellRule_list_getLayout == "function"){
			var layout = X6Basic_spellRule_spellRule_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.spellRule.spellRule.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.spellRule.spellRule.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.spellRule.spellRule.list.query('query');
	    	}
			if(modelCode == 'X6Basic_1.0_spellRule_SpellRule'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.spellRule.spellRule.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.spellRule.spellRule.list.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-X6Basic_1.0_spellRule_list,js,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='X6Basic_1.0_spellRule_list' idprefix='ec_X6Basic_spellRule_spellRule_list' queryUrl='/X6Basic/spellRule/spellRule/list-query.action' queryFunc="X6Basic.spellRule.spellRule.list.query" ns="X6Basic.spellRule.spellRule.list" />
<@exportexcel action="/X6Basic/spellRule/spellRule/list-query.action"   getRequireDataAction="/X6Basic/spellRule/spellRule/list-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=X6Basic_1.0_spellRule_SpellRule&&viewCode=X6Basic_1.0_spellRule_list" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_spellRule_list')}" prefix="ec_X6Basic_spellRule_spellRule_list_query" modelCode="X6Basic_1.0_spellRule_SpellRule"  importFlag="false" viewCode="X6Basic_1.0_spellRule_list" />
