<!-- WOM_7.5.0.0/putInMaterial/putinList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1490605354290')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_putInMaterial_putinList,head,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("WOM.putInMaterial.putInMaterial","WOM.putInMaterial.putInMaterial.putinList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_WOM_putInMaterial_putInMaterial_putinList_container" border=0>
	<@frame id="ec_WOM_putInMaterial_putInMaterial_putinList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "putinList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_putInMaterial_putinList,html,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) -->
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
	function ec_WOM_putInMaterial_putInMaterial_putinList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=WOM_7.5.0.0_putInMaterial';
		openFullScreen(url);
	};
	
	WOM.putInMaterial.putInMaterial.putinList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.putInMaterial.putInMaterial.putinList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.putInMaterial.putInMaterial.putinList._prefix += '.';
			}
			WOM.putInMaterial.putInMaterial.putinList._prefix += arr[i];
		}
		WOM.putInMaterial.putInMaterial.putinList._suffix = arr[arr.length -1];
		if(WOM.putInMaterial.putInMaterial.putinList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.putInMaterial.putInMaterial.putinList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.putInMaterial.putInMaterial.putinList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.putInMaterial.putInMaterial.putinList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.putInMaterial.putInMaterial.putinList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name="'+WOM.putInMaterial.putInMaterial.putinList._prefix + '.' + WOM.putInMaterial.putInMaterial.putinList._suffix +'"]').val(obj[0][WOM.putInMaterial.putInMaterial.putinList._suffix]);
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name="'+WOM.putInMaterial.putInMaterial.putinList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name^="'+WOM.putInMaterial.putInMaterial.putinList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name="'+WOM.putInMaterial.putInMaterial.putinList._prefix + '.' + WOM.putInMaterial.putInMaterial.putinList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.putInMaterial.putInMaterial.putinList._dialog) {
			WOM.putInMaterial.putInMaterial.putinList._dialog.close();
		}
	};
	
	WOM.putInMaterial.putInMaterial.putinList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.putInMaterial.putInMaterial.putinList.query_"+obj+")!='undefined'") ? eval('WOM.putInMaterial.putInMaterial.putinList.query_'+obj+'()') : null;
		return str;
	
	};
	
WOM.putInMaterial.putInMaterial.putinList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=WOM_7.5.0.0_putInMaterial&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	WOM.putInMaterial.putInMaterial.putinList.rowDblClickQuery = function(event,row){
		WOM.putInMaterial.putInMaterial.putinList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
WOM_putInMaterial_putInMaterial_putinList_refresh = function(node){
WOM.putInMaterial.putInMaterial.putinList.node = node;
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
	WOM.putInMaterial.putInMaterial.putinList.query("query");
}

WOM_putInMaterial_putInMaterial_putinList_getList = function() {
	return "WOM.putInMaterial.putInMaterial.putinList";
}
WOM.putInMaterial.putInMaterial.putinList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_putInMaterial_putInMaterial_putinListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.putInMaterial.putInMaterial.putinList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.putInMaterial.putInMaterial.putinList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_putInMaterial_putInMaterial_putinList_fileupload_button",
		handler:function(){
				list_operate_putInMaterial_putinList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.putInMaterial.putInMaterial.putinList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_putInMaterial_putinList.WOM.putInMaterial.putInMaterial." + params.viewName + ".referenceCopy");
			funcName('putInMaterial', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.putInMaterial.putInMaterial.putinList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_putInMaterial_putinList.WOM.putInMaterial.putInMaterial." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.putInMaterial.putInMaterial.putinList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_putInMaterial_putinList.WOM.putInMaterial.putInMaterial." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function copyPutIn(){ 
							
	if(WOM.putInMaterial.putInMaterial.putinList.checkSelectedAny()){
		if(WOM.putInMaterial.putInMaterial.putinList.checkSelectedMore()) {
			var checkTask = false;
			$.ajax({
				url : "/WOM/putInMaterial/putInMaterial/checkTask.action",
				type : 'post',
				traditional: true,
				async : false,
				data:{"taskID":ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget.getSelectedRow()[0].taskID.id},
				success : function(res) {
					if(res.dealSuccessFlag==true){
						checkTask = res.checkTask;
					}
				}
			});
			
			if(checkTask){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000049')}");
				return false;
			}
			var deploymentId="";  //流程部署id
			CUI.ajax({
			    url: "/ec/workflow/getCurrentDeployment.action?processKey=putinFlow", //putinFlow为工作流key
			    type: 'post',
			    async: false,
			    success: function(msg) {
			           deploymentId = msg.deploymentId;
			}
			});
			openFullScreen('/WOM/putInMaterial/putInMaterial/putinEdit.action?entityCode=WOM_7.5.0.0_putInMaterial&isCopy=copy&id='+ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget.getSelectedRow()[0].id+'&deploymentId=' + deploymentId + "&${getPowerCode('${buttonPerfix!}start310putinFlow')}");
		}
	}

				};
			<#assign editView = getViewByCode('WOM_7.5.0.0_putInMaterial_putinEdit')>
			/**
			 * 列表编辑
			 * @method WOM.putInMaterial.putInMaterial.putinList.modifyputinList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			WOM.putInMaterial.putInMaterial.putinList.modifyputinList = function() {
				var buttonCode='WOM_7.5.0.0_putInMaterial_putinList_BUTTON_edit';
				if(WOM.putInMaterial.putInMaterial.putinList.checkSelectedAny()){
					if(WOM.putInMaterial.putInMaterial.putinList.checkSelectedMore()) {
						var cid = ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = WOM.putInMaterial.putInMaterial.putinList.getOperateRecordId();
							otherParams.uploadBtn = WOM.putInMaterial.putInMaterial.putinList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = WOM.putInMaterial.putInMaterial.putinList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = WOM.putInMaterial.putInMaterial.putinList.createPrintBtn('${editView.name}','${editView.url}?entityCode=WOM_7.5.0.0_putInMaterial&id=' + WOM.putInMaterial.putInMaterial.putinList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}putinList_edit_modify_WOM_7.5.0.0_putInMaterial_putinList')}");
							otherParams.printSettingBtn = WOM.putInMaterial.putInMaterial.putinList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							WOM.putInMaterial.putInMaterial.putinList.otherParams = otherParams;

							WOM.putInMaterial.putInMaterial.putinList.showDialog('${editView.url}?entityCode=WOM_7.5.0.0_putInMaterial&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_putInMaterial_putinList'+'&id=' + WOM.putInMaterial.putInMaterial.putinList.getOperateRecordId() + "&superEdit=true&${getPowerCode('${buttonPerfix!}putinList_edit_modify_WOM_7.5.0.0_putInMaterial_putinList')}",'WOM_putInMaterial_putInMaterial_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=WOM_7.5.0.0_putInMaterial'+signatureStr+'&id=' + WOM.putInMaterial.putInMaterial.putinList.getOperateRecordId() + "&superEdit=true&${getPowerCode('${buttonPerfix!}putinList_edit_modify_WOM_7.5.0.0_putInMaterial_putinList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method WOM.putInMaterial.putInMaterial.putinList.dbmodifyputinList
			 */
			WOM.putInMaterial.putInMaterial.putinList.dbmodifyputinList =function(event,oRow){
				var buttonCode='WOM_7.5.0.0_putInMaterial_putinList_BUTTON_edit';
					var url = "${editView.url}?entityCode=WOM_7.5.0.0_putInMaterial&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_putInMaterial_putinList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}putinList_edit_modify_WOM_7.5.0.0_putInMaterial_putinList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = WOM.putInMaterial.putInMaterial.putinList.getOperateRecordId();
					otherParams.uploadBtn = WOM.putInMaterial.putInMaterial.putinList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = WOM.putInMaterial.putInMaterial.putinList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = WOM.putInMaterial.putInMaterial.putinList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = WOM.putInMaterial.putInMaterial.putinList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					WOM.putInMaterial.putInMaterial.putinList.otherParams = otherParams;

					WOM.putInMaterial.putInMaterial.putinList.showDialog(url,'WOM_putInMaterial_putInMaterial_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
			};
			
	
	/**
	 * 保存完毕回调
	 * @method WOM.putInMaterial.putInMaterial.callBackInfo
	 */
	WOM.putInMaterial.putInMaterial.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_putInMaterial_putInMaterial_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.putInMaterial.putInMaterial.putinList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof WOM_putInMaterial_putInMaterial_putinList_getLayout == "function"){
							    		var layout = WOM_putInMaterial_putInMaterial_putinList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.putInMaterial.putInMaterial.putinList.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortKey && ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'WOM_7.5.0.0_putInMaterial_PutInMaterial'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortKey && ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortKey && ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortMethod ? true : false;
									if(typeof WOM_putInMaterial_putInMaterial_putinList_getLayout == "function"){
										var layout = WOM_putInMaterial_putInMaterial_putinList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	WOM.putInMaterial.putInMaterial.putinList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.putInMaterial.putInMaterial.putinList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.putInMaterial.putInMaterial.putinList.query('query');
								    	}
										if(modelCode == 'WOM_7.5.0.0_putInMaterial_PutInMaterial'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		WOM.putInMaterial.putInMaterial.putinList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		WOM.putInMaterial.putInMaterial.putinList.query('query');
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
	 * @method WOM.putInMaterial.putInMaterial.putinList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.putInMaterial.putInMaterial.putinList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.putInMaterial.putInMaterial.putinList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.putInMaterial.putInMaterial.putinList.checkSelectedValid = function(type) {
		if(WOM.putInMaterial.putInMaterial.putinList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows[i].valid === false){
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
	 * @method WOM.putInMaterial.putInMaterial.putinList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.putInMaterial.putInMaterial.putinList.checkSelectedAny = function() {
		if(datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.putInMaterial.putInMaterial.putinList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.putInMaterial.putInMaterial.putinList.checkSelectedMore = function() {
		if(datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.putInMaterial.putInMaterial.putinList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.putInMaterial.putInMaterial.putinList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.putInMaterial.putInMaterial.putinList.otherParams || {};
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
				<#assign editView = getViewByCode('WOM_7.5.0.0_putInMaterial_putinEdit')>
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
												list_operate_putInMaterial_putinList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_putInMaterial_putinView'||!viewCode){
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
					list_operate_putInMaterial_putinList.CUI('#'+formId).submit();
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
		if ( WOM.putInMaterial.putInMaterial.putinList.Dlg ) {
			WOM.putInMaterial.putInMaterial.putinList.Dlg._config.url = url;
			WOM.putInMaterial.putInMaterial.putinList.Dlg._config.formId = formId;
			WOM.putInMaterial.putInMaterial.putinList.Dlg.setTitle( title )
			WOM.putInMaterial.putInMaterial.putinList.Dlg.setButtonbar( buttons );
		}else{
			WOM.putInMaterial.putInMaterial.putinList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_putInMaterial_putinList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.putInMaterial.putInMaterial.putinList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.putInMaterial.putInMaterial.putinList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_putInMaterial_putInMaterial', element : $('#WOM_putInMaterial_putInMaterial_putinList_fileupload_button a:eq(1)')});
		}
		WOM.putInMaterial.putInMaterial.putinList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.putInMaterial.putInMaterial.putinList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.putInMaterial.putInMaterial.putinList.approvalDialog = function(url,formId,title,width,height) {
		WOM.putInMaterial.putInMaterial.putinList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.putInMaterial.putInMaterial.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.putInMaterial.putInMaterial.putinList.AppDlg.show();
	};

	WOM.putInMaterial.putInMaterial.putinList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.putInMaterial.putInMaterial.putinList.beforeCommonQuery === 'function') {
	   		var ret = WOM.putInMaterial.putInMaterial.putinList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.putInMaterial.putInMaterial.putinList.cancelSelectedNode == 'function') {
	   WOM.putInMaterial.putInMaterial.putinList.cancelSelectedNode();
	   WOM.putInMaterial.putInMaterial.putinList.node = null;
	  }
	  if(typeof WOM_putInMaterial_putInMaterial_putinList_cancelSelectedNode == 'function') {
	   WOM_putInMaterial_putInMaterial_putinList_cancelSelectedNode();
	   WOM.putInMaterial.putInMaterial.putinList.node = null;
	  }
	  WOM.putInMaterial.putInMaterial.putinList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.putInMaterial.putInMaterial.putinList.query
	 */
	WOM.putInMaterial.putInMaterial.putinList.query = function(type,pageNo,sortFlag){
		var node = WOM.putInMaterial.putInMaterial.putinList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.putInMaterial.putInMaterial.putinList.node = null;
		if(!checkListValid("ec_WOM_putInMaterial_putInMaterial_putinList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query._sortKey && datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query._sortMethod){
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query._sortKey);
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm #dataTableSortColName').val(datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query._sortColumnName);
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query._sortMethod);
		}else{
			datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query._sortKey = '';
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.get('dblclick') && datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.get('dblclick').length > 0) {
				datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.putInMaterial.putInMaterial.putinList.rowDblClick'
		            });
			}
	        datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.putInMaterial.putInMaterial.putinList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.get('dblclick') && datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.get('dblclick').length > 0) {
		    	datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.putInMaterial.putInMaterial.putinList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.putInMaterial.putInMaterial.putinList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.putInMaterial.putInMaterial.putinList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/putInMaterial/putInMaterial/putinList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/putInMaterial/putInMaterial/putinList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_putInMaterial_putinList";
		condobj.modelAlias="putInMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name="'+ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_putInMaterial_putInMaterial_putinList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_putInMaterial_putInMaterial_putinList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_putInMaterial_putInMaterial_putinList_query_PageLink_PageCount"]').val();
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
			dataPost += "&pending-beginDate=${pendingBeginDate!''}";
			dataPost += "&pending-endDate=${pendingEndDate!''}";
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
			permissionCode = 'WOM_7.5.0.0_putInMaterial_putinList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.putInMaterial.putInMaterial.putinList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_putInMaterial";
		openExportFrame(url);
	}
WOM.putInMaterial.putInMaterial.putinList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.putInMaterial.putInMaterial.putinList.otherParams = {};
	WOM.putInMaterial.putInMaterial.putinList.otherParams.dialogType = dialogType;
	WOM.putInMaterial.putInMaterial.putinList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.putInMaterial.putInMaterial.putinList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.putInMaterial.putInMaterial.editCallBackInfo
 */
WOM.putInMaterial.putInMaterial.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_putInMaterial_putInMaterial_putinList_getLayout == "function"){
    		var layout = WOM_putInMaterial_putInMaterial_putinList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.putInMaterial.putInMaterial.putinList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortKey && ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_putInMaterial_PutInMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortKey && ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortKey && ec_WOM_putInMaterial_putInMaterial_putinList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_putInMaterial_putInMaterial_putinList_getLayout == "function"){
			var layout = WOM_putInMaterial_putInMaterial_putinList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.putInMaterial.putInMaterial.putinList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.putInMaterial.putInMaterial.putinList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.putInMaterial.putInMaterial.putinList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_putInMaterial_PutInMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.putInMaterial.putInMaterial.putinList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.putInMaterial.putInMaterial.putinList.query('pending');
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
})(jQuery);
function replace(str,symbol){
	var arr = str.split(symbol);
	var s1 = "";
	var len = arr.length;
	for(i=0;i<len;i++){
		if(i%2!=0){
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i]+"</br>";
			}
		}else{
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i]+symbol;
			}
		}
	}
	return s1;	
}
/**
 * 批量处理事件
 * 
 */
WOM.putInMaterial.putInMaterial.putinList.approval=function(obj){
	var selectrows = datatable_ec_WOM_putInMaterial_putInMaterial_putinList_query.selectedRows;
	selectrows=selectrows.sort(sortLineInTabOrder);//按表单顺序重新排序
	var atn = "";
	var deploymentId = "";
	var processid="";
	var ids = ""; //application ID
	var pendingIds = ""; //待办ID
	var activityType = "";
	var des = "";
	var alertContent="<div style='margin-right:10px;padding:5px;height:245px;overflow:auto;line-height:20px'><p style='font-weight:bold'>${getHtmlText('ec.list.batch.failed')}</p>";//提示内容
	var nopending="";//无待办
	var noflag="";//未启用批量
	var others="";//其他
	var flag = true;
	var outcomeStr = "";//路由信息 ||activeType（活动类型），outcome（路由code），dec（路由描述），assignUser（指定人员的用户ids）;activeType，outcome，dec，assignUser||activeType，outcome，dec，assignUser;activeType，outcome，dec，assignUser
	var isHandOut = "";//挂起
	var isEffective = "";//生效
	var notSingleTask = false; // 单据状态不唯一
	if(selectrows!=null&&selectrows.length>0){
		var map={};
		processid=selectrows[0].pending.processId;
		var isdeploy = false;
		$.each(selectrows,function(i,st){
			var no = st.tableNo;
			var status = st.status;
			if(status=="77"){
				isHandOut = status;
				return false;
			}
			if(st.pending==null||st.pending==undefined||st.pending.id==null||st.pending.id==undefined||st.pending.bulkDealFlag==null||st.pending.bulkDealFlag==undefined){
				if(nopending==""){
					nopending=no;
				}else{
					nopending=nopending+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if (st.pending.taskDescription) {
				var length = st.pending.taskDescription.split(",").length;
				if(length > 1){
					notSingleTask = true;
					return false;
				}
			}
			if(st.pending.bulkDealFlag==false){
				if(noflag==""){
					noflag=no;
				}else{
					noflag=noflag+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if(deploymentId==""){
					deploymentId = st.pending.deploymentId;
					if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
						if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
						}else{
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
						}
					}
			}
			if(atn==""){
				atn = st.pending.activityName;
				des = st.pending.taskDescription;
				des = encodeURI(des);
				des = encodeURI(des);
			}
			if(st.pending.deploymentId!=deploymentId){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				isdeploy = true;
			}else if(st.pending.activityName!=atn){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				
			}
			if(activityType==""){
				activityType = st.pending.activityType;
			}
			if(flag){
				if(ids==""){
					ids = st.id;
				}else{
					ids=ids+","+st.id;
				}
				if(pendingIds==""){
					pendingIds = st.pending.id;
				}else{
					pendingIds=pendingIds+","+st.pending.id;
				}
			}
		});
		if(isHandOut=="77"){
			CUI.Dialog.alert("所选记录中包含已被挂起的流程，无法处理！");
			return false;
		}
		if (notSingleTask) {
			CUI.Dialog.alert("${getHtmlText('ec.list.batch.notSingleTask')}");
			return false;
		}
		if(!flag){
			if(nopending!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.billHasNoPending')}</p>"+replace(nopending,"${getHtmlText('ec.list.batch.semicolon')}");
				if(noflag!=""){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>3.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
				}else if(isdeploy){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
					$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
					});
				}
			}else if(noflag!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
			}else if(isdeploy){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.inconsistent')}</p>";
				$.each(map,function(key,value){
					alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
				});
			}
			alertContent =alertContent+"</div>"
			CUI.Dialog.alert(alertContent, null, null,300,500);
			return false;
		}
	}else{
		CUI.Dialog.alert("${getHtmlText('ec.list.selectLeastOne')}");
		flag = false;
		return false;
	}
	if(flag){
		var url="/WOM/putInMaterial/putInMaterial/approval.action?processId="+processid+"&activityName="+atn+"&pendingIds="+pendingIds+"&deploymentId="+deploymentId+"&ids="+ids+"&activityType="+activityType+"&des="+des+"";
		var formid="WOM_putInMaterial_putInMaterial_approval_form";
		var title="${getText('ec.list.batchApproval')}";
		var width=500;
		var height=300;
		WOM.putInMaterial.putInMaterial.putinList.approvalDialog(url,formid,title,width,height);
	}
}
/*bug#496:重新对选择行进行排序，使选择的行顺序按照表单顺序，而非选择操作的顺序*/
function sortLineInTabOrder(a,b){
    var value1 = $(a.rowHtmlObj).index();
    var value2 = $(b.rowHtmlObj).index();
    return value1 - value2;
}
	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_putInMaterial_putinList,js,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_putInMaterial_putinList' idprefix='ec_WOM_putInMaterial_putInMaterial_putinList' queryUrl='/WOM/putInMaterial/putInMaterial/putinList-query.action' queryFunc="WOM.putInMaterial.putInMaterial.putinList.query" ns="WOM.putInMaterial.putInMaterial.putinList" />
<@exportexcel action="/WOM/putInMaterial/putInMaterial/putinList-query.action"   getRequireDataAction="/WOM/putInMaterial/putInMaterial/putinList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_putInMaterial_PutInMaterial&&viewCode=WOM_7.5.0.0_putInMaterial_putinList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_putInMaterial_putinList')}" prefix="ec_WOM_putInMaterial_putInMaterial_putinList_query" modelCode="WOM_7.5.0.0_putInMaterial_PutInMaterial"  importFlag="false" viewCode="WOM_7.5.0.0_putInMaterial_putinList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
