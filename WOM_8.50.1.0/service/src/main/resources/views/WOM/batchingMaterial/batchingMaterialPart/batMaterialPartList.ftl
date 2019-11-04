<!-- WOM_7.5.0.0/batchingMaterial/batMaterialPartList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1491978131545')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_batMaterialPartList,head,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.batchingMaterial.batchingMaterialPart','WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList');
</script>
<@frameset id="ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_container" border=0>
	<@frame id="ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batMaterialPartList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_batMaterialPartList,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/WOM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/WOM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/WOM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/WOM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/WOM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/WOM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/WOM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/WOM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/WOM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/WOM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/WOM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/WOM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/WOM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/WOM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/WOM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._prefix += '.';
			}
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._prefix += arr[i];
		}
		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._suffix = arr[arr.length -1];
		if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name="'+WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._prefix + '.' + WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._suffix +'"]').val(obj[0][WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._suffix]);
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name="'+WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name^="'+WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name="'+WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._prefix + '.' + WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._dialog) {
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._dialog.close();
		}
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_refresh = function(node){
WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = node;
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
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query("query");
}

WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getList = function() {
	return "WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList";
}
WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_batchingMaterial_batchingMaterialPart_batMaterialPartListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_fileupload_button",
		handler:function(){
				list_operate_batchingMaterial_batMaterialPartList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialPartList.WOM.batchingMaterial.batchingMaterialPart." + params.viewName + ".referenceCopy");
			funcName('batchingMaterialPart', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialPartList.WOM.batchingMaterial.batchingMaterialPart." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialPartList.WOM.batchingMaterial.batchingMaterialPart." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function arrayPrint(){ 
							 							
	if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny()){
		var printPartIds = "";
		for(var i = 0 ; i < ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow().length ; i++){
			printPartId = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].id;
			//console.log(printPartId);
			printPartIds += printPartId + ",";
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.controlPrint();
			
		}
		printPartIds = printPartIds.substr(0 , printPartIds.length-1 ) ;
		//console.log(printPartIds);
		
		//打印次数+1
		$.ajax({
			url : "/WOM/batchingMaterial/batchingMaterialPart/addPrintCount.action",
			type : 'post',
			data:{printDataIds:printPartIds},
			success : function(res) {
				if(res.dealSuccessFlag==true){
					//刷新表体
					ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.setRequestDataUrl(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.requestUrl);
				}
			}
		});
		
	}

				};;
				function batch(){ 
							
	if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny()){
		CUI.Dialog.confirm("${getText('WOM.showMessage00000023')}",
		function(){
		
			//组织id，逗号隔开
			var partId = ""
			for(var i = 0 ; i < ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow().length ; i++){
				//如果状态已配送，不能再次配送
				if(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].state.id=="womBatPartState/02"){
					workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000020')}");
					return false;
				}
				
				//如果打印次数为0，不允许配送
				if(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].printCount=="0" ||
					ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].printCount==''){
					workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000051')}");
					return false;
				}
				partId += ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].id+",";
			}
			partId = partId.substr(0,partId.length-1);
			$.ajax({
				url : "/WOM/batchingMaterial/batchingMaterialPart/batch.action",
				type : 'post',
				traditional: true,
				async : false,
				data:{"partIds":partId},
				success : function(res) {
					if(res.dealSuccessFlag==true){
						ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.setRequestDataUrl(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.requestUrl);
					}
				}
			});
		
		});	
	}

				};
			<#assign editView = getViewByCode('WOM_7.5.0.0_batchingMaterial_rejectRecordEdit')>
			/**
			 * 列表编辑
			 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.modifybatMaterialPartList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.modifybatMaterialPartList = function() {
				var buttonCode='WOM_7.5.0.0_batchingMaterial_batMaterialPartList_BUTTON_reject';
				if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny()){
					if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedMore()) {
						var cid = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId();
							otherParams.uploadBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintBtn('${editView.name}','${editView.url}?entityCode=WOM_7.5.0.0_batchingMaterial&id=' + WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}");
							otherParams.printSettingBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams = otherParams;

							WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog('${editView.url}?entityCode=WOM_7.5.0.0_batchingMaterial&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_batchingMaterial_batMaterialPartList'+'&id=' + WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}",'WOM_batchingMaterial_batchingMaterialPart_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=WOM_7.5.0.0_batchingMaterial'+signatureStr+'&id=' + WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.dbmodifybatMaterialPartList
			 */
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.dbmodifybatMaterialPartList =function(event,oRow){
				var buttonCode='WOM_7.5.0.0_batchingMaterial_batMaterialPartList_BUTTON_reject';
				var cid = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList'] == true) {
					var url = "${editView.url}?entityCode=WOM_7.5.0.0_batchingMaterial&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_batchingMaterial_batMaterialPartList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId();
					otherParams.uploadBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams = otherParams;

					WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog(url,'WOM_batchingMaterial_batchingMaterialPart_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '/WOM/batchingMaterial/batchingMaterialPart/batchMaterialView.action';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_batchingMaterial&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
	
	/**
	 * 保存完毕回调
	 * @method WOM.batchingMaterial.batchingMaterialPart.callBackInfo
	 */
	WOM.batchingMaterial.batchingMaterialPart.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_batchingMaterial_batchingMaterialPart_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout == "function"){
							    		var layout = WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortMethod ? true : false;
									if(typeof WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout == "function"){
										var layout = WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('query');
								    	}
										if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('query');
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
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedValid = function(type) {
		if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows[i].valid === false){
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
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedMore = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams || {};
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
				<#assign editView = getViewByCode('WOM_7.5.0.0_batchingMaterial_rejectRecordEdit')>
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
												list_operate_batchingMaterial_batMaterialPartList.${funcname};
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
							<#assign linkview = getViewByCode('WOM_7.5.0.0_batchingMaterial_batMaterialView')>
							<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
							if(viewCode=='${linkview.code}'||!viewCode){
							<#list linkview.extraView.configMap.layout.sections as buttonSection>
							<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
							<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
							<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
								|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
								buttons.push({
									name:"${getText(operateBtn.namekey!)}",
									align:"${operateBtn.buttonAlign!'left'}",
									handler:function(){
										<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
										<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
										<#assign funcname = funcname?split('=')[1]>
										list_operate_batchingMaterial_batMaterialPartList.${funcname};
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
							<#assign linkview = getViewByCode('WOM_7.5.0.0_produceTask_makeTaskView')>
							<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
							if(viewCode=='${linkview.code}'||!viewCode){
							<#list linkview.extraView.configMap.layout.sections as buttonSection>
							<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
							<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
							<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
								|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
								buttons.push({
									name:"${getText(operateBtn.namekey!)}",
									align:"${operateBtn.buttonAlign!'left'}",
									handler:function(){
										<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
										<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
										<#assign funcname = funcname?split('=')[1]>
										list_operate_batchingMaterial_batMaterialPartList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_batchingMaterial_batchMaterialView'||!viewCode){
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
					list_operate_batchingMaterial_batMaterialPartList.CUI('#'+formId).submit();
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
		if ( WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg ) {
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg._config.url = url;
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg._config.formId = formId;
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.setTitle( title )
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.setButtonbar( buttons );
		}else{
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchingMaterial_batMaterialPartList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_batchingMaterial_batchingMaterialPart', element : $('#WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_fileupload_button a:eq(1)')});
		}
		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams = {};
	};

	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.beforeCommonQuery === 'function') {
	   		var ret = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.cancelSelectedNode == 'function') {
	   WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.cancelSelectedNode();
	   WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = null;
	  }
	  if(typeof WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_cancelSelectedNode == 'function') {
	   WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_cancelSelectedNode();
	   WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = null;
	  }
	  WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query = function(type,pageNo,sortFlag){
		var node = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = null;
		if(!checkListValid("ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query._sortKey && datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query._sortMethod){
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query._sortKey);
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm #dataTableSortColName').val(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query._sortColumnName);
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query._sortMethod);
		}else{
			datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query._sortKey = '';
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/batchingMaterial/batchingMaterialPart/batMaterialPartList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/batchingMaterial/batchingMaterialPart/batMaterialPartList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialPartList";
		condobj.modelAlias="batchingMaterialPart";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name="'+ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_batchingMaterial_batMaterialPartList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_batchingMaterial";
		openExportFrame(url);
	}
WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams = {};
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams.dialogType = dialogType;
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.batchingMaterial.batchingMaterialPart.editCallBackInfo
 */
WOM.batchingMaterial.batchingMaterialPart.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout == "function"){
    		var layout = WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout == "function"){
			var layout = WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="exeDate_start"]').val()!= null && $('#' + formId + ' input[name^="exeDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="exeDate_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="exeDate_end"]').val()!= null && $('#' + formId + ' input[name^="exeDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="exeDate_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="receiveDate_start"]').val()!= null && $('#' + formId + ' input[name^="receiveDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="receiveDate_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="receiveDate_end"]').val()!= null && $('#' + formId + ' input[name^="receiveDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="receiveDate_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="receiveDate_start"]').val()!='' && $('#' + formId + ' input[name="receiveDate_end"]').val()!=''){if($('#' + formId + ' input[name="receiveDate_start"]').val() > $('#' + formId + ' input[name="receiveDate_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="exeDate_start"]').val()!='' && $('#' + formId + ' input[name="exeDate_end"]').val()!=''){if($('#' + formId + ' input[name="exeDate_start"]').val() > $('#' + formId + ' input[name="exeDate_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_batMaterialPartList,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码
	/**
	 * 确认是否选中任何记录
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedMore = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};
	//双击事件
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.dbClickViewbatMaterialPartList = function(event, oRow) {}
    
    //列表打印功能
    var deploymentId;
	var tableInfoId;
	var printPartId;
	var WOM_7_5_0_0_batchingMaterialPart_batMaterialPartList_PrintControl;
	$(function(){
		
		$.ajax({
			type:'POST',
			url:"/WOM/batchingMaterial/batchingMaterialPart/printControlParam.action",
			async : false,
			success:function(msg){
				if(msg!=null){
					if(msg.result){
						deploymentId = msg.deploymentId;
						tableInfoId = msg.tableInfoId;
					}
				}
			}
		});
      	
      	WOM_7_5_0_0_batchingMaterialPart_batMaterialPartList_PrintControl = new CUI.PrintControl({
			id : "WOM_7_5_0_0_batchingMaterial_batMaterialEdit",
			height : "0",
			width : "0",
			deploymentId : deploymentId,
			tableInfoId : tableInfoId,
			isWorkflow : true
		});
		$(window).bind('beforeunload',function(){
		   WOM_7_5_0_0_batchingMaterialPart_batMaterialPartList_PrintControl.closeWin();
		})
	});

	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.controlPrint = function(){
		if(WOM_7_5_0_0_batchingMaterialPart_batMaterialPartList_PrintControl) {
			var postData = {
				'id' : printPartId,
				'viewCode' :　'WOM_7.5.0.0_batchingMaterial_batMaterialEdit', 
				'tableInfoId' : tableInfoId
			};
			WOM_7_5_0_0_batchingMaterialPart_batMaterialPartList_PrintControl.takeShowPrint('WOM_7.5.0.0_batchingMaterial_batMaterialEdit', "/WOM/batchingMaterial/batchingMaterialPart/arrayLoadXMLRefOrData.action?${getPowerCode('WOM_7.5.0.0_batchingMaterial_batMaterialEdit_controlPrint')}", postData, 3, true);
        }
	}
	
	/**
	* 列表编辑 自定义
	* @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.modifybatMaterialPartList
	* @return {string} 待操作的记录ID
	* @private
	*/
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.modifybatMaterialPartList = function() {
		var buttonCode='WOM_7.5.0.0_batchingMaterial_batMaterialPartList_BUTTON_reject';
		if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedAny()){
			//if(WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.checkSelectedMore()) {
				var cid = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[0].cid;
				var headid = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[0].id;
				if(cid!='${Session.company.id}'){
					workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
					return;
				}
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId();
					otherParams.uploadBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintBtn('${editView.name}','${editView.url}?entityCode=WOM_7.5.0.0_batchingMaterial&id=' + WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}");
					otherParams.printSettingBtn = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.createPrintSettingBtn('${editView.name}');
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams = otherParams;

					WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog('${editView.url}?entityCode=WOM_7.5.0.0_batchingMaterial&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_batchingMaterial_batMaterialPartList'+'&id=' + headid + "&${getPowerCode('${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}",'WOM_batchingMaterial_batchingMaterialPart_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureStr='';
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					if(signatureInfo[0] != '') {
						signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					}
					openFullScreen('${editView.url}?entityCode=WOM_7.5.0.0_batchingMaterial'+signatureStr+'&id=' + WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
			//}
		}
	};
	
	/**
	 * 显示增加对话框
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var nextStep = true;
		if(	viewCode == 'WOM_7.5.0.0_batchingMaterial_rejectRecordEdit' ){
			var selectRowLength = ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow().length;
			var batchingMaterialPartIds = '';
			for(var index = 0; index < selectRowLength; index++ ){
				batchingMaterialPartIds += ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[index].id + ',';
				if(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[index].state.id == 'womBatPartState/05'){
					workbenchErrorBarWidget.showMessage("存在记录已退料，不可重复退料！");
					setTimeout(function(){workbenchErrorBarWidget.close();},5000);
					return false;
				}	
				if(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[index].doneNum <= ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[0].putinNum){
					workbenchErrorBarWidget.showMessage("存在记录已全部投完，不可退料！");
					setTimeout(function(){workbenchErrorBarWidget.close();},5000);
					return false;
				}		
				if(ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[0].rejectNum > 0 && ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[index].state.id == 'womBatPartState/04'){
					workbenchErrorBarWidget.showMessage("选中记录投料余料已退料，不可重复退料！");
					setTimeout(function(){workbenchErrorBarWidget.close();},5000);
					return false;
				}	
			}	
			//查询是否有以生成待办数据
			$.ajax({
				url : "/public/batchingMaterial/batchingMaterialPart/rejectRecordEdit/checkHasWaitPutinRecord.action",
				type : 'post',
				async : false,
				data:{batchingMaterialPartIds:batchingMaterialPartIds},
				success : function(res) {
					//console.log(res);
					//console.log(res.flag);
					//console.log(res.flag==true);
					if(res!=null && !res.flag){
						workbenchErrorBarWidget.showMessage(res.message);
						nextStep = false;
						setTimeout(function(){workbenchErrorBarWidget.close();},5000);
						return false;
					}
				}
			});
		}	
		
		if(nextStep){
			//console.log(nextStep);
			var buttons = [];
			var otherParams = WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams || {};
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
					<#assign editView = getViewByCode('WOM_7.5.0.0_batchingMaterial_rejectRecordEdit')>
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
													list_operate_batchingMaterial_batMaterialPartList.${funcname};
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
								<#assign linkview = getViewByCode('WOM_7.5.0.0_batchingMaterial_batMaterialView')>
								<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
								if(viewCode=='${linkview.code}'||!viewCode){
								<#list linkview.extraView.configMap.layout.sections as buttonSection>
								<#if buttonSection.cells??>
								<#list (buttonSection.cells) as operateBtn>
								<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
								<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
									|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
									buttons.push({
										name:"${getText(operateBtn.namekey!)}",
										align:"${operateBtn.buttonAlign!'left'}",
										handler:function(){
											<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
											<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
											<#assign funcname = funcname?split('=')[1]>
											list_operate_batchingMaterial_batMaterialPartList.${funcname};
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
								<#assign linkview = getViewByCode('WOM_7.5.0.0_produceTask_makeTaskView')>
								<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
								if(viewCode=='${linkview.code}'||!viewCode){
								<#list linkview.extraView.configMap.layout.sections as buttonSection>
								<#if buttonSection.cells??>
								<#list (buttonSection.cells) as operateBtn>
								<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
								<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
									|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
									buttons.push({
										name:"${getText(operateBtn.namekey!)}",
										align:"${operateBtn.buttonAlign!'left'}",
										handler:function(){
											<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
											<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
											<#assign funcname = funcname?split('=')[1]>
											list_operate_batchingMaterial_batMaterialPartList.${funcname};
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
				
				
				
						if(viewCode=='WOM_7.5.0.0_batchingMaterial_batchMaterialView'||!viewCode){
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
						list_operate_batchingMaterial_batMaterialPartList.CUI('#'+formId).submit();
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
			if ( WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg ) {
				WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg._config.url = url;
				WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg._config.formId = formId;
				WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.setTitle( title )
				WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.setButtonbar( buttons );
			}else{
				WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg =	new CUI.Dialog({
					title: title,
					url :url,
					formId: formId,
					modal:true,
					
					iframe: 'list_operate_batchingMaterial_batMaterialPartList',
					
					width:width || 460,
					height: height || 330,
					type : otherParams.dialogType,
					leaveConfirm : true,
					buttons:buttons
				});
			}	
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.show();
			
			var dialog_width,  dialog_height;
			if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
				dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
				dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
			}else{
				dialog_width = width || 460;
				dialog_height = height || 330;
			}
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.Dlg.resetSize( dialog_width, dialog_height )
			
			if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
				foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_batchingMaterial_batchingMaterialPart', element : $('#WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_fileupload_button a:eq(1)')});
			}
			WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.otherParams = {};
		}
	};
    
    /**
	 * 双击修改数据
	 * @method WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.dbmodifybatMaterialPartList
	 */
	WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.dbmodifybatMaterialPartList =function(event,oRow){
		var buttonCode='WOM_7.5.0.0_batchingMaterial_batMaterialPartList_BUTTON_reject';
				
	};
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_batchingMaterial_batMaterialPartList' idprefix='ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList' queryUrl='/WOM/batchingMaterial/batchingMaterialPart/batMaterialPartList-query.action' queryFunc="WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList.query" ns="WOM.batchingMaterial.batchingMaterialPart.batMaterialPartList" />
<@exportexcel action="/WOM/batchingMaterial/batchingMaterialPart/batMaterialPartList-query.action"   getRequireDataAction="/WOM/batchingMaterial/batchingMaterialPart/batMaterialPartList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart&&viewCode=WOM_7.5.0.0_batchingMaterial_batMaterialPartList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}" prefix="ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_query" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart"  importFlag="false" viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialPartList" />
