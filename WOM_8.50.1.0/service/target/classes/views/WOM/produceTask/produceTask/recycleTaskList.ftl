<!-- WOM_7.5.0.0/produceTask/recycleTaskList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1505285685788')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceTask_recycleTaskList,head,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("WOM.produceTask.produceTask","WOM.produceTask.produceTask.recycleTaskList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_WOM_produceTask_produceTask_recycleTaskList_container" border=0>
	<@frame id="ec_WOM_produceTask_produceTask_recycleTaskList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "recycleTaskList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceTask_recycleTaskList,html,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_WOM_produceTask_produceTask_recycleTaskList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=WOM_7.5.0.0_produceTask';
		openFullScreen(url);
	};
	
	WOM.produceTask.produceTask.recycleTaskList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.produceTask.produceTask.recycleTaskList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.produceTask.produceTask.recycleTaskList._prefix += '.';
			}
			WOM.produceTask.produceTask.recycleTaskList._prefix += arr[i];
		}
		WOM.produceTask.produceTask.recycleTaskList._suffix = arr[arr.length -1];
		if(WOM.produceTask.produceTask.recycleTaskList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.recycleTaskList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.produceTask.produceTask.recycleTaskList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.produceTask.produceTask.recycleTaskList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.produceTask.produceTask.recycleTaskList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name="'+WOM.produceTask.produceTask.recycleTaskList._prefix + '.' + WOM.produceTask.produceTask.recycleTaskList._suffix +'"]').val(obj[0][WOM.produceTask.produceTask.recycleTaskList._suffix]);
		CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name="'+WOM.produceTask.produceTask.recycleTaskList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name^="'+WOM.produceTask.produceTask.recycleTaskList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name="'+WOM.produceTask.produceTask.recycleTaskList._prefix + '.' + WOM.produceTask.produceTask.recycleTaskList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.produceTask.produceTask.recycleTaskList._dialog) {
			WOM.produceTask.produceTask.recycleTaskList._dialog.close();
		}
	};
	
	WOM.produceTask.produceTask.recycleTaskList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceTask.produceTask.recycleTaskList.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTask.recycleTaskList.query_'+obj+'()') : null;
		return str;
	
	};
	
WOM.produceTask.produceTask.recycleTaskList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=WOM_7.5.0.0_produceTask&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	WOM.produceTask.produceTask.recycleTaskList.rowDblClickQuery = function(event,row){
		WOM.produceTask.produceTask.recycleTaskList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
WOM_produceTask_produceTask_recycleTaskList_refresh = function(node){
WOM.produceTask.produceTask.recycleTaskList.node = node;
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
	WOM.produceTask.produceTask.recycleTaskList.query("query");
}

WOM_produceTask_produceTask_recycleTaskList_getList = function() {
	return "WOM.produceTask.produceTask.recycleTaskList";
}
WOM.produceTask.produceTask.recycleTaskList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_produceTask_produceTask_recycleTaskListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.produceTask.produceTask.recycleTaskList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.produceTask.produceTask.recycleTaskList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_produceTask_produceTask_recycleTaskList_fileupload_button",
		handler:function(){
				list_operate_produceTask_recycleTaskList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.produceTask.produceTask.recycleTaskList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceTask_recycleTaskList.WOM.produceTask.produceTask." + params.viewName + ".referenceCopy");
			funcName('produceTask', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.produceTask.produceTask.recycleTaskList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceTask_recycleTaskList.WOM.produceTask.produceTask." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.produceTask.produceTask.recycleTaskList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceTask_recycleTaskList.WOM.produceTask.produceTask." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function endTask(){ 
						CUI.Dialog.confirm("${getText('WOM.confirmcontent.radion1503985282818')}", function(){
							
	if(WOM.produceTask.produceTask.makeTaskList.checkSelectedAny()){
		if(WOM.produceTask.produceTask.makeTaskList.checkSelectedMore()){
			if(ec_WOM_produceTask_produceTask_makeTaskList_queryWidget.getSelectedRow()[0].taskState.id=='womTaskState/04'){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000044')}")
				return false;
			}
			if(ec_WOM_produceTask_produceTask_makeTaskList_queryWidget.getSelectedRow()[0].status !=99){
				workbenchErrorBarWidget.showMessage("${getText('WOM.zldysxwfzz112233')}")
				return false;
			}	
			$.ajax({
				url : "/WOM/generalManage/produceTaskManage/taskEnd.action",
				type : 'post',
				traditional: true,
				async : false,
				data:{"produceTaskId":ec_WOM_produceTask_produceTask_makeTaskList_queryWidget.getSelectedRow()[0].id},
				success : function(res) {
					if(res.dealSuccessFlag==true){
						WOM.produceTask.produceTask.makeTaskList.query("query");
					}
				}
			});
		}
	}

						});
				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.produceTask.produceTask.callBackInfo
	 */
	WOM.produceTask.produceTask.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_produceTask_produceTask_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.produceTask.produceTask.recycleTaskList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.produceTask.produceTask.recycleTaskList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.produceTask.produceTask.recycleTaskList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.produceTask.produceTask.recycleTaskList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.produceTask.produceTask.recycleTaskList.checkSelectedValid = function(type) {
		if(WOM.produceTask.produceTask.recycleTaskList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows[i].valid === false){
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
	 * @method WOM.produceTask.produceTask.recycleTaskList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.produceTask.produceTask.recycleTaskList.checkSelectedAny = function() {
		if(datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.produceTask.produceTask.recycleTaskList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.produceTask.produceTask.recycleTaskList.checkSelectedMore = function() {
		if(datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.produceTask.produceTask.recycleTaskList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.produceTask.produceTask.recycleTaskList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.produceTask.produceTask.recycleTaskList.otherParams || {};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_produceTask_makeTaskOperaView'||!viewCode){
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
					list_operate_produceTask_recycleTaskList.CUI('#'+formId).submit();
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
		if ( WOM.produceTask.produceTask.recycleTaskList.Dlg ) {
			WOM.produceTask.produceTask.recycleTaskList.Dlg._config.url = url;
			WOM.produceTask.produceTask.recycleTaskList.Dlg._config.formId = formId;
			WOM.produceTask.produceTask.recycleTaskList.Dlg.setTitle( title )
			WOM.produceTask.produceTask.recycleTaskList.Dlg.setButtonbar( buttons );
		}else{
			WOM.produceTask.produceTask.recycleTaskList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_produceTask_recycleTaskList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.produceTask.produceTask.recycleTaskList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.produceTask.produceTask.recycleTaskList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_produceTask_produceTask', element : $('#WOM_produceTask_produceTask_recycleTaskList_fileupload_button a:eq(1)')});
		}
		WOM.produceTask.produceTask.recycleTaskList.otherParams = {};
	};

	WOM.produceTask.produceTask.recycleTaskList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.produceTask.produceTask.recycleTaskList.beforeCommonQuery === 'function') {
	   		var ret = WOM.produceTask.produceTask.recycleTaskList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.produceTask.produceTask.recycleTaskList.cancelSelectedNode == 'function') {
	   WOM.produceTask.produceTask.recycleTaskList.cancelSelectedNode();
	   WOM.produceTask.produceTask.recycleTaskList.node = null;
	  }
	  if(typeof WOM_produceTask_produceTask_recycleTaskList_cancelSelectedNode == 'function') {
	   WOM_produceTask_produceTask_recycleTaskList_cancelSelectedNode();
	   WOM.produceTask.produceTask.recycleTaskList.node = null;
	  }
	  WOM.produceTask.produceTask.recycleTaskList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.produceTask.produceTask.recycleTaskList.query
	 */
	WOM.produceTask.produceTask.recycleTaskList.query = function(type,pageNo,sortFlag){
		var node = WOM.produceTask.produceTask.recycleTaskList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.produceTask.produceTask.recycleTaskList.node = null;
		if(!checkListValid("ec_WOM_produceTask_produceTask_recycleTaskList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query._sortKey && datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query._sortMethod){
			CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query._sortKey);
			CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm #dataTableSortColName').val(datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query._sortColumnName);
			CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query._sortMethod);
		}else{
			datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query._sortKey = '';
			CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.get('dblclick') && datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.get('dblclick').length > 0) {
				datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.produceTask.produceTask.recycleTaskList.rowDblClick'
		            });
			}
	        datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.produceTask.produceTask.recycleTaskList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.get('dblclick') && datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.get('dblclick').length > 0) {
		    	datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.produceTask.produceTask.recycleTaskList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.produceTask.produceTask.recycleTaskList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.produceTask.produceTask.recycleTaskList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/produceTask/produceTask/recycleTaskList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/produceTask/produceTask/recycleTaskList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_produceTask_recycleTaskList";
		condobj.modelAlias="produceTask";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name="'+ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_produceTask_produceTask_recycleTaskList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_produceTask_produceTask_recycleTaskList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_produceTask_produceTask_recycleTaskList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_produceTask_recycleTaskList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.produceTask.produceTask.recycleTaskList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_produceTask";
		openExportFrame(url);
	}
WOM.produceTask.produceTask.recycleTaskList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.produceTask.produceTask.recycleTaskList.otherParams = {};
	WOM.produceTask.produceTask.recycleTaskList.otherParams.dialogType = dialogType;
	WOM.produceTask.produceTask.recycleTaskList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.produceTask.produceTask.recycleTaskList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.produceTask.produceTask.editCallBackInfo
 */
WOM.produceTask.produceTask.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_produceTask_produceTask_recycleTaskList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_produceTask_produceTask_recycleTaskList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_produceTask_produceTask_recycleTaskList_getLayout == "function"){
    		var layout = WOM_produceTask_produceTask_recycleTaskList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.produceTask.produceTask.recycleTaskList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceTask_produceTask_recycleTaskList_queryWidget._sortKey && ec_WOM_produceTask_produceTask_recycleTaskList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_produceTask_ProduceTask'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceTask_produceTask_recycleTaskList_queryWidget._sortKey && ec_WOM_produceTask_produceTask_recycleTaskList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_produceTask_produceTask_recycleTaskList_queryWidget._sortKey && ec_WOM_produceTask_produceTask_recycleTaskList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_produceTask_produceTask_recycleTaskList_getLayout == "function"){
			var layout = WOM_produceTask_produceTask_recycleTaskList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.produceTask.produceTask.recycleTaskList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.produceTask.produceTask.recycleTaskList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.produceTask.produceTask.recycleTaskList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_produceTask_ProduceTask'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.produceTask.produceTask.recycleTaskList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.produceTask.produceTask.recycleTaskList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="planStartTime_start"]').val()!= null && $('#' + formId + ' input[name^="planStartTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planStartTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="planStartTime_end"]').val()!= null && $('#' + formId + ' input[name^="planStartTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planStartTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="planEndTime_start"]').val()!= null && $('#' + formId + ' input[name^="planEndTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planEndTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="planEndTime_end"]').val()!= null && $('#' + formId + ' input[name^="planEndTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planEndTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="actStartTime_start"]').val()!= null && $('#' + formId + ' input[name^="actStartTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="actStartTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669554931')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="actStartTime_end"]').val()!= null && $('#' + formId + ' input[name^="actStartTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="actStartTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669554931')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="actEndTime_start"]').val()!= null && $('#' + formId + ' input[name^="actEndTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="actEndTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669589966')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="actEndTime_end"]').val()!= null && $('#' + formId + ' input[name^="actEndTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="actEndTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669589966')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="actEndTime_start"]').val()!='' && $('#' + formId + ' input[name="actEndTime_end"]').val()!=''){if($('#' + formId + ' input[name="actEndTime_start"]').val() > $('#' + formId + ' input[name="actEndTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669589966')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489669589966')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="planStartTime_start"]').val()!='' && $('#' + formId + ' input[name="planStartTime_end"]').val()!=''){if($('#' + formId + ' input[name="planStartTime_start"]').val() > $('#' + formId + ' input[name="planStartTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="actStartTime_start"]').val()!='' && $('#' + formId + ' input[name="actStartTime_end"]').val()!=''){if($('#' + formId + ' input[name="actStartTime_start"]').val() > $('#' + formId + ' input[name="actStartTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669554931')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489669554931')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="planEndTime_start"]').val()!='' && $('#' + formId + ' input[name="planEndTime_end"]').val()!=''){if($('#' + formId + ' input[name="planEndTime_start"]').val() > $('#' + formId + ' input[name="planEndTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.start')}");return false;}}return true;};



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
	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceTask_recycleTaskList,js,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_produceTask_recycleTaskList' idprefix='ec_WOM_produceTask_produceTask_recycleTaskList' queryUrl='/WOM/produceTask/produceTask/recycleTaskList-query.action' queryFunc="WOM.produceTask.produceTask.recycleTaskList.query" ns="WOM.produceTask.produceTask.recycleTaskList" />
<@exportexcel action="/WOM/produceTask/produceTask/recycleTaskList-query.action"   getRequireDataAction="/WOM/produceTask/produceTask/recycleTaskList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_produceTask_ProduceTask&&viewCode=WOM_7.5.0.0_produceTask_recycleTaskList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_produceTask_recycleTaskList')}" prefix="ec_WOM_produceTask_produceTask_recycleTaskList_query" modelCode="WOM_7.5.0.0_produceTask_ProduceTask"  importFlag="false" viewCode="WOM_7.5.0.0_produceTask_recycleTaskList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
