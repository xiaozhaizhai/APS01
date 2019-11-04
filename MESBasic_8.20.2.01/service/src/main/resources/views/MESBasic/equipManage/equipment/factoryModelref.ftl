<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1490254527099')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.equipManage.equipment.factoryModelref");
</script>
<input type="hidden" name="MESBasic_equipManage_equipment_factoryModelref_callBackFuncName" id="MESBasic_equipManage_equipment_factoryModelref_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_equipManage_equipment_factoryModelrefErrorbar" />
<@frameset id="ec_MESBasic_equipManage_equipment_factoryModelref_container" border=0>
	<@frame id="ec_MESBasic_equipManage_equipment_factoryModelref_container_main"  offsetH=4 region="center" class="center_in">
	<#include "factoryModelref-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_MESBasic_equipManage_equipment_factoryModelref_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_equipManage_equipment_factoryModelref_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_equipManage_factoryModelref,html,MESBasic_1_equipManage_Equipment,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.equipManage.equipment.factoryModelref.sendBackfactoryModelref(null,datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
	});
	</#if>

	/**
	 * 查询
	 * @method MESBasic.equipManage.equipment.factoryModelref.query
	 */
	MESBasic.equipManage.equipment.factoryModelref.query = function(type,pageNo){
		if(!checkListValid("ec_MESBasic_equipManage_equipment_factoryModelref_queryForm")) {
				return false;
		}
		var node = MESBasic.equipManage.equipment.factoryModelref.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/MESBasic/equipManage/equipment/factoryModelref-query.action";
		CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_equipManage_factoryModelref";
		condobj.modelAlias="equipment";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name="'+ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_equipManage_equipment_factoryModelref_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_equipManage_equipment_factoryModelref_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_equipManage_factoryModelref';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	MESBasic.equipManage.equipment.factoryModelref._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.equipManage.equipment.factoryModelref._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.equipManage.equipment.factoryModelref._prefix += '.';
			}
			MESBasic.equipManage.equipment.factoryModelref._prefix += arr[i];
		}
		MESBasic.equipManage.equipment.factoryModelref._suffix = arr[arr.length -1];
		if(MESBasic.equipManage.equipment.factoryModelref._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.equipManage.equipment.factoryModelref._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.equipManage.equipment.factoryModelref._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.equipManage.equipment.factoryModelref.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.equipManage.equipment.factoryModelref.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name="'+MESBasic.equipManage.equipment.factoryModelref._prefix + '.' + MESBasic.equipManage.equipment.factoryModelref._suffix +'"]').val(obj[0][MESBasic.equipManage.equipment.factoryModelref._suffix]);
		CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name="'+MESBasic.equipManage.equipment.factoryModelref._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name^="'+MESBasic.equipManage.equipment.factoryModelref._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name="'+MESBasic.equipManage.equipment.factoryModelref._prefix + '.' + MESBasic.equipManage.equipment.factoryModelref._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_equipManage_equipment_factoryModelref_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.equipManage.equipment.factoryModelref._dialog) {
			MESBasic.equipManage.equipment.factoryModelref._dialog.close();
		}
	};
	
	MESBasic.equipManage.equipment.factoryModelref._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.equipManage.equipment.factoryModelref.query_"+obj+")!='undefined'") ? eval('MESBasic.equipManage.equipment.factoryModelref.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.equipManage.equipment.factoryModelref.sendBackfactoryModelref(null,datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.equipManage.equipment.factoryModelref.sendBackfactoryModelref(null,datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.equipManage.equipment.factoryModelref.sendBackfactoryModelref
	 */
	MESBasic.equipManage.equipment.factoryModelref.sendBackfactoryModelref = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.equipment.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_equipManage_equipment_factoryModelref_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_equipManage_equipment_factoryModelref_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_equipManage_equipment_factoryModelref_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_equipManage_equipment_factoryModelref_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_equipManage_equipment_factoryModelref_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_equipManage_equipment_factoryModelref_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_equipManage_equipment_factoryModelrefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_equipManage_equipment_factoryModelrefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
MESBasic_equipManage_equipment_factoryModelref_refresh = function(node){
	//var url = "/MESBasic/equipManage/equipment/factoryModelref-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_equipManage_equipment_factoryModelref_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.equipManage.equipment.factoryModelref.node = node;
	MESBasic.equipManage.equipment.factoryModelref.query("query");
}

MESBasic_equipManage_equipment_factoryModelref_getList = function() {
	return "MESBasic.equipManage.equipment.factoryModelref";
}
MESBasic.equipManage.equipment.factoryModelref.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.equipManage.equipment.factoryModelref.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.equipManage.equipment.factoryModelref.showDialog = function(url,formId,title,width,height,viewCode) {
		var buttons = [];
		var otherParams = MESBasic.equipManage.equipment.factoryModelref.otherParams || {};
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
			
			
			
					if(viewCode=='MESBasic_1_equipManage_mainView'||!viewCode){
					}
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){list_operate_equipManage_factoryModelref.CUI('#'+formId).submit();}
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
		if ( MESBasic.equipManage.equipment.factoryModelref.Dlg ) {
			MESBasic.equipManage.equipment.factoryModelref.Dlg._config.url = url;
			MESBasic.equipManage.equipment.factoryModelref.Dlg._config.formId = formId;
			MESBasic.equipManage.equipment.factoryModelref.Dlg.setTitle( title )
			MESBasic.equipManage.equipment.factoryModelref.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.equipManage.equipment.factoryModelref.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_equipManage_factoryModelref',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.equipManage.equipment.factoryModelref.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.equipManage.equipment.factoryModelref.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_equipManage_equipment', element : $('#MESBasic_equipManage_equipment_factoryModelref_fileupload_button a:eq(1)')});
		}
		MESBasic.equipManage.equipment.factoryModelref.otherParams = {};
	};
	MESBasic.equipManage.equipment.factoryModelref.commonQuery = function(type) {
	  if(typeof MESBasic.equipManage.equipment.factoryModelref.cancelSelectedNode == 'function') {
	   MESBasic.equipManage.equipment.factoryModelref.cancelSelectedNode();
	   MESBasic.equipManage.equipment.factoryModelref.node = null;
	  }
	  if(typeof MESBasic_equipManage_equipment_factoryModelref_cancelSelectedNode == 'function') {
	   MESBasic_equipManage_equipment_factoryModelref_cancelSelectedNode();
	   MESBasic.equipManage.equipment.factoryModelref.node = null;
	  }
	  MESBasic.equipManage.equipment.factoryModelref.query(type);
	 };
	
	
	
	MESBasic.equipManage.equipment.factoryModelref.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_equipManage";
		openExportFrame(url);
	}
MESBasic.equipManage.equipment.factoryModelref.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.equipManage.equipment.factoryModelref.otherParams = {};
	MESBasic.equipManage.equipment.factoryModelref.otherParams.dialogType = dialogType;
	MESBasic.equipManage.equipment.factoryModelref.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.equipManage.equipment.factoryModelref.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="eamBuyTime_start"]').val()!= null && $('#' + formId + ' input[name^="eamBuyTime_start"]').val()!= ''){if(!isDate($('#' + formId + ' input[name^="eamBuyTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1460957425645')}${getText('ec.list.validate.date')}");return false;}}if($('#' + formId + ' input[name^="eamBuyTime_end"]').val()!= null && $('#' + formId + ' input[name^="eamBuyTime_end"]').val()!= ''){if(!isDate($('#' + formId + ' input[name^="eamBuyTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1460957425645')}${getText('ec.list.validate.date')}");return false;}}if($('#' + formId + ' input[name="eamBuyTime_start"]').val()!='' && $('#' + formId + ' input[name="eamBuyTime_end"]').val()!=''){if($('#' + formId + ' input[name="eamBuyTime_start"]').val() > $('#' + formId + ' input[name="eamBuyTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1460957425645')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('MESBasic.propertydisplayName.randon1460957425645')}${getText('ec.list.validate.start')}");return false;}}return true;};




	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_equipManage_factoryModelref,js,MESBasic_1_equipManage_Equipment,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@exportexcel action="/MESBasic/equipManage/equipment/factoryModelref-query.action"   getRequireDataAction="/MESBasic/equipManage/equipment/factoryModelref-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_equipManage_Equipment&&viewCode=MESBasic_1_equipManage_factoryModelref" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_equipManage_factoryModelref')}" prefix="ec_MESBasic_equipManage_equipment_factoryModelref_query" modelCode="MESBasic_1_equipManage_Equipment"  importFlag="false" viewCode="MESBasic_1_equipManage_factoryModelref" />
