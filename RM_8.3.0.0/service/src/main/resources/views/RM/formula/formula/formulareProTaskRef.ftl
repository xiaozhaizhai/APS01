<!-- RM_7.5.0.0/formula/formulareProTaskRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1506046662592')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulareProTaskRef,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("RM.formula.formula.formulareProTaskRef");
</script>
<input type="hidden" name="RM_formula_formula_formulareProTaskRef_callBackFuncName" id="RM_formula_formula_formulareProTaskRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_formula_formula_formulareProTaskRefErrorbar" />
<@frameset id="ec_RM_formula_formula_formulareProTaskRef_container" border=0>
	<@frame id="ec_RM_formula_formula_formulareProTaskRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "formulareProTaskRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_RM_formula_formula_formulareProTaskRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_RM_formula_formula_formulareProTaskRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulareProTaskRef,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return RM.formula.formula.formulareProTaskRef.sendBackformulareProTaskRef(null,datatable_ec_RM_formula_formula_formulareProTaskRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_formula_formula_formulareProTaskRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.formula.formula.formulareProTaskRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.formula.formula.formulareProTaskRef.query
	 */
	RM.formula.formula.formulareProTaskRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_formula_formula_formulareProTaskRef_queryForm", RM_formula_formula_formulareProTaskRefErrorbarWidget)) {
				return false;
		}
		var node = RM.formula.formula.formulareProTaskRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_formula_formula_formulareProTaskRef_query._sortKey && datatable_ec_RM_formula_formula_formulareProTaskRef_query._sortMethod){
			CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_formula_formulareProTaskRef_query._sortKey);
			CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_formula_formulareProTaskRef_query._sortColumnName);
			CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_formula_formulareProTaskRef_query._sortMethod);
		}else{
			datatable_ec_RM_formula_formula_formulareProTaskRef_query._sortKey = '';
			CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_formula_formula_formulareProTaskRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.formula.formula.formulareProTaskRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/formula/formula/formulareProTaskRef-query.action";
		CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formula_formulareProTaskRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_formulareProTaskRef";
		condobj.modelAlias="formula";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formula_formulareProTaskRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formula_formulareProTaskRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formula_formulareProTaskRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formula_formulareProTaskRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name="'+ec_RM_formula_formula_formulareProTaskRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formula_formulareProTaskRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formula_formula_formulareProTaskRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formula_formulareProTaskRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formula_formulareProTaskRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formula_formulareProTaskRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_formulareProTaskRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_formula_formula_formulareProTaskRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.formula.formula.formulareProTaskRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formula.formulareProTaskRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formula.formulareProTaskRef._prefix += '.';
			}
			RM.formula.formula.formulareProTaskRef._prefix += arr[i];
		}
		RM.formula.formula.formulareProTaskRef._suffix = arr[arr.length -1];
		if(RM.formula.formula.formulareProTaskRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formula.formulareProTaskRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formula.formulareProTaskRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formula.formulareProTaskRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formula.formulareProTaskRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name="'+RM.formula.formula.formulareProTaskRef._prefix + '.' + RM.formula.formula.formulareProTaskRef._suffix +'"]').val(obj[0][RM.formula.formula.formulareProTaskRef._suffix]);
		CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name="'+RM.formula.formula.formulareProTaskRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name^="'+RM.formula.formula.formulareProTaskRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name="'+RM.formula.formula.formulareProTaskRef._prefix + '.' + RM.formula.formula.formulareProTaskRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formula_formulareProTaskRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.formula.formulareProTaskRef._dialog) {
			RM.formula.formula.formulareProTaskRef._dialog.close();
		}
	};
	
	RM.formula.formula.formulareProTaskRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formula.formulareProTaskRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.formulareProTaskRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formula_formulareProTaskRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formula.formulareProTaskRef.sendBackformulareProTaskRef(null,datatable_ec_RM_formula_formula_formulareProTaskRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_formula_formula_formulareProTaskRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formula.formulareProTaskRef.sendBackformulareProTaskRef(null,datatable_ec_RM_formula_formula_formulareProTaskRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.formula.formula.formulareProTaskRef.sendBackformulareProTaskRef
	 */
	RM.formula.formula.formulareProTaskRef.sendBackformulareProTaskRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_formula_formula_formulareProTaskRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.formula.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formula_formulareProTaskRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_formula_formula_formulareProTaskRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_formula_formula_formulareProTaskRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_formula_formula_formulareProTaskRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_formula_formula_formulareProTaskRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_formula_formula_formulareProTaskRef_callBackFuncName").val() + "(arrObj)");
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
			RM_formula_formula_formulareProTaskRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_formula_formula_formulareProTaskRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_formula_formula_formulareProTaskRef_refresh = function(node){
RM.formula.formula.formulareProTaskRef.node = node;
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
	RM.formula.formula.formulareProTaskRef.query("query");
}

RM_formula_formula_formulareProTaskRef_getList = function() {
	return "RM.formula.formula.formulareProTaskRef";
}
RM.formula.formula.formulareProTaskRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formula_formula_formulareProTaskRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formula.formula.formulareProTaskRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formula.formula.formulareProTaskRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formula_formula_formulareProTaskRef_fileupload_button",
		handler:function(){
				list_operate_formula_formulareProTaskRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formula.formula.formulareProTaskRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulareProTaskRef.RM.formula.formula." + params.viewName + ".referenceCopy");
			funcName('formula', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formula.formula.formulareProTaskRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulareProTaskRef.RM.formula.formula." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formula.formula.formulareProTaskRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulareProTaskRef.RM.formula.formula." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	/**
	 * 显示增加对话框
	 * @method RM.formula.formula.formulareProTaskRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formula.formulareProTaskRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formula.formula.formulareProTaskRef.otherParams || {};
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
					list_operate_formula_formulareProTaskRef.CUI('#'+formId).submit();
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
		if ( RM.formula.formula.formulareProTaskRef.Dlg ) {
			RM.formula.formula.formulareProTaskRef.Dlg._config.url = url;
			RM.formula.formula.formulareProTaskRef.Dlg._config.formId = formId;
			RM.formula.formula.formulareProTaskRef.Dlg.setTitle( title )
			RM.formula.formula.formulareProTaskRef.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.formula.formulareProTaskRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_formulareProTaskRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.formula.formulareProTaskRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.formula.formulareProTaskRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_formula', element : $('#RM_formula_formula_formulareProTaskRef_fileupload_button a:eq(1)')});
		}
		RM.formula.formula.formulareProTaskRef.otherParams = {};
	};

	RM.formula.formula.formulareProTaskRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formula.formula.formulareProTaskRef.beforeCommonQuery === 'function') {
	   		var ret = RM.formula.formula.formulareProTaskRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formula.formula.formulareProTaskRef.cancelSelectedNode == 'function') {
	   RM.formula.formula.formulareProTaskRef.cancelSelectedNode();
	   RM.formula.formula.formulareProTaskRef.node = null;
	  }
	  if(typeof RM_formula_formula_formulareProTaskRef_cancelSelectedNode == 'function') {
	   RM_formula_formula_formulareProTaskRef_cancelSelectedNode();
	   RM.formula.formula.formulareProTaskRef.node = null;
	  }
	  RM.formula.formula.formulareProTaskRef.query(type);
	 };
	
	
	
	RM.formula.formula.formulareProTaskRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.formula.formulareProTaskRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.formula.formulareProTaskRef.otherParams = {};
	RM.formula.formula.formulareProTaskRef.otherParams.dialogType = dialogType;
	RM.formula.formula.formulareProTaskRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formula.formulareProTaskRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.formula.formula.editCallBackInfo
 */
RM.formula.formula.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_formula_formula_formulareProTaskRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_formula_formulareProTaskRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formula_formula_formulareProTaskRef_getLayout == "function"){
    		var layout = RM_formula_formula_formulareProTaskRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulareProTaskRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulareProTaskRef_queryWidget._sortKey && ec_RM_formula_formula_formulareProTaskRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulareProTaskRef_queryWidget._sortKey && ec_RM_formula_formula_formulareProTaskRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formula_formula_formulareProTaskRef_queryWidget._sortKey && ec_RM_formula_formula_formulareProTaskRef_queryWidget._sortMethod ? true : false;
		if(typeof RM_formula_formula_formulareProTaskRef_getLayout == "function"){
			var layout = RM_formula_formula_formulareProTaskRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulareProTaskRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulareProTaskRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulareProTaskRef.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulareProTaskRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulareProTaskRef.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;var edition_start = $('#' + formId + ' input[name^="edition_start"]').val();var edition_end = $('#' + formId + ' input[name^="edition_end"]').val();if(edition_start != null && edition_start != ''){if(!isDecimal(edition_start)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if(edition_end != null && edition_end != ''){if(!isDecimal(edition_end)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="startTime_start"]').val()!= null && $('#' + formId + ' input[name^="startTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="startTime_end"]').val()!= null && $('#' + formId + ' input[name^="startTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_start"]').val()!= null && $('#' + formId + ' input[name^="endTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_end"]').val()!= null && $('#' + formId + ' input[name^="endTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="startTime_start"]').val()!='' && $('#' + formId + ' input[name="startTime_end"]').val()!=''){if($('#' + formId + ' input[name="startTime_start"]').val() > $('#' + formId + ' input[name="startTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="edition_start"]').val()!='' && $('#' + formId + ' input[name="edition_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="edition_start"]').val()) > parseInt($('#' + formId + ' input[name="edition_end"]').val())){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="endTime_start"]').val()!='' && $('#' + formId + ' input[name="endTime_end"]').val()!=''){if($('#' + formId + ' input[name="endTime_start"]').val() > $('#' + formId + ' input[name="endTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulareProTaskRef,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formula_formulareProTaskRef' idprefix='ec_RM_formula_formula_formulareProTaskRef' queryUrl='/RM/formula/formula/formulareProTaskRef-query.action' queryFunc="RM.formula.formula.formulareProTaskRef.query" ns="RM.formula.formula.formulareProTaskRef" />
<@exportexcel action="/RM/formula/formula/formulareProTaskRef-query.action"   getRequireDataAction="/RM/formula/formula/formulareProTaskRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_Formula&&viewCode=RM_7.5.0.0_formula_formulareProTaskRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_formulareProTaskRef')}" prefix="ec_RM_formula_formula_formulareProTaskRef_query" modelCode="RM_7.5.0.0_formula_Formula"  importFlag="false" viewCode="RM_7.5.0.0_formula_formulareProTaskRef" />
