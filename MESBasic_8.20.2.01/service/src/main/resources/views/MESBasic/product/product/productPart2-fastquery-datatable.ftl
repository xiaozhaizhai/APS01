	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_product_product_productPart2_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_product_productPart2_queryForm" exportUrl="/MESBasic/product/product/productPart2-query.action">
		<input type="hidden" id="MESBasic_1_prodList_BaseProdList" value="productListID" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415772316600')}_${getText('MESBasic.viewtitle.randon1476667676545')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_product_product_productPart2_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_product_product_productPart2_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_product_productPart2')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_product_productPart2" formId="ec_MESBasic_product_product_productPart2_queryForm" dataTableId="ec_MESBasic_product_product_productPart2_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_product_product_productPart2_queryForm" isExpandAll=true formId="ec_MESBasic_product_product_productPart2_queryForm" idprefix="ec_MESBasic_product_product_productPart2" expandType="single"  fieldcodes="MESBasic_1_product_Product_productName_productName:MESBasic.propertydisplayName.radion1415772740737||MESBasic_1_product_Product_productCode_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<#assign productName_defaultValue  = ''>
									<#assign productName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productPart2_queryForm" code="MESBasic_1_product_Product_productName" showFormat="TEXT" defaultValue=productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productName" isCustomize=true > 
										<#if (productName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart2_queryForm"  isPrecise=true value="${productName_defaultValue!}" deValue="${productName_defaultValue!}"   conditionfunc="MESBasic.product.product.productPart2._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productPart2_queryForm_productName" displayFieldName="productName" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart2.commonQuery('query')"  currentViewCode="MESBasic_1_product_productPart2"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart2_queryForm"  isPrecise=true  conditionfunc="MESBasic.product.product.productPart2._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productPart2_queryForm_productName" displayFieldName="productName" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart2.commonQuery('query')" currentViewCode="MESBasic_1_product_productPart2"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign productCode_defaultValue  = ''>
									<#assign productCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productPart2_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="TEXT" defaultValue=productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productCode" isCustomize=true > 
										<#if (productCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart2_queryForm"  isPrecise=true value="${productCode_defaultValue!}" deValue="${productCode_defaultValue!}"   conditionfunc="MESBasic.product.product.productPart2._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productPart2_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart2.commonQuery('query')"  currentViewCode="MESBasic_1_product_productPart2"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart2_queryForm"  isPrecise=true  conditionfunc="MESBasic.product.product.productPart2._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productPart2_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart2.commonQuery('query')" currentViewCode="MESBasic_1_product_productPart2"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_product_product_productPart2_queryForm" type="adv" onclick="MESBasic.product.product.productPart2.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_product_product_productPart2_queryForm" type="clear"  />
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
<#assign datatable_firstLoad = false>
<#assign datatable_queryFunc = "MESBasic.product.product.productPart2.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/product/productPart2-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_product_product_productPart2_query" renderOverEvent="ec_MESBasic_product_product_productPart2_RenderOverEvent" pageInitMethod="ec_MESBasic_product_product_productPart2_PageInitMethod" modelCode="MESBasic_1_product_Product" noPermissionKeys="selectFlag,productCode,productName,productListID.prodListName,productSpecif,productModel,createTime,modifyTime" hidekeyPrefix="ec_MESBasic_product_product_productPart2_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_product_productPart2_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.product.product.productPart2.dbmodifyproductPart2" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','productListID.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.product.product.productPart2.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart2_add_add_MESBasic_1_product_productPart2||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003385645')}||iconcls:add||useInMore:false||onclick:
				MESBasic.product.product.productPart2.addproductPart2()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart2_modify_modify_MESBasic_1_product_productPart2||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003406493')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.product.product.productPart2.modifyproductPart2()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart2_delete_del_MESBasic_1_product_productPart2||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003432013')}||iconcls:del||useInMore:false||onclick:
				MESBasic.product.product.productPart2.delproductPart2()
		" 
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign selectFlag_displayDefaultType  = ''>
			<@datacolumn columnName="SELECT_FLAG"    showFormat="CHECKBOX" defaultDisplay="${selectFlag_displayDefaultType!}"  key="selectFlag"   label="${getText('MESBasic.propertydisplayName.randon1476667862030')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productCode_displayDefaultType!}"  key="productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productName_displayDefaultType!}"  key="productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
			<#assign productListID_prodListName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODLIST_NAME"    showFormat="TEXT" defaultDisplay="${productListID_prodListName_displayDefaultType!}"  key="productListID.prodListName"   label="${getText('MESBasic.propertydisplayName.randon1450078913966')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productSpecif_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_SPECIF"    showFormat="TEXT" defaultDisplay="${productSpecif_displayDefaultType!}"  key="productSpecif"   label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productModel_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_MODEL"    showFormat="TEXT" defaultDisplay="${productModel_displayDefaultType!}"  key="productModel"   label="${getText('MESBasic.propertydisplayName.radion1415772568665')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CREATETIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('ec.common.createTime')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
			<#assign modifyTime_displayDefaultType  = ''>
			<@datacolumn columnName="MODIFYTIME"    showFormat="YMD_HMS" defaultDisplay="${modifyTime_displayDefaultType!}"  key="modifyTime"   label="${getText('ec.common.modifyTime')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_product_productPart2_RenderOverEvent(){
}
function ec_MESBasic_product_product_productPart2_PageInitMethod(){
}
	
	
	
	
	
	
	
	
</script>