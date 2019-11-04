<!-- MESBasic_1/container/containerSingleRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1555312756604')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_container_containerSingleRef,head,MESBasic_1_container_Container,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.container.container.containerSingleRef");
</script>
<input type="hidden" name="MESBasic_container_container_containerSingleRef_callBackFuncName" id="MESBasic_container_container_containerSingleRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_container_container_containerSingleRefErrorbar" />
<@frameset id="ec_MESBasic_container_container_containerSingleRef_container" border=0>
	<@frame id="ec_MESBasic_container_container_containerSingleRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "containerSingleRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_MESBasic_container_container_containerSingleRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_container_container_containerSingleRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_container_containerSingleRef,html,MESBasic_1_container_Container,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.container.container.containerSingleRef.sendBackcontainerSingleRef(null,datatable_ec_MESBasic_container_container_containerSingleRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_MESBasic_container_container_containerSingleRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("MESBasic.container.container.containerSingleRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method MESBasic.container.container.containerSingleRef.query
	 */
	MESBasic.container.container.containerSingleRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_MESBasic_container_container_containerSingleRef_queryForm", MESBasic_container_container_containerSingleRefErrorbarWidget)) {
				return false;
		}
		var node = MESBasic.container.container.containerSingleRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_MESBasic_container_container_containerSingleRef_query._sortKey && datatable_ec_MESBasic_container_container_containerSingleRef_query._sortMethod){
			CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_container_container_containerSingleRef_query._sortKey);
			CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_container_container_containerSingleRef_query._sortColumnName);
			CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_container_container_containerSingleRef_query._sortMethod);
		}else{
			datatable_ec_MESBasic_container_container_containerSingleRef_query._sortKey = '';
			CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_MESBasic_container_container_containerSingleRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "MESBasic.container.container.containerSingleRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/MESBasic/container/container/containerSingleRef-query.action";
		CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_container_container_containerSingleRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_container_containerSingleRef";
		condobj.modelAlias="container";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_container_container_containerSingleRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_container_container_containerSingleRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_container_container_containerSingleRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_container_container_containerSingleRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name="'+ec_MESBasic_container_container_containerSingleRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_container_container_containerSingleRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_container_container_containerSingleRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_container_container_containerSingleRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_container_container_containerSingleRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_container_container_containerSingleRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_container_containerSingleRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_container_container_containerSingleRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	MESBasic.container.container.containerSingleRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.container.container.containerSingleRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.container.container.containerSingleRef._prefix += '.';
			}
			MESBasic.container.container.containerSingleRef._prefix += arr[i];
		}
		MESBasic.container.container.containerSingleRef._suffix = arr[arr.length -1];
		if(MESBasic.container.container.containerSingleRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.container.container.containerSingleRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.container.container.containerSingleRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.container.container.containerSingleRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.container.container.containerSingleRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name="'+MESBasic.container.container.containerSingleRef._prefix + '.' + MESBasic.container.container.containerSingleRef._suffix +'"]').val(obj[0][MESBasic.container.container.containerSingleRef._suffix]);
		CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name="'+MESBasic.container.container.containerSingleRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name^="'+MESBasic.container.container.containerSingleRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name="'+MESBasic.container.container.containerSingleRef._prefix + '.' + MESBasic.container.container.containerSingleRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_container_container_containerSingleRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.container.container.containerSingleRef._dialog) {
			MESBasic.container.container.containerSingleRef._dialog.close();
		}
	};
	
	MESBasic.container.container.containerSingleRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.container.container.containerSingleRef.query_"+obj+")!='undefined'") ? eval('MESBasic.container.container.containerSingleRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_container_container_containerSingleRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.container.container.containerSingleRef.sendBackcontainerSingleRef(null,datatable_ec_MESBasic_container_container_containerSingleRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_container_container_containerSingleRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.container.container.containerSingleRef.sendBackcontainerSingleRef(null,datatable_ec_MESBasic_container_container_containerSingleRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.container.container.containerSingleRef.sendBackcontainerSingleRef
	 */
	MESBasic.container.container.containerSingleRef.sendBackcontainerSingleRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_container_container_containerSingleRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.container.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_container_container_containerSingleRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_container_container_containerSingleRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_container_container_containerSingleRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_container_container_containerSingleRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_container_container_containerSingleRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_container_container_containerSingleRef_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_container_container_containerSingleRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_container_container_containerSingleRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
MESBasic_container_container_containerSingleRef_refresh = function(node){
MESBasic.container.container.containerSingleRef.node = node;
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
	MESBasic.container.container.containerSingleRef.query("query");
}

MESBasic_container_container_containerSingleRef_getList = function() {
	return "MESBasic.container.container.containerSingleRef";
}
MESBasic.container.container.containerSingleRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_container_container_containerSingleRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.container.container.containerSingleRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.container.container.containerSingleRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_container_container_containerSingleRef_fileupload_button",
		handler:function(){
				list_operate_container_containerSingleRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.container.container.containerSingleRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_container_containerSingleRef.MESBasic.container.container." + params.viewName + ".referenceCopy");
			funcName('container', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.container.container.containerSingleRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_container_containerSingleRef.MESBasic.container.container." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.container.container.containerSingleRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_container_containerSingleRef.MESBasic.container.container." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('MESBasic_1_container_newContainerEdit')>
			/**
			 * 列表新增
			 * @method MESBasic.container.container.containerSingleRef.addcontainerSingleRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.container.container.containerSingleRef.addcontainerSingleRef = function() {
				var buttonCode='MESBasic_1_container_containerSingleRef_BUTTON_add';
					var treeParam = "";
					if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
						var layout = MESBasic_container_container_containerSingleRef_getLayout();
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
							if(modelCode == 'MESBasic_1_container_Container'.replace(/\./g, '\_')){
								treeParam = '&container.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&container.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = MESBasic.container.container.containerSingleRef.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = MESBasic.container.container.containerSingleRef.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						MESBasic.container.container.containerSingleRef.otherParams = otherParams;

						var url='${editView.url}?entityCode=MESBasic_1_container' + "&${getPowerCode('${buttonPerfix!}containerSingleRef_add_add_MESBasic_1_container_containerSingleRef')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 			url +='&calltype=ref';
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_container_containerSingleRef';
						MESBasic.container.container.containerSingleRef.showDialog(url,'MESBasic_container_container_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=MESBasic_1_container' + "&${getPowerCode('${buttonPerfix!}containerSingleRef_add_add_MESBasic_1_container_containerSingleRef')}";
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
			
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/MESBasic/container/container/delete.action?ids=" + MESBasic.container.container.containerSingleRef.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}containerSingleRef_delete_del_MESBasic_1_container_containerSingleRef')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,MESBasic.container.container.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method MESBasic.container.container.containerSingleRef.delcontainerSingleRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.container.container.containerSingleRef.delcontainerSingleRef = function(param) {
				var buttonCode='MESBasic_1_container_containerSingleRef_BUTTON_delete';
				if(MESBasic.container.container.containerSingleRef.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows.length ; i++){
                        var cid = datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("MESBasic.buttonPropertyshowName.radion1551702606265")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/MESBasic/container/container/delete.action?ids=" + MESBasic.container.container.containerSingleRef.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}containerSingleRef_delete_del_MESBasic_1_container_containerSingleRef')}", MESBasic.container.container.callBackInfo, "json");
					}
				});
				}
			};
			
			<#assign editView = getViewByCode('MESBasic_1_container_newContainerEdit')>
			/**
			 * 列表编辑
			 * @method MESBasic.container.container.containerSingleRef.modifycontainerSingleRef
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			MESBasic.container.container.containerSingleRef.modifycontainerSingleRef = function() {
				var buttonCode='MESBasic_1_container_containerSingleRef_BUTTON_modify';
				if(MESBasic.container.container.containerSingleRef.checkSelectedAny()){
					if(MESBasic.container.container.containerSingleRef.checkSelectedMore()) {
						var cid = ec_MESBasic_container_container_containerSingleRef_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = MESBasic.container.container.containerSingleRef.getOperateRecordId();
							otherParams.uploadBtn = MESBasic.container.container.containerSingleRef.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = MESBasic.container.container.containerSingleRef.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = MESBasic.container.container.containerSingleRef.createPrintBtn('${editView.name}','${editView.url}?entityCode=MESBasic_1_container&id=' + MESBasic.container.container.containerSingleRef.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}containerSingleRef_modify_modify_MESBasic_1_container_containerSingleRef')}");
							otherParams.printSettingBtn = MESBasic.container.container.containerSingleRef.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							MESBasic.container.container.containerSingleRef.otherParams = otherParams;

							MESBasic.container.container.containerSingleRef.showDialog('${editView.url}?entityCode=MESBasic_1_container&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_container_containerSingleRef'+'&id=' + MESBasic.container.container.containerSingleRef.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}containerSingleRef_modify_modify_MESBasic_1_container_containerSingleRef')}",'MESBasic_container_container_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=MESBasic_1_container'+signatureStr+'&id=' + MESBasic.container.container.containerSingleRef.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}containerSingleRef_modify_modify_MESBasic_1_container_containerSingleRef')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.container.container.callBackInfo
	 */
	MESBasic.container.container.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
					var errorBarWidget = eval('MESBasic_container_container_containerSingleRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
				} else if(res.operateType == 'delete') {
					var errorBarWidget = eval('MESBasic_container_container_containerSingleRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
				}  else if(res.operateType == 'restore') {
					var errorBarWidget = eval('MESBasic_container_container_containerSingleRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
				} 
			setTimeout(function(){
				try{MESBasic.container.container.containerSingleRef.Dlg.close();closeLoadPanel();}catch(e){}
								if(res.operateType == 'save') {
									var queryFunc = datatable_ec_MESBasic_container_container_containerSingleRef_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_container_container_containerSingleRef_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
								    		var layout = MESBasic_container_container_containerSingleRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.container.container.containerSingleRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_container_Container'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.container.container.containerSingleRef.node = null;
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
											var layout = MESBasic_container_container_containerSingleRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.container.container.containerSingleRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.container.container.containerSingleRef.query('query');
									    	}
											if(modelCode == 'MESBasic_1_container_Container'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.container.container.containerSingleRef.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.container.container.containerSingleRef.query('query');
									    	}
										}
									}
								}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_MESBasic_container_container_containerSingleRef_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_container_container_containerSingleRef_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
								    		var layout = MESBasic_container_container_containerSingleRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.container.container.containerSingleRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'MESBasic_1_container_Container'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.container.container.containerSingleRef.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false;
										if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
											var layout = MESBasic_container_container_containerSingleRef_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	MESBasic.container.container.containerSingleRef.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.container.container.containerSingleRef.query('query');
									    	}
											if(modelCode == 'MESBasic_1_container_Container'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												MESBasic.container.container.containerSingleRef.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
									    	} else {
									    		MESBasic.container.container.containerSingleRef.query('query');
									    	}
										}
									}
								}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_MESBasic_container_container_containerSingleRef_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_container_container_containerSingleRef_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
							    		var layout = MESBasic_container_container_containerSingleRef_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.container.container.containerSingleRef.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'MESBasic_1_container_Container'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false;
									if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
										var layout = MESBasic_container_container_containerSingleRef_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	MESBasic.container.container.containerSingleRef.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.container.container.containerSingleRef.query('query');
								    	}
										if(modelCode == 'MESBasic_1_container_Container'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
								    	} else {
								    		MESBasic.container.container.containerSingleRef.query('query');
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
	 * @method MESBasic.container.container.containerSingleRef.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.container.container.containerSingleRef.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method MESBasic.container.container.containerSingleRef.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	MESBasic.container.container.containerSingleRef.checkSelectedValid = function(type) {
		if(MESBasic.container.container.containerSingleRef.checkSelectedAny()){
			for(var i=0;i<datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows[i].valid === false){
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
	 * @method MESBasic.container.container.containerSingleRef.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.container.container.containerSingleRef.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.container.container.containerSingleRef.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.container.container.containerSingleRef.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_container_container_containerSingleRef_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method MESBasic.container.container.containerSingleRef.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.container.container.containerSingleRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.container.container.containerSingleRef.otherParams || {};
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
				<#assign editView = getViewByCode('MESBasic_1_container_newContainerEdit')>
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
												list_operate_container_containerSingleRef.${funcname};
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
			
			
			
					if(viewCode=='MESBasic_1_container_containerView'||!viewCode){
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
					list_operate_container_containerSingleRef.CUI('#'+formId).submit();
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
		if ( MESBasic.container.container.containerSingleRef.Dlg ) {
			MESBasic.container.container.containerSingleRef.Dlg._config.url = url;
			MESBasic.container.container.containerSingleRef.Dlg._config.formId = formId;
			MESBasic.container.container.containerSingleRef.Dlg.setTitle( title )
			MESBasic.container.container.containerSingleRef.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.container.container.containerSingleRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_container_containerSingleRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.container.container.containerSingleRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.container.container.containerSingleRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_container_container', element : $('#MESBasic_container_container_containerSingleRef_fileupload_button a:eq(1)')});
		}
		MESBasic.container.container.containerSingleRef.otherParams = {};
	};

	MESBasic.container.container.containerSingleRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.container.container.containerSingleRef.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.container.container.containerSingleRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.container.container.containerSingleRef.cancelSelectedNode == 'function') {
	   MESBasic.container.container.containerSingleRef.cancelSelectedNode();
	   MESBasic.container.container.containerSingleRef.node = null;
	  }
	  if(typeof MESBasic_container_container_containerSingleRef_cancelSelectedNode == 'function') {
	   MESBasic_container_container_containerSingleRef_cancelSelectedNode();
	   MESBasic.container.container.containerSingleRef.node = null;
	  }
	  MESBasic.container.container.containerSingleRef.query(type);
	 };
	
	
	
	MESBasic.container.container.containerSingleRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_container";
		openExportFrame(url);
	}
MESBasic.container.container.containerSingleRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.container.container.containerSingleRef.otherParams = {};
	MESBasic.container.container.containerSingleRef.otherParams.dialogType = dialogType;
	MESBasic.container.container.containerSingleRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.container.container.containerSingleRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.container.container.editCallBackInfo
 */
MESBasic.container.container.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_container_container_containerSingleRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_container_container_containerSingleRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
    		var layout = MESBasic_container_container_containerSingleRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.container.container.containerSingleRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_container_Container'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_container_container_containerSingleRef_queryWidget._sortKey && ec_MESBasic_container_container_containerSingleRef_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_container_container_containerSingleRef_getLayout == "function"){
			var layout = MESBasic_container_container_containerSingleRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.container.container.containerSingleRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.container.container.containerSingleRef.query('query');
	    	}
			if(modelCode == 'MESBasic_1_container_Container'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.container.container.containerSingleRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.container.container.containerSingleRef.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_container_containerSingleRef,js,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_container_containerSingleRef' idprefix='ec_MESBasic_container_container_containerSingleRef' queryUrl='/MESBasic/container/container/containerSingleRef-query.action' queryFunc="MESBasic.container.container.containerSingleRef.query" ns="MESBasic.container.container.containerSingleRef" />
<@exportexcel action="/MESBasic/container/container/containerSingleRef-query.action"   getRequireDataAction="/MESBasic/container/container/containerSingleRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_container_Container&&viewCode=MESBasic_1_container_containerSingleRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_container_containerSingleRef')}" prefix="ec_MESBasic_container_container_containerSingleRef_query" modelCode="MESBasic_1_container_Container"  importFlag="false" viewCode="MESBasic_1_container_containerSingleRef" />
