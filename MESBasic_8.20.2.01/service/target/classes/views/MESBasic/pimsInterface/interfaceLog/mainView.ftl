<!-- MESBasic_1/pimsInterface/mainView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1426818489577')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_pimsInterface_mainView,head,MESBasic_1_pimsInterface_InterfaceLog,MESBasic_1) -->
<!-- 自定义代码 -->

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
	CUI.ns('MESBasic.pimsInterface.interfaceLog.mainView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_pimsInterface_interfaceLog">
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
<#assign viewType = "readonly">
<#assign callbackName ="MESBasic.pimsInterface.interfaceLog.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_pimsInterface_interfaceLog_mainView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_pimsInterface_interfaceLog_mainView_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="MESBasic.pimsInterface.interfaceLog.mainView.beforeSubmitMethod()" ecAction="/MESBasic/pimsInterface/interfaceLog/mainView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="mainView">
	<input type="hidden" name="viewCode" value="MESBasic_1_pimsInterface_mainView">
	<input type="hidden" name="datagridKey" value="MESBasic_pimsInterface_interfaceLog_mainView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="interfaceLog.version" value="${(interfaceLog.version)!0}" />
	<input type="hidden" name="interfaceLog.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="MESBasic_mainView_edit_div" style="height:100%">
		<div id="MESBasic_pimsInterface_interfaceLog_mainView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_pimsInterface_interfaceLog_mainView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_pimsInterface', null, function(){
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426817681043')}" >${getText('MESBasic.propertydisplayName.randon1426817681043')}</label>
				</td>
				
						<#assign interfaceLog_businessDate_defaultValue  = ''>
							 							<#assign interfaceLog_businessDate_defaultValue  = ''>
					<#if (interfaceLog_businessDate_defaultValue)?? &&(interfaceLog_businessDate_defaultValue)?has_content>
							<#assign interfaceLog_businessDate_defaultValue  = getDefaultDateTime(interfaceLog_businessDate_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(interfaceLog.businessDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="interfaceLog.businessDate" value="${interfaceLog_businessDate_defaultValue!}" type="dateTime"  id="interfaceLog.businessDate"  view=true cssStyle=""  />
								
							<#else>
							<#if (interfaceLog.businessDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="interfaceLog.businessDate" value="${interfaceLog.businessDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="interfaceLog.businessDate"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="interfaceLog.businessDate" value="" type="dateTime" id="interfaceLog.businessDate" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426817820570')}" >${getText('MESBasic.propertydisplayName.randon1426817820570')}</label>
				</td>
				
						<#assign interfaceLog_demo_defaultValue  = ''>
							 							<#assign interfaceLog_demo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="interfaceLog_demo" originalvalue="<#if !newObj || (interfaceLog.demo)?has_content>${(interfaceLog.demo?html)!}<#else>${interfaceLog_demo_defaultValue?html}</#if>"  name="interfaceLog.demo" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style="display:60px;" ><#if !newObj || (interfaceLog.demo)?has_content>${(interfaceLog.demo)!}<#else>${interfaceLog_demo_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426817796769')}" >${getText('MESBasic.propertydisplayName.randon1426817796769')}</label>
				</td>
				
						<#assign interfaceLog_logger_defaultValue  = ''>
							 							<#assign interfaceLog_logger_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="LONGTEXT" id="interfaceLog_logger" originalvalue="<#if !newObj || (interfaceLog.logger)?has_content>${(interfaceLog.logger?html)!}<#else>${interfaceLog_logger_defaultValue?html}</#if>"  name="interfaceLog.logger" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style="display:80px;" ><#if !newObj || (interfaceLog.logger)?has_content>${(interfaceLog.logger)!}<#else>${interfaceLog_logger_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_pimsInterface_mainView,html,MESBasic_1_pimsInterface_InterfaceLog,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.pimsInterface.interfaceLog.mainView.beforeSaveProcess = function(){}
	MESBasic.pimsInterface.interfaceLog.mainView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.pimsInterface.interfaceLog.mainView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_pimsInterface_interfaceLog_mainView_form').trigger('beforeSubmit');
		//interfaceLog.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="interfaceLog.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_pimsInterface_interfaceLog_mainView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_pimsInterface_interfaceLog_mainView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.pimsInterface.interfaceLog.mainView.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.pimsInterface.interfaceLog.mainView.print = function(url){
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
		
		MESBasic.pimsInterface.interfaceLog.mainView.saveSetting = function(){
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
		MESBasic.pimsInterface.interfaceLog.mainView.printSetting = function(){
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
			MESBasic.pimsInterface.interfaceLog.mainView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.pimsInterface.interfaceLog.mainView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.pimsInterface.interfaceLog.mainView.settingDialog.show();
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
			MESBasic.pimsInterface.interfaceLog.mainView._customCallBack = customCallBack;
		}
		MESBasic.pimsInterface.interfaceLog.mainView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_pimsInterface_interfaceLog_mainView_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_pimsInterface_interfaceLog_mainView_fileupload"></div>');
			}
			MESBasic.pimsInterface.interfaceLog.mainView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_pimsInterface_interfaceLog_mainView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_pimsInterface_interfaceLog_mainView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.pimsInterface.interfaceLog.mainView.infoDialog.show();
			if($('#MESBasic_pimsInterface_interfaceLog_mainView_fileupload').html() == '') {
				$('#MESBasic_pimsInterface_interfaceLog_mainView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_pimsInterface_interfaceLog&entityCode=MESBasic_1_pimsInterface&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.pimsInterface.interfaceLog.mainView.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.pimsInterface.interfaceLog.mainView.referenceCopyBackInfo";
		MESBasic.pimsInterface.interfaceLog.mainView.dialog = dialog;
		MESBasic.pimsInterface.interfaceLog.mainView._dialog = foundation.common.select({
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
	
	MESBasic.pimsInterface.interfaceLog.mainView.referenceCopyBackInfo = function(obj){
		if(MESBasic.pimsInterface.interfaceLog.mainView._dialog){
			MESBasic.pimsInterface.interfaceLog.mainView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.pimsInterface.interfaceLog.mainView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_pimsInterface_interfaceLog_mainView_form','MESBasic_pimsInterface_interfaceLog_mainView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.pimsInterface.interfaceLog.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.pimsInterface.interfaceLog.mainView.dialog._el).load('/MESBasic/pimsInterface/interfaceLog/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( MESBasic.pimsInterface.interfaceLog.mainView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.pimsInterface.interfaceLog.mainView.dialog._config.iframe, MESBasic.pimsInterface.interfaceLog.mainView.dialog._dialog ).prop( 'src', '/MESBasic/pimsInterface/interfaceLog/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.pimsInterface.interfaceLog.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.pimsInterface.interfaceLog.mainView.dialog._el).load('/MESBasic/pimsInterface/interfaceLog/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.pimsInterface.interfaceLog.mainView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.pimsInterface.interfaceLog.mainView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.pimsInterface.interfaceLog.mainView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.pimsInterface.interfaceLog.mainView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.pimsInterface.interfaceLog.mainView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_pimsInterface_interfaceLog_mainView' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.pimsInterface.interfaceLog.mainView._prefix = '';
		MESBasic.pimsInterface.interfaceLog.mainView._oGrid = oGrid;
		MESBasic.pimsInterface.interfaceLog.mainView._sUrl = url;
		if(customCallBack){
			MESBasic.pimsInterface.interfaceLog.mainView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.pimsInterface.interfaceLog.mainView.gridEventObj = gridEventObj;
			callbackName = "MESBasic.pimsInterface.interfaceLog.mainView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.pimsInterface.interfaceLog.mainView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.pimsInterface.interfaceLog.mainView.getMultiselectCallBackInfo_DG" : "MESBasic.pimsInterface.interfaceLog.mainView.getcallBackInfo_DG";
			MESBasic.pimsInterface.interfaceLog.mainView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.pimsInterface.interfaceLog.mainView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.pimsInterface.interfaceLog.mainView.getcallBackInfo";
		}
		if(MESBasic.pimsInterface.interfaceLog.mainView._prefix!=''){
			MESBasic.pimsInterface.interfaceLog.mainView._prefix = MESBasic.pimsInterface.interfaceLog.mainView._prefix.substring(1);
		}
		if(MESBasic.pimsInterface.interfaceLog.mainView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.pimsInterface.interfaceLog.mainView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.pimsInterface.interfaceLog.mainView._querycustomFuncN == "function") {
				refparam += MESBasic.pimsInterface.interfaceLog.mainView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.pimsInterface.interfaceLog.mainView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.pimsInterface.interfaceLog.mainView._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.pimsInterface.interfaceLog.mainView.query_"+obj+")!='undefined'") ? eval('MESBasic.pimsInterface.interfaceLog.mainView.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.pimsInterface.interfaceLog.mainView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_pimsInterface_interfaceLog_mainView_form',obj[0], MESBasic.pimsInterface.interfaceLog.mainView._prefix, MESBasic.pimsInterface.interfaceLog.mainView._sUrl);
		CUI.commonFills('MESBasic_pimsInterface_interfaceLog_mainView_form',MESBasic.pimsInterface.interfaceLog.mainView._prefix,obj[0]);

		try{
			if(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack) {
				eval(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack);
				MESBasic.pimsInterface.interfaceLog.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.pimsInterface.interfaceLog.mainView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.pimsInterface.interfaceLog.mainView.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.pimsInterface.interfaceLog.mainView._customBeforeCallBack) {
			var flag = eval(MESBasic.pimsInterface.interfaceLog.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.pimsInterface.interfaceLog.mainView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.pimsInterface.interfaceLog.mainView._sUrl);
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
			if(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack) {
				eval(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack);
				MESBasic.pimsInterface.interfaceLog.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.pimsInterface.interfaceLog.mainView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.pimsInterface.interfaceLog.mainView.getcallBackInfo_DG = function(obj){
		if(MESBasic.pimsInterface.interfaceLog.mainView._customBeforeCallBack) {
			var flag = eval(MESBasic.pimsInterface.interfaceLog.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.pimsInterface.interfaceLog.mainView._currRow).next().length==0){
					MESBasic.pimsInterface.interfaceLog.mainView._oGrid.addNewRow();
				}	
				MESBasic.pimsInterface.interfaceLog.mainView._currRow = $(MESBasic.pimsInterface.interfaceLog.mainView._currRow).next();
				$(MESBasic.pimsInterface.interfaceLog.mainView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.pimsInterface.interfaceLog.mainView._currRow,obj[i],MESBasic.pimsInterface.interfaceLog.mainView._prefix,MESBasic.pimsInterface.interfaceLog.mainView._sUrl);
			eval("CUI.commonFills_DG(MESBasic.pimsInterface.interfaceLog.mainView._currRow,MESBasic.pimsInterface.interfaceLog.mainView._prefix,obj[i],MESBasic.pimsInterface.interfaceLog.mainView._oGrid)");
		}
		try{
			if(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack) {
				eval(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack);
				MESBasic.pimsInterface.interfaceLog.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.pimsInterface.interfaceLog.mainView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.pimsInterface.interfaceLog.mainView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.pimsInterface.interfaceLog.mainView._oGrid, MESBasic.pimsInterface.interfaceLog.mainView._currRow, MESBasic.pimsInterface.interfaceLog.mainView._key, MESBasic.pimsInterface.interfaceLog.mainView._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack) {
				eval(MESBasic.pimsInterface.interfaceLog.mainView._customCallBack);
				MESBasic.pimsInterface.interfaceLog.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.pimsInterface.interfaceLog.mainView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.pimsInterface.interfaceLog.mainView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.pimsInterface.interfaceLog.mainView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_pimsInterface_interfaceLog_mainView_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.pimsInterface.interfaceLog.mainView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.pimsInterface.interfaceLog.mainView.initCount = 0;
	MESBasic.pimsInterface.interfaceLog.mainView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_mainView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_pimsInterface_interfaceLog_mainView_datagrids');	
		var	conHeight = h-$("#MESBasic_pimsInterface_interfaceLog_mainView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_pimsInterface_interfaceLog_mainView_main_div .edit-panes-s").each(function(index){
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
							
							dgwidget.setHeight(perHeight - 68 + 20);
							
						} else {
							if(MESBasic.pimsInterface.interfaceLog.mainView.initCount <= 2) {
								setTimeout(function(){MESBasic.pimsInterface.interfaceLog.mainView.initSize();}, 200);
								MESBasic.pimsInterface.interfaceLog.mainView.initCount++;
							}/* else {
								MESBasic.pimsInterface.interfaceLog.mainView.initCount = 0;
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
		MESBasic.pimsInterface.interfaceLog.mainView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.pimsInterface.interfaceLog.mainView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.pimsInterface.interfaceLog.mainView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-VIEW-MESBasic_1_pimsInterface_mainView,js,MESBasic_1_pimsInterface_InterfaceLog,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>