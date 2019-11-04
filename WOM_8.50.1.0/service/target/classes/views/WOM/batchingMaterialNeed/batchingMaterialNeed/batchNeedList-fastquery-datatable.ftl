	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490613727875')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" exportUrl="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490613780787')}_${getText('WOM.viewtitle.randon1490614659540')}.xls" />
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
		<div id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_batchingMaterialNeed_batchNeedList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedList" formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" dataTableId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" isExpandAll=true formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" idprefix="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.menuInfoname.randon1489670907556||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion14157726448331||WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_offerSystem:WOM.propertydisplayName.randon1490614163532||WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_batchSite_batchSite:WOM.propertydisplayName.randon1497507426071||WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_state_state:WOM.propertydisplayName.randon1490614632524||WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_taskID_productBatchNum:WOM.propertydisplayName.randon1489668325364" > 
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" searchClick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.commonQuery('query')"   />
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" searchClick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.commonQuery('query')"   />
							</@queryfield>
							<#assign offerSystem_defaultValue  = ''>
									<#assign offerSystem_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" code="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem" showFormat="SELECTCOMP" defaultValue=offerSystem_defaultValue  divCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_offerSystem" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${offerSystem_defaultValue}"   name="offerSystem" code="RMsystem" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign batchSite_defaultValue  = ''>
									<#assign batchSite_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" code="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_batchSite" showFormat="SELECTCOMP" defaultValue=batchSite_defaultValue  divCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_batchSite_batchSite" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${batchSite_defaultValue}"   name="batchSite" code="batchSite" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign state_defaultValue  = 'womNeedState/01'>
							<@queryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" code="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_state" showFormat="SELECTCOMP" defaultValue=state_defaultValue  divCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_state_state" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${state_defaultValue}"   name="state" code="womNeedState" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign taskID_productBatchNum_defaultValue  = ''>
									<#assign taskID_productBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="SELECTCOMP" defaultValue=taskID_productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_taskID_productBatchNum" isCustomize=true style="" > 
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${taskID_productBatchNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1490145723075')}"  conditionfunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc('taskID_productBatchNum')" name="taskID.productBatchNum" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm_taskID_productBatchNum" displayFieldName="productBatchNum" type="other" exp="equal" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/maketaskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_maketaskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" searchClick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" type="adv" onclick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.commonQuery('query')" onadvancedclick="advQuery('WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["MainTableName"]="WOM_BATCHING_MATERIAL_NEEDS";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.tableNo"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_NEEDS,TASKID-tableNo";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.id"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_NEEDS,TASKID-tableNo";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.productCode"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_NEEDS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.id"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_NEEDS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["offerSystem"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["offerSystem"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["offerSystem"].layRec="offerSystem";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["offerSystem"].columnName="OFFER_SYSTEM";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["batchSite"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["batchSite"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["batchSite"].layRec="batchSite";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["batchSite"].columnName="BATCH_SITE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["state"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["state"].layRec="state";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["state"].columnName="STATE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.productBatchNum"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.productBatchNum"].dbColumnType="BAPCODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.productBatchNum"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_NEEDS,TASKID-productBatchNum";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["taskID.productBatchNum"].columnName="PRODUCT_BATCH_NUM";
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
 	var advRemainDialog = $('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_adv_queryForm" exportUrl="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-query.action">
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_NEEDS,TASKID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="taskID.tableNo" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										指令单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<input type="hidden" id="adv_taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_taskID.id"  isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="adv_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_NEEDS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id"  isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc('productId_productCode')" name="productId.productCode" id="adv_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign offerSystem_defaultValue  = ''>
									<#assign offerSystem_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_adv_queryForm" code="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem" showFormat="SELECTCOMP" defaultValue=offerSystem_defaultValue  divCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_offerSystem" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed" layRec="offerSystem" columnname="OFFER_SYSTEM" columntype="SYSTEMCODE" name="offerSystem" fieldType="SELECTCOMP" tableName="WOM_BATCHING_MATERIAL_NEEDS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配料系统
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${offerSystem_defaultValue}"   name="offerSystem" code="RMsystem" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_adv_queryForm" code="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_state" showFormat="SELECTCOMP" defaultValue=state_defaultValue  divCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_state_state" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed" layRec="state" columnname="STATE" columntype="SYSTEMCODE" name="state" fieldType="SELECTCOMP" tableName="WOM_BATCHING_MATERIAL_NEEDS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${state_defaultValue}"   name="state" code="womNeedState" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_batchingMaterialNeed_batchNeedList',
			modelCode: 'WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed',
			modelName: 'BatchingMaterialNeed',
			formId: 'ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm',
			olddiv: 'WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterialNeed_batchNeedList'+"&entity.code="+'WOM_7.5.0.0_batchingMaterialNeed';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterialNeed_batchNeedList'+"&entity.code="+'WOM_7.5.0.0_batchingMaterialNeed';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery'] #customquContent").html(html);
			 $("[id='WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query" renderOverEvent="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_RenderOverEvent" pageInitMethod="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_PageInitMethod" modelCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed" noPermissionKeys="taskID.tableNo,taskID.productBatchNum,productId.productCode,productId.productName,taskProcess.name,factoryId.name,taskActive.name,actOrder,offerOrder,batchSite,offerSystem,container,planNum,hasOrderNum,useNum,actualNum,state" hidekeyPrefix="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.dbClickViewbatchNeedList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','batchSite.id','offerSystem.id','state.id','taskID.id','productId.id','taskProcess.id','factoryId.id','taskActive.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}batchNeedList_makeOrder_add_WOM_7.5.0.0_batchingMaterialNeed_batchNeedList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1491795195240')}||iconcls:add||useInMore:false||onclick:
					makeBatcingOrder()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedList_BUTTON_makeOrder"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}batchNeedList_makeOrder_add_WOM_7.5.0.0_batchingMaterialNeed_batchNeedList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1491795195240')}||iconcls:add||useInMore:false||onclick:
					makeBatcingOrder()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}batchNeedList_setState_modify_WOM_7.5.0.0_batchingMaterialNeed_batchNeedList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion149179525680033')}||iconcls:modify||useInMore:false||onclick:
					updateNeedState()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedList_BUTTON_setState"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}batchNeedList_setState_modify_WOM_7.5.0.0_batchingMaterialNeed_batchNeedList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion149179525680033')}||iconcls:modify||useInMore:false||onclick:
					updateNeedState()
		" 
		resultType="json"  />
			</#if>
				
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
				
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.common.tableNo436457')}" textalign="center"  width=190   type="textfield"    click="function(cell){WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign taskID_productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${taskID_productBatchNum_displayDefaultType!}"  key="taskID.productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448331')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskProcess_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskProcess_name_displayDefaultType!}"  key="taskProcess.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.randon1490605067247')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskActive_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskActive_name_displayDefaultType!}"  key="taskActive.name"   label="${getText('WOM.propertydisplayName.randon1490683872072')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign actOrder_displayDefaultType  = ''>
			<@datacolumn columnName="ACT_ORDER"    showFormat="TEXT" defaultDisplay="${actOrder_displayDefaultType!}"  key="actOrder"   label="${getText('WOM.propertydisplayName.randon1498050691527')}" textalign="right"  width=50   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign offerOrder_displayDefaultType  = ''>
			<@datacolumn columnName="OFFER_ORDER"    showFormat="TEXT" defaultDisplay="${offerOrder_displayDefaultType!}"  key="offerOrder"   label="${getText('WOM.propertydisplayName.randon1490614138387')}" textalign="right"  width=50   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign batchSite_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_SITE"    showFormat="SELECTCOMP" defaultDisplay="${batchSite_displayDefaultType!}"  key="batchSite.value"   label="${getText('WOM.propertydisplayName.randon1497507426071')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign offerSystem_displayDefaultType  = ''>
			<@datacolumn columnName="OFFER_SYSTEM"    showFormat="SELECTCOMP" defaultDisplay="${offerSystem_displayDefaultType!}"  key="offerSystem.value"   label="${getText('WOM.propertydisplayName.randon1490614163532')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign container_displayDefaultType  = ''>
			<@datacolumn columnName="CONTAINER"    showFormat="TEXT" defaultDisplay="${container_displayDefaultType!}"  key="container"   label="${getText('WOM.propertydisplayName.randon1497507453613')}" textalign="left"  width=60   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign planNum_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_NUM"    showFormat="TEXT" defaultDisplay="${planNum_displayDefaultType!}"  key="planNum"   label="${getText('WOM.propertydisplayName.randon14906142534274345')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign hasOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="HAS_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${hasOrderNum_displayDefaultType!}"  key="hasOrderNum"   label="${getText('WOM.propertydisplayName.randon1490616453276')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="produceTask_showHasOrderNumFunc" cssstyle="" />
			<#assign useNum_displayDefaultType  = ''>
			<@datacolumn columnName="USE_NUM"    showFormat="TEXT" defaultDisplay="${useNum_displayDefaultType!}"  key="useNum"   label="${getText('WOM.propertydisplayName.randon1490614271670')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="produceTask_showUseNumFunc" cssstyle="" />
			<#assign actualNum_displayDefaultType  = ''>
			<@datacolumn columnName="ACTUAL_NUM"    showFormat="TEXT" defaultDisplay="${actualNum_displayDefaultType!}"  key="actualNum"   label="${getText('WOM.propertydisplayName.randon1546824986338')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign state_displayDefaultType  = ''>
			<@datacolumn columnName="STATE"    showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('WOM.propertydisplayName.randon1490614632524')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed", "WOM_7.5.0.0_batchingMaterialNeed_batchNeedList", "LIST", "batchingMaterialNeed")>
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
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_batchingMaterialNeed_batchNeedList", "LIST", "batchingMaterialNeed.taskID||WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_NEEDS,TASKID")>
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
function ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_RenderOverEvent(){
$("#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query_tbody tr").click(function(){
	if (ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[0].state.value == "已完成"){
		$("#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query .paginatorbar-operatebar").hide();
	}else{
		$("#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query .paginatorbar-operatebar").show();
	}
});
}
function ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_PageInitMethod(){
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.commonQuery('query')
$("[id='batchNeedList_setState_modify_WOM_7.5.0.0_batchingMaterialNeed_batchNeedList']").attr('class','buttonbar-button cui-btn-plwc');
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	function produceTask_showHasOrderNumFunc( value,  nRow ){
	if(value!=null && value!=""){
		var length = ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.init_aColumnDefs.length;
		for(var i = 0 ; i < length ; i++){
			if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.init_aColumnDefs[i].key=="hasOrderNum"){
				var decimal = ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.init_aColumnDefs[i].decimal;
				return "<a onclick='showHasOrderNum($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+parseFloat(value).toFixed(decimal)+"</span></a>";
			}
		}
	}
};
	function produceTask_showUseNumFunc( value,  nRow ){
	if(value!=null && value!=""){
		var length = ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.init_aColumnDefs.length;
		for(var i = 0 ; i < length ; i++){
			if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.init_aColumnDefs[i].key=="useNum"){
				var decimal = ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.init_aColumnDefs[i].decimal;
				return "<a onclick='showUseNum($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+parseFloat(value).toFixed(decimal)+"</span></a>";
			}
		}
	}
};
	
	
	
	
</script>