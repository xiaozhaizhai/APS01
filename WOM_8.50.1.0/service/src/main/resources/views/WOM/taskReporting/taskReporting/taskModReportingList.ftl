<!-- WOM_7.5.0.0/taskReporting/taskModReportingList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1568768298188')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_taskReporting_taskModReportingList,head,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("WOM.taskReporting.taskReporting","WOM.taskReporting.taskReporting.taskModReportingList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_WOM_taskReporting_taskReporting_taskModReportingList_container" border=0>
	<@frame id="ec_WOM_taskReporting_taskReporting_taskModReportingList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "taskModReportingList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_taskReporting_taskModReportingList,html,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_WOM_taskReporting_taskReporting_taskModReportingList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=WOM_7.5.0.0_taskReporting';
		openFullScreen(url);
	};
	
	WOM.taskReporting.taskReporting.taskModReportingList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.taskReporting.taskReporting.taskModReportingList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.taskReporting.taskReporting.taskModReportingList._prefix += '.';
			}
			WOM.taskReporting.taskReporting.taskModReportingList._prefix += arr[i];
		}
		WOM.taskReporting.taskReporting.taskModReportingList._suffix = arr[arr.length -1];
		if(WOM.taskReporting.taskReporting.taskModReportingList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.taskReporting.taskReporting.taskModReportingList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.taskReporting.taskReporting.taskModReportingList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.taskReporting.taskReporting.taskModReportingList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.taskReporting.taskReporting.taskModReportingList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name="'+WOM.taskReporting.taskReporting.taskModReportingList._prefix + '.' + WOM.taskReporting.taskReporting.taskModReportingList._suffix +'"]').val(obj[0][WOM.taskReporting.taskReporting.taskModReportingList._suffix]);
		CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name="'+WOM.taskReporting.taskReporting.taskModReportingList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name^="'+WOM.taskReporting.taskReporting.taskModReportingList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name="'+WOM.taskReporting.taskReporting.taskModReportingList._prefix + '.' + WOM.taskReporting.taskReporting.taskModReportingList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.taskReporting.taskReporting.taskModReportingList._dialog) {
			WOM.taskReporting.taskReporting.taskModReportingList._dialog.close();
		}
	};
	
	WOM.taskReporting.taskReporting.taskModReportingList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.taskReporting.taskReporting.taskModReportingList.query_"+obj+")!='undefined'") ? eval('WOM.taskReporting.taskReporting.taskModReportingList.query_'+obj+'()') : null;
		return str;
	
	};
	
WOM.taskReporting.taskReporting.taskModReportingList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=WOM_7.5.0.0_taskReporting&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	WOM.taskReporting.taskReporting.taskModReportingList.rowDblClickQuery = function(event,row){
		WOM.taskReporting.taskReporting.taskModReportingList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
WOM_taskReporting_taskReporting_taskModReportingList_refresh = function(node){
WOM.taskReporting.taskReporting.taskModReportingList.node = node;
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
	WOM.taskReporting.taskReporting.taskModReportingList.query("query");
}

WOM_taskReporting_taskReporting_taskModReportingList_getList = function() {
	return "WOM.taskReporting.taskReporting.taskModReportingList";
}
WOM.taskReporting.taskReporting.taskModReportingList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_taskReporting_taskReporting_taskModReportingListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.taskReporting.taskReporting.taskModReportingList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.taskReporting.taskReporting.taskModReportingList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_taskReporting_taskReporting_taskModReportingList_fileupload_button",
		handler:function(){
				list_operate_taskReporting_taskModReportingList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.taskReporting.taskReporting.taskModReportingList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_taskReporting_taskModReportingList.WOM.taskReporting.taskReporting." + params.viewName + ".referenceCopy");
			funcName('taskReporting', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.taskReporting.taskReporting.taskModReportingList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_taskReporting_taskModReportingList.WOM.taskReporting.taskReporting." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.taskReporting.taskReporting.taskModReportingList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_taskReporting_taskModReportingList.WOM.taskReporting.taskReporting." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	/**
	 * 显示增加对话框
	 * @method WOM.taskReporting.taskReporting.taskModReportingList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.taskReporting.taskReporting.taskModReportingList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.taskReporting.taskReporting.taskModReportingList.otherParams || {};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_taskReporting_taskModReportingView'||!viewCode){
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
					list_operate_taskReporting_taskModReportingList.CUI('#'+formId).submit();
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
		if ( WOM.taskReporting.taskReporting.taskModReportingList.Dlg ) {
			WOM.taskReporting.taskReporting.taskModReportingList.Dlg._config.url = url;
			WOM.taskReporting.taskReporting.taskModReportingList.Dlg._config.formId = formId;
			WOM.taskReporting.taskReporting.taskModReportingList.Dlg.setTitle( title )
			WOM.taskReporting.taskReporting.taskModReportingList.Dlg.setButtonbar( buttons );
		}else{
			WOM.taskReporting.taskReporting.taskModReportingList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_taskReporting_taskModReportingList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.taskReporting.taskReporting.taskModReportingList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.taskReporting.taskReporting.taskModReportingList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_taskReporting_taskReporting', element : $('#WOM_taskReporting_taskReporting_taskModReportingList_fileupload_button a:eq(1)')});
		}
		WOM.taskReporting.taskReporting.taskModReportingList.otherParams = {};
	};

	WOM.taskReporting.taskReporting.taskModReportingList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.taskReporting.taskReporting.taskModReportingList.beforeCommonQuery === 'function') {
	   		var ret = WOM.taskReporting.taskReporting.taskModReportingList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.taskReporting.taskReporting.taskModReportingList.cancelSelectedNode == 'function') {
	   WOM.taskReporting.taskReporting.taskModReportingList.cancelSelectedNode();
	   WOM.taskReporting.taskReporting.taskModReportingList.node = null;
	  }
	  if(typeof WOM_taskReporting_taskReporting_taskModReportingList_cancelSelectedNode == 'function') {
	   WOM_taskReporting_taskReporting_taskModReportingList_cancelSelectedNode();
	   WOM.taskReporting.taskReporting.taskModReportingList.node = null;
	  }
	  WOM.taskReporting.taskReporting.taskModReportingList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.taskReporting.taskReporting.taskModReportingList.query
	 */
	WOM.taskReporting.taskReporting.taskModReportingList.query = function(type,pageNo,sortFlag){
		var node = WOM.taskReporting.taskReporting.taskModReportingList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.taskReporting.taskReporting.taskModReportingList.node = null;
		if(!checkListValid("ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query._sortKey && datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query._sortMethod){
			CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query._sortKey);
			CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm #dataTableSortColName').val(datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query._sortColumnName);
			CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query._sortMethod);
		}else{
			datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query._sortKey = '';
			CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.get('dblclick') && datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.get('dblclick').length > 0) {
				datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.taskReporting.taskReporting.taskModReportingList.rowDblClick'
		            });
			}
	        datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.taskReporting.taskReporting.taskModReportingList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.get('dblclick') && datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.get('dblclick').length > 0) {
		    	datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.taskReporting.taskReporting.taskModReportingList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.taskReporting.taskReporting.taskModReportingList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.taskReporting.taskReporting.taskModReportingList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/taskReporting/taskReporting/taskModReportingList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/taskReporting/taskReporting/taskModReportingList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_taskReporting_taskModReportingList";
		condobj.modelAlias="taskReporting";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name="'+ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_taskReporting_taskReporting_taskModReportingList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_taskReporting_taskReporting_taskModReportingList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_taskReporting_taskReporting_taskModReportingList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_taskReporting_taskModReportingList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.taskReporting.taskReporting.taskModReportingList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_taskReporting";
		openExportFrame(url);
	}
WOM.taskReporting.taskReporting.taskModReportingList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.taskReporting.taskReporting.taskModReportingList.otherParams = {};
	WOM.taskReporting.taskReporting.taskModReportingList.otherParams.dialogType = dialogType;
	WOM.taskReporting.taskReporting.taskModReportingList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.taskReporting.taskReporting.taskModReportingList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.taskReporting.taskReporting.editCallBackInfo
 */
WOM.taskReporting.taskReporting.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_taskReporting_taskReporting_taskModReportingList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_taskReporting_taskReporting_taskModReportingList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_taskReporting_taskReporting_taskModReportingList_getLayout == "function"){
    		var layout = WOM_taskReporting_taskReporting_taskModReportingList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.taskReporting.taskReporting.taskModReportingList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_taskReporting_taskReporting_taskModReportingList_queryWidget._sortKey && ec_WOM_taskReporting_taskReporting_taskModReportingList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_taskReporting_TaskReporting'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_taskReporting_taskReporting_taskModReportingList_queryWidget._sortKey && ec_WOM_taskReporting_taskReporting_taskModReportingList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_taskReporting_taskReporting_taskModReportingList_queryWidget._sortKey && ec_WOM_taskReporting_taskReporting_taskModReportingList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_taskReporting_taskReporting_taskModReportingList_getLayout == "function"){
			var layout = WOM_taskReporting_taskReporting_taskModReportingList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.taskReporting.taskReporting.taskModReportingList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.taskReporting.taskReporting.taskModReportingList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.taskReporting.taskReporting.taskModReportingList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_taskReporting_TaskReporting'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.taskReporting.taskReporting.taskModReportingList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.taskReporting.taskReporting.taskModReportingList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="reportDate_start"]').val()!= null && $('#' + formId + ' input[name^="reportDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="reportDate_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="reportDate_end"]').val()!= null && $('#' + formId + ' input[name^="reportDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="reportDate_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.datetime')}");return false;}}var effectiveState_start = $('#' + formId + ' input[name^="effectiveState_start"]').val();var effectiveState_end = $('#' + formId + ' input[name^="effectiveState_end"]').val();if( effectiveState_start!=null && effectiveState_start!=''){if(!isInteger(effectiveState_start)){errorbarWidget.showMessage("${getText('ec.common.effectiveState')}${getText('ec.list.validate.integer')}");return false;}}if(effectiveState_end!=null &&  effectiveState_end !=''){if(!isInteger(effectiveState_end)){errorbarWidget.showMessage("${getText('ec.common.effectiveState')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="effectiveState_start"]').val()!='' && $('#' + formId + ' input[name="effectiveState_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="effectiveState_start"]').val()) > parseInt($('#' + formId + ' input[name="effectiveState_end"]').val())){errorbarWidget.showMessage("${getText('ec.common.effectiveState')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('ec.common.effectiveState')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="reportDate_start"]').val()!='' && $('#' + formId + ' input[name="reportDate_end"]').val()!=''){if($('#' + formId + ' input[name="reportDate_start"]').val() > $('#' + formId + ' input[name="reportDate_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.start')}");return false;}}return true;};



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
	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_taskReporting_taskModReportingList,js,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_taskReporting_taskModReportingList' idprefix='ec_WOM_taskReporting_taskReporting_taskModReportingList' queryUrl='/WOM/taskReporting/taskReporting/taskModReportingList-query.action' queryFunc="WOM.taskReporting.taskReporting.taskModReportingList.query" ns="WOM.taskReporting.taskReporting.taskModReportingList" />
<@exportexcel action="/WOM/taskReporting/taskReporting/taskModReportingList-query.action"   getRequireDataAction="/WOM/taskReporting/taskReporting/taskModReportingList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_taskReporting_TaskReporting&&viewCode=WOM_7.5.0.0_taskReporting_taskModReportingList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_taskReporting_taskModReportingList')}" prefix="ec_WOM_taskReporting_taskReporting_taskModReportingList_query" modelCode="WOM_7.5.0.0_taskReporting_TaskReporting"  importFlag="false" viewCode="WOM_7.5.0.0_taskReporting_taskModReportingList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
