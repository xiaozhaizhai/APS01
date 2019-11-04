<!-- MESBasic_1/baseCustomer/viewCustomer -->
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
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = baseCustomer>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.baseCustomer.baseCustomer.viewCustomer">
<#-- 模型名称-->
<#assign modelName = "baseCustomer">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_baseCustomer_viewCustomer">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_baseCustomer">
<#-- 视图名称-->
<#assign viewName = "viewCustomer">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_baseCustomer_baseCustomer_viewCustomer_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "BaseCustomer">
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
<#assign editFormId = "MESBasic_baseCustomer_baseCustomer_viewCustomer_form">
<#-- 待办状态 -->
<#assign pendingstatus =( baseCustomer.pending.taskDescription)!>
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
        <#assign configTitle = getText('MESBasic.viewtitle.randon1449650791587')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_baseCustomer_baseCustomer_viewCustomer_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.baseCustomer.baseCustomer.viewCustomer');
			MESBasic.baseCustomer.baseCustomer.viewCustomer.currentUser = ${userJson};
			MESBasic.baseCustomer.baseCustomer.viewCustomer.currentStaff = ${staffJson};
			MESBasic.baseCustomer.baseCustomer.viewCustomer.currentDepartment = ${deptJson};
			MESBasic.baseCustomer.baseCustomer.viewCustomer.currentPosition = ${postJson};
			MESBasic.baseCustomer.baseCustomer.viewCustomer.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_baseCustomer_viewCustomer,head,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="baseCustomer.customerDepartID.id,baseCustomer.customerVendorID.id,baseCustomer.customerCCCode.id,baseCustomer.customerCCCode.ccCode,baseCustomer.ownerStaff.id," onsubmitMethod="MESBasic.baseCustomer.baseCustomer.viewCustomer.beforeSubmitMethod()" id="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" namespace="/MESBasic/baseCustomer/baseCustomer/viewCustomer" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_baseCustomer_BaseCustomer&_bapFieldPermissonModelName_=BaseCustomer" editPageNs="MESBasic.baseCustomer.baseCustomer.viewCustomer" callback="MESBasic.baseCustomer.baseCustomer.viewCustomer._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_baseCustomer_baseCustomer_viewCustomer">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="baseCustomer.customerDepartID.id" value="${(baseCustomer.customerDepartID.id)!""}" originalvalue="${(baseCustomer.customerDepartID.id)!""}"/>
					<input type="hidden" name="baseCustomer.customerVendorID.id" value="${(baseCustomer.customerVendorID.id)!""}" originalvalue="${(baseCustomer.customerVendorID.id)!""}"/>
					<input type="hidden" name="baseCustomer.customerCCCode.id" value="${(baseCustomer.customerCCCode.id)!""}" originalvalue="${(baseCustomer.customerCCCode.id)!""}"/>
					<input type="hidden" name="baseCustomer.customerCCCode.ccCode" value="${(baseCustomer.customerCCCode.ccCode)!""}" originalvalue="${(baseCustomer.customerCCCode.ccCode)!""}"/>
					<input type="hidden" name="baseCustomer.ownerStaff.id" value="${(baseCustomer.ownerStaff.id)!""}" originalvalue="${(baseCustomer.ownerStaff.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('MESBasic.tabname.radion1449649364114')}</li>
			<li>${getText('MESBasic.tabname.radion1449649488917')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "MESBasic_baseCustomer_baseCustomer_viewCustomer_form"+"_attcount";
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449628587988.Cust1')}" >${getText('MESBasic.propertydisplayName.randon1449628587988.Cust1')}</label>
				</td>
				
						<#assign baseCustomer_customerCCCode_ccName_defaultValue  = ''>
														<#assign baseCustomer_customerCCCode_ccName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1449638283342')}" viewType="${viewType!}" deValue="${baseCustomer_customerCCCode_ccName_defaultValue!}" conditionfunc="MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc('baseCustomer_customerCCCode_ccName')" view=true  value="${(baseCustomer.customerCCCode.ccName)!}" displayFieldName="ccName" name="baseCustomer.customerCCCode.ccName" id="baseCustomer_customerCCCode_ccName" type="other" url="/MESBasic/baseCustomerClass/baseCustomerClass/refCustClaList.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" editCustomCallback=";" refViewCode="MESBasic_1_baseCustomerClass_refCustClaList"  onkeyupfuncname=";_callback_baseCustomer_customerCCCode_ccName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(baseCustomer.id)?? && (baseCustomer.customerCCCode.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseCustomer.customerCCCode.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',obj, 'baseCustomer.customerCCCode', '/MESBasic/baseCustomerClass/baseCustomerClass/refCustClaList.action');
												CUI.commonFills('MESBasic_baseCustomer_baseCustomer_viewCustomer_form', 'baseCustomer.customerCCCode',obj,true);
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449640688865')}" >${getText('MESBasic.propertydisplayName.randon1449640688865')}</label>
				</td>
				
						<#assign baseCustomer_customerCode_defaultValue  = ''>
							 							<#assign baseCustomer_customerCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerCode" id="baseCustomer_customerCode"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerCode)?has_content>${(baseCustomer.customerCode?html)!}<#else>${baseCustomer_customerCode_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerCode)?has_content>${(baseCustomer.customerCode?html)!}<#else>${baseCustomer_customerCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449647160005')}" >${getText('MESBasic.propertydisplayName.randon1449647160005')}</label>
				</td>
				
						<#assign baseCustomer_customerShortName_defaultValue  = ''>
							 							<#assign baseCustomer_customerShortName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerShortName" id="baseCustomer_customerShortName"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerShortName)?has_content>${(baseCustomer.customerShortName?html)!}<#else>${baseCustomer_customerShortName_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerShortName)?has_content>${(baseCustomer.customerShortName?html)!}<#else>${baseCustomer_customerShortName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646749348')}" >${getText('MESBasic.propertydisplayName.randon1449646749348')}</label>
				</td>
				
						<#assign baseCustomer_customerName_defaultValue  = ''>
							 							<#assign baseCustomer_customerName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerName" id="baseCustomer_customerName"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerName)?has_content>${(baseCustomer.customerName?html)!}<#else>${baseCustomer_customerName_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerName)?has_content>${(baseCustomer.customerName?html)!}<#else>${baseCustomer_customerName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName.Cust1')}" >${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName.Cust1')}</label>
				</td>
				
						<#assign baseCustomer_ownerStaff_name_defaultValue  = ''>
														<#assign baseCustomer_ownerStaff_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${baseCustomer_ownerStaff_name_defaultValue!}" conditionfunc="MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc('baseCustomer_ownerStaff_name')" view=true  value="${(baseCustomer.ownerStaff.name)!}" displayFieldName="name" name="baseCustomer.ownerStaff.name" id="baseCustomer_ownerStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_baseCustomer_ownerStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (baseCustomer_ownerStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',obj, 'baseCustomer.ownerStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_baseCustomer_baseCustomer_viewCustomer_form', 'baseCustomer.ownerStaff',obj,true);
											$('input:hidden[name="baseCustomer.ownerStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(baseCustomer.id)?? && (baseCustomer.ownerStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseCustomer.ownerStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',obj, 'baseCustomer.ownerStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_baseCustomer_baseCustomer_viewCustomer_form', 'baseCustomer.ownerStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449648077021')}" >${getText('MESBasic.propertydisplayName.randon1449648077021')}</label>
				</td>
				
						<#assign baseCustomer_customerVocation_defaultValue  = ''>
							 							<#assign baseCustomer_customerVocation_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseCustomer_customerVocation_defaultValue!}" formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerVocation" code="1004" value="${(baseCustomer.customerVocation)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerVocation" code="1004" value="${(baseCustomer.customerVocation)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449640880459')}" >${getText('MESBasic.propertydisplayName.randon1449640880459')}</label>
				</td>
				
						<#assign baseCustomer_customerDCCode_defaultValue  = ''>
							 							<#assign baseCustomer_customerDCCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseCustomer_customerDCCode_defaultValue!}" formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerDCCode" code="1003" value="${(baseCustomer.customerDCCode)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerDCCode" code="1003" value="${(baseCustomer.customerDCCode)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449640744323')}" >${getText('MESBasic.propertydisplayName.randon1449640744323')}</label>
				</td>
				
						<#assign baseCustomer_customerCorporation_defaultValue  = ''>
							 							<#assign baseCustomer_customerCorporation_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerCorporation" id="baseCustomer_customerCorporation"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerCorporation)?has_content>${(baseCustomer.customerCorporation?html)!}<#else>${baseCustomer_customerCorporation_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerCorporation)?has_content>${(baseCustomer.customerCorporation?html)!}<#else>${baseCustomer_customerCorporation_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449647144243')}" >${getText('MESBasic.propertydisplayName.randon1449647144243')}</label>
				</td>
				
						<#assign baseCustomer_customerRegFund_defaultValue  = ''>
							 							<#assign baseCustomer_customerRegFund_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerRegFund" id="baseCustomer_customerRegFund"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerRegFund)?has_content>${(baseCustomer.customerRegFund?html)!}<#else>${baseCustomer_customerRegFund_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerRegFund)?has_content>${(baseCustomer.customerRegFund?html)!}<#else>${baseCustomer_customerRegFund_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449647028584')}" >${getText('MESBasic.propertydisplayName.randon1449647028584')}</label>
				</td>
				
						<#assign baseCustomer_customerProperty_defaultValue  = ''>
							 							<#assign baseCustomer_customerProperty_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseCustomer_customerProperty_defaultValue!}" formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerProperty" code="1005" value="${(baseCustomer.customerProperty)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerProperty" code="1005" value="${(baseCustomer.customerProperty)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449641128193')}" >${getText('MESBasic.propertydisplayName.randon1449641128193')}</label>
				</td>
				
						<#assign baseCustomer_customerDegreeCode_defaultValue  = ''>
							 							<#assign baseCustomer_customerDegreeCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseCustomer_customerDegreeCode_defaultValue!}" formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerDegreeCode" code="1006" value="${(baseCustomer.customerDegreeCode)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerDegreeCode" code="1006" value="${(baseCustomer.customerDegreeCode)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449647925118')}" >${getText('MESBasic.propertydisplayName.randon1449647925118')}</label>
				</td>
				
						<#assign baseCustomer_customerType_defaultValue  = ''>
							 							<#assign baseCustomer_customerType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseCustomer_customerType_defaultValue!}" formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerType" code="1010" value="${(baseCustomer.customerType)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerType" code="1010" value="${(baseCustomer.customerType)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646431517')}" >${getText('MESBasic.propertydisplayName.randon1449646431517')}</label>
				</td>
				
						<#assign baseCustomer_customerIsBlack_defaultValue  = '0'>
							 							<#assign baseCustomer_customerIsBlack_defaultValue  = '0'>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${baseCustomer_customerIsBlack_defaultValue!}" formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerIsBlack" code="WhetherOrNot" value="${(baseCustomer.customerIsBlack)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="baseCustomer.customerIsBlack" code="WhetherOrNot" value="${(baseCustomer.customerIsBlack)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449641563714')}" >${getText('MESBasic.propertydisplayName.randon1449641563714')}</label>
				</td>
				
						<#assign baseCustomer_customerIntroduce_defaultValue  = ''>
							 							<#assign baseCustomer_customerIntroduce_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerIntroduce" id="baseCustomer_customerIntroduce"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerIntroduce)?has_content>${(baseCustomer.customerIntroduce?html)!}<#else>${baseCustomer_customerIntroduce_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerIntroduce)?has_content>${(baseCustomer.customerIntroduce?html)!}<#else>${baseCustomer_customerIntroduce_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646510277')}" >${getText('MESBasic.propertydisplayName.randon1449646510277')}</label>
				</td>
				
						<#assign baseCustomer_customerMemo_defaultValue  = ''>
							 							<#assign baseCustomer_customerMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerMemo" id="baseCustomer_customerMemo"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerMemo)?has_content>${(baseCustomer.customerMemo?html)!}<#else>${baseCustomer_customerMemo_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerMemo)?has_content>${(baseCustomer.customerMemo?html)!}<#else>${baseCustomer_customerMemo_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449648100431')}" >${getText('MESBasic.propertydisplayName.randon1449648100431')}</label>
				</td>
				
						<#assign baseCustomer_customerWeb_defaultValue  = ''>
							 							<#assign baseCustomer_customerWeb_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerWeb" id="baseCustomer_customerWeb"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerWeb)?has_content>${(baseCustomer.customerWeb?html)!}<#else>${baseCustomer_customerWeb_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerWeb)?has_content>${(baseCustomer.customerWeb?html)!}<#else>${baseCustomer_customerWeb_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449641393530')}" >${getText('MESBasic.propertydisplayName.randon1449641393530')}</label>
				</td>
				
						<#assign baseCustomer_customerEmail_defaultValue  = ''>
							 							<#assign baseCustomer_customerEmail_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerEmail" id="baseCustomer_customerEmail"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerEmail)?has_content>${(baseCustomer.customerEmail?html)!}<#else>${baseCustomer_customerEmail_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerEmail)?has_content>${(baseCustomer.customerEmail?html)!}<#else>${baseCustomer_customerEmail_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646994311')}" >${getText('MESBasic.propertydisplayName.randon1449646994311')}</label>
				</td>
				
						<#assign baseCustomer_customerPhone_defaultValue  = ''>
							 							<#assign baseCustomer_customerPhone_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerPhone" id="baseCustomer_customerPhone"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerPhone)?has_content>${(baseCustomer.customerPhone?html)!}<#else>${baseCustomer_customerPhone_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerPhone)?has_content>${(baseCustomer.customerPhone?html)!}<#else>${baseCustomer_customerPhone_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449641415870')}" >${getText('MESBasic.propertydisplayName.randon1449641415870')}</label>
				</td>
				
						<#assign baseCustomer_customerFax_defaultValue  = ''>
							 							<#assign baseCustomer_customerFax_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerFax" id="baseCustomer_customerFax"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerFax)?has_content>${(baseCustomer.customerFax?html)!}<#else>${baseCustomer_customerFax_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerFax)?has_content>${(baseCustomer.customerFax?html)!}<#else>${baseCustomer_customerFax_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646729289')}" >${getText('MESBasic.propertydisplayName.randon1449646729289')}</label>
				</td>
				
						<#assign baseCustomer_customerMobile_defaultValue  = ''>
							 							<#assign baseCustomer_customerMobile_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerMobile" id="baseCustomer_customerMobile"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerMobile)?has_content>${(baseCustomer.customerMobile?html)!}<#else>${baseCustomer_customerMobile_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerMobile)?has_content>${(baseCustomer.customerMobile?html)!}<#else>${baseCustomer_customerMobile_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449647011453')}" >${getText('MESBasic.propertydisplayName.randon1449647011453')}</label>
				</td>
				
						<#assign baseCustomer_customerPostCode_defaultValue  = ''>
							 							<#assign baseCustomer_customerPostCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerPostCode" id="baseCustomer_customerPostCode"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerPostCode)?has_content>${(baseCustomer.customerPostCode?html)!}<#else>${baseCustomer_customerPostCode_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerPostCode)?has_content>${(baseCustomer.customerPostCode?html)!}<#else>${baseCustomer_customerPostCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449640328893')}" >${getText('MESBasic.propertydisplayName.randon1449640328893')}</label>
				</td>
				
						<#assign baseCustomer_customerAddress_defaultValue  = ''>
							 							<#assign baseCustomer_customerAddress_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerAddress" id="baseCustomer_customerAddress"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerAddress)?has_content>${(baseCustomer.customerAddress?html)!}<#else>${baseCustomer_customerAddress_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerAddress)?has_content>${(baseCustomer.customerAddress?html)!}<#else>${baseCustomer_customerAddress_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449640406435')}" >${getText('MESBasic.propertydisplayName.randon1449640406435')}</label>
				</td>
				
						<#assign baseCustomer_customerBank_defaultValue  = ''>
							 							<#assign baseCustomer_customerBank_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerBank" id="baseCustomer_customerBank"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerBank)?has_content>${(baseCustomer.customerBank?html)!}<#else>${baseCustomer_customerBank_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerBank)?has_content>${(baseCustomer.customerBank?html)!}<#else>${baseCustomer_customerBank_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449640114058')}" >${getText('MESBasic.propertydisplayName.randon1449640114058')}</label>
				</td>
				
						<#assign baseCustomer_customerAccount_defaultValue  = ''>
							 							<#assign baseCustomer_customerAccount_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerAccount" id="baseCustomer_customerAccount"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerAccount)?has_content>${(baseCustomer.customerAccount?html)!}<#else>${baseCustomer_customerAccount_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerAccount)?has_content>${(baseCustomer.customerAccount?html)!}<#else>${baseCustomer_customerAccount_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449647230032')}" >${getText('MESBasic.propertydisplayName.randon1449647230032')}</label>
				</td>
				
						<#assign baseCustomer_customerTradeCode_defaultValue  = ''>
							 							<#assign baseCustomer_customerTradeCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerTradeCode" id="baseCustomer_customerTradeCode"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerTradeCode)?has_content>${(baseCustomer.customerTradeCode?html)!}<#else>${baseCustomer_customerTradeCode_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerTradeCode)?has_content>${(baseCustomer.customerTradeCode?html)!}<#else>${baseCustomer_customerTradeCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449647178065')}" >${getText('MESBasic.propertydisplayName.randon1449647178065')}</label>
				</td>
				
						<#assign baseCustomer_customerTaxCode_defaultValue  = ''>
							 							<#assign baseCustomer_customerTaxCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerTaxCode" id="baseCustomer_customerTaxCode"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerTaxCode)?has_content>${(baseCustomer.customerTaxCode?html)!}<#else>${baseCustomer_customerTaxCode_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerTaxCode)?has_content>${(baseCustomer.customerTaxCode?html)!}<#else>${baseCustomer_customerTaxCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449540299342.Cust1')}" >${getText('MESBasic.propertydisplayName.randon1449540299342.Cust1')}</label>
				</td>
				
						<#assign baseCustomer_customerVendorID_vendorName_defaultValue  = ''>
														<#assign baseCustomer_customerVendorID_vendorName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1449551478701')}" viewType="${viewType!}" deValue="${baseCustomer_customerVendorID_vendorName_defaultValue!}" conditionfunc="MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc('baseCustomer_customerVendorID_vendorName')" view=true  value="${(baseCustomer.customerVendorID.vendorName)!}" displayFieldName="vendorName" name="baseCustomer.customerVendorID.vendorName" id="baseCustomer_customerVendorID_vendorName" type="other" url="/MESBasic/baseVendor/baseVendor/refVendor.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" editCustomCallback=";" refViewCode="MESBasic_1_baseVendor_refVendor" onkeyupfuncname=";_callback_baseCustomer_customerVendorID_vendorName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(baseCustomer.id)?? && (baseCustomer.customerVendorID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseCustomer.customerVendorID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',obj, 'baseCustomer.customerVendorID', '/MESBasic/baseVendor/baseVendor/refVendor.action');
												CUI.commonFills('MESBasic_baseCustomer_baseCustomer_viewCustomer_form', 'baseCustomer.customerVendorID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646771786')}" >${getText('MESBasic.propertydisplayName.randon1449646771786')}</label>
				</td>
				
						<#assign baseCustomer_customerPayCondition_defaultValue  = ''>
							 							<#assign baseCustomer_customerPayCondition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerPayCondition" id="baseCustomer_customerPayCondition"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerPayCondition)?has_content>${(baseCustomer.customerPayCondition?html)!}<#else>${baseCustomer_customerPayCondition_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerPayCondition)?has_content>${(baseCustomer.customerPayCondition?html)!}<#else>${baseCustomer_customerPayCondition_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.part.fzwdy.xm.mainPositionId.department.name.Cust1')}" >${getText('MESBasic.part.fzwdy.xm.mainPositionId.department.name.Cust1')}</label>
				</td>
				
						<#assign baseCustomer_customerDepartID_name_defaultValue  = ''>
														<#assign baseCustomer_customerDepartID_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.department.reference')}" viewType="${viewType!}" deValue="${baseCustomer_customerDepartID_name_defaultValue!}" conditionfunc="MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc('baseCustomer_customerDepartID_name')" view=true  value="${(baseCustomer.customerDepartID.name)!}" displayFieldName="name" name="baseCustomer.customerDepartID.name" id="baseCustomer_customerDepartID_name" type="Department" url="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" clicked=true multiple=false mnewidth=260 formId="MESBasic_baseCustomer_baseCustomer_viewCustomer_form" editCustomCallback=";" refViewCode="sysbase_1.0_department_departmentRefCustom" onkeyupfuncname=";_callback_baseCustomer_customerDepartID_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (baseCustomer_customerDepartID_name_defaultValue)=='currentDepart'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.mainPosition.department.id}'};
											obj = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',obj, 'baseCustomer.customerDepartID', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
											CUI.commonFills('MESBasic_baseCustomer_baseCustomer_viewCustomer_form', 'baseCustomer.customerDepartID',obj,true);
											$('input:hidden[name="baseCustomer.customerDepartID.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(baseCustomer.id)?? && (baseCustomer.customerDepartID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${baseCustomer.customerDepartID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',obj, 'baseCustomer.customerDepartID', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
												CUI.commonFills('MESBasic_baseCustomer_baseCustomer_viewCustomer_form', 'baseCustomer.customerDepartID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449641621667')}" >${getText('MESBasic.propertydisplayName.randon1449641621667')}</label>
				</td>
				
						<#assign baseCustomer_customerInvoiceAddress_defaultValue  = ''>
							 							<#assign baseCustomer_customerInvoiceAddress_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="baseCustomer.customerInvoiceAddress" id="baseCustomer_customerInvoiceAddress"  style=";" originalvalue="<#if !newObj || (baseCustomer.customerInvoiceAddress)?has_content>${(baseCustomer.customerInvoiceAddress?html)!}<#else>${baseCustomer_customerInvoiceAddress_defaultValue!}</#if>" value="<#if !newObj || (baseCustomer.customerInvoiceAddress)?has_content>${(baseCustomer.customerInvoiceAddress?html)!}<#else>${baseCustomer_customerInvoiceAddress_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
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
     	
		<div id="MESBasic_baseCustomer_baseCustomer_viewCustomer_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.baseCustomer.baseCustomer.viewCustomer.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_baseCustomer_viewCustomer,html,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) -->
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
						$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.baseCustomer.baseCustomer.viewCustomer.initCount = 0;
			MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-head").height()-$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_baseCustomer_baseCustomer_viewCustomer_datagrids');
				var padding_bottom=16;
				$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .pd_bottom,#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.baseCustomer.baseCustomer.viewCustomer.initCount <= 2) {
										setTimeout(function(){MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize();}, 200);
										MESBasic.baseCustomer.baseCustomer.viewCustomer.initCount++;
									}/* else {
										MESBasic.baseCustomer.baseCustomer.viewCustomer.initCount = 0;
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
							if(($("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-workflow").length > 0) && ($("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_baseCustomer_baseCustomer_viewCustomer_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.baseCustomer.baseCustomer.viewCustomer.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize();
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
						if(parseInt($("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width"),10)==650){
							$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.baseCustomer.baseCustomer.viewCustomer.resizeLayout();
						//MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width"),10)==800){
							$("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.baseCustomer.baseCustomer.viewCustomer.resizeLayout();
						//MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize();
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
					MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.baseCustomer.baseCustomer.viewCustomer.initSize();});
				/*
				MESBasic.baseCustomer.baseCustomer.viewCustomer.resizeLayout=function(){
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

		MESBasic.baseCustomer.baseCustomer.viewCustomer.validate = function(){
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
		MESBasic.baseCustomer.baseCustomer.viewCustomer.beforeSaveProcess = function(){
			$('input[name="baseCustomer.extraCol"]').remove();
		}
		MESBasic.baseCustomer.baseCustomer.viewCustomer.processDataGrid = function(){
		};
		MESBasic.baseCustomer.baseCustomer.viewCustomer.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.baseCustomer.baseCustomer.viewCustomer.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.baseCustomer.baseCustomer.viewCustomer.beforeSaveProcess();

			//MESBasic.baseCustomer.baseCustomer.viewCustomer.processDataGrid();
			$('#MESBasic_baseCustomer_baseCustomer_viewCustomer_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_baseCustomer_baseCustomer_viewCustomer_form','MESBasic_baseCustomer_baseCustomer_viewCustomer_datagrids')) {      
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
		MESBasic.baseCustomer.baseCustomer.viewCustomer.print = function(){
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
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.saveSetting = function(){
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
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.printSetting = function(){
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
				MESBasic.baseCustomer.baseCustomer.viewCustomer.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.baseCustomer.baseCustomer.viewCustomer.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.baseCustomer.baseCustomer.viewCustomer.settingDialog.show();
			}
		}
		
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer._callBackInfo = function(res){
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.baseCustomer.baseCustomer.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode_IE = viewCode;
			} else {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode_IE = '';
			}
			MESBasic.baseCustomer.baseCustomer.viewCustomer._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.baseCustomer.baseCustomer.viewCustomer.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.baseCustomer.baseCustomer.viewCustomer._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.baseCustomer.baseCustomer.viewCustomer.gridEventObj = gridEventObj;
				callbackName = "MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.baseCustomer.baseCustomer.viewCustomer.getMultiselectCallBackInfo_DG" : "MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackInfo_DG";
				MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix = _prefix.substring(1);
			}
			
			MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid = oGrid;
			MESBasic.baseCustomer.baseCustomer.viewCustomer._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode = '';
				}
			} else {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp = false;
				MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames = '';
				MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode = '';
			}
			if (MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp == true && MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack = customCallBack;
			}
			if(MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFuncN == "function") {
				refparam += MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.baseCustomer.baseCustomer.viewCustomer._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.baseCustomer.baseCustomer.viewCustomer._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.baseCustomer.baseCustomer.viewCustomer._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.baseCustomer.baseCustomer.viewCustomer._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.baseCustomer.baseCustomer.viewCustomer.query_"+obj+")!='undefined'") ? eval('MESBasic.baseCustomer.baseCustomer.viewCustomer.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackGroupInfo = function(obj){
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
			MESBasic.baseCustomer.baseCustomer.viewCustomer._dialog.close();
		}
		MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',obj[0], MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix, MESBasic.baseCustomer.baseCustomer.viewCustomer._sUrl);
			CUI.commonFills('MESBasic_baseCustomer_baseCustomer_viewCustomer_form',MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack);
					MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.viewCustomer._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.baseCustomer.baseCustomer.viewCustomer._customBeforeCallBack) {
				var flag = eval(MESBasic.baseCustomer.baseCustomer.viewCustomer._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.baseCustomer.baseCustomer.viewCustomer.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp_IE == true && MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.baseCustomer.baseCustomer.viewCustomer._sUrl,MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.baseCustomer.baseCustomer.viewCustomer._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp_IE == true && MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack);
					MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.viewCustomer._dialog.close();
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
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.getcallBackInfo_DG = function(obj){
			if(MESBasic.baseCustomer.baseCustomer.viewCustomer._customBeforeCallBack) {
				var flag = eval(MESBasic.baseCustomer.baseCustomer.viewCustomer._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow).next().length==0){
						MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid.addNewRow();
					}	
					MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow = $(MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow).next();
					$(MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow,obj[i], MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix, MESBasic.baseCustomer.baseCustomer.viewCustomer._sUrl);
				if (MESBasic.baseCustomer.baseCustomer.viewCustomer._isObjCustomProp == true && MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow,MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix,obj[i],MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid,MESBasic.baseCustomer.baseCustomer.viewCustomer._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow,MESBasic.baseCustomer.baseCustomer.viewCustomer._prefix,obj[i],MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.baseCustomer.baseCustomer.viewCustomer._refViewCode + '&id=' + id,
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
									name = MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow, objs, MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack);
					MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.viewCustomer._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.baseCustomer.baseCustomer.viewCustomer._oGrid, MESBasic.baseCustomer.baseCustomer.viewCustomer._currRow, MESBasic.baseCustomer.baseCustomer.viewCustomer._key, MESBasic.baseCustomer.baseCustomer.viewCustomer._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack) {
					eval(MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack);
					MESBasic.baseCustomer.baseCustomer.viewCustomer._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.baseCustomer.baseCustomer.viewCustomer._dialog.close();
			} catch(e){}
		};
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.baseCustomer.baseCustomer.viewCustomer.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_baseCustomer_baseCustomer_viewCustomer_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.baseCustomer.baseCustomer.viewCustomer.onloadForProduct();
		});

		MESBasic.baseCustomer.baseCustomer.viewCustomer.beforeSubmitMethodSettingInPage = function(){
			MESBasic.baseCustomer.baseCustomer.viewCustomer.onsaveForProduct();
		};
		MESBasic.baseCustomer.baseCustomer.viewCustomer.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.baseCustomer.baseCustomer.viewCustomer.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.baseCustomer.baseCustomer.viewCustomer.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").hide();
				},100);
				//CUI("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.baseCustomer.baseCustomer.viewCustomer.showThis = function(){
			if(!CUI("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").is(':visible')) {
				CUI("#MESBasic_baseCustomer_baseCustomer_viewCustomer_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.baseCustomer.baseCustomer.viewCustomer.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_baseCustomer_baseCustomer_viewCustomer_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_baseCustomer_BaseCustomer&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.baseCustomer.baseCustomer.viewCustomer.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.showInfoDialog=function(mode){
			
			MESBasic.baseCustomer.baseCustomer.viewCustomer.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_baseCustomer_baseCustomer_viewCustomer_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.baseCustomer.baseCustomer.viewCustomer.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.baseCustomer.baseCustomer.viewCustomer.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_baseCustomer");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_baseCustomer");
			</#if>
			}
		}
		
		MESBasic.baseCustomer.baseCustomer.viewCustomer.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/baseCustomer/baseCustomer/dealInfo-list.action&dlTableInfoId=${(baseCustomer.tableInfoId)?default('')}");
			}
		}
		MESBasic.baseCustomer.baseCustomer.viewCustomer.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_baseCustomer_BaseCustomer&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(baseCustomer.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_baseCustomer_BaseCustomer&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(baseCustomer.tableInfoId)?default('')}");
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
		MESBasic.baseCustomer.baseCustomer.viewCustomer.supervision=function(){
			MESBasic.baseCustomer.baseCustomer.viewCustomer.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(baseCustomer.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.baseCustomer.baseCustomer.viewCustomer.modifyOwnerStaffDialog.show();
		}
		

		/* CUSTOM CODE START(view-VIEW-MESBasic_1_baseCustomer_viewCustomer,js,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		MESBasic.baseCustomer.baseCustomer.viewCustomer.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_baseCustomer_viewCustomer,onloadForProduct,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.baseCustomer.baseCustomer.viewCustomer.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_baseCustomer_viewCustomer,onsaveForProduct,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.baseCustomer.baseCustomer.viewCustomer.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.baseCustomer.baseCustomer.viewCustomer.showBusinessList('${l.relatingModel.code.replace('.','')}',${(baseCustomer.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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