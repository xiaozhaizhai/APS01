<!-- WOM_7.5.0.0/producePlanRef/batchPlanRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1489993664796')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_producePlanRef_batchPlanRef,head,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("WOM.producePlanRef.dayBatchPlanParts.batchPlanRef");
</script>
<input type="hidden" name="WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName" id="WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="WOM_producePlanRef_dayBatchPlanParts_batchPlanRefErrorbar" />
<@frameset id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_container" border=0>
	<@frame id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batchPlanRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_producePlanRef_batchPlanRef,html,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.sendBackbatchPlanRef(null,datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query
	 */
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm", WOM_producePlanRef_dayBatchPlanParts_batchPlanRefErrorbarWidget)) {
				return false;
		}
		var node = WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query._sortKey && datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query._sortMethod){
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm #dataTableSortColKey').val(datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query._sortKey);
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm #dataTableSortColName').val(datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query._sortColumnName);
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query._sortMethod);
		}else{
			datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query._sortKey = '';
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/WOM/producePlanRef/dayBatchPlanParts/batchPlanRef-query.action";
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_producePlanRef_batchPlanRef";
		condobj.modelAlias="dayBatchPlanParts";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name="'+ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_producePlanRef_batchPlanRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._prefix += '.';
			}
			WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._prefix += arr[i];
		}
		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._suffix = arr[arr.length -1];
		if(WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._prefix + '.' + WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._suffix +'"]').val(obj[0][WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._suffix]);
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name^="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._prefix + '.' + WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._dialog) {
			WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._dialog.close();
		}
	};
	
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query_"+obj+")!='undefined'") ? eval('WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.sendBackbatchPlanRef(null,datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.sendBackbatchPlanRef(null,datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.sendBackbatchPlanRef
	 */
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.sendBackbatchPlanRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('WOM.dayBatchPlanParts.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_callBackFuncName").val() + "(arrObj)");
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
			WOM_producePlanRef_dayBatchPlanParts_batchPlanRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			WOM_producePlanRef_dayBatchPlanParts_batchPlanRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_refresh = function(node){
WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.node = node;
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
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query("query");
}

WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_getList = function() {
	return "WOM.producePlanRef.dayBatchPlanParts.batchPlanRef";
}
WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_producePlanRef_dayBatchPlanParts_batchPlanRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_fileupload_button",
		handler:function(){
				list_operate_producePlanRef_batchPlanRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_producePlanRef_batchPlanRef.WOM.producePlanRef.dayBatchPlanParts." + params.viewName + ".referenceCopy");
			funcName('dayBatchPlanParts', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_producePlanRef_batchPlanRef.WOM.producePlanRef.dayBatchPlanParts." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_producePlanRef_batchPlanRef.WOM.producePlanRef.dayBatchPlanParts." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.dbClickViewbatchPlanRef =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_producePlanRef&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.otherParams || {};
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
				handler:function(){
					list_operate_producePlanRef_batchPlanRef.CUI('#'+formId).submit();
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
		if ( WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg ) {
			WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg._config.url = url;
			WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg._config.formId = formId;
			WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg.setTitle( title )
			WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg.setButtonbar( buttons );
		}else{
			WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_producePlanRef_batchPlanRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_producePlanRef_dayBatchPlanParts', element : $('#WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_fileupload_button a:eq(1)')});
		}
		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.otherParams = {};
	};

	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.beforeCommonQuery === 'function') {
	   		var ret = WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.cancelSelectedNode == 'function') {
	   WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.cancelSelectedNode();
	   WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.node = null;
	  }
	  if(typeof WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_cancelSelectedNode == 'function') {
	   WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_cancelSelectedNode();
	   WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.node = null;
	  }
	  WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query(type);
	 };
	
	
	
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_producePlanRef";
		openExportFrame(url);
	}
WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.otherParams = {};
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.otherParams.dialogType = dialogType;
	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.producePlanRef.dayBatchPlanParts.editCallBackInfo
 */
WOM.producePlanRef.dayBatchPlanParts.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_getLayout == "function"){
    		var layout = WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryWidget._sortKey && ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_producePlanRef_DayBatchPlanParts'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryWidget._sortKey && ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryWidget._sortKey && ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_queryWidget._sortMethod ? true : false;
		if(typeof WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_getLayout == "function"){
			var layout = WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_producePlanRef_DayBatchPlanParts'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="startTime_start"]').val()!= null && $('#' + formId + ' input[name^="startTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="startTime_end"]').val()!= null && $('#' + formId + ' input[name^="startTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_start"]').val()!= null && $('#' + formId + ' input[name^="endTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_end"]').val()!= null && $('#' + formId + ' input[name^="endTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="startTime_start"]').val()!='' && $('#' + formId + ' input[name="startTime_end"]').val()!=''){if($('#' + formId + ' input[name="startTime_start"]').val() > $('#' + formId + ' input[name="startTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="endTime_start"]').val()!='' && $('#' + formId + ' input[name="endTime_end"]').val()!=''){if($('#' + formId + ' input[name="endTime_start"]').val() > $('#' + formId + ' input[name="endTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_producePlanRef_batchPlanRef,js,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_producePlanRef_batchPlanRef' idprefix='ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef' queryUrl='/WOM/producePlanRef/dayBatchPlanParts/batchPlanRef-query.action' queryFunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanRef.query" ns="WOM.producePlanRef.dayBatchPlanParts.batchPlanRef" />
<@exportexcel action="/WOM/producePlanRef/dayBatchPlanParts/batchPlanRef-query.action"   getRequireDataAction="/WOM/producePlanRef/dayBatchPlanParts/batchPlanRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_producePlanRef_DayBatchPlanParts&&viewCode=WOM_7.5.0.0_producePlanRef_batchPlanRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_producePlanRef_batchPlanRef')}" prefix="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanRef_query" modelCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts"  importFlag="false" viewCode="WOM_7.5.0.0_producePlanRef_batchPlanRef" />
