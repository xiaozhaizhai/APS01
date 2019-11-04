	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1429057173329')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" exportUrl="/MESBasic/backgroundServiceMonitor/mESServices/logView-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1429057210032')}_${getText('MESBasic.viewtitle.randon1429057861115')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<div id="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_backgroundServiceMonitor_logView')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_backgroundServiceMonitor_logView" formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" dataTableId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" isExpandAll=true formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" idprefix="ec_MESBasic_backgroundServiceMonitor_mESServices_logView" expandType="all"  fieldcodes="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName_serviceName:MESBasic.propertydisplayName.randon1429057348197||MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode_serviceCode:MESBasic.propertydisplayName.randon1429057324372||MESBasic_1_backgroundServiceMonitor_MESServices_active_active:MESBasic.propertydisplayName.randon1429057668351" > 
							<@queryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName" showFormat="TEXT" divCode="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName_serviceName" isCustomize=true > 
							<#assign serviceName_defaultValue  = ''>
									<#assign serviceName_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="serviceName" id="serviceName" value="${serviceName_defaultValue!}" deValue="${serviceName_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode" showFormat="TEXT" divCode="MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode_serviceCode" isCustomize=true > 
							<#assign serviceCode_defaultValue  = ''>
									<#assign serviceCode_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="serviceCode" id="serviceCode" value="${serviceCode_defaultValue!}" deValue="${serviceCode_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_active" showFormat="SELECT" divCode="MESBasic_1_backgroundServiceMonitor_MESServices_active_active" isCustomize=true > 
							<#assign active_defaultValue  = ''>
									<#assign active_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${active_defaultValue!}" name="active" id="active" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (active_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (active_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" type="adv" onclick="MESBasic.backgroundServiceMonitor.mESServices.logView.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.backgroundServiceMonitor.mESServices.logView.query('query')">
<#assign datatable_dataUrl = "/MESBasic/backgroundServiceMonitor/mESServices/logView-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_query" renderOverEvent="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_RenderOverEvent" pageInitMethod="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_PageInitMethod" modelCode="MESBasic_1_backgroundServiceMonitor_MESServices" noPermissionKeys="serviceCode,serviceName,active,lastRunningTime" hidekeyPrefix="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logView_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.backgroundServiceMonitor.mESServices.logView.dbClickViewlogView" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.backgroundServiceMonitor.mESServices.logView.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign serviceCode_displayDefaultType  = ''>
			<@datacolumn columnName="SERVICE_CODE"    showFormat="TEXT" defaultDisplay="${serviceCode_displayDefaultType!}"  key="serviceCode"   label="${getText('MESBasic.propertydisplayName.randon1429057324372')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign serviceName_displayDefaultType  = ''>
			<@datacolumn columnName="SERVICE_NAME"    showFormat="TEXT" defaultDisplay="${serviceName_displayDefaultType!}"  key="serviceName"   label="${getText('MESBasic.propertydisplayName.randon1429057348197')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign active_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE"    showFormat="SELECT" defaultDisplay="${active_displayDefaultType!}"  key="active"   label="${getText('MESBasic.propertydisplayName.randon1429057668351')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign lastRunningTime_displayDefaultType  = ''>
			<@datacolumn columnName="LAST_RUNNING_TIME"    showFormat="YMD_HMS" defaultDisplay="${lastRunningTime_displayDefaultType!}"  key="lastRunningTime"   label="${getText('MESBasic.propertydisplayName.randon1429057448034')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_backgroundServiceMonitor_mESServices_logView_RenderOverEvent(){
}
function ec_MESBasic_backgroundServiceMonitor_mESServices_logView_PageInitMethod(){
}
	
	
	
	
</script>