<!-- MESBasic_1/container/containerEdit -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_container_container">
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
<#assign tableObj = container>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.container.container.containerEdit">
<#-- 模型名称-->
<#assign modelName = "container">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_container_containerEdit">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_container">
<#-- 视图名称-->
<#assign viewName = "containerEdit">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_container_container_containerEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "Container">
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
<#assign editFormId = "MESBasic_container_container_containerEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( container.pending.taskDescription)!>
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
        <#assign configTitle = getText('MESBasic.viewtitle.radion1415322089061')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_container_container_containerEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.container.container.containerEdit');
			MESBasic.container.container.containerEdit.currentUser = ${userJson};
			MESBasic.container.container.containerEdit.currentStaff = ${staffJson};
			MESBasic.container.container.containerEdit.currentDepartment = ${deptJson};
			MESBasic.container.container.containerEdit.currentPosition = ${postJson};
			MESBasic.container.container.containerEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_container_containerEdit,head,MESBasic_1_container_Container,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="container.department.id,container.product.id,container.model.id," onsubmitMethod="MESBasic.container.container.containerEdit.beforeSubmitMethod()" id="MESBasic_container_container_containerEdit_form" namespace="/MESBasic/container/container/containerEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_container_Container&_bapFieldPermissonModelName_=Container" editPageNs="MESBasic.container.container.containerEdit" callback="MESBasic.container.container.containerEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_container_container_containerEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_container_container_containerEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="container.department.id" value="${(container.department.id)!""}" originalvalue="${(container.department.id)!""}"/>
					<input type="hidden" name="container.product.id" value="${(container.product.id)!""}" originalvalue="${(container.product.id)!""}"/>
					<input type="hidden" name="container.model.id" value="${(container.model.id)!""}" originalvalue="${(container.model.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('MESBasic.tabname.radion1416532195944')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "MESBasic_container_container_containerEdit_form"+"_attcount";
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
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415268359829')}" >${getText('MESBasic.propertydisplayName.radion1415268359829')}</label>
				</td>
				
						<#assign container_code_defaultValue  = ''>
							 							<#assign container_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="container.code" id="container_code"  style=";" originalvalue="<#if !newObj || (container.code)?has_content>${(container.code?html)!}<#else>${container_code_defaultValue!}</#if>" value="<#if !newObj || (container.code)?has_content>${(container.code?html)!}<#else>${container_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415268393452')}" >${getText('MESBasic.propertydisplayName.radion1415268393452')}</label>
				</td>
				
						<#assign container_name_defaultValue  = ''>
							 							<#assign container_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="container.name" id="container_name"  style=";" originalvalue="<#if !newObj || (container.name)?has_content>${(container.name?html)!}<#else>${container_name_defaultValue!}</#if>" value="<#if !newObj || (container.name)?has_content>${(container.name?html)!}<#else>${container_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415320693399')}" >${getText('MESBasic.propertydisplayName.radion1415320693399')}</label>
				</td>
				
						<#assign container_containerType_defaultValue  = ''>
							 							<#assign container_containerType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${container_containerType_defaultValue!}" formId="MESBasic_container_container_containerEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="container.containerType.id" code="CONTAINER_TYPE" value="${(container.containerType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_container_container_containerEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="container.containerType.id" code="CONTAINER_TYPE" value="${(container.containerType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415322023968')}" >${getText('MESBasic.propertydisplayName.radion1415322023968')}</label>
				</td>
				
						<#assign container_containerStatus_defaultValue  = 'CONTAINER_STATUS/0'>
							 							<#assign container_containerStatus_defaultValue  = 'CONTAINER_STATUS/0'>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${container_containerStatus_defaultValue!}" formId="MESBasic_container_container_containerEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="container.containerStatus.id" code="CONTAINER_STATUS" value="${(container.containerStatus.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_container_container_containerEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="container.containerStatus.id" code="CONTAINER_STATUS" value="${(container.containerStatus.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign container_product_productName_defaultValue  = ''>
														<#assign container_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}" viewType="${viewType!}" deValue="${container_product_productName_defaultValue!}" conditionfunc="MESBasic.container.container.containerEdit._querycustomFunc('container_product_productName')"  value="${(container.product.productName)!}" displayFieldName="productName" name="container.product.productName" id="container_product_productName" type="other" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_container_container_containerEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRef"  onkeyupfuncname=";_callback_container_product_productName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(container.id)?? && (container.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${container.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_container_container_containerEdit_form',obj, 'container.product', '/MESBasic/product/product/productRef.action');
												CUI.commonFills('MESBasic_container_container_containerEdit_form', 'container.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415150519135')}" >${getText('MESBasic.propertydisplayName.radion1415150519135')}</label>
				</td>
				
						<#assign container_model_name_defaultValue  = ''>
														<#assign container_model_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.radion1415322322556')}" viewType="${viewType!}" deValue="${container_model_name_defaultValue!}" conditionfunc="MESBasic.container.container.containerEdit._querycustomFunc('container_model_name')"  value="${(container.model.name)!}" displayFieldName="name" name="container.model.name" id="container_model_name" type="other" url="/MESBasic/tankModel/tankModel/modelRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_container_container_containerEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_tankModel_modelRef"  onkeyupfuncname=";_callback_container_model_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(container.id)?? && (container.model.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${container.model.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_container_container_containerEdit_form',obj, 'container.model', '/MESBasic/tankModel/tankModel/modelRef.action');
												CUI.commonFills('MESBasic_container_container_containerEdit_form', 'container.model',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415847847462')}" >${getText('MESBasic.propertydisplayName.radion1415847847462')}</label>
				</td>
				
						<#assign container_tankMgr_defaultValue  = ''>
							 							<#assign container_tankMgr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="container.tankMgr_check" originalvalue="<#if !newObj><#if (container.tankMgr)??>${(container.tankMgr!false)?string('true','false')}<#else>false</#if><#elseif container_tankMgr_defaultValue?has_content>${(container_tankMgr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (container.tankMgr)??>${(container.tankMgr!false)?string('true','false')}<#else>false</#if><#else>${(container_tankMgr_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="container.tankMgr" originalvalue="<#if ((container.tankMgr)?? &&  container.tankMgr)||(container_tankMgr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((container.tankMgr)?? &&  container.tankMgr)||(container_tankMgr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="container.tankMgr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="container.tankMgr"]');
												CUI('input[name="container.tankMgr_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415847889766')}" >${getText('MESBasic.propertydisplayName.radion1415847889766')}</label>
				</td>
				
						<#assign container_produceMgr_defaultValue  = ''>
							 							<#assign container_produceMgr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="container.produceMgr_check" originalvalue="<#if !newObj><#if (container.produceMgr)??>${(container.produceMgr!false)?string('true','false')}<#else>false</#if><#elseif container_produceMgr_defaultValue?has_content>${(container_produceMgr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (container.produceMgr)??>${(container.produceMgr!false)?string('true','false')}<#else>false</#if><#else>${(container_produceMgr_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="container.produceMgr" originalvalue="<#if ((container.produceMgr)?? &&  container.produceMgr)||(container_produceMgr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((container.produceMgr)?? &&  container.produceMgr)||(container_produceMgr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="container.produceMgr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="container.produceMgr"]');
												CUI('input[name="container.produceMgr_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415322023961')}" >${getText('MESBasic.propertydisplayName.radion1415322023961')}</label>
				</td>
				
						<#assign container_department_name_defaultValue  = ''>
														<#assign container_department_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.department.reference')}" viewType="${viewType!}" deValue="${container_department_name_defaultValue!}" conditionfunc="MESBasic.container.container.containerEdit._querycustomFunc('container_department_name')"  value="${(container.department.name)!}" displayFieldName="name" name="container.department.name" id="container_department_name" type="Department" url="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" clicked=true multiple=false mnewidth=260 formId="MESBasic_container_container_containerEdit_form" editCustomCallback=";" refViewCode="sysbase_1.0_department_departmentRefCustom" onkeyupfuncname=";_callback_container_department_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (container_department_name_defaultValue)=='currentDepart'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.mainPosition.department.id}'};
											obj = foundation.common.getObject('MESBasic_container_container_containerEdit_form',obj, 'container.department', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
											CUI.commonFills('MESBasic_container_container_containerEdit_form', 'container.department',obj,true);
											$('input:hidden[name="container.department.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(container.id)?? && (container.department.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${container.department.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_container_container_containerEdit_form',obj, 'container.department', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
												CUI.commonFills('MESBasic_container_container_containerEdit_form', 'container.department',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415320780802')}" >${getText('MESBasic.propertydisplayName.radion1415320780802')}</label>
				</td>
				
						<#assign container_volumneCalc_defaultValue  = ''>
							 							<#assign container_volumneCalc_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="container_volumneCalc" originalvalue="<#if !newObj || (container.volumneCalc)?has_content>${(container.volumneCalc?html)!}<#else>${container_volumneCalc_defaultValue?html}</#if>"  name="container.volumneCalc" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (container.volumneCalc)?has_content>${(container.volumneCalc)!}<#else>${container_volumneCalc_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td nullable=true class="edit-table-symbol"  colspan="5" align="right" style="text-align: right;;" >
							<label style="width:100%;text-align:left;;" value="${getText('MESBasic.propertydisplayName.radion1415607739730')}" >${getText('MESBasic.propertydisplayName.radion1415607739730')}</label>
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415321422970')}" >${getText('MESBasic.propertydisplayName.radion1415321422970')}</label>
				</td>
				
						<#assign container_pimsurl_defaultValue  = ''>
							 							<#assign container_pimsurl_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="container_pimsurl" originalvalue="<#if !newObj || (container.pimsurl)?has_content>${(container.pimsurl?html)!}<#else>${container_pimsurl_defaultValue?html}</#if>"  name="container.pimsurl" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (container.pimsurl)?has_content>${(container.pimsurl)!}<#else>${container_pimsurl_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td nullable=true class="edit-table-symbol"  colspan="5" align="left" style="text-align: left;;" >
							<label style="width:100%;padding-left:5px;text-align:left;;" value="${getText('MESBasic.propertydisplayName.radion1417919886646')}" >${getText('MESBasic.propertydisplayName.radion1417919886646')}</label>
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
				<td nullable=true class="edit-table-symbol"  colspan="6" align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415324474383')}" >${getText('MESBasic.propertydisplayName.radion1415324474383')}</label>
				</td>
		</tr>
	</table>
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
			</div>
		</div>
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" >
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
				<#assign dUrl="/MESBasic/container/container/data-dg1416532238441.action?container.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_container_containerEditdg1416532238441">
			<#else>
				<#assign dUrl="/MESBasic/container/container/data-dg1416532238441.action?container.id=${(container.id)!-1}&datagridCode=MESBasic_1_container_containerEditdg1416532238441">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_PropertyTags_dg1416532238441_deldatagrid();}},{text:\"${getText('ec.view.button.insertRow')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowUp')}\",handler:function(){this.moveRow('up');},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowDown')}\",handler:function(){this.moveRow('down');},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_PropertyTags_dg1416532238441_deldatagrid();}},{text:\"${getText('ec.view.button.insertRow')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowUp')}\",handler:function(){this.moveRow('up');},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowDown')}\",handler:function(){this.moveRow('down');},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_PropertyTags_dg1416532238441" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1416532238441_id" value="PropertyTags_dg1416532238441" />
			
			<input type="hidden" id="dg1416532238441_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.radion1415869369969')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/container/container/data-dg1416532238441.action?operateType=export&datagridCode=MESBasic_1_container_containerEditdg1416532238441"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="PropertyTags_dg1416532238441" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="PropertyTags_dg1416532238441" viewType="${viewType}" renderOverEvent="dg1416532238441RenderOverEvent" route="${routeFlag}" formId="MESBasic_container_container_containerEdit_form" noPermissionKeys="property.itemNumber,property.code,property.itemName,property.measureClass,primary" modelCode="MESBasic_1_container_PropertyTags" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1416532238441" dtPage="dgPage"  hidekeyPrefix="dg1416532238441" hidekey="['id','version','property.id','property.itemNumber','property.id','property.code','property.id','property.itemName','property.id','property.measureClass.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1416532238441PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('MESBasic.dataGriddataGridName.radion1422595733428')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=true  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign property_itemNumber_displayDefaultType=''>
								<#assign property_itemNumber_defaultValue=''>
										<#assign property_itemNumber_defaultValue=''>
																	<#if (property_itemNumber_defaultValue!)?string=="currentUser">
								<#assign property_itemNumber_defaultValue='${staffJson!}'>
							<#elseif (property_itemNumber_defaultValue!)?string=="currentPost">
								<#assign property_itemNumber_defaultValue='${postJson!}'>
							<#elseif (property_itemNumber_defaultValue!)?string=="currentDepart">
								<#assign property_itemNumber_defaultValue='${deptJson!}'>
							<#elseif (property_itemNumber_defaultValue!)?string=="currentComp">
								<#assign property_itemNumber_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="property.itemNumber"        showFormat="SELECTCOMP" defaultValue="${(property_itemNumber_defaultValue!)?string}" defaultDisplay="${(property_itemNumber_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="MESBasic.container.container.containerEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRefForContainer.action" viewCode="MESBasic_1_itemManage_itemRefForContainer" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1422422463756')}"  label="${getText('MESBasic.propertydisplayName.radion1415258842136')}" width=120 showFormatFunc=""  />
							<#assign property_code_displayDefaultType=''>
								<#assign property_code_defaultValue=''>
										<#assign property_code_defaultValue=''>
																	<#if (property_code_defaultValue!)?string=="currentUser">
								<#assign property_code_defaultValue='${staffJson!}'>
							<#elseif (property_code_defaultValue!)?string=="currentPost">
								<#assign property_code_defaultValue='${postJson!}'>
							<#elseif (property_code_defaultValue!)?string=="currentDepart">
								<#assign property_code_defaultValue='${deptJson!}'>
							<#elseif (property_code_defaultValue!)?string=="currentComp">
								<#assign property_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="property.code"        showFormat="TEXT" defaultValue="${(property_code_defaultValue!)?string}" defaultDisplay="${(property_code_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.container.container.containerEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRef.action" viewCode="MESBasic_1_itemManage_itemRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1415323143732')}"  label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" width=120 showFormatFunc=""  />
							<#assign property_itemName_displayDefaultType=''>
								<#assign property_itemName_defaultValue=''>
										<#assign property_itemName_defaultValue=''>
																	<#if (property_itemName_defaultValue!)?string=="currentUser">
								<#assign property_itemName_defaultValue='${staffJson!}'>
							<#elseif (property_itemName_defaultValue!)?string=="currentPost">
								<#assign property_itemName_defaultValue='${postJson!}'>
							<#elseif (property_itemName_defaultValue!)?string=="currentDepart">
								<#assign property_itemName_defaultValue='${deptJson!}'>
							<#elseif (property_itemName_defaultValue!)?string=="currentComp">
								<#assign property_itemName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="property.itemName"        showFormat="TEXT" defaultValue="${(property_itemName_defaultValue!)?string}" defaultDisplay="${(property_itemName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.container.container.containerEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRef.action" viewCode="MESBasic_1_itemManage_itemRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1415323143732')}"  label="${getText('MESBasic.propertydisplayName.radion1415258813793')}" width=120 showFormatFunc=""  />
							<#assign property_measureClass_displayDefaultType=''>
								<#assign property_measureClass_defaultValue=''>
										<#assign property_measureClass_defaultValue=''>
																	<#if (property_measureClass_defaultValue!)?string=="currentUser">
								<#assign property_measureClass_defaultValue='${staffJson!}'>
							<#elseif (property_measureClass_defaultValue!)?string=="currentPost">
								<#assign property_measureClass_defaultValue='${postJson!}'>
							<#elseif (property_measureClass_defaultValue!)?string=="currentDepart">
								<#assign property_measureClass_defaultValue='${deptJson!}'>
							<#elseif (property_measureClass_defaultValue!)?string=="currentComp">
								<#assign property_measureClass_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="ITEM_PROPERTY" textalign="left" defaultValue="${(property_measureClass_defaultValue!)?string}" key="property.measureClass.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.radion1416380194525')}" width=100  isTree=true systemEntityCode="ITEM_PROPERTY" systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=ITEM_PROPERTY" />
							<#assign primary_displayDefaultType=''>
								<#assign primary_defaultValue=''>
										<#assign primary_defaultValue=''>
										  
									<@datacolumn key="primary"        showFormat="CHECKBOX" defaultValue="${(primary_defaultValue!)?string}" defaultDisplay="${(primary_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1415869492053')}" width=80 showFormatFunc=""  />
			
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
				function PropertyTags_dg1416532238441_check_datagridvalid(){
					//
					var errorObj =PropertyTags_dg1416532238441Widget._DT.testData();
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
				
				function savedg1416532238441DataGrid(){
					<#if  refId?? && (refId gt 0)>
					PropertyTags_dg1416532238441Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('PropertyTags_dg1416532238441Widget') > -1) {
						PropertyTags_dg1416532238441Widget.setAllRowEdited();
					}
					var json = PropertyTags_dg1416532238441Widget.parseEditedData();
					$('input[name="dg1416532238441ListJson"]').remove();
					$('input[name="dgLists[\'dg1416532238441\']"]').remove();
					$('input[name="dg1416532238441ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1416532238441\']">').val(json).appendTo($('#MESBasic_container_container_containerEdit_form'));
					$('<input type="hidden" name="dg1416532238441ModelCode">').val('MESBasic_1_container_PropertyTags').appendTo($('#MESBasic_container_container_containerEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1416532238441ListJson">').val(json).appendTo($('#MESBasic_container_container_containerEdit_form'));
				}
				function DT_PropertyTags_dg1416532238441_deldatagrid(){
					var deleteRows = PropertyTags_dg1416532238441Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','container.id','property.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1416532238441DeletedIds").length>0){
							$("#dg1416532238441DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1416532238441DeletedIds" name="dgDeletedIds[\'dg1416532238441\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_container_container_containerEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1416532238441DeletedIds['+CUI('input[name^="dg1416532238441DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_container_container_containerEdit_form'));
					});
					return deleteRows;
				}
				function DT_PropertyTags_dg1416532238441_delTreeNodes(){
					var deleteRows = PropertyTags_dg1416532238441Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','container.id','property.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1416532238441DeletedIds").length>0){
							$("#dg1416532238441DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1416532238441DeletedIds" name="dgDeletedIds[\'dg1416532238441\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_container_container_containerEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1416532238441DeletedIds['+CUI('input[name^="dg1416532238441DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_container_container_containerEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_container_container_containerEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<2;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[1].length>0) {
						for(var i=0;i<datagrids[1].length;i++) {
							if(datagrids[1][i] == 'PropertyTags_dg1416532238441') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'PropertyTags_dg1416532238441';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'PropertyTags_dg1416532238441';
					}
					$('body').data('MESBasic_container_container_containerEdit_datagrids', datagrids);
				});
				
				var PropertyTags_dg1416532238441_importDialog = null;
				function PropertyTags_dg1416532238441_showImportDialog(){
					try{
						if(PropertyTags_dg1416532238441_importDialog!=null&&PropertyTags_dg1416532238441_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/container/container/initImport.action?datagridCode=MESBasic_1_container_containerEditdg1416532238441&tid=${id!}&datagridName=dg1416532238441";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_container_containerEditdg1416532238441_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						PropertyTags_dg1416532238441_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("PropertyTags_dg1416532238441"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();PropertyTags_dg1416532238441_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();PropertyTags_dg1416532238441_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						PropertyTags_dg1416532238441_importDialog.show();
					}catch(e){}
				}	
				
				function PropertyTags_dg1416532238441_downLoadFile(){
					var url = "/MESBasic/container/container/downLoad.action?datagridCode=MESBasic_1_container_containerEditdg1416532238441&templateRelatedModelCode=MESBasic_1_container_containerEditdg1416532238441&downloadType=template&fileName=dg1416532238441";
					window.open(url,"","");
				}
				function dg1416532238441RenderOverEvent(){
				}
				function dg1416532238441PageInitMethod(nTabIndex){
					MESBasic.container.container.containerEdit.initSize(nTabIndex);
				}
			</script>
			
			
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
     	
		<div id="MESBasic_container_container_containerEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.container.container.containerEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_container_containerEdit,html,MESBasic_1_container_Container,MESBasic_1) -->
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
						$("#MESBasic_container_container_containerEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_container_container_containerEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_container_container_containerEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_container_container_containerEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.container.container.containerEdit.initCount = 0;
			MESBasic.container.container.containerEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_container_container_containerEdit_main_div .edit-head").height()-$("#MESBasic_container_container_containerEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_container_container_containerEdit_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_container_container_containerEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_container_container_containerEdit_datagrids');
				var padding_bottom=16;
				$("#MESBasic_container_container_containerEdit_main_div .pd_bottom,#MESBasic_container_container_containerEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_container_container_containerEdit_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.container.container.containerEdit.initCount <= 2) {
										setTimeout(function(){MESBasic.container.container.containerEdit.initSize();}, 200);
										MESBasic.container.container.containerEdit.initCount++;
									}/* else {
										MESBasic.container.container.containerEdit.initCount = 0;
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
							if(($("#MESBasic_container_container_containerEdit_main_div .edit-workflow").length > 0) && ($("#MESBasic_container_container_containerEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_container_container_containerEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.container.container.containerEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.container.container.containerEdit.initSize();
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
						if(parseInt($("#MESBasic_container_container_containerEdit_main_div").css("width"),10)==650){
							$("#MESBasic_container_container_containerEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.container.container.containerEdit.resizeLayout();
						//MESBasic.container.container.containerEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_container_container_containerEdit_main_div").css("width"),10)==800){
							$("#MESBasic_container_container_containerEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.container.container.containerEdit.resizeLayout();
						//MESBasic.container.container.containerEdit.initSize();
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
					MESBasic.container.container.containerEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.container.container.containerEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.container.container.containerEdit.initSize();});
				/*
				MESBasic.container.container.containerEdit.resizeLayout=function(){
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

		MESBasic.container.container.containerEdit.validate = function(){
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
		MESBasic.container.container.containerEdit.beforeSaveProcess = function(){
			try{eval("savedg1416532238441DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#MESBasic_container_container_containerEdit_form').trigger('beforeSubmit');
			//container.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="container.extraCol"]').val(extraCol);
		}
		MESBasic.container.container.containerEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#MESBasic_container_container_containerEdit_form').append(PropertyTags_dg1416532238441Widget._DT.createInputs('dg1416532238441List'));
										</#if>
		};
		MESBasic.container.container.containerEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.container.container.containerEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.container.container.containerEdit.beforeSaveProcess();

			//MESBasic.container.container.containerEdit.processDataGrid();
			$('#MESBasic_container_container_containerEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_container_container_containerEdit_form','MESBasic_container_container_containerEdit_datagrids')) {      
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
		MESBasic.container.container.containerEdit.print = function(){
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
		
		MESBasic.container.container.containerEdit.saveSetting = function(){
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
		
		MESBasic.container.container.containerEdit.printSetting = function(){
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
				MESBasic.container.container.containerEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.container.container.containerEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.container.container.containerEdit.settingDialog.show();
			}
		}
		
		
		MESBasic.container.container.containerEdit._callBackInfo = function(res){
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
 						window.opener.MESBasic.container.container.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.container.container.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				MESBasic.container.container.containerEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.container.container.containerEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.container.container.containerEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.container.container.containerEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.container.container.containerEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.container.container.containerEdit._refViewCode_IE = viewCode;
			} else {
				MESBasic.container.container.containerEdit._refViewCode_IE = '';
			}
			MESBasic.container.container.containerEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.container.container.containerEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.container.container.containerEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.container.container.containerEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.container.container.containerEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.container.container.containerEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.container.container.containerEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.container.container.containerEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.container.container.containerEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.container.container.containerEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.container.container.containerEdit.gridEventObj = gridEventObj;
				callbackName = "MESBasic.container.container.containerEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.container.container.containerEdit.getMultiselectCallBackInfo_DG" : "MESBasic.container.container.containerEdit.getcallBackInfo_DG";
				MESBasic.container.container.containerEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.container.container.containerEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.container.container.containerEdit._prefix = _prefix.substring(1);
			}
			
			MESBasic.container.container.containerEdit._oGrid = oGrid;
			MESBasic.container.container.containerEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.container.container.containerEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.container.container.containerEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.container.container.containerEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.container.container.containerEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.container.container.containerEdit._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.container.container.containerEdit._refViewCode = '';
				}
			} else {
				MESBasic.container.container.containerEdit._isObjCustomProp = false;
				MESBasic.container.container.containerEdit._objCustomPropNames = '';
				MESBasic.container.container.containerEdit._refViewCode = '';
			}
			if (MESBasic.container.container.containerEdit._isObjCustomProp == true && MESBasic.container.container.containerEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.container.container.containerEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.container.container.containerEdit._customCallBack = customCallBack;
			}
			if(MESBasic.container.container.containerEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.container.container.containerEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.container.container.containerEdit._querycustomFuncN == "function") {
				refparam += MESBasic.container.container.containerEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.container.container.containerEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.container.container.containerEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.container.container.containerEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.container.container.containerEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.container.container.containerEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.container.container.containerEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.container.container.containerEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.container.container.containerEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.container.container.containerEdit.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.container.container.containerEdit.getcallBackGroupInfo = function(obj){
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
			MESBasic.container.container.containerEdit._dialog.close();
		}
		MESBasic.container.container.containerEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_container_container_containerEdit_form',obj[0], MESBasic.container.container.containerEdit._prefix, MESBasic.container.container.containerEdit._sUrl);
			CUI.commonFills('MESBasic_container_container_containerEdit_form',MESBasic.container.container.containerEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.container.container.containerEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.container.container.containerEdit._customCallBack) {
					eval(MESBasic.container.container.containerEdit._customCallBack);
					MESBasic.container.container.containerEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.container.container.containerEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.container.container.containerEdit.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.container.container.containerEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.container.container.containerEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.container.container.containerEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.container.container.containerEdit._isObjCustomProp_IE == true && MESBasic.container.container.containerEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.container.container.containerEdit._sUrl,MESBasic.container.container.containerEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.container.container.containerEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.container.container.containerEdit._isObjCustomProp_IE == true && MESBasic.container.container.containerEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.container.container.containerEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.container.container.containerEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.container.container.containerEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.container.container.containerEdit._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.container.container.containerEdit._customCallBack) {
					eval(MESBasic.container.container.containerEdit._customCallBack);
					MESBasic.container.container.containerEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.container.container.containerEdit._dialog.close();
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
		
		MESBasic.container.container.containerEdit.getcallBackInfo_DG = function(obj){
			if(MESBasic.container.container.containerEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.container.container.containerEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.container.container.containerEdit._currRow).next().length==0){
						MESBasic.container.container.containerEdit._oGrid.addNewRow();
					}	
					MESBasic.container.container.containerEdit._currRow = $(MESBasic.container.container.containerEdit._currRow).next();
					$(MESBasic.container.container.containerEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.container.container.containerEdit._currRow,obj[i], MESBasic.container.container.containerEdit._prefix, MESBasic.container.container.containerEdit._sUrl);
				if (MESBasic.container.container.containerEdit._isObjCustomProp == true && MESBasic.container.container.containerEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.container.container.containerEdit._currRow,MESBasic.container.container.containerEdit._prefix,obj[i],MESBasic.container.container.containerEdit._oGrid,MESBasic.container.container.containerEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.container.container.containerEdit._currRow,MESBasic.container.container.containerEdit._prefix,obj[i],MESBasic.container.container.containerEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.container.container.containerEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.container.container.containerEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.container.container.containerEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.container.container.containerEdit._refViewCode + '&id=' + id,
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
									name = MESBasic.container.container.containerEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.container.container.containerEdit._currRow, objs, MESBasic.container.container.containerEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.container.container.containerEdit._customCallBack) {
					eval(MESBasic.container.container.containerEdit._customCallBack);
					MESBasic.container.container.containerEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.container.container.containerEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.container.container.containerEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.container.container.containerEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.container.container.containerEdit._oGrid, MESBasic.container.container.containerEdit._currRow, MESBasic.container.container.containerEdit._key, MESBasic.container.container.containerEdit._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.container.container.containerEdit._customCallBack) {
					eval(MESBasic.container.container.containerEdit._customCallBack);
					MESBasic.container.container.containerEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.container.container.containerEdit._dialog.close();
			} catch(e){}
		};
		
		MESBasic.container.container.containerEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.container.container.containerEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_container_container_containerEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.container.container.containerEdit.onloadForProduct();
			var url = $('#container_pimsurl').attr("value");
var pimspage = "<iframe src='" + url + "'  width='100%' height='500px' frameborder='no'/>";
var c = $('label[value="pimspage"]').parent();
c.html(pimspage);
		});

		MESBasic.container.container.containerEdit.beforeSubmitMethodSettingInPage = function(){
			MESBasic.container.container.containerEdit.onsaveForProduct();
			var  factor = $('#container_volumneCalc').val();
var flag = true;
if(null == factor || factor.length==0){
	// do nothing
}else{
    function fn(string, obj){
		// 剔除空白符
		string = string.replace(/\s/g, '');
		// 错误情况，空字符串
		if("" === string){
			return false;
		}
		// 错误情况，运算符连续
		if( /[\+\-\*\/]{2,}/.test(string) ){
			return false;
		}
		// 空括号
		if(/\(\)/.test(string)){
			return false;
		}
		// 错误情况，括号不配对
		var stack = [];
		for(var i = 0, item; i < string.length; i++){
			item = string.charAt(i);
			if('(' === item){
				stack.push('(');
			}else if(')' === item){
				if(stack.length > 0){
					stack.pop();
				}else{
					return false;
				}
			}
		}
		if(0 !== stack.length){
			return false;
		}
		// 错误情况，(后面是运算符 
		if(/\([\+\-\*\/]/.test(string)){
			return false;
		}
		// 错误情况，)前面是运算符
		if(/[\+\-\*\/]\)/.test(string)){
			return false;
		}
		// 错误情况，(前面不是运算符
		if(/[^\+\-\*\/]\(/.test(string)){
			return false;
		}
		// 错误情况，)后面不是运算符
		if(/\)[^\+\-\*\/]/.test(string)){
			return false;
		}
		//是否包含除0错误
		if(/\/0/.test(string)){
			return false;
		}
		//是否包含[、]、{、}错误
		if(/\[|\]|{|}/.test(string)){
			return false;
		}
		// 错误情况，变量没有来自“待选公式变量”
		var tmpStr = string.replace(/[\(\)\+\-\*\/]{1,}/g, '`');
		var array = tmpStr.split('`');
		for(var i = 0, item; i < array.length; i++){
			item = array[i];
			if( /[A-Z]/i.test(item) && 'undefined' === typeof(obj[item]) ){
				return false;
			}
		}
		return true;
	}
	// 测试
	 var fields = {
		'n': 1,
	 };
    // 提交到服务器端的字符串不应该包含空白符，或者应该禁止用户输入空白符
	flag = fn(factor, fields);
		if(!flag){
		workbenchErrorBarWidget.showMessage("体积计算公式错误！");
	}
}
return flag;



return beforSubmit_Fun();
		};
		MESBasic.container.container.containerEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.container.container.containerEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.container.container.containerEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_container_container_containerEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_container_container_containerEdit_main_div").hide();
				},100);
				//CUI("#MESBasic_container_container_containerEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.container.container.containerEdit.showThis = function(){
			if(!CUI("#MESBasic_container_container_containerEdit_main_div").is(':visible')) {
				CUI("#MESBasic_container_container_containerEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.container.container.containerEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.container.container.containerEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_container_container_containerEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_container_Container&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.container.container.containerEdit.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.container.container.containerEdit.showInfoDialog=function(mode){
			
			MESBasic.container.container.containerEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_container_container_containerEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.container.container.containerEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.container.container.containerEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_container");
			}
		}
		
		MESBasic.container.container.containerEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/container/container/dealInfo-list.action&dlTableInfoId=${(container.tableInfoId)?default('')}");
			}
		}
		MESBasic.container.container.containerEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_container_Container&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(container.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_container_Container&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(container.tableInfoId)?default('')}");
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
		MESBasic.container.container.containerEdit.supervision=function(){
			MESBasic.container.container.containerEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(container.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.container.container.containerEdit.modifyOwnerStaffDialog.show();
		}
		



		/* CUSTOM CODE START(view-EDIT-MESBasic_1_container_containerEdit,js,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		MESBasic.container.container.containerEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_container_containerEdit,onloadForProduct,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.container.container.containerEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_container_containerEdit,onsaveForProduct,MESBasic_1_container_Container,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.container.container.containerEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.container.container.containerEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(container.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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