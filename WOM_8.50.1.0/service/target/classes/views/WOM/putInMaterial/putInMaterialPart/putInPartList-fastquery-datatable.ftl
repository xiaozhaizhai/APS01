	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490604762072')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" exportUrl="/WOM/putInMaterial/putInMaterialPart/putInPartList-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" bak_value="storeID"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490604876056')}_${getText('WOM.viewtitle.randon1490947979591')}.xls" />
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
		<div id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_putInMaterial_putInPartList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_putInMaterial_putInPartList" formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" dataTableId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" isExpandAll=true formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" idprefix="ec_WOM_putInMaterial_putInMaterialPart_putInPartList" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_headId_taskID_tableNo:WOM.common.tableNo1112||MESBasic_1_product_Product_productName_headId_taskID_productId_productName:WOM.propertydisplayName.radion141577264483343445||WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_headId_taskID_productBatchNum:WOM.propertydisplayName.randon1489668325364||MESBasic_1_product_Product_productName_productId_productName:WOM.propertydisplayName.radion1415772740737777||WOM_7.5.0.0_putInMaterial_PutInMaterialPart_batchNum_batchNum:WOM.propertydisplayName.randon1490605271044||base_staff_name_putinStaff_name:WOM.propertydisplayName.randon1492078276959||WOM_7.5.0.0_putInMaterial_PutInMaterialPart_putinDate_putinDate:WOM.propertydisplayName.randon1492078322274||WOM_7.5.0.0_putInMaterial_PutInMaterialPart_putinType_putinType:WOM.propertydisplayName.randon1491633306278" > 
							<#assign headId_taskID_tableNo_defaultValue  = ''>
									<#assign headId_taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=headId_taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_headId_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="headId.taskID.id" name="headId.taskID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${headId_taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('headId_taskID_tableNo')" name="headId.taskID.tableNo" id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_headId_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putInPartList.commonQuery('query')"   />
							</@queryfield>
							<#assign headId_taskID_productId_productName_defaultValue  = ''>
									<#assign headId_taskID_productId_productName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=headId_taskID_productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_headId_taskID_productId_productName" isCustomize=true style="" > 
										<input type="hidden" id="headId.taskID.productId.id" name="headId.taskID.productId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${headId_taskID_productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('headId_taskID_productId_productName')" name="headId.taskID.productId.productName" id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_headId_taskID_productId_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putInPartList.commonQuery('query')"   />
							</@queryfield>
							<#assign headId_taskID_productBatchNum_defaultValue  = ''>
									<#assign headId_taskID_productBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="SELECTCOMP" defaultValue=headId_taskID_productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_headId_taskID_productBatchNum" isCustomize=true style="" > 
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${headId_taskID_productBatchNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('headId_taskID_productBatchNum')" name="headId.taskID.productBatchNum" id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_headId_taskID_productBatchNum" displayFieldName="productBatchNum" type="other" exp="equal" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putInPartList.commonQuery('query')"   />
							</@queryfield>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('productId_productName')" name="productId.productName" id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putInPartList.commonQuery('query')"   />
							</@queryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_batchNum_batchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign putinStaff_name_defaultValue  = ''>
									<#assign putinStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=putinStaff_name_defaultValue  divCode="base_staff_name_putinStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="putinStaff.id" name="putinStaff.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${putinStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('putinStaff_name')" name="putinStaff.name" id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_putinStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putInPartList.commonQuery('query')"   />
							</@queryfield>
							<#assign putinDate_defaultValue  = ''>
									<#assign putinDate_defaultValue  = ''>
								<#if (putinDate_defaultValue)?? &&(putinDate_defaultValue)?has_content>
									<#assign putinDate_defaultValue  = getDefaultDateTime(putinDate_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_putinDate" showFormat="YMD_HMS" defaultValue=putinDate_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_putinDate_putinDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="putinDate_start" id="putinDate_start" exp="gequal"   formid="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="putinDate_end" id="putinDate_end" exp="lequal"   formid="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign putinType_defaultValue  = ''>
									<#assign putinType_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_putinType" showFormat="SELECTCOMP" defaultValue=putinType_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_putinType_putinType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${putinType_defaultValue}"   name="putinType" code="womPutinType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" type="adv" onclick="WOM.putInMaterial.putInMaterialPart.putInPartList.commonQuery('query')" onadvancedclick="advQuery('WOM.putInMaterial.putInMaterialPart.putInPartList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["MainTableName"]="WOM_PUT_IN_MATERIAL_PARTS";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.tableNo"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.tableNo"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.id"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.id"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.id"].columnName="ID";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.productName"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.productName"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.productName"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.productName"].columnName="PRODUCT_NAME";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.id"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.id"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productId.id"].columnName="PRODUCT_ID";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productBatchNum"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productBatchNum"].dbColumnType="BAPCODE";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productBatchNum"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-productBatchNum";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["headId.taskID.productBatchNum"].columnName="PRODUCT_BATCH_NUM";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["productId.productName"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["productId.productName"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["productId.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productName";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["productId.productName"].columnName="PRODUCT_NAME";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["batchNum"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["batchNum"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["batchNum"].layRec="batchNum";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["batchNum"].columnName="BATCH_NUM";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.name"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.name"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.name"].layRec="base_staff,ID,WOM_PUT_IN_MATERIAL_PARTS,PUTIN_STAFF-name";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.name"].columnName="NAME";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.id"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.id"].layRec="base_staff,ID,WOM_PUT_IN_MATERIAL_PARTS,PUTIN_STAFF-name";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinStaff.id"].columnName="ID";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinDate"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinDate"].dbColumnType="DATETIME";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinDate"].layRec="putinDate";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinDate"].columnName="PUTIN_DATE";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinType"]={};
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinType"].dbColumnType="SYSTEMCODE";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinType"].layRec="putinType";
ec_WOM_putInMaterial_putInMaterialPart_putInPartList_quickquery_info["putinType"].columnName="PUTIN_TYPE";
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
 	var advRemainDialog = $('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm" exportUrl="/WOM/putInMaterial/putInMaterialPart/putInPartList-query.action">
							<#assign headId_taskID_tableNo_defaultValue  = ''>
									<#assign headId_taskID_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=headId_taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_headId_taskID_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="headId.taskID.tableNo" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产指令
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<input type="hidden" id="adv_headId.taskID.id" name="headId.taskID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_headId.taskID.id"  isPrecise=true deValue="${headId_taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('headId_taskID_tableNo')" name="headId.taskID.tableNo" id="adv_ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_headId_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign headId_taskID_productId_productName_defaultValue  = ''>
									<#assign headId_taskID_productId_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=headId_taskID_productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_headId_taskID_productId_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="headId.taskID.productId.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										产品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_headId.taskID.productId.id" name="headId.taskID.productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_headId.taskID.productId.id"  isPrecise=true deValue="${headId_taskID_productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('headId_taskID_productId_productName')" name="headId.taskID.productId.productName" id="adv_ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_headId_taskID_productId_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign headId_taskID_productBatchNum_defaultValue  = ''>
									<#assign headId_taskID_productBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="SELECTCOMP" defaultValue=headId_taskID_productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_headId_taskID_productBatchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-productBatchNum" columnname="PRODUCT_BATCH_NUM" columntype="BAPCODE" name="headId.taskID.productBatchNum" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
												<@mneclient iframe=true mneenable=false advresume="adv_headId.taskID.id"  isPrecise=true deValue="${headId_taskID_productBatchNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('headId_taskID_productBatchNum')" name="headId.taskID.productBatchNum" id="adv_ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_headId_taskID_productBatchNum" displayFieldName="productBatchNum" type="other" exp="equal"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="productId.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id"  isPrecise=true deValue="${productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('productId_productName')" name="productId.productName" id="adv_ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart_batchNum_batchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart" layRec="batchNum" columnname="BATCH_NUM" columntype="TEXT" name="batchNum" fieldType="TEXTFIELD" tableName="WOM_PUT_IN_MATERIAL_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="adv_batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskID_factoryId_name_defaultValue  = ''>
									<#assign taskID_factoryId_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=taskID_factoryId_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_taskID_factoryId_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIAL_PARTS,TASKID-factory_tbcompanystructure,ID,WOM_PRODUCE_TASKS,FACTORY_ID-name" columnname="NODENAME" columntype="TEXT" name="taskID.factoryId.name" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产线
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_taskID.factoryId.id" name="taskID.factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_taskID.factoryId.id"  isPrecise=true deValue="${taskID_factoryId_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putInPartList._querycustomFunc('taskID_factoryId_name')" name="taskID.factoryId.name" id="adv_ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm_taskID_factoryId_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_putInMaterial_putInPartList',
			modelCode: 'WOM_7.5.0.0_putInMaterial_PutInMaterialPart',
			modelName: 'PutInMaterialPart',
			formId: 'ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm',
			olddiv: 'WOM.putInMaterial.putInMaterialPart.putInPartList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.putInMaterial.putInMaterialPart.putInPartList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterial_putInPartList'+"&entity.code="+'WOM_7.5.0.0_putInMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.putInMaterial.putInMaterialPart.putInPartList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.putInMaterial.putInMaterialPart.putInPartList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.putInMaterial.putInMaterialPart.putInPartList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterial_putInPartList'+"&entity.code="+'WOM_7.5.0.0_putInMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.putInMaterial.putInMaterialPart.putInPartList.advquery'] #customquContent").html(html);
			 $("[id='WOM.putInMaterial.putInMaterialPart.putInPartList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.putInMaterial.putInMaterialPart.putInPartList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterialPart.putInPartList.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterialPart/putInPartList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterialPart.putInPartList.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterialPart/putInPartList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_query" renderOverEvent="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_RenderOverEvent" pageInitMethod="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_PageInitMethod" modelCode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart" noPermissionKeys="headId.taskID.tableNo,headId.taskID.productId.productCode,headId.taskID.productId.productName,headId.taskID.productBatchNum,productId.productCode,productId.productName,batchNum,putinStaff.name,putinDate,putinEndDate,putinType,taskProcessId.name,factoryId.name,taskActiveId.name,useNum,lossNum,remark" hidekeyPrefix="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_putInMaterial_putInMaterialPart_putInPartList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.putInMaterial.putInMaterialPart.putInPartList.dbClickViewputInPartList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','tableInfoId','putinType.id','headId.taskID.id','headId.taskID.productId.id','productId.id','putinStaff.id','taskProcessId.id','factoryId.id','taskActiveId.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.putInMaterial.putInMaterialPart.putInPartList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign headId_taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${headId_taskID_tableNo_displayDefaultType!}"  key="headId.taskID.tableNo"   label="${getText('WOM.common.tableNo1112')}" textalign="left"  width=190   type="textfield"    click="function(cell){WOM.putInMaterial.putInMaterialPart.putInPartList.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','headId.taskID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign headId_taskID_productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${headId_taskID_productId_productCode_displayDefaultType!}"  key="headId.taskID.productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign headId_taskID_productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${headId_taskID_productId_productName_displayDefaultType!}"  key="headId.taskID.productId.productName"   label="${getText('WOM.propertydisplayName.radion14157727407373333445')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign headId_taskID_productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${headId_taskID_productBatchNum_displayDefaultType!}"  key="headId.taskID.productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448331')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1490605271044')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign putinStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${putinStaff_name_displayDefaultType!}"  key="putinStaff.name"   label="${getText('WOM.propertydisplayName.randon1492078276959')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign putinDate_displayDefaultType  = ''>
			<@datacolumn columnName="PUTIN_DATE"    showFormat="YMD_HMS" defaultDisplay="${putinDate_displayDefaultType!}"  key="putinDate"   label="${getText('WOM.propertydisplayName.randon1492078322275')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign putinEndDate_displayDefaultType  = ''>
			<@datacolumn columnName="PUTIN_END_DATE"    showFormat="YMD_HMS" defaultDisplay="${putinEndDate_displayDefaultType!}"  key="putinEndDate"   label="${getText('WOM.propertydisplayName.randon1492674267022')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign putinType_displayDefaultType  = ''>
			<@datacolumn columnName="PUTIN_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${putinType_displayDefaultType!}"  key="putinType.value"   label="${getText('WOM.propertydisplayName.randon1491633306278')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign taskProcessId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskProcessId_name_displayDefaultType!}"  key="taskProcessId.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.randon1489720709421')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskActiveId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskActiveId_name_displayDefaultType!}"  key="taskActiveId.name"   label="${getText('WOM.propertydisplayName.randon1490066495700')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign useNum_displayDefaultType  = ''>
			<@datacolumn columnName="USE_NUM"    showFormat="TEXT" defaultDisplay="${useNum_displayDefaultType!}"  key="useNum"   label="${getText('WOM.propertydisplayName.randon1490605292518')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign lossNum_displayDefaultType  = ''>
			<@datacolumn columnName="LOSS_NUM"    showFormat="TEXT" defaultDisplay="${lossNum_displayDefaultType!}"  key="lossNum"   label="${getText('WOM.propertydisplayName.randon1490605314992')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_putInMaterial_PutInMaterialPart", "WOM_7.5.0.0_putInMaterial_putInPartList", "LIST", "putInMaterialPart")>
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
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_putInMaterial_putInPartList", "LIST", "putInMaterialPart.taskID||WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIAL_PARTS,TASKID")>
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
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1490605337153')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_putInMaterial_putInMaterialPart_putInPartList_RenderOverEvent(){
}
function ec_WOM_putInMaterial_putInMaterialPart_putInPartList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>