	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1563192160390')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" exportUrl="/WOM/manulOrder/manulOrderMain/orderMaterialRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factory" bak_value="factory"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="WOM_manulOrder_manulOrderMain_orderMaterialRef_condition" id="WOM_manulOrder_manulOrderMain_orderMaterialRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1563192841368')}_${getText('WOM.viewtitle.randon1564039926491')}.xls" />
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
		<div id="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_manulOrder_orderMaterialRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_manulOrder_orderMaterialRef" formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" dataTableId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" isExpandAll=true formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" idprefix="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef" expandType="all"  fieldcodes="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum_materialBatchNum:WOM.propertydisplayName.randon1563254620511||WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderNum_saleOrderNum:WOM.propertydisplayName.randon1563254709869||WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderProject_saleOrderProject:WOM.propertydisplayName.randon1563254806438||MESBasic_1_wareMan_Ware_wareCode_ware_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_product_Product_productCode_material_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<#assign materialBatchNum_defaultValue  = ''>
									<#assign materialBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum" showFormat="TEXT" defaultValue=materialBatchNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum_materialBatchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="materialBatchNum" id="materialBatchNum" value="${materialBatchNum_defaultValue!}" deValue="${materialBatchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign saleOrderNum_defaultValue  = ''>
									<#assign saleOrderNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderNum" showFormat="TEXT" defaultValue=saleOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderNum_saleOrderNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderNum" id="saleOrderNum" value="${saleOrderNum_defaultValue!}" deValue="${saleOrderNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign saleOrderProject_defaultValue  = ''>
									<#assign saleOrderProject_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderProject" showFormat="TEXT" defaultValue=saleOrderProject_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderProject_saleOrderProject" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderProject" id="saleOrderProject" value="${saleOrderProject_defaultValue!}" deValue="${saleOrderProject_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign ware_wareCode_defaultValue  = ''>
									<#assign ware_wareCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=ware_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_ware_wareCode" isCustomize=true style="" > 
										<input type="hidden" id="ware.id" name="ware.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${ware_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.manulOrder.manulOrderMain.orderMaterialRef._querycustomFunc('ware_wareCode')" name="ware.wareCode" id="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_ware_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" searchClick="WOM.manulOrder.manulOrderMain.orderMaterialRef.commonQuery('query')"   />
							</@queryfield>
							<#assign material_productCode_defaultValue  = ''>
									<#assign material_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=material_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_material_productCode" isCustomize=true style="" > 
										<input type="hidden" id="material.id" name="material.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${material_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.manulOrder.manulOrderMain.orderMaterialRef._querycustomFunc('material_productCode')" name="material.productCode" id="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_material_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" searchClick="WOM.manulOrder.manulOrderMain.orderMaterialRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" type="adv" onclick="WOM.manulOrder.manulOrderMain.orderMaterialRef.commonQuery('query')" onadvancedclick="advQuery('WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["MainTableName"]="WOM_MENUL_ORDER_MAIN";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["materialBatchNum"]={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["materialBatchNum"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["materialBatchNum"].layRec="materialBatchNum";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["materialBatchNum"].columnName="MATERIAL_BATCH_NUM";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderNum"]={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderNum"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderNum"].layRec="saleOrderNum";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderNum"].columnName="SALE_ORDER_NUM";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderProject"]={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderProject"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderProject"].layRec="saleOrderProject";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["saleOrderProject"].columnName="SALE_ORDER_PROJECT";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.wareCode"]={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.wareCode"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.wareCode"].layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MATERIAL,WARE-wareCode";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.wareCode"].columnName="WARE_CODE";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.id"]={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.id"].dbColumnType="LONG";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.id"].layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MATERIAL,WARE-wareCode";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["ware.id"].columnName="ID";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.productCode"]={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.productCode"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MATERIAL,MATERIAL-productCode";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.productCode"].columnName="PRODUCT_CODE";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.id"]={};
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.id"].dbColumnType="LONG";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MATERIAL,MATERIAL-productCode";
ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_quickquery_info["material.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" exportUrl="/WOM/manulOrder/manulOrderMain/orderMaterialRef-query.action">
							<#assign materialBatchNum_defaultValue  = ''>
									<#assign materialBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum" showFormat="TEXT" defaultValue=materialBatchNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum_materialBatchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" layRec="materialBatchNum" columnname="MATERIAL_BATCH_NUM" columntype="TEXT" name="materialBatchNum" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MATERIAL"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										原料批次
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="materialBatchNum" id="adv_materialBatchNum" value="${materialBatchNum_defaultValue!}" deValue="${materialBatchNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign ware_wareCode_defaultValue  = ''>
									<#assign ware_wareCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=ware_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_ware_wareCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MATERIAL,WARE-wareCode" columnname="WARE_CODE" columntype="TEXT" name="ware.wareCode" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_ware.id" name="ware.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_ware.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${ware_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.manulOrder.manulOrderMain.orderMaterialRef._querycustomFunc('ware_wareCode')" name="ware.wareCode" id="adv_ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_ware_wareCode" displayFieldName="wareCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign material_productCode_defaultValue  = ''>
									<#assign material_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=material_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_material_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MATERIAL,MATERIAL-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="material.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_material.id" name="material.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_material.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${material_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.manulOrder.manulOrderMain.orderMaterialRef._querycustomFunc('material_productCode')" name="material.productCode" id="adv_ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_material_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign unit_unitGroup_name_defaultValue  = ''>
									<#assign unit_unitGroup_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" code="X6Basic_1.0_unitGroup_UnitGroups_name" showFormat="SELECTCOMP" defaultValue=unit_unitGroup_name_defaultValue  divCode="X6Basic_1.0_unitGroup_UnitGroups_name_unit_unitGroup_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_unitGroup_UnitGroups" layRec="S2BASE_UNIT,UNIT_ID,WOM_MENUL_ORDER_MATERIAL,UNIT-S2BASE_UNITGROUP,UNITGROUP_ID,S2BASE_UNIT,UNIT_GROUPID-name" columnname="UNITGROUP_NAME" columntype="TEXT" name="unit.unitGroup.name" fieldType="SELECTCOMP" tableName="S2BASE_UNITGROUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单位组名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_unitGroup_UnitGroups" />
										<input type="hidden" id="adv_unit.unitGroup.id" name="unit.unitGroup.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_unit.unitGroup.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${unit_unitGroup_name_defaultValue!}" reftitle="${getText('X6Basic.viewtitle.radion1398236389691')}"  conditionfunc="WOM.manulOrder.manulOrderMain.orderMaterialRef._querycustomFunc('unit_unitGroup_name')" name="unit.unitGroup.name" id="adv_ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_unit_unitGroup_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/X6Basic/unitGroup/unitGroups/ref.action"   refViewCode="X6Basic_1.0_unitGroup_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign manulOrderId_manulOrderNum_defaultValue  = ''>
									<#assign manulOrderId_manulOrderNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="SELECTCOMP" defaultValue=manulOrderId_manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrderId_manulOrderNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="WOM_MENUL_ORDER_MAIN,ID,WOM_MENUL_ORDER_MATERIAL,MANUL_ORDER_ID-manulOrderNum" columnname="MANUL_ORDER_NUM" columntype="TEXT" name="manulOrderId.manulOrderNum" fieldType="SELECTCOMP" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产订单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
										<input type="hidden" id="adv_manulOrderId.id" name="manulOrderId.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_manulOrderId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${manulOrderId_manulOrderNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1563350015905')}"  conditionfunc="WOM.manulOrder.manulOrderMain.orderMaterialRef._querycustomFunc('manulOrderId_manulOrderNum')" name="manulOrderId.manulOrderNum" id="adv_ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm_manulOrderId_manulOrderNum" displayFieldName="manulOrderNum" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action"   refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign saleOrderNum_defaultValue  = ''>
									<#assign saleOrderNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderNum" showFormat="TEXT" defaultValue=saleOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderNum_saleOrderNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" layRec="saleOrderNum" columnname="SALE_ORDER_NUM" columntype="TEXT" name="saleOrderNum" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MATERIAL"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										销售订单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderNum" id="adv_saleOrderNum" value="${saleOrderNum_defaultValue!}" deValue="${saleOrderNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign saleOrderProject_defaultValue  = ''>
									<#assign saleOrderProject_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderProject" showFormat="TEXT" defaultValue=saleOrderProject_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_saleOrderProject_saleOrderProject" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" layRec="saleOrderProject" columnname="SALE_ORDER_PROJECT" columntype="TEXT" name="saleOrderProject" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MATERIAL"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										销售订单项目
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderProject" id="adv_saleOrderProject" value="${saleOrderProject_defaultValue!}" deValue="${saleOrderProject_defaultValue!}"   exp="like" />
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
			viewCode: 'WOM_7.5.0.0_manulOrder_orderMaterialRef',
			modelCode: 'WOM_7.5.0.0_manulOrder_ManulOrderMain',
			modelName: 'ManulOrderMain',
			formId: 'ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm',
			olddiv: 'WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_manulOrder_orderMaterialRef'+"&entity.code="+'WOM_7.5.0.0_manulOrder';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_manulOrder_orderMaterialRef'+"&entity.code="+'WOM_7.5.0.0_manulOrder';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.manulOrder.manulOrderMain.orderMaterialRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.manulOrder.manulOrderMain.orderMaterialRef.query('query')">
<#assign datatable_dataUrl = "/WOM/manulOrder/manulOrderMain/orderMaterialRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_query" renderOverEvent="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_RenderOverEvent" pageInitMethod="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_PageInitMethod" modelCode="WOM_7.5.0.0_manulOrder_ManulOrderMain" noPermissionKeys="manulOrderId.manulOrderNum,materialBatchNum,material.productCode,unit.unitGroup.name,needNumber,ware.wareCode,planStartTime,planEndTime,rsNUM,rsPOS" hidekeyPrefix="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.manulOrder.manulOrderMain.orderMaterialRef.sendBackorderMaterialRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','manulOrderId.id','material.id','unit.unitGroup.id','ware.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.manulOrder.manulOrderMain.orderMaterialRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign manulOrderId_manulOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="MANUL_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${manulOrderId_manulOrderNum_displayDefaultType!}"  key="manulOrderId.manulOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193157341')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign materialBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="MATERIAL_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${materialBatchNum_displayDefaultType!}"  key="materialBatchNum"   label="${getText('WOM.propertydisplayName.randon1563254620511')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign material_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${material_productCode_displayDefaultType!}"  key="material.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign unit_unitGroup_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNITGROUP_NAME"    showFormat="TEXT" defaultDisplay="${unit_unitGroup_name_displayDefaultType!}"  key="unit.unitGroup.name"   label="${getText('X6Basic.propertydisplayName.radion1398234617226')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign needNumber_displayDefaultType  = ''>
			<@datacolumn columnName="NEED_NUMBER"    showFormat="TEXT" defaultDisplay="${needNumber_displayDefaultType!}"  key="needNumber"   label="${getText('WOM.propertydisplayName.randon1563254572747')}" textalign="right" decimal="3" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign ware_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${ware_wareCode_displayDefaultType!}"  key="ware.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign planStartTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_START_TIME"    showFormat="YMD_HMS" defaultDisplay="${planStartTime_displayDefaultType!}"  key="planStartTime"   label="${getText('WOM.propertydisplayName.randon1563254655357')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign planEndTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_END_TIME"    showFormat="YMD_HMS" defaultDisplay="${planEndTime_displayDefaultType!}"  key="planEndTime"   label="${getText('WOM.propertydisplayName.randon1563254700758')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign rsNUM_displayDefaultType  = ''>
			<@datacolumn columnName="RSNUM"    showFormat="TEXT" defaultDisplay="${rsNUM_displayDefaultType!}"  key="rsNUM"   label="${getText('WOM.propertydisplayName.randon1563254148286')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rsPOS_displayDefaultType  = ''>
			<@datacolumn columnName="RSPOS"    showFormat="TEXT" defaultDisplay="${rsPOS_displayDefaultType!}"  key="rsPOS"   label="${getText('WOM.propertydisplayName.randon1563254342780')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_RenderOverEvent(){
}
function ec_WOM_manulOrder_manulOrderMain_orderMaterialRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
</script>