<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1436775112476')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.baseCustomerClass.baseCustomerClass','MESBasic.baseCustomerClass.baseCustomerClass.editPart');
</script>
<#if permissionCode?? && permissionCode?has_content>
	<#assign buttonPerfix = permissionCode + "_" >
</#if>
<#if viewShowType?? && viewShowType == 'PART'>
<@frameset id="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_container" border=0>
	<@frame id="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_container_main"  offsetH=4 region="center" class="center_in">
	<#include "editPart-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#else>
<#include "editPart-fastquery-datatable.ftl">
</#if>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_baseCustomerClass_editPart,html,MESBasic_1_baseCustomerClass_BaseCustomerClass,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.baseCustomerClass.baseCustomerClass.editPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.baseCustomerClass.baseCustomerClass.editPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.baseCustomerClass.baseCustomerClass.editPart._prefix += '.';
			}
			MESBasic.baseCustomerClass.baseCustomerClass.editPart._prefix += arr[i];
		}
		MESBasic.baseCustomerClass.baseCustomerClass.editPart._suffix = arr[arr.length -1];
		if(MESBasic.baseCustomerClass.baseCustomerClass.editPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseCustomerClass.baseCustomerClass.editPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.baseCustomerClass.baseCustomerClass.editPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.baseCustomerClass.baseCustomerClass.editPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+MESBasic.baseCustomerClass.baseCustomerClass.editPart._prefix + '.' + MESBasic.baseCustomerClass.baseCustomerClass.editPart._suffix +'"]').val(obj[0][MESBasic.baseCustomerClass.baseCustomerClass.editPart._suffix]);
		CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+MESBasic.baseCustomerClass.baseCustomerClass.editPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name^="'+MESBasic.baseCustomerClass.baseCustomerClass.editPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+MESBasic.baseCustomerClass.baseCustomerClass.editPart._prefix + '.' + MESBasic.baseCustomerClass.baseCustomerClass.editPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.baseCustomerClass.baseCustomerClass.editPart._dialog) {
			MESBasic.baseCustomerClass.baseCustomerClass.editPart._dialog.close();
		}
	};
	
	MESBasic.baseCustomerClass.baseCustomerClass.editPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseCustomerClass.baseCustomerClass.editPart.query_"+obj+")!='undefined'") ? eval('MESBasic.baseCustomerClass.baseCustomerClass.editPart.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_baseCustomerClass_baseCustomerClass_editPart_refresh = function(node){
	//var url = "/MESBasic/baseCustomerClass/baseCustomerClass/editPart-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = node;
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.query("query");
}

MESBasic_baseCustomerClass_baseCustomerClass_editPart_getList = function() {
	return "MESBasic.baseCustomerClass.baseCustomerClass.editPart";
}
MESBasic.baseCustomerClass.baseCustomerClass.editPart.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.baseCustomerClass.baseCustomerClass.editPart.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload_button",
		handler:function(){
			if($('#MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload"></div>');
			}
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.infoDialog.show();
			if($('#MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload').html() == '') {
				$('#MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_baseCustomerClass_baseCustomerClass&entityCode=MESBasic_1_baseCustomerClass&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.baseCustomerClass.baseCustomerClass.editPart.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseCustomerClass.baseCustomerClass." + params.viewName + ".referenceCopy");
			funcName('baseCustomerClass', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.baseCustomerClass.baseCustomerClass.editPart.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseCustomerClass.baseCustomerClass." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.baseCustomerClass.baseCustomerClass.editPart.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseCustomerClass.baseCustomerClass." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function doAdd(){ 
							
var treeParam = "";
	if(typeof MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout == "function"){
		var layout = MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout();
		var node = layout.getNode();
		if(node == null){
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}else{
			if(!node.isParent){
				var hasCustomer = "";
				$.ajax( {
					type : 'POST',
					async:false,
					url : '/MESBasic/baseCustomerClass/baseCustomerClass/hasCustomer.action',
					data : {
						'customerClassId' : node.id
					},
					success : function(msg) {
				      	hasCustomer =msg.hasCustomerFlag;
				    }
				});
				if(hasCustomer!="" && hasCustomer==1){
					CUI.Dialog.alert("该目录已经存在客户，不能添加子目录，请确认！");
				    return false;
				}
			}
			var modelCode = node.modelCode.replace(".","_");
			if(modelCode == 'MESBasic_1_baseCustomerClass_BaseCustomerClass'.replace(".","_")){
				treeParam = '&baseCustomerClass.parentId=' + node.id;
			}else{
				treeParam = '&baseCustomerClass.' + $('#'+modelCode).val() + '.id=' + node.id;
			}
		}
	}
	var otherParams = {};
	otherParams.dialogType = '2';
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams = otherParams;

	var url='/MESBasic/baseCustomerClass/baseCustomerClass/editCust.action?entityCode=MESBasic_1_baseCustomerClass' + "&${getPowerCode('${buttonPerfix!}editPart_add_add_MESBasic_1_baseCustomerClass_editPart')}";
		<#if businessParam??>
 			url += "&${businessParam}";	
 		</#if>
	if(treeParam!=""){
		url += treeParam;
	}
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.showDialog(url,'MESBasic_baseCustomerClass_baseCustomerClass_editCust_form','${getText('MESBasic.viewtitle.randon1436777620278')}',500,260);

				};
			/**
			 * 列表编辑
			 * @method MESBasic.baseCustomerClass.baseCustomerClass.editPart.modifyeditPart
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.modifyeditPart = function() {
				if(MESBasic.baseCustomerClass.baseCustomerClass.editPart.checkSelectedAny()){
					if(MESBasic.baseCustomerClass.baseCustomerClass.editPart.checkSelectedMore()) {
							var otherParams = {};
							otherParams.dialogType = '3';
							MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams = otherParams;

							MESBasic.baseCustomerClass.baseCustomerClass.editPart.showDialog('/MESBasic/baseCustomerClass/baseCustomerClass/editCust.action?entityCode=MESBasic_1_baseCustomerClass&id=' + MESBasic.baseCustomerClass.baseCustomerClass.editPart.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}editPart_edit_modify_MESBasic_1_baseCustomerClass_editPart')}",'MESBasic_baseCustomerClass_baseCustomerClass_editCust_form','${getText('MESBasic.viewtitle.randon1436777620278')}',500,260);
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method MESBasic.baseCustomerClass.baseCustomerClass.editPart.dbmodifyeditPart
			 */
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.dbmodifyeditPart = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}editPart_edit_modify_MESBasic_1_baseCustomerClass_editPart";
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}editPart_edit_modify_MESBasic_1_baseCustomerClass_editPart'] == true) {
					var url = "/MESBasic/baseCustomerClass/baseCustomerClass/editCust.action?entityCode=MESBasic_1_baseCustomerClass&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}editPart_edit_modify_MESBasic_1_baseCustomerClass_editPart')}";
					var otherParams = {};
					otherParams.dialogType = '3';
					MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams = otherParams;

					MESBasic.baseCustomerClass.baseCustomerClass.editPart.showDialog(url,'MESBasic_baseCustomerClass_baseCustomerClass_editCust_form','${getText('MESBasic.viewtitle.randon1436777620278')}',500,260);
					}else {
						var viewUrl = '';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_baseCustomerClass&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
				function doDel(){ 
							
if(MESBasic.baseCustomerClass.baseCustomerClass.editPart.checkSelectedAny()){
		var delRow = MESBasic.baseCustomerClass.baseCustomerClass.editPart.getOperateRecordId('del').split('@');
		var hasCustomer = "";
		$.ajax( {
			type : 'POST',
			async:false,
			url : '/MESBasic/baseCustomerClass/baseCustomerClass/hasCustomer.action',
			data : {
				'customerClassId' : delRow[0]
			},
			success : function(msg) {
		      	hasCustomer =msg.hasCustomerFlag;
		    }
		});
		if(hasCustomer==1){
			CUI.Dialog.alert("该目录已经存在客户，不能删除，请确认！");
		    return false;
		}
		CUI.Dialog.confirm("${getText('foundation.role.checkdelete')}", function(){	
			CUI.post("/MESBasic/baseCustomerClass/baseCustomerClass/delete.action?ids=" + MESBasic.baseCustomerClass.baseCustomerClass.editPart.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}editPart_delete_del_MESBasic_1_baseCustomerClass_editPart')}", MESBasic.baseCustomerClass.baseCustomerClass.callBackInfo, "json");
		});
	}

				};
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.baseCustomerClass.baseCustomerClass.callBackInfo
	 */
	MESBasic.baseCustomerClass.baseCustomerClass.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_baseCustomerClass_baseCustomerClass_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout == "function"){
							    		var layout = MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortKey && ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_baseCustomerClass_BaseCustomerClass'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortKey && ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortKey && ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout == "function"){
										var layout = MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query');
								    	}
										if(modelCode == 'MESBasic_1_baseCustomerClass_BaseCustomerClass'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query');
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
	 * @method MESBasic.baseCustomerClass.baseCustomerClass.editPart.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.baseCustomerClass.baseCustomerClass.editPart.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.baseCustomerClass.baseCustomerClass.editPart.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	
	/**
	 * 显示增加对话框
	 * @method MESBasic.baseCustomerClass.baseCustomerClass.editPart.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams || {};
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
		if ( MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg ) {
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg._config.url = url;
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg._config.formId = formId;
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg.setTitle( title )
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg =	new CUI.Dialog({
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
		MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.baseCustomerClass.baseCustomerClass.editPart.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_baseCustomerClass_baseCustomerClass', element : $('#MESBasic_baseCustomerClass_baseCustomerClass_editPart_fileupload_button a:eq(1)')});
		}
		MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams = {};
	};
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.commonQuery = function(type) {
	  if(typeof MESBasic.baseCustomerClass.baseCustomerClass.editPart.cancelSelectedNode == 'function') {
	   MESBasic.baseCustomerClass.baseCustomerClass.editPart.cancelSelectedNode();
	   MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = null;
	  }
	  if(typeof MESBasic_baseCustomerClass_baseCustomerClass_editPart_cancelSelectedNode == 'function') {
	   MESBasic_baseCustomerClass_baseCustomerClass_editPart_cancelSelectedNode();
	   MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = null;
	  }
	  MESBasic.baseCustomerClass.baseCustomerClass.editPart.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.baseCustomerClass.baseCustomerClass.editPart.query
	 */
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.query = function(type,pageNo,sortFlag){
		var node = MESBasic.baseCustomerClass.baseCustomerClass.editPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = null;
		if(!checkListValid("ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query._sortKey && datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query._sortMethod){
			CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query._sortKey);
			CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query._sortColumnName);
			CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query._sortMethod);
		}else{
			datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query._sortKey = '';
			CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/baseCustomerClass/baseCustomerClass/editPart-pending.action";
	    } else {
	    	url = "/MESBasic/baseCustomerClass/baseCustomerClass/editPart-query.action";
	    }  
		CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_baseCustomerClass_editPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_baseCustomerClass";
		openExportFrame(url);
	}
MESBasic.baseCustomerClass.baseCustomerClass.editPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams = {};
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams.dialogType = dialogType;
	MESBasic.baseCustomerClass.baseCustomerClass.editPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.baseCustomerClass.baseCustomerClass.editPart.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.baseCustomerClass.baseCustomerClass.editCallBackInfo
 */
MESBasic.baseCustomerClass.baseCustomerClass.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout == "function"){
    		var layout = MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortKey && ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_baseCustomerClass_BaseCustomerClass'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortKey && ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortKey && ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout == "function"){
			var layout = MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout();
			var node = layout.getNode();
	    	MESBasic.baseCustomerClass.baseCustomerClass.editPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query');
	    	}
			if(modelCode == 'MESBasic_1_baseCustomerClass_BaseCustomerClass'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}
var bapS2EditCallBackInfo = MESBasic.baseCustomerClass.baseCustomerClass.editCallBackInfo;


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_baseCustomerClass_editPart,js,MESBasic_1_baseCustomerClass_BaseCustomerClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_baseCustomerClass_editPart' idprefix='ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart' queryUrl='/MESBasic/baseCustomerClass/baseCustomerClass/editPart-query.action' queryFunc="MESBasic.baseCustomerClass.baseCustomerClass.editPart.query" ns="MESBasic.baseCustomerClass.baseCustomerClass.editPart" />
<@exportexcel action="/MESBasic/baseCustomerClass/baseCustomerClass/editPart-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_baseCustomerClass_editPart')}" prefix="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query"/>
