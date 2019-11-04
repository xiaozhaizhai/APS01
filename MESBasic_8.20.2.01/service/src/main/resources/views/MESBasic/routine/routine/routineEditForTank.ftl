<!-- MESBasic_1/routine/routineEditForTank -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_routine_routine">
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
<#-- 实体对象 -->
<#assign tableObj = routine>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.routine.routine.routineEditForTank">
<#-- 模型名称-->
<#assign modelName = "routine">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_routine_routineEditForTank">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_routine">
<#-- 视图名称-->
<#assign viewName = "routineEditForTank">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_routine_routine_routineEditForTank_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "Routine">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "MESBasic_routine_routine_routineEditForTank_form">
<#-- 待办状态 -->
<#assign pendingstatus =( routine.pending.taskDescription)!>
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
        <#assign configTitle = getText('MESBasic.viewtitle.randon1460685209814')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_routine_routine_routineEditForTank_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.routine.routine.routineEditForTank');
			MESBasic.routine.routine.routineEditForTank.currentUser = ${userJson};
			MESBasic.routine.routine.routineEditForTank.currentStaff = ${staffJson};
			MESBasic.routine.routine.routineEditForTank.currentDepartment = ${deptJson};
			MESBasic.routine.routine.routineEditForTank.currentPosition = ${postJson};
			MESBasic.routine.routine.routineEditForTank.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_routine_routineEditForTank,head,MESBasic_1_routine_Routine,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="routine.srcContainer.id,routine.desContainer.id,routine.id," onsubmitMethod="MESBasic.routine.routine.routineEditForTank.beforeSubmitMethod()" id="MESBasic_routine_routine_routineEditForTank_form" namespace="/MESBasic/routine/routine/routineEditForTank" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_routine_Routine&_bapFieldPermissonModelName_=Routine" editPageNs="MESBasic.routine.routine.routineEditForTank" callback="MESBasic.routine.routine.routineEditForTank._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_routine_routine_routineEditForTank_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_routine_routine_routineEditForTank">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="routine.srcContainer.id" value="${(routine.srcContainer.id)!""}" originalvalue="${(routine.srcContainer.id)!""}"/>
					<input type="hidden" name="routine.desContainer.id" value="${(routine.desContainer.id)!""}" originalvalue="${(routine.desContainer.id)!""}"/>
					<input type="hidden" name="routine.id" value="${(routine.id)!""}" originalvalue="${(routine.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "MESBasic_routine_routine_routineEditForTank_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_routine', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
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
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415336575756')}" >${getText('MESBasic.propertydisplayName.radion1415336575756')}</label>
				</td>
				
						<#assign routine_code_defaultValue  = ''>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="routine.code" id="routine_code"  style=";" originalvalue="<#if !newObj || (routine.code)?has_content>${(routine.code?html)!}<#else>${routine_code_defaultValue!}</#if>" value="<#if !newObj || (routine.code)?has_content>${(routine.code?html)!}<#else>${routine_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415336597801')}" >${getText('MESBasic.propertydisplayName.radion1415336597801')}</label>
				</td>
				
						<#assign routine_name_defaultValue  = ''>
							 							<#assign routine_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="routine.name" id="routine_name"  style=";" originalvalue="<#if !newObj || (routine.name)?has_content>${(routine.name?html)!}<#else>${routine_name_defaultValue!}</#if>" value="<#if !newObj || (routine.name)?has_content>${(routine.name?html)!}<#else>${routine_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415337689809')}" >${getText('MESBasic.propertydisplayName.radion1415337689809')}</label>
				</td>
				
						<#assign routine_routineStrategy_defaultValue  = 'ROUTINE_STRATEGY/0'>
							 							<#assign routine_routineStrategy_defaultValue  = 'ROUTINE_STRATEGY/0'>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${routine_routineStrategy_defaultValue!}" formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.routineStrategy.id" code="ROUTINE_STRATEGY" value="${(routine.routineStrategy.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.routineStrategy.id" code="ROUTINE_STRATEGY" value="${(routine.routineStrategy.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415337186132')}" >${getText('MESBasic.propertydisplayName.radion1415337186132')}</label>
				</td>
				
						<#assign routine_businessType_defaultValue  = ''>
							 							<#assign routine_businessType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${routine_businessType_defaultValue!}" formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.businessType.id" code="ROUTINE_BUSINESS" value="${(routine.businessType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.businessType.id" code="ROUTINE_BUSINESS" value="${(routine.businessType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415337129694')}" >${getText('MESBasic.propertydisplayName.radion1415337129694')}</label>
				</td>
				
						<#assign routine_sourceType_defaultValue  = 'ROUTINE_TERMINAL_TYPE/1'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${routine_sourceType_defaultValue!}" formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.sourceType.id" code="ROUTINE_TERMINAL_TYPE" value="${(routine.sourceType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.sourceType.id" code="ROUTINE_TERMINAL_TYPE" value="${(routine.sourceType.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415337161653')}" >${getText('MESBasic.propertydisplayName.radion1415337161653')}</label>
				</td>
				
						<#assign routine_srcContainer_name_defaultValue  = ''>
														<#assign routine_srcContainer_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.radion1415323292765')}" viewType="${viewType!}" deValue="${routine_srcContainer_name_defaultValue!}" conditionfunc="MESBasic.routine.routine.routineEditForTank._querycustomFunc('routine_srcContainer_name')"  value="${(routine.srcContainer.name)!}" displayFieldName="name" name="routine.srcContainer.name" id="routine_srcContainer_name" type="other" url="/MESBasic/container/container/containerRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_routine_routine_routineEditForTank_form" editCustomCallback="srcCallback(obj);" refViewCode="MESBasic_1_container_containerRef"  onkeyupfuncname="srcCallback(obj);_callback_routine_srcContainer_name(obj);" cssStyle="" isEdit=true onAfterClear='srcAfterClear()'  isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(routine.id)?? && (routine.srcContainer.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${routine.srcContainer.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_routine_routine_routineEditForTank_form',obj, 'routine.srcContainer', '/MESBasic/container/container/containerRef.action');
												CUI.commonFills('MESBasic_routine_routine_routineEditForTank_form', 'routine.srcContainer',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415337256452')}" >${getText('MESBasic.propertydisplayName.radion1415337256452')}</label>
				</td>
				
						<#assign routine_routineStatus_defaultValue  = ''>
							 							<#assign routine_routineStatus_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${routine_routineStatus_defaultValue!}" formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="routine.routineStatus.id" code="ROUTINE_STATUS" value="${(routine.routineStatus.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="routine.routineStatus.id" code="ROUTINE_STATUS" value="${(routine.routineStatus.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415337160653')}" >${getText('MESBasic.propertydisplayName.radion1415337160653')}</label>
				</td>
				
						<#assign routine_desType_defaultValue  = 'ROUTINE_TERMINAL_TYPE/1'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${routine_desType_defaultValue!}" formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.desType.id" code="ROUTINE_TERMINAL_TYPE" value="${(routine.desType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.desType.id" code="ROUTINE_TERMINAL_TYPE" value="${(routine.desType.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1115337161653')}" >${getText('MESBasic.propertydisplayName.radion1115337161653')}</label>
				</td>
				
						<#assign routine_desContainer_name_defaultValue  = ''>
														<#assign routine_desContainer_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.radion1415323292765')}" viewType="${viewType!}" deValue="${routine_desContainer_name_defaultValue!}" conditionfunc="MESBasic.routine.routine.routineEditForTank._querycustomFunc('routine_desContainer_name')"  value="${(routine.desContainer.name)!}" displayFieldName="name" name="routine.desContainer.name" id="routine_desContainer_name" type="other" url="/MESBasic/container/container/containerRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_routine_routine_routineEditForTank_form" editCustomCallback="destCallback(obj);" refViewCode="MESBasic_1_container_containerRef"  onkeyupfuncname="destCallback(obj);_callback_routine_desContainer_name(obj);" cssStyle="" isEdit=true onAfterClear='destAfterClear()'  isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(routine.id)?? && (routine.desContainer.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${routine.desContainer.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_routine_routine_routineEditForTank_form',obj, 'routine.desContainer', '/MESBasic/container/container/containerRef.action');
												CUI.commonFills('MESBasic_routine_routine_routineEditForTank_form', 'routine.desContainer',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1423898703640')}" >${getText('MESBasic.propertydisplayName.randon1423898703640')}</label>
				</td>
				
						<#assign routine_rootineUse_defaultValue  = ''>
							 							<#assign routine_rootineUse_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${routine_rootineUse_defaultValue!}" formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.rootineUse.id" code="rootStatus" value="${(routine.rootineUse.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.rootineUse.id" code="rootStatus" value="${(routine.rootineUse.id)!}"  />
									
								</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
				<td class="edit-table-symbol">&nbsp;</td>
				
						<#assign routine_rootType_defaultValue  = 'rootType/001'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="RADIO" onchange=""  viewType="${viewType!}" deValue="${routine_rootType_defaultValue!}" formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.rootType.id" code="rootType" value="${(routine.rootType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="RADIO" onchange=""  viewType="${viewType!}"  formId="MESBasic_routine_routine_routineEditForTank_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="routine.rootType.id" code="rootType" value="${(routine.rootType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1552632147558')}" >${getText('MESBasic.propertydisplayName.randon1552632147558')}</label>
				</td>
				
						<#assign routine_srcCode_defaultValue  = ''>
							 							<#assign routine_srcCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="routine.srcCode" id="routine_srcCode"  style=";" originalvalue="<#if !newObj || (routine.srcCode)?has_content>${(routine.srcCode?html)!}<#else>${routine_srcCode_defaultValue!}</#if>" value="<#if !newObj || (routine.srcCode)?has_content>${(routine.srcCode?html)!}<#else>${routine_srcCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1552632164567')}" >${getText('MESBasic.propertydisplayName.randon1552632164567')}</label>
				</td>
				
						<#assign routine_desCode_defaultValue  = ''>
							 							<#assign routine_desCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="routine.desCode" id="routine_desCode"  style=";" originalvalue="<#if !newObj || (routine.desCode)?has_content>${(routine.desCode?html)!}<#else>${routine_desCode_defaultValue!}</#if>" value="<#if !newObj || (routine.desCode)?has_content>${(routine.desCode?html)!}<#else>${routine_desCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
					
				
					<#if  refId?? && (refId > 0)>
						<#assign nodeExpanded = true>
					<#else>
						<#assign nodeExpanded = false>
					</#if>
					
				<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign exportExcel=false>
				<#else>
				<#assign exportExcel=false>
				</#if>
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
								
								
								
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/routine/routine/data-dg1460684019272.action?routine.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019272">
			<#else>
				<#assign dUrl="/MESBasic/routine/routine/data-dg1460684019272.action?routine.id=${(routine.id)!-1}&datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019272">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1552357708009')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775167157')}\",handler:function(event){DT_Config_dg1460684019272_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775167089')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowUp\")}\",handler:function(){this.moveRow(\"up\");},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowDown\")}\",handler:function(){this.moveRow(\"down\");},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1552357708009')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775167157')}\",handler:function(event){DT_Config_dg1460684019272_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775167089')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowUp\")}\",handler:function(){this.moveRow(\"up\");},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowDown\")}\",handler:function(){this.moveRow(\"down\");},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_Config_dg1460684019272" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1460684019272_id" value="Config_dg1460684019272" />
			
			<input type="hidden" id="dg1460684019272_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.radion1415337833221')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/routine/routine/data-dg1460684019272.action?operateType=export&datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019272"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="Config_dg1460684019272" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="Config_dg1460684019272" viewType="${viewType}" renderOverEvent="dg1460684019272RenderOverEvent" route="${routeFlag}" formId="MESBasic_routine_routine_routineEditForTank_form" noPermissionKeys="name,measurement,formula,meter.code,meter.itemName,meter.tagType,meter.itemNumber,meter.itemClass,maxAggValue,forSource,forDestination,isDefault,tankCode" modelCode="MESBasic_1_routine_Config" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1460684019272" dtPage="dgPage"  hidekeyPrefix="dg1460684019272" hidekey="['id','version','sort','meter.id','meter.code','meter.id','meter.itemName','meter.id','meter.tagType.id','meter.id','meter.itemNumber','meter.id','meter.itemClass.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1460684019272PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('MESBasic.dataGriddataGridName.radion1422595622982')}" activexButton="MESBasic.buttonPropertyshowName.radion1552357708009,ADDROW,add;MESBasic.buttonPropertyshowName.radion1551775167157,DELETEROW,del;MESBasic.buttonPropertyshowName.radion1551775167089,INSERTROW,insert" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=true     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1416558524615')}" width=100 showFormatFunc=""  />
							<#assign measurement_displayDefaultType=''>
								<#assign measurement_defaultValue='measurement/001'>
										 
									<@systemCodeColumn code="measurement" textalign="left" defaultValue="${(measurement_defaultValue!)?string}" key="measurement.id" editable=true type="selectcomp" notnull=true    onchange="Config_dg1460684019272Widget.evalCustomFunction(nRow,sFieldName,'onchangemesu()')"  label="${getText('MESBasic.propertydisplayName.randon1429853864414')}" width=100 hiddenCol=true  />
							<#assign formula_displayDefaultType=''>
								<#assign formula_defaultValue=''>
										<#assign formula_defaultValue=''>
										  
									<@datacolumn key="formula"  popView=true      showFormat="TEXT" defaultValue="${(formula_defaultValue!)?string}" defaultDisplay="${(formula_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1426644791679')}" width=150 showFormatFunc=""  />
							<#assign meter_code_displayDefaultType=''>
								<#assign meter_code_defaultValue=''>
										<#assign meter_code_defaultValue=''>
																	<#if (meter_code_defaultValue!)?string=="currentUser">
								<#assign meter_code_defaultValue='${staffJson!}'>
							<#elseif (meter_code_defaultValue!)?string=="currentPost">
								<#assign meter_code_defaultValue='${postJson!}'>
							<#elseif (meter_code_defaultValue!)?string=="currentDepart">
								<#assign meter_code_defaultValue='${deptJson!}'>
							<#elseif (meter_code_defaultValue!)?string=="currentComp">
								<#assign meter_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="meter.code"        showFormat="SELECTCOMP" defaultValue="${(meter_code_defaultValue!)?string}" defaultDisplay="${(meter_code_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="MESBasic.routine.routine.routineEditForTank"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemSelfRef.action" viewCode="MESBasic_1_itemManage_itemSelfRef" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1552281936084')}"  label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" width=120 showFormatFunc=""  />
							<#assign meter_itemName_displayDefaultType=''>
								<#assign meter_itemName_defaultValue=''>
										<#assign meter_itemName_defaultValue=''>
																	<#if (meter_itemName_defaultValue!)?string=="currentUser">
								<#assign meter_itemName_defaultValue='${staffJson!}'>
							<#elseif (meter_itemName_defaultValue!)?string=="currentPost">
								<#assign meter_itemName_defaultValue='${postJson!}'>
							<#elseif (meter_itemName_defaultValue!)?string=="currentDepart">
								<#assign meter_itemName_defaultValue='${deptJson!}'>
							<#elseif (meter_itemName_defaultValue!)?string=="currentComp">
								<#assign meter_itemName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="meter.itemName"        showFormat="TEXT" defaultValue="${(meter_itemName_defaultValue!)?string}" defaultDisplay="${(meter_itemName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.routine.routine.routineEditForTank"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemSelfRef.action" viewCode="MESBasic_1_itemManage_itemSelfRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1552281936084')}"  label="${getText('MESBasic.propertydisplayName.radion1425338029833')}" width=120 showFormatFunc=""  />
							<#assign meter_tagType_displayDefaultType=''>
								<#assign meter_tagType_defaultValue=''>
										<#assign meter_tagType_defaultValue=''>
																	<#if (meter_tagType_defaultValue!)?string=="currentUser">
								<#assign meter_tagType_defaultValue='${staffJson!}'>
							<#elseif (meter_tagType_defaultValue!)?string=="currentPost">
								<#assign meter_tagType_defaultValue='${postJson!}'>
							<#elseif (meter_tagType_defaultValue!)?string=="currentDepart">
								<#assign meter_tagType_defaultValue='${deptJson!}'>
							<#elseif (meter_tagType_defaultValue!)?string=="currentComp">
								<#assign meter_tagType_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="TAG_TYPE" textalign="center" defaultValue="${(meter_tagType_defaultValue!)?string}" key="meter.tagType.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.radion141526099765811')}" width=100   />
							<#assign meter_itemNumber_displayDefaultType=''>
								<#assign meter_itemNumber_defaultValue=''>
										<#assign meter_itemNumber_defaultValue=''>
																	<#if (meter_itemNumber_defaultValue!)?string=="currentUser">
								<#assign meter_itemNumber_defaultValue='${staffJson!}'>
							<#elseif (meter_itemNumber_defaultValue!)?string=="currentPost">
								<#assign meter_itemNumber_defaultValue='${postJson!}'>
							<#elseif (meter_itemNumber_defaultValue!)?string=="currentDepart">
								<#assign meter_itemNumber_defaultValue='${deptJson!}'>
							<#elseif (meter_itemNumber_defaultValue!)?string=="currentComp">
								<#assign meter_itemNumber_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="meter.itemNumber"        showFormat="TEXT" defaultValue="${(meter_itemNumber_defaultValue!)?string}" defaultDisplay="${(meter_itemNumber_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.routine.routine.routineEditForTank"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/aggregateOnlyRef.action" viewCode="MESBasic_1_itemManage_aggregateOnlyRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1417920362885')}"  label="${getText('MESBasic.propertydisplayName.radion1415258842136')}" width=120 showFormatFunc=""  />
							<#assign meter_itemClass_displayDefaultType=''>
								<#assign meter_itemClass_defaultValue=''>
										<#assign meter_itemClass_defaultValue=''>
																	<#if (meter_itemClass_defaultValue!)?string=="currentUser">
								<#assign meter_itemClass_defaultValue='${staffJson!}'>
							<#elseif (meter_itemClass_defaultValue!)?string=="currentPost">
								<#assign meter_itemClass_defaultValue='${postJson!}'>
							<#elseif (meter_itemClass_defaultValue!)?string=="currentDepart">
								<#assign meter_itemClass_defaultValue='${deptJson!}'>
							<#elseif (meter_itemClass_defaultValue!)?string=="currentComp">
								<#assign meter_itemClass_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="ITEM_PROPERTY" textalign="center" defaultValue="${(meter_itemClass_defaultValue!)?string}" key="meter.itemClass.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.radion1416380194525')}" width=100  isTree=true systemEntityCode="ITEM_PROPERTY" systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=ITEM_PROPERTY" />
							<#assign maxAggValue_displayDefaultType=''>
								<#assign maxAggValue_defaultValue=''>
										<#assign maxAggValue_defaultValue=''>
										  
									<@datacolumn key="maxAggValue"        showFormat="TEXT" defaultValue="${(maxAggValue_defaultValue!)?string}" defaultDisplay="${(maxAggValue_displayDefaultType!)?string}" decimal="4" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1415338029833')}" width=100 showFormatFunc=""  />
							<#assign forSource_displayDefaultType=''>
								<#assign forSource_defaultValue='true'>
										<#assign forSource_defaultValue='true'>
										  
									<@datacolumn key="forSource"        showFormat="CHECKBOX" defaultValue="${(forSource_defaultValue!)?string}" defaultDisplay="${(forSource_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1416558162801')}" width=80 showFormatFunc=""  />
							<#assign forDestination_displayDefaultType=''>
								<#assign forDestination_defaultValue=''>
										<#assign forDestination_defaultValue=''>
										  
									<@datacolumn key="forDestination"        showFormat="CHECKBOX" defaultValue="${(forDestination_defaultValue!)?string}" defaultDisplay="${(forDestination_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1416558185409')}" width=80 showFormatFunc=""  />
							<#assign isDefault_displayDefaultType=''>
								<#assign isDefault_defaultValue='true'>
										<#assign isDefault_defaultValue='true'>
										  
									<@datacolumn key="isDefault"        showFormat="CHECKBOX" defaultValue="${(isDefault_defaultValue!)?string}" defaultDisplay="${(isDefault_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1416558214312')}" width=80 showFormatFunc=""  />
							<#assign tankCode_displayDefaultType=''>
								<#assign tankCode_defaultValue=''>
										<#assign tankCode_defaultValue=''>
										  
									<@datacolumn key="tankCode"        showFormat="TEXT" defaultValue="${(tankCode_defaultValue!)?string}" defaultDisplay="${(tankCode_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1552632198485')}" width=100 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function Config_dg1460684019272_check_datagridvalid(){
					//
					var errorObj =Config_dg1460684019272Widget._DT.testData();
					var errorContent='';
					if(errorObj!=null){
					  for(var i=0;i<errorObj.length;i++){
						var obj1=errorObj[i];
						if(obj1.errorType=='date'){
						  errorContent+=obj1.label+'必须为日期类型！';
						  break;
						}else if(obj1.errorType=='integer'){
						  errorContent+=obj1.label+'必须为数字类型！';
						  break;
						}else if(obj1.errorType=='decimal'){
						  errorContent+=obj1.label+'必须为整数类型！';
						  break;
						}else if(obj1.errorType=='notnull'){
						   errorContent+=obj1.label+'不能为空';
						   break;
						}else if(obj1.errorType=='toolong'){
						   errorContent+=obj1.label+'字段长度不能超过'+obj1.length+'字节(注：英文字母占1个字节，中文字占3个字节)！';
						   break;
						}
					  }
					  if(errorContent!=""){
						hasErr = true;
					  }
					  if(hasErr){
						EditDialogErrorBarWidget.show(errorContent);
						return false;
					  }
					}
					return true;
				}
				
				function savedg1460684019272DataGrid(){
					<#if  refId?? && (refId gt 0)>
					Config_dg1460684019272Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('Config_dg1460684019272Widget') > -1) {
						Config_dg1460684019272Widget.setAllRowEdited();
					}
					var json = Config_dg1460684019272Widget.parseEditedData();
					$('input[name="dg1460684019272ListJson"]').remove();
					$('input[name="dgLists[\'dg1460684019272\']"]').remove();
					$('input[name="dg1460684019272ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1460684019272\']">').val(json).appendTo($('#MESBasic_routine_routine_routineEditForTank_form'));
					$('<input type="hidden" name="dg1460684019272ModelCode">').val('MESBasic_1_routine_Config').appendTo($('#MESBasic_routine_routine_routineEditForTank_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1460684019272ListJson">').val(json).appendTo($('#MESBasic_routine_routine_routineEditForTank_form'));
				}
				function DT_Config_dg1460684019272_deldatagrid(){
					var deleteRows = Config_dg1460684019272Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','routine.id','switcher.id','pump.id','meter.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460684019272DeletedIds").length>0){
							$("#dg1460684019272DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460684019272DeletedIds" name="dgDeletedIds[\'dg1460684019272\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460684019272DeletedIds['+CUI('input[name^="dg1460684019272DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
					});
					return deleteRows;
				}
				function DT_Config_dg1460684019272_delTreeNodes(){
					var deleteRows = Config_dg1460684019272Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','routine.id','switcher.id','pump.id','meter.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460684019272DeletedIds").length>0){
							$("#dg1460684019272DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460684019272DeletedIds" name="dgDeletedIds[\'dg1460684019272\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460684019272DeletedIds['+CUI('input[name^="dg1460684019272DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_routine_routine_routineEditForTank_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<1;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'Config_dg1460684019272') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'Config_dg1460684019272';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'Config_dg1460684019272';
					}
					$('body').data('MESBasic_routine_routine_routineEditForTank_datagrids', datagrids);
				});
				
				var Config_dg1460684019272_importDialog = null;
				function Config_dg1460684019272_showImportDialog(){
					try{
						if(Config_dg1460684019272_importDialog!=null&&Config_dg1460684019272_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/routine/routine/initImport.action?datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019272&tid=${id!}&datagridName=dg1460684019272";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_routine_routineEditForTankdg1460684019272_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						Config_dg1460684019272_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("Config_dg1460684019272"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();Config_dg1460684019272_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();Config_dg1460684019272_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						Config_dg1460684019272_importDialog.show();
					}catch(e){}
				}	
				
				function Config_dg1460684019272_downLoadFile(){
					var url = "/MESBasic/routine/routine/downLoad.action?datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019272&templateRelatedModelCode=MESBasic_1_routine_routineEditForTankdg1460684019272&downloadType=template&fileName=dg1460684019272";
					window.open(url,"","");
				}
				function dg1460684019272RenderOverEvent(){
					Config_dg1460684019272Widget._DT.configs.checkEditCondition= function( key, nRow){
	var value=Config_dg1460684019272Widget.getCellValue( nRow,"stype.id" );
	if((value== 'MES_SWITHER/0' ||  value=='MES_SWITHER/2' ) && (key=='forword' || key=='backword'  )) {
		return false;
	}

	return true;
}
				}
				function dg1460684019272PageInitMethod(nTabIndex){
					MESBasic.routine.routine.routineEditForTank.initSize(nTabIndex);
				}
			</script>
			
			

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
					
				
					<#if  refId?? && (refId > 0)>
						<#assign nodeExpanded = true>
					<#else>
						<#assign nodeExpanded = false>
					</#if>
					
				<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign exportExcel=false>
				<#else>
				<#assign exportExcel=false>
				</#if>
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
								
								
								
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/routine/routine/data-dg1460684019181.action?routine.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019181">
			<#else>
				<#assign dUrl="/MESBasic/routine/routine/data-dg1460684019181.action?routine.id=${(routine.id)!-1}&datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019181">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1552357733128')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775668147')}\",handler:function(event){DT_SwitcherModel_dg1460684019181_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775668098')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowUp\")}\",handler:function(){this.moveRow(\"up\");},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowDown\")}\",handler:function(){this.moveRow(\"down\");},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1552357733128')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775668147')}\",handler:function(event){DT_SwitcherModel_dg1460684019181_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551775668098')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowUp\")}\",handler:function(){this.moveRow(\"up\");},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText(\"ec.view.button.moveRowDown\")}\",handler:function(){this.moveRow(\"down\");},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_SwitcherModel_dg1460684019181" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1460684019181_id" value="SwitcherModel_dg1460684019181" />
			
			<input type="hidden" id="dg1460684019181_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.radion1416557727476')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/routine/routine/data-dg1460684019181.action?operateType=export&datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019181"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="SwitcherModel_dg1460684019181" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="SwitcherModel_dg1460684019181" viewType="${viewType}" renderOverEvent="dg1460684019181RenderOverEvent" route="${routeFlag}" formId="MESBasic_routine_routine_routineEditForTank_form" noPermissionKeys="stype,switcher.code,switcher.itemName,switcher.tagType,switcher.itemNumber,switcher.itemClass,forword,backword" modelCode="MESBasic_1_routine_SwitcherModel" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1460684019181" dtPage="dgPage"  hidekeyPrefix="dg1460684019181" hidekey="['id','version','sort','switcher.id','switcher.code','switcher.id','switcher.itemName','switcher.id','switcher.tagType.id','switcher.id','switcher.itemNumber','switcher.id','switcher.itemClass.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1460684019181PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('MESBasic.dataGriddataGridName.radion1422595643989')}" activexButton="MESBasic.buttonPropertyshowName.radion1552357733128,ADDROW,add;MESBasic.buttonPropertyshowName.radion1551775668147,DELETEROW,del;MESBasic.buttonPropertyshowName.radion1551775668098,INSERTROW,insert" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign stype_displayDefaultType=''>
								<#assign stype_defaultValue=''>
										<#assign stype_defaultValue=''>
										 									<@systemCodeColumn code="MES_SWITHER" textalign="left" defaultValue="${(stype_defaultValue!)?string}" key="stype.id" editable=true type="selectcomp" notnull=true     label="${getText('MESBasic.propertydisplayName.radion1416558430815')}" width=100   />
							<#assign switcher_code_displayDefaultType=''>
								<#assign switcher_code_defaultValue=''>
										<#assign switcher_code_defaultValue=''>
																	<#if (switcher_code_defaultValue!)?string=="currentUser">
								<#assign switcher_code_defaultValue='${staffJson!}'>
							<#elseif (switcher_code_defaultValue!)?string=="currentPost">
								<#assign switcher_code_defaultValue='${postJson!}'>
							<#elseif (switcher_code_defaultValue!)?string=="currentDepart">
								<#assign switcher_code_defaultValue='${deptJson!}'>
							<#elseif (switcher_code_defaultValue!)?string=="currentComp">
								<#assign switcher_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="switcher.code"        showFormat="SELECTCOMP" defaultValue="${(switcher_code_defaultValue!)?string}" defaultDisplay="${(switcher_code_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="MESBasic.routine.routine.routineEditForTank"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/switcherOnlyRef.action" viewCode="MESBasic_1_itemManage_switcherOnlyRef" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1417920493220')}"  label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" width=100 showFormatFunc=""  />
							<#assign switcher_itemName_displayDefaultType=''>
								<#assign switcher_itemName_defaultValue=''>
										<#assign switcher_itemName_defaultValue=''>
																	<#if (switcher_itemName_defaultValue!)?string=="currentUser">
								<#assign switcher_itemName_defaultValue='${staffJson!}'>
							<#elseif (switcher_itemName_defaultValue!)?string=="currentPost">
								<#assign switcher_itemName_defaultValue='${postJson!}'>
							<#elseif (switcher_itemName_defaultValue!)?string=="currentDepart">
								<#assign switcher_itemName_defaultValue='${deptJson!}'>
							<#elseif (switcher_itemName_defaultValue!)?string=="currentComp">
								<#assign switcher_itemName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="switcher.itemName"        showFormat="TEXT" defaultValue="${(switcher_itemName_defaultValue!)?string}" defaultDisplay="${(switcher_itemName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.routine.routine.routineEditForTank"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRef.action" viewCode="MESBasic_1_itemManage_itemRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1415323143732')}"  label="${getText('MESBasic.propertydisplayName.radion141525881379311')}" width=100 showFormatFunc=""  />
							<#assign switcher_tagType_displayDefaultType=''>
								<#assign switcher_tagType_defaultValue=''>
										<#assign switcher_tagType_defaultValue=''>
																	<#if (switcher_tagType_defaultValue!)?string=="currentUser">
								<#assign switcher_tagType_defaultValue='${staffJson!}'>
							<#elseif (switcher_tagType_defaultValue!)?string=="currentPost">
								<#assign switcher_tagType_defaultValue='${postJson!}'>
							<#elseif (switcher_tagType_defaultValue!)?string=="currentDepart">
								<#assign switcher_tagType_defaultValue='${deptJson!}'>
							<#elseif (switcher_tagType_defaultValue!)?string=="currentComp">
								<#assign switcher_tagType_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="TAG_TYPE" textalign="center" defaultValue="${(switcher_tagType_defaultValue!)?string}" key="switcher.tagType.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.radion141526099765811')}" width=100   />
							<#assign switcher_itemNumber_displayDefaultType=''>
								<#assign switcher_itemNumber_defaultValue=''>
										<#assign switcher_itemNumber_defaultValue=''>
																	<#if (switcher_itemNumber_defaultValue!)?string=="currentUser">
								<#assign switcher_itemNumber_defaultValue='${staffJson!}'>
							<#elseif (switcher_itemNumber_defaultValue!)?string=="currentPost">
								<#assign switcher_itemNumber_defaultValue='${postJson!}'>
							<#elseif (switcher_itemNumber_defaultValue!)?string=="currentDepart">
								<#assign switcher_itemNumber_defaultValue='${deptJson!}'>
							<#elseif (switcher_itemNumber_defaultValue!)?string=="currentComp">
								<#assign switcher_itemNumber_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="switcher.itemNumber"        showFormat="TEXT" defaultValue="${(switcher_itemNumber_defaultValue!)?string}" defaultDisplay="${(switcher_itemNumber_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.routine.routine.routineEditForTank"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRef.action" viewCode="MESBasic_1_itemManage_itemRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1415323143732')}"  label="${getText('MESBasic.propertydisplayName.radion1415258842136')}" width=100 showFormatFunc=""  />
							<#assign switcher_itemClass_displayDefaultType=''>
								<#assign switcher_itemClass_defaultValue=''>
										<#assign switcher_itemClass_defaultValue=''>
																	<#if (switcher_itemClass_defaultValue!)?string=="currentUser">
								<#assign switcher_itemClass_defaultValue='${staffJson!}'>
							<#elseif (switcher_itemClass_defaultValue!)?string=="currentPost">
								<#assign switcher_itemClass_defaultValue='${postJson!}'>
							<#elseif (switcher_itemClass_defaultValue!)?string=="currentDepart">
								<#assign switcher_itemClass_defaultValue='${deptJson!}'>
							<#elseif (switcher_itemClass_defaultValue!)?string=="currentComp">
								<#assign switcher_itemClass_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="ITEM_PROPERTY" textalign="center" defaultValue="${(switcher_itemClass_defaultValue!)?string}" key="switcher.itemClass.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.radion1416380194525')}" width=100  isTree=true systemEntityCode="ITEM_PROPERTY" systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=ITEM_PROPERTY" />
							<#assign forword_displayDefaultType=''>
								<#assign forword_defaultValue='false'>
										  
									<@datacolumn key="forword"        showFormat="CHECKBOX" defaultValue="${(forword_defaultValue!)?string}" defaultDisplay="${(forword_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1416557806300')}" width=100 showFormatFunc=""  />
							<#assign backword_displayDefaultType=''>
								<#assign backword_defaultValue='false'>
										  
									<@datacolumn key="backword"        showFormat="CHECKBOX" defaultValue="${(backword_defaultValue!)?string}" defaultDisplay="${(backword_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1416557834819')}" width=100 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function SwitcherModel_dg1460684019181_check_datagridvalid(){
					//
					var errorObj =SwitcherModel_dg1460684019181Widget._DT.testData();
					var errorContent='';
					if(errorObj!=null){
					  for(var i=0;i<errorObj.length;i++){
						var obj1=errorObj[i];
						if(obj1.errorType=='date'){
						  errorContent+=obj1.label+'必须为日期类型！';
						  break;
						}else if(obj1.errorType=='integer'){
						  errorContent+=obj1.label+'必须为数字类型！';
						  break;
						}else if(obj1.errorType=='decimal'){
						  errorContent+=obj1.label+'必须为整数类型！';
						  break;
						}else if(obj1.errorType=='notnull'){
						   errorContent+=obj1.label+'不能为空';
						   break;
						}else if(obj1.errorType=='toolong'){
						   errorContent+=obj1.label+'字段长度不能超过'+obj1.length+'字节(注：英文字母占1个字节，中文字占3个字节)！';
						   break;
						}
					  }
					  if(errorContent!=""){
						hasErr = true;
					  }
					  if(hasErr){
						EditDialogErrorBarWidget.show(errorContent);
						return false;
					  }
					}
					return true;
				}
				
				function savedg1460684019181DataGrid(){
					<#if  refId?? && (refId gt 0)>
					SwitcherModel_dg1460684019181Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('SwitcherModel_dg1460684019181Widget') > -1) {
						SwitcherModel_dg1460684019181Widget.setAllRowEdited();
					}
					var json = SwitcherModel_dg1460684019181Widget.parseEditedData();
					$('input[name="dg1460684019181ListJson"]').remove();
					$('input[name="dgLists[\'dg1460684019181\']"]').remove();
					$('input[name="dg1460684019181ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1460684019181\']">').val(json).appendTo($('#MESBasic_routine_routine_routineEditForTank_form'));
					$('<input type="hidden" name="dg1460684019181ModelCode">').val('MESBasic_1_routine_SwitcherModel').appendTo($('#MESBasic_routine_routine_routineEditForTank_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1460684019181ListJson">').val(json).appendTo($('#MESBasic_routine_routine_routineEditForTank_form'));
				}
				function DT_SwitcherModel_dg1460684019181_deldatagrid(){
					var deleteRows = SwitcherModel_dg1460684019181Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','switcher.id','config.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460684019181DeletedIds").length>0){
							$("#dg1460684019181DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460684019181DeletedIds" name="dgDeletedIds[\'dg1460684019181\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460684019181DeletedIds['+CUI('input[name^="dg1460684019181DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
					});
					return deleteRows;
				}
				function DT_SwitcherModel_dg1460684019181_delTreeNodes(){
					var deleteRows = SwitcherModel_dg1460684019181Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','switcher.id','config.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460684019181DeletedIds").length>0){
							$("#dg1460684019181DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460684019181DeletedIds" name="dgDeletedIds[\'dg1460684019181\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460684019181DeletedIds['+CUI('input[name^="dg1460684019181DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_routine_routine_routineEditForTank_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<1;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'SwitcherModel_dg1460684019181') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'SwitcherModel_dg1460684019181';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'SwitcherModel_dg1460684019181';
					}
					$('body').data('MESBasic_routine_routine_routineEditForTank_datagrids', datagrids);
				});
				
				var SwitcherModel_dg1460684019181_importDialog = null;
				function SwitcherModel_dg1460684019181_showImportDialog(){
					try{
						if(SwitcherModel_dg1460684019181_importDialog!=null&&SwitcherModel_dg1460684019181_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/routine/routine/initImport.action?datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019181&tid=${id!}&datagridName=dg1460684019181";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_routine_routineEditForTankdg1460684019181_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						SwitcherModel_dg1460684019181_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("SwitcherModel_dg1460684019181"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();SwitcherModel_dg1460684019181_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();SwitcherModel_dg1460684019181_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						SwitcherModel_dg1460684019181_importDialog.show();
					}catch(e){}
				}	
				
				function SwitcherModel_dg1460684019181_downLoadFile(){
					var url = "/MESBasic/routine/routine/downLoad.action?datagridCode=MESBasic_1_routine_routineEditForTankdg1460684019181&templateRelatedModelCode=MESBasic_1_routine_routineEditForTankdg1460684019181&downloadType=template&fileName=dg1460684019181";
					window.open(url,"","");
				}
				function dg1460684019181RenderOverEvent(){
					SwitcherModel_dg1460684019181Widget._DT.configs.checkEditCondition= function( key, nRow){
	var value=SwitcherModel_dg1460684019181Widget.getCellValue( nRow,"stype.id" );
	if((value== 'MES_SWITHER/0' ||  value=='MES_SWITHER/2' ) && (key=='forword' || key=='backword'  )) {
		return false;
	}

	return true;
}
				}
				function dg1460684019181PageInitMethod(nTabIndex){
					MESBasic.routine.routine.routineEditForTank.initSize(nTabIndex);
				}
			</script>
			
			
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
     	
		<div id="MESBasic_routine_routine_routineEditForTank_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.routine.routine.routineEditForTank.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_routine_routineEditForTank,html,MESBasic_1_routine_Routine,MESBasic_1) -->
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
						$("#MESBasic_routine_routine_routineEditForTank_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_routine_routine_routineEditForTank_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_routine_routine_routineEditForTank_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_routine_routine_routineEditForTank_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.routine.routine.routineEditForTank.initCount = 0;
			MESBasic.routine.routine.routineEditForTank.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_routine_routine_routineEditForTank_main_div .edit-head").height()-$("#MESBasic_routine_routine_routineEditForTank_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_routine_routine_routineEditForTank_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_routine_routine_routineEditForTank_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_routine_routine_routineEditForTank_datagrids');
				var padding_bottom=16;
				$("#MESBasic_routine_routine_routineEditForTank_main_div .pd_bottom,#MESBasic_routine_routine_routineEditForTank_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_routine_routine_routineEditForTank_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.routine.routine.routineEditForTank.initCount <= 2) {
										setTimeout(function(){MESBasic.routine.routine.routineEditForTank.initSize();}, 200);
										MESBasic.routine.routine.routineEditForTank.initCount++;
									}/* else {
										MESBasic.routine.routine.routineEditForTank.initCount = 0;
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
							if(($("#MESBasic_routine_routine_routineEditForTank_main_div .edit-workflow").length > 0) && ($("#MESBasic_routine_routine_routineEditForTank_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_routine_routine_routineEditForTank_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.routine.routine.routineEditForTank.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.routine.routine.routineEditForTank.initSize();
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
						if(parseInt($("#MESBasic_routine_routine_routineEditForTank_main_div").css("width"),10)==650){
							$("#MESBasic_routine_routine_routineEditForTank_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.routine.routine.routineEditForTank.resizeLayout();
						//MESBasic.routine.routine.routineEditForTank.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_routine_routine_routineEditForTank_main_div").css("width"),10)==800){
							$("#MESBasic_routine_routine_routineEditForTank_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.routine.routine.routineEditForTank.resizeLayout();
						//MESBasic.routine.routine.routineEditForTank.initSize();
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
					MESBasic.routine.routine.routineEditForTank.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.routine.routine.routineEditForTank.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.routine.routine.routineEditForTank.initSize();});
				/*
				MESBasic.routine.routine.routineEditForTank.resizeLayout=function(){
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

		MESBasic.routine.routine.routineEditForTank.validate = function(){
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
		MESBasic.routine.routine.routineEditForTank.beforeSaveProcess = function(){
			try{eval("savedg1460684019272DataGrid()");}catch(e){}
			try{eval("savedg1460684019181DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#MESBasic_routine_routine_routineEditForTank_form').trigger('beforeSubmit');
			//routine.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="routine.extraCol"]').val(extraCol);
		}
		MESBasic.routine.routine.routineEditForTank.processDataGrid = function(){
										<#if false && isIE>
										$('#MESBasic_routine_routine_routineEditForTank_form').append(Config_dg1460684019272Widget._DT.createInputs('dg1460684019272List'));
										</#if>
										<#if false && isIE>
										$('#MESBasic_routine_routine_routineEditForTank_form').append(SwitcherModel_dg1460684019181Widget._DT.createInputs('dg1460684019181List'));
										</#if>
		};
		MESBasic.routine.routine.routineEditForTank.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.routine.routine.routineEditForTank.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.routine.routine.routineEditForTank.beforeSaveProcess();

			//MESBasic.routine.routine.routineEditForTank.processDataGrid();
			$('#MESBasic_routine_routine_routineEditForTank_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_routine_routine_routineEditForTank_form','MESBasic_routine_routine_routineEditForTank_datagrids')) {      
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
		MESBasic.routine.routine.routineEditForTank.print = function(){
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
		
		MESBasic.routine.routine.routineEditForTank.saveSetting = function(){
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
		
		MESBasic.routine.routine.routineEditForTank.printSetting = function(){
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
				MESBasic.routine.routine.routineEditForTank.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.routine.routine.routineEditForTank.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.routine.routine.routineEditForTank.settingDialog.show();
			}
		}
		
		
		MESBasic.routine.routine.routineEditForTank._callBackInfo = function(res){
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
 						window.opener.MESBasic.routine.routine.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.routine.routine.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				MESBasic.routine.routine.routineEditForTank._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.routine.routine.routineEditForTank._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.routine.routine.routineEditForTank._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.routine.routine.routineEditForTank._refViewCode_IE = viewCode;
			} else {
				MESBasic.routine.routine.routineEditForTank._refViewCode_IE = '';
			}
			MESBasic.routine.routine.routineEditForTank._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.routine.routine.routineEditForTank.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.routine.routine.routineEditForTank._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.routine.routine.routineEditForTank.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.routine.routine.routineEditForTank._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.routine.routine.routineEditForTank._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.routine.routine.routineEditForTank._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.routine.routine.routineEditForTank._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.routine.routine.routineEditForTank._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.routine.routine.routineEditForTank.gridEventObj = gridEventObj;
				callbackName = "MESBasic.routine.routine.routineEditForTank.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.routine.routine.routineEditForTank.getMultiselectCallBackInfo_DG" : "MESBasic.routine.routine.routineEditForTank.getcallBackInfo_DG";
				MESBasic.routine.routine.routineEditForTank._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.routine.routine.routineEditForTank.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.routine.routine.routineEditForTank._prefix = _prefix.substring(1);
			}
			
			MESBasic.routine.routine.routineEditForTank._oGrid = oGrid;
			MESBasic.routine.routine.routineEditForTank._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.routine.routine.routineEditForTank._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.routine.routine.routineEditForTank._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.routine.routine.routineEditForTank._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.routine.routine.routineEditForTank._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.routine.routine.routineEditForTank._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.routine.routine.routineEditForTank._refViewCode = '';
				}
			} else {
				MESBasic.routine.routine.routineEditForTank._isObjCustomProp = false;
				MESBasic.routine.routine.routineEditForTank._objCustomPropNames = '';
				MESBasic.routine.routine.routineEditForTank._refViewCode = '';
			}
			if (MESBasic.routine.routine.routineEditForTank._isObjCustomProp == true && MESBasic.routine.routine.routineEditForTank._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.routine.routine.routineEditForTank._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.routine.routine.routineEditForTank._customCallBack = customCallBack;
			}
			if(MESBasic.routine.routine.routineEditForTank._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.routine.routine.routineEditForTank._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.routine.routine.routineEditForTank._querycustomFuncN == "function") {
				refparam += MESBasic.routine.routine.routineEditForTank._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.routine.routine.routineEditForTank._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.routine.routine.routineEditForTank._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.routine.routine.routineEditForTank._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.routine.routine.routineEditForTank._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.routine.routine.routineEditForTank._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.routine.routine.routineEditForTank.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.routine.routine.routineEditForTank._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.routine.routine.routineEditForTank.query_"+obj+")!='undefined'") ? eval('MESBasic.routine.routine.routineEditForTank.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.routine.routine.routineEditForTank.getcallBackGroupInfo = function(obj){
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
			MESBasic.routine.routine.routineEditForTank._dialog.close();
		}
		MESBasic.routine.routine.routineEditForTank.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_routine_routine_routineEditForTank_form',obj[0], MESBasic.routine.routine.routineEditForTank._prefix, MESBasic.routine.routine.routineEditForTank._sUrl);
			CUI.commonFills('MESBasic_routine_routine_routineEditForTank_form',MESBasic.routine.routine.routineEditForTank._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.routine.routine.routineEditForTank._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.routine.routine.routineEditForTank._customCallBack) {
					eval(MESBasic.routine.routine.routineEditForTank._customCallBack);
					MESBasic.routine.routine.routineEditForTank._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.routine.routine.routineEditForTank._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.routine.routine.routineEditForTank.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.routine.routine.routineEditForTank._customBeforeCallBack) {
				var flag = eval(MESBasic.routine.routine.routineEditForTank._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.routine.routine.routineEditForTank.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.routine.routine.routineEditForTank._isObjCustomProp_IE == true && MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.routine.routine.routineEditForTank._sUrl,MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.routine.routine.routineEditForTank._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.routine.routine.routineEditForTank._isObjCustomProp_IE == true && MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.routine.routine.routineEditForTank._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.routine.routine.routineEditForTank._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.routine.routine.routineEditForTank._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.routine.routine.routineEditForTank._customCallBack) {
					eval(MESBasic.routine.routine.routineEditForTank._customCallBack);
					MESBasic.routine.routine.routineEditForTank._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.routine.routine.routineEditForTank._dialog.close();
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
		
		MESBasic.routine.routine.routineEditForTank.getcallBackInfo_DG = function(obj){
			if(MESBasic.routine.routine.routineEditForTank._customBeforeCallBack) {
				var flag = eval(MESBasic.routine.routine.routineEditForTank._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.routine.routine.routineEditForTank._currRow).next().length==0){
						MESBasic.routine.routine.routineEditForTank._oGrid.addNewRow();
					}	
					MESBasic.routine.routine.routineEditForTank._currRow = $(MESBasic.routine.routine.routineEditForTank._currRow).next();
					$(MESBasic.routine.routine.routineEditForTank._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.routine.routine.routineEditForTank._currRow,obj[i], MESBasic.routine.routine.routineEditForTank._prefix, MESBasic.routine.routine.routineEditForTank._sUrl);
				if (MESBasic.routine.routine.routineEditForTank._isObjCustomProp == true && MESBasic.routine.routine.routineEditForTank._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.routine.routine.routineEditForTank._currRow,MESBasic.routine.routine.routineEditForTank._prefix,obj[i],MESBasic.routine.routine.routineEditForTank._oGrid,MESBasic.routine.routine.routineEditForTank._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.routine.routine.routineEditForTank._currRow,MESBasic.routine.routine.routineEditForTank._prefix,obj[i],MESBasic.routine.routine.routineEditForTank._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.routine.routine.routineEditForTank._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.routine.routine.routineEditForTank._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.routine.routine.routineEditForTank._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.routine.routine.routineEditForTank._refViewCode + '&id=' + id,
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
									name = MESBasic.routine.routine.routineEditForTank._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.routine.routine.routineEditForTank._currRow, objs, MESBasic.routine.routine.routineEditForTank._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.routine.routine.routineEditForTank._customCallBack) {
					eval(MESBasic.routine.routine.routineEditForTank._customCallBack);
					MESBasic.routine.routine.routineEditForTank._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.routine.routine.routineEditForTank._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.routine.routine.routineEditForTank._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.routine.routine.routineEditForTank.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.routine.routine.routineEditForTank._oGrid, MESBasic.routine.routine.routineEditForTank._currRow, MESBasic.routine.routine.routineEditForTank._key, MESBasic.routine.routine.routineEditForTank._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.routine.routine.routineEditForTank._customCallBack) {
					eval(MESBasic.routine.routine.routineEditForTank._customCallBack);
					MESBasic.routine.routine.routineEditForTank._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.routine.routine.routineEditForTank._dialog.close();
			} catch(e){}
		};
		
		MESBasic.routine.routine.routineEditForTank.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.routine.routine.routineEditForTank.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_routine_routine_routineEditForTank_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.routine.routine.routineEditForTank.onloadForProduct();
		});

		MESBasic.routine.routine.routineEditForTank.beforeSubmitMethodSettingInPage = function(){
			MESBasic.routine.routine.routineEditForTank.onsaveForProduct();
			if(Config_dg1460684019272Widget.getRowLength()==0){
	workbenchErrorBarWidget.showMessage("计量数据必须配置！","f");
	return false;
}
var switcherlenght=SwitcherModel_dg1460684019181Widget.getRowLength();
if(switcherlenght==0){
	workbenchErrorBarWidget.showMessage("发送信号必须配置！","f");
	return false;
}

var bengLeng=0;
for(var i =0; i< switcherlenght; i++){
	var stype=SwitcherModel_dg1460684019181Widget.getCellValue(i,"stype.id");
	if(stype=='MES_SWITHER/1'){
		var forword=SwitcherModel_dg1460684019181Widget.getCellValue(i,"forword");
		var backword=SwitcherModel_dg1460684019181Widget.getCellValue(i,"backword");
		if(forword=='true'&&forword==backword){
			workbenchErrorBarWidget.showMessage("泵信号同时配置了正反向，请检查！","f");
			return false;
		}else if(forword=='false'&&forword==backword){
			workbenchErrorBarWidget.showMessage("泵信号没有配置正反向，请检查！","f");
			return false;
		}
	}	else	if(stype=='MES_SWITHER/0'){
		bengLeng++;
	}
}
if(bengLeng==0){
	workbenchErrorBarWidget.showMessage("请至少配置一个阀门信号！","f");
	return false;
}

// 解决开关量PT保存时后台getDgLists()的value为空的问题
SwitcherModel_dg1460684019181Widget.setAllRowEdited();
		};
		MESBasic.routine.routine.routineEditForTank.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.routine.routine.routineEditForTank.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.routine.routine.routineEditForTank.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_routine_routine_routineEditForTank_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_routine_routine_routineEditForTank_main_div").hide();
				},100);
				//CUI("#MESBasic_routine_routine_routineEditForTank_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.routine.routine.routineEditForTank.showThis = function(){
			if(!CUI("#MESBasic_routine_routine_routineEditForTank_main_div").is(':visible')) {
				CUI("#MESBasic_routine_routine_routineEditForTank_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.routine.routine.routineEditForTank.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.routine.routine.routineEditForTank.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_routine_routine_routineEditForTank_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_routine_Routine&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.routine.routine.routineEditForTank.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.routine.routine.routineEditForTank.showInfoDialog=function(mode){
			
			MESBasic.routine.routine.routineEditForTank.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_routine_routine_routineEditForTank_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.routine.routine.routineEditForTank.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.routine.routine.routineEditForTank.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_routine");
			}
		}
		
		MESBasic.routine.routine.routineEditForTank.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/routine/routine/dealInfo-list.action&dlTableInfoId=${(routine.tableInfoId)?default('')}");
			}
		}
		MESBasic.routine.routine.routineEditForTank.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_routine_Routine&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(routine.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_routine_Routine&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(routine.tableInfoId)?default('')}");
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
		MESBasic.routine.routine.routineEditForTank.supervision=function(){
			MESBasic.routine.routine.routineEditForTank.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(routine.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.routine.routine.routineEditForTank.modifyOwnerStaffDialog.show();
		}
		
function srcAfterClear(){
	afterClearContainer(true);
}
function destAfterClear(){
	afterClearContainer(false);
}
function srcCallback(obj){
        afterClearContainer(true);
	containerCallback(obj, true);

}
function destCallback(obj){
        afterClearContainer(false);
	containerCallback(obj, false);

}




function onchangemesu(){
   /*var selectRow =  Config_dg1415338444009Widget.getSelectedRow();
Config_dg1415338444009Widget.setCellValue(selectRow, 'formula','');*/
}

		/* CUSTOM CODE START(view-EDIT-MESBasic_1_routine_routineEditForTank,js,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/**
 * 罐区路径编辑页面中的计量数据自动从所选容器关联的位号列表带下来，并标注“用于源”还是“用于目的”
 */
function containerCallback(obj, forSource){
    var widget = Config_dg1460684019272Widget;
	var containerCode = obj[0].code;
	var resultMap;

	if (forSource) {
		$("[name='routine.srcCode']").val(containerCode);
	}else{
		$("[name='routine.desCode']").val(containerCode);
	}
	
	$.ajax({
		url: "/public/MESBasic/routine/getTagsInfo.action",
		type: 'POST',
		data: {"containerCode" : containerCode},
		async: false,
		success: function(msg){
			if (msg.tagsInfo) {
				resultMap = msg.tagsInfo;
			}
		}
	});
    if(undefined != resultMap){
      // 填充PT
      for (var i = 0; i < resultMap.length; i++) {
          widget.addRow();
          var row = widget.getRowLength() - 1;
          widget.setCellValue(row, 'tankCode', containerCode);
          widget.setCellValue(row, 'name', resultMap[i].itemName);
          widget.setCellValue(row, 'meter.itemName', resultMap[i].itemName);
          widget.setCellValue(row, 'meter.code', resultMap[i].code);
          widget.setCellValue(row, 'meter.id', resultMap[i].id);
          widget.setCellValue(row, 'meter.itemNumber', resultMap[i].itemNumber);
          widget.setCellValue(row, 'meter.tagType.id', resultMap[i].tagType);
          widget.setCellValue(row, 'meter.itemClass.id', resultMap[i].itemClass);
          if(forSource){
              widget.setCellValue(row, 'forSource', true);
              widget.setCellValue(row, 'forDestination', false);
          }else{
              widget.setCellValue(row, 'forSource', false);
              widget.setCellValue(row, 'forDestination', true);
          }
          if(resultMap[i].primary){
              widget.setCellValue(row, 'isDefault', true);
          }else{
              widget.setCellValue(row, 'isDefault', false);
          }
      }
    }
}

/**
 * 路径保存后不关闭页面
 */
MESBasic.routine.routine.routineEditForTank._callBackInfo = function(res){
	if(res.dealSuccessFlag){
		var showMsg ;
		if(res.operateType == 'save'){
			showMsg = "保存成功";
		}else{
			showMsg = "处理成功！";
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
				window.opener.MESBasic.routine.routine.editCallBackInfo(res); 		
					// 保存后不关闭页面
					getNewAddedRecord();				
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
	} else {
         CUI.showErrorInfos(res);
	}
};

/**
 * 新增保存时, 返回当前保存的ID并刷新页面; 修改保存时, 直接刷新页面
 */
function getNewAddedRecord(){
	var headId = $("#MESBasic_routine_routine_routineEditForTank input[name=id]").val();
	if(headId){
		// 如果是修改操作, 则直接刷新页面
		window.location.reload();
	}else{
		var routineCode = $("#routine_code").val();
		// 如果路径编码不为空
		if(routineCode){
			$.ajax({
				url : "/public/MESBasic/routine/getRoutineHeadId.action",
				type : 'POST',
				async : false,
				data : {
					"routineCode" : routineCode
				},
				success : function(msg) {
					if(msg != null && undefined != msg.headId){
						headId = msg.headId;
					}
				}
			});
			
			var url = '/MESBasic/routine/routine/routineEditForTank.action?entityCode=MESBasic_1_routine&buttonCode=MESBasic_1_routine_routineTankList_BUTTON_routineEdit&namespace=list_operate_routine_routineTankList&id=' + headId + '&__pc__=${(Parameters.__pc__)!}';
			window.location.href = url;
		}else {
			// 关闭页面
			setTimeout(function(){
				window.close();
			},1000);
		}
	}
}

/**
 * 清空储罐的同时, 清空对应的计量数据
 */
function afterClearContainer(forSource){
	var widget = Config_dg1460684019272Widget;
	var containerCode;
	if (forSource) {
		containerCode = $('[name="routine.srcCode"]').val();
	}else{
		containerCode = $('[name="routine.desCode"]').val();
	}
	var toDeleteRows = "";
	var comma = "";
	for (var i = 0; i < widget.getRowLength(); i++) {
		if (widget.getCellValue(i, 'tankCode') == containerCode) {
			toDeleteRows += comma + (i+1);
			comma = ",";
		}
	}
	widget.deleteRows(toDeleteRows);
}
/* CUSTOM CODE END */
		MESBasic.routine.routine.routineEditForTank.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_routine_routineEditForTank,onloadForProduct,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.routine.routine.routineEditForTank.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_routine_routineEditForTank,onsaveForProduct,MESBasic_1_routine_Routine,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.routine.routine.routineEditForTank.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.routine.routine.routineEditForTank.showBusinessList('${l.relatingModel.code.replace('.','')}',${(routine.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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