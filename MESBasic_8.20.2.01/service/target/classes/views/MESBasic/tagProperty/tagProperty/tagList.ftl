<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('MESBasic.viewtitle.radion1414992768949')}</title>
<body id="dialog_page">
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.tagProperty.tagProperty','MESBasic.tagProperty.tagProperty.tagList');
</script>
<@frameset id="ec_MESBasic_tagProperty_tagProperty_tagList_container" border=0>
	<@frame id="ec_MESBasic_tagProperty_tagProperty_tagList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "tagList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_tagProperty_tagList,html,MESBasic_1_tagProperty_TagProperty,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.tagProperty.tagProperty.tagList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.tagProperty.tagProperty.tagList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.tagProperty.tagProperty.tagList._prefix += '.';
			}
			MESBasic.tagProperty.tagProperty.tagList._prefix += arr[i];
		}
		MESBasic.tagProperty.tagProperty.tagList._suffix = arr[arr.length -1];
		if(MESBasic.tagProperty.tagProperty.tagList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.tagProperty.tagProperty.tagList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.tagProperty.tagProperty.tagList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.tagProperty.tagProperty.tagList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.tagProperty.tagProperty.tagList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+MESBasic.tagProperty.tagProperty.tagList._prefix + '.' + MESBasic.tagProperty.tagProperty.tagList._suffix +'"]').val(obj[0][MESBasic.tagProperty.tagProperty.tagList._suffix]);
		CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+MESBasic.tagProperty.tagProperty.tagList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name^="'+MESBasic.tagProperty.tagProperty.tagList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+MESBasic.tagProperty.tagProperty.tagList._prefix + '.' + MESBasic.tagProperty.tagProperty.tagList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.tagProperty.tagProperty.tagList._dialog) {
			MESBasic.tagProperty.tagProperty.tagList._dialog.close();
		}
	};
	
	MESBasic.tagProperty.tagProperty.tagList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.tagProperty.tagProperty.tagList.query_"+obj+")!='undefined'") ? eval('MESBasic.tagProperty.tagProperty.tagList.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_tagProperty_tagProperty_tagList_refresh = function(node){
	//var url = "/MESBasic/tagProperty/tagProperty/tagList-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.tagProperty.tagProperty.tagList.node = node;
	MESBasic.tagProperty.tagProperty.tagList.query("query");
}

MESBasic_tagProperty_tagProperty_tagList_getList = function() {
	return "MESBasic.tagProperty.tagProperty.tagList";
}
MESBasic.tagProperty.tagProperty.tagList.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.tagProperty.tagProperty.tagList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.tagProperty.tagProperty.tagList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_tagProperty_tagProperty_tagList_fileupload_button",
		handler:function(){
			if($('#MESBasic_tagProperty_tagProperty_tagList_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_tagProperty_tagProperty_tagList_fileupload"></div>');
			}
			MESBasic.tagProperty.tagProperty.tagList.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_tagProperty_tagProperty_tagList_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_tagProperty_tagProperty_tagList_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.tagProperty.tagProperty.tagList.infoDialog.show();
			if($('#MESBasic_tagProperty_tagProperty_tagList_fileupload').html() == '') {
				$('#MESBasic_tagProperty_tagProperty_tagList_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_tagProperty_tagProperty&entityCode=MESBasic_1_tagProperty&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.tagProperty.tagProperty.tagList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.tagProperty.tagProperty." + params.viewName + ".referenceCopy");
			funcName('tagProperty', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.tagProperty.tagProperty.tagList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.tagProperty.tagProperty." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.tagProperty.tagProperty.tagList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.tagProperty.tagProperty." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			/**
			 * 列表新增
			 * @method MESBasic.tagProperty.tagProperty.tagList.addtagList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.tagProperty.tagProperty.tagList.addtagList = function() {
					var treeParam = "";
					if(typeof MESBasic_tagProperty_tagProperty_tagList_getLayout == "function"){
						var layout = MESBasic_tagProperty_tagProperty_tagList_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							var modelCode = node.modelCode.replace(".","_");
							if(modelCode == 'MESBasic_1_tagProperty_TagProperty'.replace(".","_")){
								treeParam = '&tagProperty.parentId=' + node.id;
							}else{
								treeParam = '&tagProperty.' + $('#'+modelCode).val() + '.id=' + node.id;
							}
						}
					}
						var url='/MESBasic/tagProperty/tagProperty/tagEdit.action?entityCode=MESBasic_1_tagProperty' + "&${getPowerCode('${buttonPerfix!}tagList_tagNew_add_MESBasic_1_tagProperty_tagList')}";
						if(treeParam!=""){
				 			url += treeParam;
				 		}
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
						openFullScreen(url);
			};
			
			/**
			 * 列表编辑
			 * @method MESBasic.tagProperty.tagProperty.tagList.modifytagList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.tagProperty.tagProperty.tagList.modifytagList = function() {
				if(MESBasic.tagProperty.tagProperty.tagList.checkSelectedAny()){
					if(MESBasic.tagProperty.tagProperty.tagList.checkSelectedMore()) {
							openFullScreen('/MESBasic/tagProperty/tagProperty/tagEdit.action?entityCode=MESBasic_1_tagProperty&id=' + MESBasic.tagProperty.tagProperty.tagList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}tagList_tagEdit_modify_MESBasic_1_tagProperty_tagList')}");
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method MESBasic.tagProperty.tagProperty.tagList.dbmodifytagList
			 */
			MESBasic.tagProperty.tagProperty.tagList.dbmodifytagList = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}tagList_tagEdit_modify_MESBasic_1_tagProperty_tagList";
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}tagList_tagEdit_modify_MESBasic_1_tagProperty_tagList'] == true) {
					var url = "/MESBasic/tagProperty/tagProperty/tagEdit.action?entityCode=MESBasic_1_tagProperty&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}tagList_tagEdit_modify_MESBasic_1_tagProperty_tagList')}";
					openFullScreen(url);
					}else {
						var viewUrl = '/MESBasic/tagProperty/tagProperty/tagView.action';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_tagProperty&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method MESBasic.tagProperty.tagProperty.tagList.deltagList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.tagProperty.tagProperty.tagList.deltagList = function(param) {
				if(MESBasic.tagProperty.tagProperty.tagList.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('MESBasic.confirmcontent.radion1414992984702')}", function(){
						CUI.post("/MESBasic/tagProperty/tagProperty/delete.action?ids=" + MESBasic.tagProperty.tagProperty.tagList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}tagList_tagDel_del_MESBasic_1_tagProperty_tagList')}", MESBasic.tagProperty.tagProperty.callBackInfo, "json");
				});
				}
			};
			
		
			var tagList_importtagList_importDialog = null;
			MESBasic.tagProperty.tagProperty.tagList.importtagList = function(){
				try{
					if(tagList_importtagList_importDialog!=null&&tagList_importtagList_importDialog.isShow==1){
						return false;
					}
					var queryFunc = datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.get('queryFunc');
					var url = "/MESBasic/tagProperty/tagProperty/initMainImport.action?viewCode=MESBasic_1_tagProperty_tagList&callBackFuncName=" + queryFunc;
					tagList_importtagList_importDialog = new CUI.Dialog({
						title: "${getHtmlText('common.button.import')}",
						url:url,
						modal:true,
						description:'',
						height:'330',
						width: '420',
						dragable:true,
						buttons:[{id:"replaceAndImport",display:'hidden',name:"${getHtmlText('common.button.import.replace')}",handler:function(){foundation.importExcel.submitImportForm(true,false);}},{id:"ignoreAndImport",display:'hidden',name:"${getHtmlText('common.button.import.ignore')}",handler:function(){foundation.importExcel.submitImportForm(false,true);}},{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){foundation.importExcel.submitImportForm(false,false);}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();tagList_importtagList_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();tagList_importtagList_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
						beforeCloseEvent:function(){$('#importResponse').remove();}
					});
					tagList_importtagList_importDialog.show();
				}catch(e){}
			}
			
			MESBasic.tagProperty.tagProperty.tagList.downloadTemplatetagList = function(){
				var url = "/MESBasic/tagProperty/tagProperty/templateDownLoad.action?viewCode=MESBasic_1_tagProperty_tagList&downloadType=mainTemplate&fileName=MESBasic_1_tagProperty_tagList-importTemplate.xls";
				window.open(url,"","");
			}
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.tagProperty.tagProperty.callBackInfo
	 */
	MESBasic.tagProperty.tagProperty.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_tagProperty_tagProperty_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.tagProperty.tagProperty.tagList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.get('queryFunc');
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_tagProperty_tagProperty_tagList_getLayout == "function"){
							    		var layout = MESBasic_tagProperty_tagProperty_tagList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.tagProperty.tagProperty.tagList.node = node	
										eval(queryFunc);
										if(modelCode == 'MESBasic_1_tagProperty_TagProperty'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		eval(queryFunc);
							    	}			
								} else {
									if(typeof MESBasic_tagProperty_tagProperty_tagList_getLayout == "function"){
										var layout = MESBasic_tagProperty_tagProperty_tagList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.tagProperty.tagProperty.tagList.node = node	
										MESBasic.tagProperty.tagProperty.tagList.query('query');
										if(modelCode == 'MESBasic_1_tagProperty_TagProperty'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										MESBasic.tagProperty.tagProperty.tagList.query('query');
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.get('queryFunc');
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_tagProperty_tagProperty_tagList_getLayout == "function"){
								    		var layout = MESBasic_tagProperty_tagProperty_tagList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.tagProperty.tagProperty.tagList.node = node	
											eval(queryFunc);
											if(modelCode == 'MESBasic_1_tagProperty_TagProperty'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.tagProperty.tagProperty.tagList.node = null;
											}
								    	}else{
								    		eval(queryFunc);
								    	}
									} else {
										if(typeof MESBasic_tagProperty_tagProperty_tagList_getLayout == "function"){
											var layout = MESBasic_tagProperty_tagProperty_tagList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.tagProperty.tagProperty.tagList.node = node	
											MESBasic.tagProperty.tagProperty.tagList.query('query');
											if(modelCode == 'MESBasic_1_tagProperty_TagProperty'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.tagProperty.tagProperty.tagList.node = null;
											}
										}else{
											MESBasic.tagProperty.tagProperty.tagList.query('query');
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
	 * @method MESBasic.tagProperty.tagProperty.tagList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.tagProperty.tagProperty.tagList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.tagProperty.tagProperty.tagList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.tagProperty.tagProperty.tagList.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.tagProperty.tagProperty.tagList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.tagProperty.tagProperty.tagList.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	
	/**
	 * 显示增加对话框
	 * @method MESBasic.tagProperty.tagProperty.tagList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.tagProperty.tagProperty.tagList.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.tagProperty.tagProperty.tagList.otherParams || {};
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
		MESBasic.tagProperty.tagProperty.tagList.Dlg =	new CUI.Dialog({
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
		MESBasic.tagProperty.tagProperty.tagList.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_tagProperty_tagProperty', element : $('#MESBasic_tagProperty_tagProperty_tagList_fileupload_button a:eq(1)')});
		}
		MESBasic.tagProperty.tagProperty.tagList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.tagProperty.tagProperty.tagList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.tagProperty.tagProperty.tagList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.tagProperty.tagProperty.tagList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.tagProperty.tagProperty.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.tagProperty.tagProperty.tagList.AppDlg.show();
	};
	MESBasic.tagProperty.tagProperty.tagList.commonQuery = function(type) {
	  if(typeof MESBasic.tagProperty.tagProperty.tagList.cancelSelectedNode == 'function') {
	   MESBasic.tagProperty.tagProperty.tagList.cancelSelectedNode();
	   MESBasic.tagProperty.tagProperty.tagList.node = null;
	  }
	  if(typeof MESBasic_tagProperty_tagProperty_tagList_cancelSelectedNode == 'function') {
	   MESBasic_tagProperty_tagProperty_tagList_cancelSelectedNode();
	   MESBasic.tagProperty.tagProperty.tagList.node = null;
	  }
	  MESBasic.tagProperty.tagProperty.tagList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.tagProperty.tagProperty.tagList.query
	 */
	MESBasic.tagProperty.tagProperty.tagList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.tagProperty.tagProperty.tagList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.tagProperty.tagProperty.tagList.node = null;
		if(!checkListValid("ec_MESBasic_tagProperty_tagProperty_tagList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query._sortKey && datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query._sortMethod){
			CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query._sortKey);
			CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query._sortColumnName);
			CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query._sortKey = '';
			CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/tagProperty/tagProperty/tagList-pending.action";
	    } else {
	    	url = "/MESBasic/tagProperty/tagProperty/tagList-query.action";
	    }  
		CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_tagProperty_tagProperty_tagList_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_tagProperty_tagProperty_tagList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_tagProperty_tagList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.tagProperty.tagProperty.tagList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_tagProperty";
		openExportFrame(url);
	}
MESBasic.tagProperty.tagProperty.tagList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.tagProperty.tagProperty.tagList.otherParams = {};
	MESBasic.tagProperty.tagProperty.tagList.otherParams.dialogType = dialogType;
	MESBasic.tagProperty.tagProperty.tagList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.tagProperty.tagProperty.tagList.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.tagProperty.tagProperty.editCallBackInfo
 */
MESBasic.tagProperty.tagProperty.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_tagProperty_tagProperty_tagList_query.get('queryFunc');
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_tagProperty_tagProperty_tagList_getLayout == "function"){
    		var layout = MESBasic_tagProperty_tagProperty_tagList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.tagProperty.tagProperty.tagList.node = node	
			eval(queryFunc);
			if(modelCode == 'MESBasic_1_tagProperty_TagProperty'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		eval(queryFunc);
    	}			
	} else {
		if(typeof MESBasic_tagProperty_tagProperty_tagList_getLayout == "function"){
			var layout = MESBasic_tagProperty_tagProperty_tagList_getLayout();
			var node = layout.getNode();
	    	MESBasic.tagProperty.tagProperty.tagList.node = node	
			MESBasic.tagProperty.tagProperty.tagList.query('query');
			if(modelCode == 'MESBasic_1_tagProperty_TagProperty'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			MESBasic.tagProperty.tagProperty.tagList.query('query');
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_tagProperty_tagList,js,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_tagProperty_tagList' idprefix='ec_MESBasic_tagProperty_tagProperty_tagList' queryUrl='/MESBasic/tagProperty/tagProperty/tagList-query.action' queryFunc="MESBasic.tagProperty.tagProperty.tagList.query" ns="MESBasic.tagProperty.tagProperty.tagList" />
<@exportexcel action="/MESBasic/tagProperty/tagProperty/tagList-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_tagProperty_tagList')}" prefix="ec_MESBasic_tagProperty_tagProperty_tagList_query"/>
