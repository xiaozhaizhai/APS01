<!-- X6Basic_1.0/attMachine/edit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1367140362120')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_attMachine_edit,head,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.attMachine.attMachine.edit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_attMachine_attMachine">
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
<#assign callbackName ="X6Basic.attMachine.attMachine.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="X6Basic_attMachine_attMachine_edit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="X6Basic_attMachine_attMachine_edit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="X6Basic.attMachine.attMachine.edit.beforeSubmitMethod()" ecAction="/X6Basic/attMachine/attMachine/edit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="edit">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_attMachine_edit">
	<input type="hidden" name="datagridKey" value="X6Basic_attMachine_attMachine_edit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="attMachine.version" value="${(attMachine.version)!0}" />
	<input type="hidden" name="attMachine.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="X6Basic_edit_edit_div" style="height:100%">
		<div id="X6Basic_attMachine_attMachine_edit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "X6Basic_attMachine_attMachine_edit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_attMachine', null, function(){
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138903063')}" >${getText('X6Basic.propertydisplayName.radion1367138903063')}</label>
				</td>
				
						<#assign attMachine_code_defaultValue  = ''>
							 							<#assign attMachine_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="attMachine.code" id="attMachine_code"  style=";" originalvalue="<#if !newObj || (attMachine.code)?has_content>${(attMachine.code?html)!}<#else>${attMachine_code_defaultValue!}</#if>" value="<#if !newObj || (attMachine.code)?has_content>${(attMachine.code?html)!}<#else>${attMachine_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138883847')}" >${getText('X6Basic.propertydisplayName.radion1367138883847')}</label>
				</td>
				
						<#assign attMachine_name_defaultValue  = ''>
							 							<#assign attMachine_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="attMachine.name" id="attMachine_name"  style=";" originalvalue="<#if !newObj || (attMachine.name)?has_content>${(attMachine.name?html)!}<#else>${attMachine_name_defaultValue!}</#if>" value="<#if !newObj || (attMachine.name)?has_content>${(attMachine.name?html)!}<#else>${attMachine_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367139789420')}" >${getText('X6Basic.propertydisplayName.radion1367139789420')}</label>
				</td>
				
						<#assign attMachine_attType_defaultValue  = ''>
							 							<#assign attMachine_attType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="onchange111()"  viewType="${viewType!}" deValue="${attMachine_attType_defaultValue!}" formId="X6Basic_attMachine_attMachine_edit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="attMachine.attType.id" code="attType" value="${(attMachine.attType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="onchange111()"  viewType="${viewType!}"  formId="X6Basic_attMachine_attMachine_edit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="attMachine.attType.id" code="attType" value="${(attMachine.attType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138009522')}" >${getText('X6Basic.propertydisplayName.radion1367138009522')}</label>
				</td>
				
						<#assign attMachine_ifatt_defaultValue  = 'true'>
							 							<#assign attMachine_ifatt_defaultValue  = 'true'>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="attMachine.ifatt_check" originalvalue="<#if !newObj><#if (attMachine.ifatt)??>${(attMachine.ifatt!false)?string('true','false')}<#else>false</#if><#elseif attMachine_ifatt_defaultValue?has_content>${(attMachine_ifatt_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (attMachine.ifatt)??>${(attMachine.ifatt!false)?string('true','false')}<#else>false</#if><#else>${(attMachine_ifatt_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="attMachine.ifatt" originalvalue="<#if ((attMachine.ifatt)?? &&  attMachine.ifatt)||(attMachine_ifatt_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((attMachine.ifatt)?? &&  attMachine.ifatt)||(attMachine_ifatt_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="attMachine.ifatt_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="attMachine.ifatt"]');
												CUI('input[name="attMachine.ifatt_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138822787')}" >${getText('X6Basic.propertydisplayName.radion1367138822787')}</label>
				</td>
				
						<#assign attMachine_ifconsume_defaultValue  = 'false'>
							 							<#assign attMachine_ifconsume_defaultValue  = 'false'>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="attMachine.ifconsume_check" originalvalue="<#if !newObj><#if (attMachine.ifconsume)??>${(attMachine.ifconsume!false)?string('true','false')}<#else>false</#if><#elseif attMachine_ifconsume_defaultValue?has_content>${(attMachine_ifconsume_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (attMachine.ifconsume)??>${(attMachine.ifconsume!false)?string('true','false')}<#else>false</#if><#else>${(attMachine_ifconsume_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="attMachine.ifconsume" originalvalue="<#if ((attMachine.ifconsume)?? &&  attMachine.ifconsume)||(attMachine_ifconsume_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((attMachine.ifconsume)?? &&  attMachine.ifconsume)||(attMachine_ifconsume_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="attMachine.ifconsume_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="attMachine.ifconsume"]');
												CUI('input[name="attMachine.ifconsume_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138856827')}" >${getText('X6Basic.propertydisplayName.radion1367138856827')}</label>
				</td>
				
						<#assign attMachine_ifMeeting_defaultValue  = ''>
							 							<#assign attMachine_ifMeeting_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="attMachine.ifMeeting_check" originalvalue="<#if !newObj><#if (attMachine.ifMeeting)??>${(attMachine.ifMeeting!false)?string('true','false')}<#else>false</#if><#elseif attMachine_ifMeeting_defaultValue?has_content>${(attMachine_ifMeeting_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (attMachine.ifMeeting)??>${(attMachine.ifMeeting!false)?string('true','false')}<#else>false</#if><#else>${(attMachine_ifMeeting_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="attMachine.ifMeeting" originalvalue="<#if ((attMachine.ifMeeting)?? &&  attMachine.ifMeeting)||(attMachine_ifMeeting_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((attMachine.ifMeeting)?? &&  attMachine.ifMeeting)||(attMachine_ifMeeting_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="attMachine.ifMeeting_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="attMachine.ifMeeting"]');
												CUI('input[name="attMachine.ifMeeting_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367137956975')}" >${getText('X6Basic.propertydisplayName.radion1367137956975')}</label>
				</td>
				
						<#assign attMachine_databaseName_defaultValue  = ''>
							 							<#assign attMachine_databaseName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="attMachine.databaseName" id="attMachine_databaseName"  style=";" originalvalue="<#if !newObj || (attMachine.databaseName)?has_content>${(attMachine.databaseName?html)!}<#else>${attMachine_databaseName_defaultValue!}</#if>" value="<#if !newObj || (attMachine.databaseName)?has_content>${(attMachine.databaseName?html)!}<#else>${attMachine_databaseName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367139879978')}" >${getText('X6Basic.propertydisplayName.radion1367139879978')}</label>
				</td>
				
						<#assign attMachine_userName_defaultValue  = ''>
							 							<#assign attMachine_userName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="attMachine.userName" id="attMachine_userName"  style=";" originalvalue="<#if !newObj || (attMachine.userName)?has_content>${(attMachine.userName?html)!}<#else>${attMachine_userName_defaultValue!}</#if>" value="<#if !newObj || (attMachine.userName)?has_content>${(attMachine.userName?html)!}<#else>${attMachine_userName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138937267')}" >${getText('X6Basic.propertydisplayName.radion1367138937267')}</label>
				</td>
				
						<#assign attMachine_pwd_defaultValue  = ''>
							 							<#assign attMachine_pwd_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="PASSWORD" name="attMachine.pwd" id="attMachine_pwd"  style=";" originalvalue="<#if !newObj || (attMachine.pwd)?has_content>${(attMachine.pwd?html)!}<#else>${attMachine_pwd_defaultValue!}</#if>" value="<#if !newObj || (attMachine.pwd)?has_content>${(attMachine.pwd?html)!}<#else>${attMachine_pwd_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367139816743')}" >${getText('X6Basic.propertydisplayName.radion1367139816743')}</label>
				</td>
				
						<#assign attMachine_url_defaultValue  = ''>
							 							<#assign attMachine_url_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="attMachine.url" id="attMachine_url"  style=";" originalvalue="<#if !newObj || (attMachine.url)?has_content>${(attMachine.url?html)!}<#else>${attMachine_url_defaultValue!}</#if>" value="<#if !newObj || (attMachine.url)?has_content>${(attMachine.url?html)!}<#else>${attMachine_url_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367137982091')}" >${getText('X6Basic.propertydisplayName.radion1367137982091')}</label>
				</td>
				
						<#assign attMachine_instructions_defaultValue  = ''>
							 							<#assign attMachine_instructions_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="attMachine_instructions" originalvalue="<#if !newObj || (attMachine.instructions)?has_content>${(attMachine.instructions?html)!}<#else>${attMachine_instructions_defaultValue?html}</#if>"  name="attMachine.instructions" class="cui-noborder-textarea cui-textarea-auto" style="height:160px;" ><#if !newObj || (attMachine.instructions)?has_content>${(attMachine.instructions)!}<#else>${attMachine_instructions_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr class="dialog_tr">
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
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
<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_attMachine_edit,html,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	X6Basic.attMachine.attMachine.edit.beforeSaveProcess = function(){}
	X6Basic.attMachine.attMachine.edit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.attMachine.attMachine.edit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_attMachine_attMachine_edit_form').trigger('beforeSubmit');
		//attMachine.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="attMachine.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#X6Basic_attMachine_attMachine_edit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#X6Basic_attMachine_attMachine_edit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	X6Basic.attMachine.attMachine.edit.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.attMachine.attMachine.edit.print = function(url){
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
		
		X6Basic.attMachine.attMachine.edit.saveSetting = function(){
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
		X6Basic.attMachine.attMachine.edit.printSetting = function(){
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
			X6Basic.attMachine.attMachine.edit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.attMachine.attMachine.edit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				X6Basic.attMachine.attMachine.edit.settingDialog.show();
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
			X6Basic.attMachine.attMachine.edit._customCallBack = customCallBack;
		}
		X6Basic.attMachine.attMachine.edit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#X6Basic_attMachine_attMachine_edit_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_attMachine_attMachine_edit_fileupload"></div>');
			}
			X6Basic.attMachine.attMachine.edit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_attMachine_attMachine_edit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_attMachine_attMachine_edit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.attMachine.attMachine.edit.infoDialog.show();
			if($('#X6Basic_attMachine_attMachine_edit_fileupload').html() == '') {
				$('#X6Basic_attMachine_attMachine_edit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_attMachine_attMachine&entityCode=X6Basic_1.0_attMachine&dialogId="+dialogId);
			}
		}
	//参照复制函数
	X6Basic.attMachine.attMachine.edit.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.attMachine.attMachine.edit.referenceCopyBackInfo";
		X6Basic.attMachine.attMachine.edit.dialog = dialog;
		X6Basic.attMachine.attMachine.edit._dialog = foundation.common.select({
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
	
	X6Basic.attMachine.attMachine.edit.referenceCopyBackInfo = function(obj){
		if(X6Basic.attMachine.attMachine.edit._dialog){
			X6Basic.attMachine.attMachine.edit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,X6Basic.attMachine.attMachine.edit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_attMachine_attMachine_edit_form','X6Basic_attMachine_attMachine_edit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.attMachine.attMachine.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.attMachine.attMachine.edit.dialog._el).load('/X6Basic/attMachine/attMachine/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( X6Basic.attMachine.attMachine.edit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + X6Basic.attMachine.attMachine.edit.dialog._config.iframe, X6Basic.attMachine.attMachine.edit.dialog._dialog ).prop( 'src', '/X6Basic/attMachine/attMachine/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(X6Basic.attMachine.attMachine.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.attMachine.attMachine.edit.dialog._el).load('/X6Basic/attMachine/attMachine/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.attMachine.attMachine.edit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.attMachine.attMachine.edit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.attMachine.attMachine.edit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.attMachine.attMachine.edit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.attMachine.attMachine.edit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'X6Basic_attMachine_attMachine_edit' + '_' + extraFrameParam;
		var callbackName="";
		X6Basic.attMachine.attMachine.edit._prefix = '';
		X6Basic.attMachine.attMachine.edit._oGrid = oGrid;
		X6Basic.attMachine.attMachine.edit._sUrl = url;
		if(customCallBack){
			X6Basic.attMachine.attMachine.edit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.attMachine.attMachine.edit.gridEventObj = gridEventObj;
			callbackName = "X6Basic.attMachine.attMachine.edit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.attMachine.attMachine.edit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.attMachine.attMachine.edit.getMultiselectCallBackInfo_DG" : "X6Basic.attMachine.attMachine.edit.getcallBackInfo_DG";
			X6Basic.attMachine.attMachine.edit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.attMachine.attMachine.edit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.attMachine.attMachine.edit.getcallBackInfo";
		}
		if(X6Basic.attMachine.attMachine.edit._prefix!=''){
			X6Basic.attMachine.attMachine.edit._prefix = X6Basic.attMachine.attMachine.edit._prefix.substring(1);
		}
		if(X6Basic.attMachine.attMachine.edit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.attMachine.attMachine.edit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.attMachine.attMachine.edit._querycustomFuncN == "function") {
				refparam += X6Basic.attMachine.attMachine.edit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.attMachine.attMachine.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.attMachine.attMachine.edit._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.attMachine.attMachine.edit.query_"+obj+")!='undefined'") ? eval('X6Basic.attMachine.attMachine.edit.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.attMachine.attMachine.edit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_attMachine_attMachine_edit_form',obj[0], X6Basic.attMachine.attMachine.edit._prefix, X6Basic.attMachine.attMachine.edit._sUrl);
		CUI.commonFills('X6Basic_attMachine_attMachine_edit_form',X6Basic.attMachine.attMachine.edit._prefix,obj[0]);

		try{
			if(X6Basic.attMachine.attMachine.edit._customCallBack) {
				eval(X6Basic.attMachine.attMachine.edit._customCallBack);
				X6Basic.attMachine.attMachine.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.attMachine.attMachine.edit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.attMachine.attMachine.edit.getcallBackInfo_DG_IE = function(obj){
		if(X6Basic.attMachine.attMachine.edit._customBeforeCallBack) {
			var flag = eval(X6Basic.attMachine.attMachine.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = X6Basic.attMachine.attMachine.edit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.attMachine.attMachine.edit._sUrl);
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
			if(X6Basic.attMachine.attMachine.edit._customCallBack) {
				eval(X6Basic.attMachine.attMachine.edit._customCallBack);
				X6Basic.attMachine.attMachine.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.attMachine.attMachine.edit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.attMachine.attMachine.edit.getcallBackInfo_DG = function(obj){
		if(X6Basic.attMachine.attMachine.edit._customBeforeCallBack) {
			var flag = eval(X6Basic.attMachine.attMachine.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.attMachine.attMachine.edit._currRow).next().length==0){
					X6Basic.attMachine.attMachine.edit._oGrid.addNewRow();
				}	
				X6Basic.attMachine.attMachine.edit._currRow = $(X6Basic.attMachine.attMachine.edit._currRow).next();
				$(X6Basic.attMachine.attMachine.edit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.attMachine.attMachine.edit._currRow,obj[i],X6Basic.attMachine.attMachine.edit._prefix,X6Basic.attMachine.attMachine.edit._sUrl);
			eval("CUI.commonFills_DG(X6Basic.attMachine.attMachine.edit._currRow,X6Basic.attMachine.attMachine.edit._prefix,obj[i],X6Basic.attMachine.attMachine.edit._oGrid)");
		}
		try{
			if(X6Basic.attMachine.attMachine.edit._customCallBack) {
				eval(X6Basic.attMachine.attMachine.edit._customCallBack);
				X6Basic.attMachine.attMachine.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.attMachine.attMachine.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.attMachine.attMachine.edit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.attMachine.attMachine.edit._oGrid, X6Basic.attMachine.attMachine.edit._currRow, X6Basic.attMachine.attMachine.edit._key, X6Basic.attMachine.attMachine.edit._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.attMachine.attMachine.edit._customCallBack) {
				eval(X6Basic.attMachine.attMachine.edit._customCallBack);
				X6Basic.attMachine.attMachine.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.attMachine.attMachine.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.attMachine.attMachine.edit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.attMachine.attMachine.edit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_attMachine_attMachine_edit_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.attMachine.attMachine.edit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.attMachine.attMachine.edit.initCount = 0;
	X6Basic.attMachine.attMachine.edit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#X6Basic_edit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('X6Basic_attMachine_attMachine_edit_datagrids');	
		var	conHeight = h-$("#X6Basic_attMachine_attMachine_edit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_attMachine_attMachine_edit_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.attMachine.attMachine.edit.initCount <= 2) {
								setTimeout(function(){X6Basic.attMachine.attMachine.edit.initSize();}, 200);
								X6Basic.attMachine.attMachine.edit.initCount++;
							}/* else {
								X6Basic.attMachine.attMachine.edit.initCount = 0;
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
		X6Basic.attMachine.attMachine.edit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    X6Basic.attMachine.attMachine.edit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){X6Basic.attMachine.attMachine.edit.initSize();});
	});
</script>
<script type="text/javascript">
	
function onchange111(){
if(($("#attMachineattTypeid").val()) != "attType/m5"){
$("input[name='attMachine.isLocal_check']").attr("disabled",true);
$("input[name='attMachine.isLocal_check']").attr("checked",false);
onclick111();
}
else{
$("input[name='attMachine.isLocal_check']").attr("disabled",false);
onclick111();
}
}

	/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_attMachine_edit,js,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>