<!-- X6Basic_1.0/mailServer/dbView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1404798517189')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_mailServer_dbView,head,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.mailServer.mailServer.dbView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_mailServer_mailServer">
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
<#assign callbackName ="X6Basic.mailServer.mailServer.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="X6Basic_mailServer_mailServer_dbView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="X6Basic_mailServer_mailServer_dbView_form" cssStyle="height:100%;" hiddenField="mailServer.id," onsubmitMethod="X6Basic.mailServer.mailServer.dbView.beforeSubmitMethod()" ecAction="/X6Basic/mailServer/mailServer/dbView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="dbView">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_mailServer_dbView">
	<input type="hidden" name="datagridKey" value="X6Basic_mailServer_mailServer_dbView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="mailServer.version" value="${(mailServer.version)!0}" />
	<input type="hidden" name="mailServer.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="mailServer.id" value="${(mailServer.id)!""}"/>
	<div id="X6Basic_dbView_edit_div" style="height:100%">
		<div id="X6Basic_mailServer_mailServer_dbView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "X6Basic_mailServer_mailServer_dbView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_mailServer', null, function(){
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404797961791')}" >${getText('X6Basic.propertydisplayName.radion1404797961791')}</label>
				</td>
				
						<#assign mailServer_code_defaultValue  = ''>
							 							<#assign mailServer_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="mailServer.code" id="mailServer_code"  style=";" originalvalue="<#if !newObj || (mailServer.code)?has_content>${(mailServer.code?html)!}<#else>${mailServer_code_defaultValue!}</#if>" value="<#if !newObj || (mailServer.code)?has_content>${(mailServer.code?html)!}<#else>${mailServer_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404798074853')}" >${getText('X6Basic.propertydisplayName.radion1404798074853')}</label>
				</td>
				
						<#assign mailServer_name_defaultValue  = ''>
							 							<#assign mailServer_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="mailServer.name" id="mailServer_name"  style=";" originalvalue="<#if !newObj || (mailServer.name)?has_content>${(mailServer.name?html)!}<#else>${mailServer_name_defaultValue!}</#if>" value="<#if !newObj || (mailServer.name)?has_content>${(mailServer.name?html)!}<#else>${mailServer_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404797591211')}" >${getText('X6Basic.propertydisplayName.radion1404797591211')}</label>
				</td>
				
						<#assign mailServer_dbType_defaultValue  = 'DBType/MySQL'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${mailServer_dbType_defaultValue!}" formId="X6Basic_mailServer_mailServer_dbView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="mailServer.dbType.id" code="DBType" value="${(mailServer.dbType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="X6Basic_mailServer_mailServer_dbView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="mailServer.dbType.id" code="DBType" value="${(mailServer.dbType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404797796307')}" >${getText('X6Basic.propertydisplayName.radion1404797796307')}</label>
				</td>
				
						<#assign mailServer_dbName_defaultValue  = ''>
							 							<#assign mailServer_dbName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="mailServer.dbName" id="mailServer_dbName"  style=";" originalvalue="<#if !newObj || (mailServer.dbName)?has_content>${(mailServer.dbName?html)!}<#else>${mailServer_dbName_defaultValue!}</#if>" value="<#if !newObj || (mailServer.dbName)?has_content>${(mailServer.dbName?html)!}<#else>${mailServer_dbName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404797689695')}" >${getText('X6Basic.propertydisplayName.radion1404797689695')}</label>
				</td>
				
						<#assign mailServer_userName_defaultValue  = ''>
							 							<#assign mailServer_userName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="mailServer.userName" id="mailServer_userName"  style=";" originalvalue="<#if !newObj || (mailServer.userName)?has_content>${(mailServer.userName?html)!}<#else>${mailServer_userName_defaultValue!}</#if>" value="<#if !newObj || (mailServer.userName)?has_content>${(mailServer.userName?html)!}<#else>${mailServer_userName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404797705054')}" >${getText('X6Basic.propertydisplayName.radion1404797705054')}</label>
				</td>
				
						<#assign mailServer_psw_defaultValue  = ''>
							 							<#assign mailServer_psw_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
							<input id="mailServer.psw" style="display:none" type="password" autocomplete="off"/>
							<input property_type="PASSWORD" name="mailServer.psw" style=";" originalvalue="${(mailServer.psw)!}" value="${(mailServer.psw)!}" type="password" class="cui-noborder-input" readonly="readonly" />
							</div>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404797638555')}" >${getText('X6Basic.propertydisplayName.radion1404797638555')}</label>
				</td>
				
						<#assign mailServer_url_defaultValue  = ''>
							 							<#assign mailServer_url_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="mailServer.url" id="mailServer_url"  style=";" originalvalue="<#if !newObj || (mailServer.url)?has_content>${(mailServer.url?html)!}<#else>${mailServer_url_defaultValue!}</#if>" value="<#if !newObj || (mailServer.url)?has_content>${(mailServer.url?html)!}<#else>${mailServer_url_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1404797742331')}" >${getText('X6Basic.propertydisplayName.radion1404797742331')}</label>
				</td>
				
						<#assign mailServer_dbMemo_defaultValue  = ''>
							 							<#assign mailServer_dbMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="LONGTEXT" id="mailServer_dbMemo" originalvalue="<#if !newObj || (mailServer.dbMemo)?has_content>${(mailServer.dbMemo?html)!}<#else>${mailServer_dbMemo_defaultValue?html}</#if>"  name="mailServer.dbMemo" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (mailServer.dbMemo)?has_content>${(mailServer.dbMemo)!}<#else>${mailServer_dbMemo_defaultValue}</#if></textarea></div>
							
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
<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_mailServer_dbView,html,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	X6Basic.mailServer.mailServer.dbView.beforeSaveProcess = function(){}
	X6Basic.mailServer.mailServer.dbView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.mailServer.mailServer.dbView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_mailServer_mailServer_dbView_form').trigger('beforeSubmit');
		//mailServer.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="mailServer.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#X6Basic_mailServer_mailServer_dbView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#X6Basic_mailServer_mailServer_dbView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	X6Basic.mailServer.mailServer.dbView.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.mailServer.mailServer.dbView.print = function(url){
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
		
		X6Basic.mailServer.mailServer.dbView.saveSetting = function(){
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
		X6Basic.mailServer.mailServer.dbView.printSetting = function(){
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
			X6Basic.mailServer.mailServer.dbView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.mailServer.mailServer.dbView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				X6Basic.mailServer.mailServer.dbView.settingDialog.show();
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
			X6Basic.mailServer.mailServer.dbView._customCallBack = customCallBack;
		}
		X6Basic.mailServer.mailServer.dbView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#X6Basic_mailServer_mailServer_dbView_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_mailServer_mailServer_dbView_fileupload"></div>');
			}
			X6Basic.mailServer.mailServer.dbView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_mailServer_mailServer_dbView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_mailServer_mailServer_dbView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.mailServer.mailServer.dbView.infoDialog.show();
			if($('#X6Basic_mailServer_mailServer_dbView_fileupload').html() == '') {
				$('#X6Basic_mailServer_mailServer_dbView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_mailServer_mailServer&entityCode=X6Basic_1.0_mailServer&dialogId="+dialogId);
			}
		}
	//参照复制函数
	X6Basic.mailServer.mailServer.dbView.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.mailServer.mailServer.dbView.referenceCopyBackInfo";
		X6Basic.mailServer.mailServer.dbView.dialog = dialog;
		X6Basic.mailServer.mailServer.dbView._dialog = foundation.common.select({
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
	
	X6Basic.mailServer.mailServer.dbView.referenceCopyBackInfo = function(obj){
		if(X6Basic.mailServer.mailServer.dbView._dialog){
			X6Basic.mailServer.mailServer.dbView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,X6Basic.mailServer.mailServer.dbView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_mailServer_mailServer_dbView_form','X6Basic_mailServer_mailServer_dbView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.mailServer.mailServer.dbView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.mailServer.mailServer.dbView.dialog._el).load('/X6Basic/mailServer/mailServer/dbView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( X6Basic.mailServer.mailServer.dbView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + X6Basic.mailServer.mailServer.dbView.dialog._config.iframe, X6Basic.mailServer.mailServer.dbView.dialog._dialog ).prop( 'src', '/X6Basic/mailServer/mailServer/dbView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(X6Basic.mailServer.mailServer.dbView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.mailServer.mailServer.dbView.dialog._el).load('/X6Basic/mailServer/mailServer/dbView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.mailServer.mailServer.dbView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.mailServer.mailServer.dbView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.mailServer.mailServer.dbView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.mailServer.mailServer.dbView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.mailServer.mailServer.dbView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'X6Basic_mailServer_mailServer_dbView' + '_' + extraFrameParam;
		var callbackName="";
		X6Basic.mailServer.mailServer.dbView._prefix = '';
		X6Basic.mailServer.mailServer.dbView._oGrid = oGrid;
		X6Basic.mailServer.mailServer.dbView._sUrl = url;
		if(customCallBack){
			X6Basic.mailServer.mailServer.dbView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.mailServer.mailServer.dbView.gridEventObj = gridEventObj;
			callbackName = "X6Basic.mailServer.mailServer.dbView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.mailServer.mailServer.dbView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.mailServer.mailServer.dbView.getMultiselectCallBackInfo_DG" : "X6Basic.mailServer.mailServer.dbView.getcallBackInfo_DG";
			X6Basic.mailServer.mailServer.dbView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.mailServer.mailServer.dbView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.mailServer.mailServer.dbView.getcallBackInfo";
		}
		if(X6Basic.mailServer.mailServer.dbView._prefix!=''){
			X6Basic.mailServer.mailServer.dbView._prefix = X6Basic.mailServer.mailServer.dbView._prefix.substring(1);
		}
		if(X6Basic.mailServer.mailServer.dbView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.mailServer.mailServer.dbView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.mailServer.mailServer.dbView._querycustomFuncN == "function") {
				refparam += X6Basic.mailServer.mailServer.dbView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.mailServer.mailServer.dbView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.mailServer.mailServer.dbView._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.mailServer.mailServer.dbView.query_"+obj+")!='undefined'") ? eval('X6Basic.mailServer.mailServer.dbView.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.mailServer.mailServer.dbView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_mailServer_mailServer_dbView_form',obj[0], X6Basic.mailServer.mailServer.dbView._prefix, X6Basic.mailServer.mailServer.dbView._sUrl);
		CUI.commonFills('X6Basic_mailServer_mailServer_dbView_form',X6Basic.mailServer.mailServer.dbView._prefix,obj[0]);

		try{
			if(X6Basic.mailServer.mailServer.dbView._customCallBack) {
				eval(X6Basic.mailServer.mailServer.dbView._customCallBack);
				X6Basic.mailServer.mailServer.dbView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.mailServer.mailServer.dbView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.mailServer.mailServer.dbView.getcallBackInfo_DG_IE = function(obj){
		if(X6Basic.mailServer.mailServer.dbView._customBeforeCallBack) {
			var flag = eval(X6Basic.mailServer.mailServer.dbView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = X6Basic.mailServer.mailServer.dbView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.mailServer.mailServer.dbView._sUrl);
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
			if(X6Basic.mailServer.mailServer.dbView._customCallBack) {
				eval(X6Basic.mailServer.mailServer.dbView._customCallBack);
				X6Basic.mailServer.mailServer.dbView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.mailServer.mailServer.dbView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.mailServer.mailServer.dbView.getcallBackInfo_DG = function(obj){
		if(X6Basic.mailServer.mailServer.dbView._customBeforeCallBack) {
			var flag = eval(X6Basic.mailServer.mailServer.dbView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.mailServer.mailServer.dbView._currRow).next().length==0){
					X6Basic.mailServer.mailServer.dbView._oGrid.addNewRow();
				}	
				X6Basic.mailServer.mailServer.dbView._currRow = $(X6Basic.mailServer.mailServer.dbView._currRow).next();
				$(X6Basic.mailServer.mailServer.dbView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.mailServer.mailServer.dbView._currRow,obj[i],X6Basic.mailServer.mailServer.dbView._prefix,X6Basic.mailServer.mailServer.dbView._sUrl);
			eval("CUI.commonFills_DG(X6Basic.mailServer.mailServer.dbView._currRow,X6Basic.mailServer.mailServer.dbView._prefix,obj[i],X6Basic.mailServer.mailServer.dbView._oGrid)");
		}
		try{
			if(X6Basic.mailServer.mailServer.dbView._customCallBack) {
				eval(X6Basic.mailServer.mailServer.dbView._customCallBack);
				X6Basic.mailServer.mailServer.dbView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.mailServer.mailServer.dbView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.mailServer.mailServer.dbView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.mailServer.mailServer.dbView._oGrid, X6Basic.mailServer.mailServer.dbView._currRow, X6Basic.mailServer.mailServer.dbView._key, X6Basic.mailServer.mailServer.dbView._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.mailServer.mailServer.dbView._customCallBack) {
				eval(X6Basic.mailServer.mailServer.dbView._customCallBack);
				X6Basic.mailServer.mailServer.dbView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.mailServer.mailServer.dbView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.mailServer.mailServer.dbView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.mailServer.mailServer.dbView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_mailServer_mailServer_dbView_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.mailServer.mailServer.dbView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.mailServer.mailServer.dbView.initCount = 0;
	X6Basic.mailServer.mailServer.dbView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#X6Basic_dbView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('X6Basic_mailServer_mailServer_dbView_datagrids');	
		var	conHeight = h-$("#X6Basic_mailServer_mailServer_dbView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_mailServer_mailServer_dbView_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.mailServer.mailServer.dbView.initCount <= 2) {
								setTimeout(function(){X6Basic.mailServer.mailServer.dbView.initSize();}, 200);
								X6Basic.mailServer.mailServer.dbView.initCount++;
							}/* else {
								X6Basic.mailServer.mailServer.dbView.initCount = 0;
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
		X6Basic.mailServer.mailServer.dbView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    X6Basic.mailServer.mailServer.dbView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){X6Basic.mailServer.mailServer.dbView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-VIEW-X6Basic_1.0_mailServer_dbView,js,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>