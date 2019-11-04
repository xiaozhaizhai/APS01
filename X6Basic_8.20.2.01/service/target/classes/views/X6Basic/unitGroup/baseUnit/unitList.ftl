<!-- X6Basic_1.0/unitGroup/unitList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1398240342019')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_unitGroup_unitList,head,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.unitGroup.baseUnit','X6Basic.unitGroup.baseUnit.unitList');
</script>
<@frameset id="ec_X6Basic_unitGroup_baseUnit_unitList_container" border=0>
	<@frame id="ec_X6Basic_unitGroup_baseUnit_unitList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "unitList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_unitGroup_unitList,html,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.unitGroup.baseUnit.unitList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.unitGroup.baseUnit.unitList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.unitGroup.baseUnit.unitList._prefix += '.';
			}
			X6Basic.unitGroup.baseUnit.unitList._prefix += arr[i];
		}
		X6Basic.unitGroup.baseUnit.unitList._suffix = arr[arr.length -1];
		if(X6Basic.unitGroup.baseUnit.unitList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.unitGroup.baseUnit.unitList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.unitGroup.baseUnit.unitList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.unitGroup.baseUnit.unitList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.unitGroup.baseUnit.unitList.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name="'+X6Basic.unitGroup.baseUnit.unitList._prefix + '.' + X6Basic.unitGroup.baseUnit.unitList._suffix +'"]').val(obj[0][X6Basic.unitGroup.baseUnit.unitList._suffix]);
		CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name="'+X6Basic.unitGroup.baseUnit.unitList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name^="'+X6Basic.unitGroup.baseUnit.unitList._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name="'+X6Basic.unitGroup.baseUnit.unitList._prefix + '.' + X6Basic.unitGroup.baseUnit.unitList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.unitGroup.baseUnit.unitList._dialog) {
			X6Basic.unitGroup.baseUnit.unitList._dialog.close();
		}
	};
	
	X6Basic.unitGroup.baseUnit.unitList._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.unitGroup.baseUnit.unitList.query_"+obj+")!='undefined'") ? eval('X6Basic.unitGroup.baseUnit.unitList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
X6Basic_unitGroup_baseUnit_unitList_refresh = function(node){
X6Basic.unitGroup.baseUnit.unitList.node = node;
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
	X6Basic.unitGroup.baseUnit.unitList.query("query");
}

X6Basic_unitGroup_baseUnit_unitList_getList = function() {
	return "X6Basic.unitGroup.baseUnit.unitList";
}
X6Basic.unitGroup.baseUnit.unitList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.X6Basic_unitGroup_baseUnit_unitListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

X6Basic.unitGroup.baseUnit.unitList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.unitGroup.baseUnit.unitList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_unitGroup_baseUnit_unitList_fileupload_button",
		handler:function(){
				list_operate_unitGroup_unitList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.unitGroup.baseUnit.unitList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_unitGroup_unitList.X6Basic.unitGroup.baseUnit." + params.viewName + ".referenceCopy");
			funcName('baseUnit', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.unitGroup.baseUnit.unitList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_unitGroup_unitList.X6Basic.unitGroup.baseUnit." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.unitGroup.baseUnit.unitList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_unitGroup_unitList.X6Basic.unitGroup.baseUnit." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	X6Basic.unitGroup.baseUnit.unitList.dbClickViewunitList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=X6Basic_1.0_unitGroup&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method X6Basic.unitGroup.baseUnit.unitList.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.unitGroup.baseUnit.unitList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = X6Basic.unitGroup.baseUnit.unitList.otherParams || {};
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
			
			
			
					if(viewCode=='X6Basic_1.0_unitGroup_unitView'||!viewCode){
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
					list_operate_unitGroup_unitList.CUI('#'+formId).submit();
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
		if ( X6Basic.unitGroup.baseUnit.unitList.Dlg ) {
			X6Basic.unitGroup.baseUnit.unitList.Dlg._config.url = url;
			X6Basic.unitGroup.baseUnit.unitList.Dlg._config.formId = formId;
			X6Basic.unitGroup.baseUnit.unitList.Dlg.setTitle( title )
			X6Basic.unitGroup.baseUnit.unitList.Dlg.setButtonbar( buttons );
		}else{
			X6Basic.unitGroup.baseUnit.unitList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_unitGroup_unitList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		X6Basic.unitGroup.baseUnit.unitList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		X6Basic.unitGroup.baseUnit.unitList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_unitGroup_baseUnit', element : $('#X6Basic_unitGroup_baseUnit_unitList_fileupload_button a:eq(1)')});
		}
		X6Basic.unitGroup.baseUnit.unitList.otherParams = {};
	};

	X6Basic.unitGroup.baseUnit.unitList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof X6Basic.unitGroup.baseUnit.unitList.beforeCommonQuery === 'function') {
	   		var ret = X6Basic.unitGroup.baseUnit.unitList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof X6Basic.unitGroup.baseUnit.unitList.cancelSelectedNode == 'function') {
	   X6Basic.unitGroup.baseUnit.unitList.cancelSelectedNode();
	   X6Basic.unitGroup.baseUnit.unitList.node = null;
	  }
	  if(typeof X6Basic_unitGroup_baseUnit_unitList_cancelSelectedNode == 'function') {
	   X6Basic_unitGroup_baseUnit_unitList_cancelSelectedNode();
	   X6Basic.unitGroup.baseUnit.unitList.node = null;
	  }
	  X6Basic.unitGroup.baseUnit.unitList.query(type);
	 };
	
	/**
	 * 查询
	 * @method X6Basic.unitGroup.baseUnit.unitList.query
	 */
	X6Basic.unitGroup.baseUnit.unitList.query = function(type,pageNo,sortFlag){
		var node = X6Basic.unitGroup.baseUnit.unitList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//X6Basic.unitGroup.baseUnit.unitList.node = null;
		if(!checkListValid("ec_X6Basic_unitGroup_baseUnit_unitList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query._sortKey && datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query._sortMethod){
			CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query._sortKey);
			CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query._sortColumnName);
			CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query._sortMethod);
		}else{
			datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query._sortKey = '';
			CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "X6Basic.unitGroup.baseUnit.unitList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/X6Basic/unitGroup/baseUnit/unitList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/X6Basic/unitGroup/baseUnit/unitList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="X6Basic_1.0_unitGroup_unitList";
		condobj.modelAlias="baseUnit";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name="'+ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_X6Basic_unitGroup_baseUnit_unitList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info["MainTableName"];
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
						var layrec=ec_X6Basic_unitGroup_baseUnit_unitList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_X6Basic_unitGroup_baseUnit_unitList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'X6Basic_1.0_unitGroup_unitList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	X6Basic.unitGroup.baseUnit.unitList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_unitGroup";
		openExportFrame(url);
	}
X6Basic.unitGroup.baseUnit.unitList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	X6Basic.unitGroup.baseUnit.unitList.otherParams = {};
	X6Basic.unitGroup.baseUnit.unitList.otherParams.dialogType = dialogType;
	X6Basic.unitGroup.baseUnit.unitList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.unitGroup.baseUnit.unitList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.unitGroup.baseUnit.editCallBackInfo
 */
X6Basic.unitGroup.baseUnit.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_X6Basic_unitGroup_baseUnit_unitList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_unitGroup_baseUnit_unitList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_unitGroup_baseUnit_unitList_getLayout == "function"){
    		var layout = X6Basic_unitGroup_baseUnit_unitList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.unitGroup.baseUnit.unitList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_unitGroup_baseUnit_unitList_queryWidget._sortKey && ec_X6Basic_unitGroup_baseUnit_unitList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'X6Basic_1.0_unitGroup_BaseUnit'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_unitGroup_baseUnit_unitList_queryWidget._sortKey && ec_X6Basic_unitGroup_baseUnit_unitList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_X6Basic_unitGroup_baseUnit_unitList_queryWidget._sortKey && ec_X6Basic_unitGroup_baseUnit_unitList_queryWidget._sortMethod ? true : false;
		if(typeof X6Basic_unitGroup_baseUnit_unitList_getLayout == "function"){
			var layout = X6Basic_unitGroup_baseUnit_unitList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.unitGroup.baseUnit.unitList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.unitGroup.baseUnit.unitList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.unitGroup.baseUnit.unitList.query('query');
	    	}
			if(modelCode == 'X6Basic_1.0_unitGroup_BaseUnit'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.unitGroup.baseUnit.unitList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.unitGroup.baseUnit.unitList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-X6Basic_1.0_unitGroup_unitList,js,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='X6Basic_1.0_unitGroup_unitList' idprefix='ec_X6Basic_unitGroup_baseUnit_unitList' queryUrl='/X6Basic/unitGroup/baseUnit/unitList-query.action' queryFunc="X6Basic.unitGroup.baseUnit.unitList.query" ns="X6Basic.unitGroup.baseUnit.unitList" />
<@exportexcel action="/X6Basic/unitGroup/baseUnit/unitList-query.action"   getRequireDataAction="/X6Basic/unitGroup/baseUnit/unitList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=X6Basic_1.0_unitGroup_BaseUnit&&viewCode=X6Basic_1.0_unitGroup_unitList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_unitGroup_unitList')}" prefix="ec_X6Basic_unitGroup_baseUnit_unitList_query" modelCode="X6Basic_1.0_unitGroup_BaseUnit"  importFlag="false" viewCode="X6Basic_1.0_unitGroup_unitList" />
