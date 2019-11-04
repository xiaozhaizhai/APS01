<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('MESBasic.viewtitle.radion1421288474675')}</title>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.prodtype.prodtype.ptrec");
</script>
<input type="hidden" name="MESBasic_prodtype_prodtype_ptrec_callBackFuncName" id="MESBasic_prodtype_prodtype_ptrec_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_prodtype_prodtype_ptrecErrorbar" />
<@frameset id="ec_MESBasic_prodtype_prodtype_ptrec_container" border=0>
	<@frame id="ec_MESBasic_prodtype_prodtype_ptrec_container_main"  offsetH=4 region="center" class="center_in">
	<#include "ptrec-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	  <@frame id="ec_MESBasic_prodtype_prodtype_ptrec_button" region="south" height=28>
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
				<div class="edit-btn btn-act" id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_prodtype_prodtype_ptrec_queryForm')">
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
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_prodtype_ptrec,html,MESBasic_1_prodtype_Prodtype,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.prodtype.prodtype.ptrec.sendBackptrec(null,datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method MESBasic.prodtype.prodtype.ptrec.query
	 */
	MESBasic.prodtype.prodtype.ptrec.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_prodtype_prodtype_ptrec_queryForm")) {
				return false;
		}
		var node = MESBasic.prodtype.prodtype.ptrec.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/prodtype/prodtype/ptrec-query.action";
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_prodtype_prodtype_ptrec_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_prodtype_prodtype_ptrec_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_prodtype_ptrec';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.prodtype.prodtype.ptrec._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.prodtype.prodtype.ptrec._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.prodtype.prodtype.ptrec._prefix += '.';
			}
			MESBasic.prodtype.prodtype.ptrec._prefix += arr[i];
		}
		MESBasic.prodtype.prodtype.ptrec._suffix = arr[arr.length -1];
		if(MESBasic.prodtype.prodtype.ptrec._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.prodtype.prodtype.ptrec._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.prodtype.prodtype.ptrec._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.prodtype.prodtype.ptrec.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.prodtype.prodtype.ptrec.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+MESBasic.prodtype.prodtype.ptrec._prefix + '.' + MESBasic.prodtype.prodtype.ptrec._suffix +'"]').val(obj[0][MESBasic.prodtype.prodtype.ptrec._suffix]);
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+MESBasic.prodtype.prodtype.ptrec._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name^="'+MESBasic.prodtype.prodtype.ptrec._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+MESBasic.prodtype.prodtype.ptrec._prefix + '.' + MESBasic.prodtype.prodtype.ptrec._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.prodtype.prodtype.ptrec._dialog) {
			MESBasic.prodtype.prodtype.ptrec._dialog.close();
		}
	};
	
	MESBasic.prodtype.prodtype.ptrec._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.prodtype.prodtype.ptrec.query_"+obj+")!='undefined'") ? eval('MESBasic.prodtype.prodtype.ptrec.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.prodtype.prodtype.ptrec.sendBackptrec(null,datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.prodtype.prodtype.ptrec.sendBackptrec
	 */
	MESBasic.prodtype.prodtype.ptrec.sendBackptrec = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.prodtype.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_prodtype_prodtype_ptrec_callBackFuncName").val() != ""){
				<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
				var flag = eval("opener." + CUI("#MESBasic_prodtype_prodtype_ptrec_callBackFuncName").val() + "(arrObj)");
				<#else>
				var flag = eval(CUI("#MESBasic_prodtype_prodtype_ptrec_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_prodtype_prodtype_ptrecErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_prodtype_prodtype_ptrecErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_prodtype_prodtype_ptrec_refresh = function(node){
	//var url = "/MESBasic/prodtype/prodtype/ptrec-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.prodtype.prodtype.ptrec.node = node;
	MESBasic.prodtype.prodtype.ptrec.query("query");
}

MESBasic_prodtype_prodtype_ptrec_getList = function() {
	return "MESBasic.prodtype.prodtype.ptrec";
}
MESBasic.prodtype.prodtype.ptrec.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.prodtype.prodtype.ptrec.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.prodtype.prodtype.ptrec.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.prodtype.prodtype.ptrec.otherParams || {};
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
		MESBasic.prodtype.prodtype.ptrec.Dlg =	new CUI.Dialog({
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
		MESBasic.prodtype.prodtype.ptrec.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_prodtype_prodtype', element : $('#MESBasic_prodtype_prodtype_ptrec_fileupload_button a:eq(1)')});
		}
		MESBasic.prodtype.prodtype.ptrec.otherParams = {};
	};
	MESBasic.prodtype.prodtype.ptrec.commonQuery = function(type) {
	  if(typeof MESBasic.prodtype.prodtype.ptrec.cancelSelectedNode == 'function') {
	   MESBasic.prodtype.prodtype.ptrec.cancelSelectedNode();
	   MESBasic.prodtype.prodtype.ptrec.node = null;
	  }
	  if(typeof MESBasic_prodtype_prodtype_ptrec_cancelSelectedNode == 'function') {
	   MESBasic_prodtype_prodtype_ptrec_cancelSelectedNode();
	   MESBasic.prodtype.prodtype.ptrec.node = null;
	  }
	  MESBasic.prodtype.prodtype.ptrec.query(type);
	 };
	
	
	
	MESBasic.prodtype.prodtype.ptrec.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_prodtype";
		openExportFrame(url);
	}
MESBasic.prodtype.prodtype.ptrec.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.prodtype.prodtype.ptrec.otherParams = {};
	MESBasic.prodtype.prodtype.ptrec.otherParams.dialogType = dialogType;
	MESBasic.prodtype.prodtype.ptrec.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.prodtype.prodtype.ptrec.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_prodtype_ptrec,js,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/prodtype/prodtype/ptrec-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_prodtype_ptrec')}" prefix="ec_MESBasic_prodtype_prodtype_ptrec_query"/>
