<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1471574153999')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.resetDaily.resetDaily','MESBasic.resetDaily.resetDaily.resetDailyList');
</script>
<@frameset id="ec_MESBasic_resetDaily_resetDaily_resetDailyList_container" border=0>
	<@frame id="ec_MESBasic_resetDaily_resetDaily_resetDailyList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "resetDailyList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_resetDaily_resetDailyList,html,MESBasic_1_resetDaily_ResetDaily,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.resetDaily.resetDaily.resetDailyList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.resetDaily.resetDaily.resetDailyList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.resetDaily.resetDaily.resetDailyList._prefix += '.';
			}
			MESBasic.resetDaily.resetDaily.resetDailyList._prefix += arr[i];
		}
		MESBasic.resetDaily.resetDaily.resetDailyList._suffix = arr[arr.length -1];
		if(MESBasic.resetDaily.resetDaily.resetDailyList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.resetDaily.resetDaily.resetDailyList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.resetDaily.resetDaily.resetDailyList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.resetDaily.resetDaily.resetDailyList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.resetDaily.resetDaily.resetDailyList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+MESBasic.resetDaily.resetDaily.resetDailyList._prefix + '.' + MESBasic.resetDaily.resetDaily.resetDailyList._suffix +'"]').val(obj[0][MESBasic.resetDaily.resetDaily.resetDailyList._suffix]);
		CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+MESBasic.resetDaily.resetDaily.resetDailyList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name^="'+MESBasic.resetDaily.resetDaily.resetDailyList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+MESBasic.resetDaily.resetDaily.resetDailyList._prefix + '.' + MESBasic.resetDaily.resetDaily.resetDailyList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.resetDaily.resetDaily.resetDailyList._dialog) {
			MESBasic.resetDaily.resetDaily.resetDailyList._dialog.close();
		}
	};
	
	MESBasic.resetDaily.resetDaily.resetDailyList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.resetDaily.resetDaily.resetDailyList.query_"+obj+")!='undefined'") ? eval('MESBasic.resetDaily.resetDaily.resetDailyList.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_resetDaily_resetDaily_resetDailyList_refresh = function(node){
	//var url = "/MESBasic/resetDaily/resetDaily/resetDailyList-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.resetDaily.resetDaily.resetDailyList.node = node;
	MESBasic.resetDaily.resetDaily.resetDailyList.query("query");
}

MESBasic_resetDaily_resetDaily_resetDailyList_getList = function() {
	return "MESBasic.resetDaily.resetDaily.resetDailyList";
}
MESBasic.resetDaily.resetDaily.resetDailyList.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.resetDaily.resetDaily.resetDailyList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.resetDaily.resetDaily.resetDailyList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_resetDaily_resetDaily_resetDailyList_fileupload_button",
		handler:function(){
			if($('#MESBasic_resetDaily_resetDaily_resetDailyList_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_resetDaily_resetDaily_resetDailyList_fileupload"></div>');
			}
			MESBasic.resetDaily.resetDaily.resetDailyList.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_resetDaily_resetDaily_resetDailyList_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_resetDaily_resetDaily_resetDailyList_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.resetDaily.resetDaily.resetDailyList.infoDialog.show();
			if($('#MESBasic_resetDaily_resetDaily_resetDailyList_fileupload').html() == '') {
				$('#MESBasic_resetDaily_resetDaily_resetDailyList_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_resetDaily_resetDaily&entityCode=MESBasic_1_resetDaily&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.resetDaily.resetDaily.resetDailyList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.resetDaily.resetDaily." + params.viewName + ".referenceCopy");
			funcName('resetDaily', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.resetDaily.resetDaily.resetDailyList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.resetDaily.resetDaily." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.resetDaily.resetDaily.resetDailyList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.resetDaily.resetDaily." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.resetDaily.resetDaily.resetDailyList.dbClickViewresetDailyList = function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
			CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_resetDaily&id=" + oRow.id);
		}
	}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.resetDaily.resetDaily.resetDailyList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.resetDaily.resetDaily.resetDailyList.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.resetDaily.resetDaily.resetDailyList.otherParams || {};
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
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){list_operate.CUI('#'+formId).submit();}
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
		if ( MESBasic.resetDaily.resetDaily.resetDailyList.Dlg ) {
			MESBasic.resetDaily.resetDaily.resetDailyList.Dlg._config.url = url;
			MESBasic.resetDaily.resetDaily.resetDailyList.Dlg._config.formId = formId;
			MESBasic.resetDaily.resetDaily.resetDailyList.Dlg.setTitle( title )
			MESBasic.resetDaily.resetDaily.resetDailyList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.resetDaily.resetDaily.resetDailyList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.resetDaily.resetDaily.resetDailyList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.resetDaily.resetDaily.resetDailyList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_resetDaily_resetDaily', element : $('#MESBasic_resetDaily_resetDaily_resetDailyList_fileupload_button a:eq(1)')});
		}
		MESBasic.resetDaily.resetDaily.resetDailyList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.resetDaily.resetDaily.resetDailyList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.resetDaily.resetDaily.resetDailyList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.resetDaily.resetDaily.resetDailyList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.resetDaily.resetDaily.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.resetDaily.resetDaily.resetDailyList.AppDlg.show();
	};
	MESBasic.resetDaily.resetDaily.resetDailyList.commonQuery = function(type) {
	  if(typeof MESBasic.resetDaily.resetDaily.resetDailyList.cancelSelectedNode == 'function') {
	   MESBasic.resetDaily.resetDaily.resetDailyList.cancelSelectedNode();
	   MESBasic.resetDaily.resetDaily.resetDailyList.node = null;
	  }
	  if(typeof MESBasic_resetDaily_resetDaily_resetDailyList_cancelSelectedNode == 'function') {
	   MESBasic_resetDaily_resetDaily_resetDailyList_cancelSelectedNode();
	   MESBasic.resetDaily.resetDaily.resetDailyList.node = null;
	  }
	  MESBasic.resetDaily.resetDaily.resetDailyList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.resetDaily.resetDaily.resetDailyList.query
	 */
	MESBasic.resetDaily.resetDaily.resetDailyList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.resetDaily.resetDaily.resetDailyList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.resetDaily.resetDaily.resetDailyList.node = null;
		if(!checkListValid("ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query._sortKey && datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query._sortMethod){
			CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query._sortKey);
			CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query._sortColumnName);
			CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query._sortKey = '';
			CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/resetDaily/resetDaily/resetDailyList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/resetDaily/resetDaily/resetDailyList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
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
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
							}
						}
						var multable = CUI(this).attr('multable');
						if(multable && multable == "yes") {
							dataPost += "&" + fastCol + "=," + encodeURIComponent($.trim(fastColValue)) + ",";
						} else {
							dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
						}
					}
				}	
			}
		});
		var pageSize=CUI('input[name="ec_MESBasic_resetDaily_resetDaily_resetDailyList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_resetDaily_resetDailyList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.resetDaily.resetDaily.resetDailyList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_resetDaily";
		openExportFrame(url);
	}
MESBasic.resetDaily.resetDaily.resetDailyList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.resetDaily.resetDaily.resetDailyList.otherParams = {};
	MESBasic.resetDaily.resetDaily.resetDailyList.otherParams.dialogType = dialogType;
	MESBasic.resetDaily.resetDaily.resetDailyList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.resetDaily.resetDaily.resetDailyList.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.resetDaily.resetDaily.editCallBackInfo
 */
MESBasic.resetDaily.resetDaily.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_resetDaily_resetDaily_resetDailyList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_resetDaily_resetDaily_resetDailyList_getLayout == "function"){
    		var layout = MESBasic_resetDaily_resetDaily_resetDailyList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.resetDaily.resetDaily.resetDailyList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryWidget._sortKey && ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_resetDaily_ResetDaily'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryWidget._sortKey && ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryWidget._sortKey && ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_resetDaily_resetDaily_resetDailyList_getLayout == "function"){
			var layout = MESBasic_resetDaily_resetDaily_resetDailyList_getLayout();
			var node = layout.getNode();
	    	MESBasic.resetDaily.resetDaily.resetDailyList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.resetDaily.resetDaily.resetDailyList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.resetDaily.resetDaily.resetDailyList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_resetDaily_ResetDaily'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.resetDaily.resetDaily.resetDailyList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.resetDaily.resetDaily.resetDailyList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_resetDaily_resetDailyList,js,MESBasic_1_resetDaily_ResetDaily,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_resetDaily_resetDailyList' idprefix='ec_MESBasic_resetDaily_resetDaily_resetDailyList' queryUrl='/MESBasic/resetDaily/resetDaily/resetDailyList-query.action' queryFunc="MESBasic.resetDaily.resetDaily.resetDailyList.query" ns="MESBasic.resetDaily.resetDaily.resetDailyList" />
<@exportexcel action="/MESBasic/resetDaily/resetDaily/resetDailyList-query.action"   getRequireDataAction="/MESBasic/resetDaily/resetDaily/resetDailyList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_resetDaily_ResetDaily&&viewCode=MESBasic_1_resetDaily_resetDailyList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_resetDaily_resetDailyList')}" prefix="ec_MESBasic_resetDaily_resetDaily_resetDailyList_query" modelCode="MESBasic_1_resetDaily_ResetDaily"  importFlag="false" viewCode="MESBasic_1_resetDaily_resetDailyList" />
