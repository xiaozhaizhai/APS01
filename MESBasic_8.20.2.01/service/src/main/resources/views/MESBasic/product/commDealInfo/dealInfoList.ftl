<!-- MESBasic_1/product/dealInfoList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1471525757298')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_product_dealInfoList,head,MESBasic_1_product_CommDealInfo,MESBasic_1) -->
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
	CUI.ns('MESBasic.product.commDealInfo','MESBasic.product.commDealInfo.dealInfoList');
</script>
<@frameset id="ec_MESBasic_product_commDealInfo_dealInfoList_container" border=0>
	<@frame id="ec_MESBasic_product_commDealInfo_dealInfoList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "dealInfoList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_product_dealInfoList,html,MESBasic_1_product_CommDealInfo,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.product.commDealInfo.dealInfoList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product.commDealInfo.dealInfoList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product.commDealInfo.dealInfoList._prefix += '.';
			}
			MESBasic.product.commDealInfo.dealInfoList._prefix += arr[i];
		}
		MESBasic.product.commDealInfo.dealInfoList._suffix = arr[arr.length -1];
		if(MESBasic.product.commDealInfo.dealInfoList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product.commDealInfo.dealInfoList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product.commDealInfo.dealInfoList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product.commDealInfo.dealInfoList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.product.commDealInfo.dealInfoList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name="'+MESBasic.product.commDealInfo.dealInfoList._prefix + '.' + MESBasic.product.commDealInfo.dealInfoList._suffix +'"]').val(obj[0][MESBasic.product.commDealInfo.dealInfoList._suffix]);
		CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name="'+MESBasic.product.commDealInfo.dealInfoList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name^="'+MESBasic.product.commDealInfo.dealInfoList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name="'+MESBasic.product.commDealInfo.dealInfoList._prefix + '.' + MESBasic.product.commDealInfo.dealInfoList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.product.commDealInfo.dealInfoList._dialog) {
			MESBasic.product.commDealInfo.dealInfoList._dialog.close();
		}
	};
	
	MESBasic.product.commDealInfo.dealInfoList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product.commDealInfo.dealInfoList.query_"+obj+")!='undefined'") ? eval('MESBasic.product.commDealInfo.dealInfoList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_product_commDealInfo_dealInfoList_refresh = function(node){
MESBasic.product.commDealInfo.dealInfoList.node = node;
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
	MESBasic.product.commDealInfo.dealInfoList.query("query");
}

MESBasic_product_commDealInfo_dealInfoList_getList = function() {
	return "MESBasic.product.commDealInfo.dealInfoList";
}
MESBasic.product.commDealInfo.dealInfoList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_product_commDealInfo_dealInfoListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.product.commDealInfo.dealInfoList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.product.commDealInfo.dealInfoList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_product_commDealInfo_dealInfoList_fileupload_button",
		handler:function(){
				list_operate_product_dealInfoList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.product.commDealInfo.dealInfoList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_product_dealInfoList.MESBasic.product.commDealInfo." + params.viewName + ".referenceCopy");
			funcName('commDealInfo', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.product.commDealInfo.dealInfoList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_product_dealInfoList.MESBasic.product.commDealInfo." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.product.commDealInfo.dealInfoList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_product_dealInfoList.MESBasic.product.commDealInfo." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.product.commDealInfo.dealInfoList.dbClickViewdealInfoList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_product&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.product.commDealInfo.dealInfoList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.product.commDealInfo.dealInfoList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.product.commDealInfo.dealInfoList.otherParams || {};
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
			
			
			
					if(viewCode=='MESBasic_1_product_productViewnew'||!viewCode){
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
					list_operate_product_dealInfoList.CUI('#'+formId).submit();
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
		if ( MESBasic.product.commDealInfo.dealInfoList.Dlg ) {
			MESBasic.product.commDealInfo.dealInfoList.Dlg._config.url = url;
			MESBasic.product.commDealInfo.dealInfoList.Dlg._config.formId = formId;
			MESBasic.product.commDealInfo.dealInfoList.Dlg.setTitle( title )
			MESBasic.product.commDealInfo.dealInfoList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.product.commDealInfo.dealInfoList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_product_dealInfoList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.product.commDealInfo.dealInfoList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.product.commDealInfo.dealInfoList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_product_commDealInfo', element : $('#MESBasic_product_commDealInfo_dealInfoList_fileupload_button a:eq(1)')});
		}
		MESBasic.product.commDealInfo.dealInfoList.otherParams = {};
	};

	MESBasic.product.commDealInfo.dealInfoList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.product.commDealInfo.dealInfoList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.product.commDealInfo.dealInfoList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.product.commDealInfo.dealInfoList.cancelSelectedNode == 'function') {
	   MESBasic.product.commDealInfo.dealInfoList.cancelSelectedNode();
	   MESBasic.product.commDealInfo.dealInfoList.node = null;
	  }
	  if(typeof MESBasic_product_commDealInfo_dealInfoList_cancelSelectedNode == 'function') {
	   MESBasic_product_commDealInfo_dealInfoList_cancelSelectedNode();
	   MESBasic.product.commDealInfo.dealInfoList.node = null;
	  }
	  MESBasic.product.commDealInfo.dealInfoList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.product.commDealInfo.dealInfoList.query
	 */
	MESBasic.product.commDealInfo.dealInfoList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.product.commDealInfo.dealInfoList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.product.commDealInfo.dealInfoList.node = null;
		if(!checkListValid("ec_MESBasic_product_commDealInfo_dealInfoList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query._sortKey && datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query._sortMethod){
			CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query._sortKey);
			CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query._sortColumnName);
			CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query._sortKey = '';
			CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.product.commDealInfo.dealInfoList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/product/commDealInfo/dealInfoList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/product/commDealInfo/dealInfoList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_product_dealInfoList";
		condobj.modelAlias="commDealInfo";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name="'+ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_product_commDealInfo_dealInfoList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_product_commDealInfo_dealInfoList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_product_commDealInfo_dealInfoList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_product_dealInfoList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.product.commDealInfo.dealInfoList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_product";
		openExportFrame(url);
	}
MESBasic.product.commDealInfo.dealInfoList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.product.commDealInfo.dealInfoList.otherParams = {};
	MESBasic.product.commDealInfo.dealInfoList.otherParams.dialogType = dialogType;
	MESBasic.product.commDealInfo.dealInfoList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product.commDealInfo.dealInfoList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.product.commDealInfo.editCallBackInfo
 */
MESBasic.product.commDealInfo.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_product_commDealInfo_dealInfoList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_product_commDealInfo_dealInfoList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_product_commDealInfo_dealInfoList_getLayout == "function"){
    		var layout = MESBasic_product_commDealInfo_dealInfoList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.product.commDealInfo.dealInfoList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_commDealInfo_dealInfoList_queryWidget._sortKey && ec_MESBasic_product_commDealInfo_dealInfoList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_product_CommDealInfo'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_commDealInfo_dealInfoList_queryWidget._sortKey && ec_MESBasic_product_commDealInfo_dealInfoList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_product_commDealInfo_dealInfoList_queryWidget._sortKey && ec_MESBasic_product_commDealInfo_dealInfoList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_product_commDealInfo_dealInfoList_getLayout == "function"){
			var layout = MESBasic_product_commDealInfo_dealInfoList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.product.commDealInfo.dealInfoList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.product.commDealInfo.dealInfoList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.product.commDealInfo.dealInfoList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_product_CommDealInfo'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.product.commDealInfo.dealInfoList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.product.commDealInfo.dealInfoList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="dealTime_start"]').val()!= null && $('#' + formId + ' input[name^="dealTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="dealTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1471524822825')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="dealTime_end"]').val()!= null && $('#' + formId + ' input[name^="dealTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="dealTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1471524822825')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="dealTime_start"]').val()!='' && $('#' + formId + ' input[name="dealTime_end"]').val()!=''){if($('#' + formId + ' input[name="dealTime_start"]').val() > $('#' + formId + ' input[name="dealTime_end"]').val()){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1471524822825')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('MESBasic.propertydisplayName.randon1471524822825')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_product_dealInfoList,js,MESBasic_1_product_CommDealInfo,MESBasic_1) */
// 自定义代码
MESBasic.product.commDealInfo.dealInfoList.dbClickViewdealInfoList = function(event, oRow) {};
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_product_dealInfoList' idprefix='ec_MESBasic_product_commDealInfo_dealInfoList' queryUrl='/MESBasic/product/commDealInfo/dealInfoList-query.action' queryFunc="MESBasic.product.commDealInfo.dealInfoList.query" ns="MESBasic.product.commDealInfo.dealInfoList" />
<@exportexcel action="/MESBasic/product/commDealInfo/dealInfoList-query.action"   getRequireDataAction="/MESBasic/product/commDealInfo/dealInfoList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_product_CommDealInfo&&viewCode=MESBasic_1_product_dealInfoList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_product_dealInfoList')}" prefix="ec_MESBasic_product_commDealInfo_dealInfoList_query" modelCode="MESBasic_1_product_CommDealInfo"  importFlag="false" viewCode="MESBasic_1_product_dealInfoList" />
