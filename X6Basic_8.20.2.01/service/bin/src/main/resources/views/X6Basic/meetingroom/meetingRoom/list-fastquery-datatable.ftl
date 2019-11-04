	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1366792465295')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_meetingroom_meetingRoom_list_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" exportUrl="/X6Basic/meetingroom/meetingRoom/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="staff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="ownerStaff" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="effectStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="modifyStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="createStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="deleteStaff" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1366792543468')}_${getText('X6Basic.viewtitle.radion1366794076861')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_meetingroom_list" formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" dataTableId="ec_X6Basic_meetingroom_meetingRoom_list_query" dgList="[{'dgname':'${getText('是否启用')}','dgcode':'X6Basic_1.0_meetingroom_list_used','dgtype':false,'dgvalue':[{'code':'X6Basic_1.0_meetingroom_list_used_isUsed','dcvalue':'${getText('X6Basic.dataClassificdisplayName.radion1368607328203')}'},{'code':'X6Basic_1.0_meetingroom_list_used_isNotUsed','dcvalue':'${getText('X6Basic.dataClassificdisplayName.radion1368607365802')}'}]}]" /> 
		<div class="cui-fast-split"></div>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_meetingroom_meetingRoom_list_queryForm" formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" divStyle="margin:6px 0px 5px 0px;float:left;" fieldcodes="X6Basic_1.0_meetingroom_MeetingRoom_name_name:X6Basic.propertydisplayName.radion1366792696971||X6Basic_1.0_meetingroom_MeetingRoom_network_network:X6Basic.propertydisplayName.radion1366792858041||X6Basic_1.0_meetingroom_MeetingRoom_audio_audio:X6Basic.propertydisplayName.radion1366792961138||X6Basic_1.0_meetingroom_MeetingRoom_camera_camera:X6Basic.propertydisplayName.radion1366792991306||X6Basic_1.0_meetingroom_MeetingRoom_useFlag_useFlag:X6Basic.propertydisplayName.radion1366793037919||X6Basic_1.0_meetingroom_MeetingRoom_roomSize_roomSize:X6Basic.propertydisplayName.radion1366793347089" > 
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_name" showFormat="TEXT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
										<#if (name_defaultValue)?has_content>
											<@mneclient formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="X6Basic.meetingroom.meetingRoom.list._querycustomFunc('name')" name="name" id="ec_X6Basic_meetingroom_meetingRoom_list_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.meetingroom.meetingRoom.list.commonQuery('query')" />
										<#else>
											<@mneclient formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm"  conditionfunc="X6Basic.meetingroom.meetingRoom.list._querycustomFunc('name')" name="name" id="ec_X6Basic_meetingroom_meetingRoom_list_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.meetingroom.meetingRoom.list.commonQuery('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_network" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_network_network" isCustomize=true > 
							<#assign network_defaultValue  = ''>
									<#assign network_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${network_defaultValue!}" name="network" id="network" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (network_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (network_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_audio" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_audio_audio" isCustomize=true > 
							<#assign audio_defaultValue  = ''>
									<#assign audio_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${audio_defaultValue!}" name="audio" id="audio" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (audio_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (audio_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_camera" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_camera_camera" isCustomize=true > 
							<#assign camera_defaultValue  = ''>
									<#assign camera_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${camera_defaultValue!}" name="camera" id="camera" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (camera_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (camera_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_useFlag" showFormat="SELECT" divCode="X6Basic_1.0_meetingroom_MeetingRoom_useFlag_useFlag" isCustomize=true > 
							<#assign useFlag_defaultValue  = ''>
									<#assign useFlag_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${useFlag_defaultValue!}" name="useFlag" id="useFlag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (useFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (useFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_roomSize" showFormat="SELECTCOMP" divCode="X6Basic_1.0_meetingroom_MeetingRoom_roomSize_roomSize" isCustomize=true > 
							<#assign roomSize_defaultValue  = ''>
									<#assign roomSize_defaultValue  = ''>
										<@systemcode onchange="" deValue="${roomSize_defaultValue}"   name="roomSize" code="meetingSize" classStyle="cui-noborder-input" value="" />
							</@queryfield>
					       	<@querybutton formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" type="adv" onclick="X6Basic.meetingroom.meetingRoom.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
					 		<@querybutton formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" type="clear"  /> 
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.meetingroom.meetingRoom.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/meetingroom/meetingRoom/list-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_meetingroom_meetingRoom_list_query" renderOverEvent="ec_X6Basic_meetingroom_meetingRoom_list_RenderOverEvent"  modelCode="X6Basic_1.0_meetingroom_MeetingRoom" noPermissionKeys="name,roomSize,projector,camera,matching,network,audio" hidekeyPrefix="ec_X6Basic_meetingroom_meetingRoom_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_meetingroom_meetingRoom_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.meetingroom.meetingRoom.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&permissionCode=${permissionCode!''}">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_add_add_X6Basic_1.0_meetingroom_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1366794153798')}||iconcls:add||useInMore:false||onclick:
				X6Basic.meetingroom.meetingRoom.list.addlist()
		" 
		 operateType="noPower"
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_modify_modify_X6Basic_1.0_meetingroom_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1366794170950')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.meetingroom.meetingRoom.list.modifylist()
		" 
		 operateType="noPower"
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_del_del_X6Basic_1.0_meetingroom_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1366794202086')}||iconcls:del||useInMore:false||onclick:
				X6Basic.meetingroom.meetingRoom.list.dellist()
		" 
		 operateType="noPower"
		resultType="json" />
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1366792696971')}" textalign="center"  width=100  type="textfield"    showFormatFunc=""/>
			<#assign roomSize_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${roomSize_displayDefaultType!}"  key="roomSize.value"  label="${getText('X6Basic.propertydisplayName.radion1366793347089')}" textalign="center"  width=100  type="systemcode"    showFormatFunc=""/>
			<#assign projector_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${projector_displayDefaultType!}"  key="projector"  label="${getText('X6Basic.propertydisplayName.radion1366793011250')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign camera_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${camera_displayDefaultType!}"  key="camera"  label="${getText('X6Basic.propertydisplayName.radion1366792991306')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign matching_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${matching_displayDefaultType!}"  key="matching"  label="${getText('X6Basic.propertydisplayName.radion1366792802487')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign network_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${network_displayDefaultType!}"  key="network"  label="${getText('X6Basic.propertydisplayName.radion1366792858041')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
			<#assign audio_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${audio_displayDefaultType!}"  key="audio"  label="${getText('X6Basic.propertydisplayName.radion1366792961138')}" textalign="center"  width=100  type="boolean"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_meetingroom_meetingRoom_list_RenderOverEvent(){
}
	
	
	
	
	
	
	
</script>