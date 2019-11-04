	<#if businessCenterCode?? >
	<div style="position:relative;z-index:1;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1400115617349')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_cardStaff_cardStaffWork_list_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" exportUrl="/X6Basic/cardStaff/cardStaffWork/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1400115788046')}_${getText('X6Basic.viewtitle.radion1400116180318')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_cardStaff_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_cardStaff_list"  formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" dataTableId="ec_X6Basic_cardStaff_cardStaffWork_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" idprefix="ec_X6Basic_cardStaff_cardStaffWork_list" expandType="single"  fieldcodes="X6Basic_1.0_cardStaff_CardStaffWork_cardNo_cardNo:X6Basic.propertydisplayName.radion1400115866733||base_staff_name_staff_name:foundation.staff.dimissionStaff_xls.staffName" > 
							<@queryfield formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" code="X6Basic_1.0_cardStaff_CardStaffWork_cardNo" showFormat="TEXT" divCode="X6Basic_1.0_cardStaff_CardStaffWork_cardNo_cardNo" isCustomize=true > 
							<#assign cardNo_defaultValue  = ''>
									<#assign cardNo_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="cardNo" id="cardNo" value="${cardNo_defaultValue!}" deValue="${cardNo_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" code="base_staff_name" showFormat="SELECTCOMP" divCode="base_staff_name_staff_name" isCustomize=true > 
							<#assign staff_name_defaultValue  = ''>
									<#assign staff_name_defaultValue  = ''>
										<input type="hidden" id="staff.id" name="staff.id" value="" />
												<@mneclient mneenable=true  isPrecise=true deValue="${staff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="X6Basic.cardStaff.cardStaffWork.list._querycustomFunc('staff_name')" name="staff.name" id="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm_staff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" searchClick="X6Basic.cardStaff.cardStaffWork.list.commonQuery('query')" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" type="adv" onclick="X6Basic.cardStaff.cardStaffWork.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.cardStaff.cardStaffWork.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/cardStaff/cardStaffWork/list-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  id="ec_X6Basic_cardStaff_cardStaffWork_list_query" renderOverEvent="ec_X6Basic_cardStaff_cardStaffWork_list_RenderOverEvent" pageInitMethod="ec_X6Basic_cardStaff_cardStaffWork_list_PageInitMethod" modelCode="X6Basic_1.0_cardStaff_CardStaffWork" noPermissionKeys="cardNo,staff.name" hidekeyPrefix="ec_X6Basic_cardStaff_cardStaffWork_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_cardStaff_cardStaffWork_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true  style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','staff.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="X6Basic.cardStaff.cardStaffWork.list.showErrorMsg">
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign cardNo_displayDefaultType  = ''>
			<@datacolumn columnName="CARD_NO"    showFormat="TEXT" defaultDisplay="${cardNo_displayDefaultType!}"  key="cardNo"   label="${getText('X6Basic.propertydisplayName.radion1400115866733')}" textalign="center"  width=200   type="textfield"    showFormatFunc=""/>
			<#assign staff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${staff_name_displayDefaultType!}"  key="staff.name"   label="${getText('foundation.staff.dimissionStaff_xls.staffName')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_cardStaff_cardStaffWork_list_RenderOverEvent(){
}
function ec_X6Basic_cardStaff_cardStaffWork_list_PageInitMethod(){
}
	
	
</script>