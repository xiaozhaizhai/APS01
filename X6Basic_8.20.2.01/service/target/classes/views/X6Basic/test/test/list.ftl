<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.randon1460695626823')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('X6Basic.test.test','X6Basic.test.test.list');
</script>
<@frameset id="ec_X6Basic_test_test_list_container" border=0>
	<@frame id="ec_X6Basic_test_test_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_test_list,html,X6Basic_1.0_test_Test,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.test.test.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.test.test.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.test.test.list._prefix += '.';
			}
			X6Basic.test.test.list._prefix += arr[i];
		}
		X6Basic.test.test.list._suffix = arr[arr.length -1];
		if(X6Basic.test.test.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.test.test.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.test.test.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.test.test.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.test.test.list.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+X6Basic.test.test.list._prefix + '.' + X6Basic.test.test.list._suffix +'"]').val(obj[0][X6Basic.test.test.list._suffix]);
		CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+X6Basic.test.test.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_test_test_list_queryForm *[name^="'+X6Basic.test.test.list._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+X6Basic.test.test.list._prefix + '.' + X6Basic.test.test.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.test.test.list._dialog) {
			X6Basic.test.test.list._dialog.close();
		}
	};
	
	X6Basic.test.test.list._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.test.test.list.query_"+obj+")!='undefined'") ? eval('X6Basic.test.test.list.query_'+obj+'()') : null;
		return str;
	
	};
	
X6Basic_test_test_list_refresh = function(node){
	//var url = "/X6Basic/test/test/list-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_test_test_list_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_test_test_list_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.test.test.list.node = node;
	X6Basic.test.test.list.query("query");
}

X6Basic_test_test_list_getList = function() {
	return "X6Basic.test.test.list";
}
X6Basic.test.test.list.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

X6Basic.test.test.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.test.test.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_test_test_list_fileupload_button",
		handler:function(){
			if($('#X6Basic_test_test_list_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_test_test_list_fileupload"></div>');
			}
			X6Basic.test.test.list.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_test_test_list_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_test_test_list_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.test.test.list.infoDialog.show();
			if($('#X6Basic_test_test_list_fileupload').html() == '') {
				$('#X6Basic_test_test_list_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_test_test&entityCode=X6Basic_1.0_test&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.test.test.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.X6Basic.test.test." + params.viewName + ".referenceCopy");
			funcName('test', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.test.test.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.X6Basic.test.test." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.test.test.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.X6Basic.test.test." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			X6Basic.test.test.list.importCallbackFunc = function(){
				CUI.Dialog.toggleAllButton();
				var queryFunc = datatable_ec_X6Basic_test_test_list_query.get('queryFunc');
				eval( queryFunc );
				try{
					var layout = X6Basic_test_test_list_getLayout();
					layout._refreshRootNode();
				} catch(e) {}
			};
			
			
			var list_importlist_importDialog = null;
			X6Basic.test.test.list.importlist = function(){
				try{
					if(list_importlist_importDialog!=null&&list_importlist_importDialog.isShow==1){
						return false;
					}
					var queryFunc = 'X6Basic.test.test.list.importCallbackFunc()';
					var url = "/X6Basic/test/test/initMainImport.action?viewCode=X6Basic_1.0_test_list&callBackFuncName=" + queryFunc;
					list_importlist_importDialog = new CUI.Dialog({
						title: "${getHtmlText('common.button.import')}",
						url:url,
						modal:true,
						description:'',
						height:'330',
						width: '420',
						dragable:true,
						buttons:[{id:"replaceAndImport",display:'hidden',name:"${getHtmlText('common.button.import.replace')}",handler:function(){foundation.importExcel.submitImportForm(true,false);}},{id:"ignoreAndImport",display:'hidden',name:"${getHtmlText('common.button.import.ignore')}",handler:function(){foundation.importExcel.submitImportForm(false,true);}},{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){foundation.importExcel.submitImportForm(false,false);}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();list_importlist_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();list_importlist_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
						beforeCloseEvent:function(){$('#importResponse').remove();}
					});
					list_importlist_importDialog.show();
				}catch(e){}
			}
			
			X6Basic.test.test.list.downloadTemplatelist = function(){
				var url = "/X6Basic/test/test/templateDownLoad.action?viewCode=X6Basic_1.0_test_list&downloadType=mainTemplate&fileName=X6Basic_1.0_test_list-importTemplate.xls";
				window.open(url,"","");
			}
	
	/**
	 * 保存完毕回调
	 * @method X6Basic.test.test.callBackInfo
	 */
	X6Basic.test.test.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('X6Basic_test_test_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{X6Basic.test.test.list.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method X6Basic.test.test.list.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	X6Basic.test.test.list.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_X6Basic_test_test_list_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_X6Basic_test_test_list_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_X6Basic_test_test_list_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method X6Basic.test.test.list.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.test.test.list.checkSelectedAny = function() {
		if(datatable_ec_X6Basic_test_test_list_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method X6Basic.test.test.list.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.test.test.list.checkSelectedMore = function() {
		if(datatable_ec_X6Basic_test_test_list_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	X6Basic.test.test.list.dbClickViewlist = function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
			CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
		} else {
			openFullScreen(viewUrl + "?entityCode=X6Basic_1.0_test&id=" + oRow.id);
		}
	}
	
	/**
	 * 显示增加对话框
	 * @method X6Basic.test.test.list.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.test.test.list.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = X6Basic.test.test.list.otherParams || {};
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
		if ( X6Basic.test.test.list.Dlg ) {
			X6Basic.test.test.list.Dlg._config.url = url;
			X6Basic.test.test.list.Dlg._config.formId = formId;
			X6Basic.test.test.list.Dlg.setTitle( title )
			X6Basic.test.test.list.Dlg.setButtonbar( buttons );
		}else{
			X6Basic.test.test.list.Dlg =	new CUI.Dialog({
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
		X6Basic.test.test.list.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		X6Basic.test.test.list.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_test_test', element : $('#X6Basic_test_test_list_fileupload_button a:eq(1)')});
		}
		X6Basic.test.test.list.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.test.test.list.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.test.test.list.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.test.test.list.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{X6Basic.test.test.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.test.test.list.AppDlg.show();
	};
	X6Basic.test.test.list.commonQuery = function(type) {
	  if(typeof X6Basic.test.test.list.cancelSelectedNode == 'function') {
	   X6Basic.test.test.list.cancelSelectedNode();
	   X6Basic.test.test.list.node = null;
	  }
	  if(typeof X6Basic_test_test_list_cancelSelectedNode == 'function') {
	   X6Basic_test_test_list_cancelSelectedNode();
	   X6Basic.test.test.list.node = null;
	  }
	  X6Basic.test.test.list.query(type);
	 };
	
	/**
	 * 查询
	 * @method X6Basic.test.test.list.query
	 */
	X6Basic.test.test.list.query = function(type,pageNo,sortFlag){
		var node = X6Basic.test.test.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//X6Basic.test.test.list.node = null;
		if(!checkListValid("ec_X6Basic_test_test_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_X6Basic_test_test_list_query._sortKey && datatable_ec_X6Basic_test_test_list_query._sortMethod){
			CUI('#ec_X6Basic_test_test_list_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_test_test_list_query._sortKey);
			CUI('#ec_X6Basic_test_test_list_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_test_test_list_query._sortColumnName);
			CUI('#ec_X6Basic_test_test_list_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_test_test_list_query._sortMethod);
		}else{
			datatable_ec_X6Basic_test_test_list_query._sortKey = '';
			CUI('#ec_X6Basic_test_test_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_test_test_list_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_test_test_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/X6Basic/test/test/list-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/X6Basic/test/test/list-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_X6Basic_test_test_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_test_test_list_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_test_test_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_test_test_list_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_X6Basic_test_test_list_query_PageLink_PageCount"]').val();
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
			permissionCode = 'X6Basic_1.0_test_list';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_X6Basic_test_test_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_X6Basic_test_test_list_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	X6Basic.test.test.list.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_test";
		openExportFrame(url);
	}
X6Basic.test.test.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.test.test.list.otherParams = {};
	X6Basic.test.test.list.otherParams.dialogType = dialogType;
	X6Basic.test.test.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.test.test.list.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.test.test.editCallBackInfo
 */
X6Basic.test.test.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_X6Basic_test_test_list_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_test_test_list_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_test_test_list_getLayout == "function"){
    		var layout = X6Basic_test_test_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.test.test.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_test_test_list_queryWidget._sortKey && ec_X6Basic_test_test_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'X6Basic_1.0_test_Test'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_test_test_list_queryWidget._sortKey && ec_X6Basic_test_test_list_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_X6Basic_test_test_list_queryWidget._sortKey && ec_X6Basic_test_test_list_queryWidget._sortMethod ? true : false;
		if(typeof X6Basic_test_test_list_getLayout == "function"){
			var layout = X6Basic_test_test_list_getLayout();
			var node = layout.getNode();
	    	X6Basic.test.test.list.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.test.test.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.test.test.list.query('query');
	    	}
			if(modelCode == 'X6Basic_1.0_test_Test'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.test.test.list.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.test.test.list.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-X6Basic_1.0_test_list,js,X6Basic_1.0_test_Test,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='X6Basic_1.0_test_list' idprefix='ec_X6Basic_test_test_list' queryUrl='/X6Basic/test/test/list-query.action' queryFunc="X6Basic.test.test.list.query" ns="X6Basic.test.test.list" />
<@exportexcel action="/X6Basic/test/test/list-query.action"   getRequireDataAction="/X6Basic/test/test/list-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=X6Basic_1.0_test_Test&&viewCode=X6Basic_1.0_test_list" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_test_list')}" prefix="ec_X6Basic_test_test_list_query" modelCode="X6Basic_1.0_test_Test"  importFlag="false" viewCode="X6Basic_1.0_test_list" />
