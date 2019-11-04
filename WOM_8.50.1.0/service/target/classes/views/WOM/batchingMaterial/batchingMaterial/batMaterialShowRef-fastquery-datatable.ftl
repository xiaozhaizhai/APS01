	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1491789700218')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" exportUrl="/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_condition" id="WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1491789782377')}_${getText('WOM.viewtitle.randon1492136203126')}.xls" />
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
		<div id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_batchingMaterial_batMaterialShowRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialShowRef" formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" dataTableId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" isExpandAll=true formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" idprefix="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef" expandType="all"  fieldcodes="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo_tableNo:ec.common.tableNo||WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.propertydisplayName.randon1490613814833||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion141577264483344556||base_staff_name_orderStaff_name:WOM.staff.dimissionStaff_xls.staffName335||WOM_7.5.0.0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime:WOM.propertydisplayName.randon1491789966310||WOM_7.5.0.0_batchingMaterial_BatchingMaterial_state_state:WOM.propertydisplayName.randon1491790319028" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')"   />
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')"   />
							</@queryfield>
							<#assign orderStaff_name_defaultValue  = ''>
									<#assign orderStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=orderStaff_name_defaultValue  divCode="base_staff_name_orderStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="orderStaff.id" name="orderStaff.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${orderStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('orderStaff_name')" name="orderStaff.name" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_orderStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')"   />
							</@queryfield>
							<#assign arriveTime_defaultValue  = ''>
									<#assign arriveTime_defaultValue  = ''>
								<#if (arriveTime_defaultValue)?? &&(arriveTime_defaultValue)?has_content>
									<#assign arriveTime_defaultValue  = getDefaultDateTime(arriveTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_arriveTime" showFormat="YMD_HMS" defaultValue=arriveTime_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="arriveTime_start" id="arriveTime_start" exp="gequal"   formid="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="arriveTime_end" id="arriveTime_end" exp="lequal"   formid="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_state" showFormat="SELECTCOMP" defaultValue=state_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_state_state" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${state_defaultValue}"   name="state" code="womBatOrderState" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" type="adv" onclick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')" onadvancedclick="advQuery('WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["MainTableName"]="WOM_BATCHING_MATERIALS";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIALS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIALS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIALS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIALS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"].layRec="base_staff,ID,WOM_BATCHING_MATERIALS,ORDER_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"].columnName="NAME";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"].layRec="base_staff,ID,WOM_BATCHING_MATERIALS,ORDER_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"].dbColumnType="DATETIME";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"].layRec="arriveTime";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"].columnName="ARRIVE_TIME";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"].layRec="state";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"].columnName="STATE";
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
 	var advRemainDialog = $('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" exportUrl="/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_BATCHING_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIALS,TASKID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="taskID.tableNo" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产指令单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<input type="hidden" id="adv_taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_taskID.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="adv_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIALS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="adv_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign orderStaff_name_defaultValue  = ''>
									<#assign orderStaff_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=orderStaff_name_defaultValue  divCode="base_staff_name_orderStaff_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,WOM_BATCHING_MATERIALS,ORDER_STAFF-name" columnname="NAME" columntype="TEXT" name="orderStaff.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配料指令创建人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_orderStaff.id" name="orderStaff.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_orderStaff.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${orderStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('orderStaff_name')" name="orderStaff.name" id="adv_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_orderStaff_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign arriveTime_defaultValue  = ''>
									<#assign arriveTime_defaultValue  = ''>
								<#if (arriveTime_defaultValue)?? &&(arriveTime_defaultValue)?has_content>
									<#assign arriveTime_defaultValue  = getDefaultDateTime(arriveTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_arriveTime" showFormat="YMD_HMS" defaultValue=arriveTime_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" layRec="arriveTime" columnname="ARRIVE_TIME" columntype="DATETIME" name="arriveTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="WOM_BATCHING_MATERIALS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										需送达时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${arriveTime_defaultValue!}" deValue="${arriveTime_defaultValue!}"  name="arriveTime_start" id="adv_arriveTime_start" exp="gequal"    formid="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${arriveTime_defaultValue!}" deValue="${arriveTime_defaultValue!}"  name="arriveTime_end" id="adv_arriveTime_end" exp="lequal"    formid="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_adv_queryForm" />
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
			viewCode: 'WOM_7.5.0.0_batchingMaterial_batMaterialShowRef',
			modelCode: 'WOM_7.5.0.0_batchingMaterial_BatchingMaterial',
			modelName: 'BatchingMaterial',
			formId: 'ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm',
			olddiv: 'WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterial_batMaterialShowRef'+"&entity.code="+'WOM_7.5.0.0_batchingMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterial_batMaterialShowRef'+"&entity.code="+'WOM_7.5.0.0_batchingMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query" renderOverEvent="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_RenderOverEvent" pageInitMethod="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_PageInitMethod" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" noPermissionKeys="tableNo,orderStaff.name,createTime,taskID.tableNo,productId.productCode,productId.productName,needPartId.offerSystem,needNum,doneNum,arriveTime,state,remark" hidekeyPrefix="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.sendBackbatMaterialShowRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','needPartId.offerSystem.id','state.id','orderStaff.id','taskID.id','productId.id','needPartId.id','tableNo','tableNo','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign orderStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${orderStaff_name_displayDefaultType!}"  key="orderStaff.name"   label="${getText('WOM.staff.dimissionStaff_xls.staffName334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('WOM.common.createTime324567')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.propertydisplayName.randon1490605002360')}" textalign="center"  width=150   type="textfield"    click="function(cell){WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion1415772644833222')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign needPartId_offerSystem_displayDefaultType  = ''>
			<@datacolumn columnName="OFFER_SYSTEM"    showFormat="SELECTCOMP" defaultDisplay="${needPartId_offerSystem_displayDefaultType!}"  key="needPartId.offerSystem.value"   label="${getText('WOM.propertydisplayName.randon1490614163532')}" textalign="left"  width=80   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign needNum_displayDefaultType  = ''>
			<@datacolumn columnName="NEED_NUM"    showFormat="TEXT" defaultDisplay="${needNum_displayDefaultType!}"  key="needNum"   label="${getText('WOM.propertydisplayName.randon14917899223367')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign doneNum_displayDefaultType  = ''>
			<@datacolumn columnName="DONE_NUM"    showFormat="TEXT" defaultDisplay="${doneNum_displayDefaultType!}"  key="doneNum"   label="${getText('WOM.propertydisplayName.randon1491789944047')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign arriveTime_displayDefaultType  = ''>
			<@datacolumn columnName="ARRIVE_TIME"    showFormat="YMD_HMS" defaultDisplay="${arriveTime_displayDefaultType!}"  key="arriveTime"   label="${getText('WOM.propertydisplayName.randon1491789966310')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign state_displayDefaultType  = ''>
			<@datacolumn columnName="STATE"    showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('WOM.propertydisplayName.randon1491790319028')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterial", "WOM_7.5.0.0_batchingMaterial_batMaterialShowRef", "LIST", "batchingMaterial")>
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
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1491790056696')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_RenderOverEvent(){
}
function ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>