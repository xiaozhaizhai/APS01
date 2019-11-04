<!-- MESBasic_1/container/expressionEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1555312925387')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_container_expressionEdit,head,MESBasic_1_container_FunctionInfo,MESBasic_1) -->
<!-- 自定义代码 -->
 <style type="text/css">

  </style>
<!-- CUSTOM CODE END -->

</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
.edit-content-dialog-fullwidth .edit-tabs {width: 100%;margin-left: 0;}
</style>
<script type="text/javascript">
	CUI.ns('MESBasic.container.functionInfo.expressionEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_container_functionInfo">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "create">
<#assign newObj = editNew!true >
<#if newObj>
<#assign viewType = "create">
<#else>
<#assign viewType = "edit">
</#if>
<#if refId?? && (refId>0)>
	<#assign newObj = false >
</#if>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign callbackName ="MESBasic.container.functionInfo.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_container_functionInfo_expressionEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_container_functionInfo_expressionEdit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="MESBasic.container.functionInfo.expressionEdit.beforeSubmitMethod()" ecAction="/MESBasic/container/functionInfo/expressionEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="expressionEdit">
	<input type="hidden" name="viewCode" value="MESBasic_1_container_expressionEdit">
	<input type="hidden" name="datagridKey" value="MESBasic_container_functionInfo_expressionEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="functionInfo.version" value="${(functionInfo.version)!0}" />
	<input type="hidden" name="functionInfo.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="MESBasic_expressionEdit_edit_div" style="height:100%">
		<div id="MESBasic_container_functionInfo_expressionEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_container_functionInfo_expressionEdit_form"+"_attcount";
function fileCountSpan(fileuploadLinkId,fileuploadType){
	if(!fileuploadLinkId) {
		fileuploadLinkId = '${fileuploadLinkId!}'
	}
	if(!fileuploadType) {
		fileuploadType = '${fileuploadType!}'
	}
	CUI.ajax({
		type : "POST",
		url : '/foundation/workbench/upload-count.action?linkId=' + fileuploadLinkId + '&type=' + fileuploadType,
		success : function(msg){
			try{
				if(msg!=null) {
					var fileCount = parseInt(msg);
					$('.total').show();
					//去掉两边的括号字符
					CUI('#'+attcountid).html(fileCount);
				}
			} catch(e){}
		}
	});
};
$(function(){
	var fileuploadLinkId= '${fileuploadLinkId!}';
	if(fileuploadLinkId != '') {
		fileCountSpan(fileuploadLinkId, '${fileuploadType}');
	}
	<#if hasAttachment?? && hasAttachment && false>
	$('#attachmentLi').one('click', function(){
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_container', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:24%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:24%'></td><td style='height:0px;border:none;width:17%'></td></tr>
		<tr class="dialog_tr">
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1555313031134')}" >${getText('MESBasic.propertydisplayName.radion1555313031134')}</label>
				</td>
				
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1555313049451')}" >${getText('MESBasic.propertydisplayName.radion1555313049451')}</label>
				</td>
				
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1555313073893')}" >${getText('MESBasic.propertydisplayName.radion1555313073893')}</label>
				</td>
				
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1555313085151')}" >${getText('MESBasic.propertydisplayName.radion1555313085151')}</label>
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1555292675727')}" >${getText('MESBasic.propertydisplayName.randon1555292675727')}</label>
				</td>
				
						<#assign functionInfo_expression_defaultValue  = ''>
							 							<#assign functionInfo_expression_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="functionInfo_expression" originalvalue="<#if !newObj || (functionInfo.expression)?has_content>${(functionInfo.expression?html)!}<#else>${functionInfo_expression_defaultValue?html}</#if>"  name="functionInfo.expression" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (functionInfo.expression)?has_content>${(functionInfo.expression)!}<#else>${functionInfo_expression_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr class="dialog_tr">
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td nullable=true class="edit-table-symbol"  colspan="3" align="left" style="text-align: left;;" >
							<label style="width:100%;padding-left:5px;;" value="${getText('MESBasic.propertydisplayName.radion1555932746075')}" >${getText('MESBasic.propertydisplayName.radion1555932746075')}</label>
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_container_expressionEdit,html,MESBasic_1_container_FunctionInfo,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.container.functionInfo.expressionEdit.beforeSaveProcess = function(){}
	MESBasic.container.functionInfo.expressionEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.container.functionInfo.expressionEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_container_functionInfo_expressionEdit_form').trigger('beforeSubmit');
		//functionInfo.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="functionInfo.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_container_functionInfo_expressionEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_container_functionInfo_expressionEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.container.functionInfo.expressionEdit.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.container.functionInfo.expressionEdit.print = function(url){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
						}
					}
				});
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				var data="";
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i];
						if(data!=""){
							data = data + "&" + item;
						}else{
							data = item;
						}
					}
				}else{
					data = "mainContent=true&attachmentInfo=true&dealInfo=true";
				}
				
				//var url = document.location.href;
				if(url!=undefined && url != null && url !=''){
					var index = url.indexOf(".action");
					var index0 = url.indexOf(".action?");
					if(index0 != -1){
						data = "&" + data;
					}else{
						data = "?" + data;
					}
					if(index != -1){
						var newUrl = url.substring(0,index) + "Print" + url.substring(index) + data;
						window.open(newUrl);
					}
				}
			}
		}
		
		MESBasic.container.functionInfo.expressionEdit.saveSetting = function(){
			var url = "/ec/print/saveSetting.action";
			var value = "mainContent="+$('#mainContent').prop('checked')+ "|attachmentInfo="+$('#attachmentInfo').prop('checked') +  "|dealInfo="+$('#dealInfo').prop('checked');
			var flag = false;
			$.ajax({
				url : url,
				type : 'post',
				async : false,
				data:{"printCookie.value": value, "printCookie.type":$('input[name="viewCode"]').val(),"printCookie.id":$('#printCookie_id').val(),"printCookie.version":$('#printCookie_version').val()},
				success : function(json) {flag = true;}
			});
			return flag;
		}
		
		var isPrintSettingDialogShow = false;//判断打印设置窗口是否打开，防止重复打开
		MESBasic.container.functionInfo.expressionEdit.printSetting = function(){
			if(typeof isPrintSettingDialogShow != 'undefined' && isPrintSettingDialogShow === true){
				return;
			}
			var url = "/ec/print/getSetting.action?printCookie.type=" + $('input[name="viewCode"]').val();
			<#if isWorkflow?? && isWorkflow>
			url = url + "&isWorkflow=true";
			<#else>
			url = url + "&isWorkflow=false";
			</#if>
			<#if isAttachment?? && isAttachment>
			url = url + "&isAttachment=true";
			<#else>
			url = url + "&isAttachment=false";
			</#if>
			MESBasic.container.functionInfo.expressionEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.container.functionInfo.expressionEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.container.functionInfo.expressionEdit.settingDialog.show();
				isPrintSettingDialogShow = true;
		}
	
	//控件版PT选人查看按钮单击事件处理函数
	function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
		//保存当前单击事件的对象信息
		var obj = {
			"oGrid" : oGrid,
			"nRow" : nRow - 1,
			"sKey":	sFieldName
		}
		if(customCallBack){
			MESBasic.container.functionInfo.expressionEdit._customCallBack = customCallBack;
		}
		MESBasic.container.functionInfo.expressionEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_container_functionInfo_expressionEdit_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_container_functionInfo_expressionEdit_fileupload"></div>');
			}
			MESBasic.container.functionInfo.expressionEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_container_functionInfo_expressionEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_container_functionInfo_expressionEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.container.functionInfo.expressionEdit.infoDialog.show();
			if($('#MESBasic_container_functionInfo_expressionEdit_fileupload').html() == '') {
				$('#MESBasic_container_functionInfo_expressionEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_container_functionInfo&entityCode=MESBasic_1_container&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.container.functionInfo.expressionEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.container.functionInfo.expressionEdit.referenceCopyBackInfo";
		MESBasic.container.functionInfo.expressionEdit.dialog = dialog;
		MESBasic.container.functionInfo.expressionEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			iframe:'reference_copy_edit',
			</#if>
			
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	MESBasic.container.functionInfo.expressionEdit.referenceCopyBackInfo = function(obj){
		if(MESBasic.container.functionInfo.expressionEdit._dialog){
			MESBasic.container.functionInfo.expressionEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.container.functionInfo.expressionEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_container_functionInfo_expressionEdit_form','MESBasic_container_functionInfo_expressionEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.container.functionInfo.expressionEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.container.functionInfo.expressionEdit.dialog._el).load('/MESBasic/container/functionInfo/expressionEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
						closeLoadPanel();
						try{
							StrutsUtilsOnLoad();
						}catch(e){}
						try{
							if(me._config.onload != undefined) eval(me._config.onload + "(me)");
						}catch(e){}
				});
			});
		}else{
		</#if>
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			parent.$( MESBasic.container.functionInfo.expressionEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.container.functionInfo.expressionEdit.dialog._config.iframe, MESBasic.container.functionInfo.expressionEdit.dialog._dialog ).prop( 'src', '/MESBasic/container/functionInfo/expressionEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.container.functionInfo.expressionEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.container.functionInfo.expressionEdit.dialog._el).load('/MESBasic/container/functionInfo/expressionEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
			</#if>
				
			
		<#if viewType != "readonly">
		}
		</#if>
	};
	
	MESBasic.container.functionInfo.expressionEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.container.functionInfo.expressionEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.container.functionInfo.expressionEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.container.functionInfo.expressionEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.container.functionInfo.expressionEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_container_functionInfo_expressionEdit' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.container.functionInfo.expressionEdit._prefix = '';
		MESBasic.container.functionInfo.expressionEdit._oGrid = oGrid;
		MESBasic.container.functionInfo.expressionEdit._sUrl = url;
		if(customCallBack){
			MESBasic.container.functionInfo.expressionEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.container.functionInfo.expressionEdit.gridEventObj = gridEventObj;
			callbackName = "MESBasic.container.functionInfo.expressionEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.container.functionInfo.expressionEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.container.functionInfo.expressionEdit.getMultiselectCallBackInfo_DG" : "MESBasic.container.functionInfo.expressionEdit.getcallBackInfo_DG";
			MESBasic.container.functionInfo.expressionEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.container.functionInfo.expressionEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.container.functionInfo.expressionEdit.getcallBackInfo";
		}
		if(MESBasic.container.functionInfo.expressionEdit._prefix!=''){
			MESBasic.container.functionInfo.expressionEdit._prefix = MESBasic.container.functionInfo.expressionEdit._prefix.substring(1);
		}
		if(MESBasic.container.functionInfo.expressionEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.container.functionInfo.expressionEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.container.functionInfo.expressionEdit._querycustomFuncN == "function") {
				refparam += MESBasic.container.functionInfo.expressionEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.container.functionInfo.expressionEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.container.functionInfo.expressionEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.container.functionInfo.expressionEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.container.functionInfo.expressionEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.container.functionInfo.expressionEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_container_functionInfo_expressionEdit_form',obj[0], MESBasic.container.functionInfo.expressionEdit._prefix, MESBasic.container.functionInfo.expressionEdit._sUrl);
		CUI.commonFills('MESBasic_container_functionInfo_expressionEdit_form',MESBasic.container.functionInfo.expressionEdit._prefix,obj[0]);

		try{
			if(MESBasic.container.functionInfo.expressionEdit._customCallBack) {
				eval(MESBasic.container.functionInfo.expressionEdit._customCallBack);
				MESBasic.container.functionInfo.expressionEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.container.functionInfo.expressionEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.container.functionInfo.expressionEdit.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.container.functionInfo.expressionEdit._customBeforeCallBack) {
			var flag = eval(MESBasic.container.functionInfo.expressionEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.container.functionInfo.expressionEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.container.functionInfo.expressionEdit._sUrl);
		var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
		for( var i = 0; i < xmlHead.children().length; i++ ){
			var tagName = xmlHead.children()[i].tagName;
			if( tagName.indexOf(rootKey) == 0 ){
				try{
					var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
				}catch(e){
					var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
				}
				//判断符合条件的key是否存在
				if(value != undefined){
					gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
				}	
			}
		}
		try{
			if(MESBasic.container.functionInfo.expressionEdit._customCallBack) {
				eval(MESBasic.container.functionInfo.expressionEdit._customCallBack);
				MESBasic.container.functionInfo.expressionEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.container.functionInfo.expressionEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.container.functionInfo.expressionEdit.getcallBackInfo_DG = function(obj){
		if(MESBasic.container.functionInfo.expressionEdit._customBeforeCallBack) {
			var flag = eval(MESBasic.container.functionInfo.expressionEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.container.functionInfo.expressionEdit._currRow).next().length==0){
					MESBasic.container.functionInfo.expressionEdit._oGrid.addNewRow();
				}	
				MESBasic.container.functionInfo.expressionEdit._currRow = $(MESBasic.container.functionInfo.expressionEdit._currRow).next();
				$(MESBasic.container.functionInfo.expressionEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.container.functionInfo.expressionEdit._currRow,obj[i],MESBasic.container.functionInfo.expressionEdit._prefix,MESBasic.container.functionInfo.expressionEdit._sUrl);
			eval("CUI.commonFills_DG(MESBasic.container.functionInfo.expressionEdit._currRow,MESBasic.container.functionInfo.expressionEdit._prefix,obj[i],MESBasic.container.functionInfo.expressionEdit._oGrid)");
		}
		try{
			if(MESBasic.container.functionInfo.expressionEdit._customCallBack) {
				eval(MESBasic.container.functionInfo.expressionEdit._customCallBack);
				MESBasic.container.functionInfo.expressionEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.container.functionInfo.expressionEdit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.container.functionInfo.expressionEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.container.functionInfo.expressionEdit._oGrid, MESBasic.container.functionInfo.expressionEdit._currRow, MESBasic.container.functionInfo.expressionEdit._key, MESBasic.container.functionInfo.expressionEdit._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.container.functionInfo.expressionEdit._customCallBack) {
				eval(MESBasic.container.functionInfo.expressionEdit._customCallBack);
				MESBasic.container.functionInfo.expressionEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.container.functionInfo.expressionEdit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.container.functionInfo.expressionEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.container.functionInfo.expressionEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_container_functionInfo_expressionEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			var length = $("#MESBasic_expressionEdit_edit_div .dialog_tr:eq(0) label").length;

for (var i = 0; i < length; i++) {
	// 给按钮增加点击事件
	$("#MESBasic_expressionEdit_edit_div .dialog_tr:eq(0) label").eq(i).attr("onclick","selectFunction(event, " + i + ")");
	
	// 重新设置宽度
	var td = $("#MESBasic_container_functionInfo_expressionEdit_main_div .edit-table:eq(0) tr:eq(0) td").eq(i);
	if (i == 0) {
		td.css('width', '14%');
	} else {
		td.css('width', '17%');
	}
}

for(var i = 1; i < length+1; i++){
	var tdObj = $("#MESBasic_expressionEdit_edit_div .edit-table").eq(0).find('tr').eq(1).find('td').eq(i);
	var innerHTML = tdObj.html();
	// 将label替换成button
	innerHTML = innerHTML.replace('label','button').replace('label','button');
	tdObj.html(innerHTML);

	// 按钮颜色设置为蓝色
	tdObj.find('button').css('background-color', 'rgb(43, 129, 203)');

	// 按钮内文字颜色设置为白色
	tdObj.find('button').css('color', 'white');
}

// 将父页面的计算公式带出来
var parentFormula = $("[name='container.volumneCalc']").val();
if (parentFormula) {
	$("[name='functionInfo.expression']").val(parentFormula);
}
		});
	})(jQuery);
	MESBasic.container.functionInfo.expressionEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.container.functionInfo.expressionEdit.initCount = 0;
	MESBasic.container.functionInfo.expressionEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_expressionEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_container_functionInfo_expressionEdit_datagrids');	
		var	conHeight = h-$("#MESBasic_container_functionInfo_expressionEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_container_functionInfo_expressionEdit_main_div .edit-panes-s").each(function(index){
			//多页签切换时只计算本页签下的PT高度
			if(nTabIndex != undefined && typeof(nTabIndex) == 'number' && index != nTabIndex){
				return;
			}
			thisHeight = $(this).height();
			var datatableHeight = conHeight - panesHeight;
			if(datagrids&&datagrids.length>index&&datagrids[index].length>0) {
				if(thisHeight > panesHeight) {
					$(this).parent().height(panesHeight);
					$(this).parent().css("overflow-y","auto");
				} else {
					if(thisHeight && thisHeight > 0) {
						$(this).parent().height(thisHeight);
					}
					datatableHeight = conHeight - thisHeight;
				}
			} else {
				if(thisHeight > conHeight) {
					$(this).parent().height(conHeight);
					$(this).parent().css("overflow-y","auto");
				} else if(thisHeight && thisHeight > 0) {
					$(this).parent().height(thisHeight);
				}
			}
			if(datagrids && datagrids.length > 0) {
				if(datagrids[index].length > 0) {
					datatableHeight = datatableHeight - 15;
					var perHeight = datatableHeight/datagrids[index].length;
					for(var dg=0;dg<datagrids[index].length;dg++) {
						
						var dgwidget = eval(datagrids[index][dg]+'Widget');
						
						if(dgwidget) {
							
							dgwidget.setHeight(perHeight - 68);
							
						} else {
							if(MESBasic.container.functionInfo.expressionEdit.initCount <= 2) {
								setTimeout(function(){MESBasic.container.functionInfo.expressionEdit.initSize();}, 200);
								MESBasic.container.functionInfo.expressionEdit.initCount++;
							}/* else {
								MESBasic.container.functionInfo.expressionEdit.initCount = 0;
							}*/
						}
					}
				}
			} else {
				//$(this).parent().height(conHeight-30);
				$(this).parent().height(conHeight-7); //为什么减去7呢，因为要跟底部框保持一定的距离 by xudihui
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		MESBasic.container.functionInfo.expressionEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.container.functionInfo.expressionEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.container.functionInfo.expressionEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-MESBasic_1_container_expressionEdit,js,MESBasic_1_container_FunctionInfo,MESBasic_1) */
// 自定义代码

        // 选择函数后触发的事件
        function selectFunction(event, type){
            // 阻止事件(包括冒泡和默认行为)
            /*event.stopPropagation();
            event.preventDefault();*/
          	YAHOO.util.Event.stopEvent(event);

            var context;
         	var index;

            switch(type){
                // π
                case 0 : 
                    context = "π";
                    index = 0;
                    break;
                // asin三角函数
                case 1 : 
                    context = "asin()";
                    index = 1;
                    break;
                // 幂函数
                case 2 : 
                    context = "pow(,)";
                    index = 2;
                    break;
                // if条件	
                case 3 : 
                    context = "if(){}else{}";
                    index = 9;
                    break;
				// 加法	
                case 4 : 
                    context = "+";
                    index = 0;
                    break;
				// 减法	
                case 5 : 
                    context = "-";
                    index = 0;
                    break;
				// 乘法	
                case 6 : 
                    context = "*";
                    index = 0;
                    break;
				// 除法	
                case 7 : 
                    context = "/";
                    index = 0;
                    break;
            }

            if (context) {
                var charvalue = context;
                var obj = document.getElementById("functionInfo_expression");
                obj.focus(); 
                var leng = obj.value.length;
                if (document.selection) {
                    var sel = document.selection.createRange();
                    sel.text = charvalue;
                } else if (obj.selectionStart || obj.selectionStart == '0') {
                    var startPos = obj.selectionStart;
                    obj.value = obj.value.substr(0,startPos) + charvalue + obj.value.substring(startPos,leng);
                    if (index) {
                        // 函数定位在括号里
                        obj.selectionStart = obj.selectionEnd = startPos + charvalue.length - index;	
                    } 
                } else {
                    obj.value += charvalue;
                }
            }

        }
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>