<script type="text/javascript">
	CUI.ns("MESBasic.factoryWare.factoryWare.factoryWarePart");
</script>
<input type="hidden" name="MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName" id="MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_factoryWare_factoryWare_factoryWarePartErrorbar" />
<#include "factoryWarePart-fastquery-datatable.ftl">
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryWare_factoryWarePart,html,MESBasic_1_factoryWare_FactoryWare,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">


	/**
	 * 查询
	 * @method MESBasic.factoryWare.factoryWare.factoryWarePart.query
	 */
	MESBasic.factoryWare.factoryWare.factoryWarePart.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm")) {
				return false;
		}
		var node = MESBasic.factoryWare.factoryWare.factoryWarePart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action";
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_factoryWare_factoryWarePart";
		condobj.modelAlias="factoryWare";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].dbColumnType;
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
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].layRec;
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
		}
		var pageSize=CUI('input[name="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_factoryWare_factoryWare_factoryWarePart_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_factoryWare_factoryWarePart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.factoryWare.factoryWare.factoryWarePart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.factoryWare.factoryWare.factoryWarePart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.factoryWare.factoryWare.factoryWarePart._prefix += '.';
			}
			MESBasic.factoryWare.factoryWare.factoryWarePart._prefix += arr[i];
		}
		MESBasic.factoryWare.factoryWare.factoryWarePart._suffix = arr[arr.length -1];
		if(MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.factoryWare.factoryWare.factoryWarePart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.factoryWare.factoryWare.factoryWarePart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.factoryWare.factoryWare.factoryWarePart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '.' + MESBasic.factoryWare.factoryWare.factoryWarePart._suffix +'"]').val(obj[0][MESBasic.factoryWare.factoryWare.factoryWarePart._suffix]);
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name^="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '.' + MESBasic.factoryWare.factoryWare.factoryWarePart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.factoryWare.factoryWare.factoryWarePart._dialog) {
			MESBasic.factoryWare.factoryWare.factoryWarePart._dialog.close();
		}
	};
	
	MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryWare.factoryWare.factoryWarePart.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryWare.factoryWare.factoryWarePart.query_'+obj+'()') : null;
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
		if(datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.factoryWare.factoryWare.factoryWarePart.sendBackfactoryWarePart(null,datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.factoryWare.factoryWare.factoryWarePart.sendBackfactoryWarePart(null,datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.factoryWare.factoryWare.factoryWarePart.sendBackfactoryWarePart
	 */
	MESBasic.factoryWare.factoryWare.factoryWarePart.sendBackfactoryWarePart = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.factoryWare.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_factoryWare_factoryWare_factoryWarePartErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_factoryWare_factoryWare_factoryWarePartErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_factoryWare_factoryWare_factoryWarePart_refresh = function(node){
	//var url = "/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.factoryWare.factoryWare.factoryWarePart.node = node;
	MESBasic.factoryWare.factoryWare.factoryWarePart.query("query");
}

MESBasic_factoryWare_factoryWare_factoryWarePart_getList = function() {
	return "MESBasic.factoryWare.factoryWare.factoryWarePart";
}
MESBasic.factoryWare.factoryWare.factoryWarePart.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.factoryWare.factoryWare.factoryWarePart.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.factoryWare.factoryWare.factoryWarePart.showDialog = function(url,formId,title,width,height,viewCode) {
		var buttons = [];
		var otherParams = MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams || {};
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
				handler:function(){list_operate_factoryWare_factoryWarePart.CUI('#'+formId).submit();}
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
		if ( MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg ) {
			MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg._config.url = url;
			MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg._config.formId = formId;
			MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg.setTitle( title )
			MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_factoryWare_factoryWarePart',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.factoryWare.factoryWare.factoryWarePart.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_factoryWare_factoryWare', element : $('#MESBasic_factoryWare_factoryWare_factoryWarePart_fileupload_button a:eq(1)')});
		}
		MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams = {};
	};
	MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery = function(type) {
	  if(typeof MESBasic.factoryWare.factoryWare.factoryWarePart.cancelSelectedNode == 'function') {
	   MESBasic.factoryWare.factoryWare.factoryWarePart.cancelSelectedNode();
	   MESBasic.factoryWare.factoryWare.factoryWarePart.node = null;
	  }
	  if(typeof MESBasic_factoryWare_factoryWare_factoryWarePart_cancelSelectedNode == 'function') {
	   MESBasic_factoryWare_factoryWare_factoryWarePart_cancelSelectedNode();
	   MESBasic.factoryWare.factoryWare.factoryWarePart.node = null;
	  }
	  MESBasic.factoryWare.factoryWare.factoryWarePart.query(type);
	 };
	
	
	
	MESBasic.factoryWare.factoryWare.factoryWarePart.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_factoryWare";
		openExportFrame(url);
	}
MESBasic.factoryWare.factoryWare.factoryWarePart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams = {};
	MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams.dialogType = dialogType;
	MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.factoryWare.factoryWare.factoryWarePart.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryWare_factoryWarePart,js,MESBasic_1_factoryWare_FactoryWare,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action"   getRequireDataAction="/MESBasic/factoryWare/factoryWare/factoryWarePart-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_factoryWare_FactoryWare&&viewCode=MESBasic_1_factoryWare_factoryWarePart" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_factoryWare_factoryWarePart')}" prefix="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query" modelCode="MESBasic_1_factoryWare_FactoryWare"  importFlag="false" viewCode="MESBasic_1_factoryWare_factoryWarePart" />
