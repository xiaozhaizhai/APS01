<!-- RM_7.5.0.0/pickSite/pickSiteRef -->
<script type="text/javascript">
	CUI.ns("RM.pickSite.pickSite.pickSiteRef");
</script>
<input type="hidden" name="RM_pickSite_pickSite_pickSiteRef_callBackFuncName" id="RM_pickSite_pickSite_pickSiteRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_pickSite_pickSite_pickSiteRefErrorbar" />
<#include "pickSiteRef-fastquery-datatable.ftl">
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_pickSite_pickSiteRef,html,RM_7.5.0.0_pickSite_PickSite,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_pickSite_pickSite_pickSiteRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.pickSite.pickSite.pickSiteRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.pickSite.pickSite.pickSiteRef.query
	 */
	RM.pickSite.pickSite.pickSiteRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_pickSite_pickSite_pickSiteRef_queryForm", RM_pickSite_pickSite_pickSiteRefErrorbarWidget)) {
				return false;
		}
		var node = RM.pickSite.pickSite.pickSiteRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_pickSite_pickSite_pickSiteRef_query._sortKey && datatable_ec_RM_pickSite_pickSite_pickSiteRef_query._sortMethod){
			CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm #dataTableSortColKey').val(datatable_ec_RM_pickSite_pickSite_pickSiteRef_query._sortKey);
			CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm #dataTableSortColName').val(datatable_ec_RM_pickSite_pickSite_pickSiteRef_query._sortColumnName);
			CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm #dataTableSortColOrder').val(datatable_ec_RM_pickSite_pickSite_pickSiteRef_query._sortMethod);
		}else{
			datatable_ec_RM_pickSite_pickSite_pickSiteRef_query._sortKey = '';
			CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.pickSite.pickSite.pickSiteRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/pickSite/pickSite/pickSiteRef-query.action";
		CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_pickSite_pickSiteRef";
		condobj.modelAlias="pickSite";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name="'+ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_pickSite_pickSite_pickSiteRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_pickSite_pickSite_pickSiteRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_pickSite_pickSiteRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.pickSite.pickSite.pickSiteRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.pickSite.pickSite.pickSiteRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.pickSite.pickSite.pickSiteRef._prefix += '.';
			}
			RM.pickSite.pickSite.pickSiteRef._prefix += arr[i];
		}
		RM.pickSite.pickSite.pickSiteRef._suffix = arr[arr.length -1];
		if(RM.pickSite.pickSite.pickSiteRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.pickSite.pickSite.pickSiteRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.pickSite.pickSite.pickSiteRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.pickSite.pickSite.pickSiteRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.pickSite.pickSite.pickSiteRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name="'+RM.pickSite.pickSite.pickSiteRef._prefix + '.' + RM.pickSite.pickSite.pickSiteRef._suffix +'"]').val(obj[0][RM.pickSite.pickSite.pickSiteRef._suffix]);
		CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name="'+RM.pickSite.pickSite.pickSiteRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name^="'+RM.pickSite.pickSite.pickSiteRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name="'+RM.pickSite.pickSite.pickSiteRef._prefix + '.' + RM.pickSite.pickSite.pickSiteRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_pickSite_pickSite_pickSiteRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.pickSite.pickSite.pickSiteRef._dialog) {
			RM.pickSite.pickSite.pickSiteRef._dialog.close();
		}
	};
	
	RM.pickSite.pickSite.pickSiteRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.pickSite.pickSite.pickSiteRef.query_"+obj+")!='undefined'") ? eval('RM.pickSite.pickSite.pickSiteRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#if refUrl?? && refUrl?has_content>
		<#assign requestUri = refUrl?replace('/', '_', 'r')>
	<#else>
		<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
		<#assign requestUri = requestUri?replace('/', '_', 'r')>
	</#if>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.pickSite.pickSite.pickSiteRef.sendBackpickSiteRef(null,datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.pickSite.pickSite.pickSiteRef.sendBackpickSiteRef(null,datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.pickSite.pickSite.pickSiteRef.sendBackpickSiteRef
	 */
	RM.pickSite.pickSite.pickSiteRef.sendBackpickSiteRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.pickSite.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_pickSite_pickSite_pickSiteRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_pickSite_pickSite_pickSiteRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_pickSite_pickSite_pickSiteRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_pickSite_pickSite_pickSiteRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_pickSite_pickSite_pickSiteRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_pickSite_pickSite_pickSiteRef_callBackFuncName").val() + "(arrObj)");
				</#if>
				if(flag === false){
					return flag;
				}
			}else{
				getDepartmentInfo(arrObj);
			}
			<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'><#if (Parameters.closePage)?default('false') == 'true'>
			setTimeout(function(){
				try {
					top.opener.focus();
					CUI.closeWindow();
				}catch(e){}
			},1000);
			</#if></#if>
			RM_pickSite_pickSite_pickSiteRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_pickSite_pickSite_pickSiteRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_pickSite_pickSite_pickSiteRef_refresh = function(node){
RM.pickSite.pickSite.pickSiteRef.node = node;
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
	RM.pickSite.pickSite.pickSiteRef.query("query");
}

RM_pickSite_pickSite_pickSiteRef_getList = function() {
	return "RM.pickSite.pickSite.pickSiteRef";
}
RM.pickSite.pickSite.pickSiteRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_pickSite_pickSite_pickSiteRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.pickSite.pickSite.pickSiteRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.pickSite.pickSite.pickSiteRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_pickSite_pickSite_pickSiteRef_fileupload_button",
		handler:function(){
				list_operate_pickSite_pickSiteRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.pickSite.pickSite.pickSiteRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_pickSite_pickSiteRef.RM.pickSite.pickSite." + params.viewName + ".referenceCopy");
			funcName('pickSite', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.pickSite.pickSite.pickSiteRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_pickSite_pickSiteRef.RM.pickSite.pickSite." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.pickSite.pickSite.pickSiteRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_pickSite_pickSiteRef.RM.pickSite.pickSite." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	RM.pickSite.pickSite.pickSiteRef.dbClickViewpickSiteRef =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=RM_7.5.0.0_pickSite&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method RM.pickSite.pickSite.pickSiteRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.pickSite.pickSite.pickSiteRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.pickSite.pickSite.pickSiteRef.otherParams || {};
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
					list_operate_pickSite_pickSiteRef.CUI('#'+formId).submit();
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
		if ( RM.pickSite.pickSite.pickSiteRef.Dlg ) {
			RM.pickSite.pickSite.pickSiteRef.Dlg._config.url = url;
			RM.pickSite.pickSite.pickSiteRef.Dlg._config.formId = formId;
			RM.pickSite.pickSite.pickSiteRef.Dlg.setTitle( title )
			RM.pickSite.pickSite.pickSiteRef.Dlg.setButtonbar( buttons );
		}else{
			RM.pickSite.pickSite.pickSiteRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_pickSite_pickSiteRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.pickSite.pickSite.pickSiteRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.pickSite.pickSite.pickSiteRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_pickSite_pickSite', element : $('#RM_pickSite_pickSite_pickSiteRef_fileupload_button a:eq(1)')});
		}
		RM.pickSite.pickSite.pickSiteRef.otherParams = {};
	};

	RM.pickSite.pickSite.pickSiteRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.pickSite.pickSite.pickSiteRef.beforeCommonQuery === 'function') {
	   		var ret = RM.pickSite.pickSite.pickSiteRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.pickSite.pickSite.pickSiteRef.cancelSelectedNode == 'function') {
	   RM.pickSite.pickSite.pickSiteRef.cancelSelectedNode();
	   RM.pickSite.pickSite.pickSiteRef.node = null;
	  }
	  if(typeof RM_pickSite_pickSite_pickSiteRef_cancelSelectedNode == 'function') {
	   RM_pickSite_pickSite_pickSiteRef_cancelSelectedNode();
	   RM.pickSite.pickSite.pickSiteRef.node = null;
	  }
	  RM.pickSite.pickSite.pickSiteRef.query(type);
	 };
	
	
	
	RM.pickSite.pickSite.pickSiteRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_pickSite";
		openExportFrame(url);
	}
RM.pickSite.pickSite.pickSiteRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.pickSite.pickSite.pickSiteRef.otherParams = {};
	RM.pickSite.pickSite.pickSiteRef.otherParams.dialogType = dialogType;
	RM.pickSite.pickSite.pickSiteRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.pickSite.pickSite.pickSiteRef.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.pickSite.pickSite.editCallBackInfo
 */
RM.pickSite.pickSite.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_pickSite_pickSite_pickSiteRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_pickSite_pickSite_pickSiteRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_pickSite_pickSite_pickSiteRef_getLayout == "function"){
    		var layout = RM_pickSite_pickSite_pickSiteRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.pickSite.pickSite.pickSiteRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_pickSite_pickSite_pickSiteRef_queryWidget._sortKey && ec_RM_pickSite_pickSite_pickSiteRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_pickSite_PickSite'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_pickSite_pickSite_pickSiteRef_queryWidget._sortKey && ec_RM_pickSite_pickSite_pickSiteRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_pickSite_pickSite_pickSiteRef_queryWidget._sortKey && ec_RM_pickSite_pickSite_pickSiteRef_queryWidget._sortMethod ? true : false;
		if(typeof RM_pickSite_pickSite_pickSiteRef_getLayout == "function"){
			var layout = RM_pickSite_pickSite_pickSiteRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.pickSite.pickSite.pickSiteRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.pickSite.pickSite.pickSiteRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.pickSite.pickSite.pickSiteRef.query('query');
	    	}
			if(modelCode == 'RM_7.5.0.0_pickSite_PickSite'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.pickSite.pickSite.pickSiteRef.query('query',_Current_PageNo,needSort);
	    	} else {
	    		RM.pickSite.pickSite.pickSiteRef.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_pickSite_pickSiteRef,js,RM_7.5.0.0_pickSite_PickSite,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_pickSite_pickSiteRef' idprefix='ec_RM_pickSite_pickSite_pickSiteRef' queryUrl='/RM/pickSite/pickSite/pickSiteRef-query.action' queryFunc="RM.pickSite.pickSite.pickSiteRef.query" ns="RM.pickSite.pickSite.pickSiteRef" />
<@exportexcel action="/RM/pickSite/pickSite/pickSiteRef-query.action"   getRequireDataAction="/RM/pickSite/pickSite/pickSiteRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_pickSite_PickSite&&viewCode=RM_7.5.0.0_pickSite_pickSiteRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_pickSite_pickSiteRef')}" prefix="ec_RM_pickSite_pickSite_pickSiteRef_query" modelCode="RM_7.5.0.0_pickSite_PickSite"  importFlag="false" viewCode="RM_7.5.0.0_pickSite_pickSiteRef" />
