<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1476667676545')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.product.product','MESBasic.product.product.productPart2');
</script>
<#if permissionCode?? && permissionCode?has_content>
	<#assign buttonPerfix = permissionCode + "_" >
</#if>
<#if viewShowType?? && viewShowType == 'PART'>
<@frameset id="ec_MESBasic_product_product_productPart2_container" border=0>
	<@frame id="ec_MESBasic_product_product_productPart2_container_main"  offsetH=4 region="center" class="center_in">
	<#include "productPart2-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#else>
<#include "productPart2-fastquery-datatable.ftl">
</#if>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_product_productPart2,html,MESBasic_1_product_Product,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.product.product.productPart2._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product.product.productPart2._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product.product.productPart2._prefix += '.';
			}
			MESBasic.product.product.productPart2._prefix += arr[i];
		}
		MESBasic.product.product.productPart2._suffix = arr[arr.length -1];
		if(MESBasic.product.product.productPart2._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product.product.productPart2._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product.product.productPart2._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product.product.productPart2.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.product.product.productPart2.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+MESBasic.product.product.productPart2._prefix + '.' + MESBasic.product.product.productPart2._suffix +'"]').val(obj[0][MESBasic.product.product.productPart2._suffix]);
		CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+MESBasic.product.product.productPart2._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name^="'+MESBasic.product.product.productPart2._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+MESBasic.product.product.productPart2._prefix + '.' + MESBasic.product.product.productPart2._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.product.product.productPart2._dialog) {
			MESBasic.product.product.productPart2._dialog.close();
		}
	};
	
	MESBasic.product.product.productPart2._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product.product.productPart2.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.productPart2.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_product_product_productPart2_refresh = function(node){
	//var url = "/MESBasic/product/product/productPart2-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_product_product_productPart2_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_product_product_productPart2_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.product.product.productPart2.node = node;
	MESBasic.product.product.productPart2.query("query");
}

MESBasic_product_product_productPart2_getList = function() {
	return "MESBasic.product.product.productPart2";
}
MESBasic.product.product.productPart2.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.product.product.productPart2.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.product.product.productPart2.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_product_product_productPart2_fileupload_button",
		handler:function(){
			if($('#MESBasic_product_product_productPart2_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_product_product_productPart2_fileupload"></div>');
			}
			MESBasic.product.product.productPart2.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_product_product_productPart2_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_product_product_productPart2_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.product.product.productPart2.infoDialog.show();
			if($('#MESBasic_product_product_productPart2_fileupload').html() == '') {
				$('#MESBasic_product_product_productPart2_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_product_product&entityCode=MESBasic_1_product&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.product.product.productPart2.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.product.product." + params.viewName + ".referenceCopy");
			funcName('product', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.product.product.productPart2.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.product.product." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.product.product.productPart2.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.product.product." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			/**
			 * 列表新增
			 * @method MESBasic.product.product.productPart2.addproductPart2
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.product.product.productPart2.addproductPart2 = function() {
					var treeParam = "";
					if(typeof MESBasic_product_product_productPart2_getLayout == "function"){
						var layout = MESBasic_product_product_productPart2_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							var modelCode = node.modelCode.replace(/\./g, '\_');
							if(modelCode == 'MESBasic_1_product_Product'.replace(/\./g, '\_')){
								treeParam = '&product.parentId=' + node.id;
							}else{
								treeParam = '&product.' + $('#'+modelCode).val() + '.id=' + node.id;
							}
						}
					}
						var url='/MESBasic/product/product/productEditnew.action?entityCode=MESBasic_1_product' + "&${getPowerCode('${buttonPerfix!}productPart2_add_add_MESBasic_1_product_productPart2')}";
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
			 * @method MESBasic.product.product.productPart2.modifyproductPart2
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.product.product.productPart2.modifyproductPart2 = function() {
				if(MESBasic.product.product.productPart2.checkSelectedAny()){
					if(MESBasic.product.product.productPart2.checkSelectedMore()) {
							openFullScreen('/MESBasic/product/product/productEditnew.action?entityCode=MESBasic_1_product&id=' + MESBasic.product.product.productPart2.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}productPart2_modify_modify_MESBasic_1_product_productPart2')}");
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method MESBasic.product.product.productPart2.dbmodifyproductPart2
			 */
			MESBasic.product.product.productPart2.dbmodifyproductPart2 = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}productPart2_modify_modify_MESBasic_1_product_productPart2";
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}productPart2_modify_modify_MESBasic_1_product_productPart2'] == true) {
					var url = "/MESBasic/product/product/productEditnew.action?entityCode=MESBasic_1_product&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}productPart2_modify_modify_MESBasic_1_product_productPart2')}";
					openFullScreen(url);
					}else {
						var viewUrl = '/MESBasic/product/product/productViewnew.action';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_product&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method MESBasic.product.product.productPart2.delproductPart2
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.product.product.productPart2.delproductPart2 = function(param) {
				if(MESBasic.product.product.productPart2.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('MESBasic.confirmcontent.radion1476003442101')}", function(){
						CUI.post("/MESBasic/product/product/delete.action?ids=" + MESBasic.product.product.productPart2.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}productPart2_delete_del_MESBasic_1_product_productPart2')}", MESBasic.product.product.callBackInfo, "json");
				});
				}
			};
			
		
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.product.product.callBackInfo
	 */
	MESBasic.product.product.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_product_product_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.product.product.productPart2.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_product_product_productPart2_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_product_product_productPart2_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_product_product_productPart2_getLayout == "function"){
							    		var layout = MESBasic_product_product_productPart2_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.product.product.productPart2.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_product_Product'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_product_product_productPart2_getLayout == "function"){
										var layout = MESBasic_product_product_productPart2_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.product.product.productPart2.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.product.product.productPart2.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.product.product.productPart2.query('query');
								    	}
										if(modelCode == 'MESBasic_1_product_Product'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.product.product.productPart2.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.product.product.productPart2.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_product_product_productPart2_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_product_product_productPart2_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_product_product_productPart2_getLayout == "function"){
								    		var layout = MESBasic_product_product_productPart2_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.product.product.productPart2.node = node	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_product_Product'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.product.product.productPart2.node = null;
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_product_product_productPart2_getLayout == "function"){
											var layout = MESBasic_product_product_productPart2_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.product.product.productPart2.node = node	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.product.product.productPart2.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.product.product.productPart2.query('query');
									    	}
											if(modelCode == 'MESBasic_1_product_Product'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.product.product.productPart2.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.product.product.productPart2.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.product.product.productPart2.query('query');
									    	}
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
	 * @method MESBasic.product.product.productPart2.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.product.product.productPart2.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_product_product_productPart2_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_product_product_productPart2_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_product_product_productPart2_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.product.product.productPart2.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.product.product.productPart2.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_product_product_productPart2_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.product.product.productPart2.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.product.product.productPart2.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_product_product_productPart2_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	
	/**
	 * 显示增加对话框
	 * @method MESBasic.product.product.productPart2.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.product.product.productPart2.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.product.product.productPart2.otherParams || {};
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
		if ( MESBasic.product.product.productPart2.Dlg ) {
			MESBasic.product.product.productPart2.Dlg._config.url = url;
			MESBasic.product.product.productPart2.Dlg._config.formId = formId;
			MESBasic.product.product.productPart2.Dlg.setTitle( title )
			MESBasic.product.product.productPart2.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.product.product.productPart2.Dlg =	new CUI.Dialog({
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
		MESBasic.product.product.productPart2.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.product.product.productPart2.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_product_product', element : $('#MESBasic_product_product_productPart2_fileupload_button a:eq(1)')});
		}
		MESBasic.product.product.productPart2.otherParams = {};
	};
	MESBasic.product.product.productPart2.commonQuery = function(type) {
	  if(typeof MESBasic.product.product.productPart2.cancelSelectedNode == 'function') {
	   MESBasic.product.product.productPart2.cancelSelectedNode();
	   MESBasic.product.product.productPart2.node = null;
	  }
	  if(typeof MESBasic_product_product_productPart2_cancelSelectedNode == 'function') {
	   MESBasic_product_product_productPart2_cancelSelectedNode();
	   MESBasic.product.product.productPart2.node = null;
	  }
	  MESBasic.product.product.productPart2.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.product.product.productPart2.query
	 */
	MESBasic.product.product.productPart2.query = function(type,pageNo,sortFlag){
		var node = MESBasic.product.product.productPart2.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.product.product.productPart2.node = null;
		if(!checkListValid("ec_MESBasic_product_product_productPart2_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_product_product_productPart2_query._sortKey && datatable_ec_MESBasic_product_product_productPart2_query._sortMethod){
			CUI('#ec_MESBasic_product_product_productPart2_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_product_product_productPart2_query._sortKey);
			CUI('#ec_MESBasic_product_product_productPart2_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_product_product_productPart2_query._sortColumnName);
			CUI('#ec_MESBasic_product_product_productPart2_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_product_product_productPart2_query._sortMethod);
		}else{
			datatable_ec_MESBasic_product_product_productPart2_query._sortKey = '';
			CUI('#ec_MESBasic_product_product_productPart2_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_product_product_productPart2_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_product_product_productPart2_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/product/product/productPart2-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/product/product/productPart2-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_product_product_productPart2_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_product_productPart2_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_product_product_productPart2_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_product_product_productPart2_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_product_product_productPart2_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_product_productPart2';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_product_product_productPart2_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_product_product_productPart2_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.product.product.productPart2.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_product";
		openExportFrame(url);
	}
MESBasic.product.product.productPart2.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.product.product.productPart2.otherParams = {};
	MESBasic.product.product.productPart2.otherParams.dialogType = dialogType;
	MESBasic.product.product.productPart2.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product.product.productPart2.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.product.product.editCallBackInfo
 */
MESBasic.product.product.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_product_product_productPart2_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_product_product_productPart2_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_product_product_productPart2_getLayout == "function"){
    		var layout = MESBasic_product_product_productPart2_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.product.product.productPart2.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_product_Product'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_product_product_productPart2_queryWidget._sortKey && ec_MESBasic_product_product_productPart2_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_product_product_productPart2_getLayout == "function"){
			var layout = MESBasic_product_product_productPart2_getLayout();
			var node = layout.getNode();
	    	MESBasic.product.product.productPart2.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.product.product.productPart2.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.product.product.productPart2.query('query');
	    	}
			if(modelCode == 'MESBasic_1_product_Product'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.product.product.productPart2.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.product.product.productPart2.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_product_productPart2,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_product_productPart2' idprefix='ec_MESBasic_product_product_productPart2' queryUrl='/MESBasic/product/product/productPart2-query.action' queryFunc="MESBasic.product.product.productPart2.query" ns="MESBasic.product.product.productPart2" />
<@exportexcel action="/MESBasic/product/product/productPart2-query.action"   getRequireDataAction="/MESBasic/product/product/productPart2-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_product_Product&&viewCode=MESBasic_1_product_productPart2" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_product_productPart2')}" prefix="ec_MESBasic_product_product_productPart2_query" modelCode="MESBasic_1_product_Product"  importFlag="false" viewCode="MESBasic_1_product_productPart2" />
