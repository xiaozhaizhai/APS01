<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('MESBasic.viewtitle.radion1415321151720')}</title>
<body id="dialog_page">
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.material.material','MESBasic.material.material.materialList');
</script>
<@frameset id="ec_MESBasic_material_material_materialList_container" border=0>
	<@frame id="ec_MESBasic_material_material_materialList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "materialList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_material_materialList,html,MESBasic_1_material_Material,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.material.material.materialList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.material.material.materialList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.material.material.materialList._prefix += '.';
			}
			MESBasic.material.material.materialList._prefix += arr[i];
		}
		MESBasic.material.material.materialList._suffix = arr[arr.length -1];
		if(MESBasic.material.material.materialList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.material.material.materialList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.material.material.materialList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.material.material.materialList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.material.material.materialList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+MESBasic.material.material.materialList._prefix + '.' + MESBasic.material.material.materialList._suffix +'"]').val(obj[0][MESBasic.material.material.materialList._suffix]);
		CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+MESBasic.material.material.materialList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_material_material_materialList_queryForm *[name^="'+MESBasic.material.material.materialList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+MESBasic.material.material.materialList._prefix + '.' + MESBasic.material.material.materialList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.material.material.materialList._dialog) {
			MESBasic.material.material.materialList._dialog.close();
		}
	};
	
	MESBasic.material.material.materialList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.material.material.materialList.query_"+obj+")!='undefined'") ? eval('MESBasic.material.material.materialList.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_material_material_materialList_refresh = function(node){
	//var url = "/MESBasic/material/material/materialList-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_material_material_materialList_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_material_material_materialList_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.material.material.materialList.node = node;
	MESBasic.material.material.materialList.query("query");
}

MESBasic_material_material_materialList_getList = function() {
	return "MESBasic.material.material.materialList";
}
MESBasic.material.material.materialList.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.material.material.materialList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.material.material.materialList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_material_material_materialList_fileupload_button",
		handler:function(){
			if($('#MESBasic_material_material_materialList_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_material_material_materialList_fileupload"></div>');
			}
			MESBasic.material.material.materialList.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_material_material_materialList_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_material_material_materialList_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.material.material.materialList.infoDialog.show();
			if($('#MESBasic_material_material_materialList_fileupload').html() == '') {
				$('#MESBasic_material_material_materialList_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_material_material&entityCode=MESBasic_1_material&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.material.material.materialList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.material.material." + params.viewName + ".referenceCopy");
			funcName('material', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.material.material.materialList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.material.material." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.material.material.materialList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("MESBasic.material.material." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			/**
			 * 列表新增
			 * @method MESBasic.material.material.materialList.addmaterialList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.material.material.materialList.addmaterialList = function() {
					var treeParam = "";
					if(typeof MESBasic_material_material_materialList_getLayout == "function"){
						var layout = MESBasic_material_material_materialList_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							var modelCode = node.modelCode.replace(".","_");
							if(modelCode == 'MESBasic_1_material_Material'.replace(".","_")){
								treeParam = '&material.parentId=' + node.id;
							}else{
								treeParam = '&material.' + $('#'+modelCode).val() + '.id=' + node.id;
							}
						}
					}
						var url='/MESBasic/material/material/materialEdit.action?entityCode=MESBasic_1_material' + "&${getPowerCode('${buttonPerfix!}materialList_materialNew_add_MESBasic_1_material_materialList')}";
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
			 * @method MESBasic.material.material.materialList.modifymaterialList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.material.material.materialList.modifymaterialList = function() {
				if(MESBasic.material.material.materialList.checkSelectedAny()){
					if(MESBasic.material.material.materialList.checkSelectedMore()) {
							openFullScreen('/MESBasic/material/material/materialEdit.action?entityCode=MESBasic_1_material&id=' + MESBasic.material.material.materialList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}materialList_materialEdit_modify_MESBasic_1_material_materialList')}");
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method MESBasic.material.material.materialList.dbmodifymaterialList
			 */
			MESBasic.material.material.materialList.dbmodifymaterialList = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}materialList_materialEdit_modify_MESBasic_1_material_materialList";
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}materialList_materialEdit_modify_MESBasic_1_material_materialList'] == true) {
					var url = "/MESBasic/material/material/materialEdit.action?entityCode=MESBasic_1_material&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}materialList_materialEdit_modify_MESBasic_1_material_materialList')}";
					openFullScreen(url);
					}else {
						var viewUrl = '/MESBasic/material/material/materialView.action';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_material&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method MESBasic.material.material.materialList.delmaterialList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.material.material.materialList.delmaterialList = function(param) {
				if(MESBasic.material.material.materialList.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('MESBasic.confirmcontent.radion1415321243468')}", function(){
						CUI.post("/MESBasic/material/material/delete.action?ids=" + MESBasic.material.material.materialList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}materialList_materialDel_del_MESBasic_1_material_materialList')}", MESBasic.material.material.callBackInfo, "json");
				});
				}
			};
			
		
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.material.material.callBackInfo
	 */
	MESBasic.material.material.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_material_material_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.material.material.materialList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_material_material_materialList_query.get('queryFunc');
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_material_material_materialList_getLayout == "function"){
							    		var layout = MESBasic_material_material_materialList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.material.material.materialList.node = node	
										eval(queryFunc);
										if(modelCode == 'MESBasic_1_material_Material'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		eval(queryFunc);
							    	}			
								} else {
									if(typeof MESBasic_material_material_materialList_getLayout == "function"){
										var layout = MESBasic_material_material_materialList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.material.material.materialList.node = node	
										MESBasic.material.material.materialList.query('query');
										if(modelCode == 'MESBasic_1_material_Material'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										MESBasic.material.material.materialList.query('query');
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_material_material_materialList_query.get('queryFunc');
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_material_material_materialList_getLayout == "function"){
								    		var layout = MESBasic_material_material_materialList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.material.material.materialList.node = node	
											eval(queryFunc);
											if(modelCode == 'MESBasic_1_material_Material'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.material.material.materialList.node = null;
											}
								    	}else{
								    		eval(queryFunc);
								    	}
									} else {
										if(typeof MESBasic_material_material_materialList_getLayout == "function"){
											var layout = MESBasic_material_material_materialList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.material.material.materialList.node = node	
											MESBasic.material.material.materialList.query('query');
											if(modelCode == 'MESBasic_1_material_Material'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.material.material.materialList.node = null;
											}
										}else{
											MESBasic.material.material.materialList.query('query');
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
	 * @method MESBasic.material.material.materialList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.material.material.materialList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_material_material_materialList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_material_material_materialList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_material_material_materialList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.material.material.materialList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.material.material.materialList.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_material_material_materialList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.material.material.materialList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.material.material.materialList.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_material_material_materialList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	
	/**
	 * 显示增加对话框
	 * @method MESBasic.material.material.materialList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.material.material.materialList.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.material.material.materialList.otherParams || {};
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
		MESBasic.material.material.materialList.Dlg =	new CUI.Dialog({
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
		MESBasic.material.material.materialList.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_material_material', element : $('#MESBasic_material_material_materialList_fileupload_button a:eq(1)')});
		}
		MESBasic.material.material.materialList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.material.material.materialList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.material.material.materialList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.material.material.materialList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.material.material.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.material.material.materialList.AppDlg.show();
	};
	MESBasic.material.material.materialList.commonQuery = function(type) {
	  if(typeof MESBasic.material.material.materialList.cancelSelectedNode == 'function') {
	   MESBasic.material.material.materialList.cancelSelectedNode();
	   MESBasic.material.material.materialList.node = null;
	  }
	  if(typeof MESBasic_material_material_materialList_cancelSelectedNode == 'function') {
	   MESBasic_material_material_materialList_cancelSelectedNode();
	   MESBasic.material.material.materialList.node = null;
	  }
	  MESBasic.material.material.materialList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.material.material.materialList.query
	 */
	MESBasic.material.material.materialList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.material.material.materialList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.material.material.materialList.node = null;
		if(!checkListValid("ec_MESBasic_material_material_materialList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_material_material_materialList_query._sortKey && datatable_ec_MESBasic_material_material_materialList_query._sortMethod){
			CUI('#ec_MESBasic_material_material_materialList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_material_material_materialList_query._sortKey);
			CUI('#ec_MESBasic_material_material_materialList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_material_material_materialList_query._sortColumnName);
			CUI('#ec_MESBasic_material_material_materialList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_material_material_materialList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_material_material_materialList_query._sortKey = '';
			CUI('#ec_MESBasic_material_material_materialList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_material_material_materialList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_material_material_materialList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/material/material/materialList-pending.action";
	    } else {
	    	url = "/MESBasic/material/material/materialList-query.action";
	    }  
		CUI('#ec_MESBasic_material_material_materialList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_material_material_materialList_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_material_material_materialList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_material_material_materialList_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_material_material_materialList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_material_materialList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_material_material_materialList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_material_material_materialList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.material.material.materialList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_material";
		openExportFrame(url);
	}
MESBasic.material.material.materialList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.material.material.materialList.otherParams = {};
	MESBasic.material.material.materialList.otherParams.dialogType = dialogType;
	MESBasic.material.material.materialList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.material.material.materialList.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.material.material.editCallBackInfo
 */
MESBasic.material.material.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_material_material_materialList_query.get('queryFunc');
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_material_material_materialList_getLayout == "function"){
    		var layout = MESBasic_material_material_materialList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.material.material.materialList.node = node	
			eval(queryFunc);
			if(modelCode == 'MESBasic_1_material_Material'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		eval(queryFunc);
    	}			
	} else {
		if(typeof MESBasic_material_material_materialList_getLayout == "function"){
			var layout = MESBasic_material_material_materialList_getLayout();
			var node = layout.getNode();
	    	MESBasic.material.material.materialList.node = node	
			MESBasic.material.material.materialList.query('query');
			if(modelCode == 'MESBasic_1_material_Material'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			MESBasic.material.material.materialList.query('query');
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_material_materialList,js,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_material_materialList' idprefix='ec_MESBasic_material_material_materialList' queryUrl='/MESBasic/material/material/materialList-query.action' queryFunc="MESBasic.material.material.materialList.query" ns="MESBasic.material.material.materialList" />
<@exportexcel action="/MESBasic/material/material/materialList-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_material_materialList')}" prefix="ec_MESBasic_material_material_materialList_query"/>
