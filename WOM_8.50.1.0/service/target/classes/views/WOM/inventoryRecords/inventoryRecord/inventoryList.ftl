<!-- WOM_7.5.0.0/inventoryRecords/inventoryList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1566888749846')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_inventoryRecords_inventoryList,head,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.inventoryRecords.inventoryRecord','WOM.inventoryRecords.inventoryRecord.inventoryList');
</script>
<@frameset id="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_container" border=0>
	<@frame id="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "inventoryList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_inventoryRecords_inventoryList,html,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.inventoryRecords.inventoryRecord.inventoryList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.inventoryRecords.inventoryRecord.inventoryList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.inventoryRecords.inventoryRecord.inventoryList._prefix += '.';
			}
			WOM.inventoryRecords.inventoryRecord.inventoryList._prefix += arr[i];
		}
		WOM.inventoryRecords.inventoryRecord.inventoryList._suffix = arr[arr.length -1];
		if(WOM.inventoryRecords.inventoryRecord.inventoryList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.inventoryRecords.inventoryRecord.inventoryList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.inventoryRecords.inventoryRecord.inventoryList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.inventoryRecords.inventoryRecord.inventoryList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.inventoryRecords.inventoryRecord.inventoryList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name="'+WOM.inventoryRecords.inventoryRecord.inventoryList._prefix + '.' + WOM.inventoryRecords.inventoryRecord.inventoryList._suffix +'"]').val(obj[0][WOM.inventoryRecords.inventoryRecord.inventoryList._suffix]);
		CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name="'+WOM.inventoryRecords.inventoryRecord.inventoryList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name^="'+WOM.inventoryRecords.inventoryRecord.inventoryList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name="'+WOM.inventoryRecords.inventoryRecord.inventoryList._prefix + '.' + WOM.inventoryRecords.inventoryRecord.inventoryList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.inventoryRecords.inventoryRecord.inventoryList._dialog) {
			WOM.inventoryRecords.inventoryRecord.inventoryList._dialog.close();
		}
	};
	
	WOM.inventoryRecords.inventoryRecord.inventoryList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.inventoryRecords.inventoryRecord.inventoryList.query_"+obj+")!='undefined'") ? eval('WOM.inventoryRecords.inventoryRecord.inventoryList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_inventoryRecords_inventoryRecord_inventoryList_refresh = function(node){
WOM.inventoryRecords.inventoryRecord.inventoryList.node = node;
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
	WOM.inventoryRecords.inventoryRecord.inventoryList.query("query");
}

WOM_inventoryRecords_inventoryRecord_inventoryList_getList = function() {
	return "WOM.inventoryRecords.inventoryRecord.inventoryList";
}
WOM.inventoryRecords.inventoryRecord.inventoryList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_inventoryRecords_inventoryRecord_inventoryListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.inventoryRecords.inventoryRecord.inventoryList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.inventoryRecords.inventoryRecord.inventoryList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_inventoryRecords_inventoryRecord_inventoryList_fileupload_button",
		handler:function(){
				list_operate_inventoryRecords_inventoryList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.inventoryRecords.inventoryRecord.inventoryList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_inventoryRecords_inventoryList.WOM.inventoryRecords.inventoryRecord." + params.viewName + ".referenceCopy");
			funcName('inventoryRecord', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.inventoryRecords.inventoryRecord.inventoryList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_inventoryRecords_inventoryList.WOM.inventoryRecords.inventoryRecord." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.inventoryRecords.inventoryRecord.inventoryList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_inventoryRecords_inventoryList.WOM.inventoryRecords.inventoryRecord." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function inButton(event){ 
							
    var rows = ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget.getSelectedRow();
    if(rows.length == 0) {
      workbenchErrorBarWidget.showMessage('请选择行进行该操作','f');
      return;
    }
    var row = rows[0];
    console.info(row);
    if(row.inFlag) {
      workbenchErrorBarWidget.showMessage('物料已入库，请勿重复操作', 'f');
      return;
    }
    $.ajax({
      async: false,
      url: "/WOM/inventoryRecords/inventoryRecord/flat.action?operateFlag=1&recordId=" + row.id,
      type: "POST",
      dataType: "json",
      success: function(result) {
        if(result.flag == 'false') {
          workbenchErrorBarWidget.showMessage(result.message,'f');
        }
        WOM.inventoryRecords.inventoryRecord.inventoryList.commonQuery('query')
      }
    });
  
				};
				function outButton(event){ 
							
  var rows = ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget.getSelectedRow();
  if(rows.length == 0) {
    workbenchErrorBarWidget.showMessage('请选择行进行该操作','f');
    return;
  }
  var row = rows[0];
  if(row.outFlag) {
    workbenchErrorBarWidget.showMessage('物料已出库，请勿重复操作', 'f');
    return;
  }
  if(!row.inFlag) {
    workbenchErrorBarWidget.showMessage('物料未入库，请先执行入库操作', 'f');
    return;
  }
  $.ajax({
    async: false,
    url: "/WOM/inventoryRecords/inventoryRecord/flat.action?operateFlag=0&recordId=" + row.id,
    type: "POST",
    dataType: "json",
    success: function(result) {
      if(result.flag == 'false') {
        workbenchErrorBarWidget.showMessage(result.message,'f')
      }
      WOM.inventoryRecords.inventoryRecord.inventoryList.commonQuery('query')
    }
  });

				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.inventoryRecords.inventoryRecord.callBackInfo
	 */
	WOM.inventoryRecords.inventoryRecord.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_inventoryRecords_inventoryRecord_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.inventoryRecords.inventoryRecord.inventoryList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.inventoryRecords.inventoryRecord.inventoryList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.inventoryRecords.inventoryRecord.inventoryList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.inventoryRecords.inventoryRecord.inventoryList.checkSelectedValid = function(type) {
		if(WOM.inventoryRecords.inventoryRecord.inventoryList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows[i].valid === false){
						CUI.Dialog.alert("${getText('ec.common.checkvalidfordelete')}");
						return false;
					}
				}
			}
		}else{
			return false;
		}
		return true;
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method WOM.inventoryRecords.inventoryRecord.inventoryList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.inventoryRecords.inventoryRecord.inventoryList.checkSelectedAny = function() {
		if(datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.inventoryRecords.inventoryRecord.inventoryList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.inventoryRecords.inventoryRecord.inventoryList.checkSelectedMore = function() {
		if(datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	WOM.inventoryRecords.inventoryRecord.inventoryList.dbClickViewinventoryList =  function showDetail(event,row){
  window.open ('/WOM/inventoryRecords/inventoryRecord/itemView.action?entityCode=WOM_7.5.0.0_inventoryRecords&id=' + row.id);
};	/**
	 * 显示增加对话框
	 * @method WOM.inventoryRecords.inventoryRecord.inventoryList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.inventoryRecords.inventoryRecord.inventoryList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.inventoryRecords.inventoryRecord.inventoryList.otherParams || {};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_inventoryRecords_itemView'||!viewCode){
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
					list_operate_inventoryRecords_inventoryList.CUI('#'+formId).submit();
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
		if ( WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg ) {
			WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg._config.url = url;
			WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg._config.formId = formId;
			WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg.setTitle( title )
			WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg.setButtonbar( buttons );
		}else{
			WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_inventoryRecords_inventoryList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.inventoryRecords.inventoryRecord.inventoryList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_inventoryRecords_inventoryRecord', element : $('#WOM_inventoryRecords_inventoryRecord_inventoryList_fileupload_button a:eq(1)')});
		}
		WOM.inventoryRecords.inventoryRecord.inventoryList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.inventoryRecords.inventoryRecord.inventoryList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.inventoryRecords.inventoryRecord.inventoryList.approvalDialog = function(url,formId,title,width,height) {
		WOM.inventoryRecords.inventoryRecord.inventoryList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.inventoryRecords.inventoryRecord.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.inventoryRecords.inventoryRecord.inventoryList.AppDlg.show();
	};

	WOM.inventoryRecords.inventoryRecord.inventoryList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.inventoryRecords.inventoryRecord.inventoryList.beforeCommonQuery === 'function') {
	   		var ret = WOM.inventoryRecords.inventoryRecord.inventoryList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.inventoryRecords.inventoryRecord.inventoryList.cancelSelectedNode == 'function') {
	   WOM.inventoryRecords.inventoryRecord.inventoryList.cancelSelectedNode();
	   WOM.inventoryRecords.inventoryRecord.inventoryList.node = null;
	  }
	  if(typeof WOM_inventoryRecords_inventoryRecord_inventoryList_cancelSelectedNode == 'function') {
	   WOM_inventoryRecords_inventoryRecord_inventoryList_cancelSelectedNode();
	   WOM.inventoryRecords.inventoryRecord.inventoryList.node = null;
	  }
	  WOM.inventoryRecords.inventoryRecord.inventoryList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.inventoryRecords.inventoryRecord.inventoryList.query
	 */
	WOM.inventoryRecords.inventoryRecord.inventoryList.query = function(type,pageNo,sortFlag){
		var node = WOM.inventoryRecords.inventoryRecord.inventoryList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.inventoryRecords.inventoryRecord.inventoryList.node = null;
		if(!checkListValid("ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query._sortKey && datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query._sortMethod){
			CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query._sortKey);
			CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm #dataTableSortColName').val(datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query._sortColumnName);
			CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query._sortMethod);
		}else{
			datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query._sortKey = '';
			CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.inventoryRecords.inventoryRecord.inventoryList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/inventoryRecords/inventoryRecord/inventoryList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/inventoryRecords/inventoryRecord/inventoryList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_inventoryRecords_inventoryList";
		condobj.modelAlias="inventoryRecord";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name="'+ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_inventoryRecords_inventoryList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.inventoryRecords.inventoryRecord.inventoryList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_inventoryRecords";
		openExportFrame(url);
	}
WOM.inventoryRecords.inventoryRecord.inventoryList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.inventoryRecords.inventoryRecord.inventoryList.otherParams = {};
	WOM.inventoryRecords.inventoryRecord.inventoryList.otherParams.dialogType = dialogType;
	WOM.inventoryRecords.inventoryRecord.inventoryList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.inventoryRecords.inventoryRecord.inventoryList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.inventoryRecords.inventoryRecord.editCallBackInfo
 */
WOM.inventoryRecords.inventoryRecord.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_inventoryRecords_inventoryRecord_inventoryList_getLayout == "function"){
    		var layout = WOM_inventoryRecords_inventoryRecord_inventoryList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.inventoryRecords.inventoryRecord.inventoryList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget._sortKey && ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_inventoryRecords_InventoryRecord'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget._sortKey && ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget._sortKey && ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_inventoryRecords_inventoryRecord_inventoryList_getLayout == "function"){
			var layout = WOM_inventoryRecords_inventoryRecord_inventoryList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.inventoryRecords.inventoryRecord.inventoryList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.inventoryRecords.inventoryRecord.inventoryList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.inventoryRecords.inventoryRecord.inventoryList.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_inventoryRecords_InventoryRecord'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.inventoryRecords.inventoryRecord.inventoryList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.inventoryRecords.inventoryRecord.inventoryList.query('query');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="inventoryDate_start"]').val()!= null && $('#' + formId + ' input[name^="inventoryDate_start"]').val()!= ''){if(!isDate($('#' + formId + ' input[name^="inventoryDate_start"]').val()+"-01")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1566888295198')}${getText('ec.list.validate.date')}");return false;}}if($('#' + formId + ' input[name^="inventoryDate_end"]').val()!= null && $('#' + formId + ' input[name^="inventoryDate_end"]').val()!= ''){if(!isDate($('#' + formId + ' input[name^="inventoryDate_end"]').val()+"-01")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1566888295198')}${getText('ec.list.validate.date')}");return false;}}if($('#' + formId + ' input[name="inventoryDate_start"]').val()!='' && $('#' + formId + ' input[name="inventoryDate_end"]').val()!=''){if($('#' + formId + ' input[name="inventoryDate_start"]').val() > $('#' + formId + ' input[name="inventoryDate_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1566888295198')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1566888295198')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_inventoryRecords_inventoryList,js,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_inventoryRecords_inventoryList' idprefix='ec_WOM_inventoryRecords_inventoryRecord_inventoryList' queryUrl='/WOM/inventoryRecords/inventoryRecord/inventoryList-query.action' queryFunc="WOM.inventoryRecords.inventoryRecord.inventoryList.query" ns="WOM.inventoryRecords.inventoryRecord.inventoryList" />
<@exportexcel action="/WOM/inventoryRecords/inventoryRecord/inventoryList-query.action"   getRequireDataAction="/WOM/inventoryRecords/inventoryRecord/inventoryList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_inventoryRecords_InventoryRecord&&viewCode=WOM_7.5.0.0_inventoryRecords_inventoryList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_inventoryRecords_inventoryList')}" prefix="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query" modelCode="WOM_7.5.0.0_inventoryRecords_InventoryRecord"  importFlag="false" viewCode="WOM_7.5.0.0_inventoryRecords_inventoryList" />
