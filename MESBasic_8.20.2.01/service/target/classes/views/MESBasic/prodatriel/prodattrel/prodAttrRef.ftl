<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1470362293410')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.prodatriel.prodattrel.prodAttrRef");
</script>
<input type="hidden" name="MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName" id="MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_prodatriel_prodattrel_prodAttrRefErrorbar" />
<@frameset id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_container" border=0>
	<@frame id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "prodAttrRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_prodatriel_prodAttrRef,html,MESBasic_1_prodatriel_Prodattrel,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.prodatriel.prodattrel.prodAttrRef.sendBackprodAttrRef(null,datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method MESBasic.prodatriel.prodattrel.prodAttrRef.query
	 */
	MESBasic.prodatriel.prodattrel.prodAttrRef.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm")) {
				return false;
		}
		var node = MESBasic.prodatriel.prodattrel.prodAttrRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/prodatriel/prodattrel/prodAttrRef-query.action";
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_prodatriel_prodattrel_prodAttrRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_prodatriel_prodAttrRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.prodatriel.prodattrel.prodAttrRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.prodatriel.prodattrel.prodAttrRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.prodatriel.prodattrel.prodAttrRef._prefix += '.';
			}
			MESBasic.prodatriel.prodattrel.prodAttrRef._prefix += arr[i];
		}
		MESBasic.prodatriel.prodattrel.prodAttrRef._suffix = arr[arr.length -1];
		if(MESBasic.prodatriel.prodattrel.prodAttrRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.prodatriel.prodattrel.prodAttrRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.prodatriel.prodattrel.prodAttrRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.prodatriel.prodattrel.prodAttrRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.prodatriel.prodattrel.prodAttrRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+MESBasic.prodatriel.prodattrel.prodAttrRef._prefix + '.' + MESBasic.prodatriel.prodattrel.prodAttrRef._suffix +'"]').val(obj[0][MESBasic.prodatriel.prodattrel.prodAttrRef._suffix]);
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+MESBasic.prodatriel.prodattrel.prodAttrRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name^="'+MESBasic.prodatriel.prodattrel.prodAttrRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+MESBasic.prodatriel.prodattrel.prodAttrRef._prefix + '.' + MESBasic.prodatriel.prodattrel.prodAttrRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.prodatriel.prodattrel.prodAttrRef._dialog) {
			MESBasic.prodatriel.prodattrel.prodAttrRef._dialog.close();
		}
	};
	
	MESBasic.prodatriel.prodattrel.prodAttrRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.prodatriel.prodattrel.prodAttrRef.query_"+obj+")!='undefined'") ? eval('MESBasic.prodatriel.prodattrel.prodAttrRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.prodatriel.prodattrel.prodAttrRef.sendBackprodAttrRef(null,datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.prodatriel.prodattrel.prodAttrRef.sendBackprodAttrRef(null,datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.prodatriel.prodattrel.prodAttrRef.sendBackprodAttrRef
	 */
	MESBasic.prodatriel.prodattrel.prodAttrRef.sendBackprodAttrRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.prodattrel.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_prodatriel_prodattrel_prodAttrRef_callBackFuncName").val() + "(arrObj)");
				</#if>
				if(flag === false){
					return flag;
				}
			}else{
				getDepartmentInfo(arrObj);
			}
			<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'><#if (Parameters.closePage)?default('false') == 'true'>
			setTimeout(function(){
				try {
					top.opener.focus();
					CUI.closeWindow();
				}catch(e){}
			},1000);
			</#if></#if>
			MESBasic_prodatriel_prodattrel_prodAttrRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_prodatriel_prodattrel_prodAttrRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_prodatriel_prodattrel_prodAttrRef_refresh = function(node){
	//var url = "/MESBasic/prodatriel/prodattrel/prodAttrRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.prodatriel.prodattrel.prodAttrRef.node = node;
	MESBasic.prodatriel.prodattrel.prodAttrRef.query("query");
}

MESBasic_prodatriel_prodattrel_prodAttrRef_getList = function() {
	return "MESBasic.prodatriel.prodattrel.prodAttrRef";
}
MESBasic.prodatriel.prodattrel.prodAttrRef.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.prodatriel.prodattrel.prodAttrRef.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.prodatriel.prodattrel.prodAttrRef.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.prodatriel.prodattrel.prodAttrRef.otherParams || {};
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
				handler:function(){list_operate.CUI('#'+formId).submit();}
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
		if ( MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg ) {
			MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg._config.url = url;
			MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg._config.formId = formId;
			MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg.setTitle( title )
			MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.prodatriel.prodattrel.prodAttrRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_prodatriel_prodattrel', element : $('#MESBasic_prodatriel_prodattrel_prodAttrRef_fileupload_button a:eq(1)')});
		}
		MESBasic.prodatriel.prodattrel.prodAttrRef.otherParams = {};
	};
	MESBasic.prodatriel.prodattrel.prodAttrRef.commonQuery = function(type) {
	  if(typeof MESBasic.prodatriel.prodattrel.prodAttrRef.cancelSelectedNode == 'function') {
	   MESBasic.prodatriel.prodattrel.prodAttrRef.cancelSelectedNode();
	   MESBasic.prodatriel.prodattrel.prodAttrRef.node = null;
	  }
	  if(typeof MESBasic_prodatriel_prodattrel_prodAttrRef_cancelSelectedNode == 'function') {
	   MESBasic_prodatriel_prodattrel_prodAttrRef_cancelSelectedNode();
	   MESBasic.prodatriel.prodattrel.prodAttrRef.node = null;
	  }
	  MESBasic.prodatriel.prodattrel.prodAttrRef.query(type);
	 };
	
	
	
	MESBasic.prodatriel.prodattrel.prodAttrRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_prodatriel";
		openExportFrame(url);
	}
MESBasic.prodatriel.prodattrel.prodAttrRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.prodatriel.prodattrel.prodAttrRef.otherParams = {};
	MESBasic.prodatriel.prodattrel.prodAttrRef.otherParams.dialogType = dialogType;
	MESBasic.prodatriel.prodattrel.prodAttrRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.prodatriel.prodattrel.prodAttrRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_prodatriel_prodAttrRef,js,MESBasic_1_prodatriel_Prodattrel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/prodatriel/prodattrel/prodAttrRef-query.action"   getRequireDataAction="/MESBasic/prodatriel/prodattrel/prodAttrRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_prodatriel_Prodattrel&&viewCode=MESBasic_1_prodatriel_prodAttrRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_prodatriel_prodAttrRef')}" prefix="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query" modelCode="MESBasic_1_prodatriel_Prodattrel"  importFlag="false" viewCode="MESBasic_1_prodatriel_prodAttrRef" />
