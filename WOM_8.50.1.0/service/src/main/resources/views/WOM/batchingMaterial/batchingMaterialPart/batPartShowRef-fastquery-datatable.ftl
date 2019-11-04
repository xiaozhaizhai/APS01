	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1491789700218')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" exportUrl="/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action">
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="armStoreID" bak_value="armStoreID"/>
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" bak_value="storeID"/>
		<input type="hidden" reset="false" name="WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_condition" id="WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1491789803097')}_${getText('WOM.viewtitle.randon1492238232899')}.xls" />
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
		<div id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_batchingMaterial_batPartShowRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_batchingMaterial_batPartShowRef" formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" dataTableId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" isExpandAll=true formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" idprefix="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef" expandType="all"  fieldcodes="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo_headId_tableNo:WOM.menuName.randon1491793946236||WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.propertydisplayName.randon1490605002360||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.randon1491790565798||base_staff_name_exeStaff_name:WOM.propertydisplayName.randon1491790473893||base_staff_name_receiveStaff_name:WOM.propertydisplayName.randon1491790518494||WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate:WOM.propertydisplayName.randon1491790496670||WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate:WOM.propertydisplayName.randon1491790546754||WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state_state:WOM.propertydisplayName.randon1491790699395" > 
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=headId_tableNo_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo_headId_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="headId.id" name="headId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="headId.tableNo" id="headId.tableNo" value="${headId_tableNo_defaultValue!}" deValue="${headId_tableNo_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')"   />
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')"   />
							</@queryfield>
							<#assign exeStaff_name_defaultValue  = ''>
									<#assign exeStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=exeStaff_name_defaultValue  divCode="base_staff_name_exeStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="exeStaff.id" name="exeStaff.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${exeStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('exeStaff_name')" name="exeStaff.name" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_exeStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')"   />
							</@queryfield>
							<#assign receiveStaff_name_defaultValue  = ''>
									<#assign receiveStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=receiveStaff_name_defaultValue  divCode="base_staff_name_receiveStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="receiveStaff.id" name="receiveStaff.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${receiveStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('receiveStaff_name')" name="receiveStaff.name" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_receiveStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')"   />
							</@queryfield>
							<#assign exeDate_defaultValue  = ''>
									<#assign exeDate_defaultValue  = ''>
								<#if (exeDate_defaultValue)?? &&(exeDate_defaultValue)?has_content>
									<#assign exeDate_defaultValue  = getDefaultDateTime(exeDate_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate" showFormat="YMD_HMS" defaultValue=exeDate_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="exeDate_start" id="exeDate_start" exp="gequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="exeDate_end" id="exeDate_end" exp="lequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign receiveDate_defaultValue  = ''>
									<#assign receiveDate_defaultValue  = ''>
								<#if (receiveDate_defaultValue)?? &&(receiveDate_defaultValue)?has_content>
									<#assign receiveDate_defaultValue  = getDefaultDateTime(receiveDate_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_receiveDate" showFormat="YMD_HMS" defaultValue=receiveDate_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="receiveDate_start" id="receiveDate_start" exp="gequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="receiveDate_end" id="receiveDate_end" exp="lequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state" showFormat="SELECTCOMP" defaultValue=state_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state_state" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${state_defaultValue}"   name="state" code="womBatPartState" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" type="adv" onclick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" onadvancedclick="advQuery('WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["MainTableName"]="WOM_BATCHING_MATERIAL_PARTS";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"].layRec="WOM_BATCHING_MATERIALS,ID,WOM_BATCHING_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"].layRec="WOM_BATCHING_MATERIALS,ID,WOM_BATCHING_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_PARTS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_PARTS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,EXE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"].columnName="NAME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,EXE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,RECEIVE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"].columnName="NAME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,RECEIVE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"].dbColumnType="DATETIME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"].layRec="exeDate";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"].columnName="EXE_DATE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"].dbColumnType="DATETIME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"].layRec="receiveDate";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"].columnName="RECEIVE_DATE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"].layRec="state";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"].columnName="STATE";
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
 	var advRemainDialog = $('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" exportUrl="/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action">
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=headId_tableNo_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial_tableNo_headId_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" layRec="WOM_BATCHING_MATERIALS,ID,WOM_BATCHING_MATERIAL_PARTS,HEAD_ID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="headId.tableNo" fieldType="SELECTCOMP" tableName="WOM_BATCHING_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配料指令单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" />
										<input type="hidden" id="adv_headId.id" name="headId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="headId.tableNo" id="adv_headId.tableNo" value="${headId_tableNo_defaultValue!}" deValue="${headId_tableNo_defaultValue!}"   exp="like" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state" showFormat="SELECTCOMP" defaultValue=state_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state_state" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" layRec="state" columnname="STATE" columntype="SYSTEMCODE" name="state" fieldType="SELECTCOMP" tableName="WOM_BATCHING_MATERIAL_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${state_defaultValue}"   name="state" code="womBatPartState" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign exeStaff_name_defaultValue  = ''>
									<#assign exeStaff_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=exeStaff_name_defaultValue  divCode="base_staff_name_exeStaff_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,EXE_STAFF-name" columnname="NAME" columntype="TEXT" name="exeStaff.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配料操作人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_exeStaff.id" name="exeStaff.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_exeStaff.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${exeStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('exeStaff_name')" name="exeStaff.name" id="adv_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_exeStaff_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign receiveStaff_name_defaultValue  = ''>
									<#assign receiveStaff_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=receiveStaff_name_defaultValue  divCode="base_staff_name_receiveStaff_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,RECEIVE_STAFF-name" columnname="NAME" columntype="TEXT" name="receiveStaff.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配料接收人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_receiveStaff.id" name="receiveStaff.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_receiveStaff.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${receiveStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('receiveStaff_name')" name="receiveStaff.name" id="adv_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_receiveStaff_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign exeDate_defaultValue  = ''>
									<#assign exeDate_defaultValue  = ''>
								<#if (exeDate_defaultValue)?? &&(exeDate_defaultValue)?has_content>
									<#assign exeDate_defaultValue  = getDefaultDateTime(exeDate_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate" showFormat="YMD_HMS" defaultValue=exeDate_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" layRec="exeDate" columnname="EXE_DATE" columntype="DATETIME" name="exeDate" fieldType="DATETIME" showFormat="YMD_HMS" tableName="WOM_BATCHING_MATERIAL_PARTS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										配料时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${exeDate_defaultValue!}" deValue="${exeDate_defaultValue!}"  name="exeDate_start" id="adv_exeDate_start" exp="gequal"    formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${exeDate_defaultValue!}" deValue="${exeDate_defaultValue!}"  name="exeDate_end" id="adv_exeDate_end" exp="lequal"    formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign receiveDate_defaultValue  = ''>
									<#assign receiveDate_defaultValue  = ''>
								<#if (receiveDate_defaultValue)?? &&(receiveDate_defaultValue)?has_content>
									<#assign receiveDate_defaultValue  = getDefaultDateTime(receiveDate_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_receiveDate" showFormat="YMD_HMS" defaultValue=receiveDate_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" layRec="receiveDate" columnname="RECEIVE_DATE" columntype="DATETIME" name="receiveDate" fieldType="DATETIME" showFormat="YMD_HMS" tableName="WOM_BATCHING_MATERIAL_PARTS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										配料接收时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${receiveDate_defaultValue!}" deValue="${receiveDate_defaultValue!}"  name="receiveDate_start" id="adv_receiveDate_start" exp="gequal"    formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${receiveDate_defaultValue!}" deValue="${receiveDate_defaultValue!}"  name="receiveDate_end" id="adv_receiveDate_end" exp="lequal"    formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_adv_queryForm" />
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
			viewCode: 'WOM_7.5.0.0_batchingMaterial_batPartShowRef',
			modelCode: 'WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart',
			modelName: 'BatchingMaterialPart',
			formId: 'ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm',
			olddiv: 'WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterial_batPartShowRef'+"&entity.code="+'WOM_7.5.0.0_batchingMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterial_batPartShowRef'+"&entity.code="+'WOM_7.5.0.0_batchingMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query" renderOverEvent="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_RenderOverEvent" pageInitMethod="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_PageInitMethod" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" noPermissionKeys="headId.tableNo,taskID.tableNo,productId.productCode,productId.productName,batchNum,doneNum,wareID.wareCode,wareID.wareName,storeID.placeSetCode,storeID.placeSetName,offerSystem,exeStaff.name,exeDate,receiveStaff.name,receiveDate,state" hidekeyPrefix="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.sendBackbatPartShowRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','offerSystem.id','state.id','headId.id','taskID.id','productId.id','wareID.id','storeID.id','exeStaff.id','receiveStaff.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign headId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${headId_tableNo_displayDefaultType!}"  key="headId.tableNo"   label="${getText('WOM.menuName.randon1491793946236')}" textalign="left"  width=150   type="textfield"    click="function(cell){WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.showLinkView('/WOM/batchingMaterial/batchingMaterial/batMaterialView.action?${getPowerCode('','WOM_7.5.0.0_batchingMaterial_batMaterialView')}','headId.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.propertydisplayName.randon1490613814833')}" textalign="left"  width=150   type="textfield"    click="function(cell){WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1491790594009')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign doneNum_displayDefaultType  = ''>
			<@datacolumn columnName="DONE_NUM"    showFormat="TEXT" defaultDisplay="${doneNum_displayDefaultType!}"  key="doneNum"   label="${getText('WOM.propertydisplayName.randon1491790683313')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeID_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${storeID_placeSetCode_displayDefaultType!}"  key="storeID.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeID_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${storeID_placeSetName_displayDefaultType!}"  key="storeID.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign offerSystem_displayDefaultType  = ''>
			<@datacolumn columnName="OFFER_SYSTEM"    showFormat="SELECTCOMP" defaultDisplay="${offerSystem_displayDefaultType!}"  key="offerSystem.value"   label="${getText('WOM.propertydisplayName.randon1491978940082')}" textalign="left"  width=80   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign exeStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${exeStaff_name_displayDefaultType!}"  key="exeStaff.name"   label="${getText('WOM.propertydisplayName.randon1491790473893')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign exeDate_displayDefaultType  = ''>
			<@datacolumn columnName="EXE_DATE"    showFormat="YMD_HMS" defaultDisplay="${exeDate_displayDefaultType!}"  key="exeDate"   label="${getText('WOM.propertydisplayName.randon1491790496670')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign receiveStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${receiveStaff_name_displayDefaultType!}"  key="receiveStaff.name"   label="${getText('WOM.propertydisplayName.randon1491790518494')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign receiveDate_displayDefaultType  = ''>
			<@datacolumn columnName="RECEIVE_DATE"    showFormat="YMD_HMS" defaultDisplay="${receiveDate_displayDefaultType!}"  key="receiveDate"   label="${getText('WOM.propertydisplayName.randon1491790546754')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign state_displayDefaultType  = ''>
			<@datacolumn columnName="STATE"    showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('WOM.propertydisplayName.randon1491790699395')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batPartShowRef", "LIST", "batchingMaterialPart")>
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
function ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_RenderOverEvent(){
}
function ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>