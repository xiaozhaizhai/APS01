<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1487129232999')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">.ewc-dialog-el{height:100%;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.storeSet.storeSet','MESBasic.storeSet.storeSet.storeBoxRef');
</script>
<@frameset id="ec_MESBasic_storeSet_storeSet_storeBoxRef_container" border=0>
	<@frame id="ec_MESBasic_storeSet_storeSet_storeBoxRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "storeBoxRef-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_storeSet_storeBoxRef,html,MESBasic_1_storeSet_StoreSet,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.storeSet.storeSet.storeBoxRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.storeSet.storeSet.storeBoxRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.storeSet.storeSet.storeBoxRef._prefix += '.';
			}
			MESBasic.storeSet.storeSet.storeBoxRef._prefix += arr[i];
		}
		MESBasic.storeSet.storeSet.storeBoxRef._suffix = arr[arr.length -1];
		if(MESBasic.storeSet.storeSet.storeBoxRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.storeSet.storeSet.storeBoxRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.storeSet.storeSet.storeBoxRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.storeSet.storeSet.storeBoxRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.storeSet.storeSet.storeBoxRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name="'+MESBasic.storeSet.storeSet.storeBoxRef._prefix + '.' + MESBasic.storeSet.storeSet.storeBoxRef._suffix +'"]').val(obj[0][MESBasic.storeSet.storeSet.storeBoxRef._suffix]);
		CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name="'+MESBasic.storeSet.storeSet.storeBoxRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name^="'+MESBasic.storeSet.storeSet.storeBoxRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name="'+MESBasic.storeSet.storeSet.storeBoxRef._prefix + '.' + MESBasic.storeSet.storeSet.storeBoxRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.storeSet.storeSet.storeBoxRef._dialog) {
			MESBasic.storeSet.storeSet.storeBoxRef._dialog.close();
		}
	};
	
	MESBasic.storeSet.storeSet.storeBoxRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.storeSet.storeSet.storeBoxRef.query_"+obj+")!='undefined'") ? eval('MESBasic.storeSet.storeSet.storeBoxRef.query_'+obj+'()') : null;
		return str;
	
	};
	
MESBasic_storeSet_storeSet_storeBoxRef_refresh = function(node){
	//var url = "/MESBasic/storeSet/storeSet/storeBoxRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.storeSet.storeSet.storeBoxRef.node = node;
	MESBasic.storeSet.storeSet.storeBoxRef.query("query");
}

MESBasic_storeSet_storeSet_storeBoxRef_getList = function() {
	return "MESBasic.storeSet.storeSet.storeBoxRef";
}
MESBasic.storeSet.storeSet.storeBoxRef.showErrorMsg = function(msg) {
	workbenchErrorBarWidget.showMessage(msg,'f');
}

MESBasic.storeSet.storeSet.storeBoxRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.storeSet.storeSet.storeBoxRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_storeSet_storeSet_storeBoxRef_fileupload_button",
		handler:function(){
				list_operate_storeSet_storeBoxRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.storeSet.storeSet.storeBoxRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_storeSet_storeBoxRef.MESBasic.storeSet.storeSet." + params.viewName + ".referenceCopy");
			funcName('storeSet', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.storeSet.storeSet.storeBoxRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_storeSet_storeBoxRef.MESBasic.storeSet.storeSet." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.storeSet.storeSet.storeBoxRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_storeSet_storeBoxRef.MESBasic.storeSet.storeSet." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.storeSet.storeSet.storeBoxRef.dbClickViewstoreBoxRef = function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
			CUI.Dialog.alert("${getText('ec.view.noViewView')}");return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_storeSet&id=" + oRow.id);
		}
	}
	
	/**
	 * 显示增加对话框
	 * @method MESBasic.storeSet.storeSet.storeBoxRef.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.storeSet.storeSet.storeBoxRef.showDialog = function(url,formId,title,width,height,viewCode) {
		var buttons = [];
		var otherParams = MESBasic.storeSet.storeSet.storeBoxRef.otherParams || {};
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
				handler:function(){list_operate_storeSet_storeBoxRef.CUI('#'+formId).submit();}
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
		if ( MESBasic.storeSet.storeSet.storeBoxRef.Dlg ) {
			MESBasic.storeSet.storeSet.storeBoxRef.Dlg._config.url = url;
			MESBasic.storeSet.storeSet.storeBoxRef.Dlg._config.formId = formId;
			MESBasic.storeSet.storeSet.storeBoxRef.Dlg.setTitle( title )
			MESBasic.storeSet.storeSet.storeBoxRef.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.storeSet.storeSet.storeBoxRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_storeSet_storeBoxRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.storeSet.storeSet.storeBoxRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.storeSet.storeSet.storeBoxRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_storeSet_storeSet', element : $('#MESBasic_storeSet_storeSet_storeBoxRef_fileupload_button a:eq(1)')});
		}
		MESBasic.storeSet.storeSet.storeBoxRef.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.storeSet.storeSet.storeBoxRef.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.storeSet.storeSet.storeBoxRef.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.storeSet.storeSet.storeBoxRef.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.storeSet.storeSet.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.storeSet.storeSet.storeBoxRef.AppDlg.show();
	};
	MESBasic.storeSet.storeSet.storeBoxRef.commonQuery = function(type) {
	  if(typeof MESBasic.storeSet.storeSet.storeBoxRef.cancelSelectedNode == 'function') {
	   MESBasic.storeSet.storeSet.storeBoxRef.cancelSelectedNode();
	   MESBasic.storeSet.storeSet.storeBoxRef.node = null;
	  }
	  if(typeof MESBasic_storeSet_storeSet_storeBoxRef_cancelSelectedNode == 'function') {
	   MESBasic_storeSet_storeSet_storeBoxRef_cancelSelectedNode();
	   MESBasic.storeSet.storeSet.storeBoxRef.node = null;
	  }
	  MESBasic.storeSet.storeSet.storeBoxRef.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.storeSet.storeSet.storeBoxRef.query
	 */
	MESBasic.storeSet.storeSet.storeBoxRef.query = function(type,pageNo,sortFlag){
		var node = MESBasic.storeSet.storeSet.storeBoxRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.storeSet.storeSet.storeBoxRef.node = null;
		if(!checkListValid("ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query._sortKey && datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query._sortMethod){
			CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query._sortKey);
			CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query._sortColumnName);
			CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query._sortMethod);
		}else{
			datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query._sortKey = '';
			CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.storeSet.storeSet.storeBoxRef.query('query')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/storeSet/storeSet/storeBoxRef-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/storeSet/storeSet/storeBoxRef-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_storeSet_storeBoxRef";
		condobj.modelAlias="storeSet";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name="'+ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_storeSet_storeSet_storeBoxRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_storeSet_storeSet_storeBoxRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_storeSet_storeSet_storeBoxRef_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_storeSet_storeBoxRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.storeSet.storeSet.storeBoxRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_storeSet";
		openExportFrame(url);
	}
MESBasic.storeSet.storeSet.storeBoxRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.storeSet.storeSet.storeBoxRef.otherParams = {};
	MESBasic.storeSet.storeSet.storeBoxRef.otherParams.dialogType = dialogType;
	MESBasic.storeSet.storeSet.storeBoxRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.storeSet.storeSet.storeBoxRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.storeSet.storeSet.editCallBackInfo
 */
MESBasic.storeSet.storeSet.editCallBackInfo = function(res){
	var queryFunc = datatable_ec_MESBasic_storeSet_storeSet_storeBoxRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_storeSet_storeSet_storeBoxRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_storeSet_storeSet_storeBoxRef_getLayout == "function"){
    		var layout = MESBasic_storeSet_storeSet_storeBoxRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.storeSet.storeSet.storeBoxRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_storeSet_storeSet_storeBoxRef_queryWidget._sortKey && ec_MESBasic_storeSet_storeSet_storeBoxRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_storeSet_StoreSet'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_storeSet_storeSet_storeBoxRef_queryWidget._sortKey && ec_MESBasic_storeSet_storeSet_storeBoxRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_storeSet_storeSet_storeBoxRef_queryWidget._sortKey && ec_MESBasic_storeSet_storeSet_storeBoxRef_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_storeSet_storeSet_storeBoxRef_getLayout == "function"){
			var layout = MESBasic_storeSet_storeSet_storeBoxRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.storeSet.storeSet.storeBoxRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.storeSet.storeSet.storeBoxRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.storeSet.storeSet.storeBoxRef.query('query');
	    	}
			if(modelCode == 'MESBasic_1_storeSet_StoreSet'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.storeSet.storeSet.storeBoxRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.storeSet.storeSet.storeBoxRef.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId){return true;};




	/* CUSTOM CODE START(view-LIST-MESBasic_1_storeSet_storeBoxRef,js,MESBasic_1_storeSet_StoreSet,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */				
</script>
<@newAdvQueryJs viewCode='MESBasic_1_storeSet_storeBoxRef' idprefix='ec_MESBasic_storeSet_storeSet_storeBoxRef' queryUrl='/MESBasic/storeSet/storeSet/storeBoxRef-query.action' queryFunc="MESBasic.storeSet.storeSet.storeBoxRef.query" ns="MESBasic.storeSet.storeSet.storeBoxRef" />
<@exportexcel action="/MESBasic/storeSet/storeSet/storeBoxRef-query.action"   getRequireDataAction="/MESBasic/storeSet/storeSet/storeBoxRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_storeSet_StoreSet&&viewCode=MESBasic_1_storeSet_storeBoxRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_storeSet_storeBoxRef')}" prefix="ec_MESBasic_storeSet_storeSet_storeBoxRef_query" modelCode="MESBasic_1_storeSet_StoreSet"  importFlag="false" viewCode="MESBasic_1_storeSet_storeBoxRef" />
