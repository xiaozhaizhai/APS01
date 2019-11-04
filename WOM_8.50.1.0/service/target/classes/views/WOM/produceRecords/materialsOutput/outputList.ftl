<!-- WOM_7.5.0.0/produceRecords/outputList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1541147673729')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceRecords_outputList,head,WOM_7.5.0.0_produceRecords_MaterialsOutput,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.produceRecords.materialsOutput','WOM.produceRecords.materialsOutput.outputList');
</script>
<@frameset id="ec_WOM_produceRecords_materialsOutput_outputList_container" border=0>
	<@frame id="ec_WOM_produceRecords_materialsOutput_outputList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "outputList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceRecords_outputList,html,WOM_7.5.0.0_produceRecords_MaterialsOutput,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.produceRecords.materialsOutput.outputList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.produceRecords.materialsOutput.outputList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.produceRecords.materialsOutput.outputList._prefix += '.';
			}
			WOM.produceRecords.materialsOutput.outputList._prefix += arr[i];
		}
		WOM.produceRecords.materialsOutput.outputList._suffix = arr[arr.length -1];
		if(WOM.produceRecords.materialsOutput.outputList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceRecords.materialsOutput.outputList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.produceRecords.materialsOutput.outputList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.produceRecords.materialsOutput.outputList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.produceRecords.materialsOutput.outputList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name="'+WOM.produceRecords.materialsOutput.outputList._prefix + '.' + WOM.produceRecords.materialsOutput.outputList._suffix +'"]').val(obj[0][WOM.produceRecords.materialsOutput.outputList._suffix]);
		CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name="'+WOM.produceRecords.materialsOutput.outputList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name^="'+WOM.produceRecords.materialsOutput.outputList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name="'+WOM.produceRecords.materialsOutput.outputList._prefix + '.' + WOM.produceRecords.materialsOutput.outputList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.produceRecords.materialsOutput.outputList._dialog) {
			WOM.produceRecords.materialsOutput.outputList._dialog.close();
		}
	};
	
	WOM.produceRecords.materialsOutput.outputList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceRecords.materialsOutput.outputList.query_"+obj+")!='undefined'") ? eval('WOM.produceRecords.materialsOutput.outputList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_produceRecords_materialsOutput_outputList_refresh = function(node){
WOM.produceRecords.materialsOutput.outputList.node = node;
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
	WOM.produceRecords.materialsOutput.outputList.query("query");
}

WOM_produceRecords_materialsOutput_outputList_getList = function() {
	return "WOM.produceRecords.materialsOutput.outputList";
}
WOM.produceRecords.materialsOutput.outputList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_produceRecords_materialsOutput_outputListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.produceRecords.materialsOutput.outputList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.produceRecords.materialsOutput.outputList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_produceRecords_materialsOutput_outputList_fileupload_button",
		handler:function(){
				list_operate_produceRecords_outputList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.produceRecords.materialsOutput.outputList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceRecords_outputList.WOM.produceRecords.materialsOutput." + params.viewName + ".referenceCopy");
			funcName('materialsOutput', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.produceRecords.materialsOutput.outputList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceRecords_outputList.WOM.produceRecords.materialsOutput." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.produceRecords.materialsOutput.outputList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceRecords_outputList.WOM.produceRecords.materialsOutput." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('WOM_7.5.0.0_produceRecords_outputEdit')>
			/**
			 * 列表新增
			 * @method WOM.produceRecords.materialsOutput.outputList.addoutputList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.produceRecords.materialsOutput.outputList.addoutputList = function() {
				var buttonCode='WOM_7.5.0.0_produceRecords_outputList_BUTTON_addOuput';
					var treeParam = "";
					if(typeof WOM_produceRecords_materialsOutput_outputList_getLayout == "function"){
						var layout = WOM_produceRecords_materialsOutput_outputList_getLayout();
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
							if(modelCode == 'WOM_7.5.0.0_produceRecords_MaterialsOutput'.replace(/\./g, '\_')){
								treeParam = '&materialsOutput.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&materialsOutput.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = WOM.produceRecords.materialsOutput.outputList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = WOM.produceRecords.materialsOutput.outputList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						WOM.produceRecords.materialsOutput.outputList.otherParams = otherParams;

						var url='${editView.url}?entityCode=WOM_7.5.0.0_produceRecords' + "&${getPowerCode('${buttonPerfix!}outputList_addOuput_add_WOM_7.5.0.0_produceRecords_outputList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_produceRecords_outputList';
						WOM.produceRecords.materialsOutput.outputList.showDialog(url,'WOM_produceRecords_materialsOutput_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=WOM_7.5.0.0_produceRecords' + "&${getPowerCode('${buttonPerfix!}outputList_addOuput_add_WOM_7.5.0.0_produceRecords_outputList')}";
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
	 * @method WOM.produceRecords.materialsOutput.callBackInfo
	 */
	WOM.produceRecords.materialsOutput.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_produceRecords_materialsOutput_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.produceRecords.materialsOutput.outputList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_produceRecords_materialsOutput_outputList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof WOM_produceRecords_materialsOutput_outputList_getLayout == "function"){
							    		var layout = WOM_produceRecords_materialsOutput_outputList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.produceRecords.materialsOutput.outputList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortKey && ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'WOM_7.5.0.0_produceRecords_MaterialsOutput'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortKey && ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortKey && ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortMethod ? true : false;
									if(typeof WOM_produceRecords_materialsOutput_outputList_getLayout == "function"){
										var layout = WOM_produceRecords_materialsOutput_outputList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.produceRecords.materialsOutput.outputList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.produceRecords.materialsOutput.outputList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.produceRecords.materialsOutput.outputList.query('query');
								    	}
										if(modelCode == 'WOM_7.5.0.0_produceRecords_MaterialsOutput'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.produceRecords.materialsOutput.outputList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.produceRecords.materialsOutput.outputList.query('query');
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
	 * @method WOM.produceRecords.materialsOutput.outputList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.produceRecords.materialsOutput.outputList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.produceRecords.materialsOutput.outputList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.produceRecords.materialsOutput.outputList.checkSelectedValid = function(type) {
		if(WOM.produceRecords.materialsOutput.outputList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows[i].valid === false){
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
	 * @method WOM.produceRecords.materialsOutput.outputList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.produceRecords.materialsOutput.outputList.checkSelectedAny = function() {
		if(datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.produceRecords.materialsOutput.outputList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.produceRecords.materialsOutput.outputList.checkSelectedMore = function() {
		if(datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	WOM.produceRecords.materialsOutput.outputList.dbClickViewoutputList =  function(event, oRow) {
		var viewUrl = '/WOM/produceRecords/materialsOutput/outputView.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			var otherParams = {};
			otherParams.viewShowType = 'VIEW';
			otherParams.dialogType = '5';
			WOM.produceRecords.materialsOutput.outputList.otherParams = otherParams;
			WOM.produceRecords.materialsOutput.outputList.showDialog(viewUrl + "?entityCode=WOM_7.5.0.0_produceRecords&id=" + oRow.id,'WOM_produceRecords_materialsOutput_outputView_form','${getText("WOM.viewtitle.randon1541147949245")}',850,530,'WOM_7.5.0.0_produceRecords_outputView');
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.produceRecords.materialsOutput.outputList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.produceRecords.materialsOutput.outputList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.produceRecords.materialsOutput.outputList.otherParams || {};
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
				<#assign editView = getViewByCode('WOM_7.5.0.0_produceRecords_outputEdit')>
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
												list_operate_produceRecords_outputList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_produceRecords_outputView'||!viewCode){
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
					list_operate_produceRecords_outputList.CUI('#'+formId).submit();
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
		if ( WOM.produceRecords.materialsOutput.outputList.Dlg ) {
			WOM.produceRecords.materialsOutput.outputList.Dlg._config.url = url;
			WOM.produceRecords.materialsOutput.outputList.Dlg._config.formId = formId;
			WOM.produceRecords.materialsOutput.outputList.Dlg.setTitle( title )
			WOM.produceRecords.materialsOutput.outputList.Dlg.setButtonbar( buttons );
		}else{
			WOM.produceRecords.materialsOutput.outputList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_produceRecords_outputList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.produceRecords.materialsOutput.outputList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.produceRecords.materialsOutput.outputList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_produceRecords_materialsOutput', element : $('#WOM_produceRecords_materialsOutput_outputList_fileupload_button a:eq(1)')});
		}
		WOM.produceRecords.materialsOutput.outputList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.produceRecords.materialsOutput.outputList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.produceRecords.materialsOutput.outputList.approvalDialog = function(url,formId,title,width,height) {
		WOM.produceRecords.materialsOutput.outputList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.produceRecords.materialsOutput.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.produceRecords.materialsOutput.outputList.AppDlg.show();
	};

	WOM.produceRecords.materialsOutput.outputList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.produceRecords.materialsOutput.outputList.beforeCommonQuery === 'function') {
	   		var ret = WOM.produceRecords.materialsOutput.outputList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.produceRecords.materialsOutput.outputList.cancelSelectedNode == 'function') {
	   WOM.produceRecords.materialsOutput.outputList.cancelSelectedNode();
	   WOM.produceRecords.materialsOutput.outputList.node = null;
	  }
	  if(typeof WOM_produceRecords_materialsOutput_outputList_cancelSelectedNode == 'function') {
	   WOM_produceRecords_materialsOutput_outputList_cancelSelectedNode();
	   WOM.produceRecords.materialsOutput.outputList.node = null;
	  }
	  WOM.produceRecords.materialsOutput.outputList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.produceRecords.materialsOutput.outputList.query
	 */
	WOM.produceRecords.materialsOutput.outputList.query = function(type,pageNo,sortFlag){
		var node = WOM.produceRecords.materialsOutput.outputList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.produceRecords.materialsOutput.outputList.node = null;
		if(!checkListValid("ec_WOM_produceRecords_materialsOutput_outputList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_produceRecords_materialsOutput_outputList_query._sortKey && datatable_ec_WOM_produceRecords_materialsOutput_outputList_query._sortMethod){
			CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_produceRecords_materialsOutput_outputList_query._sortKey);
			CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm #dataTableSortColName').val(datatable_ec_WOM_produceRecords_materialsOutput_outputList_query._sortColumnName);
			CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_produceRecords_materialsOutput_outputList_query._sortMethod);
		}else{
			datatable_ec_WOM_produceRecords_materialsOutput_outputList_query._sortKey = '';
			CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.produceRecords.materialsOutput.outputList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/produceRecords/materialsOutput/outputList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/produceRecords/materialsOutput/outputList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_produceRecords_outputList";
		condobj.modelAlias="materialsOutput";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name="'+ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_produceRecords_materialsOutput_outputList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_produceRecords_materialsOutput_outputList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_produceRecords_outputList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.produceRecords.materialsOutput.outputList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_produceRecords";
		openExportFrame(url);
	}
WOM.produceRecords.materialsOutput.outputList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.produceRecords.materialsOutput.outputList.otherParams = {};
	WOM.produceRecords.materialsOutput.outputList.otherParams.dialogType = dialogType;
	WOM.produceRecords.materialsOutput.outputList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.produceRecords.materialsOutput.outputList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.produceRecords.materialsOutput.editCallBackInfo
 */
WOM.produceRecords.materialsOutput.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_produceRecords_materialsOutput_outputList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_produceRecords_materialsOutput_outputList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_produceRecords_materialsOutput_outputList_getLayout == "function"){
    		var layout = WOM_produceRecords_materialsOutput_outputList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.produceRecords.materialsOutput.outputList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortKey && ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_produceRecords_MaterialsOutput'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortKey && ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortKey && ec_WOM_produceRecords_materialsOutput_outputList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_produceRecords_materialsOutput_outputList_getLayout == "function"){
			var layout = WOM_produceRecords_materialsOutput_outputList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.produceRecords.materialsOutput.outputList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.produceRecords.materialsOutput.outputList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.produceRecords.materialsOutput.outputList.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_produceRecords_MaterialsOutput'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.produceRecords.materialsOutput.outputList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.produceRecords.materialsOutput.outputList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceRecords_outputList,js,WOM_7.5.0.0_produceRecords_MaterialsOutput,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_produceRecords_outputList' idprefix='ec_WOM_produceRecords_materialsOutput_outputList' queryUrl='/WOM/produceRecords/materialsOutput/outputList-query.action' queryFunc="WOM.produceRecords.materialsOutput.outputList.query" ns="WOM.produceRecords.materialsOutput.outputList" />
<@exportexcel action="/WOM/produceRecords/materialsOutput/outputList-query.action"   getRequireDataAction="/WOM/produceRecords/materialsOutput/outputList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_produceRecords_MaterialsOutput&&viewCode=WOM_7.5.0.0_produceRecords_outputList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_produceRecords_outputList')}" prefix="ec_WOM_produceRecords_materialsOutput_outputList_query" modelCode="WOM_7.5.0.0_produceRecords_MaterialsOutput"  importFlag="false" viewCode="WOM_7.5.0.0_produceRecords_outputList" />
