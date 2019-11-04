<!-- RM_7.5.0.0/formula/processLineReference -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1488977430659')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_processLineReference,head,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("RM.formula.formulaProcess.processLineReference");
</script>
<input type="hidden" name="RM_formula_formulaProcess_processLineReference_callBackFuncName" id="RM_formula_formulaProcess_processLineReference_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_formula_formulaProcess_processLineReferenceErrorbar" />
<@frameset id="ec_RM_formula_formulaProcess_processLineReference_container" border=0>
	<@frame id="ec_RM_formula_formulaProcess_processLineReference_container_main"  offsetH=4 region="center" class="center_in">
	<#include "processLineReference-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_RM_formula_formulaProcess_processLineReference_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_RM_formula_formulaProcess_processLineReference_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_processLineReference,html,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return RM.formula.formulaProcess.processLineReference.sendBackprocessLineReference(null,datatable_ec_RM_formula_formulaProcess_processLineReference_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_formula_formulaProcess_processLineReference_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.formula.formulaProcess.processLineReference.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.formula.formulaProcess.processLineReference.query
	 */
	RM.formula.formulaProcess.processLineReference.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_formula_formulaProcess_processLineReference_queryForm", RM_formula_formulaProcess_processLineReferenceErrorbarWidget)) {
				return false;
		}
		var node = RM.formula.formulaProcess.processLineReference.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_formula_formulaProcess_processLineReference_query._sortKey && datatable_ec_RM_formula_formulaProcess_processLineReference_query._sortMethod){
			CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_formulaProcess_processLineReference_query._sortKey);
			CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_formulaProcess_processLineReference_query._sortColumnName);
			CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_formulaProcess_processLineReference_query._sortMethod);
		}else{
			datatable_ec_RM_formula_formulaProcess_processLineReference_query._sortKey = '';
			CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_formula_formulaProcess_processLineReference_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.formula.formulaProcess.processLineReference.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/formula/formulaProcess/processLineReference-query.action";
		CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formulaProcess_processLineReference_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_processLineReference";
		condobj.modelAlias="formulaProcess";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formulaProcess_processLineReference_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formulaProcess_processLineReference_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formulaProcess_processLineReference_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formulaProcess_processLineReference_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name="'+ec_RM_formula_formulaProcess_processLineReference_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formulaProcess_processLineReference_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formula_formulaProcess_processLineReference_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formulaProcess_processLineReference_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formulaProcess_processLineReference_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formulaProcess_processLineReference_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_processLineReference';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_formula_formulaProcess_processLineReference_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.formula.formulaProcess.processLineReference._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formulaProcess.processLineReference._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formulaProcess.processLineReference._prefix += '.';
			}
			RM.formula.formulaProcess.processLineReference._prefix += arr[i];
		}
		RM.formula.formulaProcess.processLineReference._suffix = arr[arr.length -1];
		if(RM.formula.formulaProcess.processLineReference._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processLineReference._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formulaProcess.processLineReference._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formulaProcess.processLineReference.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcess.processLineReference.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name="'+RM.formula.formulaProcess.processLineReference._prefix + '.' + RM.formula.formulaProcess.processLineReference._suffix +'"]').val(obj[0][RM.formula.formulaProcess.processLineReference._suffix]);
		CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name="'+RM.formula.formulaProcess.processLineReference._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name^="'+RM.formula.formulaProcess.processLineReference._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name="'+RM.formula.formulaProcess.processLineReference._prefix + '.' + RM.formula.formulaProcess.processLineReference._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formulaProcess_processLineReference_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.formulaProcess.processLineReference._dialog) {
			RM.formula.formulaProcess.processLineReference._dialog.close();
		}
	};
	
	RM.formula.formulaProcess.processLineReference._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcess.processLineReference.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcess.processLineReference.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaProcess_processLineReference_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formulaProcess.processLineReference.sendBackprocessLineReference(null,datatable_ec_RM_formula_formulaProcess_processLineReference_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaProcess_processLineReference_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formulaProcess.processLineReference.sendBackprocessLineReference(null,datatable_ec_RM_formula_formulaProcess_processLineReference_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.formula.formulaProcess.processLineReference.sendBackprocessLineReference
	 */
	RM.formula.formulaProcess.processLineReference.sendBackprocessLineReference = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_formula_formulaProcess_processLineReference_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.formulaProcess.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formulaProcess_processLineReference_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_formula_formulaProcess_processLineReference_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_formula_formulaProcess_processLineReference_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_formula_formulaProcess_processLineReference_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_formula_formulaProcess_processLineReference_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_formula_formulaProcess_processLineReference_callBackFuncName").val() + "(arrObj)");
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
			RM_formula_formulaProcess_processLineReferenceErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_formula_formulaProcess_processLineReferenceErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_formula_formulaProcess_processLineReference_refresh = function(node){
RM.formula.formulaProcess.processLineReference.node = node;
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
	RM.formula.formulaProcess.processLineReference.query("query");
}

RM_formula_formulaProcess_processLineReference_getList = function() {
	return "RM.formula.formulaProcess.processLineReference";
}
RM.formula.formulaProcess.processLineReference.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formula_formulaProcess_processLineReferenceErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formula.formulaProcess.processLineReference.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formula.formulaProcess.processLineReference.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formula_formulaProcess_processLineReference_fileupload_button",
		handler:function(){
				list_operate_formula_processLineReference.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formula.formulaProcess.processLineReference.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_processLineReference.RM.formula.formulaProcess." + params.viewName + ".referenceCopy");
			funcName('formulaProcess', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formula.formulaProcess.processLineReference.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_processLineReference.RM.formula.formulaProcess." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formula.formulaProcess.processLineReference.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_processLineReference.RM.formula.formulaProcess." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	RM.formula.formulaProcess.processLineReference.dbClickViewprocessLineReference =  function(event, oRow) {
		var viewUrl = '/RM/formula/formulaProcess/otherProcessView.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			var otherParams = {};
			otherParams.viewShowType = 'VIEW';
			otherParams.dialogType = '5';
			RM.formula.formulaProcess.processLineReference.otherParams = otherParams;
			RM.formula.formulaProcess.processLineReference.showDialog(viewUrl + "?entityCode=RM_7.5.0.0_formula&id=" + oRow.id,'RM_formula_formulaProcess_otherProcessView_form','${getText("RM.viewtitle.randon1509359935009")}',500,260,'RM_7.5.0.0_formula_otherProcessView');
		}
	}
	/**
	 * 显示增加对话框
	 * @method RM.formula.formulaProcess.processLineReference.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formulaProcess.processLineReference.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formula.formulaProcess.processLineReference.otherParams || {};
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
			
			
			
					if(viewCode=='RM_7.5.0.0_formula_formulaView'||!viewCode){
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
					list_operate_formula_processLineReference.CUI('#'+formId).submit();
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
		if ( RM.formula.formulaProcess.processLineReference.Dlg ) {
			RM.formula.formulaProcess.processLineReference.Dlg._config.url = url;
			RM.formula.formulaProcess.processLineReference.Dlg._config.formId = formId;
			RM.formula.formulaProcess.processLineReference.Dlg.setTitle( title )
			RM.formula.formulaProcess.processLineReference.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.formulaProcess.processLineReference.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_processLineReference',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.formulaProcess.processLineReference.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.formulaProcess.processLineReference.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_formulaProcess', element : $('#RM_formula_formulaProcess_processLineReference_fileupload_button a:eq(1)')});
		}
		RM.formula.formulaProcess.processLineReference.otherParams = {};
	};

	RM.formula.formulaProcess.processLineReference.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formula.formulaProcess.processLineReference.beforeCommonQuery === 'function') {
	   		var ret = RM.formula.formulaProcess.processLineReference.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formula.formulaProcess.processLineReference.cancelSelectedNode == 'function') {
	   RM.formula.formulaProcess.processLineReference.cancelSelectedNode();
	   RM.formula.formulaProcess.processLineReference.node = null;
	  }
	  if(typeof RM_formula_formulaProcess_processLineReference_cancelSelectedNode == 'function') {
	   RM_formula_formulaProcess_processLineReference_cancelSelectedNode();
	   RM.formula.formulaProcess.processLineReference.node = null;
	  }
	  RM.formula.formulaProcess.processLineReference.query(type);
	 };
	
	
	
	RM.formula.formulaProcess.processLineReference.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.formulaProcess.processLineReference.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.formulaProcess.processLineReference.otherParams = {};
	RM.formula.formulaProcess.processLineReference.otherParams.dialogType = dialogType;
	RM.formula.formulaProcess.processLineReference.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formulaProcess.processLineReference.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.formula.formulaProcess.editCallBackInfo
 */
RM.formula.formulaProcess.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_formula_formulaProcess_processLineReference_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_formulaProcess_processLineReference_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formula_formulaProcess_processLineReference_getLayout == "function"){
    		var layout = RM_formula_formulaProcess_processLineReference_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formulaProcess.processLineReference.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formulaProcess_processLineReference_queryWidget._sortKey && ec_RM_formula_formulaProcess_processLineReference_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_FormulaProcess'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formulaProcess_processLineReference_queryWidget._sortKey && ec_RM_formula_formulaProcess_processLineReference_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formula_formulaProcess_processLineReference_queryWidget._sortKey && ec_RM_formula_formulaProcess_processLineReference_queryWidget._sortMethod ? true : false;
		if(typeof RM_formula_formulaProcess_processLineReference_getLayout == "function"){
			var layout = RM_formula_formulaProcess_processLineReference_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formulaProcess.processLineReference.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formulaProcess.processLineReference.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formulaProcess.processLineReference.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_FormulaProcess'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formulaProcess.processLineReference.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formulaProcess.processLineReference.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;var longTime_start = $('#' + formId + ' input[name^="longTime_start"]').val();var longTime_end = $('#' + formId + ' input[name^="longTime_end"]').val();if(longTime_start != null && longTime_start != ''){if(!isDecimal(longTime_start)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.decimal')}");return false;}}if(longTime_end != null && longTime_end != ''){if(!isDecimal(longTime_end)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name="longTime_start"]').val()!='' && $('#' + formId + ' input[name="longTime_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="longTime_start"]').val()) > parseInt($('#' + formId + ' input[name="longTime_end"]').val())){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_processLineReference,js,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formula_processLineReference' idprefix='ec_RM_formula_formulaProcess_processLineReference' queryUrl='/RM/formula/formulaProcess/processLineReference-query.action' queryFunc="RM.formula.formulaProcess.processLineReference.query" ns="RM.formula.formulaProcess.processLineReference" />
<@exportexcel action="/RM/formula/formulaProcess/processLineReference-query.action"   getRequireDataAction="/RM/formula/formulaProcess/processLineReference-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_FormulaProcess&&viewCode=RM_7.5.0.0_formula_processLineReference" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_processLineReference')}" prefix="ec_RM_formula_formulaProcess_processLineReference_query" modelCode="RM_7.5.0.0_formula_FormulaProcess"  importFlag="false" viewCode="RM_7.5.0.0_formula_processLineReference" />
