<!-- MESBasic_1/area/areaList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1524636800978')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_area_areaList,head,MESBasic_1_area_Area,MESBasic_1) -->
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
	CUI.ns('MESBasic.area.area','MESBasic.area.area.areaList');
</script>
<#if permissionCode?? && permissionCode?has_content>
	<#assign buttonPerfix = permissionCode + "_" >
</#if>
<#if viewShowType?? && viewShowType == 'PART'>
<@frameset id="ec_MESBasic_area_area_areaList_container" border=0>
	<@frame id="ec_MESBasic_area_area_areaList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "areaList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#else>
<#include "areaList-fastquery-datatable.ftl">
</#if>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_area_areaList,html,MESBasic_1_area_Area,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.area.area.areaList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.area.area.areaList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.area.area.areaList._prefix += '.';
			}
			MESBasic.area.area.areaList._prefix += arr[i];
		}
		MESBasic.area.area.areaList._suffix = arr[arr.length -1];
		if(MESBasic.area.area.areaList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.area.area.areaList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.area.area.areaList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.area.area.areaList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.area.area.areaList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_area_area_areaList_queryForm *[name="'+MESBasic.area.area.areaList._prefix + '.' + MESBasic.area.area.areaList._suffix +'"]').val(obj[0][MESBasic.area.area.areaList._suffix]);
		CUI('#ec_MESBasic_area_area_areaList_queryForm *[name="'+MESBasic.area.area.areaList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_area_area_areaList_queryForm *[name^="'+MESBasic.area.area.areaList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_area_area_areaList_queryForm *[name="'+MESBasic.area.area.areaList._prefix + '.' + MESBasic.area.area.areaList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_area_area_areaList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.area.area.areaList._dialog) {
			MESBasic.area.area.areaList._dialog.close();
		}
	};
	
	MESBasic.area.area.areaList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.area.area.areaList.query_"+obj+")!='undefined'") ? eval('MESBasic.area.area.areaList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_area_area_areaList_refresh = function(node){
MESBasic.area.area.areaList.node = node;
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
	MESBasic.area.area.areaList.query("query");
}

MESBasic_area_area_areaList_getList = function() {
	return "MESBasic.area.area.areaList";
}
MESBasic.area.area.areaList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_area_area_areaListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.area.area.areaList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.area.area.areaList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_area_area_areaList_fileupload_button",
		handler:function(){
				list_operate_area_areaList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.area.area.areaList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_area_areaList.MESBasic.area.area." + params.viewName + ".referenceCopy");
			funcName('area', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.area.area.areaList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_area_areaList.MESBasic.area.area." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.area.area.areaList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_area_areaList.MESBasic.area.area." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('MESBasic_1_area_areaEdit')>
			/**
			 * 列表新增
			 * @method MESBasic.area.area.areaList.addareaList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.area.area.areaList.addareaList = function() {
				var buttonCode='MESBasic_1_area_areaList_BUTTON_add5';
					var treeParam = "";
					if(typeof MESBasic_area_area_areaList_getLayout == "function"){
						var layout = MESBasic_area_area_areaList_getLayout();
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
							if(modelCode == 'MESBasic_1_area_Area'.replace(/\./g, '\_')){
								treeParam = '&area.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&area.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = MESBasic.area.area.areaList.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = MESBasic.area.area.areaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						MESBasic.area.area.areaList.otherParams = otherParams;

						var url='${editView.url}?entityCode=MESBasic_1_area' + "&${getPowerCode('${buttonPerfix!}areaList_add5_add_MESBasic_1_area_areaList')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_area_areaList';
						MESBasic.area.area.areaList.showDialog(url,'MESBasic_area_area_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=MESBasic_1_area' + "&${getPowerCode('${buttonPerfix!}areaList_add5_add_MESBasic_1_area_areaList')}";
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
			
			<#assign editView = getViewByCode('MESBasic_1_area_areaNewEdit')>
			/**
			 * 列表编辑
			 * @method MESBasic.area.area.areaList.modifyareaList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.area.area.areaList.modifyareaList = function() {
				var buttonCode='MESBasic_1_area_areaList_BUTTON_edit';
				if(MESBasic.area.area.areaList.checkSelectedAny()){
					if(MESBasic.area.area.areaList.checkSelectedMore()) {
						var cid = ec_MESBasic_area_area_areaList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = MESBasic.area.area.areaList.getOperateRecordId();
							otherParams.uploadBtn = MESBasic.area.area.areaList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = MESBasic.area.area.areaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = MESBasic.area.area.areaList.createPrintBtn('${editView.name}','${editView.url}?entityCode=MESBasic_1_area&id=' + MESBasic.area.area.areaList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}areaList_edit_modify_MESBasic_1_area_areaList')}");
							otherParams.printSettingBtn = MESBasic.area.area.areaList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							MESBasic.area.area.areaList.otherParams = otherParams;

							MESBasic.area.area.areaList.showDialog('${editView.url}?entityCode=MESBasic_1_area&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_area_areaList'+'&id=' + MESBasic.area.area.areaList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}areaList_edit_modify_MESBasic_1_area_areaList')}",'MESBasic_area_area_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=MESBasic_1_area'+signatureStr+'&id=' + MESBasic.area.area.areaList.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}areaList_edit_modify_MESBasic_1_area_areaList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method MESBasic.area.area.areaList.dbmodifyareaList
			 */
			MESBasic.area.area.areaList.dbmodifyareaList =function(event,oRow){
				var buttonCode='MESBasic_1_area_areaList_BUTTON_edit';
				var cid = ec_MESBasic_area_area_areaList_queryWidget.getSelectedRow()[0].cid;
				var checkPowerUrl="";
				if(cid != undefined){
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}areaList_edit_modify_MESBasic_1_area_areaList&companyId="+cid;
		        }else{
		            checkPowerUrl="/foundation/userPermission/checkUserPower.action?menuOperateCodes=${buttonPerfix!}areaList_edit_modify_MESBasic_1_area_areaList";
		        }
   				CUI.ajax({
		   		   type: "POST",
		   		   async: false,
		   		   url: checkPowerUrl,
		   		   data:"",
		   		   success: function(res){
   			    	if(res['${buttonPerfix!}areaList_edit_modify_MESBasic_1_area_areaList'] == true) {
					var url = "${editView.url}?entityCode=MESBasic_1_area&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_area_areaList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}areaList_edit_modify_MESBasic_1_area_areaList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = MESBasic.area.area.areaList.getOperateRecordId();
					otherParams.uploadBtn = MESBasic.area.area.areaList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = MESBasic.area.area.areaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = MESBasic.area.area.areaList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = MESBasic.area.area.areaList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					MESBasic.area.area.areaList.otherParams = otherParams;

					MESBasic.area.area.areaList.showDialog(url,'MESBasic_area_area_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
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
							openFullScreen(viewUrl + "?entityCode=MESBasic_1_area&id=" + oRow.id);
						}
					}	
				}
   				});	
			};
			
				function deleteAreaTree() { 
							
	if(MESBasic.area.area.areaList.checkSelectedAny()){
		var delRow = MESBasic.area.area.areaList.getOperateRecordId('del').split("@");
		var isLeaf="";
		var hasBaseInfo="";
		var cid = ec_MESBasic_area_area_areaList_queryWidget.getSelectedRow()[0].cid;
		if(cid!='${Session.company.id}'){
			workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
			return;
		}
		if(delRow!=""){
			$.ajax( {
				type : 'POST',
				async:false,
				url : '/MESBasic/area/area/isLeafAndHasBaseInfo.action',
				data : {
					'areaID' : delRow[0]
				},
				success : function(msg) {
					isLeaf =msg.isLeaf;
					hasBaseInfo=msg.hasBaseInfo
				}
			});
			if(isLeaf=='0'){
				workbenchErrorBarWidget.showMessage('该区域已存在子目录，不能删除','f');
				return false;
			}
			if(hasBaseInfo=='1'){
				workbenchErrorBarWidget.showMessage('该区域已被设备引用，不能删除','f');
				return false;
			}
		}
			
		CUI.Dialog.confirm("${getText('foundation.role.checkdelete')}", function(){	
			CUI.post("/MESBasic/area/area/delete.action?ids=" + MESBasic.area.area.areaList.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}areaList_deleteTree_del_MESBasic_1_area_areaList')}",MESBasic.area.area.callBackInfo, "json");
		});
	}

				};;
			MESBasic.area.area.areaList.importCallbackFunc = function(res){
				CUI.Dialog.toggleAllButton();
				var queryFunc = datatable_ec_MESBasic_area_area_areaList_query.get('queryFunc');
				var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_area_area_areaList_queryWidget.dataTableId).val();
				var resNodeId = -1;
				if(undefined != res && undefined != res.operate){
					resNodeId = res.operate;
				}
				if(null != queryFunc && "undefined" != queryFunc){
					if(typeof MESBasic_area_area_areaList_getLayout == "function"){
						var layout = MESBasic_area_area_areaList_getLayout();
						var node = layout.getNode();
						MESBasic.area.area.areaList.node = node;	
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
						} else {
							eval(queryFunc);
						}
						layout.refreshTree(-1);
					}else{
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
						} else {
							eval(queryFunc);
						}
					}			
				} else {
					var needSort = ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false;
					if(typeof MESBasic_area_area_areaList_getLayout == "function"){
						var layout = MESBasic_area_area_areaList_getLayout();
						var node = layout.getNode();
						MESBasic.area.area.areaList.node = node;	
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
						} else {
							MESBasic.area.area.areaList.query('query');
						}
						layout.refreshTree(-1);
					}else{
						if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
						} else {
							MESBasic.area.area.areaList.query('query');
						}
					}
				}
			};
			
			
			var areaList_importareaList_importDialog = null;
			MESBasic.area.area.areaList.importareaList = function(){
				var buttonCode='MESBasic_1_area_areaList_BUTTON_inport';
				try{
					if(areaList_importareaList_importDialog!=null&&areaList_importareaList_importDialog.isShow==1){
						return false;
					}
					var queryFunc = 'MESBasic.area.area.areaList.importCallbackFunc()';
					var url = "/MESBasic/area/area/initMainImport.action?viewCode=MESBasic_1_area_areaList&callBackFuncName=" + queryFunc+"&buttonCode="+buttonCode;
					areaList_importareaList_importDialog = new CUI.Dialog({
						title: "${getHtmlText('common.button.import')}",
						url:url,
						modal:true,
						description:'',
						height:'330',
						width: '420',
						dragable:true,
						buttons:[{id:"replaceAndImport",display:'hidden',name:"${getHtmlText('common.button.import.replace')}",handler:function(){foundation.importExcel.submitImportForm(true,false);}},{id:"ignoreAndImport",display:'hidden',name:"${getHtmlText('common.button.import.ignore')}",handler:function(){foundation.importExcel.submitImportForm(false,true);}},{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){foundation.importExcel.submitImportForm(false,false);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();areaList_importareaList_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();areaList_importareaList_importDialog.close();}, 200);}}],
						beforeCloseEvent:function(){$('#importResponse').remove();}
					});
					areaList_importareaList_importDialog.show();
				}catch(e){}
			}
			
			MESBasic.area.area.areaList.downloadTemplateareaList = function(){
				//var url = "/MESBasic/area/area/templateDownLoad.action?viewCode=MESBasic_1_area_areaList&downloadType=mainTemplate&fileName=MESBasic_1_area_areaList-importTemplate.xls";
				$.ajax({
					url : "/foundation/workbench/getImportTemplate.action?modelCode="+"MESBasic_1_area_Area",
					type : 'post',
					async : false,
					success : function(responseMap) {
						if(responseMap.dealSuccessFlag){
							var url = "/MESBasic/area/area/allTempleteDownload.action?viewCode=MESBasic_1_area_areaList&downloadType=mainTemplate&fileName=MESBasic_1_area_areaList-importTemplate.xls"
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
	 * @method MESBasic.area.area.callBackInfo
	 */
	MESBasic.area.area.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_area_area_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.area.area.areaList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var queryFunc = datatable_ec_MESBasic_area_area_areaList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_area_area_areaList_queryWidget.dataTableId).val();
							    if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_area_area_areaList_getLayout == "function"){
							    		var layout = MESBasic_area_area_areaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.area.area.areaList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_area_Area'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}			
								} else {
									var needSort = ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_area_area_areaList_getLayout == "function"){
										var layout = MESBasic_area_area_areaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.area.area.areaList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.area.area.areaList.query('query');
								    	}
										if(modelCode == 'MESBasic_1_area_Area'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.area.area.areaList.query('query');
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
	 * @method MESBasic.area.area.areaList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.area.area.areaList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_area_area_areaList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_area_area_areaList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_area_area_areaList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method MESBasic.area.area.areaList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	MESBasic.area.area.areaList.checkSelectedValid = function(type) {
		if(MESBasic.area.area.areaList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_MESBasic_area_area_areaList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_MESBasic_area_area_areaList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_MESBasic_area_area_areaList_query.selectedRows[i].valid === false){
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
	 * @method MESBasic.area.area.areaList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.area.area.areaList.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_area_area_areaList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.area.area.areaList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.area.area.areaList.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_area_area_areaList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method MESBasic.area.area.areaList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.area.area.areaList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.area.area.areaList.otherParams || {};
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
				<#assign editView = getViewByCode('MESBasic_1_area_areaEdit')>
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
												list_operate_area_areaList.${funcname};
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
				<#assign editView = getViewByCode('MESBasic_1_area_areaNewEdit')>
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
												list_operate_area_areaList.${funcname};
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
					list_operate_area_areaList.CUI('#'+formId).submit();
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
		if ( MESBasic.area.area.areaList.Dlg ) {
			MESBasic.area.area.areaList.Dlg._config.url = url;
			MESBasic.area.area.areaList.Dlg._config.formId = formId;
			MESBasic.area.area.areaList.Dlg.setTitle( title )
			MESBasic.area.area.areaList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.area.area.areaList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_area_areaList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.area.area.areaList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.area.area.areaList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_area_area', element : $('#MESBasic_area_area_areaList_fileupload_button a:eq(1)')});
		}
		MESBasic.area.area.areaList.otherParams = {};
	};

	MESBasic.area.area.areaList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.area.area.areaList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.area.area.areaList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.area.area.areaList.cancelSelectedNode == 'function') {
	   MESBasic.area.area.areaList.cancelSelectedNode();
	   MESBasic.area.area.areaList.node = null;
	  }
	  if(typeof MESBasic_area_area_areaList_cancelSelectedNode == 'function') {
	   MESBasic_area_area_areaList_cancelSelectedNode();
	   MESBasic.area.area.areaList.node = null;
	  }
	  MESBasic.area.area.areaList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.area.area.areaList.query
	 */
	MESBasic.area.area.areaList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.area.area.areaList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.area.area.areaList.node = null;
		if(!checkListValid("ec_MESBasic_area_area_areaList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_area_area_areaList_query._sortKey && datatable_ec_MESBasic_area_area_areaList_query._sortMethod){
			CUI('#ec_MESBasic_area_area_areaList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_area_area_areaList_query._sortKey);
			CUI('#ec_MESBasic_area_area_areaList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_area_area_areaList_query._sortColumnName);
			CUI('#ec_MESBasic_area_area_areaList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_area_area_areaList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_area_area_areaList_query._sortKey = '';
			CUI('#ec_MESBasic_area_area_areaList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_area_area_areaList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_area_area_areaList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_area_area_areaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.area.area.areaList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/area/area/areaList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/area/area/areaList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_area_area_areaList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_area_area_areaList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_area_areaList";
		condobj.modelAlias="area";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_area_area_areaList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_area_area_areaList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_area_area_areaList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_area_area_areaList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_area_area_areaList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_area_area_areaList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_area_area_areaList_queryForm *[name="'+ec_MESBasic_area_area_areaList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_area_area_areaList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_area_area_areaList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_area_area_areaList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_area_area_areaList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_area_area_areaList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_area_areaList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_area_area_areaList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_area_area_areaList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.area.area.areaList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_area";
		openExportFrame(url);
	}
MESBasic.area.area.areaList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.area.area.areaList.otherParams = {};
	MESBasic.area.area.areaList.otherParams.dialogType = dialogType;
	MESBasic.area.area.areaList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.area.area.areaList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.area.area.editCallBackInfo
 */
MESBasic.area.area.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_area_area_areaList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_area_area_areaList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_area_area_areaList_getLayout == "function"){
    		var layout = MESBasic_area_area_areaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.area.area.areaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_area_Area'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_area_area_areaList_getLayout == "function"){
			var layout = MESBasic_area_area_areaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.area.area.areaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.area.area.areaList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_area_Area'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.area.area.areaList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_area_areaList,js,MESBasic_1_area_Area,MESBasic_1) */
// 自定义代码
  MESBasic.area.area.callBackInfo = function(res){
  var queryFunc = datatable_ec_MESBasic_area_area_areaList_query.get('queryFunc');
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_area_area_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.area.area.areaList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save') {
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_area_area_areaList_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_area_area_areaList_getLayout == "function"){
							    		var layout = MESBasic_area_area_areaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.area.area.areaList.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_area_Area'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_area_area_areaList_getLayout == "function"){
										var layout = MESBasic_area_area_areaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.area.area.areaList.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.area.area.areaList.query('query');
								    	}
										if(modelCode == 'MESBasic_1_area_Area'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.area.area.areaList.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_area_area_areaList_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_area_area_areaList_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_area_area_areaList_getLayout == "function"){
								    		var layout = MESBasic_area_area_areaList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.area.area.areaList.node = node	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_area_Area'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.area.area.areaList.node = null;
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_area_area_areaList_queryWidget._sortKey && ec_MESBasic_area_area_areaList_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_area_area_areaList_getLayout == "function"){
											var layout = MESBasic_area_area_areaList_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.area.area.areaList.node = node	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.area.area.areaList.query('query');
									    	}
											if(modelCode == 'MESBasic_1_area_Area'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.area.area.areaList.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.area.area.areaList.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.area.area.areaList.query('query');
									    	}
										}
									}
								}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_area_areaList' idprefix='ec_MESBasic_area_area_areaList' queryUrl='/MESBasic/area/area/areaList-query.action' queryFunc="MESBasic.area.area.areaList.query" ns="MESBasic.area.area.areaList" />
<@exportexcel action="/MESBasic/area/area/areaList-query.action"   getRequireDataAction="/MESBasic/area/area/areaList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_area_Area&&viewCode=MESBasic_1_area_areaList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_area_areaList')}" prefix="ec_MESBasic_area_area_areaList_query" modelCode="MESBasic_1_area_Area"  importFlag="false" viewCode="MESBasic_1_area_areaList" />
