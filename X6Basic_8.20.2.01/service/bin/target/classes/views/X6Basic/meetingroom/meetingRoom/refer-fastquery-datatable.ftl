	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1366792465295')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_meetingroom_meetingRoom_refer_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" exportUrl="/X6Basic/meetingroom/meetingRoom/refer-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="staff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="ownerStaff" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="effectStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="modifyStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="createStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="deleteStaff" />
		<input type="hidden" reset="false" name="X6Basic_meetingroom_meetingRoom_refer_condition" id="X6Basic_meetingroom_meetingRoom_refer_condition" value="${(condition)!''}"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1366792543468')}_${getText('X6Basic.viewtitle.radion1367733480893')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_meetingroom_refer')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_meetingroom_refer" formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" dataTableId="ec_X6Basic_meetingroom_meetingRoom_refer_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm"  fieldcodes="X6Basic_1.0_meetingroom_MeetingRoom_name_name:X6Basic.propertydisplayName.radion1366792696971||X6Basic_1.0_meetingroom_MeetingRoom_roomSize_roomSize:X6Basic.propertydisplayName.radion1366793347089||X6Basic_1.0_meetingroom_MeetingRoom_camera_camera:X6Basic.propertydisplayName.radion1366792991306||X6Basic_1.0_meetingroom_MeetingRoom_network_network:X6Basic.propertydisplayName.radion1366792858041||X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard_whiteBoard:X6Basic.propertydisplayName.radion1366793054934||X6Basic_1.0_meetingroom_MeetingRoom_projector_projector:X6Basic.propertydisplayName.radion1366793011250||X6Basic_1.0_meetingroom_MeetingRoom_audio_audio:X6Basic.propertydisplayName.radion1366792961138||X6Basic_1.0_meetingroom_MeetingRoom_useFlag_useFlag:X6Basic.propertydisplayName.radion1366793037919" > 
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_name" showFormat="TEXT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
										<#if (name_defaultValue)?has_content>
											<@mneclient formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="X6Basic.meetingroom.meetingRoom.refer._querycustomFunc('name')" name="name" id="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.meetingroom.meetingRoom.refer.commonQuery('query')" />
										<#else>
											<@mneclient formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm"  conditionfunc="X6Basic.meetingroom.meetingRoom.refer._querycustomFunc('name')" name="name" id="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.meetingroom.meetingRoom.refer.commonQuery('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_roomSize" showFormat="SELECTCOMP" divCode="X6Basic_1.0_meetingroom_MeetingRoom_roomSize_roomSize" isCustomize=true > 
							<#assign roomSize_defaultValue  = ''>
									<#assign roomSize_defaultValue  = ''>
										<@systemcode onchange="" deValue="${roomSize_defaultValue}"   name="roomSize" code="meetingSize" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_camera" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_camera_camera" isCustomize=true > 
							<#assign camera_defaultValue  = ''>
									<#assign camera_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${camera_defaultValue!}" name="camera" id="camera" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (camera_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (camera_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_network" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_network_network" isCustomize=true > 
							<#assign network_defaultValue  = ''>
									<#assign network_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${network_defaultValue!}" name="network" id="network" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (network_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (network_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard_whiteBoard" isCustomize=true > 
							<#assign whiteBoard_defaultValue  = ''>
									<#assign whiteBoard_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${whiteBoard_defaultValue!}" name="whiteBoard" id="whiteBoard" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (whiteBoard_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (whiteBoard_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_projector" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_projector_projector" isCustomize=true > 
							<#assign projector_defaultValue  = ''>
									<#assign projector_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${projector_defaultValue!}" name="projector" id="projector" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (projector_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (projector_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_audio" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_audio_audio" isCustomize=true > 
							<#assign audio_defaultValue  = ''>
									<#assign audio_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${audio_defaultValue!}" name="audio" id="audio" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (audio_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (audio_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_useFlag" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_useFlag_useFlag" isCustomize=true > 
							<#assign useFlag_defaultValue  = ''>
									<#assign useFlag_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${useFlag_defaultValue!}" name="useFlag" id="useFlag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (useFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (useFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
					       	<@querybutton formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" type="search" onclick="X6Basic.meetingroom.meetingRoom.refer.commonQuery('query')" /> 
					 		<@querybutton formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" type="clear"  /> 
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.meetingroom.meetingRoom.refer.query('query')">
<#assign datatable_dataUrl = "/X6Basic/meetingroom/meetingRoom/refer-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_meetingroom_meetingRoom_refer_query" renderOverEvent="ec_X6Basic_meetingroom_meetingRoom_refer_RenderOverEvent"  modelCode="X6Basic_1.0_meetingroom_MeetingRoom" noPermissionKeys="name,roomSize,network,whiteBoard,audio,projector,camera" hidekeyPrefix="ec_X6Basic_meetingroom_meetingRoom_refer_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.meetingroom.meetingRoom.refer.sendBackrefer" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1366792696971')}" textalign="left"  width=100  type="textfield"    showFormatFunc=""/>
			<#assign roomSize_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${roomSize_displayDefaultType!}"  key="roomSize.value"  label="${getText('X6Basic.propertydisplayName.radion1366793347089')}" textalign="center"  width=100  type="systemcode"    showFormatFunc=""/>
			<#assign network_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${network_displayDefaultType!}"  key="network"  label="${getText('X6Basic.propertydisplayName.radion1366792858041')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign whiteBoard_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${whiteBoard_displayDefaultType!}"  key="whiteBoard"  label="${getText('X6Basic.propertydisplayName.radion1366793054934')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign audio_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${audio_displayDefaultType!}"  key="audio"  label="${getText('X6Basic.propertydisplayName.radion1366792961138')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign projector_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${projector_displayDefaultType!}"  key="projector"  label="${getText('X6Basic.propertydisplayName.radion1366793011250')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign camera_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${camera_displayDefaultType!}"  key="camera"  label="${getText('X6Basic.propertydisplayName.radion1366792991306')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_meetingroom_meetingRoom_refer_RenderOverEvent(){
}
	
	
	
	
	
	
	
</script>