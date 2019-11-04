<!-- MESBasic_1/itemRecord/itemRecordList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.radion1415340847977')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_itemRecord_itemRecordList,head,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) -->
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
	CUI.ns('MESBasic.itemRecord.itemRecord','MESBasic.itemRecord.itemRecord.itemRecordList');
</script>
<@frameset id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_container" border=0>
	<@frame id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "itemRecordList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_itemRecord_itemRecordList,html,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.itemRecord.itemRecord.itemRecordList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.itemRecord.itemRecord.itemRecordList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.itemRecord.itemRecord.itemRecordList._prefix += '.';
			}
			MESBasic.itemRecord.itemRecord.itemRecordList._prefix += arr[i];
		}
		MESBasic.itemRecord.itemRecord.itemRecordList._suffix = arr[arr.length -1];
		if(MESBasic.itemRecord.itemRecord.itemRecordList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.itemRecord.itemRecord.itemRecordList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.itemRecord.itemRecord.itemRecordList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.itemRecord.itemRecord.itemRecordList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.itemRecord.itemRecord.itemRecordList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name="'+MESBasic.itemRecord.itemRecord.itemRecordList._prefix + '.' + MESBasic.itemRecord.itemRecord.itemRecordList._suffix +'"]').val(obj[0][MESBasic.itemRecord.itemRecord.itemRecordList._suffix]);
		CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name="'+MESBasic.itemRecord.itemRecord.itemRecordList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name^="'+MESBasic.itemRecord.itemRecord.itemRecordList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name="'+MESBasic.itemRecord.itemRecord.itemRecordList._prefix + '.' + MESBasic.itemRecord.itemRecord.itemRecordList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.itemRecord.itemRecord.itemRecordList._dialog) {
			MESBasic.itemRecord.itemRecord.itemRecordList._dialog.close();
		}
	};
	
	MESBasic.itemRecord.itemRecord.itemRecordList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.itemRecord.itemRecord.itemRecordList.query_"+obj+")!='undefined'") ? eval('MESBasic.itemRecord.itemRecord.itemRecordList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_itemRecord_itemRecord_itemRecordList_refresh = function(node){
MESBasic.itemRecord.itemRecord.itemRecordList.node = node;
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
	MESBasic.itemRecord.itemRecord.itemRecordList.query("query");
}

MESBasic_itemRecord_itemRecord_itemRecordList_getList = function() {
	return "MESBasic.itemRecord.itemRecord.itemRecordList";
}
MESBasic.itemRecord.itemRecord.itemRecordList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_itemRecord_itemRecord_itemRecordListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.itemRecord.itemRecord.itemRecordList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.itemRecord.itemRecord.itemRecordList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_itemRecord_itemRecord_itemRecordList_fileupload_button",
		handler:function(){
				list_operate_itemRecord_itemRecordList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.itemRecord.itemRecord.itemRecordList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_itemRecord_itemRecordList.MESBasic.itemRecord.itemRecord." + params.viewName + ".referenceCopy");
			funcName('itemRecord', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.itemRecord.itemRecord.itemRecordList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_itemRecord_itemRecordList.MESBasic.itemRecord.itemRecord." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.itemRecord.itemRecord.itemRecordList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_itemRecord_itemRecordList.MESBasic.itemRecord.itemRecord." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.itemRecord.itemRecord.itemRecordList.dbClickViewitemRecordList =  function(event, oRow) {
		var viewUrl = '/MESBasic/itemRecord/itemRecord/itemRecordView.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_itemRecord&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.itemRecord.itemRecord.itemRecordList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.itemRecord.itemRecord.itemRecordList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.itemRecord.itemRecord.itemRecordList.otherParams || {};
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
			
			
			
					if(viewCode=='MESBasic_1_itemRecord_itemRecordView'||!viewCode){
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
					list_operate_itemRecord_itemRecordList.CUI('#'+formId).submit();
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
		if ( MESBasic.itemRecord.itemRecord.itemRecordList.Dlg ) {
			MESBasic.itemRecord.itemRecord.itemRecordList.Dlg._config.url = url;
			MESBasic.itemRecord.itemRecord.itemRecordList.Dlg._config.formId = formId;
			MESBasic.itemRecord.itemRecord.itemRecordList.Dlg.setTitle( title )
			MESBasic.itemRecord.itemRecord.itemRecordList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.itemRecord.itemRecord.itemRecordList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_itemRecord_itemRecordList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.itemRecord.itemRecord.itemRecordList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.itemRecord.itemRecord.itemRecordList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_itemRecord_itemRecord', element : $('#MESBasic_itemRecord_itemRecord_itemRecordList_fileupload_button a:eq(1)')});
		}
		MESBasic.itemRecord.itemRecord.itemRecordList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.itemRecord.itemRecord.itemRecordList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.itemRecord.itemRecord.itemRecordList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.itemRecord.itemRecord.itemRecordList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.itemRecord.itemRecord.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.itemRecord.itemRecord.itemRecordList.AppDlg.show();
	};

	MESBasic.itemRecord.itemRecord.itemRecordList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.itemRecord.itemRecord.itemRecordList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.itemRecord.itemRecord.itemRecordList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.itemRecord.itemRecord.itemRecordList.cancelSelectedNode == 'function') {
	   MESBasic.itemRecord.itemRecord.itemRecordList.cancelSelectedNode();
	   MESBasic.itemRecord.itemRecord.itemRecordList.node = null;
	  }
	  if(typeof MESBasic_itemRecord_itemRecord_itemRecordList_cancelSelectedNode == 'function') {
	   MESBasic_itemRecord_itemRecord_itemRecordList_cancelSelectedNode();
	   MESBasic.itemRecord.itemRecord.itemRecordList.node = null;
	  }
	  MESBasic.itemRecord.itemRecord.itemRecordList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.itemRecord.itemRecord.itemRecordList.query
	 */
	MESBasic.itemRecord.itemRecord.itemRecordList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.itemRecord.itemRecord.itemRecordList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.itemRecord.itemRecord.itemRecordList.node = null;
		if(!checkListValid("ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query._sortKey && datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query._sortMethod){
			CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query._sortKey);
			CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query._sortColumnName);
			CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query._sortKey = '';
			CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.itemRecord.itemRecord.itemRecordList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/itemRecord/itemRecord/itemRecordList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/itemRecord/itemRecord/itemRecordList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_itemRecord_itemRecordList";
		condobj.modelAlias="itemRecord";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name="'+ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_itemRecord_itemRecord_itemRecordList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_itemRecord_itemRecordList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.itemRecord.itemRecord.itemRecordList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_itemRecord";
		openExportFrame(url);
	}
MESBasic.itemRecord.itemRecord.itemRecordList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.itemRecord.itemRecord.itemRecordList.otherParams = {};
	MESBasic.itemRecord.itemRecord.itemRecordList.otherParams.dialogType = dialogType;
	MESBasic.itemRecord.itemRecord.itemRecordList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.itemRecord.itemRecord.itemRecordList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.itemRecord.itemRecord.editCallBackInfo
 */
MESBasic.itemRecord.itemRecord.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_itemRecord_itemRecord_itemRecordList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_itemRecord_itemRecord_itemRecordList_getLayout == "function"){
    		var layout = MESBasic_itemRecord_itemRecord_itemRecordList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.itemRecord.itemRecord.itemRecordList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryWidget._sortKey && ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_itemRecord_ItemRecord'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryWidget._sortKey && ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryWidget._sortKey && ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_itemRecord_itemRecord_itemRecordList_getLayout == "function"){
			var layout = MESBasic_itemRecord_itemRecord_itemRecordList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.itemRecord.itemRecord.itemRecordList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.itemRecord.itemRecord.itemRecordList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.itemRecord.itemRecord.itemRecordList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_itemRecord_ItemRecord'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.itemRecord.itemRecord.itemRecordList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.itemRecord.itemRecord.itemRecordList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="recordTime_start"]').val()!= null && $('#' + formId + ' input[name^="recordTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="recordTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.radion1415340663783')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="recordTime_end"]').val()!= null && $('#' + formId + ' input[name^="recordTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="recordTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.radion1415340663783')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="recordTime_start"]').val()!='' && $('#' + formId + ' input[name="recordTime_end"]').val()!=''){if($('#' + formId + ' input[name="recordTime_start"]').val() > $('#' + formId + ' input[name="recordTime_end"]').val()){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.radion1415340663783')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('MESBasic.propertydisplayName.radion1415340663783')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_itemRecord_itemRecordList,js,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_itemRecord_itemRecordList' idprefix='ec_MESBasic_itemRecord_itemRecord_itemRecordList' queryUrl='/MESBasic/itemRecord/itemRecord/itemRecordList-query.action' queryFunc="MESBasic.itemRecord.itemRecord.itemRecordList.query" ns="MESBasic.itemRecord.itemRecord.itemRecordList" />
<@exportexcel action="/MESBasic/itemRecord/itemRecord/itemRecordList-query.action"   getRequireDataAction="/MESBasic/itemRecord/itemRecord/itemRecordList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_itemRecord_ItemRecord&&viewCode=MESBasic_1_itemRecord_itemRecordList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_itemRecord_itemRecordList')}" prefix="ec_MESBasic_itemRecord_itemRecord_itemRecordList_query" modelCode="MESBasic_1_itemRecord_ItemRecord"  importFlag="false" viewCode="MESBasic_1_itemRecord_itemRecordList" />
