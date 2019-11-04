<!-- MESBasic_1/factoryModel/factoryProdRefPart -->
<script type="text/javascript">
	CUI.ns("MESBasic.factoryModel.objProduct.factoryProdRefPart");
</script>
<input type="hidden" name="MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName" id="MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_factoryModel_objProduct_factoryProdRefPartErrorbar" />
<#include "factoryProdRefPart-fastquery-datatable.ftl">
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryModel_factoryProdRefPart,html,MESBasic_1_factoryModel_ObjProduct,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method MESBasic.factoryModel.objProduct.factoryProdRefPart.query
	 */
	MESBasic.factoryModel.objProduct.factoryProdRefPart.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm", MESBasic_factoryModel_objProduct_factoryProdRefPartErrorbarWidget)) {
				return false;
		}
		var node = MESBasic.factoryModel.objProduct.factoryProdRefPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query._sortKey && datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query._sortMethod){
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query._sortKey);
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query._sortColumnName);
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query._sortMethod);
		}else{
			datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query._sortKey = '';
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "MESBasic.factoryModel.objProduct.factoryProdRefPart.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action";
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_factoryModel_factoryProdRefPart";
		condobj.modelAlias="objProduct";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_factoryModel_objProduct_factoryProdRefPart_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_factoryModel_factoryProdRefPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	MESBasic.factoryModel.objProduct.factoryProdRefPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix += '.';
			}
			MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix += arr[i];
		}
		MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix = arr[arr.length -1];
		if(MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.factoryModel.objProduct.factoryProdRefPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.factoryModel.objProduct.factoryProdRefPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.factoryModel.objProduct.factoryProdRefPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '.' + MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix +'"]').val(obj[0][MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix]);
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name^="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '.' + MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.factoryModel.objProduct.factoryProdRefPart._dialog) {
			MESBasic.factoryModel.objProduct.factoryProdRefPart._dialog.close();
		}
	};
	
	MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryModel.objProduct.factoryProdRefPart.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryModel.objProduct.factoryProdRefPart.query_'+obj+'()') : null;
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
		if(datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.factoryModel.objProduct.factoryProdRefPart.sendBackfactoryProdRefPart(null,datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.factoryModel.objProduct.factoryProdRefPart.sendBackfactoryProdRefPart(null,datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.factoryModel.objProduct.factoryProdRefPart.sendBackfactoryProdRefPart
	 */
	MESBasic.factoryModel.objProduct.factoryProdRefPart.sendBackfactoryProdRefPart = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.objProduct.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_factoryModel_objProduct_factoryProdRefPartErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_factoryModel_objProduct_factoryProdRefPartErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
MESBasic_factoryModel_objProduct_factoryProdRefPart_refresh = function(node){
MESBasic.factoryModel.objProduct.factoryProdRefPart.node = node;
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
	MESBasic.factoryModel.objProduct.factoryProdRefPart.query("query");
}

MESBasic_factoryModel_objProduct_factoryProdRefPart_getList = function() {
	return "MESBasic.factoryModel.objProduct.factoryProdRefPart";
}
MESBasic.factoryModel.objProduct.factoryProdRefPart.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_factoryModel_objProduct_factoryProdRefPartErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.factoryModel.objProduct.factoryProdRefPart.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.factoryModel.objProduct.factoryProdRefPart.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_factoryModel_objProduct_factoryProdRefPart_fileupload_button",
		handler:function(){
				list_operate_factoryModel_factoryProdRefPart.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.factoryModel.objProduct.factoryProdRefPart.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryModel_factoryProdRefPart.MESBasic.factoryModel.objProduct." + params.viewName + ".referenceCopy");
			funcName('objProduct', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.factoryModel.objProduct.factoryProdRefPart.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryModel_factoryProdRefPart.MESBasic.factoryModel.objProduct." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.factoryModel.objProduct.factoryProdRefPart.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryModel_factoryProdRefPart.MESBasic.factoryModel.objProduct." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.factoryModel.objProduct.factoryProdRefPart.dbClickViewfactoryProdRefPart =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_factoryModel&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.factoryModel.objProduct.factoryProdRefPart.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.factoryModel.objProduct.factoryProdRefPart.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams || {};
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
			
			
			
					if(viewCode=='MESBasic_1_factoryModel_factoryView'||!viewCode){
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
					list_operate_factoryModel_factoryProdRefPart.CUI('#'+formId).submit();
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
		if ( MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg ) {
			MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg._config.url = url;
			MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg._config.formId = formId;
			MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg.setTitle( title )
			MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_factoryModel_factoryProdRefPart',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.factoryModel.objProduct.factoryProdRefPart.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_factoryModel_objProduct', element : $('#MESBasic_factoryModel_objProduct_factoryProdRefPart_fileupload_button a:eq(1)')});
		}
		MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams = {};
	};

	MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.factoryModel.objProduct.factoryProdRefPart.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.factoryModel.objProduct.factoryProdRefPart.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.factoryModel.objProduct.factoryProdRefPart.cancelSelectedNode == 'function') {
	   MESBasic.factoryModel.objProduct.factoryProdRefPart.cancelSelectedNode();
	   MESBasic.factoryModel.objProduct.factoryProdRefPart.node = null;
	  }
	  if(typeof MESBasic_factoryModel_objProduct_factoryProdRefPart_cancelSelectedNode == 'function') {
	   MESBasic_factoryModel_objProduct_factoryProdRefPart_cancelSelectedNode();
	   MESBasic.factoryModel.objProduct.factoryProdRefPart.node = null;
	  }
	  MESBasic.factoryModel.objProduct.factoryProdRefPart.query(type);
	 };
	
	
	
	MESBasic.factoryModel.objProduct.factoryProdRefPart.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_factoryModel";
		openExportFrame(url);
	}
MESBasic.factoryModel.objProduct.factoryProdRefPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams = {};
	MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams.dialogType = dialogType;
	MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.factoryModel.objProduct.factoryProdRefPart.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.factoryModel.objProduct.editCallBackInfo
 */
MESBasic.factoryModel.objProduct.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_factoryModel_objProduct_factoryProdRefPart_getLayout == "function"){
    		var layout = MESBasic_factoryModel_objProduct_factoryProdRefPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.factoryModel.objProduct.factoryProdRefPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryWidget._sortKey && ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_factoryModel_ObjProduct'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryWidget._sortKey && ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryWidget._sortKey && ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_factoryModel_objProduct_factoryProdRefPart_getLayout == "function"){
			var layout = MESBasic_factoryModel_objProduct_factoryProdRefPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.factoryModel.objProduct.factoryProdRefPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.factoryModel.objProduct.factoryProdRefPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.factoryModel.objProduct.factoryProdRefPart.query('query');
	    	}
			if(modelCode == 'MESBasic_1_factoryModel_ObjProduct'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.factoryModel.objProduct.factoryProdRefPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.factoryModel.objProduct.factoryProdRefPart.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryModel_factoryProdRefPart,js,MESBasic_1_factoryModel_ObjProduct,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_factoryModel_factoryProdRefPart' idprefix='ec_MESBasic_factoryModel_objProduct_factoryProdRefPart' queryUrl='/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action' queryFunc="MESBasic.factoryModel.objProduct.factoryProdRefPart.query" ns="MESBasic.factoryModel.objProduct.factoryProdRefPart" />
<@exportexcel action="/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action"   getRequireDataAction="/MESBasic/factoryModel/objProduct/factoryProdRefPart-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_factoryModel_ObjProduct&&viewCode=MESBasic_1_factoryModel_factoryProdRefPart" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_factoryModel_factoryProdRefPart')}" prefix="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query" modelCode="MESBasic_1_factoryModel_ObjProduct"  importFlag="false" viewCode="MESBasic_1_factoryModel_factoryProdRefPart" />
