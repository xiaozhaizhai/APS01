	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1435906146412')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseVendor_baseVendor_list_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseVendor_baseVendor_list_queryForm" exportUrl="/MESBasic/baseVendor/baseVendor/list-query.action">
		<input type="hidden" id="MESBasic_1_baseVenderClass_BaseVendorClass" value="vendorVcCode" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1435906170378')}_${getText('MESBasic.viewtitle.randon1436840822965')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('MESBasic_1_baseVendor_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseVendor_list" formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm" dataTableId="ec_MESBasic_baseVendor_baseVendor_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseVendor_baseVendor_list_queryForm"  formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm" idprefix="ec_MESBasic_baseVendor_baseVendor_list" expandType="single"  fieldcodes="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode:MESBasic.propertydisplayName.randon1435906301259||MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName:MESBasic.propertydisplayName.randon1435906340469" > 
							<#assign vendorCode_defaultValue  = ''>
									<#assign vendorCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorCode" showFormat="TEXT" defaultValue=vendorCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode" isCustomize=true > 
										<#if (vendorCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm"  isPrecise=true value="${vendorCode_defaultValue!}" deValue="${vendorCode_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.list._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_list_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.list.commonQuery('query')" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.list._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_list_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.list.commonQuery('query')" />
										</#if>
							</@queryfield>
							<#assign vendorName_defaultValue  = ''>
									<#assign vendorName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorName" showFormat="TEXT" defaultValue=vendorName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName" isCustomize=true > 
										<#if (vendorName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm"  isPrecise=true value="${vendorName_defaultValue!}" deValue="${vendorName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.list._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_list_queryForm_vendorName" displayFieldName="vendorName" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.list.commonQuery('query')" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.list._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_list_queryForm_vendorName" displayFieldName="vendorName" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.list.commonQuery('query')" />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm" type="adv" onclick="MESBasic.baseVendor.baseVendor.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.baseVendor.baseVendor.list.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseVendor/baseVendor/list-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_baseVendor_baseVendor_list_query" renderOverEvent="ec_MESBasic_baseVendor_baseVendor_list_RenderOverEvent" pageInitMethod="ec_MESBasic_baseVendor_baseVendor_list_PageInitMethod" modelCode="MESBasic_1_baseVendor_BaseVendor" noPermissionKeys="vendorCode,vendorName" hidekeyPrefix="ec_MESBasic_baseVendor_baseVendor_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseVendor_baseVendor_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.baseVendor.baseVendor.list.dbClickViewlist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseVendor.baseVendor.list.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign vendorCode_displayDefaultType  = ''>
			<@datacolumn columnName="VENDOR_CODE"    showFormat="TEXT" defaultDisplay="${vendorCode_displayDefaultType!}"  key="vendorCode"   label="${getText('MESBasic.propertydisplayName.randon1435906301259')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign vendorName_displayDefaultType  = ''>
			<@datacolumn columnName="VENDOR_NAME"    showFormat="TEXT" defaultDisplay="${vendorName_displayDefaultType!}"  key="vendorName"   label="${getText('MESBasic.propertydisplayName.randon1435906340469')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseVendor_baseVendor_list_RenderOverEvent(){
}
function ec_MESBasic_baseVendor_baseVendor_list_PageInitMethod(){
}
	
	
</script>