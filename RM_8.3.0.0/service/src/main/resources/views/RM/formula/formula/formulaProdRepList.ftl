<!-- RM_7.5.0.0/formula/formulaProdRepList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1540368329038')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_formulaProdRepList,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("RM.formula.formula","RM.formula.formula.formulaProdRepList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_RM_formula_formula_formulaProdRepList_container" border=0>
	<@frame id="ec_RM_formula_formula_formulaProdRepList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "formulaProdRepList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_formulaProdRepList,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_RM_formula_formula_formulaProdRepList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=RM_7.5.0.0_formula';
		openFullScreen(url);
	};
	
	RM.formula.formula.formulaProdRepList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formula.formulaProdRepList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formula.formulaProdRepList._prefix += '.';
			}
			RM.formula.formula.formulaProdRepList._prefix += arr[i];
		}
		RM.formula.formula.formulaProdRepList._suffix = arr[arr.length -1];
		if(RM.formula.formula.formulaProdRepList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formula.formulaProdRepList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formula.formulaProdRepList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formula.formulaProdRepList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.formula.formula.formulaProdRepList.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+RM.formula.formula.formulaProdRepList._prefix + '.' + RM.formula.formula.formulaProdRepList._suffix +'"]').val(obj[0][RM.formula.formula.formulaProdRepList._suffix]);
		CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+RM.formula.formula.formulaProdRepList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name^="'+RM.formula.formula.formulaProdRepList._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+RM.formula.formula.formulaProdRepList._prefix + '.' + RM.formula.formula.formulaProdRepList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.formula.formulaProdRepList._dialog) {
			RM.formula.formula.formulaProdRepList._dialog.close();
		}
	};
	
	RM.formula.formula.formulaProdRepList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formula.formulaProdRepList.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.formulaProdRepList.query_'+obj+'()') : null;
		return str;
	
	};
	
RM.formula.formula.formulaProdRepList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=RM_7.5.0.0_formula&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	RM.formula.formula.formulaProdRepList.rowDblClickQuery = function(event,row){
		RM.formula.formula.formulaProdRepList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
RM_formula_formula_formulaProdRepList_refresh = function(node){
RM.formula.formula.formulaProdRepList.node = node;
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
	RM.formula.formula.formulaProdRepList.query("query");
}

RM_formula_formula_formulaProdRepList_getList = function() {
	return "RM.formula.formula.formulaProdRepList";
}
RM.formula.formula.formulaProdRepList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formula_formula_formulaProdRepListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formula.formula.formulaProdRepList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formula.formula.formulaProdRepList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formula_formula_formulaProdRepList_fileupload_button",
		handler:function(){
				list_operate_formula_formulaProdRepList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formula.formula.formulaProdRepList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaProdRepList.RM.formula.formula." + params.viewName + ".referenceCopy");
			funcName('formula', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formula.formula.formulaProdRepList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaProdRepList.RM.formula.formula." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formula.formula.formulaProdRepList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaProdRepList.RM.formula.formula." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function productReplace(){ 
							
	var selectedRow = ec_RM_formula_formula_formulaProdRepList_queryWidget.getSelectedRow();
	if(selectedRow != ''){
		var formulaIds = '';
		for(var i = 0; i<selectedRow.length; i++){
			formulaIds += selectedRow [i].id+",";
		}
		formulaIds = formulaIds.substr(0,formulaIds.length-1);
		var productId = $('input[name="mainMetarial.id"]').val();
		var productName = $('input[name="mainMetarial.productName"]').val();
		proReplace = new CUI.Dialog({
			title:"物料替换",
			formId:"RM_formula_productReplace_productReplace_form",
			type:1,
			modal:true,
			iframe: 'RM_formula_productReplace_productReplace_formc',
            closeAlways: true,
			//callBackName: '_callBack111',
			url:'/RM/formula/productReplace/productReplace.action?__pc__=Zm9ybXVsYVByb2RSZXBMaXN0X3Byb2R1Y3RSZXBsYWNlX2FkZF9STV83LjUuMC4wX2Zvcm11bGFfZm9ybXVsYVByb2RSZXBMaXN0fA__&entityCode=RM_7.5.0.0_formula&&superEdit=true&openType=frame&formulaIds='+formulaIds+'&productId='+productId+'&productName='+productName+'&callbackName=_callbackProdReplace',
			buttons:[{
				name:"${getText('foundation.common.save')}",
				handler:function(){
					RM_formula_productReplace_productReplace_formc.window.CUI('#RM_formula_productReplace_productReplace_form').submit();
					//RM.formula.formula.formulaProdRepList.query('query');
					//this.close();
				}
		    },
		    {
			    name:"${getText('foundation.common.closed')}",
			    handler:function(){this.close()}
		    }]
		});
        proReplace.show();
	}else{
		workbenchErrorBarWidget.showMessage("请先选中行","f");
	}
			


				};
	
	/**
	 * 保存完毕回调
	 * @method RM.formula.formula.callBackInfo
	 */
	RM.formula.formula.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_formula_formula_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.formula.formula.formulaProdRepList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method RM.formula.formula.formulaProdRepList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.formula.formula.formulaProdRepList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.formula.formula.formulaProdRepList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.formula.formula.formulaProdRepList.checkSelectedValid = function(type) {
		if(RM.formula.formula.formulaProdRepList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows[i].valid === false){
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
	 * @method RM.formula.formula.formulaProdRepList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.formulaProdRepList.checkSelectedAny = function() {
		if(datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.formula.formula.formulaProdRepList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.formulaProdRepList.checkSelectedMore = function() {
		if(datatable_ec_RM_formula_formula_formulaProdRepList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.formula.formula.formulaProdRepList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formula.formulaProdRepList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formula.formula.formulaProdRepList.otherParams || {};
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
			
			
			
					if(viewCode=='RM_7.5.0.0_formula_formulaView'||!viewCode){
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
					list_operate_formula_formulaProdRepList.CUI('#'+formId).submit();
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
		if ( RM.formula.formula.formulaProdRepList.Dlg ) {
			RM.formula.formula.formulaProdRepList.Dlg._config.url = url;
			RM.formula.formula.formulaProdRepList.Dlg._config.formId = formId;
			RM.formula.formula.formulaProdRepList.Dlg.setTitle( title )
			RM.formula.formula.formulaProdRepList.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.formula.formulaProdRepList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_formulaProdRepList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.formula.formulaProdRepList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.formula.formulaProdRepList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_formula', element : $('#RM_formula_formula_formulaProdRepList_fileupload_button a:eq(1)')});
		}
		RM.formula.formula.formulaProdRepList.otherParams = {};
	};

	RM.formula.formula.formulaProdRepList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formula.formula.formulaProdRepList.beforeCommonQuery === 'function') {
	   		var ret = RM.formula.formula.formulaProdRepList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formula.formula.formulaProdRepList.cancelSelectedNode == 'function') {
	   RM.formula.formula.formulaProdRepList.cancelSelectedNode();
	   RM.formula.formula.formulaProdRepList.node = null;
	  }
	  if(typeof RM_formula_formula_formulaProdRepList_cancelSelectedNode == 'function') {
	   RM_formula_formula_formulaProdRepList_cancelSelectedNode();
	   RM.formula.formula.formulaProdRepList.node = null;
	  }
	  RM.formula.formula.formulaProdRepList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.formula.formula.formulaProdRepList.query
	 */
	RM.formula.formula.formulaProdRepList.query = function(type,pageNo,sortFlag){
		var node = RM.formula.formula.formulaProdRepList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.formula.formula.formulaProdRepList.node = null;
		if(!checkListValid("ec_RM_formula_formula_formulaProdRepList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_formula_formula_formulaProdRepList_query._sortKey && datatable_ec_RM_formula_formula_formulaProdRepList_query._sortMethod){
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_formula_formulaProdRepList_query._sortKey);
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_formula_formulaProdRepList_query._sortColumnName);
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_formula_formulaProdRepList_query._sortMethod);
		}else{
			datatable_ec_RM_formula_formula_formulaProdRepList_query._sortKey = '';
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick') && datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick').length > 0) {
				datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.formulaProdRepList.rowDblClick'
		            });
			}
	        datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaProdRepList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick') && datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick').length > 0) {
		    	datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.formulaProdRepList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaProdRepList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaProdRepList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/formula/formula/formulaProdRepList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/formula/formula/formulaProdRepList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formula_formulaProdRepList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_formulaProdRepList";
		condobj.modelAlias="formula";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formula_formula_formulaProdRepList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formula_formulaProdRepList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'RM_7.5.0.0_formula_formulaProdRepList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_formula_formula_formulaProdRepList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_formula_formula_formulaProdRepList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.formula.formula.formulaProdRepList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.formula.formulaProdRepList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.formula.formulaProdRepList.otherParams = {};
	RM.formula.formula.formulaProdRepList.otherParams.dialogType = dialogType;
	RM.formula.formula.formulaProdRepList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formula.formulaProdRepList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.formula.formula.editCallBackInfo
 */
RM.formula.formula.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_formula_formula_formulaProdRepList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_formula_formulaProdRepList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formula_formula_formulaProdRepList_getLayout == "function"){
    		var layout = RM_formula_formula_formulaProdRepList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulaProdRepList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaProdRepList_queryWidget._sortKey && ec_RM_formula_formula_formulaProdRepList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaProdRepList_queryWidget._sortKey && ec_RM_formula_formula_formulaProdRepList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formula_formula_formulaProdRepList_queryWidget._sortKey && ec_RM_formula_formula_formulaProdRepList_queryWidget._sortMethod ? true : false;
		if(typeof RM_formula_formula_formulaProdRepList_getLayout == "function"){
			var layout = RM_formula_formula_formulaProdRepList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulaProdRepList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulaProdRepList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulaProdRepList.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulaProdRepList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulaProdRepList.query('pending');
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
	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_formulaProdRepList,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
	/**
	 * 查询
	 * @method RM.formula.formula.formulaProdRepList.query
	 */
	RM.formula.formula.formulaProdRepList.query = function(type,pageNo,sortFlag){
		var node = RM.formula.formula.formulaProdRepList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.formula.formula.formulaProdRepList.node = null;
		if(!checkListValid("ec_RM_formula_formula_formulaProdRepList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_formula_formula_formulaProdRepList_query._sortKey && datatable_ec_RM_formula_formula_formulaProdRepList_query._sortMethod){
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_formula_formulaProdRepList_query._sortKey);
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_formula_formulaProdRepList_query._sortColumnName);
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_formula_formulaProdRepList_query._sortMethod);
		}else{
			datatable_ec_RM_formula_formula_formulaProdRepList_query._sortKey = '';
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick') && datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick').length > 0) {
				datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.formulaProdRepList.rowDblClick'
		            });
			}
	        datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaProdRepList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick') && datatable_ec_RM_formula_formula_formulaProdRepList_query.get('dblclick').length > 0) {
		    	datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.formulaProdRepList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_RM_formula_formula_formulaProdRepList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaProdRepList.query('query')"
            }); 
	    }  
	    /*if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/formula/formula/formulaProdRepList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {*/
	    	url = "/RM/formula/formula/formulaProdRepList-custom-query.action";
	   		$("#currentSqlType").val(6);
	    //}  
		CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formula_formulaProdRepList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_formulaProdRepList";
		condobj.modelAlias="formula";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaProdRepList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formula_formula_formulaProdRepList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formula_formulaProdRepList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formula_formulaProdRepList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'RM_7.5.0.0_formula_formulaProdRepList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_formula_formula_formulaProdRepList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_formula_formula_formulaProdRepList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
		
		//单据状态 
		/*var rowLength = ec_RM_formula_formula_formulaProdRepList_queryWidget.getRowLength()
		for(var i = 0; i<rowLength; i++){
			console.log(i);
			var querystatus = $("input[name='ec_RM_formula_formula_formulaProdRepList_querystatus']").eq(i).val();
			if(querystatus == '88'){
				var activityName = $("input[name='ec_RM_formula_formula_formulaList_querypending.activityName']").eq(i).val();
				if(activityName == 'task345'){
					ec_RM_formula_formula_formulaProdRepList_queryWidget.setCellValue(i,"pending.taskDescription","编辑");
				}else{
					ec_RM_formula_formula_formulaProdRepList_queryWidget.setCellValue(i,"pending.taskDescription","批注");
				}	
			}else{
				ec_RM_formula_formula_formulaProdRepList_queryWidget.setCellValue(i,"pending.taskDescription","生效");
			}	
			
		}	*/
		
		return false;
		
	};
	
	_callbackProdReplace = function(obj){
		RM.formula.formula.formulaProdRepList.query('query');
		proReplace.close();
	};
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formula_formulaProdRepList' idprefix='ec_RM_formula_formula_formulaProdRepList' queryUrl='/RM/formula/formula/formulaProdRepList-query.action' queryFunc="RM.formula.formula.formulaProdRepList.query" ns="RM.formula.formula.formulaProdRepList" />
<@exportexcel action="/RM/formula/formula/formulaProdRepList-query.action"   getRequireDataAction="/RM/formula/formula/formulaProdRepList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_Formula&&viewCode=RM_7.5.0.0_formula_formulaProdRepList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_formulaProdRepList')}" prefix="ec_RM_formula_formula_formulaProdRepList_query" modelCode="RM_7.5.0.0_formula_Formula"  importFlag="false" viewCode="RM_7.5.0.0_formula_formulaProdRepList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
