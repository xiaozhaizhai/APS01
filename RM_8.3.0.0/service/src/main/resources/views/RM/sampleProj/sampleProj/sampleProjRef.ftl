<!-- RM_7.5.0.0/sampleProj/sampleProjRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1490318000877')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_sampleProj_sampleProjRef,head,RM_7.5.0.0_sampleProj_SampleProj,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("RM.sampleProj.sampleProj.sampleProjRef");
</script>
<input type="hidden" name="RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName" id="RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_sampleProj_sampleProj_sampleProjRefErrorbar" />
<@frameset id="ec_RM_sampleProj_sampleProj_sampleProjRef_container" border=0>
	<@frame id="ec_RM_sampleProj_sampleProj_sampleProjRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "sampleProjRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_RM_sampleProj_sampleProj_sampleProjRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_sampleProj_sampleProjRef,html,RM_7.5.0.0_sampleProj_SampleProj,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return RM.sampleProj.sampleProj.sampleProjRef.sendBacksampleProjRef(null,datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_sampleProj_sampleProj_sampleProjRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.sampleProj.sampleProj.sampleProjRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.sampleProj.sampleProj.sampleProjRef.query
	 */
	RM.sampleProj.sampleProj.sampleProjRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm", RM_sampleProj_sampleProj_sampleProjRefErrorbarWidget)) {
				return false;
		}
		var node = RM.sampleProj.sampleProj.sampleProjRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query._sortKey && datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query._sortMethod){
			CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm #dataTableSortColKey').val(datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query._sortKey);
			CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm #dataTableSortColName').val(datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query._sortColumnName);
			CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm #dataTableSortColOrder').val(datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query._sortMethod);
		}else{
			datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query._sortKey = '';
			CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.sampleProj.sampleProj.sampleProjRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/sampleProj/sampleProj/sampleProjRef-query.action";
		CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_sampleProj_sampleProjRef";
		condobj.modelAlias="sampleProj";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name="'+ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_sampleProj_sampleProj_sampleProjRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_sampleProj_sampleProj_sampleProjRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_sampleProj_sampleProj_sampleProjRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_sampleProj_sampleProjRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.sampleProj.sampleProj.sampleProjRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.sampleProj.sampleProj.sampleProjRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.sampleProj.sampleProj.sampleProjRef._prefix += '.';
			}
			RM.sampleProj.sampleProj.sampleProjRef._prefix += arr[i];
		}
		RM.sampleProj.sampleProj.sampleProjRef._suffix = arr[arr.length -1];
		if(RM.sampleProj.sampleProj.sampleProjRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.sampleProj.sampleProj.sampleProjRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.sampleProj.sampleProj.sampleProjRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.sampleProj.sampleProj.sampleProjRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.sampleProj.sampleProj.sampleProjRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name="'+RM.sampleProj.sampleProj.sampleProjRef._prefix + '.' + RM.sampleProj.sampleProj.sampleProjRef._suffix +'"]').val(obj[0][RM.sampleProj.sampleProj.sampleProjRef._suffix]);
		CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name="'+RM.sampleProj.sampleProj.sampleProjRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name^="'+RM.sampleProj.sampleProj.sampleProjRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name="'+RM.sampleProj.sampleProj.sampleProjRef._prefix + '.' + RM.sampleProj.sampleProj.sampleProjRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_sampleProj_sampleProj_sampleProjRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.sampleProj.sampleProj.sampleProjRef._dialog) {
			RM.sampleProj.sampleProj.sampleProjRef._dialog.close();
		}
	};
	
	RM.sampleProj.sampleProj.sampleProjRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.sampleProj.sampleProj.sampleProjRef.query_"+obj+")!='undefined'") ? eval('RM.sampleProj.sampleProj.sampleProjRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.sampleProj.sampleProj.sampleProjRef.sendBacksampleProjRef(null,datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.sampleProj.sampleProj.sampleProjRef.sendBacksampleProjRef(null,datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.sampleProj.sampleProj.sampleProjRef.sendBacksampleProjRef
	 */
	RM.sampleProj.sampleProj.sampleProjRef.sendBacksampleProjRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.sampleProj.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_sampleProj_sampleProj_sampleProjRef_callBackFuncName").val() + "(arrObj)");
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
			RM_sampleProj_sampleProj_sampleProjRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_sampleProj_sampleProj_sampleProjRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_sampleProj_sampleProj_sampleProjRef_refresh = function(node){
RM.sampleProj.sampleProj.sampleProjRef.node = node;
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
	RM.sampleProj.sampleProj.sampleProjRef.query("query");
}

RM_sampleProj_sampleProj_sampleProjRef_getList = function() {
	return "RM.sampleProj.sampleProj.sampleProjRef";
}
RM.sampleProj.sampleProj.sampleProjRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_sampleProj_sampleProj_sampleProjRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.sampleProj.sampleProj.sampleProjRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.sampleProj.sampleProj.sampleProjRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_sampleProj_sampleProj_sampleProjRef_fileupload_button",
		handler:function(){
				list_operate_sampleProj_sampleProjRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.sampleProj.sampleProj.sampleProjRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_sampleProj_sampleProjRef.RM.sampleProj.sampleProj." + params.viewName + ".referenceCopy");
			funcName('sampleProj', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.sampleProj.sampleProj.sampleProjRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_sampleProj_sampleProjRef.RM.sampleProj.sampleProj." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.sampleProj.sampleProj.sampleProjRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_sampleProj_sampleProjRef.RM.sampleProj.sampleProj." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	RM.sampleProj.sampleProj.sampleProjRef.dbClickViewsampleProjRef =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=RM_7.5.0.0_sampleProj&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method RM.sampleProj.sampleProj.sampleProjRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.sampleProj.sampleProj.sampleProjRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.sampleProj.sampleProj.sampleProjRef.otherParams || {};
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
					list_operate_sampleProj_sampleProjRef.CUI('#'+formId).submit();
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
		if ( RM.sampleProj.sampleProj.sampleProjRef.Dlg ) {
			RM.sampleProj.sampleProj.sampleProjRef.Dlg._config.url = url;
			RM.sampleProj.sampleProj.sampleProjRef.Dlg._config.formId = formId;
			RM.sampleProj.sampleProj.sampleProjRef.Dlg.setTitle( title )
			RM.sampleProj.sampleProj.sampleProjRef.Dlg.setButtonbar( buttons );
		}else{
			RM.sampleProj.sampleProj.sampleProjRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_sampleProj_sampleProjRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.sampleProj.sampleProj.sampleProjRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.sampleProj.sampleProj.sampleProjRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_sampleProj_sampleProj', element : $('#RM_sampleProj_sampleProj_sampleProjRef_fileupload_button a:eq(1)')});
		}
		RM.sampleProj.sampleProj.sampleProjRef.otherParams = {};
	};

	RM.sampleProj.sampleProj.sampleProjRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.sampleProj.sampleProj.sampleProjRef.beforeCommonQuery === 'function') {
	   		var ret = RM.sampleProj.sampleProj.sampleProjRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.sampleProj.sampleProj.sampleProjRef.cancelSelectedNode == 'function') {
	   RM.sampleProj.sampleProj.sampleProjRef.cancelSelectedNode();
	   RM.sampleProj.sampleProj.sampleProjRef.node = null;
	  }
	  if(typeof RM_sampleProj_sampleProj_sampleProjRef_cancelSelectedNode == 'function') {
	   RM_sampleProj_sampleProj_sampleProjRef_cancelSelectedNode();
	   RM.sampleProj.sampleProj.sampleProjRef.node = null;
	  }
	  RM.sampleProj.sampleProj.sampleProjRef.query(type);
	 };
	
	
	
	RM.sampleProj.sampleProj.sampleProjRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_sampleProj";
		openExportFrame(url);
	}
RM.sampleProj.sampleProj.sampleProjRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.sampleProj.sampleProj.sampleProjRef.otherParams = {};
	RM.sampleProj.sampleProj.sampleProjRef.otherParams.dialogType = dialogType;
	RM.sampleProj.sampleProj.sampleProjRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.sampleProj.sampleProj.sampleProjRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.sampleProj.sampleProj.editCallBackInfo
 */
RM.sampleProj.sampleProj.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_sampleProj_sampleProj_sampleProjRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_sampleProj_sampleProj_sampleProjRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_sampleProj_sampleProj_sampleProjRef_getLayout == "function"){
    		var layout = RM_sampleProj_sampleProj_sampleProjRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.sampleProj.sampleProj.sampleProjRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_sampleProj_sampleProj_sampleProjRef_queryWidget._sortKey && ec_RM_sampleProj_sampleProj_sampleProjRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_sampleProj_SampleProj'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_sampleProj_sampleProj_sampleProjRef_queryWidget._sortKey && ec_RM_sampleProj_sampleProj_sampleProjRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_sampleProj_sampleProj_sampleProjRef_queryWidget._sortKey && ec_RM_sampleProj_sampleProj_sampleProjRef_queryWidget._sortMethod ? true : false;
		if(typeof RM_sampleProj_sampleProj_sampleProjRef_getLayout == "function"){
			var layout = RM_sampleProj_sampleProj_sampleProjRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.sampleProj.sampleProj.sampleProjRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.sampleProj.sampleProj.sampleProjRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.sampleProj.sampleProj.sampleProjRef.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_sampleProj_SampleProj'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.sampleProj.sampleProj.sampleProjRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.sampleProj.sampleProj.sampleProjRef.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_sampleProj_sampleProjRef,js,RM_7.5.0.0_sampleProj_SampleProj,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_sampleProj_sampleProjRef' idprefix='ec_RM_sampleProj_sampleProj_sampleProjRef' queryUrl='/RM/sampleProj/sampleProj/sampleProjRef-query.action' queryFunc="RM.sampleProj.sampleProj.sampleProjRef.query" ns="RM.sampleProj.sampleProj.sampleProjRef" />
<@exportexcel action="/RM/sampleProj/sampleProj/sampleProjRef-query.action"   getRequireDataAction="/RM/sampleProj/sampleProj/sampleProjRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_sampleProj_SampleProj&&viewCode=RM_7.5.0.0_sampleProj_sampleProjRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_sampleProj_sampleProjRef')}" prefix="ec_RM_sampleProj_sampleProj_sampleProjRef_query" modelCode="RM_7.5.0.0_sampleProj_SampleProj"  importFlag="false" viewCode="RM_7.5.0.0_sampleProj_sampleProjRef" />
