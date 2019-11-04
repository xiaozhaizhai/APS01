<!-- MESBasic_1/potDataHandler/dataList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1455959147451')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_potDataHandler_dataList,head,MESBasic_1_potDataHandler_PotData,MESBasic_1) -->
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
	CUI.ns('MESBasic.potDataHandler.potData','MESBasic.potDataHandler.potData.dataList');
</script>
<@frameset id="ec_MESBasic_potDataHandler_potData_dataList_container" border=0>
	<@frame id="ec_MESBasic_potDataHandler_potData_dataList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "dataList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_potDataHandler_dataList,html,MESBasic_1_potDataHandler_PotData,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.potDataHandler.potData.dataList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.potDataHandler.potData.dataList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.potDataHandler.potData.dataList._prefix += '.';
			}
			MESBasic.potDataHandler.potData.dataList._prefix += arr[i];
		}
		MESBasic.potDataHandler.potData.dataList._suffix = arr[arr.length -1];
		if(MESBasic.potDataHandler.potData.dataList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.potDataHandler.potData.dataList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.potDataHandler.potData.dataList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.potDataHandler.potData.dataList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.potDataHandler.potData.dataList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name="'+MESBasic.potDataHandler.potData.dataList._prefix + '.' + MESBasic.potDataHandler.potData.dataList._suffix +'"]').val(obj[0][MESBasic.potDataHandler.potData.dataList._suffix]);
		CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name="'+MESBasic.potDataHandler.potData.dataList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name^="'+MESBasic.potDataHandler.potData.dataList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name="'+MESBasic.potDataHandler.potData.dataList._prefix + '.' + MESBasic.potDataHandler.potData.dataList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.potDataHandler.potData.dataList._dialog) {
			MESBasic.potDataHandler.potData.dataList._dialog.close();
		}
	};
	
	MESBasic.potDataHandler.potData.dataList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.potDataHandler.potData.dataList.query_"+obj+")!='undefined'") ? eval('MESBasic.potDataHandler.potData.dataList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_potDataHandler_potData_dataList_refresh = function(node){
MESBasic.potDataHandler.potData.dataList.node = node;
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
	MESBasic.potDataHandler.potData.dataList.query("query");
}

MESBasic_potDataHandler_potData_dataList_getList = function() {
	return "MESBasic.potDataHandler.potData.dataList";
}
MESBasic.potDataHandler.potData.dataList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_potDataHandler_potData_dataListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.potDataHandler.potData.dataList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.potDataHandler.potData.dataList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_potDataHandler_potData_dataList_fileupload_button",
		handler:function(){
				list_operate_potDataHandler_dataList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.potDataHandler.potData.dataList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_potDataHandler_dataList.MESBasic.potDataHandler.potData." + params.viewName + ".referenceCopy");
			funcName('potData', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.potDataHandler.potData.dataList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_potDataHandler_dataList.MESBasic.potDataHandler.potData." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.potDataHandler.potData.dataList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_potDataHandler_dataList.MESBasic.potDataHandler.potData." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('MESBasic_1_potDataHandler_dataEdit')>
			/**
			 * 列表新增
			 * @method MESBasic.potDataHandler.potData.dataList.adddataList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.potDataHandler.potData.dataList.adddataList = function() {
				var buttonCode='MESBasic_1_potDataHandler_dataList_BUTTON_dataNew';
					var treeParam = "";
					if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
						var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
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
							if(modelCode == 'MESBasic_1_potDataHandler_PotData'.replace(/\./g, '\_')){
								treeParam = '&potData.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&potData.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = MESBasic.potDataHandler.potData.dataList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = MESBasic.potDataHandler.potData.dataList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						MESBasic.potDataHandler.potData.dataList.otherParams = otherParams;

						var url='${editView.url}?entityCode=MESBasic_1_potDataHandler' + "&${getPowerCode('${buttonPerfix!}dataList_dataNew_add_MESBasic_1_potDataHandler_dataList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_potDataHandler_dataList';
						MESBasic.potDataHandler.potData.dataList.showDialog(url,'MESBasic_potDataHandler_potData_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=MESBasic_1_potDataHandler' + "&${getPowerCode('${buttonPerfix!}dataList_dataNew_add_MESBasic_1_potDataHandler_dataList')}";
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
			
			<#assign editView = getViewByCode('MESBasic_1_potDataHandler_dataEdit')>
			/**
			 * 列表编辑
			 * @method MESBasic.potDataHandler.potData.dataList.modifydataList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.potDataHandler.potData.dataList.modifydataList = function() {
				var buttonCode='MESBasic_1_potDataHandler_dataList_BUTTON_dataEdit';
				if(MESBasic.potDataHandler.potData.dataList.checkSelectedAny()){
					if(MESBasic.potDataHandler.potData.dataList.checkSelectedMore()) {
						var cid = ec_MESBasic_potDataHandler_potData_dataList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = MESBasic.potDataHandler.potData.dataList.getOperateRecordId();
							otherParams.uploadBtn = MESBasic.potDataHandler.potData.dataList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = MESBasic.potDataHandler.potData.dataList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = MESBasic.potDataHandler.potData.dataList.createPrintBtn('${editView.name}','${editView.url}?entityCode=MESBasic_1_potDataHandler&id=' + MESBasic.potDataHandler.potData.dataList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_potDataHandler_dataList')}");
							otherParams.printSettingBtn = MESBasic.potDataHandler.potData.dataList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							MESBasic.potDataHandler.potData.dataList.otherParams = otherParams;

							MESBasic.potDataHandler.potData.dataList.showDialog('${editView.url}?entityCode=MESBasic_1_potDataHandler&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_potDataHandler_dataList'+'&id=' + MESBasic.potDataHandler.potData.dataList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_potDataHandler_dataList')}",'MESBasic_potDataHandler_potData_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=MESBasic_1_potDataHandler'+signatureStr+'&id=' + MESBasic.potDataHandler.potData.dataList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_potDataHandler_dataList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method MESBasic.potDataHandler.potData.dataList.dbmodifydataList
			 */
			MESBasic.potDataHandler.potData.dataList.dbmodifydataList =function(event,oRow){
				var buttonCode='MESBasic_1_potDataHandler_dataList_BUTTON_dataEdit';
				var cid = ec_MESBasic_potDataHandler_potData_dataList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_potDataHandler_dataList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_potDataHandler_dataList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_potDataHandler_dataList'] == true) {
					var url = "${editView.url}?entityCode=MESBasic_1_potDataHandler&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_potDataHandler_dataList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_potDataHandler_dataList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = MESBasic.potDataHandler.potData.dataList.getOperateRecordId();
					otherParams.uploadBtn = MESBasic.potDataHandler.potData.dataList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = MESBasic.potDataHandler.potData.dataList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = MESBasic.potDataHandler.potData.dataList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = MESBasic.potDataHandler.potData.dataList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					MESBasic.potDataHandler.potData.dataList.otherParams = otherParams;

					MESBasic.potDataHandler.potData.dataList.showDialog(url,'MESBasic_potDataHandler_potData_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
					}else {
						var viewUrl = '/MESBasic/potDataHandler/potData/dataView.action';
						if(viewUrl == ''){
//							CUI.Dialog.alert("${getText('ec.view.noViewView')}");
							return;
						} else {
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_potDataHandler&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/MESBasic/potDataHandler/potData/delete.action?ids=" + MESBasic.potDataHandler.potData.dataList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}dataList_dataDel_del_MESBasic_1_potDataHandler_dataList')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,MESBasic.potDataHandler.potData.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method MESBasic.potDataHandler.potData.dataList.deldataList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.potDataHandler.potData.dataList.deldataList = function(param) {
				var buttonCode='MESBasic_1_potDataHandler_dataList_BUTTON_dataDel';
				if(MESBasic.potDataHandler.potData.dataList.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows.length ; i++){
                        var cid = datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("MESBasic.buttonPropertyshowName.radion1414981388059")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/MESBasic/potDataHandler/potData/delete.action?ids=" + MESBasic.potDataHandler.potData.dataList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}dataList_dataDel_del_MESBasic_1_potDataHandler_dataList')}", MESBasic.potDataHandler.potData.callBackInfo, "json");
					}
				});
				}
			};
			
			MESBasic.potDataHandler.potData.dataList.importCallbackFunc = function(res){
				CUI.Dialog.toggleAllButton();
				var queryFunc = datatable_ec_MESBasic_potDataHandler_potData_dataList_query.get('queryFunc');
				var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_potDataHandler_potData_dataList_queryWidget.dataTableId).val();
				var resNodeId = -1;
				if(undefined != res && undefined != res.operate){
					resNodeId = res.operate;
				}
				if(null != queryFunc && "undefined" != queryFunc){
					if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
						var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
						var node = layout.getNode();
						MESBasic.potDataHandler.potData.dataList.node = node;	
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
						} else {
							eval(queryFunc);
						}
						layout.refreshTree(-1);
					}else{
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
						} else {
							eval(queryFunc);
						}
					}			
				} else {
					var needSort = ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false;
					if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
						var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
						var node = layout.getNode();
						MESBasic.potDataHandler.potData.dataList.node = node;	
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
						} else {
							MESBasic.potDataHandler.potData.dataList.query('query');
						}
						layout.refreshTree(-1);
					}else{
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
						} else {
							MESBasic.potDataHandler.potData.dataList.query('query');
						}
					}
				}
			};
			
			
			var dataList_importdataList_importDialog = null;
			MESBasic.potDataHandler.potData.dataList.importdataList = function(){
				var buttonCode='MESBasic_1_potDataHandler_dataList_BUTTON_importTags';
				try{
					if(dataList_importdataList_importDialog!=null&&dataList_importdataList_importDialog.isShow==1){
						return false;
					}
					var queryFunc = 'MESBasic.potDataHandler.potData.dataList.importCallbackFunc()';
					var url = "/MESBasic/potDataHandler/potData/initMainImport.action?viewCode=MESBasic_1_potDataHandler_dataList&callBackFuncName=" + queryFunc+"&buttonCode="+buttonCode;
					dataList_importdataList_importDialog = new CUI.Dialog({
						title: "${getHtmlText('common.button.import')}",
						url:url,
						modal:true,
						description:'',
						height:'330',
						width: '420',
						dragable:true,
						buttons:[{id:"replaceAndImport",display:'hidden',name:"${getHtmlText('common.button.import.replace')}",handler:function(){foundation.importExcel.submitImportForm(true,false);}},{id:"ignoreAndImport",display:'hidden',name:"${getHtmlText('common.button.import.ignore')}",handler:function(){foundation.importExcel.submitImportForm(false,true);}},{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){foundation.importExcel.submitImportForm(false,false);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();dataList_importdataList_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();dataList_importdataList_importDialog.close();}, 200);}}],
						beforeCloseEvent:function(){$('#importResponse').remove();}
					});
					dataList_importdataList_importDialog.show();
				}catch(e){}
			}
			
			MESBasic.potDataHandler.potData.dataList.downloadTemplatedataList = function(){
				//var url = "/MESBasic/potDataHandler/potData/templateDownLoad.action?viewCode=MESBasic_1_potDataHandler_dataList&downloadType=mainTemplate&fileName=MESBasic_1_potDataHandler_dataList-importTemplate.xls";
				$.ajax({
					url : "/foundation/workbench/getImportTemplate.action?modelCode="+"MESBasic_1_potDataHandler_PotData",
					type : 'post',
					async : false,
					success : function(responseMap) {
						if(responseMap.dealSuccessFlag){
							var url = "/MESBasic/potDataHandler/potData/allTempleteDownload.action?viewCode=MESBasic_1_potDataHandler_dataList&downloadType=mainTemplate&fileName=MESBasic_1_potDataHandler_dataList-importTemplate.xls"
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
	 * @method MESBasic.potDataHandler.potData.callBackInfo
	 */
	MESBasic.potDataHandler.potData.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_potDataHandler_potData_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.potDataHandler.potData.dataList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_potDataHandler_potData_dataList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_potDataHandler_potData_dataList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
							    		var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.potDataHandler.potData.dataList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_potDataHandler_PotData'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
										var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.potDataHandler.potData.dataList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.potDataHandler.potData.dataList.query('query');
								    	}
										if(modelCode == 'MESBasic_1_potDataHandler_PotData'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.potDataHandler.potData.dataList.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_potDataHandler_potData_dataList_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_potDataHandler_potData_dataList_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
								    		var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.potDataHandler.potData.dataList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_potDataHandler_PotData'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.potDataHandler.potData.dataList.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
											var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.potDataHandler.potData.dataList.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.potDataHandler.potData.dataList.query('query');
									    	}
											if(modelCode == 'MESBasic_1_potDataHandler_PotData'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.potDataHandler.potData.dataList.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.potDataHandler.potData.dataList.query('query');
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
	 * @method MESBasic.potDataHandler.potData.dataList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.potDataHandler.potData.dataList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method MESBasic.potDataHandler.potData.dataList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	MESBasic.potDataHandler.potData.dataList.checkSelectedValid = function(type) {
		if(MESBasic.potDataHandler.potData.dataList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows[i].valid === false){
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
	 * @method MESBasic.potDataHandler.potData.dataList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.potDataHandler.potData.dataList.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.potDataHandler.potData.dataList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.potDataHandler.potData.dataList.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_potDataHandler_potData_dataList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method MESBasic.potDataHandler.potData.dataList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.potDataHandler.potData.dataList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.potDataHandler.potData.dataList.otherParams || {};
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
				<#assign editView = getViewByCode('MESBasic_1_potDataHandler_dataEdit')>
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
												list_operate_potDataHandler_dataList.${funcname};
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
			
			
			
					if(viewCode=='MESBasic_1_potDataHandler_dataView'||!viewCode){
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
					list_operate_potDataHandler_dataList.CUI('#'+formId).submit();
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
		if ( MESBasic.potDataHandler.potData.dataList.Dlg ) {
			MESBasic.potDataHandler.potData.dataList.Dlg._config.url = url;
			MESBasic.potDataHandler.potData.dataList.Dlg._config.formId = formId;
			MESBasic.potDataHandler.potData.dataList.Dlg.setTitle( title )
			MESBasic.potDataHandler.potData.dataList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.potDataHandler.potData.dataList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_potDataHandler_dataList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.potDataHandler.potData.dataList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.potDataHandler.potData.dataList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_potDataHandler_potData', element : $('#MESBasic_potDataHandler_potData_dataList_fileupload_button a:eq(1)')});
		}
		MESBasic.potDataHandler.potData.dataList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.potDataHandler.potData.dataList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.potDataHandler.potData.dataList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.potDataHandler.potData.dataList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.potDataHandler.potData.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.potDataHandler.potData.dataList.AppDlg.show();
	};

	MESBasic.potDataHandler.potData.dataList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.potDataHandler.potData.dataList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.potDataHandler.potData.dataList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.potDataHandler.potData.dataList.cancelSelectedNode == 'function') {
	   MESBasic.potDataHandler.potData.dataList.cancelSelectedNode();
	   MESBasic.potDataHandler.potData.dataList.node = null;
	  }
	  if(typeof MESBasic_potDataHandler_potData_dataList_cancelSelectedNode == 'function') {
	   MESBasic_potDataHandler_potData_dataList_cancelSelectedNode();
	   MESBasic.potDataHandler.potData.dataList.node = null;
	  }
	  MESBasic.potDataHandler.potData.dataList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.potDataHandler.potData.dataList.query
	 */
	MESBasic.potDataHandler.potData.dataList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.potDataHandler.potData.dataList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.potDataHandler.potData.dataList.node = null;
		if(!checkListValid("ec_MESBasic_potDataHandler_potData_dataList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_potDataHandler_potData_dataList_query._sortKey && datatable_ec_MESBasic_potDataHandler_potData_dataList_query._sortMethod){
			CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_potDataHandler_potData_dataList_query._sortKey);
			CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_potDataHandler_potData_dataList_query._sortColumnName);
			CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_potDataHandler_potData_dataList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_potDataHandler_potData_dataList_query._sortKey = '';
			CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_potDataHandler_potData_dataList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.potDataHandler.potData.dataList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/potDataHandler/potData/dataList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/potDataHandler/potData/dataList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_potDataHandler_potData_dataList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_potDataHandler_dataList";
		condobj.modelAlias="potData";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_potDataHandler_potData_dataList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_potDataHandler_potData_dataList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_potDataHandler_potData_dataList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_potDataHandler_potData_dataList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name="'+ec_MESBasic_potDataHandler_potData_dataList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_potDataHandler_potData_dataList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_potDataHandler_potData_dataList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_potDataHandler_potData_dataList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_potDataHandler_potData_dataList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_potDataHandler_potData_dataList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_potDataHandler_dataList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_potDataHandler_potData_dataList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_potDataHandler_potData_dataList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.potDataHandler.potData.dataList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_potDataHandler";
		openExportFrame(url);
	}
MESBasic.potDataHandler.potData.dataList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.potDataHandler.potData.dataList.otherParams = {};
	MESBasic.potDataHandler.potData.dataList.otherParams.dialogType = dialogType;
	MESBasic.potDataHandler.potData.dataList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.potDataHandler.potData.dataList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.potDataHandler.potData.editCallBackInfo
 */
MESBasic.potDataHandler.potData.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_potDataHandler_potData_dataList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_potDataHandler_potData_dataList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
    		var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.potDataHandler.potData.dataList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_potDataHandler_PotData'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortKey && ec_MESBasic_potDataHandler_potData_dataList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_potDataHandler_potData_dataList_getLayout == "function"){
			var layout = MESBasic_potDataHandler_potData_dataList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.potDataHandler.potData.dataList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.potDataHandler.potData.dataList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_potDataHandler_PotData'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.potDataHandler.potData.dataList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.potDataHandler.potData.dataList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="dataTime_start"]').val()!= null && $('#' + formId + ' input[name^="dataTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="dataTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1455958915407')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="dataTime_end"]').val()!= null && $('#' + formId + ' input[name^="dataTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="dataTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1455958915407')}${getText('ec.list.validate.datetime')}");return false;}}var tvalue_start = $('#' + formId + ' input[name^="tvalue_start"]').val();var tvalue_end = $('#' + formId + ' input[name^="tvalue_end"]').val();if(tvalue_start != null && tvalue_start != ''){if(!isDecimal(tvalue_start)){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1455958988465')}${getText('ec.list.validate.decimal')}");return false;}}if(tvalue_end != null && tvalue_end != ''){if(!isDecimal(tvalue_end)){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1455958988465')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name="tvalue_start"]').val()!='' && $('#' + formId + ' input[name="tvalue_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="tvalue_start"]').val()) > parseInt($('#' + formId + ' input[name="tvalue_end"]').val())){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1455958988465')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('MESBasic.propertydisplayName.randon1455958988465')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="dataTime_start"]').val()!='' && $('#' + formId + ' input[name="dataTime_end"]').val()!=''){if($('#' + formId + ' input[name="dataTime_start"]').val() > $('#' + formId + ' input[name="dataTime_end"]').val()){errorbarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1455958915407')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('MESBasic.propertydisplayName.randon1455958915407')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_potDataHandler_dataList,js,MESBasic_1_potDataHandler_PotData,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_potDataHandler_dataList' idprefix='ec_MESBasic_potDataHandler_potData_dataList' queryUrl='/MESBasic/potDataHandler/potData/dataList-query.action' queryFunc="MESBasic.potDataHandler.potData.dataList.query" ns="MESBasic.potDataHandler.potData.dataList" />
<@exportexcel action="/MESBasic/potDataHandler/potData/dataList-query.action"   getRequireDataAction="/MESBasic/potDataHandler/potData/dataList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_potDataHandler_PotData&&viewCode=MESBasic_1_potDataHandler_dataList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_potDataHandler_dataList')}" prefix="ec_MESBasic_potDataHandler_potData_dataList_query" modelCode="MESBasic_1_potDataHandler_PotData"  importFlag="false" viewCode="MESBasic_1_potDataHandler_dataList" />
