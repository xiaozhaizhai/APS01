<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('MESBasic.viewtitle.radion1415322277102')}</title>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.material.material.materialRef");
</script>
<input type="hidden" name="MESBasic_material_material_materialRef_callBackFuncName" id="MESBasic_material_material_materialRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_material_material_materialRefErrorbar" />
<@frameset id="ec_MESBasic_material_material_materialRef_container" border=0>
	<@frame id="ec_MESBasic_material_material_materialRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "materialRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	  <@frame id="ec_MESBasic_material_material_materialRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<div class="edit-btn btn-act" id="bottom-submit">
					<a class="cui-btn-l">&nbsp;</a>
					<a class="cui-btn-c">${getHtmlText('common.button.choose')}</a>
					<a class="cui-btn-r">&nbsp;</a>
				</div>
	     	<#else>
	     		<div class="edit-btn btn-act" id="bottom-submit">
					<a class="cui-btn-l">&nbsp;</a>
					<a class="cui-btn-c">${getHtmlText('common.button.chooseandclose')}</a>
					<a class="cui-btn-r">&nbsp;</a>
				</div>
			</#if>
				<div class="edit-btn btn-act" id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_material_material_materialRef_queryForm')">
					<a class="cui-btn-l">&nbsp;</a>
					<a class="cui-btn-c">${getHtmlText('common.button.cancel')}</a>
					<a class="cui-btn-r">&nbsp;</a>
				</div>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_material_materialRef,html,MESBasic_1_material_Material,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.material.material.materialRef.sendBackmaterialRef(null,datatable_ec_MESBasic_material_material_materialRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method MESBasic.material.material.materialRef.query
	 */
	MESBasic.material.material.materialRef.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_material_material_materialRef_queryForm")) {
				return false;
		}
		var node = MESBasic.material.material.materialRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/material/material/materialRef-query.action";
		CUI('#ec_MESBasic_material_material_materialRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_material_material_materialRef_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_material_material_materialRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 00:00:00";
							}
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 23:59:59";
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
		var pageSize=CUI('input[name="ec_MESBasic_material_material_materialRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_material_material_materialRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_material_materialRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_material_material_materialRef_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.material.material.materialRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.material.material.materialRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.material.material.materialRef._prefix += '.';
			}
			MESBasic.material.material.materialRef._prefix += arr[i];
		}
		MESBasic.material.material.materialRef._suffix = arr[arr.length -1];
		if(MESBasic.material.material.materialRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.material.material.materialRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.material.material.materialRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.material.material.materialRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.material.material.materialRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+MESBasic.material.material.materialRef._prefix + '.' + MESBasic.material.material.materialRef._suffix +'"]').val(obj[0][MESBasic.material.material.materialRef._suffix]);
		CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+MESBasic.material.material.materialRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name^="'+MESBasic.material.material.materialRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+MESBasic.material.material.materialRef._prefix + '.' + MESBasic.material.material.materialRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_material_material_materialRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.material.material.materialRef._dialog) {
			MESBasic.material.material.materialRef._dialog.close();
		}
	};
	
	MESBasic.material.material.materialRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.material.material.materialRef.query_"+obj+")!='undefined'") ? eval('MESBasic.material.material.materialRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_material_material_materialRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.material.material.materialRef.sendBackmaterialRef(null,datatable_ec_MESBasic_material_material_materialRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.material.material.materialRef.sendBackmaterialRef
	 */
	MESBasic.material.material.materialRef.sendBackmaterialRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_material_material_materialRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.material.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_material_material_materialRef_callBackFuncName").val() != ""){
				<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
				var flag = eval("opener." + CUI("#MESBasic_material_material_materialRef_callBackFuncName").val() + "(arrObj)");
				<#else>
				var flag = eval(CUI("#MESBasic_material_material_materialRef_callBackFuncName").val() + "(arrObj)");
				</#if>
				if(flag === false){
					return flag;
				}
			}else{
				getDepartmentInfo(arrObj);
			}
			<#if (Parameters.openType)?? && (Parameters.openType) == 'page'><#if (Parameters.closePage)?default('false') == 'true'>
			setTimeout(function(){
				try {
					top.opener.focus();
					CUI.closeWindow();
				}catch(e){}
			},1000);
			</#if></#if>
			MESBasic_material_material_materialRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_material_material_materialRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_material_material_materialRef_refresh = function(node){
	//var url = "/MESBasic/material/material/materialRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_material_material_materialRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_material_material_materialRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.material.material.materialRef.node = node;
	MESBasic.material.material.materialRef.query("query");
}

MESBasic_material_material_materialRef_getList = function() {
	return "MESBasic.material.material.materialRef";
}
MESBasic.material.material.materialRef.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.material.material.materialRef.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.material.material.materialRef.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.material.material.materialRef.otherParams || {};
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
				handler:function(){CUI('#'+formId).submit();}
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
		MESBasic.material.material.materialRef.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 460,
			height: height || 330,
			type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.material.material.materialRef.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_material_material', element : $('#MESBasic_material_material_materialRef_fileupload_button a:eq(1)')});
		}
		MESBasic.material.material.materialRef.otherParams = {};
	};
	MESBasic.material.material.materialRef.commonQuery = function(type) {
	  if(typeof MESBasic.material.material.materialRef.cancelSelectedNode == 'function') {
	   MESBasic.material.material.materialRef.cancelSelectedNode();
	   MESBasic.material.material.materialRef.node = null;
	  }
	  if(typeof MESBasic_material_material_materialRef_cancelSelectedNode == 'function') {
	   MESBasic_material_material_materialRef_cancelSelectedNode();
	   MESBasic.material.material.materialRef.node = null;
	  }
	  MESBasic.material.material.materialRef.query(type);
	 };
	
	
	
	MESBasic.material.material.materialRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_material";
		openExportFrame(url);
	}
MESBasic.material.material.materialRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.material.material.materialRef.otherParams = {};
	MESBasic.material.material.materialRef.otherParams.dialogType = dialogType;
	MESBasic.material.material.materialRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.material.material.materialRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_material_materialRef,js,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/material/material/materialRef-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_material_materialRef')}" prefix="ec_MESBasic_material_material_materialRef_query"/>
