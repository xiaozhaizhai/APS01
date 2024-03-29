<!-- MESBasic_1/routine/routineRef2 -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1425433494700')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_routine_routineRef2,head,MESBasic_1_routine_Routine,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("MESBasic.routine.routine.routineRef2");
</script>
<input type="hidden" name="MESBasic_routine_routine_routineRef2_callBackFuncName" id="MESBasic_routine_routine_routineRef2_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="MESBasic_routine_routine_routineRef2Errorbar" />
<@frameset id="ec_MESBasic_routine_routine_routineRef2_container" border=0>
	<@frame id="ec_MESBasic_routine_routine_routineRef2_container_main"  offsetH=4 region="center" class="center_in">
	<#include "routineRef2-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_MESBasic_routine_routine_routineRef2_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_MESBasic_routine_routine_routineRef2_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_routine_routineRef2,html,MESBasic_1_routine_Routine,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return MESBasic.routine.routine.routineRef2.sendBackroutineRef2(null,datatable_ec_MESBasic_routine_routine_routineRef2_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_MESBasic_routine_routine_routineRef2_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("MESBasic.routine.routine.routineRef2.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method MESBasic.routine.routine.routineRef2.query
	 */
	MESBasic.routine.routine.routineRef2.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_MESBasic_routine_routine_routineRef2_queryForm", MESBasic_routine_routine_routineRef2ErrorbarWidget)) {
				return false;
		}
		var node = MESBasic.routine.routine.routineRef2.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_MESBasic_routine_routine_routineRef2_query._sortKey && datatable_ec_MESBasic_routine_routine_routineRef2_query._sortMethod){
			CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm #dataTableSortColKey').val(datatable_ec_MESBasic_routine_routine_routineRef2_query._sortKey);
			CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm #dataTableSortColName').val(datatable_ec_MESBasic_routine_routine_routineRef2_query._sortColumnName);
			CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm #dataTableSortColOrder').val(datatable_ec_MESBasic_routine_routine_routineRef2_query._sortMethod);
		}else{
			datatable_ec_MESBasic_routine_routine_routineRef2_query._sortKey = '';
			CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm #dataTableSortColKey').val('');
			CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm #dataTableSortColName').val('');
			CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_MESBasic_routine_routine_routineRef2_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "MESBasic.routine.routine.routineRef2.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/MESBasic/routine/routine/routineRef2-query.action";
		CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_routine_routine_routineRef2_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_routine_routineRef2";
		condobj.modelAlias="routine";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_routine_routine_routineRef2_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_routine_routine_routineRef2_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_routine_routine_routineRef2_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_routine_routine_routineRef2_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name="'+ec_MESBasic_routine_routine_routineRef2_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_routine_routine_routineRef2_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_MESBasic_routine_routine_routineRef2_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_routine_routine_routineRef2_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_routine_routine_routineRef2_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_routine_routine_routineRef2_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_routine_routineRef2';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_MESBasic_routine_routine_routineRef2_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	MESBasic.routine.routine.routineRef2._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.routine.routine.routineRef2._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.routine.routine.routineRef2._prefix += '.';
			}
			MESBasic.routine.routine.routineRef2._prefix += arr[i];
		}
		MESBasic.routine.routine.routineRef2._suffix = arr[arr.length -1];
		if(MESBasic.routine.routine.routineRef2._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.routine.routine.routineRef2._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.routine.routine.routineRef2._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.routine.routine.routineRef2.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.routine.routine.routineRef2.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name="'+MESBasic.routine.routine.routineRef2._prefix + '.' + MESBasic.routine.routine.routineRef2._suffix +'"]').val(obj[0][MESBasic.routine.routine.routineRef2._suffix]);
		CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name="'+MESBasic.routine.routine.routineRef2._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name^="'+MESBasic.routine.routine.routineRef2._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name="'+MESBasic.routine.routine.routineRef2._prefix + '.' + MESBasic.routine.routine.routineRef2._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_routine_routine_routineRef2_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(MESBasic.routine.routine.routineRef2._dialog) {
			MESBasic.routine.routine.routineRef2._dialog.close();
		}
	};
	
	MESBasic.routine.routine.routineRef2._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.routine.routine.routineRef2.query_"+obj+")!='undefined'") ? eval('MESBasic.routine.routine.routineRef2.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_routine_routine_routineRef2_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.routine.routine.routineRef2.sendBackroutineRef2(null,datatable_ec_MESBasic_routine_routine_routineRef2_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_MESBasic_routine_routine_routineRef2_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return MESBasic.routine.routine.routineRef2.sendBackroutineRef2(null,datatable_ec_MESBasic_routine_routine_routineRef2_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method MESBasic.routine.routine.routineRef2.sendBackroutineRef2
	 */
	MESBasic.routine.routine.routineRef2.sendBackroutineRef2 = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_MESBasic_routine_routine_routineRef2_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('MESBasic.routine.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_routine_routine_routineRef2_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#MESBasic_routine_routine_routineRef2_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#MESBasic_routine_routine_routineRef2_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#MESBasic_routine_routine_routineRef2_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#MESBasic_routine_routine_routineRef2_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#MESBasic_routine_routine_routineRef2_callBackFuncName").val() + "(arrObj)");
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
			MESBasic_routine_routine_routineRef2ErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			MESBasic_routine_routine_routineRef2ErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
MESBasic_routine_routine_routineRef2_refresh = function(node){
MESBasic.routine.routine.routineRef2.node = node;
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
	MESBasic.routine.routine.routineRef2.query("query");
}

MESBasic_routine_routine_routineRef2_getList = function() {
	return "MESBasic.routine.routine.routineRef2";
}
MESBasic.routine.routine.routineRef2.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.MESBasic_routine_routine_routineRef2ErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

MESBasic.routine.routine.routineRef2.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.routine.routine.routineRef2.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_routine_routine_routineRef2_fileupload_button",
		handler:function(){
				list_operate_routine_routineRef2.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.routine.routine.routineRef2.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_routine_routineRef2.MESBasic.routine.routine." + params.viewName + ".referenceCopy");
			funcName('routine', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
MESBasic.routine.routine.routineRef2.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_routine_routineRef2.MESBasic.routine.routine." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
MESBasic.routine.routine.routineRef2.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_routine_routineRef2.MESBasic.routine.routine." + editViewName + ".printSetting");
			funcName();
		}
	}
}

	MESBasic.routine.routine.routineRef2.dbClickViewroutineRef2 =  function(event, oRow) {
		var viewUrl = '/MESBasic/routine/routine/routineViewAll.action';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=MESBasic_1_routine&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method MESBasic.routine.routine.routineRef2.showDialog
	 * @param {String} url
	 * @private
	 */
	MESBasic.routine.routine.routineRef2.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = MESBasic.routine.routine.routineRef2.otherParams || {};
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
			
			
			
					if(viewCode=='MESBasic_1_routine_routineViewAll'||!viewCode){
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
					list_operate_routine_routineRef2.CUI('#'+formId).submit();
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
		if ( MESBasic.routine.routine.routineRef2.Dlg ) {
			MESBasic.routine.routine.routineRef2.Dlg._config.url = url;
			MESBasic.routine.routine.routineRef2.Dlg._config.formId = formId;
			MESBasic.routine.routine.routineRef2.Dlg.setTitle( title )
			MESBasic.routine.routine.routineRef2.Dlg.setButtonbar( buttons );
		}else{
			MESBasic.routine.routine.routineRef2.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_routine_routineRef2',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		MESBasic.routine.routine.routineRef2.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		MESBasic.routine.routine.routineRef2.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'MESBasic_routine_routine', element : $('#MESBasic_routine_routine_routineRef2_fileupload_button a:eq(1)')});
		}
		MESBasic.routine.routine.routineRef2.otherParams = {};
	};

	MESBasic.routine.routine.routineRef2.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof MESBasic.routine.routine.routineRef2.beforeCommonQuery === 'function') {
	   		var ret = MESBasic.routine.routine.routineRef2.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof MESBasic.routine.routine.routineRef2.cancelSelectedNode == 'function') {
	   MESBasic.routine.routine.routineRef2.cancelSelectedNode();
	   MESBasic.routine.routine.routineRef2.node = null;
	  }
	  if(typeof MESBasic_routine_routine_routineRef2_cancelSelectedNode == 'function') {
	   MESBasic_routine_routine_routineRef2_cancelSelectedNode();
	   MESBasic.routine.routine.routineRef2.node = null;
	  }
	  MESBasic.routine.routine.routineRef2.query(type);
	 };
	
	
	
	MESBasic.routine.routine.routineRef2.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=MESBasic_1_routine";
		openExportFrame(url);
	}
MESBasic.routine.routine.routineRef2.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	MESBasic.routine.routine.routineRef2.otherParams = {};
	MESBasic.routine.routine.routineRef2.otherParams.dialogType = dialogType;
	MESBasic.routine.routine.routineRef2.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.routine.routine.routineRef2.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method MESBasic.routine.routine.editCallBackInfo
 */
MESBasic.routine.routine.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_MESBasic_routine_routine_routineRef2_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_MESBasic_routine_routine_routineRef2_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof MESBasic_routine_routine_routineRef2_getLayout == "function"){
    		var layout = MESBasic_routine_routine_routineRef2_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.routine.routine.routineRef2.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_routine_routine_routineRef2_queryWidget._sortKey && ec_MESBasic_routine_routine_routineRef2_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'MESBasic_1_routine_Routine'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_MESBasic_routine_routine_routineRef2_queryWidget._sortKey && ec_MESBasic_routine_routine_routineRef2_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_MESBasic_routine_routine_routineRef2_queryWidget._sortKey && ec_MESBasic_routine_routine_routineRef2_queryWidget._sortMethod ? true : false;
		if(typeof MESBasic_routine_routine_routineRef2_getLayout == "function"){
			var layout = MESBasic_routine_routine_routineRef2_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	MESBasic.routine.routine.routineRef2.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.routine.routine.routineRef2.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.routine.routine.routineRef2.query('query');
	    	}
			if(modelCode == 'MESBasic_1_routine_Routine'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		MESBasic.routine.routine.routineRef2.query('query',_Current_PageNo,needSort);
	    	} else {
	    		MESBasic.routine.routine.routineRef2.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_routine_routineRef2,js,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='MESBasic_1_routine_routineRef2' idprefix='ec_MESBasic_routine_routine_routineRef2' queryUrl='/MESBasic/routine/routine/routineRef2-query.action' queryFunc="MESBasic.routine.routine.routineRef2.query" ns="MESBasic.routine.routine.routineRef2" />
<@exportexcel action="/MESBasic/routine/routine/routineRef2-query.action"   getRequireDataAction="/MESBasic/routine/routine/routineRef2-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=MESBasic_1_routine_Routine&&viewCode=MESBasic_1_routine_routineRef2" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('MESBasic_1_routine_routineRef2')}" prefix="ec_MESBasic_routine_routine_routineRef2_query" modelCode="MESBasic_1_routine_Routine"  importFlag="false" viewCode="MESBasic_1_routine_routineRef2" />
