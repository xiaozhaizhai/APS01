<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "X6Basic_timeRegion_timeRegion">
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
        <#assign configTitle = getText('X6Basic.viewtitle.randon1441883036977')>
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
		#X6Basic_timeRegion_timeRegion_editcopy_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    //紧贴头部，取消10px的空隙
		</style>
		<script type="text/javascript">
			CUI.ns('X6Basic.timeRegion.timeRegion.editcopy');
			X6Basic.timeRegion.timeRegion.editcopy.currentUser = ${userJson};
			X6Basic.timeRegion.timeRegion.editcopy.currentStaff = ${staffJson};
			X6Basic.timeRegion.timeRegion.editcopy.currentDepartment = ${deptJson};
			X6Basic.timeRegion.timeRegion.editcopy.currentPosition = ${postJson};
			X6Basic.timeRegion.timeRegion.editcopy.currentCompany = ${compJson};
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
		<@s.form errorBarId="workbenchErrorBar" hiddenField="timeRegion.id," onsubmitMethod="X6Basic.timeRegion.timeRegion.editcopy.beforeSubmitMethod()" id="X6Basic_timeRegion_timeRegion_editcopy_form" namespace="/X6Basic/timeRegion/timeRegion/editcopy" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=X6Basic_1.0_timeRegion_TimeRegion&_bapFieldPermissonModelName_=TimeRegion" callback="X6Basic.timeRegion.timeRegion.editcopy._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="X6Basic_timeRegion_timeRegion_editcopy_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((timeRegion.status)?? && timeRegion.status == 77)>
									<#if !(superEdit!false) && id??>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="X6Basic.timeRegion.timeRegion.editcopy.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
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
												X6Basic.timeRegion.timeRegion.editcopy.submit(true);
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
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="X6Basic.timeRegion.timeRegion.editcopy.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="X6Basic_timeRegion_timeRegion_editcopy_form_attcount"></em></i></span>
										</a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
							</div>
    					</div>
    					
    					<div class="edit-main" id="X6Basic_timeRegion_timeRegion_editcopy">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="editcopy">
								<input type="hidden" name="datagridKey" value="X6Basic_timeRegion_timeRegion_editcopy_datagrids">
								<input type="hidden" name="viewCode" value="X6Basic_1.0_timeRegion_editcopy">
								<input type="hidden" name="modelName" value="TimeRegion">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="timeRegion.version" value="${(timeRegion.version)!0}" />
								<input type="hidden" name="timeRegion.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">
										<input type="hidden" name="timeRegion.id" value="${(timeRegion.id)!""}" originalvalue="${(timeRegion.id)!""}"/>

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "X6Basic_timeRegion_timeRegion_editcopy_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_timeRegion', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr >
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_name_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_name_permit = checkFieldPermission('timeRegion.name','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_name')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441778463050')}" >${getText('X6Basic.propertydisplayName.randon1441778463050')}</label>
				</td>
				
						<#assign timeRegion_name_defaultValue  = ''>
							 							<#assign timeRegion_name_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_name_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_name_permit = checkFieldPermission('timeRegion.name','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_name')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_name_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="timeRegion.name" id="timeRegion_name"  style=";" originalvalue="<#if !newObj || (timeRegion.name)?has_content>${(timeRegion.name?html)!}<#else>${timeRegion_name_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.name)?has_content>${(timeRegion.name?html)!}<#else>${timeRegion_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_timeRegion_TimeRegion_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_unit_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_unit_permit = checkFieldPermission('timeRegion.unit','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_unit')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_unit_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_unit_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441779032052')}" >${getText('X6Basic.propertydisplayName.randon1441779032052')}</label>
				</td>
				
						<#assign timeRegion_unit_defaultValue  = ''>
							 							<#assign timeRegion_unit_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_unit_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_unit_permit = checkFieldPermission('timeRegion.unit','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_unit')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_unit_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_unit_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if X6Basic_1_0_timeRegion_TimeRegion_unit_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${timeRegion_unit_defaultValue!}" formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="timeRegion.unit.id" code="timeUnit" value="${(timeRegion.unit.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${timeRegion_unit_defaultValue!}" formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="timeRegion.unit.id" code="timeUnit" value="${(timeRegion.unit.id)!}"  />
									</#if>
								<#else>
									<#if X6Basic_1_0_timeRegion_TimeRegion_unit_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="timeRegion.unit.id" code="timeUnit" value="${(timeRegion.unit.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="timeRegion.unit.id" code="timeUnit" value="${(timeRegion.unit.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				</tr><tr >
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit = checkFieldPermission('timeRegion.useEntity','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_useEntity')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441797696424')}" >${getText('X6Basic.propertydisplayName.randon1441797696424')}</label>
				</td>
				
						<#assign timeRegion_useEntity_defaultValue  = ''>
							 							<#assign timeRegion_useEntity_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit = checkFieldPermission('timeRegion.useEntity','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_useEntity')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${timeRegion_useEntity_defaultValue!}" formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=true view=true cssStyle="" name="timeRegion.useEntity" code="entityType" value="${(timeRegion.useEntity)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${timeRegion_useEntity_defaultValue!}" formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=true  name="timeRegion.useEntity" code="entityType" value="${(timeRegion.useEntity)!}"  />
									</#if>
								<#else>
									<#if X6Basic_1_0_timeRegion_TimeRegion_useEntity_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=true view=true cssStyle="" name="timeRegion.useEntity" code="entityType" value="${(timeRegion.useEntity)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="X6Basic_timeRegion_timeRegion_editcopy_form" classStyle="cui-noborder-input" ecFlag=true multable=true  name="timeRegion.useEntity" code="entityType" value="${(timeRegion.useEntity)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
						<#assign complex_datagrid_1441779538248_defaultValue  = ''>
				<td nullable=false class="edit-table-content"  colspan="4" style="text-align: left;;" >
				</td>
		</tr>
	</table>
	<table class="edit-table" style="display:none">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_startTime_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_startTime_permit = checkFieldPermission('timeRegion.startTime','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_startTime')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_startTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_startTime_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441851237774')}" >${getText('X6Basic.propertydisplayName.randon1441851237774')}</label>
				</td>
				
						<#assign timeRegion_startTime_defaultValue  = ''>
							 							<#assign timeRegion_startTime_defaultValue  = ''>
					<#if (timeRegion_startTime_defaultValue)?? &&(timeRegion_startTime_defaultValue)?has_content>
							<#assign timeRegion_startTime_defaultValue  = getDefaultDateTime(timeRegion_startTime_defaultValue!)?date>
					</#if>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_startTime_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_startTime_permit = checkFieldPermission('timeRegion.startTime','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_startTime')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_startTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content" celltype="DATE"  style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_startTime_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<#if newObj && !(timeRegion.startTime)?has_content>
								<#if X6Basic_1_0_timeRegion_TimeRegion_startTime_permit == 1>
								<@datepicker  property_type="DATE" cssClass="cui-noborder-input" name="timeRegion.startTime" type="date" value="${timeRegion_startTime_defaultValue!}" id="timeRegion.startTime" view=true cssStyle=""  />
								<#else>
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="timeRegion.startTime" type="date" value="${timeRegion_startTime_defaultValue!}" id="timeRegion.startTime"   cssStyle=""  />
								</#if>
							<#else>
							<#if (timeRegion.startTime)??>
								<#if X6Basic_1_0_timeRegion_TimeRegion_startTime_permit == 1>
								<@datepicker  property_type="DATE" cssClass="cui-noborder-input" name="timeRegion.startTime" type="date" value="${timeRegion.startTime?string('yyyy-MM-dd')}" id="timeRegion.startTime" view=true cssStyle=""  />
								<#else>
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="timeRegion.startTime" type="date" value="${timeRegion.startTime?string('yyyy-MM-dd')}" id="timeRegion.startTime"   cssStyle=""  />
								</#if>
							<#else>
								<#if X6Basic_1_0_timeRegion_TimeRegion_startTime_permit == 1>
								<@datepicker  property_type="DATE" cssClass="cui-noborder-input" name="timeRegion.startTime" type="date" value="" id="timeRegion.startTime" cssStyle="" view=true />
								<#else>
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="timeRegion.startTime" type="date" value="" id="timeRegion.startTime" cssStyle=""   />
								</#if>
							</#if>
							</#if>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit = checkFieldPermission('timeRegion.recordNum','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_recordNum')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441851288390')}" >${getText('X6Basic.propertydisplayName.randon1441851288390')}</label>
				</td>
				
						<#assign timeRegion_recordNum_defaultValue  = ''>
							 							<#assign timeRegion_recordNum_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit = checkFieldPermission('timeRegion.recordNum','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_recordNum')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="timeRegion.recordNum" id="timeRegion_recordNum"  style=";" originalvalue="<#if !newObj || (timeRegion.recordNum)?has_content>${(timeRegion.recordNum?html)!}<#else>${timeRegion_recordNum_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.recordNum)?has_content>${(timeRegion.recordNum?html)!}<#else>${timeRegion_recordNum_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_setyear_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setyear_permit = checkFieldPermission('timeRegion.setyear','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setyear')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441880564502')}" >${getText('X6Basic.propertydisplayName.randon1441880564502')}</label>
				</td>
				
						<#assign timeRegion_setyear_defaultValue  = ''>
							 							<#assign timeRegion_setyear_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_setyear_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setyear_permit = checkFieldPermission('timeRegion.setyear','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setyear')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="timeRegion.setyear" id="timeRegion_setyear"  style=";" originalvalue="<#if !newObj || (timeRegion.setyear)?has_content>${(timeRegion.setyear?html)!}<#else>${timeRegion_setyear_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.setyear)?has_content>${(timeRegion.setyear?html)!}<#else>${timeRegion_setyear_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_setquater_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setquater_permit = checkFieldPermission('timeRegion.setquater','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setquater')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setquater_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_setquater_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441880604498')}" >${getText('X6Basic.propertydisplayName.randon1441880604498')}</label>
				</td>
				
						<#assign timeRegion_setquater_defaultValue  = ''>
							 							<#assign timeRegion_setquater_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_setquater_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setquater_permit = checkFieldPermission('timeRegion.setquater','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setquater')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setquater_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_setquater_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_setquater_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="timeRegion.setquater" id="timeRegion_setquater"  style=";" originalvalue="<#if !newObj || (timeRegion.setquater)?has_content>${(timeRegion.setquater?html)!}<#else>${timeRegion_setquater_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.setquater)?has_content>${(timeRegion.setquater?html)!}<#else>${timeRegion_setquater_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_timeRegion_TimeRegion_setquater_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_setMon_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setMon_permit = checkFieldPermission('timeRegion.setMon','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setMon')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441880636553')}" >${getText('X6Basic.propertydisplayName.randon1441880636553')}</label>
				</td>
				
						<#assign timeRegion_setMon_defaultValue  = ''>
							 							<#assign timeRegion_setMon_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_setMon_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setMon_permit = checkFieldPermission('timeRegion.setMon','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setMon')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="timeRegion.setMon" id="timeRegion_setMon"  style=";" originalvalue="<#if !newObj || (timeRegion.setMon)?has_content>${(timeRegion.setMon?html)!}<#else>${timeRegion_setMon_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.setMon)?has_content>${(timeRegion.setMon?html)!}<#else>${timeRegion_setMon_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
				
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
			<#if false && isIE>
					<#assign routeFlag = "1">
			<#else>
					<#assign routeFlag = "0">
			</#if>

			
							<script type="text/javascript">
								function TimeRegionPar_dg1441882940310_newauto(event){

$('table:eq(1)').show();


var type=$('#timeRegionunitid').val();

var startTime=$('input[name="timeRegion.startTime"]').val();

var num=$('input[name="timeRegion.recordNum"]').val();


if(startTime.length>0 && num.length>0){
  
  //增行之前先把所有数据删掉
  TimeRegionPar_dg1441779428621Widget._DT.delAllRows();
 
 var date = new Date(startTime);

 var total=parseInt(num);
 
 //月
 if(type=="timeUnit/03"){
 
 for(var i=0;i<total;i++){
 
  //开始时间
  var start = new Date(startTime);
  start.setMonth(start.getMonth() + i);
  if (start.getDate() != date.getDate()) { start.setDate(0); }
  //日期转字符
  var year = start.getFullYear();
  var month =(start.getMonth() + 1).toString();
  var day = (start.getDate()).toString();
                if (month.length == 1) {
                    month = "0" + month;
                }
                if (day.length == 1) {
                    day = "0" + day;
                }
  var startStr = year +"-"+ month +"-"+day;
  //获得季度
  var quarter=1;
  if( parseInt(month)>=4 && parseInt(month)<=6 ){quarter=2;}
  if( parseInt(month)>=7 && parseInt(month)<=9 ){quarter=3;}
  if( parseInt(month)>=10 && parseInt(month)<=12 ){quarter=4}

  var name=year+"年"+month+"月";
  
 
   TimeRegionPar_dg1441779428621Widget.addRow();
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"name",name);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"startDate",startStr);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"year",year);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"quarter",quarter);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"month",month);
  
  //结束时间
  var end = new Date(startTime);
  end.setMonth(end.getMonth() + i+1);
  if (end.getDate() != date.getDate()) { end.setDate(0); }
  //日期转字符
  var year2 = end.getFullYear();
  var month2 =(end.getMonth() + 1).toString();
  var day2 = (end.getDate()).toString();
                if (month2.length == 1) {
                    month2 = "0" + month2;
                }
                if (day2.length == 1) {
                    day2 = "0" + day2;
                }
  var endStr = year2 +"-"+ month2 +"-"+day2;
  
    TimeRegionPar_dg1441779428621Widget.setCellValue(i,"endDate",endStr);
  
  
  }
  
 
 
 }
 
//年
if(type=="timeUnit/01"){
 
 for(var i=0;i<total;i++){
 
  //开始时间
  var start = new Date(startTime);
  start.setFullYear(start.getFullYear() + i);
  if (start.getDate() != date.getDate()) { start.setDate(0); }
  //日期转字符
  var year = start.getFullYear();
  var month =(start.getMonth() + 1).toString();
  var day = (start.getDate()).toString();
                if (month.length == 1) {
                    month = "0" + month;
                }
                if (day.length == 1) {
                    day = "0" + day;
                }
  var startStr = year +"-"+ month +"-"+day;
  //获得季度
  var quarter=1;
  if( parseInt(month)>=4 && parseInt(month)<=6 ){quarter=2;}
  if( parseInt(month)>=7 && parseInt(month)<=9 ){quarter=3;}
  if( parseInt(month)>=10 && parseInt(month)<=12 ){quarter=4}

  var name=year+"年";
  
 
   TimeRegionPar_dg1441779428621Widget.addRow();
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"name",name);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"startDate",startStr);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"year",year);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"quarter",quarter);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"month",month);
  
  //结束时间
  var end = new Date(startTime);
  end.setFullYear(end.getFullYear() + i+1);
  if (end.getDate() != date.getDate()) { end.setDate(0); }
  //日期转字符
  var year2 = end.getFullYear();
  var month2 =(end.getMonth() + 1).toString();
  var day2 = (end.getDate()).toString();
                if (month2.length == 1) {
                    month2 = "0" + month2;
                }
                if (day2.length == 1) {
                    day2 = "0" + day2;
                }
  var endStr = year2 +"-"+ month2 +"-"+day2;
  
    TimeRegionPar_dg1441779428621Widget.setCellValue(i,"endDate",endStr);
  
  
  }
  
 
 
 }
 
 
//季度
if(type=="timeUnit/02"){
 
 for(var i=0;i<total;i++){
 
  //开始时间
  var start = new Date(startTime);
  start.setMonth(start.getMonth() + i*3);
  if (start.getDate() != date.getDate()) { start.setDate(0); }
  //日期转字符
  var year = start.getFullYear();
  var month =(start.getMonth() + 1).toString();
  var day = (start.getDate()).toString();
                if (month.length == 1) {
                    month = "0" + month;
                }
                if (day.length == 1) {
                    day = "0" + day;
                }
  var startStr = year +"-"+ month +"-"+day;
  //获得季度
  var quarter=1;
  if( parseInt(month)>=4 && parseInt(month)<=6 ){quarter=2;}
  if( parseInt(month)>=7 && parseInt(month)<=9 ){quarter=3;}
  if( parseInt(month)>=10 && parseInt(month)<=12 ){quarter=4}

  var name=year+"年第"+quarter+"季度";
  
 
   TimeRegionPar_dg1441779428621Widget.addRow();
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"name",name);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"startDate",startStr);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"year",year);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"quarter",quarter);
   TimeRegionPar_dg1441779428621Widget.setCellValue(i,"month",month);
  
  //结束时间
  var end = new Date(startTime);
  end.setMonth(end.getMonth() + i*3+3);
  if (end.getDate() != date.getDate()) { end.setDate(0); }
  //日期转字符
  var year2 = end.getFullYear();
  var month2 =(end.getMonth() + 1).toString();
  var day2 = (end.getDate()).toString();
                if (month2.length == 1) {
                    month2 = "0" + month2;
                }
                if (day2.length == 1) {
                    day2 = "0" + day2;
                }
  var endStr = year2 +"-"+ month2 +"-"+day2;
  
    TimeRegionPar_dg1441779428621Widget.setCellValue(i,"endDate",endStr);
  
  
  }
  
 
 
 }
 
 


}



}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/X6Basic/timeRegion/timeRegion/data-dg1441882940310.action?timeRegion.id=${refId!-1}&refId=${refId!-1}">
			<#else>
				<#assign dUrl="/X6Basic/timeRegion/timeRegion/data-dg1441882940310.action?timeRegion.id=${(timeRegion.id)!-1}">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_TimeRegionPar_dg1441882940310_deldatagrid();}},{text:\"${getText('X6Basic.buttonPropertyshowName.radion1441853624563')}\",handler:function(event){TimeRegionPar_dg1441882940310_newauto(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_TimeRegionPar_dg1441882940310_deldatagrid();}},{text:\"${getText('X6Basic.buttonPropertyshowName.radion1441853624563')}\",handler:function(event){TimeRegionPar_dg1441882940310_newauto(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
			<input type="hidden" id="dg1441882940310_id" value="TimeRegionPar_dg1441882940310" />
			
			<input type="hidden" id="dg1441882940310_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('X6Basic.modelname.randon1441778429589')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/X6Basic/timeRegion/timeRegion/data-dg1441882940310.action?operateType=export" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dg1441882940310Page" prefix="TimeRegionPar_dg1441882940310" />
			<@datagrid withoutConfigTable=true id="TimeRegionPar_dg1441882940310" viewType="${viewType}" renderOverEvent="dg1441882940310RenderOverEvent" route="${routeFlag}" formId="X6Basic_timeRegion_timeRegion_editcopy_form" noPermissionKeys="name,startDate,endDate,year,quarter,month,week" modelCode="X6Basic_1.0_timeRegion_TimeRegionPar" dataUrl="${dUrl}" postData="&dg1441882940310Page.pageSize=65536" dataGridName="dg1441882940310" dtPage="dg1441882940310Page"  hidekeyPrefix="dg1441882940310" hidekey="['id','version']" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1441882940310PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="X6Basic.buttonPropertyshowName.radion1441853624563,newauto" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.randon1441784357503')}" width=100 showFormatFunc=""/>
							<#assign startDate_displayDefaultType=''>
								<#assign startDate_defaultValue=''>
										<#assign startDate_defaultValue=''>
										 								<#if (startDate_defaultValue)?? &&(startDate_defaultValue)?has_content>
									<#assign startDate_defaultValue  = getDefaultDateTime(startDate_defaultValue!)?date>
								</#if>

										
 
									<@datacolumn key="startDate"        showFormat="YMD" defaultValue="${(startDate_defaultValue!)?string}" defaultDisplay="${(startDate_displayDefaultType!)?string}" onchange="TimeRegionPar_dg1441882940310Widget.evalCustomFunction(nRow,sFieldName,'aa()')" decimal="" editable=true type="date" showType="date" notnull=false     textalign="center"  viewUrl="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.randon1441779162485')}" width=100 showFormatFunc=""/>
							<#assign endDate_displayDefaultType=''>
								<#assign endDate_defaultValue=''>
										<#assign endDate_defaultValue=''>
										 								<#if (endDate_defaultValue)?? &&(endDate_defaultValue)?has_content>
									<#assign endDate_defaultValue  = getDefaultDateTime(endDate_defaultValue!)?date>
								</#if>
 
									<@datacolumn key="endDate"        showFormat="YMD" defaultValue="${(endDate_defaultValue!)?string}" defaultDisplay="${(endDate_displayDefaultType!)?string}" decimal="" editable=true type="date" showType="date" notnull=false     textalign="center"  viewUrl="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.randon1441779207153')}" width=100 showFormatFunc=""/>
							<#assign year_displayDefaultType=''>
								<#assign year_defaultValue=''>
										<#assign year_defaultValue=''>
										  
									<@datacolumn key="year"        showFormat="TEXT" defaultValue="${(year_defaultValue!)?string}" defaultDisplay="${(year_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.randon1441779229335')}" width=100 showFormatFunc=""/>
							<#assign quarter_displayDefaultType=''>
								<#assign quarter_defaultValue=''>
										<#assign quarter_defaultValue=''>
										  
									<@datacolumn key="quarter"        showFormat="TEXT" defaultValue="${(quarter_defaultValue!)?string}" defaultDisplay="${(quarter_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.randon1441779338024')}" width=100 showFormatFunc=""/>
							<#assign month_displayDefaultType=''>
								<#assign month_defaultValue=''>
										<#assign month_defaultValue=''>
										  
									<@datacolumn key="month"        showFormat="TEXT" defaultValue="${(month_defaultValue!)?string}" defaultDisplay="${(month_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.randon1441779301329')}" width=100 showFormatFunc=""/>
							<#assign week_displayDefaultType=''>
								<#assign week_defaultValue=''>
										<#assign week_defaultValue=''>
										  
									<@datacolumn key="week"        showFormat="TEXT" defaultValue="${(week_defaultValue!)?string}" defaultDisplay="${(week_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.randon1441779320160')}" width=100 showFormatFunc=""/>
			
			</@datagrid>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
			
			<script type="text/javascript">
				function TimeRegionPar_dg1441882940310_check_datagridvalid(){
					//
					var errorObj =TimeRegionPar_dg1441882940310Widget._DT.testData();
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
				
				function savedg1441882940310DataGrid(){
					<#if  refId?? && (refId gt 0)>
					TimeRegionPar_dg1441882940310Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('TimeRegionPar_dg1441882940310Widget') > -1) {
						TimeRegionPar_dg1441882940310Widget.setAllRowEdited();
					}
					var json = TimeRegionPar_dg1441882940310Widget.parseEditedData();
					$('input[name="dg1441882940310ListJson"]').remove();
					$('<input type="hidden" name="dg1441882940310ListJson">').val(json).appendTo($('#X6Basic_timeRegion_timeRegion_editcopy_form'));
					$('<input type="hidden" name="dg1441882940310ModelCode">').val('X6Basic_1.0_timeRegion_TimeRegionPar').appendTo($('#X6Basic_timeRegion_timeRegion_editcopy_form'));
				}
				function DT_TimeRegionPar_dg1441882940310_deldatagrid(){
					var deleteRows = TimeRegionPar_dg1441882940310Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','timeRegionID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						CUI('<input type="hidden" name="dg1441882940310DeletedIds['+CUI('input[name^="dg1441882940310DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#X6Basic_timeRegion_timeRegion_editcopy_form'));
					});
				}
				function DT_TimeRegionPar_dg1441882940310_delTreeNodes(){
					var deleteRows = TimeRegionPar_dg1441882940310Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','timeRegionID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						CUI('<input type="hidden" name="dg1441882940310DeletedIds['+CUI('input[name^="dg1441882940310DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#X6Basic_timeRegion_timeRegion_editcopy_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('X6Basic_timeRegion_timeRegion_editcopy_datagrids');
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
							if(datagrids[0][i] == 'TimeRegionPar_dg1441882940310') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'TimeRegionPar_dg1441882940310';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'TimeRegionPar_dg1441882940310';
					}
					$('body').data('X6Basic_timeRegion_timeRegion_editcopy_datagrids', datagrids);
				});
				
				var TimeRegionPar_dg1441882940310_importDialog = null;
				function TimeRegionPar_dg1441882940310_showImportDialog(){
					try{
						if(TimeRegionPar_dg1441882940310_importDialog!=null&&TimeRegionPar_dg1441882940310_importDialog.isShow==1){
							return false;
						}
						var url = "/X6Basic/timeRegion/timeRegion/initImport.action?datagridCode=X6Basic_1.0_timeRegion_editcopydg1441882940310&tid=${id!}&datagridName=dg1441882940310";
						TimeRegionPar_dg1441882940310_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("TimeRegionPar_dg1441882940310"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();TimeRegionPar_dg1441882940310_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();TimeRegionPar_dg1441882940310_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						TimeRegionPar_dg1441882940310_importDialog.show();
					}catch(e){}
				}	
				
				function TimeRegionPar_dg1441882940310_downLoadFile(){
					var url = "/X6Basic/timeRegion/timeRegion/downLoad.action?datagridCode=X6Basic_1.0_timeRegion_editcopydg1441882940310&downloadType=template&fileName=dg1441882940310";
					window.open(url,"","");
				}
				function dg1441882940310RenderOverEvent(){
				}
				function dg1441882940310PageInitMethod(nTabIndex){
					X6Basic.timeRegion.timeRegion.editcopy.initSize(nTabIndex);
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
     	
		<div id="X6Basic_timeRegion_timeRegion_editcopy_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="X6Basic.timeRegion.timeRegion.editcopy.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_timeRegion_editcopy,html,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) -->
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
						$("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			X6Basic.timeRegion.timeRegion.editcopy.initCount = 0;
			X6Basic.timeRegion.timeRegion.editcopy.initSize = function(nTabIndex){
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
				var conHeight = h-$("#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-head").height()-$("#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-workflow").height()</#if>;
				$("#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('X6Basic_timeRegion_timeRegion_editcopy_datagrids');
				var padding_bottom=16;
				$("#X6Basic_timeRegion_timeRegion_editcopy_main_div .pd_bottom,#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-panes-s").each(function(index){
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
									if(X6Basic.timeRegion.timeRegion.editcopy.initCount <= 2) {
										setTimeout(function(){X6Basic.timeRegion.timeRegion.editcopy.initSize();}, 200);
										X6Basic.timeRegion.timeRegion.editcopy.initCount++;
									}/* else {
										X6Basic.timeRegion.timeRegion.editcopy.initCount = 0;
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
							if(($("#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-workflow").length > 0) && ($("#X6Basic_timeRegion_timeRegion_editcopy_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				X6Basic.timeRegion.timeRegion.editcopy.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				X6Basic.timeRegion.timeRegion.editcopy.initSize();
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
						if(parseInt($("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width"),10)==650){
							$("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//X6Basic.timeRegion.timeRegion.editcopy.resizeLayout();
						//X6Basic.timeRegion.timeRegion.editcopy.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width"),10)==800){
							$("#X6Basic_timeRegion_timeRegion_editcopy_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//X6Basic.timeRegion.timeRegion.editcopy.resizeLayout();
						//X6Basic.timeRegion.timeRegion.editcopy.initSize();
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
					X6Basic.timeRegion.timeRegion.editcopy.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					X6Basic.timeRegion.timeRegion.editcopy.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){X6Basic.timeRegion.timeRegion.editcopy.initSize();});
				/*
				X6Basic.timeRegion.timeRegion.editcopy.resizeLayout=function(){
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

		X6Basic.timeRegion.timeRegion.editcopy.validate = function(){
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
		X6Basic.timeRegion.timeRegion.editcopy.beforeSaveProcess = function(){
			try{eval("savedg1441882940310DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#X6Basic_timeRegion_timeRegion_editcopy_form').trigger('beforeSubmit');
			//timeRegion.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="timeRegion.extraCol"]').val(extraCol);
		}
		X6Basic.timeRegion.timeRegion.editcopy.processDataGrid = function(){
										<#if false && isIE>
										$('#X6Basic_timeRegion_timeRegion_editcopy_form').append(TimeRegionPar_dg1441882940310Widget._DT.createInputs('dg1441882940310List'));
										</#if>
		};
		X6Basic.timeRegion.timeRegion.editcopy.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!X6Basic.timeRegion.timeRegion.editcopy.validate()){return;}
			X6Basic.timeRegion.timeRegion.editcopy.beforeSaveProcess();

			//X6Basic.timeRegion.timeRegion.editcopy.processDataGrid();
			$('#X6Basic_timeRegion_timeRegion_editcopy_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('X6Basic_timeRegion_timeRegion_editcopy_form','X6Basic_timeRegion_timeRegion_editcopy_datagrids')) {      
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
		X6Basic.timeRegion.timeRegion.editcopy.print = function(){
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
		
		X6Basic.timeRegion.timeRegion.editcopy.saveSetting = function(){
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
		
		X6Basic.timeRegion.timeRegion.editcopy.printSetting = function(){
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
				X6Basic.timeRegion.timeRegion.editcopy.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.timeRegion.timeRegion.editcopy.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				X6Basic.timeRegion.timeRegion.editcopy.settingDialog.show();
			}
		}
		
		
		X6Basic.timeRegion.timeRegion.editcopy._callBackInfo = function(res){
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
 						window.opener.X6Basic.timeRegion.timeRegion.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.X6Basic.timeRegion.timeRegion.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				X6Basic.timeRegion.timeRegion.editcopy._customCallBack = customCallBack;
			}
			X6Basic.timeRegion.timeRegion.editcopy._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		X6Basic.timeRegion.timeRegion.editcopy.initMnemonic_DG_IE = function(oConfig){
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			X6Basic.timeRegion.timeRegion.editcopy.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			X6Basic.timeRegion.timeRegion.editcopy._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				X6Basic.timeRegion.timeRegion.editcopy._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		X6Basic.timeRegion.timeRegion.editcopy._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				X6Basic.timeRegion.timeRegion.editcopy.gridEventObj = gridEventObj;
				callbackName = "X6Basic.timeRegion.timeRegion.editcopy.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "X6Basic.timeRegion.timeRegion.editcopy.getMultiselectCallBackInfo_DG" : "X6Basic.timeRegion.timeRegion.editcopy.getcallBackInfo_DG";
				X6Basic.timeRegion.timeRegion.editcopy._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="X6Basic.timeRegion.timeRegion.editcopy.getcallBackInfo";
			}

			if(_prefix!=''){
				X6Basic.timeRegion.timeRegion.editcopy._prefix = _prefix.substring(1);
			}
			
			X6Basic.timeRegion.timeRegion.editcopy._oGrid = oGrid;
			X6Basic.timeRegion.timeRegion.editcopy._sUrl = url;
			if(customCallBack){
				X6Basic.timeRegion.timeRegion.editcopy._customCallBack = customCallBack;
			}
			if(X6Basic.timeRegion.timeRegion.editcopy._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegion.editcopy._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof X6Basic.timeRegion.timeRegion.editcopy._querycustomFuncN == "function") {
				refparam += X6Basic.timeRegion.timeRegion.editcopy._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			X6Basic.timeRegion.timeRegion.editcopy._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		X6Basic.timeRegion.timeRegion.editcopy._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(X6Basic.timeRegion.timeRegion.editcopy._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegion.editcopy._querycustomFunc(objName.replace(/\./g, '_')));
			}
			X6Basic.timeRegion.timeRegion.editcopy._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'X6Basic.timeRegion.timeRegion.editcopy.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		X6Basic.timeRegion.timeRegion.editcopy._querycustomFunc = function(obj) {
			var str = eval("typeof(X6Basic.timeRegion.timeRegion.editcopy.query_"+obj+")!='undefined'") ? eval('X6Basic.timeRegion.timeRegion.editcopy.query_'+obj+'()') : null;
			return str;
		};
		X6Basic.timeRegion.timeRegion.editcopy.getcallBackGroupInfo = function(obj){
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
			X6Basic.timeRegion.timeRegion.editcopy._dialog.close();
		}
		X6Basic.timeRegion.timeRegion.editcopy.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('X6Basic_timeRegion_timeRegion_editcopy_form',obj[0], X6Basic.timeRegion.timeRegion.editcopy._prefix, X6Basic.timeRegion.timeRegion.editcopy._sUrl);
			CUI.commonFills('X6Basic_timeRegion_timeRegion_editcopy_form',X6Basic.timeRegion.timeRegion.editcopy._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (X6Basic.timeRegion.timeRegion.editcopy._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(X6Basic.timeRegion.timeRegion.editcopy._customCallBack) {
					eval(X6Basic.timeRegion.timeRegion.editcopy._customCallBack);
					X6Basic.timeRegion.timeRegion.editcopy._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.timeRegion.timeRegion.editcopy._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		X6Basic.timeRegion.timeRegion.editcopy.getcallBackInfo_DG_IE = function(obj){
			if(X6Basic.timeRegion.timeRegion.editcopy._customBeforeCallBack) {
				var flag = eval(X6Basic.timeRegion.timeRegion.editcopy._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = X6Basic.timeRegion.timeRegion.editcopy.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.timeRegion.timeRegion.editcopy._sUrl);
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
				if(X6Basic.timeRegion.timeRegion.editcopy._customCallBack) {
					eval(X6Basic.timeRegion.timeRegion.editcopy._customCallBack);
					X6Basic.timeRegion.timeRegion.editcopy._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.timeRegion.timeRegion.editcopy._dialog.close();
			} catch(e){}
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		X6Basic.timeRegion.timeRegion.editcopy.getcallBackInfo_DG = function(obj){
			if(X6Basic.timeRegion.timeRegion.editcopy._customBeforeCallBack) {
				var flag = eval(X6Basic.timeRegion.timeRegion.editcopy._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(X6Basic.timeRegion.timeRegion.editcopy._currRow).next().length==0){
						X6Basic.timeRegion.timeRegion.editcopy._oGrid.addNewRow();
					}	
					X6Basic.timeRegion.timeRegion.editcopy._currRow = $(X6Basic.timeRegion.timeRegion.editcopy._currRow).next();
					$(X6Basic.timeRegion.timeRegion.editcopy._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(X6Basic.timeRegion.timeRegion.editcopy._currRow,obj[i], X6Basic.timeRegion.timeRegion.editcopy._prefix, X6Basic.timeRegion.timeRegion.editcopy._sUrl);
				eval("CUI.commonFills_DG(X6Basic.timeRegion.timeRegion.editcopy._currRow,X6Basic.timeRegion.timeRegion.editcopy._prefix,obj[i],X6Basic.timeRegion.timeRegion.editcopy._oGrid)");
			}
			try{
				if(X6Basic.timeRegion.timeRegion.editcopy._customCallBack) {
					eval(X6Basic.timeRegion.timeRegion.editcopy._customCallBack);
					X6Basic.timeRegion.timeRegion.editcopy._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.timeRegion.timeRegion.editcopy._dialog.close();
			} catch(e){}
		}
		
		X6Basic.timeRegion.timeRegion.editcopy.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(X6Basic.timeRegion.timeRegion.editcopy._oGrid, X6Basic.timeRegion.timeRegion.editcopy._currRow, X6Basic.timeRegion.timeRegion.editcopy._key, X6Basic.timeRegion.timeRegion.editcopy._displayFieldName, obj[i])
			}
			try{
				if(X6Basic.timeRegion.timeRegion.editcopy._customCallBack) {
					eval(X6Basic.timeRegion.timeRegion.editcopy._customCallBack);
					X6Basic.timeRegion.timeRegion.editcopy._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.timeRegion.timeRegion.editcopy._dialog.close();
			} catch(e){}
		};
		
		X6Basic.timeRegion.timeRegion.editcopy.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						X6Basic.timeRegion.timeRegion.editcopy.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_timeRegion_timeRegion_editcopy_form'));
						}
					}
				}
			});
		};

		$(function(){
			X6Basic.timeRegion.timeRegion.editcopy.onloadForProduct();
			
		});

		X6Basic.timeRegion.timeRegion.editcopy.beforeSubmitMethodSettingInPage = function(){
			X6Basic.timeRegion.timeRegion.editcopy.onsaveForProduct();
		};
		X6Basic.timeRegion.timeRegion.editcopy.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  X6Basic.timeRegion.timeRegion.editcopy.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		X6Basic.timeRegion.timeRegion.editcopy.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#X6Basic_timeRegion_timeRegion_editcopy_main_div").hide();
				},500);
			}else{
				CUI("#X6Basic_timeRegion_timeRegion_editcopy_main_div").hide();
			  	$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		X6Basic.timeRegion.timeRegion.editcopy.showThis = function(){
			if(!CUI("#X6Basic_timeRegion_timeRegion_editcopy_main_div").is(':visible')) {
				CUI("#X6Basic_timeRegion_timeRegion_editcopy_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		X6Basic.timeRegion.timeRegion.editcopy.showInfoDialog=function(mode){
			
			X6Basic.timeRegion.timeRegion.editcopy.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "X6Basic_timeRegion_timeRegion_editcopy_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			X6Basic.timeRegion.timeRegion.editcopy.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		X6Basic.timeRegion.timeRegion.editcopy.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=X6Basic_1.0_timeRegion");
			}
		}
		
		X6Basic.timeRegion.timeRegion.editcopy.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/X6Basic/timeRegion/timeRegion/dealInfo-list.action&dlTableInfoId=${(timeRegion.tableInfoId)?default('')}");
			}
		}
		X6Basic.timeRegion.timeRegion.editcopy.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=X6Basic_1.0_timeRegion_TimeRegion&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(timeRegion.tableInfoId)?default('')}");
			}
		}
		X6Basic.timeRegion.timeRegion.editcopy.supervision=function(){
			X6Basic.timeRegion.timeRegion.editcopy.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(timeRegion.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				X6Basic.timeRegion.timeRegion.editcopy.modifyOwnerStaffDialog.show();
		}
		


function aa(){


  var startTime=TimeRegionPar_dg1441779428621Widget.getCellValue(TimeRegionPar_dg1441779428621Widget.getSelectedRow(),"startDate");


  //开始时间
  var start = new Date(startTime);
 
  //日期转字符
  var year = start.getFullYear();
  var month =(start.getMonth() + 1).toString();
  var day = (start.getDate()).toString();
                if (month.length == 1) {
                    month = "0" + month;
                }
                if (day.length == 1) {
                    day = "0" + day;
                }
  //获得季度
  var quarter=1;
  if( parseInt(month)>=4 && parseInt(month)<=6 ){quarter=2;}
  if( parseInt(month)>=7 && parseInt(month)<=9 ){quarter=3;}
  if( parseInt(month)>=10 && parseInt(month)<=12 ){quarter=4}
  
  
   TimeRegionPar_dg1441779428621Widget.setCellValue(TimeRegionPar_dg1441779428621Widget.getSelectedRow(),"year",year);
   TimeRegionPar_dg1441779428621Widget.setCellValue(TimeRegionPar_dg1441779428621Widget.getSelectedRow(),"quarter",quarter);
   TimeRegionPar_dg1441779428621Widget.setCellValue(TimeRegionPar_dg1441779428621Widget.getSelectedRow(),"month",month);


}


		/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_timeRegion_editcopy,js,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */

		X6Basic.timeRegion.timeRegion.editcopy.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_timeRegion_editcopy,onloadForProduct,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
		}

		X6Basic.timeRegion.timeRegion.editcopy.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_timeRegion_editcopy,onsaveForProduct,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="X6Basic.timeRegion.timeRegion.editcopy.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
							 <li>
								<#if editNew>
								<a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.relatingModel.name)}">${getText(l.relatingModel.name)}</a>
								<#else>
									<a href="#" onclick="X6Basic.timeRegion.timeRegion.editcopy.showBusinessList('${l.relatingModel.code.replace('.','')}',${(timeRegion.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.relatingModel.entity.name)}(${(l.count)!})">${getText(l.relatingModel.entity.name)}(${(l.count)!})</a>
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