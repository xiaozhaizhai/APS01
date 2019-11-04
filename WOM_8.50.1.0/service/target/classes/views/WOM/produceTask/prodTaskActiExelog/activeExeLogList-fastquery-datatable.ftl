	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" exportUrl="/WOM/produceTask/prodTaskActiExelog/activeExeLogList-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryID" bak_value="factoryID"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1495778243721')}_${getText('WOM.viewtitle.randon1510101768348')}.xls" />
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
		<div id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_activeExeLogList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_activeExeLogList" formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" dataTableId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" isExpandAll=true formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" idprefix="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.propertydisplayName.randon1502699574565||WOM_7.5.0.0_produceTask_ProdTaskActiExelog_batchNum_batchNum:WOM.propertydisplayName.randon1495778519171||WOM_7.5.0.0_produceTask_ProduceTaskProcess_name_taskProcessID_name:WOM.propertydisplayName.randon1489720649125||WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeName_activeName:WOM.propertydisplayName.randon1509414632809||WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeType_activeType:WOM.propertydisplayName.randon1496885739673||WOM_7.5.0.0_produceTask_ProdTaskActiExelog_dataSource_dataSource:WOM.propertydisplayName.randon1495786231888||WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeSource_activeSource:WOM.propertydisplayName.randon1509676150205||publicSet_1.0_activeAndBatchState_ActBatState_name_activeBatchStateID_name:WOM.propertydisplayName.randon15094279554246" > 
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.produceTask.prodTaskActiExelog.activeExeLogList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" searchClick="WOM.produceTask.prodTaskActiExelog.activeExeLogList.commonQuery('query')"   />
							</@queryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_batchNum_batchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign taskProcessID_name_defaultValue  = ''>
									<#assign taskProcessID_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name" showFormat="SELECTCOMP" defaultValue=taskProcessID_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name_taskProcessID_name" isCustomize=true style="" > 
										<input type="hidden" id="taskProcessID.id" name="taskProcessID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${taskProcessID_name_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1490685207348')}"  conditionfunc="WOM.produceTask.prodTaskActiExelog.activeExeLogList._querycustomFunc('taskProcessID_name')" name="taskProcessID.name" id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm_taskProcessID_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTaskProcess/taskProcessRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskProcessRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" searchClick="WOM.produceTask.prodTaskActiExelog.activeExeLogList.commonQuery('query')"   />
							</@queryfield>
							<#assign activeName_defaultValue  = ''>
									<#assign activeName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeName" showFormat="TEXT" defaultValue=activeName_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeName_activeName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="activeName" id="activeName" value="${activeName_defaultValue!}" deValue="${activeName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign activeType_defaultValue  = ''>
									<#assign activeType_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeType" showFormat="SELECTCOMP" defaultValue=activeType_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeType_activeType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${activeType_defaultValue}"   name="activeType" code="activeType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign dataSource_defaultValue  = ''>
									<#assign dataSource_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_dataSource" showFormat="SELECTCOMP" defaultValue=dataSource_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_dataSource_dataSource" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${dataSource_defaultValue}"   name="dataSource" code="RMsystem" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign activeSource_defaultValue  = ''>
									<#assign activeSource_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeSource" showFormat="SELECTCOMP" defaultValue=activeSource_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeSource_activeSource" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${activeSource_defaultValue}"   name="activeSource" code="womActiveSource" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign activeBatchStateID_name_defaultValue  = ''>
									<#assign activeBatchStateID_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" code="publicSet_1.0_activeAndBatchState_ActBatState_name" showFormat="SELECTCOMP" defaultValue=activeBatchStateID_name_defaultValue  divCode="publicSet_1.0_activeAndBatchState_ActBatState_name_activeBatchStateID_name" isCustomize=true style="" > 
										<input type="hidden" id="activeBatchStateID.id" name="activeBatchStateID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${activeBatchStateID_name_defaultValue!}" reftitle="${getText('publicSet.viewtitle.randon1509430526337')}"  conditionfunc="WOM.produceTask.prodTaskActiExelog.activeExeLogList._querycustomFunc('activeBatchStateID_name')" name="activeBatchStateID.name" id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm_activeBatchStateID_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/publicSet/activeAndBatchState/actBatState/activeBatchStateRef.action"   refViewCode="publicSet_1.0_activeAndBatchState_activeBatchStateRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" searchClick="WOM.produceTask.prodTaskActiExelog.activeExeLogList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" type="adv" onclick="WOM.produceTask.prodTaskActiExelog.activeExeLogList.commonQuery('query')" onadvancedclick="advQuery('WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["MainTableName"]="WOM_PROD_TASK_ACTI_EXELOGS";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.tableNo"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PROD_TASK_ACTI_EXELOGS,TASKID-tableNo";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.id"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PROD_TASK_ACTI_EXELOGS,TASKID-tableNo";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["batchNum"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["batchNum"].dbColumnType="TEXT";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["batchNum"].layRec="batchNum";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["batchNum"].columnName="BATCH_NUM";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.name"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.name"].dbColumnType="TEXT";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.name"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_PROD_TASK_ACTI_EXELOGS,TASK_PROCESSID-name";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.name"].columnName="NAME";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.id"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.id"].dbColumnType="LONG";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.id"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_PROD_TASK_ACTI_EXELOGS,TASK_PROCESSID-name";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["taskProcessID.id"].columnName="ID";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeName"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeName"].dbColumnType="TEXT";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeName"].layRec="activeName";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeName"].columnName="ACTIVE_NAME";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeType"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeType"].dbColumnType="SYSTEMCODE";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeType"].layRec="activeType";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeType"].columnName="ACTIVE_TYPE";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["dataSource"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["dataSource"].dbColumnType="SYSTEMCODE";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["dataSource"].layRec="dataSource";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["dataSource"].columnName="DATA_SOURCE";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeSource"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeSource"].dbColumnType="SYSTEMCODE";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeSource"].layRec="activeSource";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeSource"].columnName="ACTIVE_SOURCE";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.name"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.name"].dbColumnType="TEXT";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.name"].layRec="PUBLICSET_ACT_BAT_STATES,ID,WOM_PROD_TASK_ACTI_EXELOGS,ACTIVE_BATCH_STATEID-name";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.name"].columnName="NAME";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.id"]={};
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.id"].dbColumnType="LONG";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.id"].layRec="PUBLICSET_ACT_BAT_STATES,ID,WOM_PROD_TASK_ACTI_EXELOGS,ACTIVE_BATCH_STATEID-name";
ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["activeBatchStateID.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_adv_queryForm" exportUrl="/WOM/produceTask/prodTaskActiExelog/activeExeLogList-query.action">
							<#assign activeType_defaultValue  = ''>
									<#assign activeType_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeType" showFormat="SELECTCOMP" defaultValue=activeType_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog_activeType_activeType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog" layRec="activeType" columnname="ACTIVE_TYPE" columntype="SYSTEMCODE" name="activeType" fieldType="SELECTCOMP" tableName="WOM_PROD_TASK_ACTI_EXELOGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										活动类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${activeType_defaultValue}"   name="activeType" code="activeType" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_produceTask_activeExeLogList',
			modelCode: 'WOM_7.5.0.0_produceTask_ProdTaskActiExelog',
			modelName: 'ProdTaskActiExelog',
			formId: 'ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm',
			olddiv: 'WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_activeExeLogList'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_activeExeLogList'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery'] #customquContent").html(html);
			 $("[id='WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.produceTask.prodTaskActiExelog.activeExeLogList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.produceTask.prodTaskActiExelog.activeExeLogList.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/prodTaskActiExelog/activeExeLogList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.prodTaskActiExelog.activeExeLogList.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/prodTaskActiExelog/activeExeLogList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query" renderOverEvent="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog" noPermissionKeys="taskID.tableNo,batchNum,taskProcessID.name,activeName,activeType,isPassCheck,finalInspection,dataSource,activeSource,productID.productCode,productID.productName,productNum,planNum,actualNum,checkResult,checkResultID,rejectsDealID,startTime,endTime,isFinish,formularActice.isAnaly,isAnaly,remark" hidekeyPrefix="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.produceTask.prodTaskActiExelog.activeExeLogList.dbClickViewactiveExeLogList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','tableInfoId','activeType.id','dataSource.id','activeSource.id','taskID.id','taskProcessID.id','productID.id','formularActice.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.prodTaskActiExelog.activeExeLogList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExeLogList_makeRejectDeal_modify_WOM_7.5.0.0_produceTask_activeExeLogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1510108131600')}||iconcls:modify||useInMore:false||onclick:
					makeRejectDeal()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_activeExeLogList_BUTTON_makeRejectDeal"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExeLogList_makeRejectDeal_modify_WOM_7.5.0.0_produceTask_activeExeLogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1510108131600')}||iconcls:modify||useInMore:false||onclick:
					makeRejectDeal()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExeLogList_proAnl_add_WOM_7.5.0.0_produceTask_activeExeLogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543546173629')}||iconcls:add||useInMore:false||onclick:
					proAnl()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_activeExeLogList_BUTTON_proAnl"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExeLogList_proAnl_add_WOM_7.5.0.0_produceTask_activeExeLogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543546173629')}||iconcls:add||useInMore:false||onclick:
					proAnl()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExeLogList_refresh_modify_WOM_7.5.0.0_produceTask_activeExeLogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543546197373')}||iconcls:modify||useInMore:false||onclick:
					refresh()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_activeExeLogList_BUTTON_refresh"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExeLogList_refresh_modify_WOM_7.5.0.0_produceTask_activeExeLogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543546197373')}||iconcls:modify||useInMore:false||onclick:
					refresh()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.common.tableNo34354656756333')}" textalign="left"  width=180   type="textfield"    click="function(cell){WOM.produceTask.prodTaskActiExelog.activeExeLogList.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1495778519171')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskProcessID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskProcessID_name_displayDefaultType!}"  key="taskProcessID.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign activeName_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE_NAME"    showFormat="TEXT" defaultDisplay="${activeName_displayDefaultType!}"  key="activeName"   label="${getText('WOM.propertydisplayName.randon1509414632809')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign activeType_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${activeType_displayDefaultType!}"  key="activeType.value"   label="${getText('WOM.propertydisplayName.randon1496885739673')}" textalign="center"  width=80   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign isPassCheck_displayDefaultType  = ''>
			<@datacolumn columnName="IS_PASS_CHECK"    showFormat="SELECT" defaultDisplay="${isPassCheck_displayDefaultType!}"  key="isPassCheck"   label="${getText('WOM.propertydisplayName.randon1509414455675')}" textalign="center"  width=60   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign finalInspection_displayDefaultType  = ''>
			<@datacolumn columnName="FINAL_INSPECTION"    showFormat="SELECT" defaultDisplay="${finalInspection_displayDefaultType!}"  key="finalInspection"   label="${getText('WOM.propertydisplayName.randon1509414528360')}" textalign="center"  width=60   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign dataSource_displayDefaultType  = ''>
			<@datacolumn columnName="DATA_SOURCE"    showFormat="SELECTCOMP" defaultDisplay="${dataSource_displayDefaultType!}"  key="dataSource.value"   label="${getText('WOM.propertydisplayName.randon1495786231888')}" textalign="center"  width=80   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign activeSource_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE_SOURCE"    showFormat="SELECTCOMP" defaultDisplay="${activeSource_displayDefaultType!}"  key="activeSource.value"   label="${getText('WOM.propertydisplayName.randon1509676150205')}" textalign="center"  width=80   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign productID_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productID_productCode_displayDefaultType!}"  key="productID.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productID_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productID_productName_displayDefaultType!}"  key="productID.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NUM"    showFormat="TEXT" defaultDisplay="${productNum_displayDefaultType!}"  key="productNum"   label="${getText('WOM.propertydisplayName.randon1495778711921')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign planNum_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_NUM"    showFormat="TEXT" defaultDisplay="${planNum_displayDefaultType!}"  key="planNum"   label="${getText('WOM.propertydisplayName.randon1495788715231')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign actualNum_displayDefaultType  = ''>
			<@datacolumn columnName="ACTUAL_NUM"    showFormat="TEXT" defaultDisplay="${actualNum_displayDefaultType!}"  key="actualNum"   label="${getText('WOM.propertydisplayName.randon1495788684389')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign checkResult_displayDefaultType  = ''>
			<@datacolumn columnName="CHECK_RESULT"    showFormat="TEXT" defaultDisplay="${checkResult_displayDefaultType!}"  key="checkResult"   label="${getText('WOM.propertydisplayName.randon1509414588866')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign checkResultID_displayDefaultType  = ''>
			<@datacolumn columnName="CHECK_RESULTID"    showFormat="TEXT" defaultDisplay="${checkResultID_displayDefaultType!}"  key="checkResultID"   label="${getText('WOM.propertydisplayName.randon1509592075545')}" textalign="center"  width=80   type="textfield"    showFormatFunc="manu_checkInfo" cssstyle="" />
			<#assign rejectsDealID_displayDefaultType  = ''>
			<@datacolumn columnName="REJECTS_DEALID"    showFormat="TEXT" defaultDisplay="${rejectsDealID_displayDefaultType!}"  key="rejectsDealID"   label="${getText('WOM.propertydisplayName.randon1509592106077')}" textalign="center"  width=80   type="textfield"    showFormatFunc="deal_checkInfo" cssstyle="" />
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD_HMS" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('WOM.propertydisplayName.randon1495778838166')}" textalign="center"  width=120   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD_HMS" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('WOM.propertydisplayName.randon1495852239409')}" textalign="center"  width=120   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign isFinish_displayDefaultType  = ''>
			<@datacolumn columnName="IS_FINISH"    showFormat="SELECT" defaultDisplay="${isFinish_displayDefaultType!}"  key="isFinish"   label="${getText('WOM.propertydisplayName.randon1496885957793')}" textalign="center"  width=80   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign formularActice_isAnaly_displayDefaultType  = ''>
			<@datacolumn columnName="IS_ANALY"    showFormat="CHECKBOX" defaultDisplay="${formularActice_isAnaly_displayDefaultType!}"  key="formularActice.isAnaly"   label="${getText('RM.propertydisplayName.randon1543321671519')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign isAnaly_displayDefaultType  = ''>
			<@datacolumn columnName="IS_ANALY"    showFormat="CHECKBOX" defaultDisplay="${isAnaly_displayDefaultType!}"  key="isAnaly"   label="${getText('WOM.propertydisplayName.randon1543321974645')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1495779312198')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_RenderOverEvent(){
}
function ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_PageInitMethod(){
$.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    success : function(data){
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(1).hide();
            $(".paginatorbar-operatebar a").eq(2).hide();
            $( 'td[key="isAnaly"]').hide();$( 'td[key="formularActice.isAnaly"]').hide();
            ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._columnDefsMaps['formularActice.isAnaly'].hiddenCol = true;
           ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._columnDefsMaps['isAnaly'].hiddenCol = true;
           ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.redrawDT();
        }
    }
});
$("#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-ckst');
$("#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query .paginatorbar-operatebar span:eq(1)").attr('class','buttonbar-button cui-btn-ckst');
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function manu_checkInfo(value,nRow){
      var showdata="";
     if((""+value).length>0 ){
		showdata="查看";
	 }
	  return "<a onclick='checkManuReportRef($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+showdata+"</span></a>";
	};
	function deal_checkInfo(value,nRow){
     var showdata="";
     if((""+value).length>0 ){
		showdata="查看";
	 }
	 return "<a onclick='checkDealReportRef($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+showdata+"</span></a>";
	};
	
	
	
	
	
	
	
</script>