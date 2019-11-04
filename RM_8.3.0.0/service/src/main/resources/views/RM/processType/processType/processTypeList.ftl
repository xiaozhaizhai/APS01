<!-- RM_7.5.0.0/processType/processTypeList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487074417938')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_processType_processTypeList,head,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) -->
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
	CUI.ns('RM.processType.processType','RM.processType.processType.processTypeList');
</script>
<@frameset id="ec_RM_processType_processType_processTypeList_container" border=0>
	<@frame id="ec_RM_processType_processType_processTypeList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "processTypeList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_processType_processTypeList,html,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.processType.processType.processTypeList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.processType.processType.processTypeList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.processType.processType.processTypeList._prefix += '.';
			}
			RM.processType.processType.processTypeList._prefix += arr[i];
		}
		RM.processType.processType.processTypeList._suffix = arr[arr.length -1];
		if(RM.processType.processType.processTypeList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.processType.processType.processTypeList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.processType.processType.processTypeList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.processType.processType.processTypeList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.processType.processType.processTypeList.getcallBackInfo = function(obj){
		CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name="'+RM.processType.processType.processTypeList._prefix + '.' + RM.processType.processType.processTypeList._suffix +'"]').val(obj[0][RM.processType.processType.processTypeList._suffix]);
		CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name="'+RM.processType.processType.processTypeList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name^="'+RM.processType.processType.processTypeList._prefix + '."]').unbind("change");
		CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name="'+RM.processType.processType.processTypeList._prefix + '.' + RM.processType.processType.processTypeList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.processType.processType.processTypeList._dialog) {
			RM.processType.processType.processTypeList._dialog.close();
		}
	};
	
	RM.processType.processType.processTypeList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.processType.processType.processTypeList.query_"+obj+")!='undefined'") ? eval('RM.processType.processType.processTypeList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
RM_processType_processType_processTypeList_refresh = function(node){
RM.processType.processType.processTypeList.node = node;
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
	RM.processType.processType.processTypeList.query("query");
}

RM_processType_processType_processTypeList_getList = function() {
	return "RM.processType.processType.processTypeList";
}
RM.processType.processType.processTypeList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_processType_processType_processTypeListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.processType.processType.processTypeList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.processType.processType.processTypeList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_processType_processType_processTypeList_fileupload_button",
		handler:function(){
				list_operate_processType_processTypeList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.processType.processType.processTypeList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_processType_processTypeList.RM.processType.processType." + params.viewName + ".referenceCopy");
			funcName('processType', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.processType.processType.processTypeList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_processType_processTypeList.RM.processType.processType." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.processType.processType.processTypeList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_processType_processTypeList.RM.processType.processType." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('RM_7.5.0.0_processType_processTypeEdit')>
			/**
			 * 列表新增
			 * @method RM.processType.processType.processTypeList.addprocessTypeList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.processType.processType.processTypeList.addprocessTypeList = function() {
				var buttonCode='RM_7.5.0.0_processType_processTypeList_BUTTON_add';
					var treeParam = "";
					if(typeof RM_processType_processType_processTypeList_getLayout == "function"){
						var layout = RM_processType_processType_processTypeList_getLayout();
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
							if(modelCode == 'RM_7.5.0.0_processType_ProcessType'.replace(/\./g, '\_')){
								treeParam = '&processType.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&processType.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = RM.processType.processType.processTypeList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = RM.processType.processType.processTypeList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						RM.processType.processType.processTypeList.otherParams = otherParams;

						var url='${editView.url}?entityCode=RM_7.5.0.0_processType' + "&${getPowerCode('${buttonPerfix!}processTypeList_add_add_RM_7.5.0.0_processType_processTypeList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_processType_processTypeList';
						RM.processType.processType.processTypeList.showDialog(url,'RM_processType_processType_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=RM_7.5.0.0_processType' + "&${getPowerCode('${buttonPerfix!}processTypeList_add_add_RM_7.5.0.0_processType_processTypeList')}";
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
			
			<#assign editView = getViewByCode('RM_7.5.0.0_processType_processTypeEdit')>
			/**
			 * 列表编辑
			 * @method RM.processType.processType.processTypeList.modifyprocessTypeList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.processType.processType.processTypeList.modifyprocessTypeList = function() {
				var buttonCode='RM_7.5.0.0_processType_processTypeList_BUTTON_modify';
				if(RM.processType.processType.processTypeList.checkSelectedAny()){
					if(RM.processType.processType.processTypeList.checkSelectedMore()) {
						var cid = ec_RM_processType_processType_processTypeList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = RM.processType.processType.processTypeList.getOperateRecordId();
							otherParams.uploadBtn = RM.processType.processType.processTypeList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = RM.processType.processType.processTypeList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = RM.processType.processType.processTypeList.createPrintBtn('${editView.name}','${editView.url}?entityCode=RM_7.5.0.0_processType&id=' + RM.processType.processType.processTypeList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}processTypeList_modify_modify_RM_7.5.0.0_processType_processTypeList')}");
							otherParams.printSettingBtn = RM.processType.processType.processTypeList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							RM.processType.processType.processTypeList.otherParams = otherParams;

							RM.processType.processType.processTypeList.showDialog('${editView.url}?entityCode=RM_7.5.0.0_processType&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_processType_processTypeList'+'&id=' + RM.processType.processType.processTypeList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}processTypeList_modify_modify_RM_7.5.0.0_processType_processTypeList')}",'RM_processType_processType_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=RM_7.5.0.0_processType'+signatureStr+'&id=' + RM.processType.processType.processTypeList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}processTypeList_modify_modify_RM_7.5.0.0_processType_processTypeList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method RM.processType.processType.processTypeList.dbmodifyprocessTypeList
			 */
			RM.processType.processType.processTypeList.dbmodifyprocessTypeList =function(event,oRow){
				var buttonCode='RM_7.5.0.0_processType_processTypeList_BUTTON_modify';
				var cid = ec_RM_processType_processType_processTypeList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}processTypeList_modify_modify_RM_7.5.0.0_processType_processTypeList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}processTypeList_modify_modify_RM_7.5.0.0_processType_processTypeList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}processTypeList_modify_modify_RM_7.5.0.0_processType_processTypeList'] == true) {
					var url = "${editView.url}?entityCode=RM_7.5.0.0_processType&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_processType_processTypeList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}processTypeList_modify_modify_RM_7.5.0.0_processType_processTypeList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = RM.processType.processType.processTypeList.getOperateRecordId();
					otherParams.uploadBtn = RM.processType.processType.processTypeList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = RM.processType.processType.processTypeList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = RM.processType.processType.processTypeList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = RM.processType.processType.processTypeList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					RM.processType.processType.processTypeList.otherParams = otherParams;

					RM.processType.processType.processTypeList.showDialog(url,'RM_processType_processType_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
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
							openFullScreen(viewUrl + "?entityCode=RM_7.5.0.0_processType&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/RM/processType/processType/delete.action?ids=" + RM.processType.processType.processTypeList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}processTypeList_delete_del_RM_7.5.0.0_processType_processTypeList')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,RM.processType.processType.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method RM.processType.processType.processTypeList.delprocessTypeList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.processType.processType.processTypeList.delprocessTypeList = function(param) {
				var buttonCode='RM_7.5.0.0_processType_processTypeList_BUTTON_delete';
				if(RM.processType.processType.processTypeList.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_RM_processType_processType_processTypeList_query.selectedRows.length ; i++){
                        var cid = datatable_ec_RM_processType_processType_processTypeList_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_RM_processType_processType_processTypeList_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("RM.buttonPropertyshowName.radion148707478751923")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/RM/processType/processType/delete.action?ids=" + RM.processType.processType.processTypeList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}processTypeList_delete_del_RM_7.5.0.0_processType_processTypeList')}", RM.processType.processType.callBackInfo, "json");
					}
				});
				}
			};
			
	
	/**
	 * 保存完毕回调
	 * @method RM.processType.processType.callBackInfo
	 */
	RM.processType.processType.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_processType_processType_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.processType.processType.processTypeList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_RM_processType_processType_processTypeList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_processType_processType_processTypeList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof RM_processType_processType_processTypeList_getLayout == "function"){
							    		var layout = RM_processType_processType_processTypeList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.processType.processType.processTypeList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false;
									if(typeof RM_processType_processType_processTypeList_getLayout == "function"){
										var layout = RM_processType_processType_processTypeList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.processType.processType.processTypeList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.processType.processType.processTypeList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.processType.processType.processTypeList.query('query');
								    	}
										if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.processType.processType.processTypeList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.processType.processType.processTypeList.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_RM_processType_processType_processTypeList_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_processType_processType_processTypeList_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof RM_processType_processType_processTypeList_getLayout == "function"){
								    		var layout = RM_processType_processType_processTypeList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.processType.processType.processTypeList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.processType.processType.processTypeList.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false;
										if(typeof RM_processType_processType_processTypeList_getLayout == "function"){
											var layout = RM_processType_processType_processTypeList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.processType.processType.processTypeList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.processType.processType.processTypeList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.processType.processType.processTypeList.query('query');
									    	}
											if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.processType.processType.processTypeList.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.processType.processType.processTypeList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.processType.processType.processTypeList.query('query');
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
	 * @method RM.processType.processType.processTypeList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.processType.processType.processTypeList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_processType_processType_processTypeList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_processType_processType_processTypeList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_processType_processType_processTypeList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.processType.processType.processTypeList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.processType.processType.processTypeList.checkSelectedValid = function(type) {
		if(RM.processType.processType.processTypeList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_processType_processType_processTypeList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_processType_processType_processTypeList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_processType_processType_processTypeList_query.selectedRows[i].valid === false){
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
	 * @method RM.processType.processType.processTypeList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.processType.processType.processTypeList.checkSelectedAny = function() {
		if(datatable_ec_RM_processType_processType_processTypeList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.processType.processType.processTypeList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.processType.processType.processTypeList.checkSelectedMore = function() {
		if(datatable_ec_RM_processType_processType_processTypeList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.processType.processType.processTypeList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.processType.processType.processTypeList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.processType.processType.processTypeList.otherParams || {};
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
				<#assign editView = getViewByCode('RM_7.5.0.0_processType_processTypeEdit')>
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
												list_operate_processType_processTypeList.${funcname};
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
					list_operate_processType_processTypeList.CUI('#'+formId).submit();
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
		if ( RM.processType.processType.processTypeList.Dlg ) {
			RM.processType.processType.processTypeList.Dlg._config.url = url;
			RM.processType.processType.processTypeList.Dlg._config.formId = formId;
			RM.processType.processType.processTypeList.Dlg.setTitle( title )
			RM.processType.processType.processTypeList.Dlg.setButtonbar( buttons );
		}else{
			RM.processType.processType.processTypeList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_processType_processTypeList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.processType.processType.processTypeList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.processType.processType.processTypeList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_processType_processType', element : $('#RM_processType_processType_processTypeList_fileupload_button a:eq(1)')});
		}
		RM.processType.processType.processTypeList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method RM.processType.processType.processTypeList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	RM.processType.processType.processTypeList.approvalDialog = function(url,formId,title,width,height) {
		RM.processType.processType.processTypeList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{RM.processType.processType.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		RM.processType.processType.processTypeList.AppDlg.show();
	};

	RM.processType.processType.processTypeList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.processType.processType.processTypeList.beforeCommonQuery === 'function') {
	   		var ret = RM.processType.processType.processTypeList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.processType.processType.processTypeList.cancelSelectedNode == 'function') {
	   RM.processType.processType.processTypeList.cancelSelectedNode();
	   RM.processType.processType.processTypeList.node = null;
	  }
	  if(typeof RM_processType_processType_processTypeList_cancelSelectedNode == 'function') {
	   RM_processType_processType_processTypeList_cancelSelectedNode();
	   RM.processType.processType.processTypeList.node = null;
	  }
	  RM.processType.processType.processTypeList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.processType.processType.processTypeList.query
	 */
	RM.processType.processType.processTypeList.query = function(type,pageNo,sortFlag){
		var node = RM.processType.processType.processTypeList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.processType.processType.processTypeList.node = null;
		if(!checkListValid("ec_RM_processType_processType_processTypeList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_processType_processType_processTypeList_query._sortKey && datatable_ec_RM_processType_processType_processTypeList_query._sortMethod){
			CUI('#ec_RM_processType_processType_processTypeList_queryForm #dataTableSortColKey').val(datatable_ec_RM_processType_processType_processTypeList_query._sortKey);
			CUI('#ec_RM_processType_processType_processTypeList_queryForm #dataTableSortColName').val(datatable_ec_RM_processType_processType_processTypeList_query._sortColumnName);
			CUI('#ec_RM_processType_processType_processTypeList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_processType_processType_processTypeList_query._sortMethod);
		}else{
			datatable_ec_RM_processType_processType_processTypeList_query._sortKey = '';
			CUI('#ec_RM_processType_processType_processTypeList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_processType_processType_processTypeList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_processType_processType_processTypeList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_RM_processType_processType_processTypeList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.processType.processType.processTypeList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/processType/processType/processTypeList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/processType/processType/processTypeList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_processType_processType_processTypeList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_processType_processType_processTypeList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_processType_processTypeList";
		condobj.modelAlias="processType";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_processType_processType_processTypeList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_processType_processType_processTypeList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_processType_processType_processTypeList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_processType_processType_processTypeList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_processType_processType_processTypeList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name="'+ec_RM_processType_processType_processTypeList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_processType_processType_processTypeList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_processType_processType_processTypeList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_processType_processType_processTypeList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_processType_processType_processTypeList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_processType_processType_processTypeList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'RM_7.5.0.0_processType_processTypeList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_processType_processType_processTypeList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_processType_processType_processTypeList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.processType.processType.processTypeList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_processType";
		openExportFrame(url);
	}
RM.processType.processType.processTypeList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.processType.processType.processTypeList.otherParams = {};
	RM.processType.processType.processTypeList.otherParams.dialogType = dialogType;
	RM.processType.processType.processTypeList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.processType.processType.processTypeList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.processType.processType.editCallBackInfo
 */
RM.processType.processType.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_processType_processType_processTypeList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_processType_processType_processTypeList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_processType_processType_processTypeList_getLayout == "function"){
    		var layout = RM_processType_processType_processTypeList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.processType.processType.processTypeList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_processType_processType_processTypeList_queryWidget._sortKey && ec_RM_processType_processType_processTypeList_queryWidget._sortMethod ? true : false;
		if(typeof RM_processType_processType_processTypeList_getLayout == "function"){
			var layout = RM_processType_processType_processTypeList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.processType.processType.processTypeList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.processType.processType.processTypeList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.processType.processType.processTypeList.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.processType.processType.processTypeList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.processType.processType.processTypeList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_processType_processTypeList,js,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_processType_processTypeList' idprefix='ec_RM_processType_processType_processTypeList' queryUrl='/RM/processType/processType/processTypeList-query.action' queryFunc="RM.processType.processType.processTypeList.query" ns="RM.processType.processType.processTypeList" />
<@exportexcel action="/RM/processType/processType/processTypeList-query.action"   getRequireDataAction="/RM/processType/processType/processTypeList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_processType_ProcessType&&viewCode=RM_7.5.0.0_processType_processTypeList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_processType_processTypeList')}" prefix="ec_RM_processType_processType_processTypeList_query" modelCode="RM_7.5.0.0_processType_ProcessType"  importFlag="false" viewCode="RM_7.5.0.0_processType_processTypeList" />
