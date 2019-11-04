<!-- RM_7.5.0.0/processType/processTypeRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487220867598')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_processType_processTypeRef,head,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("RM.processType.processType.processTypeRef");
</script>
<input type="hidden" name="RM_processType_processType_processTypeRef_callBackFuncName" id="RM_processType_processType_processTypeRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_processType_processType_processTypeRefErrorbar" />
<@frameset id="ec_RM_processType_processType_processTypeRef_container" border=0>
	<@frame id="ec_RM_processType_processType_processTypeRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "processTypeRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_RM_processType_processType_processTypeRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_RM_processType_processType_processTypeRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_processType_processTypeRef,html,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return RM.processType.processType.processTypeRef.sendBackprocessTypeRef(null,datatable_ec_RM_processType_processType_processTypeRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_processType_processType_processTypeRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.processType.processType.processTypeRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.processType.processType.processTypeRef.query
	 */
	RM.processType.processType.processTypeRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_processType_processType_processTypeRef_queryForm", RM_processType_processType_processTypeRefErrorbarWidget)) {
				return false;
		}
		var node = RM.processType.processType.processTypeRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_processType_processType_processTypeRef_query._sortKey && datatable_ec_RM_processType_processType_processTypeRef_query._sortMethod){
			CUI('#ec_RM_processType_processType_processTypeRef_queryForm #dataTableSortColKey').val(datatable_ec_RM_processType_processType_processTypeRef_query._sortKey);
			CUI('#ec_RM_processType_processType_processTypeRef_queryForm #dataTableSortColName').val(datatable_ec_RM_processType_processType_processTypeRef_query._sortColumnName);
			CUI('#ec_RM_processType_processType_processTypeRef_queryForm #dataTableSortColOrder').val(datatable_ec_RM_processType_processType_processTypeRef_query._sortMethod);
		}else{
			datatable_ec_RM_processType_processType_processTypeRef_query._sortKey = '';
			CUI('#ec_RM_processType_processType_processTypeRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_processType_processType_processTypeRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_processType_processType_processTypeRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_processType_processType_processTypeRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.processType.processType.processTypeRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/processType/processType/processTypeRef-query.action";
		CUI('#ec_RM_processType_processType_processTypeRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_processType_processType_processTypeRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_processType_processTypeRef";
		condobj.modelAlias="processType";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_processType_processType_processTypeRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_processType_processType_processTypeRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_processType_processType_processTypeRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_processType_processType_processTypeRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_processType_processType_processTypeRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name="'+ec_RM_processType_processType_processTypeRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_processType_processType_processTypeRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_processType_processType_processTypeRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_processType_processType_processTypeRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_processType_processType_processTypeRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_processType_processType_processTypeRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_processType_processTypeRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_processType_processType_processTypeRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.processType.processType.processTypeRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.processType.processType.processTypeRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.processType.processType.processTypeRef._prefix += '.';
			}
			RM.processType.processType.processTypeRef._prefix += arr[i];
		}
		RM.processType.processType.processTypeRef._suffix = arr[arr.length -1];
		if(RM.processType.processType.processTypeRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.processType.processType.processTypeRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.processType.processType.processTypeRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.processType.processType.processTypeRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.processType.processType.processTypeRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name="'+RM.processType.processType.processTypeRef._prefix + '.' + RM.processType.processType.processTypeRef._suffix +'"]').val(obj[0][RM.processType.processType.processTypeRef._suffix]);
		CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name="'+RM.processType.processType.processTypeRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name^="'+RM.processType.processType.processTypeRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name="'+RM.processType.processType.processTypeRef._prefix + '.' + RM.processType.processType.processTypeRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_processType_processType_processTypeRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.processType.processType.processTypeRef._dialog) {
			RM.processType.processType.processTypeRef._dialog.close();
		}
	};
	
	RM.processType.processType.processTypeRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.processType.processType.processTypeRef.query_"+obj+")!='undefined'") ? eval('RM.processType.processType.processTypeRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_processType_processType_processTypeRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.processType.processType.processTypeRef.sendBackprocessTypeRef(null,datatable_ec_RM_processType_processType_processTypeRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_processType_processType_processTypeRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.processType.processType.processTypeRef.sendBackprocessTypeRef(null,datatable_ec_RM_processType_processType_processTypeRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.processType.processType.processTypeRef.sendBackprocessTypeRef
	 */
	RM.processType.processType.processTypeRef.sendBackprocessTypeRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_processType_processType_processTypeRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.processType.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_processType_processType_processTypeRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_processType_processType_processTypeRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_processType_processType_processTypeRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_processType_processType_processTypeRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_processType_processType_processTypeRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_processType_processType_processTypeRef_callBackFuncName").val() + "(arrObj)");
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
			RM_processType_processType_processTypeRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_processType_processType_processTypeRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_processType_processType_processTypeRef_refresh = function(node){
RM.processType.processType.processTypeRef.node = node;
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
	RM.processType.processType.processTypeRef.query("query");
}

RM_processType_processType_processTypeRef_getList = function() {
	return "RM.processType.processType.processTypeRef";
}
RM.processType.processType.processTypeRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_processType_processType_processTypeRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.processType.processType.processTypeRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.processType.processType.processTypeRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_processType_processType_processTypeRef_fileupload_button",
		handler:function(){
				list_operate_processType_processTypeRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.processType.processType.processTypeRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_processType_processTypeRef.RM.processType.processType." + params.viewName + ".referenceCopy");
			funcName('processType', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.processType.processType.processTypeRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_processType_processTypeRef.RM.processType.processType." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.processType.processType.processTypeRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_processType_processTypeRef.RM.processType.processType." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('RM_7.5.0.0_processType_processTypeEdit')>
			/**
			 * 列表新增
			 * @method RM.processType.processType.processTypeRef.addprocessTypeRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.processType.processType.processTypeRef.addprocessTypeRef = function() {
				var buttonCode='RM_7.5.0.0_processType_processTypeRef_BUTTON_add';
					var treeParam = "";
					if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
						var layout = RM_processType_processType_processTypeRef_getLayout();
						var node = layout.getNode();
						if(node == null){
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}else{
							if(node.cid!='${Session.company.id}'&&node.id!=-1){
								workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
								return;
							}
							var modelCode = node.modelCode.replace(/\./g, '\_');
							if(modelCode == 'RM_7.5.0.0_processType_ProcessType'.replace(/\./g, '\_')){
								treeParam = '&processType.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&processType.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = RM.processType.processType.processTypeRef.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = RM.processType.processType.processTypeRef.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						RM.processType.processType.processTypeRef.otherParams = otherParams;

						var url='${editView.url}?entityCode=RM_7.5.0.0_processType' + "&${getPowerCode('${buttonPerfix!}processTypeRef_add_add_RM_7.5.0.0_processType_processTypeRef')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 			url +='&calltype=ref';
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_processType_processTypeRef';
						RM.processType.processType.processTypeRef.showDialog(url,'RM_processType_processType_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=RM_7.5.0.0_processType' + "&${getPowerCode('${buttonPerfix!}processTypeRef_add_add_RM_7.5.0.0_processType_processTypeRef')}";
						if(treeParam!=""){
				 			url += treeParam;
				 		}
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 			url +='&calltype=ref';
				 		var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
			 			if(signatureInfo[0] != '') {
			 				url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
			 			}
						openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
					</#if>
			};
			
			<#assign editView = getViewByCode('RM_7.5.0.0_processType_processTypeEdit')>
			/**
			 * 列表编辑
			 * @method RM.processType.processType.processTypeRef.modifyprocessTypeRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.processType.processType.processTypeRef.modifyprocessTypeRef = function() {
				var buttonCode='RM_7.5.0.0_processType_processTypeRef_BUTTON_modify';
				if(RM.processType.processType.processTypeRef.checkSelectedAny()){
					if(RM.processType.processType.processTypeRef.checkSelectedMore()) {
						var cid = ec_RM_processType_processType_processTypeRef_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = RM.processType.processType.processTypeRef.getOperateRecordId();
							otherParams.uploadBtn = RM.processType.processType.processTypeRef.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = RM.processType.processType.processTypeRef.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = RM.processType.processType.processTypeRef.createPrintBtn('${editView.name}','${editView.url}?entityCode=RM_7.5.0.0_processType&id=' + RM.processType.processType.processTypeRef.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}processTypeRef_modify_modify_RM_7.5.0.0_processType_processTypeRef')}");
							otherParams.printSettingBtn = RM.processType.processType.processTypeRef.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							RM.processType.processType.processTypeRef.otherParams = otherParams;

							RM.processType.processType.processTypeRef.showDialog('${editView.url}?entityCode=RM_7.5.0.0_processType&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_processType_processTypeRef'+'&id=' + RM.processType.processType.processTypeRef.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}processTypeRef_modify_modify_RM_7.5.0.0_processType_processTypeRef')}",'RM_processType_processType_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=RM_7.5.0.0_processType'+signatureStr+'&id=' + RM.processType.processType.processTypeRef.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}processTypeRef_modify_modify_RM_7.5.0.0_processType_processTypeRef')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/RM/processType/processType/delete.action?ids=" + RM.processType.processType.processTypeRef.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}processTypeRef_delete_del_RM_7.5.0.0_processType_processTypeRef')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,RM.processType.processType.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method RM.processType.processType.processTypeRef.delprocessTypeRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.processType.processType.processTypeRef.delprocessTypeRef = function(param) {
				var buttonCode='RM_7.5.0.0_processType_processTypeRef_BUTTON_delete';
				if(RM.processType.processType.processTypeRef.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows.length ; i++){
                        var cid = datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("RM.buttonPropertyshowName.radion148707478751923")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/RM/processType/processType/delete.action?ids=" + RM.processType.processType.processTypeRef.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}processTypeRef_delete_del_RM_7.5.0.0_processType_processTypeRef')}", RM.processType.processType.callBackInfo, "json");
					}
				});
				}
			};
			
	
	/**
	 * 保存完毕回调
	 * @method RM.processType.processType.callBackInfo
	 */
	RM.processType.processType.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
					var errorBarWidget = eval('RM_processType_processType_processTypeRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
				} else if(res.operateType == 'delete') {
					var errorBarWidget = eval('RM_processType_processType_processTypeRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
				}  else if(res.operateType == 'restore') {
					var errorBarWidget = eval('RM_processType_processType_processTypeRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
				} 
			setTimeout(function(){
				try{RM.processType.processType.processTypeRef.Dlg.close();closeLoadPanel();}catch(e){}
								if(res.operateType == 'save') {
									var queryFunc = datatable_ec_RM_processType_processType_processTypeRef_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_processType_processType_processTypeRef_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
								    		var layout = RM_processType_processType_processTypeRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.processType.processType.processTypeRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.processType.processType.processTypeRef.node = null;
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false;
										if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
											var layout = RM_processType_processType_processTypeRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.processType.processType.processTypeRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.processType.processType.processTypeRef.query('query');
									    	}
											if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.processType.processType.processTypeRef.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.processType.processType.processTypeRef.query('query');
									    	}
										}
									}
								}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_RM_processType_processType_processTypeRef_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_processType_processType_processTypeRef_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
							    		var layout = RM_processType_processType_processTypeRef_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.processType.processType.processTypeRef.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false;
									if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
										var layout = RM_processType_processType_processTypeRef_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.processType.processType.processTypeRef.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.processType.processType.processTypeRef.query('query');
								    	}
										if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.processType.processType.processTypeRef.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_RM_processType_processType_processTypeRef_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_processType_processType_processTypeRef_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
								    		var layout = RM_processType_processType_processTypeRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.processType.processType.processTypeRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.processType.processType.processTypeRef.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false;
										if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
											var layout = RM_processType_processType_processTypeRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.processType.processType.processTypeRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.processType.processType.processTypeRef.query('query');
									    	}
											if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.processType.processType.processTypeRef.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.processType.processType.processTypeRef.query('query');
									    	}
										}
									}
								}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method RM.processType.processType.processTypeRef.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.processType.processType.processTypeRef.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.processType.processType.processTypeRef.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.processType.processType.processTypeRef.checkSelectedValid = function(type) {
		if(RM.processType.processType.processTypeRef.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows[i].valid === false){
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
	 * @method RM.processType.processType.processTypeRef.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.processType.processType.processTypeRef.checkSelectedAny = function() {
		if(datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.processType.processType.processTypeRef.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.processType.processType.processTypeRef.checkSelectedMore = function() {
		if(datatable_ec_RM_processType_processType_processTypeRef_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.processType.processType.processTypeRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.processType.processType.processTypeRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.processType.processType.processTypeRef.otherParams || {};
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
				<#assign editView = getViewByCode('RM_7.5.0.0_processType_processTypeEdit')>
				<#if editView.extraView?? && editView.extraView.configMap?? && editView.extraView.configMap.layout?? && editView.extraView.configMap.layout.sections??>
				if(viewCode=='${editView.code}'||!viewCode){
					<#list editView.extraView.configMap.layout.sections as buttonSection>
						<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
								<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
									<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false' 
										|| checkUserPermisition('${editView.entity.code}_${operateBtn.permissionCode!}')>
										buttons.push({
											name:"${getText(operateBtn.namekey!)}",
											align:"${operateBtn.buttonAlign!'left'}",
											handler:function(){
												<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
												<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
												<#assign funcname = funcname?split('=')[1]>
												list_operate_processType_processTypeRef.${funcname};
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
					list_operate_processType_processTypeRef.CUI('#'+formId).submit();
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
		if ( RM.processType.processType.processTypeRef.Dlg ) {
			RM.processType.processType.processTypeRef.Dlg._config.url = url;
			RM.processType.processType.processTypeRef.Dlg._config.formId = formId;
			RM.processType.processType.processTypeRef.Dlg.setTitle( title )
			RM.processType.processType.processTypeRef.Dlg.setButtonbar( buttons );
		}else{
			RM.processType.processType.processTypeRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_processType_processTypeRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.processType.processType.processTypeRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.processType.processType.processTypeRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_processType_processType', element : $('#RM_processType_processType_processTypeRef_fileupload_button a:eq(1)')});
		}
		RM.processType.processType.processTypeRef.otherParams = {};
	};

	RM.processType.processType.processTypeRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.processType.processType.processTypeRef.beforeCommonQuery === 'function') {
	   		var ret = RM.processType.processType.processTypeRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.processType.processType.processTypeRef.cancelSelectedNode == 'function') {
	   RM.processType.processType.processTypeRef.cancelSelectedNode();
	   RM.processType.processType.processTypeRef.node = null;
	  }
	  if(typeof RM_processType_processType_processTypeRef_cancelSelectedNode == 'function') {
	   RM_processType_processType_processTypeRef_cancelSelectedNode();
	   RM.processType.processType.processTypeRef.node = null;
	  }
	  RM.processType.processType.processTypeRef.query(type);
	 };
	
	
	
	RM.processType.processType.processTypeRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_processType";
		openExportFrame(url);
	}
RM.processType.processType.processTypeRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.processType.processType.processTypeRef.otherParams = {};
	RM.processType.processType.processTypeRef.otherParams.dialogType = dialogType;
	RM.processType.processType.processTypeRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.processType.processType.processTypeRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.processType.processType.editCallBackInfo
 */
RM.processType.processType.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_processType_processType_processTypeRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_processType_processType_processTypeRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
    		var layout = RM_processType_processType_processTypeRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.processType.processType.processTypeRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_processType_processType_processTypeRef_queryWidget._sortKey && ec_RM_processType_processType_processTypeRef_queryWidget._sortMethod ? true : false;
		if(typeof RM_processType_processType_processTypeRef_getLayout == "function"){
			var layout = RM_processType_processType_processTypeRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.processType.processType.processTypeRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.processType.processType.processTypeRef.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_processType_ProcessType'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.processType.processType.processTypeRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.processType.processType.processTypeRef.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_processType_processTypeRef,js,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_processType_processTypeRef' idprefix='ec_RM_processType_processType_processTypeRef' queryUrl='/RM/processType/processType/processTypeRef-query.action' queryFunc="RM.processType.processType.processTypeRef.query" ns="RM.processType.processType.processTypeRef" />
<@exportexcel action="/RM/processType/processType/processTypeRef-query.action"   getRequireDataAction="/RM/processType/processType/processTypeRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_processType_ProcessType&&viewCode=RM_7.5.0.0_processType_processTypeRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_processType_processTypeRef')}" prefix="ec_RM_processType_processType_processTypeRef_query" modelCode="RM_7.5.0.0_processType_ProcessType"  importFlag="false" viewCode="RM_7.5.0.0_processType_processTypeRef" />
