	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1470293040491')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" exportUrl="/MESBasic/prodatriel/prodattrel/prodAttrRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_prodatriel_prodattrel_prodAttrRef_condition" id="MESBasic_prodatriel_prodattrel_prodAttrRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1470293065225')}_${getText('MESBasic.viewtitle.randon1470362293410')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_prodatriel_prodAttrRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_prodatriel_prodAttrRef" formId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" dataTableId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" isExpandAll=true formId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" idprefix="ec_MESBasic_prodatriel_prodattrel_prodAttrRef" expandType="all"  fieldcodes="MESBasic_1_product_Product_productName_productId_productName:MESBasic.propertydisplayName.radion1415772740737" > 
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  conditionfunc="MESBasic.prodatriel.prodattrel.prodAttrRef._querycustomFunc('productId_productName')" name="productId.productName" id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/ref.action"   refViewCode="MESBasic_1_product_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" searchClick="MESBasic.prodatriel.prodattrel.prodAttrRef.commonQuery('query')"  />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" type="search" onclick="MESBasic.prodatriel.prodattrel.prodAttrRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.prodatriel.prodattrel.prodAttrRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/prodatriel/prodattrel/prodAttrRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query" renderOverEvent="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_RenderOverEvent" pageInitMethod="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_PageInitMethod" modelCode="MESBasic_1_prodatriel_Prodattrel" noPermissionKeys="firattid.name,secattid.name" hidekeyPrefix="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_prodatriel_prodattrel_prodAttrRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.prodatriel.prodattrel.prodAttrRef.sendBackprodAttrRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','firattid.id','secattid.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.prodatriel.prodattrel.prodAttrRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign firattid_name_displayDefaultType  = ''>
			<@datacolumn columnName="PRODATT_NAME"    showFormat="TEXT" defaultDisplay="${firattid_name_displayDefaultType!}"  key="firattid.name"   label="${getText('MESBasic.propertydisplayName.randon147029287675701')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign secattid_name_displayDefaultType  = ''>
			<@datacolumn columnName="PRODATT_NAME"    showFormat="TEXT" defaultDisplay="${secattid_name_displayDefaultType!}"  key="secattid.name"   label="${getText('MESBasic.propertydisplayName.randon147029287675702')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_prodatriel_prodattrel_prodAttrRef_RenderOverEvent(){
}
function ec_MESBasic_prodatriel_prodattrel_prodAttrRef_PageInitMethod(){
}
	
	
	
</script>