	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1441778268642')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" exportUrl="/X6Basic/timeRegion/timeRegion/timeRegRef-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" name="X6Basic_timeRegion_timeRegion_timeRegRef_condition" id="X6Basic_timeRegion_timeRegion_timeRegRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1441778365812')}_${getText('X6Basic.viewtitle.randon1441798201767')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('X6Basic_1.0_timeRegion_timeRegRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_timeRegion_timeRegRef" formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" dataTableId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" isExpandAll=true formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" idprefix="ec_X6Basic_timeRegion_timeRegion_timeRegRef" expandType="all"  fieldcodes="X6Basic_1.0_timeRegion_TimeRegion_name_name:X6Basic.propertydisplayName.randon1441778463050||X6Basic_1.0_timeRegion_TimeRegion_unit_unit:X6Basic.propertydisplayName.randon1441779032052" > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" code="X6Basic_1.0_timeRegion_TimeRegion_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegion_name_name" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<#assign unit_defaultValue  = ''>
									<#assign unit_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" code="X6Basic_1.0_timeRegion_TimeRegion_unit" showFormat="SELECTCOMP" defaultValue=unit_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegion_unit_unit" isCustomize=true > 
										<@systemcode  onchange="" ecFlag=true multable=false deValue="${unit_defaultValue}"   name="unit" code="timeUnit" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" type="search" onclick="X6Basic.timeRegion.timeRegion.timeRegRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div><#assign superChecked = false>
<#assign superCheckedName = "id">
<#assign superCheckedId = "id">
<#assign checkedRowsMap = "{}">
<#if (Parameters.superCheckedId)??>
<#assign superChecked = true>
<#assign superCheckedId = (Parameters.superCheckedId)>
</#if>
<#if (Parameters.superCheckedName)??>
<#assign superChecked = true>
<#assign superCheckedName = (Parameters.superCheckedName)>
</#if>
<#if (Parameters.checkedRowsMap)??>
<#assign checkedRowsMap = (Parameters.checkedRowsMap)>
</#if>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.timeRegion.timeRegion.timeRegRef.query('query')">
<#assign datatable_dataUrl = "/X6Basic/timeRegion/timeRegion/timeRegRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_query" renderOverEvent="ec_X6Basic_timeRegion_timeRegion_timeRegRef_RenderOverEvent" pageInitMethod="ec_X6Basic_timeRegion_timeRegion_timeRegRef_PageInitMethod" modelCode="X6Basic_1.0_timeRegion_TimeRegion" noPermissionKeys="name,unit" hidekeyPrefix="ec_X6Basic_timeRegion_timeRegion_timeRegRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.timeRegion.timeRegion.timeRegRef.sendBacktimeRegRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','unit.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="X6Basic.timeRegion.timeRegion.timeRegRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1441778463050')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign unit_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT"    showFormat="SELECTCOMP" defaultDisplay="${unit_displayDefaultType!}"  key="unit.value"   label="${getText('X6Basic.propertydisplayName.randon1441779032052')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_timeRegion_timeRegion_timeRegRef_RenderOverEvent(){
}
function ec_X6Basic_timeRegion_timeRegion_timeRegRef_PageInitMethod(){
}
	
	
</script>