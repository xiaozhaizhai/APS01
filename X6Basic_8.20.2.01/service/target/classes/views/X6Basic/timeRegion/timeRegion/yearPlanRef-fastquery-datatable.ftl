	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1441778268642')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" exportUrl="/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="X6Basic_timeRegion_timeRegion_yearPlanRef_condition" id="X6Basic_timeRegion_timeRegion_yearPlanRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1441778365812')}_${getText('X6Basic.viewtitle.randon1442368691425')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<div id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('X6Basic_1.0_timeRegion_yearPlanRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_timeRegion_yearPlanRef" formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" dataTableId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" isExpandAll=true formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" idprefix="ec_X6Basic_timeRegion_timeRegion_yearPlanRef" expandType="all"  fieldcodes="X6Basic_1.0_timeRegion_TimeRegion_setyear_setyear:X6Basic.propertydisplayName.randon1441880564502" > 
							<#assign setyear_defaultValue  = ''>
									<#assign setyear_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" code="X6Basic_1.0_timeRegion_TimeRegion_setyear" showFormat="TEXT" defaultValue=setyear_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegion_setyear_setyear" isCustomize=true > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="setyear_start" id="setyear_start" value="${setyear_defaultValue!}" deValue="${setyear_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="setyear_end" id="setyear_end" value="${setyear_defaultValue!}" deValue="${setyear_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" type="search" onclick="X6Basic.timeRegion.timeRegion.yearPlanRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "X6Basic.timeRegion.timeRegion.yearPlanRef.query('query')">
<#assign datatable_dataUrl = "/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query" renderOverEvent="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_RenderOverEvent" pageInitMethod="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_PageInitMethod" modelCode="X6Basic_1.0_timeRegion_TimeRegion" noPermissionKeys="name,setyear,startTime,endTime" hidekeyPrefix="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.timeRegion.timeRegion.yearPlanRef.sendBackyearPlanRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="X6Basic.timeRegion.timeRegion.yearPlanRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1441778463050')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign setyear_displayDefaultType  = ''>
			<@datacolumn columnName="SETYEAR"    showFormat="TEXT" defaultDisplay="${setyear_displayDefaultType!}"  key="setyear"   label="${getText('X6Basic.propertydisplayName.randon1441880564502')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('X6Basic.propertydisplayName.randon1441851237774')}" textalign="center"  width=100   type="date"    showFormatFunc=""/>
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('X6Basic.propertydisplayName.randon1441880710697')}" textalign="center"  width=100   type="date"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_timeRegion_timeRegion_yearPlanRef_RenderOverEvent(){
}
function ec_X6Basic_timeRegion_timeRegion_yearPlanRef_PageInitMethod(){
}
	
	
	
	
</script>