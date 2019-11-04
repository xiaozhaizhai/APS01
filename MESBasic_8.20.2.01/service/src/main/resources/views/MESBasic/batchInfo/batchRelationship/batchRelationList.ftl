<!-- MESBasic_1/batchInfo/batchRelationList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1492157040432')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchRelationList,head,MESBasic_1_batchInfo_BatchRelationship,MESBasic_1) -->
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
	CUI.ns('MESBasic.batchInfo.batchRelationship','MESBasic.batchInfo.batchRelationship.batchRelationList');
</script>
<@frameset id="ec_MESBasic_batchInfo_batchRelationship_batchRelationList_container" border=0>
	<@frame id="ec_MESBasic_batchInfo_batchRelationship_batchRelationList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batchRelationList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchRelationList,html,MESBasic_1_batchInfo_BatchRelationship,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.batchInfo.batchRelationship.batchRelationList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.batchInfo.batchRelationship.batchRelationList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.batchInfo.batchRelationship.batchRelationList._prefix += '.';
			}
			MESBasic.batchInfo.batchRelationship.batchRelationList._prefix += arr[i];
		}
		MESBasic.batchInfo.batchRelationship.batchRelationList._suffix = arr[arr.length -1];
		if(MESBasic.batchInfo.batchRelationship.batchRelationList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.batchInfo.batchRelationship.batchRelationList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.batchInfo.batchRelationship.batchRelationList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.batchInfo.batchRelationship.batchRelationList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.batchInfo.batchRelationship.batchRelationList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name="'+MESBasic.batchInfo.batchRelationship.batchRelationList._prefix + '.' + MESBasic.batchInfo.batchRelationship.batchRelationList._suffix +'"]').val(obj[0][MESBasic.batchInfo.batchRelationship.batchRelationList._suffix]);
		CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name="'+MESBasic.batchInfo.batchRelationship.batchRelationList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name^="'+MESBasic.batchInfo.batchRelationship.batchRelationList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name="'+MESBasic.batchInfo.batchRelationship.batchRelationList._prefix + '.' + MESBasic.batchInfo.batchRelationship.batchRelationList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.batchInfo.batchRelationship.batchRelationList._dialog) {
			MESBasic.batchInfo.batchRelationship.batchRelationList._dialog.close();
		}
	};
	
	MESBasic.batchInfo.batchRelationship.batchRelationList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.batchInfo.batchRelationship.batchRelationList.query_"+obj+")!='undefined'") ? eval('MESBasic.batchInfo.batchRelationship.batchRelationList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_batchInfo_batchRelationship_batchRelationList_refresh = function(node){
MESBasic.batchInfo.batchRelationship.batchRelationList.node = node;
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
	MESBasic.batchInfo.batchRelationship.batchRelationList.query("query");
}

MESBasic_batchInfo_batchRelationship_batchRelationList_getList = function() {
	return "MESBasic.batchInfo.batchRelationship.batchRelationList";
}
MESBasic.batchInfo.batchRelationship.batchRelationList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_batchInfo_batchRelationship_batchRelationListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.batchInfo.batchRelationship.batchRelationList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.batchInfo.batchRelationship.batchRelationList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_batchInfo_batchRelationship_batchRelationList_fileupload_button",
		handler:function(){
				list_operate_batchInfo_batchRelationList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.batchInfo.batchRelationship.batchRelationList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchRelationList.MESBasic.batchInfo.batchRelationship." + params.viewName + ".referenceCopy");
			funcName('batchRelationship', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.batchInfo.batchRelationship.batchRelationList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchRelationList.MESBasic.batchInfo.batchRelationship." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.batchInfo.batchRelationship.batchRelationList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchRelationList.MESBasic.batchInfo.batchRelationship." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.batchInfo.batchRelationship.batchRelationList.dbClickViewbatchRelationList =  function(event, oRow) {
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
	 * @method MESBasic.batchInfo.batchRelationship.batchRelationList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.batchInfo.batchRelationship.batchRelationList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.batchInfo.batchRelationship.batchRelationList.otherParams || {};
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
					list_operate_batchInfo_batchRelationList.CUI('#'+formId).submit();
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
		if ( MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg ) {
			MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg._config.url = url;
			MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg._config.formId = formId;
			MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg.setTitle( title )
			MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchInfo_batchRelationList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.batchInfo.batchRelationship.batchRelationList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_batchInfo_batchRelationship', element : $('#MESBasic_batchInfo_batchRelationship_batchRelationList_fileupload_button a:eq(1)')});
		}
		MESBasic.batchInfo.batchRelationship.batchRelationList.otherParams = {};
	};

	MESBasic.batchInfo.batchRelationship.batchRelationList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.batchInfo.batchRelationship.batchRelationList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.batchInfo.batchRelationship.batchRelationList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.batchInfo.batchRelationship.batchRelationList.cancelSelectedNode == 'function') {
	   MESBasic.batchInfo.batchRelationship.batchRelationList.cancelSelectedNode();
	   MESBasic.batchInfo.batchRelationship.batchRelationList.node = null;
	  }
	  if(typeof MESBasic_batchInfo_batchRelationship_batchRelationList_cancelSelectedNode == 'function') {
	   MESBasic_batchInfo_batchRelationship_batchRelationList_cancelSelectedNode();
	   MESBasic.batchInfo.batchRelationship.batchRelationList.node = null;
	  }
	  MESBasic.batchInfo.batchRelationship.batchRelationList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.batchInfo.batchRelationship.batchRelationList.query
	 */
	MESBasic.batchInfo.batchRelationship.batchRelationList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.batchInfo.batchRelationship.batchRelationList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.batchInfo.batchRelationship.batchRelationList.node = null;
		if(!checkListValid("ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query._sortKey && datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query._sortMethod){
			CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query._sortKey);
			CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query._sortColumnName);
			CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query._sortKey = '';
			CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.batchInfo.batchRelationship.batchRelationList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/batchInfo/batchRelationship/batchRelationList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/batchInfo/batchRelationship/batchRelationList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_batchInfo_batchRelationList";
		condobj.modelAlias="batchRelationship";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name="'+ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_batchInfo_batchRelationship_batchRelationList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_batchInfo_batchRelationList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.batchInfo.batchRelationship.batchRelationList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_batchInfo";
		openExportFrame(url);
	}
MESBasic.batchInfo.batchRelationship.batchRelationList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.batchInfo.batchRelationship.batchRelationList.otherParams = {};
	MESBasic.batchInfo.batchRelationship.batchRelationList.otherParams.dialogType = dialogType;
	MESBasic.batchInfo.batchRelationship.batchRelationList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.batchInfo.batchRelationship.batchRelationList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.batchInfo.batchRelationship.editCallBackInfo
 */
MESBasic.batchInfo.batchRelationship.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_batchInfo_batchRelationship_batchRelationList_getLayout == "function"){
    		var layout = MESBasic_batchInfo_batchRelationship_batchRelationList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.batchInfo.batchRelationship.batchRelationList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_batchInfo_BatchRelationship'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchRelationship_batchRelationList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_batchInfo_batchRelationship_batchRelationList_getLayout == "function"){
			var layout = MESBasic_batchInfo_batchRelationship_batchRelationList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.batchInfo.batchRelationship.batchRelationList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.batchInfo.batchRelationship.batchRelationList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.batchInfo.batchRelationship.batchRelationList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_batchInfo_BatchRelationship'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.batchInfo.batchRelationship.batchRelationList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.batchInfo.batchRelationship.batchRelationList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchRelationList,js,MESBasic_1_batchInfo_BatchRelationship,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_batchInfo_batchRelationList' idprefix='ec_MESBasic_batchInfo_batchRelationship_batchRelationList' queryUrl='/MESBasic/batchInfo/batchRelationship/batchRelationList-query.action' queryFunc="MESBasic.batchInfo.batchRelationship.batchRelationList.query" ns="MESBasic.batchInfo.batchRelationship.batchRelationList" />
<@exportexcel action="/MESBasic/batchInfo/batchRelationship/batchRelationList-query.action"   getRequireDataAction="/MESBasic/batchInfo/batchRelationship/batchRelationList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_batchInfo_BatchRelationship&&viewCode=MESBasic_1_batchInfo_batchRelationList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_batchInfo_batchRelationList')}" prefix="ec_MESBasic_batchInfo_batchRelationship_batchRelationList_query" modelCode="MESBasic_1_batchInfo_BatchRelationship"  importFlag="false" viewCode="MESBasic_1_batchInfo_batchRelationList" />
