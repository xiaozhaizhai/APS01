<!-- MESBasic_1/interfaceSyncLog/logList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1493193257114')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_interfaceSyncLog_logList,head,MESBasic_1_interfaceSyncLog_InterfaceSyncLog,MESBasic_1) -->
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
	CUI.ns('MESBasic.interfaceSyncLog.interfaceSyncLog','MESBasic.interfaceSyncLog.interfaceSyncLog.logList');
</script>
<@frameset id="ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_container" border=0>
	<@frame id="ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "logList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_interfaceSyncLog_logList,html,MESBasic_1_interfaceSyncLog_InterfaceSyncLog,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.interfaceSyncLog.interfaceSyncLog.logList._prefix += '.';
			}
			MESBasic.interfaceSyncLog.interfaceSyncLog.logList._prefix += arr[i];
		}
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList._suffix = arr[arr.length -1];
		if(MESBasic.interfaceSyncLog.interfaceSyncLog.logList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.interfaceSyncLog.interfaceSyncLog.logList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.interfaceSyncLog.interfaceSyncLog.logList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name="'+MESBasic.interfaceSyncLog.interfaceSyncLog.logList._prefix + '.' + MESBasic.interfaceSyncLog.interfaceSyncLog.logList._suffix +'"]').val(obj[0][MESBasic.interfaceSyncLog.interfaceSyncLog.logList._suffix]);
		CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name="'+MESBasic.interfaceSyncLog.interfaceSyncLog.logList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name^="'+MESBasic.interfaceSyncLog.interfaceSyncLog.logList._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name="'+MESBasic.interfaceSyncLog.interfaceSyncLog.logList._prefix + '.' + MESBasic.interfaceSyncLog.interfaceSyncLog.logList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.interfaceSyncLog.interfaceSyncLog.logList._dialog) {
			MESBasic.interfaceSyncLog.interfaceSyncLog.logList._dialog.close();
		}
	};
	
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query_"+obj+")!='undefined'") ? eval('MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
MESBasic_interfaceSyncLog_interfaceSyncLog_logList_refresh = function(node){
MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node = node;
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
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query("query");
}

MESBasic_interfaceSyncLog_interfaceSyncLog_logList_getList = function() {
	return "MESBasic.interfaceSyncLog.interfaceSyncLog.logList";
}
MESBasic.interfaceSyncLog.interfaceSyncLog.logList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_interfaceSyncLog_interfaceSyncLog_logListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.interfaceSyncLog.interfaceSyncLog.logList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_interfaceSyncLog_interfaceSyncLog_logList_fileupload_button",
		handler:function(){
				list_operate_interfaceSyncLog_logList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.interfaceSyncLog.interfaceSyncLog.logList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_interfaceSyncLog_logList.MESBasic.interfaceSyncLog.interfaceSyncLog." + params.viewName + ".referenceCopy");
			funcName('interfaceSyncLog', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.interfaceSyncLog.interfaceSyncLog.logList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_interfaceSyncLog_logList.MESBasic.interfaceSyncLog.interfaceSyncLog." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.interfaceSyncLog.interfaceSyncLog.logList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_interfaceSyncLog_logList.MESBasic.interfaceSyncLog.interfaceSyncLog." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function sync(){ 
							 
							
var arrselect=ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget.selectedRows;
if(arrselect.length<1){
workbenchErrorBarWidget.showMessage("${getText('foundation.infoSet.selectRow')}");
return ;
}
var ids='',logids='';
var logOperate='';
var logType='';
if(arrselect[0].logSynFlag||arrselect[0].logIsIgnore){
workbenchErrorBarWidget.showMessage("${getText('RM.interfaceService.notneedsync')}");
return false;
}
logOperate=arrselect[0].logOperate;
logType=arrselect[0].logType;
arrselect.forEach(function(obj) {
ids+=obj.logID+",";
logids+=obj.id+",";
});

 CUI.ajax({
            type:"POST",
            url:"/RM/interfaceService/interfaceSyncLog/sync.action",
            data:{mesid:ids,operationType:logOperate,objectType:logType,logid:logids},          
            success:function(msg){
			if(msg){
			workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealSuccess')}",'s');
			}else{
			workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
			}
			 MESBasic.interfaceSyncLog.interfaceSyncLog.logList.commonQuery('query');
            },
			error:function(msg){
			 workbenchErrorBarWidget.showMessage("${getText('foundation.party.dealFailure')}");
            }
         });

				
				};;
	
	/**
	 * 保存完毕回调
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.callBackInfo
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_interfaceSyncLog_interfaceSyncLog_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.logList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.logList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.checkSelectedValid = function(type) {
		if(MESBasic.interfaceSyncLog.interfaceSyncLog.logList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows[i].valid === false){
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
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.logList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.checkSelectedAny = function() {
		if(datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.logList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.checkSelectedMore = function() {
		if(datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.dbClickViewlogList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_interfaceSyncLog&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.logList.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.interfaceSyncLog.interfaceSyncLog.logList.otherParams || {};
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
					list_operate_interfaceSyncLog_logList.CUI('#'+formId).submit();
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
		if ( MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg ) {
			MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg._config.url = url;
			MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg._config.formId = formId;
			MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg.setTitle( title )
			MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_interfaceSyncLog_logList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_interfaceSyncLog_interfaceSyncLog', element : $('#MESBasic_interfaceSyncLog_interfaceSyncLog_logList_fileupload_button a:eq(1)')});
		}
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.logList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.approvalDialog = function(url,formId,title,width,height) {
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{MESBasic.interfaceSyncLog.interfaceSyncLog.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.AppDlg.show();
	};

	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.interfaceSyncLog.interfaceSyncLog.logList.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.interfaceSyncLog.interfaceSyncLog.logList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.interfaceSyncLog.interfaceSyncLog.logList.cancelSelectedNode == 'function') {
	   MESBasic.interfaceSyncLog.interfaceSyncLog.logList.cancelSelectedNode();
	   MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node = null;
	  }
	  if(typeof MESBasic_interfaceSyncLog_interfaceSyncLog_logList_cancelSelectedNode == 'function') {
	   MESBasic_interfaceSyncLog_interfaceSyncLog_logList_cancelSelectedNode();
	   MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node = null;
	  }
	  MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query(type);
	 };
	
	/**
	 * 查询
	 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query
	 */
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query = function(type,pageNo,sortFlag){
		var node = MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node = null;
		if(!checkListValid("ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query._sortKey && datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query._sortMethod){
			CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query._sortKey);
			CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query._sortColumnName);
			CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query._sortMethod);
		}else{
			datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query._sortKey = '';
			CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/MESBasic/interfaceSyncLog/interfaceSyncLog/logList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/MESBasic/interfaceSyncLog/interfaceSyncLog/logList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_interfaceSyncLog_logList";
		condobj.modelAlias="interfaceSyncLog";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name="'+ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'MESBasic_1_interfaceSyncLog_logList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_interfaceSyncLog";
		openExportFrame(url);
	}
MESBasic.interfaceSyncLog.interfaceSyncLog.logList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.otherParams = {};
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.otherParams.dialogType = dialogType;
	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.interfaceSyncLog.interfaceSyncLog.editCallBackInfo
 */
MESBasic.interfaceSyncLog.interfaceSyncLog.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_interfaceSyncLog_interfaceSyncLog_logList_getLayout == "function"){
    		var layout = MESBasic_interfaceSyncLog_interfaceSyncLog_logList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget._sortKey && ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_interfaceSyncLog_InterfaceSyncLog'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget._sortKey && ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget._sortKey && ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_interfaceSyncLog_interfaceSyncLog_logList_getLayout == "function"){
			var layout = MESBasic_interfaceSyncLog_interfaceSyncLog_logList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.interfaceSyncLog.interfaceSyncLog.logList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query('query');
	    	}
			if(modelCode == 'MESBasic_1_interfaceSyncLog_InterfaceSyncLog'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-MESBasic_1_interfaceSyncLog_logList,js,MESBasic_1_interfaceSyncLog_InterfaceSyncLog,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_interfaceSyncLog_logList' idprefix='ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList' queryUrl='/MESBasic/interfaceSyncLog/interfaceSyncLog/logList-query.action' queryFunc="MESBasic.interfaceSyncLog.interfaceSyncLog.logList.query" ns="MESBasic.interfaceSyncLog.interfaceSyncLog.logList" />
<@exportexcel action="/MESBasic/interfaceSyncLog/interfaceSyncLog/logList-query.action"   getRequireDataAction="/MESBasic/interfaceSyncLog/interfaceSyncLog/logList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_interfaceSyncLog_InterfaceSyncLog&&viewCode=MESBasic_1_interfaceSyncLog_logList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_interfaceSyncLog_logList')}" prefix="ec_MESBasic_interfaceSyncLog_interfaceSyncLog_logList_query" modelCode="MESBasic_1_interfaceSyncLog_InterfaceSyncLog"  importFlag="false" viewCode="MESBasic_1_interfaceSyncLog_logList" />
