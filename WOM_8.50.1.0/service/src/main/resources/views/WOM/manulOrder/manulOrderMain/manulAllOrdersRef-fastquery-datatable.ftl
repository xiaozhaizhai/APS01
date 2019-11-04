	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1563192160390')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" exportUrl="/WOM/manulOrder/manulOrderMain/manulAllOrdersRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factory" bak_value="factory"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1563192841368')}_${getText('WOM.viewtitle.randon1566289755141')}.xls" />
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
		<div id="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_manulOrder_manulAllOrdersRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_manulOrder_manulAllOrdersRef" formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" dataTableId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" isExpandAll=true formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" idprefix="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef" expandType="all"  fieldcodes="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrderNum:WOM.propertydisplayName.randon1563193157341||WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum_saleOrderNum:WOM.propertydisplayName.randon1563193334953||WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject_saleOrderProject:WOM.propertydisplayName.randon1563193344677||WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep_orderTyep:WOM.propertydisplayName.randon1563193249848||MESBasic_1_product_Product_productCode_product_productCode:MESBasic.propertydisplayName.radion1415772644833||MESBasic_1_wareMan_Ware_wareAddress_ware_wareAddress:WOM.formPropertyshowName.randon1563350527029.flag" > 
							<#assign manulOrderNum_defaultValue  = ''>
									<#assign manulOrderNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="TEXT" defaultValue=manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrderNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="manulOrderNum" id="manulOrderNum" value="${manulOrderNum_defaultValue!}" deValue="${manulOrderNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign saleOrderNum_defaultValue  = ''>
									<#assign saleOrderNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum" showFormat="TEXT" defaultValue=saleOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum_saleOrderNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderNum" id="saleOrderNum" value="${saleOrderNum_defaultValue!}" deValue="${saleOrderNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign saleOrderProject_defaultValue  = ''>
									<#assign saleOrderProject_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject" showFormat="TEXT" defaultValue=saleOrderProject_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject_saleOrderProject" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderProject" id="saleOrderProject" value="${saleOrderProject_defaultValue!}" deValue="${saleOrderProject_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign orderTyep_defaultValue  = ''>
									<#assign orderTyep_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep" showFormat="TEXT" defaultValue=orderTyep_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep_orderTyep" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="orderTyep" id="orderTyep" value="${orderTyep_defaultValue!}" deValue="${orderTyep_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=product_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true style="" > 
										<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.manulOrder.manulOrderMain.manulAllOrdersRef._querycustomFunc('product_productCode')" name="product.productCode" id="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" searchClick="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.commonQuery('query')"   />
							</@queryfield>
							<#assign ware_wareAddress_defaultValue  = ''>
									<#assign ware_wareAddress_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" code="MESBasic_1_wareMan_Ware_wareAddress" showFormat="SELECTCOMP" defaultValue=ware_wareAddress_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareAddress_ware_wareAddress" isCustomize=true style="" > 
										<input type="hidden" id="ware.id" name="ware.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${ware_wareAddress_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.manulOrder.manulOrderMain.manulAllOrdersRef._querycustomFunc('ware_wareAddress')" name="ware.wareAddress" id="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm_ware_wareAddress" displayFieldName="wareAddress" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" searchClick="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" type="adv" onclick="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.commonQuery('query')" onadvancedclick="advQuery('WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["MainTableName"]="WOM_MENUL_ORDER_MAIN";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["manulOrderNum"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["manulOrderNum"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["manulOrderNum"].layRec="manulOrderNum";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["manulOrderNum"].columnName="MANUL_ORDER_NUM";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderNum"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderNum"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderNum"].layRec="saleOrderNum";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderNum"].columnName="SALE_ORDER_NUM";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderProject"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderProject"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderProject"].layRec="saleOrderProject";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["saleOrderProject"].columnName="SALE_ORDER_PROJECT";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["orderTyep"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["orderTyep"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["orderTyep"].layRec="orderTyep";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["orderTyep"].columnName="ORDER_TYEP";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.productCode"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.productCode"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MAIN,PRODUCT-productCode";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.productCode"].columnName="PRODUCT_CODE";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.id"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.id"].dbColumnType="LONG";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MAIN,PRODUCT-productCode";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["product.id"].columnName="PRODUCT_ID";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.wareAddress"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.wareAddress"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.wareAddress"].layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MAIN,WARE-wareAddress";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.wareAddress"].columnName="WARE_ADDRESS";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.id"]={};
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.id"].dbColumnType="LONG";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.id"].layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MAIN,WARE-wareAddress";
ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_quickquery_info["ware.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm" exportUrl="/WOM/manulOrder/manulOrderMain/manulAllOrdersRef-query.action">
							<#assign manulOrderNum_defaultValue  = ''>
									<#assign manulOrderNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="TEXT" defaultValue=manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrderNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="manulOrderNum" columnname="MANUL_ORDER_NUM" columntype="TEXT" name="manulOrderNum" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产订单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="manulOrderNum" id="adv_manulOrderNum" value="${manulOrderNum_defaultValue!}" deValue="${manulOrderNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign orderTyep_defaultValue  = ''>
									<#assign orderTyep_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep" showFormat="TEXT" defaultValue=orderTyep_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep_orderTyep" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="orderTyep" columnname="ORDER_TYEP" columntype="TEXT" name="orderTyep" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										订单类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="orderTyep" id="adv_orderTyep" value="${orderTyep_defaultValue!}" deValue="${orderTyep_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign saleOrderNum_defaultValue  = ''>
									<#assign saleOrderNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum" showFormat="TEXT" defaultValue=saleOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum_saleOrderNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="saleOrderNum" columnname="SALE_ORDER_NUM" columntype="TEXT" name="saleOrderNum" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										销售订单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderNum" id="adv_saleOrderNum" value="${saleOrderNum_defaultValue!}" deValue="${saleOrderNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign saleOrderProject_defaultValue  = ''>
									<#assign saleOrderProject_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject" showFormat="TEXT" defaultValue=saleOrderProject_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject_saleOrderProject" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="saleOrderProject" columnname="SALE_ORDER_PROJECT" columntype="TEXT" name="saleOrderProject" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										销售订单项目
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="saleOrderProject" id="adv_saleOrderProject" value="${saleOrderProject_defaultValue!}" deValue="${saleOrderProject_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign ware_wareAddress_defaultValue  = ''>
									<#assign ware_wareAddress_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareAddress" showFormat="SELECTCOMP" defaultValue=ware_wareAddress_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareAddress_ware_wareAddress" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MAIN,WARE-wareAddress" columnname="WARE_ADDRESS" columntype="TEXT" name="ware.wareAddress" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										库存地点
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_ware.id" name="ware.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_ware.id"  isPrecise=true deValue="${ware_wareAddress_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.manulOrder.manulOrderMain.manulAllOrdersRef._querycustomFunc('ware_wareAddress')" name="ware.wareAddress" id="adv_ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm_ware_wareAddress" displayFieldName="wareAddress" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=product_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MAIN,PRODUCT-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="product.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_product.id"  isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.manulOrder.manulOrderMain.manulAllOrdersRef._querycustomFunc('product_productCode')" name="product.productCode" id="adv_ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_manulOrder_manulAllOrdersRef',
			modelCode: 'WOM_7.5.0.0_manulOrder_ManulOrderMain',
			modelName: 'ManulOrderMain',
			formId: 'ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm',
			olddiv: 'WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_manulOrder_manulAllOrdersRef'+"&entity.code="+'WOM_7.5.0.0_manulOrder';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_manulOrder_manulAllOrdersRef'+"&entity.code="+'WOM_7.5.0.0_manulOrder';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.manulOrder.manulOrderMain.manulAllOrdersRef.query('query')">
<#assign datatable_dataUrl = "/WOM/manulOrder/manulOrderMain/manulAllOrdersRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_query" renderOverEvent="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_RenderOverEvent" pageInitMethod="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_PageInitMethod" modelCode="WOM_7.5.0.0_manulOrder_ManulOrderMain" noPermissionKeys="manulOrderNum,product.productCode,product.productName,ware.wareAddress,orderNumber,orderTyep,edition,unit.name,planStartTime,planEndTime,saleOrderNum,saleOrderProject,product.unitGroup.name,product.productSpecif,product.productModel" hidekeyPrefix="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.dbClickViewmanulAllOrdersRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','product.id','ware.id','unit.id','product.unitGroup.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.manulOrder.manulOrderMain.manulAllOrdersRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign manulOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="MANUL_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${manulOrderNum_displayDefaultType!}"  key="manulOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193157341')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ware_wareAddress_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_ADDRESS"    showFormat="TEXT" defaultDisplay="${ware_wareAddress_displayDefaultType!}"  key="ware.wareAddress"   label="${getText('WOM.propertyshowName.randon1563350400953.flag')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign orderNumber_displayDefaultType  = ''>
			<@datacolumn columnName="ORDER_NUMBER"    showFormat="TEXT" defaultDisplay="${orderNumber_displayDefaultType!}"  key="orderNumber"   label="${getText('WOM.propertydisplayName.randon1563254234602')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign orderTyep_displayDefaultType  = ''>
			<@datacolumn columnName="ORDER_TYEP"    showFormat="TEXT" defaultDisplay="${orderTyep_displayDefaultType!}"  key="orderTyep"   label="${getText('WOM.propertydisplayName.randon1563193249848')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign edition_displayDefaultType  = ''>
			<@datacolumn columnName="EDITION"    showFormat="TEXT" defaultDisplay="${edition_displayDefaultType!}"  key="edition"   label="${getText('WOM.propertydisplayName.randon1563193270725')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign unit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${unit_name_displayDefaultType!}"  key="unit.name"   label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign planStartTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_START_TIME"    showFormat="YMD_HMS" defaultDisplay="${planStartTime_displayDefaultType!}"  key="planStartTime"   label="${getText('WOM.propertydisplayName.randon1563193285800')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign planEndTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_END_TIME"    showFormat="YMD_HMS" defaultDisplay="${planEndTime_displayDefaultType!}"  key="planEndTime"   label="${getText('WOM.propertydisplayName.randon1563193313630')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign saleOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="SALE_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${saleOrderNum_displayDefaultType!}"  key="saleOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193334953')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign saleOrderProject_displayDefaultType  = ''>
			<@datacolumn columnName="SALE_ORDER_PROJECT"    showFormat="TEXT" defaultDisplay="${saleOrderProject_displayDefaultType!}"  key="saleOrderProject"   label="${getText('WOM.propertydisplayName.randon1563193344677')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_unitGroup_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNITGROUP_NAME"    showFormat="TEXT" defaultDisplay="${product_unitGroup_name_displayDefaultType!}"  key="product.unitGroup.name"  hiddenCol=true label="${getText('X6Basic.propertydisplayName.radion1398234617226')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productSpecif_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_SPECIF"    showFormat="TEXT" defaultDisplay="${product_productSpecif_displayDefaultType!}"  key="product.productSpecif"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productModel_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_MODEL"    showFormat="TEXT" defaultDisplay="${product_productModel_displayDefaultType!}"  key="product.productModel"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415772568665')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_RenderOverEvent(){
}
function ec_WOM_manulOrder_manulOrderMain_manulAllOrdersRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>