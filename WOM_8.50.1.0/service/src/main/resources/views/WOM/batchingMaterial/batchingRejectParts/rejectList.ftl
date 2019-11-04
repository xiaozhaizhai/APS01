<!-- WOM_7.5.0.0/batchingMaterial/rejectList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1543469074398')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_rejectList,head,WOM_7.5.0.0_batchingMaterial_BatchingRejectParts,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.batchingMaterial.batchingRejectParts','WOM.batchingMaterial.batchingRejectParts.rejectList');
</script>
<@frameset id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_container" border=0>
	<@frame id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "rejectList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_rejectList,html,WOM_7.5.0.0_batchingMaterial_BatchingRejectParts,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.batchingMaterial.batchingRejectParts.rejectList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterial.batchingRejectParts.rejectList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterial.batchingRejectParts.rejectList._prefix += '.';
			}
			WOM.batchingMaterial.batchingRejectParts.rejectList._prefix += arr[i];
		}
		WOM.batchingMaterial.batchingRejectParts.rejectList._suffix = arr[arr.length -1];
		if(WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterial.batchingRejectParts.rejectList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterial.batchingRejectParts.rejectList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.batchingMaterial.batchingRejectParts.rejectList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name="'+WOM.batchingMaterial.batchingRejectParts.rejectList._prefix + '.' + WOM.batchingMaterial.batchingRejectParts.rejectList._suffix +'"]').val(obj[0][WOM.batchingMaterial.batchingRejectParts.rejectList._suffix]);
		CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name="'+WOM.batchingMaterial.batchingRejectParts.rejectList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name^="'+WOM.batchingMaterial.batchingRejectParts.rejectList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name="'+WOM.batchingMaterial.batchingRejectParts.rejectList._prefix + '.' + WOM.batchingMaterial.batchingRejectParts.rejectList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.batchingMaterial.batchingRejectParts.rejectList._dialog) {
			WOM.batchingMaterial.batchingRejectParts.rejectList._dialog.close();
		}
	};
	
	WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingRejectParts.rejectList.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingRejectParts.rejectList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_batchingMaterial_batchingRejectParts_rejectList_refresh = function(node){
WOM.batchingMaterial.batchingRejectParts.rejectList.node = node;
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
	WOM.batchingMaterial.batchingRejectParts.rejectList.query("query");
}

WOM_batchingMaterial_batchingRejectParts_rejectList_getList = function() {
	return "WOM.batchingMaterial.batchingRejectParts.rejectList";
}
WOM.batchingMaterial.batchingRejectParts.rejectList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_batchingMaterial_batchingRejectParts_rejectListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.batchingMaterial.batchingRejectParts.rejectList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.batchingMaterial.batchingRejectParts.rejectList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_batchingMaterial_batchingRejectParts_rejectList_fileupload_button",
		handler:function(){
				list_operate_batchingMaterial_rejectList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.batchingMaterial.batchingRejectParts.rejectList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_rejectList.WOM.batchingMaterial.batchingRejectParts." + params.viewName + ".referenceCopy");
			funcName('batchingRejectParts', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.batchingMaterial.batchingRejectParts.rejectList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_rejectList.WOM.batchingMaterial.batchingRejectParts." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.batchingMaterial.batchingRejectParts.rejectList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_rejectList.WOM.batchingMaterial.batchingRejectParts." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function openRejectRecordEdit(){ 
								
    var selectRowLength = ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget.getSelectedRow().length;
	if(selectRowLength == null || selectRowLength == undefined || selectRowLength == 0){
		workbenchErrorBarWidget.showMessage("请选中一条记录操作！");
		setTimeout(function(){workbenchErrorBarWidget.close();},5000);
		return false;
	}else{
		for(var index = 0; index < selectRowLength; index++ ){
			if(ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget.getSelectedRow()[index].isReceived == true){
				workbenchErrorBarWidget.showMessage("选中记录已签收，不可重复签收！");
				setTimeout(function(){workbenchErrorBarWidget.close();},5000);
				return false;
			}	
		}			
	}	
	
	var _dialog=new CUI.Dialog({
		title:"退料签收",
		formId:"WOM_batchingMaterial_batchingMaterialPart_rejectReciveEdit_form",
		type:4,
		modal:true,
		url:'/WOM/batchingMaterial/batchingMaterialPart/rejectReciveEdit.action?entityCode=WOM_7.5.0.0_batchingMaterial&buttonCode=WOM_7.5.0.0_batchingMaterial_rejectList_BUTTON_rejectMaterialRecive&namespace=list_operate_batchingMaterial_rejectList',
		//iframe: true, 
		buttons:[
		{
			name:"${getText('WOM.showMessage00000031')}",
			handler:function(){		 			
				//CUI('#WOM_batchingMaterial_batchingMaterialPart_rejectReciveEdit_form').submit();	
				var emptySotre = 0;
				var len = BatchingRejectParts_dg1543461038761Widget.getRowLength();
				var params = '[';
				for(var i = 0; i < len; i++){
					var cargoStatue = BatchingRejectParts_dg1543461038761Widget.getCellValue(i,'ware.cargoStatue.id');
					if(cargoStatue == 'storageState/storageState1'){
						var placeSetCode = BatchingRejectParts_dg1543461038761Widget.getCellValue(i,'store.placeSetCode');
						if(placeSetCode == null || placeSetCode == undefined || placeSetCode == ''){
							BatchingRejectParts_dg1543461038761Widget.setCellProperty(0,'store.placeSetCode','class','validate-error')
							emptySotre++
						}
					}
					
					var rejectId = BatchingRejectParts_dg1543461038761Widget.getCellValue(i,'id');
					var storeId = BatchingRejectParts_dg1543461038761Widget.getCellValue(i,'store.id');
					var storeCode = BatchingRejectParts_dg1543461038761Widget.getCellValue(i,'store.placeSetCode');
					var wareId = BatchingRejectParts_dg1543461038761Widget.getCellValue(i,'ware.id');
					var rejectReceiveStaff  = BatchingRejectParts_dg1543461038761Widget.getCellValue(i,'rejectReceiveStaff.id');
					//console.log(rejectId + ";  " + storeId + ";   " + wareId + ";     " + rejectReceiveStaff);
					
					params += '{"rejectRecordId":"';
					params += rejectId;
					params += '","wareId":"';
					params += wareId;
					params += '","storeId":"';
					params += storeId;
					params += '","storeCode":"';
					params += storeCode;
					params += '","rejectReceiveStaff":"';
					params += rejectReceiveStaff;
					params += '","userName":"';
					params += '"},'
				}	
				params = params.substr(0, params.length - 1);
				params += ']';
				//console.log(params);
				
				if(emptySotre > 0){
					WOM_batchingMaterial_batchingMaterialPart_rejectReciveEdit_formDialogErrorBarWidget.showMessage('货位状态启用，货位不能为空');
					return false;
				}
				
				$.ajax({
					url : "/public/rejectRecord/reviceRejectRecord.action",
					type : 'post',
					data : {postParams:params},
					async : false,
					success : function(res) {
						//console.log(res);
						//console.log(res.flag);
						
						if(res.flag){
							WOM.batchingMaterial.batchingRejectParts.rejectList.query("query");
							_dialog.close();
						}else{
							
							WOM_batchingMaterial_batchingMaterialPart_rejectReciveEdit_formDialogErrorBarWidget.showMessage(res.message);
						}	
						/*if(res.dealSuccessFlag==true){
							//刷新表体
							ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.setRequestDataUrl(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.requestUrl);
						}*/
					}
				});
				
			}
		},{
			name:"${getText('foundation.common.closed')}",
			handler:function(){this.close();}
		}]
	});   
	  
	_dialog.show();		

				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.batchingMaterial.batchingRejectParts.callBackInfo
	 */
	WOM.batchingMaterial.batchingRejectParts.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_batchingMaterial_batchingRejectParts_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.batchingMaterial.batchingRejectParts.rejectList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.batchingMaterial.batchingRejectParts.rejectList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.batchingMaterial.batchingRejectParts.rejectList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.batchingMaterial.batchingRejectParts.rejectList.checkSelectedValid = function(type) {
		if(WOM.batchingMaterial.batchingRejectParts.rejectList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows[i].valid === false){
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
	 * @method WOM.batchingMaterial.batchingRejectParts.rejectList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingRejectParts.rejectList.checkSelectedAny = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.batchingMaterial.batchingRejectParts.rejectList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingRejectParts.rejectList.checkSelectedMore = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	WOM.batchingMaterial.batchingRejectParts.rejectList.dbClickViewrejectList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_batchingMaterial&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.batchingMaterial.batchingRejectParts.rejectList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterial.batchingRejectParts.rejectList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.batchingMaterial.batchingRejectParts.rejectList.otherParams || {};
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
							<#assign linkview = getViewByCode('WOM_7.5.0.0_produceTask_makeTaskView')>
							<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
							if(viewCode=='${linkview.code}'||!viewCode){
							<#list linkview.extraView.configMap.layout.sections as buttonSection>
							<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
							<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
							<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
								|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
								buttons.push({
									name:"${getText(operateBtn.namekey!)}",
									align:"${operateBtn.buttonAlign!'left'}",
									handler:function(){
										<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
										<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
										<#assign funcname = funcname?split('=')[1]>
										list_operate_batchingMaterial_rejectList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_batchingMaterial_batchMaterialView'||!viewCode){
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
					list_operate_batchingMaterial_rejectList.CUI('#'+formId).submit();
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
		if ( WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg ) {
			WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg._config.url = url;
			WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg._config.formId = formId;
			WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg.setTitle( title )
			WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg.setButtonbar( buttons );
		}else{
			WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchingMaterial_rejectList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.batchingMaterial.batchingRejectParts.rejectList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_batchingMaterial_batchingRejectParts', element : $('#WOM_batchingMaterial_batchingRejectParts_rejectList_fileupload_button a:eq(1)')});
		}
		WOM.batchingMaterial.batchingRejectParts.rejectList.otherParams = {};
	};

	WOM.batchingMaterial.batchingRejectParts.rejectList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.batchingMaterial.batchingRejectParts.rejectList.beforeCommonQuery === 'function') {
	   		var ret = WOM.batchingMaterial.batchingRejectParts.rejectList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.batchingMaterial.batchingRejectParts.rejectList.cancelSelectedNode == 'function') {
	   WOM.batchingMaterial.batchingRejectParts.rejectList.cancelSelectedNode();
	   WOM.batchingMaterial.batchingRejectParts.rejectList.node = null;
	  }
	  if(typeof WOM_batchingMaterial_batchingRejectParts_rejectList_cancelSelectedNode == 'function') {
	   WOM_batchingMaterial_batchingRejectParts_rejectList_cancelSelectedNode();
	   WOM.batchingMaterial.batchingRejectParts.rejectList.node = null;
	  }
	  WOM.batchingMaterial.batchingRejectParts.rejectList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.batchingMaterial.batchingRejectParts.rejectList.query
	 */
	WOM.batchingMaterial.batchingRejectParts.rejectList.query = function(type,pageNo,sortFlag){
		var node = WOM.batchingMaterial.batchingRejectParts.rejectList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.batchingMaterial.batchingRejectParts.rejectList.node = null;
		if(!checkListValid("ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query._sortKey && datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query._sortMethod){
			CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query._sortKey);
			CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm #dataTableSortColName').val(datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query._sortColumnName);
			CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query._sortMethod);
		}else{
			datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query._sortKey = '';
			CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.batchingMaterial.batchingRejectParts.rejectList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/batchingMaterial/batchingRejectParts/rejectList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/batchingMaterial/batchingRejectParts/rejectList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterial_rejectList";
		condobj.modelAlias="batchingRejectParts";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name="'+ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_batchingMaterial_rejectList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.batchingMaterial.batchingRejectParts.rejectList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_batchingMaterial";
		openExportFrame(url);
	}
WOM.batchingMaterial.batchingRejectParts.rejectList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.batchingMaterial.batchingRejectParts.rejectList.otherParams = {};
	WOM.batchingMaterial.batchingRejectParts.rejectList.otherParams.dialogType = dialogType;
	WOM.batchingMaterial.batchingRejectParts.rejectList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterial.batchingRejectParts.rejectList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.batchingMaterial.batchingRejectParts.editCallBackInfo
 */
WOM.batchingMaterial.batchingRejectParts.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_batchingMaterial_batchingRejectParts_rejectList_getLayout == "function"){
    		var layout = WOM_batchingMaterial_batchingRejectParts_rejectList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingRejectParts.rejectList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingRejectParts'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_batchingMaterial_batchingRejectParts_rejectList_getLayout == "function"){
			var layout = WOM_batchingMaterial_batchingRejectParts_rejectList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingRejectParts.rejectList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingRejectParts.rejectList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingRejectParts.rejectList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingRejectParts'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingRejectParts.rejectList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingRejectParts.rejectList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="rejectTime_start"]').val()!= null && $('#' + formId + ' input[name^="rejectTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="rejectTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1543392762311')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="rejectTime_end"]').val()!= null && $('#' + formId + ' input[name^="rejectTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="rejectTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1543392762311')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="rejectTime_start"]').val()!='' && $('#' + formId + ' input[name="rejectTime_end"]').val()!=''){if($('#' + formId + ' input[name="rejectTime_start"]').val() > $('#' + formId + ' input[name="rejectTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1543392762311')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1543392762311')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_rejectList,js,WOM_7.5.0.0_batchingMaterial_BatchingRejectParts,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_batchingMaterial_rejectList' idprefix='ec_WOM_batchingMaterial_batchingRejectParts_rejectList' queryUrl='/WOM/batchingMaterial/batchingRejectParts/rejectList-query.action' queryFunc="WOM.batchingMaterial.batchingRejectParts.rejectList.query" ns="WOM.batchingMaterial.batchingRejectParts.rejectList" />
<@exportexcel action="/WOM/batchingMaterial/batchingRejectParts/rejectList-query.action"   getRequireDataAction="/WOM/batchingMaterial/batchingRejectParts/rejectList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_batchingMaterial_BatchingRejectParts&&viewCode=WOM_7.5.0.0_batchingMaterial_rejectList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_batchingMaterial_rejectList')}" prefix="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts"  importFlag="false" viewCode="WOM_7.5.0.0_batchingMaterial_rejectList" />
