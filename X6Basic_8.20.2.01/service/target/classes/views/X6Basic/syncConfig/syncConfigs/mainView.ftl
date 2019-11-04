<!-- X6Basic_1.0/syncConfig/mainView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1409054469399')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_syncConfig_mainView,head,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.syncConfig.syncConfigs.mainView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_syncConfig_syncConfigs">
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
<#assign callbackName ="X6Basic.syncConfig.syncConfigs.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="X6Basic_syncConfig_syncConfigs_mainView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="X6Basic_syncConfig_syncConfigs_mainView_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="X6Basic.syncConfig.syncConfigs.mainView.beforeSubmitMethod()" ecAction="/X6Basic/syncConfig/syncConfigs/mainView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="mainView">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_syncConfig_mainView">
	<input type="hidden" name="datagridKey" value="X6Basic_syncConfig_syncConfigs_mainView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="syncConfigs.version" value="${(syncConfigs.version)!0}" />
	<input type="hidden" name="syncConfigs.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="X6Basic_mainView_edit_div" style="height:100%">
		<div id="X6Basic_syncConfig_syncConfigs_mainView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "X6Basic_syncConfig_syncConfigs_mainView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_syncConfig', null, function(){
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053309514')}" >${getText('X6Basic.propertydisplayName.radion1409053309514')}</label>
				</td>
				
						<#assign syncConfigs_syncEmailFlag_defaultValue  = ''>
							 							<#assign syncConfigs_syncEmailFlag_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="syncConfigs.syncEmailFlag_check" originalvalue="<#if !newObj><#if (syncConfigs.syncEmailFlag)??>${(syncConfigs.syncEmailFlag!false)?string('true','false')}<#else>false</#if><#elseif syncConfigs_syncEmailFlag_defaultValue?has_content>${(syncConfigs_syncEmailFlag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (syncConfigs.syncEmailFlag)??>${(syncConfigs.syncEmailFlag!false)?string('true','false')}<#else>false</#if><#else>${(syncConfigs_syncEmailFlag_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="syncConfigs.syncEmailFlag" originalvalue="<#if ((syncConfigs.syncEmailFlag)?? &&  syncConfigs.syncEmailFlag)||(syncConfigs_syncEmailFlag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((syncConfigs.syncEmailFlag)?? &&  syncConfigs.syncEmailFlag)||(syncConfigs_syncEmailFlag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="syncConfigs.syncEmailFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="syncConfigs.syncEmailFlag"]');
												CUI('input[name="syncConfigs.syncEmailFlag_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409209558180')}" >${getText('X6Basic.propertydisplayName.radion1409209558180')}</label>
				</td>
				
						<#assign syncConfigs_emailDomain_defaultValue  = ''>
							 							<#assign syncConfigs_emailDomain_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="syncConfigs.emailDomain" id="syncConfigs_emailDomain"  style=";" originalvalue="<#if !newObj || (syncConfigs.emailDomain)?has_content>${(syncConfigs.emailDomain?html)!}<#else>${syncConfigs_emailDomain_defaultValue!}</#if>" value="<#if !newObj || (syncConfigs.emailDomain)?has_content>${(syncConfigs.emailDomain?html)!}<#else>${syncConfigs_emailDomain_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053735984')}" >${getText('X6Basic.propertydisplayName.radion1409053735984')}</label>
				</td>
				
						<#assign syncConfigs_emailUserName_defaultValue  = ''>
							 							<#assign syncConfigs_emailUserName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="syncConfigs.emailUserName" id="syncConfigs_emailUserName"  style=";" originalvalue="<#if !newObj || (syncConfigs.emailUserName)?has_content>${(syncConfigs.emailUserName?html)!}<#else>${syncConfigs_emailUserName_defaultValue!}</#if>" value="<#if !newObj || (syncConfigs.emailUserName)?has_content>${(syncConfigs.emailUserName?html)!}<#else>${syncConfigs_emailUserName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053892290')}" >${getText('X6Basic.propertydisplayName.radion1409053892290')}</label>
				</td>
				
						<#assign syncConfigs_emailPassword_defaultValue  = ''>
							 							<#assign syncConfigs_emailPassword_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
							<input id="syncConfigs.emailPassword" style="display:none" type="password" autocomplete="off"/>
							<input property_type="PASSWORD" name="syncConfigs.emailPassword" style=";" originalvalue="${(syncConfigs.emailPassword)!}" value="${(syncConfigs.emailPassword)!}" type="password" class="cui-noborder-input" readonly="readonly" />
							</div>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053998518')}" >${getText('X6Basic.propertydisplayName.radion1409053998518')}</label>
				</td>
				
						<#assign syncConfigs_emailDataSourse_defaultValue  = ''>
							 							<#assign syncConfigs_emailDataSourse_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="syncConfigs_emailDataSourse" originalvalue="<#if !newObj || (syncConfigs.emailDataSourse)?has_content>${(syncConfigs.emailDataSourse?html)!}<#else>${syncConfigs_emailDataSourse_defaultValue?html}</#if>"  name="syncConfigs.emailDataSourse" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style="height:40px;;" ><#if !newObj || (syncConfigs.emailDataSourse)?has_content>${(syncConfigs.emailDataSourse)!}<#else>${syncConfigs_emailDataSourse_defaultValue}</#if></textarea></div>
							
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053368915')}" >${getText('X6Basic.propertydisplayName.radion1409053368915')}</label>
				</td>
				
						<#assign syncConfigs_syncBBSFlag_defaultValue  = ''>
							 							<#assign syncConfigs_syncBBSFlag_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="syncConfigs.syncBBSFlag_check" originalvalue="<#if !newObj><#if (syncConfigs.syncBBSFlag)??>${(syncConfigs.syncBBSFlag!false)?string('true','false')}<#else>false</#if><#elseif syncConfigs_syncBBSFlag_defaultValue?has_content>${(syncConfigs_syncBBSFlag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (syncConfigs.syncBBSFlag)??>${(syncConfigs.syncBBSFlag!false)?string('true','false')}<#else>false</#if><#else>${(syncConfigs_syncBBSFlag_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="syncConfigs.syncBBSFlag" originalvalue="<#if ((syncConfigs.syncBBSFlag)?? &&  syncConfigs.syncBBSFlag)||(syncConfigs_syncBBSFlag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((syncConfigs.syncBBSFlag)?? &&  syncConfigs.syncBBSFlag)||(syncConfigs_syncBBSFlag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="syncConfigs.syncBBSFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="syncConfigs.syncBBSFlag"]');
												CUI('input[name="syncConfigs.syncBBSFlag_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1411613866602')}" >${getText('X6Basic.propertydisplayName.radion1411613866602')}</label>
				</td>
				
						<#assign syncConfigs_bbsDeleteSync_defaultValue  = ''>
							 							<#assign syncConfigs_bbsDeleteSync_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="syncConfigs.bbsDeleteSync_check" originalvalue="<#if !newObj><#if (syncConfigs.bbsDeleteSync)??>${(syncConfigs.bbsDeleteSync!false)?string('true','false')}<#else>false</#if><#elseif syncConfigs_bbsDeleteSync_defaultValue?has_content>${(syncConfigs_bbsDeleteSync_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (syncConfigs.bbsDeleteSync)??>${(syncConfigs.bbsDeleteSync!false)?string('true','false')}<#else>false</#if><#else>${(syncConfigs_bbsDeleteSync_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="syncConfigs.bbsDeleteSync" originalvalue="<#if ((syncConfigs.bbsDeleteSync)?? &&  syncConfigs.bbsDeleteSync)||(syncConfigs_bbsDeleteSync_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((syncConfigs.bbsDeleteSync)?? &&  syncConfigs.bbsDeleteSync)||(syncConfigs_bbsDeleteSync_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="syncConfigs.bbsDeleteSync_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="syncConfigs.bbsDeleteSync"]');
												CUI('input[name="syncConfigs.bbsDeleteSync_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053693007')}" >${getText('X6Basic.propertydisplayName.radion1409053693007')}</label>
				</td>
				
						<#assign syncConfigs_bbsUserName_defaultValue  = ''>
							 							<#assign syncConfigs_bbsUserName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="syncConfigs.bbsUserName" id="syncConfigs_bbsUserName"  style=";" originalvalue="<#if !newObj || (syncConfigs.bbsUserName)?has_content>${(syncConfigs.bbsUserName?html)!}<#else>${syncConfigs_bbsUserName_defaultValue!}</#if>" value="<#if !newObj || (syncConfigs.bbsUserName)?has_content>${(syncConfigs.bbsUserName?html)!}<#else>${syncConfigs_bbsUserName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053850030')}" >${getText('X6Basic.propertydisplayName.radion1409053850030')}</label>
				</td>
				
						<#assign syncConfigs_bbsPassword_defaultValue  = ''>
							 							<#assign syncConfigs_bbsPassword_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
							<input id="syncConfigs.bbsPassword" style="display:none" type="password" autocomplete="off"/>
							<input property_type="PASSWORD" name="syncConfigs.bbsPassword" style=";" originalvalue="${(syncConfigs.bbsPassword)!}" value="${(syncConfigs.bbsPassword)!}" type="password" class="cui-noborder-input" readonly="readonly" />
							</div>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1411371105276')}" >${getText('X6Basic.propertydisplayName.radion1411371105276')}</label>
				</td>
				
						<#assign syncConfigs_bbsAlias_defaultValue  = ''>
							 							<#assign syncConfigs_bbsAlias_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="syncConfigs.bbsAlias" id="syncConfigs_bbsAlias"  style=";" originalvalue="<#if !newObj || (syncConfigs.bbsAlias)?has_content>${(syncConfigs.bbsAlias?html)!}<#else>${syncConfigs_bbsAlias_defaultValue!}</#if>" value="<#if !newObj || (syncConfigs.bbsAlias)?has_content>${(syncConfigs.bbsAlias?html)!}<#else>${syncConfigs_bbsAlias_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol" colspan="2">&nbsp;</td>
				</tr><tr class="dialog_tr">
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1411374050830')}" >${getText('X6Basic.propertydisplayName.radion1411374050830')}</label>
				</td>
				
				<td nullable=true class="edit-table-symbol"  colspan="3" align="left" style="text-align: left;;" >
							<label style="width:100%;padding-left:5px;;" value="${getText('X6Basic.propertydisplayName.radion1411371424428')}" >${getText('X6Basic.propertydisplayName.radion1411371424428')}</label>
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053968152')}" >${getText('X6Basic.propertydisplayName.radion1409053968152')}</label>
				</td>
				
						<#assign syncConfigs_bbsDataSourse_defaultValue  = ''>
							 							<#assign syncConfigs_bbsDataSourse_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="syncConfigs_bbsDataSourse" originalvalue="<#if !newObj || (syncConfigs.bbsDataSourse)?has_content>${(syncConfigs.bbsDataSourse?html)!}<#else>${syncConfigs_bbsDataSourse_defaultValue?html}</#if>"  name="syncConfigs.bbsDataSourse" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style="height:40px;;" ><#if !newObj || (syncConfigs.bbsDataSourse)?has_content>${(syncConfigs.bbsDataSourse)!}<#else>${syncConfigs_bbsDataSourse_defaultValue}</#if></textarea></div>
							
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053401279')}" >${getText('X6Basic.propertydisplayName.radion1409053401279')}</label>
				</td>
				
						<#assign syncConfigs_syncPandionFlag_defaultValue  = ''>
							 							<#assign syncConfigs_syncPandionFlag_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="syncConfigs.syncPandionFlag_check" originalvalue="<#if !newObj><#if (syncConfigs.syncPandionFlag)??>${(syncConfigs.syncPandionFlag!false)?string('true','false')}<#else>false</#if><#elseif syncConfigs_syncPandionFlag_defaultValue?has_content>${(syncConfigs_syncPandionFlag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (syncConfigs.syncPandionFlag)??>${(syncConfigs.syncPandionFlag!false)?string('true','false')}<#else>false</#if><#else>${(syncConfigs_syncPandionFlag_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="syncConfigs.syncPandionFlag" originalvalue="<#if ((syncConfigs.syncPandionFlag)?? &&  syncConfigs.syncPandionFlag)||(syncConfigs_syncPandionFlag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((syncConfigs.syncPandionFlag)?? &&  syncConfigs.syncPandionFlag)||(syncConfigs_syncPandionFlag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="syncConfigs.syncPandionFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="syncConfigs.syncPandionFlag"]');
												CUI('input[name="syncConfigs.syncPandionFlag_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1411613954663')}" >${getText('X6Basic.propertydisplayName.radion1411613954663')}</label>
				</td>
				
						<#assign syncConfigs_pandionDelSync_defaultValue  = ''>
							 							<#assign syncConfigs_pandionDelSync_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="syncConfigs.pandionDelSync_check" originalvalue="<#if !newObj><#if (syncConfigs.pandionDelSync)??>${(syncConfigs.pandionDelSync!false)?string('true','false')}<#else>false</#if><#elseif syncConfigs_pandionDelSync_defaultValue?has_content>${(syncConfigs_pandionDelSync_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (syncConfigs.pandionDelSync)??>${(syncConfigs.pandionDelSync!false)?string('true','false')}<#else>false</#if><#else>${(syncConfigs_pandionDelSync_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="syncConfigs.pandionDelSync" originalvalue="<#if ((syncConfigs.pandionDelSync)?? &&  syncConfigs.pandionDelSync)||(syncConfigs_pandionDelSync_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((syncConfigs.pandionDelSync)?? &&  syncConfigs.pandionDelSync)||(syncConfigs_pandionDelSync_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="syncConfigs.pandionDelSync_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="syncConfigs.pandionDelSync"]');
												CUI('input[name="syncConfigs.pandionDelSync_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053775252')}" >${getText('X6Basic.propertydisplayName.radion1409053775252')}</label>
				</td>
				
						<#assign syncConfigs_pandionUserName_defaultValue  = ''>
							 							<#assign syncConfigs_pandionUserName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="syncConfigs.pandionUserName" id="syncConfigs_pandionUserName"  style=";" originalvalue="<#if !newObj || (syncConfigs.pandionUserName)?has_content>${(syncConfigs.pandionUserName?html)!}<#else>${syncConfigs_pandionUserName_defaultValue!}</#if>" value="<#if !newObj || (syncConfigs.pandionUserName)?has_content>${(syncConfigs.pandionUserName?html)!}<#else>${syncConfigs_pandionUserName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409053929563')}" >${getText('X6Basic.propertydisplayName.radion1409053929563')}</label>
				</td>
				
						<#assign syncConfigs_pandionPassword_defaultValue  = ''>
							 							<#assign syncConfigs_pandionPassword_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
							<input id="syncConfigs.pandionPassword" style="display:none" type="password" autocomplete="off"/>
							<input property_type="PASSWORD" name="syncConfigs.pandionPassword" style=";" originalvalue="${(syncConfigs.pandionPassword)!}" value="${(syncConfigs.pandionPassword)!}" type="password" class="cui-noborder-input" readonly="readonly" />
							</div>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409054018572')}" >${getText('X6Basic.propertydisplayName.radion1409054018572')}</label>
				</td>
				
						<#assign syncConfigs_pandionDataSourse_defaultValue  = ''>
							 							<#assign syncConfigs_pandionDataSourse_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="syncConfigs_pandionDataSourse" originalvalue="<#if !newObj || (syncConfigs.pandionDataSourse)?has_content>${(syncConfigs.pandionDataSourse?html)!}<#else>${syncConfigs_pandionDataSourse_defaultValue?html}</#if>"  name="syncConfigs.pandionDataSourse" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style="height:40px;;" ><#if !newObj || (syncConfigs.pandionDataSourse)?has_content>${(syncConfigs.pandionDataSourse)!}<#else>${syncConfigs_pandionDataSourse_defaultValue}</#if></textarea></div>
							
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1409054394069')}" >${getText('X6Basic.propertydisplayName.radion1409054394069')}</label>
				</td>
				
						<#assign syncConfigs_des_defaultValue  = ''>
							 							<#assign syncConfigs_des_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="syncConfigs.des" id="syncConfigs_des"  style="height:40px;;" originalvalue="<#if !newObj || (syncConfigs.des)?has_content>${(syncConfigs.des?html)!}<#else>${syncConfigs_des_defaultValue!}</#if>" value="<#if !newObj || (syncConfigs.des)?has_content>${(syncConfigs.des?html)!}<#else>${syncConfigs_des_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_syncConfig_mainView,html,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	X6Basic.syncConfig.syncConfigs.mainView.beforeSaveProcess = function(){}
	X6Basic.syncConfig.syncConfigs.mainView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.syncConfig.syncConfigs.mainView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_syncConfig_syncConfigs_mainView_form').trigger('beforeSubmit');
		//syncConfigs.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="syncConfigs.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#X6Basic_syncConfig_syncConfigs_mainView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#X6Basic_syncConfig_syncConfigs_mainView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	X6Basic.syncConfig.syncConfigs.mainView.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.syncConfig.syncConfigs.mainView.print = function(url){
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
		
		X6Basic.syncConfig.syncConfigs.mainView.saveSetting = function(){
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
		X6Basic.syncConfig.syncConfigs.mainView.printSetting = function(){
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
			X6Basic.syncConfig.syncConfigs.mainView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.syncConfig.syncConfigs.mainView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				X6Basic.syncConfig.syncConfigs.mainView.settingDialog.show();
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
			X6Basic.syncConfig.syncConfigs.mainView._customCallBack = customCallBack;
		}
		X6Basic.syncConfig.syncConfigs.mainView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#X6Basic_syncConfig_syncConfigs_mainView_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_syncConfig_syncConfigs_mainView_fileupload"></div>');
			}
			X6Basic.syncConfig.syncConfigs.mainView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_syncConfig_syncConfigs_mainView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_syncConfig_syncConfigs_mainView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.syncConfig.syncConfigs.mainView.infoDialog.show();
			if($('#X6Basic_syncConfig_syncConfigs_mainView_fileupload').html() == '') {
				$('#X6Basic_syncConfig_syncConfigs_mainView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_syncConfig_syncConfigs&entityCode=X6Basic_1.0_syncConfig&dialogId="+dialogId);
			}
		}
	//参照复制函数
	X6Basic.syncConfig.syncConfigs.mainView.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.syncConfig.syncConfigs.mainView.referenceCopyBackInfo";
		X6Basic.syncConfig.syncConfigs.mainView.dialog = dialog;
		X6Basic.syncConfig.syncConfigs.mainView._dialog = foundation.common.select({
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
	
	X6Basic.syncConfig.syncConfigs.mainView.referenceCopyBackInfo = function(obj){
		if(X6Basic.syncConfig.syncConfigs.mainView._dialog){
			X6Basic.syncConfig.syncConfigs.mainView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,X6Basic.syncConfig.syncConfigs.mainView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_syncConfig_syncConfigs_mainView_form','X6Basic_syncConfig_syncConfigs_mainView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.syncConfig.syncConfigs.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.syncConfig.syncConfigs.mainView.dialog._el).load('/X6Basic/syncConfig/syncConfigs/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( X6Basic.syncConfig.syncConfigs.mainView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + X6Basic.syncConfig.syncConfigs.mainView.dialog._config.iframe, X6Basic.syncConfig.syncConfigs.mainView.dialog._dialog ).prop( 'src', '/X6Basic/syncConfig/syncConfigs/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(X6Basic.syncConfig.syncConfigs.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.syncConfig.syncConfigs.mainView.dialog._el).load('/X6Basic/syncConfig/syncConfigs/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.syncConfig.syncConfigs.mainView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.syncConfig.syncConfigs.mainView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.syncConfig.syncConfigs.mainView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.syncConfig.syncConfigs.mainView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.syncConfig.syncConfigs.mainView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'X6Basic_syncConfig_syncConfigs_mainView' + '_' + extraFrameParam;
		var callbackName="";
		X6Basic.syncConfig.syncConfigs.mainView._prefix = '';
		X6Basic.syncConfig.syncConfigs.mainView._oGrid = oGrid;
		X6Basic.syncConfig.syncConfigs.mainView._sUrl = url;
		if(customCallBack){
			X6Basic.syncConfig.syncConfigs.mainView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.syncConfig.syncConfigs.mainView.gridEventObj = gridEventObj;
			callbackName = "X6Basic.syncConfig.syncConfigs.mainView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.syncConfig.syncConfigs.mainView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.syncConfig.syncConfigs.mainView.getMultiselectCallBackInfo_DG" : "X6Basic.syncConfig.syncConfigs.mainView.getcallBackInfo_DG";
			X6Basic.syncConfig.syncConfigs.mainView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.syncConfig.syncConfigs.mainView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.syncConfig.syncConfigs.mainView.getcallBackInfo";
		}
		if(X6Basic.syncConfig.syncConfigs.mainView._prefix!=''){
			X6Basic.syncConfig.syncConfigs.mainView._prefix = X6Basic.syncConfig.syncConfigs.mainView._prefix.substring(1);
		}
		if(X6Basic.syncConfig.syncConfigs.mainView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.syncConfig.syncConfigs.mainView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.syncConfig.syncConfigs.mainView._querycustomFuncN == "function") {
				refparam += X6Basic.syncConfig.syncConfigs.mainView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.syncConfig.syncConfigs.mainView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.syncConfig.syncConfigs.mainView._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.syncConfig.syncConfigs.mainView.query_"+obj+")!='undefined'") ? eval('X6Basic.syncConfig.syncConfigs.mainView.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.syncConfig.syncConfigs.mainView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_syncConfig_syncConfigs_mainView_form',obj[0], X6Basic.syncConfig.syncConfigs.mainView._prefix, X6Basic.syncConfig.syncConfigs.mainView._sUrl);
		CUI.commonFills('X6Basic_syncConfig_syncConfigs_mainView_form',X6Basic.syncConfig.syncConfigs.mainView._prefix,obj[0]);

		try{
			if(X6Basic.syncConfig.syncConfigs.mainView._customCallBack) {
				eval(X6Basic.syncConfig.syncConfigs.mainView._customCallBack);
				X6Basic.syncConfig.syncConfigs.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.syncConfig.syncConfigs.mainView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.syncConfig.syncConfigs.mainView.getcallBackInfo_DG_IE = function(obj){
		if(X6Basic.syncConfig.syncConfigs.mainView._customBeforeCallBack) {
			var flag = eval(X6Basic.syncConfig.syncConfigs.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = X6Basic.syncConfig.syncConfigs.mainView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.syncConfig.syncConfigs.mainView._sUrl);
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
			if(X6Basic.syncConfig.syncConfigs.mainView._customCallBack) {
				eval(X6Basic.syncConfig.syncConfigs.mainView._customCallBack);
				X6Basic.syncConfig.syncConfigs.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.syncConfig.syncConfigs.mainView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.syncConfig.syncConfigs.mainView.getcallBackInfo_DG = function(obj){
		if(X6Basic.syncConfig.syncConfigs.mainView._customBeforeCallBack) {
			var flag = eval(X6Basic.syncConfig.syncConfigs.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.syncConfig.syncConfigs.mainView._currRow).next().length==0){
					X6Basic.syncConfig.syncConfigs.mainView._oGrid.addNewRow();
				}	
				X6Basic.syncConfig.syncConfigs.mainView._currRow = $(X6Basic.syncConfig.syncConfigs.mainView._currRow).next();
				$(X6Basic.syncConfig.syncConfigs.mainView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.syncConfig.syncConfigs.mainView._currRow,obj[i],X6Basic.syncConfig.syncConfigs.mainView._prefix,X6Basic.syncConfig.syncConfigs.mainView._sUrl);
			eval("CUI.commonFills_DG(X6Basic.syncConfig.syncConfigs.mainView._currRow,X6Basic.syncConfig.syncConfigs.mainView._prefix,obj[i],X6Basic.syncConfig.syncConfigs.mainView._oGrid)");
		}
		try{
			if(X6Basic.syncConfig.syncConfigs.mainView._customCallBack) {
				eval(X6Basic.syncConfig.syncConfigs.mainView._customCallBack);
				X6Basic.syncConfig.syncConfigs.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.syncConfig.syncConfigs.mainView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.syncConfig.syncConfigs.mainView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.syncConfig.syncConfigs.mainView._oGrid, X6Basic.syncConfig.syncConfigs.mainView._currRow, X6Basic.syncConfig.syncConfigs.mainView._key, X6Basic.syncConfig.syncConfigs.mainView._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.syncConfig.syncConfigs.mainView._customCallBack) {
				eval(X6Basic.syncConfig.syncConfigs.mainView._customCallBack);
				X6Basic.syncConfig.syncConfigs.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.syncConfig.syncConfigs.mainView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.syncConfig.syncConfigs.mainView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.syncConfig.syncConfigs.mainView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_syncConfig_syncConfigs_mainView_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.syncConfig.syncConfigs.mainView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.syncConfig.syncConfigs.mainView.initCount = 0;
	X6Basic.syncConfig.syncConfigs.mainView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#X6Basic_mainView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('X6Basic_syncConfig_syncConfigs_mainView_datagrids');	
		var	conHeight = h-$("#X6Basic_syncConfig_syncConfigs_mainView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_syncConfig_syncConfigs_mainView_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.syncConfig.syncConfigs.mainView.initCount <= 2) {
								setTimeout(function(){X6Basic.syncConfig.syncConfigs.mainView.initSize();}, 200);
								X6Basic.syncConfig.syncConfigs.mainView.initCount++;
							}/* else {
								X6Basic.syncConfig.syncConfigs.mainView.initCount = 0;
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
		X6Basic.syncConfig.syncConfigs.mainView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    X6Basic.syncConfig.syncConfigs.mainView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){X6Basic.syncConfig.syncConfigs.mainView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-VIEW-X6Basic_1.0_syncConfig_mainView,js,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>