<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('MESBasic.viewtitle.radion1419849935747')}</title>
<body id="dialog_page">
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.product_type.producttype','MESBasic.product_type.producttype.list');
</script>
<@frameset id="ec_MESBasic_product_type_producttype_list_container" border=0>
	<@frame id="ec_MESBasic_product_type_producttype_list_container_main"  offsetH=4 region="center" class="center_in">
	<#include "list-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_product_type_list,html,MESBasic_1_product_type_Producttype,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.product_type.producttype.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product_type.producttype.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product_type.producttype.list._prefix += '.';
			}
			MESBasic.product_type.producttype.list._prefix += arr[i];
		}
		MESBasic.product_type.producttype.list._suffix = arr[arr.length -1];
		if(MESBasic.product_type.producttype.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product_type.producttype.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product_type.producttype.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product_type.producttype.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.product_type.producttype.list.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+MESBasic.product_type.producttype.list._prefix + '.' + MESBasic.product_type.producttype.list._suffix +'"]').val(obj[0][MESBasic.product_type.producttype.list._suffix]);
		CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+MESBasic.product_type.producttype.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name^="'+MESBasic.product_type.producttype.list._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+MESBasic.product_type.producttype.list._prefix + '.' + MESBasic.product_type.producttype.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.product_type.producttype.list._dialog) {
			MESBasic.product_type.producttype.list._dialog.close();
		}
	};
	
	MESBasic.product_type.producttype.list._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product_type.producttype.list.query_"+obj+")!='undefined'") ? eval('MESBasic.product_type.producttype.list.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_product_type_producttype_list_refresh = function(node){
	//var url = "/MESBasic/product_type/producttype/list-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_product_type_producttype_list_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_product_type_producttype_list_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.product_type.producttype.list.node = node;
	MESBasic.product_type.producttype.list.query("query");
}

MESBasic_product_type_producttype_list_getList = function() {
	return "MESBasic.product_type.producttype.list";
}
MESBasic.product_type.producttype.list.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.product_type.producttype.list.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.product_type.producttype.list.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_product_type_producttype_list_fileupload_button",
		handler:function(){
			if($('#MESBasic_product_type_producttype_list_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_product_type_producttype_list_fileupload"></div>');
			}
			MESBasic.product_type.producttype.list.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_product_type_producttype_list_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_product_type_producttype_list_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.product_type.producttype.list.infoDialog.show();
			if($('#MESBasic_product_type_producttype_list_fileupload').html() == '') {
				$('#MESBasic_product_type_producttype_list_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_product_type_producttype&entityCode=MESBasic_1_product_type&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.product_type.producttype.list.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.product_type.producttype." + params.viewName + ".referenceCopy");
			funcName('producttype', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.product_type.producttype.list.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.product_type.producttype." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.product_type.producttype.list.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.product_type.producttype." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			/**
			 * 列表新增
			 * @method MESBasic.product_type.producttype.list.addlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.product_type.producttype.list.addlist = function() {
					var treeParam = "";
					if(typeof MESBasic_product_type_producttype_list_getLayout == "function"){
						var layout = MESBasic_product_type_producttype_list_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							var modelCode = node.modelCode.replace(".","_");
							if(modelCode == 'MESBasic_1_product_type_Producttype'.replace(".","_")){
								treeParam = '&producttype.parentId=' + node.id;
							}else{
								treeParam = '&producttype.' + $('#'+modelCode).val() + '.id=' + node.id;
							}
						}
					}
						var otherParams = {};
						otherParams.dialogType = '3';
						MESBasic.product_type.producttype.list.otherParams = otherParams;

						var url='/MESBasic/product_type/producttype/edit.action?entityCode=MESBasic_1_product_type' + "&${getPowerCode('${buttonPerfix!}list_addbtn_add_MESBasic_1_product_type_list')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
						MESBasic.product_type.producttype.list.showDialog(url,'MESBasic_product_type_producttype_edit_form','${getText('MESBasic.viewtitle.radion1419849861490')}',500,260);
			};
			
			/**
			 * 列表编辑
			 * @method MESBasic.product_type.producttype.list.modifylist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.product_type.producttype.list.modifylist = function() {
				if(MESBasic.product_type.producttype.list.checkSelectedAny()){
					if(MESBasic.product_type.producttype.list.checkSelectedMore()) {
							var otherParams = {};
							otherParams.dialogType = '3';
							MESBasic.product_type.producttype.list.otherParams = otherParams;

							MESBasic.product_type.producttype.list.showDialog('/MESBasic/product_type/producttype/edit.action?entityCode=MESBasic_1_product_type&id=' + MESBasic.product_type.producttype.list.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}list_btnupdate_modify_MESBasic_1_product_type_list')}",'MESBasic_product_type_producttype_edit_form','${getText('MESBasic.viewtitle.radion1419849861490')}',500,260);
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method MESBasic.product_type.producttype.list.dbmodifylist
			 */
			MESBasic.product_type.producttype.list.dbmodifylist = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}list_btnupdate_modify_MESBasic_1_product_type_list";
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}list_btnupdate_modify_MESBasic_1_product_type_list'] == true) {
					var url = "/MESBasic/product_type/producttype/edit.action?entityCode=MESBasic_1_product_type&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}list_btnupdate_modify_MESBasic_1_product_type_list')}";
					var otherParams = {};
					otherParams.dialogType = '3';
					MESBasic.product_type.producttype.list.otherParams = otherParams;

					MESBasic.product_type.producttype.list.showDialog(url,'MESBasic_product_type_producttype_edit_form','${getText('MESBasic.viewtitle.radion1419849861490')}',500,260);
					}else {
						var viewUrl = '/MESBasic/product_type/producttype/proview.action';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							var otherParams = {};
							otherParams.viewShowType = 'VIEW';
							otherParams.dialogType = '3';
							MESBasic.product_type.producttype.list.otherParams = otherParams;
							MESBasic.product_type.producttype.list.showDialog(viewUrl + "?entityCode=MESBasic_1_product_type&id=" + oRow.id,'MESBasic_product_type_producttype_proview_form','${getText('MESBasic.viewtitle.radion1419850017524')}',500,260);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method MESBasic.product_type.producttype.list.dellist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.product_type.producttype.list.dellist = function(param) {
				if(MESBasic.product_type.producttype.list.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('MESBasic.confirmcontent.radion1419852190706')}", function(){
						CUI.post("/MESBasic/product_type/producttype/delete.action?ids=" + MESBasic.product_type.producttype.list.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}list_btndelete_del_MESBasic_1_product_type_list')}", MESBasic.product_type.producttype.callBackInfo, "json");
				});
				}
			};
			
		
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.product_type.producttype.callBackInfo
	 */
	MESBasic.product_type.producttype.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_product_type_producttype_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.product_type.producttype.list.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_product_type_producttype_list_query.get('queryFunc');
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_product_type_producttype_list_getLayout == "function"){
							    		var layout = MESBasic_product_type_producttype_list_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.product_type.producttype.list.node = node	
										eval(queryFunc);
										if(modelCode == 'MESBasic_1_product_type_Producttype'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		eval(queryFunc);
							    	}			
								} else {
									if(typeof MESBasic_product_type_producttype_list_getLayout == "function"){
										var layout = MESBasic_product_type_producttype_list_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.product_type.producttype.list.node = node	
										MESBasic.product_type.producttype.list.query('query');
										if(modelCode == 'MESBasic_1_product_type_Producttype'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										MESBasic.product_type.producttype.list.query('query');
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_product_type_producttype_list_query.get('queryFunc');
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_product_type_producttype_list_getLayout == "function"){
								    		var layout = MESBasic_product_type_producttype_list_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.product_type.producttype.list.node = node	
											eval(queryFunc);
											if(modelCode == 'MESBasic_1_product_type_Producttype'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.product_type.producttype.list.node = null;
											}
								    	}else{
								    		eval(queryFunc);
								    	}
									} else {
										if(typeof MESBasic_product_type_producttype_list_getLayout == "function"){
											var layout = MESBasic_product_type_producttype_list_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.product_type.producttype.list.node = node	
											MESBasic.product_type.producttype.list.query('query');
											if(modelCode == 'MESBasic_1_product_type_Producttype'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.product_type.producttype.list.node = null;
											}
										}else{
											MESBasic.product_type.producttype.list.query('query');
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
	 * @method MESBasic.product_type.producttype.list.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.product_type.producttype.list.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_product_type_producttype_list_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_product_type_producttype_list_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_product_type_producttype_list_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.product_type.producttype.list.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.product_type.producttype.list.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_product_type_producttype_list_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.product_type.producttype.list.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.product_type.producttype.list.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_product_type_producttype_list_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	
	/**
	 * 显示增加对话框
	 * @method MESBasic.product_type.producttype.list.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.product_type.producttype.list.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.product_type.producttype.list.otherParams || {};
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
		MESBasic.product_type.producttype.list.Dlg =	new CUI.Dialog({
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
		MESBasic.product_type.producttype.list.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_product_type_producttype', element : $('#MESBasic_product_type_producttype_list_fileupload_button a:eq(1)')});
		}
		MESBasic.product_type.producttype.list.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.product_type.producttype.list.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.product_type.producttype.list.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.product_type.producttype.list.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.product_type.producttype.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.product_type.producttype.list.AppDlg.show();
	};
	MESBasic.product_type.producttype.list.commonQuery = function(type) {
	  if(typeof MESBasic.product_type.producttype.list.cancelSelectedNode == 'function') {
	   MESBasic.product_type.producttype.list.cancelSelectedNode();
	   MESBasic.product_type.producttype.list.node = null;
	  }
	  if(typeof MESBasic_product_type_producttype_list_cancelSelectedNode == 'function') {
	   MESBasic_product_type_producttype_list_cancelSelectedNode();
	   MESBasic.product_type.producttype.list.node = null;
	  }
	  MESBasic.product_type.producttype.list.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.product_type.producttype.list.query
	 */
	MESBasic.product_type.producttype.list.query = function(type,pageNo,sortFlag){
		var node = MESBasic.product_type.producttype.list.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.product_type.producttype.list.node = null;
		if(!checkListValid("ec_MESBasic_product_type_producttype_list_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_product_type_producttype_list_query._sortKey && datatable_ec_MESBasic_product_type_producttype_list_query._sortMethod){
			CUI('#ec_MESBasic_product_type_producttype_list_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_product_type_producttype_list_query._sortKey);
			CUI('#ec_MESBasic_product_type_producttype_list_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_product_type_producttype_list_query._sortColumnName);
			CUI('#ec_MESBasic_product_type_producttype_list_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_product_type_producttype_list_query._sortMethod);
		}else{
			datatable_ec_MESBasic_product_type_producttype_list_query._sortKey = '';
			CUI('#ec_MESBasic_product_type_producttype_list_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_product_type_producttype_list_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_product_type_producttype_list_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/product_type/producttype/list-pending.action";
	    } else {
	    	url = "/MESBasic/product_type/producttype/list-query.action";
	    }  
		CUI('#ec_MESBasic_product_type_producttype_list_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_type_producttype_list_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_product_type_producttype_list_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_product_type_producttype_list_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_product_type_producttype_list_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_product_type_list';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_product_type_producttype_list_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_product_type_producttype_list_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.product_type.producttype.list.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_product_type";
		openExportFrame(url);
	}
MESBasic.product_type.producttype.list.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.product_type.producttype.list.otherParams = {};
	MESBasic.product_type.producttype.list.otherParams.dialogType = dialogType;
	MESBasic.product_type.producttype.list.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product_type.producttype.list.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.product_type.producttype.editCallBackInfo
 */
MESBasic.product_type.producttype.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_product_type_producttype_list_query.get('queryFunc');
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_product_type_producttype_list_getLayout == "function"){
    		var layout = MESBasic_product_type_producttype_list_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.product_type.producttype.list.node = node	
			eval(queryFunc);
			if(modelCode == 'MESBasic_1_product_type_Producttype'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		eval(queryFunc);
    	}			
	} else {
		if(typeof MESBasic_product_type_producttype_list_getLayout == "function"){
			var layout = MESBasic_product_type_producttype_list_getLayout();
			var node = layout.getNode();
	    	MESBasic.product_type.producttype.list.node = node	
			MESBasic.product_type.producttype.list.query('query');
			if(modelCode == 'MESBasic_1_product_type_Producttype'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			MESBasic.product_type.producttype.list.query('query');
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_product_type_list,js,MESBasic_1_product_type_Producttype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_product_type_list' idprefix='ec_MESBasic_product_type_producttype_list' queryUrl='/MESBasic/product_type/producttype/list-query.action' queryFunc="MESBasic.product_type.producttype.list.query" ns="MESBasic.product_type.producttype.list" />
<@exportexcel action="/MESBasic/product_type/producttype/list-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_product_type_list')}" prefix="ec_MESBasic_product_type_producttype_list_query"/>
