<!-- MESBasic_1/baseVendor/vendorPart -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1449542655240')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_baseVendor_vendorPart,head,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">
	.ewc-dialog-el{height:100%;}
	
	#fast_select_elements .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements_bak .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	}
	#fast_select_elements_bak .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	} 
	
</style>  
<script type="text/javascript">
	CUI.ns('MESBasic.baseVendor.baseVendor','MESBasic.baseVendor.baseVendor.vendorPart');
</script>
<#if permissionCode?? && permissionCode?has_content>
	<#assign buttonPerfix = permissionCode + "_" >
</#if>
<#if viewShowType?? && viewShowType == 'PART'>
<@frameset id="ec_MESBasic_baseVendor_baseVendor_vendorPart_container" border=0>
	<@frame id="ec_MESBasic_baseVendor_baseVendor_vendorPart_container_main"  offsetH=4 region="center" class="center_in">
	<#include "vendorPart-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#else>
<#include "vendorPart-fastquery-datatable.ftl">
</#if>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_baseVendor_vendorPart,html,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) -->
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
	MESBasic.baseVendor.baseVendor.vendorPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.baseVendor.baseVendor.vendorPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.baseVendor.baseVendor.vendorPart._prefix += '.';
			}
			MESBasic.baseVendor.baseVendor.vendorPart._prefix += arr[i];
		}
		MESBasic.baseVendor.baseVendor.vendorPart._suffix = arr[arr.length -1];
		if(MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.baseVendor.baseVendor.vendorPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.baseVendor.baseVendor.vendorPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.baseVendor.baseVendor.vendorPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name="'+MESBasic.baseVendor.baseVendor.vendorPart._prefix + '.' + MESBasic.baseVendor.baseVendor.vendorPart._suffix +'"]').val(obj[0][MESBasic.baseVendor.baseVendor.vendorPart._suffix]);
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name="'+MESBasic.baseVendor.baseVendor.vendorPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name^="'+MESBasic.baseVendor.baseVendor.vendorPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name="'+MESBasic.baseVendor.baseVendor.vendorPart._prefix + '.' + MESBasic.baseVendor.baseVendor.vendorPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.baseVendor.baseVendor.vendorPart._dialog) {
			MESBasic.baseVendor.baseVendor.vendorPart._dialog.close();
		}
	};
	
	MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseVendor.baseVendor.vendorPart.query_"+obj+")!='undefined'") ? eval('MESBasic.baseVendor.baseVendor.vendorPart.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_baseVendor_baseVendor_vendorPart_refresh = function(node){
MESBasic.baseVendor.baseVendor.vendorPart.node = node;
	//保存树状节点的参数，导出时用
	if(node!=null && node.layRec){
		$("#treeNodeSelected").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){
		$("#treeNodeSelected").removeAttr("value");
	}
	
	if(node!=null && node.layRec){
		$(".nodeInfo").attr("id", node.modelName+".layRec");
		$(".nodeInfo").attr("name", node.modelName+".layRec");
		$(".nodeInfo").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){	
		$(".nodeInfo").removeAttr("id");
		$(".nodeInfo").removeAttr("value");
		$(".nodeInfo").removeAttr("name");
	}
	MESBasic.baseVendor.baseVendor.vendorPart.query("query");
}

MESBasic_baseVendor_baseVendor_vendorPart_getList = function() {
	return "MESBasic.baseVendor.baseVendor.vendorPart";
}
MESBasic.baseVendor.baseVendor.vendorPart.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_baseVendor_baseVendor_vendorPartErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.baseVendor.baseVendor.vendorPart.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.vendorPart.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_baseVendor_baseVendor_vendorPart_fileupload_button",
		handler:function(){
				list_operate_baseVendor_vendorPart.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.vendorPart.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseVendor_vendorPart.MESBasic.baseVendor.baseVendor." + params.viewName + ".referenceCopy");
			funcName('baseVendor', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.vendorPart.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseVendor_vendorPart.MESBasic.baseVendor.baseVendor." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.baseVendor.baseVendor.vendorPart.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseVendor_vendorPart.MESBasic.baseVendor.baseVendor." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function doAdd(){ 
							
	var treeParam = "";
	if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
		var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
		var node = layout.getNode();
		if(node == null){
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}else{
			if(node.isParent){
                CUI.Dialog.alert("请选择末级节点新增供应商，请确认！");
                return false;
            }
			var modelCode = node.modelCode.replace(".","_");
			if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'.replace(".","_")){
				treeParam = '&baseVendor.parentId=' + node.id;
			}else{
				treeParam = '&baseVendor.' + $('#'+modelCode).val() + '.id=' + node.id;
			}
		}
	}
	var url='/MESBasic/baseVendor/baseVendor/edit.action?entityCode=MESBasic_1_baseVendor' + "&${getPowerCode('MESBasic_1_baseVendor_vendorLayout_vendorPart_add_add_MESBasic_1_baseVendor_vendorPart')}";
	if(treeParam!=""){
		url += treeParam;
	}
		<#if businessParam??>
 			url += "&${businessParam}";	
 		</#if>
	openFullScreen(url);

				};
			<#assign editView = getViewByCode('MESBasic_1_baseVendor_edit')>
			/**
			 * 列表编辑
			 * @method MESBasic.baseVendor.baseVendor.vendorPart.modifyvendorPart
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.baseVendor.baseVendor.vendorPart.modifyvendorPart = function() {
				var buttonCode='MESBasic_1_baseVendor_vendorPart_BUTTON_edit';
				if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedAny()){
					if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedMore()) {
						var cid = ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId();
							otherParams.uploadBtn = MESBasic.baseVendor.baseVendor.vendorPart.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = MESBasic.baseVendor.baseVendor.vendorPart.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = MESBasic.baseVendor.baseVendor.vendorPart.createPrintBtn('${editView.name}','${editView.url}?entityCode=MESBasic_1_baseVendor&id=' + MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart')}");
							otherParams.printSettingBtn = MESBasic.baseVendor.baseVendor.vendorPart.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							MESBasic.baseVendor.baseVendor.vendorPart.otherParams = otherParams;

							MESBasic.baseVendor.baseVendor.vendorPart.showDialog('${editView.url}?entityCode=MESBasic_1_baseVendor&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_baseVendor_vendorPart'+'&id=' + MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart')}",'MESBasic_baseVendor_baseVendor_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=MESBasic_1_baseVendor'+signatureStr+'&id=' + MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method MESBasic.baseVendor.baseVendor.vendorPart.dbmodifyvendorPart
			 */
			MESBasic.baseVendor.baseVendor.vendorPart.dbmodifyvendorPart =function(event,oRow){
				var buttonCode='MESBasic_1_baseVendor_vendorPart_BUTTON_edit';
				var cid = ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart'] == true) {
					var url = "${editView.url}?entityCode=MESBasic_1_baseVendor&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_baseVendor_vendorPart'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId();
					otherParams.uploadBtn = MESBasic.baseVendor.baseVendor.vendorPart.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = MESBasic.baseVendor.baseVendor.vendorPart.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = MESBasic.baseVendor.baseVendor.vendorPart.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = MESBasic.baseVendor.baseVendor.vendorPart.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					MESBasic.baseVendor.baseVendor.vendorPart.otherParams = otherParams;

					MESBasic.baseVendor.baseVendor.vendorPart.showDialog(url,'MESBasic_baseVendor_baseVendor_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '/MESBasic/baseVendor/baseVendor/vendorView.action';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_baseVendor&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/MESBasic/baseVendor/baseVendor/delete.action?ids=" + MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}vendorPart_del_del_MESBasic_1_baseVendor_vendorPart')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,MESBasic.baseVendor.baseVendor.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method MESBasic.baseVendor.baseVendor.vendorPart.delvendorPart
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.baseVendor.baseVendor.vendorPart.delvendorPart = function(param) {
				var buttonCode='MESBasic_1_baseVendor_vendorPart_BUTTON_del';
				if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows.length ; i++){
                        var cid = datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("MESBasic.buttonPropertyshowName.radion1449545493543")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/MESBasic/baseVendor/baseVendor/delete.action?ids=" + MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}vendorPart_del_del_MESBasic_1_baseVendor_vendorPart')}", MESBasic.baseVendor.baseVendor.callBackInfo, "json");
					}
				});
				}
			};
			
				function doEnableVendor(){ 
							 	
	if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedAny()){
		if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedMore()) {
			var vendorState = getVendorState();
			if(vendorState=="2"){
				CUI.Dialog.alert("已经是启用状态！");
		    	return false;
			}
			CUI.Dialog.confirm("${getText('是否启用?')}", function(){
				var vendorID = MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId();
				$.ajax( {
					type : 'POST',
					async:false,
					url : '/MESBasic/baseVender/baseVendor/doEnableVendor.action',
					data : {
						'vendorId' : vendorID
					},
					success : function(msg) {
						MESBasic.baseVendor.baseVendor.vendorPart.query('query');
					}
				});
			});
		}
	}

				};
				function doDisableVendor(){ 
							 
	if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedAny()){
		if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedMore()) {
			var vendorState = getVendorState();
			if(vendorState==1){
				CUI.Dialog.alert("已经是停用状态！");
		    	return false;
			}
			CUI.Dialog.confirm("${getText('是否停用?')}", function(){
				var vendorID = MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId();
				$.ajax( {
					type : 'POST',
					async:false,
					url : '/MESBasic/baseVender/baseVendor/doDisableVendor.action',
					data : {
						'vendorId' : vendorID
					},
					success : function(msg) {
						MESBasic.baseVendor.baseVendor.vendorPart.query('query');
					}
				});
			});
		}
	}

				};
			MESBasic.baseVendor.baseVendor.vendorPart.importCallbackFunc = function(res){
				CUI.Dialog.toggleAllButton();
				var queryFunc = datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.get('queryFunc');
				var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget.dataTableId).val();
				var resNodeId = -1;
				if(undefined != res && undefined != res.operate){
					resNodeId = res.operate;
				}
				if(null != queryFunc && "undefined" != queryFunc){
					if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
						var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
						var node = layout.getNode();
						MESBasic.baseVendor.baseVendor.vendorPart.node = node;	
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
						} else {
							eval(queryFunc);
						}
						layout.refreshTree(-1);
					}else{
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
						} else {
							eval(queryFunc);
						}
					}			
				} else {
					var needSort = ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false;
					if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
						var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
						var node = layout.getNode();
						MESBasic.baseVendor.baseVendor.vendorPart.node = node;	
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
						} else {
							MESBasic.baseVendor.baseVendor.vendorPart.query('query');
						}
						layout.refreshTree(-1);
					}else{
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
						} else {
							MESBasic.baseVendor.baseVendor.vendorPart.query('query');
						}
					}
				}
			};
			
			
			var vendorPart_importvendorPart_importDialog = null;
			MESBasic.baseVendor.baseVendor.vendorPart.importvendorPart = function(){
				var buttonCode='MESBasic_1_baseVendor_vendorPart_BUTTON_inportVendor';
				try{
					if(vendorPart_importvendorPart_importDialog!=null&&vendorPart_importvendorPart_importDialog.isShow==1){
						return false;
					}
					var queryFunc = 'MESBasic.baseVendor.baseVendor.vendorPart.importCallbackFunc()';
					var url = "/MESBasic/baseVendor/baseVendor/initMainImport.action?viewCode=MESBasic_1_baseVendor_vendorPart&callBackFuncName=" + queryFunc+"&buttonCode="+buttonCode;
					vendorPart_importvendorPart_importDialog = new CUI.Dialog({
						title: "${getHtmlText('common.button.import')}",
						url:url,
						modal:true,
						description:'',
						height:'330',
						width: '420',
						dragable:true,
						buttons:[{id:"replaceAndImport",display:'hidden',name:"${getHtmlText('common.button.import.replace')}",handler:function(){foundation.importExcel.submitImportForm(true,false);}},{id:"ignoreAndImport",display:'hidden',name:"${getHtmlText('common.button.import.ignore')}",handler:function(){foundation.importExcel.submitImportForm(false,true);}},{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){foundation.importExcel.submitImportForm(false,false);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();vendorPart_importvendorPart_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();vendorPart_importvendorPart_importDialog.close();}, 200);}}],
						beforeCloseEvent:function(){$('#importResponse').remove();}
					});
					vendorPart_importvendorPart_importDialog.show();
				}catch(e){}
			}
			
			MESBasic.baseVendor.baseVendor.vendorPart.downloadTemplatevendorPart = function(){
				//var url = "/MESBasic/baseVendor/baseVendor/templateDownLoad.action?viewCode=MESBasic_1_baseVendor_vendorPart&downloadType=mainTemplate&fileName=MESBasic_1_baseVendor_vendorPart-importTemplate.xls";
				$.ajax({
					url : "/foundation/workbench/getImportTemplate.action?modelCode="+"MESBasic_1_baseVendor_BaseVendor",
					type : 'post',
					async : false,
					success : function(responseMap) {
						if(responseMap.dealSuccessFlag){
							var url = "/MESBasic/baseVendor/baseVendor/allTempleteDownload.action?viewCode=MESBasic_1_baseVendor_vendorPart&downloadType=mainTemplate&fileName=MESBasic_1_baseVendor_vendorPart-importTemplate.xls"
			                +"&page.useForImportFlag=true&&page.exportFlag=true&&page.exportAuxiliaryModelFlag=true";
			                CUI.Dialog.confirm(  
							    "${getText('common.button.import.tip')}",
							    function(){window.open(url,"","");},
							    null,
							    "${getText('common.button.import')}",
							    70,
							    400
							);
						}else{
							CUI.Dialog.alert("${getText('foundation.role.importTemplateConf')}");
						}
					}
				});
				
			}
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.baseVendor.baseVendor.callBackInfo
	 */
	MESBasic.baseVendor.baseVendor.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_baseVendor_baseVendor_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.baseVendor.baseVendor.vendorPart.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
							    		var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.baseVendor.baseVendor.vendorPart.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
										var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.baseVendor.baseVendor.vendorPart.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.baseVendor.baseVendor.vendorPart.query('query');
								    	}
										if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.baseVendor.baseVendor.vendorPart.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
								    		var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.baseVendor.baseVendor.vendorPart.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.baseVendor.baseVendor.vendorPart.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
											var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.baseVendor.baseVendor.vendorPart.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.baseVendor.baseVendor.vendorPart.query('query');
									    	}
											if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.baseVendor.baseVendor.vendorPart.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.baseVendor.baseVendor.vendorPart.query('query');
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
	 * @method MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedValid = function(type) {
		if(MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedAny()){
			for(var i=0;i<datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows[i].valid === false){
						CUI.Dialog.alert("${getText('ec.common.checkvalidfordelete')}");
						return false;
					}
				}
			}
		}else{
			return false;
		}
		return true;
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.baseVendor.baseVendor.vendorPart.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method MESBasic.baseVendor.baseVendor.vendorPart.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.baseVendor.baseVendor.vendorPart.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.baseVendor.baseVendor.vendorPart.otherParams || {};
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
				<#assign editView = getViewByCode('MESBasic_1_baseVendor_edit')>
				<#if editView.extraView?? && editView.extraView.configMap?? && editView.extraView.configMap.layout?? && editView.extraView.configMap.layout.sections??>
				if(viewCode=='${editView.code}'||!viewCode){
					<#list editView.extraView.configMap.layout.sections as buttonSection>
						<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
								<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
									<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false' 
										|| checkUserPermisition('${editView.entity.code}_${operateBtn.permissionCode!}')>
										buttons.push({
											name:"${getText(operateBtn.namekey!)}",
											align:"${operateBtn.buttonAlign!'left'}",
											handler:function(){
												<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
												<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
												<#assign funcname = funcname?split('=')[1]>
												list_operate_baseVendor_vendorPart.${funcname};
												</#if>
											}
										});
									</#if>
								</#if>
							</#list>
						</#if>
					</#list>
					}
				</#if>
		}
		if(otherParams && otherParams.viewShowType == 'VIEW') {
			
			
			
					if(viewCode=='MESBasic_1_baseVendor_vendorView'||!viewCode){
					}
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){
					list_operate_baseVendor_vendorPart.CUI('#'+formId).submit();
				}
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
		if ( MESBasic.baseVendor.baseVendor.vendorPart.Dlg ) {
			MESBasic.baseVendor.baseVendor.vendorPart.Dlg._config.url = url;
			MESBasic.baseVendor.baseVendor.vendorPart.Dlg._config.formId = formId;
			MESBasic.baseVendor.baseVendor.vendorPart.Dlg.setTitle( title )
			MESBasic.baseVendor.baseVendor.vendorPart.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.baseVendor.baseVendor.vendorPart.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_baseVendor_vendorPart',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.baseVendor.baseVendor.vendorPart.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.baseVendor.baseVendor.vendorPart.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_baseVendor_baseVendor', element : $('#MESBasic_baseVendor_baseVendor_vendorPart_fileupload_button a:eq(1)')});
		}
		MESBasic.baseVendor.baseVendor.vendorPart.otherParams = {};
	};

	MESBasic.baseVendor.baseVendor.vendorPart.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.baseVendor.baseVendor.vendorPart.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.baseVendor.baseVendor.vendorPart.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.baseVendor.baseVendor.vendorPart.cancelSelectedNode == 'function') {
	   MESBasic.baseVendor.baseVendor.vendorPart.cancelSelectedNode();
	   MESBasic.baseVendor.baseVendor.vendorPart.node = null;
	  }
	  if(typeof MESBasic_baseVendor_baseVendor_vendorPart_cancelSelectedNode == 'function') {
	   MESBasic_baseVendor_baseVendor_vendorPart_cancelSelectedNode();
	   MESBasic.baseVendor.baseVendor.vendorPart.node = null;
	  }
	  MESBasic.baseVendor.baseVendor.vendorPart.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.baseVendor.baseVendor.vendorPart.query
	 */
	MESBasic.baseVendor.baseVendor.vendorPart.query = function(type,pageNo,sortFlag){
		var node = MESBasic.baseVendor.baseVendor.vendorPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.baseVendor.baseVendor.vendorPart.node = null;
		if(!checkListValid("ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query._sortKey && datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query._sortMethod){
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query._sortKey);
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query._sortColumnName);
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query._sortMethod);
		}else{
			datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query._sortKey = '';
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.baseVendor.baseVendor.vendorPart.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/baseVendor/baseVendor/vendorPart-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/baseVendor/baseVendor/vendorPart-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_baseVendor_vendorPart";
		condobj.modelAlias="baseVendor";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info[fieldName].dbColumnType;
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
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
							}
							fieldObj.operator=">=";
							fieldObj.paramStr="?";
						}else if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + lastDay + " 23:59:59";
								}
							}
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name="'+ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["MainTableName"];
								}
								fieldObj.operator="=includeCustSub#"+tableName;
								fieldObj.paramStr="?";
							}else{
								var exp=CUI(this).attr('exp');
								var caseSensitive=CUI(this).attr('caseSensitive');
								if(exp=="equal"){
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}else if(exp=="unequal"){
									fieldObj.operator="<>";
									fieldObj.paramStr="?";
								}else if(exp=="llike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="?%";
								}else if(exp=="rlike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?";
								}else if(exp=="like"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?%";
								}else{
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}
							}
						}
						fieldObj.value=fastColValue;
						var layrec=ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info[fieldName].layRec;
						if(layrec.indexOf("-")>1){
							generateChainCond(condobj,layrec.split("-"),fieldObj);						
						}else{
							condobj.subconds.push(fieldObj);
						}
					}else{
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
					}
				}
			}
		});
		if(type != "adv") {
			dataPost += "&fastQueryCond="+encodeURIComponent(JSON.stringify(condobj));
			//把fastQueryCond的值赋到一个隐藏的对话框，导出的时候使用
			$('#excelQueryCond').val(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_MESBasic_baseVendor_baseVendor_vendorPart_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_baseVendor_vendorPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.baseVendor.baseVendor.vendorPart.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_baseVendor";
		openExportFrame(url);
	}
MESBasic.baseVendor.baseVendor.vendorPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.baseVendor.baseVendor.vendorPart.otherParams = {};
	MESBasic.baseVendor.baseVendor.vendorPart.otherParams.dialogType = dialogType;
	MESBasic.baseVendor.baseVendor.vendorPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.baseVendor.baseVendor.vendorPart.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.baseVendor.baseVendor.editCallBackInfo
 */
MESBasic.baseVendor.baseVendor.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
    		var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.baseVendor.baseVendor.vendorPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortKey && ec_MESBasic_baseVendor_baseVendor_vendorPart_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_baseVendor_baseVendor_vendorPart_getLayout == "function"){
			var layout = MESBasic_baseVendor_baseVendor_vendorPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.baseVendor.baseVendor.vendorPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseVendor.baseVendor.vendorPart.query('query');
	    	}
			if(modelCode == 'MESBasic_1_baseVendor_BaseVendor'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseVendor.baseVendor.vendorPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseVendor.baseVendor.vendorPart.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_baseVendor_vendorPart,js,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method MESBasic.baseVendor.baseVendor.vendorPart.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	function getVendorState() {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows.length; i++) {
			ids += ',' + datatable_ec_MESBasic_baseVendor_baseVendor_vendorPart_query.selectedRows[i].vendorState;
		}
		return ids.substr(1);
	};
	$(function(){
		setTimeout(function(){
			var span = $("#MESBasic_1_baseVendor_vendorLayout_vendorPart_doEnableVendor_none_MESBasic_1_baseVendor_vendorPart");
			span.removeClass("cui-btn-none");
	        span.addClass("cui-btn-enable");
	        
	        var span = $("#MESBasic_1_baseVendor_vendorLayout_vendorPart_doDisableVendor_none_MESBasic_1_baseVendor_vendorPart");
			span.removeClass("cui-btn-none");
	        span.addClass("cui-btn-disable");
		}, 100 );
	});
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_baseVendor_vendorPart' idprefix='ec_MESBasic_baseVendor_baseVendor_vendorPart' queryUrl='/MESBasic/baseVendor/baseVendor/vendorPart-query.action' queryFunc="MESBasic.baseVendor.baseVendor.vendorPart.query" ns="MESBasic.baseVendor.baseVendor.vendorPart" />
<@exportexcel action="/MESBasic/baseVendor/baseVendor/vendorPart-query.action"   getRequireDataAction="/MESBasic/baseVendor/baseVendor/vendorPart-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_baseVendor_BaseVendor&&viewCode=MESBasic_1_baseVendor_vendorPart" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_baseVendor_vendorPart')}" prefix="ec_MESBasic_baseVendor_baseVendor_vendorPart_query" modelCode="MESBasic_1_baseVendor_BaseVendor"  importFlag="false" viewCode="MESBasic_1_baseVendor_vendorPart" />
