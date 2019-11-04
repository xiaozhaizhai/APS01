<!-- WOM_7.5.0.0/putInMaterialException/putinExceptionList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1494815188320')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_putInMaterialException_putinExceptionList,head,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("WOM.putInMaterialException.putMaterialException","WOM.putInMaterialException.putMaterialException.putinExceptionList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_container" border=0>
	<@frame id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "putinExceptionList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_putInMaterialException_putinExceptionList,html,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=WOM_7.5.0.0_putInMaterialException';
		openFullScreen(url);
	};
	
	WOM.putInMaterialException.putMaterialException.putinExceptionList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.putInMaterialException.putMaterialException.putinExceptionList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.putInMaterialException.putMaterialException.putinExceptionList._prefix += '.';
			}
			WOM.putInMaterialException.putMaterialException.putinExceptionList._prefix += arr[i];
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionList._suffix = arr[arr.length -1];
		if(WOM.putInMaterialException.putMaterialException.putinExceptionList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.putInMaterialException.putMaterialException.putinExceptionList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.putInMaterialException.putMaterialException.putinExceptionList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.putInMaterialException.putMaterialException.putinExceptionList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name="'+WOM.putInMaterialException.putMaterialException.putinExceptionList._prefix + '.' + WOM.putInMaterialException.putMaterialException.putinExceptionList._suffix +'"]').val(obj[0][WOM.putInMaterialException.putMaterialException.putinExceptionList._suffix]);
		CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name="'+WOM.putInMaterialException.putMaterialException.putinExceptionList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name^="'+WOM.putInMaterialException.putMaterialException.putinExceptionList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name="'+WOM.putInMaterialException.putMaterialException.putinExceptionList._prefix + '.' + WOM.putInMaterialException.putMaterialException.putinExceptionList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.putInMaterialException.putMaterialException.putinExceptionList._dialog) {
			WOM.putInMaterialException.putMaterialException.putinExceptionList._dialog.close();
		}
	};
	
	WOM.putInMaterialException.putMaterialException.putinExceptionList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.putInMaterialException.putMaterialException.putinExceptionList.query_"+obj+")!='undefined'") ? eval('WOM.putInMaterialException.putMaterialException.putinExceptionList.query_'+obj+'()') : null;
		return str;
	
	};
	
WOM.putInMaterialException.putMaterialException.putinExceptionList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=WOM_7.5.0.0_putInMaterialException&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	WOM.putInMaterialException.putMaterialException.putinExceptionList.rowDblClickQuery = function(event,row){
		WOM.putInMaterialException.putMaterialException.putinExceptionList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
WOM_putInMaterialException_putMaterialException_putinExceptionList_refresh = function(node){
WOM.putInMaterialException.putMaterialException.putinExceptionList.node = node;
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
	WOM.putInMaterialException.putMaterialException.putinExceptionList.query("query");
}

WOM_putInMaterialException_putMaterialException_putinExceptionList_getList = function() {
	return "WOM.putInMaterialException.putMaterialException.putinExceptionList";
}
WOM.putInMaterialException.putMaterialException.putinExceptionList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_putInMaterialException_putMaterialException_putinExceptionListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.putInMaterialException.putMaterialException.putinExceptionList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.putInMaterialException.putMaterialException.putinExceptionList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_putInMaterialException_putMaterialException_putinExceptionList_fileupload_button",
		handler:function(){
				list_operate_putInMaterialException_putinExceptionList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.putInMaterialException.putMaterialException.putinExceptionList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_putInMaterialException_putinExceptionList.WOM.putInMaterialException.putMaterialException." + params.viewName + ".referenceCopy");
			funcName('putMaterialException', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.putInMaterialException.putMaterialException.putinExceptionList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_putInMaterialException_putinExceptionList.WOM.putInMaterialException.putMaterialException." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.putInMaterialException.putMaterialException.putinExceptionList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_putInMaterialException_putinExceptionList.WOM.putInMaterialException.putMaterialException." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	/**
	 * 显示增加对话框
	 * @method WOM.putInMaterialException.putMaterialException.putinExceptionList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.putInMaterialException.putMaterialException.putinExceptionList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.putInMaterialException.putMaterialException.putinExceptionList.otherParams || {};
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
							<#assign linkview = getViewByCode('WOM_7.5.0.0_putInMaterial_putinView')>
							<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
							if(viewCode=='${linkview.code}'||!viewCode){
							<#list linkview.extraView.configMap.layout.sections as buttonSection>
							<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
							<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
							<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
								|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
								buttons.push({
									name:"${getText(operateBtn.namekey!)}",
									align:"${operateBtn.buttonAlign!'left'}",
									handler:function(){
										<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
										<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
										<#assign funcname = funcname?split('=')[1]>
										list_operate_putInMaterialException_putinExceptionList.${funcname};
										</#if>
									}
								});
							</#if>
							</#if>
							</#list>
							</#if>
							</#list>
							}
							</#if>
			
			
			
					if(viewCode=='WOM_7.5.0.0_putInMaterialException_putinExceptionView'||!viewCode){
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
					list_operate_putInMaterialException_putinExceptionList.CUI('#'+formId).submit();
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
		if ( WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg ) {
			WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg._config.url = url;
			WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg._config.formId = formId;
			WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg.setTitle( title )
			WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg.setButtonbar( buttons );
		}else{
			WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_putInMaterialException_putinExceptionList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_putInMaterialException_putMaterialException', element : $('#WOM_putInMaterialException_putMaterialException_putinExceptionList_fileupload_button a:eq(1)')});
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.putInMaterialException.putMaterialException.putinExceptionList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.putInMaterialException.putMaterialException.putinExceptionList.approvalDialog = function(url,formId,title,width,height) {
		WOM.putInMaterialException.putMaterialException.putinExceptionList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.putInMaterialException.putMaterialException.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.putInMaterialException.putMaterialException.putinExceptionList.AppDlg.show();
	};

	WOM.putInMaterialException.putMaterialException.putinExceptionList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.putInMaterialException.putMaterialException.putinExceptionList.beforeCommonQuery === 'function') {
	   		var ret = WOM.putInMaterialException.putMaterialException.putinExceptionList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.putInMaterialException.putMaterialException.putinExceptionList.cancelSelectedNode == 'function') {
	   WOM.putInMaterialException.putMaterialException.putinExceptionList.cancelSelectedNode();
	   WOM.putInMaterialException.putMaterialException.putinExceptionList.node = null;
	  }
	  if(typeof WOM_putInMaterialException_putMaterialException_putinExceptionList_cancelSelectedNode == 'function') {
	   WOM_putInMaterialException_putMaterialException_putinExceptionList_cancelSelectedNode();
	   WOM.putInMaterialException.putMaterialException.putinExceptionList.node = null;
	  }
	  WOM.putInMaterialException.putMaterialException.putinExceptionList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.putInMaterialException.putMaterialException.putinExceptionList.query
	 */
	WOM.putInMaterialException.putMaterialException.putinExceptionList.query = function(type,pageNo,sortFlag){
		var node = WOM.putInMaterialException.putMaterialException.putinExceptionList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.putInMaterialException.putMaterialException.putinExceptionList.node = null;
		if(!checkListValid("ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query._sortKey && datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query._sortMethod){
			CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query._sortKey);
			CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm #dataTableSortColName').val(datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query._sortColumnName);
			CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query._sortMethod);
		}else{
			datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query._sortKey = '';
			CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.get('dblclick') && datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.get('dblclick').length > 0) {
				datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.putInMaterialException.putMaterialException.putinExceptionList.rowDblClick'
		            });
			}
	        datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.putInMaterialException.putMaterialException.putinExceptionList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.get('dblclick') && datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.get('dblclick').length > 0) {
		    	datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.putInMaterialException.putMaterialException.putinExceptionList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.putInMaterialException.putMaterialException.putinExceptionList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.putInMaterialException.putMaterialException.putinExceptionList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/putInMaterialException/putMaterialException/putinExceptionList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/putInMaterialException/putMaterialException/putinExceptionList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_putInMaterialException_putinExceptionList";
		condobj.modelAlias="putMaterialException";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name="'+ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query_PageLink_PageCount"]').val();
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
			dataPost += "&pending-beginDate=${pendingBeginDate!''}";
			dataPost += "&pending-endDate=${pendingEndDate!''}";
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
			permissionCode = 'WOM_7.5.0.0_putInMaterialException_putinExceptionList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.putInMaterialException.putMaterialException.putinExceptionList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_putInMaterialException";
		openExportFrame(url);
	}
WOM.putInMaterialException.putMaterialException.putinExceptionList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.putInMaterialException.putMaterialException.putinExceptionList.otherParams = {};
	WOM.putInMaterialException.putMaterialException.putinExceptionList.otherParams.dialogType = dialogType;
	WOM.putInMaterialException.putMaterialException.putinExceptionList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.putInMaterialException.putMaterialException.putinExceptionList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.putInMaterialException.putMaterialException.editCallBackInfo
 */
WOM.putInMaterialException.putMaterialException.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_putInMaterialException_putMaterialException_putinExceptionList_getLayout == "function"){
    		var layout = WOM_putInMaterialException_putMaterialException_putinExceptionList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.putInMaterialException.putMaterialException.putinExceptionList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryWidget._sortKey && ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_putInMaterialException_PutMaterialException'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryWidget._sortKey && ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryWidget._sortKey && ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_putInMaterialException_putMaterialException_putinExceptionList_getLayout == "function"){
			var layout = WOM_putInMaterialException_putMaterialException_putinExceptionList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.putInMaterialException.putMaterialException.putinExceptionList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.putInMaterialException.putMaterialException.putinExceptionList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.putInMaterialException.putMaterialException.putinExceptionList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_putInMaterialException_PutMaterialException'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.putInMaterialException.putMaterialException.putinExceptionList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.putInMaterialException.putMaterialException.putinExceptionList.query('pending');
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
})(jQuery);
function replace(str,symbol){
	var arr = str.split(symbol);
	var s1 = "";
	var len = arr.length;
	for(i=0;i<len;i++){
		if(i%2!=0){
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i]+"</br>";
			}
		}else{
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i]+symbol;
			}
		}
	}
	return s1;	
}
/**
 * 批量处理事件
 * 
 */
WOM.putInMaterialException.putMaterialException.putinExceptionList.approval=function(obj){
	var selectrows = datatable_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query.selectedRows;
	selectrows=selectrows.sort(sortLineInTabOrder);//按表单顺序重新排序
	var atn = "";
	var deploymentId = "";
	var processid="";
	var ids = ""; //application ID
	var pendingIds = ""; //待办ID
	var activityType = "";
	var des = "";
	var alertContent="<div style='margin-right:10px;padding:5px;height:245px;overflow:auto;line-height:20px'><p style='font-weight:bold'>${getHtmlText('ec.list.batch.failed')}</p>";//提示内容
	var nopending="";//无待办
	var noflag="";//未启用批量
	var others="";//其他
	var flag = true;
	var outcomeStr = "";//路由信息 ||activeType（活动类型），outcome（路由code），dec（路由描述），assignUser（指定人员的用户ids）;activeType，outcome，dec，assignUser||activeType，outcome，dec，assignUser;activeType，outcome，dec，assignUser
	var isHandOut = "";//挂起
	var isEffective = "";//生效
	var notSingleTask = false; // 单据状态不唯一
	if(selectrows!=null&&selectrows.length>0){
		var map={};
		processid=selectrows[0].pending.processId;
		var isdeploy = false;
		$.each(selectrows,function(i,st){
			var no = st.tableNo;
			var status = st.status;
			if(status=="77"){
				isHandOut = status;
				return false;
			}
			if(st.pending==null||st.pending==undefined||st.pending.id==null||st.pending.id==undefined||st.pending.bulkDealFlag==null||st.pending.bulkDealFlag==undefined){
				if(nopending==""){
					nopending=no;
				}else{
					nopending=nopending+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if (st.pending.taskDescription) {
				var length = st.pending.taskDescription.split(",").length;
				if(length > 1){
					notSingleTask = true;
					return false;
				}
			}
			if(st.pending.bulkDealFlag==false){
				if(noflag==""){
					noflag=no;
				}else{
					noflag=noflag+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if(deploymentId==""){
					deploymentId = st.pending.deploymentId;
					if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
						if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
						}else{
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
						}
					}
			}
			if(atn==""){
				atn = st.pending.activityName;
				des = st.pending.taskDescription;
				des = encodeURI(des);
				des = encodeURI(des);
			}
			if(st.pending.deploymentId!=deploymentId){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				isdeploy = true;
			}else if(st.pending.activityName!=atn){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				
			}
			if(activityType==""){
				activityType = st.pending.activityType;
			}
			if(flag){
				if(ids==""){
					ids = st.id;
				}else{
					ids=ids+","+st.id;
				}
				if(pendingIds==""){
					pendingIds = st.pending.id;
				}else{
					pendingIds=pendingIds+","+st.pending.id;
				}
			}
		});
		if(isHandOut=="77"){
			CUI.Dialog.alert("所选记录中包含已被挂起的流程，无法处理！");
			return false;
		}
		if (notSingleTask) {
			CUI.Dialog.alert("${getHtmlText('ec.list.batch.notSingleTask')}");
			return false;
		}
		if(!flag){
			if(nopending!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.billHasNoPending')}</p>"+replace(nopending,"${getHtmlText('ec.list.batch.semicolon')}");
				if(noflag!=""){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>3.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
				}else if(isdeploy){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
					$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
					});
				}
			}else if(noflag!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
			}else if(isdeploy){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.inconsistent')}</p>";
				$.each(map,function(key,value){
					alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
				});
			}
			alertContent =alertContent+"</div>"
			CUI.Dialog.alert(alertContent, null, null,300,500);
			return false;
		}
	}else{
		CUI.Dialog.alert("${getHtmlText('ec.list.selectLeastOne')}");
		flag = false;
		return false;
	}
	if(flag){
		var url="/WOM/putInMaterialException/putMaterialException/approval.action?processId="+processid+"&activityName="+atn+"&pendingIds="+pendingIds+"&deploymentId="+deploymentId+"&ids="+ids+"&activityType="+activityType+"&des="+des+"";
		var formid="WOM_putInMaterialException_putMaterialException_approval_form";
		var title="${getText('ec.list.batchApproval')}";
		var width=500;
		var height=300;
		WOM.putInMaterialException.putMaterialException.putinExceptionList.approvalDialog(url,formid,title,width,height);
	}
}
/*bug#496:重新对选择行进行排序，使选择的行顺序按照表单顺序，而非选择操作的顺序*/
function sortLineInTabOrder(a,b){
    var value1 = $(a.rowHtmlObj).index();
    var value2 = $(b.rowHtmlObj).index();
    return value1 - value2;
}
	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_putInMaterialException_putinExceptionList,js,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_putInMaterialException_putinExceptionList' idprefix='ec_WOM_putInMaterialException_putMaterialException_putinExceptionList' queryUrl='/WOM/putInMaterialException/putMaterialException/putinExceptionList-query.action' queryFunc="WOM.putInMaterialException.putMaterialException.putinExceptionList.query" ns="WOM.putInMaterialException.putMaterialException.putinExceptionList" />
<@exportexcel action="/WOM/putInMaterialException/putMaterialException/putinExceptionList-query.action"   getRequireDataAction="/WOM/putInMaterialException/putMaterialException/putinExceptionList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_putInMaterialException_PutMaterialException&&viewCode=WOM_7.5.0.0_putInMaterialException_putinExceptionList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_putInMaterialException_putinExceptionList')}" prefix="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query" modelCode="WOM_7.5.0.0_putInMaterialException_PutMaterialException"  importFlag="false" viewCode="WOM_7.5.0.0_putInMaterialException_putinExceptionList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
