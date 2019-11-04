<!-- MESBasic_1/prodList/editPart -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1450078976066')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_prodList_editPart,head,MESBasic_1_prodList_BaseProdList,MESBasic_1) -->
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
	CUI.ns('MESBasic.prodList.baseProdList','MESBasic.prodList.baseProdList.editPart');
</script>
<#if permissionCode?? && permissionCode?has_content>
	<#assign buttonPerfix = permissionCode + "_" >
</#if>
<#if viewShowType?? && viewShowType == 'PART'>
<@frameset id="ec_MESBasic_prodList_baseProdList_editPart_container" border=0>
	<@frame id="ec_MESBasic_prodList_baseProdList_editPart_container_main"  offsetH=4 region="center" class="center_in">
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
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_prodList_editPart,html,MESBasic_1_prodList_BaseProdList,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.prodList.baseProdList.editPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.prodList.baseProdList.editPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.prodList.baseProdList.editPart._prefix += '.';
			}
			MESBasic.prodList.baseProdList.editPart._prefix += arr[i];
		}
		MESBasic.prodList.baseProdList.editPart._suffix = arr[arr.length -1];
		if(MESBasic.prodList.baseProdList.editPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.prodList.baseProdList.editPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.prodList.baseProdList.editPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.prodList.baseProdList.editPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.prodList.baseProdList.editPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name="'+MESBasic.prodList.baseProdList.editPart._prefix + '.' + MESBasic.prodList.baseProdList.editPart._suffix +'"]').val(obj[0][MESBasic.prodList.baseProdList.editPart._suffix]);
		CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name="'+MESBasic.prodList.baseProdList.editPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name^="'+MESBasic.prodList.baseProdList.editPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name="'+MESBasic.prodList.baseProdList.editPart._prefix + '.' + MESBasic.prodList.baseProdList.editPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.prodList.baseProdList.editPart._dialog) {
			MESBasic.prodList.baseProdList.editPart._dialog.close();
		}
	};
	
	MESBasic.prodList.baseProdList.editPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.prodList.baseProdList.editPart.query_"+obj+")!='undefined'") ? eval('MESBasic.prodList.baseProdList.editPart.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_prodList_baseProdList_editPart_refresh = function(node){
MESBasic.prodList.baseProdList.editPart.node = node;
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
	MESBasic.prodList.baseProdList.editPart.query("query");
}

MESBasic_prodList_baseProdList_editPart_getList = function() {
	return "MESBasic.prodList.baseProdList.editPart";
}
MESBasic.prodList.baseProdList.editPart.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_prodList_baseProdList_editPartErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.prodList.baseProdList.editPart.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.prodList.baseProdList.editPart.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_prodList_baseProdList_editPart_fileupload_button",
		handler:function(){
				list_operate_prodList_editPart.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.prodList.baseProdList.editPart.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prodList_editPart.MESBasic.prodList.baseProdList." + params.viewName + ".referenceCopy");
			funcName('baseProdList', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.prodList.baseProdList.editPart.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prodList_editPart.MESBasic.prodList.baseProdList." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.prodList.baseProdList.editPart.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prodList_editPart.MESBasic.prodList.baseProdList." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('MESBasic_1_prodList_editView')>
			/**
			 * 列表新增
			 * @method MESBasic.prodList.baseProdList.editPart.addeditPart
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.prodList.baseProdList.editPart.addeditPart = function() {
				var buttonCode='MESBasic_1_prodList_editPart_BUTTON_add';
					var treeParam = "";
					if(typeof MESBasic_prodList_baseProdList_editPart_getLayout == "function"){
						var layout = MESBasic_prodList_baseProdList_editPart_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							if(node.cid!='${Session.company.id}'&&node.id!=-1){
								workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
								return;
							}
							var modelCode = node.modelCode.replace(/\./g, '\_');
							if(modelCode == 'MESBasic_1_prodList_BaseProdList'.replace(/\./g, '\_')){
								treeParam = '&baseProdList.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&baseProdList.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = MESBasic.prodList.baseProdList.editPart.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = MESBasic.prodList.baseProdList.editPart.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						MESBasic.prodList.baseProdList.editPart.otherParams = otherParams;

						var url='${editView.url}?entityCode=MESBasic_1_prodList' + "&${getPowerCode('${buttonPerfix!}editPart_add_add_MESBasic_1_prodList_editPart')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_prodList_editPart';
						MESBasic.prodList.baseProdList.editPart.showDialog(url,'MESBasic_prodList_baseProdList_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=MESBasic_1_prodList' + "&${getPowerCode('${buttonPerfix!}editPart_add_add_MESBasic_1_prodList_editPart')}";
						if(treeParam!=""){
				 			url += treeParam;
				 		}
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
			 			if(signatureInfo[0] != '') {
			 				url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
			 			}
						openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
					</#if>
			};
			
			<#assign editView = getViewByCode('MESBasic_1_prodList_editView')>
			/**
			 * 列表编辑
			 * @method MESBasic.prodList.baseProdList.editPart.modifyeditPart
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.prodList.baseProdList.editPart.modifyeditPart = function() {
				var buttonCode='MESBasic_1_prodList_editPart_BUTTON_edit';
				if(MESBasic.prodList.baseProdList.editPart.checkSelectedAny()){
					if(MESBasic.prodList.baseProdList.editPart.checkSelectedMore()) {
						var cid = ec_MESBasic_prodList_baseProdList_editPart_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = MESBasic.prodList.baseProdList.editPart.getOperateRecordId();
							otherParams.uploadBtn = MESBasic.prodList.baseProdList.editPart.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = MESBasic.prodList.baseProdList.editPart.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = MESBasic.prodList.baseProdList.editPart.createPrintBtn('${editView.name}','${editView.url}?entityCode=MESBasic_1_prodList&id=' + MESBasic.prodList.baseProdList.editPart.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart')}");
							otherParams.printSettingBtn = MESBasic.prodList.baseProdList.editPart.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							MESBasic.prodList.baseProdList.editPart.otherParams = otherParams;

							MESBasic.prodList.baseProdList.editPart.showDialog('${editView.url}?entityCode=MESBasic_1_prodList&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_prodList_editPart'+'&id=' + MESBasic.prodList.baseProdList.editPart.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart')}",'MESBasic_prodList_baseProdList_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=MESBasic_1_prodList'+signatureStr+'&id=' + MESBasic.prodList.baseProdList.editPart.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method MESBasic.prodList.baseProdList.editPart.dbmodifyeditPart
			 */
			MESBasic.prodList.baseProdList.editPart.dbmodifyeditPart =function(event,oRow){
				var buttonCode='MESBasic_1_prodList_editPart_BUTTON_edit';
				var cid = ec_MESBasic_prodList_baseProdList_editPart_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart'] == true) {
					var url = "${editView.url}?entityCode=MESBasic_1_prodList&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_prodList_editPart'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = MESBasic.prodList.baseProdList.editPart.getOperateRecordId();
					otherParams.uploadBtn = MESBasic.prodList.baseProdList.editPart.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = MESBasic.prodList.baseProdList.editPart.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = MESBasic.prodList.baseProdList.editPart.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = MESBasic.prodList.baseProdList.editPart.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					MESBasic.prodList.baseProdList.editPart.otherParams = otherParams;

					MESBasic.prodList.baseProdList.editPart.showDialog(url,'MESBasic_prodList_baseProdList_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_prodList&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/MESBasic/prodList/baseProdList/delete.action?ids=" + MESBasic.prodList.baseProdList.editPart.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}editPart_Delete_del_MESBasic_1_prodList_editPart')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,MESBasic.prodList.baseProdList.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method MESBasic.prodList.baseProdList.editPart.deleditPart
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.prodList.baseProdList.editPart.deleditPart = function(param) {
				var buttonCode='MESBasic_1_prodList_editPart_BUTTON_Delete';
				if(MESBasic.prodList.baseProdList.editPart.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows.length ; i++){
                        var cid = datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("MESBasic.delete.buttonPropertyshowName.radion1450079428752")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/MESBasic/prodList/baseProdList/delete.action?ids=" + MESBasic.prodList.baseProdList.editPart.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}editPart_Delete_del_MESBasic_1_prodList_editPart')}", MESBasic.prodList.baseProdList.callBackInfo, "json");
					}
				});
				}
			};
			function doProdListDel(){
if(MESBasic.prodList.baseProdList.editPart.checkSelectedAny()){
	var delRow = MESBasic.prodList.baseProdList.editPart.getOperateRecordId('del').split("@");
	var hasProduct = "";
		$.ajax( {
			type : 'POST',
			async:false,
			url : '/MESBasic/prodList/baseProdList/editPart/hasProduct.action',
			data : {
				'productId' : delRow[0]
			},
			success : function(msg) {
		      	hasProduct =msg.hasProductFlag;
		    }
		});
		if(hasProduct==1){
			CUI.Dialog.alert("该目录已经存在商品，不能删除，请确认！");
		    return false;
		}
	CUI.Dialog.confirm("${getText('foundation.role.checkdelete')}", function(){	
	CUI.post("/MESBasic/prodList/baseProdList/delete.action?ids=" + MESBasic.prodList.baseProdList.editPart.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}editPart_delete_del_MESBasic_1_prodList_editPart')}", MESBasic.prodList.baseProdList.callBackInfo, "json");
});
}
};;
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.prodList.baseProdList.callBackInfo
	 */
	MESBasic.prodList.baseProdList.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_prodList_baseProdList_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.prodList.baseProdList.editPart.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_prodList_baseProdList_editPart_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_prodList_baseProdList_editPart_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_prodList_baseProdList_editPart_getLayout == "function"){
							    		var layout = MESBasic_prodList_baseProdList_editPart_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.prodList.baseProdList.editPart.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_prodList_BaseProdList'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_prodList_baseProdList_editPart_getLayout == "function"){
										var layout = MESBasic_prodList_baseProdList_editPart_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.prodList.baseProdList.editPart.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.prodList.baseProdList.editPart.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.prodList.baseProdList.editPart.query('query');
								    	}
										if(modelCode == 'MESBasic_1_prodList_BaseProdList'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.prodList.baseProdList.editPart.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.prodList.baseProdList.editPart.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_prodList_baseProdList_editPart_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_prodList_baseProdList_editPart_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_prodList_baseProdList_editPart_getLayout == "function"){
								    		var layout = MESBasic_prodList_baseProdList_editPart_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.prodList.baseProdList.editPart.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_prodList_BaseProdList'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.prodList.baseProdList.editPart.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_prodList_baseProdList_editPart_getLayout == "function"){
											var layout = MESBasic_prodList_baseProdList_editPart_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.prodList.baseProdList.editPart.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.prodList.baseProdList.editPart.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.prodList.baseProdList.editPart.query('query');
									    	}
											if(modelCode == 'MESBasic_1_prodList_BaseProdList'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.prodList.baseProdList.editPart.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.prodList.baseProdList.editPart.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.prodList.baseProdList.editPart.query('query');
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
	 * @method MESBasic.prodList.baseProdList.editPart.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.prodList.baseProdList.editPart.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method MESBasic.prodList.baseProdList.editPart.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	MESBasic.prodList.baseProdList.editPart.checkSelectedValid = function(type) {
		if(MESBasic.prodList.baseProdList.editPart.checkSelectedAny()){
			for(var i=0;i<datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows[i].valid === false){
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
	 * @method MESBasic.prodList.baseProdList.editPart.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.prodList.baseProdList.editPart.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.prodList.baseProdList.editPart.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.prodList.baseProdList.editPart.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_prodList_baseProdList_editPart_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method MESBasic.prodList.baseProdList.editPart.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.prodList.baseProdList.editPart.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.prodList.baseProdList.editPart.otherParams || {};
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
				<#assign editView = getViewByCode('MESBasic_1_prodList_editView')>
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
												list_operate_prodList_editPart.${funcname};
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
			
			
			
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){
					list_operate_prodList_editPart.CUI('#'+formId).submit();
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
		if ( MESBasic.prodList.baseProdList.editPart.Dlg ) {
			MESBasic.prodList.baseProdList.editPart.Dlg._config.url = url;
			MESBasic.prodList.baseProdList.editPart.Dlg._config.formId = formId;
			MESBasic.prodList.baseProdList.editPart.Dlg.setTitle( title )
			MESBasic.prodList.baseProdList.editPart.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.prodList.baseProdList.editPart.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_prodList_editPart',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.prodList.baseProdList.editPart.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.prodList.baseProdList.editPart.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_prodList_baseProdList', element : $('#MESBasic_prodList_baseProdList_editPart_fileupload_button a:eq(1)')});
		}
		MESBasic.prodList.baseProdList.editPart.otherParams = {};
	};

	MESBasic.prodList.baseProdList.editPart.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.prodList.baseProdList.editPart.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.prodList.baseProdList.editPart.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.prodList.baseProdList.editPart.cancelSelectedNode == 'function') {
	   MESBasic.prodList.baseProdList.editPart.cancelSelectedNode();
	   MESBasic.prodList.baseProdList.editPart.node = null;
	  }
	  if(typeof MESBasic_prodList_baseProdList_editPart_cancelSelectedNode == 'function') {
	   MESBasic_prodList_baseProdList_editPart_cancelSelectedNode();
	   MESBasic.prodList.baseProdList.editPart.node = null;
	  }
	  MESBasic.prodList.baseProdList.editPart.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.prodList.baseProdList.editPart.query
	 */
	MESBasic.prodList.baseProdList.editPart.query = function(type,pageNo,sortFlag){
		var node = MESBasic.prodList.baseProdList.editPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.prodList.baseProdList.editPart.node = null;
		if(!checkListValid("ec_MESBasic_prodList_baseProdList_editPart_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_prodList_baseProdList_editPart_query._sortKey && datatable_ec_MESBasic_prodList_baseProdList_editPart_query._sortMethod){
			CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_prodList_baseProdList_editPart_query._sortKey);
			CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_prodList_baseProdList_editPart_query._sortColumnName);
			CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_prodList_baseProdList_editPart_query._sortMethod);
		}else{
			datatable_ec_MESBasic_prodList_baseProdList_editPart_query._sortKey = '';
			CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_prodList_baseProdList_editPart_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.prodList.baseProdList.editPart.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/prodList/baseProdList/editPart-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/prodList/baseProdList/editPart-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_prodList_baseProdList_editPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_prodList_editPart";
		condobj.modelAlias="baseProdList";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_prodList_baseProdList_editPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_prodList_baseProdList_editPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_prodList_baseProdList_editPart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_prodList_baseProdList_editPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name="'+ec_MESBasic_prodList_baseProdList_editPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_prodList_baseProdList_editPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_prodList_baseProdList_editPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_prodList_baseProdList_editPart_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_prodList_baseProdList_editPart_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_prodList_editPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_prodList_baseProdList_editPart_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_prodList_baseProdList_editPart_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.prodList.baseProdList.editPart.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_prodList";
		openExportFrame(url);
	}
MESBasic.prodList.baseProdList.editPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.prodList.baseProdList.editPart.otherParams = {};
	MESBasic.prodList.baseProdList.editPart.otherParams.dialogType = dialogType;
	MESBasic.prodList.baseProdList.editPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.prodList.baseProdList.editPart.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.prodList.baseProdList.editCallBackInfo
 */
MESBasic.prodList.baseProdList.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_prodList_baseProdList_editPart_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_prodList_baseProdList_editPart_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_prodList_baseProdList_editPart_getLayout == "function"){
    		var layout = MESBasic_prodList_baseProdList_editPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.prodList.baseProdList.editPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_prodList_BaseProdList'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortKey && ec_MESBasic_prodList_baseProdList_editPart_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_prodList_baseProdList_editPart_getLayout == "function"){
			var layout = MESBasic_prodList_baseProdList_editPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.prodList.baseProdList.editPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.prodList.baseProdList.editPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.prodList.baseProdList.editPart.query('query');
	    	}
			if(modelCode == 'MESBasic_1_prodList_BaseProdList'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.prodList.baseProdList.editPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.prodList.baseProdList.editPart.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="modifyTime_start"]').val()!= null && $('#' + formId + ' input[name^="modifyTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="modifyTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('ec.common.modifyTime')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="modifyTime_end"]').val()!= null && $('#' + formId + ' input[name^="modifyTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="modifyTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('ec.common.modifyTime')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="modifyTime_start"]').val()!='' && $('#' + formId + ' input[name="modifyTime_end"]').val()!=''){if($('#' + formId + ' input[name="modifyTime_start"]').val() > $('#' + formId + ' input[name="modifyTime_end"]').val()){errorbarWidget.showMessage("${getText('ec.common.modifyTime')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('ec.common.modifyTime')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_prodList_editPart,js,MESBasic_1_prodList_BaseProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_prodList_editPart' idprefix='ec_MESBasic_prodList_baseProdList_editPart' queryUrl='/MESBasic/prodList/baseProdList/editPart-query.action' queryFunc="MESBasic.prodList.baseProdList.editPart.query" ns="MESBasic.prodList.baseProdList.editPart" />
<@exportexcel action="/MESBasic/prodList/baseProdList/editPart-query.action"   getRequireDataAction="/MESBasic/prodList/baseProdList/editPart-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_prodList_BaseProdList&&viewCode=MESBasic_1_prodList_editPart" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_prodList_editPart')}" prefix="ec_MESBasic_prodList_baseProdList_editPart_query" modelCode="MESBasic_1_prodList_BaseProdList"  importFlag="false" viewCode="MESBasic_1_prodList_editPart" />
