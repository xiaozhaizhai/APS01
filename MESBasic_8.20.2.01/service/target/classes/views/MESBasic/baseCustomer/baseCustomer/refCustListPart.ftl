<!-- MESBasic_1/baseCustomer/refCustListPart -->
<script type="text/javascript">
	CUI.ns("MESBasic.baseCustomer.baseCustomer.refCustListPart");
</script>
<input type="hidden" name="MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName" id="MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_baseCustomer_baseCustomer_refCustListPartErrorbar" />
<#include "refCustListPart-fastquery-datatable.ftl">
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_baseCustomer_refCustListPart,html,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method MESBasic.baseCustomer.baseCustomer.refCustListPart.query
	 */
	MESBasic.baseCustomer.baseCustomer.refCustListPart.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm", MESBasic_baseCustomer_baseCustomer_refCustListPartErrorbarWidget)) {
				return false;
		}
		var node = MESBasic.baseCustomer.baseCustomer.refCustListPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query._sortKey && datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query._sortMethod){
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query._sortKey);
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query._sortColumnName);
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query._sortMethod);
		}else{
			datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query._sortKey = '';
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "MESBasic.baseCustomer.baseCustomer.refCustListPart.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/MESBasic/baseCustomer/baseCustomer/refCustListPart-query.action";
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_baseCustomer_refCustListPart";
		condobj.modelAlias="baseCustomer";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_baseCustomer_baseCustomer_refCustListPart_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_baseCustomer_refCustListPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	MESBasic.baseCustomer.baseCustomer.refCustListPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix += '.';
			}
			MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix += arr[i];
		}
		MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix = arr[arr.length -1];
		if(MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.baseCustomer.baseCustomer.refCustListPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.baseCustomer.baseCustomer.refCustListPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.baseCustomer.baseCustomer.refCustListPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '.' + MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix +'"]').val(obj[0][MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix]);
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name^="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '.' + MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.baseCustomer.baseCustomer.refCustListPart._dialog) {
			MESBasic.baseCustomer.baseCustomer.refCustListPart._dialog.close();
		}
	};
	
	MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseCustomer.baseCustomer.refCustListPart.query_"+obj+")!='undefined'") ? eval('MESBasic.baseCustomer.baseCustomer.refCustListPart.query_'+obj+'()') : null;
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
		if(datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.baseCustomer.baseCustomer.refCustListPart.sendBackrefCustListPart(null,datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.baseCustomer.baseCustomer.refCustListPart.sendBackrefCustListPart(null,datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.baseCustomer.baseCustomer.refCustListPart.sendBackrefCustListPart
	 */
	MESBasic.baseCustomer.baseCustomer.refCustListPart.sendBackrefCustListPart = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.baseCustomer.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_baseCustomer_baseCustomer_refCustListPartErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_baseCustomer_baseCustomer_refCustListPartErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
MESBasic_baseCustomer_baseCustomer_refCustListPart_refresh = function(node){
MESBasic.baseCustomer.baseCustomer.refCustListPart.node = node;
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
	MESBasic.baseCustomer.baseCustomer.refCustListPart.query("query");
}

MESBasic_baseCustomer_baseCustomer_refCustListPart_getList = function() {
	return "MESBasic.baseCustomer.baseCustomer.refCustListPart";
}
MESBasic.baseCustomer.baseCustomer.refCustListPart.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_baseCustomer_baseCustomer_refCustListPartErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.baseCustomer.baseCustomer.refCustListPart.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.refCustListPart.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_baseCustomer_baseCustomer_refCustListPart_fileupload_button",
		handler:function(){
				list_operate_baseCustomer_refCustListPart.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.refCustListPart.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseCustomer_refCustListPart.MESBasic.baseCustomer.baseCustomer." + params.viewName + ".referenceCopy");
			funcName('baseCustomer', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.refCustListPart.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseCustomer_refCustListPart.MESBasic.baseCustomer.baseCustomer." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.baseCustomer.baseCustomer.refCustListPart.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseCustomer_refCustListPart.MESBasic.baseCustomer.baseCustomer." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.baseCustomer.baseCustomer.refCustListPart.dbClickViewrefCustListPart =  function(event, oRow) {
		var viewUrl = '/MESBasic/baseCustomer/baseCustomer/viewCustomer.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_baseCustomer&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.baseCustomer.baseCustomer.refCustListPart.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.baseCustomer.baseCustomer.refCustListPart.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams || {};
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
			
			
			
					if(viewCode=='MESBasic_1_baseCustomer_viewCustomer'||!viewCode){
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
					list_operate_baseCustomer_refCustListPart.CUI('#'+formId).submit();
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
		if ( MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg ) {
			MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg._config.url = url;
			MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg._config.formId = formId;
			MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg.setTitle( title )
			MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_baseCustomer_refCustListPart',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.baseCustomer.baseCustomer.refCustListPart.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_baseCustomer_baseCustomer', element : $('#MESBasic_baseCustomer_baseCustomer_refCustListPart_fileupload_button a:eq(1)')});
		}
		MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams = {};
	};

	MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.baseCustomer.baseCustomer.refCustListPart.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.baseCustomer.baseCustomer.refCustListPart.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.baseCustomer.baseCustomer.refCustListPart.cancelSelectedNode == 'function') {
	   MESBasic.baseCustomer.baseCustomer.refCustListPart.cancelSelectedNode();
	   MESBasic.baseCustomer.baseCustomer.refCustListPart.node = null;
	  }
	  if(typeof MESBasic_baseCustomer_baseCustomer_refCustListPart_cancelSelectedNode == 'function') {
	   MESBasic_baseCustomer_baseCustomer_refCustListPart_cancelSelectedNode();
	   MESBasic.baseCustomer.baseCustomer.refCustListPart.node = null;
	  }
	  MESBasic.baseCustomer.baseCustomer.refCustListPart.query(type);
	 };
	
	
	
	MESBasic.baseCustomer.baseCustomer.refCustListPart.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_baseCustomer";
		openExportFrame(url);
	}
MESBasic.baseCustomer.baseCustomer.refCustListPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams = {};
	MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams.dialogType = dialogType;
	MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.baseCustomer.baseCustomer.refCustListPart.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.baseCustomer.baseCustomer.editCallBackInfo
 */
MESBasic.baseCustomer.baseCustomer.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_baseCustomer_baseCustomer_refCustListPart_getLayout == "function"){
    		var layout = MESBasic_baseCustomer_baseCustomer_refCustListPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.baseCustomer.baseCustomer.refCustListPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryWidget._sortKey && ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_baseCustomer_baseCustomer_refCustListPart_getLayout == "function"){
			var layout = MESBasic_baseCustomer_baseCustomer_refCustListPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.baseCustomer.baseCustomer.refCustListPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseCustomer.baseCustomer.refCustListPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseCustomer.baseCustomer.refCustListPart.query('query');
	    	}
			if(modelCode == 'MESBasic_1_baseCustomer_BaseCustomer'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.baseCustomer.baseCustomer.refCustListPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.baseCustomer.baseCustomer.refCustListPart.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_baseCustomer_refCustListPart,js,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_baseCustomer_refCustListPart' idprefix='ec_MESBasic_baseCustomer_baseCustomer_refCustListPart' queryUrl='/MESBasic/baseCustomer/baseCustomer/refCustListPart-query.action' queryFunc="MESBasic.baseCustomer.baseCustomer.refCustListPart.query" ns="MESBasic.baseCustomer.baseCustomer.refCustListPart" />
<@exportexcel action="/MESBasic/baseCustomer/baseCustomer/refCustListPart-query.action"   getRequireDataAction="/MESBasic/baseCustomer/baseCustomer/refCustListPart-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_baseCustomer_BaseCustomer&&viewCode=MESBasic_1_baseCustomer_refCustListPart" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_baseCustomer_refCustListPart')}" prefix="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query" modelCode="MESBasic_1_baseCustomer_BaseCustomer"  importFlag="false" viewCode="MESBasic_1_baseCustomer_refCustListPart" />
