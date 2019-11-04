	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489976457717')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-query.action">
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" bak_value="storeID"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489976792140')}_${getText('WOM.viewtitle.randon1496907340768')}.xls" />
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
		<div id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_prepareMaterial_prepareDetailsList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_prepareMaterial_prepareDetailsList" formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" dataTableId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" isExpandAll=true formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" idprefix="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList" expandType="all"  fieldcodes="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_formulaId_tableNo:ec.common.tableNo||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion1415772644833222||MESBasic_1_wareMan_Ware_wareCode_formulaId_wareID_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_storeSet_StoreSet_placeSetCode_storeID_placeSetCode:MESBasic.propertydisplayName.randon1489731651449||base_staff_name_formulaId_applyStaff_name:WOM.dimissionStaff_xls.staffNamesqr||WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate_formulaId_applyDate:WOM.propertydisplayName.randon1492392059136" > 
							<#assign formulaId_tableNo_defaultValue  = ''>
									<#assign formulaId_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=formulaId_tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_formulaId_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.id" name="formulaId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="formulaId.tableNo" id="formulaId.tableNo" value="${formulaId_tableNo_defaultValue!}" deValue="${formulaId_tableNo_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.commonQuery('query')"   />
							</@queryfield>
							<#assign formulaId_wareID_wareCode_defaultValue  = ''>
									<#assign formulaId_wareID_wareCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=formulaId_wareID_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_formulaId_wareID_wareCode" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.wareID.id" name="formulaId.wareID.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${formulaId_wareID_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('formulaId_wareID_wareCode')" name="formulaId.wareID.wareCode" id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_formulaId_wareID_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.commonQuery('query')"   />
							</@queryfield>
							<#assign storeID_placeSetCode_defaultValue  = ''>
									<#assign storeID_placeSetCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetCode" showFormat="SELECTCOMP" defaultValue=storeID_placeSetCode_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetCode_storeID_placeSetCode" isCustomize=true style="" > 
										<input type="hidden" id="storeID.id" name="storeID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${storeID_placeSetCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('storeID_placeSetCode')" name="storeID.placeSetCode" id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_storeID_placeSetCode" displayFieldName="placeSetCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/storeSet/storeSet/storeRef.action"   refViewCode="MESBasic_1_storeSet_storeRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.commonQuery('query')"   />
							</@queryfield>
							<#assign formulaId_applyStaff_name_defaultValue  = ''>
									<#assign formulaId_applyStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=formulaId_applyStaff_name_defaultValue  divCode="base_staff_name_formulaId_applyStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.applyStaff.id" name="formulaId.applyStaff.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${formulaId_applyStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('formulaId_applyStaff_name')" name="formulaId.applyStaff.name" id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_formulaId_applyStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.commonQuery('query')"   />
							</@queryfield>
							<#assign formulaId_applyDate_defaultValue  = ''>
									<#assign formulaId_applyDate_defaultValue  = ''>
								<#if (formulaId_applyDate_defaultValue)?? &&(formulaId_applyDate_defaultValue)?has_content>
									<#assign formulaId_applyDate_defaultValue  = getDefaultDateTime(formulaId_applyDate_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate" showFormat="YMD_HMS" defaultValue=formulaId_applyDate_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate_formulaId_applyDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="formulaId.applyDate_start" id="formulaId.applyDate_start" exp="gequal"   formid="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="formulaId.applyDate_end" id="formulaId.applyDate_end" exp="lequal"   formid="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" type="adv" onclick="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.commonQuery('query')" onadvancedclick="advQuery('WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["MainTableName"]="WOM_PREPARE_MATERIAL_PARTS";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.tableNo"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.tableNo"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.tableNo"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-tableNo";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.tableNo"].columnName="TABLE_NO";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.id"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-tableNo";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.productCode"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PREPARE_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PREPARE_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.wareCode"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.wareCode"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.wareCode"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-MATERIAL_WARES,ID,WOM_PREPARE_MATERIALS,WAREID-wareCode";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.wareCode"].columnName="WARE_CODE";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.id"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-MATERIAL_WARES,ID,WOM_PREPARE_MATERIALS,WAREID-wareCode";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.wareID.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.placeSetCode"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.placeSetCode"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.placeSetCode"].layRec="MATERIAL_STORE_SETS,ID,WOM_PREPARE_MATERIAL_PARTS,STOREID-placeSetCode";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.placeSetCode"].columnName="PLACE_SET_CODE";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.id"].layRec="MATERIAL_STORE_SETS,ID,WOM_PREPARE_MATERIAL_PARTS,STOREID-placeSetCode";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["storeID.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.name"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.name"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.name"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-base_staff,ID,WOM_PREPARE_MATERIALS,APPLY_STAFF-name";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.name"].columnName="NAME";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.id"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-base_staff,ID,WOM_PREPARE_MATERIALS,APPLY_STAFF-name";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyStaff.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyDate"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyDate"].dbColumnType="DATETIME";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyDate"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-applyDate";
ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["formulaId.applyDate"].columnName="APPLY_DATE";
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
 	var advRemainDialog = $('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-query.action">
							<#assign formulaId_tableNo_defaultValue  = ''>
									<#assign formulaId_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=formulaId_tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_formulaId_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="formulaId.tableNo" fieldType="SELECTCOMP" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
										<input type="hidden" id="adv_formulaId.id" name="formulaId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="formulaId.tableNo" id="adv_formulaId.tableNo" value="${formulaId_tableNo_defaultValue!}" deValue="${formulaId_tableNo_defaultValue!}"   exp="like" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PREPARE_MATERIAL_PARTS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id"  isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('productId_productCode')" name="productId.productCode" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formulaId_wareID_wareCode_defaultValue  = ''>
									<#assign formulaId_wareID_wareCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=formulaId_wareID_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_formulaId_wareID_wareCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-MATERIAL_WARES,ID,WOM_PREPARE_MATERIALS,WAREID-wareCode" columnname="WARE_CODE" columntype="TEXT" name="formulaId.wareID.wareCode" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_formulaId.wareID.id" name="formulaId.wareID.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_formulaId.wareID.id"  isPrecise=true deValue="${formulaId_wareID_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('formulaId_wareID_wareCode')" name="formulaId.wareID.wareCode" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_formulaId_wareID_wareCode" displayFieldName="wareCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign storeID_placeSetCode_defaultValue  = ''>
									<#assign storeID_placeSetCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetCode" showFormat="SELECTCOMP" defaultValue=storeID_placeSetCode_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetCode_storeID_placeSetCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_storeSet_StoreSet" layRec="MATERIAL_STORE_SETS,ID,WOM_PREPARE_MATERIAL_PARTS,STOREID-placeSetCode" columnname="PLACE_SET_CODE" columntype="TEXT" name="storeID.placeSetCode" fieldType="SELECTCOMP" tableName="MATERIAL_STORE_SETS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										货位编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_storeSet_StoreSet" />
										<input type="hidden" id="adv_storeID.id" name="storeID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_storeID.id"  isPrecise=true deValue="${storeID_placeSetCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('storeID_placeSetCode')" name="storeID.placeSetCode" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_storeID_placeSetCode" displayFieldName="placeSetCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/storeSet/storeSet/storeRef.action"   refViewCode="MESBasic_1_storeSet_storeRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formulaId_applyStaff_name_defaultValue  = ''>
									<#assign formulaId_applyStaff_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=formulaId_applyStaff_name_defaultValue  divCode="base_staff_name_formulaId_applyStaff_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-base_staff,ID,WOM_PREPARE_MATERIALS,APPLY_STAFF-name" columnname="NAME" columntype="TEXT" name="formulaId.applyStaff.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										申请人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_formulaId.applyStaff.id" name="formulaId.applyStaff.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_formulaId.applyStaff.id"  isPrecise=true deValue="${formulaId_applyStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc('formulaId_applyStaff_name')" name="formulaId.applyStaff.name" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm_formulaId_applyStaff_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formulaId_applyDate_defaultValue  = ''>
									<#assign formulaId_applyDate_defaultValue  = ''>
								<#if (formulaId_applyDate_defaultValue)?? &&(formulaId_applyDate_defaultValue)?has_content>
									<#assign formulaId_applyDate_defaultValue  = getDefaultDateTime(formulaId_applyDate_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate" showFormat="YMD_HMS" defaultValue=formulaId_applyDate_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate_formulaId_applyDate" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-applyDate" columnname="APPLY_DATE" columntype="DATETIME" name="formulaId.applyDate" fieldType="DATETIME" showFormat="YMD_HMS" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										申请时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${formulaId_applyDate_defaultValue!}" deValue="${formulaId_applyDate_defaultValue!}"  name="formulaId.applyDate_start" id="adv_formulaId.applyDate_start" exp="gequal"    formid="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${formulaId_applyDate_defaultValue!}" deValue="${formulaId_applyDate_defaultValue!}"  name="formulaId.applyDate_end" id="adv_formulaId.applyDate_end" exp="lequal"    formid="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
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
			viewCode: 'WOM_7.5.0.0_prepareMaterial_prepareDetailsList',
			modelCode: 'WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart',
			modelName: 'PrepareMaterialPart',
			formId: 'ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm',
			olddiv: 'WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_prepareDetailsList'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_prepareDetailsList'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery'] #customquContent").html(html);
			 $("[id='WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.advquery"] div.advConContent').css('height','130px');
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

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('query')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('query')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query" renderOverEvent="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_RenderOverEvent" pageInitMethod="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_PageInitMethod" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart" noPermissionKeys="formulaId.tableNo,productId.productCode,productId.productName,formulaId.applyStaff.name,formulaId.applyDate,prepareNum,hasDoneNum,formulaId.wareID.wareCode,formulaId.wareID.wareName,storeID.wareId.cargoStatue,storeID.placeSetCode,storeID.placeSetName,remark" hidekeyPrefix="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.dbClickViewprepareDetailsList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','tableInfoId','storeID.wareId.cargoStatue.id','formulaId.id','productId.id','formulaId.applyStaff.id','formulaId.wareID.id','storeID.wareId.id','storeID.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}prepareDetailsList_toAppropriation_add_WOM_7.5.0.0_prepareMaterial_prepareDetailsList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1496919574296')}||iconcls:add||useInMore:false||onclick:
					toAppropriation()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_prepareMaterial_prepareDetailsList_BUTTON_toAppropriation"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}prepareDetailsList_toAppropriation_add_WOM_7.5.0.0_prepareMaterial_prepareDetailsList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1496919574296')}||iconcls:add||useInMore:false||onclick:
					toAppropriation()
		" 
		resultType="json"  />
			</#if>
				
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
				
			<#assign formulaId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${formulaId_tableNo_displayDefaultType!}"  key="formulaId.tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=200   type="textfield"    click="function(cell){WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.showLinkView('/WOM/prepareMaterial/prepareMaterial/prepareMaterialView.action?${getPowerCode('','WOM_7.5.0.0_prepareMaterial_prepareMaterialView')}','formulaId.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448331')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_applyStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${formulaId_applyStaff_name_displayDefaultType!}"  key="formulaId.applyStaff.name"   label="${getText('WOM.dimissionStaff_xls.staffNamesqr')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_applyDate_displayDefaultType  = ''>
			<@datacolumn columnName="APPLY_DATE"    showFormat="YMD_HMS" defaultDisplay="${formulaId_applyDate_displayDefaultType!}"  key="formulaId.applyDate"   label="${getText('WOM.propertydisplayName.randon1492392059136')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign prepareNum_displayDefaultType  = ''>
			<@datacolumn columnName="PREPARE_NUM"    showFormat="TEXT" defaultDisplay="${prepareNum_displayDefaultType!}"  key="prepareNum"   label="${getText('WOM.propertydisplayName.randon14899771198901112')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign hasDoneNum_displayDefaultType  = ''>
			<@datacolumn columnName="HAS_DONE_NUM"    showFormat="TEXT" defaultDisplay="${hasDoneNum_displayDefaultType!}"  key="hasDoneNum"   label="${getText('WOM.propertyshowName.randon1569031657847.flag')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${formulaId_wareID_wareCode_displayDefaultType!}"  key="formulaId.wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${formulaId_wareID_wareName_displayDefaultType!}"  key="formulaId.wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeID_wareId_cargoStatue_displayDefaultType  = ''>
			<@datacolumn columnName="CARGO_STATUE"    showFormat="SELECTCOMP" defaultDisplay="${storeID_wareId_cargoStatue_displayDefaultType!}"  key="storeID.wareId.cargoStatue.value"   label="${getText('MESBasic.propertydisplayName.randon1484031944240')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign storeID_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${storeID_placeSetCode_displayDefaultType!}"  key="storeID.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeID_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${storeID_placeSetName_displayDefaultType!}"  key="storeID.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart", "WOM_7.5.0.0_prepareMaterial_prepareDetailsList", "LIST", "prepareMaterialPart")>
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
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1489977145770')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_RenderOverEvent(){
}
function ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_PageInitMethod(){
$("[id='prepareDetailsList_toAppropriation_add_WOM_7.5.0.0_prepareMaterial_prepareDetailsList']").attr('class','buttonbar-button cui-btn-xtdbd');
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>