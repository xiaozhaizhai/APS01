<!-- MESBasic_1/factoryModel/factoryEdit -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_factoryModel_factoryModel">
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
<#assign tableObj = factoryModel>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.factoryModel.factoryModel.factoryEdit">
<#-- 模型名称-->
<#assign modelName = "factoryModel">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_factoryModel_factoryEdit">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_factoryModel">
<#-- 视图名称-->
<#assign viewName = "factoryEdit">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_factoryModel_factoryModel_factoryEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "FactoryModel">
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
<#assign editFormId = "MESBasic_factoryModel_factoryModel_factoryEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( factoryModel.pending.taskDescription)!>
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
        <#assign configTitle = getText('MESBasic.viewtitle.radion1419232752234')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_factoryModel_factoryModel_factoryEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.factoryModel.factoryModel.factoryEdit');
			MESBasic.factoryModel.factoryModel.factoryEdit.currentUser = ${userJson};
			MESBasic.factoryModel.factoryModel.factoryEdit.currentStaff = ${staffJson};
			MESBasic.factoryModel.factoryModel.factoryEdit.currentDepartment = ${deptJson};
			MESBasic.factoryModel.factoryModel.factoryEdit.currentPosition = ${postJson};
			MESBasic.factoryModel.factoryModel.factoryEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_factoryEdit,head,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="factoryModel.endItem.id,factoryModel.nodeType.id,factoryModel.assignBatchNo.id,factoryModel.department.id," onsubmitMethod="MESBasic.factoryModel.factoryModel.factoryEdit.beforeSubmitMethod()" id="MESBasic_factoryModel_factoryModel_factoryEdit_form" namespace="/MESBasic/factoryModel/factoryModel/factoryEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_factoryModel_FactoryModel&_bapFieldPermissonModelName_=FactoryModel" editPageNs="MESBasic.factoryModel.factoryModel.factoryEdit" callback="MESBasic.factoryModel.factoryModel.factoryEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_factoryModel_factoryModel_factoryEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_factoryModel_factoryModel_factoryEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="factoryModel.endItem.id" value="${(factoryModel.endItem.id)!""}" originalvalue="${(factoryModel.endItem.id)!""}"/>
					<input type="hidden" name="factoryModel.nodeType.id" value="${(factoryModel.nodeType.id)!""}" originalvalue="${(factoryModel.nodeType.id)!""}"/>
					<input type="hidden" name="factoryModel.assignBatchNo.id" value="${(factoryModel.assignBatchNo.id)!""}" originalvalue="${(factoryModel.assignBatchNo.id)!""}"/>
					<input type="hidden" name="factoryModel.department.id" value="${(factoryModel.department.id)!""}" originalvalue="${(factoryModel.department.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('MESBasic.tabname.radion1490261409320234')}</li>
			<li>${getText('MESBasic.entityname.randon1423966956116')}</li>
			<li>${getText('MESBasic.tabname.radion1460959978572')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "MESBasic_factoryModel_factoryModel_factoryEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_factoryModel', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<input type="hidden" name="factoryModel.parentId" value='${(factoryModel.parentId)!-1}' />
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419233767027')}" >${getText('MESBasic.propertydisplayName.radion1419233767027')}</label>
				</td>
				
						<#assign factoryModel_code_defaultValue  = ''>
							 							<#assign factoryModel_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="factoryModel.code" id="factoryModel_code"  style=";" originalvalue="<#if !newObj || (factoryModel.code)?has_content>${(factoryModel.code?html)!}<#else>${factoryModel_code_defaultValue!}</#if>" value="<#if !newObj || (factoryModel.code)?has_content>${(factoryModel.code?html)!}<#else>${factoryModel_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion141923322393782')}" >${getText('MESBasic.propertydisplayName.radion141923322393782')}</label>
				</td>
				
						<#assign factoryModel_name_defaultValue  = ''>
							 							<#assign factoryModel_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="factoryModel.name" id="factoryModel_name"  style=";" originalvalue="<#if !newObj || (factoryModel.name)?has_content>${(factoryModel.name?html)!}<#else>${factoryModel_name_defaultValue!}</#if>" value="<#if !newObj || (factoryModel.name)?has_content>${(factoryModel.name?html)!}<#else>${factoryModel_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1460947375824')}" >${getText('MESBasic.propertydisplayName.randon1460947375824')}</label>
				</td>
				
						<#assign factoryModel_nodeType_name_defaultValue  = ''>
														<#assign factoryModel_nodeType_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1460947537367')}" viewType="${viewType!}" deValue="${factoryModel_nodeType_name_defaultValue!}" conditionfunc="MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc('factoryModel_nodeType_name')"  value="${(factoryModel.nodeType.name)!}" displayFieldName="name" name="factoryModel.nodeType.name" id="factoryModel_nodeType_name" type="other" url="/MESBasic/nodeType/nodeType/noderef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" editCustomCallback="ChangeName(obj);" refViewCode="MESBasic_1_nodeType_noderef"  onkeyupfuncname="ChangeName(obj);_callback_factoryModel_nodeType_name(obj);" cssStyle="" isEdit=true beforecallback='beforeChangeNameChangeName(obj)' onBeforeClear='afterClear(deleteObj)'  isCrossCompany=false  editLinkCallBack="_callback_factoryModel_nodeType_name_edit" delCustomCallback="_del_callback_factoryModel_nodeType_name()"/>
								
								
								<script type="text/javascript">
									var _callback_factoryModel_nodeType_name_obj;
									
									function _del_callback_factoryModel_nodeType_name(){
										var label = $('input[name="factoryModel.nodeType.name"]').parents('td').prev().find('label');
										label.html(label.attr("value"));
									}
								
									function _callback_factoryModel_nodeType_name_edit(obj){
										var label = $('input[name="factoryModel.nodeType.name"]').parents('td').prev().find('label');
										_callback_factoryModel_nodeType_name_obj = obj[0];
										if(null != obj[0] && undefined != obj[0] && null != obj[0].id && obj[0].id != "" ){
											label.html("<span class='edit-table-symbol-span' onclick='_opendialog_factoryModel_nodeType_name()'>" + label.attr("value") + "</span>");
										} else {
											label.html(label.attr("value"));
										}
									}
									<#if (factoryModel.nodeType.name)?? >
									(function(){
										var name = 'factoryModel.nodeType.id';
										var id = $('input[name="'+name+'"]').val();
										if(id != null && id != ""){
											var label = $('input[name="factoryModel.nodeType.name"]').parents('td').prev().find('label');
											_callback_factoryModel_nodeType_name_obj = new Object();
											_callback_factoryModel_nodeType_name_obj.id = id;
											label.html("<span class='edit-table-symbol-span' onclick='_opendialog_factoryModel_nodeType_name()'>" + label.attr("value") + "</span>");
										}
									})();
									</#if>
									function _opendialog_factoryModel_nodeType_name(){
										var url = "/MESBasic/nodeType/nodeType/nodeview.action?entityCode=MESBasic_1_nodeType&id="+_callback_factoryModel_nodeType_name_obj.id+"&${getPowerCode('','MESBasic_1_nodeType_nodeview')}";
										if("dialog" == "dialog"){
											var buttons = [];
											buttons.push({
												name:"${getText('foundation.common.closed')}",
												type:"cancel"
											});
											_callback_factoryModel_nodeType_name_Dlg = new CUI.Dialog({
												title: "${getText('MESBasic.viewtitle.randon1460947555763')}",
												url : url,
												modal: true,
												type : '1',
												buttons:buttons
											});
											_callback_factoryModel_nodeType_name_Dlg.show();
										}else{
											openFullScreen(url);
										}
									}
								</script>
								
								<script type="text/javascript">
								<#if !(factoryModel.id)?? && (factoryModel.nodeType.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${factoryModel.nodeType.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryModel_factoryModel_factoryEdit_form',obj, 'factoryModel.nodeType', '/MESBasic/nodeType/nodeType/noderef.action');
												CUI.commonFills('MESBasic_factoryModel_factoryModel_factoryEdit_form', 'factoryModel.nodeType',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489991460442')}" >${getText('MESBasic.propertydisplayName.randon1489991460442')}</label>
				</td>
				
						<#assign factoryModel_area_defaultValue  = ''>
							 							<#assign factoryModel_area_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${factoryModel_area_defaultValue!}" formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="factoryModel.area.id" code="MesArea" value="${(factoryModel.area.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="factoryModel.area.id" code="MesArea" value="${(factoryModel.area.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1490343541888')}" >${getText('MESBasic.propertydisplayName.randon1490343541888')}</label>
				</td>
				
						<#assign factoryModel_emsFlag_defaultValue  = ''>
							 							<#assign factoryModel_emsFlag_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="factoryModel.emsFlag_check" originalvalue="<#if !newObj><#if (factoryModel.emsFlag)??>${(factoryModel.emsFlag!false)?string('true','false')}<#else>false</#if><#elseif factoryModel_emsFlag_defaultValue?has_content>${(factoryModel_emsFlag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (factoryModel.emsFlag)??>${(factoryModel.emsFlag!false)?string('true','false')}<#else>false</#if><#else>${(factoryModel_emsFlag_defaultValue!true)?string}</#if>" onclick='emaChangeFun()' />
								
								<input property_type="BOOLEAN" type="hidden" name="factoryModel.emsFlag" originalvalue="<#if ((factoryModel.emsFlag)?? &&  factoryModel.emsFlag)||(factoryModel_emsFlag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((factoryModel.emsFlag)?? &&  factoryModel.emsFlag)||(factoryModel_emsFlag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="factoryModel.emsFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="factoryModel.emsFlag"]');
												CUI('input[name="factoryModel.emsFlag_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1504574840094')}" >${getText('MESBasic.propertydisplayName.randon1504574840094')}</label>
				</td>
				
						<#assign factoryModel_interfaceUrl_defaultValue  = ''>
							 							<#assign factoryModel_interfaceUrl_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${factoryModel_interfaceUrl_defaultValue!}" formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="factoryModel.interfaceUrl.id" code="serviceUrl" value="${(factoryModel.interfaceUrl.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="factoryModel.interfaceUrl.id" code="serviceUrl" value="${(factoryModel.interfaceUrl.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1532062897594')}" >${getText('MESBasic.propertydisplayName.randon1532062897594')}</label>
				</td>
				
						<#assign factoryModel_isEbr_defaultValue  = ''>
							 							<#assign factoryModel_isEbr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="factoryModel.isEbr_check" originalvalue="<#if !newObj><#if (factoryModel.isEbr)??>${(factoryModel.isEbr!false)?string('true','false')}<#else>false</#if><#elseif factoryModel_isEbr_defaultValue?has_content>${(factoryModel_isEbr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (factoryModel.isEbr)??>${(factoryModel.isEbr!false)?string('true','false')}<#else>false</#if><#else>${(factoryModel_isEbr_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="factoryModel.isEbr" originalvalue="<#if ((factoryModel.isEbr)?? &&  factoryModel.isEbr)||(factoryModel_isEbr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((factoryModel.isEbr)?? &&  factoryModel.isEbr)||(factoryModel_isEbr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="factoryModel.isEbr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="factoryModel.isEbr"]');
												CUI('input[name="factoryModel.isEbr_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('ec.workflow.createdepart')}" >${getText('ec.workflow.createdepart')}</label>
				</td>
				
						<#assign factoryModel_department_name_defaultValue  = ''>
														<#assign factoryModel_department_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.department.reference')}" viewType="${viewType!}" deValue="${factoryModel_department_name_defaultValue!}" conditionfunc="MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc('factoryModel_department_name')"  value="${(factoryModel.department.name)!}" displayFieldName="name" name="factoryModel.department.name" id="factoryModel_department_name" type="Department" url="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" editCustomCallback=";" refViewCode="sysbase_1.0_department_departmentRefCustom" onkeyupfuncname=";_callback_factoryModel_department_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (factoryModel_department_name_defaultValue)=='currentDepart'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.mainPosition.department.id}'};
											obj = foundation.common.getObject('MESBasic_factoryModel_factoryModel_factoryEdit_form',obj, 'factoryModel.department', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
											CUI.commonFills('MESBasic_factoryModel_factoryModel_factoryEdit_form', 'factoryModel.department',obj,true);
											$('input:hidden[name="factoryModel.department.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(factoryModel.id)?? && (factoryModel.department.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${factoryModel.department.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryModel_factoryModel_factoryEdit_form',obj, 'factoryModel.department', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
												CUI.commonFills('MESBasic_factoryModel_factoryModel_factoryEdit_form', 'factoryModel.department',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.201903131354001')}" >${getText('MESBasic.201903131354001')}</label>
				</td>
				
						<#assign factoryModel_endItem_itemName_defaultValue  = ''>
														<#assign factoryModel_endItem_itemName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1417920493220')}" viewType="${viewType!}" deValue="${factoryModel_endItem_itemName_defaultValue!}" conditionfunc="MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc('factoryModel_endItem_itemName')"  value="${(factoryModel.endItem.itemName)!}" displayFieldName="itemName" name="factoryModel.endItem.itemName" id="factoryModel_endItem_itemName" type="other" url="/MESBasic/itemManage/itemSetup/switcherOnlyRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_itemManage_switcherOnlyRef" onkeyupfuncname=";_callback_factoryModel_endItem_itemName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(factoryModel.id)?? && (factoryModel.endItem.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${factoryModel.endItem.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryModel_factoryModel_factoryEdit_form',obj, 'factoryModel.endItem', '/MESBasic/itemManage/itemSetup/switcherOnlyRef.action');
												CUI.commonFills('MESBasic_factoryModel_factoryModel_factoryEdit_form', 'factoryModel.endItem',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion201903070847001')}" >${getText('MESBasic.propertydisplayName.radion201903070847001')}</label>
				</td>
				
						<#assign factoryModel_assignBatchNo_itemName_defaultValue  = ''>
														<#assign factoryModel_assignBatchNo_itemName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1417920493220')}" viewType="${viewType!}" deValue="${factoryModel_assignBatchNo_itemName_defaultValue!}" conditionfunc="MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc('factoryModel_assignBatchNo_itemName')"  value="${(factoryModel.assignBatchNo.itemName)!}" displayFieldName="itemName" name="factoryModel.assignBatchNo.itemName" id="factoryModel_assignBatchNo_itemName" type="other" url="/MESBasic/itemManage/itemSetup/switcherOnlyRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_itemManage_switcherOnlyRef" onkeyupfuncname=";_callback_factoryModel_assignBatchNo_itemName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(factoryModel.id)?? && (factoryModel.assignBatchNo.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${factoryModel.assignBatchNo.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryModel_factoryModel_factoryEdit_form',obj, 'factoryModel.assignBatchNo', '/MESBasic/itemManage/itemSetup/switcherOnlyRef.action');
												CUI.commonFills('MESBasic_factoryModel_factoryModel_factoryEdit_form', 'factoryModel.assignBatchNo',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419233695132')}" >${getText('MESBasic.propertydisplayName.radion1419233695132')}</label>
				</td>
				
						<#assign factoryModel_description_defaultValue  = ''>
							 							<#assign factoryModel_description_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="factoryModel_description" originalvalue="<#if !newObj || (factoryModel.description)?has_content>${(factoryModel.description?html)!}<#else>${factoryModel_description_defaultValue?html}</#if>"  name="factoryModel.description" class="cui-noborder-textarea cui-textarea-auto" style="height:60px;;" ><#if !newObj || (factoryModel.description)?has_content>${(factoryModel.description)!}<#else>${factoryModel_description_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
						<#assign complex_datagrid_1460956815236_defaultValue  = ''>
				<td nullable=false class="edit-table-content"  colspan="6" style="text-align: left;;" >
				</td>
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1553323366950')}" >${getText('MESBasic.propertydisplayName.randon1553323366950')}</label>
				</td>
				
						<#assign factoryModel_workArea_defaultValue  = ''>
							 							<#assign factoryModel_workArea_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="factoryModel.workArea" id="factoryModel_workArea"  style=";" originalvalue="<#if !newObj || (factoryModel.workArea)?has_content>${(factoryModel.workArea?html)!}<#else>${factoryModel_workArea_defaultValue!}</#if>" value="<#if !newObj || (factoryModel.workArea)?has_content>${(factoryModel.workArea?html)!}<#else>${factoryModel_workArea_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1490270091637')}" >${getText('MESBasic.propertydisplayName.randon1490270091637')}</label>
				</td>
				
						<#assign factoryModel_belongLine_defaultValue  = ''>
							 							<#assign factoryModel_belongLine_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="factoryModel.belongLine" id="factoryModel_belongLine"  style=";" originalvalue="<#if !newObj || (factoryModel.belongLine)?has_content>${(factoryModel.belongLine?html)!}<#else>${factoryModel_belongLine_defaultValue!}</#if>" value="<#if !newObj || (factoryModel.belongLine)?has_content>${(factoryModel.belongLine?html)!}<#else>${factoryModel_belongLine_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
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
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1460955592809.action?factoryModel.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460955592809">
			<#else>
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1460955592809.action?factoryModel.id=${(factoryModel.id)!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460955592809">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551947709184')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551947676744')}\",handler:function(event){DT_ObjPostion_dg1460955592809_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551947709184')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1551947676744')}\",handler:function(event){DT_ObjPostion_dg1460955592809_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ObjPostion_dg1460955592809" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1460955592809_id" value="ObjPostion_dg1460955592809" />
			
			<input type="hidden" id="dg1460955592809_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1460950588653')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/factoryModel/factoryModel/data-dg1460955592809.action?operateType=export&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460955592809"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ObjPostion_dg1460955592809" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ObjPostion_dg1460955592809" viewType="${viewType}" renderOverEvent="dg1460955592809RenderOverEvent" route="${routeFlag}" formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" noPermissionKeys="objPos.name,objPos.code,objPos.department.name,objPos.department.fullPathName" modelCode="MESBasic_1_factoryModel_ObjPostion" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1460955592809" dtPage="dgPage"  hidekeyPrefix="dg1460955592809" hidekey="['id','version','objPos.id','objPos.name','objPos.id','objPos.code','objPos.id','objPos.department.name','objPos.id','objPos.department.fullPathName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1460955592809PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1551947709184,ADDROW,add;MESBasic.buttonPropertyshowName.radion1551947676744,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign objPos_name_displayDefaultType=''>
								<#assign objPos_name_defaultValue=''>
										<#assign objPos_name_defaultValue=''>
																	<#if (objPos_name_defaultValue!)?string=="currentUser">
								<#assign objPos_name_defaultValue='${staffJson!}'>
							<#elseif (objPos_name_defaultValue!)?string=="currentPost">
								<#assign objPos_name_defaultValue='${postJson!}'>
							<#elseif (objPos_name_defaultValue!)?string=="currentDepart">
								<#assign objPos_name_defaultValue='${deptJson!}'>
							<#elseif (objPos_name_defaultValue!)?string=="currentComp">
								<#assign objPos_name_defaultValue='${compJson!}'>
							</#if>

										
										
										
										
										

									<@datacolumn key="objPos.name"        showFormat="SELECTCOMP" defaultValue="${(objPos_name_defaultValue!)?string}" defaultDisplay="${(objPos_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/foundation/position/common/positionListFrame.action" viewCode="sysbase_1.0_position_position" mneenable=true crossCompany=false viewTitle="${getText('ec.edit.refPos')}"  label="${getText('foundation.position.name')}" width=120 showFormatFunc="" beforecallback="checkUnique(obj)"  />
							<#assign objPos_code_displayDefaultType=''>
								<#assign objPos_code_defaultValue=''>
										<#assign objPos_code_defaultValue=''>
																	<#if (objPos_code_defaultValue!)?string=="currentUser">
								<#assign objPos_code_defaultValue='${staffJson!}'>
							<#elseif (objPos_code_defaultValue!)?string=="currentPost">
								<#assign objPos_code_defaultValue='${postJson!}'>
							<#elseif (objPos_code_defaultValue!)?string=="currentDepart">
								<#assign objPos_code_defaultValue='${deptJson!}'>
							<#elseif (objPos_code_defaultValue!)?string=="currentComp">
								<#assign objPos_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objPos.code"        showFormat="TEXT" defaultValue="${(objPos_code_defaultValue!)?string}" defaultDisplay="${(objPos_code_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=true   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/foundation/position/common/positionListFrame.action" viewCode="sysbase_1.0_position_position" mneenable=false crossCompany=false viewTitle="${getText('ec.edit.refPos')}"  label="${getText('foundation.position.code')}" width=120 showFormatFunc=""  />
							<#assign objPos_department_name_displayDefaultType=''>
								<#assign objPos_department_name_defaultValue=''>
										<#assign objPos_department_name_defaultValue=''>
																	<#if (objPos_department_name_defaultValue!)?string=="currentUser">
								<#assign objPos_department_name_defaultValue='${staffJson!}'>
							<#elseif (objPos_department_name_defaultValue!)?string=="currentPost">
								<#assign objPos_department_name_defaultValue='${postJson!}'>
							<#elseif (objPos_department_name_defaultValue!)?string=="currentDepart">
								<#assign objPos_department_name_defaultValue='${deptJson!}'>
							<#elseif (objPos_department_name_defaultValue!)?string=="currentComp">
								<#assign objPos_department_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objPos.department.name"        showFormat="TEXT" defaultValue="${(objPos_department_name_defaultValue!)?string}" defaultDisplay="${(objPos_department_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/foundation/position/common/positionListFrame.action" viewCode="sysbase_1.0_position_position" mneenable=false crossCompany=false viewTitle="${getText('ec.edit.refPos')}"  label="${getText('part.fzwdy.xm.mainPositionId.department.name')}" width=120 showFormatFunc=""  />
							<#assign objPos_department_fullPathName_displayDefaultType=''>
								<#assign objPos_department_fullPathName_defaultValue=''>
										<#assign objPos_department_fullPathName_defaultValue=''>
																	<#if (objPos_department_fullPathName_defaultValue!)?string=="currentUser">
								<#assign objPos_department_fullPathName_defaultValue='${staffJson!}'>
							<#elseif (objPos_department_fullPathName_defaultValue!)?string=="currentPost">
								<#assign objPos_department_fullPathName_defaultValue='${postJson!}'>
							<#elseif (objPos_department_fullPathName_defaultValue!)?string=="currentDepart">
								<#assign objPos_department_fullPathName_defaultValue='${deptJson!}'>
							<#elseif (objPos_department_fullPathName_defaultValue!)?string=="currentComp">
								<#assign objPos_department_fullPathName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objPos.department.fullPathName"        showFormat="TEXT" defaultValue="${(objPos_department_fullPathName_defaultValue!)?string}" defaultDisplay="${(objPos_department_fullPathName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/foundation/position/common/positionListFrame.action" viewCode="sysbase_1.0_position_position" mneenable=false crossCompany=false viewTitle="${getText('ec.edit.refPos')}"  label="${getText('foundation.ec.common.fullPathName')}" width=140 showFormatFunc=""  />
			
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
				function ObjPostion_dg1460955592809_check_datagridvalid(){
					//
					var errorObj =ObjPostion_dg1460955592809Widget._DT.testData();
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
				
				function savedg1460955592809DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ObjPostion_dg1460955592809Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ObjPostion_dg1460955592809Widget') > -1) {
						ObjPostion_dg1460955592809Widget.setAllRowEdited();
					}
					var json = ObjPostion_dg1460955592809Widget.parseEditedData();
					$('input[name="dg1460955592809ListJson"]').remove();
					$('input[name="dgLists[\'dg1460955592809\']"]').remove();
					$('input[name="dg1460955592809ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1460955592809\']">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					$('<input type="hidden" name="dg1460955592809ModelCode">').val('MESBasic_1_factoryModel_ObjPostion').appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1460955592809ListJson">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
				}
				function DT_ObjPostion_dg1460955592809_deldatagrid(){
					var deleteRows = ObjPostion_dg1460955592809Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','objPos.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460955592809DeletedIds").length>0){
							$("#dg1460955592809DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460955592809DeletedIds" name="dgDeletedIds[\'dg1460955592809\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460955592809DeletedIds['+CUI('input[name^="dg1460955592809DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
					return deleteRows;
				}
				function DT_ObjPostion_dg1460955592809_delTreeNodes(){
					var deleteRows = ObjPostion_dg1460955592809Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','objPos.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460955592809DeletedIds").length>0){
							$("#dg1460955592809DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460955592809DeletedIds" name="dgDeletedIds[\'dg1460955592809\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460955592809DeletedIds['+CUI('input[name^="dg1460955592809DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<4;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'ObjPostion_dg1460955592809') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ObjPostion_dg1460955592809';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ObjPostion_dg1460955592809';
					}
					$('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids', datagrids);
				});
				
				var ObjPostion_dg1460955592809_importDialog = null;
				function ObjPostion_dg1460955592809_showImportDialog(){
					try{
						if(ObjPostion_dg1460955592809_importDialog!=null&&ObjPostion_dg1460955592809_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/factoryModel/factoryModel/initImport.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1460955592809&tid=${id!}&datagridName=dg1460955592809";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_factoryModel_factoryEditdg1460955592809_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ObjPostion_dg1460955592809_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ObjPostion_dg1460955592809"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ObjPostion_dg1460955592809_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ObjPostion_dg1460955592809_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ObjPostion_dg1460955592809_importDialog.show();
					}catch(e){}
				}	
				
				function ObjPostion_dg1460955592809_downLoadFile(){
					var url = "/MESBasic/factoryModel/factoryModel/downLoad.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1460955592809&templateRelatedModelCode=MESBasic_1_factoryModel_factoryEditdg1460955592809&downloadType=template&fileName=dg1460955592809";
					window.open(url,"","");
				}
				function dg1460955592809RenderOverEvent(){
				}
				function dg1460955592809PageInitMethod(nTabIndex){
					MESBasic.factoryModel.factoryModel.factoryEdit.initSize(nTabIndex);
				}
			</script>
			
			

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
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1490261761014.action?factoryModel.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1490261761014">
			<#else>
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1490261761014.action?factoryModel.id=${(factoryModel.id)!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1490261761014">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1554255610109')}\",handler:function(event){DT_ObjTeam_dg1490261761014_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1554255610109')}\",handler:function(event){DT_ObjTeam_dg1490261761014_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ObjTeam_dg1490261761014" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1490261761014_id" value="ObjTeam_dg1490261761014" />
			
			<input type="hidden" id="dg1490261761014_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1490261243605')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/factoryModel/factoryModel/data-dg1490261761014.action?operateType=export&datagridCode=MESBasic_1_factoryModel_factoryEditdg1490261761014"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ObjTeam_dg1490261761014" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ObjTeam_dg1490261761014" viewType="${viewType}" renderOverEvent="dg1490261761014RenderOverEvent" route="${routeFlag}" formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" noPermissionKeys="objTeam.name,objTeam.code,objTeam.dept.name,objTeam.principal.name" modelCode="MESBasic_1_factoryModel_ObjTeam" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1490261761014" dtPage="dgPage"  hidekeyPrefix="dg1490261761014" hidekey="['id','version','objTeam.id','objTeam.name','objTeam.id','objTeam.code','objTeam.id','objTeam.dept.name','objTeam.id','objTeam.principal.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1490261761014PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1554255610109,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign objTeam_name_displayDefaultType=''>
								<#assign objTeam_name_defaultValue=''>
										<#assign objTeam_name_defaultValue=''>
																	<#if (objTeam_name_defaultValue!)?string=="currentUser">
								<#assign objTeam_name_defaultValue='${staffJson!}'>
							<#elseif (objTeam_name_defaultValue!)?string=="currentPost">
								<#assign objTeam_name_defaultValue='${postJson!}'>
							<#elseif (objTeam_name_defaultValue!)?string=="currentDepart">
								<#assign objTeam_name_defaultValue='${deptJson!}'>
							<#elseif (objTeam_name_defaultValue!)?string=="currentComp">
								<#assign objTeam_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objTeam.name"        showFormat="SELECTCOMP" defaultValue="${(objTeam_name_defaultValue!)?string}" defaultDisplay="${(objTeam_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/X6Basic/teamManage/teamInfo/ref.action" viewCode="X6Basic_1.0_teamManage_ref" mneenable=false crossCompany=false viewTitle="${getText('X6Basic.viewtitle.radion1398316764087')}"  label="${getText('X6Basic.propertydisplayName.radion1398303611599')}" width=100 showFormatFunc=""  />
							<#assign objTeam_code_displayDefaultType=''>
								<#assign objTeam_code_defaultValue=''>
										<#assign objTeam_code_defaultValue=''>
																	<#if (objTeam_code_defaultValue!)?string=="currentUser">
								<#assign objTeam_code_defaultValue='${staffJson!}'>
							<#elseif (objTeam_code_defaultValue!)?string=="currentPost">
								<#assign objTeam_code_defaultValue='${postJson!}'>
							<#elseif (objTeam_code_defaultValue!)?string=="currentDepart">
								<#assign objTeam_code_defaultValue='${deptJson!}'>
							<#elseif (objTeam_code_defaultValue!)?string=="currentComp">
								<#assign objTeam_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objTeam.code"        showFormat="TEXT" defaultValue="${(objTeam_code_defaultValue!)?string}" defaultDisplay="${(objTeam_code_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/X6Basic/teamManage/teamInfo/ref.action" viewCode="X6Basic_1.0_teamManage_ref" mneenable=false crossCompany=false viewTitle="${getText('X6Basic.viewtitle.radion1398316764087')}"  label="${getText('X6Basic.propertydisplayName.radion1398303581302')}" width=100 showFormatFunc=""  />
							<#assign objTeam_dept_name_displayDefaultType=''>
								<#assign objTeam_dept_name_defaultValue=''>
										<#assign objTeam_dept_name_defaultValue=''>
																	<#if (objTeam_dept_name_defaultValue!)?string=="currentUser">
								<#assign objTeam_dept_name_defaultValue='${staffJson!}'>
							<#elseif (objTeam_dept_name_defaultValue!)?string=="currentPost">
								<#assign objTeam_dept_name_defaultValue='${postJson!}'>
							<#elseif (objTeam_dept_name_defaultValue!)?string=="currentDepart">
								<#assign objTeam_dept_name_defaultValue='${deptJson!}'>
							<#elseif (objTeam_dept_name_defaultValue!)?string=="currentComp">
								<#assign objTeam_dept_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objTeam.dept.name"        showFormat="TEXT" defaultValue="${(objTeam_dept_name_defaultValue!)?string}" defaultDisplay="${(objTeam_dept_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/X6Basic/teamManage/teamInfo/ref.action" viewCode="X6Basic_1.0_teamManage_ref" mneenable=false crossCompany=false viewTitle="${getText('X6Basic.viewtitle.radion1398316764087')}"  label="${getText('part.fzwdy.xm.mainPositionId.department.name')}" width=100 showFormatFunc=""  />
							<#assign objTeam_principal_name_displayDefaultType=''>
								<#assign objTeam_principal_name_defaultValue=''>
										<#assign objTeam_principal_name_defaultValue=''>
																	<#if (objTeam_principal_name_defaultValue!)?string=="currentUser">
								<#assign objTeam_principal_name_defaultValue='${staffJson!}'>
							<#elseif (objTeam_principal_name_defaultValue!)?string=="currentPost">
								<#assign objTeam_principal_name_defaultValue='${postJson!}'>
							<#elseif (objTeam_principal_name_defaultValue!)?string=="currentDepart">
								<#assign objTeam_principal_name_defaultValue='${deptJson!}'>
							<#elseif (objTeam_principal_name_defaultValue!)?string=="currentComp">
								<#assign objTeam_principal_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objTeam.principal.name"        showFormat="TEXT" defaultValue="${(objTeam_principal_name_defaultValue!)?string}" defaultDisplay="${(objTeam_principal_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/X6Basic/teamManage/teamInfo/ref.action" viewCode="X6Basic_1.0_teamManage_ref" mneenable=false crossCompany=false viewTitle="${getText('X6Basic.viewtitle.radion1398316764087')}"  label="${getText('foundation.staff.dimissionStaff_xls.staffName')}" width=100 showFormatFunc=""  />
			
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
				function ObjTeam_dg1490261761014_check_datagridvalid(){
					//
					var errorObj =ObjTeam_dg1490261761014Widget._DT.testData();
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
				
				function savedg1490261761014DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ObjTeam_dg1490261761014Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ObjTeam_dg1490261761014Widget') > -1) {
						ObjTeam_dg1490261761014Widget.setAllRowEdited();
					}
					var json = ObjTeam_dg1490261761014Widget.parseEditedData();
					$('input[name="dg1490261761014ListJson"]').remove();
					$('input[name="dgLists[\'dg1490261761014\']"]').remove();
					$('input[name="dg1490261761014ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1490261761014\']">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					$('<input type="hidden" name="dg1490261761014ModelCode">').val('MESBasic_1_factoryModel_ObjTeam').appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1490261761014ListJson">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
				}
				function DT_ObjTeam_dg1490261761014_deldatagrid(){
					var deleteRows = ObjTeam_dg1490261761014Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','objTeam.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490261761014DeletedIds").length>0){
							$("#dg1490261761014DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490261761014DeletedIds" name="dgDeletedIds[\'dg1490261761014\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490261761014DeletedIds['+CUI('input[name^="dg1490261761014DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
					return deleteRows;
				}
				function DT_ObjTeam_dg1490261761014_delTreeNodes(){
					var deleteRows = ObjTeam_dg1490261761014Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','objTeam.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490261761014DeletedIds").length>0){
							$("#dg1490261761014DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490261761014DeletedIds" name="dgDeletedIds[\'dg1490261761014\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490261761014DeletedIds['+CUI('input[name^="dg1490261761014DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<4;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[1].length>0) {
						for(var i=0;i<datagrids[1].length;i++) {
							if(datagrids[1][i] == 'ObjTeam_dg1490261761014') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'ObjTeam_dg1490261761014';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'ObjTeam_dg1490261761014';
					}
					$('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids', datagrids);
				});
				
				var ObjTeam_dg1490261761014_importDialog = null;
				function ObjTeam_dg1490261761014_showImportDialog(){
					try{
						if(ObjTeam_dg1490261761014_importDialog!=null&&ObjTeam_dg1490261761014_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/factoryModel/factoryModel/initImport.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1490261761014&tid=${id!}&datagridName=dg1490261761014";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_factoryModel_factoryEditdg1490261761014_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ObjTeam_dg1490261761014_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ObjTeam_dg1490261761014"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ObjTeam_dg1490261761014_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ObjTeam_dg1490261761014_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ObjTeam_dg1490261761014_importDialog.show();
					}catch(e){}
				}	
				
				function ObjTeam_dg1490261761014_downLoadFile(){
					var url = "/MESBasic/factoryModel/factoryModel/downLoad.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1490261761014&templateRelatedModelCode=MESBasic_1_factoryModel_factoryEditdg1490261761014&downloadType=template&fileName=dg1490261761014";
					window.open(url,"","");
				}
				function dg1490261761014RenderOverEvent(){
				}
				function dg1490261761014PageInitMethod(nTabIndex){
					MESBasic.factoryModel.factoryModel.factoryEdit.initSize(nTabIndex);
				}
			</script>
			
			
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
			
							<script type="text/javascript">
								function ObjEquipment_dg1460958585675_EquipAddRow(event)
																{
	var AddRow = ObjEquipment_dg1460958585675Widget._DT.addNewRow();
	var nRow = AddRow.rowIndex;
	var DepartmentName = $("input[name='factoryModel.department.name']").val();
	//【部门】字段不可编辑，从常规信息的部门自动带出
	ObjEquipment_dg1460958585675Widget.setCellValue(nRow,"objDepartment.name",DepartmentName);
	//【设备位号】字段不可编辑，是否可编辑依赖于【固定安装】字段
	ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"equipmentNum","readonly",true);
	//【是否容器】字段不可编辑
	ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"isContainer","readonly",true);
	//【清空类型】字段不可编辑
	ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"clearType.id","readonly",true);
	//【清空位号】字段不可编辑
	ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"clearItem.itemName","readonly",true);
	
	if(!BatchModeState){
		$("td[key='clearType.id']").hide();
		$("td[key='clearItem.itemName']").hide();
	}
}
							</script>
								
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1460958585675.action?factoryModel.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958585675">
			<#else>
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1460958585675.action?factoryModel.id=${(factoryModel.id)!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958585675">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1552006043276')}\",handler:function(event){ObjEquipment_dg1460958585675_EquipAddRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.randon1559722129815.flag')}\",handler:function(event){DT_ObjEquipment_dg1460958585675_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1552006043276')}\",handler:function(event){ObjEquipment_dg1460958585675_EquipAddRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.randon1559722129815.flag')}\",handler:function(event){DT_ObjEquipment_dg1460958585675_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ObjEquipment_dg1460958585675" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1460958585675_id" value="ObjEquipment_dg1460958585675" />
			
			<input type="hidden" id="dg1460958585675_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1460950269640')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/factoryModel/factoryModel/data-dg1460958585675.action?operateType=export&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958585675"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ObjEquipment_dg1460958585675" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ObjEquipment_dg1460958585675" viewType="${viewType}" renderOverEvent="dg1460958585675RenderOverEvent" route="${routeFlag}" formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" noPermissionKeys="objDepartment.name,isFixed,equipmentNum,objEqu.name,equipmentType,isContainer,clearType,clearItem.itemName" modelCode="MESBasic_1_factoryModel_ObjEquipment" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1460958585675" dtPage="dgPage"  hidekeyPrefix="dg1460958585675" hidekey="['id','version','objDepartment.id','objDepartment.name','objEqu.id','objEqu.name','clearItem.id','clearItem.itemName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=2 pageInitMethod="dg1460958585675PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1552006043276,EquipAddRow,add;MESBasic.buttonPropertyshowName.randon1559722129815.flag,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign objDepartment_name_displayDefaultType=''>
								<#assign objDepartment_name_defaultValue=''>
										<#assign objDepartment_name_defaultValue=''>
																	<#if (objDepartment_name_defaultValue!)?string=="currentUser">
								<#assign objDepartment_name_defaultValue='${staffJson!}'>
							<#elseif (objDepartment_name_defaultValue!)?string=="currentPost">
								<#assign objDepartment_name_defaultValue='${postJson!}'>
							<#elseif (objDepartment_name_defaultValue!)?string=="currentDepart">
								<#assign objDepartment_name_defaultValue='${deptJson!}'>
							<#elseif (objDepartment_name_defaultValue!)?string=="currentComp">
								<#assign objDepartment_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objDepartment.name"        showFormat="SELECTCOMP" defaultValue="${(objDepartment_name_defaultValue!)?string}" defaultDisplay="${(objDepartment_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left" hiddenCol=true viewUrl="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" viewCode="sysbase_1.0_department_departmentRefCustom" mneenable=false crossCompany=false viewTitle="${getText('foundation.ec.entity.department.reference')}"  label="${getText('MESBasic.part.fzwdy.xm.mainPositionId.department.name')}" width=100 showFormatFunc=""  />
							<#assign isFixed_displayDefaultType=''>
								<#assign isFixed_defaultValue=''>
										<#assign isFixed_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="isFixed"        showFormat="CHECKBOX" defaultValue="${(isFixed_defaultValue!)?string}" defaultDisplay="${(isFixed_displayDefaultType!)?string}" onchange="ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'ChangeisFixed()')" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1551872577107')}" width=100 showFormatFunc=""  />
							<#assign equipmentNum_displayDefaultType=''>
								<#assign equipmentNum_defaultValue=''>
										<#assign equipmentNum_defaultValue=''>
										  
									<@datacolumn key="equipmentNum"        showFormat="TEXT" defaultValue="${(equipmentNum_defaultValue!)?string}" defaultDisplay="${(equipmentNum_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1551872782825')}" width=100 showFormatFunc=""  />
							<#assign objEqu_name_displayDefaultType=''>
								<#assign objEqu_name_defaultValue=''>
										<#assign objEqu_name_defaultValue=''>
																	<#if (objEqu_name_defaultValue!)?string=="currentUser">
								<#assign objEqu_name_defaultValue='${staffJson!}'>
							<#elseif (objEqu_name_defaultValue!)?string=="currentPost">
								<#assign objEqu_name_defaultValue='${postJson!}'>
							<#elseif (objEqu_name_defaultValue!)?string=="currentDepart">
								<#assign objEqu_name_defaultValue='${deptJson!}'>
							<#elseif (objEqu_name_defaultValue!)?string=="currentComp">
								<#assign objEqu_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objEqu.name"        showFormat="SELECTCOMP" defaultValue="${(objEqu_name_defaultValue!)?string}" defaultDisplay="${(objEqu_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/MESBasic/equipManage/equipment/ref.action" viewCode="MESBasic_1_equipManage_ref" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  label="${getText('MESBasic.propertydisplayName.randon1423967231438')}" width=120 showFormatFunc=""  />
							<#assign equipmentType_displayDefaultType=''>
								<#assign equipmentType_defaultValue=''>
										<#assign equipmentType_defaultValue=''>
										 
									<@systemCodeColumn code="MESEquipmentType" textalign="center" defaultValue="${(equipmentType_defaultValue!)?string}" key="equipmentType.id" editable=true type="selectcomp" notnull=false    onchange="ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'ChooseSysCode(nRow)')"  label="${getText('MESBasic.propertydisplayName.randon1556022564127')}" width=100   />
							<#assign isContainer_displayDefaultType=''>
								<#assign isContainer_defaultValue=''>
										<#assign isContainer_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="isContainer"        showFormat="CHECKBOX" defaultValue="${(isContainer_defaultValue!)?string}" defaultDisplay="${(isContainer_displayDefaultType!)?string}" onchange="ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'isFixedChange()')" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1551874713234')}" width=100 showFormatFunc=""  />
							<#assign clearType_displayDefaultType=''>
								<#assign clearType_defaultValue=''>
										<#assign clearType_defaultValue=''>
										 
									<@systemCodeColumn code="MESClearSignat" textalign="center" defaultValue="${(clearType_defaultValue!)?string}" key="clearType.id" editable=true type="selectcomp" notnull=false    onchange="ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'ClearTypeChange(nRow)')"  label="${getText('MESBasic.propertydisplayName.randon1551874573019')}" width=100   />
							<#assign clearItem_itemName_displayDefaultType=''>
								<#assign clearItem_itemName_defaultValue=''>
										<#assign clearItem_itemName_defaultValue=''>
																	<#if (clearItem_itemName_defaultValue!)?string=="currentUser">
								<#assign clearItem_itemName_defaultValue='${staffJson!}'>
							<#elseif (clearItem_itemName_defaultValue!)?string=="currentPost">
								<#assign clearItem_itemName_defaultValue='${postJson!}'>
							<#elseif (clearItem_itemName_defaultValue!)?string=="currentDepart">
								<#assign clearItem_itemName_defaultValue='${deptJson!}'>
							<#elseif (clearItem_itemName_defaultValue!)?string=="currentComp">
								<#assign clearItem_itemName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="clearItem.itemName"        showFormat="SELECTCOMP" defaultValue="${(clearItem_itemName_defaultValue!)?string}" defaultDisplay="${(clearItem_itemName_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemSelfList.action" viewCode="MESBasic_1_itemManage_itemSelfList" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1421223012419')}"  label="${getText('MESBasic.201903131941001')}" width=100 showFormatFunc=""  />
			
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
				function ObjEquipment_dg1460958585675_check_datagridvalid(){
					//
					var errorObj =ObjEquipment_dg1460958585675Widget._DT.testData();
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
				
				function savedg1460958585675DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ObjEquipment_dg1460958585675Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ObjEquipment_dg1460958585675Widget') > -1) {
						ObjEquipment_dg1460958585675Widget.setAllRowEdited();
					}
					var json = ObjEquipment_dg1460958585675Widget.parseEditedData();
					$('input[name="dg1460958585675ListJson"]').remove();
					$('input[name="dgLists[\'dg1460958585675\']"]').remove();
					$('input[name="dg1460958585675ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1460958585675\']">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					$('<input type="hidden" name="dg1460958585675ModelCode">').val('MESBasic_1_factoryModel_ObjEquipment').appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1460958585675ListJson">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
				}
				function DT_ObjEquipment_dg1460958585675_deldatagrid(){
					var deleteRows = ObjEquipment_dg1460958585675Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','objEqu.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460958585675DeletedIds").length>0){
							$("#dg1460958585675DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460958585675DeletedIds" name="dgDeletedIds[\'dg1460958585675\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460958585675DeletedIds['+CUI('input[name^="dg1460958585675DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
					return deleteRows;
				}
				function DT_ObjEquipment_dg1460958585675_delTreeNodes(){
					var deleteRows = ObjEquipment_dg1460958585675Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','objEqu.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460958585675DeletedIds").length>0){
							$("#dg1460958585675DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460958585675DeletedIds" name="dgDeletedIds[\'dg1460958585675\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460958585675DeletedIds['+CUI('input[name^="dg1460958585675DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<4;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[2].length>0) {
						for(var i=0;i<datagrids[2].length;i++) {
							if(datagrids[2][i] == 'ObjEquipment_dg1460958585675') {
								break;
							}
							if(i==datagrids[2].length-1) {
								datagrids[2][datagrids[2].length] = 'ObjEquipment_dg1460958585675';
							}
						}
					} else {
						datagrids[2][datagrids[2].length] = 'ObjEquipment_dg1460958585675';
					}
					$('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids', datagrids);
				});
				
				var ObjEquipment_dg1460958585675_importDialog = null;
				function ObjEquipment_dg1460958585675_showImportDialog(){
					try{
						if(ObjEquipment_dg1460958585675_importDialog!=null&&ObjEquipment_dg1460958585675_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/factoryModel/factoryModel/initImport.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958585675&tid=${id!}&datagridName=dg1460958585675";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_factoryModel_factoryEditdg1460958585675_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ObjEquipment_dg1460958585675_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ObjEquipment_dg1460958585675"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ObjEquipment_dg1460958585675_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ObjEquipment_dg1460958585675_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ObjEquipment_dg1460958585675_importDialog.show();
					}catch(e){}
				}	
				
				function ObjEquipment_dg1460958585675_downLoadFile(){
					var url = "/MESBasic/factoryModel/factoryModel/downLoad.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958585675&templateRelatedModelCode=MESBasic_1_factoryModel_factoryEditdg1460958585675&downloadType=template&fileName=dg1460958585675";
					window.open(url,"","");
				}
				function dg1460958585675RenderOverEvent(){
					//未上载批次模块，【清空类型】&【清空位号字段不显示】
if(!BatchModeState){
	$("td[key='clearType.id']").hide();
	$("td[key='clearItem.itemName']").hide();
}
//加载设备PT时，将部门名称带过来
var departName = $("input[name='factoryModel.department.name']").val();

for(var i = 0;i < ObjEquipment_dg1460958585675Widget.getRowLength();i++){
	ObjEquipment_dg1460958585675Widget.setCellValue(i,"objDepartment.name",departName);
	
	//当字段“是否容器”字段被选中时，清空类型清空位号可以编辑
	var isContainer = Boolean(ObjEquipment_dg1460958585675Widget.getCellValue(i,"isContainer"));
	if(isContainer == true){
	}else{
		//【是否容器】字段不可编辑，【清空类型】字段不可编辑，【清空位号】不可编辑
		//ObjEquipment_dg1460958585675Widget.setCellProperty(i,"isContainer","readonly",'true');
		ObjEquipment_dg1460958585675Widget.setCellProperty(i,"clearType.id","readonly",true);
		ObjEquipment_dg1460958585675Widget.setCellProperty(i,"clearItem.itemName","readonly",true);
	}
	
	//当字段“固定安装”字段被选中时，设备位号可编辑，否则设备位号不可编辑
	var isFixed = Boolean(ObjEquipment_dg1460958585675Widget.getCellValue(i,"isFixed"));
	//console.log(i + ":" + isFixed);
	if(isFixed == true){
		ObjEquipment_dg1460958585675Widget.setCellProperty(i,"equipmentNum","readonly",false);
	}else{
		ObjEquipment_dg1460958585675Widget.setCellProperty(i,"equipmentNum","readonly",true);
	}
}
				}
				function dg1460958585675PageInitMethod(nTabIndex){
					MESBasic.factoryModel.factoryModel.factoryEdit.initSize(nTabIndex);
				}
			</script>
			
			
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
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1460958766002.action?factoryModel.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958766002">
			<#else>
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1460958766002.action?factoryModel.id=${(factoryModel.id)!-1}&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958766002">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1554255620982')}\",handler:function(event){DT_ObjProduct_dg1460958766002_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1554255620982')}\",handler:function(event){DT_ObjProduct_dg1460958766002_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ObjProduct_dg1460958766002" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1460958766002_id" value="ObjProduct_dg1460958766002" />
			
			<input type="hidden" id="dg1460958766002_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1460950716828')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/factoryModel/factoryModel/data-dg1460958766002.action?operateType=export&datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958766002"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ObjProduct_dg1460958766002" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ObjProduct_dg1460958766002" viewType="${viewType}" renderOverEvent="dg1460958766002RenderOverEvent" route="${routeFlag}" formId="MESBasic_factoryModel_factoryModel_factoryEdit_form" noPermissionKeys="objProduct.productName,objProduct.productCode,objProduct.productSpecif,emsFlag" modelCode="MESBasic_1_factoryModel_ObjProduct" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1460958766002" dtPage="dgPage"  hidekeyPrefix="dg1460958766002" hidekey="['id','version','objProduct.id','objProduct.productName','objProduct.id','objProduct.productCode','objProduct.id','objProduct.productSpecif'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=3 pageInitMethod="dg1460958766002PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1554255620982,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign objProduct_productName_displayDefaultType=''>
								<#assign objProduct_productName_defaultValue=''>
										<#assign objProduct_productName_defaultValue=''>
																	<#if (objProduct_productName_defaultValue!)?string=="currentUser">
								<#assign objProduct_productName_defaultValue='${staffJson!}'>
							<#elseif (objProduct_productName_defaultValue!)?string=="currentPost">
								<#assign objProduct_productName_defaultValue='${postJson!}'>
							<#elseif (objProduct_productName_defaultValue!)?string=="currentDepart">
								<#assign objProduct_productName_defaultValue='${deptJson!}'>
							<#elseif (objProduct_productName_defaultValue!)?string=="currentComp">
								<#assign objProduct_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objProduct.productName"        showFormat="SELECTCOMP" defaultValue="${(objProduct_productName_defaultValue!)?string}" defaultDisplay="${(objProduct_productName_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRef.action" viewCode="MESBasic_1_product_productRef" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1415773613713')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=140 showFormatFunc=""  />
							<#assign objProduct_productCode_displayDefaultType=''>
								<#assign objProduct_productCode_defaultValue=''>
										<#assign objProduct_productCode_defaultValue=''>
																	<#if (objProduct_productCode_defaultValue!)?string=="currentUser">
								<#assign objProduct_productCode_defaultValue='${staffJson!}'>
							<#elseif (objProduct_productCode_defaultValue!)?string=="currentPost">
								<#assign objProduct_productCode_defaultValue='${postJson!}'>
							<#elseif (objProduct_productCode_defaultValue!)?string=="currentDepart">
								<#assign objProduct_productCode_defaultValue='${deptJson!}'>
							<#elseif (objProduct_productCode_defaultValue!)?string=="currentComp">
								<#assign objProduct_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objProduct.productCode"        showFormat="TEXT" defaultValue="${(objProduct_productCode_defaultValue!)?string}" defaultDisplay="${(objProduct_productCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=true   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/MESBasic/product/product/ref.action" viewCode="MESBasic_1_product_ref" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=140 showFormatFunc=""  />
							<#assign objProduct_productSpecif_displayDefaultType=''>
								<#assign objProduct_productSpecif_defaultValue=''>
										<#assign objProduct_productSpecif_defaultValue=''>
																	<#if (objProduct_productSpecif_defaultValue!)?string=="currentUser">
								<#assign objProduct_productSpecif_defaultValue='${staffJson!}'>
							<#elseif (objProduct_productSpecif_defaultValue!)?string=="currentPost">
								<#assign objProduct_productSpecif_defaultValue='${postJson!}'>
							<#elseif (objProduct_productSpecif_defaultValue!)?string=="currentDepart">
								<#assign objProduct_productSpecif_defaultValue='${deptJson!}'>
							<#elseif (objProduct_productSpecif_defaultValue!)?string=="currentComp">
								<#assign objProduct_productSpecif_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="objProduct.productSpecif"        showFormat="TEXT" defaultValue="${(objProduct_productSpecif_defaultValue!)?string}" defaultDisplay="${(objProduct_productSpecif_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.factoryEdit"  textalign="left"  viewUrl="/MESBasic/product/product/ref.action" viewCode="MESBasic_1_product_ref" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" width=100 showFormatFunc=""  />
							<#assign emsFlag_displayDefaultType=''>
								<#assign emsFlag_defaultValue=''>
										<#assign emsFlag_defaultValue=''>
										  
									<@datacolumn key="emsFlag"        showFormat="CHECKBOX" defaultValue="${(emsFlag_defaultValue!)?string}" defaultDisplay="${(emsFlag_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1490343661648')}" width=100 showFormatFunc=""  />
			
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
				function ObjProduct_dg1460958766002_check_datagridvalid(){
					//
					var errorObj =ObjProduct_dg1460958766002Widget._DT.testData();
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
				
				function savedg1460958766002DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ObjProduct_dg1460958766002Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ObjProduct_dg1460958766002Widget') > -1) {
						ObjProduct_dg1460958766002Widget.setAllRowEdited();
					}
					var json = ObjProduct_dg1460958766002Widget.parseEditedData();
					$('input[name="dg1460958766002ListJson"]').remove();
					$('input[name="dgLists[\'dg1460958766002\']"]').remove();
					$('input[name="dg1460958766002ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1460958766002\']">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					$('<input type="hidden" name="dg1460958766002ModelCode">').val('MESBasic_1_factoryModel_ObjProduct').appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1460958766002ListJson">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
				}
				function DT_ObjProduct_dg1460958766002_deldatagrid(){
					var deleteRows = ObjProduct_dg1460958766002Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','objProduct.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460958766002DeletedIds").length>0){
							$("#dg1460958766002DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460958766002DeletedIds" name="dgDeletedIds[\'dg1460958766002\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460958766002DeletedIds['+CUI('input[name^="dg1460958766002DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
					return deleteRows;
				}
				function DT_ObjProduct_dg1460958766002_delTreeNodes(){
					var deleteRows = ObjProduct_dg1460958766002Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','objProduct.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1460958766002DeletedIds").length>0){
							$("#dg1460958766002DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1460958766002DeletedIds" name="dgDeletedIds[\'dg1460958766002\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1460958766002DeletedIds['+CUI('input[name^="dg1460958766002DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<4;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[3].length>0) {
						for(var i=0;i<datagrids[3].length;i++) {
							if(datagrids[3][i] == 'ObjProduct_dg1460958766002') {
								break;
							}
							if(i==datagrids[3].length-1) {
								datagrids[3][datagrids[3].length] = 'ObjProduct_dg1460958766002';
							}
						}
					} else {
						datagrids[3][datagrids[3].length] = 'ObjProduct_dg1460958766002';
					}
					$('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids', datagrids);
				});
				
				var ObjProduct_dg1460958766002_importDialog = null;
				function ObjProduct_dg1460958766002_showImportDialog(){
					try{
						if(ObjProduct_dg1460958766002_importDialog!=null&&ObjProduct_dg1460958766002_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/factoryModel/factoryModel/initImport.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958766002&tid=${id!}&datagridName=dg1460958766002";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_factoryModel_factoryEditdg1460958766002_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ObjProduct_dg1460958766002_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ObjProduct_dg1460958766002"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ObjProduct_dg1460958766002_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ObjProduct_dg1460958766002_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ObjProduct_dg1460958766002_importDialog.show();
					}catch(e){}
				}	
				
				function ObjProduct_dg1460958766002_downLoadFile(){
					var url = "/MESBasic/factoryModel/factoryModel/downLoad.action?datagridCode=MESBasic_1_factoryModel_factoryEditdg1460958766002&templateRelatedModelCode=MESBasic_1_factoryModel_factoryEditdg1460958766002&downloadType=template&fileName=dg1460958766002";
					window.open(url,"","");
				}
				function dg1460958766002RenderOverEvent(){
				}
				function dg1460958766002PageInitMethod(nTabIndex){
					MESBasic.factoryModel.factoryModel.factoryEdit.initSize(nTabIndex);
					ObjProduct_dg1460958766002Widget._DT.configs.checkEditCondition = function( key, nRow){  
	
	if(key=="emsFlag"){
		var allEmsFlag=CUI("input[name='factoryModel.emsFlag_check']").prop("checked");
		var proCode = ObjProduct_dg1460958766002Widget.getCellValue(nRow,'objProduct.productCode');
		if(proCode==''||proCode.lengh==0){
			CUI.Dialog.alert("${getText("MESBasic.emaFlag.shouldHavePro")}");
			return false;
		}
		if(allEmsFlag==true){
				return true;
		}else{
			CUI.Dialog.alert("${getText("MESBasic.emaFlag.mess")}");
			return false;
		}
	}else{
		return true;
	}
}
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
     	
		<div id="MESBasic_factoryModel_factoryModel_factoryEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.factoryModel.factoryModel.factoryEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_factoryEdit,html,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) -->
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
						$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.factoryModel.factoryModel.factoryEdit.initCount = 0;
			MESBasic.factoryModel.factoryModel.factoryEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-head").height()-$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_factoryModel_factoryModel_factoryEdit_datagrids');
				var padding_bottom=16;
				$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .pd_bottom,#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.factoryModel.factoryModel.factoryEdit.initCount <= 2) {
										setTimeout(function(){MESBasic.factoryModel.factoryModel.factoryEdit.initSize();}, 200);
										MESBasic.factoryModel.factoryModel.factoryEdit.initCount++;
									}/* else {
										MESBasic.factoryModel.factoryModel.factoryEdit.initCount = 0;
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
							if(($("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-workflow").length > 0) && ($("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_factoryModel_factoryModel_factoryEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.factoryModel.factoryModel.factoryEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.factoryModel.factoryModel.factoryEdit.initSize();
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
						if(parseInt($("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width"),10)==650){
							$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.factoryModel.factoryModel.factoryEdit.resizeLayout();
						//MESBasic.factoryModel.factoryModel.factoryEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width"),10)==800){
							$("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.factoryModel.factoryModel.factoryEdit.resizeLayout();
						//MESBasic.factoryModel.factoryModel.factoryEdit.initSize();
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
					MESBasic.factoryModel.factoryModel.factoryEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.factoryModel.factoryModel.factoryEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.factoryModel.factoryModel.factoryEdit.initSize();});
				/*
				MESBasic.factoryModel.factoryModel.factoryEdit.resizeLayout=function(){
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

		MESBasic.factoryModel.factoryModel.factoryEdit.validate = function(){
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
		MESBasic.factoryModel.factoryModel.factoryEdit.beforeSaveProcess = function(){
			try{eval("savedg1460955592809DataGrid()");}catch(e){}
			try{eval("savedg1460958766002DataGrid()");}catch(e){}
			try{eval("savedg1460958585675DataGrid()");}catch(e){}
			try{eval("savedg1490261761014DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#MESBasic_factoryModel_factoryModel_factoryEdit_form').trigger('beforeSubmit');
			//factoryModel.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="factoryModel.extraCol"]').val(extraCol);
		}
		MESBasic.factoryModel.factoryModel.factoryEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#MESBasic_factoryModel_factoryModel_factoryEdit_form').append(ObjPostion_dg1460955592809Widget._DT.createInputs('dg1460955592809List'));
										</#if>
										<#if false && isIE>
										$('#MESBasic_factoryModel_factoryModel_factoryEdit_form').append(ObjTeam_dg1490261761014Widget._DT.createInputs('dg1490261761014List'));
										</#if>
										<#if false && isIE>
										$('#MESBasic_factoryModel_factoryModel_factoryEdit_form').append(ObjEquipment_dg1460958585675Widget._DT.createInputs('dg1460958585675List'));
										</#if>
										<#if false && isIE>
										$('#MESBasic_factoryModel_factoryModel_factoryEdit_form').append(ObjProduct_dg1460958766002Widget._DT.createInputs('dg1460958766002List'));
										</#if>
		};
		MESBasic.factoryModel.factoryModel.factoryEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.factoryModel.factoryModel.factoryEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.factoryModel.factoryModel.factoryEdit.beforeSaveProcess();

			//MESBasic.factoryModel.factoryModel.factoryEdit.processDataGrid();
			$('#MESBasic_factoryModel_factoryModel_factoryEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_factoryModel_factoryModel_factoryEdit_form','MESBasic_factoryModel_factoryModel_factoryEdit_datagrids')) {      
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
		MESBasic.factoryModel.factoryModel.factoryEdit.print = function(){
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
		
		MESBasic.factoryModel.factoryModel.factoryEdit.saveSetting = function(){
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
		
		MESBasic.factoryModel.factoryModel.factoryEdit.printSetting = function(){
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
				MESBasic.factoryModel.factoryModel.factoryEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.factoryModel.factoryModel.factoryEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.factoryModel.factoryModel.factoryEdit.settingDialog.show();
			}
		}
		
		
		MESBasic.factoryModel.factoryModel.factoryEdit._callBackInfo = function(res){
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
 						window.opener.MESBasic.factoryModel.factoryModel.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.factoryModel.factoryModel.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode_IE = viewCode;
			} else {
				MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode_IE = '';
			}
			MESBasic.factoryModel.factoryModel.factoryEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.factoryModel.factoryModel.factoryEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.factoryModel.factoryModel.factoryEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.factoryModel.factoryModel.factoryEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.factoryModel.factoryModel.factoryEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.factoryModel.factoryModel.factoryEdit.gridEventObj = gridEventObj;
				callbackName = "MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.factoryModel.factoryModel.factoryEdit.getMultiselectCallBackInfo_DG" : "MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo_DG";
				MESBasic.factoryModel.factoryModel.factoryEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.factoryModel.factoryModel.factoryEdit._prefix = _prefix.substring(1);
			}
			
			MESBasic.factoryModel.factoryModel.factoryEdit._oGrid = oGrid;
			MESBasic.factoryModel.factoryModel.factoryEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode = '';
				}
			} else {
				MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp = false;
				MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames = '';
				MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode = '';
			}
			if (MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp == true && MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.factoryModel.factoryModel.factoryEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack = customCallBack;
			}
			if(MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFuncN == "function") {
				refparam += MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.factoryModel.factoryModel.factoryEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.factoryModel.factoryModel.factoryEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.factoryModel.factoryModel.factoryEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.factoryModel.factoryModel.factoryEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryModel.factoryModel.factoryEdit.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackGroupInfo = function(obj){
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
			MESBasic.factoryModel.factoryModel.factoryEdit._dialog.close();
		}
		MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_factoryModel_factoryModel_factoryEdit_form',obj[0], MESBasic.factoryModel.factoryModel.factoryEdit._prefix, MESBasic.factoryModel.factoryModel.factoryEdit._sUrl);
			CUI.commonFills('MESBasic_factoryModel_factoryModel_factoryEdit_form',MESBasic.factoryModel.factoryModel.factoryEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.factoryModel.factoryModel.factoryEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack) {
					eval(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack);
					MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.factoryModel.factoryModel.factoryEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.factoryModel.factoryModel.factoryEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.factoryModel.factoryModel.factoryEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.factoryModel.factoryModel.factoryEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp_IE == true && MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.factoryModel.factoryModel.factoryEdit._sUrl,MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.factoryModel.factoryModel.factoryEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp_IE == true && MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack) {
					eval(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack);
					MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.factoryModel.factoryModel.factoryEdit._dialog.close();
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
		
		MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo_DG = function(obj){
			if(MESBasic.factoryModel.factoryModel.factoryEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.factoryModel.factoryModel.factoryEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.factoryModel.factoryModel.factoryEdit._currRow).next().length==0){
						MESBasic.factoryModel.factoryModel.factoryEdit._oGrid.addNewRow();
					}	
					MESBasic.factoryModel.factoryModel.factoryEdit._currRow = $(MESBasic.factoryModel.factoryModel.factoryEdit._currRow).next();
					$(MESBasic.factoryModel.factoryModel.factoryEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.factoryModel.factoryModel.factoryEdit._currRow,obj[i], MESBasic.factoryModel.factoryModel.factoryEdit._prefix, MESBasic.factoryModel.factoryModel.factoryEdit._sUrl);
				if (MESBasic.factoryModel.factoryModel.factoryEdit._isObjCustomProp == true && MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.factoryModel.factoryModel.factoryEdit._currRow,MESBasic.factoryModel.factoryModel.factoryEdit._prefix,obj[i],MESBasic.factoryModel.factoryModel.factoryEdit._oGrid,MESBasic.factoryModel.factoryModel.factoryEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.factoryModel.factoryModel.factoryEdit._currRow,MESBasic.factoryModel.factoryModel.factoryEdit._prefix,obj[i],MESBasic.factoryModel.factoryModel.factoryEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.factoryModel.factoryModel.factoryEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.factoryModel.factoryModel.factoryEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.factoryModel.factoryModel.factoryEdit._refViewCode + '&id=' + id,
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
									name = MESBasic.factoryModel.factoryModel.factoryEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.factoryModel.factoryModel.factoryEdit._currRow, objs, MESBasic.factoryModel.factoryModel.factoryEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack) {
					eval(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack);
					MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.factoryModel.factoryModel.factoryEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.factoryModel.factoryModel.factoryEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.factoryModel.factoryModel.factoryEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.factoryModel.factoryModel.factoryEdit._oGrid, MESBasic.factoryModel.factoryModel.factoryEdit._currRow, MESBasic.factoryModel.factoryModel.factoryEdit._key, MESBasic.factoryModel.factoryModel.factoryEdit._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack) {
					eval(MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack);
					MESBasic.factoryModel.factoryModel.factoryEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.factoryModel.factoryModel.factoryEdit._dialog.close();
			} catch(e){}
		};
		
		MESBasic.factoryModel.factoryModel.factoryEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.factoryModel.factoryModel.factoryEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_factoryEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.factoryModel.factoryModel.factoryEdit.onloadForProduct();
			var TypeName = $("input[name='factoryModel.nodeType.id']").val(); //获取类型名称ID
if(TypeName != ''){
	if(TypeName != '1005'){
	//当类型名称不为“生产单元”，【指定批号位号】和【结束工序位号】两个字段不可编辑（不论是否为空）
		$.simpleSelect.setSelectObjReadOnly('factoryModel_assignBatchNo_itemName', true);
		$.simpleSelect.setSelectObjReadOnly('factoryModel_endItem_itemName', true);
	}
	if(TypeName != '1000' && TypeName != '1001' && TypeName != '1002'){
	//当类型名称为“企业”、“工厂”、“生产区域”时，【部门】可编辑；否则不可编辑
		$.simpleSelect.setSelectObjReadOnly('factoryModel_department_name', true);
	}
	if(TypeName == "生产区域"){

	}
}else{
	//当类型名称为空时，【指定批号位号】和【结束工序位号】和【部门】三个字段不可编辑（不论是否为空）
	$.simpleSelect.setSelectObjReadOnly('factoryModel_assignBatchNo_itemName', true);
	$.simpleSelect.setSelectObjReadOnly('factoryModel_endItem_itemName', true);
	$.simpleSelect.setSelectObjReadOnly('factoryModel_department_name', true);
}

//判断页面是编辑页面还是新建页面。 (废弃)为编辑页面的时候【类型名称】字段不可编辑
var pageId = GetQueryString("id") //获取url中的factoryId值

//if(pageId != null){
//	$.simpleSelect.setSelectObjReadOnly('factoryModel_nodeType_name', true);}

//当选中节点为“生产区域”（包含）及其下级节点时，自动带出上级节点的【部门】并赋值给当前部门字段
//带出上级节点的【生产区域】字段
//var parentId = GetQueryString("factoryModel.parentId");
var parentId = $("input[name='factoryModel.parentId']").val();
if(parentId != -1 && parentId != null){
	//根据parentId获取生产区域&部门字段&生产区域字段（隐藏）
	$.ajax(
	{
		url: "/public/MESBasic/factoryModel/factoryModel/GetParentNode.action",
		type: "POST",
		dataType: "json",
		data: {"parentId": parentId},
		success: function (result) {
			$("input[name='factoryModel.department.id']").val(result.departmentId);
			$("#factoryModel_department_name").val(result.departmentName);
			$("input[name='factoryModel.workArea']").val(result.workArea);
		}

	});
	
}

if(pageId == null){
	pageId = -1;
}	
//判断是否上载了批次模块，即BatchModeCount>0，则赋给一个全局变量一个true表示已经上载了批次模块
//当判断批次模块的全局变量为false时，【清空类型】、【清空位号】两个字段不显示（列不显示）
$.ajax(
{
	url: "/public/MESBasic/factoryModel/factoryModel/GetBatchMode.action",
	type: "POST",
	dataType: "json",
	data: {"factoryId": pageId},
	success: function (result) {
		//alert(result.BatchModeCount);
		var BatchModeCount = parseFloat(result.BatchModeCount);
		if(BatchModeCount > 0){
			ChangeBatchModeState();
		}
		if(!BatchModeState){
			$($($(".edit-table-symbol")[8]).find("label")).hide();
			$($($(".edit-table-content")[8])).hide();
			$($($(".edit-table")[0]).find("tr")[4]).attr("style","display:none");
		}
		var runProSetNum = parseFloat(result.runProSetNum);
		//编辑时，当类型名称为“生产单元”，且引用该工厂节点的活动集合被启动的工艺路线引用，
		//则【指定批号位号】和【结束工序位号】两个字段不可以编辑。
		if(runProSetNum > 0 && TypeName == '1005'){
			$.simpleSelect.setSelectObjReadOnly('factoryModel_assignBatchNo_itemName', true);
			$.simpleSelect.setSelectObjReadOnly('factoryModel_endItem_itemName', true);
		}	
	}

});
		});

		MESBasic.factoryModel.factoryModel.factoryEdit.beforeSubmitMethodSettingInPage = function(){
			MESBasic.factoryModel.factoryModel.factoryEdit.onsaveForProduct();
			if(ObjEquipment_dg1460958585675Widget){
	for(var i = 0;i < ObjEquipment_dg1460958585675Widget.getRowLength();i++){
		if( !ObjEquipment_dg1460958585675Widget.getCellValue(i,"isFixed") && ObjEquipment_dg1460958585675Widget.getCellValue(i,"objEqu.name") == ''){
			workbenchErrorBarWidget.showMessage("第" + (i+1) + "行设备非固定安装，必须关联设备档案");
			return false;
		}
		if(ObjEquipment_dg1460958585675Widget.getCellValue(i,"clearType.id") != '' && ObjEquipment_dg1460958585675Widget.getCellValue(i,"clearItem.itemName") == ''){
			workbenchErrorBarWidget.showMessage("第" + (i+1) + "行清空类型不为空，清空位号不能为空");
			return false;
		}
	}
}
		};
		MESBasic.factoryModel.factoryModel.factoryEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.factoryModel.factoryModel.factoryEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.factoryModel.factoryModel.factoryEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").hide();
				},100);
				//CUI("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.factoryModel.factoryModel.factoryEdit.showThis = function(){
			if(!CUI("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").is(':visible')) {
				CUI("#MESBasic_factoryModel_factoryModel_factoryEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.factoryModel.factoryModel.factoryEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.factoryModel.factoryModel.factoryEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_factoryModel_factoryModel_factoryEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_factoryModel_FactoryModel&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.factoryModel.factoryModel.factoryEdit.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.factoryModel.factoryModel.factoryEdit.showInfoDialog=function(mode){
			
			MESBasic.factoryModel.factoryModel.factoryEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_factoryModel_factoryModel_factoryEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.factoryModel.factoryModel.factoryEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.factoryModel.factoryModel.factoryEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_factoryModel");
			}
		}
		
		MESBasic.factoryModel.factoryModel.factoryEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/factoryModel/factoryModel/dealInfo-list.action&dlTableInfoId=${(factoryModel.tableInfoId)?default('')}");
			}
		}
		MESBasic.factoryModel.factoryModel.factoryEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_factoryModel_FactoryModel&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(factoryModel.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_factoryModel_FactoryModel&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(factoryModel.tableInfoId)?default('')}");
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
		MESBasic.factoryModel.factoryModel.factoryEdit.supervision=function(){
			MESBasic.factoryModel.factoryModel.factoryEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(factoryModel.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.factoryModel.factoryModel.factoryEdit.modifyOwnerStaffDialog.show();
		}
		
function beforeChangeNameChangeName(obj) {
				var typeID = obj[0].id;
				var factoryid = GetQueryString("id") //获取url中的factoryid值
				var typeval = $("input[name='factoryModel.nodeType.name']").val();
				//生产单元被修改时校验是否被活动集合引用
				if (typeval != null && typeval != "") {
					if (typeID != 1005) {
						$.ajax({
							url: "/MESBasic/factoryModel/factoryModel/modifyActiveByProRootSetChecked.action",
							type: "POST",
							dataType: "json",
							data: {
								"factoryId": factoryid
							},
							success: function(result) {
								var avtiveCount = parseFloat(result.activeCount);
								var active = result.active;
								if (avtiveCount != 0) {
									workbenchErrorBarWidget.showMessage("该生产单元已被" + result.active + "等活动集合引用，不能修改类型");
								} else {
									//未被活动集合引用，清空批号位号、结束位号并设为不可编辑
									factoryModel_assignBatchNo_itemName_delete();
									$.simpleSelect.setSelectObjReadOnly('factoryModel_assignBatchNo_itemName', true);
									factoryModel_endItem_itemName_delete();
									$.simpleSelect.setSelectObjReadOnly('factoryModel_endItem_itemName', true);
									$.simpleSelect.setSelectObjReadOnly('factoryModel.nodeType.name', true);
								}
							}
						});
					}

				}
			}
function afterClear(deleteObj) {
				var typeID = deleteObj.id;
				if (typeID == 1005) {
					factoryModel_assignBatchNo_itemName_delete();
					factoryModel_endItem_itemName_delete();
					$.simpleSelect.setSelectObjReadOnly('factoryModel_assignBatchNo_itemName', true);
					$.simpleSelect.setSelectObjReadOnly('factoryModel_endItem_itemName', true);
					
				}
				if (typeID == 1000 || typeID == 1001 || typeID == 1002) {
					factoryModel_department_name_delete();
					$.simpleSelect.setSelectObjReadOnly('factoryModel_department_name', true);
				}
			}
function emaChangeFun(){
	var factoryEmsFlag = $("input[name='factoryModel.emsFlag']").val()
	var id = $('#id').val();
	if(factoryEmsFlag==true||factoryEmsFlag=='true'){
		if(typeof(ObjProduct_dg1460958766002Widget)!='undefined'){
			var productList = ObjProduct_dg1460958766002Widget._DT.getAllRows()
			for(var n=0;n<productList.length;n++){
				if(productList[n].emsFlag==true||productList[n].emsFlag=='true'){
					$("input[name='factoryModel.emsFlag_check']")[0].checked=true;
					CUI.Dialog.alert("${getText("MESBasic.emaFlag.messTwo")}");
					return false;
				}
			} 
		}else if(typeof(ObjProduct_dg1460958766002Widget)=='undefined'&&id!=''){
			var flag=false;
			$.ajax({
				url : "/MESBasic/factoryModel/factoryModel/emaChange.action",
				type : 'post',
				async : false,
				data:{"factoryId":id},
				success : function(msg) {
					if(msg.hasEmsFlag==true||msg.hasEmsFlag =='true'){
						flag=true;
					}
				}	
			});
			if(flag==true||flag=='true'){
				$("input[name='factoryModel.emsFlag_check']")[0].checked=true;
				CUI.Dialog.alert("${getText("MESBasic.emaFlag.messTwo")}");
				return false;
			}
		
		}
	}
	
	
}
function ChangeName(obj){
	var typeID = obj[0].id;
	//生产单元可以编辑指定批号位号，结束位号
	if(typeID != 1005){
		$.simpleSelect.setSelectObjReadOnly('factoryModel_assignBatchNo_itemName', true);
		$.simpleSelect.setSelectObjReadOnly('factoryModel_endItem_itemName', true);
	}else{
		$.simpleSelect.setSelectObjReadOnly('factoryModel_assignBatchNo_itemName', false);
		$.simpleSelect.setSelectObjReadOnly('factoryModel_endItem_itemName', false);
	}
	
	//企业、工厂、车间可以编辑部门
	if(typeID == 1000 || typeID == 1001 || typeID == 1002){
		$.simpleSelect.setSelectObjReadOnly('factoryModel_department_name', false);
	}else{
		factoryModel_department_name_delete();
		$.simpleSelect.setSelectObjReadOnly('factoryModel_department_name', true);
	}

}


function checkUnique(obj){
	var length = ObjPostion_dg1460955592809Widget.getRowLength();
	for(var i=0;i<length;i++){
		if(i == ObjPostion_dg1460955592809Widget.getSelectedRow()){
			continue;
		}
		var code = ObjPostion_dg1460955592809Widget.getCellValue(i,'objPos.code'); 
 	
		if(obj[0].code == code){
			CUI.Dialog.alert("岗位重复!");
			return false;
		}
	}
}


function ChangeisFixed(){
	//var nRow = $(this).parent().prevAll().length;
	//var isFixed = ObjEquipment_dg1460958585675Widget.getCellValue(nRow,"isFixed");
	//if(isFixed == 'true'){
	//	ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"equipmentNum","readonly",false);
	//}else{
	//	ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"equipmentNum","readonly",true);
	//	ObjEquipment_dg1460958585675Widget.setCellValue(nRow,"equipmentNum","");
	//}
	
	var rowLength = ObjEquipment_dg1460958585675Widget.getRowLength();
	for(var i = 0; i < rowLength; i++ ){
		var isFixed = Boolean(ObjEquipment_dg1460958585675Widget.getCellValue(i,"isFixed"));
		//console.log(i + ":" + isFixed);
		if(isFixed == true){
		//	console.log("asdasd");
			ObjEquipment_dg1460958585675Widget.setCellProperty(i,"equipmentNum","readonly",false);
		}else{
		//	console.log("qweqwe");
			ObjEquipment_dg1460958585675Widget.setCellProperty(i,"equipmentNum","readonly",true);
			ObjEquipment_dg1460958585675Widget.setCellValue(i,"equipmentNum","");
		}
	}	
}
function ChooseSysCode(nRow){
	var equipmentTypeId = ObjEquipment_dg1460958585675Widget.getCellValue(nRow,"equipmentType.id");
	$.ajax(
	{
		url: "/public/MESBasic/factoryModel/factoryModel/CheckDescA.action",
		type: "POST",
		dataType: "json",
		data: {"equipmentTypeId": equipmentTypeId},
		success: function (result) {
			//alert(result.result);
			var flag = result.result;
			//获取描述A字段的值
			if(flag == 1){
				//当“描述A”字段为1时，【是否容器】字段打钩，【清空类型】字段可编辑
				ObjEquipment_dg1460958585675Widget.setCellValue(nRow,"isContainer",true);
				ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"clearType.id","readonly",false);
			}else{
				//当“描述A”字段不为1时，【是否容器】字段不打勾，【清空类型】字段不可编辑，【清空类型】和【清空位号】清空
				ObjEquipment_dg1460958585675Widget.setCellValue(nRow,"isContainer",false);
				ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"clearType.id","readonly",true);
				ObjEquipment_dg1460958585675Widget.setCellValue(nRow,"clearType.id","");
				ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"clearItem.itemName","readonly",true);
				ObjEquipment_dg1460958585675Widget.setCellValue(nRow,"clearItem.itemName","");
			}
		},
	});
}
function isFixedChange(){
	//当字段“固定安装”字段被选中时，设备位号可编辑，否则设备位号不可编辑
	for(var i = 0;i < ObjEquipment_dg1460958585675Widget.getRowLength();i++){
		var isFixed = ObjEquipment_dg1460958585675Widget.getCellValue(i,"isFixed");
		//console.log(i + ":" + isFixed);
		if(isFixed == true){
			ObjEquipment_dg1460958585675Widget.setCellProperty(i,"equipmentNum","readonly",false);
		}else{
			ObjEquipment_dg1460958585675Widget.setCellProperty(i,"equipmentNum","readonly",true);
		}
	}
}
function ClearTypeChange(nRow){
	//当清空类型字段有值时，清空位号字段可以编辑，否则不可编辑

	var ClearType = ObjEquipment_dg1460958585675Widget.getCellValue(nRow,"clearType.id");
	if(ClearType == ''){
		ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"clearItem.itemName","readonly",'true');
		ObjEquipment_dg1460958585675Widget.setCellValue(nRow,"clearItem.itemName",'');
	}else{
		ObjEquipment_dg1460958585675Widget.setCellProperty(nRow,"clearItem.itemName","readonly",'false');
	}
}





		/* CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_factoryEdit,js,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码
//判断批次模块是否上载的全局变量
var BatchModeState = false;
function ChangeBatchModeState(){
	BatchModeState = true;
}
//获取url的参数
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null){
		 return  unescape(r[2]);
	 }		 
	 return null;
}
/* CUSTOM CODE END */
		MESBasic.factoryModel.factoryModel.factoryEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_factoryEdit,onloadForProduct,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.factoryModel.factoryModel.factoryEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_factoryEdit,onsaveForProduct,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.factoryModel.factoryModel.factoryEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.factoryModel.factoryModel.factoryEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(factoryModel.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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