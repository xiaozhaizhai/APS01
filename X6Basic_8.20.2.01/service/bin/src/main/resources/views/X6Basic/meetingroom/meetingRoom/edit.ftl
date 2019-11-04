<style type="text/css">.ewc-dialog-el{height:100%;}.edit-table{width:98%;margin:0 auto;}</style>
<script type="text/javascript">
	CUI.ns('X6Basic.meetingroom.meetingRoom.edit');
</script>
<link href="/struts/ec/style.css" rel="stylesheet" type="text/css" charset="utf-8"/>
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_meetingroom_meetingRoom">
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
<@errorbar id="X6Basic_meetingroom_meetingRoom_edit_formDialogErrorBar" />
<@s.form id="X6Basic_meetingroom_meetingRoom_edit_form" cssStyle="height:100%;" onsubmitMethod="X6Basic.meetingroom.meetingRoom.edit.beforeSubmitMethod()" ecAction="/X6Basic/meetingroom/meetingRoom/edit/submit.action?__pc__=${(Parameters.__pc__)!}" callback="X6Basic.meetingroom.meetingRoom.callBackInfo" ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="edit">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_meetingroom_edit">
	<input type="hidden" name="datagridKey" value="X6Basic_meetingroom_meetingRoom_edit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="meetingRoom.version" value="${(meetingRoom.version)!0}" />
	<input type="hidden" name="meetingRoom.extraCol" value='' />
		<input type="hidden" name="meetingRoom.attMatching.id" value="${(meetingRoom.attMatching.id)!""}"/>
		<input type="hidden" name="meetingRoom.staff.id" value="${(meetingRoom.staff.id)!""}"/>
	<div id="X6Basic_edit_edit_div" style="height:100%">
		<div id="X6Basic_meetingroom_meetingRoom_edit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "X6Basic_meetingroom_meetingRoom_edit_form"+"_attcount";
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
					CUI('#'+attcountid).html('(' + fileCount + ')');
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_meetingroom', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">
<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_name_permit = checkFieldPermission('meetingRoom.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792696971')}" >${getText('X6Basic.propertydisplayName.radion1366792696971')}</label>
				</td>
				
						<#assign meetingRoom_name_defaultValue  = ''>
							 							<#assign meetingRoom_name_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_name_permit = checkFieldPermission('meetingRoom.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit == 1>-readonly</#if>">
								<input name="meetingRoom.name" id="meetingRoom_name"  style=";" originalvalue="<#if !newObj || (meetingRoom.name)?has_content>${(meetingRoom.name?html)!}<#else>${meetingRoom_name_defaultValue!}</#if>" value="<#if !newObj || (meetingRoom.name)?has_content>${(meetingRoom.name?html)!}<#else>${meetingRoom_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit = checkFieldPermission('meetingRoom.roomSize','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_roomSize')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793347089')}" >${getText('X6Basic.propertydisplayName.radion1366793347089')}</label>
				</td>
				
						<#assign meetingRoom_roomSize_defaultValue  = ''>
							 							<#assign meetingRoom_roomSize_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit = checkFieldPermission('meetingRoom.roomSize','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_roomSize')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit == 1>
									<@systemcode onchange="" viewType="${viewType!}" deValue="${meetingRoom_roomSize_defaultValue!}" formId="X6Basic_meetingroom_meetingRoom_edit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="meetingRoom.roomSize.id" code="meetingSize" value="${(meetingRoom.roomSize.id)!}" />
									<#else>
									<@systemcode onchange=""  viewType="${viewType!}" deValue="${meetingRoom_roomSize_defaultValue!}" formId="X6Basic_meetingroom_meetingRoom_edit_form" classStyle="cui-noborder-input"  name="meetingRoom.roomSize.id" code="meetingSize" value="${(meetingRoom.roomSize.id)!}" />
									</#if>
								<#else>
									<#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit == 1>
									<@systemcode onchange=""  viewType="${viewType!}"  formId="X6Basic_meetingroom_meetingRoom_edit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="meetingRoom.roomSize.id" code="meetingSize" value="${(meetingRoom.roomSize.id)!}" />
									<#else>
									<@systemcode onchange=""  viewType="${viewType!}"  formId="X6Basic_meetingroom_meetingRoom_edit_form" classStyle="cui-noborder-input"  name="meetingRoom.roomSize.id" code="meetingSize" value="${(meetingRoom.roomSize.id)!}" />
									</#if>
								</#if>
							</#if>
				</td>
				
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit = checkFieldPermission('meetingRoom.staff.name','X6Basic_1.0_meetingroom_MeetingRoom','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792717891')}" >${getText('X6Basic.propertydisplayName.radion1366792717891')}</label>
				</td>
				
						<#assign meetingRoom_staff_name_defaultValue  = ''>
														<#assign meetingRoom_staff_name_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit = checkFieldPermission('meetingRoom.staff.name','X6Basic_1.0_meetingroom_MeetingRoom','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit == 1>
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" conditionfunc="X6Basic.meetingroom.meetingRoom.edit._querycustomFunc('meetingRoom_staff_name')" view=true value="${(meetingRoom.staff.name)!}" displayFieldName="name" name="meetingRoom.staff.name" id="meetingRoom_staff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_meetingroom_meetingRoom_edit_form" editCustomCallback=";" onkeyupfuncname=";_callback_meetingRoom_staff_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								<#else>
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${meetingRoom_staff_name_defaultValue!}" conditionfunc="X6Basic.meetingroom.meetingRoom.edit._querycustomFunc('meetingRoom_staff_name')"  value="${(meetingRoom.staff.name)!}" displayFieldName="name" name="meetingRoom.staff.name" id="meetingRoom_staff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_meetingroom_meetingRoom_edit_form" editCustomCallback=";" onkeyupfuncname=";_callback_meetingRoom_staff_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								</#if>
								
								<script type="text/javascript">
								<#if newObj && (meetingRoom_staff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('X6Basic_meetingroom_meetingRoom_edit_form',obj, 'meetingRoom.staff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('X6Basic_meetingroom_meetingRoom_edit_form', 'meetingRoom.staff',obj,true);
											$('input:hidden[name="meetingRoom.staff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(meetingRoom.id)?? && (meetingRoom.staff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${meetingRoom.staff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_meetingroom_meetingRoom_edit_form',obj, 'meetingRoom.staff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('X6Basic_meetingroom_meetingRoom_edit_form', 'meetingRoom.staff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit = checkFieldPermission('meetingRoom.staff.mainPosition.department.name','X6Basic_1.0_meetingroom_MeetingRoom','base_department_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.department.name')}" >${getText('X6Basic.department.name')}</label>
				</td>
				
						<#assign meetingRoom_staff_mainPosition_department_name_defaultValue  = ''>
														<#assign meetingRoom_staff_mainPosition_department_name_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit = checkFieldPermission('meetingRoom.staff.mainPosition.department.name','X6Basic_1.0_meetingroom_MeetingRoom','base_department_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="meetingRoom.staff.mainPosition.department.name" id="meetingRoom_staff_mainPosition_department_name"  style=";" originalvalue="<#if !newObj || (meetingRoom.staff.mainPosition.department.name)?has_content>${(meetingRoom.staff.mainPosition.department.name?html)!}<#else>${meetingRoom_staff_mainPosition_department_name_defaultValue!}</#if>" value="<#if !newObj || (meetingRoom.staff.mainPosition.department.name)?has_content>${(meetingRoom.staff.mainPosition.department.name?html)!}<#else>${meetingRoom_staff_mainPosition_department_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit = checkFieldPermission('meetingRoom.useFlag','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_useFlag')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793037919')}" >${getText('X6Basic.propertydisplayName.radion1366793037919')}</label>
				</td>
				
						<#assign meetingRoom_useFlag_defaultValue  = ''>
							 							<#assign meetingRoom_useFlag_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit = checkFieldPermission('meetingRoom.useFlag','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_useFlag')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.useFlag_check" originalvalue="<#if !newObj || (meetingRoom.useFlag)?has_content>${(meetingRoom.useFlag!false)?string('true','false')}<#elseif meetingRoom_useFlag_defaultValue?has_content>${(meetingRoom_useFlag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (meetingRoom.useFlag)?has_content>${(meetingRoom.useFlag!false)?string('true','false')}<#else>${(meetingRoom_useFlag_defaultValue!true)?string}</#if>"  <#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit == 1>disabled=true</#if>/>
								</#if>
								<input type="hidden" name="meetingRoom.useFlag" originalvalue="<#if ((meetingRoom.useFlag)?? &&  meetingRoom.useFlag)||(meetingRoom_useFlag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((meetingRoom.useFlag)?? &&  meetingRoom.useFlag)||(meetingRoom_useFlag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.useFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="meetingRoom.useFlag"]');
												CUI('input[name="meetingRoom.useFlag_check"]').each(function(){
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
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit = checkFieldPermission('meetingRoom.whiteBoard','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793054934')}" >${getText('X6Basic.propertydisplayName.radion1366793054934')}</label>
				</td>
				
						<#assign meetingRoom_whiteBoard_defaultValue  = ''>
							 							<#assign meetingRoom_whiteBoard_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit = checkFieldPermission('meetingRoom.whiteBoard','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.whiteBoard_check" originalvalue="<#if !newObj || (meetingRoom.whiteBoard)?has_content>${(meetingRoom.whiteBoard!false)?string('true','false')}<#elseif meetingRoom_whiteBoard_defaultValue?has_content>${(meetingRoom_whiteBoard_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (meetingRoom.whiteBoard)?has_content>${(meetingRoom.whiteBoard!false)?string('true','false')}<#else>${(meetingRoom_whiteBoard_defaultValue!true)?string}</#if>"  <#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit == 1>disabled=true</#if>/>
								</#if>
								<input type="hidden" name="meetingRoom.whiteBoard" originalvalue="<#if ((meetingRoom.whiteBoard)?? &&  meetingRoom.whiteBoard)||(meetingRoom_whiteBoard_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((meetingRoom.whiteBoard)?? &&  meetingRoom.whiteBoard)||(meetingRoom_whiteBoard_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.whiteBoard_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="meetingRoom.whiteBoard"]');
												CUI('input[name="meetingRoom.whiteBoard_check"]').each(function(){
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
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_projector_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_projector_permit = checkFieldPermission('meetingRoom.projector','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_projector')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793011250')}" >${getText('X6Basic.propertydisplayName.radion1366793011250')}</label>
				</td>
				
						<#assign meetingRoom_projector_defaultValue  = ''>
							 							<#assign meetingRoom_projector_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_projector_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_projector_permit = checkFieldPermission('meetingRoom.projector','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_projector')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.projector_check" originalvalue="<#if !newObj || (meetingRoom.projector)?has_content>${(meetingRoom.projector!false)?string('true','false')}<#elseif meetingRoom_projector_defaultValue?has_content>${(meetingRoom_projector_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (meetingRoom.projector)?has_content>${(meetingRoom.projector!false)?string('true','false')}<#else>${(meetingRoom_projector_defaultValue!true)?string}</#if>"  <#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit == 1>disabled=true</#if>/>
								</#if>
								<input type="hidden" name="meetingRoom.projector" originalvalue="<#if ((meetingRoom.projector)?? &&  meetingRoom.projector)||(meetingRoom_projector_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((meetingRoom.projector)?? &&  meetingRoom.projector)||(meetingRoom_projector_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.projector_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="meetingRoom.projector"]');
												CUI('input[name="meetingRoom.projector_check"]').each(function(){
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
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_audio_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_audio_permit = checkFieldPermission('meetingRoom.audio','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_audio')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792961138')}" >${getText('X6Basic.propertydisplayName.radion1366792961138')}</label>
				</td>
				
						<#assign meetingRoom_audio_defaultValue  = ''>
							 							<#assign meetingRoom_audio_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_audio_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_audio_permit = checkFieldPermission('meetingRoom.audio','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_audio')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.audio_check" originalvalue="<#if !newObj || (meetingRoom.audio)?has_content>${(meetingRoom.audio!false)?string('true','false')}<#elseif meetingRoom_audio_defaultValue?has_content>${(meetingRoom_audio_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (meetingRoom.audio)?has_content>${(meetingRoom.audio!false)?string('true','false')}<#else>${(meetingRoom_audio_defaultValue!true)?string}</#if>"  <#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit == 1>disabled=true</#if>/>
								</#if>
								<input type="hidden" name="meetingRoom.audio" originalvalue="<#if ((meetingRoom.audio)?? &&  meetingRoom.audio)||(meetingRoom_audio_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((meetingRoom.audio)?? &&  meetingRoom.audio)||(meetingRoom_audio_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.audio_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="meetingRoom.audio"]');
												CUI('input[name="meetingRoom.audio_check"]').each(function(){
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
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_camera_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_camera_permit = checkFieldPermission('meetingRoom.camera','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_camera')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792991306')}" >${getText('X6Basic.propertydisplayName.radion1366792991306')}</label>
				</td>
				
						<#assign meetingRoom_camera_defaultValue  = ''>
							 							<#assign meetingRoom_camera_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_camera_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_camera_permit = checkFieldPermission('meetingRoom.camera','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_camera')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.camera_check" originalvalue="<#if !newObj || (meetingRoom.camera)?has_content>${(meetingRoom.camera!false)?string('true','false')}<#elseif meetingRoom_camera_defaultValue?has_content>${(meetingRoom_camera_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (meetingRoom.camera)?has_content>${(meetingRoom.camera!false)?string('true','false')}<#else>${(meetingRoom_camera_defaultValue!true)?string}</#if>"  <#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit == 1>disabled=true</#if>/>
								</#if>
								<input type="hidden" name="meetingRoom.camera" originalvalue="<#if ((meetingRoom.camera)?? &&  meetingRoom.camera)||(meetingRoom_camera_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((meetingRoom.camera)?? &&  meetingRoom.camera)||(meetingRoom_camera_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.camera_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="meetingRoom.camera"]');
												CUI('input[name="meetingRoom.camera_check"]').each(function(){
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
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_network_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_network_permit = checkFieldPermission('meetingRoom.network','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_network')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792858041')}" >${getText('X6Basic.propertydisplayName.radion1366792858041')}</label>
				</td>
				
						<#assign meetingRoom_network_defaultValue  = ''>
							 							<#assign meetingRoom_network_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_network_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_network_permit = checkFieldPermission('meetingRoom.network','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_network')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.network_check" originalvalue="<#if !newObj || (meetingRoom.network)?has_content>${(meetingRoom.network!false)?string('true','false')}<#elseif meetingRoom_network_defaultValue?has_content>${(meetingRoom_network_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (meetingRoom.network)?has_content>${(meetingRoom.network!false)?string('true','false')}<#else>${(meetingRoom_network_defaultValue!true)?string}</#if>"  <#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit == 1>disabled=true</#if>/>
								</#if>
								<input type="hidden" name="meetingRoom.network" originalvalue="<#if ((meetingRoom.network)?? &&  meetingRoom.network)||(meetingRoom_network_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((meetingRoom.network)?? &&  meetingRoom.network)||(meetingRoom_network_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.network_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="meetingRoom.network"]');
												CUI('input[name="meetingRoom.network_check"]').each(function(){
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
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_matching_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_matching_permit = checkFieldPermission('meetingRoom.matching','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_matching')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792802487')}" >${getText('X6Basic.propertydisplayName.radion1366792802487')}</label>
				</td>
				
						<#assign meetingRoom_matching_defaultValue  = ''>
							 							<#assign meetingRoom_matching_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_matching_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_matching_permit = checkFieldPermission('meetingRoom.matching','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_matching')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.matching_check" originalvalue="<#if !newObj || (meetingRoom.matching)?has_content>${(meetingRoom.matching!false)?string('true','false')}<#elseif meetingRoom_matching_defaultValue?has_content>${(meetingRoom_matching_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (meetingRoom.matching)?has_content>${(meetingRoom.matching!false)?string('true','false')}<#else>${(meetingRoom_matching_defaultValue!true)?string}</#if>" onchange='hideTd()' <#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit == 1>disabled=true</#if>/>
								</#if>
								<input type="hidden" name="meetingRoom.matching" originalvalue="<#if ((meetingRoom.matching)?? &&  meetingRoom.matching)||(meetingRoom_matching_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((meetingRoom.matching)?? &&  meetingRoom.matching)||(meetingRoom_matching_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.matching_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="meetingRoom.matching"]');
												CUI('input[name="meetingRoom.matching_check"]').each(function(){
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
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr class="dialog_tr">
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('meetingRoom.attMatching.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion136713888384711')}" >${getText('X6Basic.propertydisplayName.radion136713888384711')}</label>
				</td>
				
						<#assign meetingRoom_attMatching_name_defaultValue  = ''>
														<#assign meetingRoom_attMatching_name_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('meetingRoom.attMatching.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit == 1>
									<@selector cssClass="cui-noborder-input" view=true id="meetingRoom.attMatching.name" cssStyle="" name="meetingRoom.attMatching.name" value="${(meetingRoom.attMatching.name)!}" pageType="other" onclick="X6Basic.meetingroom.meetingRoom.edit._selectEvent" funcparam="'meetingRoom.attMatching.name','other','/X6Basic/attMachine/attMachine/ref.action','${getText('X6Basic.viewtitle.radion1367462816202')}',null,null,'',false"  isCrossCompany=false />
								<#else>
									<@selector cssClass="cui-noborder-input" viewType="${viewType!}" deValue="${meetingRoom_attMatching_name_defaultValue!}"  id="meetingRoom.attMatching.name" cssStyle="" name="meetingRoom.attMatching.name" value="${(meetingRoom.attMatching.name)!}" pageType="other" onclick="X6Basic.meetingroom.meetingRoom.edit._selectEvent" funcparam="'meetingRoom.attMatching.name','other','/X6Basic/attMachine/attMachine/ref.action','${getText('X6Basic.viewtitle.radion1367462816202')}',null,null,'',false"  isCrossCompany=false />
								</#if>
								
								<script type="text/javascript">
								<#if !(meetingRoom.id)?? && (meetingRoom.attMatching.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${meetingRoom.attMatching.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_meetingroom_meetingRoom_edit_form',obj, 'meetingRoom.attMatching', '/X6Basic/attMachine/attMachine/ref.action');
												CUI.commonFills('X6Basic_meetingroom_meetingRoom_edit_form', 'meetingRoom.attMatching',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit = checkFieldPermission('meetingRoom.attMatchingAddress','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_attMatchingAddress')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371176748814')}" >${getText('X6Basic.propertydisplayName.radion1371176748814')}</label>
				</td>
				
						<#assign meetingRoom_attMatchingAddress_defaultValue  = ''>
							 							<#assign meetingRoom_attMatchingAddress_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit = checkFieldPermission('meetingRoom.attMatchingAddress','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_attMatchingAddress')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit == 1>-readonly</#if>">
								<input name="meetingRoom.attMatchingAddress" id="meetingRoom_attMatchingAddress"  style=";" originalvalue="<#if !newObj || (meetingRoom.attMatchingAddress)?has_content>${(meetingRoom.attMatchingAddress?html)!}<#else>${meetingRoom_attMatchingAddress_defaultValue!}</#if>" value="<#if !newObj || (meetingRoom.attMatchingAddress)?has_content>${(meetingRoom.attMatchingAddress?html)!}<#else>${meetingRoom_attMatchingAddress_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit = checkFieldPermission('meetingRoom.attMatchingAddress2','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_attMatchingAddress2')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371176808842')}" >${getText('X6Basic.propertydisplayName.radion1371176808842')}</label>
				</td>
				
						<#assign meetingRoom_attMatchingAddress2_defaultValue  = ''>
							 							<#assign meetingRoom_attMatchingAddress2_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit = checkFieldPermission('meetingRoom.attMatchingAddress2','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_attMatchingAddress2')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit == 1>-readonly</#if>">
								<input name="meetingRoom.attMatchingAddress2" id="meetingRoom_attMatchingAddress2"  style=";" originalvalue="<#if !newObj || (meetingRoom.attMatchingAddress2)?has_content>${(meetingRoom.attMatchingAddress2?html)!}<#else>${meetingRoom_attMatchingAddress2_defaultValue!}</#if>" value="<#if !newObj || (meetingRoom.attMatchingAddress2)?has_content>${(meetingRoom.attMatchingAddress2?html)!}<#else>${meetingRoom_attMatchingAddress2_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatchingAddress2_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_memos_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_memos_permit = checkFieldPermission('meetingRoom.memos','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_memos')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792826881')}" >${getText('X6Basic.propertydisplayName.radion1366792826881')}</label>
				</td>
				
						<#assign meetingRoom_memos_defaultValue  = ''>
							 							<#assign meetingRoom_memos_defaultValue  = ''>
					<#if !X6Basic_1_0_meetingroom_MeetingRoom_memos_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_memos_permit = checkFieldPermission('meetingRoom.memos','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_memos')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="meetingRoom_memos" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea id="meetingRoom_memos" originalvalue="<#if !newObj || (meetingRoom.memos)?has_content>${(meetingRoom.memos?html)!}<#else>${meetingRoom_memos_defaultValue?html}</#if>"  name="meetingRoom.memos" class="cui-noborder-textarea cui-textarea-auto"<#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit == 1> readonly=readonly</#if> style="height:80px;" ><#if !newObj || (meetingRoom.memos)?has_content>${(meetingRoom.memos)!}<#else>${meetingRoom_memos_defaultValue}</#if></textarea></div>
							</#if>
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_meetingroom_edit,html,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.meetingroom.meetingRoom.edit.beforeSaveProcess = function(){}
	X6Basic.meetingroom.meetingRoom.edit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.meetingroom.meetingRoom.edit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_meetingroom_meetingRoom_edit_form').trigger('beforeSubmit');
		//meetingRoom.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="meetingRoom.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	X6Basic.meetingroom.meetingRoom.edit.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.meetingroom.meetingRoom.edit.print = function(url){
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
		
		X6Basic.meetingroom.meetingRoom.edit.saveSetting = function(){
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
		
		X6Basic.meetingroom.meetingRoom.edit.printSetting = function(){
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
			X6Basic.meetingroom.meetingRoom.edit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.meetingroom.meetingRoom.edit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				X6Basic.meetingroom.meetingRoom.edit.settingDialog.show();
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
			X6Basic.meetingroom.meetingRoom.edit._customCallBack = customCallBack;
		}
		X6Basic.meetingroom.meetingRoom.edit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	
	//参照复制函数
	X6Basic.meetingroom.meetingRoom.edit.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.meetingroom.meetingRoom.edit.referenceCopyBackInfo";
		X6Basic.meetingroom.meetingRoom.edit.dialog = dialog;
		X6Basic.meetingroom.meetingRoom.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	X6Basic.meetingroom.meetingRoom.edit.referenceCopyBackInfo = function(obj){
		if(X6Basic.meetingroom.meetingRoom.edit._dialog){
			X6Basic.meetingroom.meetingRoom.edit._dialog.close();
		}
		createLoadPanel(false,X6Basic.meetingroom.meetingRoom.edit.dialog._el);
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_meetingroom_meetingRoom_edit_form','X6Basic_meetingroom_meetingRoom_edit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.meetingroom.meetingRoom.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.meetingroom.meetingRoom.edit.dialog._el).load('/X6Basic/meetingroom/meetingRoom/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			$(X6Basic.meetingroom.meetingRoom.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.meetingroom.meetingRoom.edit.dialog._el).load('/X6Basic/meetingroom/meetingRoom/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
		}
	};
	
	X6Basic.meetingroom.meetingRoom.edit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.meetingroom.meetingRoom.edit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.meetingroom.meetingRoom.edit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.meetingroom.meetingRoom.edit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.meetingroom.meetingRoom.edit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var callbackName="";
		X6Basic.meetingroom.meetingRoom.edit._prefix = '';
		X6Basic.meetingroom.meetingRoom.edit._oGrid = oGrid;
		X6Basic.meetingroom.meetingRoom.edit._sUrl = url;
		if(customCallBack){
			X6Basic.meetingroom.meetingRoom.edit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.meetingroom.meetingRoom.edit.gridEventObj = gridEventObj;
			callbackName = "X6Basic.meetingroom.meetingRoom.edit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.meetingroom.meetingRoom.edit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.meetingroom.meetingRoom.edit.getMultiselectCallBackInfo_DG" : "X6Basic.meetingroom.meetingRoom.edit.getcallBackInfo_DG";
			X6Basic.meetingroom.meetingRoom.edit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.meetingroom.meetingRoom.edit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.meetingroom.meetingRoom.edit.getcallBackInfo";
		}
		if(X6Basic.meetingroom.meetingRoom.edit._prefix!=''){
			X6Basic.meetingroom.meetingRoom.edit._prefix = X6Basic.meetingroom.meetingRoom.edit._prefix.substring(1);
		}
		if(X6Basic.meetingroom.meetingRoom.edit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.meetingroom.meetingRoom.edit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.meetingroom.meetingRoom.edit._querycustomFuncN == "function") {
				refparam += X6Basic.meetingroom.meetingRoom.edit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.meetingroom.meetingRoom.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.meetingroom.meetingRoom.edit._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.meetingroom.meetingRoom.edit.query_"+obj+")!='undefined'") ? eval('X6Basic.meetingroom.meetingRoom.edit.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.meetingroom.meetingRoom.edit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_meetingroom_meetingRoom_edit_form',obj[0], X6Basic.meetingroom.meetingRoom.edit._prefix, X6Basic.meetingroom.meetingRoom.edit._sUrl);
		CUI.commonFills('X6Basic_meetingroom_meetingRoom_edit_form',X6Basic.meetingroom.meetingRoom.edit._prefix,obj[0]);

		try{
			if(X6Basic.meetingroom.meetingRoom.edit._customCallBack) {
				eval(X6Basic.meetingroom.meetingRoom.edit._customCallBack);
				X6Basic.meetingroom.meetingRoom.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.meetingroom.meetingRoom.edit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.meetingroom.meetingRoom.edit.getcallBackInfo_DG_IE = function(obj){
		var gridEventObj = X6Basic.meetingroom.meetingRoom.edit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.meetingroom.meetingRoom.edit._sUrl);
		var xmlHead = gridEventObj.oGrid._DT.opts.oXMLData.childNodes[0].childNodes[0];
		for( var i = 0; i < xmlHead.childNodes.length; i++ ){
			var tagName = xmlHead.childNodes[i].tagName;
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
			if(X6Basic.meetingroom.meetingRoom.edit._customCallBack) {
				eval(X6Basic.meetingroom.meetingRoom.edit._customCallBack);
				X6Basic.meetingroom.meetingRoom.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.meetingroom.meetingRoom.edit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.meetingroom.meetingRoom.edit.getcallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.meetingroom.meetingRoom.edit._currRow).next().length==0){
					X6Basic.meetingroom.meetingRoom.edit._oGrid.addNewRow();
				}	
				X6Basic.meetingroom.meetingRoom.edit._currRow = $(X6Basic.meetingroom.meetingRoom.edit._currRow).next();
				$(X6Basic.meetingroom.meetingRoom.edit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.meetingroom.meetingRoom.edit._currRow,obj[i],X6Basic.meetingroom.meetingRoom.edit._prefix,X6Basic.meetingroom.meetingRoom.edit._sUrl);
			eval("CUI.commonFills_DG(X6Basic.meetingroom.meetingRoom.edit._currRow,X6Basic.meetingroom.meetingRoom.edit._prefix,obj[i],X6Basic.meetingroom.meetingRoom.edit._oGrid)");
		}
		try{
			if(X6Basic.meetingroom.meetingRoom.edit._customCallBack) {
				eval(X6Basic.meetingroom.meetingRoom.edit._customCallBack);
				X6Basic.meetingroom.meetingRoom.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.meetingroom.meetingRoom.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.meetingroom.meetingRoom.edit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.meetingroom.meetingRoom.edit._oGrid, X6Basic.meetingroom.meetingRoom.edit._currRow, X6Basic.meetingroom.meetingRoom.edit._key, X6Basic.meetingroom.meetingRoom.edit._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.meetingroom.meetingRoom.edit._customCallBack) {
				eval(X6Basic.meetingroom.meetingRoom.edit._customCallBack);
				X6Basic.meetingroom.meetingRoom.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.meetingroom.meetingRoom.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.meetingroom.meetingRoom.edit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.meetingroom.meetingRoom.edit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_meetingroom_meetingRoom_edit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			var checked=CUI("input[name='meetingRoom.matching_check']").prop("checked");
	if(!checked){
		CUI("input[name='meetingRoom.matching_check']").parent().parent().next().hide();
	}else{
		CUI("input[name='meetingRoom.matching_check']").parent().parent().next().show();
	}
		});
	})(jQuery);
	X6Basic.meetingroom.meetingRoom.edit.beforeSubmitMethodSettingInPage = function(){
	};
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.meetingroom.meetingRoom.edit.initCount = 0;
	X6Basic.meetingroom.meetingRoom.edit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		var h = $('#X6Basic_edit_edit_div').parents('div.content').first().height();
		var datagrids = $('body').data('X6Basic_meetingroom_meetingRoom_edit_datagrids');
		var	conHeight = h-$("#X6Basic_meetingroom_meetingRoom_edit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_meetingroom_meetingRoom_edit_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.meetingroom.meetingRoom.edit.initCount <= 2) {
								setTimeout(function(){X6Basic.meetingroom.meetingRoom.edit.initSize();}, 200);
								X6Basic.meetingroom.meetingRoom.edit.initCount++;
							}/* else {
								X6Basic.meetingroom.meetingRoom.edit.initCount = 0;
							}*/
						}
					}
				}
			} else {
				$(this).parent().height(conHeight-30);
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		X6Basic.meetingroom.meetingRoom.edit.initSize();
		$(window).bind("dialog.resize",function(){X6Basic.meetingroom.meetingRoom.edit.initSize();});
	});
</script>
<script type="text/javascript">
	
function hideTd(){
	var checked=CUI("input[name='meetingRoom.matching_check']").prop("checked");
	if(!checked){
		CUI("input[name='meetingRoom.matching_check']").parent().parent().next().hide();
	}else{
		CUI("input[name='meetingRoom.matching_check']").parent().parent().next().show();
	}
}


	/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_meetingroom_edit,js,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
</script>