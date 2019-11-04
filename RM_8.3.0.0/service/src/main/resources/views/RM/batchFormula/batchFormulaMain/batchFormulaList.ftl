<!-- RM_7.5.0.0/batchFormula/batchFormulaList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1546051647248')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_batchFormula_batchFormulaList,head,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) -->
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
	CUI.ns('RM.batchFormula.batchFormulaMain','RM.batchFormula.batchFormulaMain.batchFormulaList');
</script>
<@frameset id="ec_RM_batchFormula_batchFormulaMain_batchFormulaList_container" border=0>
	<@frame id="ec_RM_batchFormula_batchFormulaMain_batchFormulaList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batchFormulaList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_batchFormula_batchFormulaList,html,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/RM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/RM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/RM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/RM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/RM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/RM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/RM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/RM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/RM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/RM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/RM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/RM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/RM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/RM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/RM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.batchFormula.batchFormulaMain.batchFormulaList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.batchFormula.batchFormulaMain.batchFormulaList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.batchFormula.batchFormulaMain.batchFormulaList._prefix += '.';
			}
			RM.batchFormula.batchFormulaMain.batchFormulaList._prefix += arr[i];
		}
		RM.batchFormula.batchFormulaMain.batchFormulaList._suffix = arr[arr.length -1];
		if(RM.batchFormula.batchFormulaMain.batchFormulaList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.batchFormula.batchFormulaMain.batchFormulaList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.batchFormula.batchFormulaMain.batchFormulaList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.batchFormula.batchFormulaMain.batchFormulaList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.batchFormula.batchFormulaMain.batchFormulaList.getcallBackInfo = function(obj){
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name="'+RM.batchFormula.batchFormulaMain.batchFormulaList._prefix + '.' + RM.batchFormula.batchFormulaMain.batchFormulaList._suffix +'"]').val(obj[0][RM.batchFormula.batchFormulaMain.batchFormulaList._suffix]);
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name="'+RM.batchFormula.batchFormulaMain.batchFormulaList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name^="'+RM.batchFormula.batchFormulaMain.batchFormulaList._prefix + '."]').unbind("change");
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name="'+RM.batchFormula.batchFormulaMain.batchFormulaList._prefix + '.' + RM.batchFormula.batchFormulaMain.batchFormulaList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.batchFormula.batchFormulaMain.batchFormulaList._dialog) {
			RM.batchFormula.batchFormulaMain.batchFormulaList._dialog.close();
		}
	};
	
	RM.batchFormula.batchFormulaMain.batchFormulaList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.batchFormula.batchFormulaMain.batchFormulaList.query_"+obj+")!='undefined'") ? eval('RM.batchFormula.batchFormulaMain.batchFormulaList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
RM_batchFormula_batchFormulaMain_batchFormulaList_refresh = function(node){
RM.batchFormula.batchFormulaMain.batchFormulaList.node = node;
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
	RM.batchFormula.batchFormulaMain.batchFormulaList.query("query");
}

RM_batchFormula_batchFormulaMain_batchFormulaList_getList = function() {
	return "RM.batchFormula.batchFormulaMain.batchFormulaList";
}
RM.batchFormula.batchFormulaMain.batchFormulaList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_batchFormula_batchFormulaMain_batchFormulaListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.batchFormula.batchFormulaMain.batchFormulaList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_batchFormula_batchFormulaMain_batchFormulaList_fileupload_button",
		handler:function(){
				list_operate_batchFormula_batchFormulaList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchFormula_batchFormulaList.RM.batchFormula.batchFormulaMain." + params.viewName + ".referenceCopy");
			funcName('batchFormulaMain', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchFormula_batchFormulaList.RM.batchFormula.batchFormulaMain." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchFormula_batchFormulaList.RM.batchFormula.batchFormulaMain." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function synchFormula() { 
							
	var row = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.getSelectedRow().length;
	var formularId = null;
	var interfaceUrl = null;

	if (row == 0) {
		var openUrl = '/RM/batchFormula/batchFormulaMain/synchDialog.action?entityCode=RM_7.5.0.0_batchFormula&__pc__=YmF0Y2hGb3JtdWxhTGlzdF9hZGRfYWRkX1JNXzcuNS4wLjBfYmF0Y2hGb3JtdWxhX2JhdGNoRm9ybXVsYUxpc3R8';
		synchDialog = new CUI.Dialog({
			title: "同步批控",
			formId: "RM_batchFormula_synchDialog_form",
			type: 1,
			modal: true,
			url: openUrl,
			buttons: [{
				name: "保 存",
				handler: function() {
					interfaceUrl = $('#batchFormulaMainoriginid').val();
					if (interfaceUrl == "" || interfaceUrl == null) {
						RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage('<b>批控服务器地址</b>不能为空！', 'f');
					} else {
						//RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage('正在处理中...','s');
						var loading = new CUI.loading({
							container: 'dialog_14594083',
							head: '正在处理，请稍候...',
							opacity: 50,
							//透明度
							bgColor: "#666666",
							paddingLeft: 150,
							show: true
						});
						//$('#loading_wrap').css("left","0");//使加载框至于中央
						$.ajax({
							type: "post",
							url: '/RM/batchFormula/batchFormulaMain/getFormula.action',
							data: {
								'interfaceUrl': interfaceUrl
							},
							async: true,
							success: function(msg) {
								loading.close();
								RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage('同步成功!', 's');
								setTimeout(function() {
									RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage('正在关闭窗口...', 's');
								},
								1000);
								setTimeout(function() {
									synchDialog.close();
								},
								1500);
								// 重刷pt
								top.frames['RM_7_5_0_0_batchFormula_batchFormulaList'].RM.batchFormula.batchFormulaMain.batchFormulaList.commonQuery('query');
							},
							error : function (data) {
			                    var obj = JSON.parse(data.responseText);
			                    RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage(obj.exceptionMsg,"f");
			                    loading.close();
			                }
						});
					}
				}
			},
			{
				name: "取 消",
				handler: function() {
					this.close();
				}
			}]
		});
		synchDialog.show();
	} else { // 填充批控主配方id
		formularId = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.getSelectedRow()[0].batchFormulaId;
		interfaceUrl = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.getSelectedRow()[0].origin.id;
		var taskId = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.getSelectedRow()[0].id;
		var openUrl = "/RM/batchFormula/batchFormulaMain/synchDialog.action?entityCode=RM_7.5.0.0_batchFormula&id=" + taskId + "&__pc__=YmF0Y2hGb3JtdWxhTGlzdF9lZGl0X21vZGlmeV9STV83LjUuMC4wX2JhdGNoRm9ybXVsYV9iYXRjaEZvcm11bGFMaXN0fA__";
		synchDialog = new CUI.Dialog({
			title: "同步批控",
			formId: "RM_batchFormula_synchDialog_form",
			type: 1,
			modal: true,
			url: openUrl,
			buttons: [{
				name: "保 存",
				handler: function() {
					var loading = new CUI.loading({
						container: 'dialog_14594083',
						head: '正在处理，请稍候...',
						opacity: 50,
						//透明度
						bgColor: "#666666",
						paddingLeft: 150,
						show: true
					});
					//$('#loading_wrap').css("left","0");//使加载框至于中央
					$.ajax({
						type: "post",
						url: '/RM/batchFormula/batchFormulaMain/getFormulaDetail.action',
						data: {
							'formularId': formularId,
							'interfaceUrl': interfaceUrl
						},
						async: true,
						success: function(msg) {
							loading.close();
							RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage('同步成功!', 's');
							setTimeout(function() {
								RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage('正在关闭窗口...', 's');
							},
							1000);
							setTimeout(function() {
								synchDialog.close();
							},
							1500);
							// 重刷pt
							top.frames['RM_7_5_0_0_batchFormula_batchFormulaList'].RM.batchFormula.batchFormulaMain.batchFormulaList.commonQuery('query');
						},
						error : function (data) {
		                    var obj = JSON.parse(data.responseText);
		                    RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBarWidget.showMessage(obj.exceptionMsg,"f");
		                    loading.close();
		                }
					});

				}
			},
			{
				name: "取 消",
				handler: function() {
					this.close();
				}
			}]
		});
		synchDialog.show();
	}

				};
			<#assign editView = getViewByCode('RM_7.5.0.0_batchFormula_synchDialog')>
			/**
			 * 列表编辑
			 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.modifybatchFormulaList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.batchFormula.batchFormulaMain.batchFormulaList.modifybatchFormulaList = function() {
				var buttonCode='RM_7.5.0.0_batchFormula_batchFormulaList_BUTTON_edit';
				if(RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedAny()){
					if(RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedMore()) {
						var cid = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = RM.batchFormula.batchFormulaMain.batchFormulaList.getOperateRecordId();
							otherParams.uploadBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createPrintBtn('${editView.name}','${editView.url}?entityCode=RM_7.5.0.0_batchFormula&id=' + RM.batchFormula.batchFormulaMain.batchFormulaList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}batchFormulaList_edit_modify_RM_7.5.0.0_batchFormula_batchFormulaList')}");
							otherParams.printSettingBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams = otherParams;

							RM.batchFormula.batchFormulaMain.batchFormulaList.showDialog('${editView.url}?entityCode=RM_7.5.0.0_batchFormula&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_batchFormula_batchFormulaList'+'&id=' + RM.batchFormula.batchFormulaMain.batchFormulaList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}batchFormulaList_edit_modify_RM_7.5.0.0_batchFormula_batchFormulaList')}",'RM_batchFormula_batchFormulaMain_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=RM_7.5.0.0_batchFormula'+signatureStr+'&id=' + RM.batchFormula.batchFormulaMain.batchFormulaList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}batchFormulaList_edit_modify_RM_7.5.0.0_batchFormula_batchFormulaList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.dbmodifybatchFormulaList
			 */
			RM.batchFormula.batchFormulaMain.batchFormulaList.dbmodifybatchFormulaList =function(event,oRow){
				var buttonCode='RM_7.5.0.0_batchFormula_batchFormulaList_BUTTON_edit';
				var cid = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}batchFormulaList_edit_modify_RM_7.5.0.0_batchFormula_batchFormulaList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}batchFormulaList_edit_modify_RM_7.5.0.0_batchFormula_batchFormulaList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}batchFormulaList_edit_modify_RM_7.5.0.0_batchFormula_batchFormulaList'] == true) {
					var url = "${editView.url}?entityCode=RM_7.5.0.0_batchFormula&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_batchFormula_batchFormulaList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}batchFormulaList_edit_modify_RM_7.5.0.0_batchFormula_batchFormulaList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = RM.batchFormula.batchFormulaMain.batchFormulaList.getOperateRecordId();
					otherParams.uploadBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams = otherParams;

					RM.batchFormula.batchFormulaMain.batchFormulaList.showDialog(url,'RM_batchFormula_batchFormulaMain_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
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
							openFullScreen(viewUrl + "?entityCode=RM_7.5.0.0_batchFormula&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			<#assign editView = getViewByCode('RM_7.5.0.0_batchFormula_synchDialog')>
			/**
			 * 列表新增
			 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.addbatchFormulaList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.batchFormula.batchFormulaMain.batchFormulaList.addbatchFormulaList = function() {
				var buttonCode='RM_7.5.0.0_batchFormula_batchFormulaList_BUTTON_add';
					var treeParam = "";
					if(typeof RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout == "function"){
						var layout = RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout();
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
							if(modelCode == 'RM_7.5.0.0_batchFormula_BatchFormulaMain'.replace(/\./g, '\_')){
								treeParam = '&batchFormulaMain.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&batchFormulaMain.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = RM.batchFormula.batchFormulaMain.batchFormulaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams = otherParams;

						var url='${editView.url}?entityCode=RM_7.5.0.0_batchFormula' + "&${getPowerCode('${buttonPerfix!}batchFormulaList_add_add_RM_7.5.0.0_batchFormula_batchFormulaList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_batchFormula_batchFormulaList';
						RM.batchFormula.batchFormulaMain.batchFormulaList.showDialog(url,'RM_batchFormula_batchFormulaMain_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=RM_7.5.0.0_batchFormula' + "&${getPowerCode('${buttonPerfix!}batchFormulaList_add_add_RM_7.5.0.0_batchFormula_batchFormulaList')}";
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
			
	
	/**
	 * 保存完毕回调
	 * @method RM.batchFormula.batchFormulaMain.callBackInfo
	 */
	RM.batchFormula.batchFormulaMain.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_batchFormula_batchFormulaMain_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout == "function"){
							    		var layout = RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.batchFormula.batchFormulaMain.batchFormulaList.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'RM_7.5.0.0_batchFormula_BatchFormulaMain'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortMethod ? true : false;
									if(typeof RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout == "function"){
										var layout = RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.batchFormula.batchFormulaMain.batchFormulaList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query');
								    	}
										if(modelCode == 'RM_7.5.0.0_batchFormula_BatchFormulaMain'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query');
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
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedValid = function(type) {
		if(RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows[i].valid === false){
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
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedAny = function() {
		if(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaList.checkSelectedMore = function() {
		if(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams || {};
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
				<#assign editView = getViewByCode('RM_7.5.0.0_batchFormula_synchDialog')>
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
												list_operate_batchFormula_batchFormulaList.${funcname};
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
					list_operate_batchFormula_batchFormulaList.CUI('#'+formId).submit();
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
		if ( RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg ) {
			RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg._config.url = url;
			RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg._config.formId = formId;
			RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg.setTitle( title )
			RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg.setButtonbar( buttons );
		}else{
			RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchFormula_batchFormulaList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.batchFormula.batchFormulaMain.batchFormulaList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_batchFormula_batchFormulaMain', element : $('#RM_batchFormula_batchFormulaMain_batchFormulaList_fileupload_button a:eq(1)')});
		}
		RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaList.approvalDialog = function(url,formId,title,width,height) {
		RM.batchFormula.batchFormulaMain.batchFormulaList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{RM.batchFormula.batchFormulaMain.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		RM.batchFormula.batchFormulaMain.batchFormulaList.AppDlg.show();
	};

	RM.batchFormula.batchFormulaMain.batchFormulaList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.batchFormula.batchFormulaMain.batchFormulaList.beforeCommonQuery === 'function') {
	   		var ret = RM.batchFormula.batchFormulaMain.batchFormulaList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.batchFormula.batchFormulaMain.batchFormulaList.cancelSelectedNode == 'function') {
	   RM.batchFormula.batchFormulaMain.batchFormulaList.cancelSelectedNode();
	   RM.batchFormula.batchFormulaMain.batchFormulaList.node = null;
	  }
	  if(typeof RM_batchFormula_batchFormulaMain_batchFormulaList_cancelSelectedNode == 'function') {
	   RM_batchFormula_batchFormulaMain_batchFormulaList_cancelSelectedNode();
	   RM.batchFormula.batchFormulaMain.batchFormulaList.node = null;
	  }
	  RM.batchFormula.batchFormulaMain.batchFormulaList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaList.query
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaList.query = function(type,pageNo,sortFlag){
		var node = RM.batchFormula.batchFormulaMain.batchFormulaList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.batchFormula.batchFormulaMain.batchFormulaList.node = null;
		if(!checkListValid("ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query._sortKey && datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query._sortMethod){
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm #dataTableSortColKey').val(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query._sortKey);
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm #dataTableSortColName').val(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query._sortColumnName);
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query._sortMethod);
		}else{
			datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query._sortKey = '';
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.batchFormula.batchFormulaMain.batchFormulaList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/batchFormula/batchFormulaMain/batchFormulaList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/batchFormula/batchFormulaMain/batchFormulaList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_batchFormula_batchFormulaList";
		condobj.modelAlias="batchFormulaMain";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name="'+ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_batchFormula_batchFormulaMain_batchFormulaList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'RM_7.5.0.0_batchFormula_batchFormulaList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.batchFormula.batchFormulaMain.batchFormulaList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_batchFormula";
		openExportFrame(url);
	}
RM.batchFormula.batchFormulaMain.batchFormulaList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams = {};
	RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams.dialogType = dialogType;
	RM.batchFormula.batchFormulaMain.batchFormulaList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.batchFormula.batchFormulaMain.batchFormulaList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.batchFormula.batchFormulaMain.editCallBackInfo
 */
RM.batchFormula.batchFormulaMain.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout == "function"){
    		var layout = RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.batchFormula.batchFormulaMain.batchFormulaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_batchFormula_BatchFormulaMain'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget._sortMethod ? true : false;
		if(typeof RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout == "function"){
			var layout = RM_batchFormula_batchFormulaMain_batchFormulaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.batchFormula.batchFormulaMain.batchFormulaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_batchFormula_BatchFormulaMain'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.batchFormula.batchFormulaMain.batchFormulaList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="modTime_start"]').val()!= null && $('#' + formId + ' input[name^="modTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="modTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="modTime_end"]').val()!= null && $('#' + formId + ' input[name^="modTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="modTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="modTime_start"]').val()!='' && $('#' + formId + ' input[name="modTime_end"]').val()!=''){if($('#' + formId + ' input[name="modTime_start"]').val() > $('#' + formId + ' input[name="modTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_batchFormula_batchFormulaList,js,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) */
// 自定义代码
var synchDialog;
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_batchFormula_batchFormulaList' idprefix='ec_RM_batchFormula_batchFormulaMain_batchFormulaList' queryUrl='/RM/batchFormula/batchFormulaMain/batchFormulaList-query.action' queryFunc="RM.batchFormula.batchFormulaMain.batchFormulaList.query" ns="RM.batchFormula.batchFormulaMain.batchFormulaList" />
<@exportexcel action="/RM/batchFormula/batchFormulaMain/batchFormulaList-query.action"   getRequireDataAction="/RM/batchFormula/batchFormulaMain/batchFormulaList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_batchFormula_BatchFormulaMain&&viewCode=RM_7.5.0.0_batchFormula_batchFormulaList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_batchFormula_batchFormulaList')}" prefix="ec_RM_batchFormula_batchFormulaMain_batchFormulaList_query" modelCode="RM_7.5.0.0_batchFormula_BatchFormulaMain"  importFlag="false" viewCode="RM_7.5.0.0_batchFormula_batchFormulaList" />
