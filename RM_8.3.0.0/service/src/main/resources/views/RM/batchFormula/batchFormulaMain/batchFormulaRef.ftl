<!-- RM_7.5.0.0/batchFormula/batchFormulaRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1546052079715')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_batchFormula_batchFormulaRef,head,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("RM.batchFormula.batchFormulaMain.batchFormulaRef");
</script>
<input type="hidden" name="RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName" id="RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_batchFormula_batchFormulaMain_batchFormulaRefErrorbar" />
<@frameset id="ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_container" border=0>
	<@frame id="ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batchFormulaRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_batchFormula_batchFormulaRef,html,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return RM.batchFormula.batchFormulaMain.batchFormulaRef.sendBackbatchFormulaRef(null,datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.batchFormula.batchFormulaMain.batchFormulaRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaRef.query
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm", RM_batchFormula_batchFormulaMain_batchFormulaRefErrorbarWidget)) {
				return false;
		}
		var node = RM.batchFormula.batchFormulaMain.batchFormulaRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query._sortKey && datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query._sortMethod){
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm #dataTableSortColKey').val(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query._sortKey);
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm #dataTableSortColName').val(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query._sortColumnName);
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm #dataTableSortColOrder').val(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query._sortMethod);
		}else{
			datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query._sortKey = '';
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.batchFormula.batchFormulaMain.batchFormulaRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/batchFormula/batchFormulaMain/batchFormulaRef-query.action";
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_batchFormula_batchFormulaRef";
		condobj.modelAlias="batchFormulaMain";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name="'+ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_batchFormula_batchFormulaMain_batchFormulaRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_batchFormula_batchFormulaRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.batchFormula.batchFormulaMain.batchFormulaRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.batchFormula.batchFormulaMain.batchFormulaRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.batchFormula.batchFormulaMain.batchFormulaRef._prefix += '.';
			}
			RM.batchFormula.batchFormulaMain.batchFormulaRef._prefix += arr[i];
		}
		RM.batchFormula.batchFormulaMain.batchFormulaRef._suffix = arr[arr.length -1];
		if(RM.batchFormula.batchFormulaMain.batchFormulaRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.batchFormula.batchFormulaMain.batchFormulaRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.batchFormula.batchFormulaMain.batchFormulaRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.batchFormula.batchFormulaMain.batchFormulaRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.batchFormula.batchFormulaMain.batchFormulaRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name="'+RM.batchFormula.batchFormulaMain.batchFormulaRef._prefix + '.' + RM.batchFormula.batchFormulaMain.batchFormulaRef._suffix +'"]').val(obj[0][RM.batchFormula.batchFormulaMain.batchFormulaRef._suffix]);
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name="'+RM.batchFormula.batchFormulaMain.batchFormulaRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name^="'+RM.batchFormula.batchFormulaMain.batchFormulaRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name="'+RM.batchFormula.batchFormulaMain.batchFormulaRef._prefix + '.' + RM.batchFormula.batchFormulaMain.batchFormulaRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.batchFormula.batchFormulaMain.batchFormulaRef._dialog) {
			RM.batchFormula.batchFormulaMain.batchFormulaRef._dialog.close();
		}
	};
	
	RM.batchFormula.batchFormulaMain.batchFormulaRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.batchFormula.batchFormulaMain.batchFormulaRef.query_"+obj+")!='undefined'") ? eval('RM.batchFormula.batchFormulaMain.batchFormulaRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.batchFormula.batchFormulaMain.batchFormulaRef.sendBackbatchFormulaRef(null,datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.batchFormula.batchFormulaMain.batchFormulaRef.sendBackbatchFormulaRef(null,datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaRef.sendBackbatchFormulaRef
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaRef.sendBackbatchFormulaRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.batchFormulaMain.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_batchFormula_batchFormulaMain_batchFormulaRef_callBackFuncName").val() + "(arrObj)");
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
			RM_batchFormula_batchFormulaMain_batchFormulaRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_batchFormula_batchFormulaMain_batchFormulaRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_batchFormula_batchFormulaMain_batchFormulaRef_refresh = function(node){
RM.batchFormula.batchFormulaMain.batchFormulaRef.node = node;
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
	RM.batchFormula.batchFormulaMain.batchFormulaRef.query("query");
}

RM_batchFormula_batchFormulaMain_batchFormulaRef_getList = function() {
	return "RM.batchFormula.batchFormulaMain.batchFormulaRef";
}
RM.batchFormula.batchFormulaMain.batchFormulaRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_batchFormula_batchFormulaMain_batchFormulaRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.batchFormula.batchFormulaMain.batchFormulaRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_batchFormula_batchFormulaMain_batchFormulaRef_fileupload_button",
		handler:function(){
				list_operate_batchFormula_batchFormulaRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchFormula_batchFormulaRef.RM.batchFormula.batchFormulaMain." + params.viewName + ".referenceCopy");
			funcName('batchFormulaMain', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchFormula_batchFormulaRef.RM.batchFormula.batchFormulaMain." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.batchFormula.batchFormulaMain.batchFormulaRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchFormula_batchFormulaRef.RM.batchFormula.batchFormulaMain." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	RM.batchFormula.batchFormulaMain.batchFormulaRef.dbClickViewbatchFormulaRef =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=RM_7.5.0.0_batchFormula&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method RM.batchFormula.batchFormulaMain.batchFormulaRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.batchFormula.batchFormulaMain.batchFormulaRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.batchFormula.batchFormulaMain.batchFormulaRef.otherParams || {};
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
					list_operate_batchFormula_batchFormulaRef.CUI('#'+formId).submit();
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
		if ( RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg ) {
			RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg._config.url = url;
			RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg._config.formId = formId;
			RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg.setTitle( title )
			RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg.setButtonbar( buttons );
		}else{
			RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchFormula_batchFormulaRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.batchFormula.batchFormulaMain.batchFormulaRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_batchFormula_batchFormulaMain', element : $('#RM_batchFormula_batchFormulaMain_batchFormulaRef_fileupload_button a:eq(1)')});
		}
		RM.batchFormula.batchFormulaMain.batchFormulaRef.otherParams = {};
	};

	RM.batchFormula.batchFormulaMain.batchFormulaRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.batchFormula.batchFormulaMain.batchFormulaRef.beforeCommonQuery === 'function') {
	   		var ret = RM.batchFormula.batchFormulaMain.batchFormulaRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.batchFormula.batchFormulaMain.batchFormulaRef.cancelSelectedNode == 'function') {
	   RM.batchFormula.batchFormulaMain.batchFormulaRef.cancelSelectedNode();
	   RM.batchFormula.batchFormulaMain.batchFormulaRef.node = null;
	  }
	  if(typeof RM_batchFormula_batchFormulaMain_batchFormulaRef_cancelSelectedNode == 'function') {
	   RM_batchFormula_batchFormulaMain_batchFormulaRef_cancelSelectedNode();
	   RM.batchFormula.batchFormulaMain.batchFormulaRef.node = null;
	  }
	  RM.batchFormula.batchFormulaMain.batchFormulaRef.query(type);
	 };
	
	
	
	RM.batchFormula.batchFormulaMain.batchFormulaRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_batchFormula";
		openExportFrame(url);
	}
RM.batchFormula.batchFormulaMain.batchFormulaRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.batchFormula.batchFormulaMain.batchFormulaRef.otherParams = {};
	RM.batchFormula.batchFormulaMain.batchFormulaRef.otherParams.dialogType = dialogType;
	RM.batchFormula.batchFormulaMain.batchFormulaRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.batchFormula.batchFormulaMain.batchFormulaRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.batchFormula.batchFormulaMain.editCallBackInfo
 */
RM.batchFormula.batchFormulaMain.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_batchFormula_batchFormulaMain_batchFormulaRef_getLayout == "function"){
    		var layout = RM_batchFormula_batchFormulaMain_batchFormulaRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.batchFormula.batchFormulaMain.batchFormulaRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_batchFormula_BatchFormulaMain'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryWidget._sortKey && ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_queryWidget._sortMethod ? true : false;
		if(typeof RM_batchFormula_batchFormulaMain_batchFormulaRef_getLayout == "function"){
			var layout = RM_batchFormula_batchFormulaMain_batchFormulaRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.batchFormula.batchFormulaMain.batchFormulaRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.batchFormula.batchFormulaMain.batchFormulaRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.batchFormula.batchFormulaMain.batchFormulaRef.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_batchFormula_BatchFormulaMain'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.batchFormula.batchFormulaMain.batchFormulaRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.batchFormula.batchFormulaMain.batchFormulaRef.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="modTime_start"]').val()!= null && $('#' + formId + ' input[name^="modTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="modTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="modTime_end"]').val()!= null && $('#' + formId + ' input[name^="modTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="modTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="modTime_start"]').val()!='' && $('#' + formId + ' input[name="modTime_end"]').val()!=''){if($('#' + formId + ' input[name="modTime_start"]').val() > $('#' + formId + ' input[name="modTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1546051250463')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_batchFormula_batchFormulaRef,js,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_batchFormula_batchFormulaRef' idprefix='ec_RM_batchFormula_batchFormulaMain_batchFormulaRef' queryUrl='/RM/batchFormula/batchFormulaMain/batchFormulaRef-query.action' queryFunc="RM.batchFormula.batchFormulaMain.batchFormulaRef.query" ns="RM.batchFormula.batchFormulaMain.batchFormulaRef" />
<@exportexcel action="/RM/batchFormula/batchFormulaMain/batchFormulaRef-query.action"   getRequireDataAction="/RM/batchFormula/batchFormulaMain/batchFormulaRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_batchFormula_BatchFormulaMain&&viewCode=RM_7.5.0.0_batchFormula_batchFormulaRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_batchFormula_batchFormulaRef')}" prefix="ec_RM_batchFormula_batchFormulaMain_batchFormulaRef_query" modelCode="RM_7.5.0.0_batchFormula_BatchFormulaMain"  importFlag="false" viewCode="RM_7.5.0.0_batchFormula_batchFormulaRef" />
