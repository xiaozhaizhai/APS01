<!-- RM_7.5.0.0/formula/productReplaceList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1540369293539')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_productReplaceList,head,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.productReplace','RM.formula.productReplace.productReplaceList');
</script>
<@frameset id="ec_RM_formula_productReplace_productReplaceList_container" border=0>
	<@frame id="ec_RM_formula_productReplace_productReplaceList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "productReplaceList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_productReplaceList,html,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.formula.productReplace.productReplaceList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.productReplace.productReplaceList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.productReplace.productReplaceList._prefix += '.';
			}
			RM.formula.productReplace.productReplaceList._prefix += arr[i];
		}
		RM.formula.productReplace.productReplaceList._suffix = arr[arr.length -1];
		if(RM.formula.productReplace.productReplaceList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.productReplace.productReplaceList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.productReplace.productReplaceList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.productReplace.productReplaceList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.formula.productReplace.productReplaceList.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name="'+RM.formula.productReplace.productReplaceList._prefix + '.' + RM.formula.productReplace.productReplaceList._suffix +'"]').val(obj[0][RM.formula.productReplace.productReplaceList._suffix]);
		CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name="'+RM.formula.productReplace.productReplaceList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name^="'+RM.formula.productReplace.productReplaceList._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name="'+RM.formula.productReplace.productReplaceList._prefix + '.' + RM.formula.productReplace.productReplaceList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.productReplace.productReplaceList._dialog) {
			RM.formula.productReplace.productReplaceList._dialog.close();
		}
	};
	
	RM.formula.productReplace.productReplaceList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.productReplace.productReplaceList.query_"+obj+")!='undefined'") ? eval('RM.formula.productReplace.productReplaceList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
RM_formula_productReplace_productReplaceList_refresh = function(node){
RM.formula.productReplace.productReplaceList.node = node;
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
	RM.formula.productReplace.productReplaceList.query("query");
}

RM_formula_productReplace_productReplaceList_getList = function() {
	return "RM.formula.productReplace.productReplaceList";
}
RM.formula.productReplace.productReplaceList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formula_productReplace_productReplaceListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formula.productReplace.productReplaceList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formula.productReplace.productReplaceList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formula_productReplace_productReplaceList_fileupload_button",
		handler:function(){
				list_operate_formula_productReplaceList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formula.productReplace.productReplaceList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_productReplaceList.RM.formula.productReplace." + params.viewName + ".referenceCopy");
			funcName('productReplace', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formula.productReplace.productReplaceList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_productReplaceList.RM.formula.productReplace." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formula.productReplace.productReplaceList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_productReplaceList.RM.formula.productReplace." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	RM.formula.productReplace.productReplaceList.dbClickViewproductReplaceList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=RM_7.5.0.0_formula&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method RM.formula.productReplace.productReplaceList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.productReplace.productReplaceList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formula.productReplace.productReplaceList.otherParams || {};
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
			
			
			
					if(viewCode=='RM_7.5.0.0_formula_formulaView'||!viewCode){
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
					list_operate_formula_productReplaceList.CUI('#'+formId).submit();
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
		if ( RM.formula.productReplace.productReplaceList.Dlg ) {
			RM.formula.productReplace.productReplaceList.Dlg._config.url = url;
			RM.formula.productReplace.productReplaceList.Dlg._config.formId = formId;
			RM.formula.productReplace.productReplaceList.Dlg.setTitle( title )
			RM.formula.productReplace.productReplaceList.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.productReplace.productReplaceList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_productReplaceList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.productReplace.productReplaceList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.productReplace.productReplaceList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_productReplace', element : $('#RM_formula_productReplace_productReplaceList_fileupload_button a:eq(1)')});
		}
		RM.formula.productReplace.productReplaceList.otherParams = {};
	};

	RM.formula.productReplace.productReplaceList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formula.productReplace.productReplaceList.beforeCommonQuery === 'function') {
	   		var ret = RM.formula.productReplace.productReplaceList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formula.productReplace.productReplaceList.cancelSelectedNode == 'function') {
	   RM.formula.productReplace.productReplaceList.cancelSelectedNode();
	   RM.formula.productReplace.productReplaceList.node = null;
	  }
	  if(typeof RM_formula_productReplace_productReplaceList_cancelSelectedNode == 'function') {
	   RM_formula_productReplace_productReplaceList_cancelSelectedNode();
	   RM.formula.productReplace.productReplaceList.node = null;
	  }
	  RM.formula.productReplace.productReplaceList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.formula.productReplace.productReplaceList.query
	 */
	RM.formula.productReplace.productReplaceList.query = function(type,pageNo,sortFlag){
		var node = RM.formula.productReplace.productReplaceList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.formula.productReplace.productReplaceList.node = null;
		if(!checkListValid("ec_RM_formula_productReplace_productReplaceList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_formula_productReplace_productReplaceList_query._sortKey && datatable_ec_RM_formula_productReplace_productReplaceList_query._sortMethod){
			CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_productReplace_productReplaceList_query._sortKey);
			CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_productReplace_productReplaceList_query._sortColumnName);
			CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_productReplace_productReplaceList_query._sortMethod);
		}else{
			datatable_ec_RM_formula_productReplace_productReplaceList_query._sortKey = '';
			CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_RM_formula_productReplace_productReplaceList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.productReplace.productReplaceList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/formula/productReplace/productReplaceList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/formula/productReplace/productReplaceList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_productReplace_productReplaceList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_productReplaceList";
		condobj.modelAlias="productReplace";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_productReplace_productReplaceList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_productReplace_productReplaceList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_productReplace_productReplaceList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_productReplace_productReplaceList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name="'+ec_RM_formula_productReplace_productReplaceList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_productReplace_productReplaceList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_productReplace_productReplaceList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formula_productReplace_productReplaceList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_productReplace_productReplaceList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_productReplace_productReplaceList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'RM_7.5.0.0_formula_productReplaceList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_formula_productReplace_productReplaceList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_formula_productReplace_productReplaceList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.formula.productReplace.productReplaceList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.productReplace.productReplaceList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.productReplace.productReplaceList.otherParams = {};
	RM.formula.productReplace.productReplaceList.otherParams.dialogType = dialogType;
	RM.formula.productReplace.productReplaceList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.productReplace.productReplaceList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.formula.productReplace.editCallBackInfo
 */
RM.formula.productReplace.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_formula_productReplace_productReplaceList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_productReplace_productReplaceList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formula_productReplace_productReplaceList_getLayout == "function"){
    		var layout = RM_formula_productReplace_productReplaceList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.productReplace.productReplaceList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_productReplace_productReplaceList_queryWidget._sortKey && ec_RM_formula_productReplace_productReplaceList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_ProductReplace'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_productReplace_productReplaceList_queryWidget._sortKey && ec_RM_formula_productReplace_productReplaceList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formula_productReplace_productReplaceList_queryWidget._sortKey && ec_RM_formula_productReplace_productReplaceList_queryWidget._sortMethod ? true : false;
		if(typeof RM_formula_productReplace_productReplaceList_getLayout == "function"){
			var layout = RM_formula_productReplace_productReplaceList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.productReplace.productReplaceList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.productReplace.productReplaceList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.productReplace.productReplaceList.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_ProductReplace'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.productReplace.productReplaceList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.productReplace.productReplaceList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="replaceTime_start"]').val()!= null && $('#' + formId + ' input[name^="replaceTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="replaceTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1540368099250')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="replaceTime_end"]').val()!= null && $('#' + formId + ' input[name^="replaceTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="replaceTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1540368099250')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="replaceTime_start"]').val()!='' && $('#' + formId + ' input[name="replaceTime_end"]').val()!=''){if($('#' + formId + ' input[name="replaceTime_start"]').val() > $('#' + formId + ' input[name="replaceTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1540368099250')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1540368099250')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_productReplaceList,js,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formula_productReplaceList' idprefix='ec_RM_formula_productReplace_productReplaceList' queryUrl='/RM/formula/productReplace/productReplaceList-query.action' queryFunc="RM.formula.productReplace.productReplaceList.query" ns="RM.formula.productReplace.productReplaceList" />
<@exportexcel action="/RM/formula/productReplace/productReplaceList-query.action"   getRequireDataAction="/RM/formula/productReplace/productReplaceList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_ProductReplace&&viewCode=RM_7.5.0.0_formula_productReplaceList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_productReplaceList')}" prefix="ec_RM_formula_productReplace_productReplaceList_query" modelCode="RM_7.5.0.0_formula_ProductReplace"  importFlag="false" viewCode="RM_7.5.0.0_formula_productReplaceList" />
