<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_baseCustomer_baseCustomer">
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
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=8,9,10" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('MESBasic.viewtitle.randon1436844047025')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		body{_width:100%;}
		.ewc-dialog-el{height:100%;}
		.flow-height{
			height:94%;
			height:91%\9;
		}
		#MESBasic_baseCustomer_baseCustomer_custEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.baseCustomer.baseCustomer.custEdit');
			MESBasic.baseCustomer.baseCustomer.custEdit.currentUser = ${userJson};
			MESBasic.baseCustomer.baseCustomer.custEdit.currentStaff = ${staffJson};
			MESBasic.baseCustomer.baseCustomer.custEdit.currentDepartment = ${deptJson};
			MESBasic.baseCustomer.baseCustomer.custEdit.currentPosition = ${postJson};
			MESBasic.baseCustomer.baseCustomer.custEdit.currentCompany = ${compJson};
		</script>
    </head>
	<body>
		<@loadpanel/>
		<div id="load_mask_first" class="load_mask_first"></div>
		<iframe id="load_iframe_ie_first" class="load_iframe_ie" style="z-index: 199; display: block;"></iframe>
		<div id="loading_wrap_first" class="loading_wrap_first">
			<div class="loading_process">
				<div class="loading_msg_first">${getText("foundation.common.data.waiting")}</div>
			</div>
		</div>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="baseCustomer.customerCcCode.id,baseCustomer.customerCcCode.ccCode," onsubmitMethod="MESBasic.baseCustomer.baseCustomer.custEdit.beforeSubmitMethod()" id="MESBasic_baseCustomer_baseCustomer_custEdit_form" namespace="/MESBasic/baseCustomer/baseCustomer/custEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_baseCustomer_BaseCustomer&_bapFieldPermissonModelName_=BaseCustomer" callback="MESBasic.baseCustomer.baseCustomer.custEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_baseCustomer_baseCustomer_custEdit_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((baseCustomer.status)?? && baseCustomer.status == 77)>
									<#if !(superEdit!false) && id??>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="MESBasic.baseCustomer.baseCustomer.custEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
									<#if transitions?has_content>
									<#list transitions as t>
										<#if t.cancel??&&t.cancel==1>
											<#if id??>
								    <a class='cui-btn-new' id='edit-${t.name}-btn'><span class='edit-nullify'></span>${getHtmlText('ec.edit.remove')}</a>
									<script type="text/javascript">
										$(function(){
											$('#edit-${t.name}-btn').click(function(){
												if(!confirm("${getText('ec.view.confirm.remove')}"))return;
												$("input[type='radio'][name='workFlowVar.outcome']").prop("checked",false);
												if($("#workflow_outcomes .wfcancel").length == 0) {
													$("#workflow_outcomes").append('<input class="wfcancel" type="hidden" name="workFlowVar.outcome" id="__workflow_outcome_${t.name}" value="${t.name}" />');
													$("#workflow_outcomes").append('<input class="wfcancel"  type="hidden" name="workFlowVarStatus" value="cancel" />');
												}
												var wfcancelArr=new Array();
												var paramObj=new Object();
												paramObj.type='normal';
												paramObj.outcome='${t.name}';
												paramObj.dec='${t.description}';
												wfcancelArr.push(paramObj);
												$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(wfcancelArr));
												MESBasic.baseCustomer.baseCustomer.custEdit.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									
									</#if>
									
									<a class='cui-btn-new' id="edit-close-btn" onclick="window.close()"><span class="close"></span>${getHtmlText("foundation.common.closeWindow")}</a>
			
								</div>
								
								<div class="fr">
									<ul>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="MESBasic.baseCustomer.baseCustomer.custEdit.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="MESBasic_baseCustomer_baseCustomer_custEdit_form_attcount"></em></i></span>
										</a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
							</div>
    					</div>
    					
    					<div class="edit-main" id="MESBasic_baseCustomer_baseCustomer_custEdit">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="custEdit">
								<input type="hidden" name="datagridKey" value="MESBasic_baseCustomer_baseCustomer_custEdit_datagrids">
								<input type="hidden" name="viewCode" value="MESBasic_1_baseCustomer_custEdit">
								<input type="hidden" name="modelName" value="BaseCustomer">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="baseCustomer.version" value="${(baseCustomer.version)!0}" />
								<input type="hidden" name="baseCustomer.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">
										<input type="hidden" name="baseCustomer.customerCcCode.id" value="${(baseCustomer.customerCcCode.id)!""}" originalvalue="${(baseCustomer.customerCcCode.id)!""}"/>
										<input type="hidden" name="baseCustomer.customerCcCode.ccCode" value="${(baseCustomer.customerCcCode.ccCode)!""}" originalvalue="${(baseCustomer.customerCcCode.ccCode)!""}"/>

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "MESBasic_baseCustomer_baseCustomer_custEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_baseCustomer', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<#if !MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit = checkFieldPermission('baseCustomer.customerCode','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerCode')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1436499489164')}" >${getText('MESBasic.propertydisplayName.randon1436499489164')}</label>
				</td>
				
						<#assign baseCustomer_customerCode_defaultValue  = ''>
							 							<#assign baseCustomer_customerCode_defaultValue  = ''>
					<#if !MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit = checkFieldPermission('baseCustomer.customerCode','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerCode')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="baseCustomer.customerCode" id="baseCustomer_customerCode"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerCode)?has_content>${(baseCustomer.customerCode?html)!}<#else>${baseCustomer_customerCode_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerCode)?has_content>${(baseCustomer.customerCode?html)!}<#else>${baseCustomer_customerCode_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_baseCustomer_BaseCustomer_customerCode_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !MESBasic_1_baseCustomer_BaseCustomer_customerName_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerName_permit = checkFieldPermission('baseCustomer.customerName','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerName')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_baseCustomer_BaseCustomer_customerName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1436499520719')}" >${getText('MESBasic.propertydisplayName.randon1436499520719')}</label>
				</td>
				
						<#assign baseCustomer_customerName_defaultValue  = ''>
							 							<#assign baseCustomer_customerName_defaultValue  = ''>
					<#if !MESBasic_1_baseCustomer_BaseCustomer_customerName_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerName_permit = checkFieldPermission('baseCustomer.customerName','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerName')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_baseCustomer_BaseCustomer_customerName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_baseCustomer_BaseCustomer_customerName_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="baseCustomer.customerName" id="baseCustomer_customerName"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerName)?has_content>${(baseCustomer.customerName?html)!}<#else>${baseCustomer_customerName_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerName)?has_content>${(baseCustomer.customerName?html)!}<#else>${baseCustomer_customerName_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_baseCustomer_BaseCustomer_customerName_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit = checkFieldPermission('baseCustomer.customerShortName','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerShortName')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1436499618182')}" >${getText('MESBasic.propertydisplayName.randon1436499618182')}</label>
				</td>
				
						<#assign baseCustomer_customerShortName_defaultValue  = ''>
							 							<#assign baseCustomer_customerShortName_defaultValue  = ''>
					<#if !MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit = checkFieldPermission('baseCustomer.customerShortName','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerShortName')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="baseCustomer.customerShortName" id="baseCustomer_customerShortName"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerShortName)?has_content>${(baseCustomer.customerShortName?html)!}<#else>${baseCustomer_customerShortName_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerShortName)?has_content>${(baseCustomer.customerShortName?html)!}<#else>${baseCustomer_customerShortName_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_baseCustomer_BaseCustomer_customerShortName_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr >
												<#if !MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit = checkFieldPermission('baseCustomer.customerCcCode.ccNAME','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1436773836491')}" >${getText('MESBasic.propertydisplayName.randon1436773836491')}</label>
				</td>
				
						<#assign baseCustomer_customerCcCode_ccNAME_defaultValue  = ''>
														<#assign baseCustomer_customerCcCode_ccNAME_defaultValue  = ''>
					<#if !MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit??>
					<#assign MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit = checkFieldPermission('baseCustomer.customerCcCode.ccNAME','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME')>
					</#if>
					<td <#if MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if MESBasic_1_baseCustomer_BaseCustomer_customerCcCode_MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1438133016848')}" conditionfunc="MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFunc('baseCustomer_customerCcCode_ccNAME')" view=true value="${(baseCustomer.customerCcCode.ccNAME)!}" displayFieldName="ccNAME" name="baseCustomer.customerCcCode.ccNAME" id="baseCustomer_customerCcCode_ccNAME" type="other" url="/MESBasic/baseCustomerClass/baseCustomerClass/refCustomer.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseCustomer_baseCustomer_custEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_baseCustomer_customerCcCode_ccNAME(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1438133016848')}" viewType="${viewType!}" deValue="${baseCustomer_customerCcCode_ccNAME_defaultValue!}" conditionfunc="MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFunc('baseCustomer_customerCcCode_ccNAME')"  value="${(baseCustomer.customerCcCode.ccNAME)!}" displayFieldName="ccNAME" name="baseCustomer.customerCcCode.ccNAME" id="baseCustomer_customerCcCode_ccNAME" type="other" url="/MESBasic/baseCustomerClass/baseCustomerClass/refCustomer.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseCustomer_baseCustomer_custEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_baseCustomer_customerCcCode_ccNAME(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(baseCustomer.id)?? && (baseCustomer.customerCcCode.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseCustomer.customerCcCode.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_custEdit_form',obj, 'baseCustomer.customerCcCode', '/MESBasic/baseCustomerClass/baseCustomerClass/refCustomer.action');
												CUI.commonFills('MESBasic_baseCustomer_baseCustomer_custEdit_form', 'baseCustomer.customerCcCode',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
										</div>
								</div>
    						</div>
    					</div>
    				
    				
		</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="MESBasic_baseCustomer_baseCustomer_custEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.baseCustomer.baseCustomer.custEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_baseCustomer_custEdit,html,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
		<@errorbar id="workbenchErrorBar" offsetY=42 />
		
		<script type="text/javascript">
		$(function(){
			//修复select下拉框不能跟随滚动条一起滚动的bug
			$(".cui-elements").bind("scroll", function(){ 
			    $(".edit-select-box").hide();
				$(".select-iframe").hide();     
			});
			$(window).resize(function(){
				//var isoldie = $.browser.msie&&($.browser.version == "6.0")&&!$.support.style;
				//var body = isoldie?(document.documentElement||document.body):document.body;
				var width = parseInt($('html').width(),10);
				var w1 = parseInt($(window).width(),10);
				if($("#edit_sidebar").css("display") == "block"){
					w1 = w1 - 150;
				}
				if (width <= 800) {
					if($("#edit_sidebar").length==0 || $("#edit_sidebar").css("display")=="none"){
						$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.baseCustomer.baseCustomer.custEdit.initCount = 0;
			MESBasic.baseCustomer.baseCustomer.custEdit.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
			    var w = $(window).width();
			    var width_ = 0;
			    if($('#edit_side_btn').length > 0){
				 $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
				}
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$("div.edit-workflow").css("left",1);
				}else{
					$("div.edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$("div.edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				CUI('div[id^="otherContentDiv_"]').height(h);
				</#if>
				var conHeight = h-$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-head").height()-$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_baseCustomer_baseCustomer_custEdit_datagrids');
				var padding_bottom=16;
				$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .pd_bottom,#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-panes-s").each(function(index){
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
							datatableHeight = conHeight - thisHeight;
						}
					} else {
						if(thisHeight > conHeight) {
							$(this).parent().height(conHeight);
							$(this).parent().css("overflow-y","auto");
						} else if(thisHeight && thisHeight > 0) {
							$(this).parent().height(conHeight);  //如果实际高度小于分配给它的高度，就使用分配给它的高度 BugID=18196     --xudihui
						}
					}
					if(datagrids && datagrids.length > 0) {
						if(datagrids[index].length > 0) {
							datatableHeight = datatableHeight; 
							var perHeight = datatableHeight/datagrids[index].length;
							for(var dg=0;dg<datagrids[index].length;dg++) {
								
								var dgwidget = eval(datagrids[index][dg]+'Widget');
								
								if(dgwidget) {
									var dg_container = dgwidget._DT ? ( dgwidget.isJS ? dgwidget._DT.container :  dgwidget._DT.oGridDiv ) : dgwidget.container;
									if ( $( dg_container ).is( ':visible' ) ) {
									   	 if( dgwidget._oGrid || dgwidget._DT._oGrid ){
                                          dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									      dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(MESBasic.baseCustomer.baseCustomer.custEdit.initCount <= 2) {
										setTimeout(function(){MESBasic.baseCustomer.baseCustomer.custEdit.initSize();}, 200);
										MESBasic.baseCustomer.baseCustomer.custEdit.initCount++;
									}/* else {
										MESBasic.baseCustomer.baseCustomer.custEdit.initCount = 0;
									}*/
								}
							}
						}
					} else {
						if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
						    $(this).parent().height(conHeight);
						}
						else{     //当此页签下面的实际内容高度大于分配给它的高度
							$(this).parent().height(conHeight);
							if(($("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-workflow").length > 0) && ($("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
							 $(this).parent().height(conHeight-14); //有处理结果浮动层的时候，底部留白14像素
							}	
							$(this).parent().css("overflow-y","auto");
						}
					}
					/*
					// 文档申明换成更标准的之后,这个问题不会出现在真实的ie8及以上的浏览器中, 这里的算法会产生其他问题BugID=18197,先注释掉这段代码，后面如果有需要再调整这块代码 ———— lidong
					if($(this).parent().css("overflow-y")=="auto"){  //IE7 下面当内容出现滚动条的时候，不会主动去腾出滚动条的宽度，需要手动计算
						if(YAHOO.env.ua.ie < 8 ){
	                         var width = parseInt($(window).width());
							if($("#edit_side_btn").length>0){
							   $("#edit_side_btn").hasClass('edit-side-btn-r') ? width = width : width = width-145;
							}
							if($('.edit-tabs').length>0){
							   width = width*0.98; //IE7下面把总宽度的98%赋值给它的分配宽度，保持跟IE高版本一致
							}
							var style = ';width:' + (width-48) + 'px;';  //IE7下面把它的分配宽度再减去右侧滚动条的宽度
							$(this).attr('style',style);
							$(this).parent().parent().find('.edit-datatable').each(function(){ //IE7下面如果pt内容为空，直接隐藏，不然会有一个默认高度
								if($(this).html() ==''){$(this).css('display','none');}
							});
						}					
					}
					*/						
				});
			}
			
			
			$(function(){
				MESBasic.baseCustomer.baseCustomer.custEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.baseCustomer.baseCustomer.custEdit.initSize();
				if(YAHOO.env.ua.ie == 6){
					$("#loading_wrap_first").css("display","block");
				}
				$("#load_mask_first").remove();
				$("#load_iframe_ie_first").remove();
				$("#loading_wrap_first").remove();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
					$(window).resize(function(){
						for(var i=0; i<CUI.DataTable.Arrays.length; i++){
							if( CUI.DataTable.Arrays[i] && document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) &&  $( CUI.DataTable.Arrays[i].container ).is(':visible') ){
								CUI.DataTable.Arrays[i]._initDomElements();
							}else if( CUI.DataTable.Arrays[i] && !document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) ){
								CUI.DataTable.Arrays[i] = null;
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width"),10)==650){
							$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.baseCustomer.baseCustomer.custEdit.resizeLayout();
						//MESBasic.baseCustomer.baseCustomer.custEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width"),10)==800){
							$("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.baseCustomer.baseCustomer.custEdit.resizeLayout();
						//MESBasic.baseCustomer.baseCustomer.custEdit.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>

				if($("ul.edit-tabs li").length > 0) {
			     	$("ul.edit-tabs").tabs("div.edit-panes > div");
			    }
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					MESBasic.baseCustomer.baseCustomer.custEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.baseCustomer.baseCustomer.custEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.baseCustomer.baseCustomer.custEdit.initSize();});
				/*
				MESBasic.baseCustomer.baseCustomer.custEdit.resizeLayout=function(){
					CUI("div[class='elm-layout-doc elm-layout-doc-in-wrap']").each(function(){
						var id=CUI(this).attr("id");
						var layoutObj=eval(id+"Widget");
						layoutObj.resize();
					})
				}
				*/
			});
		</script>
		<script type="text/javascript">
		
		$(function(){
		});

		MESBasic.baseCustomer.baseCustomer.custEdit.validate = function(){
		    <#if dealSet?? && dealSet == 1>
			var cancelItem = $('input[name="workFlowVarStatus"]');
	        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel'));
			if(validateRequiredFlag){
				var comments = $.trim(CUI("#workflow_comments").val());
			 	if(comments != null && comments == ""){
		        	workbenchErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
		        	return false;
				}
			}
		    </#if>
		    return true;
		}
		MESBasic.baseCustomer.baseCustomer.custEdit.beforeSaveProcess = function(){

			var extraCol = '<extra-data>';
			$('#MESBasic_baseCustomer_baseCustomer_custEdit_form').trigger('beforeSubmit');
			//baseCustomer.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="baseCustomer.extraCol"]').val(extraCol);
		}
		MESBasic.baseCustomer.baseCustomer.custEdit.processDataGrid = function(){
		};
		MESBasic.baseCustomer.baseCustomer.custEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.baseCustomer.baseCustomer.custEdit.validate()){return;}
			MESBasic.baseCustomer.baseCustomer.custEdit.beforeSaveProcess();

			//MESBasic.baseCustomer.baseCustomer.custEdit.processDataGrid();
			$('#MESBasic_baseCustomer_baseCustomer_custEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_baseCustomer_baseCustomer_custEdit_form','MESBasic_baseCustomer_baseCustomer_custEdit_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }   
	    });
		<#else>
		$(window).bind('beforeunload',function(){
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }  		  
		});		
		</#if>
		//打印
		MESBasic.baseCustomer.baseCustomer.custEdit.print = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
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
				data += "&dealInfoGroup=" + $('#dealInfoGroup').val();

				var url = document.location.href;
				// TODO 去掉url后的'#'，将来页面上有锚点时，在打印可能也会有问题
				while(url.endsWith('#')) {
					url = url.substring(0, url.length - 1);
				}
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
		
		MESBasic.baseCustomer.baseCustomer.custEdit.saveSetting = function(){
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
		
		MESBasic.baseCustomer.baseCustomer.custEdit.printSetting = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i].split("=");
						if(item[1]=='true'){
							$('#' + item[0]).prop('checked',true);
						}else{
							$('#' + item[0]).prop('checked',false);
						}
					}
				}else{
					$('#mainContent').prop('checked',true);
					$('#dealInfo').prop('checked',true);
					$('#attachmentInfo').prop('checked',true);
				}
				<#if isWorkflow?? && isWorkflow>
				$('td[name="deal"]').show();
				<#else>
				$('td[name="deal"]').hide();
				$('#dealInfo').prop('checked',false);
				</#if>
				<#if isAttachment?? && isAttachment>
				$('td[name="att"]').show();
				<#else>
				$('td[name="att"]').hide();
				$('#attachmentInfo').prop('checked',false);
				</#if>
				MESBasic.baseCustomer.baseCustomer.custEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.baseCustomer.baseCustomer.custEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.baseCustomer.baseCustomer.custEdit.settingDialog.show();
			}
		}
		
		
		MESBasic.baseCustomer.baseCustomer.custEdit._callBackInfo = function(res){
			if(res.dealSuccessFlag){
					var showMsg ;
				if(res.operateType == 'save'){
					showMsg = "${getText("ec.common.savesuccessful")}";
				}else{
					showMsg = "${getText("ec.common.saveandclosesuccessful")}";
				}
				
				//提交成功时隐藏之前的错误信息
				workbenchErrorBarWidget.close();
				
				if(containerLoadPanelWidget && containerLoadPanelWidget.loading && YUD.get("loading_wrap")){
 					YUD.get("loading_wrap").innerHTML = "<div class='success-middle'></div>" ;
 				}

 				try{
					window.opener.refreshPortal('workflow');
					window.opener.timeData();
				}catch(e){
					try{
 						window.opener.MESBasic.baseCustomer.baseCustomer.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.baseCustomer.baseCustomer.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack = customCallBack;
			}
			MESBasic.baseCustomer.baseCustomer.custEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.baseCustomer.baseCustomer.custEdit.initMnemonic_DG_IE = function(oConfig){
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.baseCustomer.baseCustomer.custEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.baseCustomer.baseCustomer.custEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.baseCustomer.baseCustomer.custEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				MESBasic.baseCustomer.baseCustomer.custEdit.gridEventObj = gridEventObj;
				callbackName = "MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.baseCustomer.baseCustomer.custEdit.getMultiselectCallBackInfo_DG" : "MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackInfo_DG";
				MESBasic.baseCustomer.baseCustomer.custEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.baseCustomer.baseCustomer.custEdit._prefix = _prefix.substring(1);
			}
			
			MESBasic.baseCustomer.baseCustomer.custEdit._oGrid = oGrid;
			MESBasic.baseCustomer.baseCustomer.custEdit._sUrl = url;
			if(customCallBack){
				MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack = customCallBack;
			}
			if(MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFuncN == "function") {
				refparam += MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.baseCustomer.baseCustomer.custEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.baseCustomer.baseCustomer.custEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.baseCustomer.baseCustomer.custEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.baseCustomer.baseCustomer.custEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.baseCustomer.baseCustomer.custEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.baseCustomer.baseCustomer.custEdit.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackGroupInfo = function(obj){
			var ids = "";
			var names = "";
			for(var i = 0 ; i < obj.length; i++){
				ids += "," + obj[i].id;
				names += "," + obj[i].name;
			}
			if(ids){ids = ids.substring(1);}
			if(names){names = names.substring(1);}
			$('#groupInfoIds').val(ids);
			$('#groupInfos').val(names);
			MESBasic.baseCustomer.baseCustomer.custEdit._dialog.close();
		}
		MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_custEdit_form',obj[0], MESBasic.baseCustomer.baseCustomer.custEdit._prefix, MESBasic.baseCustomer.baseCustomer.custEdit._sUrl);
			CUI.commonFills('MESBasic_baseCustomer_baseCustomer_custEdit_form',MESBasic.baseCustomer.baseCustomer.custEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.baseCustomer.baseCustomer.custEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack);
					MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.custEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.baseCustomer.baseCustomer.custEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.baseCustomer.baseCustomer.custEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.baseCustomer.baseCustomer.custEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.baseCustomer.baseCustomer.custEdit._sUrl);
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
				if(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack);
					MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.custEdit._dialog.close();
			} catch(e){}
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		MESBasic.baseCustomer.baseCustomer.custEdit.getcallBackInfo_DG = function(obj){
			if(MESBasic.baseCustomer.baseCustomer.custEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.baseCustomer.baseCustomer.custEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.baseCustomer.baseCustomer.custEdit._currRow).next().length==0){
						MESBasic.baseCustomer.baseCustomer.custEdit._oGrid.addNewRow();
					}	
					MESBasic.baseCustomer.baseCustomer.custEdit._currRow = $(MESBasic.baseCustomer.baseCustomer.custEdit._currRow).next();
					$(MESBasic.baseCustomer.baseCustomer.custEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.baseCustomer.baseCustomer.custEdit._currRow,obj[i], MESBasic.baseCustomer.baseCustomer.custEdit._prefix, MESBasic.baseCustomer.baseCustomer.custEdit._sUrl);
				eval("CUI.commonFills_DG(MESBasic.baseCustomer.baseCustomer.custEdit._currRow,MESBasic.baseCustomer.baseCustomer.custEdit._prefix,obj[i],MESBasic.baseCustomer.baseCustomer.custEdit._oGrid)");
			}
			try{
				if(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack);
					MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.custEdit._dialog.close();
			} catch(e){}
		}
		
		MESBasic.baseCustomer.baseCustomer.custEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.baseCustomer.baseCustomer.custEdit._oGrid, MESBasic.baseCustomer.baseCustomer.custEdit._currRow, MESBasic.baseCustomer.baseCustomer.custEdit._key, MESBasic.baseCustomer.baseCustomer.custEdit._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack);
					MESBasic.baseCustomer.baseCustomer.custEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.custEdit._dialog.close();
			} catch(e){}
		};
		
		MESBasic.baseCustomer.baseCustomer.custEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.baseCustomer.baseCustomer.custEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_baseCustomer_baseCustomer_custEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.baseCustomer.baseCustomer.custEdit.onloadForProduct();
			
		});

		MESBasic.baseCustomer.baseCustomer.custEdit.beforeSubmitMethodSettingInPage = function(){
			MESBasic.baseCustomer.baseCustomer.custEdit.onsaveForProduct();
		};
		MESBasic.baseCustomer.baseCustomer.custEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.baseCustomer.baseCustomer.custEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.baseCustomer.baseCustomer.custEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
			var id="#otherContentDiv_"+relatingModelCode;
			if(url.indexOf('?')==-1){
				url+="?mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}else{
				url+="&mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}
			if(showType == 'PART') {
				url += "&viewShowType=" + showType;
			}
			url += "&useInBusiness=yes";
			$('div[id^="otherContentDiv_"]').each(function(){
				CUI(this).hide();
			});
			CUI(id).show();
			if(CUI(id).html() == null || $.trim(CUI(id).html()) == ""){
				CUI(id).load(url);
				setTimeout(function(){
					CUI("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").hide();
				},500);
			}else{
				CUI("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").hide();
			  	$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.baseCustomer.baseCustomer.custEdit.showThis = function(){
			if(!CUI("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").is(':visible')) {
				CUI("#MESBasic_baseCustomer_baseCustomer_custEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		MESBasic.baseCustomer.baseCustomer.custEdit.showInfoDialog=function(mode){
			
			MESBasic.baseCustomer.baseCustomer.custEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_baseCustomer_baseCustomer_custEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.baseCustomer.baseCustomer.custEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.baseCustomer.baseCustomer.custEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_baseCustomer");
			}
		}
		
		MESBasic.baseCustomer.baseCustomer.custEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/baseCustomer/baseCustomer/dealInfo-list.action&dlTableInfoId=${(baseCustomer.tableInfoId)?default('')}");
			}
		}
		MESBasic.baseCustomer.baseCustomer.custEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_baseCustomer_BaseCustomer&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(baseCustomer.tableInfoId)?default('')}");
			}
		}
		MESBasic.baseCustomer.baseCustomer.custEdit.supervision=function(){
			MESBasic.baseCustomer.baseCustomer.custEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(baseCustomer.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.baseCustomer.baseCustomer.custEdit.modifyOwnerStaffDialog.show();
		}
		


		/* CUSTOM CODE START(view-EDIT-MESBasic_1_baseCustomer_custEdit,js,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */

		MESBasic.baseCustomer.baseCustomer.custEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_baseCustomer_custEdit,onloadForProduct,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
		}

		MESBasic.baseCustomer.baseCustomer.custEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_baseCustomer_custEdit,onsaveForProduct,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
		}
		
		</script>
		<script type="text/javascript">
		
		var __last_click_item = null;
		$(".edit-tabs li").click(function(){
			var li = $(this);
			var ul=$("#flowHead").parent()[0];
			if(__last_click_item != null){
				$(ul).children().eq(__last_click_item).next().addClass("bar");
			}
			if(__last_click_item == null){
				__last_click_item = li.index();
			}
			__last_click_item = li.index();
			if(li.index() == ($(".edit-tabs li").length-1)){
			}else{
				li.next().removeClass("bar");
			}
			if(li.index() != 0){
				li.addClass("bar");
			}
			// 触发 resize 事件, 解决用户在其他页签下缩放窗口后，再切换回来时pt等元素宽度会对不上
			setTimeout( function(){
				$(window).trigger('resize');
			}, 100)
		})
		
		</script>
		<script type="text/javascript">
			$(function(){
				$(".edit-btn").hover(
				  function () {
					$(this).addClass("edit-btn-hover");
				  },
				  function () {
					$(this).removeClass("edit-btn-hover");
				  });
				  $(".edit-btn").mousedown(
				  function () {
					$(this).addClass("edit-btn-click");
				  });
				  $(".edit-btn").mouseup(
				  function () {
					$(this).removeClass("edit-btn-click");
				  });
			})
		</script>
		</@s.form>
		<#if businessCenterList??&&businessCenterList?size gt 0 >
		<script type="text/javascript">
			$(function(){
				$(".col-sub").css("display","block");
				$(".main-wrap").css("margin-left",145);
			})
		</script>
		<div class="col-sub">
			<div id="edit_side_btn" class="edit-side-btn"></div>
			<div class="edit-sidebar" id="edit_sidebar" style='height:1000px;'>
			<div class="edit-sidebar-inner" style='height:1000px;'>
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.baseCustomer.baseCustomer.custEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
							 <li>
								<#if editNew>
								<a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.relatingModel.name)}">${getText(l.relatingModel.entity.name)}</a>
								<#else>
									<a href="#" onclick="MESBasic.baseCustomer.baseCustomer.custEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(baseCustomer.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.relatingModel.entity.name)}(${(l.count)!})">${getText(l.relatingModel.entity.name)}(${(l.count)!})</a>
								</#if>
							</li>
						 </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
	<div id="printSettingDiv" style="display:none;width:100%;height:100%;text-align:center">
		<input type="hidden" id="printCookie_id" />
		<input type="hidden" id="printCookie_version" />
		<table width="100%" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="td_right">
					<input type="checkbox" name="mainContent" id="mainContent" checked="checked" />
				</td>
				<td class="td_left">
					<label>正文</label>
				</td>
				<td class="td_right" name="att">
					<input type="checkbox" name="attachmentInfo" id="attachmentInfo" checked="checked"/>
				</td>
				<td class="td_left" name="att">
					<label>附件信息</label>
				</td>
				<td class="td_right" name="deal">
					<input type="checkbox" name="dealInfo" id="dealInfo" checked="checked"/>
				</td>
				<td class="td_left" name="deal">
					<label>处理意见</label>
				</td>
			</tr>
		</table>
	</div>
		<!--[if IE 6]><div style="clear:both;"></div><![endif]-->
		<iframe style="display:none;" id="downloadFrame" src="about:blank"/>
	</body>
</html>