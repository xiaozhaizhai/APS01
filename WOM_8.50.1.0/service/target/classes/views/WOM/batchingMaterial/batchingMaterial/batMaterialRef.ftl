<!-- WOM_7.5.0.0/batchingMaterial/batMaterialRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1491984336543')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_batchingMaterial_batMaterialRef,head,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("WOM.batchingMaterial.batchingMaterial.batMaterialRef");
</script>
<input type="hidden" name="WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName" id="WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbar" />
<@frameset id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_container" border=0>
	<@frame id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batMaterialRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_batchingMaterial_batMaterialRef,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return WOM.batchingMaterial.batchingMaterial.batMaterialRef.sendBackbatMaterialRef(null,datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("WOM.batchingMaterial.batchingMaterial.batMaterialRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialRef.query
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm", WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbarWidget)) {
				return false;
		}
		var node = WOM.batchingMaterial.batchingMaterial.batMaterialRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query._sortKey && datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query._sortMethod){
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm #dataTableSortColKey').val(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query._sortKey);
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm #dataTableSortColName').val(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query._sortColumnName);
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query._sortMethod);
		}else{
			datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query._sortKey = '';
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "WOM.batchingMaterial.batchingMaterial.batMaterialRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/WOM/batchingMaterial/batchingMaterial/batMaterialRef-query.action";
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialRef";
		condobj.modelAlias="batchingMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name="'+ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_batchingMaterial_batchingMaterial_batMaterialRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_batchingMaterial_batMaterialRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterial.batchingMaterial.batMaterialRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterial.batchingMaterial.batMaterialRef._prefix += '.';
			}
			WOM.batchingMaterial.batchingMaterial.batMaterialRef._prefix += arr[i];
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialRef._suffix = arr[arr.length -1];
		if(WOM.batchingMaterial.batchingMaterial.batMaterialRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterial.batMaterialRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterial.batchingMaterial.batMaterialRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialRef._prefix + '.' + WOM.batchingMaterial.batchingMaterial.batMaterialRef._suffix +'"]').val(obj[0][WOM.batchingMaterial.batchingMaterial.batMaterialRef._suffix]);
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name^="'+WOM.batchingMaterial.batchingMaterial.batMaterialRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialRef._prefix + '.' + WOM.batchingMaterial.batchingMaterial.batMaterialRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.batchingMaterial.batchingMaterial.batMaterialRef._dialog) {
			WOM.batchingMaterial.batchingMaterial.batMaterialRef._dialog.close();
		}
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingMaterial.batMaterialRef.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterial.batMaterialRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.batchingMaterial.batchingMaterial.batMaterialRef.sendBackbatMaterialRef(null,datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.batchingMaterial.batchingMaterial.batMaterialRef.sendBackbatMaterialRef(null,datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialRef.sendBackbatMaterialRef
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.sendBackbatMaterialRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('WOM.batchingMaterial.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialRef_callBackFuncName").val() + "(arrObj)");
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
			WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
WOM_batchingMaterial_batchingMaterial_batMaterialRef_refresh = function(node){
WOM.batchingMaterial.batchingMaterial.batMaterialRef.node = node;
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
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.query("query");
}

WOM_batchingMaterial_batchingMaterial_batMaterialRef_getList = function() {
	return "WOM.batchingMaterial.batchingMaterial.batMaterialRef";
}
WOM.batchingMaterial.batchingMaterial.batMaterialRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.batchingMaterial.batchingMaterial.batMaterialRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_batchingMaterial_batchingMaterial_batMaterialRef_fileupload_button",
		handler:function(){
				list_operate_batchingMaterial_batMaterialRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialRef.WOM.batchingMaterial.batchingMaterial." + params.viewName + ".referenceCopy");
			funcName('batchingMaterial', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialRef.WOM.batchingMaterial.batchingMaterial." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialRef.WOM.batchingMaterial.batchingMaterial." + editViewName + ".printSetting");
			funcName();
		}
	}
}
	
	/**
	 * 保存完毕回调
	 * @method WOM.batchingMaterial.batchingMaterial.callBackInfo
	 */
	WOM.batchingMaterial.batchingMaterial.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
					var errorBarWidget = eval('WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
				} else if(res.operateType == 'delete') {
					var errorBarWidget = eval('WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
				}  else if(res.operateType == 'restore') {
					var errorBarWidget = eval('WOM_batchingMaterial_batchingMaterial_batMaterialRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
				} 
			setTimeout(function(){
				try{WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialRef.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialRef.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.checkSelectedValid = function(type) {
		if(WOM.batchingMaterial.batchingMaterial.batMaterialRef.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows[i].valid === false){
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
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialRef.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.checkSelectedAny = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialRef.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.checkSelectedMore = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialRef.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.batchingMaterial.batchingMaterial.batMaterialRef.otherParams || {};
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
							<#assign linkview = getViewByCode('WOM_7.5.0.0_produceTask_makeTaskView')>
							<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
							if(viewCode=='${linkview.code}'||!viewCode){
							<#list linkview.extraView.configMap.layout.sections as buttonSection>
							<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
							<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
							<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
								|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
								buttons.push({
									name:"${getText(operateBtn.namekey!)}",
									align:"${operateBtn.buttonAlign!'left'}",
									handler:function(){
										<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
										<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
										<#assign funcname = funcname?split('=')[1]>
										list_operate_batchingMaterial_batMaterialRef.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_batchingMaterial_batchMaterialView'||!viewCode){
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
					list_operate_batchingMaterial_batMaterialRef.CUI('#'+formId).submit();
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
		if ( WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg ) {
			WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg._config.url = url;
			WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg._config.formId = formId;
			WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg.setTitle( title )
			WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg.setButtonbar( buttons );
		}else{
			WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchingMaterial_batMaterialRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_batchingMaterial_batchingMaterial', element : $('#WOM_batchingMaterial_batchingMaterial_batMaterialRef_fileupload_button a:eq(1)')});
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialRef.otherParams = {};
	};

	WOM.batchingMaterial.batchingMaterial.batMaterialRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.batchingMaterial.batchingMaterial.batMaterialRef.beforeCommonQuery === 'function') {
	   		var ret = WOM.batchingMaterial.batchingMaterial.batMaterialRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.batchingMaterial.batchingMaterial.batMaterialRef.cancelSelectedNode == 'function') {
	   WOM.batchingMaterial.batchingMaterial.batMaterialRef.cancelSelectedNode();
	   WOM.batchingMaterial.batchingMaterial.batMaterialRef.node = null;
	  }
	  if(typeof WOM_batchingMaterial_batchingMaterial_batMaterialRef_cancelSelectedNode == 'function') {
	   WOM_batchingMaterial_batchingMaterial_batMaterialRef_cancelSelectedNode();
	   WOM.batchingMaterial.batchingMaterial.batMaterialRef.node = null;
	  }
	  WOM.batchingMaterial.batchingMaterial.batMaterialRef.query(type);
	 };
	
	
	
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_batchingMaterial";
		openExportFrame(url);
	}
WOM.batchingMaterial.batchingMaterial.batMaterialRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.otherParams = {};
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.otherParams.dialogType = dialogType;
	WOM.batchingMaterial.batchingMaterial.batMaterialRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterial.batchingMaterial.batMaterialRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.batchingMaterial.batchingMaterial.editCallBackInfo
 */
WOM.batchingMaterial.batchingMaterial.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_batchingMaterial_batchingMaterial_batMaterialRef_getLayout == "function"){
    		var layout = WOM_batchingMaterial_batchingMaterial_batMaterialRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingMaterial.batMaterialRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_queryWidget._sortMethod ? true : false;
		if(typeof WOM_batchingMaterial_batchingMaterial_batMaterialRef_getLayout == "function"){
			var layout = WOM_batchingMaterial_batchingMaterial_batMaterialRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingMaterial.batMaterialRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialRef.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialRef.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="arriveTime_start"]').val()!= null && $('#' + formId + ' input[name^="arriveTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="arriveTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="arriveTime_end"]').val()!= null && $('#' + formId + ' input[name^="arriveTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="arriveTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="arriveTime_start"]').val()!='' && $('#' + formId + ' input[name="arriveTime_end"]').val()!=''){if($('#' + formId + ' input[name="arriveTime_start"]').val() > $('#' + formId + ' input[name="arriveTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_batchingMaterial_batMaterialRef,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_batchingMaterial_batMaterialRef' idprefix='ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef' queryUrl='/WOM/batchingMaterial/batchingMaterial/batMaterialRef-query.action' queryFunc="WOM.batchingMaterial.batchingMaterial.batMaterialRef.query" ns="WOM.batchingMaterial.batchingMaterial.batMaterialRef" />
<@exportexcel action="/WOM/batchingMaterial/batchingMaterial/batMaterialRef-query.action"   getRequireDataAction="/WOM/batchingMaterial/batchingMaterial/batMaterialRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_batchingMaterial_BatchingMaterial&&viewCode=WOM_7.5.0.0_batchingMaterial_batMaterialRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_batchingMaterial_batMaterialRef')}" prefix="ec_WOM_batchingMaterial_batchingMaterial_batMaterialRef_query" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial"  importFlag="false" viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialRef" />
