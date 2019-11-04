	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489822754667')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" exportUrl="/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryCode" bak_value="factoryCode"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="manudeptId" bak_value="manudeptId"/>
		<input type="hidden" reset="false" name="WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_condition" id="WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489822962143')}_${getText('WOM.viewtitle.randon1495691448944')}.xls" />
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
		<div id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_producePlanRef_batchPlanOneRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_producePlanRef_batchPlanOneRef" formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" dataTableId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" isExpandAll=true formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" idprefix="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef" expandType="all"  fieldcodes="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_tableNo_dayPlanInfo_tableNo:ec.common.tableNo||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion141577264483343445||RM_7.5.0.0_formula_Formula_code_formularID_code:WOM.propertydisplayName.randon1488246312092445||MESBasic_1_factoryModel_FactoryModel_name_factoryCode_name:WOM.propertydisplayName.radion14192323937824455||WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_startTime_startTime:WOM.propertydisplayName.randon1489823646428||WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_endTime_endTime:WOM.propertydisplayName.randon1489823379542" > 
							<#assign dayPlanInfo_tableNo_defaultValue  = ''>
									<#assign dayPlanInfo_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" code="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_tableNo" showFormat="SELECTCOMP" defaultValue=dayPlanInfo_tableNo_defaultValue  divCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_tableNo_dayPlanInfo_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="dayPlanInfo.id" name="dayPlanInfo.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="dayPlanInfo.tableNo" id="dayPlanInfo.tableNo" value="${dayPlanInfo_tableNo_defaultValue!}" deValue="${dayPlanInfo_tableNo_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" searchClick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')"   />
							</@queryfield>
							<#assign formularID_code_defaultValue  = ''>
									<#assign formularID_code_defaultValue  = ''>
							<@queryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formularID_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formularID_code" isCustomize=true style="" > 
										<input type="hidden" id="formularID.id" name="formularID.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${formularID_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1488246963795')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('formularID_code')" name="formularID.code" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_formularID_code" displayFieldName="code" type="other" exp="equal" classStyle="cui-noborder-input" url="/RM/formula/formula/formulaRef.action"   refViewCode="RM_7.5.0.0_formula_formulaRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" searchClick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')"   />
							</@queryfield>
							<#assign factoryCode_name_defaultValue  = ''>
									<#assign factoryCode_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryCode_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryCode_name" isCustomize=true style="" > 
										<input type="hidden" id="factoryCode.id" name="factoryCode.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${factoryCode_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('factoryCode_name')" name="factoryCode.name" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_factoryCode_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" searchClick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')"   />
							</@queryfield>
							<#assign startTime_defaultValue  = ''>
									<#assign startTime_defaultValue  = ''>
								<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
									<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" code="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_startTime" showFormat="YMD_HM" defaultValue=startTime_defaultValue  divCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_startTime_startTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="startTime_start" id="startTime_start" exp="gequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="startTime_end" id="startTime_end" exp="lequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign endTime_defaultValue  = ''>
									<#assign endTime_defaultValue  = ''>
								<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
									<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" code="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_endTime" showFormat="YMD_HM" defaultValue=endTime_defaultValue  divCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_endTime_endTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="endTime_start" id="endTime_start" exp="gequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="endTime_end" id="endTime_end" exp="lequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" type="adv" onclick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')" onadvancedclick="advQuery('WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["MainTableName"]="PPM_DAY_PLAN_PARS";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"].dbColumnType="TEXT";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"].layRec="PPM_DAY_PLAN_INFOS,ID,PPM_DAY_PLAN_PARS,DAY_PLAN_INFO-tableNo";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"].columnName="TABLE_NO";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"].layRec="PPM_DAY_PLAN_INFOS,ID,PPM_DAY_PLAN_PARS,DAY_PLAN_INFO-tableNo";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"].columnName="ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,PPM_DAY_PLAN_PARS,PRODUCT_ID-productCode";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,PPM_DAY_PLAN_PARS,PRODUCT_ID-productCode";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"].dbColumnType="BAPCODE";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"].layRec="RM_FORMULAS,ID,PPM_DAY_PLAN_PARS,FORMULARID-code";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"].columnName="CODE";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"].layRec="RM_FORMULAS,ID,PPM_DAY_PLAN_PARS,FORMULARID-code";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"].columnName="ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"].dbColumnType="TEXT";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"].layRec="factory_tbcompanystructure,ID,PPM_DAY_PLAN_PARS,FACTORY_CODE-name";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"].columnName="NODENAME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"].layRec="factory_tbcompanystructure,ID,PPM_DAY_PLAN_PARS,FACTORY_CODE-name";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"].columnName="ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"].dbColumnType="DATETIME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"].layRec="startTime";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"].columnName="START_TIME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"].dbColumnType="DATETIME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"].layRec="endTime";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"].columnName="END_TIME";
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
 	var advRemainDialog = $('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" exportUrl="/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action">
							<#assign dayPlanInfo_tableNo_defaultValue  = ''>
									<#assign dayPlanInfo_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" code="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_tableNo" showFormat="SELECTCOMP" defaultValue=dayPlanInfo_tableNo_defaultValue  divCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo_tableNo_dayPlanInfo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" layRec="PPM_DAY_PLAN_INFOS,ID,PPM_DAY_PLAN_PARS,DAY_PLAN_INFO-tableNo" columnname="TABLE_NO" columntype="TEXT" name="dayPlanInfo.tableNo" fieldType="SELECTCOMP" tableName="PPM_DAY_PLAN_INFOS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo" />
										<input type="hidden" id="adv_dayPlanInfo.id" name="dayPlanInfo.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="dayPlanInfo.tableNo" id="adv_dayPlanInfo.tableNo" value="${dayPlanInfo_tableNo_defaultValue!}" deValue="${dayPlanInfo_tableNo_defaultValue!}"   exp="like" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,PPM_DAY_PLAN_PARS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										产品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="adv_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formularID_code_defaultValue  = ''>
									<#assign formularID_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formularID_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formularID_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="RM_FORMULAS,ID,PPM_DAY_PLAN_PARS,FORMULARID-code" columnname="CODE" columntype="BAPCODE" name="formularID.code" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配方
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<input type="hidden" id="adv_formularID.id" name="formularID.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_formularID.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${formularID_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1488246963795')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('formularID_code')" name="formularID.code" id="adv_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_formularID_code" displayFieldName="code" type="other" exp="equal"  classStyle="cui-noborder-input" url="/RM/formula/formula/formulaRef.action"   refViewCode="RM_7.5.0.0_formula_formulaRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign factoryCode_name_defaultValue  = ''>
									<#assign factoryCode_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryCode_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryCode_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,PPM_DAY_PLAN_PARS,FACTORY_CODE-name" columnname="NODENAME" columntype="TEXT" name="factoryCode.name" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产线
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_factoryCode.id" name="factoryCode.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_factoryCode.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${factoryCode_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('factoryCode_name')" name="factoryCode.name" id="adv_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_factoryCode_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign startTime_defaultValue  = ''>
									<#assign startTime_defaultValue  = ''>
								<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
									<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" code="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_startTime" showFormat="YMD_HM" defaultValue=startTime_defaultValue  divCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_startTime_startTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts" layRec="startTime" columnname="START_TIME" columntype="DATETIME" name="startTime" fieldType="DATETIME" showFormat="YMD_HM" tableName="PPM_DAY_PLAN_PARS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										计划开始时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_start" id="adv_startTime_start" exp="gequal"    formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_end" id="adv_startTime_end" exp="lequal"    formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign endTime_defaultValue  = ''>
									<#assign endTime_defaultValue  = ''>
								<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
									<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" code="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_endTime" showFormat="YMD_HM" defaultValue=endTime_defaultValue  divCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_endTime_endTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts" layRec="endTime" columnname="END_TIME" columntype="DATETIME" name="endTime" fieldType="DATETIME" showFormat="YMD_HM" tableName="PPM_DAY_PLAN_PARS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										计划结束时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_start" id="adv_endTime_start" exp="gequal"    formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_end" id="adv_endTime_end" exp="lequal"    formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_adv_queryForm" />
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
			viewCode: 'WOM_7.5.0.0_producePlanRef_batchPlanOneRef',
			modelCode: 'WOM_7.5.0.0_producePlanRef_DayBatchPlanParts',
			modelName: 'DayBatchPlanParts',
			formId: 'ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm',
			olddiv: 'WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_producePlanRef_batchPlanOneRef'+"&entity.code="+'WOM_7.5.0.0_producePlanRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_producePlanRef_batchPlanOneRef'+"&entity.code="+'WOM_7.5.0.0_producePlanRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query('query')">
<#assign datatable_dataUrl = "/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query('query')">
<#assign datatable_dataUrl = "/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query" renderOverEvent="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_RenderOverEvent" pageInitMethod="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_PageInitMethod" modelCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts" noPermissionKeys="dayPlanInfo.tableNo,productId.productCode,productId.productName,batchNum,quantity,formularID.code,formularID.name,factoryCode.name,startTime,endTime" hidekeyPrefix="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.sendBackbatchPlanOneRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','dayPlanInfo.id','productId.id','formularID.id','factoryCode.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.showErrorMsg"   >
				 <#if (!multiSelect??) || (multiSelect??&&(multiSelect)?default('false') == 'true')>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
				</#if>
			<#assign dayPlanInfo_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${dayPlanInfo_tableNo_displayDefaultType!}"  key="dayPlanInfo.tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=190   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1489823243312')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign quantity_displayDefaultType  = ''>
			<@datacolumn columnName="QUANTITY"    showFormat="TEXT" defaultDisplay="${quantity_displayDefaultType!}"  key="quantity"   label="${getText('WOM.propertydisplayName.randon1489823617233')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign formularID_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formularID_code_displayDefaultType!}"  key="formularID.code"   label="${getText('WOM.propertydisplayName.randon148824631209sss2')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formularID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${formularID_name_displayDefaultType!}"  key="formularID.name"   label="${getText('WOM.propertydisplayName.randon14870758237ee90')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign factoryCode_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryCode_name_displayDefaultType!}"  key="factoryCode.name"   label="${getText('WOM.propertydisplayName.radion1419232393782efe')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD_HM" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('WOM.propertydisplayName.randon1489823646428')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD_HM" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('WOM.propertydisplayName.randon1489823379542')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_RenderOverEvent(){
}
function ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
</script>