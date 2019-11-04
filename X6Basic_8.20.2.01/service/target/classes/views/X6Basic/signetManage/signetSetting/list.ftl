<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1366794076861')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('X6Basic.signetManage.signetSetting','X6Basic.signetManage.signetSetting.list');
</script>
<@frameset id="ec_X6Basic_signetManage_signetSetting_list_container" border=0>
	<@frame id="ec_X6Basic_signetManage_signetSetting_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_signetManage_list,html,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) -->
<!-- 自定义代码 -->
<input type="hidden" id="saveType"  name="saveType" value="${saveType!}"/>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.signetManage.signetSetting.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.signetManage.signetSetting.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.signetManage.signetSetting.list._prefix += '.';
			}
			X6Basic.signetManage.signetSetting.list._prefix += arr[i];
		}
		X6Basic.signetManage.signetSetting.list._suffix = arr[arr.length -1];
		if(X6Basic.signetManage.signetSetting.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.signetManage.signetSetting.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.signetManage.signetSetting.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.signetManage.signetSetting.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.signetManage.signetSetting.list.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+X6Basic.signetManage.signetSetting.list._prefix + '.' + X6Basic.signetManage.signetSetting.list._suffix +'"]').val(obj[0][X6Basic.signetManage.signetSetting.list._suffix]);
		CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+X6Basic.signetManage.signetSetting.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name^="'+X6Basic.signetManage.signetSetting.list._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+X6Basic.signetManage.signetSetting.list._prefix + '.' + X6Basic.signetManage.signetSetting.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.signetManage.signetSetting.list._dialog) {
			X6Basic.signetManage.signetSetting.list._dialog.close();
		}
	};
	
	X6Basic.signetManage.signetSetting.list._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.signetManage.signetSetting.list.query_"+obj+")!='undefined'") ? eval('X6Basic.signetManage.signetSetting.list.query_'+obj+'()') : null;
		return str;
	
	};
	
X6Basic_signetManage_signetSetting_list_refresh = function(node){
	//var url = "/X6Basic/signetManage/signetSetting/list-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_signetManage_signetSetting_list_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_signetManage_signetSetting_list_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.signetManage.signetSetting.list.node = node;
	X6Basic.signetManage.signetSetting.list.query("query");
}

X6Basic.signetManage.signetSetting.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.signetManage.signetSetting.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_signetManage_signetSetting_list_fileupload_button",
		handler:function(){
			if($('#X6Basic_signetManage_signetSetting_list_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_signetManage_signetSetting_list_fileupload"></div>');
			}
			X6Basic.signetManage.signetSetting.list.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_signetManage_signetSetting_list_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_signetManage_signetSetting_list_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.signetManage.signetSetting.list.infoDialog.show();
			if($('#X6Basic_signetManage_signetSetting_list_fileupload').html() == '') {
				$('#X6Basic_signetManage_signetSetting_list_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_signetManage_signetSetting&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.signetManage.signetSetting.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.signetManage.signetSetting." + params.viewName + ".referenceCopy");
			funcName('signetSetting', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.signetManage.signetSetting.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.signetManage.signetSetting." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.signetManage.signetSetting.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.signetManage.signetSetting." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			/**
			 * 列表新增
			 * @method X6Basic.signetManage.signetSetting.list.addlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.signetManage.signetSetting.list.addlist = function() {
					var treeParam = "";
					if(typeof X6Basic_signetManage_signetSetting_list_getLayout == "function"){
						var layout = X6Basic_signetManage_signetSetting_list_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							var modelCode = node.modelCode.replace(".","_");
							if(modelCode == 'X6Basic_1.0_signetManage_SignetSetting'.replace(".","_")){
								treeParam = '&signetSetting.parentId=' + node.id;
							}else{
								treeParam = '&signetSetting.' + $('#'+modelCode).val() + '.id=' + node.id;
							}
						}
					}
						var otherParams = {};
						otherParams.dialogType = '4';
						X6Basic.signetManage.signetSetting.list.otherParams = otherParams;

						var url='/X6Basic/signetManage/signetSetting/edit.action?entityCode=X6Basic_1.0_signetManage' + "&${getPowerCode('list_add_add_X6Basic_1.0_signetManage_list')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
						X6Basic.signetManage.signetSetting.list.showDialog(url,'X6Basic_signetManage_signetSetting_edit_form','${getText('X6Basic.viewtitle.radion1367133678500')}',500,475);
			};
			
			/**
			 * 列表编辑
			 * @method X6Basic.signetManage.signetSetting.list.modifylist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.signetManage.signetSetting.list.modifylist = function() {
				if(X6Basic.signetManage.signetSetting.list.checkSelectedAny()){
					if(X6Basic.signetManage.signetSetting.list.checkSelectedMore()) {
							var otherParams = {};
							otherParams.dialogType = '4';
							X6Basic.signetManage.signetSetting.list.otherParams = otherParams;

							X6Basic.signetManage.signetSetting.list.showDialog('/X6Basic/signetManage/signetSetting/edit.action?entityCode=X6Basic_1.0_signetManage&id=' + X6Basic.signetManage.signetSetting.list.getOperateRecordId()+"&${getPowerCode('list_modify_modify_X6Basic_1.0_signetManage_list')}",'X6Basic_signetManage_signetSetting_edit_form','${getText('X6Basic.viewtitle.radion1367133678500')}',500,475);
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method X6Basic.signetManage.signetSetting.list.dbmodifylist
			 */
			X6Basic.signetManage.signetSetting.list.dbmodifylist = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=list_modify_modify_X6Basic_1.0_signetManage_list";
   				CUI.ajax({
		   		   type: "POST",
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['list_modify_modify_X6Basic_1.0_signetManage_list'] == true) {
					var url = "/X6Basic/signetManage/signetSetting/edit.action?entityCode=X6Basic_1.0_signetManage&id=" + oRow.id + "&${getPowerCode('list_modify_modify_X6Basic_1.0_signetManage_list')}";
					var otherParams = {};
					otherParams.dialogType = '4';
					X6Basic.signetManage.signetSetting.list.otherParams = otherParams;

					X6Basic.signetManage.signetSetting.list.showDialog(url,'X6Basic_signetManage_signetSetting_edit_form','${getText('X6Basic.viewtitle.radion1367133678500')}',500,475);
					}else {
						var viewUrl = '/X6Basic/signetManage/signetSetting/view.action';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							var otherParams = {};
							otherParams.dialogType = '3';
							X6Basic.signetManage.signetSetting.list.otherParams = otherParams;
							X6Basic.signetManage.signetSetting.list.showDialog(viewUrl + "?entityCode=X6Basic_1.0_signetManage&id=" + oRow.id,'X6Basic_signetManage_signetSetting_view_form','${getText('X6Basic.viewtitle.radion1367495632577')}',500,475);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method X6Basic.signetManage.signetSetting.list.dellist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.signetManage.signetSetting.list.dellist = function(param) {
				if(X6Basic.signetManage.signetSetting.list.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('foundation.role.checkdelete')}", function(){	
						CUI.post("/X6Basic/signetManage/signetSetting/delete.action?ids=" + X6Basic.signetManage.signetSetting.list.getOperateRecordId('del')+"&${getPowerCode('list_delete_del_X6Basic_1.0_signetManage_list')}", X6Basic.signetManage.signetSetting.callBackInfo, "json");
				});
				}
			};
			
			

	/**
	 * 保存完毕回调
	 * @method X6Basic.signetManage.signetSetting.callBackInfo
	 */
	X6Basic.signetManage.signetSetting.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('X6Basic_signetManage_signetSetting_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{X6Basic.signetManage.signetSetting.list.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_X6Basic_signetManage_signetSetting_list_query.get('queryFunc');
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof X6Basic_signetManage_signetSetting_list_getLayout == "function"){
							    		var layout = X6Basic_signetManage_signetSetting_list_getLayout();
										var node = layout.getNode();
								    	X6Basic.signetManage.signetSetting.list.node = node	
										eval(queryFunc);
										layout.refreshTree();
							    	}else{
							    		eval(queryFunc);
							    	}			
								} else {
									if(typeof X6Basic_signetManage_signetSetting_list_getLayout == "function"){
										var layout = X6Basic_signetManage_signetSetting_list_getLayout();
										var node = layout.getNode();
								    	X6Basic.signetManage.signetSetting.list.node = node	
										X6Basic.signetManage.signetSetting.list.query('query');
										layout.refreshTree();
									}else{
										X6Basic.signetManage.signetSetting.list.query('query');
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_X6Basic_signetManage_signetSetting_list_query.get('queryFunc');
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof X6Basic_signetManage_signetSetting_list_getLayout == "function"){
								    		var layout = X6Basic_signetManage_signetSetting_list_getLayout();
											var node = layout.getNode();
									    	X6Basic.signetManage.signetSetting.list.node = node	
											eval(queryFunc);
											layout.refreshTree();
								    	}else{
								    		eval(queryFunc);
								    	}
									} else {
										if(typeof X6Basic_signetManage_signetSetting_list_getLayout == "function"){
											var layout = X6Basic_signetManage_signetSetting_list_getLayout();
											var node = layout.getNode();
									    	X6Basic.signetManage.signetSetting.list.node = node	
											X6Basic.signetManage.signetSetting.list.query('query');
											layout.refreshTree();
										}else{
											X6Basic.signetManage.signetSetting.list.query('query');
										}
									}
								}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method X6Basic.signetManage.signetSetting.list.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	X6Basic.signetManage.signetSetting.list.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_X6Basic_signetManage_signetSetting_list_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_X6Basic_signetManage_signetSetting_list_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_X6Basic_signetManage_signetSetting_list_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method X6Basic.signetManage.signetSetting.list.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.signetManage.signetSetting.list.checkSelectedAny = function() {
		if(datatable_ec_X6Basic_signetManage_signetSetting_list_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method X6Basic.signetManage.signetSetting.list.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.signetManage.signetSetting.list.checkSelectedMore = function() {
		if(datatable_ec_X6Basic_signetManage_signetSetting_list_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	
	/**
	 * 显示增加对话框
	 * @method X6Basic.signetManage.signetSetting.list.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.signetManage.signetSetting.list.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = X6Basic.signetManage.signetSetting.list.otherParams;
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
				handler:function(){X6Basic.signetManage.signetSetting.list.saveSignet();}
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
		X6Basic.signetManage.signetSetting.list.Dlg =	new CUI.Dialog({
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
		X6Basic.signetManage.signetSetting.list.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_signetManage_signetSetting', element : $('#X6Basic_signetManage_signetSetting_list_fileupload_button a:eq(1)')});
		}
		X6Basic.signetManage.signetSetting.list.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.signetManage.signetSetting.list.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.signetManage.signetSetting.list.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.signetManage.signetSetting.list.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){X6Basic.signetManage.signetSetting.approval();}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.signetManage.signetSetting.list.AppDlg.show();
	};
	/**
	 * 查询
	 * @method X6Basic.signetManage.signetSetting.list.query
	 */
	X6Basic.signetManage.signetSetting.list.query = function(type,pageNo,sortFlag){
		var node = X6Basic.signetManage.signetSetting.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		X6Basic.signetManage.signetSetting.list.node = null;
		if(!checkListValid("ec_X6Basic_signetManage_signetSetting_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_X6Basic_signetManage_signetSetting_list_query._sortKey && datatable_ec_X6Basic_signetManage_signetSetting_list_query._sortMethod){
			CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_signetManage_signetSetting_list_query._sortKey);
			CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_signetManage_signetSetting_list_query._sortMethod);
		}else{
			datatable_ec_X6Basic_signetManage_signetSetting_list_query._sortKey = '';
			CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && type == 'pending') {
			url = "/X6Basic/signetManage/signetSetting/list-pending.action";
	    } else {
	    	url = "/X6Basic/signetManage/signetSetting/list-query.action";
	    }  
		CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_signetManage_signetSetting_list_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific'){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent(CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+fastCol+'"]').prop('checked'));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_signetManage_signetSetting_list_queryForm *[name="'+fastCol+'"]').val();
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
							dataPost += "&" + fastCol + "=," + encodeURIComponent(fastColValue) + ",";
						} else {
							dataPost += "&" + fastCol + "=" + encodeURIComponent(fastColValue);
						}
					}
				}	
			}
		});
		var pageSize=CUI('input[name="ec_X6Basic_signetManage_signetSetting_list_query_PageLink_PageCount"]').val();
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
		if(nodeParam!=""){
			if(url.indexOf(".action?")<0){
				url += "?1=1";
			}
			url += nodeParam;
		}
	 	datatable_ec_X6Basic_signetManage_signetSetting_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
X6Basic.signetManage.signetSetting.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.signetManage.signetSetting.list.otherParams = {};
	X6Basic.signetManage.signetSetting.list.otherParams.dialogType = dialogType;
	X6Basic.signetManage.signetSetting.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.signetManage.signetSetting.list.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.signetManage.signetSetting.editCallBackInfo
 */
X6Basic.signetManage.signetSetting.editCallBackInfo = function(){
	var queryFunc = datatable_ec_X6Basic_signetManage_signetSetting_list_query.get('queryFunc');
    if(null != queryFunc && "undefined" != queryFunc){			
		eval(queryFunc);
	} else {
		X6Basic.signetManage.signetSetting.list.query('query');
	}
	timeData();
}

function checkListValid(formId){return true;};

	/* CUSTOM CODE START(view-LIST-X6Basic_1.0_signetManage_list,js,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) */
// 自定义代码
X6Basic.signetManage.signetSetting.list.saveSignet=function(){
	var password=CUI("input[name='signetSetting.password']",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var checkPassword=CUI("input[name='signetSetting.checkPassword']",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var signName=CUI("#signetSetting_name",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var user=CUI("#signetSetting_userinfo_name",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var urlFile=CUI("#urlFile",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	
	if(signName==''){
		X6Basic_signetManage_signetSetting_edit_formDialogErrorBarWidget.show("印章名称不能为空！");
        return false;
	}
	if(user==''){
		X6Basic_signetManage_signetSetting_edit_formDialogErrorBarWidget.show("印章用户不能为空！");
        return false;
	}
	if ((password.length < 6) || (password.length > 32)) {
		X6Basic_signetManage_signetSetting_edit_formDialogErrorBarWidget.show("印章口令必须是6-32位.");
        return false;
    }
     if (password!=checkPassword) {
    	 X6Basic_signetManage_signetSetting_edit_formDialogErrorBarWidget.show("两次口令不一致，请重新输入！.");
        return false;
     }
	var txtImg_url=urlFile.toLowerCase();
	var txtImg_ext=txtImg_url.substring(txtImg_url.length-3,txtImg_url.length);
	if (txtImg_ext!="jpg" && txtImg_ext!="gif" ){
		X6Basic_signetManage_signetSetting_edit_formDialogErrorBarWidget.show("请选择bmp,gif或者jpg格式的文件!");
		CUI("#urlFile").focus();
		return false;
	}
	var saveType="${saveType!}";
	var flag=X6Basic.signetManage.signetSetting.list.createSignet();
	
	if (signDiv_SignControl.getSignWidth() > 192 || signDiv_SignControl.getSignHeight() > 192) {
			if(!confirm("图片像素超过192*192,确认要提交吗！")){
				return false;
			}
	}	
	if(flag){
		setTimeout(function(){
			if(saveType=="service"){
			var newFormId = new Date().getTime();
			createUploadForm(newFormId, "X6Basic_signetManage_signetSetting_edit_form");
			validateUploadFrom("X6Basic_signetManage_signetSetting_edit_form");
				var result = signDiv_SignControl.saveSignToUrlNew("/X6Basic/signetManage/signetSetting/edit/submit.action", signName, "jUploadForm" + newFormId, "__pc__=${(Parameters.__pc__)!}");
				if((!+[1,]) && result) {
					copyFileUploadForm("X6Basic_signetManage_signetSetting_edit_form", "jUploadForm" + newFormId);
					callBackUploadForm(result, "X6Basic_signetManage_signetSetting_edit_form", "X6Basic.signetManage.signetSetting.callBackInfo");
					$('#' + newFormId).remove();
				}
			}else{
				var result = signDiv_SignControl.saveSignToLocal(signName);
				X6Basic_signetManage_signetSetting_edit_formDialogErrorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
				try{X6Basic.signetManage.signetSetting.list.Dlg.close();closeLoadPanel();}catch(e){}
			}
		
		},500);
	}
	
	
}
X6Basic.signetManage.signetSetting.list.createSignet=function(){
	var password=CUI("input[name='signetSetting.password']",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var checkPassword=CUI("input[name='signetSetting.checkPassword']",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var signName=CUI("#signetSetting_name",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var user=CUI("#signetSetting_userinfo_name",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	var urlFile=CUI("#fileUrlInput",CUI("#X6Basic_signetManage_signetSetting_edit_form")).val();
	if(urlFile==''){
		X6Basic_signetManage_signetSetting_edit_formDialogErrorBarWidget.show("请选选择印章源文件！");
        return false;
	}
	signDiv_SignControl.createNewSign(signName,user,password,urlFile);
	return signDiv_SignControl.getSignc();
}
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='X6Basic_1.0_signetManage_list' idprefix='ec_X6Basic_signetManage_signetSetting_list' queryUrl='/X6Basic/signetManage/signetSetting/list-query.action' queryFunc="X6Basic.signetManage.signetSetting.list.query" />
<@exportexcel action="/X6Basic/signetManage/signetSetting/list-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" />
