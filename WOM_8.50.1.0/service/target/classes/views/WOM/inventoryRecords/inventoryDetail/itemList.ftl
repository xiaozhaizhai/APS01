<!-- WOM_7.5.0.0/inventoryRecords/itemList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1566809576776')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_inventoryRecords_itemList,head,WOM_7.5.0.0_inventoryRecords_InventoryDetail,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.inventoryRecords.inventoryDetail','WOM.inventoryRecords.inventoryDetail.itemList');
</script>
<@frameset id="ec_WOM_inventoryRecords_inventoryDetail_itemList_container" border=0>
	<@frame id="ec_WOM_inventoryRecords_inventoryDetail_itemList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "itemList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_inventoryRecords_itemList,html,WOM_7.5.0.0_inventoryRecords_InventoryDetail,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.inventoryRecords.inventoryDetail.itemList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.inventoryRecords.inventoryDetail.itemList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.inventoryRecords.inventoryDetail.itemList._prefix += '.';
			}
			WOM.inventoryRecords.inventoryDetail.itemList._prefix += arr[i];
		}
		WOM.inventoryRecords.inventoryDetail.itemList._suffix = arr[arr.length -1];
		if(WOM.inventoryRecords.inventoryDetail.itemList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.inventoryRecords.inventoryDetail.itemList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.inventoryRecords.inventoryDetail.itemList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.inventoryRecords.inventoryDetail.itemList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.inventoryRecords.inventoryDetail.itemList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name="'+WOM.inventoryRecords.inventoryDetail.itemList._prefix + '.' + WOM.inventoryRecords.inventoryDetail.itemList._suffix +'"]').val(obj[0][WOM.inventoryRecords.inventoryDetail.itemList._suffix]);
		CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name="'+WOM.inventoryRecords.inventoryDetail.itemList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name^="'+WOM.inventoryRecords.inventoryDetail.itemList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name="'+WOM.inventoryRecords.inventoryDetail.itemList._prefix + '.' + WOM.inventoryRecords.inventoryDetail.itemList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.inventoryRecords.inventoryDetail.itemList._dialog) {
			WOM.inventoryRecords.inventoryDetail.itemList._dialog.close();
		}
	};
	
	WOM.inventoryRecords.inventoryDetail.itemList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.inventoryRecords.inventoryDetail.itemList.query_"+obj+")!='undefined'") ? eval('WOM.inventoryRecords.inventoryDetail.itemList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_inventoryRecords_inventoryDetail_itemList_refresh = function(node){
WOM.inventoryRecords.inventoryDetail.itemList.node = node;
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
	WOM.inventoryRecords.inventoryDetail.itemList.query("query");
}

WOM_inventoryRecords_inventoryDetail_itemList_getList = function() {
	return "WOM.inventoryRecords.inventoryDetail.itemList";
}
WOM.inventoryRecords.inventoryDetail.itemList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_inventoryRecords_inventoryDetail_itemListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.inventoryRecords.inventoryDetail.itemList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.inventoryRecords.inventoryDetail.itemList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_inventoryRecords_inventoryDetail_itemList_fileupload_button",
		handler:function(){
				list_operate_inventoryRecords_itemList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.inventoryRecords.inventoryDetail.itemList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_inventoryRecords_itemList.WOM.inventoryRecords.inventoryDetail." + params.viewName + ".referenceCopy");
			funcName('inventoryDetail', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.inventoryRecords.inventoryDetail.itemList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_inventoryRecords_itemList.WOM.inventoryRecords.inventoryDetail." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.inventoryRecords.inventoryDetail.itemList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_inventoryRecords_itemList.WOM.inventoryRecords.inventoryDetail." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	WOM.inventoryRecords.inventoryDetail.itemList.dbClickViewitemList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_inventoryRecords&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.inventoryRecords.inventoryDetail.itemList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.inventoryRecords.inventoryDetail.itemList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.inventoryRecords.inventoryDetail.itemList.otherParams || {};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_inventoryRecords_itemView'||!viewCode){
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
					list_operate_inventoryRecords_itemList.CUI('#'+formId).submit();
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
		if ( WOM.inventoryRecords.inventoryDetail.itemList.Dlg ) {
			WOM.inventoryRecords.inventoryDetail.itemList.Dlg._config.url = url;
			WOM.inventoryRecords.inventoryDetail.itemList.Dlg._config.formId = formId;
			WOM.inventoryRecords.inventoryDetail.itemList.Dlg.setTitle( title )
			WOM.inventoryRecords.inventoryDetail.itemList.Dlg.setButtonbar( buttons );
		}else{
			WOM.inventoryRecords.inventoryDetail.itemList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_inventoryRecords_itemList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.inventoryRecords.inventoryDetail.itemList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.inventoryRecords.inventoryDetail.itemList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_inventoryRecords_inventoryDetail', element : $('#WOM_inventoryRecords_inventoryDetail_itemList_fileupload_button a:eq(1)')});
		}
		WOM.inventoryRecords.inventoryDetail.itemList.otherParams = {};
	};

	WOM.inventoryRecords.inventoryDetail.itemList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.inventoryRecords.inventoryDetail.itemList.beforeCommonQuery === 'function') {
	   		var ret = WOM.inventoryRecords.inventoryDetail.itemList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.inventoryRecords.inventoryDetail.itemList.cancelSelectedNode == 'function') {
	   WOM.inventoryRecords.inventoryDetail.itemList.cancelSelectedNode();
	   WOM.inventoryRecords.inventoryDetail.itemList.node = null;
	  }
	  if(typeof WOM_inventoryRecords_inventoryDetail_itemList_cancelSelectedNode == 'function') {
	   WOM_inventoryRecords_inventoryDetail_itemList_cancelSelectedNode();
	   WOM.inventoryRecords.inventoryDetail.itemList.node = null;
	  }
	  WOM.inventoryRecords.inventoryDetail.itemList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.inventoryRecords.inventoryDetail.itemList.query
	 */
	WOM.inventoryRecords.inventoryDetail.itemList.query = function(type,pageNo,sortFlag){
		var node = WOM.inventoryRecords.inventoryDetail.itemList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.inventoryRecords.inventoryDetail.itemList.node = null;
		if(!checkListValid("ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query._sortKey && datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query._sortMethod){
			CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query._sortKey);
			CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm #dataTableSortColName').val(datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query._sortColumnName);
			CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query._sortMethod);
		}else{
			datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query._sortKey = '';
			CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.inventoryRecords.inventoryDetail.itemList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/inventoryRecords/inventoryDetail/itemList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/inventoryRecords/inventoryDetail/itemList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_inventoryRecords_itemList";
		condobj.modelAlias="inventoryDetail";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name="'+ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_inventoryRecords_inventoryDetail_itemList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_inventoryRecords_itemList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.inventoryRecords.inventoryDetail.itemList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_inventoryRecords";
		openExportFrame(url);
	}
WOM.inventoryRecords.inventoryDetail.itemList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.inventoryRecords.inventoryDetail.itemList.otherParams = {};
	WOM.inventoryRecords.inventoryDetail.itemList.otherParams.dialogType = dialogType;
	WOM.inventoryRecords.inventoryDetail.itemList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.inventoryRecords.inventoryDetail.itemList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.inventoryRecords.inventoryDetail.editCallBackInfo
 */
WOM.inventoryRecords.inventoryDetail.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_inventoryRecords_inventoryDetail_itemList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_inventoryRecords_inventoryDetail_itemList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_inventoryRecords_inventoryDetail_itemList_getLayout == "function"){
    		var layout = WOM_inventoryRecords_inventoryDetail_itemList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.inventoryRecords.inventoryDetail.itemList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_inventoryRecords_inventoryDetail_itemList_queryWidget._sortKey && ec_WOM_inventoryRecords_inventoryDetail_itemList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_inventoryRecords_InventoryDetail'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_inventoryRecords_inventoryDetail_itemList_queryWidget._sortKey && ec_WOM_inventoryRecords_inventoryDetail_itemList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_inventoryRecords_inventoryDetail_itemList_queryWidget._sortKey && ec_WOM_inventoryRecords_inventoryDetail_itemList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_inventoryRecords_inventoryDetail_itemList_getLayout == "function"){
			var layout = WOM_inventoryRecords_inventoryDetail_itemList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.inventoryRecords.inventoryDetail.itemList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.inventoryRecords.inventoryDetail.itemList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.inventoryRecords.inventoryDetail.itemList.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_inventoryRecords_InventoryDetail'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.inventoryRecords.inventoryDetail.itemList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.inventoryRecords.inventoryDetail.itemList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_inventoryRecords_itemList,js,WOM_7.5.0.0_inventoryRecords_InventoryDetail,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_inventoryRecords_itemList' idprefix='ec_WOM_inventoryRecords_inventoryDetail_itemList' queryUrl='/WOM/inventoryRecords/inventoryDetail/itemList-query.action' queryFunc="WOM.inventoryRecords.inventoryDetail.itemList.query" ns="WOM.inventoryRecords.inventoryDetail.itemList" />
<@exportexcel action="/WOM/inventoryRecords/inventoryDetail/itemList-query.action"   getRequireDataAction="/WOM/inventoryRecords/inventoryDetail/itemList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_inventoryRecords_InventoryDetail&&viewCode=WOM_7.5.0.0_inventoryRecords_itemList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_inventoryRecords_itemList')}" prefix="ec_WOM_inventoryRecords_inventoryDetail_itemList_query" modelCode="WOM_7.5.0.0_inventoryRecords_InventoryDetail"  importFlag="false" viewCode="WOM_7.5.0.0_inventoryRecords_itemList" />
