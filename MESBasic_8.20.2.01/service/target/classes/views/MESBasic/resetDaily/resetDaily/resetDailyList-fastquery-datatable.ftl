	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1471573731642')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" exportUrl="/MESBasic/resetDaily/resetDaily/resetDailyList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1471573833243')}_${getText('MESBasic.viewtitle.randon1471574153999')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<#assign advFlag = getAdvClassific('MESBasic_1_resetDaily_resetDailyList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_resetDaily_resetDailyList" formId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" dataTableId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm"  formId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" idprefix="ec_MESBasic_resetDaily_resetDaily_resetDailyList" expandType="single"  fieldcodes="MESBasic_1_product_Product_productCode_productID_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<#assign productID_productCode_defaultValue  = ''>
									<#assign productID_productCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productID_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productID_productCode" isCustomize=true > 
										<input type="hidden" id="productID.id" name="productID.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${productID_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  conditionfunc="MESBasic.resetDaily.resetDaily.resetDailyList._querycustomFunc('productID_productCode')" name="productID.productCode" id="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm_productID_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/ref.action"   refViewCode="MESBasic_1_product_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" searchClick="MESBasic.resetDaily.resetDaily.resetDailyList.commonQuery('query')"  />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" type="adv" onclick="MESBasic.resetDaily.resetDaily.resetDailyList.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.resetDaily.resetDaily.resetDailyList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/resetDaily/resetDaily/resetDailyList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_resetDaily_resetDaily_resetDailyList_query" renderOverEvent="ec_MESBasic_resetDaily_resetDaily_resetDailyList_RenderOverEvent" pageInitMethod="ec_MESBasic_resetDaily_resetDaily_resetDailyList_PageInitMethod" modelCode="MESBasic_1_resetDaily_ResetDaily" noPermissionKeys="productID.productCode,resetCyc,notifyDays" hidekeyPrefix="ec_MESBasic_resetDaily_resetDaily_resetDailyList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_resetDaily_resetDaily_resetDailyList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.resetDaily.resetDaily.resetDailyList.dbClickViewresetDailyList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','productID.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.resetDaily.resetDaily.resetDailyList.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign productID_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productID_productCode_displayDefaultType!}"  key="productID.productCode"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign resetCyc_displayDefaultType  = ''>
			<@datacolumn columnName="RESET_CYC"    showFormat="TEXT" defaultDisplay="${resetCyc_displayDefaultType!}"  key="resetCyc"   label="${getText('MESBasic.propertydisplayName.randon1471573964131')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign notifyDays_displayDefaultType  = ''>
			<@datacolumn columnName="NOTIFY_DAYS"    showFormat="TEXT" defaultDisplay="${notifyDays_displayDefaultType!}"  key="notifyDays"   label="${getText('MESBasic.propertydisplayName.randon1471574018952')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_resetDaily_resetDaily_resetDailyList_RenderOverEvent(){
}
function ec_MESBasic_resetDaily_resetDaily_resetDailyList_PageInitMethod(){
}
	
	
	
</script>