	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1371468383847')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_baseProduct_productManage_list_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_baseProduct_productManage_list_queryForm" exportUrl="/X6Basic/baseProduct/productManage/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="ownerStaff" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="effectStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="createStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="modifyStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="deleteStaff" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1371468466670')}_${getText('X6Basic.viewtitle.radion1371469051979')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_baseProduct_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_baseProduct_list" formId="ec_X6Basic_baseProduct_productManage_list_queryForm" dataTableId="ec_X6Basic_baseProduct_productManage_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_baseProduct_productManage_list_queryForm" formId="ec_X6Basic_baseProduct_productManage_list_queryForm"  fieldcodes="X6Basic_1.0_baseProduct_ProductManage_code_code:X6Basic.propertydisplayName.radion1371468505565||X6Basic_1.0_baseProduct_ProductManage_name_name:X6Basic.propertydisplayName.radion1371468737467||X6Basic_1.0_baseProduct_ProductManage_unit_unit:X6Basic.propertydisplayName.radion1371468832370" > 
							<@queryfield formId="ec_X6Basic_baseProduct_productManage_list_queryForm" code="X6Basic_1.0_baseProduct_ProductManage_code" showFormat="TEXT" divCode="X6Basic_1.0_baseProduct_ProductManage_code_code" isCustomize=true > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_baseProduct_productManage_list_queryForm" code="X6Basic_1.0_baseProduct_ProductManage_name" showFormat="TEXT" divCode="X6Basic_1.0_baseProduct_ProductManage_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_baseProduct_productManage_list_queryForm" code="X6Basic_1.0_baseProduct_ProductManage_unit" showFormat="TEXT" divCode="X6Basic_1.0_baseProduct_ProductManage_unit_unit" isCustomize=true > 
							<#assign unit_defaultValue  = ''>
									<#assign unit_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="unit" id="unit" value="${unit_defaultValue!}" deValue="${unit_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
					       	<@querybutton formId="ec_X6Basic_baseProduct_productManage_list_queryForm" type="adv" onclick="X6Basic.baseProduct.productManage.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
					 		<@querybutton formId="ec_X6Basic_baseProduct_productManage_list_queryForm" type="clear"  /> 
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.baseProduct.productManage.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/baseProduct/productManage/list-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_baseProduct_productManage_list_query" renderOverEvent="ec_X6Basic_baseProduct_productManage_list_RenderOverEvent"  modelCode="X6Basic_1.0_baseProduct_ProductManage" noPermissionKeys="code,name,specific,unit,currQuantity,createStaff.name,createTime" hidekeyPrefix="ec_X6Basic_baseProduct_productManage_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_baseProduct_productManage_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.baseProduct.productManage.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','createStaff.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&permissionCode=${permissionCode!''}">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_add_add_X6Basic_1.0_baseProduct_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1371469164796')}||iconcls:add||useInMore:false||onclick:
				X6Basic.baseProduct.productManage.list.addlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_modify_modify_X6Basic_1.0_baseProduct_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1371469189760')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.baseProduct.productManage.list.modifylist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_delete_del_X6Basic_1.0_baseProduct_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1371469208520')}||iconcls:del||useInMore:false||onclick:
				X6Basic.baseProduct.productManage.list.dellist()
		" 
		resultType="json" />
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"  label="${getText('X6Basic.propertydisplayName.radion1371468505565')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1371468737467')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign specific_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${specific_displayDefaultType!}"  key="specific"  label="${getText('X6Basic.propertydisplayName.radion1371468803570')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign unit_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${unit_displayDefaultType!}"  key="unit"  label="${getText('X6Basic.propertydisplayName.radion1371468832370')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign currQuantity_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${currQuantity_displayDefaultType!}"  key="currQuantity"  label="${getText('X6Basic.propertydisplayName.radion1371468561988')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign createStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${createStaff_name_displayDefaultType!}"  key="createStaff.name"  label="${getText('X6Basic.propertydisplayName.radion1368682044237')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"  label="${getText('ec.common.createTime')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_baseProduct_productManage_list_RenderOverEvent(){
}
	
	
	
	
	
	
	
</script>