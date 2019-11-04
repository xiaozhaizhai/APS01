<!-- WOM_7.5.0.0/qualityRecords/qualityInspectList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1541147427705')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_qualityRecords_qualityInspectList,head,WOM_7.5.0.0_qualityRecords_QualityInspect,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.qualityRecords.qualityInspect','WOM.qualityRecords.qualityInspect.qualityInspectList');
</script>
<@frameset id="ec_WOM_qualityRecords_qualityInspect_qualityInspectList_container" border=0>
	<@frame id="ec_WOM_qualityRecords_qualityInspect_qualityInspectList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "qualityInspectList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_qualityRecords_qualityInspectList,html,WOM_7.5.0.0_qualityRecords_QualityInspect,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.qualityRecords.qualityInspect.qualityInspectList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.qualityRecords.qualityInspect.qualityInspectList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.qualityRecords.qualityInspect.qualityInspectList._prefix += '.';
			}
			WOM.qualityRecords.qualityInspect.qualityInspectList._prefix += arr[i];
		}
		WOM.qualityRecords.qualityInspect.qualityInspectList._suffix = arr[arr.length -1];
		if(WOM.qualityRecords.qualityInspect.qualityInspectList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.qualityRecords.qualityInspect.qualityInspectList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.qualityRecords.qualityInspect.qualityInspectList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.qualityRecords.qualityInspect.qualityInspectList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.qualityRecords.qualityInspect.qualityInspectList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name="'+WOM.qualityRecords.qualityInspect.qualityInspectList._prefix + '.' + WOM.qualityRecords.qualityInspect.qualityInspectList._suffix +'"]').val(obj[0][WOM.qualityRecords.qualityInspect.qualityInspectList._suffix]);
		CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name="'+WOM.qualityRecords.qualityInspect.qualityInspectList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name^="'+WOM.qualityRecords.qualityInspect.qualityInspectList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name="'+WOM.qualityRecords.qualityInspect.qualityInspectList._prefix + '.' + WOM.qualityRecords.qualityInspect.qualityInspectList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.qualityRecords.qualityInspect.qualityInspectList._dialog) {
			WOM.qualityRecords.qualityInspect.qualityInspectList._dialog.close();
		}
	};
	
	WOM.qualityRecords.qualityInspect.qualityInspectList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.qualityRecords.qualityInspect.qualityInspectList.query_"+obj+")!='undefined'") ? eval('WOM.qualityRecords.qualityInspect.qualityInspectList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_qualityRecords_qualityInspect_qualityInspectList_refresh = function(node){
WOM.qualityRecords.qualityInspect.qualityInspectList.node = node;
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
	WOM.qualityRecords.qualityInspect.qualityInspectList.query("query");
}

WOM_qualityRecords_qualityInspect_qualityInspectList_getList = function() {
	return "WOM.qualityRecords.qualityInspect.qualityInspectList";
}
WOM.qualityRecords.qualityInspect.qualityInspectList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_qualityRecords_qualityInspect_qualityInspectListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.qualityRecords.qualityInspect.qualityInspectList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.qualityRecords.qualityInspect.qualityInspectList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_qualityRecords_qualityInspect_qualityInspectList_fileupload_button",
		handler:function(){
				list_operate_qualityRecords_qualityInspectList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.qualityRecords.qualityInspect.qualityInspectList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_qualityRecords_qualityInspectList.WOM.qualityRecords.qualityInspect." + params.viewName + ".referenceCopy");
			funcName('qualityInspect', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.qualityRecords.qualityInspect.qualityInspectList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_qualityRecords_qualityInspectList.WOM.qualityRecords.qualityInspect." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.qualityRecords.qualityInspect.qualityInspectList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_qualityRecords_qualityInspectList.WOM.qualityRecords.qualityInspect." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('WOM_7.5.0.0_qualityRecords_qualityInspectEdit')>
			/**
			 * 列表新增
			 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.addqualityInspectList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.qualityRecords.qualityInspect.qualityInspectList.addqualityInspectList = function() {
				var buttonCode='WOM_7.5.0.0_qualityRecords_qualityInspectList_BUTTON_addNewInspect';
					var treeParam = "";
					if(typeof WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout == "function"){
						var layout = WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout();
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
							if(modelCode == 'WOM_7.5.0.0_qualityRecords_QualityInspect'.replace(/\./g, '\_')){
								treeParam = '&qualityInspect.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&qualityInspect.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = WOM.qualityRecords.qualityInspect.qualityInspectList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = WOM.qualityRecords.qualityInspect.qualityInspectList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						WOM.qualityRecords.qualityInspect.qualityInspectList.otherParams = otherParams;

						var url='${editView.url}?entityCode=WOM_7.5.0.0_qualityRecords' + "&${getPowerCode('${buttonPerfix!}qualityInspectList_addNewInspect_add_WOM_7.5.0.0_qualityRecords_qualityInspectList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_qualityRecords_qualityInspectList';
						WOM.qualityRecords.qualityInspect.qualityInspectList.showDialog(url,'WOM_qualityRecords_qualityInspect_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=WOM_7.5.0.0_qualityRecords' + "&${getPowerCode('${buttonPerfix!}qualityInspectList_addNewInspect_add_WOM_7.5.0.0_qualityRecords_qualityInspectList')}";
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
			
	
	/**
	 * 保存完毕回调
	 * @method WOM.qualityRecords.qualityInspect.callBackInfo
	 */
	WOM.qualityRecords.qualityInspect.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_qualityRecords_qualityInspect_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout == "function"){
							    		var layout = WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.qualityRecords.qualityInspect.qualityInspectList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortKey && ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'WOM_7.5.0.0_qualityRecords_QualityInspect'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortKey && ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortKey && ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortMethod ? true : false;
									if(typeof WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout == "function"){
										var layout = WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.qualityRecords.qualityInspect.qualityInspectList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query');
								    	}
										if(modelCode == 'WOM_7.5.0.0_qualityRecords_QualityInspect'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query');
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
	 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.qualityRecords.qualityInspect.qualityInspectList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.qualityRecords.qualityInspect.qualityInspectList.checkSelectedValid = function(type) {
		if(WOM.qualityRecords.qualityInspect.qualityInspectList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows[i].valid === false){
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
	 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.qualityRecords.qualityInspect.qualityInspectList.checkSelectedAny = function() {
		if(datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.qualityRecords.qualityInspect.qualityInspectList.checkSelectedMore = function() {
		if(datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	WOM.qualityRecords.qualityInspect.qualityInspectList.dbClickViewqualityInspectList =  function(event, oRow) {
		var viewUrl = '/WOM/qualityRecords/qualityInspect/qualityInspectView.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			var otherParams = {};
			otherParams.viewShowType = 'VIEW';
			otherParams.dialogType = '5';
			WOM.qualityRecords.qualityInspect.qualityInspectList.otherParams = otherParams;
			WOM.qualityRecords.qualityInspect.qualityInspectList.showDialog(viewUrl + "?entityCode=WOM_7.5.0.0_qualityRecords&id=" + oRow.id,'WOM_qualityRecords_qualityInspect_qualityInspectView_form','${getText("WOM.viewtitle.randon1541147457874")}',850,530,'WOM_7.5.0.0_qualityRecords_qualityInspectView');
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.qualityRecords.qualityInspect.qualityInspectList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.qualityRecords.qualityInspect.qualityInspectList.otherParams || {};
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
				<#assign editView = getViewByCode('WOM_7.5.0.0_qualityRecords_qualityInspectEdit')>
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
												list_operate_qualityRecords_qualityInspectList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_qualityRecords_qualityInspectView'||!viewCode){
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
					list_operate_qualityRecords_qualityInspectList.CUI('#'+formId).submit();
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
		if ( WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg ) {
			WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg._config.url = url;
			WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg._config.formId = formId;
			WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg.setTitle( title )
			WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg.setButtonbar( buttons );
		}else{
			WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_qualityRecords_qualityInspectList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.qualityRecords.qualityInspect.qualityInspectList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_qualityRecords_qualityInspect', element : $('#WOM_qualityRecords_qualityInspect_qualityInspectList_fileupload_button a:eq(1)')});
		}
		WOM.qualityRecords.qualityInspect.qualityInspectList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.qualityRecords.qualityInspect.qualityInspectList.approvalDialog = function(url,formId,title,width,height) {
		WOM.qualityRecords.qualityInspect.qualityInspectList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.qualityRecords.qualityInspect.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.qualityRecords.qualityInspect.qualityInspectList.AppDlg.show();
	};

	WOM.qualityRecords.qualityInspect.qualityInspectList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.qualityRecords.qualityInspect.qualityInspectList.beforeCommonQuery === 'function') {
	   		var ret = WOM.qualityRecords.qualityInspect.qualityInspectList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.qualityRecords.qualityInspect.qualityInspectList.cancelSelectedNode == 'function') {
	   WOM.qualityRecords.qualityInspect.qualityInspectList.cancelSelectedNode();
	   WOM.qualityRecords.qualityInspect.qualityInspectList.node = null;
	  }
	  if(typeof WOM_qualityRecords_qualityInspect_qualityInspectList_cancelSelectedNode == 'function') {
	   WOM_qualityRecords_qualityInspect_qualityInspectList_cancelSelectedNode();
	   WOM.qualityRecords.qualityInspect.qualityInspectList.node = null;
	  }
	  WOM.qualityRecords.qualityInspect.qualityInspectList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.qualityRecords.qualityInspect.qualityInspectList.query
	 */
	WOM.qualityRecords.qualityInspect.qualityInspectList.query = function(type,pageNo,sortFlag){
		var node = WOM.qualityRecords.qualityInspect.qualityInspectList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.qualityRecords.qualityInspect.qualityInspectList.node = null;
		if(!checkListValid("ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query._sortKey && datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query._sortMethod){
			CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query._sortKey);
			CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm #dataTableSortColName').val(datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query._sortColumnName);
			CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query._sortMethod);
		}else{
			datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query._sortKey = '';
			CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.qualityRecords.qualityInspect.qualityInspectList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/qualityRecords/qualityInspect/qualityInspectList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/qualityRecords/qualityInspect/qualityInspectList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_qualityRecords_qualityInspectList";
		condobj.modelAlias="qualityInspect";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name="'+ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_qualityRecords_qualityInspect_qualityInspectList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_qualityRecords_qualityInspectList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.qualityRecords.qualityInspect.qualityInspectList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_qualityRecords";
		openExportFrame(url);
	}
WOM.qualityRecords.qualityInspect.qualityInspectList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.qualityRecords.qualityInspect.qualityInspectList.otherParams = {};
	WOM.qualityRecords.qualityInspect.qualityInspectList.otherParams.dialogType = dialogType;
	WOM.qualityRecords.qualityInspect.qualityInspectList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.qualityRecords.qualityInspect.qualityInspectList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.qualityRecords.qualityInspect.editCallBackInfo
 */
WOM.qualityRecords.qualityInspect.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout == "function"){
    		var layout = WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.qualityRecords.qualityInspect.qualityInspectList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortKey && ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_qualityRecords_QualityInspect'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortKey && ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortKey && ec_WOM_qualityRecords_qualityInspect_qualityInspectList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout == "function"){
			var layout = WOM_qualityRecords_qualityInspect_qualityInspectList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.qualityRecords.qualityInspect.qualityInspectList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_qualityRecords_QualityInspect'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.qualityRecords.qualityInspect.qualityInspectList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_qualityRecords_qualityInspectList,js,WOM_7.5.0.0_qualityRecords_QualityInspect,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_qualityRecords_qualityInspectList' idprefix='ec_WOM_qualityRecords_qualityInspect_qualityInspectList' queryUrl='/WOM/qualityRecords/qualityInspect/qualityInspectList-query.action' queryFunc="WOM.qualityRecords.qualityInspect.qualityInspectList.query" ns="WOM.qualityRecords.qualityInspect.qualityInspectList" />
<@exportexcel action="/WOM/qualityRecords/qualityInspect/qualityInspectList-query.action"   getRequireDataAction="/WOM/qualityRecords/qualityInspect/qualityInspectList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_qualityRecords_QualityInspect&&viewCode=WOM_7.5.0.0_qualityRecords_qualityInspectList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_qualityRecords_qualityInspectList')}" prefix="ec_WOM_qualityRecords_qualityInspect_qualityInspectList_query" modelCode="WOM_7.5.0.0_qualityRecords_QualityInspect"  importFlag="false" viewCode="WOM_7.5.0.0_qualityRecords_qualityInspectList" />
