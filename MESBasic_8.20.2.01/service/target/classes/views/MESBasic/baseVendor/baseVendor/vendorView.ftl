<!-- MESBasic_1/baseVendor/vendorView -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_baseVendor_baseVendor">
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
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = baseVendor>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.baseVendor.baseVendor.vendorView">
<#-- 模型名称-->
<#assign modelName = "baseVendor">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_baseVendor_vendorView">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_baseVendor">
<#-- 视图名称-->
<#assign viewName = "vendorView">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_baseVendor_baseVendor_vendorView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "BaseVendor">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = true>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "MESBasic_baseVendor_baseVendor_vendorView_form">
<#-- 待办状态 -->
<#assign pendingstatus =( baseVendor.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('MESBasic.viewtitle.randon1449551572306')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_baseVendor_baseVendor_vendorView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.baseVendor.baseVendor.vendorView');
			MESBasic.baseVendor.baseVendor.vendorView.currentUser = ${userJson};
			MESBasic.baseVendor.baseVendor.vendorView.currentStaff = ${staffJson};
			MESBasic.baseVendor.baseVendor.vendorView.currentDepartment = ${deptJson};
			MESBasic.baseVendor.baseVendor.vendorView.currentPosition = ${postJson};
			MESBasic.baseVendor.baseVendor.vendorView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_baseVendor_vendorView,head,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="baseVendor.vendorVCCode.id,baseVendor.vendorVCCode.code,baseVendor.modifyStaff.id,baseVendor.vendorStaffID.id,baseVendor.vendorCustomerID.id,baseVendor.vendorDepartID.id," onsubmitMethod="MESBasic.baseVendor.baseVendor.vendorView.beforeSubmitMethod()" id="MESBasic_baseVendor_baseVendor_vendorView_form" namespace="/MESBasic/baseVendor/baseVendor/vendorView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_baseVendor_BaseVendor&_bapFieldPermissonModelName_=BaseVendor" editPageNs="MESBasic.baseVendor.baseVendor.vendorView" callback="MESBasic.baseVendor.baseVendor.vendorView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_baseVendor_baseVendor_vendorView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_baseVendor_baseVendor_vendorView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="baseVendor.vendorVCCode.id" value="${(baseVendor.vendorVCCode.id)!""}" originalvalue="${(baseVendor.vendorVCCode.id)!""}"/>
					<input type="hidden" name="baseVendor.vendorVCCode.code" value="${(baseVendor.vendorVCCode.code)!""}" originalvalue="${(baseVendor.vendorVCCode.code)!""}"/>
					<input type="hidden" name="baseVendor.modifyStaff.id" value="${(baseVendor.modifyStaff.id)!""}" originalvalue="${(baseVendor.modifyStaff.id)!""}"/>
					<input type="hidden" name="baseVendor.vendorStaffID.id" value="${(baseVendor.vendorStaffID.id)!""}" originalvalue="${(baseVendor.vendorStaffID.id)!""}"/>
					<input type="hidden" name="baseVendor.vendorCustomerID.id" value="${(baseVendor.vendorCustomerID.id)!""}" originalvalue="${(baseVendor.vendorCustomerID.id)!""}"/>
					<input type="hidden" name="baseVendor.vendorDepartID.id" value="${(baseVendor.vendorDepartID.id)!""}" originalvalue="${(baseVendor.vendorDepartID.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('MESBasic.tabname.radion1449552026798')}</li>
			<li>${getText('MESBasic.tabname.radion1449552039574')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "MESBasic_baseVendor_baseVendor_vendorView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_baseVendor', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.menuName.randon1436776003687')}" >${getText('MESBasic.menuName.randon1436776003687')}</label>
				</td>
				
						<#assign baseVendor_vendorVCCode_name_defaultValue  = ''>
														<#assign baseVendor_vendorVCCode_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1449474675834')}" viewType="${viewType!}" deValue="${baseVendor_vendorVCCode_name_defaultValue!}" conditionfunc="MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc('baseVendor_vendorVCCode_name')" view=true  value="${(baseVendor.vendorVCCode.name)!}" displayFieldName="name" name="baseVendor.vendorVCCode.name" id="baseVendor_vendorVCCode_name" type="other" url="/MESBasic/baseVenderClass/baseVendorClass/refVendor.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseVendor_baseVendor_vendorView_form" editCustomCallback=";" refViewCode="MESBasic_1_baseVenderClass_refVendor" onkeyupfuncname=";_callback_baseVendor_vendorVCCode_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(baseVendor.id)?? && (baseVendor.vendorVCCode.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseVendor.vendorVCCode.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.vendorVCCode', '/MESBasic/baseVenderClass/baseVendorClass/refVendor.action');
												CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.vendorVCCode',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449537304035')}" >${getText('MESBasic.propertydisplayName.randon1449537304035')}</label>
				</td>
				
						<#assign baseVendor_vendorCode_defaultValue  = ''>
							 							<#assign baseVendor_vendorCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorCode" id="baseVendor_vendorCode"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorCode)?has_content>${(baseVendor.vendorCode?html)!}<#else>${baseVendor_vendorCode_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorCode)?has_content>${(baseVendor.vendorCode?html)!}<#else>${baseVendor_vendorCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540785278')}" >${getText('MESBasic.propertydisplayName.randon1449540785278')}</label>
				</td>
				
						<#assign baseVendor_vendorShortName_defaultValue  = ''>
							 							<#assign baseVendor_vendorShortName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorShortName" id="baseVendor_vendorShortName"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorShortName)?has_content>${(baseVendor.vendorShortName?html)!}<#else>${baseVendor_vendorShortName_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorShortName)?has_content>${(baseVendor.vendorShortName?html)!}<#else>${baseVendor_vendorShortName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540299342')}" >${getText('MESBasic.propertydisplayName.randon1449540299342')}</label>
				</td>
				
						<#assign baseVendor_vendorName_defaultValue  = ''>
							 							<#assign baseVendor_vendorName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorName" id="baseVendor_vendorName"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorName)?has_content>${(baseVendor.vendorName?html)!}<#else>${baseVendor_vendorName_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorName)?has_content>${(baseVendor.vendorName?html)!}<#else>${baseVendor_vendorName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449542559405')}" >${getText('MESBasic.propertydisplayName.randon1449542559405')}</label>
				</td>
				
						<#assign baseVendor_vendorVocation_defaultValue  = ''>
							 							<#assign baseVendor_vendorVocation_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseVendor_vendorVocation_defaultValue!}" formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorVocation" code="1004" value="${(baseVendor.vendorVocation)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorVocation" code="1004" value="${(baseVendor.vendorVocation)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540654644')}" >${getText('MESBasic.propertydisplayName.randon1449540654644')}</label>
				</td>
				
						<#assign baseVendor_vendorProperty_defaultValue  = ''>
							 							<#assign baseVendor_vendorProperty_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseVendor_vendorProperty_defaultValue!}" formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorProperty" code="1005" value="${(baseVendor.vendorProperty)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorProperty" code="1005" value="${(baseVendor.vendorProperty)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449538619738')}" >${getText('MESBasic.propertydisplayName.randon1449538619738')}</label>
				</td>
				
						<#assign baseVendor_vendorDegreeCode_defaultValue  = ''>
							 							<#assign baseVendor_vendorDegreeCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseVendor_vendorDegreeCode_defaultValue!}" formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorDegreeCode" code="1007" value="${(baseVendor.vendorDegreeCode)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorDegreeCode" code="1007" value="${(baseVendor.vendorDegreeCode)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540744308')}" >${getText('MESBasic.propertydisplayName.randon1449540744308')}</label>
				</td>
				
						<#assign baseVendor_vendorRegFund_defaultValue  = ''>
							 							<#assign baseVendor_vendorRegFund_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorRegFund" id="baseVendor_vendorRegFund"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorRegFund)?has_content>${(baseVendor.vendorRegFund?html)!}<#else>${baseVendor_vendorRegFund_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorRegFund)?has_content>${(baseVendor.vendorRegFund?html)!}<#else>${baseVendor_vendorRegFund_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449537351553')}" >${getText('MESBasic.propertydisplayName.randon1449537351553')}</label>
				</td>
				
						<#assign baseVendor_vendorCorpopation_defaultValue  = ''>
							 							<#assign baseVendor_vendorCorpopation_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorCorpopation" id="baseVendor_vendorCorpopation"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorCorpopation)?has_content>${(baseVendor.vendorCorpopation?html)!}<#else>${baseVendor_vendorCorpopation_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorCorpopation)?has_content>${(baseVendor.vendorCorpopation?html)!}<#else>${baseVendor_vendorCorpopation_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449538337246')}" >${getText('MESBasic.propertydisplayName.randon1449538337246')}</label>
				</td>
				
						<#assign baseVendor_vendorDCCode_defaultValue  = ''>
							 							<#assign baseVendor_vendorDCCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseVendor_vendorDCCode_defaultValue!}" formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorDCCode" code="1003" value="${(baseVendor.vendorDCCode)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorDCCode" code="1003" value="${(baseVendor.vendorDCCode)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540053342')}" >${getText('MESBasic.propertydisplayName.randon1449540053342')}</label>
				</td>
				
						<#assign baseVendor_vendorIntroduce_defaultValue  = ''>
							 							<#assign baseVendor_vendorIntroduce_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorIntroduce" id="baseVendor_vendorIntroduce"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorIntroduce)?has_content>${(baseVendor.vendorIntroduce?html)!}<#else>${baseVendor_vendorIntroduce_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorIntroduce)?has_content>${(baseVendor.vendorIntroduce?html)!}<#else>${baseVendor_vendorIntroduce_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540110161')}" >${getText('MESBasic.propertydisplayName.randon1449540110161')}</label>
				</td>
				
						<#assign baseVendor_vendorMemo_defaultValue  = ''>
							 							<#assign baseVendor_vendorMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorMemo" id="baseVendor_vendorMemo"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorMemo)?has_content>${(baseVendor.vendorMemo?html)!}<#else>${baseVendor_vendorMemo_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorMemo)?has_content>${(baseVendor.vendorMemo?html)!}<#else>${baseVendor_vendorMemo_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.createTime')}" >${getText('ec.common.createTime')}</label>
				</td>
				
						<#assign baseVendor_createTime_defaultValue  = ''>
							 							<#assign baseVendor_createTime_defaultValue  = ''>
					<#if (baseVendor_createTime_defaultValue)?? &&(baseVendor_createTime_defaultValue)?has_content>
							<#assign baseVendor_createTime_defaultValue  = getDefaultDateTime(baseVendor_createTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(baseVendor.createTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="baseVendor.createTime" value="${baseVendor_createTime_defaultValue!}" type="dateTime"  id="baseVendor.createTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (baseVendor.createTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="baseVendor.createTime" value="${baseVendor.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="baseVendor.createTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="baseVendor.createTime" value="" type="dateTime" id="baseVendor.createTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName.Cust3')}" >${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName.Cust3')}</label>
				</td>
				
						<#assign baseVendor_modifyStaff_name_defaultValue  = ''>
														<#assign baseVendor_modifyStaff_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${baseVendor_modifyStaff_name_defaultValue!}" conditionfunc="MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc('baseVendor_modifyStaff_name')" view=true  value="${(baseVendor.modifyStaff.name)!}" displayFieldName="name" name="baseVendor.modifyStaff.name" id="baseVendor_modifyStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseVendor_baseVendor_vendorView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_baseVendor_modifyStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (baseVendor_modifyStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.modifyStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.modifyStaff',obj,true);
											$('input:hidden[name="baseVendor.modifyStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(baseVendor.id)?? && (baseVendor.modifyStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseVendor.modifyStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.modifyStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.modifyStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.ec.common.modifyTime1')}" >${getText('MESBasic.ec.common.modifyTime1')}</label>
				</td>
				
						<#assign baseVendor_modifyTime_defaultValue  = ''>
							 							<#assign baseVendor_modifyTime_defaultValue  = ''>
					<#if (baseVendor_modifyTime_defaultValue)?? &&(baseVendor_modifyTime_defaultValue)?has_content>
							<#assign baseVendor_modifyTime_defaultValue  = getDefaultDateTime(baseVendor_modifyTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(baseVendor.modifyTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="baseVendor.modifyTime" value="${baseVendor_modifyTime_defaultValue!}" type="dateTime"  id="baseVendor.modifyTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (baseVendor.modifyTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="baseVendor.modifyTime" value="${baseVendor.modifyTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="baseVendor.modifyTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="baseVendor.modifyTime" value="" type="dateTime" id="baseVendor.modifyTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
			</div>
		</div>
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449542590908')}" >${getText('MESBasic.propertydisplayName.randon1449542590908')}</label>
				</td>
				
						<#assign baseVendor_vendorWeb_defaultValue  = ''>
							 							<#assign baseVendor_vendorWeb_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorWeb" id="baseVendor_vendorWeb"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorWeb)?has_content>${(baseVendor.vendorWeb?html)!}<#else>${baseVendor_vendorWeb_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorWeb)?has_content>${(baseVendor.vendorWeb?html)!}<#else>${baseVendor_vendorWeb_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449539582337')}" >${getText('MESBasic.propertydisplayName.randon1449539582337')}</label>
				</td>
				
						<#assign baseVendor_vendorEmail_defaultValue  = ''>
							 							<#assign baseVendor_vendorEmail_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorEmail" id="baseVendor_vendorEmail"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorEmail)?has_content>${(baseVendor.vendorEmail?html)!}<#else>${baseVendor_vendorEmail_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorEmail)?has_content>${(baseVendor.vendorEmail?html)!}<#else>${baseVendor_vendorEmail_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540487273')}" >${getText('MESBasic.propertydisplayName.randon1449540487273')}</label>
				</td>
				
						<#assign baseVendor_vendorPhone_defaultValue  = ''>
							 							<#assign baseVendor_vendorPhone_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorPhone" id="baseVendor_vendorPhone"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorPhone)?has_content>${(baseVendor.vendorPhone?html)!}<#else>${baseVendor_vendorPhone_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorPhone)?has_content>${(baseVendor.vendorPhone?html)!}<#else>${baseVendor_vendorPhone_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540035220')}" >${getText('MESBasic.propertydisplayName.randon1449540035220')}</label>
				</td>
				
						<#assign baseVendor_vendorFax_defaultValue  = ''>
							 							<#assign baseVendor_vendorFax_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorFax" id="baseVendor_vendorFax"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorFax)?has_content>${(baseVendor.vendorFax?html)!}<#else>${baseVendor_vendorFax_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorFax)?has_content>${(baseVendor.vendorFax?html)!}<#else>${baseVendor_vendorFax_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540238015')}" >${getText('MESBasic.propertydisplayName.randon1449540238015')}</label>
				</td>
				
						<#assign baseVendor_vendorMobile_defaultValue  = ''>
							 							<#assign baseVendor_vendorMobile_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorMobile" id="baseVendor_vendorMobile"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorMobile)?has_content>${(baseVendor.vendorMobile?html)!}<#else>${baseVendor_vendorMobile_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorMobile)?has_content>${(baseVendor.vendorMobile?html)!}<#else>${baseVendor_vendorMobile_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540504178')}" >${getText('MESBasic.propertydisplayName.randon1449540504178')}</label>
				</td>
				
						<#assign baseVendor_vendorPostCode_defaultValue  = ''>
							 							<#assign baseVendor_vendorPostCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorPostCode" id="baseVendor_vendorPostCode"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorPostCode)?has_content>${(baseVendor.vendorPostCode?html)!}<#else>${baseVendor_vendorPostCode_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorPostCode)?has_content>${(baseVendor.vendorPostCode?html)!}<#else>${baseVendor_vendorPostCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449536845583')}" >${getText('MESBasic.propertydisplayName.randon1449536845583')}</label>
				</td>
				
						<#assign baseVendor_vendorAddress_defaultValue  = ''>
							 							<#assign baseVendor_vendorAddress_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorAddress" id="baseVendor_vendorAddress"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorAddress)?has_content>${(baseVendor.vendorAddress?html)!}<#else>${baseVendor_vendorAddress_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorAddress)?has_content>${(baseVendor.vendorAddress?html)!}<#else>${baseVendor_vendorAddress_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
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
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449537269854')}" >${getText('MESBasic.propertydisplayName.randon1449537269854')}</label>
				</td>
				
						<#assign baseVendor_vendorBank_defaultValue  = ''>
							 							<#assign baseVendor_vendorBank_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorBank" id="baseVendor_vendorBank"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorBank)?has_content>${(baseVendor.vendorBank?html)!}<#else>${baseVendor_vendorBank_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorBank)?has_content>${(baseVendor.vendorBank?html)!}<#else>${baseVendor_vendorBank_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449536798241')}" >${getText('MESBasic.propertydisplayName.randon1449536798241')}</label>
				</td>
				
						<#assign baseVendor_vendorAccount_defaultValue  = ''>
							 							<#assign baseVendor_vendorAccount_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorAccount" id="baseVendor_vendorAccount"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorAccount)?has_content>${(baseVendor.vendorAccount?html)!}<#else>${baseVendor_vendorAccount_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorAccount)?has_content>${(baseVendor.vendorAccount?html)!}<#else>${baseVendor_vendorAccount_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449541961163')}" >${getText('MESBasic.propertydisplayName.randon1449541961163')}</label>
				</td>
				
						<#assign baseVendor_vendorTradeCode_defaultValue  = ''>
							 							<#assign baseVendor_vendorTradeCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorTradeCode" id="baseVendor_vendorTradeCode"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorTradeCode)?has_content>${(baseVendor.vendorTradeCode?html)!}<#else>${baseVendor_vendorTradeCode_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorTradeCode)?has_content>${(baseVendor.vendorTradeCode?html)!}<#else>${baseVendor_vendorTradeCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449541242343')}" >${getText('MESBasic.propertydisplayName.randon1449541242343')}</label>
				</td>
				
						<#assign baseVendor_vendorTaxCode_defaultValue  = ''>
							 							<#assign baseVendor_vendorTaxCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorTaxCode" id="baseVendor_vendorTaxCode"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorTaxCode)?has_content>${(baseVendor.vendorTaxCode?html)!}<#else>${baseVendor_vendorTaxCode_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorTaxCode)?has_content>${(baseVendor.vendorTaxCode?html)!}<#else>${baseVendor_vendorTaxCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449538980399')}" >${getText('MESBasic.propertydisplayName.randon1449538980399')}</label>
				</td>
				
						<#assign baseVendor_vendorDeliveryCode_defaultValue  = ''>
							 							<#assign baseVendor_vendorDeliveryCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseVendor_vendorDeliveryCode_defaultValue!}" formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorDeliveryCode" code="1002" value="${(baseVendor.vendorDeliveryCode)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseVendor_baseVendor_vendorView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseVendor.vendorDeliveryCode" code="1002" value="${(baseVendor.vendorDeliveryCode)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540430024')}" >${getText('MESBasic.propertydisplayName.randon1449540430024')}</label>
				</td>
				
						<#assign baseVendor_vendorPayCondition_defaultValue  = ''>
							 							<#assign baseVendor_vendorPayCondition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseVendor.vendorPayCondition" id="baseVendor_vendorPayCondition"  style=";" originalvalue="<#if !newObj || (baseVendor.vendorPayCondition)?has_content>${(baseVendor.vendorPayCondition?html)!}<#else>${baseVendor_vendorPayCondition_defaultValue!}</#if>" value="<#if !newObj || (baseVendor.vendorPayCondition)?has_content>${(baseVendor.vendorPayCondition?html)!}<#else>${baseVendor_vendorPayCondition_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646749348.Cust1')}" >${getText('MESBasic.propertydisplayName.randon1449646749348.Cust1')}</label>
				</td>
				
						<#assign baseVendor_vendorCustomerID_customerName_defaultValue  = ''>
														<#assign baseVendor_vendorCustomerID_customerName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1449650950146')}" viewType="${viewType!}" deValue="${baseVendor_vendorCustomerID_customerName_defaultValue!}" conditionfunc="MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc('baseVendor_vendorCustomerID_customerName')" view=true  value="${(baseVendor.vendorCustomerID.customerName)!}" displayFieldName="customerName" name="baseVendor.vendorCustomerID.customerName" id="baseVendor_vendorCustomerID_customerName" type="other" url="/MESBasic/baseCustomer/baseCustomer/refCustLayout.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseVendor_baseVendor_vendorView_form" editCustomCallback=";" refViewCode="MESBasic_1_baseCustomer_refCustLayout" onkeyupfuncname=";_callback_baseVendor_vendorCustomerID_customerName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(baseVendor.id)?? && (baseVendor.vendorCustomerID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseVendor.vendorCustomerID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.vendorCustomerID', '/MESBasic/baseCustomer/baseCustomer/refCustLayout.action');
												CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.vendorCustomerID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.part.fzwdy.xm.mainPositionId.department.name')}" >${getText('MESBasic.part.fzwdy.xm.mainPositionId.department.name')}</label>
				</td>
				
						<#assign baseVendor_vendorDepartID_name_defaultValue  = ''>
														<#assign baseVendor_vendorDepartID_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.department.reference')}" viewType="${viewType!}" deValue="${baseVendor_vendorDepartID_name_defaultValue!}" conditionfunc="MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc('baseVendor_vendorDepartID_name')" view=true  value="${(baseVendor.vendorDepartID.name)!}" displayFieldName="name" name="baseVendor.vendorDepartID.name" id="baseVendor_vendorDepartID_name" type="Department" url="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseVendor_baseVendor_vendorView_form" editCustomCallback=";" refViewCode="sysbase_1.0_department_departmentRefCustom" onkeyupfuncname=";_callback_baseVendor_vendorDepartID_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (baseVendor_vendorDepartID_name_defaultValue)=='currentDepart'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.mainPosition.department.id}'};
											obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.vendorDepartID', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
											CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.vendorDepartID',obj,true);
											$('input:hidden[name="baseVendor.vendorDepartID.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(baseVendor.id)?? && (baseVendor.vendorDepartID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseVendor.vendorDepartID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.vendorDepartID', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
												CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.vendorDepartID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName')}" >${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName')}</label>
				</td>
				
						<#assign baseVendor_vendorStaffID_name_defaultValue  = ''>
														<#assign baseVendor_vendorStaffID_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${baseVendor_vendorStaffID_name_defaultValue!}" conditionfunc="MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc('baseVendor_vendorStaffID_name')" view=true  value="${(baseVendor.vendorStaffID.name)!}" displayFieldName="name" name="baseVendor.vendorStaffID.name" id="baseVendor_vendorStaffID_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseVendor_baseVendor_vendorView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_baseVendor_vendorStaffID_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (baseVendor_vendorStaffID_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.vendorStaffID', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.vendorStaffID',obj,true);
											$('input:hidden[name="baseVendor.vendorStaffID.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(baseVendor.id)?? && (baseVendor.vendorStaffID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseVendor.vendorStaffID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj, 'baseVendor.vendorStaffID', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form', 'baseVendor.vendorStaffID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
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
			
			
</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="MESBasic_baseVendor_baseVendor_vendorView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.baseVendor.baseVendor.vendorView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_baseVendor_vendorView,html,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) -->
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
						$("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.baseVendor.baseVendor.vendorView.initCount = 0;
			MESBasic.baseVendor.baseVendor.vendorView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-head").height()-$("#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_baseVendor_baseVendor_vendorView_datagrids');
				var padding_bottom=16;
				$("#MESBasic_baseVendor_baseVendor_vendorView_main_div .pd_bottom,#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-panes-s").each(function(index){
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
							$(this).parent().height(thisHeight);			//解决存在存在pt的情况，当页面resize时，造成的高度设定不正确问题， BugID=27472			--fukun
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
									if(MESBasic.baseVendor.baseVendor.vendorView.initCount <= 2) {
										setTimeout(function(){MESBasic.baseVendor.baseVendor.vendorView.initSize();}, 200);
										MESBasic.baseVendor.baseVendor.vendorView.initCount++;
									}/* else {
										MESBasic.baseVendor.baseVendor.vendorView.initCount = 0;
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
							if(($("#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-workflow").length > 0) && ($("#MESBasic_baseVendor_baseVendor_vendorView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_baseVendor_baseVendor_vendorView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.baseVendor.baseVendor.vendorView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.baseVendor.baseVendor.vendorView.initSize();
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
								CUI.DataTable.Arrays.splice(i, 1);
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width"),10)==650){
							$("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.baseVendor.baseVendor.vendorView.resizeLayout();
						//MESBasic.baseVendor.baseVendor.vendorView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width"),10)==800){
							$("#MESBasic_baseVendor_baseVendor_vendorView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.baseVendor.baseVendor.vendorView.resizeLayout();
						//MESBasic.baseVendor.baseVendor.vendorView.initSize();
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
					MESBasic.baseVendor.baseVendor.vendorView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.baseVendor.baseVendor.vendorView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.baseVendor.baseVendor.vendorView.initSize();});
				/*
				MESBasic.baseVendor.baseVendor.vendorView.resizeLayout=function(){
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
			//解决合并单元格后，同行（tr）内的所有td跨行数（rowspan）相同时,组态期表现为tr占n行单元格，在运行期错乱的bug
			var editContainer = $( 'div.edit-container' );
		    var editTr=editContainer.find(".edit-table tr");
		    $.each(editTr,function(i,item){
		        var editTd=$(item).find("td");
		        var isSameRowSpan=true;//单元格跨行数是否相等
		        var rsTemp;//跨行数
		        var csTemp=0;//跨列数（需累加）
		        for(var k=0;k<editTd.length;k++){
		           var ele=editTd[k];
		           var rowspan=$(ele).attr("rowspan");
		           var colspan=$(ele).attr("colspan");
		           if(!rowspan||rowspan=="") rowspan=1;
		           if(!colspan||colspan=="") colspan=1;
		           csTemp+=Number(colspan);
		           if(!rsTemp){
		              rsTemp=Number(rowspan);
		           }else{
		              if(rsTemp!=rowspan){
		                 isSameRowSpan=false;
		              }
		           }  
		        }
		        //单元格跨行数相等且不为1的情况下，重组本行内容
		        if(isSameRowSpan&&rsTemp!=1){
		           recombineTr(item,rsTemp,csTemp);
		        }
		    });
		    //对满足条件的行进行跨行重组
		    function recombineTr(editTr,rsNum,csNum){
		        var editTd=$(editTr).find("td");
		        $.each(editTd,function(i,item){
		           $(item).attr({"rowspan":"1","data-row":rsNum});
		        });
		        var appendTr="";
		        for(var i=0;i<rsNum-1;i++){
		          appendTr+="<tr data-tag='appendrow'><td class='edit-table-symbol' colspan='"+csNum+"'>&nbsp;</td></tr>";
		        }
		        $(appendTr).insertAfter(editTr);
		    }
		});

		MESBasic.baseVendor.baseVendor.vendorView.validate = function(){
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
		MESBasic.baseVendor.baseVendor.vendorView.beforeSaveProcess = function(){
			$('input[name="baseVendor.extraCol"]').remove();
		}
		MESBasic.baseVendor.baseVendor.vendorView.processDataGrid = function(){
		};
		MESBasic.baseVendor.baseVendor.vendorView.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.baseVendor.baseVendor.vendorView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.baseVendor.baseVendor.vendorView.beforeSaveProcess();

			//MESBasic.baseVendor.baseVendor.vendorView.processDataGrid();
			$('#MESBasic_baseVendor_baseVendor_vendorView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_baseVendor_baseVendor_vendorView_form','MESBasic_baseVendor_baseVendor_vendorView_datagrids')) {      
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
		MESBasic.baseVendor.baseVendor.vendorView.print = function(){
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
		
		MESBasic.baseVendor.baseVendor.vendorView.saveSetting = function(){
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
		
		MESBasic.baseVendor.baseVendor.vendorView.printSetting = function(){
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
				MESBasic.baseVendor.baseVendor.vendorView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.baseVendor.baseVendor.vendorView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.baseVendor.baseVendor.vendorView.settingDialog.show();
			}
		}
		
		
		MESBasic.baseVendor.baseVendor.vendorView._callBackInfo = function(res){
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
 						window.opener.MESBasic.baseVendor.baseVendor.editCallBackInfo(res); 						
					}catch(e2){
						try{
							if(typeof window.opener.refViewRefresh == 'function'){
								window.opener.refViewRefresh()
							} else {
								window.opener.location.reload();
							}
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.baseVendor.baseVendor.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				MESBasic.baseVendor.baseVendor.vendorView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.baseVendor.baseVendor.vendorView._refViewCode_IE = viewCode;
			} else {
				MESBasic.baseVendor.baseVendor.vendorView._refViewCode_IE = '';
			}
			MESBasic.baseVendor.baseVendor.vendorView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.baseVendor.baseVendor.vendorView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.baseVendor.baseVendor.vendorView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.baseVendor.baseVendor.vendorView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.baseVendor.baseVendor.vendorView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.baseVendor.baseVendor.vendorView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.baseVendor.baseVendor.vendorView.gridEventObj = gridEventObj;
				callbackName = "MESBasic.baseVendor.baseVendor.vendorView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.baseVendor.baseVendor.vendorView.getMultiselectCallBackInfo_DG" : "MESBasic.baseVendor.baseVendor.vendorView.getcallBackInfo_DG";
				MESBasic.baseVendor.baseVendor.vendorView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.baseVendor.baseVendor.vendorView.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.baseVendor.baseVendor.vendorView._prefix = _prefix.substring(1);
			}
			
			MESBasic.baseVendor.baseVendor.vendorView._oGrid = oGrid;
			MESBasic.baseVendor.baseVendor.vendorView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.baseVendor.baseVendor.vendorView._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.baseVendor.baseVendor.vendorView._refViewCode = '';
				}
			} else {
				MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp = false;
				MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames = '';
				MESBasic.baseVendor.baseVendor.vendorView._refViewCode = '';
			}
			if (MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp == true && MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.baseVendor.baseVendor.vendorView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.baseVendor.baseVendor.vendorView._customCallBack = customCallBack;
			}
			if(MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.baseVendor.baseVendor.vendorView._querycustomFuncN == "function") {
				refparam += MESBasic.baseVendor.baseVendor.vendorView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.baseVendor.baseVendor.vendorView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.baseVendor.baseVendor.vendorView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.baseVendor.baseVendor.vendorView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.baseVendor.baseVendor.vendorView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.baseVendor.baseVendor.vendorView._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.baseVendor.baseVendor.vendorView.query_"+obj+")!='undefined'") ? eval('MESBasic.baseVendor.baseVendor.vendorView.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.baseVendor.baseVendor.vendorView.getcallBackGroupInfo = function(obj){
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
			MESBasic.baseVendor.baseVendor.vendorView._dialog.close();
		}
		MESBasic.baseVendor.baseVendor.vendorView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_baseVendor_baseVendor_vendorView_form',obj[0], MESBasic.baseVendor.baseVendor.vendorView._prefix, MESBasic.baseVendor.baseVendor.vendorView._sUrl);
			CUI.commonFills('MESBasic_baseVendor_baseVendor_vendorView_form',MESBasic.baseVendor.baseVendor.vendorView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.baseVendor.baseVendor.vendorView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.baseVendor.baseVendor.vendorView._customCallBack) {
					eval(MESBasic.baseVendor.baseVendor.vendorView._customCallBack);
					MESBasic.baseVendor.baseVendor.vendorView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseVendor.baseVendor.vendorView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.baseVendor.baseVendor.vendorView.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.baseVendor.baseVendor.vendorView._customBeforeCallBack) {
				var flag = eval(MESBasic.baseVendor.baseVendor.vendorView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.baseVendor.baseVendor.vendorView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp_IE == true && MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.baseVendor.baseVendor.vendorView._sUrl,MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.baseVendor.baseVendor.vendorView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp_IE == true && MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if ( tagName == (rootKey + 'MainDisplay') ) {
						try{
							var showVal = eval('jsonObj.' + showName);
						}catch(e){
							var showVal = eval('jsonObj["' + showName + '"]');
						}
						if (showVal != undefined ) {
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,showVal);
						} else {
							try {
								var trueVal = eval('jsonObj.' + trueName);
							} catch(e) {
								var trueVal = eval('jsonObj["' + trueName + '"]');
							}
							trueVal = ( trueVal != undefined ? trueVal : '' );
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
						}
					} else if ( tagName == rootKey ) {
						try{
							var trueVal = eval('jsonObj.' + trueName);
						}catch(e){
							var trueVal = eval('jsonObj["' + trueName + '"]');
						}
						trueVal = ( trueVal != undefined ? trueVal : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
					}
				}
			} else {
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if( tagName.indexOf(rootKey) == 0 ){
						try{
							var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
						}catch(e){
							var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
						}
						//判断符合条件的key是否存在
						value = ( value != undefined ? value : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);			
					}
				}
			}
			// 自定义字段参照回填
			if ( $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).length > 0 ) {
				var dg_cp_info = $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).val();
				var id = jsonObj.id;
				var relationMap;
				if (dg_cp_info && id && MESBasic.baseVendor.baseVendor.vendorView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.baseVendor.baseVendor.vendorView._refViewCode_IE + '&id=' + id,
						success : function(res){
							if (res.dealSuccessFlag && res.relationMap) {
								relationMap = res.relationMap;
							}
						}
					});
					if (relationMap) {
						var objs = new Object();
						var infoArr = dg_cp_info.split(',');
						for (var n in infoArr) {
							var info = infoArr[n].split('||');
							var key = info[0];
							var name = info[1];
							var propCode = '';
							if (info.length > 2) {
								propCode = info[2];
							}
							var val = relationMap[key];
							if (val) {
								objs[name] = val;
								if (propCode) {
									$.ajax({
										async   : false,
										type    : 'POST',
										url     : '/foundation/customProp/getMainDisplayValue.action',
										data    : 'code=' + propCode + '&id=' + val,
										success : function(res){
											if (res.dealSuccessFlag && res.displayValue) {
												var displayName = name + 'MainDisplay';
												objs[displayName] = res.displayValue;
											}
										}
									});
								}
							}
						}
						// console.log(objs);
						if (objs) {
							for( var i = 0; i < xmlHead.children().length; i++ ){
								var tagName = xmlHead.children()[i].tagName;
								try{
									var value = eval('objs.' + tagName);
								}catch(e){
									var value = eval('objs["' + tagName + '"]');
								}
								if( value != undefined ){
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}else if( objs.hasOwnProperty(  tagName  ) ){
									value = '';
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}								
							}
						}
					}
				}
			}
			try{
				if(MESBasic.baseVendor.baseVendor.vendorView._customCallBack) {
					eval(MESBasic.baseVendor.baseVendor.vendorView._customCallBack);
					MESBasic.baseVendor.baseVendor.vendorView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseVendor.baseVendor.vendorView._dialog.close();
			} catch(e){}
			
			try{
				var errorMsg = ''
				for ( var item in  CUI.error_msg_DG_CP_map ){
					errorMsg += ( '<b>' + gridEventObj.oGrid._DT._oGrid.ColGetProperty(item,'caption') +  '</b>第<b>' + ( gridEventObj.nRow + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
				}
				if( errorMsg ){
					workbenchErrorBarWidget.showMessage( errorMsg );
				}	
			}catch(e){};
			
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		MESBasic.baseVendor.baseVendor.vendorView.getcallBackInfo_DG = function(obj){
			if(MESBasic.baseVendor.baseVendor.vendorView._customBeforeCallBack) {
				var flag = eval(MESBasic.baseVendor.baseVendor.vendorView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.baseVendor.baseVendor.vendorView._currRow).next().length==0){
						MESBasic.baseVendor.baseVendor.vendorView._oGrid.addNewRow();
					}	
					MESBasic.baseVendor.baseVendor.vendorView._currRow = $(MESBasic.baseVendor.baseVendor.vendorView._currRow).next();
					$(MESBasic.baseVendor.baseVendor.vendorView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.baseVendor.baseVendor.vendorView._currRow,obj[i], MESBasic.baseVendor.baseVendor.vendorView._prefix, MESBasic.baseVendor.baseVendor.vendorView._sUrl);
				if (MESBasic.baseVendor.baseVendor.vendorView._isObjCustomProp == true && MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.baseVendor.baseVendor.vendorView._currRow,MESBasic.baseVendor.baseVendor.vendorView._prefix,obj[i],MESBasic.baseVendor.baseVendor.vendorView._oGrid,MESBasic.baseVendor.baseVendor.vendorView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.baseVendor.baseVendor.vendorView._currRow,MESBasic.baseVendor.baseVendor.vendorView._prefix,obj[i],MESBasic.baseVendor.baseVendor.vendorView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.baseVendor.baseVendor.vendorView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.baseVendor.baseVendor.vendorView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.baseVendor.baseVendor.vendorView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.baseVendor.baseVendor.vendorView._refViewCode + '&id=' + id,
							success : function(res){
								if (res.dealSuccessFlag && res.relationMap) {
									relationMap = res.relationMap;
								}
							}
						});
						if (relationMap) {
							var objs = new Object();
							var infoArr = dg_cp_info.split(',');
							for (var n in infoArr) {
								var info = infoArr[n].split('||');
								var key = info[0];
								var name = info[1];
								var propCode = '';
								if (info.length > 2) {
									propCode = info[2];
								}
								var val = relationMap[key];
								if (val) {
									name = MESBasic.baseVendor.baseVendor.vendorView._oGrid.configs.hidekeyPrefix + name;
									objs[name] = val;
									if (propCode) {
										$.ajax({
											async   : false,
											type    : 'POST',
											url     : '/foundation/customProp/getMainDisplayValue.action',
											data    : 'code=' + propCode + '&id=' + val,
											success : function(res){
												if (res.dealSuccessFlag && res.displayValue) {
													var displayName = name + 'MainDisplay';
													objs[displayName] = res.displayValue;
												}
											}
										});
									}
								}
							}
							// console.log(objs);
							if (objs) {
								CUI.commonFills_DG_CP(MESBasic.baseVendor.baseVendor.vendorView._currRow, objs, MESBasic.baseVendor.baseVendor.vendorView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.baseVendor.baseVendor.vendorView._customCallBack) {
					eval(MESBasic.baseVendor.baseVendor.vendorView._customCallBack);
					MESBasic.baseVendor.baseVendor.vendorView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseVendor.baseVendor.vendorView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.baseVendor.baseVendor.vendorView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.baseVendor.baseVendor.vendorView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.baseVendor.baseVendor.vendorView._oGrid, MESBasic.baseVendor.baseVendor.vendorView._currRow, MESBasic.baseVendor.baseVendor.vendorView._key, MESBasic.baseVendor.baseVendor.vendorView._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.baseVendor.baseVendor.vendorView._customCallBack) {
					eval(MESBasic.baseVendor.baseVendor.vendorView._customCallBack);
					MESBasic.baseVendor.baseVendor.vendorView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseVendor.baseVendor.vendorView._dialog.close();
			} catch(e){}
		};
		
		MESBasic.baseVendor.baseVendor.vendorView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.baseVendor.baseVendor.vendorView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_baseVendor_baseVendor_vendorView_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.baseVendor.baseVendor.vendorView.onloadForProduct();
		});

		MESBasic.baseVendor.baseVendor.vendorView.beforeSubmitMethodSettingInPage = function(){
			MESBasic.baseVendor.baseVendor.vendorView.onsaveForProduct();
		};
		MESBasic.baseVendor.baseVendor.vendorView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.baseVendor.baseVendor.vendorView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.baseVendor.baseVendor.vendorView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_baseVendor_baseVendor_vendorView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_baseVendor_baseVendor_vendorView_main_div").hide();
				},100);
				//CUI("#MESBasic_baseVendor_baseVendor_vendorView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.baseVendor.baseVendor.vendorView.showThis = function(){
			if(!CUI("#MESBasic_baseVendor_baseVendor_vendorView_main_div").is(':visible')) {
				CUI("#MESBasic_baseVendor_baseVendor_vendorView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.baseVendor.baseVendor.vendorView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.baseVendor.baseVendor.vendorView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_baseVendor_baseVendor_vendorView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_baseVendor_BaseVendor&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.baseVendor.baseVendor.vendorView.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.baseVendor.baseVendor.vendorView.showInfoDialog=function(mode){
			
			MESBasic.baseVendor.baseVendor.vendorView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_baseVendor_baseVendor_vendorView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.baseVendor.baseVendor.vendorView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.baseVendor.baseVendor.vendorView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_baseVendor");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_baseVendor");
			</#if>
			}
		}
		
		MESBasic.baseVendor.baseVendor.vendorView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/baseVendor/baseVendor/dealInfo-list.action&dlTableInfoId=${(baseVendor.tableInfoId)?default('')}");
			}
		}
		MESBasic.baseVendor.baseVendor.vendorView.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_baseVendor_BaseVendor&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(baseVendor.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_baseVendor_BaseVendor&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(baseVendor.tableInfoId)?default('')}");
				}		
			}else{
			  if(!isIE8){
			    //h5展现的情况下需重新适应视图大小
			    setTimeout(function(){
			      $("#flowH5Frame").contents().find("#resetFitView").trigger("click");//视图自适应容器大小 
			    },100); 
			  } 
			}
		}
		MESBasic.baseVendor.baseVendor.vendorView.supervision=function(){
			MESBasic.baseVendor.baseVendor.vendorView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(baseVendor.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.baseVendor.baseVendor.vendorView.modifyOwnerStaffDialog.show();
		}
		

		/* CUSTOM CODE START(view-VIEW-MESBasic_1_baseVendor_vendorView,js,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		MESBasic.baseVendor.baseVendor.vendorView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_baseVendor_vendorView,onloadForProduct,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.baseVendor.baseVendor.vendorView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_baseVendor_vendorView,onsaveForProduct,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.baseVendor.baseVendor.vendorView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.baseVendor.baseVendor.vendorView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(baseVendor.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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