<!-- X6Basic_1.0/timeRegion/weekPlanRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.randon1558490119708')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_weekPlanRef,head,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("X6Basic.timeRegion.timeRegionPar.weekPlanRef");
</script>
<input type="hidden" name="X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName" id="X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="X6Basic_timeRegion_timeRegionPar_weekPlanRefErrorbar" />
<@frameset id="ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_container" border=0>
	<@frame id="ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "weekPlanRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_weekPlanRef,html,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return X6Basic.timeRegion.timeRegionPar.weekPlanRef.sendBackweekPlanRef(null,datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("X6Basic.timeRegion.timeRegionPar.weekPlanRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method X6Basic.timeRegion.timeRegionPar.weekPlanRef.query
	 */
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm", X6Basic_timeRegion_timeRegionPar_weekPlanRefErrorbarWidget)) {
				return false;
		}
		var node = X6Basic.timeRegion.timeRegionPar.weekPlanRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query._sortKey && datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query._sortMethod){
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query._sortKey);
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query._sortColumnName);
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query._sortMethod);
		}else{
			datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query._sortKey = '';
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "X6Basic.timeRegion.timeRegionPar.weekPlanRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/X6Basic/timeRegion/timeRegionPar/weekPlanRef-query.action";
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="X6Basic_1.0_timeRegion_weekPlanRef";
		condobj.modelAlias="timeRegionPar";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name="'+ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info["MainTableName"];
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
						var layrec=ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_timeRegion_timeRegionPar_weekPlanRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_timeRegion_weekPlanRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	X6Basic.timeRegion.timeRegionPar.weekPlanRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.timeRegion.timeRegionPar.weekPlanRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.timeRegion.timeRegionPar.weekPlanRef._prefix += '.';
			}
			X6Basic.timeRegion.timeRegionPar.weekPlanRef._prefix += arr[i];
		}
		X6Basic.timeRegion.timeRegionPar.weekPlanRef._suffix = arr[arr.length -1];
		if(X6Basic.timeRegion.timeRegionPar.weekPlanRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegionPar.weekPlanRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.timeRegion.timeRegionPar.weekPlanRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.timeRegion.timeRegionPar.weekPlanRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegionPar.weekPlanRef._prefix + '.' + X6Basic.timeRegion.timeRegionPar.weekPlanRef._suffix +'"]').val(obj[0][X6Basic.timeRegion.timeRegionPar.weekPlanRef._suffix]);
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegionPar.weekPlanRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name^="'+X6Basic.timeRegion.timeRegionPar.weekPlanRef._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegionPar.weekPlanRef._prefix + '.' + X6Basic.timeRegion.timeRegionPar.weekPlanRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.timeRegion.timeRegionPar.weekPlanRef._dialog) {
			X6Basic.timeRegion.timeRegionPar.weekPlanRef._dialog.close();
		}
	};
	
	X6Basic.timeRegion.timeRegionPar.weekPlanRef._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.timeRegion.timeRegionPar.weekPlanRef.query_"+obj+")!='undefined'") ? eval('X6Basic.timeRegion.timeRegionPar.weekPlanRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return X6Basic.timeRegion.timeRegionPar.weekPlanRef.sendBackweekPlanRef(null,datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return X6Basic.timeRegion.timeRegionPar.weekPlanRef.sendBackweekPlanRef(null,datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method X6Basic.timeRegion.timeRegionPar.weekPlanRef.sendBackweekPlanRef
	 */
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.sendBackweekPlanRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('X6Basic.timeRegionPar.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#X6Basic_timeRegion_timeRegionPar_weekPlanRef_callBackFuncName").val() + "(arrObj)");
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
			X6Basic_timeRegion_timeRegionPar_weekPlanRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			X6Basic_timeRegion_timeRegionPar_weekPlanRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
X6Basic_timeRegion_timeRegionPar_weekPlanRef_refresh = function(node){
X6Basic.timeRegion.timeRegionPar.weekPlanRef.node = node;
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
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.query("query");
}

X6Basic_timeRegion_timeRegionPar_weekPlanRef_getList = function() {
	return "X6Basic.timeRegion.timeRegionPar.weekPlanRef";
}
X6Basic.timeRegion.timeRegionPar.weekPlanRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.X6Basic_timeRegion_timeRegionPar_weekPlanRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

X6Basic.timeRegion.timeRegionPar.weekPlanRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.timeRegion.timeRegionPar.weekPlanRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_timeRegion_timeRegionPar_weekPlanRef_fileupload_button",
		handler:function(){
				list_operate_timeRegion_weekPlanRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.timeRegion.timeRegionPar.weekPlanRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_timeRegion_weekPlanRef.X6Basic.timeRegion.timeRegionPar." + params.viewName + ".referenceCopy");
			funcName('timeRegionPar', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.timeRegion.timeRegionPar.weekPlanRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_timeRegion_weekPlanRef.X6Basic.timeRegion.timeRegionPar." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.timeRegion.timeRegionPar.weekPlanRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_timeRegion_weekPlanRef.X6Basic.timeRegion.timeRegionPar." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	X6Basic.timeRegion.timeRegionPar.weekPlanRef.dbClickViewweekPlanRef =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=X6Basic_1.0_timeRegion&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method X6Basic.timeRegion.timeRegionPar.weekPlanRef.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = X6Basic.timeRegion.timeRegionPar.weekPlanRef.otherParams || {};
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
					list_operate_timeRegion_weekPlanRef.CUI('#'+formId).submit();
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
		if ( X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg ) {
			X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg._config.url = url;
			X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg._config.formId = formId;
			X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg.setTitle( title )
			X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg.setButtonbar( buttons );
		}else{
			X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_timeRegion_weekPlanRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		X6Basic.timeRegion.timeRegionPar.weekPlanRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_timeRegion_timeRegionPar', element : $('#X6Basic_timeRegion_timeRegionPar_weekPlanRef_fileupload_button a:eq(1)')});
		}
		X6Basic.timeRegion.timeRegionPar.weekPlanRef.otherParams = {};
	};

	X6Basic.timeRegion.timeRegionPar.weekPlanRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof X6Basic.timeRegion.timeRegionPar.weekPlanRef.beforeCommonQuery === 'function') {
	   		var ret = X6Basic.timeRegion.timeRegionPar.weekPlanRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof X6Basic.timeRegion.timeRegionPar.weekPlanRef.cancelSelectedNode == 'function') {
	   X6Basic.timeRegion.timeRegionPar.weekPlanRef.cancelSelectedNode();
	   X6Basic.timeRegion.timeRegionPar.weekPlanRef.node = null;
	  }
	  if(typeof X6Basic_timeRegion_timeRegionPar_weekPlanRef_cancelSelectedNode == 'function') {
	   X6Basic_timeRegion_timeRegionPar_weekPlanRef_cancelSelectedNode();
	   X6Basic.timeRegion.timeRegionPar.weekPlanRef.node = null;
	  }
	  X6Basic.timeRegion.timeRegionPar.weekPlanRef.query(type);
	 };
	
	
	
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_timeRegion";
		openExportFrame(url);
	}
X6Basic.timeRegion.timeRegionPar.weekPlanRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.otherParams = {};
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.otherParams.dialogType = dialogType;
	X6Basic.timeRegion.timeRegionPar.weekPlanRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.timeRegion.timeRegionPar.weekPlanRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.timeRegion.timeRegionPar.editCallBackInfo
 */
X6Basic.timeRegion.timeRegionPar.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_timeRegion_timeRegionPar_weekPlanRef_getLayout == "function"){
    		var layout = X6Basic_timeRegion_timeRegionPar_weekPlanRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.timeRegion.timeRegionPar.weekPlanRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryWidget._sortKey && ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'X6Basic_1.0_timeRegion_TimeRegionPar'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryWidget._sortKey && ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryWidget._sortKey && ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef_queryWidget._sortMethod ? true : false;
		if(typeof X6Basic_timeRegion_timeRegionPar_weekPlanRef_getLayout == "function"){
			var layout = X6Basic_timeRegion_timeRegionPar_weekPlanRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.timeRegion.timeRegionPar.weekPlanRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.timeRegion.timeRegionPar.weekPlanRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.timeRegion.timeRegionPar.weekPlanRef.query('query');
	    	}
			if(modelCode == 'X6Basic_1.0_timeRegion_TimeRegionPar'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.timeRegion.timeRegionPar.weekPlanRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.timeRegion.timeRegionPar.weekPlanRef.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;var year_start = $('#' + formId + ' input[name^="year_start"]').val();var year_end = $('#' + formId + ' input[name^="year_end"]').val();if( year_start!=null && year_start!=''){if(!isInteger(year_start)){errorbarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.integer')}");return false;}}if(year_end!=null &&  year_end !=''){if(!isInteger(year_end)){errorbarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.integer')}");return false;}}var month_start = $('#' + formId + ' input[name^="month_start"]').val();var month_end = $('#' + formId + ' input[name^="month_end"]').val();if( month_start!=null && month_start!=''){if(!isInteger(month_start)){errorbarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.integer')}");return false;}}if(month_end!=null &&  month_end !=''){if(!isInteger(month_end)){errorbarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="month_start"]').val()!='' && $('#' + formId + ' input[name="month_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="month_start"]').val()) > parseInt($('#' + formId + ' input[name="month_end"]').val())){errorbarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="year_start"]').val()!='' && $('#' + formId + ' input[name="year_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="year_start"]').val()) > parseInt($('#' + formId + ' input[name="year_end"]').val())){errorbarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_weekPlanRef,js,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='X6Basic_1.0_timeRegion_weekPlanRef' idprefix='ec_X6Basic_timeRegion_timeRegionPar_weekPlanRef' queryUrl='/X6Basic/timeRegion/timeRegionPar/weekPlanRef-query.action' queryFunc="X6Basic.timeRegion.timeRegionPar.weekPlanRef.query" ns="X6Basic.timeRegion.timeRegionPar.weekPlanRef" />
