	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1367133380805')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_signetManage_signetSetting_refer_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_signetManage_signetSetting_refer_queryForm" exportUrl="/X6Basic/signetManage/signetSetting/refer-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="ownerStaff" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="effectStaff" />
		<input type="hidden" id="sysbase_1_0_user_base_user" value="userinfo" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="createStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="modifyStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="deleteStaff" />
		<input type="hidden" reset="false" name="X6Basic_signetManage_signetSetting_refer_condition" id="X6Basic_signetManage_signetSetting_refer_condition" value="${(condition)!''}"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1367133428061')}_${getText('X6Basic.viewtitle.radion1368940381208')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_signetManage_refer')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_signetManage_refer" formId="ec_X6Basic_signetManage_signetSetting_refer_queryForm" dataTableId="ec_X6Basic_signetManage_signetSetting_refer_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_signetManage_signetSetting_refer_queryForm" formId="ec_X6Basic_signetManage_signetSetting_refer_queryForm"  fieldcodes="X6Basic_1.0_signetManage_SignetSetting_name_name:X6Basic.propertydisplayName.radion1367133494680||X6Basic_1.0_signetManage_SignetSetting_userName_userName:X6Basic.propertydisplayName.radion1367133528419" > 
							<@queryfield formId="ec_X6Basic_signetManage_signetSetting_refer_queryForm" code="X6Basic_1.0_signetManage_SignetSetting_name" showFormat="TEXT" divCode="X6Basic_1.0_signetManage_SignetSetting_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_signetManage_signetSetting_refer_queryForm" code="X6Basic_1.0_signetManage_SignetSetting_userName" showFormat="TEXT" divCode="X6Basic_1.0_signetManage_SignetSetting_userName_userName" isCustomize=true > 
							<#assign userName_defaultValue  = ''>
									<#assign userName_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="userName" id="userName" value="${userName_defaultValue!}" deValue="${userName_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
					       	<@querybutton formId="ec_X6Basic_signetManage_signetSetting_refer_queryForm" type="search" onclick="X6Basic.signetManage.signetSetting.refer.commonQuery('query')" /> 
					 		<@querybutton formId="ec_X6Basic_signetManage_signetSetting_refer_queryForm" type="clear"  /> 
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.signetManage.signetSetting.refer.query('query')">
<#assign datatable_dataUrl = "/X6Basic/signetManage/signetSetting/refer-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_signetManage_signetSetting_refer_query" renderOverEvent="ec_X6Basic_signetManage_signetSetting_refer_RenderOverEvent"  modelCode="X6Basic_1.0_signetManage_SignetSetting" noPermissionKeys="name,userinfo.name" hidekeyPrefix="ec_X6Basic_signetManage_signetSetting_refer_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_signetManage_signetSetting_refer_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.signetManage.signetSetting.refer.sendBackrefer" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','userinfo.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1367133494680')}" textalign="center"  width=100  type="textfield"    showFormatFunc=""/>
			<#assign userinfo_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${userinfo_name_displayDefaultType!}"  key="userinfo.name"  label="${getText('X6Basic.propertydisplayName.radion1367133494680')}" textalign="left"  width=100  type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_signetManage_signetSetting_refer_RenderOverEvent(){
}
	
	
</script>