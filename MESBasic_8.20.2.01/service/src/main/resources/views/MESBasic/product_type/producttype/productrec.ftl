<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<@maincss/>
<@mainjs/>
</head>
<title>${getText('MESBasic.viewtitle.radion1419850050514')}</title>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.product_type.producttype.productrec");
</script>
<input type="hidden" name="MESBasic_product_type_producttype_productrec_callBackFuncName" id="MESBasic_product_type_producttype_productrec_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_product_type_producttype_productrecErrorbar" />
<@frameset id="ec_MESBasic_product_type_producttype_productrec_container" border=0>
	<@frame id="ec_MESBasic_product_type_producttype_productrec_container_main"  offsetH=4 region="center" class="center_in">
	<#include "productrec-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	  <@frame id="ec_MESBasic_product_type_producttype_productrec_button" region="south" height=28>
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
				<div class="edit-btn btn-act" id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_product_type_producttype_productrec_queryForm')">
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
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_type_productrec,html,MESBasic_1_product_type_Producttype,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.product_type.producttype.productrec.sendBackproductrec(null,datatable_ec_MESBasic_product_type_producttype_productrec_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method MESBasic.product_type.producttype.productrec.query
	 */
	MESBasic.product_type.producttype.productrec.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_product_type_producttype_productrec_queryForm")) {
				return false;
		}
		var node = MESBasic.product_type.producttype.productrec.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/product_type/producttype/productrec-query.action";
		CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_type_producttype_productrec_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_product_type_producttype_productrec_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_product_type_producttype_productrec_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_product_type_productrec';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_product_type_producttype_productrec_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.product_type.producttype.productrec._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product_type.producttype.productrec._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product_type.producttype.productrec._prefix += '.';
			}
			MESBasic.product_type.producttype.productrec._prefix += arr[i];
		}
		MESBasic.product_type.producttype.productrec._suffix = arr[arr.length -1];
		if(MESBasic.product_type.producttype.productrec._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product_type.producttype.productrec._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product_type.producttype.productrec._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product_type.producttype.productrec.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.product_type.producttype.productrec.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+MESBasic.product_type.producttype.productrec._prefix + '.' + MESBasic.product_type.producttype.productrec._suffix +'"]').val(obj[0][MESBasic.product_type.producttype.productrec._suffix]);
		CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+MESBasic.product_type.producttype.productrec._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name^="'+MESBasic.product_type.producttype.productrec._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+MESBasic.product_type.producttype.productrec._prefix + '.' + MESBasic.product_type.producttype.productrec._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_type_producttype_productrec_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.product_type.producttype.productrec._dialog) {
			MESBasic.product_type.producttype.productrec._dialog.close();
		}
	};
	
	MESBasic.product_type.producttype.productrec._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product_type.producttype.productrec.query_"+obj+")!='undefined'") ? eval('MESBasic.product_type.producttype.productrec.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_product_type_producttype_productrec_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.product_type.producttype.productrec.sendBackproductrec(null,datatable_ec_MESBasic_product_type_producttype_productrec_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.product_type.producttype.productrec.sendBackproductrec
	 */
	MESBasic.product_type.producttype.productrec.sendBackproductrec = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_product_type_producttype_productrec_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.producttype.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_product_type_producttype_productrec_callBackFuncName").val() != ""){
				<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
				var flag = eval("opener." + CUI("#MESBasic_product_type_producttype_productrec_callBackFuncName").val() + "(arrObj)");
				<#else>
				var flag = eval(CUI("#MESBasic_product_type_producttype_productrec_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_product_type_producttype_productrecErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_product_type_producttype_productrecErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_product_type_producttype_productrec_refresh = function(node){
	//var url = "/MESBasic/product_type/producttype/productrec-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_product_type_producttype_productrec_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_product_type_producttype_productrec_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.product_type.producttype.productrec.node = node;
	MESBasic.product_type.producttype.productrec.query("query");
}

MESBasic_product_type_producttype_productrec_getList = function() {
	return "MESBasic.product_type.producttype.productrec";
}
MESBasic.product_type.producttype.productrec.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.product_type.producttype.productrec.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.product_type.producttype.productrec.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.product_type.producttype.productrec.otherParams || {};
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
		MESBasic.product_type.producttype.productrec.Dlg =	new CUI.Dialog({
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
		MESBasic.product_type.producttype.productrec.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_product_type_producttype', element : $('#MESBasic_product_type_producttype_productrec_fileupload_button a:eq(1)')});
		}
		MESBasic.product_type.producttype.productrec.otherParams = {};
	};
	MESBasic.product_type.producttype.productrec.commonQuery = function(type) {
	  if(typeof MESBasic.product_type.producttype.productrec.cancelSelectedNode == 'function') {
	   MESBasic.product_type.producttype.productrec.cancelSelectedNode();
	   MESBasic.product_type.producttype.productrec.node = null;
	  }
	  if(typeof MESBasic_product_type_producttype_productrec_cancelSelectedNode == 'function') {
	   MESBasic_product_type_producttype_productrec_cancelSelectedNode();
	   MESBasic.product_type.producttype.productrec.node = null;
	  }
	  MESBasic.product_type.producttype.productrec.query(type);
	 };
	
	
	
	MESBasic.product_type.producttype.productrec.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_product_type";
		openExportFrame(url);
	}
MESBasic.product_type.producttype.productrec.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.product_type.producttype.productrec.otherParams = {};
	MESBasic.product_type.producttype.productrec.otherParams.dialogType = dialogType;
	MESBasic.product_type.producttype.productrec.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product_type.producttype.productrec.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_type_productrec,js,MESBasic_1_product_type_Producttype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/product_type/producttype/productrec-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_product_type_productrec')}" prefix="ec_MESBasic_product_type_producttype_productrec_query"/>
