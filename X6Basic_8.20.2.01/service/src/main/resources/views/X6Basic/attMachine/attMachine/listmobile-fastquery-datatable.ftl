	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1367137834700')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_attMachine_attMachine_list_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_attMachine_attMachine_list_queryForm" exportUrl="/X6Basic/attMachine/attMachine/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="ownerStaff" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="effectStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="createStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="modifyStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="deleteStaff" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1367137930784')}_${getText('X6Basic.viewtitle.radion1367140397767')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_attMachine_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_attMachine_list" formId="ec_X6Basic_attMachine_attMachine_list_queryForm" dataTableId="ec_X6Basic_attMachine_attMachine_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_attMachine_attMachine_list_queryForm" formId="ec_X6Basic_attMachine_attMachine_list_queryForm"  fieldcodes="X6Basic_1.0_attMachine_AttMachine_code_code:X6Basic.propertydisplayName.radion1367138903063||X6Basic_1.0_attMachine_AttMachine_name_name:X6Basic.propertydisplayName.radion1367138883847||X6Basic_1.0_attMachine_AttMachine_attType_attType:X6Basic.propertydisplayName.radion1367139789420||X6Basic_1.0_attMachine_AttMachine_ifatt_ifatt:X6Basic.propertydisplayName.radion1367138009522||X6Basic_1.0_attMachine_AttMachine_ifMeeting_ifMeeting:X6Basic.propertydisplayName.radion1367138856827||X6Basic_1.0_attMachine_AttMachine_ifconsume_ifconsume:X6Basic.propertydisplayName.radion1367138822787" > 
							<@queryfield formId="ec_X6Basic_attMachine_attMachine_list_queryForm" code="X6Basic_1.0_attMachine_AttMachine_code" showFormat="TEXT" divCode="X6Basic_1.0_attMachine_AttMachine_code_code" isCustomize=true > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_attMachine_attMachine_list_queryForm" code="X6Basic_1.0_attMachine_AttMachine_name" showFormat="TEXT" divCode="X6Basic_1.0_attMachine_AttMachine_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_attMachine_attMachine_list_queryForm" code="X6Basic_1.0_attMachine_AttMachine_attType" showFormat="SELECTCOMP" divCode="X6Basic_1.0_attMachine_AttMachine_attType_attType" isCustomize=true > 
							<#assign attType_defaultValue  = ''>
									<#assign attType_defaultValue  = ''>
										<@systemcode onchange="" ecFlag=true multable=false deValue="${attType_defaultValue}"   name="attType" code="attType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<@queryfield formId="ec_X6Basic_attMachine_attMachine_list_queryForm" code="X6Basic_1.0_attMachine_AttMachine_ifatt" showFormat="SELECT" divCode="X6Basic_1.0_attMachine_AttMachine_ifatt_ifatt" isCustomize=true > 
							<#assign ifatt_defaultValue  = 'true'>
									<#assign ifatt_defaultValue  = 'true'>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${ifatt_defaultValue!}" name="ifatt" id="ifatt" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (ifatt_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (ifatt_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_attMachine_attMachine_list_queryForm" code="X6Basic_1.0_attMachine_AttMachine_ifMeeting" showFormat="SELECT" divCode="X6Basic_1.0_attMachine_AttMachine_ifMeeting_ifMeeting" isCustomize=true > 
							<#assign ifMeeting_defaultValue  = ''>
									<#assign ifMeeting_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${ifMeeting_defaultValue!}" name="ifMeeting" id="ifMeeting" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (ifMeeting_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (ifMeeting_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_attMachine_attMachine_list_queryForm" code="X6Basic_1.0_attMachine_AttMachine_ifconsume" showFormat="SELECT" divCode="X6Basic_1.0_attMachine_AttMachine_ifconsume_ifconsume" isCustomize=true > 
							<#assign ifconsume_defaultValue  = 'false'>
									<#assign ifconsume_defaultValue  = 'false'>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${ifconsume_defaultValue!}" name="ifconsume" id="ifconsume" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (ifconsume_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (ifconsume_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
					       	<@querybutton formId="ec_X6Basic_attMachine_attMachine_list_queryForm" type="adv" onclick="X6Basic.attMachine.attMachine.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
					 		<@querybutton formId="ec_X6Basic_attMachine_attMachine_list_queryForm" type="clear"  /> 
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.attMachine.attMachine.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/attMachine/attMachine/list-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_attMachine_attMachine_list_query" renderOverEvent="ec_X6Basic_attMachine_attMachine_list_RenderOverEvent"  modelCode="X6Basic_1.0_attMachine_AttMachine" noPermissionKeys="code,name" hidekeyPrefix="ec_X6Basic_attMachine_attMachine_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_attMachine_attMachine_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.attMachine.attMachine.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&permissionCode=${permissionCode!''}">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_add_add_X6Basic_1.0_attMachine_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1367476288276')}||iconcls:add||useInMore:false||onclick:
				X6Basic.attMachine.attMachine.list.addlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_modify_modify_X6Basic_1.0_attMachine_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1367476331260')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.attMachine.attMachine.list.modifylist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_delete_del_X6Basic_1.0_attMachine_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1367476370081')}||iconcls:del||useInMore:false||onclick:
				X6Basic.attMachine.attMachine.list.dellist()
		" 
		resultType="json" />
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"  label="${getText('X6Basic.propertydisplayName.radion1367138903063')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1367138883847')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_attMachine_attMachine_list_RenderOverEvent(){
}
	
	
</script>