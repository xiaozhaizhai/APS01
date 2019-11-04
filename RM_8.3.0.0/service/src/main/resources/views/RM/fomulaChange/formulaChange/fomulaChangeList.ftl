<!-- RM_7.5.0.0/fomulaChange/fomulaChangeList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1497599951608')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_fomulaChange_fomulaChangeList,head,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("RM.fomulaChange.formulaChange","RM.fomulaChange.formulaChange.fomulaChangeList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_RM_fomulaChange_formulaChange_fomulaChangeList_container" border=0>
	<@frame id="ec_RM_fomulaChange_formulaChange_fomulaChangeList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "fomulaChangeList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_fomulaChange_fomulaChangeList,html,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_RM_fomulaChange_formulaChange_fomulaChangeList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=RM_7.5.0.0_fomulaChange';
		openFullScreen(url);
	};
	
	RM.fomulaChange.formulaChange.fomulaChangeList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.fomulaChange.formulaChange.fomulaChangeList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.fomulaChange.formulaChange.fomulaChangeList._prefix += '.';
			}
			RM.fomulaChange.formulaChange.fomulaChangeList._prefix += arr[i];
		}
		RM.fomulaChange.formulaChange.fomulaChangeList._suffix = arr[arr.length -1];
		if(RM.fomulaChange.formulaChange.fomulaChangeList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.fomulaChange.formulaChange.fomulaChangeList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.fomulaChange.formulaChange.fomulaChangeList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.fomulaChange.formulaChange.fomulaChangeList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.fomulaChange.formulaChange.fomulaChangeList.getcallBackInfo = function(obj){
		CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name="'+RM.fomulaChange.formulaChange.fomulaChangeList._prefix + '.' + RM.fomulaChange.formulaChange.fomulaChangeList._suffix +'"]').val(obj[0][RM.fomulaChange.formulaChange.fomulaChangeList._suffix]);
		CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name="'+RM.fomulaChange.formulaChange.fomulaChangeList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name^="'+RM.fomulaChange.formulaChange.fomulaChangeList._prefix + '."]').unbind("change");
		CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name="'+RM.fomulaChange.formulaChange.fomulaChangeList._prefix + '.' + RM.fomulaChange.formulaChange.fomulaChangeList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.fomulaChange.formulaChange.fomulaChangeList._dialog) {
			RM.fomulaChange.formulaChange.fomulaChangeList._dialog.close();
		}
	};
	
	RM.fomulaChange.formulaChange.fomulaChangeList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.fomulaChange.formulaChange.fomulaChangeList.query_"+obj+")!='undefined'") ? eval('RM.fomulaChange.formulaChange.fomulaChangeList.query_'+obj+'()') : null;
		return str;
	
	};
	
RM.fomulaChange.formulaChange.fomulaChangeList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=RM_7.5.0.0_fomulaChange&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	RM.fomulaChange.formulaChange.fomulaChangeList.rowDblClickQuery = function(event,row){
		RM.fomulaChange.formulaChange.fomulaChangeList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
RM_fomulaChange_formulaChange_fomulaChangeList_refresh = function(node){
RM.fomulaChange.formulaChange.fomulaChangeList.node = node;
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
	RM.fomulaChange.formulaChange.fomulaChangeList.query("query");
}

RM_fomulaChange_formulaChange_fomulaChangeList_getList = function() {
	return "RM.fomulaChange.formulaChange.fomulaChangeList";
}
RM.fomulaChange.formulaChange.fomulaChangeList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_fomulaChange_formulaChange_fomulaChangeListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.fomulaChange.formulaChange.fomulaChangeList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.fomulaChange.formulaChange.fomulaChangeList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_fomulaChange_formulaChange_fomulaChangeList_fileupload_button",
		handler:function(){
				list_operate_fomulaChange_fomulaChangeList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.fomulaChange.formulaChange.fomulaChangeList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_fomulaChange_fomulaChangeList.RM.fomulaChange.formulaChange." + params.viewName + ".referenceCopy");
			funcName('formulaChange', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.fomulaChange.formulaChange.fomulaChangeList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_fomulaChange_fomulaChangeList.RM.fomulaChange.formulaChange." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.fomulaChange.formulaChange.fomulaChangeList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_fomulaChange_fomulaChangeList.RM.fomulaChange.formulaChange." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	/**
	 * 显示增加对话框
	 * @method RM.fomulaChange.formulaChange.fomulaChangeList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.fomulaChange.formulaChange.fomulaChangeList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.fomulaChange.formulaChange.fomulaChangeList.otherParams || {};
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
			
			
			
					if(viewCode=='RM_7.5.0.0_fomulaChange_fomulaStateView'||!viewCode){
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
					list_operate_fomulaChange_fomulaChangeList.CUI('#'+formId).submit();
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
		if ( RM.fomulaChange.formulaChange.fomulaChangeList.Dlg ) {
			RM.fomulaChange.formulaChange.fomulaChangeList.Dlg._config.url = url;
			RM.fomulaChange.formulaChange.fomulaChangeList.Dlg._config.formId = formId;
			RM.fomulaChange.formulaChange.fomulaChangeList.Dlg.setTitle( title )
			RM.fomulaChange.formulaChange.fomulaChangeList.Dlg.setButtonbar( buttons );
		}else{
			RM.fomulaChange.formulaChange.fomulaChangeList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_fomulaChange_fomulaChangeList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.fomulaChange.formulaChange.fomulaChangeList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.fomulaChange.formulaChange.fomulaChangeList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_fomulaChange_formulaChange', element : $('#RM_fomulaChange_formulaChange_fomulaChangeList_fileupload_button a:eq(1)')});
		}
		RM.fomulaChange.formulaChange.fomulaChangeList.otherParams = {};
	};

	RM.fomulaChange.formulaChange.fomulaChangeList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.fomulaChange.formulaChange.fomulaChangeList.beforeCommonQuery === 'function') {
	   		var ret = RM.fomulaChange.formulaChange.fomulaChangeList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.fomulaChange.formulaChange.fomulaChangeList.cancelSelectedNode == 'function') {
	   RM.fomulaChange.formulaChange.fomulaChangeList.cancelSelectedNode();
	   RM.fomulaChange.formulaChange.fomulaChangeList.node = null;
	  }
	  if(typeof RM_fomulaChange_formulaChange_fomulaChangeList_cancelSelectedNode == 'function') {
	   RM_fomulaChange_formulaChange_fomulaChangeList_cancelSelectedNode();
	   RM.fomulaChange.formulaChange.fomulaChangeList.node = null;
	  }
	  RM.fomulaChange.formulaChange.fomulaChangeList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.fomulaChange.formulaChange.fomulaChangeList.query
	 */
	RM.fomulaChange.formulaChange.fomulaChangeList.query = function(type,pageNo,sortFlag){
		var node = RM.fomulaChange.formulaChange.fomulaChangeList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.fomulaChange.formulaChange.fomulaChangeList.node = null;
		if(!checkListValid("ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query._sortKey && datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query._sortMethod){
			CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm #dataTableSortColKey').val(datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query._sortKey);
			CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm #dataTableSortColName').val(datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query._sortColumnName);
			CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query._sortMethod);
		}else{
			datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query._sortKey = '';
			CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.get('dblclick') && datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.get('dblclick').length > 0) {
				datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.fomulaChange.formulaChange.fomulaChangeList.rowDblClick'
		            });
			}
	        datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.fomulaChange.formulaChange.fomulaChangeList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.get('dblclick') && datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.get('dblclick').length > 0) {
		    	datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.fomulaChange.formulaChange.fomulaChangeList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.fomulaChange.formulaChange.fomulaChangeList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.fomulaChange.formulaChange.fomulaChangeList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/fomulaChange/formulaChange/fomulaChangeList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/fomulaChange/formulaChange/fomulaChangeList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_fomulaChange_fomulaChangeList";
		condobj.modelAlias="formulaChange";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name="'+ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_fomulaChange_formulaChange_fomulaChangeList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_fomulaChange_formulaChange_fomulaChangeList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'RM_7.5.0.0_fomulaChange_fomulaChangeList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.fomulaChange.formulaChange.fomulaChangeList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_fomulaChange";
		openExportFrame(url);
	}
RM.fomulaChange.formulaChange.fomulaChangeList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.fomulaChange.formulaChange.fomulaChangeList.otherParams = {};
	RM.fomulaChange.formulaChange.fomulaChangeList.otherParams.dialogType = dialogType;
	RM.fomulaChange.formulaChange.fomulaChangeList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.fomulaChange.formulaChange.fomulaChangeList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.fomulaChange.formulaChange.editCallBackInfo
 */
RM.fomulaChange.formulaChange.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_fomulaChange_formulaChange_fomulaChangeList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_fomulaChange_formulaChange_fomulaChangeList_getLayout == "function"){
    		var layout = RM_fomulaChange_formulaChange_fomulaChangeList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.fomulaChange.formulaChange.fomulaChangeList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryWidget._sortKey && ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_fomulaChange_FormulaChange'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryWidget._sortKey && ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryWidget._sortKey && ec_RM_fomulaChange_formulaChange_fomulaChangeList_queryWidget._sortMethod ? true : false;
		if(typeof RM_fomulaChange_formulaChange_fomulaChangeList_getLayout == "function"){
			var layout = RM_fomulaChange_formulaChange_fomulaChangeList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.fomulaChange.formulaChange.fomulaChangeList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.fomulaChange.formulaChange.fomulaChangeList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.fomulaChange.formulaChange.fomulaChangeList.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_fomulaChange_FormulaChange'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.fomulaChange.formulaChange.fomulaChangeList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.fomulaChange.formulaChange.fomulaChangeList.query('pending');
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
	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_fomulaChange_fomulaChangeList,js,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_fomulaChange_fomulaChangeList' idprefix='ec_RM_fomulaChange_formulaChange_fomulaChangeList' queryUrl='/RM/fomulaChange/formulaChange/fomulaChangeList-query.action' queryFunc="RM.fomulaChange.formulaChange.fomulaChangeList.query" ns="RM.fomulaChange.formulaChange.fomulaChangeList" />
<@exportexcel action="/RM/fomulaChange/formulaChange/fomulaChangeList-query.action"   getRequireDataAction="/RM/fomulaChange/formulaChange/fomulaChangeList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_fomulaChange_FormulaChange&&viewCode=RM_7.5.0.0_fomulaChange_fomulaChangeList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_fomulaChange_fomulaChangeList')}" prefix="ec_RM_fomulaChange_formulaChange_fomulaChangeList_query" modelCode="RM_7.5.0.0_fomulaChange_FormulaChange"  importFlag="false" viewCode="RM_7.5.0.0_fomulaChange_fomulaChangeList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
