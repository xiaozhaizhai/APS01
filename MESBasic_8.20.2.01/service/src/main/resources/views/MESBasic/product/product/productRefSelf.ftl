<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.radion1415773613713')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.product.product.productRefSelf");
</script>
<input type="hidden" name="MESBasic_product_product_productRefSelf_callBackFuncName" id="MESBasic_product_product_productRefSelf_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_product_product_productRefSelfErrorbar" />
<@frameset id="ec_MESBasic_product_product_productRefSelf_container" border=0>
	<@frame id="ec_MESBasic_product_product_productRefSelf_container_main"  offsetH=4 region="center" class="center_in">
	<#include "productRefSelf-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_MESBasic_product_product_productRefSelf_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_product_product_productRefSelf_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_productRefSelf,html,MESBasic_1_product_Product,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.product.product.productRefSelf.sendBackproductRefSelf(null,datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method MESBasic.product.product.productRefSelf.query
	 */
	MESBasic.product.product.productRefSelf.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_product_product_productRefSelf_queryForm")) {
				return false;
		}
		var node = MESBasic.product.product.productRefSelf.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/product/product/productRefSelf-query.action";
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_product_productRefSelf_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_product_product_productRefSelf_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
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
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
							}
						}
						var multable = CUI(this).attr('multable');
						if(multable && multable == "yes") {
							dataPost += "&" + fastCol + "=," + encodeURIComponent($.trim(fastColValue)) + ",";
						} else {
							dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
						}
					}
				}	
			}
		});
		var pageSize=CUI('input[name="ec_MESBasic_product_product_productRefSelf_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_product_product_productRefSelf_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_product_productRefSelf';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_product_product_productRefSelf_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.product.product.productRefSelf._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product.product.productRefSelf._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product.product.productRefSelf._prefix += '.';
			}
			MESBasic.product.product.productRefSelf._prefix += arr[i];
		}
		MESBasic.product.product.productRefSelf._suffix = arr[arr.length -1];
		if(MESBasic.product.product.productRefSelf._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product.product.productRefSelf._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product.product.productRefSelf._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product.product.productRefSelf.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.product.product.productRefSelf.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+MESBasic.product.product.productRefSelf._prefix + '.' + MESBasic.product.product.productRefSelf._suffix +'"]').val(obj[0][MESBasic.product.product.productRefSelf._suffix]);
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+MESBasic.product.product.productRefSelf._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name^="'+MESBasic.product.product.productRefSelf._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+MESBasic.product.product.productRefSelf._prefix + '.' + MESBasic.product.product.productRefSelf._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.product.product.productRefSelf._dialog) {
			MESBasic.product.product.productRefSelf._dialog.close();
		}
	};
	
	MESBasic.product.product.productRefSelf._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product.product.productRefSelf.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.productRefSelf.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.product.product.productRefSelf.sendBackproductRefSelf(null,datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.product.product.productRefSelf.sendBackproductRefSelf(null,datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.product.product.productRefSelf.sendBackproductRefSelf
	 */
	MESBasic.product.product.productRefSelf.sendBackproductRefSelf = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow();
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
			if(CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_product_product_productRefSelfErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_product_product_productRefSelfErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_product_product_productRefSelf_refresh = function(node){
	//var url = "/MESBasic/product/product/productRefSelf-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_product_product_productRefSelf_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_product_product_productRefSelf_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.product.product.productRefSelf.node = node;
	MESBasic.product.product.productRefSelf.query("query");
}

MESBasic_product_product_productRefSelf_getList = function() {
	return "MESBasic.product.product.productRefSelf";
}
MESBasic.product.product.productRefSelf.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.product.product.productRefSelf.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.product.product.productRefSelf.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = MESBasic.product.product.productRefSelf.otherParams || {};
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
				handler:function(){list_operate.CUI('#'+formId).submit();}
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
		if ( MESBasic.product.product.productRefSelf.Dlg ) {
			MESBasic.product.product.productRefSelf.Dlg._config.url = url;
			MESBasic.product.product.productRefSelf.Dlg._config.formId = formId;
			MESBasic.product.product.productRefSelf.Dlg.setTitle( title )
			MESBasic.product.product.productRefSelf.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.product.product.productRefSelf.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.product.product.productRefSelf.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.product.product.productRefSelf.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_product_product', element : $('#MESBasic_product_product_productRefSelf_fileupload_button a:eq(1)')});
		}
		MESBasic.product.product.productRefSelf.otherParams = {};
	};
	MESBasic.product.product.productRefSelf.commonQuery = function(type) {
	  if(typeof MESBasic.product.product.productRefSelf.cancelSelectedNode == 'function') {
	   MESBasic.product.product.productRefSelf.cancelSelectedNode();
	   MESBasic.product.product.productRefSelf.node = null;
	  }
	  if(typeof MESBasic_product_product_productRefSelf_cancelSelectedNode == 'function') {
	   MESBasic_product_product_productRefSelf_cancelSelectedNode();
	   MESBasic.product.product.productRefSelf.node = null;
	  }
	  MESBasic.product.product.productRefSelf.query(type);
	 };
	
	
	
	MESBasic.product.product.productRefSelf.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_product";
		openExportFrame(url);
	}
MESBasic.product.product.productRefSelf.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.product.product.productRefSelf.otherParams = {};
	MESBasic.product.product.productRefSelf.otherParams.dialogType = dialogType;
	MESBasic.product.product.productRefSelf.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product.product.productRefSelf.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_productRefSelf,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/product/product/productRefSelf-query.action"   getRequireDataAction="/MESBasic/product/product/productRefSelf-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_product_Product&&viewCode=MESBasic_1_product_productRefSelf" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_product_productRefSelf')}" prefix="ec_MESBasic_product_product_productRefSelf_query" modelCode="MESBasic_1_product_Product"  importFlag="false" viewCode="MESBasic_1_product_productRefSelf" />
