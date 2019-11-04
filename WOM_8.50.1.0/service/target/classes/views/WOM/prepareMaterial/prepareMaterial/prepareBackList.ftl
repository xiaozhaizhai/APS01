<!-- WOM_7.5.0.0/prepareMaterial/prepareBackList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1566463020817')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_prepareMaterial_prepareBackList,head,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("WOM.prepareMaterial.prepareMaterial","WOM.prepareMaterial.prepareMaterial.prepareBackList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_container" border=0>
	<@frame id="ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "prepareBackList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_prepareMaterial_prepareBackList,html,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=WOM_7.5.0.0_prepareMaterial';
		openFullScreen(url);
	};
	
	WOM.prepareMaterial.prepareMaterial.prepareBackList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.prepareMaterial.prepareMaterial.prepareBackList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.prepareMaterial.prepareMaterial.prepareBackList._prefix += '.';
			}
			WOM.prepareMaterial.prepareMaterial.prepareBackList._prefix += arr[i];
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackList._suffix = arr[arr.length -1];
		if(WOM.prepareMaterial.prepareMaterial.prepareBackList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.prepareMaterial.prepareMaterial.prepareBackList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.prepareMaterial.prepareMaterial.prepareBackList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.prepareMaterial.prepareMaterial.prepareBackList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name="'+WOM.prepareMaterial.prepareMaterial.prepareBackList._prefix + '.' + WOM.prepareMaterial.prepareMaterial.prepareBackList._suffix +'"]').val(obj[0][WOM.prepareMaterial.prepareMaterial.prepareBackList._suffix]);
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name="'+WOM.prepareMaterial.prepareMaterial.prepareBackList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name^="'+WOM.prepareMaterial.prepareMaterial.prepareBackList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name="'+WOM.prepareMaterial.prepareMaterial.prepareBackList._prefix + '.' + WOM.prepareMaterial.prepareMaterial.prepareBackList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.prepareMaterial.prepareMaterial.prepareBackList._dialog) {
			WOM.prepareMaterial.prepareMaterial.prepareBackList._dialog.close();
		}
	};
	
	WOM.prepareMaterial.prepareMaterial.prepareBackList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.prepareMaterial.prepareMaterial.prepareBackList.query_"+obj+")!='undefined'") ? eval('WOM.prepareMaterial.prepareMaterial.prepareBackList.query_'+obj+'()') : null;
		return str;
	
	};
	
WOM.prepareMaterial.prepareMaterial.prepareBackList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=WOM_7.5.0.0_prepareMaterial&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	WOM.prepareMaterial.prepareMaterial.prepareBackList.rowDblClickQuery = function(event,row){
		WOM.prepareMaterial.prepareMaterial.prepareBackList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
WOM_prepareMaterial_prepareMaterial_prepareBackList_refresh = function(node){
WOM.prepareMaterial.prepareMaterial.prepareBackList.node = node;
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
	WOM.prepareMaterial.prepareMaterial.prepareBackList.query("query");
}

WOM_prepareMaterial_prepareMaterial_prepareBackList_getList = function() {
	return "WOM.prepareMaterial.prepareMaterial.prepareBackList";
}
WOM.prepareMaterial.prepareMaterial.prepareBackList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_prepareMaterial_prepareMaterial_prepareBackListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.prepareMaterial.prepareMaterial.prepareBackList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareBackList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_prepareMaterial_prepareMaterial_prepareBackList_fileupload_button",
		handler:function(){
				list_operate_prepareMaterial_prepareBackList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareBackList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareBackList.WOM.prepareMaterial.prepareMaterial." + params.viewName + ".referenceCopy");
			funcName('prepareMaterial', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareBackList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareBackList.WOM.prepareMaterial.prepareMaterial." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareBackList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareBackList.WOM.prepareMaterial.prepareMaterial." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('WOM_7.5.0.0_prepareMaterial_prepareMaterialEdit')>
			/**
			 * 列表新增
			 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.addprepareBackList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.prepareMaterial.prepareMaterial.prepareBackList.addprepareBackList = function() {
				var buttonCode='WOM_7.5.0.0_prepareMaterial_prepareBackList_BUTTON_add';
					var treeParam = "";
					if(typeof WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout == "function"){
						var layout = WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout();
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
							if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial'.replace(/\./g, '\_')){
								treeParam = '&prepareMaterial.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&prepareMaterial.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams = otherParams;

						var url='${editView.url}?entityCode=WOM_7.5.0.0_prepareMaterial' + "&superEdit=true&${getPowerCode('${buttonPerfix!}prepareBackList_add_add_WOM_7.5.0.0_prepareMaterial_prepareBackList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_prepareMaterial_prepareBackList';
						WOM.prepareMaterial.prepareMaterial.prepareBackList.showDialog(url,'WOM_prepareMaterial_prepareMaterial_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=WOM_7.5.0.0_prepareMaterial' + "&superEdit=true&${getPowerCode('${buttonPerfix!}prepareBackList_add_add_WOM_7.5.0.0_prepareMaterial_prepareBackList')}";
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
			
			<#assign editView = getViewByCode('WOM_7.5.0.0_prepareMaterial_prepareMaterialEdit')>
			/**
			 * 列表编辑
			 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.modifyprepareBackList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.prepareMaterial.prepareMaterial.prepareBackList.modifyprepareBackList = function() {
				var buttonCode='WOM_7.5.0.0_prepareMaterial_prepareBackList_BUTTON_mod';
				if(WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedAny()){
					if(WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedMore()) {
						var cid = ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = WOM.prepareMaterial.prepareMaterial.prepareBackList.getOperateRecordId();
							otherParams.uploadBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createPrintBtn('${editView.name}','${editView.url}?entityCode=WOM_7.5.0.0_prepareMaterial&id=' + WOM.prepareMaterial.prepareMaterial.prepareBackList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}prepareBackList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareBackList')}");
							otherParams.printSettingBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams = otherParams;

							WOM.prepareMaterial.prepareMaterial.prepareBackList.showDialog('${editView.url}?entityCode=WOM_7.5.0.0_prepareMaterial&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_prepareMaterial_prepareBackList'+'&id=' + WOM.prepareMaterial.prepareMaterial.prepareBackList.getOperateRecordId() + "&superEdit=true&${getPowerCode('${buttonPerfix!}prepareBackList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareBackList')}",'WOM_prepareMaterial_prepareMaterial_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=WOM_7.5.0.0_prepareMaterial'+signatureStr+'&id=' + WOM.prepareMaterial.prepareMaterial.prepareBackList.getOperateRecordId() + "&superEdit=true&${getPowerCode('${buttonPerfix!}prepareBackList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareBackList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.dbmodifyprepareBackList
			 */
			WOM.prepareMaterial.prepareMaterial.prepareBackList.dbmodifyprepareBackList =function(event,oRow){
				var buttonCode='WOM_7.5.0.0_prepareMaterial_prepareBackList_BUTTON_mod';
				var cid = ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}prepareBackList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareBackList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}prepareBackList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareBackList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}prepareBackList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareBackList'] == true) {
					var url = "${editView.url}?entityCode=WOM_7.5.0.0_prepareMaterial&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_prepareMaterial_prepareBackList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}prepareBackList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareBackList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = WOM.prepareMaterial.prepareMaterial.prepareBackList.getOperateRecordId();
					otherParams.uploadBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = WOM.prepareMaterial.prepareMaterial.prepareBackList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams = otherParams;

					WOM.prepareMaterial.prepareMaterial.prepareBackList.showDialog(url,'WOM_prepareMaterial_prepareMaterial_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '/WOM/prepareMaterial/prepareMaterial/prepareMaterialView.action';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_prepareMaterial&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
	
	/**
	 * 保存完毕回调
	 * @method WOM.prepareMaterial.prepareMaterial.callBackInfo
	 */
	WOM.prepareMaterial.prepareMaterial.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_prepareMaterial_prepareMaterial_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout == "function"){
							    		var layout = WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.prepareMaterial.prepareMaterial.prepareBackList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortMethod ? true : false;
									if(typeof WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout == "function"){
										var layout = WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.prepareMaterial.prepareMaterial.prepareBackList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('query');
								    	}
										if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('query');
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
	 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterial.prepareBackList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedValid = function(type) {
		if(WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows[i].valid === false){
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
	 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedAny = function() {
		if(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterial.prepareBackList.checkSelectedMore = function() {
		if(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterial.prepareBackList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams || {};
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
				<#assign editView = getViewByCode('WOM_7.5.0.0_prepareMaterial_prepareMaterialEdit')>
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
												list_operate_prepareMaterial_prepareBackList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_prepareMaterial_prepareMaterialView'||!viewCode){
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
					list_operate_prepareMaterial_prepareBackList.CUI('#'+formId).submit();
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
		if ( WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg ) {
			WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg._config.url = url;
			WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg._config.formId = formId;
			WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg.setTitle( title )
			WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg.setButtonbar( buttons );
		}else{
			WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_prepareMaterial_prepareBackList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_prepareMaterial_prepareMaterial', element : $('#WOM_prepareMaterial_prepareMaterial_prepareBackList_fileupload_button a:eq(1)')});
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams = {};
	};

	WOM.prepareMaterial.prepareMaterial.prepareBackList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.prepareMaterial.prepareMaterial.prepareBackList.beforeCommonQuery === 'function') {
	   		var ret = WOM.prepareMaterial.prepareMaterial.prepareBackList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.prepareMaterial.prepareMaterial.prepareBackList.cancelSelectedNode == 'function') {
	   WOM.prepareMaterial.prepareMaterial.prepareBackList.cancelSelectedNode();
	   WOM.prepareMaterial.prepareMaterial.prepareBackList.node = null;
	  }
	  if(typeof WOM_prepareMaterial_prepareMaterial_prepareBackList_cancelSelectedNode == 'function') {
	   WOM_prepareMaterial_prepareMaterial_prepareBackList_cancelSelectedNode();
	   WOM.prepareMaterial.prepareMaterial.prepareBackList.node = null;
	  }
	  WOM.prepareMaterial.prepareMaterial.prepareBackList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.prepareMaterial.prepareMaterial.prepareBackList.query
	 */
	WOM.prepareMaterial.prepareMaterial.prepareBackList.query = function(type,pageNo,sortFlag){
		var node = WOM.prepareMaterial.prepareMaterial.prepareBackList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.prepareMaterial.prepareMaterial.prepareBackList.node = null;
		if(!checkListValid("ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query._sortKey && datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query._sortMethod){
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query._sortKey);
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm #dataTableSortColName').val(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query._sortColumnName);
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query._sortMethod);
		}else{
			datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query._sortKey = '';
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.get('dblclick') && datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.get('dblclick').length > 0) {
				datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.prepareMaterial.prepareMaterial.prepareBackList.rowDblClick'
		            });
			}
	        datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.prepareMaterial.prepareMaterial.prepareBackList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.get('dblclick') && datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.get('dblclick').length > 0) {
		    	datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.prepareMaterial.prepareMaterial.prepareBackList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.prepareMaterial.prepareMaterial.prepareBackList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.prepareMaterial.prepareMaterial.prepareBackList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/prepareMaterial/prepareMaterial/prepareBackList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/prepareMaterial/prepareMaterial/prepareBackList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_prepareMaterial_prepareBackList";
		condobj.modelAlias="prepareMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name="'+ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query_PageLink_PageCount"]').val();
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
			dataPost += "&pending-beginDate=${pendingBeginDate!''}";
			dataPost += "&pending-endDate=${pendingEndDate!''}";
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
			permissionCode = 'WOM_7.5.0.0_prepareMaterial_prepareBackList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.prepareMaterial.prepareMaterial.prepareBackList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_prepareMaterial";
		openExportFrame(url);
	}
WOM.prepareMaterial.prepareMaterial.prepareBackList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams = {};
	WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams.dialogType = dialogType;
	WOM.prepareMaterial.prepareMaterial.prepareBackList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.prepareMaterial.prepareMaterial.prepareBackList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.prepareMaterial.prepareMaterial.editCallBackInfo
 */
WOM.prepareMaterial.prepareMaterial.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout == "function"){
    		var layout = WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.prepareMaterial.prepareMaterial.prepareBackList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout == "function"){
			var layout = WOM_prepareMaterial_prepareMaterial_prepareBackList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.prepareMaterial.prepareMaterial.prepareBackList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.prepareMaterial.prepareMaterial.prepareBackList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="applyDate_start"]').val()!= null && $('#' + formId + ' input[name^="applyDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="applyDate_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="applyDate_end"]').val()!= null && $('#' + formId + ' input[name^="applyDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="applyDate_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="applyDate_start"]').val()!='' && $('#' + formId + ' input[name="applyDate_end"]').val()!=''){if($('#' + formId + ' input[name="applyDate_start"]').val() > $('#' + formId + ' input[name="applyDate_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);
function replace(str,symbol){
	var arr = str.split(symbol);
	var s1 = "";
	var len = arr.length;
	for(i=0;i<len;i++){
		if(i%2!=0){
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i]+"</br>";
			}
		}else{
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i]+symbol;
			}
		}
	}
	return s1;	
}
	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_prepareMaterial_prepareBackList,js,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_prepareMaterial_prepareBackList' idprefix='ec_WOM_prepareMaterial_prepareMaterial_prepareBackList' queryUrl='/WOM/prepareMaterial/prepareMaterial/prepareBackList-query.action' queryFunc="WOM.prepareMaterial.prepareMaterial.prepareBackList.query" ns="WOM.prepareMaterial.prepareMaterial.prepareBackList" />
<@exportexcel action="/WOM/prepareMaterial/prepareMaterial/prepareBackList-query.action"   getRequireDataAction="/WOM/prepareMaterial/prepareMaterial/prepareBackList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_prepareMaterial_PrepareMaterial&&viewCode=WOM_7.5.0.0_prepareMaterial_prepareBackList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_prepareMaterial_prepareBackList')}" prefix="ec_WOM_prepareMaterial_prepareMaterial_prepareBackList_query" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial"  importFlag="false" viewCode="WOM_7.5.0.0_prepareMaterial_prepareBackList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
