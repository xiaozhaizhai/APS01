<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1470300515331')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.prodatriel.prodattrel','MESBasic.prodatriel.prodattrel.prodAttrList');
</script>
<@frameset id="ec_MESBasic_prodatriel_prodattrel_prodAttrList_container" border=0>
	<@frame id="ec_MESBasic_prodatriel_prodattrel_prodAttrList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "prodAttrList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_prodatriel_prodAttrList,html,MESBasic_1_prodatriel_Prodattrel,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.prodatriel.prodattrel.prodAttrList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.prodatriel.prodattrel.prodAttrList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.prodatriel.prodattrel.prodAttrList._prefix += '.';
			}
			MESBasic.prodatriel.prodattrel.prodAttrList._prefix += arr[i];
		}
		MESBasic.prodatriel.prodattrel.prodAttrList._suffix = arr[arr.length -1];
		if(MESBasic.prodatriel.prodattrel.prodAttrList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.prodatriel.prodattrel.prodAttrList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.prodatriel.prodattrel.prodAttrList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.prodatriel.prodattrel.prodAttrList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.prodatriel.prodattrel.prodAttrList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+MESBasic.prodatriel.prodattrel.prodAttrList._prefix + '.' + MESBasic.prodatriel.prodattrel.prodAttrList._suffix +'"]').val(obj[0][MESBasic.prodatriel.prodattrel.prodAttrList._suffix]);
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+MESBasic.prodatriel.prodattrel.prodAttrList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name^="'+MESBasic.prodatriel.prodattrel.prodAttrList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+MESBasic.prodatriel.prodattrel.prodAttrList._prefix + '.' + MESBasic.prodatriel.prodattrel.prodAttrList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.prodatriel.prodattrel.prodAttrList._dialog) {
			MESBasic.prodatriel.prodattrel.prodAttrList._dialog.close();
		}
	};
	
	MESBasic.prodatriel.prodattrel.prodAttrList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.prodatriel.prodattrel.prodAttrList.query_"+obj+")!='undefined'") ? eval('MESBasic.prodatriel.prodattrel.prodAttrList.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_prodatriel_prodattrel_prodAttrList_refresh = function(node){
	//var url = "/MESBasic/prodatriel/prodattrel/prodAttrList-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.prodatriel.prodattrel.prodAttrList.node = node;
	MESBasic.prodatriel.prodattrel.prodAttrList.query("query");
}

MESBasic_prodatriel_prodattrel_prodAttrList_getList = function() {
	return "MESBasic.prodatriel.prodattrel.prodAttrList";
}
MESBasic.prodatriel.prodattrel.prodAttrList.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.prodatriel.prodattrel.prodAttrList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.prodatriel.prodattrel.prodAttrList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_prodatriel_prodattrel_prodAttrList_fileupload_button",
		handler:function(){
			if($('#MESBasic_prodatriel_prodattrel_prodAttrList_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_prodatriel_prodattrel_prodAttrList_fileupload"></div>');
			}
			MESBasic.prodatriel.prodattrel.prodAttrList.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_prodatriel_prodattrel_prodAttrList_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_prodatriel_prodattrel_prodAttrList_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.prodatriel.prodattrel.prodAttrList.infoDialog.show();
			if($('#MESBasic_prodatriel_prodattrel_prodAttrList_fileupload').html() == '') {
				$('#MESBasic_prodatriel_prodattrel_prodAttrList_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_prodatriel_prodattrel&entityCode=MESBasic_1_prodatriel&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.prodatriel.prodattrel.prodAttrList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.prodatriel.prodattrel." + params.viewName + ".referenceCopy");
			funcName('prodattrel', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.prodatriel.prodattrel.prodAttrList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.prodatriel.prodattrel." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.prodatriel.prodattrel.prodAttrList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.prodatriel.prodattrel." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.prodatriel.prodattrel.prodAttrList.dbClickViewprodAttrList = function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
			CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_prodatriel&id=" + oRow.id);
		}
	}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.prodatriel.prodattrel.prodAttrList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.prodatriel.prodattrel.prodAttrList.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.prodatriel.prodattrel.prodAttrList.otherParams || {};
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
		if ( MESBasic.prodatriel.prodattrel.prodAttrList.Dlg ) {
			MESBasic.prodatriel.prodattrel.prodAttrList.Dlg._config.url = url;
			MESBasic.prodatriel.prodattrel.prodAttrList.Dlg._config.formId = formId;
			MESBasic.prodatriel.prodattrel.prodAttrList.Dlg.setTitle( title )
			MESBasic.prodatriel.prodattrel.prodAttrList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.prodatriel.prodattrel.prodAttrList.Dlg =	new CUI.Dialog({
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
		MESBasic.prodatriel.prodattrel.prodAttrList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.prodatriel.prodattrel.prodAttrList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_prodatriel_prodattrel', element : $('#MESBasic_prodatriel_prodattrel_prodAttrList_fileupload_button a:eq(1)')});
		}
		MESBasic.prodatriel.prodattrel.prodAttrList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.prodatriel.prodattrel.prodAttrList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.prodatriel.prodattrel.prodAttrList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.prodatriel.prodattrel.prodAttrList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.prodatriel.prodattrel.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.prodatriel.prodattrel.prodAttrList.AppDlg.show();
	};
	MESBasic.prodatriel.prodattrel.prodAttrList.commonQuery = function(type) {
	  if(typeof MESBasic.prodatriel.prodattrel.prodAttrList.cancelSelectedNode == 'function') {
	   MESBasic.prodatriel.prodattrel.prodAttrList.cancelSelectedNode();
	   MESBasic.prodatriel.prodattrel.prodAttrList.node = null;
	  }
	  if(typeof MESBasic_prodatriel_prodattrel_prodAttrList_cancelSelectedNode == 'function') {
	   MESBasic_prodatriel_prodattrel_prodAttrList_cancelSelectedNode();
	   MESBasic.prodatriel.prodattrel.prodAttrList.node = null;
	  }
	  MESBasic.prodatriel.prodattrel.prodAttrList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.prodatriel.prodattrel.prodAttrList.query
	 */
	MESBasic.prodatriel.prodattrel.prodAttrList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.prodatriel.prodattrel.prodAttrList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.prodatriel.prodattrel.prodAttrList.node = null;
		if(!checkListValid("ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query._sortKey && datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query._sortMethod){
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query._sortKey);
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query._sortColumnName);
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query._sortKey = '';
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/prodatriel/prodattrel/prodAttrList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/prodatriel/prodattrel/prodAttrList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_prodatriel_prodattrel_prodAttrList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_prodatriel_prodAttrList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.prodatriel.prodattrel.prodAttrList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_prodatriel";
		openExportFrame(url);
	}
MESBasic.prodatriel.prodattrel.prodAttrList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.prodatriel.prodattrel.prodAttrList.otherParams = {};
	MESBasic.prodatriel.prodattrel.prodAttrList.otherParams.dialogType = dialogType;
	MESBasic.prodatriel.prodattrel.prodAttrList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.prodatriel.prodattrel.prodAttrList.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.prodatriel.prodattrel.editCallBackInfo
 */
MESBasic.prodatriel.prodattrel.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_prodatriel_prodattrel_prodAttrList_getLayout == "function"){
    		var layout = MESBasic_prodatriel_prodattrel_prodAttrList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.prodatriel.prodattrel.prodAttrList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryWidget._sortKey && ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_prodatriel_Prodattrel'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryWidget._sortKey && ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryWidget._sortKey && ec_MESBasic_prodatriel_prodattrel_prodAttrList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_prodatriel_prodattrel_prodAttrList_getLayout == "function"){
			var layout = MESBasic_prodatriel_prodattrel_prodAttrList_getLayout();
			var node = layout.getNode();
	    	MESBasic.prodatriel.prodattrel.prodAttrList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.prodatriel.prodattrel.prodAttrList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.prodatriel.prodattrel.prodAttrList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_prodatriel_Prodattrel'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.prodatriel.prodattrel.prodAttrList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.prodatriel.prodattrel.prodAttrList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_prodatriel_prodAttrList,js,MESBasic_1_prodatriel_Prodattrel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_prodatriel_prodAttrList' idprefix='ec_MESBasic_prodatriel_prodattrel_prodAttrList' queryUrl='/MESBasic/prodatriel/prodattrel/prodAttrList-query.action' queryFunc="MESBasic.prodatriel.prodattrel.prodAttrList.query" ns="MESBasic.prodatriel.prodattrel.prodAttrList" />
<@exportexcel action="/MESBasic/prodatriel/prodattrel/prodAttrList-query.action"   getRequireDataAction="/MESBasic/prodatriel/prodattrel/prodAttrList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_prodatriel_Prodattrel&&viewCode=MESBasic_1_prodatriel_prodAttrList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_prodatriel_prodAttrList')}" prefix="ec_MESBasic_prodatriel_prodattrel_prodAttrList_query" modelCode="MESBasic_1_prodatriel_Prodattrel"  importFlag="false" viewCode="MESBasic_1_prodatriel_prodAttrList" />
