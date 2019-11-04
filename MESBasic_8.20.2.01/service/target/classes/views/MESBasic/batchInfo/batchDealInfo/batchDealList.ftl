<!-- MESBasic_1/batchInfo/batchDealList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1492152115499')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchDealList,head,MESBasic_1_batchInfo_BatchDealInfo,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">
	.ewc-dialog-el{height:100%;}
	
	#fast_select_elements .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements_bak .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	}
	#fast_select_elements_bak .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	} 
	
</style>  
<script type="text/javascript">
	CUI.ns('MESBasic.batchInfo.batchDealInfo','MESBasic.batchInfo.batchDealInfo.batchDealList');
</script>
<@frameset id="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_container" border=0>
	<@frame id="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batchDealList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchDealList,html,MESBasic_1_batchInfo_BatchDealInfo,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.batchInfo.batchDealInfo.batchDealList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.batchInfo.batchDealInfo.batchDealList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.batchInfo.batchDealInfo.batchDealList._prefix += '.';
			}
			MESBasic.batchInfo.batchDealInfo.batchDealList._prefix += arr[i];
		}
		MESBasic.batchInfo.batchDealInfo.batchDealList._suffix = arr[arr.length -1];
		if(MESBasic.batchInfo.batchDealInfo.batchDealList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.batchInfo.batchDealInfo.batchDealList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.batchInfo.batchDealInfo.batchDealList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.batchInfo.batchDealInfo.batchDealList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.batchInfo.batchDealInfo.batchDealList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name="'+MESBasic.batchInfo.batchDealInfo.batchDealList._prefix + '.' + MESBasic.batchInfo.batchDealInfo.batchDealList._suffix +'"]').val(obj[0][MESBasic.batchInfo.batchDealInfo.batchDealList._suffix]);
		CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name="'+MESBasic.batchInfo.batchDealInfo.batchDealList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name^="'+MESBasic.batchInfo.batchDealInfo.batchDealList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name="'+MESBasic.batchInfo.batchDealInfo.batchDealList._prefix + '.' + MESBasic.batchInfo.batchDealInfo.batchDealList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.batchInfo.batchDealInfo.batchDealList._dialog) {
			MESBasic.batchInfo.batchDealInfo.batchDealList._dialog.close();
		}
	};
	
	MESBasic.batchInfo.batchDealInfo.batchDealList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.batchInfo.batchDealInfo.batchDealList.query_"+obj+")!='undefined'") ? eval('MESBasic.batchInfo.batchDealInfo.batchDealList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_batchInfo_batchDealInfo_batchDealList_refresh = function(node){
MESBasic.batchInfo.batchDealInfo.batchDealList.node = node;
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
	MESBasic.batchInfo.batchDealInfo.batchDealList.query("query");
}

MESBasic_batchInfo_batchDealInfo_batchDealList_getList = function() {
	return "MESBasic.batchInfo.batchDealInfo.batchDealList";
}
MESBasic.batchInfo.batchDealInfo.batchDealList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_batchInfo_batchDealInfo_batchDealListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.batchInfo.batchDealInfo.batchDealList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.batchInfo.batchDealInfo.batchDealList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_batchInfo_batchDealInfo_batchDealList_fileupload_button",
		handler:function(){
				list_operate_batchInfo_batchDealList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.batchInfo.batchDealInfo.batchDealList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchDealList.MESBasic.batchInfo.batchDealInfo." + params.viewName + ".referenceCopy");
			funcName('batchDealInfo', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.batchInfo.batchDealInfo.batchDealList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchDealList.MESBasic.batchInfo.batchDealInfo." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.batchInfo.batchDealInfo.batchDealList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchDealList.MESBasic.batchInfo.batchDealInfo." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.batchInfo.batchDealInfo.batchDealList.dbClickViewbatchDealList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_batchInfo&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.batchInfo.batchDealInfo.batchDealList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.batchInfo.batchDealInfo.batchDealList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.batchInfo.batchDealInfo.batchDealList.otherParams || {};
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
				handler:function(){
					list_operate_batchInfo_batchDealList.CUI('#'+formId).submit();
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
		if ( MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg ) {
			MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg._config.url = url;
			MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg._config.formId = formId;
			MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg.setTitle( title )
			MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchInfo_batchDealList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.batchInfo.batchDealInfo.batchDealList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_batchInfo_batchDealInfo', element : $('#MESBasic_batchInfo_batchDealInfo_batchDealList_fileupload_button a:eq(1)')});
		}
		MESBasic.batchInfo.batchDealInfo.batchDealList.otherParams = {};
	};

	MESBasic.batchInfo.batchDealInfo.batchDealList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.batchInfo.batchDealInfo.batchDealList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.batchInfo.batchDealInfo.batchDealList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.batchInfo.batchDealInfo.batchDealList.cancelSelectedNode == 'function') {
	   MESBasic.batchInfo.batchDealInfo.batchDealList.cancelSelectedNode();
	   MESBasic.batchInfo.batchDealInfo.batchDealList.node = null;
	  }
	  if(typeof MESBasic_batchInfo_batchDealInfo_batchDealList_cancelSelectedNode == 'function') {
	   MESBasic_batchInfo_batchDealInfo_batchDealList_cancelSelectedNode();
	   MESBasic.batchInfo.batchDealInfo.batchDealList.node = null;
	  }
	  MESBasic.batchInfo.batchDealInfo.batchDealList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.batchInfo.batchDealInfo.batchDealList.query
	 */
	MESBasic.batchInfo.batchDealInfo.batchDealList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.batchInfo.batchDealInfo.batchDealList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.batchInfo.batchDealInfo.batchDealList.node = null;
		if(!checkListValid("ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query._sortKey && datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query._sortMethod){
			CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query._sortKey);
			CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query._sortColumnName);
			CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query._sortKey = '';
			CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.batchInfo.batchDealInfo.batchDealList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/batchInfo/batchDealInfo/batchDealList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/batchInfo/batchDealInfo/batchDealList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_batchInfo_batchDealList";
		condobj.modelAlias="batchDealInfo";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name="'+ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_batchInfo_batchDealList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.batchInfo.batchDealInfo.batchDealList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_batchInfo";
		openExportFrame(url);
	}
MESBasic.batchInfo.batchDealInfo.batchDealList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.batchInfo.batchDealInfo.batchDealList.otherParams = {};
	MESBasic.batchInfo.batchDealInfo.batchDealList.otherParams.dialogType = dialogType;
	MESBasic.batchInfo.batchDealInfo.batchDealList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.batchInfo.batchDealInfo.batchDealList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.batchInfo.batchDealInfo.editCallBackInfo
 */
MESBasic.batchInfo.batchDealInfo.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_batchInfo_batchDealInfo_batchDealList_getLayout == "function"){
    		var layout = MESBasic_batchInfo_batchDealInfo_batchDealList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.batchInfo.batchDealInfo.batchDealList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_batchInfo_BatchDealInfo'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_batchInfo_batchDealInfo_batchDealList_getLayout == "function"){
			var layout = MESBasic_batchInfo_batchDealInfo_batchDealList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.batchInfo.batchDealInfo.batchDealList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.batchInfo.batchDealInfo.batchDealList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.batchInfo.batchDealInfo.batchDealList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_batchInfo_BatchDealInfo'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.batchInfo.batchDealInfo.batchDealList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.batchInfo.batchDealInfo.batchDealList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchDealList,js,MESBasic_1_batchInfo_BatchDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_batchInfo_batchDealList' idprefix='ec_MESBasic_batchInfo_batchDealInfo_batchDealList' queryUrl='/MESBasic/batchInfo/batchDealInfo/batchDealList-query.action' queryFunc="MESBasic.batchInfo.batchDealInfo.batchDealList.query" ns="MESBasic.batchInfo.batchDealInfo.batchDealList" />
<@exportexcel action="/MESBasic/batchInfo/batchDealInfo/batchDealList-query.action"   getRequireDataAction="/MESBasic/batchInfo/batchDealInfo/batchDealList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_batchInfo_BatchDealInfo&&viewCode=MESBasic_1_batchInfo_batchDealList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_batchInfo_batchDealList')}" prefix="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query" modelCode="MESBasic_1_batchInfo_BatchDealInfo"  importFlag="false" viewCode="MESBasic_1_batchInfo_batchDealList" />
