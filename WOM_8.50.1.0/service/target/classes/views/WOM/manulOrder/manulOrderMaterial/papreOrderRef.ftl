<!-- WOM_7.5.0.0/manulOrder/papreOrderRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1564121344676')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_manulOrder_papreOrderRef,head,WOM_7.5.0.0_manulOrder_ManulOrderMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("WOM.manulOrder.manulOrderMaterial.papreOrderRef");
</script>
<input type="hidden" name="WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName" id="WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="WOM_manulOrder_manulOrderMaterial_papreOrderRefErrorbar" />
<@frameset id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_container" border=0>
	<@frame id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "papreOrderRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_manulOrder_papreOrderRef,html,WOM_7.5.0.0_manulOrder_ManulOrderMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return WOM.manulOrder.manulOrderMaterial.papreOrderRef.sendBackpapreOrderRef(null,datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("WOM.manulOrder.manulOrderMaterial.papreOrderRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method WOM.manulOrder.manulOrderMaterial.papreOrderRef.query
	 */
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm", WOM_manulOrder_manulOrderMaterial_papreOrderRefErrorbarWidget)) {
				return false;
		}
		var node = WOM.manulOrder.manulOrderMaterial.papreOrderRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query._sortKey && datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query._sortMethod){
			CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm #dataTableSortColKey').val(datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query._sortKey);
			CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm #dataTableSortColName').val(datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query._sortColumnName);
			CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query._sortMethod);
		}else{
			datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query._sortKey = '';
			CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "WOM.manulOrder.manulOrderMaterial.papreOrderRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/WOM/manulOrder/manulOrderMaterial/papreOrderRef-query.action";
		CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_manulOrder_papreOrderRef";
		condobj.modelAlias="manulOrderMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name="'+ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_manulOrder_manulOrderMaterial_papreOrderRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_manulOrder_papreOrderRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	WOM.manulOrder.manulOrderMaterial.papreOrderRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.manulOrder.manulOrderMaterial.papreOrderRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.manulOrder.manulOrderMaterial.papreOrderRef._prefix += '.';
			}
			WOM.manulOrder.manulOrderMaterial.papreOrderRef._prefix += arr[i];
		}
		WOM.manulOrder.manulOrderMaterial.papreOrderRef._suffix = arr[arr.length -1];
		if(WOM.manulOrder.manulOrderMaterial.papreOrderRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.manulOrder.manulOrderMaterial.papreOrderRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.manulOrder.manulOrderMaterial.papreOrderRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.manulOrder.manulOrderMaterial.papreOrderRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name="'+WOM.manulOrder.manulOrderMaterial.papreOrderRef._prefix + '.' + WOM.manulOrder.manulOrderMaterial.papreOrderRef._suffix +'"]').val(obj[0][WOM.manulOrder.manulOrderMaterial.papreOrderRef._suffix]);
		CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name="'+WOM.manulOrder.manulOrderMaterial.papreOrderRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name^="'+WOM.manulOrder.manulOrderMaterial.papreOrderRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name="'+WOM.manulOrder.manulOrderMaterial.papreOrderRef._prefix + '.' + WOM.manulOrder.manulOrderMaterial.papreOrderRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.manulOrder.manulOrderMaterial.papreOrderRef._dialog) {
			WOM.manulOrder.manulOrderMaterial.papreOrderRef._dialog.close();
		}
	};
	
	WOM.manulOrder.manulOrderMaterial.papreOrderRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.manulOrder.manulOrderMaterial.papreOrderRef.query_"+obj+")!='undefined'") ? eval('WOM.manulOrder.manulOrderMaterial.papreOrderRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.manulOrder.manulOrderMaterial.papreOrderRef.sendBackpapreOrderRef(null,datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return WOM.manulOrder.manulOrderMaterial.papreOrderRef.sendBackpapreOrderRef(null,datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method WOM.manulOrder.manulOrderMaterial.papreOrderRef.sendBackpapreOrderRef
	 */
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.sendBackpapreOrderRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('WOM.manulOrderMaterial.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#WOM_manulOrder_manulOrderMaterial_papreOrderRef_callBackFuncName").val() + "(arrObj)");
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
			WOM_manulOrder_manulOrderMaterial_papreOrderRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			WOM_manulOrder_manulOrderMaterial_papreOrderRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
WOM_manulOrder_manulOrderMaterial_papreOrderRef_refresh = function(node){
WOM.manulOrder.manulOrderMaterial.papreOrderRef.node = node;
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
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.query("query");
}

WOM_manulOrder_manulOrderMaterial_papreOrderRef_getList = function() {
	return "WOM.manulOrder.manulOrderMaterial.papreOrderRef";
}
WOM.manulOrder.manulOrderMaterial.papreOrderRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_manulOrder_manulOrderMaterial_papreOrderRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.manulOrder.manulOrderMaterial.papreOrderRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.manulOrder.manulOrderMaterial.papreOrderRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_manulOrder_manulOrderMaterial_papreOrderRef_fileupload_button",
		handler:function(){
				list_operate_manulOrder_papreOrderRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.manulOrder.manulOrderMaterial.papreOrderRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_manulOrder_papreOrderRef.WOM.manulOrder.manulOrderMaterial." + params.viewName + ".referenceCopy");
			funcName('manulOrderMaterial', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.manulOrder.manulOrderMaterial.papreOrderRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_manulOrder_papreOrderRef.WOM.manulOrder.manulOrderMaterial." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.manulOrder.manulOrderMaterial.papreOrderRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_manulOrder_papreOrderRef.WOM.manulOrder.manulOrderMaterial." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	WOM.manulOrder.manulOrderMaterial.papreOrderRef.dbClickViewpapreOrderRef =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_manulOrder&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.manulOrder.manulOrderMaterial.papreOrderRef.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.manulOrder.manulOrderMaterial.papreOrderRef.otherParams || {};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_manulOrder_manulOrdersView'||!viewCode){
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
					list_operate_manulOrder_papreOrderRef.CUI('#'+formId).submit();
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
		if ( WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg ) {
			WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg._config.url = url;
			WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg._config.formId = formId;
			WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg.setTitle( title )
			WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg.setButtonbar( buttons );
		}else{
			WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_manulOrder_papreOrderRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.manulOrder.manulOrderMaterial.papreOrderRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_manulOrder_manulOrderMaterial', element : $('#WOM_manulOrder_manulOrderMaterial_papreOrderRef_fileupload_button a:eq(1)')});
		}
		WOM.manulOrder.manulOrderMaterial.papreOrderRef.otherParams = {};
	};

	WOM.manulOrder.manulOrderMaterial.papreOrderRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.manulOrder.manulOrderMaterial.papreOrderRef.beforeCommonQuery === 'function') {
	   		var ret = WOM.manulOrder.manulOrderMaterial.papreOrderRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.manulOrder.manulOrderMaterial.papreOrderRef.cancelSelectedNode == 'function') {
	   WOM.manulOrder.manulOrderMaterial.papreOrderRef.cancelSelectedNode();
	   WOM.manulOrder.manulOrderMaterial.papreOrderRef.node = null;
	  }
	  if(typeof WOM_manulOrder_manulOrderMaterial_papreOrderRef_cancelSelectedNode == 'function') {
	   WOM_manulOrder_manulOrderMaterial_papreOrderRef_cancelSelectedNode();
	   WOM.manulOrder.manulOrderMaterial.papreOrderRef.node = null;
	  }
	  WOM.manulOrder.manulOrderMaterial.papreOrderRef.query(type);
	 };
	
	
	
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_manulOrder";
		openExportFrame(url);
	}
WOM.manulOrder.manulOrderMaterial.papreOrderRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.otherParams = {};
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.otherParams.dialogType = dialogType;
	WOM.manulOrder.manulOrderMaterial.papreOrderRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.manulOrder.manulOrderMaterial.papreOrderRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.manulOrder.manulOrderMaterial.editCallBackInfo
 */
WOM.manulOrder.manulOrderMaterial.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_manulOrder_manulOrderMaterial_papreOrderRef_getLayout == "function"){
    		var layout = WOM_manulOrder_manulOrderMaterial_papreOrderRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.manulOrder.manulOrderMaterial.papreOrderRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryWidget._sortKey && ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryWidget._sortMethod ? true : false;
		if(typeof WOM_manulOrder_manulOrderMaterial_papreOrderRef_getLayout == "function"){
			var layout = WOM_manulOrder_manulOrderMaterial_papreOrderRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.manulOrder.manulOrderMaterial.papreOrderRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.manulOrder.manulOrderMaterial.papreOrderRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.manulOrder.manulOrderMaterial.papreOrderRef.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_manulOrder_ManulOrderMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.manulOrder.manulOrderMaterial.papreOrderRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.manulOrder.manulOrderMaterial.papreOrderRef.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_manulOrder_papreOrderRef,js,WOM_7.5.0.0_manulOrder_ManulOrderMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_manulOrder_papreOrderRef' idprefix='ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef' queryUrl='/WOM/manulOrder/manulOrderMaterial/papreOrderRef-query.action' queryFunc="WOM.manulOrder.manulOrderMaterial.papreOrderRef.query" ns="WOM.manulOrder.manulOrderMaterial.papreOrderRef" />
<@exportexcel action="/WOM/manulOrder/manulOrderMaterial/papreOrderRef-query.action"   getRequireDataAction="/WOM/manulOrder/manulOrderMaterial/papreOrderRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_manulOrder_ManulOrderMaterial&&viewCode=WOM_7.5.0.0_manulOrder_papreOrderRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_manulOrder_papreOrderRef')}" prefix="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query" modelCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial"  importFlag="false" viewCode="WOM_7.5.0.0_manulOrder_papreOrderRef" />
