<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('MESBasic.viewtitle.radion1421288407296')}</title>
<body id="dialog_page">
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.prodtype.prodtype','MESBasic.prodtype.prodtype.ptlist');
</script>
<@frameset id="ec_MESBasic_prodtype_prodtype_ptlist_container" border=0>
	<@frame id="ec_MESBasic_prodtype_prodtype_ptlist_container_main"  offsetH=4 region="center" class="center_in">
	<#include "ptlist-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_prodtype_ptlist,html,MESBasic_1_prodtype_Prodtype,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.prodtype.prodtype.ptlist._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.prodtype.prodtype.ptlist._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.prodtype.prodtype.ptlist._prefix += '.';
			}
			MESBasic.prodtype.prodtype.ptlist._prefix += arr[i];
		}
		MESBasic.prodtype.prodtype.ptlist._suffix = arr[arr.length -1];
		if(MESBasic.prodtype.prodtype.ptlist._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.prodtype.prodtype.ptlist._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.prodtype.prodtype.ptlist._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.prodtype.prodtype.ptlist.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.prodtype.prodtype.ptlist.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+MESBasic.prodtype.prodtype.ptlist._prefix + '.' + MESBasic.prodtype.prodtype.ptlist._suffix +'"]').val(obj[0][MESBasic.prodtype.prodtype.ptlist._suffix]);
		CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+MESBasic.prodtype.prodtype.ptlist._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name^="'+MESBasic.prodtype.prodtype.ptlist._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+MESBasic.prodtype.prodtype.ptlist._prefix + '.' + MESBasic.prodtype.prodtype.ptlist._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.prodtype.prodtype.ptlist._dialog) {
			MESBasic.prodtype.prodtype.ptlist._dialog.close();
		}
	};
	
	MESBasic.prodtype.prodtype.ptlist._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.prodtype.prodtype.ptlist.query_"+obj+")!='undefined'") ? eval('MESBasic.prodtype.prodtype.ptlist.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_prodtype_prodtype_ptlist_refresh = function(node){
	//var url = "/MESBasic/prodtype/prodtype/ptlist-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.prodtype.prodtype.ptlist.node = node;
	MESBasic.prodtype.prodtype.ptlist.query("query");
}

MESBasic_prodtype_prodtype_ptlist_getList = function() {
	return "MESBasic.prodtype.prodtype.ptlist";
}
MESBasic.prodtype.prodtype.ptlist.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.prodtype.prodtype.ptlist.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.prodtype.prodtype.ptlist.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_prodtype_prodtype_ptlist_fileupload_button",
		handler:function(){
			if($('#MESBasic_prodtype_prodtype_ptlist_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_prodtype_prodtype_ptlist_fileupload"></div>');
			}
			MESBasic.prodtype.prodtype.ptlist.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_prodtype_prodtype_ptlist_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_prodtype_prodtype_ptlist_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.prodtype.prodtype.ptlist.infoDialog.show();
			if($('#MESBasic_prodtype_prodtype_ptlist_fileupload').html() == '') {
				$('#MESBasic_prodtype_prodtype_ptlist_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_prodtype_prodtype&entityCode=MESBasic_1_prodtype&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.prodtype.prodtype.ptlist.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.prodtype.prodtype." + params.viewName + ".referenceCopy");
			funcName('prodtype', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.prodtype.prodtype.ptlist.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.prodtype.prodtype." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.prodtype.prodtype.ptlist.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.prodtype.prodtype." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			/**
			 * 列表新增
			 * @method MESBasic.prodtype.prodtype.ptlist.addptlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.prodtype.prodtype.ptlist.addptlist = function() {
					var treeParam = "";
					if(typeof MESBasic_prodtype_prodtype_ptlist_getLayout == "function"){
						var layout = MESBasic_prodtype_prodtype_ptlist_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							var modelCode = node.modelCode.replace(".","_");
							if(modelCode == 'MESBasic_1_prodtype_Prodtype'.replace(".","_")){
								treeParam = '&prodtype.parentId=' + node.id;
							}else{
								treeParam = '&prodtype.' + $('#'+modelCode).val() + '.id=' + node.id;
							}
						}
					}
						var otherParams = {};
						otherParams.dialogType = '3';
						MESBasic.prodtype.prodtype.ptlist.otherParams = otherParams;

						var url='/MESBasic/prodtype/prodtype/ptedit.action?entityCode=MESBasic_1_prodtype' + "&${getPowerCode('${buttonPerfix!}ptlist_btnadd_add_MESBasic_1_prodtype_ptlist')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
						MESBasic.prodtype.prodtype.ptlist.showDialog(url,'MESBasic_prodtype_prodtype_ptedit_form','${getText('MESBasic.viewtitle.radion1421288297232')}',500,260);
			};
			
			/**
			 * 列表编辑
			 * @method MESBasic.prodtype.prodtype.ptlist.modifyptlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.prodtype.prodtype.ptlist.modifyptlist = function() {
				if(MESBasic.prodtype.prodtype.ptlist.checkSelectedAny()){
					if(MESBasic.prodtype.prodtype.ptlist.checkSelectedMore()) {
							var otherParams = {};
							otherParams.dialogType = '3';
							MESBasic.prodtype.prodtype.ptlist.otherParams = otherParams;

							MESBasic.prodtype.prodtype.ptlist.showDialog('/MESBasic/prodtype/prodtype/ptedit.action?entityCode=MESBasic_1_prodtype&id=' + MESBasic.prodtype.prodtype.ptlist.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}ptlist_btnupdate_modify_MESBasic_1_prodtype_ptlist')}",'MESBasic_prodtype_prodtype_ptedit_form','${getText('MESBasic.viewtitle.radion1421288297232')}',500,260);
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method MESBasic.prodtype.prodtype.ptlist.dbmodifyptlist
			 */
			MESBasic.prodtype.prodtype.ptlist.dbmodifyptlist = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}ptlist_btnupdate_modify_MESBasic_1_prodtype_ptlist";
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}ptlist_btnupdate_modify_MESBasic_1_prodtype_ptlist'] == true) {
					var url = "/MESBasic/prodtype/prodtype/ptedit.action?entityCode=MESBasic_1_prodtype&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}ptlist_btnupdate_modify_MESBasic_1_prodtype_ptlist')}";
					var otherParams = {};
					otherParams.dialogType = '3';
					MESBasic.prodtype.prodtype.ptlist.otherParams = otherParams;

					MESBasic.prodtype.prodtype.ptlist.showDialog(url,'MESBasic_prodtype_prodtype_ptedit_form','${getText('MESBasic.viewtitle.radion1421288297232')}',500,260);
					}else {
						var viewUrl = '/MESBasic/prodtype/prodtype/ptview.action';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							var otherParams = {};
							otherParams.viewShowType = 'VIEW';
							otherParams.dialogType = '3';
							MESBasic.prodtype.prodtype.ptlist.otherParams = otherParams;
							MESBasic.prodtype.prodtype.ptlist.showDialog(viewUrl + "?entityCode=MESBasic_1_prodtype&id=" + oRow.id,'MESBasic_prodtype_prodtype_ptview_form','${getText('MESBasic.viewtitle.radion1421288384453')}',500,260);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method MESBasic.prodtype.prodtype.ptlist.delptlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.prodtype.prodtype.ptlist.delptlist = function(param) {
				if(MESBasic.prodtype.prodtype.ptlist.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('MESBasic.confirmcontent.radion1421288676348')}", function(){
						CUI.post("/MESBasic/prodtype/prodtype/delete.action?ids=" + MESBasic.prodtype.prodtype.ptlist.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}ptlist_btndelete_del_MESBasic_1_prodtype_ptlist')}", MESBasic.prodtype.prodtype.callBackInfo, "json");
				});
				}
			};
			
		
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.prodtype.prodtype.callBackInfo
	 */
	MESBasic.prodtype.prodtype.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_prodtype_prodtype_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.prodtype.prodtype.ptlist.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.get('queryFunc');
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_prodtype_prodtype_ptlist_getLayout == "function"){
							    		var layout = MESBasic_prodtype_prodtype_ptlist_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.prodtype.prodtype.ptlist.node = node	
										eval(queryFunc);
										if(modelCode == 'MESBasic_1_prodtype_Prodtype'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		eval(queryFunc);
							    	}			
								} else {
									if(typeof MESBasic_prodtype_prodtype_ptlist_getLayout == "function"){
										var layout = MESBasic_prodtype_prodtype_ptlist_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.prodtype.prodtype.ptlist.node = node	
										MESBasic.prodtype.prodtype.ptlist.query('query');
										if(modelCode == 'MESBasic_1_prodtype_Prodtype'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										MESBasic.prodtype.prodtype.ptlist.query('query');
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.get('queryFunc');
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_prodtype_prodtype_ptlist_getLayout == "function"){
								    		var layout = MESBasic_prodtype_prodtype_ptlist_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.prodtype.prodtype.ptlist.node = node	
											eval(queryFunc);
											if(modelCode == 'MESBasic_1_prodtype_Prodtype'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.prodtype.prodtype.ptlist.node = null;
											}
								    	}else{
								    		eval(queryFunc);
								    	}
									} else {
										if(typeof MESBasic_prodtype_prodtype_ptlist_getLayout == "function"){
											var layout = MESBasic_prodtype_prodtype_ptlist_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.prodtype.prodtype.ptlist.node = node	
											MESBasic.prodtype.prodtype.ptlist.query('query');
											if(modelCode == 'MESBasic_1_prodtype_Prodtype'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.prodtype.prodtype.ptlist.node = null;
											}
										}else{
											MESBasic.prodtype.prodtype.ptlist.query('query');
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
	 * @method MESBasic.prodtype.prodtype.ptlist.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.prodtype.prodtype.ptlist.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.prodtype.prodtype.ptlist.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.prodtype.prodtype.ptlist.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.prodtype.prodtype.ptlist.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.prodtype.prodtype.ptlist.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	
	/**
	 * 显示增加对话框
	 * @method MESBasic.prodtype.prodtype.ptlist.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.prodtype.prodtype.ptlist.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.prodtype.prodtype.ptlist.otherParams || {};
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
		MESBasic.prodtype.prodtype.ptlist.Dlg =	new CUI.Dialog({
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
		MESBasic.prodtype.prodtype.ptlist.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_prodtype_prodtype', element : $('#MESBasic_prodtype_prodtype_ptlist_fileupload_button a:eq(1)')});
		}
		MESBasic.prodtype.prodtype.ptlist.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.prodtype.prodtype.ptlist.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.prodtype.prodtype.ptlist.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.prodtype.prodtype.ptlist.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.prodtype.prodtype.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.prodtype.prodtype.ptlist.AppDlg.show();
	};
	MESBasic.prodtype.prodtype.ptlist.commonQuery = function(type) {
	  if(typeof MESBasic.prodtype.prodtype.ptlist.cancelSelectedNode == 'function') {
	   MESBasic.prodtype.prodtype.ptlist.cancelSelectedNode();
	   MESBasic.prodtype.prodtype.ptlist.node = null;
	  }
	  if(typeof MESBasic_prodtype_prodtype_ptlist_cancelSelectedNode == 'function') {
	   MESBasic_prodtype_prodtype_ptlist_cancelSelectedNode();
	   MESBasic.prodtype.prodtype.ptlist.node = null;
	  }
	  MESBasic.prodtype.prodtype.ptlist.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.prodtype.prodtype.ptlist.query
	 */
	MESBasic.prodtype.prodtype.ptlist.query = function(type,pageNo,sortFlag){
		var node = MESBasic.prodtype.prodtype.ptlist.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.prodtype.prodtype.ptlist.node = null;
		if(!checkListValid("ec_MESBasic_prodtype_prodtype_ptlist_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_prodtype_prodtype_ptlist_query._sortKey && datatable_ec_MESBasic_prodtype_prodtype_ptlist_query._sortMethod){
			CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_prodtype_prodtype_ptlist_query._sortKey);
			CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_prodtype_prodtype_ptlist_query._sortColumnName);
			CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_prodtype_prodtype_ptlist_query._sortMethod);
		}else{
			datatable_ec_MESBasic_prodtype_prodtype_ptlist_query._sortKey = '';
			CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/prodtype/prodtype/ptlist-pending.action";
	    } else {
	    	url = "/MESBasic/prodtype/prodtype/ptlist-query.action";
	    }  
		CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_prodtype_prodtype_ptlist_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_prodtype_prodtype_ptlist_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_prodtype_ptlist';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.prodtype.prodtype.ptlist.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_prodtype";
		openExportFrame(url);
	}
MESBasic.prodtype.prodtype.ptlist.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.prodtype.prodtype.ptlist.otherParams = {};
	MESBasic.prodtype.prodtype.ptlist.otherParams.dialogType = dialogType;
	MESBasic.prodtype.prodtype.ptlist.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.prodtype.prodtype.ptlist.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.prodtype.prodtype.editCallBackInfo
 */
MESBasic.prodtype.prodtype.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_prodtype_prodtype_ptlist_query.get('queryFunc');
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_prodtype_prodtype_ptlist_getLayout == "function"){
    		var layout = MESBasic_prodtype_prodtype_ptlist_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.prodtype.prodtype.ptlist.node = node	
			eval(queryFunc);
			if(modelCode == 'MESBasic_1_prodtype_Prodtype'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		eval(queryFunc);
    	}			
	} else {
		if(typeof MESBasic_prodtype_prodtype_ptlist_getLayout == "function"){
			var layout = MESBasic_prodtype_prodtype_ptlist_getLayout();
			var node = layout.getNode();
	    	MESBasic.prodtype.prodtype.ptlist.node = node	
			MESBasic.prodtype.prodtype.ptlist.query('query');
			if(modelCode == 'MESBasic_1_prodtype_Prodtype'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			MESBasic.prodtype.prodtype.ptlist.query('query');
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_prodtype_ptlist,js,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_prodtype_ptlist' idprefix='ec_MESBasic_prodtype_prodtype_ptlist' queryUrl='/MESBasic/prodtype/prodtype/ptlist-query.action' queryFunc="MESBasic.prodtype.prodtype.ptlist.query" ns="MESBasic.prodtype.prodtype.ptlist" />
<@exportexcel action="/MESBasic/prodtype/prodtype/ptlist-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_prodtype_ptlist')}" prefix="ec_MESBasic_prodtype_prodtype_ptlist_query"/>
