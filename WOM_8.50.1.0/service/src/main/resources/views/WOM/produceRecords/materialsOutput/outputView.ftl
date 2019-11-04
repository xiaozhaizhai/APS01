<!-- WOM_7.5.0.0/produceRecords/outputView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1541147949245')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceRecords_outputView,head,WOM_7.5.0.0_produceRecords_MaterialsOutput,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.produceRecords.materialsOutput.outputView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "WOM_produceRecords_materialsOutput">
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
<#assign callbackName ="WOM.produceRecords.materialsOutput.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_produceRecords_materialsOutput_outputView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_produceRecords_materialsOutput_outputView_form" cssStyle="height:100%;" hiddenField="materialsOutput.placeSet.id,materialsOutput.wareID.id,materialsOutput.operateStaffID.id,materialsOutput.activeID.id," onsubmitMethod="WOM.produceRecords.materialsOutput.outputView.beforeSubmitMethod()" ecAction="/WOM/produceRecords/materialsOutput/outputView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="outputView">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_produceRecords_outputView">
	<input type="hidden" name="datagridKey" value="WOM_produceRecords_materialsOutput_outputView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="materialsOutput.version" value="${(materialsOutput.version)!0}" />
	<input type="hidden" name="materialsOutput.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="materialsOutput.placeSet.id" value="${(materialsOutput.placeSet.id)!""}"/>
		<input type="hidden" name="materialsOutput.wareID.id" value="${(materialsOutput.wareID.id)!""}"/>
		<input type="hidden" name="materialsOutput.operateStaffID.id" value="${(materialsOutput.operateStaffID.id)!""}"/>
		<input type="hidden" name="materialsOutput.activeID.id" value="${(materialsOutput.activeID.id)!""}"/>
	<div id="WOM_outputView_edit_div" style="height:100%">
		<div id="WOM_produceRecords_materialsOutput_outputView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_produceRecords_materialsOutput_outputView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_produceRecords', null, function(){
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487295011793')}" >${getText('RM.propertydisplayName.randon1487295011793')}</label>
				</td>
				
						<#assign materialsOutput_activeID_processId_name_defaultValue  = ''>
														<#assign materialsOutput_activeID_processId_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1495626855536')}" viewType="readonly" deValue="${materialsOutput_activeID_processId_name_defaultValue!}" conditionfunc="WOM.produceRecords.materialsOutput.outputView._querycustomFunc('materialsOutput_activeID_processId_name')" view=true  value="${(materialsOutput.activeID.processId.name)!}" displayFieldName="name" name="materialsOutput.activeID.processId.name" id="materialsOutput_activeID_processId_name" type="other" url="/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceRecords_materialsOutput_outputView_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_taskActiveExelogRef"  onkeyupfuncname=";_callback_materialsOutput_activeID_processId_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(materialsOutput.id)?? && (materialsOutput.activeID.processId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${materialsOutput.activeID.processId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceRecords_materialsOutput_outputView_form',obj, 'materialsOutput.activeID.processId', '/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action');
												CUI.commonFills('WOM_produceRecords_materialsOutput_outputView_form', 'materialsOutput.activeID.processId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541122003119')}" >${getText('WOM.propertydisplayName.randon1541122003119')}</label>
				</td>
				
						<#assign materialsOutput_operateStaffID_name_defaultValue  = 'currentUser'>
												<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${materialsOutput_operateStaffID_name_defaultValue!}" conditionfunc="WOM.produceRecords.materialsOutput.outputView._querycustomFunc('materialsOutput_operateStaffID_name')" view=true  value="${(materialsOutput.operateStaffID.name)!}" displayFieldName="name" name="materialsOutput.operateStaffID.name" id="materialsOutput_operateStaffID_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceRecords_materialsOutput_outputView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_materialsOutput_operateStaffID_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (materialsOutput_operateStaffID_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_produceRecords_materialsOutput_outputView_form',obj, 'materialsOutput.operateStaffID', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_produceRecords_materialsOutput_outputView_form', 'materialsOutput.operateStaffID',obj,true);
											$('input:hidden[name="materialsOutput.operateStaffID.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(materialsOutput.id)?? && (materialsOutput.operateStaffID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${materialsOutput.operateStaffID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceRecords_materialsOutput_outputView_form',obj, 'materialsOutput.operateStaffID', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_produceRecords_materialsOutput_outputView_form', 'materialsOutput.operateStaffID',obj,true);
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
				
						<#assign materialsOutput_activeID_name_defaultValue  = ''>
														<#assign materialsOutput_activeID_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="materialsOutput.activeID.name" id="materialsOutput_activeID_name"  style=";" originalvalue="<#if !newObj || (materialsOutput.activeID.name)?has_content>${(materialsOutput.activeID.name?html)!}<#else>${materialsOutput_activeID_name_defaultValue!}</#if>" value="<#if !newObj || (materialsOutput.activeID.name)?has_content>${(materialsOutput.activeID.name?html)!}<#else>${materialsOutput_activeID_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489726359628')}" >${getText('WOM.propertydisplayName.randon1489726359628')}</label>
				</td>
				
						<#assign materialsOutput_activeID_activeType_defaultValue  = ''>
														<#assign materialsOutput_activeID_activeType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${materialsOutput_activeID_activeType_defaultValue!}" formId="WOM_produceRecords_materialsOutput_outputView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="materialsOutput.activeID.activeType.id" code="activeType" value="${(materialsOutput.activeID.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceRecords_materialsOutput_outputView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="materialsOutput.activeID.activeType.id" code="activeType" value="${(materialsOutput.activeID.activeType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953385761')}" >${getText('WOM.propertydisplayName.randon1540953385761')}</label>
				</td>
				
						<#assign materialsOutput_activeID_startTime_defaultValue  = ''>
														<#assign materialsOutput_activeID_startTime_defaultValue  = ''>
					<#if (materialsOutput_activeID_startTime_defaultValue)?? &&(materialsOutput_activeID_startTime_defaultValue)?has_content>
							<#assign materialsOutput_activeID_startTime_defaultValue  = getDefaultDateTime(materialsOutput_activeID_startTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(materialsOutput.activeID.startTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="materialsOutput.activeID.startTime" value="${materialsOutput_activeID_startTime_defaultValue!}" type="dateTime"  id="materialsOutput.activeID.startTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (materialsOutput.activeID.startTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="materialsOutput.activeID.startTime" value="${materialsOutput.activeID.startTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="materialsOutput.activeID.startTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="materialsOutput.activeID.startTime" value="" type="dateTime" id="materialsOutput.activeID.startTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953443908')}" >${getText('WOM.propertydisplayName.randon1540953443908')}</label>
				</td>
				
						<#assign materialsOutput_activeID_endTime_defaultValue  = ''>
														<#assign materialsOutput_activeID_endTime_defaultValue  = ''>
					<#if (materialsOutput_activeID_endTime_defaultValue)?? &&(materialsOutput_activeID_endTime_defaultValue)?has_content>
							<#assign materialsOutput_activeID_endTime_defaultValue  = getDefaultDateTime(materialsOutput_activeID_endTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(materialsOutput.activeID.endTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="materialsOutput.activeID.endTime" value="${materialsOutput_activeID_endTime_defaultValue!}" type="dateTime"  id="materialsOutput.activeID.endTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (materialsOutput.activeID.endTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="materialsOutput.activeID.endTime" value="${materialsOutput.activeID.endTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="materialsOutput.activeID.endTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="materialsOutput.activeID.endTime" value="" type="dateTime" id="materialsOutput.activeID.endTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign materialsOutput_activeID_productId_productCode_defaultValue  = ''>
														<#assign materialsOutput_activeID_productId_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="materialsOutput.activeID.productId.productCode" id="materialsOutput_activeID_productId_productCode"  style=";" originalvalue="<#if !newObj || (materialsOutput.activeID.productId.productCode)?has_content>${(materialsOutput.activeID.productId.productCode?html)!}<#else>${materialsOutput_activeID_productId_productCode_defaultValue!}</#if>" value="<#if !newObj || (materialsOutput.activeID.productId.productCode)?has_content>${(materialsOutput.activeID.productId.productCode?html)!}<#else>${materialsOutput_activeID_productId_productCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign materialsOutput_activeID_productId_productName_defaultValue  = ''>
														<#assign materialsOutput_activeID_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="materialsOutput.activeID.productId.productName" id="materialsOutput_activeID_productId_productName"  style=";" originalvalue="<#if !newObj || (materialsOutput.activeID.productId.productName)?has_content>${(materialsOutput.activeID.productId.productName?html)!}<#else>${materialsOutput_activeID_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (materialsOutput.activeID.productId.productName)?has_content>${(materialsOutput.activeID.productId.productName?html)!}<#else>${materialsOutput_activeID_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031316281')}" >${getText('MESBasic.propertydisplayName.randon1484031316281')}</label>
				</td>
				
						<#assign materialsOutput_wareID_wareName_defaultValue  = ''>
														<#assign materialsOutput_wareID_wareName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}" viewType="readonly" deValue="${materialsOutput_wareID_wareName_defaultValue!}" conditionfunc="WOM.produceRecords.materialsOutput.outputView._querycustomFunc('materialsOutput_wareID_wareName')" view=true  value="${(materialsOutput.wareID.wareName)!}" displayFieldName="wareName" name="materialsOutput.wareID.wareName" id="materialsOutput_wareID_wareName" type="other" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceRecords_materialsOutput_outputView_form" editCustomCallback=";" refViewCode="MESBasic_1_wareMan_wareRef" onkeyupfuncname=";_callback_materialsOutput_wareID_wareName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(materialsOutput.id)?? && (materialsOutput.wareID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${materialsOutput.wareID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceRecords_materialsOutput_outputView_form',obj, 'materialsOutput.wareID', '/MESBasic/wareMan/ware/wareRef.action');
												CUI.commonFills('WOM_produceRecords_materialsOutput_outputView_form', 'materialsOutput.wareID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541146740613')}" >${getText('WOM.propertydisplayName.randon1541146740613')}</label>
				</td>
				
						<#assign materialsOutput_produceNum_defaultValue  = ''>
							 							<#assign materialsOutput_produceNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="materialsOutput.produceNum" id="materialsOutput_produceNum"  style=";" originalvalue="<#if newObj&& !(materialsOutput.produceNum)?has_content>${materialsOutput_produceNum_defaultValue!}<#elseif (materialsOutput.produceNum)?has_content>#{(materialsOutput.produceNum)!; m6M6}</#if>" value="<#if newObj&& !(materialsOutput.produceNum)?has_content>${materialsOutput_produceNum_defaultValue!}<#elseif (materialsOutput.produceNum)?has_content>#{(materialsOutput.produceNum)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541146730158')}" >${getText('WOM.propertydisplayName.randon1541146730158')}</label>
				</td>
				
						<#assign materialsOutput_batch_defaultValue  = ''>
							 							<#assign materialsOutput_batch_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="materialsOutput.batch" id="materialsOutput_batch"  style=";" originalvalue="<#if !newObj || (materialsOutput.batch)?has_content>${(materialsOutput.batch?html)!}<#else>${materialsOutput_batch_defaultValue!}</#if>" value="<#if !newObj || (materialsOutput.batch)?has_content>${(materialsOutput.batch?html)!}<#else>${materialsOutput_batch_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489730174515')}" >${getText('WOM.propertydisplayName.randon1489730174515')}</label>
				</td>
				
						<#assign materialsOutput_activeID_planNum_defaultValue  = ''>
														<#assign materialsOutput_activeID_planNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="materialsOutput.activeID.planNum" id="materialsOutput_activeID_planNum"  style=";" originalvalue="<#if newObj&& !(materialsOutput.activeID.planNum)?has_content>${materialsOutput_activeID_planNum_defaultValue!}<#elseif (materialsOutput.activeID.planNum)?has_content>#{(materialsOutput.activeID.planNum)!; m6M6}</#if>" value="<#if newObj&& !(materialsOutput.activeID.planNum)?has_content>${materialsOutput_activeID_planNum_defaultValue!}<#elseif (materialsOutput.activeID.planNum)?has_content>#{(materialsOutput.activeID.planNum)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398235640483')}" >${getText('X6Basic.propertydisplayName.radion1398235640483')}</label>
				</td>
				
						<#assign materialsOutput_activeID_productId_productBaseUnit_name_defaultValue  = ''>
														<#assign materialsOutput_activeID_productId_productBaseUnit_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="materialsOutput.activeID.productId.productBaseUnit.name" id="materialsOutput_activeID_productId_productBaseUnit_name"  style=";" originalvalue="<#if !newObj || (materialsOutput.activeID.productId.productBaseUnit.name)?has_content>${(materialsOutput.activeID.productId.productBaseUnit.name?html)!}<#else>${materialsOutput_activeID_productId_productBaseUnit_name_defaultValue!}</#if>" value="<#if !newObj || (materialsOutput.activeID.productId.productBaseUnit.name)?has_content>${(materialsOutput.activeID.productId.productBaseUnit.name?html)!}<#else>${materialsOutput_activeID_productId_productBaseUnit_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541146719340')}" >${getText('WOM.propertydisplayName.randon1541146719340')}</label>
				</td>
				
						<#assign materialsOutput_remark_defaultValue  = ''>
							 							<#assign materialsOutput_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="materialsOutput_remark" originalvalue="<#if !newObj || (materialsOutput.remark)?has_content>${(materialsOutput.remark?html)!}<#else>${materialsOutput_remark_defaultValue?html}</#if>"  name="materialsOutput.remark" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (materialsOutput.remark)?has_content>${(materialsOutput.remark)!}<#else>${materialsOutput_remark_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489731677162')}" >${getText('MESBasic.propertydisplayName.randon1489731677162')}</label>
				</td>
				
						<#assign materialsOutput_placeSet_placeSetName_defaultValue  = ''>
														<#assign materialsOutput_placeSet_placeSetName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}" viewType="readonly" deValue="${materialsOutput_placeSet_placeSetName_defaultValue!}" conditionfunc="WOM.produceRecords.materialsOutput.outputView._querycustomFunc('materialsOutput_placeSet_placeSetName')" view=true  value="${(materialsOutput.placeSet.placeSetName)!}" displayFieldName="placeSetName" name="materialsOutput.placeSet.placeSetName" id="materialsOutput_placeSet_placeSetName" type="other" url="/MESBasic/storeSet/storeSet/storeRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceRecords_materialsOutput_outputView_form" editCustomCallback=";" refViewCode="MESBasic_1_storeSet_storeRef"  onkeyupfuncname=";_callback_materialsOutput_placeSet_placeSetName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(materialsOutput.id)?? && (materialsOutput.placeSet.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${materialsOutput.placeSet.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceRecords_materialsOutput_outputView_form',obj, 'materialsOutput.placeSet', '/MESBasic/storeSet/storeSet/storeRef.action');
												CUI.commonFills('WOM_produceRecords_materialsOutput_outputView_form', 'materialsOutput.placeSet',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
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
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceRecords_outputView,html,WOM_7.5.0.0_produceRecords_MaterialsOutput,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.produceRecords.materialsOutput.outputView.beforeSaveProcess = function(){}
	WOM.produceRecords.materialsOutput.outputView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.produceRecords.materialsOutput.outputView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_produceRecords_materialsOutput_outputView_form').trigger('beforeSubmit');
		//materialsOutput.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="materialsOutput.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_produceRecords_materialsOutput_outputView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_produceRecords_materialsOutput_outputView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.produceRecords.materialsOutput.outputView.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.produceRecords.materialsOutput.outputView.print = function(url){
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
		
		WOM.produceRecords.materialsOutput.outputView.saveSetting = function(){
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
		WOM.produceRecords.materialsOutput.outputView.printSetting = function(){
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
			WOM.produceRecords.materialsOutput.outputView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceRecords.materialsOutput.outputView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.produceRecords.materialsOutput.outputView.settingDialog.show();
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
			WOM.produceRecords.materialsOutput.outputView._customCallBack = customCallBack;
		}
		WOM.produceRecords.materialsOutput.outputView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_produceRecords_materialsOutput_outputView_fileupload').length == 0) {
				$('body').append('<div id="WOM_produceRecords_materialsOutput_outputView_fileupload"></div>');
			}
			WOM.produceRecords.materialsOutput.outputView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_produceRecords_materialsOutput_outputView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_produceRecords_materialsOutput_outputView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.produceRecords.materialsOutput.outputView.infoDialog.show();
			if($('#WOM_produceRecords_materialsOutput_outputView_fileupload').html() == '') {
				$('#WOM_produceRecords_materialsOutput_outputView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_produceRecords_materialsOutput&entityCode=WOM_7.5.0.0_produceRecords&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.produceRecords.materialsOutput.outputView.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.produceRecords.materialsOutput.outputView.referenceCopyBackInfo";
		WOM.produceRecords.materialsOutput.outputView.dialog = dialog;
		WOM.produceRecords.materialsOutput.outputView._dialog = foundation.common.select({
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
	
	WOM.produceRecords.materialsOutput.outputView.referenceCopyBackInfo = function(obj){
		if(WOM.produceRecords.materialsOutput.outputView._dialog){
			WOM.produceRecords.materialsOutput.outputView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.produceRecords.materialsOutput.outputView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_produceRecords_materialsOutput_outputView_form','WOM_produceRecords_materialsOutput_outputView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.produceRecords.materialsOutput.outputView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.produceRecords.materialsOutput.outputView.dialog._el).load('/WOM/produceRecords/materialsOutput/outputView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.produceRecords.materialsOutput.outputView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.produceRecords.materialsOutput.outputView.dialog._config.iframe, WOM.produceRecords.materialsOutput.outputView.dialog._dialog ).prop( 'src', '/WOM/produceRecords/materialsOutput/outputView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.produceRecords.materialsOutput.outputView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.produceRecords.materialsOutput.outputView.dialog._el).load('/WOM/produceRecords/materialsOutput/outputView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.produceRecords.materialsOutput.outputView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.produceRecords.materialsOutput.outputView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.produceRecords.materialsOutput.outputView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.produceRecords.materialsOutput.outputView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.produceRecords.materialsOutput.outputView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_produceRecords_materialsOutput_outputView' + '_' + extraFrameParam;
		var callbackName="";
		WOM.produceRecords.materialsOutput.outputView._prefix = '';
		WOM.produceRecords.materialsOutput.outputView._oGrid = oGrid;
		WOM.produceRecords.materialsOutput.outputView._sUrl = url;
		if(customCallBack){
			WOM.produceRecords.materialsOutput.outputView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.produceRecords.materialsOutput.outputView.gridEventObj = gridEventObj;
			callbackName = "WOM.produceRecords.materialsOutput.outputView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.produceRecords.materialsOutput.outputView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.produceRecords.materialsOutput.outputView.getMultiselectCallBackInfo_DG" : "WOM.produceRecords.materialsOutput.outputView.getcallBackInfo_DG";
			WOM.produceRecords.materialsOutput.outputView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.produceRecords.materialsOutput.outputView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.produceRecords.materialsOutput.outputView.getcallBackInfo";
		}
		if(WOM.produceRecords.materialsOutput.outputView._prefix!=''){
			WOM.produceRecords.materialsOutput.outputView._prefix = WOM.produceRecords.materialsOutput.outputView._prefix.substring(1);
		}
		if(WOM.produceRecords.materialsOutput.outputView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceRecords.materialsOutput.outputView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.produceRecords.materialsOutput.outputView._querycustomFuncN == "function") {
				refparam += WOM.produceRecords.materialsOutput.outputView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.produceRecords.materialsOutput.outputView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.produceRecords.materialsOutput.outputView._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceRecords.materialsOutput.outputView.query_"+obj+")!='undefined'") ? eval('WOM.produceRecords.materialsOutput.outputView.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.produceRecords.materialsOutput.outputView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_produceRecords_materialsOutput_outputView_form',obj[0], WOM.produceRecords.materialsOutput.outputView._prefix, WOM.produceRecords.materialsOutput.outputView._sUrl);
		CUI.commonFills('WOM_produceRecords_materialsOutput_outputView_form',WOM.produceRecords.materialsOutput.outputView._prefix,obj[0]);

		try{
			if(WOM.produceRecords.materialsOutput.outputView._customCallBack) {
				eval(WOM.produceRecords.materialsOutput.outputView._customCallBack);
				WOM.produceRecords.materialsOutput.outputView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceRecords.materialsOutput.outputView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.produceRecords.materialsOutput.outputView.getcallBackInfo_DG_IE = function(obj){
		if(WOM.produceRecords.materialsOutput.outputView._customBeforeCallBack) {
			var flag = eval(WOM.produceRecords.materialsOutput.outputView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.produceRecords.materialsOutput.outputView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceRecords.materialsOutput.outputView._sUrl);
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
			if(WOM.produceRecords.materialsOutput.outputView._customCallBack) {
				eval(WOM.produceRecords.materialsOutput.outputView._customCallBack);
				WOM.produceRecords.materialsOutput.outputView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceRecords.materialsOutput.outputView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.produceRecords.materialsOutput.outputView.getcallBackInfo_DG = function(obj){
		if(WOM.produceRecords.materialsOutput.outputView._customBeforeCallBack) {
			var flag = eval(WOM.produceRecords.materialsOutput.outputView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.produceRecords.materialsOutput.outputView._currRow).next().length==0){
					WOM.produceRecords.materialsOutput.outputView._oGrid.addNewRow();
				}	
				WOM.produceRecords.materialsOutput.outputView._currRow = $(WOM.produceRecords.materialsOutput.outputView._currRow).next();
				$(WOM.produceRecords.materialsOutput.outputView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.produceRecords.materialsOutput.outputView._currRow,obj[i],WOM.produceRecords.materialsOutput.outputView._prefix,WOM.produceRecords.materialsOutput.outputView._sUrl);
			eval("CUI.commonFills_DG(WOM.produceRecords.materialsOutput.outputView._currRow,WOM.produceRecords.materialsOutput.outputView._prefix,obj[i],WOM.produceRecords.materialsOutput.outputView._oGrid)");
		}
		try{
			if(WOM.produceRecords.materialsOutput.outputView._customCallBack) {
				eval(WOM.produceRecords.materialsOutput.outputView._customCallBack);
				WOM.produceRecords.materialsOutput.outputView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceRecords.materialsOutput.outputView._dialog.close();
		} catch(e){}
	};
	
	WOM.produceRecords.materialsOutput.outputView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.produceRecords.materialsOutput.outputView._oGrid, WOM.produceRecords.materialsOutput.outputView._currRow, WOM.produceRecords.materialsOutput.outputView._key, WOM.produceRecords.materialsOutput.outputView._displayFieldName, obj[i])
		}
		try{
			if(WOM.produceRecords.materialsOutput.outputView._customCallBack) {
				eval(WOM.produceRecords.materialsOutput.outputView._customCallBack);
				WOM.produceRecords.materialsOutput.outputView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceRecords.materialsOutput.outputView._dialog.close();
		} catch(e){}
	};
	
	WOM.produceRecords.materialsOutput.outputView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.produceRecords.materialsOutput.outputView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceRecords_materialsOutput_outputView_form'));
        			}
        	   	}
        	}
      	});
	};
	WOM.produceRecords.materialsOutput.outputView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.produceRecords.materialsOutput.outputView.initCount = 0;
	WOM.produceRecords.materialsOutput.outputView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_outputView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_produceRecords_materialsOutput_outputView_datagrids');	
		var	conHeight = h-$("#WOM_produceRecords_materialsOutput_outputView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_produceRecords_materialsOutput_outputView_main_div .edit-panes-s").each(function(index){
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
							if(WOM.produceRecords.materialsOutput.outputView.initCount <= 2) {
								setTimeout(function(){WOM.produceRecords.materialsOutput.outputView.initSize();}, 200);
								WOM.produceRecords.materialsOutput.outputView.initCount++;
							}/* else {
								WOM.produceRecords.materialsOutput.outputView.initCount = 0;
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
		WOM.produceRecords.materialsOutput.outputView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.produceRecords.materialsOutput.outputView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.produceRecords.materialsOutput.outputView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceRecords_outputView,js,WOM_7.5.0.0_produceRecords_MaterialsOutput,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>