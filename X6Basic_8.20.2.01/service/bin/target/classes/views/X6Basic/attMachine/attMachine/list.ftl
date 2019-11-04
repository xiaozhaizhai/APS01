<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('X6Basic.attMachine.attMachine','X6Basic.attMachine.attMachine.list');
</script>
<@frameset id="ec_X6Basic_attMachine_attMachine_list_container" border=0>
	<@frame id="ec_X6Basic_attMachine_attMachine_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-X6Basic_1.0_attMachine_list,html,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.attMachine.attMachine.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.attMachine.attMachine.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.attMachine.attMachine.list._prefix += '.';
			}
			X6Basic.attMachine.attMachine.list._prefix += arr[i];
		}
		X6Basic.attMachine.attMachine.list._suffix = arr[arr.length -1];
		if(X6Basic.attMachine.attMachine.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.attMachine.attMachine.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.attMachine.attMachine.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.attMachine.attMachine.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.attMachine.attMachine.list.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+X6Basic.attMachine.attMachine.list._prefix + '.' + X6Basic.attMachine.attMachine.list._suffix +'"]').val(obj[0][X6Basic.attMachine.attMachine.list._suffix]);
		CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+X6Basic.attMachine.attMachine.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name^="'+X6Basic.attMachine.attMachine.list._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+X6Basic.attMachine.attMachine.list._prefix + '.' + X6Basic.attMachine.attMachine.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.attMachine.attMachine.list._dialog) {
			X6Basic.attMachine.attMachine.list._dialog.close();
		}
	};
	
	X6Basic.attMachine.attMachine.list._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.attMachine.attMachine.list.query_"+obj+")!='undefined'") ? eval('X6Basic.attMachine.attMachine.list.query_'+obj+'()') : null;
		return str;
	
	};
	
X6Basic_attMachine_attMachine_list_refresh = function(node){
	//var url = "/X6Basic/attMachine/attMachine/list-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_attMachine_attMachine_list_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_attMachine_attMachine_list_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.attMachine.attMachine.list.node = node;
	X6Basic.attMachine.attMachine.list.query("query");
}

X6Basic_attMachine_attMachine_list_getList = function() {
	return "X6Basic.attMachine.attMachine.list";
}

X6Basic.attMachine.attMachine.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.attMachine.attMachine.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_attMachine_attMachine_list_fileupload_button",
		handler:function(){
			if($('#X6Basic_attMachine_attMachine_list_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_attMachine_attMachine_list_fileupload"></div>');
			}
			X6Basic.attMachine.attMachine.list.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_attMachine_attMachine_list_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_attMachine_attMachine_list_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.attMachine.attMachine.list.infoDialog.show();
			if($('#X6Basic_attMachine_attMachine_list_fileupload').html() == '') {
				$('#X6Basic_attMachine_attMachine_list_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_attMachine_attMachine&entityCode=X6Basic_1.0_attMachine&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.attMachine.attMachine.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.attMachine.attMachine." + params.viewName + ".referenceCopy");
			funcName('attMachine', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.attMachine.attMachine.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.attMachine.attMachine." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.attMachine.attMachine.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("X6Basic.attMachine.attMachine." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			/**
			 * 列表新增
			 * @method X6Basic.attMachine.attMachine.list.addlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.attMachine.attMachine.list.addlist = function() {
					var treeParam = "";
					if(typeof X6Basic_attMachine_attMachine_list_getLayout == "function"){
						var layout = X6Basic_attMachine_attMachine_list_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							var modelCode = node.modelCode.replace(".","_");
							if(modelCode == 'X6Basic_1.0_attMachine_AttMachine'.replace(".","_")){
								treeParam = '&attMachine.parentId=' + node.id;
							}else{
								treeParam = '&attMachine.' + $('#'+modelCode).val() + '.id=' + node.id;
							}
						}
					}
						var otherParams = {};
						otherParams.dialogType = '5';
						X6Basic.attMachine.attMachine.list.otherParams = otherParams;

						var url='/X6Basic/attMachine/attMachine/edit.action?entityCode=X6Basic_1.0_attMachine' + "&${getPowerCode('list_add_add_X6Basic_1.0_attMachine_list')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
						X6Basic.attMachine.attMachine.list.showDialog(url,'X6Basic_attMachine_attMachine_edit_form','${getText('X6Basic.viewtitle.radion1367140362120')}',500,260);
			};
			
			/**
			 * 列表编辑
			 * @method X6Basic.attMachine.attMachine.list.modifylist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.attMachine.attMachine.list.modifylist = function() {
				if(X6Basic.attMachine.attMachine.list.checkSelectedAny()){
					if(X6Basic.attMachine.attMachine.list.checkSelectedMore()) {
							var otherParams = {};
							otherParams.dialogType = '5';
							X6Basic.attMachine.attMachine.list.otherParams = otherParams;

							X6Basic.attMachine.attMachine.list.showDialog('/X6Basic/attMachine/attMachine/edit.action?entityCode=X6Basic_1.0_attMachine&id=' + X6Basic.attMachine.attMachine.list.getOperateRecordId()+"&${getPowerCode('list_modify_modify_X6Basic_1.0_attMachine_list')}",'X6Basic_attMachine_attMachine_edit_form','${getText('X6Basic.viewtitle.radion1367140362120')}',500,260);
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method X6Basic.attMachine.attMachine.list.dbmodifylist
			 */
			X6Basic.attMachine.attMachine.list.dbmodifylist = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=list_modify_modify_X6Basic_1.0_attMachine_list";
   				CUI.ajax({
		   		   type: "POST",
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['list_modify_modify_X6Basic_1.0_attMachine_list'] == true) {
					var url = "/X6Basic/attMachine/attMachine/edit.action?entityCode=X6Basic_1.0_attMachine&id=" + oRow.id + "&${getPowerCode('list_modify_modify_X6Basic_1.0_attMachine_list')}";
					var otherParams = {};
					otherParams.dialogType = '5';
					X6Basic.attMachine.attMachine.list.otherParams = otherParams;

					X6Basic.attMachine.attMachine.list.showDialog(url,'X6Basic_attMachine_attMachine_edit_form','${getText('X6Basic.viewtitle.radion1367140362120')}',500,260);
					}else {
						var viewUrl = '/X6Basic/attMachine/attMachine/view.action';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							var otherParams = {};
							otherParams.dialogType = '1';
							X6Basic.attMachine.attMachine.list.otherParams = otherParams;
							X6Basic.attMachine.attMachine.list.showDialog(viewUrl + "?entityCode=X6Basic_1.0_attMachine&id=" + oRow.id,'X6Basic_attMachine_attMachine_view_form','${getText('X6Basic.viewtitle.radion1367140422876')}',500,260);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method X6Basic.attMachine.attMachine.list.dellist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.attMachine.attMachine.list.dellist = function(param) {
				if(X6Basic.attMachine.attMachine.list.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('foundation.role.checkdelete')}", function(){	
						CUI.post("/X6Basic/attMachine/attMachine/delete.action?ids=" + X6Basic.attMachine.attMachine.list.getOperateRecordId('del')+"&${getPowerCode('list_delete_del_X6Basic_1.0_attMachine_list')}", X6Basic.attMachine.attMachine.callBackInfo, "json");
				});
				}
			};
			
			

	/**
	 * 保存完毕回调
	 * @method X6Basic.attMachine.attMachine.callBackInfo
	 */
	X6Basic.attMachine.attMachine.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('X6Basic_attMachine_attMachine_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{X6Basic.attMachine.attMachine.list.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_X6Basic_attMachine_attMachine_list_query.get('queryFunc');
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof X6Basic_attMachine_attMachine_list_getLayout == "function"){
							    		var layout = X6Basic_attMachine_attMachine_list_getLayout();
										var node = layout.getNode();
								    	X6Basic.attMachine.attMachine.list.node = node	
										eval(queryFunc);
										layout.refreshTree();
							    	}else{
							    		eval(queryFunc);
							    	}			
								} else {
									if(typeof X6Basic_attMachine_attMachine_list_getLayout == "function"){
										var layout = X6Basic_attMachine_attMachine_list_getLayout();
										var node = layout.getNode();
								    	X6Basic.attMachine.attMachine.list.node = node	
										X6Basic.attMachine.attMachine.list.query('query');
										layout.refreshTree();
									}else{
										X6Basic.attMachine.attMachine.list.query('query');
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_X6Basic_attMachine_attMachine_list_query.get('queryFunc');
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof X6Basic_attMachine_attMachine_list_getLayout == "function"){
								    		var layout = X6Basic_attMachine_attMachine_list_getLayout();
											var node = layout.getNode();
									    	X6Basic.attMachine.attMachine.list.node = node	
											eval(queryFunc);
											layout.refreshTree();
								    	}else{
								    		eval(queryFunc);
								    	}
									} else {
										if(typeof X6Basic_attMachine_attMachine_list_getLayout == "function"){
											var layout = X6Basic_attMachine_attMachine_list_getLayout();
											var node = layout.getNode();
									    	X6Basic.attMachine.attMachine.list.node = node	
											X6Basic.attMachine.attMachine.list.query('query');
											layout.refreshTree();
										}else{
											X6Basic.attMachine.attMachine.list.query('query');
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
	 * @method X6Basic.attMachine.attMachine.list.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	X6Basic.attMachine.attMachine.list.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_X6Basic_attMachine_attMachine_list_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_X6Basic_attMachine_attMachine_list_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_X6Basic_attMachine_attMachine_list_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method X6Basic.attMachine.attMachine.list.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.attMachine.attMachine.list.checkSelectedAny = function() {
		if(datatable_ec_X6Basic_attMachine_attMachine_list_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method X6Basic.attMachine.attMachine.list.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.attMachine.attMachine.list.checkSelectedMore = function() {
		if(datatable_ec_X6Basic_attMachine_attMachine_list_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	
	/**
	 * 显示增加对话框
	 * @method X6Basic.attMachine.attMachine.list.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.attMachine.attMachine.list.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = X6Basic.attMachine.attMachine.list.otherParams || {};
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
		X6Basic.attMachine.attMachine.list.Dlg =	new CUI.Dialog({
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
		X6Basic.attMachine.attMachine.list.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_attMachine_attMachine', element : $('#X6Basic_attMachine_attMachine_list_fileupload_button a:eq(1)')});
		}
		X6Basic.attMachine.attMachine.list.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.attMachine.attMachine.list.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.attMachine.attMachine.list.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.attMachine.attMachine.list.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){X6Basic.attMachine.attMachine.approval();}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.attMachine.attMachine.list.AppDlg.show();
	};
	
	X6Basic.attMachine.attMachine.list.commonQuery = function(type) {
	  if(typeof X6Basic.attMachine.attMachine.list.cancelSelectedNode == 'function') {
	   X6Basic.attMachine.attMachine.list.cancelSelectedNode();
	  }
	  X6Basic.attMachine.attMachine.list.query(type);
	 };
	
	/**
	 * 查询
	 * @method X6Basic.attMachine.attMachine.list.query
	 */
	X6Basic.attMachine.attMachine.list.query = function(type,pageNo,sortFlag){
		var node = X6Basic.attMachine.attMachine.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		X6Basic.attMachine.attMachine.list.node = null;
		if(!checkListValid("ec_X6Basic_attMachine_attMachine_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_X6Basic_attMachine_attMachine_list_query._sortKey && datatable_ec_X6Basic_attMachine_attMachine_list_query._sortMethod){
			CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_attMachine_attMachine_list_query._sortKey);
			CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_attMachine_attMachine_list_query._sortMethod);
		}else{
			datatable_ec_X6Basic_attMachine_attMachine_list_query._sortKey = '';
			CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && type == 'pending') {
			url = "/X6Basic/attMachine/attMachine/list-pending.action";
	    } else {
	    	url = "/X6Basic/attMachine/attMachine/list-query.action";
	    }  
		CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_attMachine_attMachine_list_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific'){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent(CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+fastCol+'"]').prop('checked'));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_attMachine_attMachine_list_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_X6Basic_attMachine_attMachine_list_query_PageLink_PageCount"]').val();
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
		var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_attMachine_list';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
	 	datatable_ec_X6Basic_attMachine_attMachine_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
X6Basic.attMachine.attMachine.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.attMachine.attMachine.list.otherParams = {};
	X6Basic.attMachine.attMachine.list.otherParams.dialogType = dialogType;
	X6Basic.attMachine.attMachine.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.attMachine.attMachine.list.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.attMachine.attMachine.editCallBackInfo
 */
X6Basic.attMachine.attMachine.editCallBackInfo = function(){
	var queryFunc = datatable_ec_X6Basic_attMachine_attMachine_list_query.get('queryFunc');
    if(null != queryFunc && "undefined" != queryFunc){			
		eval(queryFunc);
	} else {
		X6Basic.attMachine.attMachine.list.query('query');
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-X6Basic_1.0_attMachine_list,js,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='X6Basic_1.0_attMachine_list' idprefix='ec_X6Basic_attMachine_attMachine_list' queryUrl='/X6Basic/attMachine/attMachine/list-query.action' queryFunc="X6Basic.attMachine.attMachine.list.query" ns="X6Basic.attMachine.attMachine.list" />
<@exportexcel action="/X6Basic/attMachine/attMachine/list-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" permissionCode="${permissionCode?default('X6Basic_1.0_attMachine_list')}" prefix="ec_X6Basic_attMachine_attMachine_list_query"/>
