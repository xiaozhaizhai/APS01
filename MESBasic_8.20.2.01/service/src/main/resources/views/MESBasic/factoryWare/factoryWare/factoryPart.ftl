<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1486985912661')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.factoryWare.factoryWare','MESBasic.factoryWare.factoryWare.factoryPart');
</script>
<#if permissionCode?? && permissionCode?has_content>
	<#assign buttonPerfix = permissionCode + "_" >
</#if>
<#if viewShowType?? && viewShowType == 'PART'>
<@frameset id="ec_MESBasic_factoryWare_factoryWare_factoryPart_container" border=0>
	<@frame id="ec_MESBasic_factoryWare_factoryWare_factoryPart_container_main"  offsetH=4 region="center" class="center_in">
	<#include "factoryPart-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#else>
<#include "factoryPart-fastquery-datatable.ftl">
</#if>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_factoryWare_factoryPart,html,MESBasic_1_factoryWare_FactoryWare,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.factoryWare.factoryWare.factoryPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.factoryWare.factoryWare.factoryPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.factoryWare.factoryWare.factoryPart._prefix += '.';
			}
			MESBasic.factoryWare.factoryWare.factoryPart._prefix += arr[i];
		}
		MESBasic.factoryWare.factoryWare.factoryPart._suffix = arr[arr.length -1];
		if(MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.factoryWare.factoryWare.factoryPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.factoryWare.factoryWare.factoryPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.factoryWare.factoryWare.factoryPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryPart._prefix + '.' + MESBasic.factoryWare.factoryWare.factoryPart._suffix +'"]').val(obj[0][MESBasic.factoryWare.factoryWare.factoryPart._suffix]);
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name^="'+MESBasic.factoryWare.factoryWare.factoryPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryPart._prefix + '.' + MESBasic.factoryWare.factoryWare.factoryPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.factoryWare.factoryWare.factoryPart._dialog) {
			MESBasic.factoryWare.factoryWare.factoryPart._dialog.close();
		}
	};
	
	MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryWare.factoryWare.factoryPart.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryWare.factoryWare.factoryPart.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_factoryWare_factoryWare_factoryPart_refresh = function(node){
	//var url = "/MESBasic/factoryWare/factoryWare/factoryPart-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.factoryWare.factoryWare.factoryPart.node = node;
	MESBasic.factoryWare.factoryWare.factoryPart.query("query");
}

MESBasic_factoryWare_factoryWare_factoryPart_getList = function() {
	return "MESBasic.factoryWare.factoryWare.factoryPart";
}
MESBasic.factoryWare.factoryWare.factoryPart.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.factoryWare.factoryWare.factoryPart.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.factoryWare.factoryWare.factoryPart.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_factoryWare_factoryWare_factoryPart_fileupload_button",
		handler:function(){
				list_operate_factoryWare_factoryPart.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.factoryWare.factoryWare.factoryPart.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryWare_factoryPart.MESBasic.factoryWare.factoryWare." + params.viewName + ".referenceCopy");
			funcName('factoryWare', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.factoryWare.factoryWare.factoryPart.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryWare_factoryPart.MESBasic.factoryWare.factoryWare." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.factoryWare.factoryWare.factoryPart.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryWare_factoryPart.MESBasic.factoryWare.factoryWare." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.factoryWare.factoryWare.factoryPart.dbClickViewfactoryPart = function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
			CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_factoryWare&id=" + oRow.id);
		}
	}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.factoryWare.factoryWare.factoryPart.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.factoryWare.factoryWare.factoryPart.showDialog = function(url,formId,title,width,height,viewCode) {
		var buttons = [];
		var otherParams = MESBasic.factoryWare.factoryWare.factoryPart.otherParams || {};
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
				handler:function(){list_operate_factoryWare_factoryPart.CUI('#'+formId).submit();}
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
		if ( MESBasic.factoryWare.factoryWare.factoryPart.Dlg ) {
			MESBasic.factoryWare.factoryWare.factoryPart.Dlg._config.url = url;
			MESBasic.factoryWare.factoryWare.factoryPart.Dlg._config.formId = formId;
			MESBasic.factoryWare.factoryWare.factoryPart.Dlg.setTitle( title )
			MESBasic.factoryWare.factoryWare.factoryPart.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.factoryWare.factoryWare.factoryPart.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_factoryWare_factoryPart',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.factoryWare.factoryWare.factoryPart.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.factoryWare.factoryWare.factoryPart.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_factoryWare_factoryWare', element : $('#MESBasic_factoryWare_factoryWare_factoryPart_fileupload_button a:eq(1)')});
		}
		MESBasic.factoryWare.factoryWare.factoryPart.otherParams = {};
	};
	MESBasic.factoryWare.factoryWare.factoryPart.commonQuery = function(type) {
	  if(typeof MESBasic.factoryWare.factoryWare.factoryPart.cancelSelectedNode == 'function') {
	   MESBasic.factoryWare.factoryWare.factoryPart.cancelSelectedNode();
	   MESBasic.factoryWare.factoryWare.factoryPart.node = null;
	  }
	  if(typeof MESBasic_factoryWare_factoryWare_factoryPart_cancelSelectedNode == 'function') {
	   MESBasic_factoryWare_factoryWare_factoryPart_cancelSelectedNode();
	   MESBasic.factoryWare.factoryWare.factoryPart.node = null;
	  }
	  MESBasic.factoryWare.factoryWare.factoryPart.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.factoryWare.factoryWare.factoryPart.query
	 */
	MESBasic.factoryWare.factoryWare.factoryPart.query = function(type,pageNo,sortFlag){
		var node = MESBasic.factoryWare.factoryWare.factoryPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.factoryWare.factoryWare.factoryPart.node = null;
		if(!checkListValid("ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query._sortKey && datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query._sortMethod){
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query._sortKey);
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query._sortColumnName);
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query._sortMethod);
		}else{
			datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query._sortKey = '';
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.factoryWare.factoryWare.factoryPart.query('query')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/factoryWare/factoryWare/factoryPart-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/factoryWare/factoryWare/factoryPart-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_factoryWare_factoryPart";
		condobj.modelAlias="factoryWare";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name="'+ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_factoryWare_factoryWare_factoryPart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
			<#if mainBusinessId??>
		 		dataPost += "&mainBusinessId=${mainBusinessId}";	
		 	</#if>
		 	<#if businessCenterCode??>
		 		dataPost += "&businessCenterCode=${businessCenterCode}";	
		 	</#if>
		 	<#if flowBulkFlag??>
		 		dataPost += "&flowBulkFlag=${flowBulkFlag?string('true','false')}";	
		 	</#if>
		 	<#if listCustomCondition?? && listCustomCondition != "">
		 		dataPost += "&${listCustomCondition}";	
		 	</#if>
		
		if(type && type == 'goList') {
			dataPost += "&activityName=${activityName!}";
			dataPost += "&processKey=${processKey!}";
		}
		if(nodeParam!=""){
			if(url.indexOf(".action?")<0){
				url += "?1=1";
			}
			url += nodeParam;
		}
		var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_factoryWare_factoryPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.factoryWare.factoryWare.factoryPart.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_factoryWare";
		openExportFrame(url);
	}
MESBasic.factoryWare.factoryWare.factoryPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.factoryWare.factoryWare.factoryPart.otherParams = {};
	MESBasic.factoryWare.factoryWare.factoryPart.otherParams.dialogType = dialogType;
	MESBasic.factoryWare.factoryWare.factoryPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.factoryWare.factoryWare.factoryPart.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.factoryWare.factoryWare.editCallBackInfo
 */
MESBasic.factoryWare.factoryWare.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_factoryWare_factoryWare_factoryPart_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_factoryWare_factoryWare_factoryPart_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_factoryWare_factoryWare_factoryPart_getLayout == "function"){
    		var layout = MESBasic_factoryWare_factoryWare_factoryPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.factoryWare.factoryWare.factoryPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_factoryWare_factoryWare_factoryPart_queryWidget._sortKey && ec_MESBasic_factoryWare_factoryWare_factoryPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_factoryWare_FactoryWare'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_factoryWare_factoryWare_factoryPart_queryWidget._sortKey && ec_MESBasic_factoryWare_factoryWare_factoryPart_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_factoryWare_factoryWare_factoryPart_queryWidget._sortKey && ec_MESBasic_factoryWare_factoryWare_factoryPart_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_factoryWare_factoryWare_factoryPart_getLayout == "function"){
			var layout = MESBasic_factoryWare_factoryWare_factoryPart_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.factoryWare.factoryWare.factoryPart.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.factoryWare.factoryWare.factoryPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.factoryWare.factoryWare.factoryPart.query('query');
	    	}
			if(modelCode == 'MESBasic_1_factoryWare_FactoryWare'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.factoryWare.factoryWare.factoryPart.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.factoryWare.factoryWare.factoryPart.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_factoryWare_factoryPart,js,MESBasic_1_factoryWare_FactoryWare,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@newAdvQueryJs viewCode='MESBasic_1_factoryWare_factoryPart' idprefix='ec_MESBasic_factoryWare_factoryWare_factoryPart' queryUrl='/MESBasic/factoryWare/factoryWare/factoryPart-query.action' queryFunc="MESBasic.factoryWare.factoryWare.factoryPart.query" ns="MESBasic.factoryWare.factoryWare.factoryPart" />
<@exportexcel action="/MESBasic/factoryWare/factoryWare/factoryPart-query.action"   getRequireDataAction="/MESBasic/factoryWare/factoryWare/factoryPart-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_factoryWare_FactoryWare&&viewCode=MESBasic_1_factoryWare_factoryPart" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_factoryWare_factoryPart')}" prefix="ec_MESBasic_factoryWare_factoryWare_factoryPart_query" modelCode="MESBasic_1_factoryWare_FactoryWare"  importFlag="false" viewCode="MESBasic_1_factoryWare_factoryPart" />
