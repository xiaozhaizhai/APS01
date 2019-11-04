<!-- WOM_7.5.0.0/qualityRecords/qualityInspectEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1541146959619')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_qualityRecords_qualityInspectEdit,head,WOM_7.5.0.0_qualityRecords_QualityInspect,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.qualityRecords.qualityInspect.qualityInspectEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "WOM_qualityRecords_qualityInspect">
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
<#assign callbackName ="WOM.qualityRecords.qualityInspect.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_qualityRecords_qualityInspect_qualityInspectEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_qualityRecords_qualityInspect_qualityInspectEdit_form" cssStyle="height:100%;" hiddenField="qualityInspect.operateStaffID.id,qualityInspect.activeID.id," onsubmitMethod="WOM.qualityRecords.qualityInspect.qualityInspectEdit.beforeSubmitMethod()" ecAction="/WOM/qualityRecords/qualityInspect/qualityInspectEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="qualityInspectEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_qualityRecords_qualityInspectEdit">
	<input type="hidden" name="datagridKey" value="WOM_qualityRecords_qualityInspect_qualityInspectEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="qualityInspect.version" value="${(qualityInspect.version)!0}" />
	<input type="hidden" name="qualityInspect.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="qualityInspect.operateStaffID.id" value="${(qualityInspect.operateStaffID.id)!""}"/>
		<input type="hidden" name="qualityInspect.activeID.id" value="${(qualityInspect.activeID.id)!""}"/>
	<div id="WOM_qualityInspectEdit_edit_div" style="height:100%">
		<div id="WOM_qualityRecords_qualityInspect_qualityInspectEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_qualityRecords_qualityInspect_qualityInspectEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_qualityRecords', null, function(){
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
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487295011793')}" >${getText('RM.propertydisplayName.randon1487295011793')}</label>
				</td>
				
						<#assign qualityInspect_activeID_processId_name_defaultValue  = ''>
														<#assign qualityInspect_activeID_processId_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1495626855536')}" viewType="readonly" deValue="${qualityInspect_activeID_processId_name_defaultValue!}" conditionfunc="WOM.qualityRecords.qualityInspect.qualityInspectEdit._querycustomFunc('qualityInspect_activeID_processId_name')" view=true  value="${(qualityInspect.activeID.processId.name)!}" displayFieldName="name" name="qualityInspect.activeID.processId.name" id="qualityInspect_activeID_processId_name" type="other" url="/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_qualityRecords_qualityInspect_qualityInspectEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_taskActiveExelogRef"  onkeyupfuncname=";_callback_qualityInspect_activeID_processId_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(qualityInspect.id)?? && (qualityInspect.activeID.processId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${qualityInspect.activeID.processId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form',obj, 'qualityInspect.activeID.processId', '/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action');
												CUI.commonFills('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form', 'qualityInspect.activeID.processId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495778802161')}" >${getText('WOM.propertydisplayName.randon1495778802161')}</label>
				</td>
				
						<#assign qualityInspect_operateStaffID_name_defaultValue  = 'currentUser'>
												<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${qualityInspect_operateStaffID_name_defaultValue!}" conditionfunc="WOM.qualityRecords.qualityInspect.qualityInspectEdit._querycustomFunc('qualityInspect_operateStaffID_name')"  value="${(qualityInspect.operateStaffID.name)!}" displayFieldName="name" name="qualityInspect.operateStaffID.name" id="qualityInspect_operateStaffID_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_qualityRecords_qualityInspect_qualityInspectEdit_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_qualityInspect_operateStaffID_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (qualityInspect_operateStaffID_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form',obj, 'qualityInspect.operateStaffID', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form', 'qualityInspect.operateStaffID',obj,true);
											$('input:hidden[name="qualityInspect.operateStaffID.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(qualityInspect.id)?? && (qualityInspect.operateStaffID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${qualityInspect.operateStaffID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form',obj, 'qualityInspect.operateStaffID', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form', 'qualityInspect.operateStaffID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490683872072')}" >${getText('WOM.propertydisplayName.randon1490683872072')}</label>
				</td>
				
						<#assign qualityInspect_activeID_name_defaultValue  = ''>
														<#assign qualityInspect_activeID_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="qualityInspect.activeID.name" id="qualityInspect_activeID_name"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.name)?has_content>${(qualityInspect.activeID.name?html)!}<#else>${qualityInspect_activeID_name_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.name)?has_content>${(qualityInspect.activeID.name?html)!}<#else>${qualityInspect_activeID_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489726359628')}" >${getText('WOM.propertydisplayName.randon1489726359628')}</label>
				</td>
				
						<#assign qualityInspect_activeID_activeType_defaultValue  = ''>
														<#assign qualityInspect_activeID_activeType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${qualityInspect_activeID_activeType_defaultValue!}" formId="WOM_qualityRecords_qualityInspect_qualityInspectEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="qualityInspect.activeID.activeType.id" code="activeType" value="${(qualityInspect.activeID.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_qualityRecords_qualityInspect_qualityInspectEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="qualityInspect.activeID.activeType.id" code="activeType" value="${(qualityInspect.activeID.activeType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign qualityInspect_activeID_productId_productCode_defaultValue  = ''>
														<#assign qualityInspect_activeID_productId_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="qualityInspect.activeID.productId.productCode" id="qualityInspect_activeID_productId_productCode"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.productId.productCode)?has_content>${(qualityInspect.activeID.productId.productCode?html)!}<#else>${qualityInspect_activeID_productId_productCode_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.productId.productCode)?has_content>${(qualityInspect.activeID.productId.productCode?html)!}<#else>${qualityInspect_activeID_productId_productCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign qualityInspect_activeID_productId_productName_defaultValue  = ''>
														<#assign qualityInspect_activeID_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="qualityInspect.activeID.productId.productName" id="qualityInspect_activeID_productId_productName"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.productId.productName)?has_content>${(qualityInspect.activeID.productId.productName?html)!}<#else>${qualityInspect_activeID_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.productId.productName)?has_content>${(qualityInspect.activeID.productId.productName?html)!}<#else>${qualityInspect_activeID_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953385761')}" >${getText('WOM.propertydisplayName.randon1540953385761')}</label>
				</td>
				
						<#assign qualityInspect_activeID_startTime_defaultValue  = ''>
														<#assign qualityInspect_activeID_startTime_defaultValue  = ''>
					<#if (qualityInspect_activeID_startTime_defaultValue)?? &&(qualityInspect_activeID_startTime_defaultValue)?has_content>
							<#assign qualityInspect_activeID_startTime_defaultValue  = getDefaultDateTime(qualityInspect_activeID_startTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(qualityInspect.activeID.startTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="qualityInspect.activeID.startTime" value="${qualityInspect_activeID_startTime_defaultValue!}" type="dateTime"  id="qualityInspect.activeID.startTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (qualityInspect.activeID.startTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="qualityInspect.activeID.startTime" value="${qualityInspect.activeID.startTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="qualityInspect.activeID.startTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="qualityInspect.activeID.startTime" value="" type="dateTime" id="qualityInspect.activeID.startTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953443908')}" >${getText('WOM.propertydisplayName.randon1540953443908')}</label>
				</td>
				
						<#assign qualityInspect_activeID_endTime_defaultValue  = ''>
														<#assign qualityInspect_activeID_endTime_defaultValue  = ''>
					<#if (qualityInspect_activeID_endTime_defaultValue)?? &&(qualityInspect_activeID_endTime_defaultValue)?has_content>
							<#assign qualityInspect_activeID_endTime_defaultValue  = getDefaultDateTime(qualityInspect_activeID_endTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(qualityInspect.activeID.endTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="qualityInspect.activeID.endTime" value="${qualityInspect_activeID_endTime_defaultValue!}" type="dateTime"  id="qualityInspect.activeID.endTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (qualityInspect.activeID.endTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="qualityInspect.activeID.endTime" value="${qualityInspect.activeID.endTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="qualityInspect.activeID.endTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="qualityInspect.activeID.endTime" value="" type="dateTime" id="qualityInspect.activeID.endTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541146893776')}" >${getText('WOM.propertydisplayName.randon1541146893776')}</label>
				</td>
				
						<#assign qualityInspect_inspectType_defaultValue  = ''>
							 							<#assign qualityInspect_inspectType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${qualityInspect_inspectType_defaultValue!}" formId="WOM_qualityRecords_qualityInspect_qualityInspectEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="qualityInspect.inspectType.id" code="inspectType" value="${(qualityInspect.inspectType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_qualityRecords_qualityInspect_qualityInspectEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="qualityInspect.inspectType.id" code="inspectType" value="${(qualityInspect.inspectType.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489668325364')}" >${getText('WOM.propertydisplayName.randon1489668325364')}</label>
				</td>
				
						<#assign qualityInspect_activeID_orderProcessId_headId_productBatchNum_defaultValue  = ''>
														<#assign qualityInspect_activeID_orderProcessId_headId_productBatchNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="BAPCODE" name="qualityInspect.activeID.orderProcessId.headId.productBatchNum" id="qualityInspect_activeID_orderProcessId_headId_productBatchNum"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.orderProcessId.headId.productBatchNum)?has_content>${(qualityInspect.activeID.orderProcessId.headId.productBatchNum?html)!}<#else>${qualityInspect_activeID_orderProcessId_headId_productBatchNum_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.orderProcessId.headId.productBatchNum)?has_content>${(qualityInspect.activeID.orderProcessId.headId.productBatchNum?html)!}<#else>${qualityInspect_activeID_orderProcessId_headId_productBatchNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon148759513963344')}" >${getText('WOM.propertydisplayName.randon148759513963344')}</label>
				</td>
				
						<#assign qualityInspect_activeID_activeId_qualityStandard_name_defaultValue  = ''>
														<#assign qualityInspect_activeID_activeId_qualityStandard_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="qualityInspect.activeID.activeId.qualityStandard.name" id="qualityInspect_activeID_activeId_qualityStandard_name"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.activeId.qualityStandard.name)?has_content>${(qualityInspect.activeID.activeId.qualityStandard.name?html)!}<#else>${qualityInspect_activeID_activeId_qualityStandard_name_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.activeId.qualityStandard.name)?has_content>${(qualityInspect.activeID.activeId.qualityStandard.name?html)!}<#else>${qualityInspect_activeID_activeId_qualityStandard_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1504141163635')}" >${getText('RM.propertydisplayName.randon1504141163635')}</label>
				</td>
				
						<#assign qualityInspect_activeID_activeId_pickSite_name_defaultValue  = ''>
														<#assign qualityInspect_activeID_activeId_pickSite_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="qualityInspect.activeID.activeId.pickSite.name" id="qualityInspect_activeID_activeId_pickSite_name"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.activeId.pickSite.name)?has_content>${(qualityInspect.activeID.activeId.pickSite.name?html)!}<#else>${qualityInspect_activeID_activeId_pickSite_name_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.activeId.pickSite.name)?has_content>${(qualityInspect.activeID.activeId.pickSite.name?html)!}<#else>${qualityInspect_activeID_activeId_pickSite_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon154148476321412')}" >${getText('WOM.propertydisplayName.randon154148476321412')}</label>
				</td>
				
						<#assign qualityInspect_activeID_activeId_testProduct_name_defaultValue  = ''>
														<#assign qualityInspect_activeID_activeId_testProduct_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="qualityInspect.activeID.activeId.testProduct.name" id="qualityInspect_activeID_activeId_testProduct_name"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.activeId.testProduct.name)?has_content>${(qualityInspect.activeID.activeId.testProduct.name?html)!}<#else>${qualityInspect_activeID_activeId_testProduct_name_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.activeId.testProduct.name)?has_content>${(qualityInspect.activeID.activeId.testProduct.name?html)!}<#else>${qualityInspect_activeID_activeId_testProduct_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541484763214')}" >${getText('WOM.propertydisplayName.randon1541484763214')}</label>
				</td>
				
						<#assign qualityInspect_inspectBatch_defaultValue  = ''>
							 							<#assign qualityInspect_inspectBatch_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="qualityInspect.inspectBatch" id="qualityInspect_inspectBatch"  style=";" originalvalue="<#if !newObj || (qualityInspect.inspectBatch)?has_content>${(qualityInspect.inspectBatch?html)!}<#else>${qualityInspect_inspectBatch_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.inspectBatch)?has_content>${(qualityInspect.inspectBatch?html)!}<#else>${qualityInspect_inspectBatch_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541146874561')}" >${getText('WOM.propertydisplayName.randon1541146874561')}</label>
				</td>
				
						<#assign qualityInspect_inspectNum_defaultValue  = ''>
							 							<#assign qualityInspect_inspectNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="qualityInspect.inspectNum" id="qualityInspect_inspectNum"  style=";" originalvalue="<#if newObj&& !(qualityInspect.inspectNum)?has_content>${qualityInspect_inspectNum_defaultValue!}<#elseif (qualityInspect.inspectNum)?has_content>#{(qualityInspect.inspectNum)!; m6M6}</#if>" value="<#if newObj&& !(qualityInspect.inspectNum)?has_content>${qualityInspect_inspectNum_defaultValue!}<#elseif (qualityInspect.inspectNum)?has_content>#{(qualityInspect.inspectNum)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#qualityInspect_inspectNum').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1541146874561")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398235640483')}" >${getText('X6Basic.propertydisplayName.radion1398235640483')}</label>
				</td>
				
						<#assign qualityInspect_activeID_productId_productBaseUnit_name_defaultValue  = ''>
														<#assign qualityInspect_activeID_productId_productBaseUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="qualityInspect.activeID.productId.productBaseUnit.name" id="qualityInspect_activeID_productId_productBaseUnit_name"  style=";" originalvalue="<#if !newObj || (qualityInspect.activeID.productId.productBaseUnit.name)?has_content>${(qualityInspect.activeID.productId.productBaseUnit.name?html)!}<#else>${qualityInspect_activeID_productId_productBaseUnit_name_defaultValue!}</#if>" value="<#if !newObj || (qualityInspect.activeID.productId.productBaseUnit.name)?has_content>${(qualityInspect.activeID.productId.productBaseUnit.name?html)!}<#else>${qualityInspect_activeID_productId_productBaseUnit_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541146864746')}" >${getText('WOM.propertydisplayName.randon1541146864746')}</label>
				</td>
				
						<#assign qualityInspect_remark_defaultValue  = ''>
							 							<#assign qualityInspect_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="qualityInspect_remark" originalvalue="<#if !newObj || (qualityInspect.remark)?has_content>${(qualityInspect.remark?html)!}<#else>${qualityInspect_remark_defaultValue?html}</#if>"  name="qualityInspect.remark" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (qualityInspect.remark)?has_content>${(qualityInspect.remark)!}<#else>${qualityInspect_remark_defaultValue}</#if></textarea></div>
							
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
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_qualityRecords_qualityInspectEdit,html,WOM_7.5.0.0_qualityRecords_QualityInspect,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.beforeSaveProcess = function(){}
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.qualityRecords.qualityInspect.qualityInspectEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_qualityRecords_qualityInspect_qualityInspectEdit_form').trigger('beforeSubmit');
		//qualityInspect.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="qualityInspect.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_qualityRecords_qualityInspect_qualityInspectEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_qualityRecords_qualityInspect_qualityInspectEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.print = function(url){
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
		
		WOM.qualityRecords.qualityInspect.qualityInspectEdit.saveSetting = function(){
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
		WOM.qualityRecords.qualityInspect.qualityInspectEdit.printSetting = function(){
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
			WOM.qualityRecords.qualityInspect.qualityInspectEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.qualityRecords.qualityInspect.qualityInspectEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.qualityRecords.qualityInspect.qualityInspectEdit.settingDialog.show();
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
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack = customCallBack;
		}
		WOM.qualityRecords.qualityInspect.qualityInspectEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_qualityRecords_qualityInspect_qualityInspectEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_qualityRecords_qualityInspect_qualityInspectEdit_fileupload"></div>');
			}
			WOM.qualityRecords.qualityInspect.qualityInspectEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_qualityRecords_qualityInspect_qualityInspectEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_qualityRecords_qualityInspect_qualityInspectEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.qualityRecords.qualityInspect.qualityInspectEdit.infoDialog.show();
			if($('#WOM_qualityRecords_qualityInspect_qualityInspectEdit_fileupload').html() == '') {
				$('#WOM_qualityRecords_qualityInspect_qualityInspectEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_qualityRecords_qualityInspect&entityCode=WOM_7.5.0.0_qualityRecords&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.qualityRecords.qualityInspect.qualityInspectEdit.referenceCopyBackInfo";
		WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog = dialog;
		WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog = foundation.common.select({
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
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.referenceCopyBackInfo = function(obj){
		if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog){
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form','WOM_qualityRecords_qualityInspect_qualityInspectEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._el).load('/WOM/qualityRecords/qualityInspect/qualityInspectEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._config.iframe, WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._dialog ).prop( 'src', '/WOM/qualityRecords/qualityInspect/qualityInspectEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.qualityRecords.qualityInspect.qualityInspectEdit.dialog._el).load('/WOM/qualityRecords/qualityInspect/qualityInspectEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.qualityRecords.qualityInspect.qualityInspectEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.qualityRecords.qualityInspect.qualityInspectEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_qualityRecords_qualityInspect_qualityInspectEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix = '';
		WOM.qualityRecords.qualityInspect.qualityInspectEdit._oGrid = oGrid;
		WOM.qualityRecords.qualityInspect.qualityInspectEdit._sUrl = url;
		if(customCallBack){
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.qualityRecords.qualityInspect.qualityInspectEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.qualityRecords.qualityInspect.qualityInspectEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.qualityRecords.qualityInspect.qualityInspectEdit.getMultiselectCallBackInfo_DG" : "WOM.qualityRecords.qualityInspect.qualityInspectEdit.getcallBackInfo_DG";
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.qualityRecords.qualityInspect.qualityInspectEdit.getcallBackInfo";
		}
		if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix!=''){
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix = WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix.substring(1);
		}
		if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.qualityRecords.qualityInspect.qualityInspectEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.qualityRecords.qualityInspect.qualityInspectEdit._querycustomFuncN == "function") {
				refparam += WOM.qualityRecords.qualityInspect.qualityInspectEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.qualityRecords.qualityInspect.qualityInspectEdit.query_"+obj+")!='undefined'") ? eval('WOM.qualityRecords.qualityInspect.qualityInspectEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form',obj[0], WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix, WOM.qualityRecords.qualityInspect.qualityInspectEdit._sUrl);
		CUI.commonFills('WOM_qualityRecords_qualityInspect_qualityInspectEdit_form',WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix,obj[0]);

		try{
			if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack) {
				eval(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack);
				WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customBeforeCallBack) {
			var flag = eval(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.qualityRecords.qualityInspect.qualityInspectEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.qualityRecords.qualityInspect.qualityInspectEdit._sUrl);
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
			if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack) {
				eval(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack);
				WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.getcallBackInfo_DG = function(obj){
		if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customBeforeCallBack) {
			var flag = eval(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow).next().length==0){
					WOM.qualityRecords.qualityInspect.qualityInspectEdit._oGrid.addNewRow();
				}	
				WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow = $(WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow).next();
				$(WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow,obj[i],WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix,WOM.qualityRecords.qualityInspect.qualityInspectEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow,WOM.qualityRecords.qualityInspect.qualityInspectEdit._prefix,obj[i],WOM.qualityRecords.qualityInspect.qualityInspectEdit._oGrid)");
		}
		try{
			if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack) {
				eval(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack);
				WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.qualityRecords.qualityInspect.qualityInspectEdit._oGrid, WOM.qualityRecords.qualityInspect.qualityInspectEdit._currRow, WOM.qualityRecords.qualityInspect.qualityInspectEdit._key, WOM.qualityRecords.qualityInspect.qualityInspectEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack) {
				eval(WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack);
				WOM.qualityRecords.qualityInspect.qualityInspectEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.qualityRecords.qualityInspect.qualityInspectEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.qualityRecords.qualityInspect.qualityInspectEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_qualityRecords_qualityInspect_qualityInspectEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			if (ProduceTaskActive_dg1540191119773Widget != undefined && !$("input[name='WOM_qualityRecords_qualityInspect_qualityInspectEdit_form'] #id").val()) {
	var activeSelectedRow = ProduceTaskActive_dg1540191119773Widget.getSelectedRow();
	if (activeSelectedRow != undefined){
		$("input[name='qualityInspect.activeID.processId.name']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'orderProcessId.name'));
		$("input[name='qualityInspect.activeID.activeType.id']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'activeType.id'));
		$("input[name='qualityInspect.activeID.activeType.value']").val($("#ProduceTaskActive_dg1540191119773_tbody tr").eq(activeSelectedRow).find("td[key='activeType.id'] div").html());
		$("input[name='qualityInspect.activeID.standardNum']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'standardNum'));
		$("input[name='qualityInspect.activeID.planNum']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'planNum'));
		$("input[name='qualityInspect.activeID.startTime']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'startTime'));
		$("input[name='qualityInspect.activeID.endTime']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'endTime'));
		$("input[name='qualityInspect.activeID.productId.productCode']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'productId.productCode'));
		$("input[name='qualityInspect.activeID.productId.productName']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'productId.productName'));
		$("input[name='qualityInspect.activeID.productId.productBaseUnit.name']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'productId.productBaseUnit.name'));
		$("input[name='qualityInspect.activeID.productId.productName']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'productId.productName'));
		$("input[name='qualityInspect.activeID.orderProcessId.headId.productBatchNum']").val($("input[name='produceTask.productBatchNum']").val());
		$("input[name='qualityInspect.activeID.id']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'id'));
		$("input[name='qualityInspect.activeID.name']").val(ProduceTaskActive_dg1540191119773Widget.getCellValue(activeSelectedRow,'name'));
	}
}
		});
	})(jQuery);
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.initCount = 0;
	WOM.qualityRecords.qualityInspect.qualityInspectEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_qualityInspectEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_qualityRecords_qualityInspect_qualityInspectEdit_datagrids');	
		var	conHeight = h-$("#WOM_qualityRecords_qualityInspect_qualityInspectEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_qualityRecords_qualityInspect_qualityInspectEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.qualityRecords.qualityInspect.qualityInspectEdit.initCount <= 2) {
								setTimeout(function(){WOM.qualityRecords.qualityInspect.qualityInspectEdit.initSize();}, 200);
								WOM.qualityRecords.qualityInspect.qualityInspectEdit.initCount++;
							}/* else {
								WOM.qualityRecords.qualityInspect.qualityInspectEdit.initCount = 0;
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
		WOM.qualityRecords.qualityInspect.qualityInspectEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.qualityRecords.qualityInspect.qualityInspectEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.qualityRecords.qualityInspect.qualityInspectEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_qualityRecords_qualityInspectEdit,js,WOM_7.5.0.0_qualityRecords_QualityInspect,WOM_7.5.0.0) */
// 自定义代码
		var randgeEdit;
    /**
     * 保存完毕回调
     * @method WOM.qualityRecords.qualityInspect
     */
    WOM.qualityRecords.qualityInspect.callBackInfo = function(res){
        if(res.dealSuccessFlag){
            if(res.operateType == 'save'){
                var viewselect = res.viewselect;
                var errorBarWidget = eval('WOM_qualityRecords_qualityInspect_' + viewselect + '_formDialogErrorBarWidget');
                errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
            } else if(res.operateType == 'delete') {
                workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
            }  else if(res.operateType == 'restore') {
                workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
            }
            setTimeout(function(){
                try{
                    randgeEdit.close();
                    closeLoadPanel();
                }catch(e){}
            },1500);
        } else {
            CUI.showErrorInfos(res);
        }
    };
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>