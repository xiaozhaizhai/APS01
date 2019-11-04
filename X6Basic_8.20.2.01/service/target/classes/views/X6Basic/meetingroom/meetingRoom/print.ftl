	<#assign  fileuploadType = "X6Basic_meetingroom_meetingRoom">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "readonly">
<#assign newObj = false >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${getText('X6Basic.viewtitle.radion1366793662379')}</title>
        <@editcss /><@editjstop /><@editjs />
        <script type="text/javascript" src="/static/ec/js/${lang!}/ec_print.js"></script>
		<style>
		body{_width:100%;height:100%;overflow:auto;}
		.pd-top{padding-top:10px}
		.edit-panes-s{width:98%;}
		.dg_table{
			border: 1px solid #000;
			border-bottom: none;
			border-left: none;
		}
		.dg_tr{
			height:20px;
		}
		.dg_tr th{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.dg_tr td{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.fileAttachmentDiv{
			border:1px solid #000;
			margin-left:10px;
			width:95%;
		}
		.dealInfoContain{
			width:96%;
		}
		</style>
    </head>
	<body>
		<input type="hidden" name="mainContent" value="false" />
		<input type="hidden" name="attachmentInfo" value="false" />
		<input type="hidden" name="dealInfo" value="false" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="X6Basic_meetingroom_meetingRoom_edit_main_div">
			<div class="edit-head">
				<div class="edit-title fix">								
					<span class="edit-title-view"></span>
				</div>
			</div>
			<div class="edit-main">
				<div class="edit-content">
					<div class="edit-panes edit-panes-w clearfix" style="padding:0px 18px 16px;margin-top:16px;width:96%;">
						<#if mainContent?? && (mainContent!false)?string=='true'>
							<div class="cui-elements pd-top">
									<div style="width:98%;text-align:left;">
										<h1>${getText('ec.view.commoninfo')}<h1>
										<hr />
									</div>
								<div class="edit-panes-s">
									
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_name_permit = checkFieldPermission('meetingRoom.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792696971')}" >${getText('X6Basic.propertydisplayName.radion1366792696971')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_name_permit = checkFieldPermission('meetingRoom.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="meetingRoom.name" id="meetingRoom_name"  style=";"  value="${(meetingRoom.name?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit = checkFieldPermission('meetingRoom.roomSize','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_roomSize')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793347089')}" >${getText('X6Basic.propertydisplayName.radion1366793347089')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit = checkFieldPermission('meetingRoom.roomSize','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_roomSize')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_roomSize_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<@systemcode onchange=""  viewType="readonly"  formId="X6Basic_meetingroom_meetingRoom_edit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="meetingRoom.roomSize.id" code="meetingSize" value="${(meetingRoom.roomSize.id)!}" />
							</#if>
				</td>
				
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit = checkFieldPermission('meetingRoom.staff.name','X6Basic_1.0_meetingroom_MeetingRoom','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792717891')}" >${getText('X6Basic.propertydisplayName.radion1366792717891')}</label>
				</td>
				
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit = checkFieldPermission('meetingRoom.staff.name','X6Basic_1.0_meetingroom_MeetingRoom','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(meetingRoom.staff.name)!}" name="meetingRoom.staff.name" id="meetingRoom_staff_name" /></div>
							</#if>
				</td>
				</tr><tr>
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit = checkFieldPermission('meetingRoom.staff.mainPosition.department.name','X6Basic_1.0_meetingroom_MeetingRoom','base_department_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.department.name')}" >${getText('X6Basic.department.name')}</label>
				</td>
				
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit = checkFieldPermission('meetingRoom.staff.mainPosition.department.name','X6Basic_1.0_meetingroom_MeetingRoom','base_department_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_staff_base_staff_mainPositionId_base_position_departmentId_base_department_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="meetingRoom.staff.mainPosition.department.name" id="meetingRoom_staff_mainPosition_department_name"  style=";"  value="${(meetingRoom.staff.mainPosition.department.name?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit = checkFieldPermission('meetingRoom.useFlag','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_useFlag')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793037919')}" >${getText('X6Basic.propertydisplayName.radion1366793037919')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit = checkFieldPermission('meetingRoom.useFlag','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_useFlag')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_useFlag_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.useFlag_check"  value="${(meetingRoom.useFlag!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="meetingRoom.useFlag"  value="<#if (meetingRoom.useFlag)?? &&  meetingRoom.useFlag>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.useFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit = checkFieldPermission('meetingRoom.whiteBoard','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793054934')}" >${getText('X6Basic.propertydisplayName.radion1366793054934')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit = checkFieldPermission('meetingRoom.whiteBoard','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_whiteBoard_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.whiteBoard_check"  value="${(meetingRoom.whiteBoard!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="meetingRoom.whiteBoard"  value="<#if (meetingRoom.whiteBoard)?? &&  meetingRoom.whiteBoard>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.whiteBoard_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_projector_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_projector_permit = checkFieldPermission('meetingRoom.projector','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_projector')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366793011250')}" >${getText('X6Basic.propertydisplayName.radion1366793011250')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_projector_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_projector_permit = checkFieldPermission('meetingRoom.projector','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_projector')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_projector_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.projector_check"  value="${(meetingRoom.projector!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="meetingRoom.projector"  value="<#if (meetingRoom.projector)?? &&  meetingRoom.projector>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.projector_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_audio_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_audio_permit = checkFieldPermission('meetingRoom.audio','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_audio')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792961138')}" >${getText('X6Basic.propertydisplayName.radion1366792961138')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_audio_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_audio_permit = checkFieldPermission('meetingRoom.audio','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_audio')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_audio_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.audio_check"  value="${(meetingRoom.audio!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="meetingRoom.audio"  value="<#if (meetingRoom.audio)?? &&  meetingRoom.audio>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.audio_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_camera_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_camera_permit = checkFieldPermission('meetingRoom.camera','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_camera')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792991306')}" >${getText('X6Basic.propertydisplayName.radion1366792991306')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_camera_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_camera_permit = checkFieldPermission('meetingRoom.camera','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_camera')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_camera_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.camera_check"  value="${(meetingRoom.camera!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="meetingRoom.camera"  value="<#if (meetingRoom.camera)?? &&  meetingRoom.camera>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.camera_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_network_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_network_permit = checkFieldPermission('meetingRoom.network','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_network')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792858041')}" >${getText('X6Basic.propertydisplayName.radion1366792858041')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_network_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_network_permit = checkFieldPermission('meetingRoom.network','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_network')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_network_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.network_check"  value="${(meetingRoom.network!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="meetingRoom.network"  value="<#if (meetingRoom.network)?? &&  meetingRoom.network>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.network_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_matching_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_matching_permit = checkFieldPermission('meetingRoom.matching','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_matching')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792802487')}" >${getText('X6Basic.propertydisplayName.radion1366792802487')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_matching_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_matching_permit = checkFieldPermission('meetingRoom.matching','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_matching')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_meetingroom_MeetingRoom_matching_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="meetingRoom.matching_check"  value="${(meetingRoom.matching!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="meetingRoom.matching"  value="<#if (meetingRoom.matching)?? &&  meetingRoom.matching>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="meetingRoom.matching_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				
				
				</tr><tr>
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('meetingRoom.attMatching.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion136713888384711')}" >${getText('X6Basic.propertydisplayName.radion136713888384711')}</label>
				</td>
				
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('meetingRoom.attMatching.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching_X6Basic_1_0_attMachine_AttMachine_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(meetingRoom.attMatching.name)!}" name="meetingRoom.attMatching.name" id="meetingRoom_attMatching_name" /></div>
							</#if>
				</td>
				
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('meetingRoom.attMatching2.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion136713888384722')}" >${getText('X6Basic.propertydisplayName.radion136713888384722')}</label>
				</td>
				
												<#if !X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('meetingRoom.attMatching2.name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_attMatching2_X6Basic_1_0_attMachine_AttMachine_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(meetingRoom.attMatching2.name)!}" name="meetingRoom.attMatching2.name" id="meetingRoom_attMatching2_name" /></div>
							</#if>
				</td>
				
				
				</tr><tr>
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_memos_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_memos_permit = checkFieldPermission('meetingRoom.memos','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_memos')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792826881')}" >${getText('X6Basic.propertydisplayName.radion1366792826881')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_meetingroom_MeetingRoom_memos_permit??>
					<#assign X6Basic_1_0_meetingroom_MeetingRoom_memos_permit = checkFieldPermission('meetingRoom.memos','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_memos')>
					</#if>
					<td <#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_meetingroom_MeetingRoom_memos_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="meetingRoom_memos" class="cui-noborder-textarea nopermit cui-textarea-wh" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="meetingRoom_memos"  name="meetingRoom.memos" class="cui-noborder-textarea cui-textarea-wh" readonly="readonly" style="height:80px;" >${(meetingRoom.memos)!}</textarea></div>
							</#if>
							<script type="text/javascript">
								$(function(){
									CUI["meetingRoom_memoscompleteFlag"] = "first";
									autoTextarea("meetingRoom_memos");
									//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
									if(YAHOO.env.ua.ie == 0){
										setTimeout(function(){autoTextarea("meetingRoom_memos")},200);
									}
								})
							</script>
				</td>
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
								</div>									
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>	
		
		<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_meetingroom_edit,html,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->		
		<script type="text/javascript">
		(function($){
			if(CUI("#fileAttachmentDiv")){
				CUI("#fileAttachmentDiv").load("/ec/print/fileupload-print.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}");
			}
			if(CUI("#dealInfoContain")){
				CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/X6Basic/meetingroom/meetingRoom/dealInfo-list.action");
			}
			window.print();
		})(jQuery);
		</script>
	</body>
</html>