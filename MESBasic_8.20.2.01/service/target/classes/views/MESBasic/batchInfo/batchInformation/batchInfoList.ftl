<!-- MESBasic_1/batchInfo/batchInfoList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1492151757128')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchInfoList,head,MESBasic_1_batchInfo_BatchInformation,MESBasic_1) -->
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
	CUI.ns('MESBasic.batchInfo.batchInformation','MESBasic.batchInfo.batchInformation.batchInfoList');
</script>
<@frameset id="ec_MESBasic_batchInfo_batchInformation_batchInfoList_container" border=0>
	<@frame id="ec_MESBasic_batchInfo_batchInformation_batchInfoList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batchInfoList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchInfoList,html,MESBasic_1_batchInfo_BatchInformation,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.batchInfo.batchInformation.batchInfoList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.batchInfo.batchInformation.batchInfoList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.batchInfo.batchInformation.batchInfoList._prefix += '.';
			}
			MESBasic.batchInfo.batchInformation.batchInfoList._prefix += arr[i];
		}
		MESBasic.batchInfo.batchInformation.batchInfoList._suffix = arr[arr.length -1];
		if(MESBasic.batchInfo.batchInformation.batchInfoList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.batchInfo.batchInformation.batchInfoList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.batchInfo.batchInformation.batchInfoList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.batchInfo.batchInformation.batchInfoList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.batchInfo.batchInformation.batchInfoList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name="'+MESBasic.batchInfo.batchInformation.batchInfoList._prefix + '.' + MESBasic.batchInfo.batchInformation.batchInfoList._suffix +'"]').val(obj[0][MESBasic.batchInfo.batchInformation.batchInfoList._suffix]);
		CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name="'+MESBasic.batchInfo.batchInformation.batchInfoList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name^="'+MESBasic.batchInfo.batchInformation.batchInfoList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name="'+MESBasic.batchInfo.batchInformation.batchInfoList._prefix + '.' + MESBasic.batchInfo.batchInformation.batchInfoList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.batchInfo.batchInformation.batchInfoList._dialog) {
			MESBasic.batchInfo.batchInformation.batchInfoList._dialog.close();
		}
	};
	
	MESBasic.batchInfo.batchInformation.batchInfoList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.batchInfo.batchInformation.batchInfoList.query_"+obj+")!='undefined'") ? eval('MESBasic.batchInfo.batchInformation.batchInfoList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_batchInfo_batchInformation_batchInfoList_refresh = function(node){
MESBasic.batchInfo.batchInformation.batchInfoList.node = node;
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
	MESBasic.batchInfo.batchInformation.batchInfoList.query("query");
}

MESBasic_batchInfo_batchInformation_batchInfoList_getList = function() {
	return "MESBasic.batchInfo.batchInformation.batchInfoList";
}
MESBasic.batchInfo.batchInformation.batchInfoList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_batchInfo_batchInformation_batchInfoListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.batchInfo.batchInformation.batchInfoList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.batchInfo.batchInformation.batchInfoList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_batchInfo_batchInformation_batchInfoList_fileupload_button",
		handler:function(){
				list_operate_batchInfo_batchInfoList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.batchInfo.batchInformation.batchInfoList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchInfoList.MESBasic.batchInfo.batchInformation." + params.viewName + ".referenceCopy");
			funcName('batchInformation', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.batchInfo.batchInformation.batchInfoList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchInfoList.MESBasic.batchInfo.batchInformation." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.batchInfo.batchInformation.batchInfoList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchInfo_batchInfoList.MESBasic.batchInfo.batchInformation." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.batchInfo.batchInformation.batchInfoList.dbClickViewbatchInfoList =  function(event, oRow) {
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
	 * @method MESBasic.batchInfo.batchInformation.batchInfoList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.batchInfo.batchInformation.batchInfoList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.batchInfo.batchInformation.batchInfoList.otherParams || {};
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
					list_operate_batchInfo_batchInfoList.CUI('#'+formId).submit();
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
		if ( MESBasic.batchInfo.batchInformation.batchInfoList.Dlg ) {
			MESBasic.batchInfo.batchInformation.batchInfoList.Dlg._config.url = url;
			MESBasic.batchInfo.batchInformation.batchInfoList.Dlg._config.formId = formId;
			MESBasic.batchInfo.batchInformation.batchInfoList.Dlg.setTitle( title )
			MESBasic.batchInfo.batchInformation.batchInfoList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.batchInfo.batchInformation.batchInfoList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchInfo_batchInfoList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.batchInfo.batchInformation.batchInfoList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.batchInfo.batchInformation.batchInfoList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_batchInfo_batchInformation', element : $('#MESBasic_batchInfo_batchInformation_batchInfoList_fileupload_button a:eq(1)')});
		}
		MESBasic.batchInfo.batchInformation.batchInfoList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.batchInfo.batchInformation.batchInfoList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.batchInfo.batchInformation.batchInfoList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.batchInfo.batchInformation.batchInfoList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.batchInfo.batchInformation.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.batchInfo.batchInformation.batchInfoList.AppDlg.show();
	};

	MESBasic.batchInfo.batchInformation.batchInfoList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.batchInfo.batchInformation.batchInfoList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.batchInfo.batchInformation.batchInfoList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.batchInfo.batchInformation.batchInfoList.cancelSelectedNode == 'function') {
	   MESBasic.batchInfo.batchInformation.batchInfoList.cancelSelectedNode();
	   MESBasic.batchInfo.batchInformation.batchInfoList.node = null;
	  }
	  if(typeof MESBasic_batchInfo_batchInformation_batchInfoList_cancelSelectedNode == 'function') {
	   MESBasic_batchInfo_batchInformation_batchInfoList_cancelSelectedNode();
	   MESBasic.batchInfo.batchInformation.batchInfoList.node = null;
	  }
	  MESBasic.batchInfo.batchInformation.batchInfoList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.batchInfo.batchInformation.batchInfoList.query
	 */
	MESBasic.batchInfo.batchInformation.batchInfoList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.batchInfo.batchInformation.batchInfoList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.batchInfo.batchInformation.batchInfoList.node = null;
		if(!checkListValid("ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query._sortKey && datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query._sortMethod){
			CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query._sortKey);
			CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query._sortColumnName);
			CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query._sortKey = '';
			CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.batchInfo.batchInformation.batchInfoList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/batchInfo/batchInformation/batchInfoList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/batchInfo/batchInformation/batchInfoList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_batchInfo_batchInfoList";
		condobj.modelAlias="batchInformation";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name="'+ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_batchInfo_batchInformation_batchInfoList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_batchInfo_batchInfoList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.batchInfo.batchInformation.batchInfoList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_batchInfo";
		openExportFrame(url);
	}
MESBasic.batchInfo.batchInformation.batchInfoList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.batchInfo.batchInformation.batchInfoList.otherParams = {};
	MESBasic.batchInfo.batchInformation.batchInfoList.otherParams.dialogType = dialogType;
	MESBasic.batchInfo.batchInformation.batchInfoList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.batchInfo.batchInformation.batchInfoList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.batchInfo.batchInformation.editCallBackInfo
 */
MESBasic.batchInfo.batchInformation.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_batchInfo_batchInformation_batchInfoList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_batchInfo_batchInformation_batchInfoList_getLayout == "function"){
    		var layout = MESBasic_batchInfo_batchInformation_batchInfoList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.batchInfo.batchInformation.batchInfoList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_batchInfo_BatchInformation'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryWidget._sortKey && ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_batchInfo_batchInformation_batchInfoList_getLayout == "function"){
			var layout = MESBasic_batchInfo_batchInformation_batchInfoList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.batchInfo.batchInformation.batchInfoList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.batchInfo.batchInformation.batchInfoList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.batchInfo.batchInformation.batchInfoList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_batchInfo_BatchInformation'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.batchInfo.batchInformation.batchInfoList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.batchInfo.batchInformation.batchInfoList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_batchInfo_batchInfoList,js,MESBasic_1_batchInfo_BatchInformation,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_batchInfo_batchInfoList' idprefix='ec_MESBasic_batchInfo_batchInformation_batchInfoList' queryUrl='/MESBasic/batchInfo/batchInformation/batchInfoList-query.action' queryFunc="MESBasic.batchInfo.batchInformation.batchInfoList.query" ns="MESBasic.batchInfo.batchInformation.batchInfoList" />
<@exportexcel action="/MESBasic/batchInfo/batchInformation/batchInfoList-query.action"   getRequireDataAction="/MESBasic/batchInfo/batchInformation/batchInfoList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_batchInfo_BatchInformation&&viewCode=MESBasic_1_batchInfo_batchInfoList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_batchInfo_batchInfoList')}" prefix="ec_MESBasic_batchInfo_batchInformation_batchInfoList_query" modelCode="MESBasic_1_batchInfo_BatchInformation"  importFlag="false" viewCode="MESBasic_1_batchInfo_batchInfoList" />
