<!-- X6Basic_1.0/signetManage/refer -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1368940381208')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_signetManage_refer,head,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("X6Basic.signetManage.signetSetting.refer");
</script>
<input type="hidden" name="X6Basic_signetManage_signetSetting_refer_callBackFuncName" id="X6Basic_signetManage_signetSetting_refer_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="X6Basic_signetManage_signetSetting_referErrorbar" />
<@frameset id="ec_X6Basic_signetManage_signetSetting_refer_container" border=0>
	<@frame id="ec_X6Basic_signetManage_signetSetting_refer_container_main"  offsetH=4 region="center" class="center_in">
	<#include "refer-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_X6Basic_signetManage_signetSetting_refer_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_X6Basic_signetManage_signetSetting_refer_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_signetManage_refer,html,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return X6Basic.signetManage.signetSetting.refer.sendBackrefer(null,datatable_ec_X6Basic_signetManage_signetSetting_refer_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_X6Basic_signetManage_signetSetting_refer_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("X6Basic.signetManage.signetSetting.refer.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method X6Basic.signetManage.signetSetting.refer.query
	 */
	X6Basic.signetManage.signetSetting.refer.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_X6Basic_signetManage_signetSetting_refer_queryForm", X6Basic_signetManage_signetSetting_referErrorbarWidget)) {
				return false;
		}
		var node = X6Basic.signetManage.signetSetting.refer.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_X6Basic_signetManage_signetSetting_refer_query._sortKey && datatable_ec_X6Basic_signetManage_signetSetting_refer_query._sortMethod){
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_signetManage_signetSetting_refer_query._sortKey);
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_signetManage_signetSetting_refer_query._sortColumnName);
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_signetManage_signetSetting_refer_query._sortMethod);
		}else{
			datatable_ec_X6Basic_signetManage_signetSetting_refer_query._sortKey = '';
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_X6Basic_signetManage_signetSetting_refer_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "X6Basic.signetManage.signetSetting.refer.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/X6Basic/signetManage/signetSetting/refer-query.action";
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="X6Basic_1.0_signetManage_refer";
		condobj.modelAlias="signetSetting";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_X6Basic_signetManage_signetSetting_refer_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_X6Basic_signetManage_signetSetting_refer_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_X6Basic_signetManage_signetSetting_refer_quickquery_info[fieldName].dbColumnType;
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
							if(ec_X6Basic_signetManage_signetSetting_refer_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+ec_X6Basic_signetManage_signetSetting_refer_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_X6Basic_signetManage_signetSetting_refer_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_X6Basic_signetManage_signetSetting_refer_quickquery_info["MainTableName"];
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
						var layrec=ec_X6Basic_signetManage_signetSetting_refer_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_X6Basic_signetManage_signetSetting_refer_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_signetManage_signetSetting_refer_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_signetManage_refer';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_X6Basic_signetManage_signetSetting_refer_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	X6Basic.signetManage.signetSetting.refer._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.signetManage.signetSetting.refer._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.signetManage.signetSetting.refer._prefix += '.';
			}
			X6Basic.signetManage.signetSetting.refer._prefix += arr[i];
		}
		X6Basic.signetManage.signetSetting.refer._suffix = arr[arr.length -1];
		if(X6Basic.signetManage.signetSetting.refer._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.signetManage.signetSetting.refer._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.signetManage.signetSetting.refer._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.signetManage.signetSetting.refer.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.signetManage.signetSetting.refer.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+X6Basic.signetManage.signetSetting.refer._prefix + '.' + X6Basic.signetManage.signetSetting.refer._suffix +'"]').val(obj[0][X6Basic.signetManage.signetSetting.refer._suffix]);
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+X6Basic.signetManage.signetSetting.refer._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name^="'+X6Basic.signetManage.signetSetting.refer._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+X6Basic.signetManage.signetSetting.refer._prefix + '.' + X6Basic.signetManage.signetSetting.refer._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.signetManage.signetSetting.refer._dialog) {
			X6Basic.signetManage.signetSetting.refer._dialog.close();
		}
	};
	
	X6Basic.signetManage.signetSetting.refer._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.signetManage.signetSetting.refer.query_"+obj+")!='undefined'") ? eval('X6Basic.signetManage.signetSetting.refer.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_signetManage_signetSetting_refer_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return X6Basic.signetManage.signetSetting.refer.sendBackrefer(null,datatable_ec_X6Basic_signetManage_signetSetting_refer_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_X6Basic_signetManage_signetSetting_refer_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return X6Basic.signetManage.signetSetting.refer.sendBackrefer(null,datatable_ec_X6Basic_signetManage_signetSetting_refer_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method X6Basic.signetManage.signetSetting.refer.sendBackrefer
	 */
	X6Basic.signetManage.signetSetting.refer.sendBackrefer = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_X6Basic_signetManage_signetSetting_refer_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('X6Basic.signetSetting.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() + "(arrObj)");
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
			X6Basic_signetManage_signetSetting_referErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			X6Basic_signetManage_signetSetting_referErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
X6Basic_signetManage_signetSetting_refer_refresh = function(node){
X6Basic.signetManage.signetSetting.refer.node = node;
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
	X6Basic.signetManage.signetSetting.refer.query("query");
}

X6Basic_signetManage_signetSetting_refer_getList = function() {
	return "X6Basic.signetManage.signetSetting.refer";
}
X6Basic.signetManage.signetSetting.refer.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.X6Basic_signetManage_signetSetting_referErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

X6Basic.signetManage.signetSetting.refer.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.signetManage.signetSetting.refer.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_signetManage_signetSetting_refer_fileupload_button",
		handler:function(){
				list_operate_signetManage_refer.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.signetManage.signetSetting.refer.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_signetManage_refer.X6Basic.signetManage.signetSetting." + params.viewName + ".referenceCopy");
			funcName('signetSetting', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.signetManage.signetSetting.refer.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_signetManage_refer.X6Basic.signetManage.signetSetting." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.signetManage.signetSetting.refer.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_signetManage_refer.X6Basic.signetManage.signetSetting." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	X6Basic.signetManage.signetSetting.refer.dbClickViewrefer =  function(event, oRow) {
		var viewUrl = '/X6Basic/signetManage/signetSetting/view.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			var otherParams = {};
			otherParams.viewShowType = 'VIEW';
			otherParams.dialogType = '4';
			X6Basic.signetManage.signetSetting.refer.otherParams = otherParams;
			X6Basic.signetManage.signetSetting.refer.showDialog(viewUrl + "?entityCode=X6Basic_1.0_signetManage&id=" + oRow.id,'X6Basic_signetManage_signetSetting_view_form','${getText("X6Basic.viewtitle.radion1367495632577")}',495,445,'X6Basic_1.0_signetManage_view');
		}
	}
	/**
	 * 显示增加对话框
	 * @method X6Basic.signetManage.signetSetting.refer.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.signetManage.signetSetting.refer.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = X6Basic.signetManage.signetSetting.refer.otherParams || {};
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
					list_operate_signetManage_refer.CUI('#'+formId).submit();
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
		if ( X6Basic.signetManage.signetSetting.refer.Dlg ) {
			X6Basic.signetManage.signetSetting.refer.Dlg._config.url = url;
			X6Basic.signetManage.signetSetting.refer.Dlg._config.formId = formId;
			X6Basic.signetManage.signetSetting.refer.Dlg.setTitle( title )
			X6Basic.signetManage.signetSetting.refer.Dlg.setButtonbar( buttons );
		}else{
			X6Basic.signetManage.signetSetting.refer.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_signetManage_refer',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		X6Basic.signetManage.signetSetting.refer.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		X6Basic.signetManage.signetSetting.refer.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_signetManage_signetSetting', element : $('#X6Basic_signetManage_signetSetting_refer_fileupload_button a:eq(1)')});
		}
		X6Basic.signetManage.signetSetting.refer.otherParams = {};
	};

	X6Basic.signetManage.signetSetting.refer.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof X6Basic.signetManage.signetSetting.refer.beforeCommonQuery === 'function') {
	   		var ret = X6Basic.signetManage.signetSetting.refer.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof X6Basic.signetManage.signetSetting.refer.cancelSelectedNode == 'function') {
	   X6Basic.signetManage.signetSetting.refer.cancelSelectedNode();
	   X6Basic.signetManage.signetSetting.refer.node = null;
	  }
	  if(typeof X6Basic_signetManage_signetSetting_refer_cancelSelectedNode == 'function') {
	   X6Basic_signetManage_signetSetting_refer_cancelSelectedNode();
	   X6Basic.signetManage.signetSetting.refer.node = null;
	  }
	  X6Basic.signetManage.signetSetting.refer.query(type);
	 };
	
	
	
	X6Basic.signetManage.signetSetting.refer.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_signetManage";
		openExportFrame(url);
	}
X6Basic.signetManage.signetSetting.refer.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	X6Basic.signetManage.signetSetting.refer.otherParams = {};
	X6Basic.signetManage.signetSetting.refer.otherParams.dialogType = dialogType;
	X6Basic.signetManage.signetSetting.refer.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.signetManage.signetSetting.refer.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.signetManage.signetSetting.editCallBackInfo
 */
X6Basic.signetManage.signetSetting.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_X6Basic_signetManage_signetSetting_refer_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_signetManage_signetSetting_refer_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_signetManage_signetSetting_refer_getLayout == "function"){
    		var layout = X6Basic_signetManage_signetSetting_refer_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.signetManage.signetSetting.refer.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_signetManage_signetSetting_refer_queryWidget._sortKey && ec_X6Basic_signetManage_signetSetting_refer_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'X6Basic_1.0_signetManage_SignetSetting'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_signetManage_signetSetting_refer_queryWidget._sortKey && ec_X6Basic_signetManage_signetSetting_refer_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_X6Basic_signetManage_signetSetting_refer_queryWidget._sortKey && ec_X6Basic_signetManage_signetSetting_refer_queryWidget._sortMethod ? true : false;
		if(typeof X6Basic_signetManage_signetSetting_refer_getLayout == "function"){
			var layout = X6Basic_signetManage_signetSetting_refer_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.signetManage.signetSetting.refer.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.signetManage.signetSetting.refer.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.signetManage.signetSetting.refer.query('query');
	    	}
			if(modelCode == 'X6Basic_1.0_signetManage_SignetSetting'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.signetManage.signetSetting.refer.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.signetManage.signetSetting.refer.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_signetManage_refer,js,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='X6Basic_1.0_signetManage_refer' idprefix='ec_X6Basic_signetManage_signetSetting_refer' queryUrl='/X6Basic/signetManage/signetSetting/refer-query.action' queryFunc="X6Basic.signetManage.signetSetting.refer.query" ns="X6Basic.signetManage.signetSetting.refer" />
<@exportexcel action="/X6Basic/signetManage/signetSetting/refer-query.action"   getRequireDataAction="/X6Basic/signetManage/signetSetting/refer-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=X6Basic_1.0_signetManage_SignetSetting&&viewCode=X6Basic_1.0_signetManage_refer" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_signetManage_refer')}" prefix="ec_X6Basic_signetManage_signetSetting_refer_query" modelCode="X6Basic_1.0_signetManage_SignetSetting"  importFlag="false" viewCode="X6Basic_1.0_signetManage_refer" />
