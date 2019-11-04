	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1430808317340')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_testMapping_testMappingSet_list_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_testMapping_testMappingSet_list_queryForm" exportUrl="/MESBasic/testMapping/testMappingSet/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1430808417212')}_${getText('MESBasic.viewtitle.randon1430809375379')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<div id="ec_MESBasic_testMapping_testMappingSet_list_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_testMapping_testMappingSet_list_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_testMapping_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_testMapping_list" formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" dataTableId="ec_MESBasic_testMapping_testMappingSet_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_testMapping_testMappingSet_list_queryForm" isExpandAll=true formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" idprefix="ec_MESBasic_testMapping_testMappingSet_list" expandType="all"  fieldcodes="MESBasic_1_testMapping_TestMappingSet_testName_testName:MESBasic.propertydisplayName.randon1430808486471||MESBasic_1_testMapping_TestMappingSet_testShortName_testShortName:MESBasic.propertydisplayName.randon1430808617634||MESBasic_1_product_Product_productName_product_productName:MESBasic.propertydisplayName.radion1415772740737||MESBasic_1_product_Product_productCode_product_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<@queryfield formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" code="MESBasic_1_testMapping_TestMappingSet_testName" showFormat="TEXT" divCode="MESBasic_1_testMapping_TestMappingSet_testName_testName" isCustomize=true > 
							<#assign testName_defaultValue  = ''>
									<#assign testName_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="testName" id="testName" value="${testName_defaultValue!}" deValue="${testName_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" code="MESBasic_1_testMapping_TestMappingSet_testShortName" showFormat="TEXT" divCode="MESBasic_1_testMapping_TestMappingSet_testShortName_testShortName" isCustomize=true > 
							<#assign testShortName_defaultValue  = ''>
									<#assign testShortName_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="testShortName" id="testShortName" value="${testShortName_defaultValue!}" deValue="${testShortName_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" divCode="MESBasic_1_product_Product_productName_product_productName" isCustomize=true > 
							<#assign product_productName_defaultValue  = ''>
									<#assign product_productName_defaultValue  = ''>
										<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient mneenable=true  isPrecise=true deValue="${product_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}"  conditionfunc="MESBasic.testMapping.testMappingSet.list._querycustomFunc('product_productName')" name="product.productName" id="ec_MESBasic_testMapping_testMappingSet_list_queryForm_product_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" searchClick="MESBasic.testMapping.testMappingSet.list.commonQuery('query')"  />
							</@queryfield>
							<@queryfield formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true > 
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
												<@mneclient mneenable=true  isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}"  conditionfunc="MESBasic.testMapping.testMappingSet.list._querycustomFunc('product_productCode')" name="product.productCode" id="ec_MESBasic_testMapping_testMappingSet_list_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" searchClick="MESBasic.testMapping.testMappingSet.list.commonQuery('query')"  />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" type="adv" onclick="MESBasic.testMapping.testMappingSet.list.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.testMapping.testMappingSet.list.query('query')">
<#assign datatable_dataUrl = "/MESBasic/testMapping/testMappingSet/list-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_testMapping_testMappingSet_list_query" renderOverEvent="ec_MESBasic_testMapping_testMappingSet_list_RenderOverEvent" pageInitMethod="ec_MESBasic_testMapping_testMappingSet_list_PageInitMethod" modelCode="MESBasic_1_testMapping_TestMappingSet" noPermissionKeys="testName,testShortName,product.productName,product.productCode" hidekeyPrefix="ec_MESBasic_testMapping_testMappingSet_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_testMapping_testMappingSet_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.testMapping.testMappingSet.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','product.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.testMapping.testMappingSet.list.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_add_add_MESBasic_1_testMapping_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1430809515024')}||iconcls:add||useInMore:false||onclick:
				MESBasic.testMapping.testMappingSet.list.addlist()
		" 
		 operateType="noPower"
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_modify_modify_MESBasic_1_testMapping_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1430809740359')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.testMapping.testMappingSet.list.modifylist()
		" 
		 operateType="noPower"
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_删除_del_MESBasic_1_testMapping_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1430809758751')}||iconcls:del||useInMore:false||onclick:
				MESBasic.testMapping.testMappingSet.list.dellist()
		" 
		 operateType="noPower"
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign testName_displayDefaultType  = ''>
			<@datacolumn columnName="TEST_NAME"    showFormat="TEXT" defaultDisplay="${testName_displayDefaultType!}"  key="testName"   label="${getText('MESBasic.propertydisplayName.randon1430808486471')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign testShortName_displayDefaultType  = ''>
			<@datacolumn columnName="TEST_SHORT_NAME"    showFormat="TEXT" defaultDisplay="${testShortName_displayDefaultType!}"  key="testShortName"   label="${getText('MESBasic.propertydisplayName.randon1430808617634')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_testMapping_testMappingSet_list_RenderOverEvent(){
}
function ec_MESBasic_testMapping_testMappingSet_list_PageInitMethod(){
}
	
	
	
	
</script>