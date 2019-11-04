	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_product_product_productPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_product_productPart_queryForm" exportUrl="/MESBasic/product/product/productPart-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factory" bak_value="factory"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="MESBasic_1_prodList_BaseProdList" value="productListID" bak_value="productListID"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeSet" bak_value="storeSet"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415772316600')}_${getText('MESBasic.viewtitle.randon1450082917357')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="fastQueryCond" name="fastQueryCond" />
		<input type="hidden" id="excelQueryCond" name="exportFastQueryCond" />
		<input type="hidden" class="nodeInfo" />
		<input type="hidden" id="treeNodeSelected" name="treeNodeSelected" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_product_product_productPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_product_product_productPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_product_productPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_product_productPart" formId="ec_MESBasic_product_product_productPart_queryForm" dataTableId="ec_MESBasic_product_product_productPart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_product_product_productPart_queryForm" isExpandAll=true formId="ec_MESBasic_product_product_productPart_queryForm" idprefix="ec_MESBasic_product_product_productPart" expandType="single"  fieldcodes="MESBasic_1_product_Product_productName_productName:MESBasic.propertydisplayName.radion1415772740737||MESBasic_1_product_Product_productCode_productCode:MESBasic.propertydisplayName.radion1415772644833||MESBasic_1_product_Product_productSpecif_productSpecif:MESBasic.propertydisplayName.radion1415772620384||MESBasic_1_product_Product_productModel_productModel:MESBasic.propertydisplayName.radion1415772568665" > 
							<#assign productName_defaultValue  = ''>
									<#assign productName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productPart_queryForm" code="MESBasic_1_product_Product_productName" showFormat="TEXT" defaultValue=productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productName" isCustomize=true style="" > 
										<#if (productName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_queryForm"  isPrecise=true value="${productName_defaultValue!}" deValue="${productName_defaultValue!}"   conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productPart_queryForm_productName" displayFieldName="productName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productPart_queryForm_productName" displayFieldName="productName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign productCode_defaultValue  = ''>
									<#assign productCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productPart_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="TEXT" defaultValue=productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productCode" isCustomize=true style="" > 
										<#if (productCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_queryForm"  isPrecise=true value="${productCode_defaultValue!}" deValue="${productCode_defaultValue!}"   conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productPart_queryForm_productCode" displayFieldName="productCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productPart_queryForm_productCode" displayFieldName="productCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign productSpecif_defaultValue  = ''>
									<#assign productSpecif_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productPart_queryForm" code="MESBasic_1_product_Product_productSpecif" showFormat="TEXT" defaultValue=productSpecif_defaultValue  divCode="MESBasic_1_product_Product_productSpecif_productSpecif" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productSpecif" id="productSpecif" value="${productSpecif_defaultValue!}" deValue="${productSpecif_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign productModel_defaultValue  = ''>
									<#assign productModel_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_product_productPart_queryForm" code="MESBasic_1_product_Product_productModel" showFormat="TEXT" defaultValue=productModel_defaultValue  divCode="MESBasic_1_product_Product_productModel_productModel" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productModel" id="productModel" value="${productModel_defaultValue!}" deValue="${productModel_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_product_product_productPart_queryForm" type="adv" onclick="MESBasic.product.product.productPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.product.product.productPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_product_product_productPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_product_product_productPart_quickquery_info={};
ec_MESBasic_product_product_productPart_quickquery_info["MainTableName"]="S2BASE_PRODUCT";
ec_MESBasic_product_product_productPart_quickquery_info["productName"]={};
ec_MESBasic_product_product_productPart_quickquery_info["productName"].dbColumnType="TEXT";
ec_MESBasic_product_product_productPart_quickquery_info["productName"].layRec="productName";
ec_MESBasic_product_product_productPart_quickquery_info["productName"].columnName="PRODUCT_NAME";
ec_MESBasic_product_product_productPart_quickquery_info["productCode"]={};
ec_MESBasic_product_product_productPart_quickquery_info["productCode"].dbColumnType="TEXT";
ec_MESBasic_product_product_productPart_quickquery_info["productCode"].layRec="productCode";
ec_MESBasic_product_product_productPart_quickquery_info["productCode"].columnName="PRODUCT_CODE";
ec_MESBasic_product_product_productPart_quickquery_info["productSpecif"]={};
ec_MESBasic_product_product_productPart_quickquery_info["productSpecif"].dbColumnType="TEXT";
ec_MESBasic_product_product_productPart_quickquery_info["productSpecif"].layRec="productSpecif";
ec_MESBasic_product_product_productPart_quickquery_info["productSpecif"].columnName="PRODUCT_SPECIF";
ec_MESBasic_product_product_productPart_quickquery_info["productModel"]={};
ec_MESBasic_product_product_productPart_quickquery_info["productModel"].dbColumnType="TEXT";
ec_MESBasic_product_product_productPart_quickquery_info["productModel"].layRec="productModel";
ec_MESBasic_product_product_productPart_quickquery_info["productModel"].columnName="PRODUCT_MODEL";
generateChainCond=function(cond,layarr,field){
	if(layarr.length>1){
		var subconds=cond.subconds;
		for(var i=0;i<subconds.length;i++){
			if(subconds[i].type=="2"&&subconds[i].joinInfo==layarr[0]){
				generateChainCond(subconds[i],layarr.slice(1),field);
				return;
			}
		}
		var chain={};
		chain.type="2";
		chain.joinInfo=layarr[0];
		chain.subconds=[];
		cond.subconds.push(chain);
		generateChainCond(chain,layarr.slice(1),field);
	}else{
		cond.subconds.push(field)
	}
}
</script>
<script>
 $(function(){
 	var advRemainDialog = $('[id="MESBasic.product.product.productPart.advquery"]');
 	advRemainDialog.length>1 && advRemainDialog.eq(0).remove();
 });
</script>
<style>
	.customQuery_down {
		background: url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat;
	}
	.customQuery_up {
		background: url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat;
	}
	.customQuery_preview_result_down {
		background: url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat;
	}
	.customQuery_preview_result_up {
		background: url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat;
	}
</style>
<div style="position:relative;z-index:10;display:none;" id="MESBasic.product.product.productPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_product_productPart_adv_queryForm" exportUrl="/MESBasic/product/product/productPart-query.action">
							<#assign productName_defaultValue  = ''>
									<#assign productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="TEXT" defaultValue=productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="productName" columnname="PRODUCT_NAME" columntype="TEXT" name="productName" fieldType="TEXTFIELD" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<#if (productName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_adv_queryForm"  isPrecise=true value="${productName_defaultValue!}" deValue="${productName_defaultValue!}"   conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productName')" name="productName" id="adv_ec_MESBasic_product_product_productPart_queryForm_productName" displayFieldName="productName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_product_productPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productName')" name="productName" id="adv_ec_MESBasic_product_product_productPart_queryForm_productName" displayFieldName="productName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_product_productPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productCode_defaultValue  = ''>
									<#assign productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="TEXT" defaultValue=productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productCode" fieldType="TEXTFIELD" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<#if (productCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_adv_queryForm"  isPrecise=true value="${productCode_defaultValue!}" deValue="${productCode_defaultValue!}"   conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productCode')" name="productCode" id="adv_ec_MESBasic_product_product_productPart_queryForm_productCode" displayFieldName="productCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_product_productPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_product_product_productPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productCode')" name="productCode" id="adv_ec_MESBasic_product_product_productPart_queryForm_productCode" displayFieldName="productCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_product_productPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productListID_prodListName_defaultValue  = ''>
									<#assign productListID_prodListName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_prodList_BaseProdList_prodListName" showFormat="SELECTCOMP" defaultValue=productListID_prodListName_defaultValue  divCode="MESBasic_1_prodList_BaseProdList_prodListName_productListID_prodListName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_prodList_BaseProdList" layRec="S2BASE_PRODLIST,PRODLIST_ID,S2BASE_PRODUCT,PRODUCT_PRODLISTID-prodListName" columnname="PRODLIST_NAME" columntype="TEXT" name="productListID.prodListName" fieldType="SELECTCOMP" tableName="S2BASE_PRODLIST"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										目录名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_prodList_BaseProdList" />
										<input type="hidden" id="adv_productListID.id" name="productListID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_productListID.id"  isPrecise=true deValue="${productListID_prodListName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450081171634')}"  conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productListID_prodListName')" name="productListID.prodListName" id="adv_ec_MESBasic_product_product_productPart_queryForm_productListID_prodListName" displayFieldName="prodListName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/prodList/baseProdList/refProdList.action"   refViewCode="MESBasic_1_prodList_refProdList"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_product_product_productPart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign modifyPerson_name_defaultValue  = ''>
									<#assign modifyPerson_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=modifyPerson_name_defaultValue  divCode="base_staff_name_modifyPerson_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,S2BASE_PRODUCT,PRODUCT_MODIFYPERSON-name" columnname="NAME" columntype="TEXT" name="modifyPerson.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										最近维护人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_modifyPerson.id" name="modifyPerson.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_modifyPerson.id"  isPrecise=true deValue="${modifyPerson_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="MESBasic.product.product.productPart._querycustomFunc('modifyPerson_name')" name="modifyPerson.name" id="adv_ec_MESBasic_product_product_productPart_queryForm_modifyPerson_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_product_product_productPart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productModel_defaultValue  = ''>
									<#assign productModel_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_productModel" showFormat="TEXT" defaultValue=productModel_defaultValue  divCode="MESBasic_1_product_Product_productModel_productModel" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="productModel" columnname="PRODUCT_MODEL" columntype="TEXT" name="productModel" fieldType="TEXTFIELD" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										型号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productModel" id="adv_productModel" value="${productModel_defaultValue!}" deValue="${productModel_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productSpecif_defaultValue  = ''>
									<#assign productSpecif_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_productSpecif" showFormat="TEXT" defaultValue=productSpecif_defaultValue  divCode="MESBasic_1_product_Product_productSpecif_productSpecif" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="productSpecif" columnname="PRODUCT_SPECIF" columntype="TEXT" name="productSpecif" fieldType="TEXTFIELD" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										规格
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productSpecif" id="adv_productSpecif" value="${productSpecif_defaultValue!}" deValue="${productSpecif_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign createDate_defaultValue  = 'today'>
									<#assign createDate_defaultValue  = 'today'>
								<#if (createDate_defaultValue)?? &&(createDate_defaultValue)?has_content>
									<#assign createDate_defaultValue  = getDefaultDateTime(createDate_defaultValue!)?date>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_createDate" showFormat="YMD" defaultValue=createDate_defaultValue  divCode="MESBasic_1_product_Product_createDate_createDate" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="createDate" columnname="PRODUCT_CREATETIMENEW" columntype="DATE" name="createDate" fieldType="DATE" showFormat="YMD" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										建档日期
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${createDate_defaultValue!}" deValue="${createDate_defaultValue!}"  name="createDate_start" id="adv_createDate_start" exp="gequal"    formid="ec_MESBasic_product_product_productPart_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${createDate_defaultValue!}" deValue="${createDate_defaultValue!}"  name="createDate_end" id="adv_createDate_end" exp="lequal"    formid="ec_MESBasic_product_product_productPart_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productBaseUnit_name_defaultValue  = ''>
									<#assign productBaseUnit_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_name" showFormat="SELECTCOMP" defaultValue=productBaseUnit_name_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_name_productBaseUnit_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_unitGroup_BaseUnit" layRec="S2BASE_UNIT,UNIT_ID,S2BASE_PRODUCT,PRODUCT_BASEUNIT-name" columnname="UNIT_NAME" columntype="TEXT" name="productBaseUnit.name" fieldType="SELECTCOMP" tableName="S2BASE_UNIT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单位名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_unitGroup_BaseUnit" />
										<input type="hidden" id="adv_productBaseUnit.id" name="productBaseUnit.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_productBaseUnit.id"  isPrecise=true deValue="${productBaseUnit_name_defaultValue!}" reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  conditionfunc="MESBasic.product.product.productPart._querycustomFunc('productBaseUnit_name')" name="productBaseUnit.name" id="adv_ec_MESBasic_product_product_productPart_queryForm_productBaseUnit_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/X6Basic/unitGroup/baseUnit/unitRef.action"   refViewCode="X6Basic_1.0_unitGroup_unitRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_product_product_productPart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productBePropCheck_defaultValue  = ''>
									<#assign productBePropCheck_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_productBePropCheck" showFormat="SELECT" defaultValue=productBePropCheck_defaultValue  divCode="MESBasic_1_product_Product_productBePropCheck_productBePropCheck" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="productBePropCheck" columnname="PRODUCT_BEPROPCHECK" columntype="BOOLEAN" name="productBePropCheck" fieldType="SELECT" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										是否质检
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${productBePropCheck_defaultValue!}" name="productBePropCheck" id="adv_productBePropCheck" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (productBePropCheck_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (productBePropCheck_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign abcClass_defaultValue  = ''>
									<#assign abcClass_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_abcClass" showFormat="SELECTCOMP" defaultValue=abcClass_defaultValue  divCode="MESBasic_1_product_Product_abcClass_abcClass" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="abcClass" columnname="PRODUCT_BAPABC" columntype="SYSTEMCODE" name="abcClass" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										ABC分类
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${abcClass_defaultValue}"   name="abcClass" code="ABC_CLASS" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign keepDay_defaultValue  = ''>
									<#assign keepDay_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_keepDay" showFormat="TEXT" defaultValue=keepDay_defaultValue  divCode="MESBasic_1_product_Product_keepDay_keepDay" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="keepDay" columnname="PRODUCT_KEEPDAY" columntype="INTEGER" name="keepDay" fieldType="TEXTFIELD" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										保质期
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="keepDay_start" id="adv_keepDay_start" value="${keepDay_defaultValue!}" deValue="${keepDay_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="keepDay_end" id="adv_keepDay_end" value="${keepDay_defaultValue!}" deValue="${keepDay_defaultValue!}"   exp="equal"  />
									  		</div></div>
									  		</div>
								  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign batch_defaultValue  = ''>
									<#assign batch_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_product_productPart_adv_queryForm" code="MESBasic_1_product_Product_batch" showFormat="SELECTCOMP" defaultValue=batch_defaultValue  divCode="MESBasic_1_product_Product_batch_batch" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="batch" columnname="BATCH" columntype="SYSTEMCODE" name="batch" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										批次启用
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${batch_defaultValue}"   name="batch" code="batch" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							
					   
	</form>
	</div>
	<div class="view-custom" style="border-top: 1px solid #E1E1E1;height:25px;">
	<div class="view-custom-div" style="float:left;margin-top:5px;cursor: pointer;" onclick="changeCustomQuery();"><span class="view-custom-span" style="margin-left:5px;font-weight:bold;color:#0f78bc;">${getText('foundation.common.custom')}</span></div>
		<div class="move-grade" style="display:none;float:left;margin-top:5px;">
			<span class="custombtn downgrade" onclick="ec.advQuery.query._upgrade()"> ${getText('foundation.common.upgrade')}</span>
			<span class="custombtn upgrade" onclick="ec.advQuery.query._downgrade()">${getText('foundation.common.downgrade')}</span>
			<span class="custombtn upmove" onclick="ec.advQuery.query._moveUp()">${getText('foundation.common.up')}</span>
			<span class="custombtn downmove" onclick="ec.advQuery.query._moveDown()">${getText('foundation.common.down')}</span>
		</div>			
		<div style="float:right;margin-top:5px;"><span class="customQuery" onclick="changeCustomQuery();"></span></div>
	</div>
	<div style=""><table id="advQueryLoading" style="width:100%;height:240px;text-align:center;"><tr><td><label class="advQuery-loading">${getText('foundation.common.data.waiting')}</label></td></tr></table></div>
	<div style="clear:both;display:none;" id="customquContent" class="customqu-content">		
	</div>	
</div>
<script type="text/javascript" language="javascript">
CUI.ns("ec.view.newAdvQuery");
ec.view.newAdvQuery._initNewAdvQuery=function(values){
		ec.advQuery.query = new CUI.NewAdvQuery({
			elementId: 'advQueryContainer',
			env: 'runtime',
			viewCode: 'MESBasic_1_product_productPart',
			modelCode: 'MESBasic_1_product_Product',
			modelName: 'Product',
			formId: 'ec_MESBasic_product_product_productPart_queryForm',
			olddiv: 'MESBasic.product.product.productPart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.product.product.productPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_productPart'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.product.product.productPart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.product.product.productPart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.product.product.productPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_productPart'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.product.product.productPart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.product.product.productPart.advquery'] #advQueryLoading").hide();
		 }
	});
	ec.advQuery._renderOverFlag=true;
}
var showType = "down";
var onceOpen = false;		//标识自定义查询是否加载过，避免重复加载
var showType_result = "down";
//点击自定义查询按钮后，展示自定义 查询or隐藏自定义查询
function changeCustomQuery(){
	if(showType == "up"){
		$('[id="MESBasic.product.product.productPart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.product.product.productPart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.product.product.productPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.product.product.productPart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.product.product.productPart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.product.product.productPart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.product.product.productPart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.product.product.productPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.product.product.productPart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.product.product.productPart.advquery"] div.advConContent').css('height','130px');
		if(!onceOpen){
			customQuery();
			onceOpen = true;
		}
		showType = "up";
	}
}
//点击预览方案按钮后，展示预览方案or隐藏预览方案
function changeCustomQueryResult(){
	if(showType_result == "down"){
		$('div.customquery_column').css('display','none');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_up").addClass("customQuery_preview_result_down");
		$('div.customQuery_cond').css('display','block');
		ec.advQuery.query.getViewResult();
		showType_result = "up";
	}else{			
		$('div.customquery_column').css('display','block');
		$('div.customquery_column').css('height','240px');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_down").addClass("customQuery_preview_result_up");				
		$('div.customQuery_cond').css('display','none');
		showType_result = "down";
	}
}
function changeObject(obj){		
	if($(obj).parent().next().css('display')=='block'){
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -124px no-repeat');
		$(obj).parent().next().css('display','none');
	}else{
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -40px no-repeat');
		$(obj).parent().next().css('display','block');
	}			
}
</script> <#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
<#assign superChecked = false>
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
<#if (Parameters.multiSelect)??>
<#assign multiSelect = (Parameters.multiSelect)>
</#if>

<#assign datatable_firstLoad = false>
<#assign datatable_queryFunc = "MESBasic.product.product.productPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/product/productPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_product_product_productPart_query" renderOverEvent="ec_MESBasic_product_product_productPart_RenderOverEvent" pageInitMethod="ec_MESBasic_product_product_productPart_PageInitMethod" modelCode="MESBasic_1_product_Product" noPermissionKeys="productCode,productName,productListID.prodListName,productSpecif,productModel,createTime,modifyTime" hidekeyPrefix="ec_MESBasic_product_product_productPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_product_productPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.product.product.productPart.dbmodifyproductPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','productListID.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.product.product.productPart.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_add_add_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003385645')}||iconcls:add||useInMore:false||onclick:
				MESBasic.product.product.productPart.addproductPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_product_productPart_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_add_add_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003385645')}||iconcls:add||useInMore:false||onclick:
				MESBasic.product.product.productPart.addproductPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_modify_modify_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003406493')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.product.product.productPart.modifyproductPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_product_productPart_BUTTON_modify"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_modify_modify_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003406493')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.product.product.productPart.modifyproductPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_delete_del_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003432013')}||iconcls:del||useInMore:false||onclick:
				MESBasic.product.product.productPart.delproductPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_product_productPart_BUTTON_delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_delete_del_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1476003432013')}||iconcls:del||useInMore:false||onclick:
				MESBasic.product.product.productPart.delproductPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_importProduct_import_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486798042344')}||iconcls:import||useInMore:false||onclick:
				MESBasic.product.product.productPart.importproductPart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.product.product.productPart.downloadTemplateproductPart()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_product_productPart_BUTTON_importProduct"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}productPart_importProduct_import_MESBasic_1_product_productPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486798042344')}||iconcls:import||useInMore:false||onclick:
				MESBasic.product.product.productPart.importproductPart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.product.product.productPart.downloadTemplateproductPart()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productCode_displayDefaultType!}"  key="productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productName_displayDefaultType!}"  key="productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=140   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productListID_prodListName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODLIST_NAME"    showFormat="TEXT" defaultDisplay="${productListID_prodListName_displayDefaultType!}"  key="productListID.prodListName"   label="${getText('MESBasic.propertydisplayName.randon1450078913966')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productSpecif_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_SPECIF"    showFormat="TEXT" defaultDisplay="${productSpecif_displayDefaultType!}"  key="productSpecif"   label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productModel_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_MODEL"    showFormat="TEXT" defaultDisplay="${productModel_displayDefaultType!}"  key="productModel"   label="${getText('MESBasic.propertydisplayName.radion1415772568665')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CREATETIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('ec.common.createTime')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign modifyTime_displayDefaultType  = ''>
			<@datacolumn columnName="MODIFYTIME"    showFormat="YMD_HMS" defaultDisplay="${modifyTime_displayDefaultType!}"  key="modifyTime"   label="${getText('ec.common.modifyTime')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("MESBasic_1_product_Product", "MESBasic_1_product_productPart", "LIST", "product")>
				<#-- 排布自定义字段 -->
				<#if customPropList?? && customPropList?has_content>
					<#list customPropList as c>
						<#assign cpWidth = 100>
						<#if c.property.type == 'DATETIME'>
							<#assign cpWidth = 130>
						</#if>
						<#if c.fieldType == 'TEXTAREA'>
							<#assign cpWidth = 200>
						</#if>
						<#assign cpOrder = true>
						<#assign cpMultable = false>
						<#if (c.property.type == 'SYSTEMCODE' && ((c.property.multable!false) || (c.property.seniorSystemCode!false))) || c.property.type == 'LONGTEXT'>
							<#assign cpOrder = false>
						</#if>
						<#if c.property.type == 'SYSTEMCODE' && (c.property.multable!false)>
							<#assign cpMultable = true>
						</#if>
						<#assign cpType = ''>
						<#if c.property.type == 'SYSTEMCODE'>
							<#if (c.property.seniorSystemCode!false)>
								<#assign cpType = 'textfield'>
							<#else>
								<#assign cpType = 'systemcode'>
							</#if>
						<#elseif c.property.type == 'TEXT' || c.property.type == 'OBJECT'>
							<#assign cpType = 'textfield'>
						<#else>
							<#assign cpType = c.property.type?lower_case>
						</#if>
						<#assign cpDecimal = ''>
						<#if c.property.type == 'DECIMAL'>
							<#assign cpDecimal = (c.property.decimalNum!0)>
							<#if c.precision??>
								<#assign cpDecimal =c.precision!>
							</#if>
						</#if>
						<#assign fsIndex = c.propertyLayRec?index_of(".")+1>
						<#assign keyname = c.propertyLayRec?substring(fsIndex)?trim>
						
						<#if c.align??>
							<#assign columnAlign = c.align >						
						<#elseif (c.property.type=='INTEGER' || c.property.type=='DECIMAL')>
							<#assign columnAlign = 'right'>
						<#elseif (c.property.type=='DATETIME') >					
							<#assign columnAlign = 'center'>
						<#else>
							<#assign columnAlign = 'left' >
						</#if>				
												
						<@datacolumn columnName=c.property.columnName width=cpWidth key=c.propertyLayRec showFormat=c.format order=cpOrder label="${getText('${c.displayName}')}" decimal="${cpDecimal}" multable=cpMultable type="${cpType}" textalign="${columnAlign}" />
					</#list>
				</#if>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_product_productPart_RenderOverEvent(){
}
function ec_MESBasic_product_product_productPart_PageInitMethod(){
}
	
	
	
	
	
	
	
	
</script>