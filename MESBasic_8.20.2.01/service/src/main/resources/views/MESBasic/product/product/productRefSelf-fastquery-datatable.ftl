	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_product_product_productRefSelf_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_product_productRefSelf_queryForm" exportUrl="/MESBasic/product/product/productRefSelf-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_product_product_productRefSelf_condition" id="MESBasic_product_product_productRefSelf_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415772316600')}_${getText('MESBasic.viewtitle.radion1415773613713')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_product_product_productRefSelf_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_product_product_productRefSelf_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_product_productRefSelf')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_product_productRefSelf" formId="ec_MESBasic_product_product_productRefSelf_queryForm" dataTableId="ec_MESBasic_product_product_productRefSelf_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_product_product_productRefSelf_queryForm" isExpandAll=true formId="ec_MESBasic_product_product_productRefSelf_queryForm" idprefix="ec_MESBasic_product_product_productRefSelf" expandType="single"  fieldcodes="MESBasic_1_product_Product_productCode_productCode:MESBasic.propertydisplayName.radion1415772644833||MESBasic_1_product_Product_productName_productName:MESBasic.propertydisplayName.radion1415772740737||MESBasic_1_product_Product_productModel_productModel:MESBasic.propertydisplayName.radion1415772620384||MESBasic_1_product_Product_attachExplain_attachExplain:MESBasic.propertydisplayName.radion1416221150939" > 
							<#assign productCode_defaultValue  = ''>
									<#assign productCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productRefSelf_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="TEXT" defaultValue=productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productCode" isCustomize=true > 
										<#if (productCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productRefSelf_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${productCode_defaultValue!}" deValue="${productCode_defaultValue!}"   conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productRefSelf_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')"  currentViewCode="MESBasic_1_product_productRefSelf"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productRefSelf_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productRefSelf_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')" currentViewCode="MESBasic_1_product_productRefSelf"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign productName_defaultValue  = ''>
									<#assign productName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productRefSelf_queryForm" code="MESBasic_1_product_Product_productName" showFormat="TEXT" defaultValue=productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productName" isCustomize=true > 
										<#if (productName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productRefSelf_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${productName_defaultValue!}" deValue="${productName_defaultValue!}"   conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productRefSelf_queryForm_productName" displayFieldName="productName" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')"  currentViewCode="MESBasic_1_product_productRefSelf"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productRefSelf_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productRefSelf_queryForm_productName" displayFieldName="productName" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')" currentViewCode="MESBasic_1_product_productRefSelf"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign productModel_defaultValue  = ''>
									<#assign productModel_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productRefSelf_queryForm" code="MESBasic_1_product_Product_productModel" showFormat="TEXT" defaultValue=productModel_defaultValue  divCode="MESBasic_1_product_Product_productModel_productModel" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productModel" id="productModel" value="${productModel_defaultValue!}" deValue="${productModel_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<#assign attachExplain_defaultValue  = ''>
									<#assign attachExplain_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productRefSelf_queryForm" code="MESBasic_1_product_Product_attachExplain" showFormat="TEXT" defaultValue=attachExplain_defaultValue  divCode="MESBasic_1_product_Product_attachExplain_attachExplain" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="attachExplain" id="attachExplain" value="${attachExplain_defaultValue!}" deValue="${attachExplain_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_product_product_productRefSelf_queryForm" type="search" onclick="MESBasic.product.product.productRefSelf.commonQuery('query')" /> 
						 		<@querybutton formId="ec_MESBasic_product_product_productRefSelf_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.product.product.productRefSelf.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/product/productRefSelf-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_product_product_productRefSelf_query" renderOverEvent="ec_MESBasic_product_product_productRefSelf_RenderOverEvent" pageInitMethod="ec_MESBasic_product_product_productRefSelf_PageInitMethod" modelCode="MESBasic_1_product_Product" noPermissionKeys="productCode,productName,assetno,attachExplain,productSpecif,seqno,unit,provalue,correcteam,storageplace,prostatus,goodState" hidekeyPrefix="ec_MESBasic_product_product_productRefSelf_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_product_productRefSelf_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.product.product.productRefSelf.sendBackproductRefSelf" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','prostatus.id','goodState.id','productCode','id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.product.product.productRefSelf.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productCode_displayDefaultType!}"  key="productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productName_displayDefaultType!}"  key="productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign assetno_displayDefaultType  = ''>
			<@datacolumn columnName="ASSETNO"    showFormat="TEXT" defaultDisplay="${assetno_displayDefaultType!}"  key="assetno"   label="${getText('MESBasic.propertydisplayName.radion1426063348625')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign attachExplain_displayDefaultType  = ''>
			<@datacolumn columnName="ATTACH_EXPLAIN"    showFormat="TEXT" defaultDisplay="${attachExplain_displayDefaultType!}"  key="attachExplain"   label="${getText('MESBasic.propertydisplayName.radion1416221150939')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign productSpecif_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_SPECIF"    showFormat="TEXT" defaultDisplay="${productSpecif_displayDefaultType!}"  key="productSpecif"   label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign seqno_displayDefaultType  = ''>
			<@datacolumn columnName="SEQNO"    showFormat="TEXT" defaultDisplay="${seqno_displayDefaultType!}"  key="seqno"   label="${getText('MESBasic.propertydisplayName.radion1426062856782')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign unit_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT"    showFormat="TEXT" defaultDisplay="${unit_displayDefaultType!}"  key="unit"   label="${getText('MESBasic.propertydisplayName.radion1416221204854')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign provalue_displayDefaultType  = ''>
			<@datacolumn columnName="PROVALUE"    showFormat="TEXT" defaultDisplay="${provalue_displayDefaultType!}"  key="provalue"   label="${getText('MESBasic.propertydisplayName.radion1426062803208')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign correcteam_displayDefaultType  = ''>
			<@datacolumn columnName="CORRECTEAM"    showFormat="TEXT" defaultDisplay="${correcteam_displayDefaultType!}"  key="correcteam"   label="${getText('MESBasic.propertydisplayName.radion1426062928664')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storageplace_displayDefaultType  = ''>
			<@datacolumn columnName="STORAGEPLACE"    showFormat="TEXT" defaultDisplay="${storageplace_displayDefaultType!}"  key="storageplace"   label="${getText('MESBasic.propertydisplayName.radion1426062975311')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign prostatus_displayDefaultType  = ''>
			<@datacolumn columnName="PROSTATUS"    showFormat="SELECTCOMP" defaultDisplay="${prostatus_displayDefaultType!}"  key="prostatus.value"   label="${getText('MESBasic.propertydisplayName.radion1426063248991')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign goodState_displayDefaultType  = ''>
			<@datacolumn columnName="GOOD_STATE"    showFormat="SELECTCOMP" defaultDisplay="${goodState_displayDefaultType!}"  key="goodState.value"   label="${getText('MESBasic.propertydisplayName.radion1416221691507')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_product_productRefSelf_RenderOverEvent(){
}
function ec_MESBasic_product_product_productRefSelf_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>