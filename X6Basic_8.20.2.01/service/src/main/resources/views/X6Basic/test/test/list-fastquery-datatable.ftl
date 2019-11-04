	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1460695541624')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_test_test_list_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_test_test_list_queryForm" exportUrl="/X6Basic/test/test/list-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1460695589266')}_${getText('X6Basic.viewtitle.randon1460695626823')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_test_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_test_list" formId="ec_X6Basic_test_test_list_queryForm" dataTableId="ec_X6Basic_test_test_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_test_test_list_queryForm"  formId="ec_X6Basic_test_test_list_queryForm" idprefix="ec_X6Basic_test_test_list" expandType="single"  fieldcodes="X6Basic_1.0_test_Test_name_name:X6Basic.propertydisplayName.randon1460695607594" > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_test_test_list_queryForm" code="X6Basic_1.0_test_Test_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_test_Test_name_name" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_test_test_list_queryForm" type="adv" onclick="X6Basic.test.test.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_X6Basic_test_test_list_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "X6Basic.test.test.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/test/test/list-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_X6Basic_test_test_list_query" renderOverEvent="ec_X6Basic_test_test_list_RenderOverEvent" pageInitMethod="ec_X6Basic_test_test_list_PageInitMethod" modelCode="X6Basic_1.0_test_Test" noPermissionKeys="name" hidekeyPrefix="ec_X6Basic_test_test_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_test_test_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.test.test.list.dbClickViewlist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="X6Basic.test.test.list.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_import_import_X6Basic_1.0_test_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1460695658258')}||iconcls:import||useInMore:false||onclick:
				X6Basic.test.test.list.importlist()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){X6Basic.test.test.list.downloadTemplatelist()},useInMore:'false'}]
		" 
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1460695607594')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_test_test_list_RenderOverEvent(){
}
function ec_X6Basic_test_test_list_PageInitMethod(){
}
	
</script>