<!-- MESBasic_1/product/refProduct_sp -->
<script type="text/javascript">
	CUI.ns("MESBasic.product.product.refProduct_sp");
</script>
<input type="hidden" name="MESBasic_product_product_refProduct_sp_callBackFuncName" id="MESBasic_product_product_refProduct_sp_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_product_product_refProduct_spErrorbar" />
<#include "refProduct_sp-fastquery-datatable.ftl">
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_refProduct_sp,html,MESBasic_1_product_Product,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_MESBasic_product_product_refProduct_sp_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("MESBasic.product.product.refProduct_sp.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method MESBasic.product.product.refProduct_sp.query
	 */
	MESBasic.product.product.refProduct_sp.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_MESBasic_product_product_refProduct_sp_queryForm", MESBasic_product_product_refProduct_spErrorbarWidget)) {
				return false;
		}
		var node = MESBasic.product.product.refProduct_sp.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_MESBasic_product_product_refProduct_sp_query._sortKey && datatable_ec_MESBasic_product_product_refProduct_sp_query._sortMethod){
			CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_product_product_refProduct_sp_query._sortKey);
			CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_product_product_refProduct_sp_query._sortColumnName);
			CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_product_product_refProduct_sp_query._sortMethod);
		}else{
			datatable_ec_MESBasic_product_product_refProduct_sp_query._sortKey = '';
			CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_MESBasic_product_product_refProduct_sp_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "MESBasic.product.product.refProduct_sp.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/MESBasic/product/product/refProduct_sp-query.action";
		CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_product_refProduct_sp_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_product_refProduct_sp";
		condobj.modelAlias="product";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_product_product_refProduct_sp_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_product_product_refProduct_sp_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_product_product_refProduct_sp_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_product_product_refProduct_sp_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name="'+ec_MESBasic_product_product_refProduct_sp_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_product_product_refProduct_sp_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_product_product_refProduct_sp_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_product_product_refProduct_sp_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_product_product_refProduct_sp_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_product_product_refProduct_sp_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_product_refProduct_sp';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_product_product_refProduct_sp_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	MESBasic.product.product.refProduct_sp._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product.product.refProduct_sp._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product.product.refProduct_sp._prefix += '.';
			}
			MESBasic.product.product.refProduct_sp._prefix += arr[i];
		}
		MESBasic.product.product.refProduct_sp._suffix = arr[arr.length -1];
		if(MESBasic.product.product.refProduct_sp._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product.product.refProduct_sp._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product.product.refProduct_sp._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product.product.refProduct_sp.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.product.product.refProduct_sp.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name="'+MESBasic.product.product.refProduct_sp._prefix + '.' + MESBasic.product.product.refProduct_sp._suffix +'"]').val(obj[0][MESBasic.product.product.refProduct_sp._suffix]);
		CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name="'+MESBasic.product.product.refProduct_sp._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name^="'+MESBasic.product.product.refProduct_sp._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name="'+MESBasic.product.product.refProduct_sp._prefix + '.' + MESBasic.product.product.refProduct_sp._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_product_refProduct_sp_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.product.product.refProduct_sp._dialog) {
			MESBasic.product.product.refProduct_sp._dialog.close();
		}
	};
	
	MESBasic.product.product.refProduct_sp._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product.product.refProduct_sp.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.refProduct_sp.query_'+obj+'()') : null;
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
		if(datatable_ec_MESBasic_product_product_refProduct_sp_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.product.product.refProduct_sp.sendBackrefProduct_sp(null,datatable_ec_MESBasic_product_product_refProduct_sp_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_product_product_refProduct_sp_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.product.product.refProduct_sp.sendBackrefProduct_sp(null,datatable_ec_MESBasic_product_product_refProduct_sp_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.product.product.refProduct_sp.sendBackrefProduct_sp
	 */
	MESBasic.product.product.refProduct_sp.sendBackrefProduct_sp = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_product_product_refProduct_sp_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.product.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_product_product_refProduct_sp_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_product_product_refProduct_sp_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_product_product_refProduct_sp_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_product_product_refProduct_sp_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_product_product_refProduct_sp_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_product_product_refProduct_sp_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_product_product_refProduct_spErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_product_product_refProduct_spErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
MESBasic_product_product_refProduct_sp_refresh = function(node){
MESBasic.product.product.refProduct_sp.node = node;
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
	MESBasic.product.product.refProduct_sp.query("query");
}

MESBasic_product_product_refProduct_sp_getList = function() {
	return "MESBasic.product.product.refProduct_sp";
}
MESBasic.product.product.refProduct_sp.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_product_product_refProduct_spErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.product.product.refProduct_sp.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.product.product.refProduct_sp.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_product_product_refProduct_sp_fileupload_button",
		handler:function(){
				list_operate_product_refProduct_sp.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.product.product.refProduct_sp.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_product_refProduct_sp.MESBasic.product.product." + params.viewName + ".referenceCopy");
			funcName('product', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.product.product.refProduct_sp.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_product_refProduct_sp.MESBasic.product.product." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.product.product.refProduct_sp.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_product_refProduct_sp.MESBasic.product.product." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.product.product.refProduct_sp.dbClickViewrefProduct_sp =  function(event, oRow) {
		var viewUrl = '/MESBasic/product/product/productViewnew.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_product&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.product.product.refProduct_sp.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.product.product.refProduct_sp.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.product.product.refProduct_sp.otherParams || {};
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
			
			
			
					if(viewCode=='MESBasic_1_product_productViewnew'||!viewCode){
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
					list_operate_product_refProduct_sp.CUI('#'+formId).submit();
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
		if ( MESBasic.product.product.refProduct_sp.Dlg ) {
			MESBasic.product.product.refProduct_sp.Dlg._config.url = url;
			MESBasic.product.product.refProduct_sp.Dlg._config.formId = formId;
			MESBasic.product.product.refProduct_sp.Dlg.setTitle( title )
			MESBasic.product.product.refProduct_sp.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.product.product.refProduct_sp.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_product_refProduct_sp',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.product.product.refProduct_sp.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.product.product.refProduct_sp.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_product_product', element : $('#MESBasic_product_product_refProduct_sp_fileupload_button a:eq(1)')});
		}
		MESBasic.product.product.refProduct_sp.otherParams = {};
	};

	MESBasic.product.product.refProduct_sp.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.product.product.refProduct_sp.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.product.product.refProduct_sp.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.product.product.refProduct_sp.cancelSelectedNode == 'function') {
	   MESBasic.product.product.refProduct_sp.cancelSelectedNode();
	   MESBasic.product.product.refProduct_sp.node = null;
	  }
	  if(typeof MESBasic_product_product_refProduct_sp_cancelSelectedNode == 'function') {
	   MESBasic_product_product_refProduct_sp_cancelSelectedNode();
	   MESBasic.product.product.refProduct_sp.node = null;
	  }
	  MESBasic.product.product.refProduct_sp.query(type);
	 };
	
	
	
	MESBasic.product.product.refProduct_sp.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_product";
		openExportFrame(url);
	}
MESBasic.product.product.refProduct_sp.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.product.product.refProduct_sp.otherParams = {};
	MESBasic.product.product.refProduct_sp.otherParams.dialogType = dialogType;
	MESBasic.product.product.refProduct_sp.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product.product.refProduct_sp.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.product.product.editCallBackInfo
 */
MESBasic.product.product.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_product_product_refProduct_sp_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_product_product_refProduct_sp_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_product_product_refProduct_sp_getLayout == "function"){
    		var layout = MESBasic_product_product_refProduct_sp_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.product.product.refProduct_sp.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_refProduct_sp_queryWidget._sortKey && ec_MESBasic_product_product_refProduct_sp_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_product_Product'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_product_product_refProduct_sp_queryWidget._sortKey && ec_MESBasic_product_product_refProduct_sp_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_product_product_refProduct_sp_queryWidget._sortKey && ec_MESBasic_product_product_refProduct_sp_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_product_product_refProduct_sp_getLayout == "function"){
			var layout = MESBasic_product_product_refProduct_sp_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.product.product.refProduct_sp.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.product.product.refProduct_sp.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.product.product.refProduct_sp.query('query');
	    	}
			if(modelCode == 'MESBasic_1_product_Product'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.product.product.refProduct_sp.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.product.product.refProduct_sp.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_refProduct_sp,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_product_refProduct_sp' idprefix='ec_MESBasic_product_product_refProduct_sp' queryUrl='/MESBasic/product/product/refProduct_sp-query.action' queryFunc="MESBasic.product.product.refProduct_sp.query" ns="MESBasic.product.product.refProduct_sp" />
<@exportexcel action="/MESBasic/product/product/refProduct_sp-query.action"   getRequireDataAction="/MESBasic/product/product/refProduct_sp-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_product_Product&&viewCode=MESBasic_1_product_refProduct_sp" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_product_refProduct_sp')}" prefix="ec_MESBasic_product_product_refProduct_sp_query" modelCode="MESBasic_1_product_Product"  importFlag="false" viewCode="MESBasic_1_product_refProduct_sp" />
