<!-- X6Basic_1.0/baseProduct/refer -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1371469252584')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_baseProduct_refer,head,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("X6Basic.baseProduct.productManage.refer");
</script>
<input type="hidden" name="X6Basic_baseProduct_productManage_refer_callBackFuncName" id="X6Basic_baseProduct_productManage_refer_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="X6Basic_baseProduct_productManage_referErrorbar" />
<@frameset id="ec_X6Basic_baseProduct_productManage_refer_container" border=0>
	<@frame id="ec_X6Basic_baseProduct_productManage_refer_container_main"  offsetH=4 region="center" class="center_in">
	<#include "refer-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_X6Basic_baseProduct_productManage_refer_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_X6Basic_baseProduct_productManage_refer_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_baseProduct_refer,html,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return X6Basic.baseProduct.productManage.refer.sendBackrefer(null,datatable_ec_X6Basic_baseProduct_productManage_refer_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_X6Basic_baseProduct_productManage_refer_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("X6Basic.baseProduct.productManage.refer.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method X6Basic.baseProduct.productManage.refer.query
	 */
	X6Basic.baseProduct.productManage.refer.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_X6Basic_baseProduct_productManage_refer_queryForm", X6Basic_baseProduct_productManage_referErrorbarWidget)) {
				return false;
		}
		var node = X6Basic.baseProduct.productManage.refer.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_X6Basic_baseProduct_productManage_refer_query._sortKey && datatable_ec_X6Basic_baseProduct_productManage_refer_query._sortMethod){
			CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm #dataTableSortColKey').val(datatable_ec_X6Basic_baseProduct_productManage_refer_query._sortKey);
			CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm #dataTableSortColName').val(datatable_ec_X6Basic_baseProduct_productManage_refer_query._sortColumnName);
			CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm #dataTableSortColOrder').val(datatable_ec_X6Basic_baseProduct_productManage_refer_query._sortMethod);
		}else{
			datatable_ec_X6Basic_baseProduct_productManage_refer_query._sortKey = '';
			CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm #dataTableSortColKey').val('');
			CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm #dataTableSortColName').val('');
			CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_X6Basic_baseProduct_productManage_refer_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "X6Basic.baseProduct.productManage.refer.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/X6Basic/baseProduct/productManage/refer-query.action";
		CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_baseProduct_productManage_refer_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="X6Basic_1.0_baseProduct_refer";
		condobj.modelAlias="productManage";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_X6Basic_baseProduct_productManage_refer_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_X6Basic_baseProduct_productManage_refer_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_X6Basic_baseProduct_productManage_refer_quickquery_info[fieldName].dbColumnType;
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
							if(ec_X6Basic_baseProduct_productManage_refer_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name="'+ec_X6Basic_baseProduct_productManage_refer_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_X6Basic_baseProduct_productManage_refer_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_X6Basic_baseProduct_productManage_refer_quickquery_info["MainTableName"];
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
						var layrec=ec_X6Basic_baseProduct_productManage_refer_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_X6Basic_baseProduct_productManage_refer_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_baseProduct_productManage_refer_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_baseProduct_refer';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_X6Basic_baseProduct_productManage_refer_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	X6Basic.baseProduct.productManage.refer._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.baseProduct.productManage.refer._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.baseProduct.productManage.refer._prefix += '.';
			}
			X6Basic.baseProduct.productManage.refer._prefix += arr[i];
		}
		X6Basic.baseProduct.productManage.refer._suffix = arr[arr.length -1];
		if(X6Basic.baseProduct.productManage.refer._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.baseProduct.productManage.refer._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.baseProduct.productManage.refer._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.baseProduct.productManage.refer.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.baseProduct.productManage.refer.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name="'+X6Basic.baseProduct.productManage.refer._prefix + '.' + X6Basic.baseProduct.productManage.refer._suffix +'"]').val(obj[0][X6Basic.baseProduct.productManage.refer._suffix]);
		CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name="'+X6Basic.baseProduct.productManage.refer._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name^="'+X6Basic.baseProduct.productManage.refer._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name="'+X6Basic.baseProduct.productManage.refer._prefix + '.' + X6Basic.baseProduct.productManage.refer._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_baseProduct_productManage_refer_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.baseProduct.productManage.refer._dialog) {
			X6Basic.baseProduct.productManage.refer._dialog.close();
		}
	};
	
	X6Basic.baseProduct.productManage.refer._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.baseProduct.productManage.refer.query_"+obj+")!='undefined'") ? eval('X6Basic.baseProduct.productManage.refer.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_baseProduct_productManage_refer_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return X6Basic.baseProduct.productManage.refer.sendBackrefer(null,datatable_ec_X6Basic_baseProduct_productManage_refer_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_X6Basic_baseProduct_productManage_refer_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return X6Basic.baseProduct.productManage.refer.sendBackrefer(null,datatable_ec_X6Basic_baseProduct_productManage_refer_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method X6Basic.baseProduct.productManage.refer.sendBackrefer
	 */
	X6Basic.baseProduct.productManage.refer.sendBackrefer = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_X6Basic_baseProduct_productManage_refer_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('X6Basic.productManage.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_baseProduct_productManage_refer_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#X6Basic_baseProduct_productManage_refer_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#X6Basic_baseProduct_productManage_refer_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#X6Basic_baseProduct_productManage_refer_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#X6Basic_baseProduct_productManage_refer_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#X6Basic_baseProduct_productManage_refer_callBackFuncName").val() + "(arrObj)");
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
			X6Basic_baseProduct_productManage_referErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			X6Basic_baseProduct_productManage_referErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
X6Basic_baseProduct_productManage_refer_refresh = function(node){
X6Basic.baseProduct.productManage.refer.node = node;
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
	X6Basic.baseProduct.productManage.refer.query("query");
}

X6Basic_baseProduct_productManage_refer_getList = function() {
	return "X6Basic.baseProduct.productManage.refer";
}
X6Basic.baseProduct.productManage.refer.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.X6Basic_baseProduct_productManage_referErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

X6Basic.baseProduct.productManage.refer.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
X6Basic.baseProduct.productManage.refer.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"X6Basic_baseProduct_productManage_refer_fileupload_button",
		handler:function(){
				list_operate_baseProduct_refer.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
X6Basic.baseProduct.productManage.refer.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseProduct_refer.X6Basic.baseProduct.productManage." + params.viewName + ".referenceCopy");
			funcName('productManage', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
X6Basic.baseProduct.productManage.refer.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseProduct_refer.X6Basic.baseProduct.productManage." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
X6Basic.baseProduct.productManage.refer.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseProduct_refer.X6Basic.baseProduct.productManage." + editViewName + ".printSetting");
			funcName();
		}
	}
}
			<#assign editView = getViewByCode('X6Basic_1.0_baseProduct_edit')>
			/**
			 * 列表新增
			 * @method X6Basic.baseProduct.productManage.refer.addrefer
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.baseProduct.productManage.refer.addrefer = function() {
				var buttonCode='X6Basic_1.0_baseProduct_refer_BUTTON_add';
					var treeParam = "";
					if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
						var layout = X6Basic_baseProduct_productManage_refer_getLayout();
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
							if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'.replace(/\./g, '\_')){
								treeParam = '&productManage.parentId=' + node.id;
							}else{
								var modelCodeValue= $('#'+modelCode).val();
								if(modelCodeValue==""){
								modelCodeValue=$('#'+modelCode).attr("bak_value")
								}
								treeParam = '&productManage.' + modelCodeValue + '.id=' + node.id;
							}
						}
					}
					<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
						var otherParams = {};
						<#if editView.hasAttachment?? && editView.hasAttachment == true>
						otherParams.operateRecordId = -1;
						otherParams.uploadBtn = X6Basic.baseProduct.productManage.refer.createUploadBtn(otherParams);
						</#if>
						<#if editView.isReference?? && editView.isReference == true>
						otherParams.referenceCopyBtn = X6Basic.baseProduct.productManage.refer.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
						</#if>			
						otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') +
						1)}<#else>OTHER</#if>';
						X6Basic.baseProduct.productManage.refer.otherParams = otherParams;

						var url='${editView.url}?entityCode=X6Basic_1.0_baseProduct' + "&${getPowerCode('${buttonPerfix!}refer_add_add_X6Basic_1.0_baseProduct_refer')}";
							<#if businessParam??>
					 			url += "&${businessParam}";	
					 		</#if>
				 		if(treeParam!=""){
				 			url += treeParam;
				 		}
				 			url +='&calltype=ref';
				 		url+='&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_baseProduct_refer';
						X6Basic.baseProduct.productManage.refer.showDialog(url,'X6Basic_baseProduct_productManage_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
					<#else>
						var url='${editView.url}?entityCode=X6Basic_1.0_baseProduct' + "&${getPowerCode('${buttonPerfix!}refer_add_add_X6Basic_1.0_baseProduct_refer')}";
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
			function openProductedit(){
var url = "/MESBasic/product/product/productEditnew.action??__pc__=VGVzdENQaWV8xLjAuMF9vcmRlck1hbmFnZXJfb3JkZXJfbGlzdF9zZWxmfA__&openType=page";
openFullScreen(url);};
			<#assign editView = getViewByCode('X6Basic_1.0_baseProduct_edit')>
			/**
			 * 列表编辑
			 * @method X6Basic.baseProduct.productManage.refer.modifyrefer
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.baseProduct.productManage.refer.modifyrefer = function() {
				var buttonCode='X6Basic_1.0_baseProduct_refer_BUTTON_modify';
				if(X6Basic.baseProduct.productManage.refer.checkSelectedAny()){
					if(X6Basic.baseProduct.productManage.refer.checkSelectedMore()) {
						var cid = ec_X6Basic_baseProduct_productManage_refer_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = X6Basic.baseProduct.productManage.refer.getOperateRecordId();
							otherParams.uploadBtn = X6Basic.baseProduct.productManage.refer.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = X6Basic.baseProduct.productManage.refer.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = X6Basic.baseProduct.productManage.refer.createPrintBtn('${editView.name}','${editView.url}?entityCode=X6Basic_1.0_baseProduct&id=' + X6Basic.baseProduct.productManage.refer.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}refer_modify_modify_X6Basic_1.0_baseProduct_refer')}");
							otherParams.printSettingBtn = X6Basic.baseProduct.productManage.refer.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							X6Basic.baseProduct.productManage.refer.otherParams = otherParams;

							X6Basic.baseProduct.productManage.refer.showDialog('${editView.url}?entityCode=X6Basic_1.0_baseProduct&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_baseProduct_refer'+'&id=' + X6Basic.baseProduct.productManage.refer.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}refer_modify_modify_X6Basic_1.0_baseProduct_refer')}",'X6Basic_baseProduct_productManage_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=X6Basic_1.0_baseProduct'+signatureStr+'&id=' + X6Basic.baseProduct.productManage.refer.getOperateRecordId() + "&${getPowerCode('${buttonPerfix!}refer_modify_modify_X6Basic_1.0_baseProduct_refer')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/*
			*删除回调
			*/
			delete_callback=function(params){
				var deleteUrl="/X6Basic/baseProduct/productManage/delete.action?ids=" + X6Basic.baseProduct.productManage.refer.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}refer_delete_del_X6Basic_1.0_baseProduct_refer')}";
				signatureDialog.close();
				CUI.post(deleteUrl,params,X6Basic.baseProduct.productManage.callBackInfo, "json");
			}
			 
			/**
			 * 列表删除
			 * @method X6Basic.baseProduct.productManage.refer.delrefer
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			X6Basic.baseProduct.productManage.refer.delrefer = function(param) {
				var buttonCode='X6Basic_1.0_baseProduct_refer_BUTTON_delete';
				if(X6Basic.baseProduct.productManage.refer.checkSelectedValid(1)){
					var message = '';
					for(var i=0 ; i<datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows.length ; i++){
                        var cid = datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows[i].cid;
                        if(cid!='${Session.company.id}'){
                            var index = datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows[i].rowHtmlObj.rowIndex+1;
                            message += "${getText('foundation.data.cross.company','" + index + "')}</br>";
                        }
				    }
				    if(message!=''){
					    workbenchErrorBarWidget.showMessage(message,'f');
						return;
					}
		  			CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','${getText("X6Basic.buttonPropertyshowName.radion1371469208520")}')}", function(){
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete');
				 	}else {
						CUI.post("/X6Basic/baseProduct/productManage/delete.action?ids=" + X6Basic.baseProduct.productManage.refer.getOperateRecordId('del')+"&${getPowerCode('${buttonPerfix!}refer_delete_del_X6Basic_1.0_baseProduct_refer')}", X6Basic.baseProduct.productManage.callBackInfo, "json");
					}
				});
				}
			};
			
	
	/**
	 * 保存完毕回调
	 * @method X6Basic.baseProduct.productManage.callBackInfo
	 */
	X6Basic.baseProduct.productManage.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
					var errorBarWidget = eval('X6Basic_baseProduct_productManage_referErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
				} else if(res.operateType == 'delete') {
					var errorBarWidget = eval('X6Basic_baseProduct_productManage_referErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
				}  else if(res.operateType == 'restore') {
					var errorBarWidget = eval('X6Basic_baseProduct_productManage_referErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
				} 
			setTimeout(function(){
				try{X6Basic.baseProduct.productManage.refer.Dlg.close();closeLoadPanel();}catch(e){}
								if(res.operateType == 'save') {
									var queryFunc = datatable_ec_X6Basic_baseProduct_productManage_refer_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_baseProduct_productManage_refer_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
								    		var layout = X6Basic_baseProduct_productManage_refer_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.baseProduct.productManage.refer.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.baseProduct.productManage.refer.node = null;
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false;
										if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
											var layout = X6Basic_baseProduct_productManage_refer_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.baseProduct.productManage.refer.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.baseProduct.productManage.refer.query('query');
									    	}
											if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.baseProduct.productManage.refer.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.baseProduct.productManage.refer.query('query');
									    	}
										}
									}
								}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_X6Basic_baseProduct_productManage_refer_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_baseProduct_productManage_refer_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
							    		var layout = X6Basic_baseProduct_productManage_refer_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	X6Basic.baseProduct.productManage.refer.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false;
									if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
										var layout = X6Basic_baseProduct_productManage_refer_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	X6Basic.baseProduct.productManage.refer.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
								    	} else {
								    		X6Basic.baseProduct.productManage.refer.query('query');
								    	}
										if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
								    	} else {
								    		X6Basic.baseProduct.productManage.refer.query('query');
								    	}
									}
								}
							}
								if(res.operateType == 'delete') {
									var queryFunc = datatable_ec_X6Basic_baseProduct_productManage_refer_query.get('queryFunc');
									var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_baseProduct_productManage_refer_queryWidget.dataTableId).val();
								    if(null != queryFunc && "undefined" != queryFunc){
								    	if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
								    		var layout = X6Basic_baseProduct_productManage_refer_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.baseProduct.productManage.refer.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
											if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
									    		var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.baseProduct.productManage.refer.node = null;
											}else{
												layout.refreshTree(-1);
											}
								    	}else{
								    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
									    	} else {
												eval(queryFunc);
									    	}
								    	}
									} else {
										var needSort = ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false;
										if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
											var layout = X6Basic_baseProduct_productManage_refer_getLayout();
											var node = layout.getNode();
											var modelCode = null;
											if(node!=null){
												modelCode = node.modelCode;
											}
									    	X6Basic.baseProduct.productManage.refer.node = node;	
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.baseProduct.productManage.refer.query('query');
									    	}
											if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
												var treeId = layout.refreshNodeId(node, res.operate);
												layout.refreshTree(treeId);
												X6Basic.baseProduct.productManage.refer.node = null;
											}
										}else{
											if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
									    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
									    	} else {
									    		X6Basic.baseProduct.productManage.refer.query('query');
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
	 * @method X6Basic.baseProduct.productManage.refer.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	X6Basic.baseProduct.productManage.refer.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method X6Basic.baseProduct.productManage.refer.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	X6Basic.baseProduct.productManage.refer.checkSelectedValid = function(type) {
		if(X6Basic.baseProduct.productManage.refer.checkSelectedAny()){
			for(var i=0;i<datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows[i].valid === false){
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
	 * @method X6Basic.baseProduct.productManage.refer.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.baseProduct.productManage.refer.checkSelectedAny = function() {
		if(datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method X6Basic.baseProduct.productManage.refer.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	X6Basic.baseProduct.productManage.refer.checkSelectedMore = function() {
		if(datatable_ec_X6Basic_baseProduct_productManage_refer_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method X6Basic.baseProduct.productManage.refer.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.baseProduct.productManage.refer.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = X6Basic.baseProduct.productManage.refer.otherParams || {};
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
				<#assign editView = getViewByCode('X6Basic_1.0_baseProduct_edit')>
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
												list_operate_baseProduct_refer.${funcname};
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
					list_operate_baseProduct_refer.CUI('#'+formId).submit();
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
		if ( X6Basic.baseProduct.productManage.refer.Dlg ) {
			X6Basic.baseProduct.productManage.refer.Dlg._config.url = url;
			X6Basic.baseProduct.productManage.refer.Dlg._config.formId = formId;
			X6Basic.baseProduct.productManage.refer.Dlg.setTitle( title )
			X6Basic.baseProduct.productManage.refer.Dlg.setButtonbar( buttons );
		}else{
			X6Basic.baseProduct.productManage.refer.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_baseProduct_refer',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		X6Basic.baseProduct.productManage.refer.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		X6Basic.baseProduct.productManage.refer.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_baseProduct_productManage', element : $('#X6Basic_baseProduct_productManage_refer_fileupload_button a:eq(1)')});
		}
		X6Basic.baseProduct.productManage.refer.otherParams = {};
	};

	X6Basic.baseProduct.productManage.refer.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof X6Basic.baseProduct.productManage.refer.beforeCommonQuery === 'function') {
	   		var ret = X6Basic.baseProduct.productManage.refer.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof X6Basic.baseProduct.productManage.refer.cancelSelectedNode == 'function') {
	   X6Basic.baseProduct.productManage.refer.cancelSelectedNode();
	   X6Basic.baseProduct.productManage.refer.node = null;
	  }
	  if(typeof X6Basic_baseProduct_productManage_refer_cancelSelectedNode == 'function') {
	   X6Basic_baseProduct_productManage_refer_cancelSelectedNode();
	   X6Basic.baseProduct.productManage.refer.node = null;
	  }
	  X6Basic.baseProduct.productManage.refer.query(type);
	 };
	
	
	
	X6Basic.baseProduct.productManage.refer.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=X6Basic_1.0_baseProduct";
		openExportFrame(url);
	}
X6Basic.baseProduct.productManage.refer.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	X6Basic.baseProduct.productManage.refer.otherParams = {};
	X6Basic.baseProduct.productManage.refer.otherParams.dialogType = dialogType;
	X6Basic.baseProduct.productManage.refer.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.baseProduct.productManage.refer.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method X6Basic.baseProduct.productManage.editCallBackInfo
 */
X6Basic.baseProduct.productManage.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_X6Basic_baseProduct_productManage_refer_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_X6Basic_baseProduct_productManage_refer_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
    		var layout = X6Basic_baseProduct_productManage_refer_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.baseProduct.productManage.refer.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortKey && ec_X6Basic_baseProduct_productManage_refer_queryWidget._sortMethod ? true : false;
		if(typeof X6Basic_baseProduct_productManage_refer_getLayout == "function"){
			var layout = X6Basic_baseProduct_productManage_refer_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	X6Basic.baseProduct.productManage.refer.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.baseProduct.productManage.refer.query('query');
	    	}
			if(modelCode == 'X6Basic_1.0_baseProduct_ProductManage'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		X6Basic.baseProduct.productManage.refer.query('query',_Current_PageNo,needSort);
	    	} else {
	    		X6Basic.baseProduct.productManage.refer.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_baseProduct_refer,js,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='X6Basic_1.0_baseProduct_refer' idprefix='ec_X6Basic_baseProduct_productManage_refer' queryUrl='/X6Basic/baseProduct/productManage/refer-query.action' queryFunc="X6Basic.baseProduct.productManage.refer.query" ns="X6Basic.baseProduct.productManage.refer" />
<@exportexcel action="/X6Basic/baseProduct/productManage/refer-query.action"   getRequireDataAction="/X6Basic/baseProduct/productManage/refer-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=X6Basic_1.0_baseProduct_ProductManage&&viewCode=X6Basic_1.0_baseProduct_refer" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('X6Basic_1.0_baseProduct_refer')}" prefix="ec_X6Basic_baseProduct_productManage_refer_query" modelCode="X6Basic_1.0_baseProduct_ProductManage"  importFlag="false" viewCode="X6Basic_1.0_baseProduct_refer" />
