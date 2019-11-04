<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('X6Basic.viewtitle.radion1400116180318')}</title>
<body id="dialog_page">
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('X6Basic.cardStaff.cardStaffWork','X6Basic.cardStaff.cardStaffWork.list');
</script>
<@frameset id="ec_X6Basic_cardStaff_cardStaffWork_list_container" border=0>
	<@frame id="ec_X6Basic_cardStaff_cardStaffWork_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_cardStaff_list,html,X6Basic_1.0_cardStaff_CardStaffWork,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.cardStaff.cardStaffWork.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.cardStaff.cardStaffWork.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.cardStaff.cardStaffWork.list._prefix += '.';
			}
			X6Basic.cardStaff.cardStaffWork.list._prefix += arr[i];
		}
		X6Basic.cardStaff.cardStaffWork.list._suffix = arr[arr.length -1];
		if(X6Basic.cardStaff.cardStaffWork.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.cardStaff.cardStaffWork.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.cardStaff.cardStaffWork.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.cardStaff.cardStaffWork.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.cardStaff.cardStaffWork.list.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+X6Basic.cardStaff.cardStaffWork.list._prefix + '.' + X6Basic.cardStaff.cardStaffWork.list._suffix +'"]').val(obj[0][X6Basic.cardStaff.cardStaffWork.list._suffix]);
		CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+X6Basic.cardStaff.cardStaffWork.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name^="'+X6Basic.cardStaff.cardStaffWork.list._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+X6Basic.cardStaff.cardStaffWork.list._prefix + '.' + X6Basic.cardStaff.cardStaffWork.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.cardStaff.cardStaffWork.list._dialog) {
			X6Basic.cardStaff.cardStaffWork.list._dialog.close();
		}
	};
	
	X6Basic.cardStaff.cardStaffWork.list._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.cardStaff.cardStaffWork.list.query_"+obj+")!='undefined'") ? eval('X6Basic.cardStaff.cardStaffWork.list.query_'+obj+'()') : null;
		return str;
	
	};
	
X6Basic_cardStaff_cardStaffWork_list_refresh = function(node){
	//var url = "/X6Basic/cardStaff/cardStaffWork/list-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.cardStaff.cardStaffWork.list.node = node;
	X6Basic.cardStaff.cardStaffWork.list.query("query");
}

X6Basic_cardStaff_cardStaffWork_list_getList = function() {
	return "X6Basic.cardStaff.cardStaffWork.list";
}
X6Basic.cardStaff.cardStaffWork.list.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

X6Basic.cardStaff.cardStaffWork.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.cardStaff.cardStaffWork.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_cardStaff_cardStaffWork_list_fileupload_button",
		handler:function(){
			if($('#X6Basic_cardStaff_cardStaffWork_list_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_cardStaff_cardStaffWork_list_fileupload"></div>');
			}
			X6Basic.cardStaff.cardStaffWork.list.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_cardStaff_cardStaffWork_list_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_cardStaff_cardStaffWork_list_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.cardStaff.cardStaffWork.list.infoDialog.show();
			if($('#X6Basic_cardStaff_cardStaffWork_list_fileupload').html() == '') {
				$('#X6Basic_cardStaff_cardStaffWork_list_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_cardStaff_cardStaffWork&entityCode=X6Basic_1.0_cardStaff&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.cardStaff.cardStaffWork.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.cardStaff.cardStaffWork." + params.viewName + ".referenceCopy");
			funcName('cardStaffWork', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.cardStaff.cardStaffWork.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.cardStaff.cardStaffWork." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.cardStaff.cardStaffWork.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.cardStaff.cardStaffWork." + editViewName + ".printSetting");
			funcName();
		}
	}
}
	
	/**
	 * 显示增加对话框
	 * @method X6Basic.cardStaff.cardStaffWork.list.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.cardStaff.cardStaffWork.list.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = X6Basic.cardStaff.cardStaffWork.list.otherParams || {};
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
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){CUI('#'+formId).submit();}
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
		X6Basic.cardStaff.cardStaffWork.list.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 460,
			height: height || 330,
			type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		X6Basic.cardStaff.cardStaffWork.list.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_cardStaff_cardStaffWork', element : $('#X6Basic_cardStaff_cardStaffWork_list_fileupload_button a:eq(1)')});
		}
		X6Basic.cardStaff.cardStaffWork.list.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.cardStaff.cardStaffWork.list.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.cardStaff.cardStaffWork.list.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.cardStaff.cardStaffWork.list.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{X6Basic.cardStaff.cardStaffWork.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.cardStaff.cardStaffWork.list.AppDlg.show();
	};
	X6Basic.cardStaff.cardStaffWork.list.commonQuery = function(type) {
	  if(typeof X6Basic.cardStaff.cardStaffWork.list.cancelSelectedNode == 'function') {
	   X6Basic.cardStaff.cardStaffWork.list.cancelSelectedNode();
	   X6Basic.cardStaff.cardStaffWork.list.node = null;
	  }
	  if(typeof X6Basic_cardStaff_cardStaffWork_list_cancelSelectedNode == 'function') {
	   X6Basic_cardStaff_cardStaffWork_list_cancelSelectedNode();
	   X6Basic.cardStaff.cardStaffWork.list.node = null;
	  }
	  X6Basic.cardStaff.cardStaffWork.list.query(type);
	 };
	
	/**
	 * 查询
	 * @method X6Basic.cardStaff.cardStaffWork.list.query
	 */
	X6Basic.cardStaff.cardStaffWork.list.query = function(type,pageNo,sortFlag){
		var node = X6Basic.cardStaff.cardStaffWork.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//X6Basic.cardStaff.cardStaffWork.list.node = null;
		if(!checkListValid("ec_X6Basic_cardStaff_cardStaffWork_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query._sortKey && datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query._sortMethod){
			CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query._sortKey);
			CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query._sortColumnName);
			CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query._sortMethod);
		}else{
			datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query._sortKey = '';
			CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/X6Basic/cardStaff/cardStaffWork/list-pending.action";
	    } else {
	    	url = "/X6Basic/cardStaff/cardStaffWork/list-query.action";
	    }  
		CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_cardStaff_cardStaffWork_list_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 00:00:00";
							}
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 23:59:59";
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
		var pageSize=CUI('input[name="ec_X6Basic_cardStaff_cardStaffWork_list_query_PageLink_PageCount"]').val();
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
			permissionCode = 'X6Basic_1.0_cardStaff_list';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		
		try{
		  	datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	X6Basic.cardStaff.cardStaffWork.list.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_cardStaff";
		openExportFrame(url);
	}
X6Basic.cardStaff.cardStaffWork.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.cardStaff.cardStaffWork.list.otherParams = {};
	X6Basic.cardStaff.cardStaffWork.list.otherParams.dialogType = dialogType;
	X6Basic.cardStaff.cardStaffWork.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.cardStaff.cardStaffWork.list.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.cardStaff.cardStaffWork.editCallBackInfo
 */
X6Basic.cardStaff.cardStaffWork.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_X6Basic_cardStaff_cardStaffWork_list_query.get('queryFunc');
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_cardStaff_cardStaffWork_list_getLayout == "function"){
    		var layout = X6Basic_cardStaff_cardStaffWork_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.cardStaff.cardStaffWork.list.node = node	
			eval(queryFunc);
			if(modelCode == 'X6Basic_1.0_cardStaff_CardStaffWork'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		eval(queryFunc);
    	}			
	} else {
		if(typeof X6Basic_cardStaff_cardStaffWork_list_getLayout == "function"){
			var layout = X6Basic_cardStaff_cardStaffWork_list_getLayout();
			var node = layout.getNode();
	    	X6Basic.cardStaff.cardStaffWork.list.node = node	
			X6Basic.cardStaff.cardStaffWork.list.query('query');
			if(modelCode == 'X6Basic_1.0_cardStaff_CardStaffWork'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			X6Basic.cardStaff.cardStaffWork.list.query('query');
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-X6Basic_1.0_cardStaff_list,js,X6Basic_1.0_cardStaff_CardStaffWork,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='X6Basic_1.0_cardStaff_list' idprefix='ec_X6Basic_cardStaff_cardStaffWork_list' queryUrl='/X6Basic/cardStaff/cardStaffWork/list-query.action' queryFunc="X6Basic.cardStaff.cardStaffWork.list.query" ns="X6Basic.cardStaff.cardStaffWork.list" />
<@exportexcel action="/X6Basic/cardStaff/cardStaffWork/list-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_cardStaff_list')}" prefix="ec_X6Basic_cardStaff_cardStaffWork_list_query"/>
