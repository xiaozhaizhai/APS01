<!-- WOM_7.5.0.0/prepareMaterial/prepareMaterialRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1564661443506')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_prepareMaterial_prepareMaterialRef,head,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("WOM.prepareMaterial.prepareMaterial.prepareMaterialRef");
</script>
<input type="hidden" name="WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName" id="WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="WOM_prepareMaterial_prepareMaterial_prepareMaterialRefErrorbar" />
<@frameset id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_container" border=0>
	<@frame id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "prepareMaterialRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_prepareMaterial_prepareMaterialRef,html,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.sendBackprepareMaterialRef(null,datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query
	 */
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm", WOM_prepareMaterial_prepareMaterial_prepareMaterialRefErrorbarWidget)) {
				return false;
		}
		var node = WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query._sortKey && datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query._sortMethod){
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm #dataTableSortColKey').val(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query._sortKey);
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm #dataTableSortColName').val(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query._sortColumnName);
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query._sortMethod);
		}else{
			datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query._sortKey = '';
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-query.action";
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef";
		condobj.modelAlias="prepareMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name="'+ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_prepareMaterial_prepareMaterialRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._prefix += '.';
			}
			WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._prefix += arr[i];
		}
		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._suffix = arr[arr.length -1];
		if(WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name="'+WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._prefix + '.' + WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._suffix +'"]').val(obj[0][WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._suffix]);
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name="'+WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name^="'+WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name="'+WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._prefix + '.' + WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._dialog) {
			WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._dialog.close();
		}
	};
	
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query_"+obj+")!='undefined'") ? eval('WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.sendBackprepareMaterialRef(null,datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.sendBackprepareMaterialRef(null,datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.sendBackprepareMaterialRef
	 */
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.sendBackprepareMaterialRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('WOM.prepareMaterial.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_callBackFuncName").val() + "(arrObj)");
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
			WOM_prepareMaterial_prepareMaterial_prepareMaterialRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			WOM_prepareMaterial_prepareMaterial_prepareMaterialRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_refresh = function(node){
WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.node = node;
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
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query("query");
}

WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_getList = function() {
	return "WOM.prepareMaterial.prepareMaterial.prepareMaterialRef";
}
WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_prepareMaterial_prepareMaterial_prepareMaterialRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_fileupload_button",
		handler:function(){
				list_operate_prepareMaterial_prepareMaterialRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareMaterialRef.WOM.prepareMaterial.prepareMaterial." + params.viewName + ".referenceCopy");
			funcName('prepareMaterial', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareMaterialRef.WOM.prepareMaterial.prepareMaterial." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareMaterialRef.WOM.prepareMaterial.prepareMaterial." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	/**
	 * 显示增加对话框
	 * @method WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.otherParams || {};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_prepareMaterial_prepareMaterialView'||!viewCode){
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
					list_operate_prepareMaterial_prepareMaterialRef.CUI('#'+formId).submit();
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
		if ( WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg ) {
			WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg._config.url = url;
			WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg._config.formId = formId;
			WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg.setTitle( title )
			WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg.setButtonbar( buttons );
		}else{
			WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_prepareMaterial_prepareMaterialRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_prepareMaterial_prepareMaterial', element : $('#WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_fileupload_button a:eq(1)')});
		}
		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.otherParams = {};
	};

	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.beforeCommonQuery === 'function') {
	   		var ret = WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.cancelSelectedNode == 'function') {
	   WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.cancelSelectedNode();
	   WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.node = null;
	  }
	  if(typeof WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_cancelSelectedNode == 'function') {
	   WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_cancelSelectedNode();
	   WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.node = null;
	  }
	  WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query(type);
	 };
	
	
	
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_prepareMaterial";
		openExportFrame(url);
	}
WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.otherParams = {};
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.otherParams.dialogType = dialogType;
	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.prepareMaterial.prepareMaterial.editCallBackInfo
 */
WOM.prepareMaterial.prepareMaterial.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_getLayout == "function"){
    		var layout = WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryWidget._sortMethod ? true : false;
		if(typeof WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_getLayout == "function"){
			var layout = WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;var effectiveState_start = $('#' + formId + ' input[name^="effectiveState_start"]').val();var effectiveState_end = $('#' + formId + ' input[name^="effectiveState_end"]').val();if( effectiveState_start!=null && effectiveState_start!=''){if(!isInteger(effectiveState_start)){errorbarWidget.showMessage("${getText('ec.common.effectiveState')}${getText('ec.list.validate.integer')}");return false;}}if(effectiveState_end!=null &&  effectiveState_end !=''){if(!isInteger(effectiveState_end)){errorbarWidget.showMessage("${getText('ec.common.effectiveState')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="effectiveState_start"]').val()!='' && $('#' + formId + ' input[name="effectiveState_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="effectiveState_start"]').val()) > parseInt($('#' + formId + ' input[name="effectiveState_end"]').val())){errorbarWidget.showMessage("${getText('ec.common.effectiveState')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('ec.common.effectiveState')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_prepareMaterial_prepareMaterialRef,js,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_prepareMaterial_prepareMaterialRef' idprefix='ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef' queryUrl='/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-query.action' queryFunc="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query" ns="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef" />
<@exportexcel action="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-query.action"   getRequireDataAction="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_prepareMaterial_PrepareMaterial&&viewCode=WOM_7.5.0.0_prepareMaterial_prepareMaterialRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_prepareMaterial_prepareMaterialRef')}" prefix="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial"  importFlag="false" viewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef" />
