	<#if businessCenterCode?? >
	<div style="position:relative;z-index:1;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1419849664834')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_product_type_producttype_list_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_type_producttype_list_queryForm" exportUrl="/MESBasic/product_type/producttype/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1419849716922')}_${getText('MESBasic.viewtitle.radion1419849935747')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('MESBasic_1_product_type_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_product_type_list"  formId="ec_MESBasic_product_type_producttype_list_queryForm" dataTableId="ec_MESBasic_product_type_producttype_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_product_type_producttype_list_queryForm" formId="ec_MESBasic_product_type_producttype_list_queryForm" idprefix="ec_MESBasic_product_type_producttype_list" expandType="single"  fieldcodes="MESBasic_1_product_type_Producttype_code_code:MESBasic.propertydisplayName.radion1419849767734||MESBasic_1_product_type_Producttype_protype_protype:MESBasic.propertydisplayName.radion1419849784820||MESBasic_1_product_type_Producttype_notes_notes:MESBasic.propertydisplayName.radion1419849814178" > 
							<@queryfield formId="ec_MESBasic_product_type_producttype_list_queryForm" code="MESBasic_1_product_type_Producttype_code" showFormat="TEXT" divCode="MESBasic_1_product_type_Producttype_code_code" isCustomize=true > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
										<#if (code_defaultValue)?has_content>
											<@mneclient formId="ec_MESBasic_product_type_producttype_list_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.product_type.producttype.list._querycustomFunc('code')" name="code" id="ec_MESBasic_product_type_producttype_list_queryForm_code" displayFieldName="code" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product_type/producttype/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product_type.producttype.list.commonQuery('query')" />
										<#else>
											<@mneclient formId="ec_MESBasic_product_type_producttype_list_queryForm"  isPrecise=true  conditionfunc="MESBasic.product_type.producttype.list._querycustomFunc('code')" name="code" id="ec_MESBasic_product_type_producttype_list_queryForm_code" displayFieldName="code" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product_type/producttype/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product_type.producttype.list.commonQuery('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_product_type_producttype_list_queryForm" code="MESBasic_1_product_type_Producttype_protype" showFormat="TEXT" divCode="MESBasic_1_product_type_Producttype_protype_protype" isCustomize=true > 
							<#assign protype_defaultValue  = ''>
									<#assign protype_defaultValue  = ''>
										<#if (protype_defaultValue)?has_content>
											<@mneclient formId="ec_MESBasic_product_type_producttype_list_queryForm"  isPrecise=true value="${protype_defaultValue!}" deValue="${protype_defaultValue!}"   conditionfunc="MESBasic.product_type.producttype.list._querycustomFunc('protype')" name="protype" id="ec_MESBasic_product_type_producttype_list_queryForm_protype" displayFieldName="protype" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product_type/producttype/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product_type.producttype.list.commonQuery('query')" />
										<#else>
											<@mneclient formId="ec_MESBasic_product_type_producttype_list_queryForm"  isPrecise=true  conditionfunc="MESBasic.product_type.producttype.list._querycustomFunc('protype')" name="protype" id="ec_MESBasic_product_type_producttype_list_queryForm_protype" displayFieldName="protype" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product_type/producttype/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product_type.producttype.list.commonQuery('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_product_type_producttype_list_queryForm" code="MESBasic_1_product_type_Producttype_notes" showFormat="TEXT" divCode="MESBasic_1_product_type_Producttype_notes_notes" isCustomize=true > 
							<#assign notes_defaultValue  = ''>
									<#assign notes_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="notes" id="notes" value="${notes_defaultValue!}" deValue="${notes_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_product_type_producttype_list_queryForm" type="adv" onclick="MESBasic.product_type.producttype.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_product_type_producttype_list_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.product_type.producttype.list.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product_type/producttype/list-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_product_type_producttype_list_query" renderOverEvent="ec_MESBasic_product_type_producttype_list_RenderOverEvent" pageInitMethod="ec_MESBasic_product_type_producttype_list_PageInitMethod" modelCode="MESBasic_1_product_type_Producttype" noPermissionKeys="code,protype,notes" hidekeyPrefix="ec_MESBasic_product_type_producttype_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_type_producttype_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.product_type.producttype.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.product_type.producttype.list.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_addbtn_add_MESBasic_1_product_type_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1419852142009')}||iconcls:add||useInMore:false||onclick:
				MESBasic.product_type.producttype.list.addlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_btnupdate_modify_MESBasic_1_product_type_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1419852156465')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.product_type.producttype.list.modifylist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_btndelete_del_MESBasic_1_product_type_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1419852177801')}||iconcls:del||useInMore:false||onclick:
				MESBasic.product_type.producttype.list.dellist()
		" 
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1419849767734')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign protype_displayDefaultType  = ''>
			<@datacolumn columnName="PROTYPE"    showFormat="TEXT" defaultDisplay="${protype_displayDefaultType!}"  key="protype"   label="${getText('MESBasic.propertydisplayName.radion1419849784820')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign notes_displayDefaultType  = ''>
			<@datacolumn columnName="NOTES"    showFormat="TEXT" defaultDisplay="${notes_displayDefaultType!}"  key="notes"   label="${getText('MESBasic.propertydisplayName.radion1419849814178')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_type_producttype_list_RenderOverEvent(){
}
function ec_MESBasic_product_type_producttype_list_PageInitMethod(){
}
	
	
	
</script>