<!-- WOM_7.5.0.0/manulOrder/manulOrderList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1563263773513')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_manulOrder_manulOrderList,head,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.manulOrder.manulOrderMain','WOM.manulOrder.manulOrderMain.manulOrderList');
</script>
<@frameset id="ec_WOM_manulOrder_manulOrderMain_manulOrderList_container" border=0>
	<@frame id="ec_WOM_manulOrder_manulOrderMain_manulOrderList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "manulOrderList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_manulOrder_manulOrderList,html,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.manulOrder.manulOrderMain.manulOrderList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.manulOrder.manulOrderMain.manulOrderList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.manulOrder.manulOrderMain.manulOrderList._prefix += '.';
			}
			WOM.manulOrder.manulOrderMain.manulOrderList._prefix += arr[i];
		}
		WOM.manulOrder.manulOrderMain.manulOrderList._suffix = arr[arr.length -1];
		if(WOM.manulOrder.manulOrderMain.manulOrderList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.manulOrder.manulOrderMain.manulOrderList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.manulOrder.manulOrderMain.manulOrderList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.manulOrder.manulOrderMain.manulOrderList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.manulOrder.manulOrderMain.manulOrderList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name="'+WOM.manulOrder.manulOrderMain.manulOrderList._prefix + '.' + WOM.manulOrder.manulOrderMain.manulOrderList._suffix +'"]').val(obj[0][WOM.manulOrder.manulOrderMain.manulOrderList._suffix]);
		CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name="'+WOM.manulOrder.manulOrderMain.manulOrderList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name^="'+WOM.manulOrder.manulOrderMain.manulOrderList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name="'+WOM.manulOrder.manulOrderMain.manulOrderList._prefix + '.' + WOM.manulOrder.manulOrderMain.manulOrderList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.manulOrder.manulOrderMain.manulOrderList._dialog) {
			WOM.manulOrder.manulOrderMain.manulOrderList._dialog.close();
		}
	};
	
	WOM.manulOrder.manulOrderMain.manulOrderList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.manulOrder.manulOrderMain.manulOrderList.query_"+obj+")!='undefined'") ? eval('WOM.manulOrder.manulOrderMain.manulOrderList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_manulOrder_manulOrderMain_manulOrderList_refresh = function(node){
WOM.manulOrder.manulOrderMain.manulOrderList.node = node;
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
	WOM.manulOrder.manulOrderMain.manulOrderList.query("query");
}

WOM_manulOrder_manulOrderMain_manulOrderList_getList = function() {
	return "WOM.manulOrder.manulOrderMain.manulOrderList";
}
WOM.manulOrder.manulOrderMain.manulOrderList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_manulOrder_manulOrderMain_manulOrderListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.manulOrder.manulOrderMain.manulOrderList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.manulOrder.manulOrderMain.manulOrderList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_manulOrder_manulOrderMain_manulOrderList_fileupload_button",
		handler:function(){
				list_operate_manulOrder_manulOrderList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.manulOrder.manulOrderMain.manulOrderList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_manulOrder_manulOrderList.WOM.manulOrder.manulOrderMain." + params.viewName + ".referenceCopy");
			funcName('manulOrderMain', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.manulOrder.manulOrderMain.manulOrderList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_manulOrder_manulOrderList.WOM.manulOrder.manulOrderMain." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.manulOrder.manulOrderMain.manulOrderList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_manulOrder_manulOrderList.WOM.manulOrder.manulOrderMain." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('WOM_7.5.0.0_manulOrder_manulOrdersEdit')>
			/**
			 * 列表新增
			 * @method WOM.manulOrder.manulOrderMain.manulOrderList.addmanulOrderList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.manulOrder.manulOrderMain.manulOrderList.addmanulOrderList = function() {
				var buttonCode='WOM_7.5.0.0_manulOrder_manulOrderList_BUTTON_add';
					var treeParam = "";
					if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_getLayout == "function"){
						var layout = WOM_manulOrder_manulOrderMain_manulOrderList_getLayout();
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
							if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMain'.replace(/\./g, '\_')){
								treeParam = '&manulOrderMain.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&manulOrderMain.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						WOM.manulOrder.manulOrderMain.manulOrderList.otherParams = otherParams;

						var url='${editView.url}?entityCode=WOM_7.5.0.0_manulOrder' + "&${getPowerCode('${buttonPerfix!}manulOrderList_add_add_WOM_7.5.0.0_manulOrder_manulOrderList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_manulOrder_manulOrderList';
						WOM.manulOrder.manulOrderMain.manulOrderList.showDialog(url,'WOM_manulOrder_manulOrderMain_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=WOM_7.5.0.0_manulOrder' + "&${getPowerCode('${buttonPerfix!}manulOrderList_add_add_WOM_7.5.0.0_manulOrder_manulOrderList')}";
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
			
			<#assign editView = getViewByCode('WOM_7.5.0.0_manulOrder_manulOrdersEdit')>
			/**
			 * 列表编辑
			 * @method WOM.manulOrder.manulOrderMain.manulOrderList.modifymanulOrderList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.manulOrder.manulOrderMain.manulOrderList.modifymanulOrderList = function() {
				var buttonCode='WOM_7.5.0.0_manulOrder_manulOrderList_BUTTON_modify';
				if(WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedAny()){
					if(WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedMore()) {
						var cid = ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId();
							otherParams.uploadBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createPrintBtn('${editView.name}','${editView.url}?entityCode=WOM_7.5.0.0_manulOrder&id=' + WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}manulOrderList_modify_modify_WOM_7.5.0.0_manulOrder_manulOrderList')}");
							otherParams.printSettingBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							WOM.manulOrder.manulOrderMain.manulOrderList.otherParams = otherParams;

							WOM.manulOrder.manulOrderMain.manulOrderList.showDialog('${editView.url}?entityCode=WOM_7.5.0.0_manulOrder&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_manulOrder_manulOrderList'+'&id=' + WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}manulOrderList_modify_modify_WOM_7.5.0.0_manulOrder_manulOrderList')}",'WOM_manulOrder_manulOrderMain_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=WOM_7.5.0.0_manulOrder'+signatureStr+'&id=' + WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}manulOrderList_modify_modify_WOM_7.5.0.0_manulOrder_manulOrderList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method WOM.manulOrder.manulOrderMain.manulOrderList.dbmodifymanulOrderList
			 */
			WOM.manulOrder.manulOrderMain.manulOrderList.dbmodifymanulOrderList =function(event,oRow){
				var buttonCode='WOM_7.5.0.0_manulOrder_manulOrderList_BUTTON_modify';
				var cid = ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}manulOrderList_modify_modify_WOM_7.5.0.0_manulOrder_manulOrderList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}manulOrderList_modify_modify_WOM_7.5.0.0_manulOrder_manulOrderList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}manulOrderList_modify_modify_WOM_7.5.0.0_manulOrder_manulOrderList'] == true) {
					var url = "${editView.url}?entityCode=WOM_7.5.0.0_manulOrder&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_manulOrder_manulOrderList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}manulOrderList_modify_modify_WOM_7.5.0.0_manulOrder_manulOrderList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId();
					otherParams.uploadBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = WOM.manulOrder.manulOrderMain.manulOrderList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					WOM.manulOrder.manulOrderMain.manulOrderList.otherParams = otherParams;

					WOM.manulOrder.manulOrderMain.manulOrderList.showDialog(url,'WOM_manulOrder_manulOrderMain_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '/WOM/manulOrder/manulOrderMain/manulOrdersView.action';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_manulOrder&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/WOM/manulOrder/manulOrderMain/delete.action?ids=" + WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}manulOrderList_del_del_WOM_7.5.0.0_manulOrder_manulOrderList')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,WOM.manulOrder.manulOrderMain.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method WOM.manulOrder.manulOrderMain.manulOrderList.delmanulOrderList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.manulOrder.manulOrderMain.manulOrderList.delmanulOrderList = function(param) {
				var buttonCode='WOM_7.5.0.0_manulOrder_manulOrderList_BUTTON_del';
				if(WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows.length ; i++){
                        var cid = datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("WOM.buttonPropertyshowName.randon1563411368447.flag")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/WOM/manulOrder/manulOrderMain/delete.action?ids=" + WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}manulOrderList_del_del_WOM_7.5.0.0_manulOrder_manulOrderList')}", WOM.manulOrder.manulOrderMain.callBackInfo, "json");
					}
				});
				}
			};
			
				function finshClick() { 
							
				if (datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows.length == 0) {
					CUI.Dialog.alert("${getText('ec.common.checkselected')}");
				} else {
					//选择的行数	
					var rows = ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget.getSelectedRow();
					var orderIds = '';
					for (var i = 0; i < rows.length; i++) {	
							orderIds += ',' + rows[i].id;		
					}
					if (orderIds != '') {
						orderIds = orderIds.substr(1);
					}
					$.ajax({
						url: "/WOM/manulOrder/manulOrderMain/finshOrder.action",
						type: "POST",
						dataType: "json",
						data:{ "orderIDs": orderIds},
						success: function(result) {
							WOM.manulOrder.manulOrderMain.manulOrderList.commonQuery('query');
						}
					});
				}
			
				};
				function finshBackClick() { 
							
				if (datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows.length == 0) {
					CUI.Dialog.alert("${getText('ec.common.checkselected')}");
				} else {
					//选择的行数	
					var rows = ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget.getSelectedRow();
					var orderIds = '';
					for (var i = 0; i < rows.length; i++) {	
							orderIds += ',' + rows[i].id;		
					}
					if (orderIds != '') {
						orderIds = orderIds.substr(1);
					}
					$.ajax({
						url: "/WOM/manulOrder/manulOrderMain/finshOrder.action",
						type: "POST",
						dataType: "json",
						data:{"orderIDs": orderIds,"finshBack":"Y"},
						success: function(result) {
							WOM.manulOrder.manulOrderMain.manulOrderList.commonQuery('query');
						}
					});
				}
			
				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.manulOrder.manulOrderMain.callBackInfo
	 */
	WOM.manulOrder.manulOrderMain.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_manulOrder_manulOrderMain_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.manulOrder.manulOrderMain.manulOrderList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_getLayout == "function"){
							    		var layout = WOM_manulOrder_manulOrderMain_manulOrderList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.manulOrder.manulOrderMain.manulOrderList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMain'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false;
									if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_getLayout == "function"){
										var layout = WOM_manulOrder_manulOrderMain_manulOrderList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.manulOrder.manulOrderMain.manulOrderList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query');
								    	}
										if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMain'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_getLayout == "function"){
								    		var layout = WOM_manulOrder_manulOrderMain_manulOrderList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	WOM.manulOrder.manulOrderMain.manulOrderList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMain'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												WOM.manulOrder.manulOrderMain.manulOrderList.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false;
										if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_getLayout == "function"){
											var layout = WOM_manulOrder_manulOrderMain_manulOrderList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	WOM.manulOrder.manulOrderMain.manulOrderList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query');
									    	}
											if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMain'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												WOM.manulOrder.manulOrderMain.manulOrderList.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query');
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
	 * @method WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.manulOrder.manulOrderMain.manulOrderList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedValid = function(type) {
		if(WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows[i].valid === false){
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
	 * @method WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedAny = function() {
		if(datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.manulOrder.manulOrderMain.manulOrderList.checkSelectedMore = function() {
		if(datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.manulOrder.manulOrderMain.manulOrderList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.manulOrder.manulOrderMain.manulOrderList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.manulOrder.manulOrderMain.manulOrderList.otherParams || {};
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
				<#assign editView = getViewByCode('WOM_7.5.0.0_manulOrder_manulOrdersEdit')>
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
												list_operate_manulOrder_manulOrderList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_manulOrder_manulOrdersView'||!viewCode){
					}
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){
					list_operate_manulOrder_manulOrderList.CUI('#'+formId).submit();
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
		if ( WOM.manulOrder.manulOrderMain.manulOrderList.Dlg ) {
			WOM.manulOrder.manulOrderMain.manulOrderList.Dlg._config.url = url;
			WOM.manulOrder.manulOrderMain.manulOrderList.Dlg._config.formId = formId;
			WOM.manulOrder.manulOrderMain.manulOrderList.Dlg.setTitle( title )
			WOM.manulOrder.manulOrderMain.manulOrderList.Dlg.setButtonbar( buttons );
		}else{
			WOM.manulOrder.manulOrderMain.manulOrderList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_manulOrder_manulOrderList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.manulOrder.manulOrderMain.manulOrderList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.manulOrder.manulOrderMain.manulOrderList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_manulOrder_manulOrderMain', element : $('#WOM_manulOrder_manulOrderMain_manulOrderList_fileupload_button a:eq(1)')});
		}
		WOM.manulOrder.manulOrderMain.manulOrderList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.manulOrder.manulOrderMain.manulOrderList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.manulOrder.manulOrderMain.manulOrderList.approvalDialog = function(url,formId,title,width,height) {
		WOM.manulOrder.manulOrderMain.manulOrderList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.manulOrder.manulOrderMain.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.manulOrder.manulOrderMain.manulOrderList.AppDlg.show();
	};

	WOM.manulOrder.manulOrderMain.manulOrderList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.manulOrder.manulOrderMain.manulOrderList.beforeCommonQuery === 'function') {
	   		var ret = WOM.manulOrder.manulOrderMain.manulOrderList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.manulOrder.manulOrderMain.manulOrderList.cancelSelectedNode == 'function') {
	   WOM.manulOrder.manulOrderMain.manulOrderList.cancelSelectedNode();
	   WOM.manulOrder.manulOrderMain.manulOrderList.node = null;
	  }
	  if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_cancelSelectedNode == 'function') {
	   WOM_manulOrder_manulOrderMain_manulOrderList_cancelSelectedNode();
	   WOM.manulOrder.manulOrderMain.manulOrderList.node = null;
	  }
	  WOM.manulOrder.manulOrderMain.manulOrderList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.manulOrder.manulOrderMain.manulOrderList.query
	 */
	WOM.manulOrder.manulOrderMain.manulOrderList.query = function(type,pageNo,sortFlag){
		var node = WOM.manulOrder.manulOrderMain.manulOrderList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.manulOrder.manulOrderMain.manulOrderList.node = null;
		if(!checkListValid("ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query._sortKey && datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query._sortMethod){
			CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query._sortKey);
			CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm #dataTableSortColName').val(datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query._sortColumnName);
			CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query._sortMethod);
		}else{
			datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query._sortKey = '';
			CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.manulOrder.manulOrderMain.manulOrderList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/manulOrder/manulOrderMain/manulOrderList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/manulOrder/manulOrderMain/manulOrderList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_manulOrder_manulOrderList";
		condobj.modelAlias="manulOrderMain";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name="'+ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_manulOrder_manulOrderMain_manulOrderList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_manulOrder_manulOrderMain_manulOrderList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_manulOrder_manulOrderList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.manulOrder.manulOrderMain.manulOrderList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_manulOrder";
		openExportFrame(url);
	}
WOM.manulOrder.manulOrderMain.manulOrderList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.manulOrder.manulOrderMain.manulOrderList.otherParams = {};
	WOM.manulOrder.manulOrderMain.manulOrderList.otherParams.dialogType = dialogType;
	WOM.manulOrder.manulOrderMain.manulOrderList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.manulOrder.manulOrderMain.manulOrderList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.manulOrder.manulOrderMain.editCallBackInfo
 */
WOM.manulOrder.manulOrderMain.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_manulOrder_manulOrderMain_manulOrderList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_getLayout == "function"){
    		var layout = WOM_manulOrder_manulOrderMain_manulOrderList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.manulOrder.manulOrderMain.manulOrderList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMain'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMain_manulOrderList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_manulOrder_manulOrderMain_manulOrderList_getLayout == "function"){
			var layout = WOM_manulOrder_manulOrderMain_manulOrderList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.manulOrder.manulOrderMain.manulOrderList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMain'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.manulOrder.manulOrderMain.manulOrderList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_manulOrder_manulOrderList,js,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_manulOrder_manulOrderList' idprefix='ec_WOM_manulOrder_manulOrderMain_manulOrderList' queryUrl='/WOM/manulOrder/manulOrderMain/manulOrderList-query.action' queryFunc="WOM.manulOrder.manulOrderMain.manulOrderList.query" ns="WOM.manulOrder.manulOrderMain.manulOrderList" />
<@exportexcel action="/WOM/manulOrder/manulOrderMain/manulOrderList-query.action"   getRequireDataAction="/WOM/manulOrder/manulOrderMain/manulOrderList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_manulOrder_ManulOrderMain&&viewCode=WOM_7.5.0.0_manulOrder_manulOrderList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_manulOrder_manulOrderList')}" prefix="ec_WOM_manulOrder_manulOrderMain_manulOrderList_query" modelCode="WOM_7.5.0.0_manulOrder_ManulOrderMain"  importFlag="false" viewCode="WOM_7.5.0.0_manulOrder_manulOrderList" />
