<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1488184710189')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("RM.formula.formulaProcessActive.processActiveRef");
</script>
<input type="hidden" name="RM_formula_formulaProcessActive_processActiveRef_callBackFuncName" id="RM_formula_formulaProcessActive_processActiveRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_formula_formulaProcessActive_processActiveRefErrorbar" />
<@frameset id="ec_RM_formula_formulaProcessActive_processActiveRef_container" border=0>
	<@frame id="ec_RM_formula_formulaProcessActive_processActiveRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "processActiveRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_RM_formula_formulaProcessActive_processActiveRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_RM_formula_formulaProcessActive_processActiveRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_processActiveRef,html,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return RM.formula.formulaProcessActive.processActiveRef.sendBackprocessActiveRef(null,datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method RM.formula.formulaProcessActive.processActiveRef.query
	 */
	RM.formula.formulaProcessActive.processActiveRef.query = function(type,pageNo){
		if(!checkListValid("ec_RM_formula_formulaProcessActive_processActiveRef_queryForm")) {
				return false;
		}
		var node = RM.formula.formulaProcessActive.processActiveRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/RM/formula/formulaProcessActive/processActiveRef-query.action";
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_processActiveRef";
		condobj.modelAlias="formulaProcessActive";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].dbColumnType;
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
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].layRec;
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
		}
		var pageSize=CUI('input[name="ec_RM_formula_formulaProcessActive_processActiveRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formulaProcessActive_processActiveRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_processActiveRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	RM.formula.formulaProcessActive.processActiveRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formulaProcessActive.processActiveRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formulaProcessActive.processActiveRef._prefix += '.';
			}
			RM.formula.formulaProcessActive.processActiveRef._prefix += arr[i];
		}
		RM.formula.formulaProcessActive.processActiveRef._suffix = arr[arr.length -1];
		if(RM.formula.formulaProcessActive.processActiveRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.processActiveRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formulaProcessActive.processActiveRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formulaProcessActive.processActiveRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.processActiveRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '.' + RM.formula.formulaProcessActive.processActiveRef._suffix +'"]').val(obj[0][RM.formula.formulaProcessActive.processActiveRef._suffix]);
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name^="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '.' + RM.formula.formulaProcessActive.processActiveRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.formulaProcessActive.processActiveRef._dialog) {
			RM.formula.formulaProcessActive.processActiveRef._dialog.close();
		}
	};
	
	RM.formula.formulaProcessActive.processActiveRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.processActiveRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.processActiveRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formulaProcessActive.processActiveRef.sendBackprocessActiveRef(null,datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formulaProcessActive.processActiveRef.sendBackprocessActiveRef(null,datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.formula.formulaProcessActive.processActiveRef.sendBackprocessActiveRef
	 */
	RM.formula.formulaProcessActive.processActiveRef.sendBackprocessActiveRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.formulaProcessActive.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() + "(arrObj)");
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
			RM_formula_formulaProcessActive_processActiveRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_formula_formulaProcessActive_processActiveRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
RM_formula_formulaProcessActive_processActiveRef_refresh = function(node){
	//var url = "/RM/formula/formulaProcessActive/processActiveRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.formula.formulaProcessActive.processActiveRef.node = node;
	RM.formula.formulaProcessActive.processActiveRef.query("query");
}

RM_formula_formulaProcessActive_processActiveRef_getList = function() {
	return "RM.formula.formulaProcessActive.processActiveRef";
}
RM.formula.formulaProcessActive.processActiveRef.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method RM.formula.formulaProcessActive.processActiveRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formulaProcessActive.processActiveRef.showDialog = function(url,formId,title,width,height,viewCode) {
		var buttons = [];
		var otherParams = RM.formula.formulaProcessActive.processActiveRef.otherParams || {};
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
				handler:function(){list_operate_formula_processActiveRef.CUI('#'+formId).submit();}
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
		if ( RM.formula.formulaProcessActive.processActiveRef.Dlg ) {
			RM.formula.formulaProcessActive.processActiveRef.Dlg._config.url = url;
			RM.formula.formulaProcessActive.processActiveRef.Dlg._config.formId = formId;
			RM.formula.formulaProcessActive.processActiveRef.Dlg.setTitle( title )
			RM.formula.formulaProcessActive.processActiveRef.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.formulaProcessActive.processActiveRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_processActiveRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.formulaProcessActive.processActiveRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.formulaProcessActive.processActiveRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_formulaProcessActive', element : $('#RM_formula_formulaProcessActive_processActiveRef_fileupload_button a:eq(1)')});
		}
		RM.formula.formulaProcessActive.processActiveRef.otherParams = {};
	};
	RM.formula.formulaProcessActive.processActiveRef.commonQuery = function(type) {
	  if(typeof RM.formula.formulaProcessActive.processActiveRef.cancelSelectedNode == 'function') {
	   RM.formula.formulaProcessActive.processActiveRef.cancelSelectedNode();
	   RM.formula.formulaProcessActive.processActiveRef.node = null;
	  }
	  if(typeof RM_formula_formulaProcessActive_processActiveRef_cancelSelectedNode == 'function') {
	   RM_formula_formulaProcessActive_processActiveRef_cancelSelectedNode();
	   RM.formula.formulaProcessActive.processActiveRef.node = null;
	  }
	  RM.formula.formulaProcessActive.processActiveRef.query(type);
	 };
	
	
	
	RM.formula.formulaProcessActive.processActiveRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.formulaProcessActive.processActiveRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.formulaProcessActive.processActiveRef.otherParams = {};
	RM.formula.formulaProcessActive.processActiveRef.otherParams.dialogType = dialogType;
	RM.formula.formulaProcessActive.processActiveRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formulaProcessActive.processActiveRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="exeOrder_start"]').val()!=null && $('#' + formId + ' input[name^="exeOrder_start"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="exeOrder_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name^="exeOrder_end"]').val()!=null && $('#' + formId + ' input[name^="exeOrder_end"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="exeOrder_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="exeOrder_start"]').val()!='' && $('#' + formId + ' input[name="exeOrder_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="exeOrder_start"]').val()) > parseInt($('#' + formId + ' input[name="exeOrder_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.start')}");return false;}}return true;};




	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_processActiveRef,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@exportexcel action="/RM/formula/formulaProcessActive/processActiveRef-query.action"   getRequireDataAction="/RM/formula/formulaProcessActive/processActiveRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_FormulaProcessActive&&viewCode=RM_7.5.0.0_formula_processActiveRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_processActiveRef')}" prefix="ec_RM_formula_formulaProcessActive_processActiveRef_query" modelCode="RM_7.5.0.0_formula_FormulaProcessActive"  importFlag="false" viewCode="RM_7.5.0.0_formula_processActiveRef" />
