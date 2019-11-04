<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1431520980163')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.testMapping.testMappingSet.ref");
</script>
<input type="hidden" name="MESBasic_testMapping_testMappingSet_ref_callBackFuncName" id="MESBasic_testMapping_testMappingSet_ref_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_testMapping_testMappingSet_refErrorbar" />
<@frameset id="ec_MESBasic_testMapping_testMappingSet_ref_container" border=0>
	<@frame id="ec_MESBasic_testMapping_testMappingSet_ref_container_main"  offsetH=4 region="center" class="center_in">
	<#include "ref-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	  <@frame id="ec_MESBasic_testMapping_testMappingSet_ref_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_testMapping_testMappingSet_ref_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_testMapping_ref,html,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.testMapping.testMappingSet.ref.sendBackref(null,datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method MESBasic.testMapping.testMappingSet.ref.query
	 */
	MESBasic.testMapping.testMappingSet.ref.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_testMapping_testMappingSet_ref_queryForm")) {
				return false;
		}
		var node = MESBasic.testMapping.testMappingSet.ref.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/testMapping/testMappingSet/ref-query.action";
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
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
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
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
		var pageSize=CUI('input[name="ec_MESBasic_testMapping_testMappingSet_ref_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_testMapping_testMappingSet_ref_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_testMapping_ref';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.testMapping.testMappingSet.ref._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.testMapping.testMappingSet.ref._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.testMapping.testMappingSet.ref._prefix += '.';
			}
			MESBasic.testMapping.testMappingSet.ref._prefix += arr[i];
		}
		MESBasic.testMapping.testMappingSet.ref._suffix = arr[arr.length -1];
		if(MESBasic.testMapping.testMappingSet.ref._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.testMapping.testMappingSet.ref._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.testMapping.testMappingSet.ref._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.testMapping.testMappingSet.ref.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.testMapping.testMappingSet.ref.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+MESBasic.testMapping.testMappingSet.ref._prefix + '.' + MESBasic.testMapping.testMappingSet.ref._suffix +'"]').val(obj[0][MESBasic.testMapping.testMappingSet.ref._suffix]);
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+MESBasic.testMapping.testMappingSet.ref._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name^="'+MESBasic.testMapping.testMappingSet.ref._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+MESBasic.testMapping.testMappingSet.ref._prefix + '.' + MESBasic.testMapping.testMappingSet.ref._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.testMapping.testMappingSet.ref._dialog) {
			MESBasic.testMapping.testMappingSet.ref._dialog.close();
		}
	};
	
	MESBasic.testMapping.testMappingSet.ref._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.testMapping.testMappingSet.ref.query_"+obj+")!='undefined'") ? eval('MESBasic.testMapping.testMappingSet.ref.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.testMapping.testMappingSet.ref.sendBackref(null,datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.testMapping.testMappingSet.ref.sendBackref
	 */
	MESBasic.testMapping.testMappingSet.ref.sendBackref = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.testMappingSet.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_testMapping_testMappingSet_ref_callBackFuncName").val() != ""){
				<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
				var flag = eval("opener." + CUI("#MESBasic_testMapping_testMappingSet_ref_callBackFuncName").val() + "(arrObj)");
				<#else>
				var flag = eval(CUI("#MESBasic_testMapping_testMappingSet_ref_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_testMapping_testMappingSet_refErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_testMapping_testMappingSet_refErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_testMapping_testMappingSet_ref_refresh = function(node){
	//var url = "/MESBasic/testMapping/testMappingSet/ref-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.testMapping.testMappingSet.ref.node = node;
	MESBasic.testMapping.testMappingSet.ref.query("query");
}

MESBasic_testMapping_testMappingSet_ref_getList = function() {
	return "MESBasic.testMapping.testMappingSet.ref";
}
MESBasic.testMapping.testMappingSet.ref.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.testMapping.testMappingSet.ref.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.testMapping.testMappingSet.ref.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.testMapping.testMappingSet.ref.otherParams || {};
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
		MESBasic.testMapping.testMappingSet.ref.Dlg =	new CUI.Dialog({
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
		MESBasic.testMapping.testMappingSet.ref.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_testMapping_testMappingSet', element : $('#MESBasic_testMapping_testMappingSet_ref_fileupload_button a:eq(1)')});
		}
		MESBasic.testMapping.testMappingSet.ref.otherParams = {};
	};
	MESBasic.testMapping.testMappingSet.ref.commonQuery = function(type) {
	  if(typeof MESBasic.testMapping.testMappingSet.ref.cancelSelectedNode == 'function') {
	   MESBasic.testMapping.testMappingSet.ref.cancelSelectedNode();
	   MESBasic.testMapping.testMappingSet.ref.node = null;
	  }
	  if(typeof MESBasic_testMapping_testMappingSet_ref_cancelSelectedNode == 'function') {
	   MESBasic_testMapping_testMappingSet_ref_cancelSelectedNode();
	   MESBasic.testMapping.testMappingSet.ref.node = null;
	  }
	  MESBasic.testMapping.testMappingSet.ref.query(type);
	 };
	
	
	
	MESBasic.testMapping.testMappingSet.ref.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_testMapping";
		openExportFrame(url);
	}
MESBasic.testMapping.testMappingSet.ref.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.testMapping.testMappingSet.ref.otherParams = {};
	MESBasic.testMapping.testMappingSet.ref.otherParams.dialogType = dialogType;
	MESBasic.testMapping.testMappingSet.ref.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.testMapping.testMappingSet.ref.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_testMapping_ref,js,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/testMapping/testMappingSet/ref-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_testMapping_ref')}" prefix="ec_MESBasic_testMapping_testMappingSet_ref_query"/>
