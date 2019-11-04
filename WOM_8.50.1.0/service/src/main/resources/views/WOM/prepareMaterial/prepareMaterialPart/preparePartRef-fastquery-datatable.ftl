	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489976457717')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterialPart/preparePartRef-query.action">
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" bak_value="storeID"/>
		<input type="hidden" reset="false" name="WOM_prepareMaterial_prepareMaterialPart_preparePartRef_condition" id="WOM_prepareMaterial_prepareMaterialPart_preparePartRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489976792140')}_${getText('WOM.viewtitle.randon1566546200921')}.xls" />
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
		<div id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_prepareMaterial_preparePartRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_prepareMaterial_preparePartRef" formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" dataTableId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" isExpandAll=true formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" idprefix="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef" expandType="all"  fieldcodes="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_incode_formulaId_incode:WOM.propertydisplayName.randon1565059320966||WOM_7.5.0.0_prepareMaterial_PrepareMaterial_outCode_formulaId_outCode:WOM.propertydisplayName.randon1565059377008||WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_formulaId_tableNo:ec.common.tableNo||WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_formulaId_manulOrderMain_manulOrderNum:WOM.propertydisplayName.randon1563193157341||MESBasic_1_product_Product_productCode_productId_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<#assign formulaId_incode_defaultValue  = ''>
									<#assign formulaId_incode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_incode" showFormat="SELECTCOMP" defaultValue=formulaId_incode_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_incode_formulaId_incode" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.id" name="formulaId.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_incode_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1564661443506')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_incode')" name="formulaId.incode" id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_incode" displayFieldName="incode" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef.action"   refViewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.commonQuery('query')"   />
							</@queryfield>
							<#assign formulaId_outCode_defaultValue  = ''>
									<#assign formulaId_outCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_outCode" showFormat="SELECTCOMP" defaultValue=formulaId_outCode_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_outCode_formulaId_outCode" isCustomize=true style="" > 
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_outCode_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1564661443506')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_outCode')" name="formulaId.outCode" id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_outCode" displayFieldName="outCode" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef.action"   refViewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.commonQuery('query')"   />
							</@queryfield>
							<#assign formulaId_tableNo_defaultValue  = ''>
									<#assign formulaId_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=formulaId_tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_formulaId_tableNo" isCustomize=true style="" > 
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1566463106937')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_tableNo')" name="formulaId.tableNo" id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/prepareMaterial/prepareMaterial/prepareBackRef.action"   refViewCode="WOM_7.5.0.0_prepareMaterial_prepareBackRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.commonQuery('query')"   />
							</@queryfield>
							<#assign formulaId_manulOrderMain_manulOrderNum_defaultValue  = ''>
									<#assign formulaId_manulOrderMain_manulOrderNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="SELECTCOMP" defaultValue=formulaId_manulOrderMain_manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_formulaId_manulOrderMain_manulOrderNum" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.manulOrderMain.id" name="formulaId.manulOrderMain.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_manulOrderMain_manulOrderNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1563350015905')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_manulOrderMain_manulOrderNum')" name="formulaId.manulOrderMain.manulOrderNum" id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_manulOrderMain_manulOrderNum" displayFieldName="manulOrderNum" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action"   refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.commonQuery('query')"   />
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" searchClick="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" type="adv" onclick="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.commonQuery('query')" onadvancedclick="advQuery('WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["MainTableName"]="WOM_PREPARE_MATERIAL_PARTS";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.incode"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.incode"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.incode"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-incode";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.incode"].columnName="INCODE";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.id"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-incode";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.outCode"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.outCode"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.outCode"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-outCode";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.outCode"].columnName="OUT_CODE";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.tableNo"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.tableNo"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.tableNo"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-tableNo";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.tableNo"].columnName="TABLE_NO";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.manulOrderNum"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.manulOrderNum"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.manulOrderNum"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-WOM_MENUL_ORDER_MAIN,ID,WOM_PREPARE_MATERIALS,MANUL_ORDER_MAIN-manulOrderNum";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.manulOrderNum"].columnName="MANUL_ORDER_NUM";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.id"].layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-WOM_MENUL_ORDER_MAIN,ID,WOM_PREPARE_MATERIALS,MANUL_ORDER_MAIN-manulOrderNum";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["formulaId.manulOrderMain.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.productCode"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PREPARE_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.id"]={};
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PREPARE_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterialPart/preparePartRef-query.action">
							<#assign formulaId_outCode_defaultValue  = ''>
									<#assign formulaId_outCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_outCode" showFormat="SELECTCOMP" defaultValue=formulaId_outCode_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_outCode_formulaId_outCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-outCode" columnname="OUT_CODE" columntype="TEXT" name="formulaId.outCode" fieldType="SELECTCOMP" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										出库单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
										<input type="hidden" id="adv_formulaId.id" name="formulaId.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_formulaId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_outCode_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1564661443506')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_outCode')" name="formulaId.outCode" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_outCode" displayFieldName="outCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef.action"   refViewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formulaId_incode_defaultValue  = ''>
									<#assign formulaId_incode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_incode" showFormat="SELECTCOMP" defaultValue=formulaId_incode_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_incode_formulaId_incode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-incode" columnname="INCODE" columntype="TEXT" name="formulaId.incode" fieldType="SELECTCOMP" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										内部编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
												<@mneclient iframe=true mneenable=false advresume="adv_formulaId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_incode_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1564661443506')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_incode')" name="formulaId.incode" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_incode" displayFieldName="incode" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef.action"   refViewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formulaId_tableNo_defaultValue  = ''>
									<#assign formulaId_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=formulaId_tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_formulaId_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="formulaId.tableNo" fieldType="SELECTCOMP" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
												<@mneclient iframe=true mneenable=false advresume="adv_formulaId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1564661443506')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_tableNo')" name="formulaId.tableNo" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_tableNo" displayFieldName="tableNo" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef.action"   refViewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formulaId_manulOrderMain_manulOrderNum_defaultValue  = ''>
									<#assign formulaId_manulOrderMain_manulOrderNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="SELECTCOMP" defaultValue=formulaId_manulOrderMain_manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_formulaId_manulOrderMain_manulOrderNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="WOM_PREPARE_MATERIALS,ID,WOM_PREPARE_MATERIAL_PARTS,FORMULA_ID-WOM_MENUL_ORDER_MAIN,ID,WOM_PREPARE_MATERIALS,MANUL_ORDER_MAIN-manulOrderNum" columnname="MANUL_ORDER_NUM" columntype="TEXT" name="formulaId.manulOrderMain.manulOrderNum" fieldType="SELECTCOMP" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产订单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
										<input type="hidden" id="adv_formulaId.manulOrderMain.id" name="formulaId.manulOrderMain.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_formulaId.manulOrderMain.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_manulOrderMain_manulOrderNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1563350015905')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('formulaId_manulOrderMain_manulOrderNum')" name="formulaId.manulOrderMain.manulOrderNum" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_formulaId_manulOrderMain_manulOrderNum" displayFieldName="manulOrderNum" type="other" exp="equal"  classStyle="cui-noborder-input" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action"   refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PREPARE_MATERIAL_PARTS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.prepareMaterial.prepareMaterialPart.preparePartRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="adv_ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_prepareMaterial_preparePartRef',
			modelCode: 'WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart',
			modelName: 'PrepareMaterialPart',
			formId: 'ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm',
			olddiv: 'WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_preparePartRef'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_preparePartRef'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterialPart.preparePartRef.query('query')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterialPart/preparePartRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterialPart.preparePartRef.query('query')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterialPart/preparePartRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_query" renderOverEvent="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_RenderOverEvent" pageInitMethod="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_PageInitMethod" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart" noPermissionKeys="formulaId.tableNo,formulaId.manulOrderMain.manulOrderNum,productId.productName,productId.productCode,useNum,productId.productBaseUnit.name,hasDoneNum,batchNum,formulaId.incode,formulaId.outCode,rspos,rsnum,formulaId.backFlag" hidekeyPrefix="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.sendBackpreparePartRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','formulaId.id','formulaId.manulOrderMain.id','productId.id','productId.productBaseUnit.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.prepareMaterial.prepareMaterialPart.preparePartRef.showErrorMsg"   >
				 <#if (!multiSelect??) || (multiSelect??&&(multiSelect)?default('false') == 'true')>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
				</#if>
			<#assign formulaId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${formulaId_tableNo_displayDefaultType!}"  key="formulaId.tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_manulOrderMain_manulOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="MANUL_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${formulaId_manulOrderMain_manulOrderNum_displayDefaultType!}"  key="formulaId.manulOrderMain.manulOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193157341')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign useNum_displayDefaultType  = ''>
			<@datacolumn columnName="USE_NUM"    showFormat="TEXT" defaultDisplay="${useNum_displayDefaultType!}"  key="useNum"   label="${getText('WOM.propertyshowName.randon1568773663536.flag')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign productId_productBaseUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productBaseUnit_name_displayDefaultType!}"  key="productId.productBaseUnit.name"   label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign hasDoneNum_displayDefaultType  = ''>
			<@datacolumn columnName="HAS_DONE_NUM"    showFormat="TEXT" defaultDisplay="${hasDoneNum_displayDefaultType!}"  key="hasDoneNum"   label="${getText('WOM.propertyshowName.randon1568773562769.flag')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1489977087708')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_incode_displayDefaultType  = ''>
			<@datacolumn columnName="INCODE"    showFormat="TEXT" defaultDisplay="${formulaId_incode_displayDefaultType!}"  key="formulaId.incode"   label="${getText('WOM.propertydisplayName.randon1565059320966')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_outCode_displayDefaultType  = ''>
			<@datacolumn columnName="OUT_CODE"    showFormat="TEXT" defaultDisplay="${formulaId_outCode_displayDefaultType!}"  key="formulaId.outCode"   label="${getText('WOM.propertydisplayName.randon1565059377008')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rspos_displayDefaultType  = ''>
			<@datacolumn columnName="RSPOS"    showFormat="TEXT" defaultDisplay="${rspos_displayDefaultType!}"  key="rspos"   label="${getText('WOM.propertydisplayName.randon1563871077780')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rsnum_displayDefaultType  = ''>
			<@datacolumn columnName="RSNUM"    showFormat="TEXT" defaultDisplay="${rsnum_displayDefaultType!}"  key="rsnum"   label="${getText('WOM.propertydisplayName.randon1563871065994')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_backFlag_displayDefaultType  = ''>
			<@datacolumn columnName="BACK_FLAG"    showFormat="CHECKBOX" defaultDisplay="${formulaId_backFlag_displayDefaultType!}"  key="formulaId.backFlag"   label="${getText('WOM.propertydisplayName.randon1566464583222')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_RenderOverEvent(){
}
function ec_WOM_prepareMaterial_prepareMaterialPart_preparePartRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>