<!-- RM_7.5.0.0/formula/formulaPubRef -->
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1491787313479')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulaPubRef,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>
<body id="dialog_page">
</#if>
<script type="text/javascript">
	CUI.ns("RM.formula.formula.formulaPubRef");
</script>
<input type="hidden" name="RM_formula_formula_formulaPubRef_callBackFuncName" id="RM_formula_formula_formulaPubRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="RM_formula_formula_formulaPubRefErrorbar" />
<@frameset id="ec_RM_formula_formula_formulaPubRef_container" border=0>
	<@frame id="ec_RM_formula_formula_formulaPubRef_container_main"  offsetH=4 region="center" class="center_in">
	<#include "formulaPubRef-fastquery-datatable.ftl">
	</@frame>
	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	  <@frame id="ec_RM_formula_formula_formulaPubRef_button" region="south" height=28>
	    <div align="right" style="margin-right:20px;position:absolute;bottom:5px;right:0;z-index:100;">	    	
	     	<#if (Parameters.closePage)?default('false') == 'true'>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.choose')}</span></a>
	     	<#else>
	     		<a id="bottom-submit" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.chooseandclose')}</span></a>
			</#if>
				<a id="bottom-reset" onclick="CUI.resetForm('ec_RM_formula_formula_formulaPubRef_queryForm')" class="cui-btn-blue" style="margin-right:10px;"><span class="btn_r">${getHtmlText('common.button.cancel')}</span></a>
		</div>
     </@frame>
	</#if>
</@frameset>
<#if (Parameters.openType)?default('page') != 'dialog'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulaPubRef,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">

	<#if (Parameters.openType)?default('page') != 'dialog' && (Parameters.openType)?default('page') != 'frame'>
	$(function(){
		$("#bottom-submit").click( function(){
			return RM.formula.formula.formulaPubRef.sendBackformulaPubRef(null,datatable_ec_RM_formula_formula_formulaPubRef_query.getSelectedRow()[0]);
		});
		$("#bottom-reset").click( function(){
			window.close();
		});
		
	});
	</#if>
	$(function(){	//绑定添加按钮，如果点击参照视图的查询，pt刷新函数放到编辑视图的refViewRefresh 中
		$("#ec_RM_formula_formula_formulaPubRef_container_main").on('click','.cui-btn-add',function(){
			if($("[name='refViewRefresh']").length > 0){
				$("[name='refViewRefresh']").val("RM.formula.formula.formulaPubRef.commonQuery('query')");
			}
		});
	});
	/**
	 * 查询
	 * @method RM.formula.formula.formulaPubRef.query
	 */
	RM.formula.formula.formulaPubRef.query = function(type,pageNo,sortFlag){
		if(!checkListValid("ec_RM_formula_formula_formulaPubRef_queryForm", RM_formula_formula_formulaPubRefErrorbarWidget)) {
				return false;
		}
		var node = RM.formula.formula.formulaPubRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		if(sortFlag && datatable_ec_RM_formula_formula_formulaPubRef_query._sortKey && datatable_ec_RM_formula_formula_formulaPubRef_query._sortMethod){
			CUI('#ec_RM_formula_formula_formulaPubRef_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_formula_formulaPubRef_query._sortKey);
			CUI('#ec_RM_formula_formula_formulaPubRef_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_formula_formulaPubRef_query._sortColumnName);
			CUI('#ec_RM_formula_formula_formulaPubRef_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_formula_formulaPubRef_query._sortMethod);
		}else{
			datatable_ec_RM_formula_formula_formulaPubRef_query._sortKey = '';
			CUI('#ec_RM_formula_formula_formulaPubRef_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_formula_formulaPubRef_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_formula_formulaPubRef_queryForm #dataTableSortColOrder').val('');
		}
		datatable_ec_RM_formula_formula_formulaPubRef_query.setAttributeConfig('queryFunc', {
            writeOnce: true,
            value: "RM.formula.formula.formulaPubRef.query('"+type+"')"
        }); 
		var dataPost="";
		var url = "/RM/formula/formula/formulaPubRef-query.action";
		CUI('#ec_RM_formula_formula_formulaPubRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formula_formulaPubRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_formulaPubRef";
		condobj.modelAlias="formula";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formula_formulaPubRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formula_formulaPubRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formula_formulaPubRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formula_formulaPubRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formula_formulaPubRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name="'+ec_RM_formula_formula_formulaPubRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formula_formulaPubRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formula_formula_formulaPubRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formula_formulaPubRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formula_formulaPubRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formula_formulaPubRef_condition').val();
		
		url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_formulaPubRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	  	datatable_ec_RM_formula_formula_formulaPubRef_query.setRequestDataUrl(url,dataPost,sortFlag);
		return false;
		
	};
	
	RM.formula.formula.formulaPubRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formula.formulaPubRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formula.formulaPubRef._prefix += '.';
			}
			RM.formula.formula.formulaPubRef._prefix += arr[i];
		}
		RM.formula.formula.formulaPubRef._suffix = arr[arr.length -1];
		if(RM.formula.formula.formulaPubRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formula.formulaPubRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formula.formulaPubRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formula.formulaPubRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formula.formulaPubRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name="'+RM.formula.formula.formulaPubRef._prefix + '.' + RM.formula.formula.formulaPubRef._suffix +'"]').val(obj[0][RM.formula.formula.formulaPubRef._suffix]);
		CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name="'+RM.formula.formula.formulaPubRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name^="'+RM.formula.formula.formulaPubRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name="'+RM.formula.formula.formulaPubRef._prefix + '.' + RM.formula.formula.formulaPubRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formula_formulaPubRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.formula.formulaPubRef._dialog) {
			RM.formula.formula.formulaPubRef._dialog.close();
		}
	};
	
	RM.formula.formula.formulaPubRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formula.formulaPubRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.formulaPubRef.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formula_formulaPubRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formula.formulaPubRef.sendBackformulaPubRef(null,datatable_ec_RM_formula_formula_formulaPubRef_query.getSelectedRow()[0]);
	};
	// 供外部调用
	specialPermission__callbackFunction = function(){
		if(datatable_ec_RM_formula_formula_formulaPubRef_query.getSelectedRow().length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		return RM.formula.formula.formulaPubRef.sendBackformulaPubRef(null,datatable_ec_RM_formula_formula_formulaPubRef_query.getSelectedRow()[0]);
	};
	/**
	 * 双击事件
	 * @method RM.formula.formula.formulaPubRef.sendBackformulaPubRef
	 */
	RM.formula.formula.formulaPubRef.sendBackformulaPubRef = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_RM_formula_formula_formulaPubRef_query.getSelectedRow();
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('RM.formula.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formula_formulaPubRef_callBackFuncName").val() != ""){

				<#if (Parameters.openType)?default('page') != 'dialog'>
					<#if (Parameters.openType)?default('page') != 'frame'>
						 if(CUI("#RM_formula_formula_formulaPubRef_callBackFuncName").val() == "specialPermission"){
					  		var flag = eval("parent." + CUI("#RM_formula_formula_formulaPubRef_callBackFuncName").val() + "(arrObj)");
					  	}else {
					  		var flag = eval("opener." + CUI("#RM_formula_formula_formulaPubRef_callBackFuncName").val() + "(arrObj)");
					 	}
					<#else>
				var flag = eval("parent." + CUI("#RM_formula_formula_formulaPubRef_callBackFuncName").val() + "(arrObj)");
					</#if>
				<#else>
				var flag = eval(CUI("#RM_formula_formula_formulaPubRef_callBackFuncName").val() + "(arrObj)");
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
			RM_formula_formula_formulaPubRefErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			RM_formula_formula_formulaPubRefErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
//自定义点击事件
RM_formula_formula_formulaPubRef_refresh = function(node){
RM.formula.formula.formulaPubRef.node = node;
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
	RM.formula.formula.formulaPubRef.query("query");
}

RM_formula_formula_formulaPubRef_getList = function() {
	return "RM.formula.formula.formulaPubRef";
}
RM.formula.formula.formulaPubRef.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formula_formula_formulaPubRefErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formula.formula.formulaPubRef.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formula.formula.formulaPubRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formula_formula_formulaPubRef_fileupload_button",
		handler:function(){
				list_operate_formula_formulaPubRef.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formula.formula.formulaPubRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaPubRef.RM.formula.formula." + params.viewName + ".referenceCopy");
			funcName('formula', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formula.formula.formulaPubRef.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaPubRef.RM.formula.formula." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formula.formula.formulaPubRef.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaPubRef.RM.formula.formula." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function addNewVersion(){ 
							
	if(RM.formula.formula.formulaList.checkSelectedAny()){
		var selectedRow=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow();
		var pendingId=selectedRow[0].pending.id;
		url="/RM/formula/formula/addNewVersion.action?entityCode=RM_7.5.0.0_formula&${getPowerCode('RM_7.5.0.0_formula_formulaList_self')}";
		addNewVersionDialog=new CUI.Dialog({
		title:"${getText('RM.propertydisplayName.randon1487140953580')}",
		url:url,
		modal:true,
		buttons:[
		{
			name:"${getText('ec.customCode.save')}",
			handler:function(){
				var version=$("#formula_edition").val();//版本号
			}
		},
		{
			name:"${getText('ec.common.cancel')}",
			handler:function(){
				this.close();
			}
		}
		]
	});
	   addNewVersionDialog.show();
	}

				};
				function start(){ 
							
	if(RM.formula.formula.formulaList.checkSelectedAny()){
		var ids=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
		CUI.ajax({
			type:'POST',
			url:'/RM/formula/formula/updateActive.action?state=state/state2&ids='+ids,
			success:function(msg){
				try{
				if(msg.dealSuccessFlag==true) {
					workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					RM.formula.formula.formulaList.query('query');
				}
			} catch(e){}
			}
		});
	}

				};
				function stop(){ 
							
	if(RM.formula.formula.formulaList.checkSelectedAny()){
		var ids=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
		CUI.ajax({
			type:'POST',
			url:'/RM/formula/formula/updateActive.action?state=state/state3&ids='+ids,
			success:function(msg){
				try{
				if(msg.dealSuccessFlag==true) {
					workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					RM.formula.formula.formulaList.query('query');
				}
			} catch(e){}
			}
		});
	}

				};
	
	/**
	 * 保存完毕回调
	 * @method RM.formula.formula.callBackInfo
	 */
	RM.formula.formula.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
					var errorBarWidget = eval('RM_formula_formula_formulaPubRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
				} else if(res.operateType == 'delete') {
					var errorBarWidget = eval('RM_formula_formula_formulaPubRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
				}  else if(res.operateType == 'restore') {
					var errorBarWidget = eval('RM_formula_formula_formulaPubRefErrorbarWidget');
					errorBarWidget.show("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
				} 
			setTimeout(function(){
				try{RM.formula.formula.formulaPubRef.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method RM.formula.formula.formulaPubRef.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.formula.formula.formulaPubRef.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.formula.formula.formulaPubRef.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.formula.formula.formulaPubRef.checkSelectedValid = function(type) {
		if(RM.formula.formula.formulaPubRef.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows[i].valid === false){
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
	 * @method RM.formula.formula.formulaPubRef.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.formulaPubRef.checkSelectedAny = function() {
		if(datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.formula.formula.formulaPubRef.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.formulaPubRef.checkSelectedMore = function() {
		if(datatable_ec_RM_formula_formula_formulaPubRef_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.formula.formula.formulaPubRef.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formula.formulaPubRef.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formula.formula.formulaPubRef.otherParams || {};
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
					list_operate_formula_formulaPubRef.CUI('#'+formId).submit();
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
		if ( RM.formula.formula.formulaPubRef.Dlg ) {
			RM.formula.formula.formulaPubRef.Dlg._config.url = url;
			RM.formula.formula.formulaPubRef.Dlg._config.formId = formId;
			RM.formula.formula.formulaPubRef.Dlg.setTitle( title )
			RM.formula.formula.formulaPubRef.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.formula.formulaPubRef.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_formulaPubRef',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.formula.formulaPubRef.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.formula.formulaPubRef.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_formula', element : $('#RM_formula_formula_formulaPubRef_fileupload_button a:eq(1)')});
		}
		RM.formula.formula.formulaPubRef.otherParams = {};
	};

	RM.formula.formula.formulaPubRef.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formula.formula.formulaPubRef.beforeCommonQuery === 'function') {
	   		var ret = RM.formula.formula.formulaPubRef.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formula.formula.formulaPubRef.cancelSelectedNode == 'function') {
	   RM.formula.formula.formulaPubRef.cancelSelectedNode();
	   RM.formula.formula.formulaPubRef.node = null;
	  }
	  if(typeof RM_formula_formula_formulaPubRef_cancelSelectedNode == 'function') {
	   RM_formula_formula_formulaPubRef_cancelSelectedNode();
	   RM.formula.formula.formulaPubRef.node = null;
	  }
	  RM.formula.formula.formulaPubRef.query(type);
	 };
	
	
	
	RM.formula.formula.formulaPubRef.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.formula.formulaPubRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.formula.formulaPubRef.otherParams = {};
	RM.formula.formula.formulaPubRef.otherParams.dialogType = dialogType;
	RM.formula.formula.formulaPubRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formula.formulaPubRef.showDialog(url,formId,title,width,height,viewCode);
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
	var queryFunc = datatable_ec_RM_formula_formula_formulaPubRef_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_formula_formulaPubRef_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formula_formula_formulaPubRef_getLayout == "function"){
    		var layout = RM_formula_formula_formulaPubRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulaPubRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaPubRef_queryWidget._sortKey && ec_RM_formula_formula_formulaPubRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaPubRef_queryWidget._sortKey && ec_RM_formula_formula_formulaPubRef_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formula_formula_formulaPubRef_queryWidget._sortKey && ec_RM_formula_formula_formulaPubRef_queryWidget._sortMethod ? true : false;
		if(typeof RM_formula_formula_formulaPubRef_getLayout == "function"){
			var layout = RM_formula_formula_formulaPubRef_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulaPubRef.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulaPubRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulaPubRef.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulaPubRef.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulaPubRef.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;var edition_start = $('#' + formId + ' input[name^="edition_start"]').val();var edition_end = $('#' + formId + ' input[name^="edition_end"]').val();if(edition_start != null && edition_start != ''){if(!isDecimal(edition_start)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if(edition_end != null && edition_end != ''){if(!isDecimal(edition_end)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="startTime_start"]').val()!= null && $('#' + formId + ' input[name^="startTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="startTime_end"]').val()!= null && $('#' + formId + ' input[name^="startTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_start"]').val()!= null && $('#' + formId + ' input[name^="endTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_end"]').val()!= null && $('#' + formId + ' input[name^="endTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="startTime_start"]').val()!='' && $('#' + formId + ' input[name="startTime_end"]').val()!=''){if($('#' + formId + ' input[name="startTime_start"]').val() > $('#' + formId + ' input[name="startTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="edition_start"]').val()!='' && $('#' + formId + ' input[name="edition_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="edition_start"]').val()) > parseInt($('#' + formId + ' input[name="edition_end"]').val())){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="endTime_start"]').val()!='' && $('#' + formId + ' input[name="endTime_end"]').val()!=''){if($('#' + formId + ' input[name="endTime_start"]').val() > $('#' + formId + ' input[name="endTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulaPubRef,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formula_formulaPubRef' idprefix='ec_RM_formula_formula_formulaPubRef' queryUrl='/RM/formula/formula/formulaPubRef-query.action' queryFunc="RM.formula.formula.formulaPubRef.query" ns="RM.formula.formula.formulaPubRef" />
<@exportexcel action="/RM/formula/formula/formulaPubRef-query.action"   getRequireDataAction="/RM/formula/formula/formulaPubRef-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_Formula&&viewCode=RM_7.5.0.0_formula_formulaPubRef" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_formulaPubRef')}" prefix="ec_RM_formula_formula_formulaPubRef_query" modelCode="RM_7.5.0.0_formula_Formula"  importFlag="false" viewCode="RM_7.5.0.0_formula_formulaPubRef" />