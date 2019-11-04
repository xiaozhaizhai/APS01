<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1436842127173')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.baseCustomer.baseCustomer','MESBasic.baseCustomer.baseCustomer.custlist');
</script>
<#if permissionCode?? && permissionCode?has_content>
	<#assign buttonPerfix = permissionCode + "_" >
</#if>
<#if viewShowType?? && viewShowType == 'PART'>
<@frameset id="ec_MESBasic_baseCustomer_baseCustomer_custlist_container" border=0>
	<@frame id="ec_MESBasic_baseCustomer_baseCustomer_custlist_container_main"  offsetH=4 region="center" class="center_in">
	<#include "custlist-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#else>
<#include "custlist-fastquery-datatable.ftl">
</#if>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_baseCustomer_custlist,html,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-enable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -22px;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}
</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.baseCustomer.baseCustomer.custlist._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.baseCustomer.baseCustomer.custlist._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.baseCustomer.baseCustomer.custlist._prefix += '.';
			}
			MESBasic.baseCustomer.baseCustomer.custlist._prefix += arr[i];
		}
		MESBasic.baseCustomer.baseCustomer.custlist._suffix = arr[arr.length -1];
		if(MESBasic.baseCustomer.baseCustomer.custlist._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseCustomer.baseCustomer.custlist._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.baseCustomer.baseCustomer.custlist._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.baseCustomer.baseCustomer.custlist.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.baseCustomer.baseCustomer.custlist.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.custlist._prefix + '.' + MESBasic.baseCustomer.baseCustomer.custlist._suffix +'"]').val(obj[0][MESBasic.baseCustomer.baseCustomer.custlist._suffix]);
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.custlist._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name^="'+MESBasic.baseCustomer.baseCustomer.custlist._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.custlist._prefix + '.' + MESBasic.baseCustomer.baseCustomer.custlist._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.baseCustomer.baseCustomer.custlist._dialog) {
			MESBasic.baseCustomer.baseCustomer.custlist._dialog.close();
		}
	};
	
	MESBasic.baseCustomer.baseCustomer.custlist._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseCustomer.baseCustomer.custlist.query_"+obj+")!='undefined'") ? eval('MESBasic.baseCustomer.baseCustomer.custlist.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_baseCustomer_baseCustomer_custlist_refresh = function(node){
	//var url = "/MESBasic/baseCustomer/baseCustomer/custlist-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.baseCustomer.baseCustomer.custlist.node = node;
	MESBasic.baseCustomer.baseCustomer.custlist.query("query");
}

MESBasic_baseCustomer_baseCustomer_custlist_getList = function() {
	return "MESBasic.baseCustomer.baseCustomer.custlist";
}
MESBasic.baseCustomer.baseCustomer.custlist.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.baseCustomer.baseCustomer.custlist.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.custlist.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_baseCustomer_baseCustomer_custlist_fileupload_button",
		handler:function(){
			if($('#MESBasic_baseCustomer_baseCustomer_custlist_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_baseCustomer_baseCustomer_custlist_fileupload"></div>');
			}
			MESBasic.baseCustomer.baseCustomer.custlist.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_baseCustomer_baseCustomer_custlist_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_baseCustomer_baseCustomer_custlist_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.baseCustomer.baseCustomer.custlist.infoDialog.show();
			if($('#MESBasic_baseCustomer_baseCustomer_custlist_fileupload').html() == '') {
				$('#MESBasic_baseCustomer_baseCustomer_custlist_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_baseCustomer_baseCustomer&entityCode=MESBasic_1_baseCustomer&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.custlist.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseCustomer.baseCustomer." + params.viewName + ".referenceCopy");
			funcName('baseCustomer', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.custlist.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseCustomer.baseCustomer." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.custlist.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate.MESBasic.baseCustomer.baseCustomer." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function doAdd(){ 
							
var treeParam = "";
	if(typeof MESBasic_baseCustomer_baseCustomer_custlist_getLayout == "function"){
		var layout = MESBasic_baseCustomer_baseCustomer_custlist_getLayout();
		var node = layout.getNode();
		if(node == null){
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}else{
			if(node.isParent){
                CUI.Dialog.alert("请选择末级节点新增客户，请确认！");
                return false;
            }
			var modelCode = node.modelCode.replace(".","_");
			if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'.replace(".","_")){
				treeParam = '&baseCustomer.parentId=' + node.id;
			}else{
				treeParam = '&baseCustomer.' + $('#'+modelCode).val() + '.id=' + node.id;
			}
		}
	}
	var url='/MESBasic/baseCustomer/baseCustomer/custEdit.action?entityCode=MESBasic_1_baseCustomer' + "&${getPowerCode('${buttonPerfix!}custlist_add_add_MESBasic_1_baseCustomer_custlist')}";
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
			 * @method MESBasic.baseCustomer.baseCustomer.custlist.modifycustlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.baseCustomer.baseCustomer.custlist.modifycustlist = function() {
				if(MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedAny()){
					if(MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedMore()) {
							openFullScreen('/MESBasic/baseCustomer/baseCustomer/custEdit.action?entityCode=MESBasic_1_baseCustomer&id=' + MESBasic.baseCustomer.baseCustomer.custlist.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}custlist_modify_modify_MESBasic_1_baseCustomer_custlist')}");
					}
				}
			};
			
			/**
			 * 双击修改数据
			 * @method MESBasic.baseCustomer.baseCustomer.custlist.dbmodifycustlist
			 */
			MESBasic.baseCustomer.baseCustomer.custlist.dbmodifycustlist = function(event,oRow){
				var checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}custlist_modify_modify_MESBasic_1_baseCustomer_custlist";
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}custlist_modify_modify_MESBasic_1_baseCustomer_custlist'] == true) {
					var url = "/MESBasic/baseCustomer/baseCustomer/custEdit.action?entityCode=MESBasic_1_baseCustomer&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}custlist_modify_modify_MESBasic_1_baseCustomer_custlist')}";
					openFullScreen(url);
					}else {
						var viewUrl = '';
						if(viewUrl == ''){
							CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_baseCustomer&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/**
			 * 列表删除
			 * @method MESBasic.baseCustomer.baseCustomer.custlist.delcustlist
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.baseCustomer.baseCustomer.custlist.delcustlist = function(param) {
				if(MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedAny()){
					CUI.Dialog.confirm("${getText('foundation.role.checkdelete')}", function(){	
						CUI.post("/MESBasic/baseCustomer/baseCustomer/delete.action?ids=" + MESBasic.baseCustomer.baseCustomer.custlist.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}custlist_delete_del_MESBasic_1_baseCustomer_custlist')}", MESBasic.baseCustomer.baseCustomer.callBackInfo, "json");
				});
				}
			};
			
		
				function doEnableCustomer(){ 
							 
	if(MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedAny()){
		if(MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedMore()) {
			var customerState = getCustomerState();
			if(customerState=="customerState/1"){
				CUI.Dialog.alert("已经是启用状态！");
		    	return false;
			}
			CUI.Dialog.confirm("${getText('foundation.role.doEnableCustomer')}", function(){
				var customerId = MESBasic.baseCustomer.baseCustomer.custlist.getOperateRecordId();
				$.ajax( {
					type : 'POST',
					async:false,
					url : '/MESBasic/baseCustomer/baseCustomer/doEnableCustomer.action',
					data : {
						'customerId' : customerId
					},
					success : function(msg) {
						MESBasic.baseCustomer.baseCustomer.custlist.query('query');
					}
				});
			});
		}
	}

				};
				function doDisableCustomer(){ 
							 
	if(MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedAny()){
		if(MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedMore()) {
			var customerState = getCustomerState();
			if(customerState=="customerState/0"){
				CUI.Dialog.alert("已经是停用状态！");
		    	return false;
			}
			CUI.Dialog.confirm("${getText('foundation.role.doDisableCustomer')}", function(){
				var customerId = MESBasic.baseCustomer.baseCustomer.custlist.getOperateRecordId();
				$.ajax( {
					type : 'POST',
					async:false,
					url : '/MESBasic/baseCustomer/baseCustomer/doDisableCustomer.action',
					data : {
						'customerId' : customerId
					},
					success : function(msg) {
						MESBasic.baseCustomer.baseCustomer.custlist.query('query');
					}
				});
			});
		}
	}

				};
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.baseCustomer.baseCustomer.callBackInfo
	 */
	MESBasic.baseCustomer.baseCustomer.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_baseCustomer_baseCustomer_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.baseCustomer.baseCustomer.custlist.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_baseCustomer_baseCustomer_custlist_getLayout == "function"){
							    		var layout = MESBasic_baseCustomer_baseCustomer_custlist_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.baseCustomer.baseCustomer.custlist.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_baseCustomer_baseCustomer_custlist_getLayout == "function"){
										var layout = MESBasic_baseCustomer_baseCustomer_custlist_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.baseCustomer.baseCustomer.custlist.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.baseCustomer.baseCustomer.custlist.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.baseCustomer.baseCustomer.custlist.query('query');
								    	}
										if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.baseCustomer.baseCustomer.custlist.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.baseCustomer.baseCustomer.custlist.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_baseCustomer_baseCustomer_custlist_getLayout == "function"){
								    		var layout = MESBasic_baseCustomer_baseCustomer_custlist_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.baseCustomer.baseCustomer.custlist.node = node	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.baseCustomer.baseCustomer.custlist.node = null;
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_baseCustomer_baseCustomer_custlist_getLayout == "function"){
											var layout = MESBasic_baseCustomer_baseCustomer_custlist_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.baseCustomer.baseCustomer.custlist.node = node	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.baseCustomer.baseCustomer.custlist.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.baseCustomer.baseCustomer.custlist.query('query');
									    	}
											if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.baseCustomer.baseCustomer.custlist.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.baseCustomer.baseCustomer.custlist.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.baseCustomer.baseCustomer.custlist.query('query');
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
	 * @method MESBasic.baseCustomer.baseCustomer.custlist.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.baseCustomer.baseCustomer.custlist.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.baseCustomer.baseCustomer.custlist.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};


	
	/**
	 * 显示增加对话框
	 * @method MESBasic.baseCustomer.baseCustomer.custlist.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.baseCustomer.baseCustomer.custlist.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.baseCustomer.baseCustomer.custlist.otherParams || {};
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
		if ( MESBasic.baseCustomer.baseCustomer.custlist.Dlg ) {
			MESBasic.baseCustomer.baseCustomer.custlist.Dlg._config.url = url;
			MESBasic.baseCustomer.baseCustomer.custlist.Dlg._config.formId = formId;
			MESBasic.baseCustomer.baseCustomer.custlist.Dlg.setTitle( title )
			MESBasic.baseCustomer.baseCustomer.custlist.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.baseCustomer.baseCustomer.custlist.Dlg =	new CUI.Dialog({
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
		MESBasic.baseCustomer.baseCustomer.custlist.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.baseCustomer.baseCustomer.custlist.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_baseCustomer_baseCustomer', element : $('#MESBasic_baseCustomer_baseCustomer_custlist_fileupload_button a:eq(1)')});
		}
		MESBasic.baseCustomer.baseCustomer.custlist.otherParams = {};
	};
	MESBasic.baseCustomer.baseCustomer.custlist.commonQuery = function(type) {
	  if(typeof MESBasic.baseCustomer.baseCustomer.custlist.cancelSelectedNode == 'function') {
	   MESBasic.baseCustomer.baseCustomer.custlist.cancelSelectedNode();
	   MESBasic.baseCustomer.baseCustomer.custlist.node = null;
	  }
	  if(typeof MESBasic_baseCustomer_baseCustomer_custlist_cancelSelectedNode == 'function') {
	   MESBasic_baseCustomer_baseCustomer_custlist_cancelSelectedNode();
	   MESBasic.baseCustomer.baseCustomer.custlist.node = null;
	  }
	  MESBasic.baseCustomer.baseCustomer.custlist.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.baseCustomer.baseCustomer.custlist.query
	 */
	MESBasic.baseCustomer.baseCustomer.custlist.query = function(type,pageNo,sortFlag){
		var node = MESBasic.baseCustomer.baseCustomer.custlist.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.baseCustomer.baseCustomer.custlist.node = null;
		if(!checkListValid("ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query._sortKey && datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query._sortMethod){
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query._sortKey);
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query._sortColumnName);
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query._sortMethod);
		}else{
			datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query._sortKey = '';
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/baseCustomer/baseCustomer/custlist-pending.action";
	    } else {
	    	url = "/MESBasic/baseCustomer/baseCustomer/custlist-query.action";
	    }  
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_baseCustomer_baseCustomer_custlist_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_baseCustomer_custlist';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.baseCustomer.baseCustomer.custlist.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_baseCustomer";
		openExportFrame(url);
	}
MESBasic.baseCustomer.baseCustomer.custlist.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.baseCustomer.baseCustomer.custlist.otherParams = {};
	MESBasic.baseCustomer.baseCustomer.custlist.otherParams.dialogType = dialogType;
	MESBasic.baseCustomer.baseCustomer.custlist.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.baseCustomer.baseCustomer.custlist.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.baseCustomer.baseCustomer.editCallBackInfo
 */
MESBasic.baseCustomer.baseCustomer.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_baseCustomer_baseCustomer_custlist_getLayout == "function"){
    		var layout = MESBasic_baseCustomer_baseCustomer_custlist_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.baseCustomer.baseCustomer.custlist.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_custlist_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_baseCustomer_baseCustomer_custlist_getLayout == "function"){
			var layout = MESBasic_baseCustomer_baseCustomer_custlist_getLayout();
			var node = layout.getNode();
	    	MESBasic.baseCustomer.baseCustomer.custlist.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseCustomer.baseCustomer.custlist.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseCustomer.baseCustomer.custlist.query('query');
	    	}
			if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseCustomer.baseCustomer.custlist.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseCustomer.baseCustomer.custlist.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}
var bapS2EditCallBackInfo = MESBasic.baseCustomer.baseCustomer.editCallBackInfo;


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_baseCustomer_custlist,js,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 */
	function getCustomerState() {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.selectedRows.length; i++) {
			ids += ',' + datatable_ec_MESBasic_baseCustomer_baseCustomer_custlist_query.selectedRows[i].customerState.id;
		}
		return ids.substr(1);
	};
	$(function(){
		setTimeout(function(){
			var span = $("#MESBasic_1_baseCustomer_custFirst_custlist_doEnableCustomer_none_MESBasic_1_baseCustomer_custlist");
			span.removeClass("cui-btn-none");
	        span.addClass("cui-btn-enable");
	        
	        var span = $("#MESBasic_1_baseCustomer_custFirst_custlist_doDisableCustomer_none_MESBasic_1_baseCustomer_custlist");
			span.removeClass("cui-btn-none");
	        span.addClass("cui-btn-disable");
		}, 100 );
	});
/* CUSTOM CODE END */				
</script>
<@advQueryJs viewCode='MESBasic_1_baseCustomer_custlist' idprefix='ec_MESBasic_baseCustomer_baseCustomer_custlist' queryUrl='/MESBasic/baseCustomer/baseCustomer/custlist-query.action' queryFunc="MESBasic.baseCustomer.baseCustomer.custlist.query" ns="MESBasic.baseCustomer.baseCustomer.custlist" />
<@exportexcel action="/MESBasic/baseCustomer/baseCustomer/custlist-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_baseCustomer_custlist')}" prefix="ec_MESBasic_baseCustomer_baseCustomer_custlist_query"/>
