<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1436840822965')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.baseVendor.baseVendor','MESBasic.baseVendor.baseVendor.list');
</script>
<@frameset id="ec_MESBasic_baseVendor_baseVendor_list_container" border=0>
	<@frame id="ec_MESBasic_baseVendor_baseVendor_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_baseVendor_list,html,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.baseVendor.baseVendor.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.baseVendor.baseVendor.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.baseVendor.baseVendor.list._prefix += '.';
			}
			MESBasic.baseVendor.baseVendor.list._prefix += arr[i];
		}
		MESBasic.baseVendor.baseVendor.list._suffix = arr[arr.length -1];
		if(MESBasic.baseVendor.baseVendor.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseVendor.baseVendor.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.baseVendor.baseVendor.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.baseVendor.baseVendor.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.baseVendor.baseVendor.list.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+MESBasic.baseVendor.baseVendor.list._prefix + '.' + MESBasic.baseVendor.baseVendor.list._suffix +'"]').val(obj[0][MESBasic.baseVendor.baseVendor.list._suffix]);
		CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+MESBasic.baseVendor.baseVendor.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name^="'+MESBasic.baseVendor.baseVendor.list._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+MESBasic.baseVendor.baseVendor.list._prefix + '.' + MESBasic.baseVendor.baseVendor.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.baseVendor.baseVendor.list._dialog) {
			MESBasic.baseVendor.baseVendor.list._dialog.close();
		}
	};
	
	MESBasic.baseVendor.baseVendor.list._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseVendor.baseVendor.list.query_"+obj+")!='undefined'") ? eval('MESBasic.baseVendor.baseVendor.list.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_baseVendor_baseVendor_list_refresh = function(node){
	//var url = "/MESBasic/baseVendor/baseVendor/list-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_baseVendor_baseVendor_list_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_baseVendor_baseVendor_list_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.baseVendor.baseVendor.list.node = node;
	MESBasic.baseVendor.baseVendor.list.query("query");
}

MESBasic_baseVendor_baseVendor_list_getList = function() {
	return "MESBasic.baseVendor.baseVendor.list";
}
MESBasic.baseVendor.baseVendor.list.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.baseVendor.baseVendor.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_baseVendor_baseVendor_list_fileupload_button",
		handler:function(){
			if($('#MESBasic_baseVendor_baseVendor_list_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_baseVendor_baseVendor_list_fileupload"></div>');
			}
			MESBasic.baseVendor.baseVendor.list.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_baseVendor_baseVendor_list_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_baseVendor_baseVendor_list_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.baseVendor.baseVendor.list.infoDialog.show();
			if($('#MESBasic_baseVendor_baseVendor_list_fileupload').html() == '') {
				$('#MESBasic_baseVendor_baseVendor_list_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_baseVendor_baseVendor&entityCode=MESBasic_1_baseVendor&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseVendor.baseVendor." + params.viewName + ".referenceCopy");
			funcName('baseVendor', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseVendor.baseVendor." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseVendor.baseVendor." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.baseVendor.baseVendor.list.dbClickViewlist = function(event, oRow) {
		var viewUrl = '/MESBasic/baseVendor/baseVendor/vendorView.action';
		if(viewUrl == ''){
			CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_baseVendor&id=" + oRow.id);
		}
	}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.baseVendor.baseVendor.list.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.baseVendor.baseVendor.list.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.baseVendor.baseVendor.list.otherParams || {};
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
		if ( MESBasic.baseVendor.baseVendor.list.Dlg ) {
			MESBasic.baseVendor.baseVendor.list.Dlg._config.url = url;
			MESBasic.baseVendor.baseVendor.list.Dlg._config.formId = formId;
			MESBasic.baseVendor.baseVendor.list.Dlg.setTitle( title )
			MESBasic.baseVendor.baseVendor.list.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.baseVendor.baseVendor.list.Dlg =	new CUI.Dialog({
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
		MESBasic.baseVendor.baseVendor.list.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.baseVendor.baseVendor.list.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_baseVendor_baseVendor', element : $('#MESBasic_baseVendor_baseVendor_list_fileupload_button a:eq(1)')});
		}
		MESBasic.baseVendor.baseVendor.list.otherParams = {};
	};
	MESBasic.baseVendor.baseVendor.list.commonQuery = function(type) {
	  if(typeof MESBasic.baseVendor.baseVendor.list.cancelSelectedNode == 'function') {
	   MESBasic.baseVendor.baseVendor.list.cancelSelectedNode();
	   MESBasic.baseVendor.baseVendor.list.node = null;
	  }
	  if(typeof MESBasic_baseVendor_baseVendor_list_cancelSelectedNode == 'function') {
	   MESBasic_baseVendor_baseVendor_list_cancelSelectedNode();
	   MESBasic.baseVendor.baseVendor.list.node = null;
	  }
	  MESBasic.baseVendor.baseVendor.list.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.baseVendor.baseVendor.list.query
	 */
	MESBasic.baseVendor.baseVendor.list.query = function(type,pageNo,sortFlag){
		var node = MESBasic.baseVendor.baseVendor.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.baseVendor.baseVendor.list.node = null;
		if(!checkListValid("ec_MESBasic_baseVendor_baseVendor_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_baseVendor_baseVendor_list_query._sortKey && datatable_ec_MESBasic_baseVendor_baseVendor_list_query._sortMethod){
			CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_baseVendor_baseVendor_list_query._sortKey);
			CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_baseVendor_baseVendor_list_query._sortColumnName);
			CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_baseVendor_baseVendor_list_query._sortMethod);
		}else{
			datatable_ec_MESBasic_baseVendor_baseVendor_list_query._sortKey = '';
			CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/baseVendor/baseVendor/list-pending.action";
	    } else {
	    	url = "/MESBasic/baseVendor/baseVendor/list-query.action";
	    }  
		CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_baseVendor_baseVendor_list_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_baseVendor_baseVendor_list_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_baseVendor_baseVendor_list_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_baseVendor_list';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_baseVendor_baseVendor_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_baseVendor_baseVendor_list_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.baseVendor.baseVendor.list.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_baseVendor";
		openExportFrame(url);
	}
MESBasic.baseVendor.baseVendor.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.baseVendor.baseVendor.list.otherParams = {};
	MESBasic.baseVendor.baseVendor.list.otherParams.dialogType = dialogType;
	MESBasic.baseVendor.baseVendor.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.baseVendor.baseVendor.list.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.baseVendor.baseVendor.editCallBackInfo
 */
MESBasic.baseVendor.baseVendor.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_baseVendor_baseVendor_list_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseVendor_baseVendor_list_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_baseVendor_baseVendor_list_getLayout == "function"){
    		var layout = MESBasic_baseVendor_baseVendor_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.baseVendor.baseVendor.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_list_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_list_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_baseVendor_baseVendor_list_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_list_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_baseVendor_baseVendor_list_getLayout == "function"){
			var layout = MESBasic_baseVendor_baseVendor_list_getLayout();
			var node = layout.getNode();
	    	MESBasic.baseVendor.baseVendor.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseVendor.baseVendor.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseVendor.baseVendor.list.query('query');
	    	}
			if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseVendor.baseVendor.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseVendor.baseVendor.list.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}
var bapS2EditCallBackInfo = MESBasic.baseVendor.baseVendor.editCallBackInfo;


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_baseVendor_list,js,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_baseVendor_list' idprefix='ec_MESBasic_baseVendor_baseVendor_list' queryUrl='/MESBasic/baseVendor/baseVendor/list-query.action' queryFunc="MESBasic.baseVendor.baseVendor.list.query" ns="MESBasic.baseVendor.baseVendor.list" />
<@exportexcel action="/MESBasic/baseVendor/baseVendor/list-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_baseVendor_list')}" prefix="ec_MESBasic_baseVendor_baseVendor_list_query"/>
