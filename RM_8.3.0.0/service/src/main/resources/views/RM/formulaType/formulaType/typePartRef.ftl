<!-- RM_7.5.0.0/formulaType/typePartRef -->
<script type="text/javascript">
	CUI.ns("RM.formulaType.formulaType.typePartRef");
</script>
<input type="hidden" name="RM_formulaType_formulaType_typePartRef_callBackFuncName" id="RM_formulaType_formulaType_typePartRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_formulaType_formulaType_typePartRefErrorbar" />
<#include "typePartRef-fastquery-datatable.ftl">
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formulaType_typePartRef,html,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_formulaType_formulaType_typePartRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.formulaType.formulaType.typePartRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.formulaType.formulaType.typePartRef.query
	 */
	RM.formulaType.formulaType.typePartRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_formulaType_formulaType_typePartRef_queryForm", RM_formulaType_formulaType_typePartRefErrorbarWidget)) {
				return false;
		}
		var node = RM.formulaType.formulaType.typePartRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_formulaType_formulaType_typePartRef_query._sortKey && datatable_ec_RM_formulaType_formulaType_typePartRef_query._sortMethod){
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm #dataTableSortColKey').val(datatable_ec_RM_formulaType_formulaType_typePartRef_query._sortKey);
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm #dataTableSortColName').val(datatable_ec_RM_formulaType_formulaType_typePartRef_query._sortColumnName);
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formulaType_formulaType_typePartRef_query._sortMethod);
		}else{
			datatable_ec_RM_formulaType_formulaType_typePartRef_query._sortKey = '';
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_formulaType_formulaType_typePartRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.formulaType.formulaType.typePartRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/formulaType/formulaType/typePartRef-query.action";
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formulaType_formulaType_typePartRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formulaType_typePartRef";
		condobj.modelAlias="formulaType";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formulaType_formulaType_typePartRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formulaType_formulaType_typePartRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formulaType_formulaType_typePartRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formulaType_typePartRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_formulaType_formulaType_typePartRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.formulaType.formulaType.typePartRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formulaType.formulaType.typePartRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formulaType.formulaType.typePartRef._prefix += '.';
			}
			RM.formulaType.formulaType.typePartRef._prefix += arr[i];
		}
		RM.formulaType.formulaType.typePartRef._suffix = arr[arr.length -1];
		if(RM.formulaType.formulaType.typePartRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formulaType.formulaType.typePartRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formulaType.formulaType.typePartRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formulaType.formulaType.typePartRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formulaType.formulaType.typePartRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+RM.formulaType.formulaType.typePartRef._prefix + '.' + RM.formulaType.formulaType.typePartRef._suffix +'"]').val(obj[0][RM.formulaType.formulaType.typePartRef._suffix]);
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+RM.formulaType.formulaType.typePartRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name^="'+RM.formulaType.formulaType.typePartRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+RM.formulaType.formulaType.typePartRef._prefix + '.' + RM.formulaType.formulaType.typePartRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formulaType.formulaType.typePartRef._dialog) {
			RM.formulaType.formulaType.typePartRef._dialog.close();
		}
	};
	
	RM.formulaType.formulaType.typePartRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formulaType.formulaType.typePartRef.query_"+obj+")!='undefined'") ? eval('RM.formulaType.formulaType.typePartRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#if refUrl?? && refUrl?has_content>
		<#assign requestUri = refUrl?replace('/', '_', 'r')>
	<#else>
		<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
		<#assign requestUri = requestUri?replace('/', '_', 'r')>
	</#if>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formulaType_formulaType_typePartRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formulaType.formulaType.typePartRef.sendBacktypePartRef(null,datatable_ec_RM_formulaType_formulaType_typePartRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_formulaType_formulaType_typePartRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formulaType.formulaType.typePartRef.sendBacktypePartRef(null,datatable_ec_RM_formulaType_formulaType_typePartRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.formulaType.formulaType.typePartRef.sendBacktypePartRef
	 */
	RM.formulaType.formulaType.typePartRef.sendBacktypePartRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_formulaType_formulaType_typePartRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.formulaType.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() + "(arrObj)");
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
			RM_formulaType_formulaType_typePartRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_formulaType_formulaType_typePartRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_formulaType_formulaType_typePartRef_refresh = function(node){
RM.formulaType.formulaType.typePartRef.node = node;
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
	RM.formulaType.formulaType.typePartRef.query("query");
}

RM_formulaType_formulaType_typePartRef_getList = function() {
	return "RM.formulaType.formulaType.typePartRef";
}
RM.formulaType.formulaType.typePartRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formulaType_formulaType_typePartRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formulaType.formulaType.typePartRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formulaType.formulaType.typePartRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formulaType_formulaType_typePartRef_fileupload_button",
		handler:function(){
				list_operate_formulaType_typePartRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formulaType.formulaType.typePartRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formulaType_typePartRef.RM.formulaType.formulaType." + params.viewName + ".referenceCopy");
			funcName('formulaType', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formulaType.formulaType.typePartRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formulaType_typePartRef.RM.formulaType.formulaType." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formulaType.formulaType.typePartRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formulaType_typePartRef.RM.formulaType.formulaType." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('RM_7.5.0.0_formulaType_typeEidt')>
			/**
			 * 列表新增
			 * @method RM.formulaType.formulaType.typePartRef.addtypePartRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.formulaType.formulaType.typePartRef.addtypePartRef = function() {
				var buttonCode='RM_7.5.0.0_formulaType_typePartRef_BUTTON_add';
					var treeParam = "";
					if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
						var layout = RM_formulaType_formulaType_typePartRef_getLayout();
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
							if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'.replace(/\./g, '\_')){
								treeParam = '&formulaType.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&formulaType.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = RM.formulaType.formulaType.typePartRef.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = RM.formulaType.formulaType.typePartRef.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						RM.formulaType.formulaType.typePartRef.otherParams = otherParams;

						var url='${editView.url}?entityCode=RM_7.5.0.0_formulaType' + "&${getPowerCode('${buttonPerfix!}typePartRef_add_add_RM_7.5.0.0_formulaType_typePartRef')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 			url +='&calltype=ref';
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_formulaType_typePartRef';
						RM.formulaType.formulaType.typePartRef.showDialog(url,'RM_formulaType_formulaType_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=RM_7.5.0.0_formulaType' + "&${getPowerCode('${buttonPerfix!}typePartRef_add_add_RM_7.5.0.0_formulaType_typePartRef')}";
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
			
			<#assign editView = getViewByCode('RM_7.5.0.0_formulaType_typeEidt')>
			/**
			 * 列表编辑
			 * @method RM.formulaType.formulaType.typePartRef.modifytypePartRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.formulaType.formulaType.typePartRef.modifytypePartRef = function() {
				var buttonCode='RM_7.5.0.0_formulaType_typePartRef_BUTTON_eidt';
				if(RM.formulaType.formulaType.typePartRef.checkSelectedAny()){
					if(RM.formulaType.formulaType.typePartRef.checkSelectedMore()) {
						var cid = ec_RM_formulaType_formulaType_typePartRef_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = RM.formulaType.formulaType.typePartRef.getOperateRecordId();
							otherParams.uploadBtn = RM.formulaType.formulaType.typePartRef.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = RM.formulaType.formulaType.typePartRef.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = RM.formulaType.formulaType.typePartRef.createPrintBtn('${editView.name}','${editView.url}?entityCode=RM_7.5.0.0_formulaType&id=' + RM.formulaType.formulaType.typePartRef.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}typePartRef_eidt_modify_RM_7.5.0.0_formulaType_typePartRef')}");
							otherParams.printSettingBtn = RM.formulaType.formulaType.typePartRef.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							RM.formulaType.formulaType.typePartRef.otherParams = otherParams;

							RM.formulaType.formulaType.typePartRef.showDialog('${editView.url}?entityCode=RM_7.5.0.0_formulaType&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_formulaType_typePartRef'+'&id=' + RM.formulaType.formulaType.typePartRef.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}typePartRef_eidt_modify_RM_7.5.0.0_formulaType_typePartRef')}",'RM_formulaType_formulaType_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=RM_7.5.0.0_formulaType'+signatureStr+'&id=' + RM.formulaType.formulaType.typePartRef.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}typePartRef_eidt_modify_RM_7.5.0.0_formulaType_typePartRef')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/RM/formulaType/formulaType/delete.action?ids=" + RM.formulaType.formulaType.typePartRef.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}typePartRef_delete_del_RM_7.5.0.0_formulaType_typePartRef')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,RM.formulaType.formulaType.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method RM.formulaType.formulaType.typePartRef.deltypePartRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.formulaType.formulaType.typePartRef.deltypePartRef = function(param) {
				var buttonCode='RM_7.5.0.0_formulaType_typePartRef_BUTTON_delete';
				if(RM.formulaType.formulaType.typePartRef.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows.length ; i++){
                        var cid = datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("RM.buttonPropertyshowName.radion1497579263400")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/RM/formulaType/formulaType/delete.action?ids=" + RM.formulaType.formulaType.typePartRef.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}typePartRef_delete_del_RM_7.5.0.0_formulaType_typePartRef')}", RM.formulaType.formulaType.callBackInfo, "json");
					}
				});
				}
			};
			
	
	/**
	 * 保存完毕回调
	 * @method RM.formulaType.formulaType.callBackInfo
	 */
	RM.formulaType.formulaType.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
					var errorBarWidget = eval('RM_formulaType_formulaType_typePartRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
				} else if(res.operateType == 'delete') {
					var errorBarWidget = eval('RM_formulaType_formulaType_typePartRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
				}  else if(res.operateType == 'restore') {
					var errorBarWidget = eval('RM_formulaType_formulaType_typePartRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
				} 
			setTimeout(function(){
				try{RM.formulaType.formulaType.typePartRef.Dlg.close();closeLoadPanel();}catch(e){}
								if(res.operateType == 'save') {
									var queryFunc = datatable_ec_RM_formulaType_formulaType_typePartRef_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formulaType_formulaType_typePartRef_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
								    		var layout = RM_formulaType_formulaType_typePartRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.formulaType.formulaType.typePartRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.formulaType.formulaType.typePartRef.node = null;
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false;
										if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
											var layout = RM_formulaType_formulaType_typePartRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.formulaType.formulaType.typePartRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.formulaType.formulaType.typePartRef.query('query');
									    	}
											if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.formulaType.formulaType.typePartRef.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.formulaType.formulaType.typePartRef.query('query');
									    	}
										}
									}
								}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_RM_formulaType_formulaType_typePartRef_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formulaType_formulaType_typePartRef_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
							    		var layout = RM_formulaType_formulaType_typePartRef_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.formulaType.formulaType.typePartRef.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false;
									if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
										var layout = RM_formulaType_formulaType_typePartRef_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.formulaType.formulaType.typePartRef.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.formulaType.formulaType.typePartRef.query('query');
								    	}
										if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.formulaType.formulaType.typePartRef.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_RM_formulaType_formulaType_typePartRef_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formulaType_formulaType_typePartRef_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
								    		var layout = RM_formulaType_formulaType_typePartRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.formulaType.formulaType.typePartRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.formulaType.formulaType.typePartRef.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false;
										if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
											var layout = RM_formulaType_formulaType_typePartRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	RM.formulaType.formulaType.typePartRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.formulaType.formulaType.typePartRef.query('query');
									    	}
											if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												RM.formulaType.formulaType.typePartRef.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		RM.formulaType.formulaType.typePartRef.query('query');
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
	 * @method RM.formulaType.formulaType.typePartRef.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.formulaType.formulaType.typePartRef.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.formulaType.formulaType.typePartRef.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.formulaType.formulaType.typePartRef.checkSelectedValid = function(type) {
		if(RM.formulaType.formulaType.typePartRef.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows[i].valid === false){
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
	 * @method RM.formulaType.formulaType.typePartRef.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formulaType.formulaType.typePartRef.checkSelectedAny = function() {
		if(datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.formulaType.formulaType.typePartRef.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formulaType.formulaType.typePartRef.checkSelectedMore = function() {
		if(datatable_ec_RM_formulaType_formulaType_typePartRef_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.formulaType.formulaType.typePartRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formulaType.formulaType.typePartRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formulaType.formulaType.typePartRef.otherParams || {};
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
				<#assign editView = getViewByCode('RM_7.5.0.0_formulaType_typeEidt')>
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
												list_operate_formulaType_typePartRef.${funcname};
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
					list_operate_formulaType_typePartRef.CUI('#'+formId).submit();
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
		if ( RM.formulaType.formulaType.typePartRef.Dlg ) {
			RM.formulaType.formulaType.typePartRef.Dlg._config.url = url;
			RM.formulaType.formulaType.typePartRef.Dlg._config.formId = formId;
			RM.formulaType.formulaType.typePartRef.Dlg.setTitle( title )
			RM.formulaType.formulaType.typePartRef.Dlg.setButtonbar( buttons );
		}else{
			RM.formulaType.formulaType.typePartRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formulaType_typePartRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formulaType.formulaType.typePartRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formulaType.formulaType.typePartRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formulaType_formulaType', element : $('#RM_formulaType_formulaType_typePartRef_fileupload_button a:eq(1)')});
		}
		RM.formulaType.formulaType.typePartRef.otherParams = {};
	};

	RM.formulaType.formulaType.typePartRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formulaType.formulaType.typePartRef.beforeCommonQuery === 'function') {
	   		var ret = RM.formulaType.formulaType.typePartRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formulaType.formulaType.typePartRef.cancelSelectedNode == 'function') {
	   RM.formulaType.formulaType.typePartRef.cancelSelectedNode();
	   RM.formulaType.formulaType.typePartRef.node = null;
	  }
	  if(typeof RM_formulaType_formulaType_typePartRef_cancelSelectedNode == 'function') {
	   RM_formulaType_formulaType_typePartRef_cancelSelectedNode();
	   RM.formulaType.formulaType.typePartRef.node = null;
	  }
	  RM.formulaType.formulaType.typePartRef.query(type);
	 };
	
	
	
	RM.formulaType.formulaType.typePartRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formulaType";
		openExportFrame(url);
	}
RM.formulaType.formulaType.typePartRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formulaType.formulaType.typePartRef.otherParams = {};
	RM.formulaType.formulaType.typePartRef.otherParams.dialogType = dialogType;
	RM.formulaType.formulaType.typePartRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formulaType.formulaType.typePartRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.formulaType.formulaType.editCallBackInfo
 */
RM.formulaType.formulaType.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_formulaType_formulaType_typePartRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formulaType_formulaType_typePartRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
    		var layout = RM_formulaType_formulaType_typePartRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formulaType.formulaType.typePartRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortKey && ec_RM_formulaType_formulaType_typePartRef_queryWidget._sortMethod ? true : false;
		if(typeof RM_formulaType_formulaType_typePartRef_getLayout == "function"){
			var layout = RM_formulaType_formulaType_typePartRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formulaType.formulaType.typePartRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.formulaType.formulaType.typePartRef.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_formulaType_FormulaType'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formulaType.formulaType.typePartRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.formulaType.formulaType.typePartRef.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formulaType_typePartRef,js,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formulaType_typePartRef' idprefix='ec_RM_formulaType_formulaType_typePartRef' queryUrl='/RM/formulaType/formulaType/typePartRef-query.action' queryFunc="RM.formulaType.formulaType.typePartRef.query" ns="RM.formulaType.formulaType.typePartRef" />
<@exportexcel action="/RM/formulaType/formulaType/typePartRef-query.action"   getRequireDataAction="/RM/formulaType/formulaType/typePartRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formulaType_FormulaType&&viewCode=RM_7.5.0.0_formulaType_typePartRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formulaType_typePartRef')}" prefix="ec_RM_formulaType_formulaType_typePartRef_query" modelCode="RM_7.5.0.0_formulaType_FormulaType"  importFlag="false" viewCode="RM_7.5.0.0_formulaType_typePartRef" />
